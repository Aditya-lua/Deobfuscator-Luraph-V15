#!/usr/bin/env python3
"""In-process FlowAuth chain -- one luau process for the WHOLE session:

  start -> the runtime leaks every HTTP hop (\\1SUPERZREQ\\1 marker:
  base64 "method|url|body") and SUSPENDS the run (__LRMRES yield);
  this driver answers the hop LIVE (with the FlowAuth headers the
  previous hop-by-hop chain proved out), plants the response via serve
  mode "plant" and resumes the exact thread. Same process = same session
  nonce, so the payload response authentication (payload_proof over the
  session's own challenge/proof material) holds -- cross-run replay
  could never work (observed: "payload response authentication failed").

When the run finishes, every loadstring'd chunk (the Luraph-protected
payload) is captured from the CHUNK dump.

Usage: python3 flowauth_two_phase.py [max_hops]
"""
import base64
import os
import re
import select
import subprocess
import sys
import tempfile
import time
import urllib.error
import urllib.request

HERE = os.path.dirname(os.path.abspath(__file__))
REPO = os.path.dirname(HERE)
sys.path.insert(0, os.path.join(REPO, "core"))
import harness  # noqa: E402

LUAU = os.path.join(REPO, "bin", "luau")
BOOT = os.path.join(HERE, "work", "bootstrapper.lua")
WORK = os.path.join(HERE, "work")
HDRS = {"Content-Type": "application/json", "Accept": "application/json",
        "X-FlowAuth-Protocol": "3", "User-Agent": "Roblox/Win32"}
B64RE = re.compile("\x01SUPERZREQ\x01([A-Za-z0-9+/=]+)")


def http(method, url, body=None):
    req = urllib.request.Request(url, data=body.encode("latin1") if body else None, method=method)
    for k, v in HDRS.items():
        req.add_header(k, v)
    try:
        with urllib.request.urlopen(req, timeout=30) as r:
            return r.status, r.read().decode("latin1"), dict(r.headers)
    except urllib.error.HTTPError as e:
        return e.code, e.read().decode("latin1"), dict(e.headers)


LOADER_URL = "https://flowauth.net/v1/loaders/29f4f4b924aff467652814456286bb05.lua"


def refresh_loader():
    """Fetch a FRESH loader (its _bsdata0 launch_ticket is single-use: the
    server rejects a replayed challenge with 401 launch_ticket_rejected) and
    re-patch envlog.luau with its handoff + an empty canned map."""
    open(os.path.join(WORK, "canned.json"), "w").write("{}")
    status, loader, _ = http("GET", LOADER_URL)
    if status != 200:
        sys.exit("fresh loader fetch failed: %d" % status)
    loader_p = os.path.join(WORK, "loader.lua")
    open(loader_p, "w", encoding="latin1").write(loader)
    print("[0] fresh loader: %d B (handoff ticket refreshed)" % len(loader))
    r = subprocess.run([sys.executable, os.path.join(HERE, "patch_envlog.py"),
                        "--repo", REPO, "--loader", loader_p,
                        "--canned", os.path.join(WORK, "canned.json")],
                       capture_output=True, text=True)
    if r.returncode != 0:
        sys.exit("patch failed: " + r.stdout + r.stderr)
    print("    " + r.stdout.strip().replace("\n", "\n    "))


def main():
    max_hops = int(sys.argv[1]) if len(sys.argv) > 1 else 24
    refresh_loader()
    boot = open(BOOT, encoding="latin1").read()
    cfg = {
        "time_budget": 900, "executor": "Wave", "devirt": False,
        "spin": 60, "trace_globals": True, "serve": True,
    }
    d = tempfile.mkdtemp(prefix="fa2p_")
    hp = os.path.join(d, "harness.luau")
    src = harness.build_harness(boot, cfg, None)
    with open(hp, "w", encoding="latin-1", newline="\n") as f:
        f.write(src)
    print("[1] harness built (%.1f MB), bootstrapper %d B" % (len(src) / 1e6, len(boot)))

    proc = subprocess.Popen([LUAU], cwd=d, stdin=subprocess.PIPE,
                            stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
    proc.stdin.write(b'__S = require("./harness")\n')
    proc.stdin.flush()
    time.sleep(10)                      # the ~3 MB harness module needs to compile
    try:
        while select.select([proc.stdout], [], [], 0.5)[0]:
            if not proc.stdout.read1(1 << 20):
                break
    except Exception:
        pass

    def repl(stmt, timeout=90, expect=None):
        proc.stdin.write(stmt.encode() + b"\n")
        proc.stdin.flush()
        end = (expect or harness.mark("ENVLOG-END")).encode()
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
        if expect is not None:
            return text, None
        return text, None

    def drive(stmt, timeout):
        """Send one serve call; read the stream until the run suspends for a
        live hop (SUPERZREQ leak), finishes (ENVLOG-END), or times out."""
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
            text = buf.decode("latin-1", "replace")
            if B64RE.search(text):
                return "fetch", text
            if harness.mark("ENVLOG-END").encode() in buf:
                return "end", text

    planted = []

    def plant(url_u, body_u, headers_u, reqbody_u=None):
        # native-table plant via a require()d module (any size, no decoder);
        # reqbody pins the entry to the exact request body (the FlowAuth
        # payload endpoint reuses one URL for chunks 1/2)
        def esc(s):
            return '"' + s.replace("\\", "\\\\").replace('"', '\\"') \
                .replace("\n", "\\n").replace("\r", "\\r") + '"'
        idx = len(planted) + 1001
        mod_p = os.path.join(d, "resp_%d.luau" % idx)
        hdr = "{" + ", ".join("[%s] = %s" % (esc(str(k)), esc(str(v)))
                              for k, v in list(headers_u.items())[:12]) + "}"
        rb = (esc(reqbody_u) + ", ") if reqbody_u is not None else "nil, "
        with open(mod_p, "w", encoding="latin-1") as f:
            f.write("return { url = %s, reqbody = %sbody = %s, headers = %s }\n"
                    % (esc(url_u), rb, esc(body_u), hdr))
        okp = None
        for attempt in range(3):
            okp, errp = repl('__S(require("./resp_%d"), "", "plant")' % idx,
                             120, expect="PLANT-")
            if okp is not None and "PLANT-OK" in okp:
                break
            print("    (plant retry %d)" % (attempt + 1))
        if okp is None or "PLANT-OK" not in okp:
            print("[!] plant failed:", (okp or errp or "")[-300:].strip())
            return False
        print("    planted as entry", idx - 1000)
        planted.append(url_u)
        return True

    mode, data = drive('__S("", "", "start")', 900)
    n = 0
    while mode == "fetch" and n < max_hops:
        n += 1
        for optleak in re.findall("\x01SUPERZREQOPTS\x01([A-Za-z0-9+/=]+)", data):
            try:
                print("        [opts-diag] " + base64.b64decode(
                    optleak + "=" * (-len(optleak) % 4)).decode("latin1", "replace")[:300])
            except Exception:
                pass
        leaks = B64RE.findall(data)
        lk = leaks[-1]
        try:
            meth, u, b = base64.b64decode(lk + "=" * (-len(lk) % 4)).decode("latin1").split("|", 2)
        except Exception as e:
            print("[!] leak decode failed:", e)
            break
        print("[hop %d] %s %s (%d B)" % (n, meth, u[:100], len(b)))
        if not u.startswith("http"):
            print("[!] non-HTTP request leaked (see opts-diag above); stopping")
            open(os.path.join(WORK, "proxy_leak.txt"), "w", encoding="latin1").write(data[-20000:])
            break
        if b:
            print("        body: %s" % b[:160])
        status, resp, hdrs = http(meth, u, b if meth == "POST" else None)
        print("        -> %d (%d B): %s" % (status, len(resp), resp[:130]))
        open(os.path.join(WORK, "hop_%02d_resp.txt" % n), "w", encoding="latin1").write(resp)
        if status != 200:
            print("[!] server rejected the hop; stopping")
            break
        if not plant(u, resp, hdrs, reqbody_u=(b if b else None)):
            break
        mode, data = drive('__S("", "", "resume")', 900)

    print("[2] loop finished after %d hop(s): mode=%s" % (n, mode))
    open(os.path.join(WORK, "two_phase_full.txt"), "w", encoding="latin1").write(data)
    st = re.search(r"-- run status: (.*)", data)
    print("    run status: %s" % (st.group(1)[:200] if st else "?"))
    for ln in [l for l in data.splitlines() if "loadstring() of" in l][:8]:
        print("    %s" % ln.strip()[:150])
    if mode not in ("end",):
        print("    tail: %s" % "\n".join(data.splitlines()[-12:])[:2000])
    body_m = re.search(re.escape(harness.mark("ENVLOG-BEGIN")) + r"\n(.*?)" +
                       re.escape(harness.mark("ENVLOG-END")), data, re.S)
    chunks = []
    if body_m:
        chunks, _ = harness.take_chunks(body_m.group(1))
    os.makedirs(os.path.join(WORK, "chunks"), exist_ok=True)
    for key, src_c in chunks:
        out = os.path.join(WORK, "chunks", "chunk_%s.luau" % key.replace("/", "_"))
        open(out, "w", encoding="latin1").write(src_c)
        print("[+] chunk %s -> %s (%d B)" % (key[:24], out, len(src_c)))
    if not chunks:
        print("    (no chunks captured)")
        print("\n".join(data.splitlines()[-25:])[:3000])
    proc.kill()
    return 0 if chunks else 1


if __name__ == "__main__":
    sys.exit(main())
