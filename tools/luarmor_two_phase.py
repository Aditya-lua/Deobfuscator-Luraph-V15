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


def loader_time_pin(stub_text):
    """The sandbox clock must track the loader's build timestamp: _bsdata0
    carries a ~now epoch entry that rotates with the loader file. A stale
    time_pin skews the bootstrap's clock vs the server/loader (~hours after a
    container reset) and the session validation rejects -> State848."""
    now = int(time.time())
    m = re.search(r"_bsdata0=\{([^}]*)\}", stub_text)
    if m:
        for n in re.findall(r"\d{9,10}", m.group(1)):
            v = int(n)
            if abs(v - now) < 4 * 86400:
                return v
    return now


def build_serve_process(primed_source, init_text, outdir, time_pin):
    cfg = {
        "readfile_map": {
            "static_content_170926/init-f07dbcbe19a-sephal.lua": init_text,
            # NOTE: no "__lrm_session_response" placeholder here anymore -- the
            # legacy readfile_map plant is superseded by the urls.__lrm_plant
            # list + the in-run live-fetch loop (a placeholder pre-empts it).
        },
        "time_pin": time_pin,
        # the in-run live fetch adds real seconds per protocol round (the
        # budget hook counts wall clock), so raise it accordingly
        "time_budget": 300, "devirt": False, "spin": 60, "trace_globals": True,
        "call_log": True, "call_log_full": True,
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

    time_pin = loader_time_pin(stub_text)
    print("    time_pin: %d (loader build time, now=%d)" % (time_pin, int(time.time())))
    d, hp = build_serve_process(patched, init_text, outdir, time_pin)
    proc = subprocess.Popen([LUAU], cwd=d, stdin=subprocess.PIPE,
                            stdout=subprocess.PIPE, stderr=subprocess.STDOUT)

    print("[2] require + start: driving the live protocol in-run ...")
    proc.stdin.write(b'__S = require("./harness")\n')
    proc.stdin.flush()
    time.sleep(8)                      # let the 2.9 MB harness module compile
    try:                                # drain anything the compile printed
        while select.select([proc.stdout], [], [], 0.5)[0]:
            if not proc.stdout.read1(1 << 20):
                break
    except Exception:
        pass

    import urllib.request

    def drive(stmt, timeout):
        """Send one serve call; read the stream until the run suspends for a
        live fetch (NEEDFETCH <url>), finishes (ENVLOG-END), or times out."""
        proc.stdin.write(stmt.encode() + b"\n")
        proc.stdin.flush()
        buf = b""
        t0 = time.time()
        while True:
            left = timeout - (time.time() - t0)
            if left <= 0:
                return "timeout", buf.decode("latin-1", "replace")
            r, _, _ = select.select([proc.stdout], [], [], min(left, 2))
            if not r:
                continue
            chunk = proc.stdout.read1(1 << 20)
            if not chunk:
                return "dead", buf.decode("latin-1", "replace")
            buf += chunk
            m = re.search(rb"NEEDFETCH (https?://\S+)", buf)
            if m:
                return "fetch", m.group(1).decode()
            if harness.mark("ENVLOG-END").encode() in buf:
                return "end", buf.decode("latin-1", "replace")

    planted = {}

    def plant(url_u, body_u, headers_u):
        # native-table plant: no JSON decoder in the path, any body size
        def esc(s):
            return '"' + s.replace("\\", "\\\\").replace('"', '\\"') \
                .replace("\n", "\\n").replace("\r", "\\r") + '"'
        mod_p = os.path.join(d, "resp_%d.luau" % (len(planted) + 1 + 1000))
        hdr = "{" + ", ".join("[%s] = %s" % (esc(str(k)), esc(str(v)))
                              for k, v in headers_u.items()) + "}"
        with open(mod_p, "w", encoding="latin-1") as f:
            f.write("return { url = %s, body = %s, headers = %s }\n"
                    % (esc(url_u), esc(body_u), hdr))
        okp = None
        for attempt in range(3):    # the REPL can swallow a post-compile stmt
            okp, errp = repl(proc, '__S(require("./resp_%d"), "", "plant")'
                             % (len(planted) + 1 + 1000), 120, expect="PLANT-")
            if okp is not None and "PLANT-OK" in okp:
                break
            print("    (plant retry %d)" % (attempt + 1))
        if okp is None or ("PLANT-OK %d" % len(body_u)) not in okp:
            print("[!] plant failed:", (okp or errp or "")[-300:].strip())
            return False
        print("    ", [l.strip()[-70:] for l in okp.splitlines() if "PLANT-OK" in l])
        planted[url_u] = len(body_u)
        return True

    stmt = '__S("", "", "start")'
    nfetch = 0
    while True:
        mode, data = drive(stmt, 300)
        if mode == "fetch":
            nfetch += 1
            url_u = data
            print("    round %d NEEDFETCH %s" % (nfetch, url_u[-40:]))
            try:
                req2 = urllib.request.Request(url_u, headers={"User-Agent": ROBLOX_UA})
                with urllib.request.urlopen(req2, timeout=30) as r:
                    body_u = r.read().decode("latin-1")
                    headers_u = {k: v for k, v in r.headers.items()}
            except Exception as exc:
                print("[!] live fetch failed: %s" % exc)
                return 1
            kind = classify_response(body_u)
            print("        -> %s (%d bytes)" % (kind, len(body_u)))
            open(os.path.join(outdir, "resp_r%02d_%s.txt" % (nfetch, url_u[-12:])),
                 "w", encoding="latin-1").write(body_u)
            if kind in ("stale-loader", "executor-trap"):
                print("[!] server rejected the handshake: %s" % body_u[:140])
                return 1
            if not plant(url_u, body_u, headers_u):
                return 1
            stmt = '__S("", "", "resume")'
            continue
        break

    text = data if isinstance(data, str) else data.decode("latin-1", "replace")
    open(os.path.join(outdir, "final.raw.txt"), "w", encoding="latin-1").write(text)
    states = sorted(set(re.findall(r"Error: (State\d+)", text)))
    chunks = re.findall(r"loadstring\(\) of (\d+) bytes", text)
    kicked = "LocalPlayer:Kick" in text
    status = re.search(r"-- run status: (.*)", text)
    print("[3] run finished: fetches=%d states=%s loadstrings=%s kicked=%s"
          % (nfetch, states or "-", chunks or "-", kicked))
    if status:
        print("    %s" % status.group(1)[:160])
    urls_all = re.findall(r"--   (https?://\S+)", text)
    print("    urls requested: %d" % len(urls_all))
    print("[+] artifacts in %s" % outdir)
    proc.kill()
    return 0


if __name__ == "__main__":
    sys.exit(main())
