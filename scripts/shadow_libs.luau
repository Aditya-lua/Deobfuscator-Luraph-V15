local E = env
local type = E.type
local pairs = E.pairs
local ipairs = E.ipairs
local concat = E.table.concat
local rprint = E.print
local floor = E.math.floor
local clock = E.os.clock
local counters = {}
local t0 = clock()
local last = 0
local function report(force)
    local total = 0
    for _, v in pairs(counters) do total = total + v end
    if force or total - last >= 1000000 then
        last = total
        local parts = {}
        for k, v in pairs(counters) do
            if v > 0 then parts[#parts + 1] = k .. "=" .. v end
        end
        rprint("PROG t=" .. floor((clock() - t0) * 100) / 100 ..
            " total=" .. total .. " " .. concat(parts, " "))
    end
end
local function wraplib(libname, members)
    local orig = E[libname]
    if type(orig) ~= "table" then return end
    local shadow = {}
    for k, v in pairs(orig) do shadow[k] = v end
    for _, mname in ipairs(members) do
        local fn = orig[mname]
        if type(fn) == "function" then
            counters[mname] = 0
            shadow[mname] = function(...)
                local c = counters[mname] + 1
                counters[mname] = c
                if c % 1000000 == 0 then report(true) end
                return fn(...)
            end
        end
    end
    E[libname] = shadow
    if type(E._G) == "table" then E._G[libname] = shadow end
end
wraplib("string", {"byte", "sub", "char", "format", "find", "gsub", "rep"})
wraplib("buffer", {"readu8", "readi8", "readu16", "readu32", "readf32", "tostring", "fromstring", "readstring", "writestring", "create", "copy"})
wraplib("bit32", {"band", "bxor", "bnot", "rshift", "lshift", "rrotate", "lrotate", "countlz", "countrz"})
wraplib("table", {"insert", "concat", "clone", "create", "remove", "find"})
wraplib("math", {"floor", "ceil", "fmod", "modf", "abs"})
report(true)
rprint("PROG wrappers armed")
