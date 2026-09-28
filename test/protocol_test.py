#!/usr/bin/env python3
"""Cross-language protocol consistency test.

The deobfuscator's harness protocol is defined in protocol.json at the repo
root and implemented in three languages (Python core, Node driver, Luau
runtime). This test fails when any copy drifts:

  - every protocol.json key present and sane
  - runtime/envlog.luau's baked-in PROTO defaults equal protocol.json
    (standalone Studio runs rely on the baked-in values)
  - the Python and JS chunk-key implementations agree on probe inputs
  - every marker in protocol.json exists in the Luau runtime, and the ones
    the drivers parse exist in a Python or JS consumer too
  - both harness builders inject the current PROTO values and a correct
    nonce length into the built harness

Runs node for the JS side (no luau binaries needed). Via test/run_all.py.
"""
import json
import os
import re
import subprocess
import sys
import unittest

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)
sys.path.insert(0, os.path.join(ROOT, "core"))
sys.path.insert(0, HERE)

with open(os.path.join(ROOT, "protocol.json"), encoding="utf-8") as f:
    PROTO = json.load(f)

# Markers the drivers parse (vs runtime-only display lines such as TR,
# P2DCHECK, HOOKERR): each must appear in at least one Python/JS consumer.
CONSUMED = {
    "ENVLOG-BEGIN", "ENVLOG-END", "ENVLOG-STRINGS", "ENVLOG-FAIL",
    "HB", "P2D", "P2DMISS", "TRIGGER", "FORCE", "UNSCRAMBLED", "PROTOS",
    "CHUNK", "FETCH",
}


def node_eval(expr):
    """Run `node -e` requiring src/harness.js; expr may use `h` (the module).
    Returns the printed JSON of the expression."""
    script = "const h = require(%s);\nconsole.log((%s));\n" % (json.dumps(os.path.join(ROOT, "src", "harness.js")), expr)
    r = subprocess.run(["node", "-e", script], capture_output=True, text=True, timeout=60)
    if r.returncode != 0:
        raise AssertionError("node eval failed:\n" + r.stderr[-2000:])
    return r.stdout.strip()


def py_chunk_key(src):
    import harness
    return harness.chunk_key(src)


class ProtocolJsonTest(unittest.TestCase):
    def test_required_keys(self):
        for key in ("chunk_hash", "nonce_hex_bytes", "heartbeat_seconds",
                    "stall_seconds", "markers"):
            self.assertIn(key, PROTO)
        for key in ("multiplier", "modulus", "stride", "min_len"):
            self.assertIn(key, PROTO["chunk_hash"])
        ch = PROTO["chunk_hash"]
        self.assertIsInstance(ch["multiplier"], int)
        self.assertEqual(ch["modulus"], 2 ** 31)
        self.assertEqual(PROTO["nonce_hex_bytes"], 8)

    def test_markers_unique_nonempty(self):
        ms = PROTO["markers"]
        self.assertTrue(all(isinstance(m, str) and m for m in ms))
        self.assertEqual(len(ms), len(set(ms)))


class EnvlogDefaultsTest(unittest.TestCase):
    """The PROTO table baked into runtime/envlog.luau must equal protocol.json
    (builders override it per run, but standalone Studio runs use the baked
    values)."""

    def test_baked_proto_matches_json(self):
        with open(os.path.join(ROOT, "runtime", "envlog.luau"), encoding="utf-8") as f:
            runtime = f.read()
        m = re.search(r"local PROTO = \{[^}]*\}", runtime)
        self.assertIsNotNone(m, "envlog.luau lost its PROTO table")
        got = {k: int(v) for k, v in re.findall(r"(\w+) = (\d+)", m.group(0))}
        ch = PROTO["chunk_hash"]
        self.assertEqual(got, {
            "hash_mult": ch["multiplier"],
            "hash_mod": ch["modulus"],
            "hash_stride": ch["stride"],
            "chunk_min": ch["min_len"],
        })

    def test_runtime_uses_proto_fields(self):
        with open(os.path.join(ROOT, "runtime", "envlog.luau"), encoding="utf-8") as f:
            runtime = f.read()
        self.assertNotIn("% 2147483648", runtime, "hardcoded modulus leaked back into envlog.luau")
        self.assertIn("PROTO.hash_mult", runtime)
        self.assertIn("PROTO.hash_mod", runtime)
        self.assertIn("PROTO.hash_stride", runtime)
        self.assertIn("PROTO.chunk_min", runtime)


class CrossLanguageChunkKeyTest(unittest.TestCase):
    """Python and JS chunk keys must agree byte-for-byte on probe inputs
    (chunk keys index the __CHUNKS table across the language boundary)."""

    PROBES = [
        "",
        "a",
        "abc",
        "Hello, World!",
        "x" * 4095,
        "x" * 4096,
        "y" * 4097,
        "héllo wörld éü" * 300,
        "\x00\x01\x02abc",
    ]

    def test_py_equals_js(self):
        # pass the JSON-decoded strings straight through: chunkKey does its own
        # latin-1 encode, exactly like harness.chunk_key's src.encode("latin-1")
        js_keys = json.loads(node_eval(
            "JSON.stringify(%s.map(s => h.chunkKey(s)))"
            % json.dumps(self.PROBES)))
        for src, js_key in zip(self.PROBES, js_keys):
            self.assertEqual(py_chunk_key(src), js_key, "chunk key mismatch on %r" % src[:40])


class MarkerPresenceTest(unittest.TestCase):
    def collect_source(self):
        out = {}
        for d, exts in (("core", (".py",)), ("src", (".py", ".js"))):
            for dirpath, _, files in os.walk(os.path.join(ROOT, d)):
                for fn in files:
                    if fn.endswith(exts):
                        p = os.path.join(dirpath, fn)
                        out[os.path.relpath(p, ROOT)] = open(p, encoding="utf-8", errors="replace").read()
        for fn in ("deob.js", "fetch.js"):
            p = os.path.join(ROOT, fn)
            out[fn] = open(p, encoding="utf-8", errors="replace").read()
        return out

    def test_runtime_prints_every_marker(self):
        """Every marker is printed by the Luau runtime, except ENVLOG-FAIL,
        which the Studio loader emits (the harness chunk never ran, so there
        is no nonce and no envlog code to print it)."""
        with open(os.path.join(ROOT, "runtime", "envlog.luau"), encoding="utf-8") as f:
            runtime = f.read()
        for m in PROTO["markers"]:
            if m == "ENVLOG-FAIL":
                continue
            self.assertIn('"%s' % m, runtime, "marker %r missing from runtime/envlog.luau" % m)
        self.assertIn('"\\x00ENVLOG-FAIL', open(os.path.join(ROOT, "core", "harness.py"), encoding="utf-8").read())

    def test_consumed_markers_have_consumers(self):
        sources = self.collect_source()
        for m in PROTO["markers"]:
            if m not in CONSUMED:
                continue
            hits = [name for name, text in sources.items() if '"%s' % m in text or "'%s" % m in text
                    or ('\\x00' + m) in text]
            self.assertTrue(hits, "marker %r marked as consumed but appears in no consumer" % m)


class HarnessBuildTest(unittest.TestCase):
    """Both harness builders must inject the current PROTO values and a
    nonce of the configured length into the built harness source."""

    def expected_proto_line(self):
        ch = PROTO["chunk_hash"]
        return ("local PROTO = { hash_mult = %d, hash_mod = %d, hash_stride = %d, chunk_min = %d }"
                % (ch["multiplier"], ch["modulus"], ch["stride"], ch["min_len"]))

    def nonce_len(self):
        return 2 * PROTO["nonce_hex_bytes"]  # hex chars

    def test_python_builder(self):
        import harness
        text = harness.build_harness("return 1", {})
        self.assertIn(self.expected_proto_line(), text)
        self.assertIn('"%s"' % harness.LAST_MARK[0], text)
        self.assertEqual(len(harness.LAST_MARK[0]), self.nonce_len())
        # the baked defaults line must not survive into the built harness
        self.assertNotIn("hash_mult = 31", text.replace(self.expected_proto_line(), ""))

    def test_js_builder(self):
        # buildHarness FIRST, then read the nonce it generated
        out = json.loads(node_eval(
            "JSON.stringify((() => { const t = h.buildHarness('return 1', {}); "
            "return {mark: h.getMark(), harness: t}; })())"))
        self.assertIn(self.expected_proto_line(), out["harness"])
        self.assertEqual(len(out["mark"]), self.nonce_len())
        self.assertRegex(out["mark"], "^[0-9a-f]+$")

    def test_js_timing_constants(self):
        out = json.loads(node_eval(
            "JSON.stringify([h.HEARTBEAT, h.STALL])"))
        self.assertEqual(out, [PROTO["heartbeat_seconds"], PROTO["stall_seconds"]])

    def test_py_timing_constants(self):
        import harness
        self.assertEqual(harness.HEARTBEAT, PROTO["heartbeat_seconds"])
        self.assertEqual(harness.STALL, PROTO["stall_seconds"])


if __name__ == "__main__":
    unittest.main()
