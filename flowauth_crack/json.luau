-- JSON encode/decode in pure Luau (Roblox HttpService-style).
local JSONESC = {['"'] = '\\"', ['\\'] = '\\\\', ['\n'] = '\\n', ['\r'] = '\\r', ['\t'] = '\\t', ['\b'] = '\\b', ['\f'] = '\\f'}

local function encodeString(s)
    return '"' .. string.gsub(s, '[%c"\\]', function(c)
        return JSONESC[c] or string.format("\\u%04x", string.byte(c))
    end) .. '"'
end

local function encode(v, seen)
    local t = type(v)
    if v == nil then return "null" end
    if t == "boolean" then return v and "true" or "false" end
    if t == "number" then
        if v ~= v or v == math.huge or v == -math.huge then return "null" end
        if v == math.floor(v) and math.abs(v) < 2 ^ 53 then
            return string.format("%d", v)
        end
        return tostring(v)
    end
    if t == "string" then return encodeString(v) end
    if t == "table" then
        if seen[v] then error("cannot encode recursive table", 2) end
        seen[v] = true
        -- array detection: keys 1..n all present
        local n = 0
        local isArr = true
        for k in pairs(v) do
            if type(k) ~= "number" or k % 1 ~= 0 or k < 1 then
                isArr = false
            else
                n = n + 1
            end
        end
        local parts = {}
        if isArr and n > 0 then
            for i = 1, n do
                parts[i] = encode(v[i], seen)
            end
            seen[v] = nil
            return "[" .. table.concat(parts, ",") .. "]"
        end
        -- object: sorted keys for deterministic output
        local keys = {}
        for k in pairs(v) do
            if type(k) == "string" or type(k) == "number" then
                keys[#keys + 1] = k
            end
        end
        table.sort(keys, function(a, b) return tostring(a) < tostring(b) end)
        for i, k in ipairs(keys) do
            parts[i] = encodeString(tostring(k)) .. ":" .. encode(v[k], seen)
        end
        seen[v] = nil
        return "{" .. table.concat(parts, ",") .. "}"
    end
    error("cannot encode value of type " .. t, 2)
end

local function jsonEncode(v)
    return encode(v, {})
end

-- decoder ---------------------------------------------------------------
local function decode(s, pos)
    pos = pos or 1
    local function skipWs(p)
        while p <= #s do
            local c = string.sub(s, p, p)
            if c == " " or c == "\t" or c == "\n" or c == "\r" then p = p + 1 else break end
        end
        return p
    end
    local parseValue -- forward

    local function parseString(p)
        -- expects s:sub(p,p) == '"'
        p = p + 1
        local buf = {}
        while p <= #s do
            local c = string.sub(s, p, p)
            if c == '"' then
                return table.concat(buf), p + 1
            elseif c == "\\" then
                local e = string.sub(s, p + 1, p + 1)
                if e == "u" then
                    local hex = string.sub(s, p + 2, p + 5)
                    local code = tonumber(hex, 16)
                    p = p + 6
                    if code < 0x80 then
                        buf[#buf + 1] = string.char(code)
                    elseif code < 0x800 then
                        buf[#buf + 1] = string.char(0xC0 + math.floor(code / 64), 0x80 + code % 64)
                    else
                        buf[#buf + 1] = string.char(0xE0 + math.floor(code / 4096),
                            0x80 + math.floor(code / 64) % 64, 0x80 + code % 64)
                    end
                else
                    local map = { n = "\n", t = "\t", r = "\r", b = "\b", f = "\f", ['"'] = '"', ["\\"] = "\\", ["/"] = "/" }
                    buf[#buf + 1] = map[e] or e
                    p = p + 2
                end
            else
                buf[#buf + 1] = c
                p = p + 1
            end
        end
        error("unterminated string", 0)
    end

    parseValue = function(p)
        p = skipWs(p)
        local c = string.sub(s, p, p)
        if c == '"' then
            return parseString(p)
        elseif c == "{" then
            local obj = {}
            p = skipWs(p + 1)
            if string.sub(s, p, p) == "}" then return obj, p + 1 end
            while true do
                p = skipWs(p)
                local k
                k, p = parseString(p)
                p = skipWs(p)
                if string.sub(s, p, p) ~= ":" then error("expected :", 0) end
                local v
                v, p = parseValue(p + 1)
                obj[k] = v
                p = skipWs(p)
                local d = string.sub(s, p, p)
                if d == "," then p = p + 1
                elseif d == "}" then return obj, p + 1
                else error("expected , or }", 0) end
            end
        elseif c == "[" then
            local arr = {}
            p = skipWs(p + 1)
            if string.sub(s, p, p) == "]" then return arr, p + 1 end
            while true do
                local v
                v, p = parseValue(p)
                arr[#arr + 1] = v
                p = skipWs(p)
                local d = string.sub(s, p, p)
                if d == "," then p = p + 1
                elseif d == "]" then return arr, p + 1
                else error("expected , or ]", 0) end
            end
        elseif string.sub(s, p, p + 3) == "true" then
            return true, p + 4
        elseif string.sub(s, p, p + 4) == "false" then
            return false, p + 5
        elseif string.sub(s, p, p + 3) == "null" then
            return nil, p + 4
        else
            local num = string.match(s, "^%-?%d+%.?%d*[eE]?%+?%-?%d*", p)
            if not num or num == "" then
                num = string.match(s, "^%-?%d+", p)
            end
            if num and num ~= "" then
                return tonumber(num), p + #num
            end
            error("unexpected character at " .. p .. ": " .. string.sub(s, p, p + 10), 0)
        end
    end

    return parseValue(pos)
end

local function jsonDecode(s)
    if type(s) == "buffer" then s = buffer.tostring(s) end
    return decode(tostring(s))
end

return jsonEncode, jsonDecode
