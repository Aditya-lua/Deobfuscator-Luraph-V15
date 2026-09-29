#!/usr/bin/env python3
"""Generate work/bootstrapper.lua: embed the FlowAuth runtime source and run
it exactly like `loadstring(game:HttpGet(...))()` would (credential = nil).
The _bsdata0 handoff is preseeded by patch_envlog.py, so the loader itself
never needs to run (its game:HttpGet transport returns a proxy in-sandbox).
"""
import os
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
REPO = os.path.dirname(HERE)
sys.path.insert(0, os.path.join(REPO, "core"))
from harness import long_string  # noqa: E402

RUNTIME = os.path.join(HERE, "work", "runtime_marbeg.lua")
OUT = os.path.join(HERE, "work", "bootstrapper.lua")

src = open(RUNTIME, encoding="latin1").read()
boot = (
    "-- [SUPERZ] FlowAuth bootstrapper: run the verified runtime directly\n"
    "-- (credential = nil, _bsdata0 preseeded by patch_envlog.py)\n"
    "local __SZ_RUNTIME = " + long_string(src) + "\n"
    'local __SZ_F = loadstring(__SZ_RUNTIME, "=FlowAuthRuntime")\n'
    'if type(__SZ_F) ~= "function" then error("FlowAuthRuntime compile failed") end\n'
    "return __SZ_F()\n"
)
open(OUT, "w", encoding="latin1", newline="\n").write(boot)
print("wrote", OUT, len(boot), "bytes (runtime", len(src), "bytes)")
