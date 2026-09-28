#!/usr/bin/env python3
"""Full live FlowAuth chain, fast, in one process:

  1. fetch a FRESH loader from flowauth.net (session material inside;
     loaders are regenerated per fetch - stale handoffs get rejected)
  2. patch the envlog sandbox with its handoff (patch_envlog.py)
  3. run the bootstrapper in the sandbox; HTTP hops the runtime makes are
     leaked into the trace (\\x01SUPERZREQ\\x01 marker + superz.leak/...
     HttpGet probe) and answered LIVE by this driver; responses are fed
     back as canned responses for the next hop
  4. repeat until no new hops; extract any loadstring'd chunks (payload)

Usage:
    python3 flowauth_chain.py [max_hops] [--repo PATH] [--boot bootstrapper.lua]
                              [--loader-url URL] [--workdir PATH]

Defaults: --repo is the repo root (parent of this script's directory),
--boot work/bootstrapper.lua, --workdir work/ next to this script.
"""
import argparse
import base64
import json
import os
import re
import subprocess
import sys
import time
import urllib.error
import urllib.request

HERE = os.path.dirname(os.path.abspath(__file__))
DEFAULT_REPO = os.path.dirname(HERE)

parser = argparse.ArgumentParser(description="Automated live FlowAuth chain")
parser.add_argument("max_hops", nargs="?", type=int, default=8)
parser.add_argument("--repo", default=DEFAULT_REPO)
parser.add_argument("--boot", default=os.path.join(HERE, "work", "bootstrapper.lua"))
parser.add_argument("--loader-url",
                    default="https://flowauth.net/v1/loaders/77501b3d13125c45bb154f658e34e4cc.lua")
parser.add_argument("--workdir", default=os.path.join(HERE, "work"))
args = parser.parse_args()

REPO = os.path.abspath(args.repo)
BASE = os.path.abspath(args.workdir)
LOADER_URL = args.loader_url
BOOT_PATH = os.path.abspath(args.boot)
CANNED_PATH = os.path.join(BASE, "canned.json")
LOADER_LIVE = os.path.join(BASE, "loader.lua")
CHUNK_DIR = os.path.join(BASE, "chunks")
MAX_HOPS = args.max_hops
PATCH = os.path.join(HERE, "patch_envlog.py")

for path, what in ((BOOT_PATH, "bootstrapper"), (REPO, "repo")):
    if not os.path.exists(path):
        sys.exit(f"{what} not found: {path}")

BOOT = open(BOOT_PATH, encoding="latin1").read()
HDRS = {"Content-Type": "application/json", "Accept": "application/json",
        "X-FlowAuth-Protocol": "3", "User-Agent": "Roblox/Win32"}
B64RE = re.compile(r"\x01SUPERZREQ\x01([A-Za-z0-9+/=]+)")
LEAKURL_RE = re.compile(r"superz\.leak/([A-Za-z0-9+/=]+)")

sys.path.insert(0, os.path.join(REPO, "core"))
import harness  # noqa: E402


def http(method, url, body=None):
    req = urllib.request.Request(url, data=body.encode("latin1") if body else None, method=method)
    for k, v in HDRS.items():
        req.add_header(k, v)
    try:
        with urllib.request.urlopen(req, timeout=25) as r:
            return r.status, r.read().decode("latin1")
    except urllib.error.HTTPError as e:
        return e.code, e.read().decode("latin1")


def patch():
    r = subprocess.run([sys.executable, PATCH, "--repo", REPO,
                        "--loader", LOADER_LIVE, "--canned", CANNED_PATH],
                       capture_output=True, text=True)
    if r.returncode != 0:
        print(r.stdout, r.stderr)
        sys.exit("patch failed")


def run_sandbox():
    scratch = os.path.join(BASE, "h_live.luau")
    body, err = harness.run_once(
        harness.find_luau(), BOOT,
        {"time_budget": 120, "executor": "Wave", "devirt": False},
        scratch, 240, True)
    return harness.LAST_RAW[0], body, err


def decode_leak(b64):
    pad = "=" * (-len(b64) % 4)
    return base64.b64decode(b64 + pad).decode("latin1").split("|", 2)


t0 = time.time()
os.makedirs(BASE, exist_ok=True)
os.makedirs(CHUNK_DIR, exist_ok=True)

print("[1] fetching fresh loader ...")
status, loader = http("GET", LOADER_URL)
if status != 200:
    sys.exit(f"loader fetch failed: {status}")
open(LOADER_LIVE, "w", encoding="latin1").write(loader)
print(f"    loader {len(loader)}B at t+{time.time()-t0:.1f}s")

json.dump({}, open(CANNED_PATH, "w"))
canned = {}
seen_requests = set()
final_raw = final_body = final_err = None

for hop in range(MAX_HOPS):
    patch()
    raw, body, err = run_sandbox()
    final_raw, final_body, final_err = raw, body, err

    leaks = B64RE.findall(raw) + LEAKURL_RE.findall(raw)
    new = []
    for lk in leaks:
        try:
            m, u, b = decode_leak(lk)
        except Exception:
            continue
        if not u.startswith("http"):
            continue  # proxy-junk probe call
        key = m + " " + u
        if key in seen_requests:
            continue
        seen_requests.add(key)
        new.append((m, u, b))
    if not new:
        print(f"[hop {hop}] no new requests at t+{time.time()-t0:.1f}s")
        print("run err:", (err or "(none)")[:200])
        break

    for m, u, b in new:
        print(f"[hop {hop}] {m} {u} ({len(b)}B) at t+{time.time()-t0:.1f}s")
        print("    body:", b[:200])
        status, resp = http(m, u, b if m == "POST" else None)
        print(f"    -> {status} ({len(resp)}B): {resp[:160]}")
        canned[m + " " + u] = {"status": status, "body": resp}
        json.dump(canned, open(CANNED_PATH, "w"))
else:
    print("hop limit reached")

# extract any loadstring'd chunks (the payload)
if final_body:
    chunks, _ = harness.take_chunks(final_body)
    if chunks:
        print(f"=== {len(chunks)} loadstring'd chunk(s) captured ===")
        for key, src in chunks:
            out = os.path.join(CHUNK_DIR, f"chunk_{key}.luau")
            open(out, "w", encoding="latin1").write(src)
            print(f"    {out} ({len(src)}B) head: {src[:120]!r}")
    else:
        print("no chunks captured")

print("=== FINAL RUN err:", (final_err or "(none)")[:300])
if final_raw:
    print("\n".join(final_raw.splitlines()[-18:])[:2500])
