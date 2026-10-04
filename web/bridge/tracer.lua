--[[ Luraph Deobfuscator — executor bridge tracer (Milestone 1)

  Runs the target script in YOUR real, key-redeemed session, hooks the points
  where obfuscated loaders reveal their real stages (loadstring, HttpGet,
  request), and streams each captured stage to your collector, which
  deobfuscates it automatically.

  Served by /bridge/boot with COLLECTOR / TOKEN / SID injected. Written for
  Delta (Android) but feature-detects, so it degrades on other executors.

  Usage after this is loaded:
     BRIDGE.run("rbxassetid or url or raw source")   -- fetch+run a target, OR
     BRIDGE.run(nil)                                   -- hooks are already live;
                                                          just run your script
     BRIDGE.stop()                                     -- restore all hooks
  Watch results at:  {{COLLECTOR}}/bridge   (enter your token)
]]

local COLLECTOR = "{{COLLECTOR}}"
local TOKEN     = "{{TOKEN}}"
local SID       = "{{SID}}"

-- ---- config / limits (failsafes) ---------------------------------------
local RAW_CHUNK   = 64 * 1024   -- bytes per upload chunk before base64
local MAX_CAPTURES = 32         -- never spam the collector
local CAPTURE_WINDOW = 120      -- seconds hooks stay live before auto-stop

-- ---- services / env ----------------------------------------------------
local HttpService = game:GetService("HttpService")
local genv = (getgenv and getgenv()) or _G

-- resolve an HTTP request function across executors
local httpRequest = (syn and syn.request) or (http and http.request)
  or http_request or request or (fluxus and fluxus.request)
local function hasHttp() return type(httpRequest) == "function" end

-- ---- base64 ------------------------------------------------------------
local b64chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
local function b64(data)
  return ((data:gsub('.', function(x)
    local r, c = '', x:byte()
    for i = 8, 1, -1 do r = r .. (c % 2 ^ i - c % 2 ^ (i - 1) > 0 and '1' or '0') end
    return r
  end) .. '0000'):gsub('%d%d%d?%d?%d?%d?', function(x)
    if #x < 6 then return '' end
    local c = 0
    for i = 1, 6 do c = c + (x:sub(i, i) == '1' and 2 ^ (6 - i) or 0) end
    return b64chars:sub(c + 1, c + 1)
  end) .. ({ '', '==', '=' })[#data % 3 + 1])
end

-- cheap content fingerprint, to not upload the same stage twice
local function fp(s)
  local n, step = #s, math.max(1, math.floor(#s / 64))
  local h = n
  for i = 1, n, step do h = (h * 131 + s:byte(i)) % 2 ^ 32 end
  return tostring(n) .. ":" .. tostring(h)
end

-- ---- uploader ----------------------------------------------------------
local capCount, seen, stopped = 0, {}, false

local function post(path, bodyTbl)
  if not hasHttp() then return false end
  local ok, res = pcall(httpRequest, {
    Url = COLLECTOR .. path,
    Method = "POST",
    Headers = { ["Content-Type"] = "application/json", ["X-Bridge-Token"] = TOKEN },
    Body = HttpService:JSONEncode(bodyTbl),
  })
  return ok and res and (res.StatusCode or res.status or 200) < 300
end

-- send one captured stage in ordered base64 chunks
local function upload(kind, url, data)
  if stopped or type(data) ~= "string" or #data == 0 then return end
  local f = fp(data)
  if seen[f] then return end
  seen[f] = true
  capCount = capCount + 1
  if capCount > MAX_CAPTURES then return end
  local cap = SID .. "-" .. tostring(capCount)
  local total = math.max(1, math.ceil(#data / RAW_CHUNK))
  for seq = 0, total - 1 do
    local part = data:sub(seq * RAW_CHUNK + 1, (seq + 1) * RAW_CHUNK)
    local okSent = post("/bridge/ingest", {
      sid = SID, cap = cap, kind = kind, url = url or "",
      seq = seq, total = total, data = b64(part),
    })
    if not okSent then
      warn("[bridge] upload failed for " .. cap .. " chunk " .. seq)
      break
    end
  end
  print(("[bridge] captured %s (%d bytes) %s"):format(kind, #data, url ~= "" and ("<" .. url .. ">") or ""))
end
-- expose for the hooks and manual use
genv.__BRIDGE_UPLOAD = upload

-- ---- hooks -------------------------------------------------------------
local restores = {}
local function wrap(fn) return (newcclosure and newcclosure(fn)) or fn end

local function hookLoadstring()
  if type(loadstring) ~= "function" or not hookfunction then return end
  local orig
  orig = hookfunction(loadstring, wrap(function(src, chunkname)
    if type(src) == "string" then pcall(upload, "loadstring", "", src) end
    return orig(src, chunkname)
  end))
  restores[#restores + 1] = function() pcall(hookfunction, loadstring, orig) end
end

local function hookRequest()
  if type(httpRequest) ~= "function" or not hookfunction then return end
  local orig
  orig = hookfunction(httpRequest, wrap(function(opts)
    local res = orig(opts)
    pcall(function()
      local u = (type(opts) == "table" and opts.Url) or ""
      local body = res and (res.Body or res.body)
      if type(body) == "string" then upload("request", u, body) end
    end)
    return res
  end))
  restores[#restores + 1] = function() pcall(hookfunction, httpRequest, orig) end
end

local function hookHttpGet()
  if not (hookmetamethod and getnamecallmethod) then return end
  local orig
  orig = hookmetamethod(game, "__namecall", wrap(function(self, ...)
    local url = (...) -- first arg (the URL for HttpGet); captured out of vararg
    local res = orig(self, ...)
    pcall(function()
      local m = getnamecallmethod()
      if (m == "HttpGet" or m == "HttpGetAsync") and type(res) == "string" then
        upload("httpget", type(url) == "string" and url or "", res)
      end
    end)
    return res
  end))
  restores[#restores + 1] = function() pcall(hookmetamethod, game, "__namecall", orig) end
end

local function installHooks()
  pcall(hookLoadstring)
  pcall(hookRequest)
  pcall(hookHttpGet)
end

-- ---- public API --------------------------------------------------------
local BRIDGE = {}

function BRIDGE.stop()
  stopped = true
  for _, r in ipairs(restores) do pcall(r) end
  restores = {}
  print("[bridge] hooks restored; session " .. SID)
end

function BRIDGE.run(target)
  if type(target) == "string" and target ~= "" then
    local src
    if target:match("^rbxassetid://") or target:match("^https?://") then
      local ok, body = pcall(function() return game:HttpGet(target) end)
      if ok then src = body else warn("[bridge] fetch failed: " .. tostring(body)) end
    else
      src = target -- raw source
    end
    if src then
      local fn, err = loadstring(src)
      if fn then pcall(fn) else warn("[bridge] loadstring failed: " .. tostring(err)) end
    end
  end
end

genv.BRIDGE = BRIDGE

-- auto-stop after the capture window so nothing lingers
task.delay(CAPTURE_WINDOW, function() if not stopped then BRIDGE.stop() end end)

installHooks()
print("========================================")
print("[bridge] tracer live. session: " .. SID)
print("[bridge] now run your target script, or BRIDGE.run(\"<url/source>\")")
print("[bridge] results: " .. COLLECTOR .. "/bridge  (token required)")
print("========================================")
