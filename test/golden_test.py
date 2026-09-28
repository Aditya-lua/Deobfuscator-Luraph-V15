#!/usr/bin/env python3
"""Golden regression test: re-run the full deobfuscation pipeline on the
benchmark samples and compare byte-for-byte with the committed reference
outputs in sample/output/.

Slow (spawns the luau runtime; ~1 min for the default two samples) and it
needs bin/luau + bin/luau-ast + node, so it only runs via
`python test/run_all.py --golden` (CI's golden job) or with RUN_GOLDEN=1.

If the fresh output differs from the reference, the reference file is
restored (the worktree stays clean) and the test fails with a summary.
"""
import json
import os
import shutil
import subprocess
import sys
import unittest

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)

# The two samples with committed reference outputs that stay under a minute
# in CI; AOnePieceGame.lua (1.7 MB) is the manual stress test.
DEFAULT_SAMPLES = ["5ae248d6527b5c01.lua", "RideAPet.lua"]
TIMEOUT_S = 900


def binaries_ready():
    luau = os.path.join(ROOT, "bin", "luau.exe" if os.name == "nt" else "luau")
    ast = os.path.join(ROOT, "bin", "luau-ast.exe" if os.name == "nt" else "luau-ast")
    if not (os.path.exists(luau) and os.path.exists(ast)):
        return "bin/luau + bin/luau-ast not built (python build_luau.py)"
    if not shutil.which("node"):
        return "node not on PATH"
    return None


@unittest.skipUnless(os.environ.get("RUN_GOLDEN"), "golden regression is slow: run with --golden")
@unittest.skipIf(binaries_ready(), "prerequisites missing")
class GoldenTest(unittest.TestCase):
    def run_pipeline(self, sample):
        out_path = os.path.join(ROOT, "sample", "output", sample)
        with open(out_path, "rb") as f:
            expected = f.read()

        r = subprocess.run(
            ["node", "deob.js", os.path.join("sample", sample)],
            cwd=ROOT, capture_output=True, text=True, timeout=TIMEOUT_S,
        )
        try:
            with open(out_path, "rb") as f:
                got = f.read()
        except FileNotFoundError:
            got = None

        if got != expected:
            with open(out_path, "wb") as f:   # keep the worktree clean
                f.write(expected)

        return r, expected, got

    def assert_golden(self, sample):
        r, expected, got = self.run_pipeline(sample)
        self.assertEqual(
            r.returncode, 0,
            "pipeline failed on %s (exit %d):\n%s" % (sample, r.returncode, r.stderr[-3000:]),
        )
        self.assertIsNotNone(got, "pipeline produced no output for %s" % sample)
        if got != expected:
            n_diff = sum(1 for a, b in zip(expected.split(b"\n"), got.split(b"\n")) if a != b)
            msg = ("%s: output differs from the committed reference (%d/%d lines changed)\n"
                   "  stderr tail:\n%s" % (sample, n_diff, len(expected.split(b"\n")), r.stderr[-2000:]))
            self.fail(msg)

    def test_5ae248d6527b5c01(self):
        self.assert_golden("5ae248d6527b5c01.lua")

    def test_rideAPet(self):
        self.assert_golden("RideAPet.lua")


if __name__ == "__main__":
    unittest.main()
