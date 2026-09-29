#!/usr/bin/env python3
"""Lift the FlowAuth payload protos -> Luau text."""
import os
import sys
import time

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)
sys.path.insert(0, os.path.join(ROOT, "core"))

from obfuscators.luraph_v15 import devirt  # noqa: E402

SRC = os.path.join(ROOT, "flowauth_crack", "work", "payload_devirt.lua")
DUMP = os.path.join(ROOT, "flowauth_capture", "capture_protos.json.gz")
OUT = os.path.join(ROOT, "flowauth_capture", "payload_lift.lua")

t0 = time.time()
text, stats, requests, patches = devirt.lift_program(SRC, DUMP)
with open(OUT, "w", encoding="utf-8") as f:
    f.write(text)
print("lift done %.1fs -> %s (%d bytes)" % (time.time() - t0, OUT, len(text)))
print("stats:", stats)
print("constant requests:", len(requests))
print("patches:", (patches or "")[:200])
