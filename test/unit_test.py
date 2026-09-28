#!/usr/bin/env python3
"""Fast unit tests for the Python core (no luau binaries, no network).

Run via test/run_all.py (or `python test/unit_test.py` directly).
"""
import os
import sys
import tempfile
import unittest

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)
sys.path.insert(0, os.path.join(ROOT, "core"))
sys.path.insert(0, HERE)

import harness  # noqa: E402
import luasym  # noqa: E402


class ChunkKeyTest(unittest.TestCase):
    """Known-answer vectors for the length_hash chunk key (protocol.json)."""

    # computed from the reference implementation (h*31+b) % 2^31, key = len_h
    VECTORS = [
        ("", "0_0"),
        ("a", "1_97"),
        ("abc", "3_96354"),
        ("Hello, World!", "13_1498789909"),
        ("x" * 4095, "4095_155578232"),
        ("x" * 4096, "4096_527958016"),
        ("y" * 4097, "4097_1703346297"),
        ("héllo wörld éü" * 300, "4200_2089404536"),
        ("\x00\x01\x02abc", "6_1079457"),
    ]

    def test_known_answers(self):
        for src, want in self.VECTORS:
            self.assertEqual(harness.chunk_key(src), want, "chunk_key(%r)" % src[:40])

    def test_devirt_delegates(self):
        from obfuscators.luraph_v15 import devirt
        for src, want in self.VECTORS:
            self.assertEqual(devirt.chunk_key(src), want)


class LongStringTest(unittest.TestCase):
    def test_no_escapes(self):
        self.assertEqual(harness.long_string("hi"), "[[\nhi]]")

    def test_closing_bracket_escalates_level(self):
        self.assertEqual(harness.long_string("a]]b"), "[=[\na]]b]=]")
        self.assertEqual(harness.long_string("a]]b]=]c"), "[==[\na]]b]=]c]==]")

    def test_comment_like_body(self):
        body = "local s = ']] .. '"
        ls = harness.long_string(body)
        self.assertIn(body, ls)
        self.assertTrue(ls.startswith("[") and ls.endswith("]"))


class LuaValueTest(unittest.TestCase):
    def test_string_escaping(self):
        self.assertEqual(harness.lua_value('a"b\\c\nd\re'), '"a\\"b\\\\c\\nd\\re"')

    def test_bools_and_lists(self):
        self.assertEqual(harness.lua_value(True), "true")
        self.assertEqual(harness.lua_value(False), "false")
        self.assertEqual(harness.lua_value([1, "a", True]), '{1, "a", true}')
        self.assertEqual(harness.lua_value([1, [2, 3]]), "{1, {2, 3}}")

    def test_numbers(self):
        self.assertEqual(harness.lua_value(42), "42")
        self.assertEqual(harness.lua_value(-1.5), "-1.5")


class ParseCfgValueTest(unittest.TestCase):
    def test_scalars(self):
        f = harness.parse_cfg_value
        self.assertIs(f(""), True)
        self.assertIs(f("true"), True)
        self.assertIs(f("false"), False)
        self.assertEqual(f("42"), 42)
        self.assertEqual(f("-7"), -7)
        self.assertEqual(f("3.5"), "3.5")   # not an int: stays a string
        self.assertEqual(f("hello"), "hello")

    def test_file_reference(self):
        with tempfile.NamedTemporaryFile("w", suffix=".txt", delete=False) as t:
            t.write("  from file  \n")
            path = t.name
        try:
            self.assertEqual(harness.parse_cfg_value("@file:" + path), "from file")
        finally:
            os.unlink(path)


class MarkerNonceTest(unittest.TestCase):
    """Wave 2 regression: the drivers must only parse nonce-tagged protocol
    lines, so a script-controlled print cannot forge them."""

    NONCE = "0123456789abcdef"

    def setUp(self):
        self._old = harness.LAST_MARK[0]
        harness.LAST_MARK[0] = self.NONCE

    def tearDown(self):
        harness.LAST_MARK[0] = self._old

    def test_mark_prefix(self):
        self.assertEqual(harness.mark("P2D "), "\x00" + self.NONCE + "P2D ")

    def test_take_chunks_rejects_forged_lines(self):
        real = harness.mark("CHUNK ") + "3_96354\n" + "abc".encode("latin-1").hex() + "\n"
        forged = "\x00CHUNK 3_96354\n616263\n"          # no nonce
        wrong = "\x00ffffffffffffffffCHUNK 3_96354\n616263\n"

        found, body = harness.take_chunks(real + forged + wrong)
        self.assertEqual([(k, s) for k, s in found], [("3_96354", "abc")])
        # unparsable forged lines are NOT consumed: they stay in the body as
        # ordinary (harmless) output instead of being mistaken for chunks
        self.assertEqual(body, forged + wrong)

    def test_take_p2d_rejects_forged_lines(self):
        real = harness.mark("P2D ") + "key\tmodel\n"
        forged = "\x00P2D key\tmodel\n"

        out = harness.take_p2d(real + forged, "unused", False)
        # the real line was consumed, the forged one is left untouched
        self.assertEqual(out, forged)

    def test_trigger_regex_needs_nonce(self):
        import re
        real = harness.mark("TRIGGER ") + "7\n"
        forged = "\x00TRIGGER 9\n"
        m = re.search(re.escape(harness.mark("TRIGGER ")) + r"(\d+)", real + forged)
        self.assertIsNotNone(m)
        self.assertEqual(m.group(1), "7")


class PowSemanticsTest(unittest.TestCase):
    """luasym._pow must mirror C/Luau pow(), not Python's **."""

    def test_vectors(self):
        f = luasym._pow
        inf, nan = float("inf"), float("nan")
        vectors = [
            ((0, -1), inf),
            ((-0.0, -1), -inf),
            ((0, -0.5), inf),
            ((-8, 1.0 / 3.0), nan),
            ((-2, 0.5), nan),
            ((-2, 2), 4.0),
            ((-2, 3), -8.0),
            ((1e308, 2), inf),
            ((2, -2), 0.25),
            ((0, 0), 1.0),
            ((float("inf"), -1), 0.0),
            ((9, 0.5), 3.0),
        ]
        for (a, b), want in vectors:
            got = f(a, b)
            if isinstance(want, float) and nan != nan and want != want:
                self.assertTrue(got != got, "_pow(%r, %r) = %r, want nan" % (a, b, got))
            else:
                self.assertEqual(got, want, "_pow(%r, %r)" % (a, b))

    def test_int_result_stays_float_like(self):
        self.assertEqual(luasym._pow(2, 10), 1024.0)


if __name__ == "__main__":
    unittest.main()
