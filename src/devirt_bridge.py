import json
import os
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
CORE_DIR = os.path.join(HERE, "..", "core")
if CORE_DIR not in sys.path:
    sys.path.insert(0, CORE_DIR)

from backend import run_big_stack
from obfuscators.luraph_v15 import devirt

cmd = sys.argv[1]

if cmd == "collect":
    source_path = sys.argv[2]
    protos_path = sys.argv[3]
    chunk_paths = sys.argv[4:]
    stats, reqs, bufs = run_big_stack(
        devirt.collect_requests, source_path, protos_path, chunk_paths
    )
    result = {
        "stats": stats,
        "requests": sorted(list(reqs)),
        "bufs": bufs,
    }
    print(json.dumps(result))

elif cmd == "pipeline":

    config_file = sys.argv[2]
    with open(config_file, "r", encoding="utf-8") as f:
        c = json.load(f)

    from obfuscators.base import Job
    from obfuscators.luraph_v15 import driver
    import harness

    class DummyArgs:
        def __init__(self, d):
            for k, v in d.items():
                setattr(self, k, v)

    args = DummyArgs(c["args"])
    job = Job(c["input"], c["source"], args, c["trace_path"], c["debug"], c["obfuscator"])
    job.source_path = c["source_path"]
    job.credit_header = lambda: ""

    runner = harness.Runner(job)
    runner.luau = c["luau_exe"]

    driver.lift(
        job,
        runner,
        c["patched"],
        c["cfg"],
        c.get("chunks", {}),
        c["run_text"],
        c["ppath"],
        c["dpath"],
        c.get("chunk_paths", []),
    )
    runner.finish()

    dpath = c["dpath"]
    if os.path.exists(dpath):
        with open(dpath, "r", encoding="utf-8", errors="replace") as f:
            lines = f.readlines()
        clean = []
        skip_header = True
        for line in lines:
            stripped = line.strip()
            if skip_header and (
                stripped.startswith("-- Deobfuscated by") or
                stripped.startswith("-- Detected obfuscation") or
                stripped.startswith("-- Local names are inferred") or
                stripped.startswith("-- source:") or
                stripped.startswith("-- NOTE: reconstructed") or
                stripped.startswith("--       during the trace")
            ):
                continue
            if skip_header and stripped == "":
                continue
            skip_header = False
            clean.append(line)
        with open(dpath, "w", encoding="utf-8", newline="\n") as f:
            f.writelines(clean)

    print(json.dumps({"success": True, "output": c["dpath"]}))

else:
    sys.exit(f"Unknown command: {cmd}")
