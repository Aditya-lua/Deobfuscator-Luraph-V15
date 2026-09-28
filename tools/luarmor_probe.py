#!/usr/bin/env python3
"""luarmor_probe.py — static analyzer for Luarmor whitelist-client files.

Classifies a Lua/Luau file against the Luarmor client signatures documented in
docs/LUARMOR_NOTES.md (§9), splits loader boilerplate from the visible payload,
and reports session-opaque constant sites (v84[N]) plus IOCs.

Usage:
    python tools/luarmor_probe.py <file.lua> [--json] [--split OUTDIR]

Exit codes: 0 = analyzed, 2 = not a Luarmor client, 1 = usage/IO error.
"""

import argparse
import json
import re
import sys
from pathlib import Path

# --- §9 detection signatures (docs/LUARMOR_NOTES.md) -------------------------
SIG_HOST = re.compile(r"luarmor\.net|Luarmor", re.IGNORECASE)
SIG_RUNTIME = re.compile(r"\bluraph_runtime1\s*\(")
SIG_TUTSTATE = re.compile(r"GetTutorialState\(\s*\"nil\s+nil\s+")
SIG_ENV_MARKER = re.compile(r"getfenv\(\)\s*\[\s*tbl\w+\s*\]\s*=")
SIG_ERRLOG = re.compile(r"writefile\(\s*\"luarmor-error-log\.txt\"")
SIG_AUTH_HOST = re.compile(r"[a-z]{1,3}\d-roblox-auth\.luarmor\.net")
SIG_BOOTSTRAP = re.compile(r"ce_like_loadstring_fn")
SIG_KICK = re.compile(r"Kick\(\s*\"\[Luarmor\]")

ALL_SIGS = [
    ("host_or_name", SIG_HOST),
    ("luraph_runtime1_call", SIG_RUNTIME),
    ("tutorial_state_fingerprint", SIG_TUTSTATE),
    ("table_keyed_env_marker", SIG_ENV_MARKER),
    ("error_log_writefile", SIG_ERRLOG),
    ("auth_host_literal", SIG_AUTH_HOST),
    ("bootstrap_gate", SIG_BOOTSTRAP),
    ("kick_prefix", SIG_KICK),
]

# --- split markers -----------------------------------------------------------
# Payload closure: a large `local a, b, c, ...` declaration block right after
# the auth/challenge stage, followed by luraph_runtime1(...)(); first
# getgenv(). afterwards is safely inside the payload.
PAYLOAD_DECL = re.compile(r"^\s*local ((?:[A-Za-z_]\w*,\s*){8,}[A-Za-z_]\w*)\s*$", re.M)
VM_CALL = re.compile(r"luraph_runtime1\s*\(")
CONST_TABLE = re.compile(r"\bv84\s*\[\s*(\d+)\s*\]")
GETGENV = re.compile(r"getgenv\(\)\s*\.\s*(\w+)")
IOC_WEBHOOK = re.compile(r"https?://[^\s\"']+(?:workers\.dev|discord(?:app)?\.com/api/webhooks|webhook\.site)[^\s\"']*")
IOC_KICKMSG = re.compile(r"Kick\(\s*\"([^\"]{8,120})\"")
AUTH_ROUTE = re.compile(r"/auth/(init|start|heartbeat)")


def line_of(source: str, offset: int) -> int:
    return source.count("\n", 0, offset) + 1


def detect(source: str):
    """Return (hits, confidence). Confidence mirrors detect.js plugin style."""
    hits = [name for name, rx in ALL_SIGS if rx.search(source)]
    n = len(hits)
    if n >= 4:
        conf = 1.0
    elif n >= 2:
        conf = 0.9
    elif n == 1:
        conf = 0.5
    else:
        conf = 0.0
    return hits, conf


def find_payload_start(source: str):
    """Locate the payload closure: last big `local` decl before the VM call,
    or the first getgenv() after the VM call as a fallback marker."""
    vm = VM_CALL.search(source)
    if not vm:
        return None
    best = None
    for m in PAYLOAD_DECL.finditer(source):
        if m.start() < vm.start():
            best = m
        else:
            break
    if best:
        return best.start()
    gg = GETGENV.search(source, vm.end())
    return gg.start() if gg else None


def analyze(path: Path):
    source = path.read_text(encoding="utf-8", errors="replace")
    hits, conf = detect(source)
    report = {
        "file": str(path),
        "bytes": len(source.encode("utf-8", errors="replace")),
        "lines": source.count("\n") + 1,
        "luarmor_client": conf >= 0.9,
        "confidence": conf,
        "signature_hits": hits,
    }
    if conf < 0.9:
        return report

    # loader/payload split
    pstart = find_payload_start(source)
    report["payload_start_line"] = line_of(source, pstart) if pstart is not None else None
    report["loader_lines"] = (report["payload_start_line"] or 1) - 1

    vm = VM_CALL.search(source)
    report["embedded_vm_stage"] = {
        "present": vm is not None,
        "line": line_of(source, vm.start()) if vm else None,
    }
    if vm:
        blob = re.search(r"buffer\.fromstring\(\s*[\"']", source[vm.start():vm.start() + 20000])
        report["embedded_vm_stage"]["constants_blob"] = bool(blob)
        window = source[max(0, vm.start() - 2000):vm.start() + 400]
        report["embedded_vm_stage"]["seed_table_present"] = bool(
            re.search(r"\[\d+\]\s*=\s*\d+", window))

    # opaque constant sites (session-bound, v84[N])
    sites = sorted({int(m.group(1)) for m in CONST_TABLE.finditer(source)})
    report["opaque_constant_sites"] = {"count": len(sites), "indexes": sites[:60]}

    # getgenv inventory (payload config surface)
    report["getgenv_globals"] = sorted({m.group(1) for m in GETGENV.finditer(source)})

    # auth routes observed
    report["auth_routes"] = sorted({m.group(0) for m in AUTH_ROUTE.finditer(source)})

    # IOCs (redacted: keep host, truncate path)
    iocs = []
    for m in IOC_WEBHOOK.finditer(source):
        url = m.group(0)
        host = re.match(r"https?://[^/]+", url)
        iocs.append({"kind": "webhook_url", "host": host.group(0) if host else url, "path_len": len(url)})
    for m in IOC_KICKMSG.finditer(source):
        iocs.append({"kind": "kick_message", "value": m.group(1)[:100]})
    report["iocs"] = iocs

    # heuristic stage table (coarse line ranges)
    stages = {}
    if vm:
        stages["loader_fingerprint_auth"] = [1, line_of(source, vm.start())]
        stages["payload"] = [line_of(source, pstart) if pstart else line_of(source, vm.end()), report["lines"]]
    report["stage_map"] = stages
    return report


def split_payload(path: Path, outdir: Path, report: dict):
    outdir.mkdir(parents=True, exist_ok=True)
    text = path.read_text(encoding="utf-8", errors="replace")
    pl = report.get("payload_start_line")
    if pl:
        lines = text.splitlines(keepends=True)
        (outdir / "loader.lua").write_text("".join(lines[: pl - 1]), encoding="utf-8")
        (outdir / "payload.lua").write_text("".join(lines[pl - 1:]), encoding="utf-8")
        (outdir / "opaque.json").write_text(json.dumps(report.get("opaque_constant_sites", {}), indent=2), encoding="utf-8")
    return outdir


def main(argv=None):
    ap = argparse.ArgumentParser(description="Static Luarmor client probe")
    ap.add_argument("file", type=Path)
    ap.add_argument("--json", action="store_true", help="machine-readable output")
    ap.add_argument("--split", type=Path, default=None, metavar="OUTDIR",
                    help="write loader.lua / payload.lua / opaque.json")
    args = ap.parse_args(argv)
    if not args.file.is_file():
        print(f"error: no such file: {args.file}", file=sys.stderr)
        return 1
    report = analyze(args.file)
    if args.split and report.get("luarmor_client"):
        split_payload(args.file, args.split, report)
        report["split_dir"] = str(args.split)
    if args.json:
        print(json.dumps(report, indent=2))
    else:
        verdict = "LUARMOR CLIENT" if report["luarmor_client"] else "not luarmor"
        print(f"verdict: {verdict} (confidence {report['confidence']:.2f})")
        print(f"file:    {report['file']}  ({report['bytes']} bytes, {report['lines']} lines)")
        print(f"signs:   {', '.join(report['signature_hits']) or '-'}")
        if report["luarmor_client"]:
            ps = report.get("payload_start_line")
            print(f"split:   loader 1..{(ps or 1) - 1}, payload {ps}..{report['lines']}")
            vm = report.get("embedded_vm_stage", {})
            print(f"vm:      embedded Luraph stage @ line {vm.get('line')} (blob={vm.get('constants_blob')}, seeds={vm.get('seed_table_present')})")
            oc = report.get("opaque_constant_sites", {})
            print(f"opaque:  {oc['count']} session-bound v84[...] sites (first: {oc['indexes'][:10]})")
            print(f"globals: {', '.join(report.get('getgenv_globals', [])) or '-'}")
            print(f"auth:    {', '.join(report.get('auth_routes', [])) or '-'}")
            for ioc in report.get("iocs", []):
                if ioc["kind"] == "webhook_url":
                    print(f"ioc:     webhook → {ioc['host']}/… (len {ioc['path_len']})")
                else:
                    print(f"ioc:     kick msg: {ioc['value']}")
        return 0 if report["luarmor_client"] else 2
    return 0


if __name__ == "__main__":
    sys.exit(main())
