#!/usr/bin/env python3
"""Lift ONE proto (by tid) of a Luraph v14/v15 capture to Luau, in isolation.

Run with DEVIRT_SHALLOW=1 the children become __DEVIRT_CHILD__(tN) markers, so
deep proto chains are lifted one process per proto (a single in-process chain
of ~119 protos OOMs a 4 GB container). assemble_devirt.py splices the results.

Usage: lift_child.py <source.lua> <protos.json> <tid> [--out FILE]
"""
import argparse
import io
import os
import sys

sys.path.insert(0, os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "core"))
sys.setrecursionlimit(200000)

from obfuscators.luraph_v15 import devirt  # noqa: E402


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("source")
    ap.add_argument("protos")
    ap.add_argument("tid", type=int)
    ap.add_argument("--out")
    a = ap.parse_args()

    prog = devirt.Program(a.source, a.protos)
    vm, root_cap = None, None
    roots = devirt.program_roots(prog)
    if not roots:
        sys.exit("[!] no VM roots in the dump")
    tag, pid, root_cap = roots[0]
    vm = prog.vm_of(root_cap)

    proto = prog.dump.tables.get(a.tid)
    if proto is None:
        sys.exit("[!] no table tid %s in the dump" % a.tid)

    # a capture of this proto (by its self table or by its state table) gives
    # the child its own W/V state tables; without one, the VM's root state and
    # the shared VM-wide fields (helpers, shared tables) stand in
    cap = prog.dump.cap_by_self.get(a.tid) or prog.dump.cap_by_state.get(a.tid)
    vmobj = vm.vmobj_of(cap) if cap is not None else vm.vmobj_of(root_cap)
    if os.environ.get("DEVIRT_DEBUG"):
        print("[*] tid %s: cap=%s vmobj=%s" % (a.tid, "yes" if cap else "no",
                                               getattr(vmobj, "tid", None)), file=sys.stderr)

    prog.requests = set()   # --lift mode does the same (lift() unions into it)
    fl = devirt.FunctionLifter(prog)
    devirt.LAST_DUMP[:] = [prog.dump]
    try:
        lines = fl.lift(vm, vmobj, proto, devirt.UpList(), {},
                        shared=None if cap is not None else prog.dump.shared_cap)
    except devirt.S.Unsupported as ex:
        sys.exit("[!] lift failed: %s" % ex)
    text = "\n".join(lines)
    import codegen
    text = text.replace(codegen.LONG_NL, "\n")
    buf = "params: %s\n\n%s\n" % (", ".join(fl.params), text)
    if a.out:
        with open(a.out, "w", encoding="utf-8", newline="\n") as f:
            f.write(buf)
    else:
        sys.stdout.write(buf)


if __name__ == "__main__":
    main()
