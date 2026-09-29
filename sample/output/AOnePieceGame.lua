repeat
	task.wait()
until game:IsLoaded()

loadstring(game:HttpGet("https://raw.githubusercontent.com/Luraph/macrosdk/main/luraphsdk.lua"))()

if not ({ [3213362013] = true, [10642702105] = true })[game.GameId] then
	return
end

local bindableFunction = Instance.new("BindableFunction")

sendPopup = function(arg, arg2)
	game:GetService("StarterGui"):SetCore("SendNotification", { Title = "AOPG Script", Text = arg, Duration = arg2, Callback = bindableFunction, Button1 = "Reset Check?" })
end

bindableFunction.OnInvoke = function(arg)
	if arg == "Reset Check?" then
		getgenv().SixFootCheck = nil
		print("you may now re-execute the script")
		game:GetService("StarterGui"):SetCore("SendNotification", { Title = "AOPG Script", Text = "You may now re-execute the script", Duration = 10 })
	end
end

if getgenv().SixFootCheck then
	warn("Already excecuted script!")
	sendPopup("Already excecuted script!", 10)
	return
end

getgenv().SixFootCheck = true

repeat
	task.wait()
until game:GetService("Players").LocalPlayer

repeat
	task.wait()
until game:GetService("Players").LocalPlayer.Character

task.spawn(function()
	game:GetService("Players").LocalPlayer.Idled:connect(function()
		game:GetService("VirtualUser"):Button2Down(Vector2.new(0, 0), game:GetService("Workspace").CurrentCamera.CFrame)
		task.wait()
		game:GetService("VirtualUser"):Button2Up(Vector2.new(0, 0), game:GetService("Workspace").CurrentCamera.CFrame)
	end)
end)

local str = "A0nePieceGame"
local flag = false
os.time()

local fn = cloneref or function(arg)
	return arg
end

local obj = setmetatable({}, { __index = function(arg, arg2)
	return fn(game:GetService(arg2))
end })

local localPlayer = obj.Players.LocalPlayer
localPlayer:GetMouse()
local response = game:HttpGet("https://raw.githubusercontent.com/SlamminPig/6FootScripts/main/Utilities/DiscordServer.txt")
local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/SlamminPig/6FootScripts/main/Utilities/Linoria/Library.lua"))()
local lib2 = loadstring(game:HttpGet("https://raw.githubusercontent.com/SlamminPig/6FootScripts/main/Utilities/Linoria/SaveManager.lua"))()
local lib3 = loadstring(game:HttpGet("https://raw.githubusercontent.com/SlamminPig/6FootScripts/main/Utilities/Linoria/ThemeManager.lua"))()
local lib4 = loadstring(game:HttpGet("https://raw.githubusercontent.com/Quenty/NevermoreEngine/version2/Modules/Shared/Events/Maid.lua"))()
local lib5 = loadstring(game:HttpGet("https://raw.githubusercontent.com/SlamminPig/6FootScripts/main/Utilities/ESP/KiriotEspDrawingLibrary.lua"))()
local v_ = lib4.new()
local v_2 = lib4.new()

if not (syn and syn.crypt and syn.crypt.base64 and syn.crypt.base64.encode(tostring(localPlayer.UserId / 2 + 1337))) then
	if isfluxusclosure then
		crypt.base64.encode(tostring(localPlayer.UserId / 2 + 1337))
	end
end

local flag2 = false
local tbl = {}

local tbl2 = {
	FirstSea = 8396586868,
	SecondSea = 9432106399,
	ThirdSea = 12697622192,
	MultiverseSea = 11216777504,
}

local str2 = tostring(game.PlaceId)

for k, v_3 in pairs(tbl2) do
	if v_3 == game.PlaceId then
		str2 = k
		break
	end
end

countDictionary = function(arg)
	local n = 0

	for k in pairs(arg) do
		n += 1
	end

	return n
end

StringToCFrame = function(arg)
	local v_3 = string.split(arg, ",")
	return CFrame.new(v_3[1], v_3[2], v_3[3], v_3[4], v_3[5], v_3[6], v_3[7], v_3[8], v_3[9], v_3[10], v_3[11], v_3[12])
end

returnPones = function()
	return pones ~= "" and game:GetService("HttpService"):JSONDecode("{\"SecondSea\":{\"Pirate Paradise\":[\"5464, 197, -83, -1, 0, 0, 0, 1, 0, 0, 0, -1\",\"5124.88672, -41.2876129, -428.781036, -1, 0, 0, 0, 1, 0, 0, 0, -1\",\"6034.14795, 127.903397, -326.562531, -1, 0, 0, 0, 1, 0, 0, 0, -1\",\"6082.26465, 710.253296, -73.0371399, -0.996191859, 0, 0.0871884301, 0, 1, 0, -0.0871884301, 0, -0.996191859\"],\"Enies Lobby\":[\"-1370.94482, -29.2272339, -1694.37732, -1, 0, 0, 0, 1, 0, 0, 0, -1\",\"-2342.31689, 82.0610199, -1782.16016, -1, 0, 0, 0, 1, 0, 0, 0, -1\",\"-2864.45825, 20.4661484, -1434.75281, -0.766061664, 0, 0.642767608, 0, 1, 0, -0.642767608, 0, -0.766061664\",\"-3136.69482, -29.2211685, -1957.35486, -1, 0, 0, 0, 1, 0, 0, 0, -1\",\"-2626.05762, -29.1325474, -1777.31628, -1, 0, 0, 0, 1, 0, 0, 0, -1\"],\"Zou Island\":[\"-734.539246, -8.64420319, 1559.76636, -1, 0, 0, 0, 1, 0, 0, 0, -1\",\"-931.40918, 67.8609924, 1350.77429, -1, 0, 0, 0, 1, 0, 0, 0, -1\",\"-1238.90271, -8.64479065, 1174.15845, -1, 0, 0, 0, 1, 0, 0, 0, -1\",\"-812.597229, 31.8940582, 1091.42834, -1, 0, 0, 0, 1, 0, 0, 0, -1\",\"-948.964905, 71.714119, 1507.29199, -1, 0, 0, 0, 1, 0, 0, 0, -1\"],\"Unknown\":[\"-931.40918, 67.8609924, 1350.77429, -1, 0, 0, 0, 1, 0, 0, 0, -1\",\"5709.21338, 81.6560059, 5188.06738, -0.985526085, 0, 0.169523939, 0, 1, 0, -0.169523939, 0, -0.985526085\",\"-1842.31482, 82.0610352, -1776.16016, -1, 0, 0, 0, 1, 0, 0, 0, -1\",\"-2626.05762, -29.1325474, -1777.31628, -1, 0, 0, 0, 1, 0, 0, 0, -1\",\"5941.21924, 127.903389, 155.835358, -1, 0, 0, 0, 1, 0, 0, 0, -1\",\"31856.6172, 37.3150063, 2455.01196, -1, 0, 0, 0, 1, 0, 0, 0, -1\",\"5124.88672, -41.2876129, -428.781036, -1, 0, 0, 0, 1, 0, 0, 0, -1\",\"5830.92725, 332.814575, 5468.24268, -0.985526085, 0, 0.169523939, 0, 1, 0, -0.169523939, 0, -0.985526085\",\"-948.964905, 71.714119, 1507.29199, -1, 0, 0, 0, 1, 0, 0, 0, -1\",\"30649, 63, 2222, -1, 0, 0, 0, 1, 0, 0, 0, -1\",\"5445.86426, 85.7601318, 5804.28223, -0.985526085, 0, 0.169523939, 0, 1, 0, -0.169523939, 0, -0.985526085\",\"5313.66553, 74.6766663, 5503.63184, -0.985526085, 0, 0.169523939, 0, 1, 0, -0.169523939, 0, -0.985526085\",\"-1238.90271, -8.64479065, 1174.15845, -1, 0, 0, 0, 1, 0, 0, 0, -1\",\"5464, 197, -83, -1, 0, 0, 0, 1, 0, 0, 0, -1\",\"5825, 348, -98, -1, 0, 0, 0, 1, 0, 0, 0, -1\",\"5471.66309, 98.2468109, 5043.60352, -0.967002988, 0, 0.254766345, 0, 1, 0, -0.254766345, 0, -0.967002988\",\"31206.3613, 110.800812, 1499.78394, -1, 0, 0, 0, 1, 0, 0, 0, -1\",\"-2864.45825, 20.4661484, -1434.75281, -0.766061664, 0, 0.642767608, 0, 1, 0, -0.642767608, 0, -0.766061664\",\"-1370.94482, -29.2272339, -1694.37732, -1, 0, 0, 0, 1, 0, 0, 0, -1\",\"32471.9023, 27.5455017, 1977.37671, -1, 0, 0, 0, 1, 0, 0, 0, -1\",\"-734.539246, -8.64420319, 1559.76636, -1, 0, 0, 0, 1, 0, 0, 0, -1\",\"31485.7969, 115.228592, 1058.39575, -1, 0, 0, 0, 1, 0, 0, 0, -1\",\"-2342.31689, 82.0610199, -1782.16016, -1, 0, 0, 0, 1, 0, 0, 0, -1\",\"6082.26465, 710.253296, -73.0371399, -0.996191859, 0, 0.0871884301, 0, 1, 0, -0.0871884301, 0, -0.996191859\",\"31432.5059, -42.3295898, 1286.57629, -1, 0, 0, 0, 1, 0, 0, 0, -1\",\"-3136.69482, -29.2211685, -1957.35486, -1, 0, 0, 0, 1, 0, 0, 0, -1\",\"-812.597229, 31.8940582, 1091.42834, -1, 0, 0, 0, 1, 0, 0, 0, -1\",\"6034.14795, 127.903397, -326.562531, -1, 0, 0, 0, 1, 0, 0, 0, -1\"],\"Onigashima\":[\"32471.9023, 27.5455017, 1977.37671, -1, 0, 0, 0, 1, 0, 0, 0, -1\",\"31432.5059, -42.3295898, 1286.57629, -1, 0, 0, 0, 1, 0, 0, 0, -1\",\"31206.3613, 110.800812, 1499.78394, -1, 0, 0, 0, 1, 0, 0, 0, -1\",\"31485.7969, 115.228592, 1058.39575, -1, 0, 0, 0, 1, 0, 0, 0, -1\",\"30649, 63, 2222, -1, 0, 0, 0, 1, 0, 0, 0, -1\"],\"Dressrosa\":[\"5830.92725, 332.814575, 5468.24268, -0.985526085, 0, 0.169523939, 0, 1, 0, -0.169523939, 0, -0.985526085\",\"5445.86426, 85.7601318, 5804.28223, -0.985526085, 0, 0.169523939, 0, 1, 0, -0.169523939, 0, -0.985526085\"]},\"ThirdSea\":{\"New Zou\":[\"-1373.10315, 25846.5723, 7747.7417, 1, 0, -0, 0, 0, 1, 0, -1, 0\"]},\"FirstSea\":{\"Skypiea\":[\"1233.80542, 7250.25586, 2520.96509, -1, 0, 0, 0, 1, 0, 0, 0, -1\",\"1206.73462, 7248.69434, 863.601807, -1, 0, 0, 0, 1, 0, 0, 0, -1\"],\"Logue Town\":[\"-3828.01953, -33.0424805, 342.285461, -1, 0, 0, 0, 1, 0, 0, 0, -1\"],\"Punk Hazard\":[\"10035.0518, -40.2158203, -1611.84753, -1, 0, 0, 0, 1, 0, 0, 0, -1\",\"9679.71484, 36.0805664, -2758.51343, -0.866007447, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, -0.866007447\"],\"Dawn Island\":[\"-4947.48535, -49.9223633, -1549.83386, -1, 0, 0, 0, 1, 0, 0, 0, -1\"],\"Ice Island\":[\"-1577, 94, 654\",\"-494.211914, 1.02050781, 79.4419403, -0.996191859, 0, -0.0871884301, 0, 1, 0, 0.0871884301, 0, -0.996191859\",\"-1446.1908, 53.4936523, -39.947113, -0.766061664, 0, -0.642767608, 0, 1, 0, 0.642767608, 0, -0.766061664\",\"-626.49231, -32.3393555, -339.925385, -0.996191859, 0, -0.0871884301, 0, 1, 0, 0.0871884301, 0, -0.996191859\"],\"Unknown\":[\"1419.48169, 7208.81934, 2087.62305, -1, 0, 0, 0, 1, 0, 0, 0, -1\",\"-3828.01953, -33.0424805, 342.285461, -1, 0, 0, 0, 1, 0, 0, 0, -1\",\"9772.51172, 36.0805664, -2354.61401, -0.866007447, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, -0.866007447\",\"-1446.1908, 53.4936523, -39.947113, -0.766061664, 0, -0.642767608, 0, 1, 0, 0.642767608, 0, -0.766061664\",\"1206.73462, 7248.69434, 863.601807, -1, 0, 0, 0, 1, 0, 0, 0, -1\",\"10035.0518, -40.2158203, -1611.84753, -1, 0, 0, 0, 1, 0, 0, 0, -1\",\"9410.05273, -40.2158203, -1529.77612, -1, 0, 0, 0, 1, 0, 0, 0, -1\",\"-4947.48535, -49.9223633, -1549.83386, -1, 0, 0, 0, 1, 0, 0, 0, -1\",\"-494.211914, 1.02050781, 79.4419403, -0.996191859, 0, -0.0871884301, 0, 1, 0, 0.0871884301, 0, -0.996191859\",\"-479.062012, 334.365723, -4656.29492, -1, 0, 0, 0, 1, 0, 0, 0, -1\",\"1233.80542, 7250.25586, 2520.96509, -1, 0, 0, 0, 1, 0, 0, 0, -1\",\"-475.250244, 54.9707031, -4174.62402, -1, 0, 0, 0, 1, 0, 0, 0, -1\",\"-626.49231, -32.3393555, -339.925385, -0.996191859, 0, -0.0871884301, 0, 1, 0, 0.0871884301, 0, -0.996191859\",\"-750.169556, 4.21142578, -4796.40723, -1, 0, 0, 0, 1, 0, 0, 0, -1\",\"9679.71484, 36.0805664, -2758.51343, -0.866007447, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, -0.866007447\"],\"Marineford\":[\"-475.250244, 54.9707031, -4174.62402, -1, 0, 0, 0, 1, 0, 0, 0, -1\",\"-750.169556, 4.21142578, -4796.40723, -1, 0, 0, 0, 1, 0, 0, 0, -1\",\"-479.062012, 334.365723, -4656.29492, -1, 0, 0, 0, 1, 0, 0, 0, -1\"]}}") or {}
end

isKrampus = function()
	if identifyexecutor then
		if string.find(identifyexecutor(), "Krampus") then
			return true
		end

		if string.find(identifyexecutor(), "Delta") then
			return true
		end
	end
end

local tbl3 = {}

if writefile and readfile and makefolder and isfile and isfolder then
	if isfolder("6Foot4Honda's_Scripts/") and isfile("6Foot4Honda's_Scripts/" .. str .. "Data/" .. str .. "Data.txt") then
		if pcall(function()
			tbl3 = obj.HttpService:JSONDecode(readfile("6Foot4Honda's_Scripts/" .. str .. "Data/" .. str .. "Data.txt"))
		end) then
			lib:Notify("Found storage file..")
		else
			tbl3 = {}
			writefile("6Foot4Honda's_Scripts/" .. str .. "Data/" .. str .. "Data.txt", "")
			lib:Notify("Erased corrupted storage file..", 10)
		end
	else
		tbl3 = {}

		if isKrampus() then
			makefolder("6Foot4Honda's_Scripts")
			makefolder("6Foot4Honda's_Scripts/" .. str .. "Data")
			writefile("6Foot4Honda's_Scripts/" .. str .. "Data/" .. str .. "Data.txt", "")
			lib:Notify("Creating storage file..")
		else
			makefolder("6Foot4Honda's_Scripts/")
			writefile("6Foot4Honda's_Scripts/" .. str .. "Data/" .. str .. "Data.txt", "")
			lib:Notify("Creating storage file..")
		end
	end
else
	tbl3 = {}
	lib:Notify("Saving not available..")
end

local tbl4 = {}

if isfolder("6Foot4Honda's_Scripts/") and isfile("6Foot4Honda's_Scripts/settings/6FootHubData.txt") then
	if not pcall(function()
		tbl4 = obj.HttpService:JSONDecode(readfile("6Foot4Honda's_Scripts/settings/6FootHubData.txt"))
	end) then
		tbl4 = {}
		writefile("6Foot4Honda's_Scripts/settings/6FootHubData.txt", "")
		lib:Notify("Erasing corrupted hub data file", 10)
	end
else
	tbl4 = {}

	if isKrampus() then
		makefolder("6Foot4Honda's_Scripts/")
		makefolder("6Foot4Honda's_Scripts/settings")
		writefile("6Foot4Honda's_Scripts/settings/6FootHubData.txt", "")
	else
		makefolder("6Foot4Honda's_Scripts/")
		writefile("6Foot4Honda's_Scripts/settings/6FootHubData.txt", "")
	end
end

lib2:SetLibrary(lib)
lib3:SetLibrary(lib)
lib2:SetFolder("6Foot4Honda's_Scripts/" .. str .. "Data/")
lib3:SetFolder("6Foot4Honda's_Scripts/")
lib2:IgnoreThemeSettings()

saveSettings = function()
	if writefile and readfile and makefolder and isfile and isfolder then
		writefile("6Foot4Honda's_Scripts/" .. str .. "Data/" .. str .. "Data.txt", obj.HttpService:JSONEncode(tbl3))
	end
end

saveHubSettings = function()
	if writefile and readfile and makefolder and isfile and isfolder then
		writefile("6Foot4Honda's_Scripts/settings/6FootHubData.txt", obj.HttpService:JSONEncode(tbl4))
	end
end

checkInstance = function()
	return obj.TeleportService:GetLocalPlayerTeleportData() and obj.TeleportService:GetLocalPlayerTeleportData().RaidBoss or nil
end

returnExploit = function()
	if getgenv().identifyexecutor then
		if string.find(tostring(identifyexecutor()):lower(), "macsploit") then
			return " | Macsploit"
		end
		return " | " .. identifyexecutor()
	end

	return " "
end

if getconnections then
	local v_3 = next
	local v_4, v_5 = getconnections(localPlayer.Idled)

	for _, v_6 in v_3, v_4, v_5 do
		v_6:Disable()
	end
end

localPlayer.Idled:connect(function()
	obj.VirtualUser:Button2Down(Vector2.new(0, 0), Workspace.CurrentCamera.CFrame)
	task.wait(1)
	obj.VirtualUser:Button2Up(Vector2.new(0, 0), Workspace.CurrentCamera.CFrame)
end)

if localPlayer:FindFirstChild("PlayerGui") and localPlayer.PlayerGui:FindFirstChild("Introduction") then
	localPlayer.PlayerGui.Introduction:Destroy()
end

lib5.Players = false
lib5.AutoRemove = true
lib5.TeamColor = true
lib5.Names = true
lib5.Boxes = false
lib5:Toggle(true)
localPlayer.CameraMaxZoomDistance = 2e9
localPlayer.DevCameraOcclusionMode = "Invisicam"
local quests2 = localPlayer:FindFirstChild("Quests2")
require(obj.ReplicatedStorage.Modules.Client.Notifications)
local module = nil

if getloadedmodules then
	for _, v_3 in pairs(getloadedmodules()) do
		if v_3.Name == "Quests" then
			module = require(v_3)
			break
		end
	end
end

task.spawn(function(...) end)
print(string.format("Quests %s", module and "found" or "not found uh oh"))

mobQuestExists = function(arg)
	if not module then
		return
	end

	if countDictionary(module) == 0 then
		return false
	end

	for _, v_3 in pairs(module) do
		if typeof(v_3) ~= "table" then
			continue
		end

		for _, v_4 in pairs(v_3) do
			if v_4.Targets[arg] then
				return true
			end
		end
	end
end

require(obj.ReplicatedStorage.Modules.Shared.Database.FruitData)
local GlobalFunctions2 = require(obj.ReplicatedStorage.GlobalFunctions2)
local Settings = require(obj.ReplicatedStorage.Modules.Shared.Database.Settings)
localPlayer:WaitForChild("States")
localPlayer:WaitForChild("Stats")
localPlayer:WaitForChild("Upgrades")
localPlayer.Stats:WaitForChild("Beli")
local states = localPlayer:FindFirstChild("States")
local stats = localPlayer:FindFirstChild("Stats")
local extra = localPlayer:FindFirstChild("Extra")
local upgrades = localPlayer:FindFirstChild("Upgrades")
local unlockables = localPlayer:FindFirstChild("Unlockables")
local str3 = "Cleared"
local n = 1000
local n2 = 35000
local flag3 = false
local flag4 = false
local flag5 = false
local flag6 = false
local Keybinds = require(game.ReplicatedStorage.Modules.Shared.Database.Keybinds)
local tbl5 = { "Strength", "Stamina", "Defence", "Sword", "Gun", "Haki", "Fruit" }

local tbl6 = {
	AttackMarineHQ_Fisherman = false,
	AttackMarineHQ_FindKey = false,
	AttackMarineHQ_FreedPirate = false,
}

local tbl7 = {}
local tbl8 = {}
local tbl9 = { 9264222904, 9572329421, 9812430518, 11287074228 }
local values = {}
local tbl10 = {}
local values2 = {}
local tbl11 = {}
local values3 = {}
local tbl12 = {}
local tbl13 = {}
local tbl14 = {}
local tbl15 = {}
local tbl16 = { "No Teleport", "First Sea", "Second Sea", "Third Sea", "Multiverse Sea" }
local tbl17 = {}
local tbl18 = { "Human", "Saiyan", "Santa" }
local tbl19 = {}
local tbl20 = { "Quake Scroll", "Island Tracker" }

local tbl21 = {
	"Portable Storage",
	"Flintlock",
	"Dual Flintlock",
	"Suzaku",
	"Suzaku and Kitetsu",
	"Suzaku and Kitetsu and Mugenjin",
	"Melee",
	"Electro",
	"Fishman Karate",
	"Black Leg",
	"True Black Leg",
	"Island Tracker",
	"True Santoryu",
	"Rokushiki",
	"Ice Bike",
	"Fire Dragon Key",
}

tbl3.blacklistedItems = tbl3.blacklistedItems or {}
tbl3.worldBosses = tbl3.worldBosses or {}
tbl3.Raids = tbl3.Raids or { "AttackMarineHQ" }
tbl3.Mazes = tbl3.Mazes or {}
tbl3.Dungeons = tbl3.Dungeons or {}
tbl3.Labyrinths = tbl3.Labyrinths or {}
tbl3.raidCounter = tbl3.raidCounter or {}
tbl3.raidCounter.Raids = tbl3.raidCounter.Raids or {}
tbl3.raidCounter.Mazes = tbl3.raidCounter.Mazes or {}
tbl3.raidCounter.Dungeons = tbl3.raidCounter.Dungeons or {}
tbl3.raidCounter.Labyrinths = tbl3.raidCounter.Labyrinths or {}
local backpack = localPlayer:FindFirstChild("Backpack")
local remotes = obj.ReplicatedStorage:FindFirstChild("Remotes")

if getgc then
	for _, v_3 in pairs(getgc(true)) do
		if type(v_3) == "table" and rawget(v_3, "Trainee Swordsman") and rawget(v_3, "Asura") then
			for k in pairs(v_3) do
				if k ~= "" and not table.find(tbl19, k) then
					table.insert(tbl19, k)
				end
			end
		end
	end
else
	tbl19 = {
		"Swordsman",
		"Sniper",
		"Devil Fruit User",
		"Merchant",
		"Gem Merchant",
		"Trainee Swordsman",
		"Trainee Sniper",
		"Skilled Devil Fruit User",
		"Strong",
		"Advanced Swordsman",
		"Advanced Sniper",
		"Powerful Devil Fruit User",
		"Banker",
		"Brawler",
		"Prodigy",
		"Risk Taker",
		"Water Walker",
		"Ruler Of The Skies",
		"Asura",
		"Master Swordsman",
		"Sharpshooter",
		"Devil Sent",
		"Blindseer",
		"All-Seeing",
		"Tank",
		"Airborne",
		"Light Speed",
		"Samurai",
		"Deadeye",
		"The Worst Generation",
		"Dark Prince",
		"Marked For Death",
		"Mad Scientist",
		"Life On The Edge",
		"King Of Hell",
		"King of the Beasts",
		"Curse Of The Sea",
		"Red Hair",
		"Blood Scourge",
		"Wanos Protector",
		"Scorching Revolutionary",
		"The World's Strongest Swordsman",
		"I Don't Miss",
		"King Of The Pirates",
		"Clover",
		"Government's Puppet",
		"Hero Of Marines",
	}
end

table.sort(tbl19)

for _, child in pairs(obj.ReplicatedStorage.Assets.Races:GetChildren()) do
	if child:IsA("Folder") and not table.find(tbl18, child.Name) then
		table.insert(tbl18, child.Name)
	end
end

local gamePlacesAsync = obj.AssetService:GetGamePlacesAsync()

task.spawn(function()
	while true do
		for _, v_3 in pairs(gamePlacesAsync:GetCurrentPage()) do
			if not table.find(tbl15, v_3.Name) then
				tbl15[v_3.Name] = v_3.PlaceId
			end

			if not table.find(tbl14, v_3.Name) then
				table.insert(tbl14, v_3.Name)
			end
		end

		if not gamePlacesAsync.IsFinished then
			gamePlacesAsync:AdvanceToNextPageAsync()
			continue
		end
		break
	end

	table.sort(tbl14)
end)

for _, child in pairs(localPlayer.Inventory:GetChildren()) do
	if not table.find(tbl11, child.Name) then
		tbl11[child.Name] = child.Value
	end

	child:GetPropertyChangedSignal("Value"):Connect(function()
		if not flag then
			if Toggles.loopBuyFruit.Value and Options.spinningFruits.Value[child.Name] and Toggles.stopSpinningFruits.Value then
				Toggles.loopBuyFruit:SetValue(false)
				lib:Notify("Spinning stopped for " .. child.Name .. "!", 5)
				sendMessage("Spinning stopped for " .. child.Name .. "!", 1)
			end

			if Toggles.infoItems and Toggles.infoItems.Value and child.Value > tbl11[child.Name] then
				if Toggles.whitelistedItems and Toggles.whitelistedItems.Value then
					if Options.pickedWhitelistedItem.Value and table.find(Options.pickedWhitelistedItem:GetActiveValues(), child.Name) then
						newItem(child.Name, "increased", child.Value)
						tbl11[child.Name] = child.Value
					end
				else
					newItem(child.Name, "increased", child.Value)
					tbl11[child.Name] = child.Value
				end
			end
		end
	end)
end

for _, child in pairs(obj.ReplicatedStorage["Fruit Models"]:GetChildren()) do
	if not table.find(tbl17, child.Name) then
		table.insert(tbl17, child.Name)
	end
end

for _, child in pairs(obj.ReplicatedStorage.Assets.Tools:GetChildren()) do
	if not table.find(tbl17, child.Name) then
		table.insert(tbl17, child.Name)
	end
end

for _, child in pairs(obj.ReplicatedStorage:GetChildren()) do
	if child:IsA("Model") and child:FindFirstChild("HumanoidRootPart") and child:FindFirstChild("Data") and not table.find(values, child.Name) then
		table.insert(values, child.Name)
	end
end

for _, child in pairs(obj.Workspace.Entities:GetChildren()) do
	if child:IsA("Model") and child:FindFirstChild("HumanoidRootPart") and child:FindFirstChild("Data") and not table.find(values, child.Name) then
		table.insert(values, child.Name)
	end
end

if Workspace:FindFirstChild("Visuals") then
	if Workspace.Visuals:FindFirstChild("Seabeast") and #Workspace.Visuals.Seabeast:GetChildren() > 0 then
		table.insert(values, "Sea Beast")
	end

	for _, child in pairs(Workspace.Visuals.Spawners:GetChildren()) do
		if not table.find(values, child.Name) then
			table.insert(values, child.Name)
		end
	end

	if Workspace.Visuals:FindFirstChild("World Boss") then
		for _, child in pairs(Workspace.Visuals["World Boss"]:GetChildren()) do
			if child:IsA("Folder") then
				if not table.find(values, child.Name) then
					table.insert(values, child.Name)
				end

				if not table.find(values, "Whitebeard Awakened") then
					table.insert(values, "Whitebeard Awakened")
				end

				if not table.find(tbl3.worldBosses, child.Name) then
					table.insert(tbl3.worldBosses, child.Name)
				end

				if not table.find(tbl3.worldBosses, "Whitebeard Awakened") then
					table.insert(tbl3.worldBosses, "Whitebeard Awakened")
				end
			end
		end
	end

	if Workspace.Visuals:FindFirstChild("Special") then
		for _, child in pairs(Workspace.Visuals.Special:GetChildren()) do
			if not table.find(values, child.Name) and child:IsA("Folder") then
				table.insert(values, child.Name)
			end
		end
	end
end

for _, child in pairs(obj.ReplicatedStorage.Modules.Client.SFX["Devil Fruits"]:GetChildren()) do
	if string.find(child.Name, "Fruit") and not string.find(child.Name:lower(), "v2") and not string.find(child.Name:lower(), "awakened") then
		table.insert(tbl10, child.Name)
	end
end

for _, child in pairs(localPlayer.Backpack:GetChildren()) do
	if child:IsA("Tool") then
		if not table.find(values2, child.Name) then
			table.insert(values2, child.Name)
		end
	end
end

for _, player in pairs(obj.Players:GetPlayers()) do
	if not table.find(values3, player.DisplayName) then
		table.insert(values3, player.DisplayName)
	end
end

for _, child in pairs(Workspace.Map.Islands:GetChildren()) do
	table.insert(tbl12, child.Name)
end

if Workspace:FindFirstChild("Zones") then
	for _, child in pairs(Workspace.Zones:GetChildren()) do
		if not table.find(tbl3.Raids, child.Name) then
			table.insert(tbl3.Raids, child.Name)
		end
	end
end

if Workspace:FindFirstChild("MazeZones") then
	for _, child in pairs(Workspace.MazeZones:GetChildren()) do
		if not table.find(tbl3.Mazes, child.Name) then
			table.insert(tbl3.Mazes, child.Name)
		end
	end
end

if Workspace:FindFirstChild("Dungeons") then
	for _, child in pairs(Workspace.Dungeons:GetChildren()) do
		if not table.find(tbl3.Dungeons, child.Name) then
			if child.Name == "Mirror 2" then
				if not table.find(tbl3.Dungeons, "Mirror") then
					table.insert(tbl3.Dungeons, "Mirror")
				end
			else
				table.insert(tbl3.Dungeons, child.Name)
			end
		end
	end
end

if Workspace:FindFirstChild("Labyrinths") then
	for _, child in pairs(Workspace.Labyrinths:GetChildren()) do
		if not table.find(tbl3.Labyrinths, child.Name) then
			table.insert(tbl3.Labyrinths, child.Name)
		end
	end
end

for _, child in pairs(obj.ReplicatedStorage.Assets.Tools:GetChildren()) do
	if not table.find(tbl20, child.Name) and not table.find(tbl21, child.Name) then
		table.insert(tbl20, child.Name)
	end
end

for _, child in pairs(obj.ReplicatedStorage["Fruit Models"]:GetChildren()) do
	if not table.find(tbl20, child.Name) then
		table.insert(tbl20, child.Name)
	end
end

if getgenv().addCustom then
	if addCustom.Mobs and typeof(addCustom.Mobs) == "table" then
		for _, mob in pairs(addCustom.Mobs) do
			if not table.find(values, mob) and mob ~= "" then
				table.insert(values, mob)
				lib:Notify(string.format("Manually added '%s' mob!", mob), 10)
			end
		end
	end

	if addCustom.Titles and typeof(addCustom.Titles) == "table" then
		for _, title in pairs(addCustom.Titles) do
			if not table.find(tbl19, title) and title ~= "" then
				table.insert(tbl19, title)
				lib:Notify(string.format("Manually added '%s' title!", title), 10)
			end
		end
	end

	if addCustom.Races and typeof(addCustom.Races) == "table" then
		for _, race in pairs(addCustom.Races) do
			if not table.find(tbl18, race) and race ~= "" then
				table.insert(tbl18, race)
				lib:Notify(string.format("Manually added '%s' race!", race), 10)
			end
		end
	end

	if addCustom.WebhookWorldBosses and typeof(addCustom.WebhookWorldBosses) == "table" then
		for _, webhookWorldBosse in pairs(addCustom.WebhookWorldBosses) do
			if not table.find(tbl3.worldBosses, webhookWorldBosse) and webhookWorldBosse ~= "" then
				table.insert(tbl3.worldBosses, webhookWorldBosse)
				lib:Notify(string.format("Manually added '%s' World Boss to webhook!", webhookWorldBosse), 10)
			end
		end
	end
end

table.sort(values)
table.sort(tbl20)
table.sort(tbl10)
table.sort(values2)
table.sort(tbl12)
table.sort(tbl19)
table.sort(tbl18)
table.sort(tbl3.worldBosses)
table.sort(tbl3.Raids)
table.sort(tbl3.Mazes)
table.sort(tbl3.Dungeons)
table.sort(tbl3.Labyrinths)

if Workspace.Map.Islands:FindFirstChild("Logue Town") and Workspace.Map.Islands["Logue Town"].Model:FindFirstChild("Trees") then
	Workspace.Map.Islands["Logue Town"].Model.Trees:Destroy()
end

hideFunction = function(arg, ...)
	arg:InvokeServer(unpack({ ... }))
end

hideEvent = function(arg, ...)
	arg:FireServer(unpack({ ... }))
end

touch = function(arg)
	if localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart") and firetouchinterest then
		firetouchinterest(localPlayer.Character.HumanoidRootPart, arg, 0)
		firetouchinterest(localPlayer.Character.HumanoidRootPart, arg, 1)
	end
end

getNumber = function(arg)
	return tonumber(string.match(arg, "%d+"))
end

getUser = function(arg)
	for _, child in pairs(obj.Players:GetChildren()) do
		if child.DisplayName == arg then
			return child
		end
	end
end

getInventory = function()
	local n3

	if Options.playerInventory and Options.playerInventory.Value then
		n3 = 0

		for _, child in pairs(getUser(Options.playerInventory.Value).Inventory:GetChildren()) do
			n3 += child.Value
		end
	else
		n3 = 0

		for _, child in pairs(localPlayer.Inventory:GetChildren()) do
			n3 += child.Value
		end
	end

	return n3
end

totalStats = function()
	local n3 = 0

	for _, v_3 in pairs(tbl5) do
		if localPlayer.Stats:FindFirstChild(v_3) then
			n3 += localPlayer.Stats[v_3].Value
		end
	end

	return n3
end

raidIsland = function()
	local str4

	if Toggles.autoRaid and Toggles.autoRaid.Value and Options.pickedRaid then
		if game.PlaceId == tbl2.FirstSea then
			if Options.pickedRaid.Value == "Christmas" and table.find(tbl12, "Santas Island") then
				str4 = "Santas Island"
			else
				str4 = table.find(tbl12, "Teleport Island") and "Teleport Island" or "Logue Town"
			end
		else
			str4 = nil

			if game.PlaceId == tbl2.SecondSea then
				if Options.pickedRaid.Value == "Big Mom" then
					str4 = "Dawn Island V2"
				else
					str4 = nil

					if Options.pickedRaid.Value == "Aokiji" then
						str4 = "Sengokus Domain"
					end
				end
			end
		end
	elseif Toggles.autoMaze and Toggles.autoMaze.Value and Options.pickedMaze then
		str4 = nil

		if game.PlaceId == tbl2.FirstSea then
			str4 = table.find(tbl12, "Teleport Island") and "Teleport Island" or "Logue Town"
		end
	elseif Toggles.autoDungeon and Toggles.autoDungeon.Value and Options.pickedDungeon then
		if game.PlaceId == tbl2.FirstSea then
			str4 = table.find(tbl12, "Teleport Island") and "Teleport Island" or "Logue Town"
		elseif game.PlaceId == tbl2.SecondSea then
			str4 = "Dawn Island V2"
		elseif game.PlaceId == tbl2.ThirdSea then
			if Options.pickedDungeon.Value == "Light Admirals Battleground" then
				str4 = "Shattered Egghead"
			else
				str4 = "Dawn Island V3"
			end
		else
			str4 = nil

			if game.PlaceId == tbl2.MultiverseSea then
				local flag7 = Options.pickedDungeon.Value == "GojoOne" or Options.pickedDungeon.Value == "GojoTwo"
				str4 = nil

				if flag7 then
					str4 = "Jujutsu"
				end
			end
		end
	else
		local pickedLabyrinth = Toggles.autoLabyrinth and Toggles.autoLabyrinth.Value and Options.pickedLabyrinth
		str4 = nil

		if pickedLabyrinth then
			str4 = nil

			if game.PlaceId == tbl2.FirstSea then
				str4 = table.find(tbl12, "Teleport Island") and "Teleport Island" or "Logue Town"
			end
		end
	end

	return str4
end

checkRaidWaves = function()
	if game.PlaceId == 9264222904 then
		if Options.pickedRaid.Value == "MiHawk" then
			return "40"
		end

		if Options.pickedRaid.Value == "Christmas" then
			return "1"
		end

		if Options.pickedRaid.Value == "Aokiji" then
			return "25"
		end

		if Options.pickedRaid.Value == "Hallow Castle" then
			return "13"
		end
		return "30"
	end

	if game.PlaceId == 9572329421 then
		return "6"
	end

	if game.PlaceId == 9812430518 then
		return "1"
	end
	return "?"
end

whichRaid = function()
	if Toggles.autoRaid.Value then
		return checkInstance() or Options.pickedRaid.Value
	end

	if Toggles.autoMaze.Value then
		return checkInstance() or Options.pickedMaze.Value
	end

	if Toggles.autoDungeon.Value then
		return checkInstance() or Options.pickedDungeon.Value
	end

	if Toggles.autoLabyrinth.Value then
		return checkInstance() or Options.pickedLabyrinth.Value
	end
	return ""
end

raidWebhook = function()
	if Toggles.webhookToggle.Value and Options.webhookUrl.Value and Toggles.infoRaids.Value then
		if not string.find(Options.webhookUrl.Value, "https://discord.com/api/webhooks/") then
			lib:Notify("Webhook url is incorrect")
			return
		end
		formattedLogs = {}

		for k, raid in pairs(tbl3.raidCounter.Raids) do
			if k and not table.find(formattedLogs, "\nRAIDS\n") then
				table.insert(formattedLogs, "\nRAIDS\n")
			end

			if tbl3.raidCounter.Raids[k] and not table.find(formattedLogs, "- " .. k .. ": 0") then
				table.insert(formattedLogs, "- " .. k .. ": " .. raid .. (k ~= #tbl3.raidCounter.Raids and "\n" or ""))
			end
		end

		for k, raid in pairs(tbl3.Raids) do
			if k and not table.find(formattedLogs, "\nRAIDS\n") then
				table.insert(formattedLogs, "\nRAIDS\n")
			end

			if not tbl3.raidCounter.Raids[raid] and not table.find(formattedLogs, "- " .. raid .. ": 0") then
				table.insert(formattedLogs, "- " .. raid .. ": 0" .. (k ~= #tbl3.raidCounter.Raids and "\n" or ""))
				tbl3.raidCounter.Raids[raid] = 0
			end
		end

		for k, maze in pairs(tbl3.raidCounter.Mazes) do
			if k and not table.find(formattedLogs, "\nMAZES\n") then
				table.insert(formattedLogs, "\nMAZES\n")
			end

			if not table.find(formattedLogs, "- " .. k .. ": " .. maze) then
				if tbl3.raidCounter.Mazes[k] then
					table.insert(formattedLogs, "- " .. k .. ": " .. maze .. (k ~= #tbl3.raidCounter.Mazes and "\n" or ""))
				end
			end
		end

		for k, maze in pairs(tbl3.Mazes) do
			if k and not table.find(formattedLogs, "\nMAZES\n") then
				table.insert(formattedLogs, "\nMAZES\n")
			end

			if not tbl3.raidCounter.Mazes[maze] and not table.find(formattedLogs, "- " .. maze .. ": 0") then
				table.insert(formattedLogs, "- " .. maze .. ": 0" .. (k ~= #tbl3.raidCounter.Mazes and "\n" or ""))
				tbl3.raidCounter.Mazes[maze] = 0
			end
		end

		for k, dungeon in pairs(tbl3.raidCounter.Dungeons) do
			if not table.find(formattedLogs, "- " .. k .. ": " .. dungeon) and k ~= "Mirror 2" then
				if tbl3.raidCounter.Dungeons[k] then
					if k and not table.find(formattedLogs, "\nDUNGEONS\n") then
						table.insert(formattedLogs, "\nDUNGEONS\n")
					end

					table.insert(formattedLogs, "- " .. k .. ": " .. dungeon .. (k ~= #tbl3.raidCounter.Dungeons and "\n" or ""))
				end
			end
		end

		for k, dungeon in pairs(tbl3.Dungeons) do
			if not tbl3.raidCounter.Dungeons[dungeon] and dungeon ~= "Mirror 2" and not table.find(formattedLogs, "- " .. dungeon .. ": 0") then
				if k and not table.find(formattedLogs, "\nDUNGEONS\n") then
					table.insert(formattedLogs, "\nDUNGEONS\n")
				end

				table.insert(formattedLogs, "- " .. dungeon .. ": 0" .. (k ~= #tbl3.raidCounter.Dungeons and "\n" or ""))
				tbl3.raidCounter.Dungeons[dungeon] = 0
			end
		end

		for k, labyrinth in pairs(tbl3.raidCounter.Labyrinths) do
			if k and not table.find(formattedLogs, "\nLABYRINTHS\n") then
				table.insert(formattedLogs, "\nLABYRINTHS\n")
			end

			if not table.find(formattedLogs, "- " .. k .. ": " .. labyrinth) then
				if tbl3.raidCounter.Labyrinths[k] then
					table.insert(formattedLogs, "- " .. k .. ": " .. labyrinth .. (k ~= #tbl3.raidCounter.Labyrinths and "\n" or ""))
				end
			end
		end

		for k, labyrinth in pairs(tbl3.Labyrinths) do
			if k and not table.find(formattedLogs, "\nLABYRINTHS\n") then
				table.insert(formattedLogs, "\nLABYRINTHS\n")
			end

			if not tbl3.raidCounter.Labyrinths[labyrinth] and not table.find(formattedLogs, "- " .. labyrinth .. ": 0") then
				table.insert(formattedLogs, "- " .. labyrinth .. ": 0" .. (k ~= #tbl3.raidCounter.Labyrinths and "\n" or ""))
				tbl3.raidCounter.Labyrinths[labyrinth] = 0
			end
		end

		local str4 = Options.discordNotifications.Value.Raids and (Options.webhookTag.Value ~= "everyone" and Options.webhookTag.Value ~= "" and "<@" .. Options.webhookTag.Value .. ">" or Options.webhookTag.Value == "everyone" and "@everyone" or " ") or ""
		local value = Options.webhookUrl.Value
		local tbl22 = { content = str4 }
		local embeds = {}
		local marketplaceService = game.MarketplaceService
		local str5 = " " .. str3 .. "!"

		local tbl23 = {
			title = "AOPG",
			description = "**" .. whichRaid() .. "** " .. marketplaceService:GetProductInfo(game.PlaceId).Name .. str5,
			url = "https://www.roblox.com/games/8540168650/",
		}

		local fields = {}
		local tbl24 = { name = "Player", value = "||" .. tostring(localPlayer.DisplayName) .. "||", inline = false }
		local tbl25 = { name = "💰", value = "B$ " .. GlobalFunctions2.toSuffixString(math.round(stats.Beli.Value)), inline = true }
		local convertToDashedNumber = GlobalFunctions2.convertToDashedNumber

		local tbl26 = {
			name = "💎",
			value = "G$ " .. GlobalFunctions2.convertToDashedNumber(math.round(stats.Gems.Value)) .. " / G$ " .. convertToDashedNumber(math.round(localPlayer.Stats.GemCapUnlock.Value) * n + n2),
			inline = true,
		}

		local tbl27 = {
			name = "🎲 (Poneglyph)",
			value = "x" .. GlobalFunctions2.convertToDashedNumber(stats.Poneglyphs.Value),
			inline = true,
		}

		local tbl28 = {
			name = "Lives",
			value = obj.ReplicatedStorage[localPlayer.Name .. "Life Counter"].Value .. " / 3",
			inline = true,
		}

		local tbl29 = {
			name = "Wave",
			value = obj.ReplicatedStorage.WaveCounter.Value .. " / " .. checkRaidWaves(),
			inline = true,
		}

		local tbl30 = {
			name = "Server Age",
			value = GlobalFunctions2.toHMS(obj.ReplicatedStorage["Server Age"].Value),
			inline = true,
		}

		local tbl31 = { name = "Raid Log", value = table.concat(formattedLogs), inline = false }
		fields[1] = tbl24
		fields[2] = tbl25
		fields[3] = tbl26
		fields[4] = tbl27
		fields[5] = tbl28
		fields[6] = tbl29
		fields[7] = tbl30
		fields[8] = tbl31
		tbl23.fields = fields
		tbl23.footer = { text = string.format("%s • 6footscripts", os.date("%I:%M:%S %p")) }
		tbl23.type = "rich"
		tbl23.color = str3 == "Cleared" and "3066993" or "15158332"
		embeds[1] = tbl23
		tbl22.embeds = embeds
		local json = obj.HttpService:JSONEncode(tbl22)
		request = http_request or request or HttpPost or syn.request

		request({
			Url = value,
			Body = json,
			Method = "POST",
			Headers = { ["content-type"] = "application/json" },
		})
	end
end

discordColor = function(arg)
	return tonumber(arg:ToHex(), 16)
end

local tbl22 = {
	Haki = Color3.fromRGB(170, 0, 170),
	Defence = Color3.fromRGB(0, 255, 0),
	Sword = Color3.fromRGB(255, 255, 127),
	Strength = Color3.fromRGB(255, 0, 0),
	Stamina = Color3.fromRGB(85, 170, 255),
	Fruit = Color3.fromRGB(255, 0, 191),
	Gun = Color3.fromRGB(255, 255, 0),
}

LevelUpWebhook = function(arg)
	if Toggles.webhookToggle.Value and Options.webhookUrl.Value then
		if not string.find(Options.webhookUrl.Value, "https://discord.com/api/webhooks/") then
			lib:Notify("Webhook url is incorrect")
			return
		end
		tbl7 = {}

		for k, v_3 in pairs(tbl5) do
			if stats:FindFirstChild(v_3) then
				table.insert(tbl7, stats[v_3].Name .. ": " .. stats[v_3].Value .. " / " .. Settings.STAT_CAP .. (k ~= #tbl5 and "\n" or ""))
			end
		end

		local stats2 = Options.discordNotifications.Value.Stats
		local str4

		if stats2 then
			str4 = Options.webhookTag.Value ~= "everyone" and Options.webhookTag.Value ~= "" and "<@" .. Options.webhookTag.Value .. ">" or Options.webhookTag.Value == "everyone" and "@everyone" or " "
		else
			str4 = stats2
		end

		str4 = str4 or ""
		local value = Options.webhookUrl.Value
		local tbl23 = { content = str4 }
		local embeds = {}

		local tbl24 = {
			title = "AOPG",
			description = "Leveled up **" .. arg .. "**!",
			url = "https://www.roblox.com/games/8540168650/",
		}

		local fields = {}
		local tbl25 = { name = "Player", value = "||" .. tostring(localPlayer.DisplayName) .. "||", inline = false }
		local tbl26 = { name = "💰", value = "B$ " .. GlobalFunctions2.toSuffixString(math.round(stats.Beli.Value)), inline = true }
		local toSuffixString = GlobalFunctions2.toSuffixString

		local tbl27 = {
			name = "💎",
			value = "G$ " .. GlobalFunctions2.toSuffixString(math.round(stats.Gems.Value)) .. " / " .. toSuffixString(math.round(localPlayer.Stats.GemCapUnlock.Value) * n + n2),
			inline = true,
		}

		local tbl28 = {
			name = "🎲 (Poneglyph)",
			value = "x" .. GlobalFunctions2.convertToDashedNumber(stats.Poneglyphs.Value),
			inline = true,
		}

		local tbl29 = {
			name = "Event Tokens",
			value = "T$ " .. GlobalFunctions2.toSuffixString(stats["Event Tokens"].Value),
			inline = true,
		}

		local tbl30 = {
			name = "Raid Points",
			value = GlobalFunctions2.convertToDashedNumber(stats["Raid Points"].Value),
			inline = true,
		}

		local tbl31 = { name = "Stats", value = table.concat(tbl7), inline = false }

		local tbl32 = {
			name = "Total Stats",
			value = GlobalFunctions2.convertToDashedNumber(totalStats()) .. " / " .. GlobalFunctions2.convertToDashedNumber(#tbl5 * Settings.STAT_CAP),
			inline = false,
		}

		fields[1] = tbl25
		fields[2] = tbl26
		fields[3] = tbl27
		fields[4] = tbl28
		fields[5] = tbl29
		fields[6] = tbl30
		fields[7] = tbl31
		fields[8] = tbl32
		tbl24.fields = fields
		tbl24.footer = { text = string.format("%s • 6footscripts", os.date("%I:%M:%S %p")) }
		tbl24.type = "rich"
		tbl24.color = discordColor(tbl22[arg])
		embeds[1] = tbl24
		tbl23.embeds = embeds
		local json = game.HttpService:JSONEncode(tbl23)
		request = http_request or request or HttpPost or syn.request

		request({
			Url = value,
			Body = json,
			Method = "POST",
			Headers = { ["content-type"] = "application/json" },
		})
	end
end

checkVowel = function(arg)
	local tbl23 = { "A", "E", "I", "O", "U", "Y", "W" }
	local flag7 = not string.find(arg:upper(), "UNIQUE") and table.find(tbl23, string.sub(arg:upper(), 1, 1))
	local str4 = "a"

	if flag7 then
		str4 = "an"
	end

	return str4
end

newItem = function(arg, arg2, arg3)
	if Options.pickedItem and Options.pickedItem.Value[arg] then
		return
	end

	if Toggles.webhookToggle.Value and Options.webhookUrl.Value then
		if not string.find(Options.webhookUrl.Value, "https://discord.com/api/webhooks/") then
			lib:Notify("Webhook url is incorrect")
			return
		end
		local str4 = Options.discordNotifications.Value.Items and (Options.webhookTag.Value ~= "everyone" and Options.webhookTag.Value ~= "" and "<@" .. Options.webhookTag.Value .. ">" or Options.webhookTag.Value == "everyone" and "@everyone" or " ") or ""
		local value = Options.webhookUrl.Value
		local tbl23 = {}
		local time = os.time
		local str5 = string.format("||%s|| found %s `%s` <t:%s:R>!", localPlayer.DisplayName, checkVowel(arg), arg, time())
		local format = string.format
		local str6 = arg2 == "new" and "0 -> 1" or string.format("%s -> %s", arg3 - 1, arg3)
		local str7 = " / " .. Settings.INVENTORY_CAP
		tbl23.content = str4 .. "\n" .. str5 .. format("```\n%s: %s\nInventory Space: %s```", arg, str6, getInventory() .. str7)
		local json = obj.HttpService:JSONEncode(tbl23)
		request = http_request or request or HttpPost or syn.request
		request({ Url = value, Body = json, Method = "POST", Headers = { ["content-type"] = "application/json" } })
	end
end

sendInventory = function()
	if Toggles.webhookToggle.Value and Options.webhookUrl.Value then
		if not string.find(Options.webhookUrl.Value, "https://discord.com/api/webhooks/") then
			lib:Notify("Webhook url is incorrect")
			return
		end
		local value = Options.webhookUrl.Value
		local tbl23 = {}
		local embeds = {}
		local tbl24 = { title = "AOPG", url = "https://www.roblox.com/games/8540168650/" }
		local fields = {}

		local tbl25 = {
			name = "Player",
			value = "||" .. getUser(Options.playerInventory.Value).DisplayName .. "||",
			inline = false,
		}

		local str4 = " / " .. Settings.INVENTORY_CAP
		local tbl26 = { name = "Inventory Space", value = getInventory() .. str4, inline = false }
		local tbl27 = { name = "Inventory", value = table.concat(tbl8), inline = false }
		fields[1] = tbl25
		fields[2] = tbl26
		fields[3] = tbl27
		tbl24.fields = fields
		tbl24.footer = { text = string.format("%s • 6footscripts", os.date("%I:%M:%S %p")) }
		tbl24.type = "rich"
		tbl24.color = "3066993"
		embeds[1] = tbl24
		tbl23.embeds = embeds
		local json = game.HttpService:JSONEncode(tbl23)
		request = http_request or request or HttpPost or syn.request
		request({ Url = value, Body = json, Method = "POST", Headers = { ["content-type"] = "application/json" } })
	end
end

sendMessage = function(arg, arg2)
	if Options.webhookUrl.Value == "" then
		return lib:Notify("Missing webhook url!")
	end

	if Toggles.webhookToggle.Value and Options.webhookUrl.Value then
		if not string.find(Options.webhookUrl.Value, "https://discord.com/api/webhooks/") then
			lib:Notify("Webhook url is incorrect")
			return
		end
		local str4 = Options.webhookTag.Value ~= "everyone" and Options.webhookTag.Value ~= "" and "<@" .. Options.webhookTag.Value .. ">" or Options.webhookTag.Value == "everyone" and "@everyone" or " "
		local value = Options.webhookUrl.Value

		local json = game.HttpService:JSONEncode({
			content = arg2 and str4,
			embeds = {
				{
					title = "AOPG",
					description = arg,
					url = "https://www.roblox.com/games/8540168650/",
					thumbnail = {
						url = "https://www.roblox.com/Thumbs/Asset.ashx?width=420&height=420&assetId=8540168650",
					},
					footer = { text = string.format("%s • 6footscripts", os.date("%I:%M:%S %p")) },
					type = "rich",
					color = "3066993",
				},
			},
		})

		request = http_request or request or HttpPost or syn.request
		request({ Url = value, Body = json, Method = "POST", Headers = { ["content-type"] = "application/json" } })
	end
end

TweenTp = function(arg, arg2)
	local value = Options.tweenSpeed.Value
	local tweenService = obj.TweenService

	if localPlayer.Character:FindFirstChild("HumanoidRootPart") then
		if arg2 then
			local linear = Enum.EasingStyle.Linear
			local out = Enum.EasingDirection.Out
			tweenService:Create(localPlayer.Character.HumanoidRootPart, TweenInfo.new(tonumber((localPlayer.Character.HumanoidRootPart.Position - arg.Position).magnitude / tonumber(value)), linear, out, 0, false, 0), { CFrame = CFrame.new(arg.Position + arg2) }):Play()

			if not localPlayer.Character.HumanoidRootPart:FindFirstChild("playerAttachment") then
				local attachment = Instance.new("Attachment")
				attachment.Name = "playerAttachment"
				attachment.Parent = localPlayer.Character.HumanoidRootPart
				local linearVelocity = Instance.new("LinearVelocity")
				linearVelocity.Parent = attachment
				linearVelocity.MaxForce = math.huge
				linearVelocity.Attachment0 = attachment
			end
		else
			tweenService:Create(localPlayer.Character.HumanoidRootPart, TweenInfo.new(tonumber((localPlayer.Character.HumanoidRootPart.Position - arg).magnitude / tonumber(value)), Enum.EasingStyle.Linear), { CFrame = CFrame.new(arg) }):Play()

			if not localPlayer.Character.HumanoidRootPart:FindFirstChild("playerAttachment") then
				local attachment = Instance.new("Attachment")
				attachment.Name = "playerAttachment"
				attachment.Parent = localPlayer.Character.HumanoidRootPart
				local linearVelocity = Instance.new("LinearVelocity")
				linearVelocity.Parent = attachment
				linearVelocity.MaxForce = math.huge
				linearVelocity.Attachment0 = attachment
			end
		end
	end
end

stabilizeTeleport = function()
	if isAlive() then
		if not localPlayer.Character.HumanoidRootPart:FindFirstChild("playerAttachment") then
			local attachment = Instance.new("Attachment")
			attachment.Name = "playerAttachment"
			attachment.Parent = localPlayer.Character.HumanoidRootPart
			local linearVelocity = Instance.new("LinearVelocity")
			linearVelocity.Parent = attachment
			linearVelocity.MaxForce = math.huge
			linearVelocity.Attachment0 = attachment
		end
	end
end

removeHover = function()
	if isAlive() then
		localPlayer.Character.HumanoidRootPart.Anchored = false

		for _, child in pairs(localPlayer.Character.HumanoidRootPart:GetChildren()) do
			if child:IsA("BodyPosition") or child:IsA("BodyVelocity") or child:IsA("LinearVelocity") or child:IsA("BodyGyro") or child.Name == "playerAttachment" then
				child:Destroy()
			end
		end
	end
end

local function fn2()
	local v_3

	if table.find(tbl9, game.PlaceId) then
		local huge = math.huge
		v_3 = nil

		for _, child in pairs(Workspace.Entities:GetChildren()) do
			if not obj.Players:FindFirstChild(child.Name) then
				if child:FindFirstChild("HumanoidRootPart") and child:FindFirstChild("Humanoid") and child.Humanoid.Health > 0 and localPlayer.Character:FindFirstChild("HumanoidRootPart") then
					if child.Name == "Golden Statue" and checkInstance() == "Golden Heist" then
						if workspace:FindFirstChild("Jackpot") and not workspace.Jackpot.Value then
							continue
						end
					end

					local magnitude = (child.HumanoidRootPart.Position - localPlayer.Character.HumanoidRootPart.Position).magnitude

					if magnitude < huge then
						huge = magnitude
						v_3 = child
					end
				end
			end
		end
	elseif Toggles.autoMultiFarm and Toggles.autoMultiFarm.Value then
		local huge = math.huge
		v_3 = nil

		for _, child in pairs(Workspace.Entities:GetChildren()) do
			local name = child.Name

			if table.find(Options.pickedMultiMob:GetActiveValues(), name) and not obj.Players:FindFirstChild(child.Name) and child:FindFirstChild("HumanoidRootPart") and child:FindFirstChild("Humanoid") and child.Humanoid.Health > 0 and localPlayer.Character:FindFirstChild("HumanoidRootPart") then
				local magnitude = (child.HumanoidRootPart.Position - localPlayer.Character.HumanoidRootPart.Position).magnitude

				if magnitude < huge then
					huge = magnitude
					v_3 = child
				end
			end
		end
	else
		local huge = math.huge
		v_3 = nil

		for _, child in pairs(Workspace.Entities:GetChildren()) do
			if Options.pickedMob and child.Name == Options.pickedMob.Value and not obj.Players:FindFirstChild(child.Name) and child:FindFirstChild("HumanoidRootPart") and child:FindFirstChild("Humanoid") and child.Humanoid.Health > 0 and localPlayer.Character:FindFirstChild("HumanoidRootPart") then
				local magnitude = (child.HumanoidRootPart.Position - localPlayer.Character.HumanoidRootPart.Position).magnitude

				if magnitude < huge then
					huge = magnitude
					v_3 = child
				end
			end
		end
	end

	return v_3
end

Attack = function(arg, arg2, arg3, arg4)
	if not arg or not arg2 or not arg3 or not arg4 then
		return
	end
	hideEvent(obj.ReplicatedStorage.Remotes.requestAbility, arg, arg2, arg3, arg4, 5)
end

laggyAttackMob = function(arg)
	if Toggles.autoQuest and Toggles.autoQuest.Value and Toggles.autoFarm and Toggles.autoFarm.Value and checkQuest() then
		flag3 = false
		return
	end

	if not flag6 then
		flag6 = true

		if arg and (arg:FindFirstChild("HumanoidRootPart") or arg.PrimaryPart) then
			local humanoidRootPart = arg:FindFirstChild("HumanoidRootPart") or arg.PrimaryPart

			if Options.spamMeleeSkills.Value and stats:FindFirstChild("Fighting Style").Value then
				if Options.spamMeleeSkills.Value and stats:FindFirstChild("Fighting Style").Value then
					for k in pairs(Options.spamMeleeSkills.Value) do
						if arg and humanoidRootPart then
							if k == "F" then
								if stats["Fighting Style"].Value ~= "Black Leg" and stats["Fighting Style"].Value ~= "Fishman Karate" and stats["Fighting Style"].Value ~= "Electro" then
									Attack("Fighting Style", k, humanoidRootPart.CFrame, humanoidRootPart)
								end
							else
								Attack("Fighting Style", k, humanoidRootPart.CFrame, humanoidRootPart)
							end
						end
					end
				end
			end

			if Options.spamGunSkills.Value and stats["Gun Style"].Value then
				if Options.spamGunSkills.Value and stats["Gun Style"].Value then
					for k in pairs(Options.spamGunSkills.Value) do
						if arg and humanoidRootPart then
							Attack("Gun Style", k, humanoidRootPart.CFrame, humanoidRootPart)
						end
					end
				end
			end

			if Options.spamSwordSkills.Value and stats:FindFirstChild("Sword Style").Value then
				for k in pairs(Options.spamSwordSkills.Value) do
					if arg and humanoidRootPart then
						Attack("Sword Style", k, humanoidRootPart.CFrame, humanoidRootPart)
					end
				end
			end

			if Options.spamFruitSkills.Value and stats["Devil Fruit"].Value then
				for k in pairs(Options.spamFruitSkills.Value) do
					if arg and humanoidRootPart then
						if k == "Q" then
							if stats["Devil Fruit"].Value == "Rubber Fruit" and localPlayer.Character and localPlayer.Character:FindFirstChild("gear5Active") then
								obj.ReplicatedStorage.Remotes.requestCharge:InvokeServer("Devil Fruit", k)
								Attack("Devil Fruit", k, humanoidRootPart.CFrame, humanoidRootPart)
							end
						elseif k == "G" then
							if stats["Devil Fruit"].Value ~= "Rubber Fruit" then
								Attack("Devil Fruit", k, humanoidRootPart.CFrame, humanoidRootPart)
							elseif states.GearFifth.Value and upgrades["Gear Fifth"].Value and localPlayer.Awakened["Rubber Fruit"].G.Value then
								Attack("Devil Fruit", k, humanoidRootPart.CFrame, humanoidRootPart)
							elseif states:FindFirstChild("GearFourth").Value and upgrades:FindFirstChild("Gear Fourth").Value then
								Attack("Devil Fruit", k, humanoidRootPart.CFrame, humanoidRootPart)
							end
						elseif k == "Y" then
							if stats["Devil Fruit"].Value ~= "Rubber Fruit" then
								Attack("Devil Fruit", k, humanoidRootPart.CFrame, humanoidRootPart)
							end
						else
							Attack("Devil Fruit", k, humanoidRootPart.CFrame, humanoidRootPart)
						end
					end
				end
			end

			task.spawn(function()
				pcall(function()
					if Options.spamSupportSkills.Value and stats:FindFirstChild("Support Style").Value then
						for k in pairs(Options.spamSupportSkills.Value) do
							if arg and humanoidRootPart then
								if k == "Q" then
									task.wait(0.5)

									if stats:FindFirstChild("Support Style").Value == "Dengeki Blue" and not localPlayer.Character:FindFirstChild("DengekiBlueMode") then
										Attack("Support Style", k, humanoidRootPart.CFrame, humanoidRootPart)
									elseif stats:FindFirstChild("Support Style").Value == "Sparking Red" and not localPlayer.Character:FindFirstChild("SparkingRedMode") then
										if not localPlayer.Character:FindFirstChild("EnergyFist") then
											Attack("Support Style", k, humanoidRootPart.CFrame, humanoidRootPart)
										end
									elseif stats:FindFirstChild("Support Style").Value == "Poison Pink" and not localPlayer.Character:FindFirstChild("PoisonPinkMode") then
										Attack("Support Style", k, humanoidRootPart.CFrame, humanoidRootPart)
									elseif stats:FindFirstChild("Support Style").Value == "Stealth Black" and not localPlayer.Character:FindFirstChild("StealthBlackMode") then
										Attack("Support Style", k, humanoidRootPart.CFrame, humanoidRootPart)
									end
								else
									Attack("Support Style", k, humanoidRootPart.CFrame, humanoidRootPart)
								end
							end
						end
					end
				end)
			end)
		end

		task.wait(0.5)
		flag6 = false
	end
end

Haki = function()
	if localPlayer.Character:FindFirstChild("Head") and isAlive() then
		if Options.pickedArmKey.Value then
			if stats:FindFirstChild("Armament").Value and not states:FindFirstChild("Armament").Value then
				hideEvent(obj.ReplicatedStorage.Remotes.requestAbility, "Fighting Style", Options.pickedArmKey.Value, localPlayer.Character.Head.CFrame, localPlayer.Character.Head, 5)
			end
		end

		if Options.pickedSwordKey.Value then
			if not states:FindFirstChild("Sword Armament").Value then
				hideEvent(obj.ReplicatedStorage.Remotes.requestAbility, "Sword Style", Options.pickedSwordKey.Value, localPlayer.Character.Head.CFrame, localPlayer.Character.Head, 5)
			end
		end

		if Options.pickedObsStyle.Value and Options.pickedObsKey.Value then
			if stats:FindFirstChild("Observation").Value and not states:FindFirstChild("Observation").Value then
				hideEvent(obj.ReplicatedStorage.Remotes.requestAbility, Options.pickedObsStyle.Value, Options.pickedObsKey.Value, localPlayer.Character.Head.CFrame, localPlayer.Character.Head, 5)
			end
		end

		if Options.pickedConqStyle.Value and Options.pickedConqKey.Value then
			if stats:FindFirstChild("Conquerer").Value and not states:FindFirstChild("Conquerer").Value then
				hideEvent(obj.ReplicatedStorage.Remotes.requestAbility, Options.pickedConqStyle.Value, Options.pickedConqKey.Value, localPlayer.Character.Head.CFrame, localPlayer.Character.Head, 5)
			end
		end
	end
end

local tbl23 = {
	"4th Gear",
	"5th Gear",
	"Black Leg",
	"Chainsaw Man",
	"Diable Jambe",
	"Dragon Fruit",
	"Electro",
	"Fishman Karate",
	"Flame Pipe",
	"Garp",
	"Gas Fruit",
	"Gojo",
	"Hawk Eyes",
	"Hellsing",
	"Jigoku Santoryu",
	"Jolly Rapier",
	"Leopard Fruit",
	"Snakeman",
	"Sulong Form",
	"True Black Leg",
	"Venom Fruit",
	"Pirate Kings Sword",
	"True Oden Blades",
	"Vampire Fruit",
	"Sukuna",
	"Support Suits",
	"Cyborg",
	"Cyborg Ultimate",
	"Final Lightning Fruit",
	"Final Ice Fruit",
	"Zangetsu",
	"Slingshot V2",
	"Emperor Gryphon",
	"Dragon Claw",
	"Buddha Fruit",
	"Goku",
	"Sogeking",
	"Gyuki",
}

local function fn3(arg)
	local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()

	if backpack:FindFirstChild(arg) then
		backpack[arg].Parent = character
	end
end

PowerUp = function()
	local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()

	if character and character:FindFirstChild("Head") then
		if stats["Support Style"].Value == "Sparkling Red" or stats["Support Style"].Value == "Dengeki Blue" or stats["Support Style"].Value == "Poison Pink" or stats["Support Style"].Value == "Stealth Black" then
			if not character:FindFirstChild("RaidSuit") then
				hideEvent(remotes.requestAbility, "Support Style", "R", character.Head.CFrame, character.Head, 5)
			end
		elseif stats["Support Style"].Value == "Goku" then
			if upgrades:FindFirstChild("Super Saiyan") and upgrades["Super Saiyan"].Value and not character:FindFirstChild("Aura") then
				hideEvent(remotes.requestAbility, "Support Style", "Y", character.Head.CFrame, character.Head, 5)
			end
		elseif stats["Support Style"].Value == "Chainsaw Man" then
			if unlockables:FindFirstChild("Chainsaw Man") and unlockables["Chainsaw Man"]:FindFirstChild("Full Devil Form") and unlockables["Chainsaw Man"]["Full Devil Form"].Value and not character:FindFirstChild("Full Devil Form") then
				hideEvent(remotes.requestAbility, "Support Style", "Y", character.Head.CFrame, character.Head, 5)
			end
		elseif stats["Support Style"].Value == "Naruto" then
			if upgrades:FindFirstChild("NarutoCloak") and upgrades.NarutoCloak.Value and not character:FindFirstChild("CloakMode") then
				hideEvent(remotes.requestAbility, "Support Style", "Y", character.Head.CFrame, character.Head, 5)
			end
		elseif stats["Support Style"].Value == "Gojo" then
			if unlockables:FindFirstChild("GojoUnlocked") and unlockables.GojoUnlocked:FindFirstChild("Limitless") and unlockables.GojoUnlocked.Limitless.Value and not character:FindFirstChild("Limitless") then
				hideEvent(remotes.requestAbility, "Support Style", "Y", character.Head.CFrame, character.Head, 5)
			end
		elseif stats["Support Style"].Value == "Sogeking" then
			if not character:FindFirstChild("SogekingMode") then
				hideEvent(remotes.requestAbility, "Support Style", "Q", character.Head.CFrame, character.Head, 5)
			end
		elseif stats["Support Style"].Value == "Toji" then
			if unlockables:FindFirstChild("Toji") and unlockables.Toji:FindFirstChild("Inverted Spear Of Heaven") and unlockables.Toji["Inverted Spear Of Heaven"].Value and not character:FindFirstChild("Inverted Spear Of Heaven") then
				hideEvent(remotes.requestAbility, "Support Style", "Y", character.Head.CFrame, character.Head, 5)
			end
		elseif stats["Support Style"].Value == "S-S Hawk" or stats["Support Style"].Value == "S-S Bear" or stats["Support Style"].Value == "S-S Snake" or stats["Support Style"].Value == "S-S Shark" then
			if stats:FindFirstChild("PerfectLunatrix") and stats.PerfectLunatrix.Value and not character:FindFirstChild("GreenBloodEffects") then
				hideEvent(remotes.requestAbility, "Support Style", "F", character.Head.CFrame, character.Head, 5)
			end
		elseif stats["Support Style"].Value == "Shadow Necromancer" then
			if unlockables:FindFirstChild("Shadow Necromancer") and unlockables["Shadow Necromancer"]:FindFirstChild("Unlocked") and unlockables["Shadow Necromancer"].Unlocked.Value then
				local boosts = character:FindFirstChild("Boosts")

				if not (boosts and boosts:FindFirstChild("Shadow Armour")) then
					hideEvent(remotes.requestAbility, "Support Style", "U", character.Head.CFrame, character.Head, 5)
				end
			end
		end

		if stats["Fighting Style"].Value == "Black Leg" then
			if not states:FindFirstChild("Diable Jambe") or not states["Diable Jambe"].Value then
				if not character:FindFirstChild("Diable Jambe") then
					hideEvent(remotes.requestAbility, "Fighting Style", "F", character.Head.CFrame, character.Head, 5)
				end
			end
		elseif stats["Fighting Style"].Value == "Fishman Karate" then
			if not states:FindFirstChild("Fishman") or not states.Fishman.Value then
				if not character:FindFirstChild("FishmanMode") then
					hideEvent(remotes.requestAbility, "Fighting Style", "F", character.Head.CFrame, character.Head, 5)
				end
			end
		elseif stats["Fighting Style"].Value == "Electro" then
			if not states:FindFirstChild("Electricity") or not states.Electricity.Value then
				if not character:FindFirstChild("ElectroMode") then
					hideEvent(remotes.requestAbility, "Fighting Style", "F", character.Head.CFrame, character.Head, 5)
				end
			end
		elseif stats["Fighting Style"].Value == "Cyborg" then
			if not character:FindFirstChild("BF-37") then
				hideEvent(remotes.requestAbility, "Fighting Style", "F", character.Head.CFrame, character.Head, 5)
			end
		elseif stats["Fighting Style"].Value == "True Black Leg" then
			if not character:FindFirstChild("True Diable Jambe") then
				hideEvent(remotes.requestAbility, "Support Style", "U", character.Head.CFrame, character.Head, 5)
			end
		elseif stats["Fighting Style"].Value == "Ifrit Jambe" then
			if upgrades:FindFirstChild("Ifrit Jambe") and upgrades["Ifrit Jambe"].Value and not character:FindFirstChild("True Diable Jambe") then
				hideEvent(remotes.requestAbility, "Support Style", "U", character.Head.CFrame, character.Head, 5)
			end
		elseif stats["Fighting Style"].Value == "Fishman Karate V2" then
			if not character:FindFirstChild("AwakenedFishmanMode") then
				hideEvent(remotes.requestAbility, "Support Style", "Y", character.Head.CFrame, character.Head, 5)
			end
		elseif stats["Fighting Style"].Value == "Garp" then
			if not character:FindFirstChild("HeroMode") then
				hideEvent(remotes.requestAbility, "Fighting Style", "Y", character.Head.CFrame, character.Head, 5)
			end
		elseif stats["Fighting Style"].Value == "Electro V2" then
			if not character:FindFirstChild("SulongForm") then
				hideEvent(remotes.requestAbility, "Fighting Style", "Y", character.Head.CFrame, character.Head, 5)
			end
		elseif stats["Fighting Style"].Value == "Dragon Claw" then
			if not character:FindFirstChild("DragonClawMode") then
				hideEvent(remotes.requestAbility, "Fighting Style", "Y", character.Head.CFrame, character.Head, 5)
			end
		elseif stats["Fighting Style"].Value == "Sukuna" then
			if not character:FindFirstChild("KingOfCursesMode") then
				hideEvent(remotes.requestAbility, "Fighting Style", "U", character.Head.CFrame, character.Head, 5)
			end
		elseif stats["Fighting Style"].Value == "Ultimate Cyborg" then
			if not character:FindFirstChild("UltimateCyborgMode") then
				hideEvent(remotes.requestAbility, "Fighting Style", "U", character.Head.CFrame, character.Head, 5)
			end
		elseif stats["Fighting Style"].Value == "Ultra Instinct" then
			if not character:FindFirstChild("muitransformation") then
				hideEvent(remotes.requestAbility, "Fighting Style", "Y", character.Head.CFrame, character.Head, 5)
			end
		elseif stats["Fighting Style"].Value == "Reincarnated Slime" then
			local boosts = character:FindFirstChild("Boosts")

			if not (boosts and boosts:FindFirstChild("SlimeMode")) then
				hideEvent(remotes.requestAbility, "Fighting Style", "U", character.Head.CFrame, character.Head, 5)
			end
		end

		if stats["Gun Style"].Value == "Jolly Rapier" then
			if stats.Race.Value == "Santa" and not character:FindFirstChild("EvilSantaMode") then
				hideEvent(remotes.requestAbility, "Gun Style", "U", character.Head.CFrame, character.Head, 5)
			end
		elseif stats["Gun Style"].Value == "Slingshot V2" then
			if upgrades:FindFirstChild("SlingshotV2Mode") and upgrades.SlingshotV2Mode.Value and not character:FindFirstChild("SlingshotV2Mode") then
				hideEvent(remotes.requestAbility, "Gun Style", "Y", character.Head.CFrame, character.Head, 5)
			end
		elseif stats["Gun Style"].Value == "Hellsing" then
			if not character:FindFirstChild("HellsingReleaseMode") then
				hideEvent(remotes.requestAbility, "Gun Style", "F", character.Head.CFrame, character.Head, 5)
			end
		elseif stats["Gun Style"].Value == "Stark Guns" then
			if not character:FindFirstChild("StarkGunsMode") then
				hideEvent(remotes.requestAbility, "Gun Style", "U", character.Head.CFrame, character.Head, 5)
			end
		end

		if stats["Sword Style"].Value == "Dual Yoru" then
			if unlockables:FindFirstChild("Mihawk") and unlockables.Mihawk:FindFirstChild("Hawk Eyes") and unlockables.Mihawk["Hawk Eyes"].Value and not character:FindFirstChild("HawkEyes") then
				hideEvent(remotes.requestAbility, "Sword Style", "Y", character.Head.CFrame, character.Head, 5)
			end
		elseif stats["Sword Style"].Value == "Emperor Gryphon" then
			if not character:FindFirstChild("SwordFire") then
				hideEvent(remotes.requestAbility, "Sword Style", "Y", character.Head.CFrame, character.Head, 5)
			end
		elseif stats["Sword Style"].Value == "Jigoku Santoryu" then
			if unlockables:FindFirstChild("Jigoku") and unlockables.Jigoku:FindFirstChild("UnlockedYMode") and unlockables.Jigoku.UnlockedYMode.Value and not character:FindFirstChild("KingOfHell") then
				hideEvent(remotes.requestAbility, "Sword Style", "Y", character.Head.CFrame, character.Head, 5)
			end
		elseif stats["Sword Style"].Value == "Zangetsu" then
			if unlockables:FindFirstChild("Zangetsu") and unlockables.Zangetsu:FindFirstChild("Horn Of Salvation") and unlockables.Zangetsu["Horn Of Salvation"].Value and not character:FindFirstChild("HornOfSalvation") then
				hideEvent(remotes.requestAbility, "Sword Style", "Y", character.Head.CFrame, character.Head, 5)
			end
		elseif stats["Sword Style"].Value == "Flame Pipe" then
			if not character:FindFirstChild("FlamePipeMode") then
				hideEvent(remotes.requestAbility, "Sword Style", "Y", character.Head.CFrame, character.Head, 5)
			end
		elseif stats["Sword Style"].Value == "True Oden Blades" then
			if upgrades:FindFirstChild("RageOfWano") and upgrades.RageOfWano.Value and not character:FindFirstChild("RageOfWanoMode") then
				hideEvent(remotes.requestAbility, "Sword Style", "Y", character.Head.CFrame, character.Head, 5)
			end
		elseif stats["Sword Style"].Value == "Pirate Kings Sword" then
			if upgrades:FindFirstChild("KingPirateMode") and upgrades.KingPirateMode.Value and not character:FindFirstChild("RogersMode") then
				hideEvent(remotes.requestAbility, "Sword Style", "F", character.Head.CFrame, character.Head, 5)
			end
		elseif stats["Sword Style"].Value == "Dragon Slayer" then
			if upgrades:FindFirstChild("BerserkArmor") and upgrades.BerserkArmor.Value and not character:FindFirstChild("BerserkArmorMode") then
				hideEvent(remotes.requestAbility, "Sword Style", "U", character.Head.CFrame, character.Head, 5)
			end
		elseif stats["Sword Style"].Value == "True Yoru" then
			fn3("True Yoru")

			if not character:FindFirstChild("TrueYoruMode") then
				hideEvent(remotes.requestAbility, "Sword Style", "Y", character.Head.CFrame, character.Head, 5)
			end
		elseif stats["Sword Style"].Value == "Daimyo Oden Blades" then
			local boosts = character:FindFirstChild("Boosts")

			if not (boosts and boosts:FindFirstChild("Boiling Rage")) then
				hideEvent(remotes.requestAbility, "Sword Style", "Y", character.Head.CFrame, character.Head, 5)
			end
		elseif stats["Sword Style"].Value == "True Kyoka Suigetsu" then
			if not character:FindFirstChild("HogyokuFusionMode") then
				hideEvent(remotes.requestAbility, "Sword Style", "Y", character.Head.CFrame, character.Head, 5)
			end
		end

		if stats["Devil Fruit"].Value == "Venom Fruit" then
			if upgrades:FindFirstChild("Venom Fruit V2") and upgrades["Venom Fruit V2"].Value then
				if not character:FindFirstChild("VenomDemon") then
					hideEvent(remotes.requestAbility, "Devil Fruit", "Y", character.Head.CFrame, character.Head, 5)
				end
			elseif not character:FindFirstChild("venomClone") then
				hideEvent(remotes.requestAbility, "Devil Fruit", "F", character.Head.CFrame, character.Head, 5)
			end
		elseif stats["Devil Fruit"].Value == "Rubber Fruit" then
			if upgrades:FindFirstChild("Gear Second") and upgrades["Gear Second"].Value and upgrades:FindFirstChild("Gear Fourth") and upgrades["Gear Fourth"].Value and upgrades:FindFirstChild("Gear Fifth") and upgrades["Gear Fifth"].Value then
				if not states:FindFirstChild("GearFifth") or not states.GearFifth.Value then
					hideEvent(remotes.requestAbility, "Devil Fruit", "U", character.Head.CFrame, character.Head, 5)
				end
			elseif upgrades:FindFirstChild("Gear Second") and upgrades["Gear Second"].Value and upgrades:FindFirstChild("Gear Fourth Snakeman") and upgrades["Gear Fourth Snakeman"].Value then
				if not character:FindFirstChild("Snakeman") then
					hideEvent(remotes.requestAbility, "Devil Fruit", "T", character.Head.CFrame, character.Head, 5)
				end
			elseif upgrades:FindFirstChild("Gear Second") and upgrades["Gear Second"].Value and upgrades:FindFirstChild("Gear Fourth") and upgrades["Gear Fourth"].Value then
				if not character:FindFirstChild("Gear4") then
					hideEvent(remotes.requestAbility, "Devil Fruit", "Y", character.Head.CFrame, character.Head, 5)
				end
			elseif upgrades:FindFirstChild("Gear Second") and upgrades["Gear Second"].Value then
				if not states:FindFirstChild("GearSecond") or not states.GearSecond.Value then
					hideEvent(remotes.requestAbility, "Devil Fruit", "G", character.Head.CFrame, character.Head, 5)
				end
			end
		elseif stats["Devil Fruit"].Value == "Phoenix Fruit" then
			if upgrades:FindFirstChild("Phoenix Fruit V2") and upgrades["Phoenix Fruit V2"].Value and not character:FindFirstChild("FullPhoenixAssets") then
				hideEvent(remotes.requestAbility, "Devil Fruit", "T", character.Head.CFrame, character.Head, 5)
			end
		elseif stats["Devil Fruit"].Value == "Buddha Fruit" then
			if not character:FindFirstChild("BuddhaRig") then
				hideEvent(remotes.requestAbility, "Devil Fruit", "E", character.Head.CFrame, character.Head, 5)
			end
		elseif stats["Devil Fruit"].Value == "Dragon Fruit" then
			if not upgrades:FindFirstChild("Dragon Fruit V2") or not upgrades["Dragon Fruit V2"].Value then
				if not character:FindFirstChild("DragonAssets") and not character:FindFirstChild("DragonForm") then
					hideEvent(remotes.requestAbility, "Devil Fruit", "Y", character.Head.CFrame, character.Head, 5)
				end
			elseif upgrades:FindFirstChild("HybridDragonAwk") and upgrades.HybridDragonAwk.Value then
				hideEvent(remotes.requestAbility, "Devil Fruit", "Y", character.Head.CFrame, character.Head, 5)
			else
				hideEvent(remotes.requestAbility, "Devil Fruit", "U", character.Head.CFrame, character.Head, 5)
			end
		elseif stats["Devil Fruit"].Value == "Leopard Fruit" then
			if not upgrades:FindFirstChild("Leopard") or not upgrades.Leopard.Value then
				if not character:FindFirstChild("LeopardForm") then
					hideEvent(remotes.requestAbility, "Devil Fruit", "U", character.Head.CFrame, character.Head, 5)
				end
			elseif not character:FindFirstChild("AwakenedLeopardForm") then
				hideEvent(remotes.requestAbility, "Devil Fruit", "Y", character.Head.CFrame, character.Head, 5)
			end
		elseif stats["Devil Fruit"].Value == "Gas Fruit" then
			if upgrades:FindFirstChild("Gas Fruit V2") and upgrades["Gas Fruit V2"].Value and not character:FindFirstChild("GasMode") then
				hideEvent(remotes.requestAbility, "Devil Fruit", "U", character.Head.CFrame, character.Head, 5)
			end
		elseif stats["Devil Fruit"].Value == "Kings Fruit" then
			if not character:FindFirstChild("KingsForm") then
				hideEvent(remotes.requestAbility, "Devil Fruit", "U", character.Head.CFrame, character.Head, 5)
			end
		elseif stats["Devil Fruit"].Value == "Soul Fruit" then
			if upgrades:FindFirstChild("MiseryMode") and upgrades.MiseryMode.Value and not character:FindFirstChild("Misery") then
				hideEvent(remotes.requestAbility, "Devil Fruit", "U", character.Head.CFrame, character.Head, 5)
			end
		elseif stats["Devil Fruit"].Value == "Sing Fruit" then
			if unlockables:FindFirstChild("SingFruit") and unlockables.SingFruit:FindFirstChild("TotMusica") and unlockables.SingFruit.TotMusica.Value then
				hideEvent(remotes.requestAbility, "Devil Fruit", "Y", character.Head.CFrame, character.Head, 5)
			end
		elseif stats["Devil Fruit"].Value == "Vampire Fruit" then
			if not character:FindFirstChild("VampireHybridForm") then
				hideEvent(remotes.requestAbility, "Devil Fruit", "Y", character.Head.CFrame, character.Head, 5)
			end
		elseif stats["Devil Fruit"].Value == "Final Lightning Fruit" then
			fn3("Final Lightning Fruit")

			if unlockables:FindFirstChild("Lightning") and unlockables.Lightning:FindFirstChild("MAX 200M Amaru") and unlockables.Lightning["MAX 200M Amaru"].Value then
				if not character:FindFirstChild("EnelFullForm") then
					hideEvent(remotes.requestAbility, "Devil Fruit", "U", character.Head.CFrame, character.Head, 5)
				end
			end
		elseif stats["Devil Fruit"].Value == "Final Ice Fruit" then
			if upgrades:FindFirstChild("Final Ice Fruit") and upgrades["Final Ice Fruit"].Value and not character:FindFirstChild("Glacial Epoch") then
				hideEvent(remotes.requestAbility, "Devil Fruit", "Y", character.Head.CFrame, character.Head, 5)
			end
		elseif stats["Devil Fruit"].Value == "Advanced Buddha Fruit" then
			fn3("Advanced Buddha Fruit")

			if not character:FindFirstChild("BuddhaFullForm") then
				hideEvent(remotes.requestAbility, "Devil Fruit", "Y", character.Head.CFrame, character.Head, 5)
			end
		elseif stats["Devil Fruit"].Value == "Gyuki Fruit" then
			fn3("Gyuki Fruit")

			if not character:FindFirstChild("GyukiMode") then
				hideEvent(remotes.requestAbility, "Devil Fruit", "U", character.Head.CFrame, character.Head, 5)
			end
		elseif stats["Devil Fruit"].Value == "Final Leopard Fruit" then
			fn3("Final Leopard Fruit")

			if not character:FindFirstChild("LeopardFullForm") then
				hideEvent(remotes.requestAbility, "Devil Fruit", "Y", character.Head.CFrame, character.Head, 5)
			elseif character:FindFirstChild("LeopardFullForm") and not character:FindFirstChild("LeopardFullFormBoost") then
				hideEvent(remotes.requestAbility, "Devil Fruit", "U", character.Head.CFrame, character.Head, 5)
			end
		elseif stats["Devil Fruit"].Value == "Okuchi Fruit" then
			fn3("Okuchi Fruit")

			if not character:FindFirstChild("IceOniMode") then
				hideEvent(remotes.requestAbility, "Devil Fruit", "Y", character.Head.CFrame, character.Head, 5)
			end
		elseif stats["Devil Fruit"].Value == "Final Flame Fruit" then
			if not character:FindFirstChild("FinalFlameMode") then
				hideEvent(remotes.requestAbility, "Devil Fruit", "Y", character.Head.CFrame, character.Head, 5)
			end
		elseif stats["Devil Fruit"].Value == "Hybrid Fourth Gear Fruit" then
			fn3("Hybrid Fourth Gear Fruit")

			if not character:FindFirstChild("GearHybridMode") then
				hideEvent(remotes.requestAbility, "Devil Fruit", "U", character.Head.CFrame, character.Head, 5)
			end
		elseif stats["Devil Fruit"].Value == "Final Dragon Fruit" then
			fn3("Final Dragon Fruit")

			if not character:FindFirstChild("FinalDragonMode") then
				hideEvent(remotes.requestAbility, "Devil Fruit", "Y", character.Head.CFrame, character.Head, 5)
			end
		end

		if backpack:FindFirstChild("Suit") then
			if not character:FindFirstChild("SuitModel") then
				fn3("Suit")
				character.Suit:Activate()
			end
		elseif backpack:FindFirstChild("Summer Outfit: Melee") then
			if not character:FindFirstChild("melee") then
				fn3("Summer Outfit: Melee")
				character["Summer Outfit: Melee"]:Activate()
			end
		elseif backpack:FindFirstChild("Summer Outfit: Sword") then
			if not character:FindFirstChild("sword") then
				fn3("Summer Outfit: Sword")
				character["Summer Outfit: Sword"]:Activate()
			end
		elseif backpack:FindFirstChild("Summer Outfit: Power") then
			if not character:FindFirstChild("fruit") then
				fn3("Summer Outfit: Power")
				character["Summer Outfit: Power"]:Activate()
			end
		elseif backpack:FindFirstChild("Supporter Heist Suit") then
			if not character:FindFirstChild("SuitModel") and not character:FindFirstChild("SuitEquipped") then
				fn3("Supporter Heist Suit")
				character["Supporter Heist Suit"]:Activate()
			end
		elseif backpack:FindFirstChild("Sniper Heist Suit") then
			if not character:FindFirstChild("SuitModel") and not character:FindFirstChild("SuitEquipped") then
				fn3("Sniper Heist Suit")
				character["Sniper Heist Suit"]:Activate()
			end
		elseif backpack:FindFirstChild("Swordsman Heist Suit") then
			if not character:FindFirstChild("SuitModel") and not character:FindFirstChild("SuitEquipped") then
				fn3("Swordsman Heist Suit")
				character["Swordsman Heist Suit"]:Activate()
			end
		elseif backpack:FindFirstChild("Midas Suit") then
			if not character:FindFirstChild("SuitModel") and not character:FindFirstChild("SuitEquipped") then
				fn3("Midas Suit")
				character["Midas Suit"]:Activate()
			end
		end
	end
end

isRaid = function()
	if table.find(tbl9, game.PlaceId) then
		return true
	end
end

searchText = function(arg)
	for _, v_3 in pairs(tbl20) do
		local v_4

		if arg then
			local lower = arg.lower
			v_4 = string.find(v_3:lower(), lower(arg))
		else
			v_4 = arg
		end

		if v_4 then
			return v_3
		end
	end
end

checkQuest = function()
	local flag7 = false

	if Toggles.autoFarm.Value then
		if mobQuestExists(Options.pickedMob.Value) then
			if Toggles.autoQuest.Value then
				local value = stats.Quests.Value

				if #quests2:GetChildren() ~= value then
					flag7 = true
				else
					local flag8 = false

					for _, child in pairs(quests2:GetChildren()) do
						local targets = child:FindFirstChild("Targets") and child.Targets:GetChildren()[1]

						if targets then
							local value2 = Options.pickedMob.Value
							targets = child.Targets:GetChildren()[1].Name ~= value2
						end

						if targets then
							flag8 = true
						end
					end

					flag7 = flag8
				end
			end
		end
	end

	if flag7 then
		if Toggles.autoQuest.Value then
			for _, child in pairs(quests2:GetChildren()) do
				if child:FindFirstChild("Targets") then
					for _, child2 in pairs(child.Targets:GetChildren()) do
						if child2.Name ~= Options.pickedMob.Value then
							hideEvent(obj.ReplicatedStorage.Remotes.quest, "Abandon", { Id = child.Name })
						end
					end
				end
			end
		end
	end

	return flag7
end

checkFF = function()
	if localPlayer.Character then
		if localPlayer.Character:FindFirstChild("ForceField") or localPlayer.Character:FindFirstChild("Invincible") then
			return true
		end
	end
end

isAlive = function()
	if localPlayer.Character then
		if localPlayer.Character:FindFirstChild("Humanoid") and localPlayer.Character.Humanoid.Health > 0 then
			if localPlayer.Character:FindFirstChild("HumanoidRootPart") and localPlayer.Character:FindFirstChild("Head") then
				return true
			end
		end
	end
end

if localPlayer:FindFirstChild("KingHakiQuestLine").FoundSea1.Value == false then
	local connection = nil

	connection = localPlayer.KingHakiQuestLine.FoundSea1:GetPropertyChangedSignal("Value"):Connect(function()
		if not flag and localPlayer.KingHakiQuestLine.FoundSea1.Value then
			lib:Notify("Found Sea 1 Poneglyph!")
			sendMessage("Found Sea 1 Poneglyph!", 1)
			connection:Disconnect()
		end
	end)
end

if localPlayer:FindFirstChild("KingHakiQuestLine").FoundSea2.Value == false then
	local connection = nil

	connection = localPlayer.KingHakiQuestLine.FoundSea2:GetPropertyChangedSignal("Value"):Connect(function()
		if not flag and localPlayer.KingHakiQuestLine.FoundSea2.Value then
			lib:Notify("Found Sea 2 Poneglyph!")
			sendMessage("Found Sea 2 Poneglyph!", 1)
			connection:Disconnect()
		end
	end)
end

findIslandParent = function(arg)
	local str4 = "Unknown"

	for _, v_3 in pairs(arg:GetTouchingParts()) do
		for _, v_4 in pairs(tbl12) do
			if v_3:FindFirstAncestor(v_4) then
				str4 = v_4
			end
		end
	end

	return str4
end

lib5:AddObjectListener(Workspace.Map.Islands, {
	Validator = function(arg)
		task.wait()

		if not flag and arg.Name ~= "Portal" and arg:IsA("BasePart") and arg:FindFirstChildOfClass("TouchTransmitter") and not arg.Parent:IsA("Tool") then
			local cFrame = arg.CFrame
			local size = arg.Size
			arg.Size = Vector3.new(20, 40, 20)
			task.wait(0.1)
			lib:Notify("A Poneglyph has spawned!")

			task.spawn(function()
				if not flag2 then
					flag2 = true
					sendMessage("A Poneglyph has spawned!\nIsland: " .. findIslandParent(arg) .. "\nPosition: " .. tostring(math.round(cFrame.X)) .. ", " .. tostring(math.round(cFrame.Y)) .. ", " .. tostring(math.round(cFrame.Z)), 1)
					task.wait(10)
					flag2 = false
				end
			end)

			arg.Size = size

			if Toggles.teleportPoneglyph and Toggles.teleportPoneglyph.Value then
				flag4 = true

				while true do
					if isAlive() then
						stabilizeTeleport()
						localPlayer.Character.HumanoidRootPart.CFrame = cFrame + Vector3.new(0, 20, 0)
						task.wait(0.5)

						for i = 20, 0, -1 do
							task.wait()
							localPlayer.Character.HumanoidRootPart.CFrame = cFrame + Vector3.new(0, i, 0)
						end
					end

					if not (not arg or flag or not isAlive() or localPlayer.Character.HumanoidRootPart.CFrame == cFrame) then
						continue
					end
					break
				end

				flag4 = false

				for i = 1, 5 do
					task.wait()
					removeHover()
				end
			end

			return arg
		end
	end,
	Recursive = true,
	PrimaryPart = function(arg)
		return arg
	end,
	Color = function()
		return Color3.fromRGB(255, 255, 0)
	end,
	CustomName = function()
		return "Poneglyph"
	end,
	IsEnabled = "Poneglyph",
})

lib5:AddObjectListener(Workspace.Visuals, {
	Validator = function(arg)
		task.wait()

		if not flag and arg:IsA("MeshPart") and arg:FindFirstChildWhichIsA("TouchTransmitter") then
			if not arg:FindFirstChildWhichIsA("HumanoidRootPart") then
				if Toggles.teleportJJKFingers and Toggles.teleportJJKFingers.Value then
					flag4 = true

					while true do
						if isAlive() then
							stabilizeTeleport()
							localPlayer.Character.HumanoidRootPart.CFrame = arg.CFrame + Vector3.new(0, 20, 0)
							task.wait(0.5)

							for i = 20, 0, -1 do
								task.wait()
								localPlayer.Character.HumanoidRootPart.CFrame = arg.CFrame + Vector3.new(0, i, 0)
							end
						end

						if not (not arg or flag or not isAlive() or localPlayer.Character.HumanoidRootPart.CFrame == arg.CFrame) then
							continue
						end
						break
					end

					flag4 = false

					for i = 1, 5 do
						task.wait()
						removeHover()
					end
				end

				return arg
			end
		end
	end,
	Recursive = true,
	PrimaryPart = function(arg)
		if arg:IsA("MeshPart") then
			return arg
		end
	end,
	Color = function()
		return Color3.fromRGB(255, 0, 247)
	end,
	CustomName = function()
		return "Finger"
	end,
	IsEnabled = "JJKFingers",
})

local v_3 = lib:CreateWindow({
	Title = "AOPG | 6FootScripts" .. returnExploit(),
	Center = true,
	AutoShow = true,
	ShowCustomCursor = false,
	Resizable = true,
})

local Main = v_3:AddTab("Main")
local v_4 = Main:AddLeftTabbox()
local Main2 = v_4:AddTab("Main")

if lgTagsTbl and table.find(lgTagsTbl, "Dev") then
	local Dev = v_4:AddTab("Dev")

	Dev:AddButton("Rejoin Server", function()
		obj.TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId)
	end)

	Dev:AddButton("Spawn Part", function()
		if obj.Workspace:FindFirstChild("IlIllllIIIlIlI") then
			obj.Workspace:FindFirstChild("IlIllllIIIlIlI"):Destroy()
		end

		local part = Instance.new("Part")
		part.Parent = obj.Workspace
		part.Name = "IlIllllIIIlIlI"
		part.Size = Vector3.new(30, 2, 30)
		part.Anchored = true
		part.CFrame = localPlayer.Character.HumanoidRootPart.CFrame - Vector3.new(0, 10, 0)
	end)

	Dev:AddButton("Copy Titles", function()
		local str4 = ""

		for _, child in pairs(localPlayer.PlayerGui.DailySpin.Rewards:GetChildren()) do
			if child.Name ~= "UIListLayout" then
				str4 ..= string.format("\"%s\"", child.Name) .. ", "
			end
		end

		setclipboard(str4 or "error")
		lib:Notify("Copied titles!")
	end)
end

Main2:AddToggle("autoFarm", { Text = "Auto Farm", Default = false }):OnChanged(function()
	if game.PlaceId == 9264222904 and Toggles.autoFarm.Value then
		Toggles.autoFarm:SetValue(false)
		lib:Notify("Not available for Raid")
	end

	if Toggles.autoFarm.Value then
		if Toggles.autoSpamSkills and Toggles.autoSpamSkills.Value then
			Toggles.autoSpamSkills:SetValue(false)
		end

		if Toggles.autoMultiFarm and Toggles.autoMultiFarm.Value then
			Toggles.autoMultiFarm:SetValue(false)
		end
	elseif isAlive() and localPlayer.Character.HumanoidRootPart:FindFirstChild("playerAttachment") then
		localPlayer.Character.HumanoidRootPart:FindFirstChild("playerAttachment"):Destroy()
	end
end)

Main2:AddToggle("autoQuest", { Text = "Auto Quest", Default = false }):OnChanged(function()
	if Toggles.autoQuest.Value then
		if not getgenv().getloadedmodules then
			Toggles.autoQuest:SetValue(false)
			lib:Notify("Bad executor")
		end

		if game.PlaceId == 9264222904 then
			Toggles.autoQuest:SetValue(false)
			lib:Notify("Not available for Raid")
		end
	end
end)

Main2:AddToggle("autoPowerUp", { Text = "Auto Transform", Default = false, Tooltip = "Check Misc tab for the supported list." }):OnChanged(function()
	task.spawn(function()
		while task.wait() and Toggles.autoPowerUp and Toggles.autoPowerUp.Value do
			PowerUp()
		end
	end)
end)

Main2:AddToggle("teleportPoneglyph", {
	Text = "Auto TP to Poneglyphs",
	Tooltip = "Poneglyphs will only spawn if a player is near it.\nTake this into consideration when farming in a private server.",
	Default = false,
}):OnChanged(function()
	if Toggles.teleportPoneglyph.Value then
		for _, descendant in pairs(Workspace.Map.Islands:GetDescendants()) do
			if descendant.Name ~= "Portal" and descendant:IsA("BasePart") and descendant:FindFirstChildOfClass("TouchTransmitter") and not descendant.Parent:IsA("Tool") and localPlayer.Character:FindFirstChild("HumanoidRootPart") then
				local cFrame = descendant.CFrame
				descendant.Size = Vector3.new(20, 20, 20)
				lib:Notify("A Poneglyph has spawned!")
				sendMessage("A Poneglyph has spawned!\nIsland: " .. findIslandParent(descendant) .. "\nPosition: " .. tostring(math.round(descendant.Position.X)) .. ", " .. tostring(math.round(descendant.Position.Y)) .. ", " .. tostring(math.round(descendant.Position.Z)), 1)
				flag4 = true
				stabilizeTeleport()

				while true do
					if isAlive() then
						stabilizeTeleport()
						localPlayer.Character.HumanoidRootPart.CFrame = cFrame + Vector3.new(0, 20, 0)
						task.wait(0.5)

						for i = 20, 0, -1 do
							task.wait()
							localPlayer.Character.HumanoidRootPart.CFrame = cFrame + Vector3.new(0, i, 0)
						end
					end

					if not (not descendant or flag or not isAlive() or localPlayer.Character.HumanoidRootPart.CFrame == cFrame) then
						continue
					end
					break
				end

				flag4 = false

				for i = 1, 5 do
					task.wait()
					removeHover()
				end
			end
		end
	end
end)

Main2:AddSlider("tweenSpeed", {
	Text = "Tween Speed",
	Default = 200,
	Min = 100,
	Max = 500,
	Rounding = 0,
	Tooltip = "Teleport Speed",
})

Main2:AddInput("customMobDistance", {
	Text = "Min/Max Mob Distance",
	Default = "130",
	Numeric = true,
	Finished = true,
	Tooltip = "Input a number and press enter",
	Placeholder = "130",
}):OnChanged(function()
	if Options.customMobDistance and Options.customMobDistance.Value and Options.mobDistance then
		if typeof(tonumber(Options.customMobDistance.Value)) == "number" then
			Options.mobDistance.Max = tonumber(Options.customMobDistance.Value)
			Options.mobDistance.Min = -tonumber(Options.customMobDistance.Value) < 0 and -tonumber(Options.customMobDistance.Value) or 0
			local value = Options.mobDistance.Value

			if tonumber(Options.customMobDistance.Value) < value then
				Options.mobDistance.Value = tonumber(Options.customMobDistance.Value)
			elseif Options.mobDistance.Value < -tonumber(Options.customMobDistance.Value) then
				Options.mobDistance.Value = -tonumber(Options.customMobDistance.Value)
			end

			Options.mobDistance:Display()
		end
	end
end)

Main2:AddSlider("mobDistance", {
	Text = "Mob Distance",
	Default = -10,
	Min = -130,
	Max = 130,
	Rounding = 0,
	Tooltip = "Mob Distance Y Axis",
})

Main2:AddDropdown("teleportMethod", { Text = "Farming Method", Default = "Teleport", Values = { "Tween", "Teleport" } })
Main2:AddDropdown("pickedMob", { Text = "Mobs", Default = "Bandit", Tooltip = "Choose a mob to farm on", Values = values })
local Main3 = Main:AddLeftTabbox("Main")
local Skills = Main3:AddTab("Skills")
Skills:AddLabel("\tMore Skills = More Lag")
Skills:AddDropdown("spamMeleeSkills", { Text = "Spam Melee Skills", Default = "", Tooltip = "Choose Skills", Values = Keybinds, Multi = true })
Skills:AddDropdown("spamGunSkills", { Text = "Spam Gun Skills", Default = "", Tooltip = "Choose Skills", Values = Keybinds, Multi = true })
Skills:AddDropdown("spamSwordSkills", { Text = "Spam Sword Skills", Default = "", Tooltip = "Choose Skills", Values = Keybinds, Multi = true })
Skills:AddDropdown("spamFruitSkills", { Text = "Spam Fruit Skills", Default = "", Tooltip = "Choose Skills", Values = Keybinds, Multi = true })

Skills:AddDropdown("spamSupportSkills", {
	Text = "Spam Support Skills",
	Default = "",
	Tooltip = "Choose Skills",
	Values = Keybinds,
	Multi = true,
})

local Haki_ = Main3:AddTab("Haki")
local tbl24 = { "Fighting Style", "Sword Style", "Gun Style", "Devil Fruit", "Support Style" }

Haki_:AddDropdown("pickedArmKey", {
	Text = "Fighting Style Armament Key",
	Default = "",
	AllowNull = true,
	Tooltip = "Choose Key",
	Values = Keybinds,
})

Haki_:AddDivider()

Haki_:AddDropdown("pickedSwordKey", {
	Text = "Sword Style Armament Key",
	Default = "G",
	AllowNull = true,
	Tooltip = "Choose Key",
	Values = Keybinds,
})

Haki_:AddDivider()

Haki_:AddDropdown("pickedObsStyle", {
	Text = "Observation Style",
	Default = "Fighting Style",
	AllowNull = true,
	Tooltip = "[Observation] Style",
	Values = tbl24,
})

Haki_:AddDropdown("pickedObsKey", { Text = "Observation Key", Default = "T", AllowNull = true, Tooltip = "Choose Key", Values = Keybinds })
Haki_:AddDivider()

Haki_:AddDropdown("pickedConqStyle", {
	Text = "Conquerer Style",
	Default = "",
	AllowNull = true,
	Tooltip = "[Conquerer] Style",
	Values = tbl24,
})

Haki_:AddDropdown("pickedConqKey", { Text = "Conquerer Key", Default = "", AllowNull = true, Tooltip = "Choose Key", Values = Keybinds })
local v_5 = Main:AddRightTabbox():AddTab("Mob Info")
local v_6 = v_5:AddLabel("Name:", true)
local v_7 = v_5:AddLabel("Health:")
local v_8 = v_5:AddLabel("B$:")
local v_9 = v_5:AddLabel("World Boss: none", true)

if not isRaid() and str2 == "FirstSea" then
	for k, v_10 in pairs(returnPones()) do
		for _, v_11 in pairs(v_10) do
			if k == str2 then
				for _, v_12 in pairs(v_11) do
					if not table.find(tbl, StringToCFrame(v_12) + Vector3.new(0, -10, 0)) then
						table.insert(tbl, StringToCFrame(v_12) + Vector3.new(0, -10, 0))
					end
				end
			end
		end
	end

	local Poneglyph = Main:AddRightTabbox():AddTab("Poneglyph")
	Poneglyph:AddToggle("loopPones", { Text = "Poneglyph Autofarm", Default = false })

	Poneglyph:AddButton("Poneglyph Teleport", function()
		if Toggles.autoFarm then
			Toggles.autoFarm:SetValue(false)
		end

		if Toggles.autoMultiFarm then
			Toggles.autoMultiFarm:SetValue(false)
		end

		lib:Notify("Teleporting to possible coordinates! Please wait...", 20)

		for k, v_10 in pairs(tbl) do
			while true do
				task.wait(1)

				if isAlive() then
					stabilizeTeleport()
					localPlayer.Character.HumanoidRootPart.CFrame = v_10 + Vector3.new(0, 20, 0)
					task.wait(0.5)

					for i = 15, 0, -1 do
						task.wait()
						localPlayer.Character.HumanoidRootPart.CFrame = v_10 + Vector3.new(0, i, 0)
					end
				end

				if not (k == #tbl or localPlayer.Character.HumanoidRootPart.CFrame == v_10 or not isAlive() or flag) then
					continue
				end
				break
			end

			if not flag then
				continue
			end
			break
		end

		removeHover()
	end)
end

local MultiFarm = Main:AddRightTabbox():AddTab("MultiFarm")

MultiFarm:AddToggle("autoMultiFarm", { Text = "Multi Farm", Default = false }):OnChanged(function()
	if game.PlaceId == 9264222904 and Toggles.autoMultiFarm.Value then
		Toggles.autoMultiFarm:SetValue(false)
		lib:Notify("Not available for Raid")
	end

	if Toggles.autoMultiFarm.Value then
		if Toggles.autoSpamSkills and Toggles.autoSpamSkills.Value then
			Toggles.autoSpamSkills:SetValue(false)
		end

		if Toggles.autoFarm and Toggles.autoFarm.Value then
			Toggles.autoFarm:SetValue(false)
		end
	elseif isAlive() and localPlayer.Character.HumanoidRootPart:FindFirstChild("playerAttachment") then
		localPlayer.Character.HumanoidRootPart:FindFirstChild("playerAttachment"):Destroy()
	end
end)

if game.PlaceId == tbl2.ThirdSea then
	MultiFarm:AddButton("Select All World Bosses", function()
		if Options.pickedMultiMob then
			for _, worldBosse in pairs(tbl3.worldBosses) do
				Options.pickedMultiMob.Value[worldBosse] = true
			end

			Options.pickedMultiMob:SetValues()
			Options.pickedMultiMob:Display()
		end
	end)
end

MultiFarm:AddButton("Clear Mob Selections", function()
	if Options.pickedMultiMob then
		Options.pickedMultiMob:SetValue({})
		Options.pickedMultiMob:Display()
	end
end)

MultiFarm:AddDropdown("pickedMultiMob", {
	Text = "Mobs",
	Default = "",
	Tooltip = "Choose multiple mobs to farm on",
	Values = values,
	Multi = true,
}):OnChanged(function()
	if Options.pickedMultiMob.Value["Sea Beast"] then
		lib:Notify("Use regular autofarm for Sea Beasts")
		Options.pickedMultiMob.Value["Sea Beast"] = false
		Options.pickedMultiMob:SetValues()
		Options.pickedMultiMob:Display()
	end
end)

local Teleports = Main:AddRightTabbox():AddTab("Teleports")
local v_10 = Teleports:AddLabel("Island Spawn: " .. stats:FindFirstChild("Spawn").Value, true)
local v_11 = Teleports:AddLabel("Sea Spawn: " .. stats:FindFirstChild("Sea").Value .. " Sea", true)

Teleports:AddDropdown("pickedSea", { Text = "Seas", Default = "", Compact = false, Tooltip = "Teleport to a Sea", Values = tbl16 }):OnChanged(function()
	if Options.pickedSea and Options.pickedSea.Value and Options.pickedSea.Value ~= "No Teleport" then
		if Options.pickedSea.Value == "First Sea" and game.PlaceId ~= tbl2.FirstSea or Options.pickedSea.Value == "Multiverse Sea" and game.PlaceId ~= tbl2.MultiverseSea then
			lib:Notify(string.format("Teleporting to %s", Options.pickedSea.Value), 999)
			hideEvent(obj.ReplicatedStorage.Remotes.Teleport, Options.pickedSea.Value)
		elseif Options.pickedSea.Value == "Second Sea" and game.PlaceId ~= tbl2.SecondSea and upgrades["Second Sea"].Value then
			lib:Notify(string.format("Teleporting to %s", Options.pickedSea.Value), 999)
			hideEvent(obj.ReplicatedStorage.Remotes.Teleport, Options.pickedSea.Value)
		elseif Options.pickedSea.Value == "Third Sea" then
			lib:Notify(string.format("Teleporting to %s", Options.pickedSea.Value), 999)
			hideEvent(obj.ReplicatedStorage.Remotes.Teleport, Options.pickedSea.Value)
		else
			lib:Notify("Access denied")
		end
	end
end)

Teleports:AddToggle("autoIsland", { Text = "Always Spawn at Island", Default = false })

Teleports:AddDropdown("pickedIsland", {
	Text = "Islands",
	Default = "",
	Compact = false,
	Tooltip = "Teleport to an island",
	Values = tbl12,
})

Teleports:AddButton("Set Spawn", function()
	if Options.pickedIsland.Value then
		Toggles.autoFarm:SetValue(false)

		if Toggles.autoMultiFarm then
			Toggles.autoMultiFarm:SetValue(false)
		end

		Toggles.autoQuest:SetValue(false)

		if localPlayer.Character:FindFirstChild("Humanoid") and localPlayer.Character.Humanoid.Health > 0 then
			for _, child in pairs(Workspace.Map.Islands:GetChildren()) do
				if child.Name == Options.pickedIsland.Value and child.Model.Spawner.Crystal:FindFirstChild("ClickDetector") and localPlayer.Character:FindFirstChild("HumanoidRootPart") then
					if isRaid() then
						lib:Notify("Not available for Raid")
					else
						while true do
							task.wait()

							if localPlayer.Character:FindFirstChild("HumanoidRootPart") then
								localPlayer.Character.HumanoidRootPart.CFrame = child.Model.Spawner.Crystal.CFrame + Vector3.new(0, -8, 0)
							end

							if child.Model.Spawner.Crystal.ClickDetector then
								fireclickdetector(child.Model.Spawner.Crystal.ClickDetector)
							end

							if not (stats.Spawn.Value == child.Name or flag or not isAlive()) then
								continue
							end
							break
						end

						if isAlive() then
							localPlayer.Character:BreakJoints()
						end

						lib:Notify("Spawn set to " .. child.Name .. "!")
					end
				end
			end
		end
	end
end)

Teleports:AddDropdown("pickedPlace", { Text = "Teleport to Public Server", Default = "", Compact = false, Values = tbl14 }):OnChanged(function()
	if Options.pickedPlace.Value and tbl15[Options.pickedPlace.Value] then
		obj.TeleportService:Teleport(tbl15[Options.pickedPlace.Value])
		lib:Notify("Teleporting to " .. Options.pickedPlace.Value, 5)
	end
end)

local Raid = v_3:AddTab("Raid")
local Raid2 = Raid:AddLeftTabbox():AddTab("Raid")

Raid2:AddToggle("autoRaid", { Text = "Auto Raid", Default = false }):OnChanged(function()
	if Toggles.autoRaid.Value then
		if Toggles.autoMaze.Value then
			Toggles.autoMaze:SetValue(false)
		end

		if Toggles.autoDungeon.Value then
			Toggles.autoDungeon:SetValue(false)
		end

		if Toggles.autoFarm.Value then
			Toggles.autoFarm:SetValue(false)
		end

		if Toggles.autoLabyrinth.Value then
			Toggles.autoLabyrinth:SetValue(false)
		end

		if Toggles.autoQuest.Value then
			Toggles.autoQuest:SetValue(false)
		end

		if Toggles.autoMultiFarm then
			Toggles.autoMultiFarm:SetValue(false)
		end

		if Toggles.autoIsland.Value then
			Toggles.autoIsland:SetValue(false)
		end

		if raidIsland() and stats.Spawn.Value ~= raidIsland() and obj.Workspace.Map.Islands:FindFirstChild(raidIsland()) then
			while true do
				task.wait()

				if raidIsland() and obj.Workspace.Map.Islands:FindFirstChild(raidIsland()) then
					if localPlayer.Character:FindFirstChild("HumanoidRootPart") then
						localPlayer.Character.HumanoidRootPart.CFrame = obj.Workspace.Map.Islands[raidIsland()].Model.Spawner.Crystal.CFrame + Vector3.new(0, -8, 0)
					end

					if obj.Workspace.Map.Islands[raidIsland()].Model.Spawner.Crystal.ClickDetector then
						fireclickdetector(obj.Workspace.Map.Islands[raidIsland()].Model.Spawner.Crystal.ClickDetector)
					end
				end

				if not (stats.Spawn.Value == raidIsland() or not Toggles.autoRaid.Value or flag) then
					continue
				end
				break
			end

			if isAlive() then
				localPlayer.Character:BreakJoints()
			end

			lib:Notify("Spawn set to " .. raidIsland() .. "!")
		end
	elseif isAlive() and localPlayer.Character.HumanoidRootPart:FindFirstChild("playerAttachment") then
		localPlayer.Character.HumanoidRootPart:FindFirstChild("playerAttachment"):Destroy()
	end
end)

Raid2:AddToggle("autoMaze", { Text = "Auto Maze", Default = false }):OnChanged(function()
	if Toggles.autoMaze.Value then
		if Toggles.autoRaid.Value then
			Toggles.autoRaid:SetValue(false)
		end

		if Toggles.autoDungeon.Value then
			Toggles.autoDungeon:SetValue(false)
		end

		if Toggles.autoFarm.Value then
			Toggles.autoFarm:SetValue(false)
		end

		if Toggles.autoLabyrinth.Value then
			Toggles.autoLabyrinth:SetValue(false)
		end

		if Toggles.autoQuest.Value then
			Toggles.autoQuest:SetValue(false)
		end

		if Toggles.autoMultiFarm then
			Toggles.autoMultiFarm:SetValue(false)
		end

		if Toggles.autoIsland.Value then
			Toggles.autoIsland:SetValue(false)
		end

		if raidIsland() and stats.Spawn.Value ~= raidIsland() and obj.Workspace.Map.Islands:FindFirstChild(raidIsland()) then
			while true do
				task.wait()

				if raidIsland() and obj.Workspace.Map.Islands:FindFirstChild(raidIsland()) then
					if localPlayer.Character:FindFirstChild("HumanoidRootPart") then
						localPlayer.Character.HumanoidRootPart.CFrame = obj.Workspace.Map.Islands[raidIsland()].Model.Spawner.Crystal.CFrame + Vector3.new(0, -8, 0)
					end

					if obj.Workspace.Map.Islands[raidIsland()].Model.Spawner.Crystal.ClickDetector then
						fireclickdetector(obj.Workspace.Map.Islands[raidIsland()].Model.Spawner.Crystal.ClickDetector)
					end
				end

				if not (stats.Spawn.Value == raidIsland() or not Toggles.autoMaze.Value or flag) then
					continue
				end
				break
			end

			if isAlive() then
				localPlayer.Character:BreakJoints()
			end

			lib:Notify("Spawn set to " .. raidIsland() .. "!")
		end
	elseif isAlive() and localPlayer.Character.HumanoidRootPart:FindFirstChild("playerAttachment") then
		localPlayer.Character.HumanoidRootPart:FindFirstChild("playerAttachment"):Destroy()
	end
end)

Raid2:AddToggle("autoDungeon", { Text = "Auto Dungeon", Default = false }):OnChanged(function()
	if Toggles.autoDungeon.Value then
		if Toggles.autoRaid.Value then
			Toggles.autoRaid:SetValue(false)
		end

		if Toggles.autoMaze.Value then
			Toggles.autoMaze:SetValue(false)
		end

		if Toggles.autoFarm.Value then
			Toggles.autoFarm:SetValue(false)
		end

		if Toggles.autoLabyrinth.Value then
			Toggles.autoLabyrinth:SetValue(false)
		end

		if Toggles.autoQuest.Value then
			Toggles.autoQuest:SetValue(false)
		end

		if Toggles.autoMultiFarm then
			Toggles.autoMultiFarm:SetValue(false)
		end

		if Toggles.autoIsland.Value then
			Toggles.autoIsland:SetValue(false)
		end

		if raidIsland() and stats.Spawn.Value ~= raidIsland() and obj.Workspace.Map.Islands:FindFirstChild(raidIsland()) then
			while true do
				task.wait()

				if raidIsland() and obj.Workspace.Map.Islands:FindFirstChild(raidIsland()) then
					if localPlayer.Character:FindFirstChild("HumanoidRootPart") then
						localPlayer.Character.HumanoidRootPart.CFrame = obj.Workspace.Map.Islands[raidIsland()].Model.Spawner.Crystal.CFrame + Vector3.new(0, -8, 0)
					end

					if obj.Workspace.Map.Islands[raidIsland()].Model.Spawner.Crystal.ClickDetector then
						fireclickdetector(obj.Workspace.Map.Islands[raidIsland()].Model.Spawner.Crystal.ClickDetector)
					end
				end

				if not (stats.Spawn.Value == raidIsland() or not Toggles.autoDungeon.Value or flag) then
					continue
				end
				break
			end

			if isAlive() then
				localPlayer.Character:BreakJoints()
			end

			lib:Notify("Spawn set to " .. raidIsland() .. "!")
		end
	elseif isAlive() and localPlayer.Character.HumanoidRootPart:FindFirstChild("playerAttachment") then
		localPlayer.Character.HumanoidRootPart:FindFirstChild("playerAttachment"):Destroy()
	end
end)

Raid2:AddToggle("autoLabyrinth", { Text = "Auto Labyrinth", Default = false }):OnChanged(function()
	if Toggles.autoLabyrinth.Value then
		if Toggles.autoRaid.Value then
			Toggles.autoRaid:SetValue(false)
		end

		if Toggles.autoDungeon.Value then
			Toggles.autoDungeon:SetValue(false)
		end

		if Toggles.autoMaze.Value then
			Toggles.autoMaze:SetValue(false)
		end

		if Toggles.autoFarm.Value then
			Toggles.autoFarm:SetValue(false)
		end

		if Toggles.autoQuest.Value then
			Toggles.autoQuest:SetValue(false)
		end

		if Toggles.autoMultiFarm then
			Toggles.autoMultiFarm:SetValue(false)
		end

		if Toggles.autoIsland.Value then
			Toggles.autoIsland:SetValue(false)
		end

		if raidIsland() and stats.Spawn.Value ~= raidIsland() and obj.Workspace.Map.Islands:FindFirstChild(raidIsland()) then
			while true do
				task.wait()

				if raidIsland() and obj.Workspace.Map.Islands:FindFirstChild(raidIsland()) then
					if localPlayer.Character:FindFirstChild("HumanoidRootPart") then
						localPlayer.Character.HumanoidRootPart.CFrame = obj.Workspace.Map.Islands[raidIsland()].Model.Spawner.Crystal.CFrame + Vector3.new(0, -8, 0)
					end

					if obj.Workspace.Map.Islands[raidIsland()].Model.Spawner.Crystal.ClickDetector then
						fireclickdetector(obj.Workspace.Map.Islands[raidIsland()].Model.Spawner.Crystal.ClickDetector)
					end
				end

				if not (stats.Spawn.Value == raidIsland() or not Toggles.autoLabyrinth.Value or flag) then
					continue
				end
				break
			end

			if isAlive() then
				localPlayer.Character:BreakJoints()
			end

			lib:Notify("Spawn set to " .. raidIsland() .. "!")
		end
	elseif isAlive() and localPlayer.Character.HumanoidRootPart:FindFirstChild("playerAttachment") then
		localPlayer.Character.HumanoidRootPart:FindFirstChild("playerAttachment"):Destroy()
	end
end)

Raid2:AddSlider("pickedHeight", { Text = "Raid Portal Distance", Default = 0, Min = -15, Max = 15, Rounding = 0, Compact = true })

Raid2:AddButton("Refresh Raid Lists", function()
	if game.PlaceId == tbl2.FirstSea then
		if not table.find(tbl3.Raids, "AttackMarineHQ") then
			table.insert(tbl3.Raids, "AttackMarineHQ")
			lib:Notify(string.format("Added 'AttackMarineHQ' Raid!"))
		end
	end

	if Workspace:FindFirstChild("Zones") then
		for _, child in pairs(Workspace.Zones:GetChildren()) do
			if not table.find(tbl3.Raids, child.Name) then
				table.insert(tbl3.Raids, child.Name)
				lib:Notify(string.format("Added '%s' %s!", child.Name, "Raid"))
			end
		end
	end

	if Workspace:FindFirstChild("MazeZones") then
		for _, child in pairs(Workspace.MazeZones:GetChildren()) do
			if not table.find(tbl3.Mazes, child.Name) then
				table.insert(tbl3.Mazes, child.Name)
				lib:Notify(string.format("Added '%s' %s!", child.Name, "Maze"))
			end
		end
	end

	if Workspace:FindFirstChild("Dungeons") then
		for _, child in pairs(Workspace.Dungeons:GetChildren()) do
			if not table.find(tbl3.Dungeons, child.Name) then
				if child.Name == "Mirror 2" then
					if not table.find(tbl3.Dungeons, "Mirror") then
						table.insert(tbl3.Dungeons, "Mirror")
						lib:Notify(string.format("Added '%s' %s!", child.Name, "Dungeon"))
					end
				else
					table.insert(tbl3.Dungeons, child.Name)
					lib:Notify(string.format("Added '%s' %s!", child.Name, "Dungeon"))
				end
			end
		end
	end

	if Workspace:FindFirstChild("Labyrinths") then
		for _, child in pairs(Workspace.Labyrinths:GetChildren()) do
			if not table.find(tbl3.Labyrinths, child.Name) then
				table.insert(tbl3.Labyrinths, child.Name)
				lib:Notify(string.format("Added '%s' %s!", child.Name, "Labyrinth"))
			end
		end
	end

	table.sort(tbl3.Raids)
	table.sort(tbl3.Mazes)
	table.sort(tbl3.Dungeons)
	table.sort(tbl3.Labyrinths)
	saveSettings()
	Options.pickedRaid.Values = tbl3.Raids
	Options.pickedRaid:SetValues()
	Options.pickedMaze.Values = tbl3.Mazes
	Options.pickedMaze:SetValues()
	Options.pickedDungeon.Values = tbl3.Dungeons
	Options.pickedDungeon:SetValues()
	Options.pickedLabyrinth.Values = tbl3.Labyrinths
	Options.pickedLabyrinth:SetValues()
end)

Raid2:AddDropdown("raidTeleportMethod", { Text = "Portal Method", Default = "Teleport", Values = { "Tween", "Teleport", "WalkTo" } })
Raid2:AddDropdown("pickedRaid", { Text = "Raids", Default = "Law", Tooltip = "Pick a Raid", Values = tbl3.Raids })
Raid2:AddDropdown("pickedMaze", { Text = "Mazes", Default = "Regular", Tooltip = "Pick a Maze", Values = tbl3.Mazes })
Raid2:AddDropdown("pickedDungeon", { Text = "Dungeons", Default = "Mirror", Tooltip = "Pick a Dungeon", Values = tbl3.Dungeons })
Raid2:AddDropdown("pickedLabyrinth", { Text = "Labyrinths", Default = "Impel", Tooltip = "Pick a Labyrinths", Values = tbl3.Labyrinths })
local v_12 = Raid:AddRightTabbox()
local v_13 = v_12:AddTab("Raid Logs")

for k, raid in pairs(tbl3.raidCounter.Raids) do
	if k and not table.find(tbl13, "\nRAIDS") then
		table.insert(tbl13, "\nRAIDS")
	end

	if tbl3.raidCounter.Raids[k] and not table.find(tbl13, "- " .. k .. ": 0") then
		table.insert(tbl13, "- " .. k .. ": " .. raid)
	end
end

for k, raid in pairs(tbl3.Raids) do
	k = k and not table.find(tbl13, "\nRAIDS")

	if k then
		table.insert(tbl13, "\nRAIDS")
	end

	if not tbl3.raidCounter.Raids[raid] and not table.find(tbl13, "- " .. raid .. ": 0") then
		table.insert(tbl13, "- " .. raid .. ": 0")
		tbl3.raidCounter.Raids[raid] = 0
	end
end

for k, maze in pairs(tbl3.raidCounter.Mazes) do
	if k and not table.find(tbl13, "\nMAZES") then
		table.insert(tbl13, "\nMAZES")
	end

	if not table.find(tbl13, "- " .. k .. ": " .. maze) then
		if tbl3.raidCounter.Mazes[k] then
			table.insert(tbl13, "- " .. k .. ": " .. maze)
		end
	end
end

for k, maze in pairs(tbl3.Mazes) do
	k = k and not table.find(tbl13, "\nMAZES")

	if k then
		table.insert(tbl13, "\nMAZES")
	end

	if not tbl3.raidCounter.Mazes[maze] and not table.find(tbl13, "- " .. maze .. ": 0") then
		table.insert(tbl13, "- " .. maze .. ": 0")
		tbl3.raidCounter.Mazes[maze] = 0
	end
end

for k, dungeon in pairs(tbl3.raidCounter.Dungeons) do
	if not table.find(tbl13, "- " .. k .. ": " .. dungeon) and k ~= "Mirror 2" then
		if tbl3.raidCounter.Dungeons[k] then
			if k and not table.find(tbl13, "\nDUNGEONS") then
				table.insert(tbl13, "\nDUNGEONS")
			end

			table.insert(tbl13, "- " .. k .. ": " .. dungeon)
		end
	end
end

for k, dungeon in pairs(tbl3.Dungeons) do
	if not tbl3.raidCounter.Dungeons[dungeon] and dungeon ~= "Mirror 2" and not table.find(tbl13, "- " .. dungeon .. ": 0") then
		k = k and not table.find(tbl13, "\nDUNGEONS")

		if k then
			table.insert(tbl13, "\nDUNGEONS")
		end

		table.insert(tbl13, "- " .. dungeon .. ": 0")
		tbl3.raidCounter.Dungeons[dungeon] = 0
	end
end

for k, labyrinth in pairs(tbl3.raidCounter.Labyrinths) do
	if k and not table.find(tbl13, "\nLABYRINTHS") then
		table.insert(tbl13, "\nLABYRINTHS")
	end

	if not table.find(tbl13, "- " .. k .. ": " .. labyrinth) then
		if tbl3.raidCounter.Labyrinths[k] then
			table.insert(tbl13, "- " .. k .. ": " .. labyrinth)
		end
	end
end

for k, labyrinth in pairs(tbl3.Labyrinths) do
	k = k and not table.find(tbl13, "\nLABYRINTHS")

	if k then
		table.insert(tbl13, "\nLABYRINTHS")
	end

	if not tbl3.raidCounter.Labyrinths[labyrinth] and not table.find(tbl13, "- " .. labyrinth .. ": 0") then
		table.insert(tbl13, "- " .. labyrinth .. ": 0")
		tbl3.raidCounter.Labyrinths[labyrinth] = 0
	end
end

trackRaid = function()
	if not isRaid() then
		return
	end
	local v_14 = nil

	for _, v_15 in pairs(tbl13) do
		if checkInstance() == "Mirror 2" then
			if string.find(v_15, "Mirror") then
				v_14 = v_15
				break
			else
				v_14 = nil
			end
		elseif string.find(v_15, checkInstance()) then
			v_14 = v_15
			break
		else
			v_14 = nil
		end
	end

	return v_14
end

if isRaid() and trackRaid() then
	v_13:AddLabel("Current Raid")
	liveCounterLabel = v_13:AddLabel(trackRaid())

	for _, v_14 in pairs(tbl13) do
		if v_14 ~= trackRaid() then
			v_13:AddLabel(v_14)
		end
	end
else
	for _, v_14 in pairs(tbl13) do
		v_13:AddLabel(v_14)
	end
end

saveSettings()
local v_14 = v_12:AddTab("Reset Logs")
v_14:AddDropdown("resetCounterRaids", { Text = "Reset Raids", Default = "", Values = tbl3.Raids })

v_14:AddButton("Reset Raid Counter", function()
	if tbl3.raidCounter.Raids[Options.resetCounterRaids.Value] then
		tbl3.raidCounter.Raids[Options.resetCounterRaids.Value] = 0
		saveSettings()
		local value = Options.resetCounterRaids.Value

		if string.find(trackRaid(), value) and liveCounterLabel then
			liveCounterLabel:SetText(string.format("• %s : 0", Options.resetCounterRaids.Value))
		end

		lib:Notify("Reset " .. Options.resetCounterRaids.Value .. " Raid to 0")
	end
end)

v_14:AddDropdown("resetCounterMazes", { Text = "Reset Mazes", Default = "", Values = tbl3.Mazes })

v_14:AddButton("Reset Maze Counter", function()
	if tbl3.raidCounter.Mazes[Options.resetCounterMazes.Value] then
		tbl3.raidCounter.Mazes[Options.resetCounterMazes.Value] = 0
		saveSettings()
		local value = Options.resetCounterMazes.Value

		if string.find(trackRaid(), value) and liveCounterLabel then
			liveCounterLabel:SetText(string.format("• %s : 0", Options.resetCounterMazes.Value))
		end

		lib:Notify("Reset " .. Options.resetCounterMazes.Value .. " Maze to 0")
	end
end)

v_14:AddDropdown("resetCounterDungeons", { Text = "Reset Dungeons", Default = "", Values = tbl3.Dungeons })

v_14:AddButton("Reset Dungeon Counter", function()
	if tbl3.raidCounter.Dungeons[Options.resetCounterDungeons.Value] then
		tbl3.raidCounter.Dungeons[Options.resetCounterDungeons.Value] = 0
		saveSettings()
		local value = Options.resetCounterDungeons.Value

		if string.find(trackRaid(), value) and liveCounterLabel then
			liveCounterLabel:SetText(string.format("• %s : 0", Options.resetCounterDungeons.Value))
		end

		lib:Notify("Reset " .. Options.resetCounterDungeons.Value .. " Dungeon to 0")
	end
end)

v_14:AddDropdown("resetCounterLabyrinth", { Text = "Reset Labyrinth", Default = "", Values = tbl3.Labyrinths })

v_14:AddButton("Reset Labyrinth Counter", function()
	if tbl3.raidCounter.Labyrinths[Options.resetCounterLabyrinth.Value] then
		tbl3.raidCounter.Labyrinths[Options.resetCounterLabyrinth.Value] = 0
		saveSettings()
		local value = Options.resetCounterLabyrinth.Value

		if string.find(trackRaid(), value) and liveCounterLabel then
			liveCounterLabel:SetText(string.format("• %s : 0", Options.resetCounterLabyrinth.Value))
		end

		lib:Notify("Reset " .. Options.resetCounterLabyrinth.Value .. " Labyrinth to 0")
	end
end)

local Shortcuts = v_3:AddTab("Shortcuts")
local Shortcuts2 = Shortcuts:AddLeftTabbox():AddTab("Shortcuts")
local v_15 = Shortcuts2:AddLabel("Race: " .. stats.Race.Value)
local v_16 = Shortcuts2:AddLabel("Title: " .. stats.Title.Value)

Shortcuts2:AddToggle("autoRace", { Text = "Auto Spin Races [G$ 500]", Default = false, Tooltip = "Server lag can cause mis-spins." }):OnChanged(function()
	if Toggles.autoRace.Value and not obj.ReplicatedStorage.Remotes:FindFirstChild("PurchaseGemItem") then
		lib:Notify("Error! Could not find 'PurchaseGemItem' remote. Try another place.")
		Toggles.autoRace:SetValue(false)
	end
end)

Shortcuts2:AddToggle("autoTitle", { Text = "Auto Spin Titles", Default = false, Tooltip = "Server lag can cause mis-spins." }):OnChanged(function()
	if Toggles.autoTitle.Value and not obj.ReplicatedStorage.Remotes:FindFirstChild("RequestSpinReward") then
		lib:Notify("Error! Could not find 'RequestSpinReward' remote. Try another place.")
		Toggles.autoTitle:SetValue(false)
	end
end)

Shortcuts2:AddDropdown("pickedRace", {
	Text = "Races",
	Tooltip = "Warning: some of these races might not be available in-game.",
	Default = "",
	Multi = true,
	Values = tbl18,
})

Shortcuts2:AddDropdown("pickedTitle", { Text = "Titles", Default = "", Multi = true, Values = tbl19 })

if game.PlaceId == tbl2.MultiverseSea then
	local v_17 = Shortcuts:AddLeftTabbox():AddTab("Multiverse Sea")
	local v_18 = v_17:AddLabel("Fingers: " .. stats.Fingers.Value)

	v_17:AddToggle("espFingers", { Text = "Show JJK Fingers", Default = false }):OnChanged(function()
		lib5.JJKFingers = Toggles.espFingers.Value
	end)

	v_17:AddToggle("teleportJJKFingers", {
		Text = "Auto TP to JJK Fingers",
		Tooltip = "Fingers will only spawn if a player is near it.\nTake this into consideration when farming in a private server.",
		Default = false,
	}):OnChanged(function()
		if Toggles.teleportJJKFingers.Value then
			for _, child in pairs(Workspace.Visuals:GetChildren()) do
				if child:IsA("MeshPart") and child:FindFirstChildWhichIsA("TouchTransmitter") and localPlayer.Character:FindFirstChild("HumanoidRootPart") then
					flag4 = true

					while true do
						if isAlive() then
							stabilizeTeleport()
							localPlayer.Character.HumanoidRootPart.CFrame = child.CFrame + Vector3.new(0, 20, 0)
							task.wait(0.5)

							for i = 20, 0, -1 do
								task.wait()
								localPlayer.Character.HumanoidRootPart.CFrame = child.CFrame + Vector3.new(0, i, 0)
							end
						end

						if not (not child or flag or not isAlive() or localPlayer.Character.HumanoidRootPart.CFrame == child.CFrame) then
							continue
						end
						break
					end

					flag4 = false

					for i = 1, 5 do
						task.wait()
						removeHover()
					end
				end
			end
		end
	end)

	v_17:AddButton("Naruto Scrolls", function()
		if not fireclickdetector then
			return lib:Notify("Your executor does not support `fireclickdetector`")
		end

		for _, child in pairs(obj.Workspace.Scrolls:GetChildren()) do
			if child:FindFirstChild("Scroll") and child.Scroll:FindFirstChild("ClickDetector") then
				fireclickdetector(child.Scroll.ClickDetector)
				lib:Notify(string.format("Found Scroll #%s", child.Name))
			end
		end
	end)

	v_:GiveTask(stats.Fingers.Changed:connect(function()
		if not flag and v_18 then
			v_18:SetText("Fingers: " .. stats.Fingers.Value)
		end
	end))
end

local NPCs = Shortcuts:AddLeftTabbox():AddTab("NPCs")
local tbl25 = {}

for _, child in pairs(obj.Workspace.Interactables:GetChildren()) do
	if not string.find(child.Name, "Quest") and child:FindFirstChild("ClickPart") and child.ClickPart:FindFirstChild("ClickDetector") then
		if not table.find(tbl25, child.Name) then
			if child.Name == "Gem Merchant" then
				table.insert(tbl25, "Awakened NPC")
			else
				table.insert(tbl25, child.Name)
				table.sort(tbl25)
			end
		end
	end
end

for _, v_17 in pairs(tbl25) do
	if obj.Workspace.Interactables:FindFirstChild(v_17) then
		local v_18 = obj.Workspace.Interactables:FindFirstChild(v_17)

		if v_18:FindFirstChild("ClickPart") and v_18.ClickPart:FindFirstChild("ClickDetector") then
			NPCs:AddButton(v_17, function()
				fireclickdetector(v_18.ClickPart:FindFirstChild("ClickDetector"))
			end)
		end
	end
end

local tbl26 = {
	["Buy Devil Fruit"] = { "buyrngdf", 25000000 },
	["Remove Devil Fruit"] = { "removedf", 5000000 },
	["Buy Island Tracker"] = { "purchase", 500000 },
	["Buy Quest Scroll"] = { "purchase", 500000 * stats.Quests.Value },
	["Awaken Devil Fruit"] = { "awakenmove", "???" },
	["Buy Title"] = { "buytitle", "G$ 750" },
	[string.format("Buy +%s Gem Cap", 1000)] = { "gemcap", "x1 Poneglyph" },
}

local Shortcuts3 = Shortcuts:AddRightTabbox("Main"):AddTab("Shortcuts")
local v_17 = Shortcuts3:AddLabel("Poneglyphs: " .. stats.Poneglyphs.Value)
local v_18 = Shortcuts3:AddLabel("Title Spins: " .. extra.Spins.Title.Value or "Unknown")
local convertToDashedNumber = GlobalFunctions2.convertToDashedNumber
local n3 = localPlayer.Stats.Poneglyphs.Value * n
local v_19 = Shortcuts3:AddLabel(string.format("Gem Cap: G$ %s (%s)", GlobalFunctions2.convertToDashedNumber(math.round(localPlayer.Stats.GemCapUnlock.Value) * n + n2), convertToDashedNumber(math.round(localPlayer.Stats.GemCapUnlock.Value) * n + n2 + n3)))

if obj.ReplicatedStorage.Remotes:FindFirstChild("gemcap") then
	Shortcuts3:AddToggle("autoBuyGemCap", { Text = "AutoBuy Gem Cap", default = false }):OnChanged(function()
		if Toggles.autoBuyGemCap.Value and not obj.ReplicatedStorage.Remotes:FindFirstChild("gemcap") then
			lib:Notify("Error! Could not find 'gemcap' remote. Try another place.")
			Toggles.autoBuyGemCap:SetValue(false)
		end
	end)
end

if obj.ReplicatedStorage.Remotes:FindFirstChild("buytitle") then
	Shortcuts3:AddToggle("autoBuyTitles", { Text = "AutoBuy Title", default = false }):OnChanged(function()
		if Toggles.autoBuyTitles.Value and not obj.ReplicatedStorage.Remotes:FindFirstChild("buytitle") then
			lib:Notify("Error! Could not find 'buytitle' remote. Try another place.")
			Toggles.autoBuyTitles:SetValue(false)
		end
	end)
end

for k, v_20 in pairs(tbl26) do
	if obj.ReplicatedStorage.Remotes:FindFirstChild(v_20[1]) then
		Shortcuts3:AddButton({
			Text = k .. " [" .. (typeof(v_20[2]) == "number" and "$" .. GlobalFunctions2.toSuffixString(v_20[2]) or v_20[2]) .. "]",
			DoubleClick = true,
			Func = function()
				if k == string.format("Buy +%s Gem Cap", 1000) and stats.Poneglyphs.Value > 0 then
					if obj.ReplicatedStorage.Remotes:FindFirstChild(v_20[1]) then
						obj.ReplicatedStorage.Remotes:FindFirstChild(v_20[1]):FireServer()
						lib:Notify("Success! Updated Gem Cap: G$" .. GlobalFunctions2.convertToDashedNumber(math.round(localPlayer.Stats.GemCapUnlock.Value + 1) * n + n2), 5)
					else
						lib:Notify("Error! Not enough to purchase or remote not found.", 5)
					end
				elseif k == "Buy Title" and stats.Gems.Value >= 750 then
					if obj.ReplicatedStorage.Remotes:FindFirstChild(v_20[1]) then
						obj.ReplicatedStorage.Remotes:FindFirstChild(v_20[1]):FireServer("1")
						lib:Notify("Success! Bought a Title")
					else
						lib:Notify("Error! Not enough to purchase or remote not found.", 5)
					end
				elseif k == "Awaken Devil Fruit" and stats.Gems.Value > 0 then
					if obj.ReplicatedStorage.Remotes:FindFirstChild(v_20[1]) then
						obj.ReplicatedStorage.Remotes:FindFirstChild(v_20[1]):FireServer()
					end
				elseif obj.ReplicatedStorage.Remotes:FindFirstChild(v_20[1]) and v_20[2] ~= "???" and stats.Beli.Value >= v_20[2] then
					if k == "Buy Island Tracker" then
						obj.ReplicatedStorage.Remotes:FindFirstChild(v_20[1]):FireServer("Island Tracker")
					elseif k == "Buy Quest Scroll" then
						obj.ReplicatedStorage.Remotes:FindFirstChild(v_20[1]):FireServer("Quest Scroll")
					else
						local value = stats.Beli.Value

						if tonumber(v_20[2]) <= value then
							if obj.ReplicatedStorage.Remotes:FindFirstChild(v_20[1]) then
								obj.ReplicatedStorage.Remotes:FindFirstChild(v_20[1]):FireServer()
							else
								lib:Notify("Unable to find remote. Try another sea.", 5)
							end
						end
					end
				end
			end,
		})
	end
end

Shortcuts3:AddDivider()
Shortcuts3:AddToggle("removeNotifications", { Text = "Remove Popups", Default = false })
local v_20 = Shortcuts3:AddLabel("Cost: B$")

Shortcuts3:AddInput("fruitAmount", {
	Text = "Fruit Amount",
	Default = "1",
	Numeric = true,
	Finished = false,
	Tooltip = "Press ENTER after input!",
	Placeholder = "How many?",
}):OnChanged(function()
	if v_20 and Options.fruitAmount and Options.fruitAmount.Value then
		v_20:SetText(string.format("Cost: B$ %s or B$%s", GlobalFunctions2.toSuffixString(25000000 * math.round(tonumber(Options.fruitAmount.Value or 1))), GlobalFunctions2.convertToDashedNumber(25000000 * math.round(tonumber(Options.fruitAmount.Value or 1)))))
	end
end)

Shortcuts3:AddButton(string.format("Buy Devil Fruit(s)", tostring(Options.fruitAmount and Options.fruitAmount.Value or 1)), function()
	if obj.ReplicatedStorage.Remotes:FindFirstChild("buyrngdf") then
		obj.ReplicatedStorage.Remotes:FindFirstChild("buyrngdf"):FireServer(tostring(Options.fruitAmount and Options.fruitAmount.Value or 1))
		lib:Notify(string.format("Successfully purchased x%s Devil Fruits!", tostring(Options.fruitAmount and Options.fruitAmount.Value or 1)))
	else
		lib:Notify("Unable to find remote. Try another sea.", 5)
	end
end)

Shortcuts3:AddToggle("loopBuyFruit", { Text = "Auto Buy Devil Fruits", Default = false }):OnChanged(function()
	if Toggles.infoItems and Toggles.infoItems.Value then
		Toggles.infoItems:SetValue(false)
		lib:Notify("New Item webhook must remain off when you buy lots of fruits or you will crash!")
	end
end)

Shortcuts3:AddToggle("stopSpinningFruits", { Text = "Toggle Spin For Fruits mode", Default = false })
Shortcuts3:AddDropdown("spinningFruits", { Text = "Fruits", Default = "", Multi = true, Values = tbl10 })
local Chests = Shortcuts:AddRightTabbox():AddTab("Chests")

Chests:AddDropdown("chestsToOpen", {
	Text = "Chests",
	Default = "",
	Multi = true,
	Values = { "Accessory Chest", "Artifact Chest", "Event Chest", "Item Chest", "Weapon Chest" },
})

Chests:AddToggle("openChests", { Text = "Open Chests", Default = false }):OnChanged(function()
	if Toggles.openChests.Value then
		local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()

		while Toggles.openChests.Value do
			for k in pairs(Options.chestsToOpen.Value) do
				if backpack:FindFirstChild(k) or character:FindFirstChild(k) then
					for _, child in ipairs(backpack:GetChildren()) do
						if child.Name == k then
							child.Parent = character
							task.wait()

							if character:FindFirstChild(k) then
								character[k]:Activate()
							end
						end
					end

					for _, child in ipairs(character:GetChildren()) do
						if child.Name == k then
							child:Activate()
							task.wait()
						end
					end
				end
			end

			task.wait(1)
		end
	end
end)

local Misc = v_3:AddTab("Misc")
local v_21 = Misc:AddLeftTabbox()
local Misc2 = v_21:AddTab("Misc")
Misc2:AddToggle("includeFruits", { Text = "Include Fruits", Default = false })
Misc2:AddToggle("includeAccessories", { Text = "Include Accessories", Default = false })
Misc2:AddDropdown("playerInventory", { Text = "Player", Default = "", Values = values3 })

Misc2:AddButton("Refresh Players", function()
	values3 = {}

	for _, player in pairs(obj.Players:GetPlayers()) do
		if not table.find(values3, player.DisplayName) then
			table.insert(values3, player.DisplayName)
		end
	end

	Options.playerInventory.Values = values3
	Options.playerInventory:SetValues()
end)

Misc2:AddButton("Send Webhook", function()
	if not Options.playerInventory.Value then
		lib:Notify("Pick a player!")
		return
	end

	if not getUser(Options.playerInventory.Value) then
		return
	end

	for _, child in pairs(getUser(Options.playerInventory.Value).Inventory:GetChildren()) do
		if child.Value > 0 then
			if Toggles.includeAccessories.Value then
				if obj.ReplicatedStorage.Assets.Tools:FindFirstChild(child.Name) and not table.find(tbl21, child.Name) then
					table.insert(tbl8, "x" .. child.Value .. " " .. child.Name .. "\n")
				end
			end

			if Toggles.includeFruits.Value then
				if string.find(child.Name, "Fruit") then
					table.insert(tbl8, "x" .. child.Value .. " " .. child.Name .. "\n")
				end
			end
		end
	end

	table.sort(tbl8, function(arg, arg2)
		return getNumber(arg) > getNumber(arg2)
	end)

	sendInventory()
	tbl8 = {}
end)

local Storage = v_21:AddTab("Storage")
task.spawn(function()local N;N=hookmetamethod(game,"__newindex",function(t,J,C)if not checkcaller()and J=="Enabled"and C==false then if t.Name=="ItemStorage"and(t:IsDescendantOf( localPlayer .PlayerGui))then return;end;end;return N(t,J,C);end);end)

Storage:AddButton("Toggle Storage", function()
	local itemStorage = localPlayer.PlayerGui:WaitForChild("ItemStorage")

	if itemStorage then
		itemStorage.Enabled = not itemStorage.Enabled
	end
end)

Storage:AddToggle("autoStorage", { Text = "Auto Storage", Default = false })
Storage:AddDropdown("pickedInventoryItems", { Text = "Items", Default = "", Values = tbl20, Multi = true })
local Misc3 = Misc:AddRightTabbox("Misc"):AddTab("Misc")
Misc3:AddToggle("autoEquip", { Text = "Auto Equip", Default = false })
Misc3:AddDropdown("findItem", { Text = "Equip Item", Default = "", Values = values2 })

Misc3:AddButton("Equip Item", function()
	if localPlayer.Backpack then
		for _, child in pairs(localPlayer.Backpack:GetChildren()) do
			if child.Name == Options.findItem.Value then
				localPlayer.PlayerGui.Inventory.Manager.Toolbar:FireServer(9, child)
				lib:Notify("Equipped " .. Options.findItem.Value .. "!")
				break
			end
		end
	end
end)

Misc3:AddButton("Refresh Inventory", function()
	values2 = {}

	for _, child in pairs(localPlayer.Backpack:GetChildren()) do
		if child:IsA("Tool") then
			if not table.find(values2, child.Name) then
				table.insert(values2, child.Name)
			end
		end
	end

	table.sort(values2)
	Options.findItem.Values = values2
	Options.findItem:SetValues()
end)

Misc3:AddDivider()
Misc3:AddLabel("SUPPORTED TRANSFORMATIONS:")
table.sort(tbl23)

for _, v_22 in pairs(tbl23) do
	Misc3:AddLabel("• " .. v_22)
end

local Webhook = v_3:AddTab("Webhook")
local Webhook2 = Webhook:AddLeftTabbox():AddTab("Webhook")
Webhook2:AddToggle("webhookToggle", { Text = "Webhook", Default = false })
Webhook2:AddToggle("infoStats", { Text = "Log Stats", Default = false })
Webhook2:AddToggle("infoRaids", { Text = "Log Raids", Default = false })

Webhook2:AddInput("webhookTag", {
	Text = "Discord Mention",
	Default = "",
	Finished = true,
	Tooltip = "Options:\neveryone\nDiscord ID",
	Placeholder = "Optional",
}):OnChanged(function()
	if Options.webhookTag.Value ~= "" then
		if Options.webhookTag.Value ~= "everyone" and typeof(tonumber(Options.webhookTag.Value)) ~= "number" then
			Options.webhookTag:SetValue("")
			lib:Notify("Wrong! Your Discord ID is all numbers.", 10)
		end
	end
end)

Webhook2:AddInput("webhookUrl", {
	Text = "Webhook Url",
	Default = "",
	Finished = true,
	Tooltip = "Input a webhook url and press enter",
	Placeholder = "Webhook url",
})

Webhook2:AddDropdown("discordNotifications", {
	Text = "Mention Logs",
	Default = "",
	Tooltip = "Only want to be tagged for certain logs?",
	Multi = true,
	Values = { "Stats", "Raids", "Items", "WorldBosses" },
})

Webhook2:AddButton("Test Webhook", function()
	sendMessage("Success", "yes")
end)

local Webhook3 = Webhook:AddRightTabbox():AddTab("Webhook")

Webhook3:AddToggle("infoItems", { Text = "Log Items", Tooltip = "Spam buying random fruits can crash you.", Default = false }):OnChanged(function()
	if Toggles.loopBuyFruit and Toggles.loopBuyFruit.Value and Toggles.infoItems and Toggles.infoItems.Value then
		Toggles.infoItems:SetValue(false)
		lib:Notify("New Item webhook must remain off when you buy lots of fruits or you will crash!")
	end
end)

Webhook3:AddToggle("whitelistedItems", { Text = "Only Log Whitelisted Items", Default = false })

Webhook3:AddDropdown("pickedWhitelistedItem", {
	Text = "Whitelisted Items",
	Default = "",
	Tooltip = "You will only get pinged for whitelisted items.",
	Values = tbl20,
	Multi = true,
})

local Webhook4 = Webhook:AddRightTabbox():AddTab("Webhook")
Webhook4:AddToggle("notifyWorldBoss", { Text = "Notify World Boss", Default = false })
Webhook4:AddDropdown("pickedWorldBoss", { Text = "World Bosses", Default = "", Values = tbl3.worldBosses, Multi = true })

v_3:AddTab("ESP"):AddLeftTabbox():AddTab("ESP"):AddToggle("espPoneglyph", { Text = "Show Poneglyphs", Default = false }):OnChanged(function()
	lib5.Poneglyph = Toggles.espPoneglyph.Value
end)

local Settings2 = v_3:AddTab("Settings")
local Credits = Settings2:AddRightTabbox():AddTab("Credits")
Credits:AddLabel("Inori - UI Lib")
Credits:AddLabel("Wally - UI Lib")
Credits:AddLabel("mstudio45 - UI Lib")
Credits:AddLabel("Kiriot22 - ESP Lib")
Credits:AddLabel("6Foot4Honda - Scripting")

if response and not response:find("404") then
	Credits:AddButton("Discord Server", function()
		setclipboard("https://discord.gg/" .. response)
		lib:Notify("Copied Discord Server Invite!", 10)
		local request_ = http_request or request or HttpPost or syn.request

		if request_ then
			request_({
				Url = "http://127.0.0.1:6463/rpc?v=1",
				Method = "POST",
				Headers = { ["Content-Type"] = "application/json", Origin = "https://discord.com" },
				Body = obj.HttpService:JSONEncode({
					cmd = "INVITE_BROWSER",
					args = { code = response },
					nonce = obj.HttpService:GenerateGUID(false),
				}),
			})
		end
	end)
end

Credits:AddButton("Unload Script", function()
	lib:Unload()
end)

Credits:AddLabel("Menu bind"):AddKeyPicker("MenuKeybind", { Default = tbl4.MenuKeybind or "RightControl", NoUI = true, Text = "Menu keybind" })

Options.MenuKeybind:OnClick(function()
	tbl4.MenuKeybind = Options.MenuKeybind.Value
	saveHubSettings()
end)

lib.ToggleKeybind = Options.MenuKeybind

Credits:AddToggle("elapsedTimer", { Text = "Show Elapsed Timer", Default = false }):OnChanged(function()
	lib:SetWatermarkVisibility(Toggles.elapsedTimer.Value)
end)

Credits:AddToggle("unlockFPS", { Text = "Unlock FPS", Default = false }):OnChanged(function()
	if Toggles.unlockFPS.Value then
		if not setfpscap then
			lib:Notify("Error, your executor does not support setfpscap")
			Toggles.unlockFPS:SetValue(false)
		end
	elseif setfpscap then
		setfpscap(60)
	end
end)

local v_22 = Credits:AddDependencyBox()
v_22:SetupDependencies({ { Toggles.unlockFPS, true } })

v_22:AddSlider("pickedFPS", { Text = "FPS", Default = 60, Min = 15, Max = 155, Rounding = 0, Compact = true }):OnChanged(function()
	if Toggles.unlockFPS and Toggles.unlockFPS.Value and Options.pickedFPS.Value then
		setfpscap(Options.pickedFPS.Value)
	end
end)

obj.RunService.Stepped:Connect(function(...) end)

lib:OnUnload(function()
	lib.Unloaded = true
	Options = {}
	Toggles = {}
	lib5:Toggle(false)
	lib5 = nil
	getgenv().SixFootCheck = nil
	flag = true
	v_:DoCleaning()
	v_2:DoCleaning()
	saveHubSettings()

	if isAlive() then
		localPlayer.Character.HumanoidRootPart.Anchored = false

		for _, child in pairs(localPlayer.Character.HumanoidRootPart:GetChildren()) do
			if child:IsA("BodyPosition") or child:IsA("BodyVelocity") or child:IsA("LinearVelocity") or child:IsA("BodyGyro") or child.Name == "playerAttachment" then
				child:Destroy()
			end
		end
	end
end)

local Theme = Settings2:AddLeftTabbox():AddTab("Theme")

Theme:AddDropdown("rainbowColors", {
	Text = "Rainbow",
	Default = 1,
	Values = { "AccentColor", "BackgroundColor", "FontColor", "MainColor" },
	Multi = true,
})

lib3:CreateThemeManager(Theme)
lib2:BuildConfigSection(Settings2)
lib2:SetIgnoreIndexes({ "MenuKeybind", "findItem", "playerInventory", "pickedPlace", "showItems", "keepItemsSearchbox" })
lib2:LoadAutoloadConfig()

local function fn4()
	lib.BackgroundColor = Options.BackgroundColor.Value
	lib.MainColor = Options.MainColor.Value
	lib.AccentColor = Options.AccentColor.Value
	lib.AccentColorDark = lib:GetDarkerColor(lib.AccentColor)
	lib.OutlineColor = Options.OutlineColor.Value
	lib.FontColor = Options.FontColor.Value
	lib:UpdateColorsUsingRegistry()
end

task.spawn(function(...) end)

Options.rainbowColors:OnChanged(function()
	fn4()
end)

Options.BackgroundColor:OnChanged(fn4)
Options.MainColor:OnChanged(fn4)
Options.AccentColor:OnChanged(fn4)
Options.OutlineColor:OnChanged(fn4)
Options.FontColor:OnChanged(fn4)

if tbl4.MenuKeybind then
	lib:Notify("Press " .. tbl4.MenuKeybind .. " To Hide!", 10)
else
	lib:Notify("Press Right Ctrl or Right Shift To Hide!", 10)
end

teleportationMethod = function(arg)
	if arg and arg:FindFirstChild("HumanoidRootPart") then
		if Options.teleportMethod.Value == "Tween" then
			TweenTp(arg.HumanoidRootPart, Vector3.new(0, Options.mobDistance.Value, 0))
		elseif Options.teleportMethod.Value == "Teleport" then
			localPlayer.Character.HumanoidRootPart.CFrame = arg.HumanoidRootPart.CFrame + Vector3.new(0, Options.mobDistance.Value, 0)

			if isAlive() then
				stabilizeTeleport()
			end
		end
	end
end

local flag7 = false

task.spawn(function()
	if isRaid() then
		local str4 = nil

		while true do
			task.wait()
			if not (localPlayer.PlayerGui and localPlayer.PlayerGui:FindFirstChild("RaidClear", true) or flag) then
				continue
			end
			break
		end

		v_:GiveTask(localPlayer.PlayerGui:FindFirstChild("RaidClear", true).Changed:Connect(function()
			if not flag7 and localPlayer.PlayerGui and localPlayer.PlayerGui:FindFirstChild("RaidClear", true).Visible and not flag then
				flag7 = true

				if game.PlaceId == 9264222904 and Toggles.autoRaid.Value then
					local value = checkInstance() or Options.pickedRaid.Value

					if value then
						str4 = "Raid"

						if tbl3.raidCounter.Raids[value] then
							tbl3.raidCounter.Raids[value] = tbl3.raidCounter.Raids[value] + 1
						else
							tbl3.raidCounter.Raids[value] = 1
						end

						if trackRaid() and string.find(trackRaid(), value) and liveCounterLabel then
							liveCounterLabel:SetText(string.format("• %s : %s -> %s", value, tbl3.raidCounter.Raids[value] - 1 < 0 and 0 or tbl3.raidCounter.Raids[value] - 1, tbl3.raidCounter.Raids[value]))
						end

						lib:Notify(string.format("Updated %s log: %s -> %s", str4, value, tbl3.raidCounter.Raids[value]), 10)
					end
				elseif game.PlaceId == 9572329421 and Toggles.autoMaze.Value then
					local value = checkInstance() or Options.pickedMaze.Value

					if value then
						str4 = "Maze"

						if tbl3.raidCounter.Mazes[value] then
							tbl3.raidCounter.Mazes[value] = tbl3.raidCounter.Mazes[value] + 1
						else
							tbl3.raidCounter.Mazes[value] = 1
						end

						if trackRaid() and string.find(trackRaid(), value) and liveCounterLabel then
							liveCounterLabel:SetText(string.format("• %s : %s -> %s", value, tbl3.raidCounter.Mazes[value] - 1 < 0 and 0 or tbl3.raidCounter.Mazes[value] - 1, tbl3.raidCounter.Mazes[value]))
						end

						lib:Notify(string.format("Updated %s log: %s -> %s", str4, value, tbl3.raidCounter.Mazes[value]), 10)
					end
				elseif game.PlaceId == 9812430518 and Toggles.autoDungeon.Value then
					local value = checkInstance() or Options.pickedDungeon.Value

					if value then
						str4 = "Dungeon"

						if value == "Mirror 2" then
							value = "Mirror"
						end

						if tbl3.raidCounter.Dungeons[value] then
							tbl3.raidCounter.Dungeons[value] = tbl3.raidCounter.Dungeons[value] + 1
						else
							tbl3.raidCounter.Dungeons[value] = 1
						end

						if trackRaid() and string.find(trackRaid(), value) and liveCounterLabel then
							liveCounterLabel:SetText(string.format("• %s : %s -> %s", value, tbl3.raidCounter.Dungeons[value] - 1 < 0 and 0 or tbl3.raidCounter.Dungeons[value] - 1, tbl3.raidCounter.Dungeons[value]))
						end

						lib:Notify(string.format("Updated %s log: %s -> %s", str4, value, tbl3.raidCounter.Dungeons[value]), 10)
					end
				elseif game.PlaceId == 11287074228 and Toggles.autoLabyrinth.Value then
					local value = checkInstance() or Options.pickedLabyrinth.Value

					if value then
						str4 = "Labyrinth"

						if tbl3.raidCounter.Labyrinths[value] then
							tbl3.raidCounter.Labyrinths[value] = tbl3.raidCounter.Labyrinths[value] + 1
						else
							tbl3.raidCounter.Labyrinths[value] = 1
						end

						if trackRaid() and string.find(trackRaid(), value) and liveCounterLabel then
							liveCounterLabel:SetText(string.format("• %s : %s -> %s", value, tbl3.raidCounter.Labyrinths[value] - 1 < 0 and 0 or tbl3.raidCounter.Labyrinths[value] - 1, tbl3.raidCounter.Labyrinths[value]))
						end

						lib:Notify(string.format("Updated %s log: %s -> %s", str4, value, tbl3.raidCounter.Labyrinths[value]), 10)
					end
				end

				saveSettings()
				raidWebhook()
				task.wait(0.5)
				flag7 = false

				for k in pairs(tbl6) do
				end
			end
		end))
	end
end)

if obj.Workspace:FindFirstChild("SpecialChestSpawns") then
	v_:GiveTask(obj.Workspace.SpecialChestSpawns.ChildAdded:Connect(function(child)
		task.wait()

		if child:IsA("BasePart") and child:FindFirstChild("ClickDetector") and not flag then
			flag4 = true
			stabilizeTeleport()
			lib:Notify("Teleporting to a chest", 10)

			while true do
				task.wait()

				if isAlive() and child:IsA("BasePart") then
					localPlayer.Character.HumanoidRootPart.CFrame = child.CFrame

					if child:FindFirstChild("ClickDetector") then
						fireclickdetector(child.ClickDetector)
					end
				end

				if not (not v or v == nil or flag) then
					continue
				end
				break
			end

			flag4 = false
		end
	end))
end

v_:GiveTask(stats:FindFirstChild("Spawn").Changed:connect(function()
	if not flag and v_10 then
		v_10:SetText("Island Spawn: " .. stats:FindFirstChild("Spawn").Value)
	end
end))

v_:GiveTask(stats:FindFirstChild("Sea").Changed:connect(function()
	if not flag and v_11 then
		if game.PlaceId == 11216777504 then
			v_11:SetText("Sea Spawn: Multiverse Sea", true)
		else
			v_11:SetText("Sea Spawn: " .. stats:FindFirstChild("Sea").Value .. " Sea", true)
		end
	end
end))

v_:GiveTask(extra.Spins.Title.Changed:connect(function()
	if not flag and v_18 then
		v_18:SetText("Title Spins: " .. extra.Spins.Title.Value)
	end
end))

v_:GiveTask(stats.Poneglyphs.Changed:connect(function()
	if not flag then
		if v_17 then
			v_17:SetText("Poneglyphs: " .. stats.Poneglyphs.Value)
		end

		if v_19 then
			task.wait(1)
			local convertToDashedNumber2 = GlobalFunctions2.convertToDashedNumber
			local n4 = localPlayer.Stats.Poneglyphs.Value * n
			v_19:SetText(string.format("Gem Cap: G$ %s (%s)", GlobalFunctions2.convertToDashedNumber(math.round(localPlayer.Stats.GemCapUnlock.Value) * n + n2), convertToDashedNumber2(math.round(localPlayer.Stats.GemCapUnlock.Value) * n + n2 + n4)))
		end
	end
end))

v_:GiveTask(stats.GemCapUnlock.Changed:connect(function()
	if not flag and v_19 then
		task.wait(1)
		local convertToDashedNumber2 = GlobalFunctions2.convertToDashedNumber
		local n4 = localPlayer.Stats.Poneglyphs.Value * n
		v_19:SetText(string.format("Gem Cap: G$ %s (%s)", GlobalFunctions2.convertToDashedNumber(math.round(localPlayer.Stats.GemCapUnlock.Value) * n + n2), convertToDashedNumber2(math.round(localPlayer.Stats.GemCapUnlock.Value) * n + n2 + n4)))
	end
end))

v_:GiveTask(stats.Title:GetPropertyChangedSignal("Value"):Connect(function()
	if not flag and v_16 then
		v_16:SetText("Title: " .. stats.Title.Value)
	end
end))

v_:GiveTask(stats.Race:GetPropertyChangedSignal("Value"):connect(function()
	if not flag and v_15 then
		v_15:SetText("Race: " .. localPlayer.Stats.Race.Value)
	end
end))

v_:GiveTask(obj.ReplicatedStorage.ChildAdded:Connect(function(child)
	task.wait()

	if not flag and not isRaid() and child:IsA("Model") and child:FindFirstChild("HumanoidRootPart") and child:FindFirstChild("Data") and not table.find(values, child.Name) then
		table.insert(values, child.Name)
		table.sort(values)
		Options.pickedMob.Values = values
		Options.pickedMultiMob.Values = values
		Options.pickedMob:SetValues()
		Options.pickedMultiMob:SetValues()
		lib:Notify(string.format("Added '%s' mob to list", child.Name))
	end
end))

v_:GiveTask(obj.Workspace.Entities.ChildAdded:Connect(function(child)
	task.wait()

	if not flag and child:IsA("Model") and not isRaid() and child:FindFirstChild("HumanoidRootPart") and child:FindFirstChild("Data") and not table.find(values, child.Name) then
		table.insert(values, child.Name)
		table.sort(values)
		Options.pickedMob.Values = values
		Options.pickedMultiMob.Values = values
		Options.pickedMob:SetValues()
		Options.pickedMultiMob:SetValues()
		lib:Notify(string.format("Added '%s' mob to list", child.Name))
	end
end))

v_:GiveTask(stats.Title:GetPropertyChangedSignal("Value"):Connect(function()
	if not flag then
		local pickedTitle = Toggles.autoTitle and Toggles.autoTitle.Value and Options.pickedTitle

		if pickedTitle then
			local value = localPlayer.Stats.Title.Value
			pickedTitle = table.find(Options.pickedTitle:GetActiveValues(), value)
		end

		if pickedTitle then
			Toggles.autoTitle:SetValue(false)
			lib:Notify(string.format("Auto spun for %s Title!", stats.Title.Value))
			sendMessage(string.format("Auto spun for %s Title!", stats.Title.Value))
		end
	end
end))

if obj.Workspace.Visuals:FindFirstChild("World Boss") then
	if obj.Workspace.Visuals:FindFirstChild("World Boss"):FindFirstChild("WorldBoss").Value then
		local worldBoss = obj.Workspace.Visuals:FindFirstChild("World Boss").WorldBoss

		if v_9 and worldBoss then
			v_9:SetText(string.format("World Boss: %s", worldBoss.Value.Name or "none"))
		end

		if Toggles.notifyWorldBoss.Value and Options.pickedWorldBoss.Value[worldBoss.Value] then
			sendMessage(string.format("World Boss: `%s` has spawned!", worldBoss.Value.Name), "yes")
		end

		lib:Notify(string.format("World Boss: %s has spawned!", worldBoss.Value.Name), 10)
	end

	v_:GiveTask(obj.Workspace.Entities.ChildAdded:Connect(function(child)
		task.wait()

		if child and child:GetAttribute("WorldBoss") then
			if v_9 and child then
				v_9:SetText(string.format("World Boss: %s", child.Name or "none"))
			end

			if Toggles.notifyWorldBoss.Value and Options.pickedWorldBoss.Value[child.Name] then
				sendMessage(string.format("World Boss: `%s` has spawned!", child.Name), "yes")
			end

			lib:Notify(string.format("World Boss: %s has spawned!", child.Name), 10)
		end
	end))

	v_:GiveTask(obj.Workspace.Entities.ChildRemoved:Connect(function(child)
		task.wait()

		if child and child:GetAttribute("WorldBoss") then
			local v_23 = v_9

			if not v_9 then
				child = v_23
			end

			if child then
				v_9:SetText("World Boss: none")
			end
		end
	end))
end

runScripts = function(arg)
	v_2:DoCleaning()

	while true do
		task.wait()
		if not (arg or flag) then
			continue
		end
		break
	end

	arg:WaitForChild("HumanoidRootPart")
	arg:WaitForChild("Head")
	arg:WaitForChild("Humanoid")
	localPlayer:WaitForChild("Backpack")
	localPlayer:WaitForChild("Inventory")

	if obj.ReplicatedStorage:FindFirstChild("SFX", true) then
		require(obj.ReplicatedStorage.Modules.Client.SFX)
	end

	task.spawn(function()
		if checkInstance() then
			while true do
				task.wait(1)
				if not (localPlayer.PlayerGui:FindFirstChild("Start Votes") and localPlayer.PlayerGui["Start Votes"]:FindFirstChild("Event")) then
					continue
				end
				break
			end

			localPlayer.PlayerGui["Start Votes"].Event:FireServer()
			lib:Notify(string.format("Starting %s raid!", checkInstance()), 5)
		end
	end)

	if localPlayer.PlayerGui:FindFirstChild("MainGui") and localPlayer.PlayerGui.MainGui:FindFirstChild("CordFrame") then
		if localPlayer.PlayerGui.MainGui.CordFrame.Visible then
			localPlayer.PlayerGui.MainGui.CordFrame.Visible = false
		end
	end

	if isAlive() then
		if localPlayer.Character:FindFirstChild("Client Swimming") then
			localPlayer.Character:FindFirstChild("Client Swimming"):Destroy()
		end

		if localPlayer.Character:FindFirstChild("Character Tilting") then
			localPlayer.Character:FindFirstChild("Character Tilting"):Destroy()
		end

		if localPlayer.Character:FindFirstChild("ForceField") then
			lib:Notify("Waiting for forcefield to go away...", 5)
		end
	end

	if localPlayer.PlayerGui:FindFirstChild("MainGui") and localPlayer.PlayerGui.MainGui:FindFirstChild("DailyReward") then
		if localPlayer:IsInGroup(13494271) then
			hideEvent(obj.ReplicatedStorage.Remotes.daily)
		end

		task.wait()
		localPlayer.PlayerGui.MainGui.DailyReward:Destroy()
	end

	v_2:GiveTask(localPlayer.Backpack.ChildRemoved:Connect(function(child)
		task.wait()

		if not flag then
			if not localPlayer.Character:FindFirstChild(child.Name) then
				if tbl11[child.Name] then
					tbl11[child.Name] = tbl11[child.Name] - 1
				end
			end
		end
	end))

	v_2:GiveTask(obj.RunService.Stepped:Connect(function()
		if not flag and isAlive() then
			if localPlayer.Character:FindFirstChildOfClass("MeshPart") then
				localPlayer.Character:FindFirstChildOfClass("MeshPart"):Destroy()
			end

			if Toggles.autoEquip.Value and Options.findItem.Value then
				if localPlayer.Backpack:FindFirstChild(Options.findItem.Value) and not localPlayer.Character:FindFirstChild(Options.findItem.Value) then
					localPlayer.PlayerGui.Inventory.Manager.Toolbar:FireServer(1, localPlayer.Backpack[Options.findItem.Value])
				end
			end
		end
	end))

	v_2:GiveTask(localPlayer.PlayerGui.MainGui.Beli.ChildAdded:Connect(function(child)
		task.wait()

		if Toggles.removeNotifications.Value and string.find(child.Name, "TextLabel0") then
			child:Destroy()
		end
	end))

	v_2:GiveTask(localPlayer.Backpack.ChildAdded:Connect(function(child)
		task.wait()

		if Toggles.loopBuyFruit and Toggles.loopBuyFruit.Value and Options.spinningFruits.Value[child.Name] and Toggles.stopSpinningFruits.Value then
			Toggles.loopBuyFruit:SetValue(false)
			lib:Notify("Spinning stopped for " .. child.Name .. "!", 5)
			sendMessage("Spinning stopped for " .. child.Name .. "!", 1)
		end
	end))
end

pcall(function()
	v_:GiveTask(localPlayer.CharacterAdded:connect(runScripts, localPlayer.Character))

	v_:GiveTask(localPlayer.Inventory.ChildAdded:Connect(function(child)
		if not flag then
			if Toggles.infoItems and Toggles.infoItems.Value then
				if Toggles.whitelistedItems and Toggles.whitelistedItems.Value then
					if Options.pickedWhitelistedItem.Value and table.find(Options.pickedWhitelistedItem:GetActiveValues(), child.Name) then
						newItem(child.Name, "new")
					end
				else
					newItem(child.Name, "new")
				end
			end

			if not table.find(tbl11, child.Name) then
				tbl11[child.Name] = child.Value
			end

			child:GetPropertyChangedSignal("Value"):Connect(function()
				if not flag and Toggles.infoItems and Toggles.infoItems.Value and child.Value > tbl11[child.Name] then
					if Toggles.whitelistedItems and Toggles.whitelistedItems.Value then
						local value = Options.pickedWhitelistedItem.Value

						if value then
							local name = child.Name
							value = table.find(Options.pickedWhitelistedItem:GetActiveValues(), name)
						end

						if value then
							newItem(child.Name, "increased", child.Value)
							tbl11[child.Name] = child.Value
						end
					else
						newItem(child.Name, "increased", child.Value)
						tbl11[child.Name] = child.Value
					end
				end
			end)
		end
	end))
end)

if localPlayer.Character then
	task.spawn(runScripts, localPlayer.Character)
end

for _, child in pairs(stats:GetChildren()) do
	if table.find(tbl5, child.Name) then
		child.Changed:connect(function()
			if not flag then
				if Toggles.infoStats.Value then
					LevelUpWebhook(child.Name)
				end
			end
		end)
	end
end

if hookfunction and not isRaid() then
	task.spawn(function(...) end)
end

task.spawn(function()
	while obj.RunService.Heartbeat:Wait() and not flag do
		if Toggles.loopPones and Toggles.loopPones.Value and #tbl > 0 then
			if not loopingPones then
				loopingPones = true
				local exitTo = nil

				for k, v_23 in pairs(tbl) do
					while true do
						task.wait(1)

						if isAlive() then
							stabilizeTeleport()
							localPlayer.Character.HumanoidRootPart.CFrame = v_23 + Vector3.new(0, 20, 0)
							task.wait(0.5)

							for i = 15, 0, -1 do
								task.wait()
								localPlayer.Character.HumanoidRootPart.CFrame = v_23 + Vector3.new(0, i, 0)
							end
						end

						if not (k == #tbl or localPlayer.Character.HumanoidRootPart.CFrame == v_23 or not isAlive() or flag or Toggles.loopPones and not Toggles.loopPones.Value) then
							continue
						end
						break
					end

					if flag or Toggles.loopPones and not Toggles.loopPones.Value then
						exitTo = 1
						break
					end
				end

				if exitTo == 1 then
					for i = 1, 5 do
						task.wait()
						removeHover()
					end
				end

				loopingPones = false
			end
		end
	end
end)

task.spawn(function()
	while obj.RunService.Heartbeat:Wait() and not flag do
		if not flag then
			local v_23 = fn2()

			if isAlive() then
				Haki()
			end

			if Toggles.autoFarm.Value and not checkFF() and isAlive() and not checkQuest() and Options.pickedMob.Value and not flag4 then
				if v_23 then
					if v_23:FindFirstChild("HumanoidRootPart") then
						if Toggles.autoQuest.Value or not Toggles.autoQuest.Value then
							teleportationMethod(v_23)
							flag3 = true
						end
					end
				end
			end

			if Toggles.autoMultiFarm and Toggles.autoMultiFarm.Value and not checkFF() and isAlive() and not checkQuest() and Options.pickedMultiMob.Value and not flag4 then
				if v_23 then
					if v_23:FindFirstChild("HumanoidRootPart") then
						teleportationMethod(v_23)
						flag3 = true
					end
				end
			end

			if Toggles.autoRaid and Toggles.autoRaid.Value and isAlive() then
				if checkInstance() == "AttackMarineHQ" then
					local goal = localPlayer.PlayerGui.SpecialRaid.goal

					if goal then
						if string.find(goal.Text, "go free the") and not tbl6.AttackMarineHQ_FreedPirate then
							tbl6.AttackMarineHQ_FreedPirate = true
							obj.ReplicatedStorage.SpecialRaidRemote:FireServer()
							print("talked to pirate")
						end

						if string.find(goal.Text, "Nice! Looks like a mysterious Fishman") and not tbl6.AttackMarineHQ_Fisherman then
							tbl6.AttackMarineHQ_Fisherman = true
							obj.ReplicatedStorage.SpecialRaidRemote:FireServer()
							print("talked to fisherman")
						end
					end

					if obj.Workspace:FindFirstChild("Raid Map") then
						if not tbl6.AttackMarineHQ_FindKey and obj.Workspace["Raid Map"]:FindFirstChild("key") and obj.Workspace["Raid Map"]:FindFirstChild("TouchInterest", true) then
							tbl6.AttackMarineHQ_FindKey = true
							localPlayer.Character.HumanoidRootPart.CFrame = obj.Workspace["Raid Map"]:FindFirstChild("TouchInterest", true).Parent.CFrame
							touch(obj.Workspace["Raid Map"]:FindFirstChild("TouchInterest", true).Parent)
							print("found key")
						end
					end
				end

				if game.PlaceId == 9264222904 then
					stabilizeTeleport()

					if not checkFF() and not flag5 then
						if v_23 then
							if not checkFF() and v_23:FindFirstChild("HumanoidRootPart") and localPlayer.Character:FindFirstChild("HumanoidRootPart") then
								teleportationMethod(v_23)
								flag3 = true
							end
						elseif not v_23 then
							flag3 = false

							if checkInstance() ~= "AttackMarineHQ" then
								localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(49, 14953, 1721)
							end
						end
					elseif checkFF() then
						flag3 = false

						if checkInstance() ~= "AttackMarineHQ" then
							localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(45, 15700, 1717)
						end
					end
				end
			end

			if Toggles.autoMaze and Toggles.autoMaze.Value and isAlive() then
				if game.PlaceId == 9572329421 then
					stabilizeTeleport()

					if not checkFF() and not flag5 then
						if v_23 then
							if not checkFF() and v_23:FindFirstChild("HumanoidRootPart") and localPlayer.Character:FindFirstChild("HumanoidRootPart") then
								teleportationMethod(v_23)
								flag3 = true
							end
						elseif not v_23 then
							flag3 = false

							if Options.pickedMaze.Value == "Halloween" then
								localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-29248, 26507, -364)
							else
								localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(555, 15561, -4092)
							end
						end
					elseif checkFF() then
						flag3 = false

						if Options.pickedMaze.Value == "Halloween" then
							localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-29248, 26507, -364)
						else
							localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(555, 15561, -4092)
						end
					end
				end
			end

			if Toggles.autoLabyrinth and Toggles.autoLabyrinth.Value and isAlive() then
				if game.PlaceId == 11287074228 then
					stabilizeTeleport()

					if not checkFF() and not flag5 then
						if v_23 then
							if not checkFF() and v_23:FindFirstChild("HumanoidRootPart") and localPlayer.Character:FindFirstChild("HumanoidRootPart") then
								teleportationMethod(v_23)
								flag3 = true
							end
						elseif not v_23 then
							flag3 = false
							localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1009, 15818, 2981)
						end
					elseif checkFF() then
						flag3 = false
						localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1009, 15818, 2981)
					end
				end
			end

			if Toggles.autoDungeon and Toggles.autoDungeon.Value and isAlive() then
				if Options.pickedDungeon.Value then
					if (game.PlaceId == tbl2.FirstSea or game.PlaceId == tbl2.SecondSea or game.PlaceId == tbl2.ThirdSea or game.PlaceId == tbl2.MultiverseSea) and obj.Workspace:FindFirstChild("Dungeons") then
						local mirror2

						if game.PlaceId == tbl2.FirstSea then
							if Options.pickedDungeon.Value == "Mirror" then
								mirror2 = obj.Workspace.Dungeons:FindFirstChild("Mirror 2")
							else
								mirror2 = obj.Workspace.Dungeons:FindFirstChild(Options.pickedDungeon.Value)
							end
						else
							local dungeons = obj.Workspace.Dungeons
							mirror2 = nil

							if dungeons:FindFirstChild(Options.pickedDungeon.Value) then
								mirror2 = obj.Workspace.Dungeons:FindFirstChild(Options.pickedDungeon.Value)
							end
						end

						if mirror2 and Options.pickedHeight then
							if Options.raidTeleportMethod and Options.raidTeleportMethod.Value == "Tween" then
								TweenTp(mirror2, Vector3.new(0, Options.pickedHeight.Value, 0))
							elseif Options.raidTeleportMethod and Options.raidTeleportMethod.Value == "Teleport" then
								stabilizeTeleport()
								localPlayer.Character.HumanoidRootPart.CFrame = mirror2.CFrame + Vector3.new(0, Options.pickedHeight.Value, 0)
							end
						end
					end
				end

				if game.PlaceId == 9812430518 then
					stabilizeTeleport()

					if not checkFF() and not flag5 then
						if v_23 then
							if not checkFF() and v_23:FindFirstChild("HumanoidRootPart") and localPlayer.Character:FindFirstChild("HumanoidRootPart") then
								teleportationMethod(v_23)
								flag3 = true
							end
						else
							flag3 = false
							localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(69, 15736, 1633)
						end
					else
						flag3 = false
						localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(69, 15736, 1633)
					end
				end
			end
		end
	end
end)

task.spawn(function()
	while true do
		task.wait()
		if not (obj.CoreGui.RobloxPromptGui.promptOverlay:FindFirstChild("ErrorPrompt") or flag) then
			continue
		end
		break
	end

	if not flag and table.find(tbl9, game.PlaceId) then
		str3 = "Failed"

		if Toggles.infoRaids and Toggles.infoRaids.Value then
			raidWebhook()
		end
	end

	if not flag and isRaid() then
		lib:Notify("Player disconnected; rejoining game")
		sendMessage("Player disconnected; attempting to rejoin game", 1)
		teleportToLowestServer(game.PlaceId)
	end
end)

task.spawn(function()
	while task.wait(0.5) and not flag do
		if Toggles.autoRace and Toggles.autoRace.Value and stats.Gems.Value >= 500 and #Options.pickedRace:GetActiveValues() > 0 then
			if not table.find(Options.pickedRace:GetActiveValues(), localPlayer.Stats.Race.Value) then
				obj.ReplicatedStorage.Remotes.PurchaseGemItem:FireServer("Race Re-Roll")
				task.wait(2)
				lib:Notify("Purchased " .. localPlayer.Stats.Race.Value)
			end
		end

		if Toggles.autoTitle and Toggles.autoTitle.Value and extra.Spins.Title.Value > 0 and #Options.pickedTitle:GetActiveValues() > 0 then
			if not table.find(Options.pickedTitle:GetActiveValues(), localPlayer.Stats.Title.Value) then
				hideEvent(obj.ReplicatedStorage.Remotes.RequestSpinReward, { Action = "Claim", Type = "Title" })
				task.wait(2)
				lib:Notify("Purchased " .. localPlayer.Stats.Title.Value)
			end
		end

		if Toggles.autoBuyGemCap and Toggles.autoBuyGemCap.Value and stats.Poneglyphs.Value > 0 then
			if obj.ReplicatedStorage.Remotes:FindFirstChild("gemcap") then
				hideEvent(obj.ReplicatedStorage.Remotes.gemcap)
			end
		end

		if Toggles.autoBuyTitles and Toggles.autoBuyTitles.Value and stats.Gems.Value >= 1000 then
			if obj.ReplicatedStorage.Remotes:FindFirstChild("buytitle") then
				hideEvent(obj.ReplicatedStorage.Remotes.buytitle)
			end
		end

		if Toggles.loopBuyFruit.Value then
			task.wait()

			if Options.fruitAmount and Options.fruitAmount.Value then
			end

			if 25000000 * (Options.fruitAmount and Options.fruitAmount.Value ~= "" and Options.fruitAmount.Value or 1) <= stats.Beli.Value then
				obj.ReplicatedStorage.Remotes:FindFirstChild("buyrngdf"):FireServer(tostring(Options.fruitAmount and Options.fruitAmount.Value or 1))
			else
				lib:Notify("Need more Beli")
			end
		end

		if Toggles.autoStorage and Toggles.autoStorage.Value and Options.pickedInventoryItems and #Options.pickedInventoryItems:GetActiveValues() > 0 then
			for _, child in pairs(localPlayer.Backpack:GetChildren()) do
				if table.find(Options.pickedInventoryItems:GetActiveValues(), child.Name) then
					if child:IsA("Tool") and (child:FindFirstChild("Handle") or child:FindFirstChild("Activation")) then
						if localPlayer.Inventory:FindFirstChild(child.Name) and localPlayer.Inventory:FindFirstChild(child.Name).Value > 0 then
							if not (flag or not Toggles.autoStorage.Value) then
								obj.ReplicatedStorage.Remotes.ItemStorage:FireServer(child.Name, "Storage")
								continue
							end
						else
							continue
						end
					else
						continue
					end
				else
					continue
				end

				break
			end
		end
	end
end)

while task.wait() and not flag do
	if lib.Unloaded then
		v_2:DoCleaning()
		v_:DoCleaning()
		flag = true
	end

	if isAlive() then
		if Toggles.autoFarm and Toggles.autoFarm.Value or Toggles.autoMultiFarm and Toggles.autoMultiFarm.Value then
			for _, child in pairs(localPlayer.Character.HumanoidRootPart:GetChildren()) do
				if isAlive() and child:IsA("BodyPosition") and child.Name ~= "TeleportBP" or child:IsA("BodyGyro") or child:IsA("Sound") or child:IsA("BodyVelocity") and child.Name ~= "TeleportBV" and child.Name ~= "TweenBV" then
					child:Destroy()
				end
			end
		end
	end

	local v_23 = fn2()

	if v_23 then
		v_6:SetText("Name: " .. v_23.Name)
		v_7:SetText(string.format("Health: %s / %s", GlobalFunctions2.convertToDashedNumber(math.round(v_23.Humanoid.Health)), v_23.Humanoid.MaxHealth >= 1e9 and GlobalFunctions2.toSuffixString(v_23.Humanoid.MaxHealth) or GlobalFunctions2.convertToDashedNumber(math.round(v_23.Humanoid.MaxHealth))))

		if v_23:FindFirstChild("Data") and v_23.Data:FindFirstChild("Rewards") then
			v_8:SetText(string.format("B$: %s", v_23.Data.Rewards:FindFirstChild("Beli") and GlobalFunctions2.toSuffixString(v_23.Data.Rewards.Beli.Value) or ""))
		end
	else
		v_6:SetText("Name:")
		v_7:SetText("Health:")
		v_8:SetText("B$:")
	end

	if Toggles.autoIsland and Toggles.autoIsland.Value and (not Toggles.autoRaid.Value or not Toggles.autoMaze.Value) and Options.pickedIsland.Value and stats.Spawn.Value ~= Options.pickedIsland.Value and Workspace.Map.Islands:FindFirstChild(Options.pickedIsland.Value) then
		if localPlayer.Character:FindFirstChild("Humanoid") and localPlayer.Character.Humanoid.Health > 0 then
			for _, child in pairs(Workspace.Map.Islands:GetChildren()) do
				if child.Name == Options.pickedIsland.Value and child.Model.Spawner.Crystal:FindFirstChild("ClickDetector") and localPlayer.Character:FindFirstChild("HumanoidRootPart") then
					if game.PlaceId == 9264222904 or game.PlaceId == 9572329421 or game.PlaceId == 9812430518 then
						lib:Notify("Not available for Raid")
					else
						while true do
							task.wait()

							if localPlayer.Character:FindFirstChild("HumanoidRootPart") then
								localPlayer.Character.HumanoidRootPart.CFrame = child.Model.Spawner.Crystal.CFrame + Vector3.new(0, -8, 0)
							end

							fireclickdetector(child.Model.Spawner.Crystal.ClickDetector)
							if not (stats.Spawn.Value == child.Name or not Toggles.autoIsland.Value) then
								continue
							end
							break
						end

						if stats.Spawn.Value == child.Name then
							localPlayer.Character:BreakJoints()
							localPlayer.Character.HumanoidRootPart:Destroy()
						end
					end
				end
			end
		end
	end

	if Toggles.autoFarm.Value and not checkFF() and isAlive() and not checkQuest() and Options.pickedMob.Value and not flag4 then
		if not fn2() and Toggles.autoQuest then
			flag3 = false
			if Toggles.autoQuest.Value and checkQuest() then
				return
			end

			if Options.pickedMob.Value == "Sea Beast" and Workspace.Visuals:FindFirstChild("Seabeast") and Workspace.Visuals.Seabeast:FindFirstChild("Part") then
				if Options.teleportMethod.Value == "Tween" then
					TweenTp(Workspace.Visuals.Seabeast.Part.Position)
				elseif Options.teleportMethod.Value == "Teleport" then
					localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Workspace.Visuals.Seabeast.Part.Position)
				end
			elseif obj.ReplicatedStorage:FindFirstChild(Options.pickedMob.Value) then
				if Options.teleportMethod.Value == "Tween" then
					TweenTp(obj.ReplicatedStorage:FindFirstChild(Options.pickedMob.Value).WorldPivot.Position)
				elseif Options.teleportMethod.Value == "Teleport" then
					localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(obj.ReplicatedStorage:FindFirstChild(Options.pickedMob.Value).WorldPivot.Position)
				end
			end
		end
	end

	if Toggles.autoMultiFarm and Toggles.autoMultiFarm.Value and not checkFF() and isAlive() and not checkQuest() and Options.pickedMultiMob.Value and not flag4 then
		if not fn2() then
			flag3 = false

			for _, child in pairs(obj.ReplicatedStorage:GetChildren()) do
				if Options.pickedMultiMob.Value[child.Name] and fn2() == nil and isAlive() and Toggles.autoMultiFarm.Value then
					flag3 = false

					if Options.teleportMethod.Value == "Tween" then
						TweenTp(child.WorldPivot.Position)
					elseif Options.teleportMethod.Value == "Teleport" then
						localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(child.WorldPivot.Position)
					end
				end
			end
		end
	end

	if Toggles.autoRaid and Toggles.autoRaid.Value and isAlive() then
		if not isRaid() then
			if Options.pickedRaid.Value and Options.pickedHeight then
				if Options.pickedRaid.Value == "AttackMarineHQ" then
					obj.ReplicatedStorage.Remotes.SpecialRaid:FireServer("AttackMarineHQ")
				else
					local v_24 = Workspace.Zones:FindFirstChild(Options.pickedRaid.Value)

					if v_24 then
						if Options.raidTeleportMethod and Options.raidTeleportMethod.Value == "Tween" then
							TweenTp(v_24, Vector3.new(0, Options.pickedHeight.Value, 0))
						elseif Options.raidTeleportMethod and Options.raidTeleportMethod.Value == "Teleport" then
							stabilizeTeleport()
							localPlayer.Character.HumanoidRootPart.CFrame = v_24.CFrame + Vector3.new(0, Options.pickedHeight.Value, 0)
						end
					end
				end
			end
		end
	end

	if Toggles.autoMaze and Toggles.autoMaze.Value and isAlive() then
		if not isRaid() then
			if Options.pickedMaze.Value and Workspace:FindFirstChild("MazeZones") and Options.pickedHeight then
				local v_24 = Workspace.MazeZones:FindFirstChild(Options.pickedMaze.Value)

				if v_24 then
					if Options.raidTeleportMethod and Options.raidTeleportMethod.Value == "Tween" then
						TweenTp(v_24, Vector3.new(0, Options.pickedHeight.Value, 0))
					elseif Options.raidTeleportMethod and Options.raidTeleportMethod.Value == "Teleport" then
						stabilizeTeleport()
						localPlayer.Character.HumanoidRootPart.CFrame = v_24.CFrame + Vector3.new(0, Options.pickedHeight.Value, 0)
					end
				end
			end
		end
	end

	if Toggles.autoLabyrinth and Toggles.autoLabyrinth.Value and isAlive() then
		if not isRaid() then
			if Options.pickedLabyrinth.Value and Workspace:FindFirstChild("Labyrinths") and Options.pickedHeight then
				local v_24 = Workspace.Labyrinths:FindFirstChild(Options.pickedLabyrinth.Value)

				if v_24 then
					if Options.raidTeleportMethod and Options.raidTeleportMethod.Value == "Tween" then
						TweenTp(v_24, Vector3.new(0, Options.pickedHeight.Value, 0))
					elseif Options.raidTeleportMethod and Options.raidTeleportMethod.Value == "Teleport" then
						stabilizeTeleport()
						localPlayer.Character.HumanoidRootPart.CFrame = v_24.CFrame + Vector3.new(0, Options.pickedHeight.Value, 0)
					end
				end
			end
		end
	end

	if Toggles.autoQuest.Value and Options.pickedMob.Value and not flag4 and not checkFF() then
		if checkQuest() then
			checkQuest()
			local value = stats.Quests.Value

			if #quests2:GetChildren() ~= value then
				for k, v_24 in pairs(module) do
					if checkQuest() then
						if typeof(v_24) == "table" then
							for k2, v_25 in pairs(v_24) do
								if checkQuest() then
									for k3 in pairs(v_25.Targets) do
										if checkQuest() then
											if k3 == Options.pickedMob.Value and string.find(k.Name:lower(), "quest dummy") then
												if Workspace.Interactables:FindFirstChild(k.Name) and Workspace.Interactables[k.Name]:FindFirstChild("HumanoidRootPart") then
													if Options.teleportMethod.Value == "Tween" then
														TweenTp(Workspace.Interactables[k.Name]:FindFirstChild("HumanoidRootPart"), Vector3.new(0, -11, 0))
													elseif Options.teleportMethod.Value == "Teleport" then
														if isAlive() then
															localPlayer.Character.HumanoidRootPart.CFrame = Workspace.Interactables[k.Name]:FindFirstChild("HumanoidRootPart").CFrame + Vector3.new(0, -11, 0)
														end
													end

													questNPC = Workspace.Interactables[k.Name]:FindFirstChild("HumanoidRootPart")
													hideEvent(obj.ReplicatedStorage.Remotes.quest, "Accept", { Index = k2, Model = k })
												end
											end

											continue
										end

										break
									end

									continue
								end

								break
							end
						end

						continue
					end

					break
				end
			end
		end
	end

	local flag8 = flag3 and isAlive() and fn2() and Toggles.autoFarm and Toggles.autoFarm.Value or Toggles.autoMultiFarm and Toggles.autoMultiFarm.Value or Toggles.autoRaid and Toggles.autoRaid.Value and game.PlaceId == 9264222904 or Toggles.autoMaze and Toggles.autoMaze.Value and game.PlaceId == 9572329421 or Toggles.autoLabyrinth and Toggles.autoLabyrinth.Value and game.PlaceId == 11287074228
	local flag9

	if flag8 then
		flag9 = flag8
	else
		flag9 = Toggles.autoDungeon and Toggles.autoDungeon.Value and game.PlaceId == 9812430518
	end

	if flag9 then
		if localPlayer.Character and localPlayer.Character:FindFirstChild("Humanoid") then
			if v_23 then
				laggyAttackMob(v_23)
			end
		end
	end

	if Toggles.autoStaminaReset and Toggles.autoStaminaReset.Value and localPlayer.Character then
		if states.Stamina.Value <= states.MaxStamina.Value * 0.05 then
			localPlayer.Character:BreakJoints()
		end
	end

	local flag10 = Toggles.autoFarm and not Toggles.autoFarm.Value
	local flag11

	if flag10 then
		flag11 = Toggles.autoMultiFarm and not Toggles.autoMultiFarm.Value
	else
		flag11 = flag10
	end

	flag11 = flag11 and not Toggles.autoRaid.Value and not Toggles.autoMaze.Value and not Toggles.autoDungeon.Value and not Toggles.autoLabyrinth.Value

	if flag11 then
		if isAlive() and localPlayer.Character.HumanoidRootPart:FindFirstChild("TeleportBV") then
			localPlayer.Character.HumanoidRootPart.TeleportBV:Destroy()
		end
	end
end
