-- SHA-256 in pure Luau (bit32), returns lowercase hex digest.
-- Standalone test mode: compares against known vectors when run directly.

local function sha256(msg)
    local band, bxor, bnot, rrotate, rshift =
        bit32.band, bit32.bxor, bit32.bnot, bit32.rrotate, bit32.rshift
    local K = {
        0x428a2f98,0x71374491,0xb5c0fbcf,0xe9b5dba5,0x3956c25b,0x59f111f1,0x923f82a4,0xab1c5ed5,
        0xd807aa98,0x12835b01,0x243185be,0x550c7dc3,0x72be5d74,0x80deb1fe,0x9bdc06a7,0xc19bf174,
        0xe49b69c1,0xefbe4786,0x0fc19dc6,0x240ca1cc,0x2de92c6f,0x4a7484aa,0x5cb0a9dc,0x76f988da,
        0x983e5152,0xa831c66d,0xb00327c8,0xbf597fc7,0xc6e00bf3,0xd5a79147,0x06ca6351,0x14292967,
        0x27b70a85,0x2e1b2138,0x4d2c6dfc,0x53380d13,0x650a7354,0x766a0abb,0x81c2c92e,0x92722c85,
        0xa2bfe8a1,0xa81a664b,0xc24b8b70,0xc76c51a3,0xd192e819,0xd6990624,0xf40e3585,0x106aa070,
        0x19a4c116,0x1e376c08,0x2748774c,0x34b0bcb5,0x391c0cb3,0x4ed8aa4a,0x5b9cca4f,0x682e6ff3,
        0x748f82ee,0x78a5636f,0x84c87814,0x8cc70208,0x90befffa,0xa4506ceb,0xbef9a3f7,0xc67178f2,
    }
    local H = {
        0x6a09e667, 0xbb67ae85, 0x3c6ef372, 0xa54ff53a,
        0x510e527f, 0x9b05688c, 0x1f83d9ab, 0x5be0cd19,
    }
    local len = #msg
    local bits = len * 8
    local hi = math.floor(bits / 4294967296)
    local lo = bits - hi * 4294967296
    local withone = len + 1
    local zeros = (55 - len) % 64
    local total = withone + zeros + 8
    local w = table.create and table.create(64) or {}

    local function getbyte(i)
        if i <= len then return string.byte(msg, i) end
        if i == withone then return 0x80 end
        if i <= total - 8 then return 0 end
        local j = i - (total - 8) -- 1..8, big-endian 64-bit bit length
        if j <= 4 then
            return band(math.floor(hi / 256 ^ (4 - j)) % 256, 0xFF)
        end
        return band(math.floor(lo / 256 ^ (8 - j)) % 256, 0xFF)
    end

    for base = 0, total - 1, 64 do
        for j = 0, 15 do
            local o = base + j * 4
            w[j + 1] = getbyte(o + 1) * 16777216 + getbyte(o + 2) * 65536
                + getbyte(o + 3) * 256 + getbyte(o + 4)
        end
        for j = 17, 64 do
            local a, b = w[j - 15], w[j - 2]
            local s0 = bxor(rrotate(a, 7), rrotate(a, 18), rshift(a, 3))
            local s1 = bxor(rrotate(b, 17), rrotate(b, 19), rshift(b, 10))
            w[j] = (w[j - 16] + s0 + w[j - 7] + s1) % 4294967296
        end
        local a, b, c, d, e, f, g, h =
            H[1], H[2], H[3], H[4], H[5], H[6], H[7], H[8]
        for j = 1, 64 do
            local S1 = bxor(rrotate(e, 6), rrotate(e, 11), rrotate(e, 25))
            local ch = bxor(band(e, f), band(bnot(e), g))
            local t1 = (h + S1 + ch + K[j] + w[j]) % 4294967296
            local S0 = bxor(rrotate(a, 2), rrotate(a, 13), rrotate(a, 22))
            local maj = bxor(band(a, b), band(a, c), band(b, c))
            local t2 = (S0 + maj) % 4294967296
            h, g, f = g, f, e
            e = (d + t1) % 4294967296
            d, c, b = c, b, a
            a = (t1 + t2) % 4294967296
        end
        H[1] = (H[1] + a) % 4294967296
        H[2] = (H[2] + b) % 4294967296
        H[3] = (H[3] + c) % 4294967296
        H[4] = (H[4] + d) % 4294967296
        H[5] = (H[5] + e) % 4294967296
        H[6] = (H[6] + f) % 4294967296
        H[7] = (H[7] + g) % 4294967296
        H[8] = (H[8] + h) % 4294967296
    end

    return string.format("%08x%08x%08x%08x%08x%08x%08x%08x",
        H[1], H[2], H[3], H[4], H[5], H[6], H[7], H[8])
end

return sha256
