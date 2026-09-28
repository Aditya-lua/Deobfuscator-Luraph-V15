#!/usr/bin/env python3
"""Luarmor end-to-end fetcher: loader stub -> init -> sandbox bootstrap ->
auth handshake -> response classification -> client extraction.

The pipeline (docs/LUARMOR_NOTES.md sections 11-14):

  1. The public loadstring stub (api.luarmor.net/files/v4/loaders/<id>.lua)
     is fetched (no gate) and parsed: it carries `_bsdata0` (per-script
     signing blobs, ROTATED by Luarmor -- stale blobs make the auth server
     answer the "loader code outdated" tripwire), the cache folder/module id
     and the CDN init URL.
  2. The sephal init (`v4_init_sephal.lua`, a Luraph v15 chunk itself) comes
     from the CDN (executor-gated; provide a cached copy with --init when the
     gate rejects us) or from --init directly.
  3. The stub-faithful input is assembled and run through the envlog sandbox
     (scripts/run_raw.js): the bootstrap runs its real logic (cache checks,
     fingerprint canary) and BUILDS the auth request -- a, d and the 103-hex
     signature b -- inside the VM.
  4. The handshake is replayed live. A fresh b (never sent before) is
     answered with the session response: a JSON array holding one hex blob
     (the next stage, encrypted -- its cipher lives in the superflow VM).
     A stale loader's b is answered with the "outdated" tripwire text.
  5. The response is fed back into the sandbox as a canned syn.request
     answer (CFG.http_map, wildcard key + CFG.time_pin) so the bootstrap
     processes real server data in-sandbox. NOTE: the response is keyed to
     the one-time nonce inside b; the sandbox must reproduce byte-identical
     b for the decrypt to succeed (CFG.time_pin pins clocks/random/gc, but a
     per-run 24-bit nonce source is still unidentified -- see notes 14).
  6. Any client/script content that comes out is split with
     tools/luarmor_probe.py (loader/payload separation + IOC scan).

Usage:
    python3 tools/luarmor_fetch.py --loader-url https://api.luarmor.net/files/v4/loaders/<id>.lua
    python3 tools/luarmor_fetch.py --loader loader.lua --init init-f07dbcbe19a-sephal.lua
    python3 tools/luarmor_fetch.py --loader loader.lua --report --output out/
"""
import argparse
import json
import os
import re
import subprocess
import sys
import urllib.request

HERE = os.path.dirname(os.path.abspath(__file__))
REPO = os.path.dirname(HERE)
RUN_RAW = os.path.join(REPO, "scripts", "run_raw.js")
PROBE = os.path.join(HERE, "luarmor_probe.py")

ROBLOX_UA = "Roblox/Win32"
OUTDATED_MARK = "loader code is outdated"
EXEC_TRAP_MARK = "executor is not supported"


def http_get(url, timeout=25, ua=ROBLOX_UA):
    req = urllib.request.Request(url, headers={"User-Agent": ua})
    with urllib.request.urlopen(req, timeout=timeout) as r:
        return r.status, r.read().decode("latin-1")


# ---------------------------------------------------------------------------
# stage 1: the loader stub
# ---------------------------------------------------------------------------

def parse_stub(text):
    """The 5-line unobfuscated v4 stub -> {bsdata0_line, module_id, init_url}."""
    m = re.search(r'(_bsdata0=\{.*?\};)', text, re.S)
    if not m:
        raise SystemExit("[!] no _bsdata0 line in the loader stub (is this a Luarmor v4 loader?)")
    bs_line = m.group(1).strip()

    m = re.search(r'"([0-9a-f]+-sephal)"', text)
    module_id = m.group(1) if m else None
    if not module_id:
        m = re.search(r'local f,b,a="[^"]+","([^"]+)"', text)
        module_id = m.group(1) if m else None
    if not module_id:
        raise SystemExit("[!] no module id in the loader stub")

    m = re.search(r'game:HttpGet\("([^"]+)"', text)
    init_url = m.group(1) if m else None

    return {"bsdata0_line": bs_line, "module_id": module_id,
            "init_url": init_url, "stub": text}


def parse_bsdata0(line):
    """The _bsdata0 table literal -> list of ints / byte strings."""
    body = re.search(r"_bsdata0=\{(.*?)\};", line, re.S).group(1)
    parts, cur, inq, esc = [], "", False, False
    for ch in body:
        if inq:
            cur += ch
            if esc:
                esc = False
            elif ch == "\\":
                esc = True
            elif ch == '"':
                inq = False
        elif ch == '"':
            inq = True
            cur += ch
        elif ch == ",":
            parts.append(cur)
            cur = ""
        else:
            cur += ch
    parts.append(cur)

    def unesc(s):
        # Lua escapes: \ddd (1-3 DECIMAL digits), \xHH, \n \t \r \\ \" ...
        out = bytearray()
        j = 0
        s = s[1:-1]
        while j < len(s):
            if s[j] == "\\":
                c = s[j + 1]
                if c == "x":
                    out.append(int(s[j + 2:j + 4], 16))
                    j += 4
                elif c.isdigit():
                    k = j + 1
                    num = ""
                    while k < len(s) and s[k].isdigit() and len(num) < 3:
                        num += s[k]
                        k += 1
                    out.append(int(num) & 0xFF)
                    j = k
                else:
                    mp = {"n": 10, "t": 9, "r": 13, "\\": 92, '"': 34,
                          "a": 7, "b": 8, "f": 12, "v": 11, "'": 39}
                    out.append(mp.get(c, 0))
                    j += 2
            else:
                out.append(ord(s[j]))
                j += 1
        return bytes(out)

    # Lua-style 1-indexed dict: bs[1] is _bsdata0's first entry
    return {i + 1: (unesc(p) if p.strip().startswith('"') else int(p.strip()))
            for i, p in enumerate(parts)}


# ---------------------------------------------------------------------------
# stage 2: the init
# ---------------------------------------------------------------------------

def parse_init(text):
    """The sephal init -> {blob_line, chunk}.

    Layout: a short header comment, then `superflow_bytecode={...}` (the
    9.6 KB encrypted program), then the Luraph v15 VM chunk starting at
    `return setmetatable({`. Everything may sit on one physical line.
    """
    m = re.search(r"(superflow_bytecode=\{.*?\})", text)
    if not m:
        raise SystemExit("[!] no superflow_bytecode table in the init (wrong file?)")
    blob = m.group(1)
    at = m.end()
    rest = text[at:]
    cm = re.search(r"return setmetatable\(\{", rest)
    if not cm:
        raise SystemExit("[!] no VM chunk (`return setmetatable`) after the blob")
    chunk = rest[cm.start():]
    # the chunk's final call passes the module id through `...` at runtime
    # (the stub does loadstring(a)(module_id)); both trailing shapes
    # (`:TK();` and `:TK()(...);`) are rewritten to `:TK()("<id>");`
    chunk = re.sub(r":TK\(\)\s*\([^;]*\)\s*;?\s*$", ':TK()(__MODULE_ID__);', chunk)
    chunk = re.sub(r":TK\(\)\s*;?\s*$", ':TK()(__MODULE_ID__);', chunk)
    if not chunk.rstrip().endswith(';'):
        chunk = chunk.rstrip() + ';'
    return {"blob": blob, "chunk": chunk.rstrip()}


def build_input(stub, init, module_id, script_key, init_text):
    """Stub-faithful primed input: script_key, _bsdata0, blob, ldrupd8m,
    then the VM chunk with the module id passed as its vararg."""
    key = script_key or "A1B2C3D4E5F6A7B8C9D0E1F2A3B4C5D6"
    chunk = init["chunk"].replace('__MODULE_ID__', '"%s"' % module_id)
    return (
        'script_key="%s";\n' % key
        + stub["bsdata0_line"] + "\n"
        + init["blob"] + "\n"
        + "ldrupd8m=[========[" + init_text + "]========];\n"
        + chunk + "\n"
    )


# ---------------------------------------------------------------------------
# stage 3/5: the sandbox
# ---------------------------------------------------------------------------

def run_sandbox(input_path, raw_out, vfs=None, extra_cfg=None):
    """node scripts/run_raw.js <input> <out> [<vpath> <vfile>] [<cfg.json>]"""
    if not os.path.exists(RUN_RAW):
        raise SystemExit("[!] scripts/run_raw.js not found (run from the repo)")
    cmd = ["node", RUN_RAW, input_path, raw_out]
    if vfs:
        cmd += [vfs[0], vfs[1]]
    if extra_cfg:
        cfg_path = input_path + ".cfg.json"
        with open(cfg_path, "w") as f:
            json.dump(extra_cfg, f)
        cmd += [cfg_path]
    r = subprocess.run(cmd, capture_output=True, text=True, timeout=300)
    if not os.path.exists(raw_out):
        sys.stderr.write(r.stderr[-2000:])
        raise SystemExit("[!] sandbox run failed")
    with open(raw_out, encoding="latin-1") as f:
        return f.read()


def extract_handshake(raw):
    """The captured auth request + behaviour markers from a raw trace."""
    out = {"url": None, "a": None, "d": None, "b": None, "urls": [],
           "states": [], "loadstrings": []}
    m = re.search(r'Url = "(https://x\.luarmor\.net[^"]+)"', raw)
    if m:
        out["url"] = m.group(1)
        q = m.group(1)
        for k in ("a", "d", "b"):
            km = re.search(r"[?&]%s=([^&]*)" % k, q)
            if km:
                out[k] = km.group(1)
    out["urls"] = re.findall(r"--   (https?://\S+)", raw)
    out["states"] = sorted(set(re.findall(r"Error: (State\d+)", raw)))
    out["loadstrings"] = re.findall(r"loadstring\(\) of (\d+) bytes", raw)
    out["gui"] = "ScreenGui" in raw
    out["canary"] = "P2D GetLength" in raw
    out["kicked"] = "LocalPlayer:Kick" in raw
    return out


def classify_response(body):
    if OUTDATED_MARK in body:
        return "stale-loader"
    if EXEC_TRAP_MARK in body:
        return "executor-trap"
    body = body.strip()
    if body.startswith('["') and body.endswith('"]') and re.fullmatch(r'["\[\]0-9a-fA-F\s]+', body):
        return "session-response"
    if body.startswith("{") or body.startswith("["):
        return "json"
    return "text"


# ---------------------------------------------------------------------------
# pipeline
# ---------------------------------------------------------------------------

def main():
    ap = argparse.ArgumentParser(description=__doc__.split("\n")[1],
                                 formatter_class=argparse.RawDescriptionHelpFormatter)
    src = ap.add_mutually_exclusive_group(required=True)
    src.add_argument("--loader-url", help="public v4 loader URL (api.luarmor.net/files/v4/loaders/<id>.lua)")
    src.add_argument("--loader", help="a saved loader stub file")
    src.add_argument("--init-only", help="skip the loader entirely: a saved sephal init + --bsdata0 file")
    ap.add_argument("--init", help="the sephal init file (recommended with --loader/--loader-url; "
                                    "the CDN gate serves it only to executor clients)")
    ap.add_argument("--bsdata0", help="loader stub file providing _bsdata0 (with --init-only)")
    ap.add_argument("--client", help="a captured whitelist client file (611KB 'compiled' "
                                    "stage): runs the probe with loader/payload split")
    ap.add_argument("--script-key", help="script_key placeholder value")
    ap.add_argument("--output", default="luarmor_out", help="output directory")
    ap.add_argument("--skip-live", action="store_true", help="do not replay the handshake live")
    ap.add_argument("--report", action="store_true", help="write report.json")
    args = ap.parse_args()

    os.makedirs(args.output, exist_ok=True)
    report = {"stages": {}}

    # -- stage 1: loader -----------------------------------------------------
    if args.loader_url:
        print("[1] fetching the loader stub (public, ungated) ...")
        status, stub_text = http_get(args.loader_url)
        if status != 200 or "_bsdata0" not in stub_text:
            raise SystemExit("[!] loader fetch failed (%s, %d bytes)" % (status, len(stub_text)))
    elif args.loader:
        print("[1] reading the loader stub from %s" % args.loader)
        stub_text = open(args.loader, encoding="latin-1").read()
    else:
        print("[1] --init given without a loader: _bsdata0 must come from --bsdata0")
        stub_text = open(args.bsdata0, encoding="latin-1").read() if args.bsdata0 else None

    if stub_text:
        stub = parse_stub(stub_text)
        bs = parse_bsdata0(stub["bsdata0_line"])
        print("    module id   : %s" % stub["module_id"])
        print("    init url    : %s" % (stub["init_url"] or "(none)"))
        print("    _bsdata0    : %d entries, d-blob %s"
              % (len(bs), ("%d chars" % len(bs[7])) if len(bs) >= 7 and isinstance(bs[7], (str, bytes)) else "-"))
        report["stages"]["loader"] = {"module_id": stub["module_id"],
                                      "init_url": stub["init_url"],
                                      "bsdata0_entries": len(bs)}
    else:
        raise SystemExit("[!] no loader source: give --loader-url/--loader, or --init with --bsdata0")

    # -- stage 2: the init ----------------------------------------------------
    print("[2] obtaining the sephal init ...")
    init_text = None
    if args.init or args.init_only:
        path = args.init or args.init_only
        init_text = open(path, encoding="latin-1").read()
        print("    from file %s (%d bytes)" % (path, len(init_text)))
        init_source = "file"
    elif stub["init_url"]:
        try:
            status, init_text = http_get(stub["init_url"])
            init_source = "cdn"
            kind = ("trap" if EXEC_TRAP_MARK in init_text else
                    "html" if init_text.lstrip().startswith("<") else
                    "init" if len(init_text) > 100000 else "other")
            print("    CDN answered %s (%d bytes, %s)" % (status, len(init_text), kind))
            if kind != "init":
                print("    [!] the CDN gate serves the real init only to executor "
                      "clients; save one from an executor cache "
                      "(static_content_170926/init-%s.lua) and pass --init" % stub["module_id"])
                init_text = None
        except Exception as e:
            print("    CDN fetch failed: %s" % e)
    if init_text is None:
        raise SystemExit("[!] no init available")
    report["stages"]["init"] = {"source": init_source, "bytes": len(init_text)}
    init = parse_init(init_text)
    print("    blob %d bytes, chunk %d bytes" % (len(init["blob"]), len(init["chunk"])))

    # -- stage 3: sandbox bootstrap -------------------------------------------
    print("[3] running the bootstrap in the sandbox (builds the auth request) ...")
    input_path = os.path.join(args.output, "sephal_primed.lua")
    with open(input_path, "w", encoding="latin-1") as f:
        f.write(build_input(stub, init, stub["module_id"], args.script_key, init_text))
    init_path = args.init or args.init_only
    vfs = ("static_content_170926/init-%s.lua" % stub["module_id"],
           os.path.abspath(init_path) if init_path else None)
    if vfs[1] is None:
        # serve the init from the CDN attempt (if any) so cache checks pass
        cache = os.path.join(args.output, "init_cached.lua")
        with open(cache, "w", encoding="latin-1") as f:
            f.write(init_text)
        vfs = (vfs[0], cache)
    raw1 = run_sandbox(input_path, os.path.join(args.output, "bootstrap.raw.txt"), vfs=vfs)
    hs = extract_handshake(raw1)
    print("    GUI: %s  canary: %s  states: %s" % (hs["gui"], hs["canary"], hs["states"] or "-"))
    if hs["url"]:
        print("    auth request captured: a=%s.. d=%s..(%d) b=%s..(%d)"
              % (hs["a"][:6], hs["d"][:8], len(hs["d"]), hs["b"][:8], len(hs["b"])))
    else:
        print("    [!] no auth request captured; see %s" % os.path.join(args.output, "bootstrap.raw.txt"))
    report["stages"]["bootstrap"] = {k: v for k, v in hs.items() if k != "url"}
    report["stages"]["bootstrap"]["url"] = hs["url"]

    if not hs["url"] or args.skip_live:
        print("[4] handshake replay skipped")
    else:
        # -- stage 4: live handshake ------------------------------------------
        print("[4] replaying the handshake live (the b signature is one-time) ...")
        try:
            status, body = http_get(hs["url"])
        except Exception as e:
            print("    [!] request failed: %s" % e)
            body = ""
        kind = classify_response(body)
        print("    server: %s (%d bytes) -> %s" % (status, len(body), kind))
        report["stages"]["handshake"] = {"status": status, "kind": kind, "bytes": len(body)}
        if kind == "stale-loader":
            print("    [!] the loader's _bsdata0 blobs are STALE: re-fetch the loadstring "
                  "(the loader file rotates; blobs are per-rotation signing data)")
        elif kind == "session-response":
            print("    [+] SESSION ACCEPTED -- the sandbox-built signature is valid")
            with open(os.path.join(args.output, "handshake_response.bin"), "w") as f:
                json.dump(body, f)

            # -- stage 5: canned replay ------------------------------------
            print("[5] canned replay: feeding the response back into the sandbox ...")
            pfx = hs["url"].split("&b=")[0] + "&b=*"
            cfg = {"real_json": True,
                   "http_map": {pfx: {"status": status, "body": body}},
                   "time_pin": 1790607955}
            raw2 = run_sandbox(input_path, os.path.join(args.output, "replay.raw.txt"),
                               vfs=vfs, extra_cfg=cfg)
            hs2 = extract_handshake(raw2)
            decrypted = "JSONDecode" in raw2 and "attempt to perform arithmetic" not in raw2 \
                and "got nil" not in raw2
            print("    states after replay: %s" % (hs2["states"] or "-"))
            print("    decrypt: %s" % ("progressed" if decrypted else
                  "blocked -- the response is keyed to b's one-time nonce; the sandbox "
                  "must reproduce byte-identical b (see notes 14)"))
            report["stages"]["replay"] = {"states": hs2["states"], "decrypted": decrypted}
        elif kind == "executor-trap":
            print("    [!] the auth host flagged the client (executor fingerprinting)")

    # -- stage 6: client/payload analysis ---------------------------------
    print("[6] client/payload analysis (probe) ...")
    target = args.client or init_path
    if target:
        r = subprocess.run(["python3", PROBE, "--json", target], capture_output=True, text=True)
        try:
            pj = json.loads(r.stdout)
            print("    %s: confidence %.2f" % (pj.get("kind", "?"), pj.get("confidence", 0)))
            report["stages"]["probe"] = pj
            if args.client:
                split_dir = os.path.join(args.output, "split")
                r2 = subprocess.run(["python3", PROBE, "--split", split_dir, target],
                                    capture_output=True, text=True)
                if r2.returncode == 0:
                    print("    split -> %s (loader.lua / payload.lua / opaque.json)" % split_dir)
        except Exception:
            print(r.stdout[:800] or r.stderr[:400])
    else:
        print("    no client file (--client) -- skipping")
    report_file = os.path.join(args.output, "report.json") if args.report else None
    if report_file:
        with open(report_file, "w") as f:
            json.dump(report, f, indent=1)
        print("[+] report: %s" % report_file)
    print("[+] artifacts in %s/" % args.output)


if __name__ == "__main__":
    main()
