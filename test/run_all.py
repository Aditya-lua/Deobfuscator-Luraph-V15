#!/usr/bin/env python3
"""Test-suite runner: `python test/run_all.py` runs the fast tests (unit +
cross-language protocol consistency); `--golden` adds the full-pipeline
regression against the committed reference outputs (needs bin/luau +
bin/luau-ast + node; what CI's golden job runs).

Exit code 0 = all selected tests passed.
"""
import os
import sys
import unittest

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)


def main():
    argv = sys.argv[1:]
    if "--help" in argv or "-h" in argv:
        print(__doc__)
        return 0
    if "--golden" in argv:
        os.environ["RUN_GOLDEN"] = "1"
        argv.remove("--golden")

    # core/ and the repo root on sys.path so tests can import harness/luasym
    # and read protocol.json the same way the pipeline does.
    sys.path.insert(0, os.path.join(ROOT, "core"))
    sys.path.insert(0, HERE)

    loader = unittest.defaultTestLoader
    suite = loader.discover(HERE, pattern="*_test.py", top_level_dir=HERE)
    runner = unittest.TextTestRunner(verbosity=2)
    result = runner.run(suite)
    return 0 if result.wasSuccessful() else 1


if __name__ == "__main__":
    sys.exit(main())
