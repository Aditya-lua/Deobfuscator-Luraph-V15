-- Luraph runtime function (from the VM object, not part of the script: not lifted).
-- LPH_ENCFUNC decrypts a function this way: (key, encrypted buffer, ...) -> function.
local function luraph_runtime1(...)
	error("Luraph runtime function, not devirtualized")
end

-- Luraph runtime function (from the VM object, not part of the script: not lifted).
-- LPH_ENCFUNC decrypts a function this way: (key, encrypted buffer, ...) -> function.
local function luraph_runtime2(...)
	error("Luraph runtime function, not devirtualized")
end

-- Luraph runtime function (from the VM object, not part of the script: not lifted).
-- LPH_ENCFUNC decrypts a function this way: (key, encrypted buffer, ...) -> function.
local function luraph_runtime3(...)
	error("Luraph runtime function, not devirtualized")
end

local v = table.pack(luraph_runtime1(163))

luraph_runtime2(table.pack(...), 1, 0, 15, v[1])
;(v[1])[15] = luraph_runtime3(...)

local v2 = table.pack(luraph_runtime1(163))
;(v2[1])[96] = (v2[1])[1]
;(v2[1])[97] = (v2[1])[86]

local v3 = table.pack(luraph_runtime1(163))
;(v3[1])[98] = (v3[1])[89]
;(v3[1])[73] = (v3[1])[110]
luraph_runtime1(163)
luraph_runtime1(163)[128] = 16
luraph_runtime1(163)
luraph_runtime1(163)
error("devirt: symbolic next pc/mode: (T4978_6_1[1][128] Add 1) / 2 (at 2:4978)")
