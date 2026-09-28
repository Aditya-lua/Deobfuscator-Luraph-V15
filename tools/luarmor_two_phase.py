#!/usr/bin/env python3
"""Two-phase same-process Luarmor fetch:

Phase 1 (serve "start"): the sandbox bootstrap builds the auth handshake
(a, d and the 103-hex signature b). b's per-process nonce is STABLE within
one luau process, so the same b can be replayed...

  live, from python: the server answers the session response (encrypted,
  keyed to that nonce);

...and the response is injected into the SAME process as a canned http_map
(serve "http" mode). Phase 2 (another "start") recomputes the identical b,
hits the canned answer, JSON-decodes and DECRYPTS the response in-sandbox
-- the decrypted next stage (client fetch, loadstring'd chunks) shows up in
the phase-2 trace.

Usage: python3 luarmor_two_phase.py <loader.lua> <init.lua> [outdir]
"""
import json
import os
import re
import select
import subprocess
import sys
import tempfile
import time
import urllib.request

sys.path.insert(0, "/home/z/my-project/Deobfuscator-Luraph-V15/core")
sys.path.insert(0, "/home/z/my-project/Deobfuscator-Luraph-V15/tools")
import harness  # noqa: E402
from luarmor_fetch import parse_stub, parse_init, build_input, http_get, classify_response, ROBLOX_UA  # noqa: E402


REPO = "/home/z/my-project/Deobfuscator-Luraph-V15"
LUAU = os.path.join(REPO, "bin", "luau")


def build_serve_process(primed_source, init_text, outdir):
    cfg = {
        "readfile_map": {
            "static_content_170926/init-f07dbcbe19a-sephal.lua": init_text,
            # planted at build time: present in the bootstrap's phase-1 state
            # snapshot, so the anti-tamper key-diff restore keeps the key (and
            # its CURRENT value once the real body is passed in with phase 2)
            "__lrm_session_response": "PENDING",
        },
        "time_pin": 1790607955,
        "time_budget": 120, "devirt": False, "spin": 60, "trace_globals": True,
        "serve": True,
    }
    d = tempfile.mkdtemp(prefix="lrm2p_", dir=outdir)
    src = harness.build_harness(primed_source, cfg, None)
    hp = os.path.join(d, "harness.luau")
    with open(hp, "w", encoding="latin-1", newline="\n") as f:
        f.write(src)
    return d, hp


RAW = [""]


def repl(proc, stmt, timeout=60, expect=None):
    """One REPL statement; returns text from the reply (default: the
    BEGIN..END span). select-based so a silent process can't block."""
    proc.stdin.write(stmt.encode() + b"\n")
    proc.stdin.flush()
    end = (expect or harness.mark("ENVLOG-END")).encode()
    beg = harness.mark("ENVLOG-BEGIN").encode()
    buf = b""
    t0 = time.time()
    while end not in buf:
        left = timeout - (time.time() - t0)
        if left <= 0:
            return None, buf.decode("latin-1", "replace")[-2000:]
        r, _, _ = select.select([proc.stdout], [], [], min(left, 5))
        if not r:
            continue
        chunk = proc.stdout.read1(1 << 20)
        if not chunk:
            return None, "process exited: " + buf.decode("latin-1", "replace")[-2000:]
        buf += chunk
    text = buf.decode("latin-1", "replace")
    RAW[0] = text
    b = text.find(beg.decode("latin-1"))
    e = text.find(end.decode("latin-1"))
    if expect is not None:
        return text, None
    return text[b:e + len(end)] if b >= 0 and e > b else text, None


def extract_url(trace):
    m = re.search(r'Url = "(https://x\.luarmor\.net[^"]*)"', trace)
    if m:
        return m.group(1)
    m = re.search(r'--\s+(https://x\.luarmor\.net\S+)', trace)
    return m.group(1) if m else None


def main():
    loader_path, init_path = sys.argv[1], sys.argv[2]
    outdir = sys.argv[3] if len(sys.argv) > 3 else "/tmp/lrm_2phase"
    script_key = os.environ.get("LRM_SCRIPT_KEY")
    os.makedirs(outdir, exist_ok=True)

    if loader_path.startswith("http"):
        print("[0] fetching a fresh loader (blobs rotate ~hourly) ...")
        status, stub_text = http_get(loader_path)
        assert status == 200 and "_bsdata0" in stub_text, "loader fetch failed"
        loader_path = os.path.join(outdir, "fresh_loader.lua")
        with open(loader_path, "w", encoding="latin-1") as f:
            f.write(stub_text)
    stub_text = open(loader_path, encoding="latin-1").read()
    stub = parse_stub(stub_text)
    init_text = open(init_path, encoding="latin-1").read()
    init = parse_init(init_text)
    print("[1] loader: module id %s, %d _bsdata0 entries" % (stub["module_id"], stub["bsdata0_line"].count(",")))

    primed = build_input(stub, init, stub["module_id"], script_key, init_text)
    if not script_key:
        print("    [i] no LRM_SCRIPT_KEY set: the session decrypt will fail by "
              "design (the server keys the response to the real script key)")
    pp = os.path.join(outdir, "primed.lua")
    with open(pp, "w", encoding="latin-1") as f:
        f.write(primed)

    # the driver always runs the vmmap-patched source (entry tags + spin
    # rewrite); an unpatched source never reaches the handshake in serve mode
    pr = subprocess.run(["node", os.path.join(REPO, "scripts", "patch_primed.js"), pp],
                        capture_output=True, text=True, timeout=120)
    if pr.returncode != 0:
        print("[!] patch failed:", pr.stderr[-300:])
        return 1
    patched = open(pp + ".patched.lua", encoding="latin-1").read()

    d, hp = build_serve_process(patched, init_text, outdir)
    proc = subprocess.Popen([LUAU], cwd=d, stdin=subprocess.PIPE,
                            stdout=subprocess.PIPE, stderr=subprocess.STDOUT)

    print("[2] phase 1: building the handshake in-sandbox ...")
    proc.stdin.write(b'__S = require("./harness")\n')
    proc.stdin.flush()
    time.sleep(8)                      # let the 2.9 MB harness module compile
    try:                                # drain anything the compile printed
        while select.select([proc.stdout], [], [], 0.5)[0]:
            if not proc.stdout.read1(1 << 20):
                break
    except Exception:
        pass
    # the REPL occasionally swallows a statement sent right after the compile;
    # starts are idempotent (b is process-stable), so just re-send on silence
    t1, err = None, None
    for attempt in range(3):
        t1, err = repl(proc, '__S("", "", "start")', 120)
        if t1 is not None and extract_url(t1):
            break
        print("    (retry %d: no reply/URL)" % (attempt + 1))
    if t1 is None or not extract_url(t1):
        print("[!] phase 1 failed:", repr((err or "")[-400:]))
        return 1
    open(os.path.join(outdir, "phase1.raw.txt"), "w", encoding="latin-1").write(t1)
    url = extract_url(t1)
    if not url:
        print("[!] no handshake captured in phase 1")
        return 1
    print("    %s" % url[:110])

    print("[3] live handshake replay ...")
    import urllib.request
    req = urllib.request.Request(url, headers={"User-Agent": ROBLOX_UA})
    with urllib.request.urlopen(req, timeout=25) as r:
        body = r.read().decode("latin-1")
        resp_headers = {k: v for k, v in r.headers.items()}
    status = 200
    kind = classify_response(body)
    print("    HTTP %s, %s (%d bytes)" % (status, kind, len(body)))
    open(os.path.join(outdir, "live_response.txt"), "w", encoding="latin-1").write(body)
    if kind != "session-response":
        print("[!] server answered: %s" % body[:160])
        return 1

    print("[4] injecting the response into the same process (http mode) ...")
    # a trailing-* key prefix-matches in envlog; it also sidesteps the pure-Luau
    # JSON decoder mangling 570+ char keys (observed: 571 -> 567 chars)
    wc = url.split("?")[0] + "*"
    http_map = json.dumps({wc: {"status": 200, "body": body}})
    nreq = 1
    mod = os.path.join(d, "resp_%d.luau" % nreq)
    with open(mod, "w", encoding="latin-1") as f:
        f.write("return %s\n" % harness.long_string(http_map))
    t2, err = repl(proc, '__S(require("./resp_%d"), "", "http")' % nreq, 60, expect="HTTPMAP ")
    open(os.path.join(outdir, "inject.raw.txt"), "w", encoding="latin-1").write(t2 or "")
    if t2 is None or "HTTPMAP true" not in t2 or "keys=0" in t2:
        print("[!] http map injection failed:", (t2 or err or "")[-400:].strip())
        return 1
    print("    injected ok:", [l.strip()[:120] for l in t2.splitlines() if "HTTPMAP" in l or "READBACK" in l])

    print("[5] phase 2: same process replays the handshake and decrypts ...")
    nreq += 1
    mod = os.path.join(d, "resp_%d.luau" % nreq)
    # quoted+escaped string: the runtime require rejects long-bracket modules
    # that luau-ast accepts (observed: "Expected <eof>, got ']'")
    payload = json.dumps({"body": body, "headers": resp_headers})
    lit = '"' + payload.replace("\\", "\\\\").replace('"', '\\"') + '"'
    with open(mod, "w", encoding="latin-1") as f:
        f.write("return %s\n" % lit)
    t3, err = repl(proc, '__S(require("./resp_%d"), "", "start")' % nreq, 240)
    if t3 is None:
        print("[!] phase 2 failed:", (err or "")[-400:])
        return 1
    open(os.path.join(outdir, "phase2.raw.txt"), "w", encoding="latin-1").write(t3)
    open(os.path.join(outdir, "phase2.full.txt"), "w", encoding="latin-1").write(RAW[0])
    urls = re.findall(r"--   (https?://\S+)", t3)
    states = sorted(set(re.findall(r"Error: (State\d+)", t3)))
    chunks = re.findall(r"loadstring\(\) of (\d+) bytes", t3)
    kicked = "LocalPlayer:Kick" in t3
    print("    states: %s | urls found: %s | loadstrings: %s | kicked: %s"
          % (states or "-", sorted(set(urls))[:4] or "-", chunks or "-", kicked))
    print("[+] artifacts in %s" % outdir)
    proc.kill()
    return 0


if __name__ == "__main__":
    sys.exit(main())
