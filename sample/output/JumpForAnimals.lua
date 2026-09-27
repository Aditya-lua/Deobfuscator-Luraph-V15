task.spawn(pcall, function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/tienkhanh1/spicy/refs/heads/main/DiscordLink"))()
end)

local v

local function fn()
	local response = game:HttpGet("https://raw.githubusercontent.com/tienkhanh1/spicy/main/Chilli%20Library")
	local chunk, v2 = loadstring(response)
	assert(chunk, v2)
	local v3 = chunk()
	assert(type(v3) == "function", "Chilli Library bootstrap is invalid.")
	local v4 = table.create(45)
	local n = 1

	for i = 1, 90, 2 do
		v4[n] = string.char(bit32.bxor(tonumber(string.sub("306908100841206d474f00185f26635b2101387507010810127d7d477a473b6f435a0916573165562900226c00", i, i + 1), 16), string.byte("s9K!2vQ#", (n - 1) % 8 + 1)))
		n += 1
	end

	return v3(table.concat(v4))
end

v = fn()
assert(type(v) == "table" and type(v.CreateWindow) == "function" and type(v.Finalize) == "function", "Chilli Library returned an invalid API.")

v.ManualQuickDefaults = {
	PinnedFeatures = {
		"Player > Movement > Speed Boost",
		"Player > Movement > Boost Speed",
		"Player > Movement > Jump Boost",
		"Player > Movement > Jump Power",
		"Player > Movement > Infinite Jump",
	},
	Keybinds = { ["Player > Movement > Speed Boost"] = "Q" },
	PinGroups = {},
	LeftCenterHidden = true,
}

local v2
v2 = v:CreateWindow({ Name = "Chilli Hub - Jump For Animals", DefaultTab = "Farm" })
local defaultTab
defaultTab = v2:GetDefaultTab()
local RunService, ReplicatedStorage, UserInputService, localPlayer, remotes, settings_, fn2, tbl, v3

do
	local Players = game:GetService("Players")
	RunService = game:GetService("RunService")
	ReplicatedStorage = game:GetService("ReplicatedStorage")
	local CoreGui = game:GetService("CoreGui")
	UserInputService = game:GetService("UserInputService")
	game:GetService("CollectionService")
	localPlayer = Players.LocalPlayer
	remotes = ReplicatedStorage:WaitForChild("Remotes")
	settings_ = ReplicatedStorage:WaitForChild("Settings")

	fn2 = function(arg)
		local ok, result = pcall(function()
			return require(settings_:WaitForChild(arg, 10))
		end)

		return ok and type(result) == "table" and result or nil
	end

	tbl = {
		Areas = fn2("Areas"),
		Eggs = fn2("Eggs"),
		Animals = fn2("Animals"),
		Rarities = fn2("Rarities"),
		Barbell = fn2("BarbellUpgrades"),
		Codes = fn2("Codes"),
	}

	local function fn3()
		if typeof(gethui) == "function" then
			local ok, result = pcall(gethui)
			if ok and typeof(result) == "Instance" then
				return result
			end
		end

		return CoreGui
	end

	v3 = fn3()
end

local v4
v4 = Random.new()
local fn3
local str = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"

fn3 = function()
	local v5 = v4:NextInteger(12, 20)
	local v6 = table.create(v5)

	for i = 1, v5 do
		local v7 = v4:NextInteger(1, #str)
		v6[i] = string.sub("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789", v7, v7)
	end

	return table.concat(v6)
end

local fn4, fn5

do
	local tbl2 = {}

	fn4 = function(arg)
		table.insert(tbl2, arg)
	end

	local text = "All"

	fn5 = function(arg)
		if type(arg) ~= "table" then
			return arg
		end
		local value = rawget(arg, "Instance")
		if typeof(value) ~= "Instance" then
			return arg
		end
		local flag = false

		local function fn6(arg2)
			if flag then
				return
			end

			if arg2.Text == "None" then
				flag = true
				arg2.Text = text
				flag = false
			end
		end

		local function fn7(descendant)
			if not descendant:IsA("TextLabel") or descendant.Name ~= "Value" then
				return
			end
			fn6(descendant)

			local connection = descendant:GetPropertyChangedSignal("Text"):Connect(function()
				fn6(descendant)
			end)

			fn4(function()
				pcall(function()
					connection:Disconnect()
				end)
			end)
		end

		for _, descendant in ipairs(value:GetDescendants()) do
			fn7(descendant)
		end

		local connection = value.DescendantAdded:Connect(fn7)

		fn4(function()
			pcall(function()
				connection:Disconnect()
			end)
		end)

		return arg
	end

	local genv = typeof(getgenv) == "function" and getgenv() or _G
	local chilliHubJfaCleanup = genv.ChilliHubJfaCleanup

	if type(chilliHubJfaCleanup) == "function" then
		pcall(chilliHubJfaCleanup)
	end

	genv.ChilliHubJfaCleanup = function()
		for i = #tbl2, 1, -1 do
			pcall(tbl2[i])
		end

		table.clear(tbl2)
	end
end

local fn6

fn6 = function(arg, arg2)
	if type(v.Notify) == "function" then
		pcall(v.Notify, arg, arg2, 5)
	end
end

local tbl2

tbl2 = { Toggle = function(arg, arg2)
	if type(arg) ~= "table" then
		return arg2 == true
	end

	local ok, result = pcall(function()
		local controller = arg._controller
		return type(controller) == "table" and type(controller.GetValue) == "function" and controller.GetValue()
	end)

	if ok and type(result) == "boolean" then
		return result
	end

	for _, v5 in ipairs({ "Get", "GetValue" }) do
		local ok2, result2 = pcall(function()
			return arg[v5]
		end)

		if ok2 and type(result2) == "function" then
			local ok3, result3 = pcall(result2, arg)
			if ok3 and type(result3) == "boolean" then
				return result3
			end
		end
	end

	return arg2 == true
end }

local fn7

fn7 = function(arg)
	local tbl3 = {}

	if type(arg) == "table" then
		for k, v5 in pairs(arg) do
			if v5 == true and type(k) == "string" then
				tbl3[k] = true
			elseif type(v5) == "string" then
				tbl3[v5] = true
			end
		end
	end

	return tbl3
end

local tbl3
tbl3 = {}
local rarityOrder = { "Common", "Uncommon", "Rare", "Epic", "Legendary", "Mythic", "Divine", "Celestial", "Eternal" }

if tbl.Rarities and type(tbl.Rarities.List) == "table" and #tbl.Rarities.List > 0 then
	rarityOrder = {}

	for _, v5 in ipairs(tbl.Rarities.List) do
		table.insert(rarityOrder, tostring(v5))
	end
end

tbl3.RarityOrder = rarityOrder
tbl3.RarityRank = {}

for i, v5 in ipairs(rarityOrder) do
	tbl3.RarityRank[v5] = i
end

tbl3.RarityChoices = { "Any" }

for _, v5 in ipairs(rarityOrder) do
	table.insert(tbl3.RarityChoices, v5)
end

tbl3.RarityColors = {
	Common = Color3.fromRGB(214, 218, 228),
	Uncommon = Color3.fromRGB(110, 230, 120),
	Rare = Color3.fromRGB(96, 170, 255),
	Epic = Color3.fromRGB(190, 110, 255),
	Legendary = Color3.fromRGB(255, 196, 66),
	Mythic = Color3.fromRGB(255, 82, 90),
	Divine = Color3.fromRGB(255, 240, 150),
	Celestial = Color3.fromRGB(125, 225, 255),
	Eternal = Color3.fromRGB(255, 120, 220),
}

tbl3.FlySpeed = 300
tbl3.CruiseHeight = 40
tbl3.TravelMode = "Teleport"
tbl3.Status = "Idle"

tbl3.Humanoid = function()
	local character = localPlayer.Character
	local humanoid = character and character:FindFirstChildOfClass("Humanoid")
	if humanoid and humanoid.Health > 0 then
		return humanoid
	end
	return nil
end

tbl3.Root = function()
	local character = localPlayer.Character
	character = character and character:FindFirstChild("HumanoidRootPart")
	if character and character:IsDescendantOf(workspace) then
		return character
	end
	return nil
end

tbl3.Plot = function()
	local plot = localPlayer:FindFirstChild("Plot")
	plot = plot and plot.Value
	if typeof(plot) == "Instance" and plot.Parent then
		return plot
	end
	return nil
end

tbl3.Detector = function()
	local detector = tbl3.Plot()
	detector = detector and detector:FindFirstChild("Detector")
	if detector and detector:IsA("BasePart") then
		return detector
	end
	return nil
end

tbl3.HomePoint = function()
	local v5 = tbl3.Detector()
	if not v5 then
		return nil
	end
	return Vector3.new(v5.Position.X, v5.Position.Y - v5.Size.Y / 2 + 3, v5.Position.Z)
end

tbl3.Cash = function()
	local leaderstats = localPlayer:FindFirstChild("leaderstats")
	leaderstats = leaderstats and leaderstats:FindFirstChild("Cash")
	leaderstats = leaderstats and leaderstats:FindFirstChild("V")
	return leaderstats and tonumber(leaderstats.Value) or 0
end

tbl3.JumpPower = function()
	local jumpPower = localPlayer:FindFirstChild("JumpPower")
	return jumpPower and tonumber(jumpPower.Value) or 0
end

tbl3.Carried = function()
	return tonumber(localPlayer:GetAttribute("CarriedEggCount")) or 0
end

tbl3.CarryCapacity = function()
	local eggCarryCapacity = localPlayer:FindFirstChild("EggCarryCapacity")
	return math.max(1, eggCarryCapacity and tonumber(eggCarryCapacity.Value) or 1)
end

tbl3.Fire = function(arg, ...)
	local v5 = remotes:FindFirstChild(arg)
	if not v5 or not v5:IsA("RemoteEvent") then
		return false
	end
	local v6 = table.pack(...)

	return pcall(function()
		v5:FireServer(table.unpack(v6, 1, v6.n))
	end)
end

tbl3.FirePrompt = function(arg)
	if not arg or not arg:IsA("ProximityPrompt") then
		return false
	end

	if typeof(fireproximityprompt) == "function" then
		return pcall(fireproximityprompt, arg)
	end

	return pcall(function()
		arg:InputHoldBegin()
		task.wait(arg.HoldDuration + 0.1)
		arg:InputHoldEnd()
	end)
end

tbl3.Tools = function(arg)
	local tbl4 = {}
	local character = localPlayer.Character

	for _, v5 in ipairs({ localPlayer:FindFirstChildOfClass("Backpack"), character }) do
		if v5 then
			for _, child in ipairs(v5:GetChildren()) do
				if child:IsA("Tool") and arg(child) then
					table.insert(tbl4, child)
				end
			end
		end
	end

	return tbl4
end

tbl3.Equip = function(arg)
	local v5 = tbl3.Humanoid()
	local character = localPlayer.Character
	if not v5 or not arg or not character then
		return false
	end

	if arg.Parent == character then
		return true
	end

	pcall(function()
		v5:EquipTool(arg)
	end)

	local n = os.clock() + 1

	while arg.Parent ~= character and os.clock() < n do
		RunService.Heartbeat:Wait()
	end

	return arg.Parent == character
end

tbl3.Unequip = function()
	local v5 = tbl3.Humanoid()

	if v5 then
		pcall(function()
			v5:UnequipTools()
		end)
	end
end

tbl3.AnimalData = function(arg)
	local animals = tbl.Animals
	local list = animals and animals.List
	local flag = type(list) == "table" and list[tostring(arg)] or nil
	return type(flag) == "table" and flag or nil
end

tbl3.EggRarity = function(arg)
	local attribute = arg:GetAttribute("Rarity")
	if type(attribute) == "string" and tbl3.RarityRank[attribute] then
		return attribute
	end
	local v5 = tbl3.AnimalData(arg.Name)
	return v5 and tostring(v5.Rarity) or "Common"
end

tbl3.EggRank = function(arg)
	return tbl3.RarityRank[tbl3.EggRarity(arg)] or 0
end

tbl3.EggValue = function(arg)
	local v5 = tbl3.AnimalData(arg.Name)
	return (v5 and tonumber(v5.CashPerSecond) or 1) * (tonumber(arg:GetAttribute("CPSMultiplier")) or 1)
end

tbl3.EggNeed = function(arg)
	local areas = tbl.Areas
	areas = areas and areas.JumpCap
	local climbs = type(areas) == "table" and areas.Climbs or nil
	local str2 = tostring(arg:GetAttribute("AreaName") or "") .. tostring(arg:GetAttribute("SpawnerName") or "")
	local n = type(climbs) == "table" and tonumber(climbs[str2]) or 0
	local n2 = type(areas) == "table" and tonumber(areas.JumpPowerSquaredPerStud) or 293
	return math.sqrt(math.max(0, n) * n2)
end

tbl3.StealGrace = function()
	local areas = tbl.Areas
	areas = areas and areas.EggSteal
	return math.max(0, (type(areas) == "table" and tonumber(areas.NaturalSpawnJumpPowerGrace) or 25) - 11)
end

tbl3.CanSteal = function(arg)
	return tbl3.EggNeed(arg) <= tbl3.JumpPower() + tbl3.StealGrace()
end

tbl3.EggRoot = function(arg)
	local eggRoot = arg:FindFirstChild("EggRoot")
	if eggRoot and eggRoot:IsA("BasePart") then
		return eggRoot
	end
	return arg.PrimaryPart
end

tbl3.EggPrompt = function(arg)
	for _, descendant in ipairs(arg:GetDescendants()) do
		if descendant:IsA("ProximityPrompt") and descendant.ActionText == "Steal!" then
			return descendant
		end
	end

	return nil
end

tbl3.EggFolders = function()
	local tbl4 = {}
	local map = workspace:FindFirstChild("Map")
	map = map and map:FindFirstChild("Stages")

	if map then
		for _, child in ipairs(map:GetChildren()) do
			local spawnedEggs = child:FindFirstChild("SpawnedEggs")

			if spawnedEggs then
				table.insert(tbl4, spawnedEggs)
			end
		end
	end

	return tbl4
end

tbl3.CaveTimeLeft = function()
	local map = workspace:FindFirstChild("Map")
	if not map then
		return math.huge
	end
	local attribute = map:GetAttribute("CaveCycleState")
	if attribute ~= nil and attribute ~= "Active" then
		return 0
	end
	local num = tonumber(map:GetAttribute("CaveCycleEndsAt"))
	if not num then
		return math.huge
	end
	return num - workspace:GetServerTimeNow()
end

do
	local tbl4 = {}

	local function setNoclip(arg)
		local character = localPlayer.Character
		if not character then
			return
		end

		for _, descendant in ipairs(character:GetDescendants()) do
			if descendant:IsA("BasePart") then
				if arg then
					if tbl4[descendant] == nil then
						tbl4[descendant] = descendant.CanCollide
					end

					descendant.CanCollide = false
				elseif tbl4[descendant] ~= nil then
					descendant.CanCollide = tbl4[descendant]
				end
			end
		end

		if not arg then
			table.clear(tbl4)

			for _, v5 in ipairs({ "Head", "UpperTorso", "LowerTorso", "Torso" }) do
				local v6 = character:FindFirstChild(v5)

				if v6 and v6:IsA("BasePart") then
					v6.CanCollide = true
				end
			end
		end
	end

	tbl3.SetNoclip = setNoclip

	local function fn8(arg, arg2)
		if Vector3.new(arg2.X - arg.X, 0, arg2.Z - arg.Z).Magnitude < 25 and math.abs(arg2.Y - arg.Y) < 25 then
			return { arg2 }
		end
		local cruiseHeight = tbl3.CruiseHeight
		local n = math.max(arg.Y, arg2.Y) + cruiseHeight
		local tbl5 = {}
		local vector = Vector3.new(arg.X, n, arg.Z)
		local vector2 = Vector3.new(arg2.X, n, arg2.Z)
		tbl5[1] = vector
		tbl5[2] = vector2
		tbl5[3] = arg2
		return tbl5
	end

	tbl3.TravelTime = function(arg, arg2)
		if tbl3.TravelMode == "Teleport" then
			return 0.4
		end
		local n = 0

		for _, v5 in ipairs(fn8(arg, arg2)) do
			n += (v5 - arg).Magnitude
			arg = v5
		end

		return n / math.max(tbl3.FlySpeed, 20)
	end

	tbl3.FlyTo = function(arg, arg2, arg3)
		local v5 = tbl3.Root()
		if not v5 or typeof(arg) ~= "Vector3" then
			return false
		end
		local n = arg3 or 3
		if (v5.Position - arg).Magnitude <= n then
			return true
		end

		if tbl3.TravelMode == "Teleport" then
			arg2 = arg2 and arg2()
			if arg2 then
				return false
			end
			local character = localPlayer.Character

			pcall(function()
				v5.AssemblyLinearVelocity = Vector3.zero
				v5.AssemblyAngularVelocity = Vector3.zero
				local rotation = v5.CFrame.Rotation
				character:PivotTo(CFrame.new(arg) * rotation)
			end)

			tbl3.Hold(arg, 0.25)
			v5 = tbl3.Root()
			return v5 ~= nil and (v5.Position - arg).Magnitude <= n + 8
		end

		local v6 = fn8(v5.Position, arg)
		local n2 = os.clock() + tbl3.TravelTime(v5.Position, arg) + 6
		setNoclip(true)

		local connection = RunService.Stepped:Connect(function()
			local character = localPlayer.Character
			if not character then
				return
			end

			for _, descendant in ipairs(character:GetDescendants()) do
				if descendant:IsA("BasePart") and descendant.CanCollide then
					descendant.CanCollide = false
				end
			end
		end)

		local n3 = 1
		local flag, v7

		while true do
			flag = false

			if os.clock() < n2 then
				if not (arg2 and arg2()) then
					local result = RunService.Heartbeat:Wait()
					v7 = tbl3.Root()

					if v7 then
						local flag2 = n3 == #v6
						local n4 = v6[n3] - v7.Position
						local magnitude = n4.Magnitude

						if magnitude <= (flag2 and n or 2) then
							if flag2 then
								flag = true
								break
							else
								n3 += 1
								continue
							end
						else
							local n5 = math.min(magnitude, math.max(tbl3.FlySpeed, 20) * result)
							local vector = Vector3.new(n4.X, 0, n4.Z)
							local cframe = vector.Magnitude > 0.1 and CFrame.lookAt(Vector3.zero, vector.Unit) or v7.CFrame.Rotation

							pcall(function()
								v7.CFrame = CFrame.new(v7.Position + n4.Unit * n5) * cframe
								v7.AssemblyLinearVelocity = Vector3.zero
								v7.AssemblyAngularVelocity = Vector3.zero
							end)

							continue
						end
					end
				end

				break
			else
				break
			end
		end

		connection:Disconnect()
		setNoclip(false)
		v7 = tbl3.Root()

		if v7 then
			pcall(function()
				v7.AssemblyLinearVelocity = Vector3.zero
			end)

			if (v7.Position - arg).Magnitude <= n + 1 then
				flag = true
			end
		end

		return flag
	end

	tbl3.Hold = function(arg, arg2)
		local n = os.clock() + arg2

		while os.clock() < n do
			local v5 = tbl3.Root()

			if v5 then
				pcall(function()
					local rotation = v5.CFrame.Rotation
					v5.CFrame = CFrame.new(arg) * rotation
					v5.AssemblyLinearVelocity = Vector3.zero
				end)
			end

			RunService.Heartbeat:Wait()
		end
	end

	fn4(function()
		setNoclip(false)
	end)
end

local v5, v6, tbl4

do
	local v7 = defaultTab:CreateSection({ Name = "Farm Status", Expanded = true })
	local v8 = defaultTab:CreateSection({ Name = "Auto Steal Eggs", Expanded = true })
	local v9 = defaultTab:CreateSection({ Name = "Auto Eggs & Pets", Expanded = false })
	v5 = defaultTab:CreateSection({ Name = "Auto Training", Expanded = false })
	v6 = defaultTab:CreateSection({ Name = "Auto Rewards", Expanded = false })

	tbl4 = {
		Steal = nil,
		Place = nil,
		Open = nil,
		Squat = nil,
		Barbell = nil,
		Busy = false,
		Wake = function()
		end,
		Extras = {},
		StealIdle = true,
		Manual = {},
		Carried = {},
		Target = nil,
		TargetManual = false,
		Dropped = nil,
	}

	local v10 = v7:CreateText({ Name = "Farm Status", Text = "Idle" })
	local status = nil

	local connection = RunService.Heartbeat:Connect(function()
		if tbl3.Status ~= status then
			status = tbl3.Status

			if v10 and type(v10.Set) == "function" then
				pcall(v10.Set, v10, status)
			end
		end
	end)

	fn4(function()
		connection:Disconnect()
	end)

	local tbl5 = {}
	local tbl6 = {}
	local list = tbl.Eggs and tbl.Eggs.List

	if type(list) == "table" then
		for k in pairs(list) do
			local v11 = tbl3.AnimalData(k)

			table.insert(tbl6, {
				Name = tostring(k),
				Rank = v11 and tbl3.RarityRank[tostring(v11.Rarity)] or 0,
				Value = v11 and tonumber(v11.CashPerSecond) or 0,
			})
		end
	end

	table.sort(tbl6, function(arg, arg2)
		if arg.Rank ~= arg2.Rank then
			return arg.Rank > arg2.Rank
		end

		if arg.Value ~= arg2.Value then
			return arg.Value > arg2.Value
		end
		return arg.Name < arg2.Name
	end)

	for _, v11 in ipairs(tbl6) do
		table.insert(tbl5, v11.Name)
	end

	local tbl7 = { "Highest Value", "Highest Rarity", "Nearest" }
	local n = 0
	local tbl8 = {}
	local str2 = tbl7[1]
	local tbl9 = {}

	local function fn8(arg)
		local tbl10 = {}
		local now = os.clock()

		for _, v11 in ipairs(tbl3.EggFolders()) do
			for _, child in ipairs(v11:GetChildren()) do
				local isModel = child:IsA("Model") and tbl3.EggRoot(child)
				local v12 = tbl9[child]
				local flag

				if isModel then
					flag = not (v12 and v12 > now)
				else
					flag = isModel
				end

				flag = flag and tbl3.EggPrompt(child)

				if flag then
					local v13 = tbl3.EggRank(child)
					local flag2 = v13 >= n
					local flag3

					if flag2 then
						flag3 = next(tbl8) == nil or tbl8[child.Name]
					else
						flag3 = flag2
					end

					flag3 = flag3 and tbl3.CanSteal(child)

					if flag3 then
						table.insert(tbl10, {
							Model = child,
							Folder = v11,
							Root = isModel,
							Rank = v13,
							Value = tbl3.EggValue(child),
							Distance = (isModel.Position - arg).Magnitude,
						})
					end
				end
			end
		end

		table.sort(tbl10, function(arg2, arg3)
			if str2 == tbl7[3] then
				return arg2.Distance < arg3.Distance
			end

			if str2 == tbl7[2] then
				if arg2.Rank ~= arg3.Rank then
					return arg2.Rank > arg3.Rank
				end

				if arg2.Value ~= arg3.Value then
					return arg2.Value > arg3.Value
				end
				return arg2.Distance < arg3.Distance
			end

			if arg2.Value ~= arg3.Value then
				return arg2.Value > arg3.Value
			end
			return arg2.Distance < arg3.Distance
		end)

		return tbl10
	end

	tbl4.Deliver = function(arg)
		if tbl3.Carried() <= 0 then
			return true
		end
		local v11 = tbl3.HomePoint()
		if not v11 then
			return false
		end
		tbl3.Status = "Bringing eggs home"
		local y = tbl3.Root()
		local max = math.max
		y = y and y.Position.Y or v11.Y
		local cruiseHeight = tbl3.CruiseHeight
		tbl3.FlyTo(Vector3.new(v11.X, max(y, v11.Y) + cruiseHeight, v11.Z), arg, 4)
		local n2 = os.clock() + 1.5

		while tbl3.Carried() > 0 and os.clock() < n2 do
			RunService.Heartbeat:Wait()
		end

		if tbl3.Carried() > 0 then
			tbl3.FlyTo(v11, arg, 3)
			local n3 = os.clock() + 3

			while tbl3.Carried() > 0 and os.clock() < n3 do
				RunService.Heartbeat:Wait()
			end
		end

		if tbl3.Carried() == 0 then
			table.clear(tbl4.Carried)
		end

		return tbl3.Carried() == 0
	end

	local function fn9(arg)
		local parent = arg.Parent
		return parent ~= nil and parent.Name == "SpawnedEggs" and arg:IsA("Model") and tbl3.EggRoot(arg) ~= nil and tbl3.EggPrompt(arg) ~= nil
	end

	local function fn10()
		while #tbl4.Manual > 0 do
			local v11 = tbl4.Manual[1]
			if fn9(v11) and tbl3.CanSteal(v11) then
				return { Model = v11, Folder = v11.Parent, Root = tbl3.EggRoot(v11), Manual = true }
			end
			table.remove(tbl4.Manual, 1)
		end

		return nil
	end

	local function fn11(arg)
		local v11 = table.find(tbl4.Manual, arg)

		if v11 then
			table.remove(tbl4.Manual, v11)
		end
	end

	tbl4.AutoPlan = function(arg)
		if not tbl2.Toggle(tbl4.Steal, false) then
			return {}
		end
		return fn8(arg)
	end

	tbl4.StealActive = function()
		return tbl2.Toggle(tbl4.Steal, false) or #tbl4.Manual > 0
	end

	tbl4.StealStep = function(arg)
		local v11 = tbl3.Root()
		local v12 = tbl3.HomePoint()
		if not v11 or not v12 then
			return false
		end
		local flag = false

		while tbl3.Carried() < tbl3.CarryCapacity() do
			if not arg() then
				local v13 = tbl3.Root()

				if v13 then
					local v14 = fn10()

					if not v14 and tbl2.Toggle(tbl4.Steal, false) then
						for _, v15 in ipairs(fn8(v13.Position)) do
							if not table.find(tbl4.Manual, v15.Model) then
								v14 = v15
								break
							end
						end
					end

					if not v14 then
						if not flag then
							tbl4.StealIdle = true
							tbl3.Status = "No stealable egg matches the filters"
						end

						break
					else
						local n2 = v14.Root.Position + Vector3.new(0, 3, 0)
						tbl4.StealIdle = false

						if localPlayer:GetAttribute("IsSquatting") == true then
							tbl3.Fire("StopSquattingRequest")
							local n3 = os.clock() + 1.5

							while localPlayer:GetAttribute("IsSquatting") == true and os.clock() < n3 do
								RunService.Heartbeat:Wait()
							end
						end

						local model = v14.Model
						tbl4.Target = model
						tbl4.TargetManual = v14.Manual == true
						tbl4.Dropped = nil
						tbl3.Status = string.format("Stealing %s (%s)", model.Name, tbl3.EggRarity(model))

						local v15 = tbl3.FlyTo(n2, function()
							return arg() or model.Parent ~= v14.Folder or tbl4.Dropped == model
						end, 4)

						if tbl4.Dropped == model then
							tbl4.Target = nil
							tbl4.Dropped = nil
							continue
						elseif model.Parent ~= v14.Folder then
							fn11(model)
							tbl4.Target = nil
							continue
						elseif not v15 then
							tbl9[model] = os.clock() + 20
							fn11(model)
							tbl4.Target = nil
							break
						else
							tbl3.Hold(n2, 0.35)
							local v16 = tbl3.Carried()

							local tbl10 = {
								Name = model.Name,
								Rarity = tbl3.EggRarity(model),
								Value = tbl3.EggValue(model),
								Model = model,
							}

							tbl3.FirePrompt(tbl3.EggPrompt(model))
							local n3 = os.clock() + 1.5

							while tbl3.Carried() == v16 and os.clock() < n3 do
								RunService.Heartbeat:Wait()
							end

							fn11(model)
							tbl4.Target = nil

							if tbl3.Carried() > v16 then
								tbl4.Carried[model] = tbl10
								flag = true
							else
								tbl9[model] = os.clock() + 30
							end

							continue
						end
					end
				end
			end

			break
		end

		tbl4.Target = nil

		if tbl3.Carried() > 0 then
			tbl4.Deliver(nil)
		end

		return flag
	end

	tbl4.Steal = v8:CreateToggle({
		Name = "Auto Steal Eggs",
		Default = false,
		Callback = function()
			tbl4.Wake()
		end,
	})

	v8:CreateDropdown({
		Name = "Min Egg Rarity",
		Options = tbl3.RarityChoices,
		Default = tbl3.RarityChoices[1],
		Callback = function(arg)
			n = tbl3.RarityRank[tostring(arg)] or 0
		end,
	})

	fn5(v8:CreateMultiDropdown({
		Name = "Target Eggs",
		Options = tbl5,
		Default = {},
		Callback = function(arg)
			tbl8 = fn7(arg)
		end,
	}))

	v8:CreateDropdown({
		Name = "Steal Priority",
		Options = tbl7,
		Default = tbl7[1],
		Callback = function(arg)
			str2 = tostring(arg)
		end,
	})

	v8:CreateDropdown({
		Name = "Travel Mode",
		Options = { "Teleport", "Fly" },
		Default = "Teleport",
		Callback = function(arg)
			tbl3.TravelMode = tostring(arg) == "Fly" and "Fly" or "Teleport"
		end,
	})

	v8:CreateSlider({
		Name = "Tween Speed",
		Min = 50,
		Max = 1000,
		Default = 300,
		Increment = 10,
		Callback = function(arg)
			tbl3.FlySpeed = math.clamp(tonumber(arg) or 300, 50, 1000)
		end,
	})

	local n2 = 6
	local n3 = 0
	local tbl10 = {}

	local function fn12()
		return tbl3.Tools(function(arg)
			return arg:GetAttribute("IsEggTool") == true and type(arg:GetAttribute("EggId")) == "string"
		end)
	end

	local function fn13()
		local placedEggs = tbl3.Plot()
		placedEggs = placedEggs and placedEggs:FindFirstChild("PlacedEggs")
		return placedEggs and placedEggs:GetChildren() or {}
	end

	local function fn14()
		local placement = tbl.Eggs and tbl.Eggs.Placement
		return type(placement) == "table" and tonumber(placement.MaximumPlacedEggs) or 20
	end

	local function fn15()
		local placement = tbl.Eggs and tbl.Eggs.Placement
		return type(placement) == "table" and tonumber(placement.MaximumIncubatingEggs) or 8
	end

	local function fn16()
		local n4 = 0

		for _, v11 in ipairs(fn13()) do
			if v11:GetAttribute("HatchReady") ~= true then
				n4 += 1
			end
		end

		return n4
	end

	local n4 = nil

	local function fn17()
		local n5 = #fn13()
		if n4 and n5 >= n4 then
			return false
		end
		n4 = nil
		return n5 < math.min(fn14(), fn15()) and fn16() < fn15()
	end

	local function fn18()
		local v11 = tbl3.Detector()
		if not v11 then
			return nil
		end
		local tbl11 = {}

		for _, v12 in ipairs(fn13()) do
			local attribute = v12:GetAttribute("GroundPosition")

			if typeof(attribute) == "Vector3" then
				table.insert(tbl11, attribute)
			end
		end

		local n5 = math.max(1, v11.Size.X / 2 - 5)
		local n6 = math.max(1, v11.Size.Z / 2 - 5)
		local n7 = v11.Position.Y - v11.Size.Y / 2
		local v12 = nil

		for i = 1, 30 do
			local nextNumber = v4.NextNumber
			local v13 = v11.CFrame:PointToWorldSpace(Vector3.new(v4:NextNumber(-n5, n5), 0, nextNumber(v4, -n6, n6)))
			local vector = Vector3.new(v13.X, n7, v13.Z)
			local flag = true

			for _, v14 in ipairs(tbl11) do
				if Vector3.new(v14.X - vector.X, 0, v14.Z - vector.Z).Magnitude < n2 then
					flag = false
					break
				end
			end

			if flag then
				return vector
			end
			v12 = v12 or vector
		end

		return v12
	end

	tbl4.PlaceWanted = function()
		return tbl2.Toggle(tbl4.Place, false) and os.clock() >= n3 and #fn12() > 0 and fn17()
	end

	tbl4.PlaceStep = function()
		local flag = false

		for _, v11 in ipairs(fn12()) do
			if not (not fn17() or not tbl2.Toggle(tbl4.Place, false)) then
				local v12 = fn18()

				if v12 then
					tbl3.Status = string.format("Placing %s", v11.Name)

					if tbl3.Equip(v11) then
						tbl3.Fire("PlaceEggRequest", v11:GetAttribute("EggId"), v12)
						local n5 = os.clock() + 1.2

						while v11.Parent ~= nil and v11.Parent == localPlayer.Character and os.clock() < n5 do
							RunService.Heartbeat:Wait()
						end

						if v11.Parent == nil then
							flag = true
							task.wait(0.45)
							continue
						else
							n4 = #fn13()
							break
						end
					else
						task.wait(0.45)
						continue
					end
				end
			end

			break
		end

		tbl3.Unequip()

		if not flag then
			n3 = os.clock() + 10
		end

		return flag
	end

	tbl4.OpenWanted = function()
		if not tbl2.Toggle(tbl4.Open, false) then
			return false
		end
		local now = os.clock()

		for _, v11 in ipairs(fn13()) do
			local flag = v11:GetAttribute("HatchReady") == true

			if flag then
				flag = (tbl10[v11] or 0) < now
			end

			if flag then
				return true
			end
		end

		return false
	end

	tbl4.OpenStep = function()
		local now = os.clock()
		local flag = false

		for _, v11 in ipairs(fn13()) do
			local attribute = v11:GetAttribute("EggId")
			local flag2 = v11:GetAttribute("HatchReady") == true and type(attribute) == "string"

			if flag2 then
				flag2 = (tbl10[v11] or 0) < now
			end

			if flag2 then
				tbl10[v11] = now + 8
				tbl3.Status = string.format("Opening %s", v11.Name)
				tbl3.Fire("PetInventory", "EggAction", attribute)
				task.wait(0.35)
				flag = true
			end
		end

		return flag
	end

	tbl4.Place = v9:CreateToggle({
		Name = "Auto Place Eggs",
		Default = false,
		Callback = function()
			n3 = 0
			tbl4.Wake()
		end,
	})

	tbl4.Open = v9:CreateToggle({
		Name = "Auto Hatch Eggs",
		Default = false,
		Callback = function()
			tbl4.Wake()
		end,
	})

	local v11 = v9:CreateToggle({
		Name = "Auto Equip Best Pets",
		Default = false,
		Callback = function()
		end,
	})

	local flag = true

	task.spawn(function()
		while flag do
			if tbl2.Toggle(v11, false) then
				tbl3.Fire("PetInventory", "EquipBest")
			end

			local n5 = os.clock() + 20

			while flag and os.clock() < n5 do
				task.wait(0.5)
			end
		end
	end)

	fn4(function()
		flag = false
	end)
end

do
	local n = 0
	local n2 = 0

	local function fn8()
		local squatZone = tbl3.Plot()
		squatZone = squatZone and squatZone:FindFirstChild("SquatZone")
		squatZone = squatZone and squatZone:FindFirstChild("Floor")
		squatZone = squatZone and squatZone:FindFirstChild("Detector")
		if squatZone and squatZone:IsA("BasePart") then
			return squatZone
		end
		return nil
	end

	local function fn9()
		local v7 = tbl3.Plot()
		local squatZone = v7 and v7:FindFirstChild("SquatZone")
		squatZone = squatZone and squatZone:FindFirstChild("UpgradeB")
		squatZone = squatZone and squatZone:FindFirstChild("Detector")
		squatZone = squatZone and squatZone:FindFirstChild("BarbellUpgradePrompt")
		if squatZone and squatZone:IsA("ProximityPrompt") then
			return squatZone
		end
		return nil
	end

	local function fn10()
		local barbellLevel = localPlayer:FindFirstChild("BarbellLevel")
		local n3 = barbellLevel and tonumber(barbellLevel.Value) or 1
		local barbell = tbl.Barbell
		barbell = barbell and barbell.Levels
		local flag = type(barbell) == "table" and barbell[n3 + 1] or nil
		return type(flag) == "table" and tonumber(flag.CashPrice) or nil
	end

	tbl4.SquatWanted = function()
		local v7 = tbl2.Toggle(tbl4.Squat, false)
		local stealIdle

		if v7 then
			stealIdle = tbl4.StealIdle or not tbl2.Toggle(tbl4.Steal, false)
		else
			stealIdle = v7
		end

		return stealIdle and tbl3.Carried() == 0 and localPlayer:GetAttribute("IsSquatting") ~= true and os.clock() >= n and fn8() ~= nil
	end

	tbl4.SquatStep = function(arg)
		n = os.clock() + 8
		local v7 = fn8()
		if not v7 then
			return false
		end
		tbl3.Status = "Starting squat training"
		local n3 = v7.Position + Vector3.new(0, 3, 0)
		if not tbl3.FlyTo(n3, arg, 3) then
			return false
		end
		tbl3.Hold(n3, 0.3)
		tbl3.Fire("SquatTrainingRequest", v7)
		local n4 = os.clock() + 1.5

		while localPlayer:GetAttribute("IsSquatting") ~= true and os.clock() < n4 do
			RunService.Heartbeat:Wait()
		end

		return localPlayer:GetAttribute("IsSquatting") == true
	end

	tbl4.BarbellWanted = function()
		if not tbl2.Toggle(tbl4.Barbell, false) or os.clock() < n2 then
			return false
		end
		local v7 = fn10()
		local v8 = fn9()
		return v7 ~= nil and v8 ~= nil and v8.Enabled and tbl3.Cash() >= v7
	end

	tbl4.BarbellStep = function(arg)
		n2 = os.clock() + 3
		local v7 = fn9()
		local parent = v7 and v7.Parent
		if not parent or not parent:IsA("BasePart") then
			return false
		end
		local barbellLevel = localPlayer:FindFirstChild("BarbellLevel")
		local n3 = barbellLevel and barbellLevel.Value or 0
		tbl3.Status = "Upgrading barbell"
		local n4 = parent.Position + Vector3.new(0, 3, 0)
		if not tbl3.FlyTo(n4, arg, 3) then
			return false
		end
		tbl3.Hold(n4, 0.3)
		tbl3.FirePrompt(v7)
		local n5 = os.clock() + 1.5

		while barbellLevel and barbellLevel.Value == n3 and os.clock() < n5 do
			RunService.Heartbeat:Wait()
		end

		if barbellLevel and barbellLevel.Value == n3 then
			n2 = os.clock() + 15
			return false
		end
		return true
	end

	tbl4.Squat = v5:CreateToggle({
		Name = "Auto Squat Training",
		Default = false,
		Callback = function()
			n = 0
			tbl4.Wake()
		end,
	})

	local v7 = nil
	local v8 = nil

	local function fn11()
		if not tbl2.Toggle(v7, false) then
			return
		end

		if localPlayer:GetAttribute("IsSquatting") ~= true or localPlayer:GetAttribute("SquatBonusAvailable") ~= true then
			return
		end
		local attribute = localPlayer:GetAttribute("SquatBonusVersion")
		if attribute == nil or attribute == v8 then
			return
		end
		v8 = attribute

		task.delay(0.3, function()
			tbl3.Fire("SquatBonusRequest", attribute)
		end)
	end

	for _, v9 in ipairs({ "SquatBonusAvailable", "SquatBonusVersion", "IsSquatting" }) do
		local connection = localPlayer:GetAttributeChangedSignal(v9):Connect(fn11)

		fn4(function()
			connection:Disconnect()
		end)
	end

	v7 = v5:CreateToggle({
		Name = "Auto Click x2 Bonus",
		Default = true,
		Callback = function(arg)
			if arg then
				v8 = nil
				fn11()
			end
		end,
	})

	tbl4.Barbell = v5:CreateToggle({
		Name = "Auto Upgrade Barbell",
		Default = false,
		Callback = function()
			n2 = 0
			tbl4.Wake()
		end,
	})
end

do
	local flag = false
	local flag2 = true

	tbl4.Wake = function()
		flag = true
	end

	local function fn8()
		for _, extra in ipairs(tbl4.Extras) do
			if extra.Active() then
				return true
			end
		end

		return false
	end

	local function fn9()
		return (tonumber(localPlayer:GetAttribute("CarriedFossilCount")) or 0) > 0
	end

	local function fn10()
		return tbl4.StealActive() or fn8() or tbl3.Carried() > 0 and next(tbl4.Carried) ~= nil or tbl2.Toggle(tbl4.Place, false) or tbl2.Toggle(tbl4.Open, false) or tbl2.Toggle(tbl4.Squat, false) or tbl2.Toggle(tbl4.Barbell, false)
	end

	local function fn11()
		return not flag2 or not fn10()
	end

	local function fn12(arg)
		return function()
			return fn11() or not tbl2.Toggle(arg, false)
		end
	end

	task.spawn(function()
		while flag2 do
			local flag3 = false

			if fn10() and tbl3.Root() and tbl3.Plot() then
				tbl4.Busy = true

				if not pcall(function()
					if tbl3.Carried() > 0 and (tbl2.Toggle(tbl4.Steal, false) or next(tbl4.Carried) ~= nil) then
						tbl4.Deliver(fn11)
						flag3 = true
					end

					if tbl4.PlaceWanted() and not fn11() then
						if tbl4.PlaceStep() then
							flag3 = true
						end
					end

					if tbl4.OpenWanted() and not fn11() then
						if tbl4.OpenStep() then
							flag3 = true
						end
					end

					if tbl4.BarbellWanted() and not fn11() then
						if tbl4.BarbellStep(fn12(tbl4.Barbell)) then
							flag3 = true
						end
					end

					for _, extra in ipairs(tbl4.Extras) do
						if not fn11() then
							local ok, result = pcall(extra.Wanted)

							if ok and result then
								local ok2, result2 = pcall(extra.Step, fn11)

								if ok2 and result2 then
									flag3 = true
								end
							end
						end
					end

					if tbl4.StealActive() and not fn11() and not fn9() then
						if tbl4.StealStep(function()
							return fn11() or not tbl4.StealActive()
						end) then
							flag3 = true
						end
					end

					if tbl4.SquatWanted() and not fn11() then
						if tbl4.SquatStep(fn12(tbl4.Squat)) then
							flag3 = true
						end
					end
				end) then
					tbl3.Unequip()
				end

				tbl4.Busy = false

				if not flag3 and not tbl2.Toggle(tbl4.Steal, false) then
					tbl3.Status = "Waiting for work"
				end
			elseif not fn10() then
				tbl3.Status = "Idle"
			end

			local n = flag3 and 0.15 or 1
			local n2 = os.clock() + n

			while flag2 and os.clock() < n2 and not flag do
				RunService.Heartbeat:Wait()
			end

			flag = false
		end
	end)

	fn4(function()
		flag2 = false
	end)
end

do
	local createToggle = nil
	local createToggle2 = nil
	local v7 = nil
	local tbl5 = {}
	local flag = true

	local function fn8()
		local codes = tbl.Codes
		codes = codes and codes.List
		if type(codes) ~= "table" then
			return
		end

		for k, code in pairs(codes) do
			if not tbl5[k] and type(code) == "table" and code.Enabled ~= false then
				local n = tonumber(code.ExpiresAt) or 0

				if n == 0 or n > os.time() then
					tbl5[k] = true
					tbl3.Fire("Codes", "Redeem", tostring(k))
					task.wait(2.5)
				end
			end
		end
	end

	task.spawn(function()
		while flag do
			if tbl2.Toggle(createToggle, false) then
				pcall(fn8)
			end

			if tbl2.Toggle(createToggle2, false) then
				tbl3.Fire("ClaimAnimalIndexReward", "__ALL__")
			end

			local flag2 = tbl2.Toggle(v7, false)

			if flag2 then
				flag2 = (tonumber(localPlayer:GetAttribute("OfflineCashPending")) or 0) > 0
			end

			if flag2 then
				tbl3.Fire("OfflineRewards", "Claim")
			end

			local n = os.clock() + 30

			while flag and os.clock() < n do
				task.wait(0.5)
			end
		end
	end)

	fn4(function()
		flag = false
	end)

	createToggle = v6.CreateToggle

	createToggle = createToggle(v6, {
		Name = "Auto Redeem Codes",
		Default = false,
		Callback = function()
		end,
	})

	createToggle2 = v6.CreateToggle

	createToggle2 = createToggle2(v6, {
		Name = "Auto Claim Index Rewards",
		Default = false,
		Callback = function()
		end,
	})

	v7 = v6:CreateToggle({
		Name = "Auto Claim Offline Cash",
		Default = false,
		Callback = function()
		end,
	})
end

local TweenService
TweenService = game:GetService("TweenService")
local tbl5
tbl5 = { "Value", "Rarity", "Distance" }
local uiGridLayout, fn8, color, color2, screenGui, main, scrollingFrame, clone

do
	local n = 150
	local n2 = 9
	local n3 = 4.6
	local n4 = 0.485
	uiGridLayout = nil
	fn8 = nil
	local tbl6 = { "", "K", "M", "B", "T", "Qa", "Qi", "Sx" }
	color = Color3.fromRGB(196, 110, 255)
	color2 = Color3.fromRGB(112, 40, 214)
	local color3 = Color3.fromRGB(120, 120, 128)
	local n5 = 1
	screenGui = nil
	main = nil
	scrollingFrame = nil
	clone = nil
	local clone2 = nil
	local textLabel = nil
	local tbl7 = {}
	local v7 = nil
	local v8 = nil
	local v9 = nil
	local flag = false
	local tbl8 = {}
	local tbl9 = {}
	local flag2 = true
	local flag3 = true

	local function fn9(arg, text)
		if arg and arg.Text ~= text then
			arg.Text = text
		end
	end

	local function fn10(arg)
		local n6 = tonumber(arg) or 0
		local n7 = 1

		while n6 >= 1000 and n7 < #tbl6 do
			n6 /= 1000
			n7 += 1
		end

		local str2 = n7 == 1 and tostring(math.floor(n6)) or string.format("%.1f", math.floor(n6 * 10) / 10)
		local v10 = tbl6[n7]
		return string.gsub(str2, "%.0$", "") .. v10
	end

	local function fn11()
		local playerGui = localPlayer:FindFirstChildOfClass("PlayerGui")
		return playerGui and playerGui:FindFirstChild("UI")
	end

	local function fn12(arg)
		for _, descendant in ipairs(arg:GetDescendants()) do
			if descendant:IsA("LuaSourceContainer") or descendant:IsA("ProximityPrompt") or descendant:IsA("BillboardGui") or descendant:IsA("ValueBase") then
				descendant:Destroy()
			end
		end
	end

	local function fn13(arg, arg2)
		if not arg then
			return
		end
		local bgImage = arg:FindFirstChild("BG_Image")
		local equip = bgImage and bgImage:FindFirstChild("Equip")
		local unequip = bgImage and bgImage:FindFirstChild("Unequip")

		if equip then
			equip.Enabled = arg2 == "Go"
		end

		if unequip then
			unequip.Enabled = arg2 == "Stop"
		end

		if bgImage then
			bgImage.BackgroundColor3 = arg2 == "Off" and color3 or Color3.fromRGB(255, 255, 255)
		end

		arg.AutoButtonColor = arg2 ~= "Off"
	end

	local function fn14()
		local steal = tbl4.Steal

		if type(steal) == "table" and type(steal.Set) == "function" then
			pcall(steal.Set, steal, not tbl2.Toggle(steal, false))
		end

		tbl4.Wake()
	end

	local function fn15(arg)
		if not table.find(tbl4.Manual, arg) then
			table.insert(tbl4.Manual, arg)
		end

		tbl4.Wake()
	end

	local function fn16(dropped)
		local v10 = table.find(tbl4.Manual, dropped)

		if v10 then
			table.remove(tbl4.Manual, v10)
		end

		if tbl4.Target == dropped then
			tbl4.Dropped = dropped
		end
	end

	local function fn17()
		return math.max(40, math.floor((scrollingFrame and scrollingFrame.AbsoluteSize.X or 0) * n4 / n3))
	end

	local function fn18(parent, arg)
		if not parent or not arg then
			return
		end
		local worldModel = parent:FindFirstChildOfClass("WorldModel")

		if worldModel then
			worldModel:ClearAllChildren()
		else
			worldModel = Instance.new("WorldModel")
			worldModel.Parent = parent
		end

		local ok, result = pcall(function()
			local archivable = arg.Archivable
			arg.Archivable = true
			local clone3 = arg:Clone()
			arg.Archivable = archivable
			return clone3
		end)

		if not ok or not result then
			return
		end
		fn12(result)

		for _, descendant in ipairs(result:GetDescendants()) do
			if descendant:IsA("BasePart") then
				descendant.Anchored = true
			end
		end

		result.Parent = worldModel
		local boundingBox, v10 = result:GetBoundingBox()
		local camera = parent:FindFirstChildOfClass("Camera")

		if not camera then
			camera = Instance.new("Camera")
			camera.Parent = parent
		end

		camera.FieldOfView = 40
		local n6 = math.max(v10.Magnitude, 1)
		local position = boundingBox.Position
		camera.CFrame = CFrame.lookAt(boundingBox.Position + boundingBox.LookVector * n6 * 1.25 + Vector3.new(0, n6 * 0.3, 0), position)
		parent.CurrentCamera = camera
	end

	local function fn19(arg, arg2, arg3)
		local clone3 = clone:Clone()
		clone3.Name = fn3()
		clone3.Visible = true
		clone3.Size = UDim2.new(0.9, 0, 0, fn17())
		fn12(clone3)
		local info = clone3:FindFirstChild("Info")
		local petName = info and info:FindFirstChild("PetName")
		info = info and info:FindFirstChild("LoadingBar")
		local loadingBar = info and info:FindFirstChild("LoadingBar")
		info = info and info:FindFirstChild("Time")
		local locked = clone3:FindFirstChild("Locked")

		if locked then
			locked.Visible = false
		end

		local buy = clone3:FindFirstChild("Buy")
		local title = buy and buy:FindFirstChild("Title")
		local color4 = tbl3.RarityColors[arg3.Rarity] or Color3.fromRGB(255, 255, 255)

		if petName then
			petName.Text = arg3.Name .. " Egg"
			petName.TextColor3 = color4
		end

		if loadingBar then
			loadingBar.Size = UDim2.fromScale(1, 1)
			loadingBar.BackgroundColor3 = color4
			local uiGradient = loadingBar:FindFirstChildOfClass("UIGradient")

			if uiGradient then
				uiGradient.Enabled = false
			end
		end

		if info then
			info.TextColor3 = Color3.fromRGB(255, 255, 255)
		end

		if arg2 then
			fn18(clone3:FindFirstChild("Viewport"), arg2)
		end

		local tbl10 = {
			Frame = clone3,
			Key = arg,
			Model = arg2,
			Info = arg3,
			Time = info,
			Button = buy,
			ButtonTitle = title,
			Action = nil,
		}

		if buy then
			if fn8 then
				fn8(buy, buy)
			end

			buy.Activated:Connect(function()
				if tbl10.Action == "Steal" then
					fn15(arg)
				elseif tbl10.Action == "Cancel" then
					fn16(arg)
				end

				flag2 = true
			end)
		end

		clone3.Parent = scrollingFrame
		return tbl10
	end

	local function fn20(arg)
		local v10 = tbl8[arg]

		if v10 then
			tbl8[arg] = nil

			pcall(function()
				v10.Frame:Destroy()
			end)
		end
	end

	local function fn21(arg)
		local parent = arg.Parent
		return parent ~= nil and parent.Name == "SpawnedEggs" and arg:IsA("Model") and tbl3.EggRoot(arg) ~= nil and tbl3.EggPrompt(arg) ~= nil
	end

	local function fn22()
		local n6 = 0

		for _, v10 in ipairs(tbl3.EggFolders()) do
			for _, child in ipairs(v10:GetChildren()) do
				if fn21(child) and tbl3.CanSteal(child) then
					n6 += 1
				end
			end
		end

		return n6
	end

	local function fn23()
		if not scrollingFrame then
			return
		end
		local position = tbl3.Root()
		position = position and position.Position or Vector3.zero
		local tbl10 = {}
		local tbl11 = {}

		for _, v10 in ipairs(tbl3.EggFolders()) do
			for _, child in ipairs(v10:GetChildren()) do
				if fn21(child) then
					local v11 = tbl3.EggRoot(child)
					tbl11[child] = true

					table.insert(tbl10, {
						Key = child,
						Model = child,
						Info = { Name = child.Name, Rarity = tbl3.EggRarity(child), Value = tbl3.EggValue(child) },
						Rank = tbl3.EggRank(child),
						Value = tbl3.EggValue(child),
						Distance = (v11.Position - position).Magnitude,
						Can = tbl3.CanSteal(child),
					})
				end
			end
		end

		local tbl12 = {}

		for k, v10 in pairs(tbl4.Carried) do
			if not tbl11[k] then
				tbl11[k] = true
				tbl12[k] = v10
			end
		end

		if tbl4.Target and not tbl11[tbl4.Target] and tbl8[tbl4.Target] then
			tbl11[tbl4.Target] = true
		end

		for k in pairs(tbl8) do
			if not tbl11[k] then
				fn20(k)
			end
		end

		local v10 = tbl5[n5]

		table.sort(tbl10, function(arg, arg2)
			if arg.Can ~= arg2.Can then
				return arg.Can
			end

			if v10 == "Distance" then
				return arg.Distance < arg2.Distance
			end

			if v10 == "Rarity" then
				if arg.Rank ~= arg2.Rank then
					return arg.Rank > arg2.Rank
				end

				if arg.Value ~= arg2.Value then
					return arg.Value > arg2.Value
				end
				return arg.Distance < arg2.Distance
			end

			if arg.Value ~= arg2.Value then
				return arg.Value > arg2.Value
			end
			return arg.Distance < arg2.Distance
		end)

		local tbl13 = {}
		local n6 = 0

		for _, v11 in ipairs(tbl4.AutoPlan(position)) do
			local model = v11.Model

			if not table.find(tbl4.Manual, model) and tbl4.Target ~= model then
				n6 += 1
				tbl13[model] = n6
				if not (n2 <= n6) then
					continue
				end
			else
				continue
			end

			break
		end

		local tbl14 = {}
		local tbl15 = {}

		local function fn24(arg)
			if not tbl15[arg] then
				tbl15[arg] = true
				table.insert(tbl14, arg)
			end
		end

		for k in pairs(tbl12) do
			fn24(k)
		end

		if tbl4.Target and tbl11[tbl4.Target] then
			fn24(tbl4.Target)
		end

		for _, v11 in ipairs(tbl4.Manual) do
			if tbl11[v11] then
				fn24(v11)
			end
		end

		local tbl16 = {}

		for _, v11 in ipairs(tbl10) do
			tbl16[v11.Key] = v11
			fn24(v11.Key)
		end

		local tbl17 = {}
		local v11 = fn17()

		if uiGridLayout and uiGridLayout.CellSize.Y.Offset ~= v11 then
			uiGridLayout.CellSize = UDim2.new(0.485, 0, 0, v11)
		end

		for i, v12 in ipairs(tbl14) do
			if not (n < i) then
				local v13 = tbl16[v12]
				local info = v13 and v13.Info or tbl12[v12] or tbl8[v12] and tbl8[v12].Info

				if info then
					tbl17[v12] = true
					local v14 = tbl8[v12]

					if not v14 then
						v14 = fn19(v12, v13 and v13.Model or nil, info)
						tbl8[v12] = v14
					end

					v14.Frame.LayoutOrder = i
					local str2 = string.format("%s  |  $%s/s", info.Rarity, fn10(info.Value))
					local str3, action, str4, str5

					if tbl12[v12] or tbl4.Carried[v12] then
						str3 = str2 .. "  |  In basket"
						action = nil
						str4 = "Bringing"
						str5 = "Off"
					elseif tbl4.Target == v12 then
						str3 = str2 .. "  |  Stealing..."

						if tbl4.TargetManual then
							action = "Cancel"
							str4 = "Cancel"
							str5 = "Stop"
						else
							action = nil
							str4 = "Stealing"
							str5 = "Off"
						end
					else
						if v13 then
							str2 ..= string.format("  |  %dm", math.floor(v13.Distance))
						end

						local v15 = table.find(tbl4.Manual, v12)

						if v15 then
							str3 = str2 .. "  |  Queued #" .. v15
							action = "Cancel"
							str4 = "Cancel"
							str5 = "Stop"
						elseif v13 and not v13.Can then
							str4 = string.format("Need %d JP", math.ceil(tbl3.EggNeed(v12) - tbl3.StealGrace()))
							action = nil
							str5 = "Off"
							str3 = str2
						else
							action = "Steal"
							str4 = "Steal!"
							str5 = "Go"

							if tbl13[v12] then
								str3 = str2 .. "  |  Auto #" .. tbl13[v12]
							else
								str3 = str2
							end
						end
					end

					fn9(v14.Time, str3)
					v14.Action = action
					fn9(v14.ButtonTitle, str4)
					fn13(v14.Button, str5)
				end

				continue
			end

			break
		end

		for k in pairs(tbl8) do
			if not tbl17[k] then
				fn20(k)
			end
		end

		for _, v12 in ipairs(tbl7) do
			fn9(v12, string.format("Map Eggs (%d)", #tbl10))
		end

		fn9(v7, "Sort: " .. tbl5[n5])
		local v12 = tbl2.Toggle(tbl4.Steal, false)
		fn9(v8, v12 and "Auto: ON" or "Auto: OFF")
		fn13(v9, v12 and "Go" or "Stop")
	end

	local tweenInfo = TweenInfo.new(0.12, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
	local tweenInfo2 = TweenInfo.new(0.22, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	local clone3 = nil
	local udim2 = nil
	local udim22 = nil
	local tween = nil
	local model = nil
	local position = nil
	local fn24 = nil

	local ok, result = pcall(function()
		return require(ReplicatedStorage.ClientModules.Shared.SFX)
	end)

	local ok2, result2 = pcall(function()
		return require(ReplicatedStorage.Settings.Sounds)
	end)

	if ok and ok2 and type(result) == "table" and type(result.Play) == "function" and type(result2) == "table" then
		fn24 = function()
			pcall(result.Play, result2.UIClick)
		end
	end

	fn8 = function(parent, arg)
		if not parent or not arg or not arg:IsA("GuiButton") then
			return
		end
		local buttonEffectScale = parent:FindFirstChild("ButtonEffectScale")

		if not buttonEffectScale or not buttonEffectScale:IsA("UIScale") then
			buttonEffectScale = Instance.new("UIScale")
			buttonEffectScale.Name = "ButtonEffectScale"
			buttonEffectScale.Parent = parent
		end

		local tween2 = nil

		local function fn25(arg2)
			if tween2 then
				tween2:Cancel()
			end

			tween2 = TweenService:Create(buttonEffectScale, tweenInfo, { Scale = arg2 })
			tween2:Play()
		end

		arg.MouseEnter:Connect(function()
			fn25(1.05)
		end)

		arg.MouseLeave:Connect(function()
			fn25(1)
		end)

		arg.MouseButton1Down:Connect(function()
			fn25(0.95)
		end)

		arg.MouseButton1Up:Connect(function()
			fn25(arg.GuiState == Enum.GuiState.Hover and 1.05 or 1)
		end)

		arg.Activated:Connect(function()
			if fn24 then
				fn24()
			end
		end)
	end

	local function fn25()
		local v10 = fn11()
		return v10 and v10:FindFirstChild("Pages")
	end

	local function fn26()
		local v10 = fn25()
		if not v10 then
			return
		end

		for _, child in ipairs(v10:GetChildren()) do
			local open = child:FindFirstChild("Open")

			if open and open:IsA("BoolValue") and open.Value then
				open.Value = false
			end
		end
	end

	local function fn27()
		if flag or not clone3 then
			return
		end
		fn26()
		flag = true
		flag2 = true
		pcall(fn23)

		if tween then
			tween:Cancel()
		end

		clone3.Position = udim22
		clone3.Visible = true
		tween = TweenService:Create(clone3, tweenInfo2, { Position = udim2 })
		tween:Play()
	end

	local function fn28()
		if not flag or not clone3 then
			return
		end
		flag = false

		if tween then
			tween:Cancel()
			tween = nil
		end

		clone3.Visible = false
		clone3.Position = udim2
	end

	local function fn29(arg, arg2)
		local clone4 = arg:Clone()
		clone4.Name = fn3()
		fn12(clone4)
		clone4.AnchorPoint = Vector2.new(0.5, 0.5)
		clone4.Size = UDim2.fromScale(0.17, 0.085)
		clone4.Position = UDim2.fromScale(arg2, 0.068)
		clone4.ZIndex = 5
		clone4.Parent = main
		fn8(clone4, clone4)
		return clone4, clone4:FindFirstChild("Title")
	end

	local function fn30()
		local assets = ReplicatedStorage:FindFirstChild("Assets")
		assets = assets and assets:FindFirstChild("Eggs")
		if not assets then
			return nil
		end
		local n6 = -1
		local n7 = -1
		local v10 = nil

		for _, child in ipairs(assets:GetChildren()) do
			if child:IsA("Model") then
				local n8 = tbl3.AnimalData(child.Name)
				local n9 = n8 and tbl3.RarityRank[tostring(n8.Rarity)] or 0
				n8 = n8 and tonumber(n8.CashPerSecond) or 0

				if n9 > n6 or n9 == n6 and n8 > n7 then
					n6 = n9
					n7 = n8
					v10 = child
				end
			end
		end

		return v10
	end

	local function fn31()
		local v10 = fn11()
		local pages = v10 and v10:FindFirstChild("Pages")
		local eggs = pages and pages:FindFirstChild("Eggs")
		local assets = ReplicatedStorage:FindFirstChild("Assets")
		assets = assets and assets:FindFirstChild("UIObjects")
		assets = assets and assets:FindFirstChild("Egg_Template")
		local hud = v10 and v10:FindFirstChild("HUD")
		hud = hud and hud:FindFirstChild("LeftButtons")
		hud = hud and hud:FindFirstChild("Eggs")
		if not eggs or not eggs:FindFirstChild("Main") or not assets or not hud then
			return false
		end
		screenGui = Instance.new("ScreenGui")
		screenGui.Name = fn3()
		screenGui.ResetOnSpawn = false
		screenGui.IgnoreGuiInset = v10.IgnoreGuiInset
		screenGui.ScreenInsets = v10.ScreenInsets
		screenGui.ZIndexBehavior = v10.ZIndexBehavior
		screenGui.DisplayOrder = v10.DisplayOrder + 5
		clone = assets:Clone()
		fn12(clone)
		clone3 = eggs:Clone()
		clone3.Name = fn3()
		fn12(clone3)
		clone3.Visible = false
		local position2 = eggs.Position
		udim2 = UDim2.new(position2.X.Scale, position2.X.Offset, 0.5, position2.Y.Offset)
		udim22 = UDim2.new(position2.X.Scale, position2.X.Offset, 0.65, position2.Y.Offset)
		clone3.Position = udim2
		main = clone3:FindFirstChild("Main")
		main.Visible = true
		local growAll = main:FindFirstChild("GrowAll")

		if growAll then
			growAll:Destroy()
		end

		scrollingFrame = main:FindFirstChildOfClass("ScrollingFrame")

		for _, child in ipairs(scrollingFrame:GetChildren()) do
			if child:IsA("GuiObject") and not string.find(child.Name, "Spacer", 1, true) then
				child:Destroy()
			end
		end

		scrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
		scrollingFrame.CanvasSize = UDim2.new()

		for _, child in ipairs(scrollingFrame:GetChildren()) do
			if child:IsA("UIListLayout") or child:IsA("GuiObject") and string.find(child.Name, "Spacer", 1, true) then
				child:Destroy()
			end
		end

		uiGridLayout = Instance.new("UIGridLayout")
		uiGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
		uiGridLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
		uiGridLayout.CellPadding = UDim2.new(0.015, 0, 0, 8)
		uiGridLayout.CellSize = UDim2.new(0.485, 0, 0, 100)
		uiGridLayout.Parent = scrollingFrame
		local uiPadding = Instance.new("UIPadding")
		uiPadding.PaddingTop = UDim.new(0, 8)
		uiPadding.PaddingBottom = UDim.new(0, 8)
		uiPadding.Parent = scrollingFrame
		local title = main:FindFirstChild("Title")

		if title then
			for _, v11 in ipairs({ "Active1", "Active2" }) do
				local v12 = title:FindFirstChild(v11)

				if v12 and v12:IsA("TextLabel") then
					v12.Text = "Map Eggs"
					v12.AnchorPoint = Vector2.new(0, 0.5)
					v12.Position = UDim2.new(0.105, 0, v12.Position.Y.Scale, 0)
					v12.Size = UDim2.new(0.36, 0, v12.Size.Y.Scale, 0)
					v12.TextXAlignment = Enum.TextXAlignment.Left
					table.insert(tbl7, v12)
				end
			end
		end

		local close = main:FindFirstChild("Close")

		if close and close:IsA("GuiButton") then
			fn8(close, close)
			close.Activated:Connect(fn28)
		end

		local buy = clone:FindFirstChild("Buy")

		if buy then
			local v11, v12 = fn29(buy, 0.58)
			v7 = v12
			local v13, v14 = fn29(buy, 0.77)
			v9 = v13
			v8 = v14
			fn13(v11, "Go")

			v11.Activated:Connect(function()
				n5 = n5 % #tbl5 + 1
				flag2 = true
			end)

			v9.Activated:Connect(function()
				fn14()
				flag2 = true
			end)
		end

		clone3.Parent = screenGui
		clone2 = hud:Clone()
		clone2.Name = fn3()
		fn12(clone2)
		clone2:SetAttribute("ButtonEffectsConnected", nil)

		for _, child in ipairs(clone2:GetChildren()) do
			if child:IsA("TextLabel") and child.Name == "TitleTop" then
				child.Text = "STEAL"
			end
		end

		local frame = clone2:FindFirstChild("Frame")

		if frame then
			frame.BackgroundColor3 = color2
		end

		local bgImage = clone2:FindFirstChild("BG_Image")
		bgImage = bgImage and bgImage:FindFirstChildOfClass("UIGradient")

		if bgImage then
			local colorSequence = ColorSequence.new
			local tbl10 = {}
			local v11 = ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 214, 90))
			local v12 = ColorSequenceKeypoint.new(0.45, color)
			local new = ColorSequenceKeypoint.new
			tbl10[1] = v11
			tbl10[2] = v12

			do
				local values = table.pack(new(1, color2))
				table.move(values, 1, values.n, 3, tbl10)
			end

			bgImage.Color = colorSequence(tbl10)
		end

		local imageLabel = clone2:FindFirstChild("ImageLabel")
		local v11 = fn30()

		if imageLabel and v11 then
			local viewportFrame = Instance.new("ViewportFrame")
			viewportFrame.Name = fn3()
			viewportFrame.BackgroundTransparency = 1
			viewportFrame.AnchorPoint = imageLabel.AnchorPoint
			viewportFrame.Position = imageLabel.Position
			viewportFrame.Size = imageLabel.Size
			viewportFrame.ZIndex = imageLabel.ZIndex
			viewportFrame.LightDirection = Vector3.new(-0.3, -1, -0.5)
			viewportFrame.Ambient = Color3.fromRGB(200, 200, 210)
			viewportFrame.Parent = clone2
			imageLabel.Visible = false
			fn18(viewportFrame, v11)
			local worldModel = viewportFrame:FindFirstChildOfClass("WorldModel")
			model = worldModel and worldModel:FindFirstChildOfClass("Model")

			if model then
				position = model:GetBoundingBox().Position
			end
		end

		local amount = clone2:FindFirstChild("Amount")
		textLabel = amount and amount:FindFirstChildOfClass("TextLabel")
		clone2.AnchorPoint = Vector2.new(0, 0)
		clone2.Parent = screenGui
		local detector = clone2:FindFirstChild("Detector")

		if detector and detector:IsA("GuiButton") then
			fn8(clone2, detector)

			detector.Activated:Connect(function()
				if flag then
					fn28()
				else
					fn27()
				end
			end)
		end

		for _, child in ipairs(pages:GetChildren()) do
			local open = child:FindFirstChild("Open")

			if open and open:IsA("BoolValue") then
				table.insert(tbl9, open.Changed:Connect(function(arg)
					if arg then
						fn28()
					end
				end))
			end
		end

		screenGui.Parent = v3
		return true
	end

	local function fn32()
		if not clone2 or not screenGui then
			return
		end
		local v10 = fn11()
		local hud = v10 and v10:FindFirstChild("HUD")
		hud = hud and hud:FindFirstChild("LeftButtons")
		local eggs = hud and hud:FindFirstChild("Eggs")
		local pets = hud and hud:FindFirstChild("Pets")
		if not eggs or not pets or not hud.Visible or not v10.Enabled then
			clone2.Visible = false
			return
		end
		local n6 = eggs.AbsolutePosition + eggs.AbsolutePosition - pets.AbsolutePosition - screenGui.AbsolutePosition
		clone2.Size = UDim2.fromOffset(eggs.AbsoluteSize.X, eggs.AbsoluteSize.Y)
		clone2.Position = UDim2.fromOffset(n6.X, n6.Y)
		clone2.Visible = true
	end

	local function fn33()
		if screenGui then
			return
		end

		if not fn31() then
			return
		end

		for _, v10 in ipairs(tbl3.EggFolders()) do
			table.insert(tbl9, v10.ChildAdded:Connect(function()
				flag2 = true
			end))

			table.insert(tbl9, v10.ChildRemoved:Connect(function()
				flag2 = true
			end))
		end

		local n6 = 0
		local n7 = 0

		table.insert(tbl9, RunService.RenderStepped:Connect(function(deltaTime)
			pcall(fn32)
			n6 += deltaTime
			n7 += deltaTime

			if model and position and model.Parent then
				pcall(function()
					local pivot = model:GetPivot()
					model:PivotTo(CFrame.new(position) * CFrame.Angles(0, deltaTime * 1.2, 0) * CFrame.new(-position) * pivot)
				end)
			end

			if flag and (flag2 or n6 >= 0.4) then
				n6 = 0
				flag2 = false
				pcall(fn23)
			end

			if n7 >= 1 then
				n7 = 0

				if textLabel then
					fn9(textLabel, tostring(fn22()))
				end
			end
		end))
	end

	local function fn34()
		for _, v10 in ipairs(tbl9) do
			v10:Disconnect()
		end

		table.clear(tbl9)
		table.clear(tbl8)
		table.clear(tbl7)
		flag = false

		if screenGui then
			pcall(function()
				screenGui:Destroy()
			end)
		end

		screenGui = nil
		main = nil
		scrollingFrame = nil
		clone = nil
		clone2 = nil
		textLabel = nil
		clone3 = nil
		model = nil
	end

	task.spawn(function()
		local n6 = os.clock() + 30

		while flag3 and not screenGui and os.clock() < n6 do
			pcall(fn33)

			if not screenGui then
				task.wait(1)
			end
		end
	end)

	fn4(function()
		flag3 = false
		fn34()
	end)
end

local v7, v8, tbl6, fn9

do
	local v9 = v2:CreateTab({ Name = "Shop & Pets", SectionsExpanded = true })
	local v10 = v9:CreateSection({ Name = "Auto Shop", Expanded = true })
	local v11 = v9:CreateSection({ Name = "Auto Sell", Expanded = true })
	v7 = v9:CreateSection({ Name = "Auto Mutation", Expanded = true })
	v8 = defaultTab:CreateSection({ Name = "Breakthrough Event", Expanded = false })
	tbl6 = {}
	local tbl7 = {}
	local list = tbl.Animals and tbl.Animals.List

	if type(list) == "table" then
		for k, v12 in pairs(list) do
			if type(v12) == "table" then
				table.insert(tbl7, {
					Name = tostring(k),
					Rank = tbl3.RarityRank[tostring(v12.Rarity)] or 0,
					Value = tonumber(v12.CashPerSecond) or 0,
				})
			end
		end
	end

	table.sort(tbl7, function(arg, arg2)
		if arg.Rank ~= arg2.Rank then
			return arg.Rank > arg2.Rank
		end

		if arg.Value ~= arg2.Value then
			return arg.Value > arg2.Value
		end
		return arg.Name < arg2.Name
	end)

	for _, v12 in ipairs(tbl7) do
		table.insert(tbl6, v12.Name)
	end

	tbl3.Inventory = function()
		local petInventory = remotes:FindFirstChild("PetInventory")
		if not petInventory then
			return nil
		end
		local v12 = nil

		local connection = petInventory.OnClientEvent:Connect(function(arg, arg2)
			if arg == "Snapshot" and type(arg2) == "table" then
				v12 = arg2
			end
		end)

		pcall(function()
			petInventory:FireServer("Get")
		end)

		local n = os.clock() + 4

		while not v12 and os.clock() < n do
			task.wait(0.1)
		end

		connection:Disconnect()
		return v12
	end

	tbl3.PetTools = function()
		return tbl3.Tools(function(arg)
			return arg:GetAttribute("IsPetInventoryTool") == true and type(arg:GetAttribute("AnimalName")) == "string"
		end)
	end

	tbl4.Reserved = {}

	fn9 = function(arg, arg2)
		tbl4.Reserved[arg] = arg2 or nil
	end

	local createToggle = nil
	local v12 = nil
	local flag = true

	local function fn10(arg)
		local v13 = localPlayer:FindFirstChild(arg)
		return v13 and v13:FindFirstChild("Owned"), v13 and v13:FindFirstChild("Equipped")
	end

	local function fn11(arg)
		local ok, result = pcall(function()
			return require(settings_:WaitForChild(arg, 5))
		end)

		if not ok or type(result) ~= "table" or type(result.GetOrdered) ~= "function" then
			return {}
		end
		local ok2, result2 = pcall(result.GetOrdered)
		return ok2 and type(result2) == "table" and result2 or {}
	end

	local function fn12(arg, arg2, arg3)
		local v13, v14 = fn10(arg)
		if not v13 or not v14 then
			return
		end
		local v15 = fn11(arg2)
		local n = -math.huge
		local v16 = nil
		local tbl8 = nil

		for _, v17 in ipairs(v15) do
			local name = v17.Name
			local settings_2 = v17.Settings or {}
			local v18 = v13:FindFirstChild(name)
			local n2 = tonumber(settings_2.Order) or 0

			if v18 and v18.Value then
				if n2 > n then
					n = n2
					v16 = name
				end
			elseif not tbl8 then
				tbl8 = { Name = name, Cost = tonumber(settings_2.Cost) or math.huge }
			end
		end

		local flag2

		if tbl8 then
			local cost = tbl8.Cost
			flag2 = tbl3.Cash() >= cost
		else
			flag2 = tbl8
		end

		if flag2 then
			tbl3.Fire(arg3, "Select", tbl8.Name)
			task.wait(1)
			return
		end

		if v16 and v14.Value ~= v16 then
			tbl3.Fire(arg3, "Select", v16)
			task.wait(1)
		end
	end

	task.spawn(function()
		while flag do
			if tbl2.Toggle(createToggle, false) then
				pcall(fn12, "CoilData", "SpeedUpgrades", "Coils")
			end

			if tbl2.Toggle(v12, false) then
				pcall(fn12, "TrailData", "Trails", "Trails")
			end

			local n = os.clock() + 3

			while flag and os.clock() < n do
				task.wait(0.25)
			end
		end
	end)

	fn4(function()
		flag = false
	end)

	createToggle = v10.CreateToggle

	createToggle = createToggle(v10, {
		Name = "Auto Buy Coils",
		Default = false,
		Callback = function()
		end,
	})

	v12 = v10:CreateToggle({
		Name = "Auto Buy Trails",
		Default = false,
		Callback = function()
		end,
	})

	local tbl8 = { "Any", "100", "1K", "10K", "100K", "1M", "10M", "100M", "1B" }

	local tbl9 = {
		Any = math.huge,
		["100"] = 100,
		["1K"] = 1000,
		["10K"] = 10000,
		["100K"] = 100000,
		["1M"] = 1000000,
		["10M"] = 10000000,
		["100M"] = 100000000,
		["1B"] = 1e9,
	}

	local v13 = nil
	local v14 = nil
	local v15 = nil
	local tbl10 = { Common = true }
	local tbl11 = {}
	local huge = math.huge
	local flag2 = true

	local function fn13(arg)
		if type(arg.Mutation) == "string" and arg.Mutation ~= "" then
			return true
		end

		if type(arg.EventMutation) == "string" and arg.EventMutation ~= "" then
			return true
		end
		return type(arg.Mutations) == "table" and #arg.Mutations > 0
	end

	local function fn14()
		local v16 = tbl3.Inventory()
		if type(v16) ~= "table" then
			return
		end
		local tbl12 = {}

		if tbl2.Toggle(v15, false) then
			for _, v17 in ipairs(v16) do
				if v17.Kind == "Pet" then
					local v18 = tbl12[v17.Name]
					local flag3 = not v18

					if not flag3 then
						flag3 = (tonumber(v17.CashPerSecond) or 0) > (tonumber(v18.CashPerSecond) or 0)
					end

					if flag3 then
						tbl12[v17.Name] = v17
					end
				end
			end
		end

		local v17 = tbl2.Toggle(v14, true)
		local n = 0

		for _, v18 in ipairs(v16) do
			if not (not flag2 or not tbl2.Toggle(v13, false)) then
				local flag3 = v18.Kind == "Pet" and v18.Sellable ~= false and v18.Equipped ~= true and v18.LockedInIncubator ~= true and v18.LockedInMutationMachine ~= true and tbl10[tostring(v18.Rarity)] and not tbl11[tostring(v18.Name)] and not tbl4.Reserved[tostring(v18.Name)]
				local flag4

				if flag3 then
					flag4 = not (v17 and fn13(v18))
				else
					flag4 = flag3
				end

				if flag4 then
					flag4 = (tonumber(v18.CashPerSecond) or 0) <= huge
				end

				flag4 = flag4 and tbl12[v18.Name] ~= v18

				if flag4 and type(v18.Id) == "string" then
					tbl3.Fire("PetInventory", "Sell", v18.Id)
					n += 1
					task.wait(0.35)
				end

				continue
			end

			break
		end

		if n > 0 then
			tbl3.Status = string.format("Sold %d pets", n)
		end
	end

	task.spawn(function()
		while flag2 do
			if tbl2.Toggle(v13, false) then
				pcall(fn14)
			end

			local n = os.clock() + 15

			while flag2 and os.clock() < n do
				task.wait(0.5)
			end
		end
	end)

	fn4(function()
		flag2 = false
	end)

	v13 = v11:CreateToggle({
		Name = "Auto Sell Pets",
		Default = false,
		Callback = function()
		end,
	})

	v11:CreateMultiDropdown({
		Name = "Sell Rarities",
		Options = tbl3.RarityOrder,
		Default = { "Common" },
		Callback = function(arg)
			tbl10 = fn7(arg)
		end,
	})

	v11:CreateDropdown({
		Name = "Sell Only Below Cash/s",
		Options = tbl8,
		Default = tbl8[1],
		Callback = function(arg)
			huge = tbl9[tostring(arg)] or math.huge
		end,
	})

	v11:CreateMultiDropdown({
		Name = "Never Sell Animals",
		Options = tbl6,
		Default = {},
		Callback = function(arg)
			tbl11 = fn7(arg)
		end,
	})

	v14 = v11:CreateToggle({
		Name = "Keep Mutated Pets",
		Default = true,
		Callback = function()
		end,
	})

	v15 = v11:CreateToggle({
		Name = "Keep Best Of Each Animal",
		Default = false,
		Callback = function()
		end,
	})
end

do
	local tbl7 = { "Cheapest", "Most Copies", "Highest Value" }
	local createToggle = nil
	local tbl8 = {}
	local str2 = tbl7[1]
	local n = 0
	local v9 = nil

	local function fn10()
		local map = workspace:FindFirstChild("Map")
		map = map and map:FindFirstChild("Mutations")
		map = map and map:FindFirstChild("Detector")
		local mutationPrompt = map and map:FindFirstChild("MutationPrompt")
		if map and mutationPrompt and mutationPrompt:IsA("ProximityPrompt") then
			return map, mutationPrompt
		end
		return nil, nil
	end

	local function fn11()
		local Mutations = fn2("Mutations")
		Mutations = Mutations and Mutations.Machine
		return type(Mutations) == "table" and tonumber(Mutations.RequiredMatchingPets) or 5
	end

	local function fn12()
		local tbl9 = {}

		for _, v10 in ipairs(tbl3.PetTools()) do
			local attribute = v10:GetAttribute("Mutation")
			local attribute2 = v10:GetAttribute("EventMutation")

			if (attribute == nil or attribute == "") and (attribute2 == nil or attribute2 == "") then
				local attribute3 = v10:GetAttribute("AnimalName")
				tbl9[attribute3] = tbl9[attribute3] or {}
				table.insert(tbl9[attribute3], v10)
			end
		end

		return tbl9
	end

	local function fn13(arg, arg2)
		local attribute = localPlayer:GetAttribute("MutationCraftAnimalName")
		local flag = type(attribute) == "string" and attribute ~= ""

		if flag then
			flag = (tonumber(localPlayer:GetAttribute("MutationStoredCount")) or 0) > 0
		end

		if flag then
			return attribute
		end
		local v10 = nil
		local v11 = nil

		for k, v12 in pairs(arg) do
			if #v12 >= arg2 and (next(tbl8) == nil or tbl8[k]) then
				local n2 = tbl3.AnimalData(k)
				n2 = n2 and tonumber(n2.CashPerSecond) or 0

				if str2 == tbl7[2] then
					n2 = #v12
				elseif str2 ~= tbl7[3] then
					n2 = -n2
				end

				if not v10 or n2 > v10 then
					v10 = n2
					v11 = k
				end
			end
		end

		return v11
	end

	local function fn14(arg)
		if v9 and v9 ~= arg then
			fn9(v9, false)
		end

		v9 = arg

		if arg then
			fn9(arg, true)
		end
	end

	tbl4.MutationWanted = function()
		if not tbl2.Toggle(createToggle, false) or os.clock() < n or tbl3.Carried() > 0 then
			return false
		end

		if localPlayer:GetAttribute("MutationCraftReady") == true then
			return true
		end

		if localPlayer:GetAttribute("MutationCraftActive") == true then
			return false
		end
		local n2 = tonumber(localPlayer:GetAttribute("MutationStoredCount")) or 0
		local max = math.max
		local v10 = fn13(fn12(), max(1, fn11() - n2))
		fn14(v10)
		return v10 ~= nil
	end

	tbl4.MutationStep = function(arg)
		n = os.clock() + 10
		local v10, v11 = fn10()
		if not v10 then
			return false
		end
		local n2 = v10.Position + Vector3.new(0, 3, 0)
		tbl3.Status = "Using mutation machine"
		if not tbl3.FlyTo(n2, arg, 4) then
			return false
		end
		tbl3.Hold(n2, 0.3)

		if localPlayer:GetAttribute("MutationCraftReady") == true then
			tbl3.Unequip()
			tbl3.FirePrompt(v11)
			task.wait(1)
			fn14(nil)
			return true
		end

		local flag = false

		for i = 1, fn11() do
			if not (arg() or localPlayer:GetAttribute("MutationCraftActive") == true) then
				local n3 = tonumber(localPlayer:GetAttribute("MutationStoredCount")) or 0
				local v12 = fn12()
				local v13 = fn13(v12, math.max(1, fn11() - n3))
				local v14 = v13 and v12[v13]

				if not (not v14 or #v14 == 0) then
					fn14(v13)
					local v15 = v14[1]
					tbl3.Status = string.format("Adding %s to mutation (%d/%d)", v13, n3, fn11())

					if tbl3.Equip(v15) then
						tbl3.Hold(n2, 0.15)
						tbl3.FirePrompt(v11)
						local n4 = os.clock() + 1.5

						while (tonumber(localPlayer:GetAttribute("MutationStoredCount")) or 0) == n3 and localPlayer:GetAttribute("MutationCraftActive") ~= true and os.clock() < n4 do
							RunService.Heartbeat:Wait()
						end

						if not ((tonumber(localPlayer:GetAttribute("MutationStoredCount")) or 0) == n3 and localPlayer:GetAttribute("MutationCraftActive") ~= true) then
							flag = true
							continue
						end
					else
						continue
					end
				end
			end

			break
		end

		tbl3.Unequip()

		if localPlayer:GetAttribute("MutationCraftActive") == true then
			fn14(nil)
		end

		return flag
	end

	table.insert(tbl4.Extras, {
		Wanted = function()
			return tbl4.MutationWanted()
		end,
		Step = function(arg)
			return tbl4.MutationStep(arg)
		end,
		Active = function()
			return tbl2.Toggle(createToggle, false)
		end,
	})

	createToggle = v7.CreateToggle

	createToggle = createToggle(v7, {
		Name = "Auto Mutation",
		Default = false,
		Callback = function(arg)
			n = 0

			if not arg then
				fn14(nil)
			end

			tbl4.Wake()
		end,
	})

	fn5(v7:CreateMultiDropdown({
		Name = "Mutation Animals",
		Options = tbl6,
		Default = {},
		Callback = function(arg)
			tbl8 = fn7(arg)
			n = 0
		end,
	}))

	v7:CreateDropdown({
		Name = "Mutation Pick",
		Options = tbl7,
		Default = tbl7[1],
		Callback = function(arg)
			str2 = tostring(arg)
			n = 0
		end,
	})
end

do
	local v9 = nil
	local v10 = nil
	local v11 = nil
	local n = 0
	local n2 = 0
	local n3 = 0
	local tbl7 = {}

	local function fn10()
		return tonumber(localPlayer:GetAttribute("CarriedFossilCount")) or 0
	end

	local function fn11()
		local map = workspace:FindFirstChild("Map")
		return map and map:FindFirstChild("FossilEvent")
	end

	local function fn12()
		local station = fn11()
		station = station and station:FindFirstChild("Station")
		station = station and station:FindFirstChild("ResearchTable")
		station = station and station:FindFirstChild("Table")
		local placeAttachment = station and station:FindFirstChild("PlaceAttachment")
		placeAttachment = placeAttachment and placeAttachment:FindFirstChild("PlacePrompt")
		if placeAttachment and placeAttachment:IsA("ProximityPrompt") then
			return placeAttachment
		end
		return nil
	end

	local function fn13()
		local eggStand = fn11()
		eggStand = eggStand and eggStand:FindFirstChild("EggStand")
		if not eggStand then
			return nil
		end

		for _, descendant in ipairs(eggStand:GetDescendants()) do
			if descendant:IsA("ProximityPrompt") and descendant.Name == "BuyPrompt" then
				return descendant
			end
		end

		return nil
	end

	local function fn14(arg)
		arg = arg and arg.Parent
		if arg and arg:IsA("Attachment") then
			return arg.WorldPosition
		end

		if arg and arg:IsA("BasePart") then
			return arg.Position
		end
		return nil
	end

	local function fn15(arg)
		local areas = tbl.Areas
		areas = areas and areas.JumpCap
		local climbs = type(areas) == "table" and areas.Climbs or nil
		local str2 = tostring(arg:GetAttribute("AreaName") or "") .. tostring(arg:GetAttribute("SpawnerName") or "")
		return math.sqrt(math.max(0, type(climbs) == "table" and tonumber(climbs[str2]) or 0) * 293)
	end

	local function fn16()
		local tbl8 = {}
		local now = os.clock()
		local map = workspace:FindFirstChild("Map")
		map = map and map:FindFirstChild("Stages")
		if not map then
			return tbl8
		end

		for _, child in ipairs(map:GetChildren()) do
			local spawnedFossils = child:FindFirstChild("SpawnedFossils")
			local v12 = ipairs
			local children = spawnedFossils and spawnedFossils:GetChildren() or {}

			for _, child2 in v12(children) do
				local v13 = nil

				for _, descendant in ipairs(child2:GetDescendants()) do
					if descendant:IsA("ProximityPrompt") and descendant.Name == "DigPrompt" then
						v13 = descendant
						break
					else
						v13 = nil
					end
				end

				local v14 = tbl7[child2]
				local enabled = v13 and v13.Enabled

				if enabled then
					enabled = not (v14 and v14 > now)
				end

				if enabled then
					enabled = (tonumber(child2:GetAttribute("CarriedByUserId")) or 0) == 0
				end

				if enabled and fn15(child2) <= tbl3.JumpPower() + tbl3.StealGrace() then
					table.insert(tbl8, {
						Model = child2,
						Prompt = v13,
						Point = fn14(v13),
						Fragments = tonumber(child2:GetAttribute("Fragments")) or 0,
					})
				end
			end
		end

		table.sort(tbl8, function(arg, arg2)
			return arg.Fragments > arg2.Fragments
		end)

		return tbl8
	end

	local function fn17()
		local v12 = fn12()
		local v13 = fn14(v12)
		if not v13 then
			return false
		end
		tbl3.Status = "Returning fossil"
		if not tbl3.FlyTo(v13 + Vector3.new(0, 2, 0), nil, 3) then
			return false
		end
		tbl3.Hold(v13 + Vector3.new(0, 2, 0), 0.3)
		tbl3.FirePrompt(v12)
		local n4 = os.clock() + 2

		while fn10() > 0 and os.clock() < n4 do
			RunService.Heartbeat:Wait()
		end

		local n5 = localPlayer:FindFirstChild("Fragments") and localPlayer.Fragments.Value or 0
		task.wait(0.5)
		tbl3.Fire("Fossil", "Finish")
		local n6 = os.clock() + 2

		while localPlayer:FindFirstChild("Fragments") and localPlayer.Fragments.Value == n5 and os.clock() < n6 do
			RunService.Heartbeat:Wait()
		end

		return true
	end

	local function fn18()
		if not tbl2.Toggle(v9, false) or tbl3.Carried() > 0 then
			return false
		end

		if fn10() > 0 then
			return true
		end
		return os.clock() >= n and fn16()[1] ~= nil
	end

	local function fn19(arg)
		if fn10() > 0 then
			return fn17(arg)
		end
		n = os.clock() + 5
		local v12 = fn16()[1]
		if not v12 or not v12.Point then
			return false
		end

		if localPlayer:GetAttribute("IsSquatting") == true then
			tbl3.Fire("StopSquattingRequest")
			task.wait(0.5)
		end

		tbl3.Status = string.format("Digging %s", tostring(v12.Model:GetAttribute("FossilSize") or v12.Model.Name))
		local n4 = v12.Point + Vector3.new(0, 3, 0)
		if not tbl3.FlyTo(n4, arg, 4) then
			tbl7[v12.Model] = os.clock() + 20
			return false
		end
		tbl3.Hold(n4, 0.3)
		tbl3.FirePrompt(v12.Prompt)
		local n5 = os.clock() + 3.5

		while fn10() == 0 and os.clock() < n5 do
			RunService.Heartbeat:Wait()
		end

		if fn10() == 0 then
			tbl7[v12.Model] = os.clock() + 30
			return false
		end
		local v13 = tbl3.Root()

		if v13 then
			tbl3.FlyTo(v13.Position + Vector3.new(0, tbl3.CruiseHeight, 0), nil, 3)
		end

		return fn17(arg)
	end

	local function fn20()
		if not tbl2.Toggle(v10, false) or os.clock() < n2 or tbl3.Carried() > 0 or fn10() > 0 then
			return false
		end
		local fragments = localPlayer:FindFirstChild("Fragments")
		return fragments ~= nil and fragments.Value >= 500 and fn13() ~= nil
	end

	local function fn21(arg)
		n2 = os.clock() + 5
		local v12 = fn13()
		local v13 = fn14(v12)
		if not v13 then
			return false
		end
		local fragments = localPlayer.Fragments
		local value = fragments.Value
		tbl3.Status = "Buying fossiled egg"
		if not tbl3.FlyTo(v13 + Vector3.new(0, 2, 0), arg, 3) then
			return false
		end
		tbl3.Hold(v13 + Vector3.new(0, 2, 0), 0.3)
		tbl3.FirePrompt(v12)
		local n4 = os.clock() + 2

		while fragments.Value == value and os.clock() < n4 do
			RunService.Heartbeat:Wait()
		end

		if fragments.Value == value then
			n2 = os.clock() + 30
			return false
		end
		return true
	end

	local function fn22()
		local Incubator = fn2("Incubator")
		local requirements = Incubator and Incubator.Requirements
		return type(requirements) == "table" and tonumber(requirements.Count) or 3
	end

	local function fn23()
		if localPlayer:GetAttribute("IncubatorReady") == true then
			return "Claim"
		end
		local n4 = tonumber(localPlayer:GetAttribute("IncubatorFinishAt")) or 0

		if n4 > 0 then
			if n4 <= workspace:GetServerTimeNow() then
				return "Claim"
			end
			return nil
		end

		local v12 = fn22()
		if (tonumber(localPlayer:GetAttribute("IncubatorFilledCount")) or 0) >= v12 then
			return "Start"
		end
		local tbl8 = {}

		for _, v13 in ipairs(tbl3.PetTools()) do
			tbl8[v13:GetAttribute("AnimalName")] = true
		end

		for i = 1, v12 do
			local attribute = localPlayer:GetAttribute("IncubatorRequirement" .. i)
			if localPlayer:GetAttribute("IncubatorFilled" .. i) ~= true and type(attribute) == "string" and tbl8[attribute] then
				return "Insert", i
			end
		end

		return nil
	end

	table.insert(tbl4.Extras, {
		Wanted = function()
			if not tbl2.Toggle(v11, false) or os.clock() < n3 or tbl3.Carried() > 0 or fn10() > 0 then
				return false
			end

			for i = 1, fn22() do
				local attribute = localPlayer:GetAttribute("IncubatorRequirement" .. i)

				if type(attribute) == "string" and attribute ~= "" then
					fn9(attribute, true)
				end
			end

			return fn23() ~= nil
		end,
		Step = function(arg)
			n3 = os.clock() + 5
			local fuseMachine = workspace:FindFirstChild("FuseMachine")
			fuseMachine = fuseMachine and fuseMachine:FindFirstChild("Main")
			if not fuseMachine or not fuseMachine:IsA("BasePart") then
				return false
			end
			local n4 = fuseMachine.Position + Vector3.new(0, 4, 8)
			tbl3.Status = "Using incubator"
			if not tbl3.FlyTo(n4, arg, 6) then
				return false
			end
			local flag = false

			for i = 1, 5 do
				local v12, v13 = fn23()

				if v12 then
					tbl3.Fire("Incubator", v12, v13)
					task.wait(0.8)
					flag = true
					continue
				end

				break
			end

			return flag
		end,
		Active = function()
			return tbl2.Toggle(v11, false)
		end,
	})

	table.insert(tbl4.Extras, {
		Wanted = fn20,
		Step = fn21,
		Active = function()
			return tbl2.Toggle(v10, false)
		end,
	})

	table.insert(tbl4.Extras, {
		Wanted = fn18,
		Step = fn19,
		Active = function()
			return tbl2.Toggle(v9, false)
		end,
	})

	v9 = v8:CreateToggle({
		Name = "Auto Dig Fossils",
		Default = false,
		Callback = function()
			n = 0
			tbl4.Wake()
		end,
	})

	v10 = v8:CreateToggle({
		Name = "Auto Buy Fossiled Egg",
		Default = false,
		Callback = function()
			n2 = 0
			tbl4.Wake()
		end,
	})

	v11 = v8:CreateToggle({
		Name = "Auto Incubator",
		Default = false,
		Callback = function(arg)
			n3 = 0

			if not arg then
				for i = 1, 6 do
					local attribute = localPlayer:GetAttribute("IncubatorRequirement" .. i)

					if type(attribute) == "string" then
						fn9(attribute, false)
					end
				end
			end

			tbl4.Wake()
		end,
	})
end

local v9, tbl7

do
	local v10 = v2:CreateTab({ Name = "Predictor", SectionsExpanded = true })
	v9 = v10:CreateSection({ Name = "Egg Predictor", Expanded = true })

	local function fn10(arg)
		local tbl8 = {}

		for i, v11 in ipairs(arg) do
			tbl8[i] = ColorSequenceKeypoint.new(v11[1], v11[2])
		end

		return ColorSequence.new(tbl8)
	end

	local function fn11(arg, arg2)
		local ok, result = pcall(Font.new, arg, arg2, Enum.FontStyle.Normal)
		return ok and result or nil
	end

	tbl7 = {
		Ready = type(v9.CreateCanvas) == "function",
		Bullet = utf8.char(8226),
		Color = {
			Text = "#FFFFFF",
			Income = "#4DFF7A",
			Clock = "#FFC24D",
			Ready = "#4DFF7A",
			Growing = "#FFC24D",
			Inventory = "#7FD8FF",
			Weight = "#CDE7FF",
			Scale = "#FFDF8A",
			Separator = "#7A8CC0",
			Hint = "#9FB8FF",
		},
		NameFont = fn11("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.ExtraBold),
	}

	tbl7.RarityFont = fn11("rbxassetid://12187365977", Enum.FontWeight.Bold) or fn11("rbxasset://fonts/families/FredokaOne.json", Enum.FontWeight.Regular)
	local tbl8 = {}
	local tbl9 = { 0, Color3.fromRGB(255, 255, 255) }
	local tbl10 = { 0.5, Color3.fromRGB(222, 238, 255) }
	local tbl11 = { 1, Color3.fromRGB(255, 255, 255) }
	tbl8[1] = tbl9
	tbl8[2] = tbl10
	tbl8[3] = tbl11
	tbl7.NameGradient = fn10(tbl8)
	local tbl12 = {}
	local tbl13 = { 0, Color3.fromRGB(255, 255, 255) }
	local tbl14 = { 0.2, Color3.fromRGB(206, 212, 224) }
	local tbl15 = { 0.42, Color3.fromRGB(74, 80, 94) }
	local tbl16 = { 0.58, Color3.fromRGB(42, 46, 56) }
	local tbl17 = { 0.78, Color3.fromRGB(158, 166, 182) }
	local tbl18 = { 1, Color3.fromRGB(250, 252, 255) }
	tbl12[1] = tbl13
	tbl12[2] = tbl14
	tbl12[3] = tbl15
	tbl12[4] = tbl16
	tbl12[5] = tbl17
	tbl12[6] = tbl18
	tbl7.SecretGradient = fn10(tbl12)
	tbl7.SecretRotation = 90

	tbl7.Paint = function(arg, arg2)
		return string.format("<font color=\"%s\">%s</font>", arg, arg2)
	end

	tbl7.Bold = function(arg)
		return "<b>" .. tostring(arg) .. "</b>"
	end

	tbl7.Escape = function(arg)
		return (string.gsub(tostring(arg), "[<>&]", { ["<"] = "&lt;", [">"] = "&gt;", ["&"] = "&amp;" }))
	end

	tbl7.Separator = function()
		return tbl7.Paint(tbl7.Color.Separator, "  " .. tbl7.Bullet .. "  ")
	end

	tbl7.FormatRate = function(arg)
		local n = tonumber(arg) or 0
		if n >= 1e12 then
			return string.format("%.2fT/s", n / 1e12)
		end

		if n >= 1e9 then
			return string.format("%.2fB/s", n / 1e9)
		end

		if n >= 1000000 then
			return string.format("%.2fM/s", n / 1000000)
		end

		if n >= 1000 then
			return string.format("%.1fK/s", n / 1000)
		end
		return string.format("%d/s", math.floor(n))
	end

	tbl7.FormatWeight = function(arg)
		local n = tonumber(arg) or 0
		local str2 = n >= 1000 and string.format("%.0f", n) or string.format("%.2f", n)
		local v11, v12 = string.match(str2, "^(%-?%d+)(%.%d+)$")
		v11 = v11 or str2
		local v13

		while true do
			local v14
			v13, v14 = string.gsub(v11, "^(%-?%d+)(%d%d%d)", "%1,%2")

			if v14 ~= 0 then
				v11 = v13
			else
				break
			end
		end

		return v13 .. (v12 or "") .. " Kg"
	end

	tbl7.FormatClock = function(arg)
		local n = math.max(0, math.floor(tonumber(arg) or 0))
		return string.format("%02dh %02dm %02ds", math.floor(n / 3600), math.floor(n % 3600 / 60), n % 60)
	end

	tbl7.ScaleFactor = function(arg)
		if arg > 5 then
			return (arg / 5) ^ 1.2 * 19.637875755794113
		end
		return arg ^ 1.85
	end

	tbl7.MutationMultiplier = function()
		return 1
	end

	local tbl19 = {
		Golden = "#FFD34D",
		Silver = "#E6EEF7",
		Sakura = "#FF9ED8",
		GreatBloom = "#7CFFC4",
		Boss = "#FF7A7A",
		Monstrous = "#C08BFF",
	}

	local tbl20 = { "#FF6B6B", "#FFB36B", "#FFF06B", "#6BFF8A", "#6BC8FF", "#B96BFF" }

	tbl7.MutationText = function(arg)
		local tbl21 = {}

		if type(arg) == "table" then
			for _, v11 in ipairs(arg) do
				local v12 = string.upper(tostring(v11))

				if v11 == "Rainbow" or v11 == "Prismatic" then
					local tbl22 = {}

					for i = 1, #v12 do
						table.insert(tbl22, tbl7.Paint(tbl20[(i - 1) % #tbl20 + 1], string.sub(v12, i, i)))
					end

					local insert = table.insert
					local v13 = table.pack(tbl7.Bold(table.concat(tbl22)))
					insert(tbl21, table.unpack(v13, 1, v13.n))
				else
					table.insert(tbl21, tbl7.Bold(tbl7.Paint(tbl19[v11] or "#8FE3FF", tbl7.Escape(v12))))
				end
			end
		end

		return table.concat(tbl21, " ")
	end

	local tbl21 = {}

	tbl7.AssetInfo = function(arg)
		local str2 = tostring(arg)
		local v11 = tbl21[str2]
		if v11 then
			return v11
		end
		local v12 = tbl3.AnimalData(str2)
		local str3 = v12 and tostring(v12.Rarity) or "Common"
		local color3 = tbl3.RarityColors[str3] or Color3.fromRGB(255, 255, 255)
		local assets = ReplicatedStorage:FindFirstChild("Assets")
		assets = assets and assets:FindFirstChild("Eggs")

		local tbl22 = {
			Name = str2 .. " Egg",
			Category = str2,
			Rarity = str3,
			RarityNumber = tbl3.RarityRank[str3] or 0,
			Color = color3,
			Hex = "#" .. string.upper(color3:ToHex()),
			Gradient = nil,
			EarningRate = v12 and tonumber(v12.CashPerSecond) or 0,
			Icon = nil,
			Model = assets and assets:FindFirstChild(str2) or nil,
		}

		tbl21[str2] = tbl22
		return tbl22
	end

	tbl7.Income = function(arg, arg2)
		return math.max(math.floor((tonumber(arg.EarningRate) or 0) * (tonumber(arg2) or 1) + 0.5), 0)
	end

	local function isShown(arg)
		if typeof(arg) ~= "Instance" or not arg:IsDescendantOf(game) then
			return false
		end

		while arg do
			if arg:IsA("GuiObject") and not arg.Visible then
				return false
			end

			if arg:IsA("LayerCollector") then
				return arg.Enabled
			end
			arg = arg.Parent
		end

		return false
	end

	tbl7.PageVisible = function()
		local ok, result = pcall(function()
			return v10.Page
		end)

		if not ok or typeof(result) ~= "Instance" then
			return true
		end
		return isShown(result) and result.AbsoluteSize.X > 0
	end

	tbl7.IsShown = isShown
end

local tbl8
tbl8 = { "Value", "Rarity", "Time Left" }
local tbl9

tbl9 = {
	{ Key = "Ready", Title = "READY TO HATCH", Color = tbl7.Color.Ready },
	{ Key = "Growing", Title = "GROWING", Color = tbl7.Color.Growing },
	{ Key = "Inventory", Title = "IN INVENTORY", Color = tbl7.Color.Inventory },
}

local n
n = 1
local paint
paint = tbl7.Paint
local bold
bold = tbl7.Bold
local color3
color3 = tbl7.Color
local tbl10
tbl10 = { Sort = tbl8[1], Spotlight = true }
local id
id = nil
local v10, tbl11, tbl12, tbl13

do
	local n2 = 0.0909
	v10 = nil
	tbl11 = {}
	tbl12 = {}
	tbl13 = {}
	local tbl14 = {}
	local n3 = 0
	local n4 = 0
	local n5 = 0.06
	local n6 = -1
	local n7 = -1
	local n8 = -1
	local n9 = 4
	local n10 = 3
	local flag = false
	local n11 = 0
	local flag2 = true
	local n12 = 0
	local flag3 = false
	local v11 = nil

	local function requestEggRefresh()
		flag2 = true
	end

	local function fn10(arg)
		if not arg or arg.DiffWrapped then
			return arg
		end
		local set = arg.Set
		arg.DiffWrapped = true

		arg.Set = function(arg2)
			if type(arg2) ~= "table" then
				return set(arg2)
			end
			local spec = arg.Spec
			local tbl15 = nil

			for k, v12 in pairs(arg2) do
				if spec[k] ~= v12 then
					tbl15 = tbl15 or {}
					tbl15[k] = v12
				end
			end

			if tbl15 then
				set(tbl15)
			end

			return arg
		end

		return arg
	end

	local function fn11(arg, arg2)
		local v12 = string.gsub(tostring(arg.Spec.Text or ""), "%d", "0")
		return tostring(n4) .. "|" .. tostring(arg2) .. "|" .. v12
	end

	local function fn12(arg)
		local list = tbl.Eggs and tbl.Eggs.List
		local flag4 = type(list) == "table" and list[arg] or nil
		local animals = type(flag4) == "table" and flag4.Animals or nil
		if type(animals) ~= "table" then
			local v12 = tostring
			return tostring(arg), v12(arg)
		end
		local tbl15 = {}

		for _, animal in pairs(animals) do
			if type(animal) == "string" then
				table.insert(tbl15, animal)
			elseif type(animal) == "table" then
				local name = animal.Name or animal.Animal or animal[1]

				if type(name) == "string" then
					table.insert(tbl15, name)
				end
			end
		end

		if #tbl15 == 1 then
			return tbl15[1], tbl15[1]
		end

		if #tbl15 == 0 then
			local v12 = tostring
			return tostring(arg), v12(arg)
		end
		return tbl15[1], "Random: " .. table.concat(tbl15, " / ")
	end

	local function fn13(arg, arg2, arg3, arg4, arg5, arg6)
		local v12, v13 = fn12(arg2)
		local v14 = tbl7.AssetInfo(arg2)
		local v15 = tbl7.AssetInfo(v12)
		local tbl15 = {}

		if type(arg5) == "string" and arg5 ~= "" then
			table.insert(tbl15, arg5)
		end

		return {
			Id = arg,
			Info = v14,
			Scale = tonumber(arg3) or 1,
			Weight = tonumber(arg4) or 1,
			Mutations = tbl15,
			Income = tbl7.Income(v15, tonumber(arg3) or 1, tbl15),
			Status = arg6,
			Remaining = math.huge,
			Percent = 0,
			Hatch = v13,
		}
	end

	local function fn14()
		local v12 = tbl3.Plot()
		if not v12 then
			return nil
		end
		local serverTimeNow = workspace:GetServerTimeNow()
		local tbl15 = {}
		local placedEggs = v12:FindFirstChild("PlacedEggs")
		local v13 = ipairs
		placedEggs = placedEggs and placedEggs:GetChildren() or {}

		for _, placedEgg in v13(placedEggs) do
			local attribute = placedEgg:GetAttribute("EggId")

			if type(attribute) == "string" then
				local growing = fn13(attribute, placedEgg.Name, placedEgg:GetAttribute("CPSMultiplier"), placedEgg:GetAttribute("SizeMultiplier"), placedEgg:GetAttribute("EventMutation"), "Growing")
				local num = tonumber(placedEgg:GetAttribute("HatchAt")) or serverTimeNow
				local num2 = tonumber(placedEgg:GetAttribute("PlacedAt")) or num

				if placedEgg:GetAttribute("HatchReady") == true or num <= serverTimeNow then
					growing.Status = "Ready"
					growing.Remaining = 0
					growing.Percent = 100
				else
					growing.Remaining = num - serverTimeNow
					local n13 = num - num2

					if n13 > 0 then
						growing.Percent = math.clamp(math.floor((1 - growing.Remaining / n13) * 100), 0, 100)
					end
				end

				table.insert(tbl15, growing)
			end
		end

		for _, v14 in ipairs(tbl3.Tools(function(arg)
			return arg:GetAttribute("IsEggTool") == true
		end)) do
			local attribute = v14:GetAttribute("EggId")
			local attribute2 = v14:GetAttribute("EggName") or string.gsub(v14.Name, " Egg$", "")

			if type(attribute) == "string" then
				local inventory = fn13(attribute, tostring(attribute2), v14:GetAttribute("CPSMultiplier"), v14:GetAttribute("SizeMultiplier"), v14:GetAttribute("EventMutation"), "Inventory")
				inventory.Tool = v14
				table.insert(tbl15, inventory)
			end
		end

		return tbl15
	end

	local function fn15(arg)
		local sort = tbl10.Sort

		table.sort(arg, function(arg2, arg3)
			if sort == tbl8[2] and arg2.Info.RarityNumber ~= arg3.Info.RarityNumber then
				return arg2.Info.RarityNumber > arg3.Info.RarityNumber
			end

			if sort == tbl8[3] and arg2.Remaining ~= arg3.Remaining then
				return arg2.Remaining < arg3.Remaining
			end
			return arg2.Income > arg3.Income
		end)
	end

	local function fn16(arg)
		if arg.Status == "Ready" then
			return bold(paint(color3.Ready, "Ready to hatch"))
		end

		if arg.Status == "Growing" then
			return bold(paint(color3.Clock, tbl7.FormatClock(arg.Remaining))) .. tbl7.Separator() .. paint(color3.Growing, arg.Percent .. "%")
		end
		return paint(color3.Inventory, "In inventory")
	end

	local function fn17(arg)
		local tbl15 = {}
		local v12 = tbl7.MutationText(arg.Mutations)
		table.insert(tbl15, bold(paint(color3.Income, tbl7.FormatRate(arg.Income))))
		table.insert(tbl15, paint(color3.Hint, tbl7.Escape(arg.Hatch or "")))
		table.insert(tbl15, paint(color3.Scale, string.format("%.2fx", arg.Scale)))
		table.insert(tbl15, paint(color3.Weight, string.format("Size x%.2f", arg.Weight)))

		if v12 ~= "" then
			table.insert(tbl15, v12)
		end

		return table.concat(tbl15, tbl7.Separator())
	end

	local n13 = 5
	local n14 = n13 + 0.8
	local n15 = 1.2
	local n16 = 1.2
	local n17 = 0.936
	local n18 = 2.3
	local n19 = 0.25
	local n20 = 0.18
	local n21 = n18 + 0.6
	local n22 = 0.24
	local n23 = 0.22

	local function fn18(arg)
		if string.upper(tostring(arg.Rarity)) == "SECRET" then
			return tbl7.SecretGradient
		end
		return arg.Gradient
	end

	local function fn19(arg)
		return fn18(arg) ~= nil and Color3.fromRGB(255, 255, 255) or arg.Color
	end

	local function fn20(arg)
		if string.upper(tostring(arg.Rarity)) == "SECRET" then
			return tbl7.SecretRotation
		end
		return nil
	end

	local function fn21(arg)
		local v12 = arg and arg.Get()
		if not v12 or n4 <= 0 then
			return nil
		end

		if v12.Text ~= tostring(arg.Spec.Text or "") then
			return nil
		end
		return v12
	end

	local function fn22(arg)
		local v12 = fn11(arg, "w")
		if arg.WidthKey == v12 then
			return arg.WidthUnits
		end
		local v13 = fn21(arg)
		if not v13 then
			return nil
		end
		local size = v13.Size
		local textWrapped = v13.TextWrapped
		v13.TextWrapped = false
		v13.Size = UDim2.fromOffset(100000, math.max(1, size.Y.Offset))
		local x = v13.TextBounds.X
		v13.Size = size
		v13.TextWrapped = textWrapped
		if x <= 0 then
			return nil
		end
		local widthUnits = x / n4
		arg.WidthKey = v12
		arg.WidthUnits = widthUnits
		return arg.WidthUnits
	end

	local function fn23(arg, arg2)
		local v12 = fn11(arg, math.floor(arg2 * 100 + 0.5))
		if arg.HeightKey == v12 then
			return arg.HeightUnits
		end
		local v13 = fn21(arg)
		if not v13 then
			return nil
		end
		local size = v13.Size
		v13.Size = UDim2.fromOffset(math.max(1, math.floor(arg2 * n4 + 0.5)), 100000)
		local y = v13.TextBounds.Y
		v13.Size = size
		if y <= 0 then
			return nil
		end
		local heightUnits = y / n4
		arg.HeightKey = v12
		arg.HeightUnits = heightUnits
		return arg.HeightUnits
	end

	tbl11.RunAction = function()
		local focus = tbl11.Focus
		if type(focus) ~= "table" or focus.Id == nil then
			return
		end

		if focus.Status == "Ready" then
			tbl3.Fire("PetInventory", "EggAction", tostring(focus.Id))
			requestEggRefresh()
		elseif focus.Status == "Inventory" and focus.Tool and focus.Tool.Parent then
			tbl3.Equip(focus.Tool)
		end
	end

	local function fn24(arg)
		v10 = arg
		arg:SetDock(5, { Gap = n23, DividerColor = Color3.fromRGB(170, 174, 184) })
		local v12 = arg:Dock()

		tbl11.Icon = arg:Model({
			Spin = true,
			Parent = v12,
			X = 0,
			Y = 0,
			Width = n13,
			Height = n13,
			Corner = 0.35,
			Background = "#000000",
			BackgroundTransparency = 0.26,
			StrokeThickness = n2,
			StrokeTransparency = 0,
			ZIndex = 8,
		})

		tbl11.Name = arg:Text({
			Parent = v12,
			X = n14,
			Y = 0,
			Height = n15,
			Scale = n16,
			Wrap = false,
			Gradient = tbl7.NameGradient,
			TextStrokeTransparency = 1,
			ZIndex = 9,
		})

		tbl11.Rarity = arg:Text({
			Parent = v12,
			X = n14,
			Y = 0,
			Height = n15,
			Scale = n17,
			Wrap = false,
			Font = tbl7.RarityFont,
			TextStrokeTransparency = 1,
			StrokeTransparency = 0.08,
			ZIndex = 9,
		})

		tbl11.Info = arg:Text({ Parent = v12, X = n14, Y = n15, Height = n13 - n15, Wrap = false, ZIndex = 9 })

		tbl11.Action = arg:Button({
			Parent = v12,
			X = 0,
			Y = 0,
			Width = 5,
			Height = n15 - 0.1,
			Text = "",
			Scale = 1,
			Background = "#000000",
			BackgroundTransparency = 0.55,
			HoverTransparency = 0.3,
			PressTransparency = 0.15,
			Corner = 0.35,
			StrokeColor = Color3.fromRGB(255, 255, 255),
			StrokeThickness = n2,
			StrokeTransparency = 0.6,
			Visible = false,
			ZIndex = 10,
			Callback = function()
				if type(tbl11.RunAction) == "function" then
					task.spawn(tbl11.RunAction)
				end
			end,
		})

		arg:OnResize(function(arg2, arg3, arg4)
			if arg3 == n6 and arg4 == n7 then
				return
			end
			n6 = arg3
			n7 = arg4
			n3 = arg3 / math.max(arg4, 1)
			n4 = arg4
			n11 = 2
			n5 = 0.9 / math.max(arg:TextSize(), 1)
			tbl11.Rarity.Set({ StrokeThickness = n5 })

			for _, v13 in ipairs(tbl12) do
				v13.Rarity.Set({ StrokeThickness = n5 })
			end
		end)

		for _, v13 in ipairs({ "Icon", "Name", "Rarity", "Info", "Action" }) do
			fn10(tbl11[v13])
		end
	end

	local function fn25(arg)
		local v12 = tbl13[arg]

		if not v12 then
			v12 = v10:Text({ Name = "Line", X = 0, Y = 0, Width = 1, Height = 1, Wrap = true, Visible = false })
			tbl13[arg] = fn10(v12)
		end

		return v12
	end

	local function fn26(arg)
		local v12 = tbl12[arg]
		if v12 then
			return v12
		end
		local tbl15 = {}

		tbl15.Frame = v10:Button({
			Name = "Entry",
			Text = "",
			Background = "#000000",
			BackgroundTransparency = 0.74,
			HoverTransparency = 0.46,
			PressTransparency = 0.3,
			Corner = 0.35,
			X = 0,
			Y = 0,
			Width = 1,
			Height = 1,
			Visible = false,
			Callback = function()
				if tbl15.Id ~= nil then
					id = tbl15.Id
					requestEggRefresh()
				end
			end,
		})

		tbl15.Icon = v10:Model({
			Spin = true,
			Parent = tbl15.Frame,
			X = n19,
			Y = 0,
			Width = n18,
			Height = n18,
			Corner = 0.35,
			Background = "#000000",
			BackgroundTransparency = 0.45,
			StrokeThickness = n2,
			StrokeTransparency = 0,
		})

		tbl15.Name = v10:Text({
			Parent = tbl15.Frame,
			X = n19 + n21,
			Y = 0,
			Width = 1,
			Height = n15,
			Scale = n16,
			Wrap = false,
			Gradient = tbl7.NameGradient,
			TextStrokeTransparency = 1,
		})

		tbl15.Rarity = v10:Text({
			Parent = tbl15.Frame,
			X = n19 + n21,
			Y = 0,
			Width = 1,
			Height = n15,
			Scale = n17,
			Wrap = false,
			Font = tbl7.RarityFont,
			TextStrokeTransparency = 1,
			StrokeTransparency = 0.08,
			StrokeThickness = n5,
		})

		tbl15.Detail = v10:Text({
			Parent = tbl15.Frame,
			X = n19 + n21,
			Y = n15,
			Width = math.max(1, n3 - n21 - n19 * 2),
			Height = 1,
			Wrap = true,
		})

		tbl15.Status = v10:Text({ Parent = tbl15.Frame, X = 0, Y = 0, Width = 1, Height = n15, Wrap = false, Align = "Right" })

		for _, v13 in ipairs({ "Frame", "Icon", "Name", "Rarity", "Detail", "Status" }) do
			fn10(tbl15[v13])
		end

		tbl12[arg] = tbl15
		return tbl15
	end

	local function fn27(arg)
		local tbl15 = { Ready = 0, Growing = 0, Inventory = 0 }
		local n24 = 0
		local v12 = nil

		for _, v13 in ipairs(arg) do
			local status = v13.Status
			tbl15[status] = tbl15[status] + 1
			n24 += v13.Income

			if not v12 or v13.Income > v12.Income then
				v12 = v13
			end
		end

		return bold(paint(color3.Text, tostring(#arg) .. " eggs")) .. tbl7.Separator() .. bold(paint(color3.Ready, tbl15.Ready .. " ready")) .. tbl7.Separator() .. bold(paint(color3.Growing, tbl15.Growing .. " growing")) .. tbl7.Separator() .. bold(paint(color3.Inventory, tbl15.Inventory .. " in bag")) .. tbl7.Separator() .. paint(color3.Text, "Total") .. " " .. bold(paint(color3.Income, tbl7.FormatRate(n24))), v12
	end

	local function fn28(arg, arg2)
		if arg2 == "" then
			return true
		end
		local str2 = " " .. arg.Status
		local v12 = string.lower(tostring(arg.Info.Name) .. " " .. tostring(arg.Info.Rarity) .. str2)

		for _, mutation in ipairs(arg.Mutations) do
			v12 ..= " " .. string.lower(tostring(mutation))
		end

		return string.find(v12, arg2, 1, true) ~= nil
	end

	local function fn29(arg)
		local tbl15 = {}
		local str2 = bold(paint(color3.Income, tbl7.FormatRate(arg.Income))) .. tbl7.Separator() .. paint(color3.Hint, tbl7.Escape(arg.Hatch or ""))
		local str3 = paint(color3.Scale, string.format("%.2fx", arg.Scale)) .. tbl7.Separator() .. paint(color3.Weight, string.format("Size x%.2f", arg.Weight))
		local v12 = table.pack(fn16(arg))
		tbl15[1] = str2
		tbl15[2] = str3

		do
			local values = table.pack(table.unpack(v12, 1, v12.n))
			table.move(values, 1, values.n, 3, tbl15)
		end

		local v13 = tbl7.MutationText(arg.Mutations)
		table.insert(tbl15, v13 ~= "" and v13 or paint(color3.Hint, "Tap an egg below to preview it"))
		return table.concat(tbl15, "\n")
	end

	local function fn30(arg)
		local flag4 = tbl10.Spotlight and arg ~= nil

		if v11 ~= flag4 then
			v11 = flag4
			v10:SetDock(flag4 and 5 or 0, { Gap = n23 })
		end

		tbl11.Icon.Set({ Visible = flag4 })
		tbl11.Name.Set({ Visible = flag4 })
		tbl11.Rarity.Set({ Visible = flag4 })
		tbl11.Info.Set({ Visible = flag4 })
		tbl11.Action.Set({ Visible = flag4 })
		tbl11.Focus = flag4 and arg or nil
		if not flag4 then
			return
		end
		local info = arg.Info

		tbl11.Action.Set({
			Text = arg.Status == "Inventory" and bold(paint(color3.Inventory, "Hold egg")) or arg.Status == "Ready" and bold(paint(color3.Ready, "Hatch now")) or bold(paint(color3.Growing, "Growing")),
		})

		tbl11.Icon.Set({ Visible = info.Model ~= nil, Model = info.Model, StrokeColor = info.Color })
		tbl11.Name.Set({ Text = tbl7.Escape(info.Name) })

		tbl11.Rarity.Set({
			Text = string.upper(tostring(info.Rarity)),
			Color = fn19(info),
			Gradient = fn18(info),
			GradientRotation = fn20(info),
		})

		tbl11.Info.Set({ Text = fn29(arg) })
	end

	local function fn31(arg, arg2)
		local info = arg2.Info
		arg.Id = arg2.Id
		arg.Frame.Set({ Visible = true, BackgroundTransparency = arg2.Id == id and 0.12 or 0.74 })
		arg.Icon.Set({ Visible = info.Model ~= nil, Model = info.Model, StrokeColor = info.Color })
		arg.Name.Set({ Text = tbl7.Escape(info.Name) })

		arg.Rarity.Set({
			Text = string.upper(tostring(info.Rarity)),
			Color = fn19(info),
			Gradient = fn18(info),
			GradientRotation = fn20(info),
		})

		arg.Detail.Set({ Text = fn17(arg2) })
		arg.Status.Set({ Text = fn16(arg2) })
	end

	local function fn32()
		if n3 <= 0 then
			return
		end
		flag = false
		local n24 = math.max(1, n3 - n14)
		local v12 = fn22(tbl11.Action)

		if v12 then
			tbl11.ActionUnits = v12 + 1.4
		else
			flag = true
		end

		local n25 = math.min(tbl11.ActionUnits or 5, n24 * 0.45)
		local n26 = math.max(1, n24 - n25 - n22)
		tbl11.Action.Set({ X = n3 - n25, Y = 0.05, Width = n25, Height = n15 - 0.1 })
		local v13 = fn22(tbl11.Rarity)

		if v13 then
			n10 = v13 + 0.1
		else
			flag = true
		end

		local v14 = fn22(tbl11.Name)

		if v14 then
			n9 = math.min(v14 + 0.1, math.max(1, n26 - n10 - n22))
		else
			flag = true
		end

		tbl11.Name.Set({ X = n14, Y = 0, Width = n9, Height = n15 })

		tbl11.Rarity.Set({
			X = n14 + n9 + n22,
			Y = 0,
			Width = math.max(0.5, math.min(n10, n26 - n9 - n22)),
			Height = n15,
		})

		tbl11.Info.Set({ X = n14, Y = n15, Width = n24, Height = math.max(1, n13 - n15) })
		local n27 = math.max(1, n3 - n21 - n19 * 2)
		local n28 = 0

		for _, v15 in ipairs(tbl14) do
			if v15.Kind == "text" then
				local handle = v15.Handle
				local v16 = fn23(handle, n3)

				if v16 then
					v15.Height = v16
				else
					flag = true
				end

				local n29 = math.max(1, v15.Height or 1)
				handle.Set({ X = 0, Y = n28 + (v15.Gap and 0.5 or 0), Width = n3, Height = n29 })
				n28 += n29 + n23 * 0.5 + (v15.Gap and 0.5 or 0)
			else
				local item = v15.Item
				local v16 = fn23(item.Detail, n27)

				if v16 then
					item.DetailUnits = v16
				else
					flag = true
				end

				local n29 = math.clamp(item.DetailUnits or 1, 1, 4)
				local v17 = fn22(item.Status)

				if v17 then
					item.StatusUnits = v17 + 0.23
				else
					flag = true
				end

				local n30 = math.min(n27 * 0.42, math.max(2.73, item.StatusUnits or 2.73))
				local n31 = math.max(1, n27 - n30 - n22)
				local v18 = fn22(item.Rarity)

				if v18 then
					item.RarityUnits = v18 + 0.1
				else
					flag = true
				end

				local n32 = math.min(item.RarityUnits or 3, n31 * 0.5)
				local v19 = fn22(item.Name)

				if v19 then
					item.NameUnits = v19 + 0.1
				else
					flag = true
				end

				local min = math.min
				local max = math.max
				local nameUnits = item.NameUnits or 4
				local max2 = math.max
				local n33 = n31 - n32 - n22
				local v20 = min(max(1, nameUnits), max2(1, n33))
				local n34 = n20 * 2
				local n35 = math.max(n29 + n15, 2.3) + n34
				local n36 = (n35 - n29 - n15) / 2
				item.Frame.Set({ X = 0, Y = n28, Width = n3, Height = n35 })
				item.Icon.Set({ Y = (n35 - n18) / 2 })
				item.Name.Set({ X = n19 + n21, Y = n36, Width = v20 })
				item.Rarity.Set({ X = n19 + n21 + v20 + n22, Y = n36, Width = math.max(0.5, n32) })
				item.Detail.Set({ X = n19 + n21, Y = n36 + n15, Width = n27, Height = n29 })

				item.Status.Set({
					Visible = v15.HasStatus,
					X = n19 + n21 + n27 - n30,
					Y = n36,
					Width = math.max(0.5, n30),
				})

				n28 += n35 + n23
			end
		end

		local n29 = math.max(1, n28)

		if math.abs(n29 - n8) > 0.01 then
			n8 = n29
			v10:SetContentLines(n29)
		end
	end

	local function fn33()
		if not v10 then
			return
		end
		n11 = 2
		local v12 = fn14()
		table.clear(tbl14)
		local n24 = 0

		local function fn34(arg, arg2)
			n24 += 1
			local v13 = fn25(n24)
			v13.Set({ Visible = true, Text = arg })
			table.insert(tbl14, { Kind = "text", Handle = v13, Gap = arg2 })
		end

		local n25

		if not v12 then
			fn30(nil)
			fn34(bold(paint(color3.Hint, "Egg data is not available yet")), false)
			n25 = 0
		else
			fn15(v12)
			local v13, v14 = fn27(v12)
			fn34(v13, false)
			local v15 = nil

			if id ~= nil then
				v15 = nil

				for _, v16 in ipairs(v12) do
					if v16.Id == id then
						v15 = v16
						break
					else
						v15 = nil
					end
				end
			end

			fn30(v15 or v14)
			local v16 = string.lower(v10:Query())
			local tbl15 = {}

			for _, v17 in ipairs(v12) do
				if fn28(v17, v16) then
					table.insert(tbl15, v17)
				end
			end

			if #tbl15 == 0 then
				fn34(paint(color3.Hint, #v12 == 0 and "No eggs yet" or string.format("No results for \"%s\"", tbl7.Escape(v16))), false)
				n25 = 0
			else
				n25 = 0

				for _, v17 in ipairs(tbl9) do
					local tbl16 = {}

					for _, v18 in ipairs(tbl15) do
						if v18.Status == v17.Key then
							table.insert(tbl16, v18)
						end
					end

					if #tbl16 > 0 then
						local flag4 = #tbl14 > 0
						fn34(string.format("<b><font color=\"%s\">%s</font></b> <font color=\"#AAAAAA\">(%d)</font>", v17.Color, v17.Title, #tbl16), flag4)

						for _, v18 in ipairs(tbl16) do
							n25 += 1
							local v19 = fn26(n25)
							fn31(v19, v18)
							table.insert(tbl14, { Kind = "item", Item = v19, HasStatus = true })
						end
					end
				end
			end
		end

		for i = n24 + 1, #tbl13 do
			tbl13[i].Set({ Visible = false })
		end

		for i = n25 + 1, #tbl12 do
			tbl12[i].Frame.Set({ Visible = false })
		end

		fn32()
		n11 = 2
	end

	tbl7.RequestEggRefresh = requestEggRefresh

	if not tbl7.Ready then
		v9:CreateText({ Name = "Egg Predictor", Text = "Update the Chilli Library to use the predictor canvas." })
	else
		v9:CreateDropdown({
			Name = "Sort By",
			Options = tbl8,
			Default = tbl8[1],
			Callback = function(sort)
				if table.find(tbl8, sort) then
					tbl10.Sort = sort
					requestEggRefresh()
				end
			end,
		})

		v9:CreateToggle({
			Name = "Preview Card",
			Default = true,
			Callback = function(arg)
				tbl10.Spotlight = arg == true
				requestEggRefresh()
			end,
		})

		local v12 = v9:CreateCanvas({
			Name = "Egg Predictor",
			Search = true,
			SearchPlaceholder = "Search eggs...",
			Layout = "free",
			Style = {
				TextScale = 0.84,
				LineHeight = 1.1,
				MinLines = 16,
				MaxLines = 32,
				BackgroundTransparency = 0.5,
				ScrollBarColor = Color3.fromRGB(170, 174, 184),
				TextColor = Color3.fromRGB(255, 255, 255),
				TextStrokeTransparency = 0.7,
			},
			Build = function(arg)
				fn24(arg)
				requestEggRefresh()
			end,
		})

		fn4(function()
			v12:Destroy()
		end)

		local connection = RunService.Heartbeat:Connect(function(deltaTime)
			local v13 = tbl7.PageVisible()
			local flag4 = v13 and (v10 == nil or tbl7.IsShown(v10:Root()))

			if flag4 and not flag3 then
				flag2 = true
			end

			flag3 = flag4
			if not v13 then
				return
			end
			n12 += deltaTime

			if flag4 and flag2 or n12 >= n then
				n12 = 0

				if flag4 then
					flag2 = false
					pcall(fn33)
				end

				if tbl7.RefreshFuse then
					pcall(tbl7.RefreshFuse)
				end
			end

			if flag4 and (n11 > 0 or flag) then
				if n11 > 0 then
					n11 -= 1
				end

				pcall(fn32)
			end

			if tbl7.PlaceFuse then
				tbl7.PlaceFuse()
			end
		end)

		fn4(function()
			connection:Disconnect()
		end)
	end
end

local v11

do
	local v12 = v2:CreateTab({ Name = "Player", SectionsExpanded = true })
	local v13 = v12:CreateSection({ Name = "Movement", Expanded = true })
	v11 = v12:CreateSection({ Name = "ESP", Expanded = false })
	local createToggle = nil
	local n2 = 60
	local flag = false

	local function fn10()
		if not flag then
			return
		end
		flag = false
		local v14 = tbl3.Humanoid()
		local v15 = tbl3.Root()
		if not v14 or not v15 then
			return
		end
		local moveDirection = v14.MoveDirection
		local vector = Vector3.new(moveDirection.X, 0, moveDirection.Z)
		local vector2 = vector.Magnitude > 0.001 and vector.Unit * v14.WalkSpeed or Vector3.zero
		local assemblyLinearVelocity = v15.AssemblyLinearVelocity

		pcall(function()
			v15.AssemblyLinearVelocity = Vector3.new(vector2.X, assemblyLinearVelocity.Y, vector2.Z)
		end)
	end

	local connection = RunService.Heartbeat:Connect(function()
		if not tbl2.Toggle(createToggle, false) then
			fn10()
			return
		end

		if tbl4.Busy then
			flag = false
			return
		end
		local v14 = tbl3.Humanoid()
		local v15 = tbl3.Root()
		if not v14 or not v15 or v14.Sit or v14.PlatformStand then
			flag = false
			return
		end
		local moveDirection = v14.MoveDirection
		local vector = Vector3.new(moveDirection.X, 0, moveDirection.Z)
		if vector.Magnitude <= 0.001 then
			fn10()
			return
		end
		local n3 = vector.Unit * n2
		local assemblyLinearVelocity = v15.AssemblyLinearVelocity

		pcall(function()
			v15.AssemblyLinearVelocity = Vector3.new(n3.X, assemblyLinearVelocity.Y, n3.Z)
		end)

		flag = true
	end)

	fn4(function()
		connection:Disconnect()
	end)

	createToggle = v13.CreateToggle

	createToggle = createToggle(v13, {
		Name = "Speed Boost",
		Default = false,
		Callback = function()
		end,
	})

	v13:CreateSlider({
		Name = "Boost Speed",
		Min = 16,
		Max = 1300,
		Default = 60,
		Increment = 1,
		SubOf = createToggle,
		Callback = function(arg)
			n2 = math.clamp(tonumber(arg) or 60, 16, 1300)
		end,
	})

	local v14 = nil

	local connection2 = UserInputService.JumpRequest:Connect(function()
		if not tbl2.Toggle(v14, false) then
			return
		end
		local v15 = tbl3.Humanoid()

		if v15 then
			pcall(function()
				v15:ChangeState(Enum.HumanoidStateType.Jumping)
			end)
		end
	end)

	fn4(function()
		connection2:Disconnect()
	end)

	v14 = v13:CreateToggle({
		Name = "Infinite Jump",
		Default = false,
		Callback = function()
		end,
	})

	local ProximityPromptService = game:GetService("ProximityPromptService")
	local tbl14 = {}
	local tbl15 = {}

	local function fn11(arg)
		if not arg:IsA("ProximityPrompt") then
			return
		end

		if tbl14[arg] == nil then
			tbl14[arg] = arg.HoldDuration
		end

		if arg.HoldDuration ~= 0 then
			arg.HoldDuration = 0
		end
	end

	local function fn12()
		for _, v15 in ipairs(tbl15) do
			v15:Disconnect()
		end

		table.clear(tbl15)

		for k, v15 in pairs(tbl14) do
			if k.Parent then
				pcall(function()
					k.HoldDuration = v15
				end)
			end
		end

		table.clear(tbl14)
	end

	local function fn13()
		fn12()

		for _, descendant in ipairs(workspace:GetDescendants()) do
			if descendant:IsA("ProximityPrompt") then
				fn11(descendant)
			end
		end

		table.insert(tbl15, workspace.DescendantAdded:Connect(function(descendant)
			if descendant:IsA("ProximityPrompt") then
				task.defer(fn11, descendant)
			end
		end))

		table.insert(tbl15, ProximityPromptService.PromptShown:Connect(fn11))
	end

	fn4(fn12)

	v13:CreateToggle({
		Name = "Instant Steal",
		Default = false,
		Callback = function(arg)
			if arg then
				fn13()
			else
				fn12()
			end
		end,
	})

	local v15 = nil
	local jumpPower = 150
	local flag2 = false

	local connection3 = RunService.Heartbeat:Connect(function()
		local v16 = tbl3.Humanoid()
		if not v16 then
			return
		end

		if tbl2.Toggle(v15, false) then
			flag2 = true

			if not v16.UseJumpPower then
				v16.UseJumpPower = true
			end

			if v16.JumpPower ~= jumpPower then
				v16.JumpPower = jumpPower
			end
		elseif flag2 then
			flag2 = false
			local jumpPower2 = localPlayer:FindFirstChild("JumpPower")
			local n3 = jumpPower2 and tonumber(jumpPower2.Value) or 50

			pcall(function()
				v16.JumpPower = math.max(n3, 1)
			end)
		end
	end)

	fn4(function()
		connection3:Disconnect()
	end)

	v15 = v13:CreateToggle({
		Name = "Jump Boost",
		Default = false,
		Callback = function()
		end,
	})

	v13:CreateSlider({
		Name = "Jump Power",
		Min = 50,
		Max = 1500,
		Default = 150,
		Increment = 10,
		SubOf = v15,
		Callback = function(arg)
			jumpPower = math.clamp(tonumber(arg) or 150, 50, 1500)
		end,
	})

	local v16 = nil
	local n3 = 4102444800
	local connection4 = nil

	local function fn14()
		return workspace:FindFirstChild("Map")
	end

	local function fn15()
		local v17 = fn14()
		if not v17 or not tbl2.Toggle(v16, false) then
			return
		end

		if (tonumber(v17:GetAttribute("GuardStunnedUntil")) or 0) < n3 then
			v17:SetAttribute("GuardStunnedUntil", 4102444800)
		end
	end

	local function fn16()
		if connection4 then
			connection4:Disconnect()
			connection4 = nil
		end

		local v17 = fn14()
		local flag3

		if v17 then
			flag3 = (tonumber(v17:GetAttribute("GuardStunnedUntil")) or 0) >= n3
		else
			flag3 = v17
		end

		if flag3 then
			v17:SetAttribute("GuardStunnedUntil", 0)
		end
	end

	local function fn17()
		fn16()
		local v17 = fn14()
		if not v17 then
			return
		end

		connection4 = v17:GetAttributeChangedSignal("GuardStunnedUntil"):Connect(function()
			task.defer(fn15)
		end)

		fn15()
	end

	fn4(fn16)

	v16 = v13:CreateToggle({
		Name = "Anti Guard",
		Default = true,
		Callback = function(arg)
			if arg then
				fn17()
			else
				fn16()
			end
		end,
	})

	local tbl16 = {
		[Enum.HumanoidStateType.Physics] = true,
		[Enum.HumanoidStateType.Ragdoll] = true,
		[Enum.HumanoidStateType.FallingDown] = true,
	}

	local v17 = nil

	local connection5 = RunService.Heartbeat:Connect(function()
		if not tbl2.Toggle(v17, false) then
			return
		end
		local v18 = tbl3.Humanoid()
		local v19 = tbl3.Root()
		if not v18 or not v19 then
			return
		end

		if not v18.PlatformStand and not tbl16[v18:GetState()] then
			return
		end

		pcall(function()
			v18.PlatformStand = false
			v18:ChangeState(Enum.HumanoidStateType.GettingUp)
			local assemblyLinearVelocity = v19.AssemblyLinearVelocity
			local vector = Vector3.new(assemblyLinearVelocity.X, 0, assemblyLinearVelocity.Z)
			local n4 = v18.WalkSpeed + 5

			if vector.Magnitude > n4 then
				vector = vector.Unit * n4
			end

			local z = vector.Z
			v19.AssemblyLinearVelocity = Vector3.new(vector.X, math.min(assemblyLinearVelocity.Y, 0), z)
			v19.AssemblyAngularVelocity = Vector3.zero
		end)

		if not tbl4.Busy then
			local character = localPlayer.Character

			for _, v20 in ipairs({ "Head", "UpperTorso", "LowerTorso", "Torso" }) do
				local v21 = character and character:FindFirstChild(v20)

				if v21 and v21:IsA("BasePart") and not v21.CanCollide then
					v21.CanCollide = true
				end
			end
		end
	end)

	fn4(function()
		connection5:Disconnect()
	end)

	v17 = v13:CreateToggle({
		Name = "Anti Ragdoll",
		Default = true,
		Callback = function()
		end,
	})
end

do
	local font = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal)
	local tbl14 = { "", "K", "M", "B", "T", "Qa", "Qi", "Sx" }
	local n2 = 0
	local folder = nil
	local tbl15 = {}
	local tbl16 = {}

	local function fn10(arg)
		local n3 = tonumber(arg) or 0
		local n4 = 1

		while n3 >= 1000 and n4 < #tbl14 do
			n3 /= 1000
			n4 += 1
		end

		local str2 = n4 == 1 and tostring(math.floor(n3)) or string.format("%.1f", math.floor(n3 * 10) / 10)
		local v12 = tbl14[n4]
		return string.gsub(str2, "%.0$", "") .. v12
	end

	local function fn11(parent, arg)
		parent.BackgroundTransparency = 1
		parent.FontFace = font
		parent.TextScaled = true
		parent.TextStrokeTransparency = 1
		parent.TextColor3 = Color3.fromRGB(255, 255, 255)
		parent.Size = UDim2.new(1, 0, 0, arg)
		local uiStroke = Instance.new("UIStroke")
		uiStroke.Name = fn3()
		uiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
		uiStroke.LineJoinMode = Enum.LineJoinMode.Round
		uiStroke.Color = Color3.fromRGB(0, 0, 0)
		uiStroke.Thickness = 1.8
		uiStroke.Transparency = 0.05
		uiStroke.Parent = parent
	end

	local function fn12(child)
		local v12 = tbl15[child]

		if v12 then
			tbl15[child] = nil

			pcall(function()
				v12.Gui:Destroy()
			end)
		end
	end

	local function fn13(arg)
		if tbl15[arg] or not folder or not arg:IsA("Model") then
			return
		end
		local v12 = tbl3.EggRoot(arg)
		if not v12 then
			return
		end

		if tbl3.EggRank(arg) < n2 then
			return
		end
		local v13 = tbl3.EggRarity(arg)
		local billboardGui = Instance.new("BillboardGui")
		billboardGui.Name = fn3()
		billboardGui.AlwaysOnTop = true
		billboardGui.LightInfluence = 0
		billboardGui.Size = UDim2.fromOffset(180, 46)
		billboardGui.StudsOffsetWorldSpace = Vector3.new(0, 4, 0)
		billboardGui.MaxDistance = 100000
		billboardGui.Adornee = v12
		local frame = Instance.new("Frame")
		frame.Name = fn3()
		frame.BackgroundTransparency = 1
		frame.Size = UDim2.fromScale(1, 1)
		frame.Parent = billboardGui
		local uiListLayout = Instance.new("UIListLayout")
		uiListLayout.Name = fn3()
		uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		uiListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
		uiListLayout.Parent = frame
		local textLabel = Instance.new("TextLabel")
		textLabel.Name = fn3()
		textLabel.LayoutOrder = 1
		fn11(textLabel, 24)
		textLabel.Text = arg.Name
		textLabel.TextColor3 = tbl3.RarityColors[v13] or Color3.fromRGB(255, 255, 255)
		textLabel.Parent = frame
		local textLabel2 = Instance.new("TextLabel")
		textLabel2.Name = fn3()
		textLabel2.LayoutOrder = 2
		fn11(textLabel2, 18)
		textLabel2.Parent = frame
		billboardGui.Parent = folder
		tbl15[arg] = { Gui = billboardGui, Info = textLabel2, Root = v12, Model = arg, Rarity = v13, Value = tbl3.EggValue(arg) }
	end

	local function fn14()
		for _, v12 in ipairs(tbl16) do
			v12:Disconnect()
		end

		table.clear(tbl16)

		for k in pairs(tbl15) do
			fn12(k)
		end

		if folder then
			pcall(function()
				folder:Destroy()
			end)

			folder = nil
		end
	end

	local function fn15()
		fn14()
		folder = Instance.new("Folder")
		folder.Name = fn3()
		folder.Parent = v3

		for _, v12 in ipairs(tbl3.EggFolders()) do
			for _, child in ipairs(v12:GetChildren()) do
				fn13(child)
			end

			table.insert(tbl16, v12.ChildAdded:Connect(function(child)
				task.delay(0.2, fn13, child)
			end))

			table.insert(tbl16, v12.ChildRemoved:Connect(fn12))
		end

		local n3 = 0

		table.insert(tbl16, RunService.Heartbeat:Connect(function(deltaTime)
			n3 += deltaTime
			if n3 < 0.5 then
				return
			end
			n3 = 0
			local v12 = tbl3.Root()

			for k, v13 in pairs(tbl15) do
				if not k.Parent then
					fn12(k)
				elseif v12 then
					local magnitude = (v13.Root.Position - v12.Position).Magnitude
					local floor = math.floor
					local text = string.format("%s  $%s/s  %dm", v13.Rarity, fn10(v13.Value), floor(magnitude))

					if not tbl3.CanSteal(k) then
						text ..= string.format("  Need %d JP", math.ceil(tbl3.EggNeed(k) - tbl3.StealGrace()))
						v13.Info.TextColor3 = Color3.fromRGB(255, 120, 120)
					else
						v13.Info.TextColor3 = Color3.fromRGB(230, 232, 240)
					end

					v13.Info.Text = text
				end
			end
		end))
	end

	fn4(fn14)

	local v12 = v11:CreateToggle({
		Name = "ESP Eggs",
		Default = false,
		Callback = function(arg)
			if arg then
				fn15()
			else
				fn14()
			end
		end,
	})

	v11:CreateDropdown({
		Name = "ESP Min Rarity",
		Options = tbl3.RarityChoices,
		Default = tbl3.RarityChoices[1],
		SubOf = v12,
		Callback = function(arg)
			n2 = tbl3.RarityRank[tostring(arg)] or 0

			if tbl2.Toggle(v12, false) then
				fn15()
			end
		end,
	})
end

do
	local v12 = v2:CreateTab({ Name = "Server", SectionsExpanded = true }):CreateSection({ Name = "Server", Expanded = true })
	local TeleportService = game:GetService("TeleportService")
	local HttpService = game:GetService("HttpService")

	local function fn10()
		if type(queue_on_teleport) == "function" then
			return queue_on_teleport
		end

		if type(queueonteleport) == "function" then
			return queueonteleport
		end

		if type(syn) == "table" and type(syn.queue_on_teleport) == "function" then
			return syn.queue_on_teleport
		end

		if type(fluxus) == "table" and type(fluxus.queue_on_teleport) == "function" then
			return fluxus.queue_on_teleport
		end
		return nil
	end

	local function fn11(arg)
		pcall(function()
			TeleportService:SetTeleportSetting("__ChilliAutoLoadScriptEnabled", arg)
		end)

		if not arg then
			return true
		end
		local v13 = fn10()
		if not v13 then
			return false
		end

		if rawget(_G, "__ChilliAutoLoadQueued") ~= true then
			if not pcall(v13, [[local TeleportService = game:GetService("TeleportService")
local enabled = true
pcall(function()
    enabled = TeleportService:GetTeleportSetting("__ChilliAutoLoadScriptEnabled") == true
end)
if enabled then
    local ok, source = pcall(function()
        return game:HttpGet("https://raw.githubusercontent.com/tienkhanh1/spicy/main/Chilli.lua")
    end)
    if ok and type(source) == "string" then
        local chunk = loadstring(source)
        if chunk then
            chunk()
        end
    end
end
]]) then
				return false
			end

			_G.__ChilliAutoLoadQueued = true
		end

		return true
	end

	local v13 = nil

	local function fn12()
		if v13 and tbl2.Toggle(v13, false) then
			fn11(true)
		end
	end

	v13 = v12:CreateToggle({
		Name = "Auto Load Script",
		Default = true,
		Callback = function(arg)
			local flag = arg == true

			if not fn11(flag) and flag then
				task.defer(function()
					fn11(false)

					if v13 and type(v13.Set) == "function" then
						pcall(v13.Set, v13, false, false)
					end

					fn6("Auto Load Unavailable", "This executor does not support queue on teleport.")
				end)
			end
		end,
	})

	local str2 = "Least Players"
	local n2 = 10
	local n3 = 0
	local v14 = nil
	local tbl14 = {}
	local flag = false
	local n4 = 0
	local flag2 = false
	local v15 = nil
	local str3 = ""
	local n5 = 0
	local n6 = 60

	local function fn13(arg)
		n3 = 0
		v14 = nil

		if arg then
			tbl14[arg] = true
		end
	end

	pcall(function()
		TeleportService.TeleportInitFailed:Connect(function(arg, arg2, arg3)
			if not v14 then
				return
			end
			fn13(v14)
			flag2 = true

			if not flag then
				fn6("Server Hop Failed", tostring(arg3 ~= "" and arg3 or arg2))
			end
		end)
	end)

	local function fn14(arg)
		local str4 = tostring(game.JobId or "")
		local tbl15 = {}
		local flag3 = arg == "Random"
		local str5 = arg == "Least Players" and "Asc" or "Desc"
		local n7 = flag3 and 3 or 6
		local nextPageCursor = nil

		for i = 1, n7 do
			local str6 = string.format("https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=%s&excludeFullGames=true&limit=100", game.PlaceId, str5)

			if nextPageCursor and nextPageCursor ~= "" then
				str6 ..= "&cursor=" .. HttpService:UrlEncode(nextPageCursor)
			end

			local ok, result = pcall(function()
				return HttpService:JSONDecode(game:HttpGet(str6))
			end)

			if not ok or type(result) ~= "table" then
				return tbl15, false
			end
			local v16 = ipairs
			local data = result.data or {}

			for _, v17 in v16(data) do
				local str7 = tostring(v17.id or "")
				local huge = tonumber(v17.playing) or math.huge
				local n8 = tonumber(v17.maxPlayers) or 0

				if str7 ~= "" and str7 ~= str4 and huge < n8 then
					tbl15[#tbl15 + 1] = { Id = str7, Playing = huge, Room = n8 - huge }
				end
			end

			if #tbl15 > 0 and not flag3 then
				break
			end
			nextPageCursor = result.nextPageCursor
			if not nextPageCursor or nextPageCursor == "" then
				break
			end
		end

		return tbl15, true
	end

	local function serverHop(arg)
		local v16

		if v15 and str3 == arg and os.clock() - n5 < n6 then
			v16 = v15
		else
			local v17
			v16, v17 = fn14(arg)
			if not v17 then
				return "fetch"
			end
			v15 = v16
			str3 = arg
			n5 = os.clock()
		end

		local function fn15(arg2)
			local tbl15 = {}

			for _, v17 in ipairs(v16) do
				if not tbl14[v17.Id] and v17.Room >= arg2 then
					tbl15[#tbl15 + 1] = v17
				end
			end

			return tbl15
		end

		local v17 = fn15(2)

		if #v17 == 0 then
			v17 = fn15(1)
		end

		if #v17 == 0 and next(tbl14) ~= nil then
			table.clear(tbl14)
			v17 = fn15(1)
		end

		if #v17 == 0 then
			fn13(nil)
			v15 = nil
			return "empty"
		end

		local id2

		if arg == "Random" then
			id2 = v17[math.random(1, #v17)].Id
		else
			table.sort(v17, function(arg2, arg3)
				if arg == "Least Players" then
					return arg2.Playing < arg3.Playing
				end
				return arg2.Playing > arg3.Playing
			end)

			id2 = v17[1].Id
		end

		flag2 = false
		v14 = id2
		n3 = os.clock() + n2
		pcall(fn12)

		if not pcall(function()
			TeleportService:TeleportToPlaceInstance(game.PlaceId, id2, localPlayer)
		end) then
			fn13(id2)
			return "failed"
		end

		local n7 = os.clock() + n2

		while os.clock() < n7 do
			if flag2 then
				return "denied"
			end
			task.wait(0.25)
		end

		return "waiting"
	end

	tbl2.ServerHop = serverHop

	v12:CreateDropdown({
		Name = "Server Hop Mode",
		Options = { "Most Players", "Random", "Least Players" },
		Default = "Least Players",
		Callback = function(arg)
			str2 = tostring(arg or "Least Players")
		end,
	})

	v12:CreateButton({
		Name = "Server Hop",
		ButtonText = "Hop",
		Callback = function()
			n4 += 1
			local v16 = n4

			task.spawn(function()
				flag = true
				local n7 = 0

				while v16 == n4 do
					n7 += 1
					local v17 = serverHop(str2)

					if not (v17 == "waiting" or v16 ~= n4) then
						if v17 == "empty" then
							v15 = nil
							table.clear(tbl14)
						end

						if n7 % 10 == 0 then
							fn6("Server Hop", string.format("Every server was full so far, %d tries.", n7))
						end

						task.wait(v17 == "fetch" and 1 or 0.1)
						continue
					end

					break
				end

				if v16 == n4 then
					flag = false
				end
			end)
		end,
	})

	local n7 = 8
	local n8 = 0
	local str4 = ""
	local v16 = nil

	local function fn15()
		return os.clock() < n8
	end

	local function fn16(arg)
		n8 = arg and os.clock() + n7 or 0
	end

	local function fn17(arg)
		local match = tostring(arg or ""):match("^%s*(.-)%s*$")
		return match:match("%x%x%x%x%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%x%x%x%x%x%x%x%x") or match
	end

	local function fn18()
		local v17 = str4
		local result = str4

		if v16 then
			local ok

			ok, result = pcall(function()
				local controller = v16._controller
				return controller and controller.GetValue and controller.GetValue()
			end)

			if not (ok and type(result) == "string" and result ~= "") then
				local exitTo = nil

				for _, v18 in ipairs({ "Get", "GetValue", "GetText" }) do
					local ok2, result2 = pcall(function()
						return v16[v18]
					end)

					if ok2 and type(result2) == "function" then
						local ok3
						ok3, result = pcall(result2, v16)
						if ok3 and type(result) == "string" and result ~= "" then
							exitTo = 1
							break
						end
					end
				end

				if exitTo ~= 1 then
					result = v17
				end
			end
		end

		local v18 = fn17(result)

		if v18 == "" then
			local ok, result2 = pcall(function()
				local v19 = getclipboard or readclipboard or getrbxclipboard
				return type(v19) == "function" and v19() or nil
			end)

			if ok and type(result2) == "string" then
				v18 = fn17(result2)
			end
		end

		return v18
	end

	local function fn19(arg)
		if not v16 then
			return
		end

		pcall(function()
			local controller = v16._controller

			if controller and controller.SetValue then
				controller.SetValue(arg, false)
			end
		end)

		str4 = fn17(arg)
	end

	local function fn20(arg)
		fn16(true)
		pcall(AutoLoadBeforeTeleport)

		if not pcall(function()
			if game.JobId ~= "" then
				TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, localPlayer)
			else
				TeleportService:Teleport(game.PlaceId, localPlayer)
			end
		end) then
			fn16(false)
			fn6(arg, "Roblox could not rejoin the server.")
		end
	end

	pcall(function()
		TeleportService.TeleportInitFailed:Connect(function(arg, arg2, arg3)
			if not fn15() then
				return
			end
			fn16(false)
			fn6("Teleport Failed", tostring(arg3 ~= "" and arg3 or arg2))
		end)
	end)

	v16 = v12:CreateInput({
		Name = "Job ID",
		Placeholder = "Paste a server Job ID...",
		Default = "",
		MaxLength = 100,
		Callback = function(arg)
			str4 = fn17(arg)
		end,
	})

	if v16 then
		v16._configIgnored = true

		if v16.State and not v16.State._registered then
			v16.State._configIgnored = true
		end
	end

	v12:CreateButton({
		Name = "Join Job ID",
		ButtonText = "Join",
		Callback = function()
			if fn15() then
				fn6("Join Job ID Failed", "A teleport is already running, try again shortly.")
				return
			end
			local v17 = fn18()
			if v17 == "" then
				fn6("Join Job ID Failed", "Paste a valid Job ID first.")
				return
			end
			fn16(true)
			pcall(AutoLoadBeforeTeleport)

			if not pcall(function()
				TeleportService:TeleportToPlaceInstance(game.PlaceId, v17, localPlayer)
			end) then
				fn16(false)
				fn6("Join Job ID Failed", "Roblox could not join that server.")
			end
		end,
	})

	v12:CreateButton({
		Name = "Copy Current Job ID",
		ButtonText = "Copy",
		Callback = function()
			local str5 = tostring(game.JobId or "")
			fn19(str5)
			local v17 = setclipboard or toclipboard
			fn6((type(v17) == "function" and pcall(v17, str5) or false) and "Job ID Copied" or "Job ID Shown", str5)
		end,
	})

	v12:CreateButton({
		Name = "Rejoin Server",
		ButtonText = "Rejoin",
		Callback = function()
			if fn15() then
				fn6("Rejoin Failed", "A teleport is already running, try again shortly.")
				return
			end
			fn20("Rejoin Failed")
		end,
	})
end

local v12
v12 = v2:CreateTab({ Name = "Misc", SectionsExpanded = true })
local v13
v13 = v12:CreateSection({ Name = "Performance", Expanded = true })
local flag = false

v13:CreateSlider({
	Name = "FPS Cap",
	Min = 30,
	Max = 1000,
	Default = 240,
	AllowDecimals = false,
	Increment = 1,
	Unit = " FPS",
	Callback = function(arg)
		local n2 = math.clamp(math.floor(tonumber(arg) or 240), 30, 1000)
		if type(setfpscap) == "function" and pcall(setfpscap, n2) then
			flag = false
			return
		end

		if not flag then
			flag = true
			fn6("FPS Cap Unavailable", "This environment does not support setfpscap.")
		end
	end,
})

do
	local Lighting = game:GetService("Lighting")
	local n2 = 0.003
	local flag2 = false
	local n3 = 0
	local thread = nil
	local tbl14 = {}
	local tbl15 = {}
	local obj = setmetatable({}, { __mode = "k" })
	local tbl16 = {}
	local connection = nil

	local function fn10(arg, arg2, arg3)
		local ok, result = pcall(arg)
		if not ok then
			return
		end
		tbl15[#tbl15 + 1] = { Setter = arg2, Value = result }
		pcall(arg2, arg3)
	end

	local function fn11(arg, arg2, arg3)
		local tbl17 = obj[arg]

		if not tbl17 then
			tbl17 = {}
			obj[arg] = tbl17
		end

		if tbl17[arg2] == nil then
			local ok, result = pcall(function()
				return arg[arg2]
			end)

			if not ok then
				return
			end
			tbl17[arg2] = { Value = result }
		end

		pcall(function()
			arg[arg2] = arg3
		end)
	end

	local function fn12(arg)
		if not flag2 or not arg.Parent then
			return
		end

		if arg:IsA("ParticleEmitter") then
			fn11(arg, "Enabled", false)
			fn11(arg, "Rate", 0)
		elseif arg:IsA("Trail") or arg:IsA("Beam") then
			fn11(arg, "Enabled", false)
		elseif arg:IsA("PointLight") or arg:IsA("SpotLight") or arg:IsA("SurfaceLight") then
			fn11(arg, "Enabled", false)
			fn11(arg, "Brightness", 0)
		elseif arg:IsA("Fire") or arg:IsA("Smoke") or arg:IsA("Sparkles") then
			fn11(arg, "Enabled", false)
		elseif arg:IsA("Explosion") then
			fn11(arg, "Visible", false)
		elseif arg:IsA("SpecialMesh") then
			fn11(arg, "TextureId", "")
		elseif arg:IsA("Decal") or arg:IsA("Texture") then
			if not (arg.Name == "face" and arg.Parent and arg.Parent.Name == "Head") then
				fn11(arg, "Transparency", 1)
			end
		elseif arg:IsA("MeshPart") then
			fn11(arg, "RenderFidelity", Enum.RenderFidelity.Performance)
			fn11(arg, "TextureID", "")
			fn11(arg, "CastShadow", false)
			fn11(arg, "Reflectance", 0)
			fn11(arg, "Material", Enum.Material.SmoothPlastic)
		elseif arg:IsA("BasePart") then
			fn11(arg, "CastShadow", false)
			fn11(arg, "Reflectance", 0)
			fn11(arg, "Material", Enum.Material.SmoothPlastic)
		elseif arg:IsA("PostEffect") then
			fn11(arg, "Enabled", false)
		elseif arg:IsA("Clouds") then
			fn11(arg, "Cover", 0)
			fn11(arg, "Density", 0)
		elseif arg:IsA("Atmosphere") then
			fn11(arg, "Density", 0)
			fn11(arg, "Haze", 0)
			fn11(arg, "Glare", 0)
		end
	end

	local function fn13()
		for _, v14 in ipairs(tbl14) do
			if v14.Connected then
				v14:Disconnect()
			end
		end

		table.clear(tbl14)

		if connection then
			pcall(function()
				connection:Disconnect()
			end)

			connection = nil
		end
	end

	local function fn14()
		local rendering = settings().Rendering
		local terrain = workspace.Terrain

		local function fn15(arg, arg2, arg3)
			fn10(function()
				return arg[arg2]
			end, function(arg4)
				arg[arg2] = arg4
			end, arg3)
		end

		fn15(rendering, "QualityLevel", Enum.QualityLevel.Level01)
		fn15(rendering, "MeshPartDetailLevel", Enum.MeshPartDetailLevel.Level01)
		fn15(rendering, "EditQualityLevel", Enum.QualityLevel.Level01)

		local ok, result = pcall(function()
			return UserSettings():GetService("UserGameSettings")
		end)

		if ok and result then
			fn15(result, "SavedQualityLevel", Enum.SavedQualitySetting.QualityLevel1)
		end

		fn15(Lighting, "GlobalShadows", false)
		fn15(Lighting, "ShadowSoftness", 0)
		fn15(Lighting, "FogEnd", 9e9)
		fn15(Lighting, "Technology", Enum.Technology.Legacy)
		fn15(Lighting, "EnvironmentDiffuseScale", 0)
		fn15(Lighting, "EnvironmentSpecularScale", 0)
		fn15(terrain, "Decoration", false)
		fn15(terrain, "WaterWaveSize", 0)
		fn15(terrain, "WaterWaveSpeed", 0)
		fn15(terrain, "WaterReflectance", 0)
		fn15(terrain, "WaterTransparency", 1)
	end

	local function fn15(arg, arg2)
		local now = os.clock()

		for _, descendant in ipairs(arg:GetDescendants()) do
			if not flag2 or n3 ~= arg2 then
				return false
			end
			fn12(descendant)

			if n2 < os.clock() - now then
				RunService.Heartbeat:Wait()
				now = os.clock()
			end
		end

		return true
	end

	local function fn16()
		if not flag2 or #tbl16 == 0 then
			return
		end
		local now = os.clock()

		while #tbl16 > 0 do
			local v14 = table.remove(tbl16)
			fn12(v14)
			if not (n2 < os.clock() - now) then
				continue
			end
			break
		end
	end

	local function fn17()
		local now = os.clock()

		for k, v14 in pairs(obj) do
			if k.Parent then
				for k2, v15 in pairs(v14) do
					pcall(function()
						k[k2] = v15.Value
					end)
				end
			end

			obj[k] = nil

			if os.clock() - now > n2 then
				RunService.Heartbeat:Wait()
				now = os.clock()
			end
		end
	end

	local function fn18()
		if not flag2 then
			return
		end
		flag2 = false
		n3 += 1
		fn13()
		table.clear(tbl16)

		if thread then
			pcall(task.cancel, thread)
			thread = nil
		end

		fn17()

		for i = #tbl15, 1, -1 do
			local v14 = tbl15[i]
			pcall(v14.Setter, v14.Value)
		end

		table.clear(tbl15)
	end

	local function fn19()
		if flag2 then
			return
		end
		flag2 = true
		n3 += 1
		local v14 = n3
		fn14()

		local function fn20(arg)
			tbl14[#tbl14 + 1] = arg.DescendantAdded:Connect(function(descendant)
				if flag2 and n3 == v14 then
					tbl16[#tbl16 + 1] = descendant
				end
			end)
		end

		fn20(workspace)
		fn20(Lighting)

		connection = RunService.Heartbeat:Connect(function()
			if flag2 and n3 == v14 then
				fn16()
			end
		end)

		thread = task.spawn(function()
			if fn15(workspace, v14) then
				fn15(Lighting, v14)
			end
		end)
	end

	fn4(fn18)

	v13:CreateToggle({
		Name = "Optimizer",
		Note = "Strip shadows, textures and effects for the highest FPS",
		Default = false,
		Callback = function(arg)
			if arg then
				fn19()
			else
				task.spawn(fn18)
			end
		end,
	})
end

do
	local Stats = game:GetService("Stats")
	local n2 = 132
	local n3 = 0.085
	local n4 = 0.2
	local n5 = 8
	local v14 = v2:CreateState({ Name = "FPS and Ping Position", Default = {} })

	local function fn10()
		local v15 = v14:Get()
		if type(v15) == "table" and type(v15.XOffset) == "number" and type(v15.YOffset) == "number" then
			return UDim2.new(tonumber(v15.XScale) or 0, v15.XOffset, tonumber(v15.YScale) or 0, v15.YOffset)
		end
		return UDim2.new(0, 16, 0, 16)
	end

	local function fn11(arg)
		v14:Set({ XScale = arg.X.Scale, XOffset = arg.X.Offset, YScale = arg.Y.Scale, YOffset = arg.Y.Offset })
	end

	local color4 = Color3.fromRGB(58, 255, 55)
	local color5 = Color3.fromRGB(255, 214, 84)
	local color6 = Color3.fromRGB(255, 96, 96)
	local color7 = Color3.fromRGB(150, 150, 158)
	local flag2 = false
	local tbl14 = {}
	local screenGui2 = nil
	local frame = nil
	local uiScale = nil
	local v15 = nil
	local v16 = nil
	local n6 = 1
	local n7 = 0
	local n8 = 0
	local v17 = nil
	local v18 = nil
	local font = nil

	pcall(function()
		font = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal)
	end)

	local function fn12(arg)
		if arg >= 100 then
			return color4
		end

		if arg >= 50 then
			return color5
		end
		return color6
	end

	local function fn13(arg)
		if arg <= 90 then
			return color4
		end

		if arg <= 180 then
			return color5
		end
		return color6
	end

	local function fn14()
		if not uiScale then
			return
		end
		local currentCamera = workspace.CurrentCamera
		currentCamera = currentCamera and currentCamera.ViewportSize or Vector2.new(1280, 720)

		if currentCamera.X < 1 then
			currentCamera = Vector2.new(1280, 720)
		end

		uiScale.Scale = math.clamp(currentCamera.X * n3 / n2, 0.7, 1.4) * n6
	end

	local function fn15()
		for _, v19 in ipairs(tbl14) do
			pcall(function()
				v19:Disconnect()
			end)
		end

		table.clear(tbl14)

		if screenGui2 then
			pcall(function()
				screenGui2:Destroy()
			end)
		end

		screenGui2 = nil
		frame = nil
		uiScale = nil
		v15 = nil
		v16 = nil
		v17 = nil
		v18 = nil
		n7 = 0
	end

	local function createTextLabel(parent, arg, arg2, textColor3)
		local textLabel = Instance.new("TextLabel")
		textLabel.Name = fn3()
		textLabel.BackgroundTransparency = 1
		textLabel.Position = UDim2.fromOffset(arg, 9)
		textLabel.Size = UDim2.fromOffset(arg2, 16)
		textLabel.Text = ""
		textLabel.TextColor3 = textColor3
		textLabel.TextScaled = true
		textLabel.TextXAlignment = Enum.TextXAlignment.Left

		if font then
			textLabel.FontFace = font
		else
			textLabel.Font = Enum.Font.GothamBold
		end

		textLabel.Parent = parent
		return textLabel
	end

	local function fn16()
		fn15()
		screenGui2 = Instance.new("ScreenGui")
		screenGui2.Name = fn3()
		screenGui2.Archivable = false
		screenGui2.DisplayOrder = 58
		screenGui2.IgnoreGuiInset = true
		screenGui2.ResetOnSpawn = false
		screenGui2.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		frame = Instance.new("Frame")
		frame.Name = fn3()
		frame.Active = true
		frame.BackgroundColor3 = Color3.fromRGB(24, 24, 28)
		frame.BackgroundTransparency = 0.28
		frame.BorderSizePixel = 0
		frame.Position = fn10()
		frame.Size = UDim2.fromOffset(132, 34)
		frame.Parent = screenGui2
		local uiCorner = Instance.new("UICorner")
		uiCorner.Name = fn3()
		uiCorner.CornerRadius = UDim.new(0, 12)
		uiCorner.Parent = frame
		local uiStroke = Instance.new("UIStroke")
		uiStroke.Name = fn3()
		uiStroke.Color = Color3.fromRGB(255, 255, 255)
		uiStroke.Thickness = 1
		uiStroke.Transparency = 0.9
		uiStroke.Parent = frame
		uiScale = Instance.new("UIScale")
		uiScale.Name = fn3()
		uiScale.Parent = frame
		fn14()
		v15 = createTextLabel(frame, 12, 34, color4)
		createTextLabel(frame, 48, 22, color7).Text = "FPS"
		local frame2 = Instance.new("Frame")
		frame2.Name = fn3()
		frame2.AnchorPoint = Vector2.new(0.5, 0.5)
		frame2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		frame2.BackgroundTransparency = 0.85
		frame2.BorderSizePixel = 0
		frame2.Position = UDim2.new(0, 74, 0.5, 0)
		frame2.Size = UDim2.fromOffset(1, 14)
		frame2.Parent = frame
		v16 = createTextLabel(frame, 82, 30, color4)
		createTextLabel(frame, 113, 14, color7).Text = "ms"
		screenGui2.Parent = v3
		local currentCamera = workspace.CurrentCamera

		if currentCamera then
			tbl14[#tbl14 + 1] = currentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(fn14)
		end

		local flag3 = false
		local v19 = nil
		local vector2 = Vector2.zero
		local position = nil

		tbl14[#tbl14 + 1] = frame.InputBegan:Connect(function(input)
			local v20 = flag3
			local flag4

			if flag3 then
				flag4 = v20
			else
				flag4 = input.UserInputState ~= Enum.UserInputState.Begin
			end

			if flag4 then
				return
			end
			local flag5 = input.UserInputType == Enum.UserInputType.Touch
			if not (input.UserInputType == Enum.UserInputType.MouseButton1) and not flag5 then
				return
			end
			flag3 = true
			v19 = flag5 and input or nil
			vector2 = Vector2.new(input.Position.X, input.Position.Y)
			position = frame.Position
		end)

		tbl14[#tbl14 + 1] = UserInputService.InputChanged:Connect(function(input)
			if not flag3 or not frame or not position then
				return
			end

			if not (v19 and input == v19 or not v19 and input.UserInputType == Enum.UserInputType.MouseMovement) then
				return
			end
			local n9 = Vector2.new(input.Position.X, input.Position.Y) - vector2
			frame.Position = UDim2.new(position.X.Scale, position.X.Offset + n9.X, position.Y.Scale, position.Y.Offset + n9.Y)
		end)

		tbl14[#tbl14 + 1] = UserInputService.InputEnded:Connect(function(input)
			if not flag3 then
				return
			end

			if v19 and input == v19 or not v19 and input.UserInputType == Enum.UserInputType.MouseButton1 then
				flag3 = false
				v19 = nil
				position = nil

				if frame then
					fn11(frame.Position)
				end
			end
		end)

		tbl14[#tbl14 + 1] = RunService.RenderStepped:Connect(function(deltaTime)
			if not flag2 or not v15 then
				return
			end
			local n9 = math.clamp(deltaTime, 0.001, 1)
			local n10 = 1 / n9

			if n7 <= 0 then
				n7 = n10
			else
				n7 += (n10 - n7) * (1 - math.exp(-n9 * n5))
			end

			local now = os.clock()
			if now < n8 then
				return
			end
			n8 = now + n4
			local n11 = math.floor(n7 + 0.5)
			local text = tostring(n11)

			if text ~= v17 then
				v17 = text
				v15.Text = text
				v15.TextColor3 = fn12(n11)
			end

			local n12 = 0

			pcall(function()
				n12 = Stats.Network.ServerStatsItem["Data Ping"]:GetValue()
			end)

			local n13 = math.floor(n12 + 0.5)
			local text2 = tostring(n13)

			if text2 ~= v18 then
				v18 = text2
				v16.Text = text2
				v16.TextColor3 = fn13(n13)
			end
		end)
	end

	v13:CreateSlider({
		Name = "FPS and Ping Size",
		Min = 60,
		Max = 160,
		Default = 100,
		AllowDecimals = false,
		Increment = 1,
		Unit = "%",
		SubOf = v13:CreateToggle({
			Name = "FPS and Ping",
			Default = true,
			Callback = function(arg)
				flag2 = arg == true

				if flag2 then
					fn16()
				else
					fn15()
				end
			end,
		}),
		Callback = function(arg)
			n6 = math.clamp((tonumber(arg) or 100) / 100, 0.6, 1.6)
			fn14()
		end,
	})

	fn4(fn15)
end

do
	local v14 = v12:CreateSection({ Name = "Utility", Expanded = true })
	local tbl14 = { Enabled = true, Alive = true }

	local function fn10()
		if type(getconnections) ~= "function" then
			return {}
		end
		local ok, result = pcall(getconnections, localPlayer.Idled)
		return ok and type(result) == "table" and result or {}
	end

	local function fn11()
		for _, v15 in ipairs(fn10()) do
			pcall(function()
				v15:Disable()
			end)
		end
	end

	local function fn12()
		for _, v15 in ipairs(fn10()) do
			pcall(function()
				v15:Enable()
			end)
		end
	end

	fn4(function()
		tbl14.Alive = false
		fn12()
	end)

	task.spawn(function()
		while tbl14.Alive do
			if tbl14.Enabled then
				fn11()
			end

			task.wait(30)
		end
	end)

	v14:CreateToggle({
		Name = "Anti AFK",
		Default = true,
		Callback = function(arg)
			tbl14.Enabled = arg ~= false

			if tbl14.Enabled then
				fn11()
			else
				fn12()
			end
		end,
	})
end

do
	local v14 = v2:CreateTab({ Name = "Discord", Side = "Right", SectionsExpanded = true }):CreateSection({ Name = "Community", Expanded = true })
	local str2 = "discord.gg/CJK4bs2mgT"
	local str3 = "rbxassetid://128961717706452"
	local n2 = 0.5
	local n3 = 0.0909
	local n4 = 0.2
	local n5 = 5.4
	local n6 = 4.2
	local n7 = 5.2
	local n8 = 6
	local n9 = 3.6
	local n10 = 6.4
	local n11 = 2
	local n12 = 11.4
	local n13 = 3
	local n14 = 0.35

	local tbl14 = {
		{
			Color = "#FF6A55",
			Title = "New Scripts &amp; Updates",
			Text = "Patch notes and new game scripts are posted there first.",
		},
		{
			Color = "#FFB054",
			Title = "Giveaways",
			Text = "Member giveaways and events are announced in the server.",
		},
		{
			Color = "#9AA3FF",
			Title = "Support",
			Text = "Ask for help, report bugs and get answers from the team.",
		},
		{
			Color = "#6EE49C",
			Title = "Suggestions",
			Text = "Request features and vote on what gets added next.",
		},
	}

	local n15 = n12 + #tbl14 * (n13 + n14) + 2.4 + n4 * 2
	local colorSequence = ColorSequence.new
	local tbl15 = {}
	local v15 = ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 218, 96))
	local v16 = ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 152, 60))
	local new = ColorSequenceKeypoint.new
	local color4 = Color3.fromRGB
	tbl15[1] = v15
	tbl15[2] = v16

	do
		local values = table.pack(new(1, color4(255, 82, 64)))
		table.move(values, 1, values.n, 3, tbl15)
	end

	local v17 = colorSequence(tbl15)
	local color5 = Color3.fromRGB
	local colorSequence2 = ColorSequence.new(Color3.fromRGB(74, 24, 18), color5(14, 11, 15))
	local tbl16 = { Perks = {} }
	local n16 = 0

	local function fn10()
		local v18 = setclipboard or toclipboard
		local ok = type(v18) == "function" and pcall(v18, "https://discord.gg/CJK4bs2mgT") or false
		fn6(ok and "Discord Link Copied" or "Discord Link", "https://discord.gg/CJK4bs2mgT")
		if not tbl16.Copy then
			return
		end
		n16 += 1
		local v19 = n16

		tbl16.Copy.Set({
			Text = ok and "<b>Copied!</b>" or "<b>See Notice</b>",
			Background = ok and "#2EB070" or "#5865F2",
		})

		task.delay(1.8, function()
			if v19 == n16 and tbl16.Copy then
				tbl16.Copy.Set({ Text = "<b>Copy Link</b>", Background = "#5865F2" })
			end
		end)
	end

	local function fn11(arg)
		if not tbl16.Hero then
			return
		end
		local n17 = n4 * 2
		local n18 = math.max(arg, 14) - n17
		local n19 = math.max(1, n18 - n7 - n2)
		local n20 = math.max(1, n18 - n10 - n2 * 3)
		local n21 = math.max(1, n18 - 1.2)
		tbl16.Hero.Set({ Width = n18 })
		tbl16.Title.Set({ Width = n19 })
		tbl16.Subtitle.Set({ Width = n19 })
		tbl16.Members.Set({ Width = n19 })
		tbl16.Invite.Set({ Width = n18 })
		tbl16.Label.Set({ Width = n20 })
		tbl16.Link.Set({ Width = n20 })
		tbl16.Copy.Set({ X = n18 - n10 - n2 })
		tbl16.Header.Set({ Width = n18 })

		for _, perk in ipairs(tbl16.Perks) do
			perk.Frame.Set({ Width = n18 })
			perk.Title.Set({ Width = n21 })
			perk.Text.Set({ Width = n21 })
		end

		tbl16.Tip.Set({ Width = n18 })
	end

	local function fn12(arg)
		tbl16.Hero = arg:Frame({
			Name = "Hero",
			X = n4,
			Y = n4,
			Width = 14,
			Height = n5,
			Background = "#FFFFFF",
			Gradient = colorSequence2,
			GradientRotation = 0,
			Corner = 0.35,
			StrokeColor = "#FF6A40",
			StrokeThickness = n3,
			StrokeTransparency = 0.55,
		})

		tbl16.Logo = arg:Image({ Parent = tbl16.Hero, X = 0.5, Y = (n5 - n6) / 2, Width = n6, Height = n6, Image = str3 })

		tbl16.Title = arg:Text({
			Parent = tbl16.Hero,
			X = n7,
			Y = 0.45,
			Width = 1,
			Height = 1.6,
			Scale = 1.45,
			Wrap = false,
			Text = "<b>Chilli Hub</b>",
			Gradient = v17,
			GradientRotation = 0,
			TextStrokeTransparency = 1,
		})

		tbl16.Subtitle = arg:Text({
			Parent = tbl16.Hero,
			X = n7,
			Y = 2.1,
			Width = 1,
			Height = 1,
			Wrap = false,
			Text = "Official Discord Community",
			Color = "#DCDCE8",
		})

		tbl16.Members = arg:Text({
			Parent = tbl16.Hero,
			X = n7,
			Y = 3.3,
			Width = 1,
			Height = 1.2,
			Wrap = false,
			Text = string.format("<font color=\"#6EE49C\">%s</font>  <b>%s</b>  <font color=\"#B8B8CC\">Members</font>", utf8.char(9679), "130K+"),
		})

		tbl16.Invite = arg:Frame({
			Name = "Invite",
			X = n4,
			Y = n8 + n4,
			Width = 14,
			Height = n9,
			Background = "#000000",
			BackgroundTransparency = 0.5,
			Corner = 0.35,
			StrokeColor = "#5865F2",
			StrokeThickness = n3,
			StrokeTransparency = 0.35,
		})

		tbl16.Label = arg:Text({
			Parent = tbl16.Invite,
			X = n2 + 0.1,
			Y = 0.35,
			Width = 1,
			Height = 0.9,
			Scale = 0.78,
			Wrap = false,
			Text = "<b>INVITE LINK</b>",
			Color = "#9C9CB4",
		})

		tbl16.Link = arg:Text({
			Parent = tbl16.Invite,
			X = n2 + 0.1,
			Y = 1.35,
			Width = 1,
			Height = 1.6,
			Scale = 1.05,
			Wrap = false,
			Font = "code",
			Text = str2,
		})

		tbl16.Copy = arg:Button({
			Parent = tbl16.Invite,
			X = 14 - n10 - n2,
			Y = (n9 - n11) / 2,
			Width = n10,
			Height = n11,
			Text = "<b>Copy Link</b>",
			Color = "#FFFFFF",
			Scale = 1,
			Background = "#5865F2",
			BackgroundTransparency = 0,
			HoverTransparency = 0.15,
			PressTransparency = 0.3,
			StrokeColor = "#9AA3FF",
			StrokeThickness = n3,
			Corner = 0.3,
			Callback = fn10,
		})

		tbl16.Header = arg:Text({
			X = n4 + 0.1,
			Y = n12 - 1.15 + n4,
			Width = 14,
			Height = 1,
			Scale = 0.8,
			Wrap = false,
			Text = "<b>WHAT YOU GET</b>",
			Color = "#9C9CB4",
		})

		for i, v18 in ipairs(tbl14) do
			local tbl17 = {
				Frame = arg:Frame({
					Name = "Perk",
					X = n4,
					Y = n12 + (i - 1) * (n13 + n14) + n4,
					Width = 14,
					Height = n13,
					Background = "#000000",
					BackgroundTransparency = 0.68,
					Corner = 0.35,
				}),
			}

			tbl17.Accent = arg:Frame({
				Parent = tbl17.Frame,
				X = 0.3,
				Y = 0.45,
				Width = 0.22,
				Height = n13 - 0.9,
				Background = v18.Color,
				Corner = 0.11,
			})

			tbl17.Title = arg:Text({
				Parent = tbl17.Frame,
				X = 0.85,
				Y = 0.3,
				Width = 1,
				Height = 1.1,
				Wrap = false,
				Text = "<b>" .. v18.Title .. "</b>",
				Color = v18.Color,
			})

			tbl17.Text = arg:Text({
				Parent = tbl17.Frame,
				X = 0.85,
				Y = 1.35,
				Width = 1,
				Height = 1.5,
				Scale = 0.86,
				Wrap = true,
				Text = v18.Text,
				Color = "#C8C8D8",
			})

			tbl16.Perks[i] = tbl17
		end

		tbl16.Tip = arg:Text({
			X = n4 + 0.1,
			Y = n15 - 2.2 - n4,
			Width = 14,
			Height = 2,
			Scale = 0.8,
			Wrap = true,
			Text = "Paste the copied link into your browser or the Discord app to join.",
			Color = "#8A8AA2",
		})

		arg:SetContentLines(n15)

		arg:OnResize(function(arg2, arg3, arg4)
			fn11(arg3 / math.max(arg4, 1))
		end)

		local max = math.max
		fn11(arg:Width() / max(arg:Unit(), 1))
	end

	if type(v14.CreateCanvas) == "function" then
		local v18 = v14:CreateCanvas({
			Name = "Discord",
			ShowTitle = false,
			Layout = "free",
			Style = {
				TextScale = 0.84,
				LineHeight = 1.1,
				MinLines = math.ceil(n15),
				MaxLines = math.ceil(n15),
				BackgroundTransparency = 0.5,
				ScrollBarColor = Color3.fromRGB(170, 174, 184),
				TextColor = Color3.fromRGB(255, 255, 255),
				TextStrokeTransparency = 0.7,
			},
			Build = fn12,
		})

		fn4(function()
			v18:Destroy()
		end)
	else
		v14:CreateText({ Name = "Discord", Text = "https://discord.gg/CJK4bs2mgT" })
	end

	if type(v14.CreateButton) == "function" then
		v14:CreateButton({ Name = "Copy Discord Link", Callback = fn10 })
	end
end

do
	local image = "rbxassetid://128961717706452"
	local n2 = 56
	local n3 = 0.035
	local n4 = 8
	local tweenInfo = TweenInfo.new(0.08, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	local tweenInfo2 = TweenInfo.new(0.14, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
	local TweenService2 = game:GetService("TweenService")
	local tbl14 = {}
	local screenGui2 = nil
	local uiScale = nil
	local uiScale2 = nil

	local function fn10()
		for _, v14 in ipairs({ "Toggle", "Open" }) do
			local ok, result = pcall(function()
				return v2[v14]
			end)

			if ok and type(result) == "function" then
				pcall(result, v2)
				return
			end
		end
	end

	local function fn11()
		if not uiScale then
			return
		end
		local currentCamera = workspace.CurrentCamera
		currentCamera = currentCamera and currentCamera.ViewportSize or Vector2.new(1280, 720)

		if currentCamera.X < 1 then
			currentCamera = Vector2.new(1280, 720)
		end

		uiScale.Scale = math.clamp(currentCamera.X * n3 / n2, 0.7, 1.4)
	end

	local function fn12()
		for _, v14 in ipairs(tbl14) do
			pcall(function()
				v14:Disconnect()
			end)
		end

		table.clear(tbl14)

		if screenGui2 then
			pcall(function()
				screenGui2:Destroy()
			end)
		end

		screenGui2 = nil
		uiScale = nil
		uiScale2 = nil
	end

	local function fn13()
		fn12()
		screenGui2 = Instance.new("ScreenGui")
		screenGui2.Name = fn3()
		screenGui2.Archivable = false
		screenGui2.DisplayOrder = 59
		screenGui2.IgnoreGuiInset = true
		screenGui2.ResetOnSpawn = false
		screenGui2.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		local frame = Instance.new("Frame")
		frame.Name = fn3()
		frame.AnchorPoint = Vector2.new(0, 0.5)
		frame.Position = UDim2.new(0, 16, 0.3, 0)
		frame.Size = UDim2.fromOffset(56, 56)
		frame.BackgroundTransparency = 1
		frame.BorderSizePixel = 0
		frame.Parent = screenGui2
		uiScale = Instance.new("UIScale")
		uiScale.Name = fn3()
		uiScale.Parent = frame
		fn11()
		local imageButton = Instance.new("ImageButton")
		imageButton.Name = fn3()
		imageButton.AnchorPoint = Vector2.new(0.5, 0.5)
		imageButton.Position = UDim2.fromScale(0.5, 0.5)
		imageButton.Size = UDim2.fromScale(1, 1)
		imageButton.BackgroundTransparency = 1
		imageButton.BorderSizePixel = 0
		imageButton.AutoButtonColor = false
		imageButton.Image = image
		imageButton.ScaleType = Enum.ScaleType.Fit
		imageButton.Active = true
		imageButton.Parent = frame
		uiScale2 = Instance.new("UIScale")
		uiScale2.Name = fn3()
		uiScale2.Parent = imageButton
		local uiCorner = Instance.new("UICorner")
		uiCorner.Name = fn3()
		uiCorner.CornerRadius = UDim.new(0.28, 0)
		uiCorner.Parent = imageButton

		local function fn14(arg, arg2)
			if uiScale2 then
				TweenService2:Create(uiScale2, arg2, { Scale = arg }):Play()
			end
		end

		local function fn15(arg)
			local absoluteSize = screenGui2.AbsoluteSize
			local absoluteSize2 = frame.AbsoluteSize
			if absoluteSize.X <= 0 or absoluteSize.Y <= 0 then
				return arg
			end
			local n5 = arg.Y.Offset + arg.Y.Scale * absoluteSize.Y
			local n6 = math.clamp(arg.X.Offset + arg.X.Scale * absoluteSize.X, 0, math.max(0, absoluteSize.X - absoluteSize2.X))
			local n7 = math.clamp(n5, absoluteSize2.Y * 0.5, math.max(absoluteSize2.Y * 0.5, absoluteSize.Y - absoluteSize2.Y * 0.5))
			return UDim2.fromOffset(n6, n7)
		end

		local str2 = nil
		local vector2 = nil
		local position = nil
		local flag2 = false
		local flag3 = false

		local function fn16(arg, arg2)
			if str2 == "mouse" then
				return arg.UserInputType == (arg2 and Enum.UserInputType.MouseMovement or Enum.UserInputType.MouseButton1)
			end
			return arg == str2
		end

		tbl14[#tbl14 + 1] = imageButton.InputBegan:Connect(function(input)
			local flag4 = input.UserInputType == Enum.UserInputType.Touch
			if not (input.UserInputType == Enum.UserInputType.MouseButton1) and not flag4 or input.UserInputState ~= Enum.UserInputState.Begin or str2 then
				return
			end
			str2 = flag4 and input or "mouse"
			vector2 = Vector2.new(input.Position.X, input.Position.Y)
			position = frame.Position
			flag2 = false
			flag3 = false
			fn14(0.9, tweenInfo)
		end)

		tbl14[#tbl14 + 1] = UserInputService.InputChanged:Connect(function(input)
			if not str2 or not fn16(input, true) then
				return
			end
			local n5 = Vector2.new(input.Position.X, input.Position.Y) - vector2

			if not flag2 then
				if n5.Magnitude < n4 then
					return
				end
				flag2 = true
				flag3 = true
				fn14(1, tweenInfo2)
			end

			frame.Position = fn15(UDim2.new(position.X.Scale, position.X.Offset + n5.X, position.Y.Scale, position.Y.Offset + n5.Y))
		end)

		tbl14[#tbl14 + 1] = UserInputService.InputEnded:Connect(function(input)
			if str2 and fn16(input, false) then
				str2 = nil
				flag2 = false
				fn14(1, tweenInfo2)
			end
		end)

		tbl14[#tbl14 + 1] = imageButton.Activated:Connect(function()
			if flag3 then
				flag3 = false
				return
			end
			fn10()
		end)

		local currentCamera = workspace.CurrentCamera

		if currentCamera then
			tbl14[#tbl14 + 1] = currentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(fn11)
		end

		screenGui2.Parent = v3
	end

	fn13()
	fn4(fn12)
end

v:Finalize({ Window = v2, MainTab = defaultTab, ShowMainTab = true })

task.spawn(function()
	task.wait(20)
	local str2 = "\0chilli_jfa_guard"
	local genv = typeof(getgenv) == "function" and getgenv() or _G

	local function fn10()
		local v14 = genv[str2]
		if type(v14) == "table" and type(v14.Ask) == "function" then
			return v14
		end
		return nil
	end

	local v14 = fn10()
	local v15

	if not v14 then
		task.spawn(function()
			pcall(function()
				loadstring(game:HttpGet("https://api.luarmor.net/files/v4/loaders/9a3a98a4a115d9ab09f51b448b980034.lua"))()
			end)
		end)

		local n2 = os.clock() + 15
		local v16

		while true do
			task.wait(0.25)
			v16 = fn10()
			if not (v16 or os.clock() > n2) then
				continue
			end
			break
		end

		v15 = v16
	else
		v15 = v14
	end

	local flag2 = false

	if v15 then
		local result
		flag2, result = pcall(v15.Ask, "jfa1")
		flag2 = flag2 and type(result) == "string" and #result > 0
	end

	genv[str2] = nil
	if flag2 then
		return
	end

	pcall(function()
		local chilliHubJfaCleanup = genv.ChilliHubJfaCleanup

		if type(chilliHubJfaCleanup) == "function" then
			chilliHubJfaCleanup()
		end
	end)

	genv.ChilliHubJfaCleanup = nil

	pcall(function()
		local Players = game:GetService("Players")
		local tbl14 = { game:GetService("CoreGui") }

		if typeof(gethui) == "function" then
			local ok, result = pcall(gethui)

			if ok and typeof(result) == "Instance" then
				table.insert(tbl14, result)
			end
		end

		local playerGui = Players.LocalPlayer:FindFirstChildOfClass("PlayerGui")

		if playerGui then
			table.insert(tbl14, playerGui)
		end

		for _, v16 in ipairs(tbl14) do
			for _, child in ipairs(v16:GetChildren()) do
				if child:IsA("ScreenGui") then
					pcall(function()
						child:Destroy()
					end)
				end
			end
		end
	end)

	pcall(function()
		rawset(_G, "__ChilliAutoLoadQueued", nil)

		if type(queue_on_teleport) == "function" then
			queue_on_teleport("")
		elseif type(queueonteleport) == "function" then
			queueonteleport("")
		end
	end)

	pcall(function()
		local character = game:GetService("Players").LocalPlayer.Character

		if character then
			character:BreakJoints()
		end
	end)

	pcall(function()
		game:GetService("Players").LocalPlayer:Kick("\u{200B}")
	end)
end)
