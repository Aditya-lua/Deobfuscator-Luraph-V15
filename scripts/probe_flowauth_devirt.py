#!/usr/bin/env python3
"""Probe the FlowAuth payload lift: detection -> VM match -> root proto walk."""
import os
import sys
import time

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)
sys.path.insert(0, os.path.join(ROOT, "core"))

from obfuscators.luraph_v15 import vmmap, devirt  # noqa: E402

SRC = os.path.join(ROOT, "flowauth_crack", "work", "payload_devirt.lua")
DUMP = os.path.join(ROOT, "flowauth_capture", "capture_protos.json.gz")

t0 = time.time()
root = vmmap.load_ast(SRC)
disp = vmmap.find_dispatchers(root)
print("dispatchers: %d  (%.1fs)" % (len(disp), time.time() - t0))
for d in disp:
    print("   form=%s op=%s arr=%s pc=%s at=%s" % (d["form"], d["op"], d["arr"], d["pc"], vmmap.loc(d["node"])[:2]))

infos = vmmap.maker_info(root, disp)
print("maker infos: %d" % len(infos))
for i in infos:
    print("   mode=%s at=%s var=%s proto=%s captures=%s"
          % (i.get("mode", "primary"), i["at"], i["var"], i["proto"], (i.get("captures") or [])[:6]))

t1 = time.time()
prog = devirt.Program(SRC, DUMP)
print("Program built (%.1fs): vms=%s" % (time.time() - t1, list(prog.vms)))

vms, payload = devirt._vm_roots(prog)
print("vm roots: payload tag=%r" % (payload,))
for tag, lst in vms:
    print("   tag=%r protos=%d first=%s" % (tag, len(lst), lst[0][1]))

cap = prog.dump.protos[lst[0][1]] if vms else None
if cap is not None:
    vm = prog.vm_of(cap)
    print("root proto: vm=%s proto_tid=%s vmobj_tid=%s mode=%s"
          % (vm.tag, vm.proto_of(cap).tid, vm.vmobj_of(cap).tid, vm.info.get("mode")))
    print("bound ctor nodes:", sum(1 for c in prog.dump.protos.values()
                                   for e in c.values() if isinstance(e, devirt.LTable)
                                   for v in e.h.values()
                                   if isinstance(v, devirt.OpaqueFn) and v.node is not None))
