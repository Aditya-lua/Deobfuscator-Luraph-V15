#!/usr/bin/env python3
"""Reconstruct the FlowAuth payload python-side: b64-decode both chunk
bodies, concatenate the raw lz4 blocks, decompress, verify sha256 against
the script response's payload_digest."""
import base64
import hashlib
import json
import sys


def lz4_block_decompress(src, expected=None):
    out = bytearray()
    i, n = 0, len(src)
    while i < n:
        tok = src[i]; i += 1
        lit = tok >> 4
        if lit == 15:
            while True:
                b = src[i]; i += 1; lit += b
                if b != 255:
                    break
        out += src[i:i + lit]; i += lit
        if i >= n:
            break
        off = src[i] | (src[i + 1] << 8); i += 2
        if off == 0 or off > len(out):
            raise ValueError("bad offset %d at out=%d i=%d" % (off, len(out), i))
        ml = tok & 15
        if ml == 15:
            while True:
                b = src[i]; i += 1; ml += b
                if b != 255:
                    break
        ml += 4
        start = len(out) - off
        for k in range(ml):
            out.append(out[start + k])
    return bytes(out)


def main():
    r2 = json.load(open("/home/z/my-project/Deobfuscator-Luraph-V15/flowauth_crack/work/hop_02_resp.txt"))
    c1 = base64.b64decode(json.load(open("/home/z/my-project/Deobfuscator-Luraph-V15/flowauth_crack/work/hop_03_resp.txt"))["chunk"])
    c2 = base64.b64decode(json.load(open("/home/z/my-project/Deobfuscator-Luraph-V15/flowauth_crack/work/hop_04_resp.txt"))["chunk"])
    print("chunk1:", len(c1), "B  head:", c1[:32])
    print("chunk2:", len(c2), "B  head:", c2[:32])
    digest = r2["payload_digest"]
    src_bytes = r2["source_bytes"]
    print("expect:", src_bytes, "B  sha256", digest)

    # hypothesis A: chunks are ONE lz4 block split at a fixed size
    try:
        full = lz4_block_decompress(c1 + c2)
        print("A: concat-decompress ->", len(full), "B")
        h = hashlib.sha256(full).hexdigest()
        print("   sha256", h, "match:", h == digest)
        if h == digest:
            out = "/home/z/my-project/Deobfuscator-Luraph-V15/flowauth_crack/work/payload_source.lua"
            open(out, "wb").write(full)
            print("   [+] PAYLOAD SOURCE WRITTEN:", out)
            print("   head:", full[:200])
            return 0
    except Exception as e:
        print("   A failed:", e)

    # hypothesis B: each chunk is an independent block
    for name, c in (("c1", c1), ("c2", c2)):
        try:
            d = lz4_block_decompress(c)
            print("B: %s standalone -> %d B" % (name, len(d)))
        except Exception as e:
            print("B: %s standalone failed: %s" % (name, e))
    return 1


if __name__ == "__main__":
    sys.exit(main())
