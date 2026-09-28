-- Base64 decode/encode in pure Luau. Returns string (bytes) or nil on error.
local ALPHABET = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"

local function b64decode(data)
    if type(data) == "buffer" then data = buffer.tostring(data) end
    data = tostring(data)
    local len = #data
    -- strip padding / whitespace tolerance
    local out = {}
    local n = 0
    local acc = 0
    local accbits = 0
    for i = 1, len do
        local c = string.sub(data, i, i)
        local v
        if c == "=" then
            break
        else
            local p = string.find(ALPHABET, c, 1, true)
            if not p then
                -- skip whitespace (CRLF etc.)
                if c == "\r" or c == "\n" or c == " " or c == "\t" then
                    -- ignore
                else
                    return nil, "invalid base64 character: " .. string.byte(c)
                end
            else
                v = p - 1
                acc = acc * 64 + v
                accbits = accbits + 6
                if accbits >= 8 then
                    accbits = accbits - 8
                    local byte = math.floor(acc / 2 ^ accbits) % 256
                    acc = acc % (2 ^ accbits)
                    n = n + 1
                    out[n] = string.char(byte)
                end
            end
        end
    end
    return table.concat(out)
end

local function b64encode(data)
    if type(data) == "buffer" then data = buffer.tostring(data) end
    data = tostring(data)
    local out = {}
    local n = 0
    local len = #data
    for i = 1, len - len % 3, 3 do
        local a, b, c = string.byte(data, i, i + 2)
        local acc = a * 65536 + b * 256 + c
        n = n + 1; out[n] = string.sub(ALPHABET, math.floor(acc / 262144) % 64 + 1, math.floor(acc / 262144) % 64 + 1)
        n = n + 1; out[n] = string.sub(ALPHABET, math.floor(acc / 4096) % 64 + 1, math.floor(acc / 4096) % 64 + 1)
        n = n + 1; out[n] = string.sub(ALPHABET, math.floor(acc / 64) % 64 + 1, math.floor(acc / 64) % 64 + 1)
        n = n + 1; out[n] = string.sub(ALPHABET, acc % 64 + 1, acc % 64 + 1)
    end
    local rem = len % 3
    if rem == 1 then
        local a = string.byte(data, len)
        local acc = a * 65536
        n = n + 1; out[n] = string.sub(ALPHABET, math.floor(acc / 262144) % 64 + 1, math.floor(acc / 262144) % 64 + 1)
        n = n + 1; out[n] = string.sub(ALPHABET, math.floor(acc / 4096) % 64 + 1, math.floor(acc / 4096) % 64 + 1)
        out[n + 1] = "=="
    elseif rem == 2 then
        local a, b = string.byte(data, len - 1, len)
        local acc = a * 65536 + b * 256
        n = n + 1; out[n] = string.sub(ALPHABET, math.floor(acc / 262144) % 64 + 1, math.floor(acc / 262144) % 64 + 1)
        n = n + 1; out[n] = string.sub(ALPHABET, math.floor(acc / 4096) % 64 + 1, math.floor(acc / 4096) % 64 + 1)
        n = n + 1; out[n] = string.sub(ALPHABET, math.floor(acc / 64) % 64 + 1, math.floor(acc / 64) % 64 + 1)
        out[n + 1] = "="
    end
    return table.concat(out)
end

return b64decode, b64encode
