#!/usr/bin/env python3
"""Lift EVERY captured proto of a Luraph v14/v15 payload, one at a time, in a
single process (walk state is walk-local, so sequential lifts stay bounded --
only NESTED lifts OOM the container), then assemble the recovered source view:

  1. the root/entry output (from the shallow pipeline run) with child markers
     resolved,
  2. every lifted proto as `lf_<tag>`, in capture order, with its own child
     markers inlined recursively.

Markers __DEVIRT_CHILD__(p<pid>|t<tid>) come from DEVIRT_SHALLOW=1 closure()
in devirt.py and use the SAME tag rule (pid_of_table lookup, then the proto
tid). Tags with no liftable proto (ENCFUNC descriptors) become runtime stubs.

Usage: lift_all.py <source.lua> <protos.json> <shallow_output.lua> <out.lua>
"""
import gc
import os
import re
import sys

sys.path.insert(0, os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "core"))
sys.setrecursionlimit(200000)

from obfuscators.luraph_v15 import devirt  # noqa: E402
import codegen  # noqa: E402

# function(...) <marker line> end -- the marker sits one level deeper than
# the closing end in the rendered FuncE (table fields indent their bodies)
MARK = re.compile(r"function\(\.\.\.\)\n(\t*)__DEVIRT_CHILD__\((p|t)(\d+)\)\n(\t*)end")


def tag_of(prog, proto):
    """The same tag rule devirt.closure() uses for DEVIRT_SHALLOW markers."""
    tid = getattr(proto, "tid", None)
    pid = prog.dump.pid_of_table.get(tid)
    return ("p%s" % pid) if pid is not None else ("t%s" % tid)


def main():
    source, protos_path, shallow_path, out_path = sys.argv[1:5]
    # optional extra sources: original text of loadstring'd VM chunks (their
    # captured protos carry tags keyed by the chunk source hash)
    chunk_paths = sys.argv[5:]
    prog = devirt.Program(source, protos_path, chunk_paths)
    prog.requests = set()

    roots = devirt.program_roots(prog)
    if not roots:
        sys.exit("[!] no VM roots in the dump")
    _tag, _root_pid, root_cap = roots[0]
    vm = prog.vm_of(root_cap)
    shared = prog.dump.shared_cap

    # ---- lift every captured proto, shallowly, one at a time -------------
    caps = []
    for key, cap in prog.dump.protos.items():
        try:
            v = prog.vm_of(cap)
        except Exception:
            continue
        if v.proto_of(cap) is None:
            continue
        caps.append((cap.get("__seq") or 0, str(key), cap))
    caps.sort()

    texts = {}       # tag -> (params, body lines)
    order = []       # (seq, key, tag) in lift order
    by_tid = {}      # str(tid) -> tag (for t<tid> markers)
    fails = []
    for seq, key, cap in caps:
        v = prog.vm_of(cap)
        proto = v.proto_of(cap)
        tag_name = tag_of(prog, proto)
        if tag_name in texts:
            continue
        try:
            fl = devirt.FunctionLifter(prog)
            lines = fl.lift(v, v.vmobj_of(cap), proto, devirt.UpList(), {}, shared=shared)
            texts[tag_name] = (list(fl.params), "\n".join(lines).replace(codegen.LONG_NL, "\n"))
            order.append((seq, key, tag_name))
            by_tid.setdefault(str(getattr(proto, "tid", None)), tag_name)
        except Exception as ex:
            fails.append((tag_name, "%s: %s" % (type(ex).__name__, str(ex)[:160])))
        if len(texts) % 16 == 0:
            gc.collect()

    def resolve(kind, ident):
        if kind == "p":
            t = "p%s" % ident
            return t if t in texts else None
        return by_tid.get(ident)

    def inline(text, depth, active):
        def rep(m):
            ind, kind, ident, end_ind = m.group(1), m.group(2), m.group(3), m.group(4)
            target = resolve(kind, ident)
            if target is None or target not in texts:
                return ("function(...)\n%s\t-- Luraph runtime function (ENCFUNC descriptor %s%s,"
                        " not script code)\n%send" % (ind, kind, ident, end_ind))
            if target in active or depth > 48:
                return ("function(...)\n%s\t-- [[ recursive proto %s; see its definition below ]]\n%send"
                        % (ind, target, end_ind))
            params, body = texts[target]
            inner = inline(body, depth + 1, active | {target})
            indented = "\n".join((ind + "\t" + l) if l else ind for l in inner.split("\n"))
            return "function(%s)\n%s\n%send" % (", ".join(params) or "...", indented, end_ind)
        return MARK.sub(rep, text)

    # ---- the root/entry output from the shallow pipeline run -------------
    with open(shallow_path, encoding="utf-8") as f:
        root_text = f.read()
    root_text = inline(root_text, 0, frozenset())

    # ---- the combined per-proto listing ----------------------------------
    parts = ["", "-- " + "=" * 66,
             "-- Recovered protos (capture order). The entry logic above calls",
             "-- these through the Luraph VM; they are rendered here in source form.",
             "-- " + "=" * 66, ""]
    n_in = 0
    for seq, key, tag_name in order:
        params, body = texts[tag_name]
        resolved = inline(body, 0, frozenset({tag_name}))
        if "__DEVIRT_CHILD__" not in resolved:
            n_in += 1
        parts.append("-- " + "-" * 66)
        parts.append("-- proto %s (capture seq %s%s)" % (
            tag_name, seq, (", dump key %s" % key) if key != tag_name.lstrip("p") else ""))
        parts.append("-- " + "-" * 66)
        parts.append("local function lf_%s(%s)" % (tag_name, ", ".join(params) or "..."))
        parts.append(resolved)
        parts.append("end")
        parts.append("")
    combined = "\n".join(parts)
    combined = combined.replace(codegen.LONG_NL, "\n")

    # the root text ends with a top-level `return`, which must close the
    # chunk -- so the recovered-proto listing goes first
    with open(out_path, "w", encoding="utf-8", newline="\n") as f:
        f.write(combined + "\n" + "-- " + "=" * 66 + "\n"
                + "-- Entry point (the VM bootstrap root, lifted by the pipeline)\n"
                + "-- " + "=" * 66 + "\n\n" + root_text.rstrip() + "\n")

    print("[*] lifted %d protos (%d failed); %d fully inlined; output %s"
          % (len(order), len(fails), n_in, out_path))
    for tag_name, err in fails[:25]:
        print("[!]   %s failed: %s" % (tag_name, err))


if __name__ == "__main__":
    main()
