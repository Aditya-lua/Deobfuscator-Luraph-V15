repeat
	task.wait()
until game:IsLoaded()

local tbl

tbl = {
	IsDetected = false,
	_unpack = function(arg, arg2, arg3)
		arg2 = arg2 or 1
		arg3 = arg3 or #arg
		if arg3 < arg2 then
			return
		end
		return arg[arg2], tbl._unpack(arg, arg2 + 1, arg3)
	end,
	_pcall = function(arg, ...)
		local tbl2 = { ... }

		local ok, result = pcall(function()
			return arg(tbl._unpack(tbl2))
		end)

		if not ok then
			return false, result
		end
		return true, result
	end,
}

local function fn()
	return true
end

local v, v2 = tbl._pcall(debug.info, fn, "f")

if not v or v2 ~= fn then
	tbl.IsDetected = true
	LPH_CRASH()
end

local v3, v4 = tbl._pcall(debug.info, 2, "f")

if not v3 or v4 ~= pcall then
	tbl.IsDetected = true
	LPH_CRASH()
end

local v5 = (cloneref or function(arg)
	return arg
end)(game:GetService("RunService"))

if v5:IsStudio() then
	tbl.IsDetected = true
	LPH_CRASH()
end

if v5:IsServer() then
	tbl.IsDetected = true
	LPH_CRASH()
end

if tbl.IsDetected then
	return
end

loadstring([[ 
  function LPH_NO_VIRTUALIZE(f) return f end;
  function LPH_JIT_MAX(f) return f end;
  function LPH_JIT(f) return f end;

  function LPH_ENCNUM(n, ...) return n end;
  function LPH_ENCSTR(s, ...) return s end;
  function LPH_ENCFUNC(f, ...) return f end;
  function LPH_ENCBUF(b, ...) return b end;

  function LPH_ATTRIBUTES(...) end;
  function LPH_REWRITE(expr, ...) return expr end;
  function LPH_STACKALLOC(size, zeroOrOne) return {} end;
  function LPH_PRECHECK(...) end;

  function VM(...) end;
  function PRESET(...) end;
  function ENCRYPT(...) end;
  function OPTIMIZE(...) end;
  function ERROR_HANDLING(...) end;
  function TRANSFORM(...) end;
  NONE, OPAL, ONYX = 0, 1, 2;
  FAST, SECURE = 0, 1;
  CONTROL_FLOW, EXTRACT, INLINE, UNROLL, NO_UPVALUES, level = 0, 0, 0, 0, 0, 0;
]])()

local function fn2()
	local Players = game:GetService("Players")
	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	local UserInputService = game:GetService("UserInputService")
	local GuiService = game:GetService("GuiService")
	local virtualInputManager = Instance.new("VirtualInputManager")
	local RunService = game:GetService("RunService")
	local Lighting = game:GetService("Lighting")
	game:GetService("VirtualUser")
	local HttpService = game:GetService("HttpService")
	local CollectionService = game:GetService("CollectionService")
	local TeleportService = game:GetService("TeleportService")
	game:GetService("TweenService")
	game:GetService("PathfindingService")
	local CoreGui = game:GetService("CoreGui")
	local localPlayer = Players.LocalPlayer
	local playerGui = localPlayer:WaitForChild("PlayerGui")
	local heartbeat = RunService.Heartbeat

	local tbl2 = {
		Enabled = { IsTeleporting = false },
		Module = {},
		Connections = {},
		Cached = {
			JSON = {},
			Count = { WalkSpeed = 0, NoClip = 0 },
			Image = {},
			Cached_Decompiled = {},
			ESP = {},
			UserId = {},
			VIPServer = false,
		},
		Stored = {
			Teleport_Handler = {
				Gold_Seed = false,
				Rainbow_Seed = false,
				Dropped_Item = false,
				Mega_Seed = false,
				Buy_Pet = false,
				Steal_Fruit = false,
				Steal_BestFruit = false,
			},
			Saved_Position = { Trowel = nil, PlantSeed = nil, PlaceSprinkler = nil, PottedPlant = nil },
			Fling = nil,
			Connections = {},
			Weather_Path = {},
			SeedStockParagraph = nil,
			SeedNotified = {},
			GearStockParagraph = nil,
			GearNotified = {},
			AuctionUI = {},
			HidePlant = { Tree = {}, Fruit = {} },
			RemoveOwnerGarden = {},
		},
	}

	local module = tbl2.Module
	local cached = tbl2.Cached
	local stored = tbl2.Stored
	local enabled = tbl2.Enabled

	local function fn3(arg, arg2)
		local StarterGui = game:GetService("StarterGui")
		local name = localPlayer.Name

		if name == "fanoffgteev999" or name == "KXbMrzy" or name == "blacjacqv" or name == "asuhdpas9gudhas9h" then
			StarterGui:SetCore("SendNotification", { Title = arg2 or "", Text = arg, Icon = "rbxassetid://0", Duration = 5 })
		end
	end

	local function fn4(arg)
		local ok, result = pcall(function()
			return (load or loadstring)(game:HttpGet(arg))()
		end)

		if ok then
			return result
		end
	end

	local fn5 = require or function()
	end

	local fn6 = fireproximityprompt or function(arg)
		if arg:IsA("ProximityPrompt") then
			arg.KeyboardKeyCode = Enum.KeyCode.C
			arg.HoldDuration = 0
			virtualInputManager:SendKeyEvent(true, Enum.KeyCode.C, false, game)
			task.wait()
			virtualInputManager:SendKeyEvent(false, Enum.KeyCode.C, false, game)
		end
	end

	local function fn7(arg)
		if not arg or not arg:IsA("ProximityPrompt") then
			return
		end
		arg.HoldDuration = 0
		replicatesignal(arg.ButtonHoldBeganActionReplicated, localPlayer)
		task.wait(arg.HoldDuration + 0.05)
		replicatesignal(arg.ButtonHoldEndedActionReplicated, localPlayer)
		replicatesignal(arg.TriggeredActionReplicated, localPlayer)
		replicatesignal(arg.TriggerEndedActionReplicated, localPlayer)
	end

	string.lower((identifyexecutor or getnameexecutor or function()
		return "Unknown"
	end)())

	local function fn8(arg)
		return (arg:gsub(".", function(arg2)
			local v6 = arg2:byte()
			local str = ""

			for i = 8, 1, -1 do
				str ..= v6 % 2 ^ i - v6 % 2 ^ (i - 1) > 0 and "1" or "0"
			end

			return str
		end) .. "0000"):gsub("%d%d%d?%d?%d?%d?", function(arg2)
			if #arg2 < 6 then
				return ""
			end
			local n = 0

			for i = 1, 6 do
				n += arg2:sub(i, i) == "1" and 2 ^ (6 - i) or 0
			end

			return ("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"):sub(n + 1, n + 1)
		end) .. ({ "", "==", "=" })[#arg % 3 + 1]
	end

	local fn9 = decompile or function(arg)
		local ok, result = pcall(getscriptbytecode, arg)
		if not ok or not result then
			return nil, "Failed to get bytecode"
		end
		local v6 = fn8(result)

		local ok2, result2 = pcall(request, {
			Url = "https://medal.upio.dev/decompile",
			Method = "POST",
			Headers = { ["Content-Type"] = "text/plain" },
			Body = v6,
		})

		if ok2 and result2 and result2.StatusCode == 200 then
			return result2.Body
		end

		local ok3, result3 = pcall(request, {
			Url = "https://api.lua.expert/decompile",
			Method = "POST",
			Headers = { ["Content-Type"] = "application/json" },
			Body = HttpService:JSONEncode({ script = v6 }),
		})

		if ok3 and result3 and result3.StatusCode == 200 then
			return result3.Body
		end
		return nil, string.format("Primary: %s | Fallback: %s", result2 and result2.StatusCode or "Request Failed", result3 and result3.StatusCode or "Request Failed")
	end

	local function fn10(script, arg)
		if cached.Cached_Decompiled[script] then
			return cached.Cached_Decompiled[script]
		end
		local ok, result = pcall(fn5, script)
		if ok and result and next(result) then
			cached.Cached_Decompiled[script] = result
			return result
		end
		local ok2, result2 = pcall(fn9, script)
		if not ok2 or not result2 then
			return
		end

		if arg then
			result2 = arg(result2)
		end

		local ok3, result3 = pcall(loadstring, result2)
		if not ok3 or not result3 then
			return
		end
		local env = getfenv(result3)
		env.script = script
		setfenv(result3, env)
		local ok4, result4 = pcall(result3)
		if ok4 then
			cached.Cached_Decompiled[script] = result4
			return result4
		end
		return nil
	end

	local tbl3 = {
		SHX = fn4("https://raw.githubusercontent.com/AhmadV99/Main/refs/heads/main/Library/Lib_5.5.0.lua"),
		Funcs = (loadstring or load)("local a={}do function a:Toggle(b,c,d,e,f,g,h)c=c or\"\"d=d or\"\"e=e or false;f=f or false;g=g or function()end;h=h or\"\"return b:AddToggle({Title=c,Content=d,Default=e,Callback=g,Saver=f,Warnings=h})end;function a:Button(b,c,d,g,e)c=c or\"\"d=d or\"\"g=g or function()end;e=e or\"\"return b:AddButton({Title=c,Content=d,Callback=g,Warnings=e})end;function a:Dropdown(b,c,d,h,i,e,f,g)c=c or\"\"d=d or\"\"h=h or false;i=i or{}e=e or{}f=f or false;g=g or function()end;return b:AddDropdown({Title=c,Content=d,Multi=h,Options=i,Default=e,Callback=g,Saver=f})end;function a:Textbox(b,c,d,e,f,g)c=c or\"\"d=d or\"\"e=e or\"\"f=f or false;g=g or function()end;return b:AddInput({Title=c,Content=d,Default=e,Callback=g,Saver=f})end;function a:Slider(b,c,d,j,k,l,e,m,f,g)c=c or\"\"d=d or\"\"l=l or 0.1;j=j or 0.1;k=k or 1;e=e or 0;f=f or false;m=m or false;g=g or function()end;return b:AddSlider({Title=c,Content=d,Increment=l,Min=j,Max=k,Default=e,AutoUpdate=m,Callback=g,Saver=f})end end;return a")(),
	}

	local shx = tbl3.SHX
	local funcs = tbl3.Funcs

	local function fn11()
		local tbl4

		tbl4 = {
			API = {},
			MailBox_Gear = {
				["Common Watering Can"] = "WateringCans",
				["Common Sprinkler"] = "Sprinklers",
				["Rare Sprinkler"] = "Sprinklers",
				["Uncommon Sprinkler"] = "Sprinklers",
				["Legendary Sprinkler"] = "Sprinklers",
				["Super Sprinkler"] = "Sprinklers",
				Trowel = "Trowels",
				["Speed Mushroom"] = "Mushrooms",
				["Jump Mushroom"] = "Mushrooms",
				Gnome = "Gnomes",
				["Shrink Mushroom"] = "Mushrooms",
				["Supersize Mushroom"] = "Mushrooms",
				["Invisibility Mushroom"] = "Mushrooms",
				["Super Watering Can"] = "WateringCans",
				["Basic Pot"] = "EmptyPots",
				["Super Syrup Sprinkler"] = "Sprinklers",
				["Super Syrup Watering Can"] = "WateringCans",
			},
			WeatherData = {
				"Rain",
				"Lightning",
				"Rainbow",
				"Snowfall",
				"Starfall",
				"Aurora",
				"Sunburst",
				"Bloodmoon",
				"Goldmoon",
				"Rainbow Moon",
				"Mega Moon",
			},
			GetMagnitude = function(arg)
				local character = localPlayer and localPlayer.Character
				character = character and character.PrimaryPart
				local position = typeof(arg) == "CFrame" and arg.Position or arg
				if character then
					return (character.Position - position).Magnitude
				end
				return math.huge
			end,
			GetTo = function(arg)
				local character = localPlayer and localPlayer.Character

				if character and not enabled.IsTeleporting then
					character:PivotTo(arg)
				end
			end,
			GetOwnerPlot = function(arg)
				local gardens = workspace:FindFirstChild("Gardens")
				if not gardens then
					return
				end

				for _, v6 in gardens:GetChildren() do
					if v6:GetAttribute("Owner") ~= (arg or localPlayer.Name) then
						continue
					end
					return v6
				end

				return nil
			end,
			IsPrivateServer = function()
				if cached.VIPServer then
					return true
				end

				local ok, result = pcall(function()
					return game:GetService("RobloxReplicatedStorage").GetServerType:InvokeServer()
				end)

				if ok and result == "VIPServer" then
					cached.VIPServer = true
					return true
				end
				return false
			end,
			Kick = function(text)
				localPlayer:Kick(text)
				local flag = false

				repeat
					task.wait()

					pcall(function()
						local errorPrompt = CoreGui.RobloxPromptGui.promptOverlay.ErrorPrompt
						errorPrompt.TitleFrame.ErrorTitle.Text = "Speed Hub X"
						errorPrompt.MessageArea.ErrorFrame.ErrorMessage.Text = text

						if errorPrompt.MessageArea.ErrorFrame.ErrorMessage.Text == text then
							flag = true
						end
					end)
				until flag
			end,
			GetOwnerPlotId = function()
				local gardens = workspace:FindFirstChild("Gardens")
				if not gardens then
					return
				end

				for _, v6 in gardens:GetChildren() do
					local name = localPlayer.Name
					if v6:GetAttribute("Owner") ~= name then
						continue
					end
					return (tonumber(string.match(v6.Name, "%d+")))
				end

				return nil
			end,
			Webhook = function(arg, arg2)
				local request_ = request or syn and syn.request or http and http.request or fluxus and fluxus.request or http_request
				if not request_ then
					return
				end

				request_({
					Url = arg,
					Body = HttpService:JSONEncode(arg2),
					Method = "POST",
					Headers = { ["Content-Type"] = "application/json" },
				})
			end,
			ClickUI = function(selectedObject)
				selectedObject.Selectable = true
				GuiService.AutoSelectGuiEnabled = false
				GuiService.GuiNavigationEnabled = true

				if selectedObject and selectedObject:IsDescendantOf(game) then
					GuiService.SelectedObject = selectedObject
					task.wait()

					if GuiService.SelectedObject == selectedObject then
						virtualInputManager:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
						virtualInputManager:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
					end

					task.wait()
				end

				GuiService.AutoSelectGuiEnabled = true
				GuiService.GuiNavigationEnabled = false
				GuiService.SelectedObject = nil
			end,
			IsAlive = function(arg)
				local humanoid = arg:FindFirstChild("Humanoid")
				return humanoid and humanoid.Health > 0
			end,
			GetImageURL = function(arg)
				if cached.Image[arg] then
					return cached.Image[arg]
				end

				local match = request({
					Url = "https://thumbnails.roblox.com/v1/assets?assetIds=" .. tostring(arg):gsub("rbxassetid://", "") .. "&size=420x420&format=Png&isCircular=false",
					Method = "GET",
				}).Body:match("\"imageUrl\"%s*:%s*\"(.-)\"")

				if not match then
					return nil
				end
				cached.Image[arg] = match
				return match
			end,
			GetUserIdFromAPI = function(arg)
				if cached.UserId[arg] then
					return cached.UserId[arg]
				end

				local ok, result = pcall(function()
					return Players:GetUserIdFromNameAsync(arg)
				end)

				if not ok or not result then
					return nil
				end

				if typeof(result) == "number" then
					cached.UserId[arg] = result
					return result
				end
				return nil
			end,
			GetSeedData = function(arg)
				local v6 = fn10(ReplicatedStorage.SharedModules.SeedData, function(arg2)
					return (arg2:gsub("script%.SeedImages", "game:GetService(\"ReplicatedStorage\").SharedModules.SeedData.SeedImages"):gsub("script%.PlantImages", "game:GetService(\"ReplicatedStorage\").SharedModules.SeedData.PlantImages"):gsub("script%.FruitImages", "game:GetService(\"ReplicatedStorage\").SharedModules.SeedData.FruitImages"))
				end)

				if not arg then
					return nil
				end

				for _, v7 in v6, nil, nil do
					if v7.SeedName == arg then
						return v7
					end
				end

				return nil
			end,
			GetPetData = function(arg)
				local v6 = fn10(ReplicatedStorage.SharedData.PetData, function(arg2)
					return (arg2:gsub("require%b()", "{}"))
				end)

				if not arg then
					return nil
				end

				for k, v7 in v6, nil, nil do
					if k == arg then
						return v7
					end
				end

				return nil
			end,
			FruitFilter = function(arg, arg2, arg3)
				local tbl5 = arg[1] or {}
				local tbl6 = arg[2] or {}
				local tbl7 = arg[3] or {}
				local tbl8 = arg[4] or {}
				local v6 = tbl8[1]
				local v7 = tbl8[2]
				local v8 = tbl8[3]
				local flag = arg[5] or false
				local tbl9 = arg[6] or {}
				local v9 = tbl9[1]
				local v10 = tbl9[2]
				local v11 = tbl9[3]
				local attribute = arg2:GetAttribute("FruitName") or arg2:GetAttribute("Fruit") or arg2:GetAttribute("CorePartName") or arg2:GetAttribute("SeedName")
				local v12 = attribute and tbl4.GetSeedData(attribute)
				local rarity = v12 and v12.Rarity
				local attribute2 = arg2:GetAttribute("Mutation")
				local flag2 = #tbl5 > 1 and not table.find(tbl5, "None")
				local flag3 = #tbl6 > 1 and not table.find(tbl6, "None")
				local flag4 = #tbl7 > 1 and not table.find(tbl7, "None")
				local flag5 = type(v7) == "number" and v7 > 0
				local flag6 = type(v10) == "number" and v10 > 0

				local function fn12()
					if not flag5 then
						return true
					end

					if type(v8) ~= "number" then
						return false
					end

					if v6 == "Above" then
						return v8 >= v7
					end
					return v8 <= v7
				end

				local function fn13()
					if not v10 then
						return true
					end

					if type(v11) ~= "number" then
						return false
					end

					if v9 == "Above" then
						return v11 >= v10
					end
					return v11 <= v10
				end

				return ((function()
					if flag2 and table.find(tbl5, attribute) then
						if arg3 == "Blacklist" then
							return false
						end
					elseif flag2 then
						if arg3 ~= "Blacklist" then
							return false
						end
					end

					if flag3 and table.find(tbl6, rarity) then
						if arg3 == "Blacklist" then
							return false
						end
					elseif flag3 then
						if arg3 ~= "Blacklist" then
							return false
						end
					end

					if flag4 and table.find(tbl7, attribute2) then
						if arg3 == "Blacklist" then
							return false
						end
					elseif flag4 then
						if arg3 ~= "Blacklist" then
							return false
						end
					end

					if flag5 and not fn12() then
						return false
					end

					if flag and (attribute2 == nil or attribute2 == "") then
						return false
					end

					if flag6 and not fn13() then
						return false
					end
					return flag2 or flag3 or flag4 or flag5
				end)())
			end,
			PetFilter = function(arg, arg2, arg3)
				local tbl5 = arg[1] or {}
				local tbl6 = arg[2] or {}
				local tbl7 = arg[3] or {}
				local attribute = arg2:GetAttribute("PetName") or arg2:GetAttribute("Pet")
				local attribute2 = arg2:GetAttribute("Rarity")
				local rarity

				if attribute2 then
					rarity = attribute2
				else
					rarity = tbl4.GetPetData(attribute) and tbl4.GetPetData(attribute).Rarity
				end

				local attribute3 = arg2:GetAttribute("PetSize")
				local flag = #tbl5 > 1 and not table.find(tbl5, "None")
				local flag2 = #tbl6 > 1 and not table.find(tbl6, "None")
				local flag3 = #tbl7 > 1 and not table.find(tbl7, "None")

				return ((function()
					if flag and table.find(tbl5, attribute) then
						if arg3 == "Blacklist" then
							return false
						end
					elseif flag then
						if arg3 ~= "Blacklist" then
							return false
						end
					end

					if flag2 and table.find(tbl6, rarity) then
						if arg3 == "Blacklist" then
							return false
						end
					elseif flag2 then
						if arg3 ~= "Blacklist" then
							return false
						end
					end

					if flag3 and table.find(tbl7, attribute3) then
						if arg3 == "Blacklist" then
							return false
						end
					elseif flag3 then
						if arg3 ~= "Blacklist" then
							return false
						end
					end

					return flag or flag2 or flag3
				end)())
			end,
		}

		local function fn12()
			local function fn13(arg)
				if not arg then
					return ""
				end
				return arg:gsub("Priority%s*", "")
			end

			local function fn14(arg)
				if not arg or arg == 0 or arg == "None" then
					return math.huge
				end
				return tonumber(arg) or math.huge
			end

			local tbl5

			tbl5 = {
				Priority = {},
				Current = nil,
				LastUpdated = 0,
				LastTP = 0,
				LastCF = nil,
				SetNoClip = function(arg)
					if enabled["No Clip"] then
						return
					end
					local character = localPlayer and localPlayer.Character
					if not character or not tbl4.IsAlive(character) then
						return
					end

					for _, child in pairs(character:GetChildren()) do
						if child:IsA("BasePart") then
							child.CanCollide = not arg
						end
					end
				end,
				SetPriority = function(arg, arg2)
					tbl5.Priority[fn13(arg)] = fn14(arg2)
				end,
				Reset = function(arg)
					if not tbl5.Current then
						return
					end

					if fn13(tbl5.Current) == fn13(arg) then
						tbl5.Current = nil
						tbl5.LastUpdated = 0
					end
				end,
				Stop = function()
					local v6 = tbl5

					if v6.ActiveConnection then
						pcall(coroutine.close, v6.ActiveConnection)
						v6.ActiveConnection = nil
					end

					v6.Current = nil
					v6.LastUpdated = 0
					local character = localPlayer and localPlayer.Character
					character = character and character.PrimaryPart

					if character then
						character.AssemblyLinearVelocity = Vector3.zero
						character.AssemblyAngularVelocity = Vector3.zero
					end
				end,
				TweenTo = function(lastCF, arg, arg2, arg3, arg4, arg5)
					local v6 = tbl5
					arg3 = arg3 or false
					local character = localPlayer.Character
					if not character then
						return nil
					end
					local primaryPart = character.PrimaryPart
					local humanoid = character:FindFirstChildOfClass("Humanoid")
					local n = (humanoid and humanoid.WalkSpeed or 16) * (enabled["Base Tween Speed"] or 1.5)
					local flag = not tbl4.IsAlive(character)

					if not flag then
						local lastTP = v6.LastTP
						flag = tick() - lastTP < 1 and lastCF == v6.LastCF
					end

					if flag then
						return nil
					end

					if not primaryPart then
						return nil
					end

					if v6.ActiveConnection then
						coroutine.close(v6.ActiveConnection)
						v6.ActiveConnection = nil
					end

					v6.LastTP = tick()
					v6.LastCF = lastCF

					v6.ActiveConnection = coroutine.create(function()
						local position = primaryPart.Position
						local position2 = typeof(lastCF) == "CFrame" and lastCF.Position or lastCF
						local magnitude = (position2 - position).Magnitude

						while true do
							if not (not tbl4.IsAlive(localPlayer.Character) or arg and not enabled[arg] or shx.Unloaded) then
								if not (arg3 and magnitude <= 2.5) then
									if not primaryPart.Anchored then
										if not (arg5 and arg5()) then
											local n2 = n * RunService.Heartbeat:Wait()
											local n3 = position2 - position
											local magnitude2 = n3.Magnitude

											if magnitude2 <= n2 or magnitude2 <= 0.05 then
												position = position2
											else
												position += n3 / magnitude2 * n2
											end

											magnitude = (position2 - position).Magnitude

											if arg4 then
												v6.SetNoClip(true)
											end

											primaryPart.CFrame = arg2 and CFrame.new(position, arg2) or CFrame.new(position)
											primaryPart.AssemblyLinearVelocity = Vector3.zero
											primaryPart.AssemblyAngularVelocity = Vector3.zero
											continue
										end
									end
								end
							end

							break
						end
					end)

					coroutine.resume(v6.ActiveConnection)
				end,
				GetTo = function(...)
					local v6 = table.pack(...)
					local v7 = localPlayer
					local character

					if localPlayer then
						character = localPlayer.Character
					else
						character = v7
					end

					if not character then
						return
					end
					local v8 = ({ ... })[2]

					local function fn15(...)
						local v9 = table.pack(...)
						local tbl6 = { ... }
						local selectMode = enabled["Select Mode"]

						if selectMode == "Teleport" then
							character:PivotTo(typeof(tbl6[1]) == "Vector3" and CFrame.new(tbl6[1]) or tbl6[1])
						elseif selectMode == "Teleporter (Tool)" then
							tbl4.Networker.Fire("UseTeleporter", typeof(tbl6[1]) == "CFrame" and tbl6[1].Position or tbl6[1])
						else
							tbl5.TweenTo(table.unpack(v9, 1, v9.n))
						end
					end

					local v9 = fn13(v8)

					if not enabled["Enable Stack Farming"] then
						tbl5.Current = nil
						fn15(table.unpack(v6, 1, v6.n))
						return
					end

					if not enabled[v8] then
						return
					end

					if tbl5.Current and not enabled[tbl5.Current] then
						tbl5.Current = nil
					end

					local priority = tbl5.Priority
					local v10 = fn14(priority[v9])

					if not tbl5.Current then
						tbl5.Current = v8
						tbl5.LastUpdated = os.clock()
						fn15(table.unpack(v6, 1, v6.n))
						return
					end

					if fn13(tbl5.Current) == v9 then
						tbl5.LastUpdated = os.clock()
						fn15(table.unpack(v6, 1, v6.n))
						return
					end

					if v10 < fn14(priority[fn13(tbl5.Current)]) then
						tbl5.Current = v8
						tbl5.LastUpdated = os.clock()
						fn15(table.unpack(v6, 1, v6.n))
					end
				end,
			}

			return tbl5
		end

		tbl4.TeleportManager = fn12()

		local function fn13()
			return { GetPlantList = function(arg, arg2, arg3, arg4, arg5)
				arg3 = arg3 or false
				arg4 = arg4 or false
				arg5 = arg5 or false

				for _, child in ipairs(arg:GetChildren()) do
					if child:IsA("Model") then
						local function fn14(arg6, arg7)
							if arg3 or arg7 and arg7.Enabled then
								arg2[#arg2 + 1] = arg6
							end
						end

						if not arg5 then
							local fruits = child:FindFirstChild("Fruits")

							if fruits then
								for _, child2 in ipairs(fruits:GetChildren()) do
									local harvestPart = child2:FindFirstChild("HarvestPart")
									harvestPart = harvestPart and harvestPart:FindFirstChildWhichIsA("ProximityPrompt")

									if harvestPart then
										fn14(child2, harvestPart)
									end
								end
							end
						end

						if not arg4 then
							local harvestPart = child:FindFirstChild("HarvestPart")
							harvestPart = harvestPart and harvestPart:FindFirstChildWhichIsA("ProximityPrompt")

							if harvestPart then
								fn14(child, harvestPart)
							end
						end
					end
				end

				return arg2
			end }
		end

		tbl4.Collection = fn13()

		local function fn14()
			local function fn15()
				local tbl5 = { Phases = {}, NightPhase = nil, CycleLength = 0, ServerOffset = nil, Ready = false }
				local sharedModules = ReplicatedStorage:FindFirstChild("SharedModules")
				sharedModules = sharedModules and sharedModules:FindFirstChild("TimeCycleData")
				sharedModules = sharedModules and fn10(sharedModules)

				if sharedModules and sharedModules.Data then
					for k, v6 in pairs(sharedModules.Data) do
						table.insert(tbl5.Phases, {
							Name = k,
							Weathers = v6.Weathers,
							Duration = tonumber(v6.Lasts) or 0,
							Order = v6.StartOrder,
						})
					end

					table.sort(tbl5.Phases, function(arg, arg2)
						return arg.Order < arg2.Order
					end)

					for _, phase in ipairs(tbl5.Phases) do
						tbl5.CycleLength = tbl5.CycleLength + phase.Duration

						if phase.Name == "Night" then
							tbl5.NightPhase = phase
						end
					end

					if tbl5.CycleLength <= 0 then
						tbl5.CycleLength = 600
					end

					tbl5.Ready = true
				end

				tbl5.GetServerOffset = function()
					if tbl5.ServerOffset then
						return tbl5.ServerOffset
					end
					local tbl6 = {}

					for i = 1, 5 do
						local now = os.time()
						local serverTimeNow = workspace:GetServerTimeNow()

						if now == os.time() then
							table.insert(tbl6, now - serverTimeNow)
						end

						task.wait(0.05)
					end

					if #tbl6 > 0 then
						local n = 0

						for _, v6 in ipairs(tbl6) do
							n += v6
						end

						tbl5.ServerOffset = math.round(n / #tbl6)
					else
						local v6 = workspace
						tbl5.ServerOffset = math.round(os.time() - v6:GetServerTimeNow())
					end

					return tbl5.ServerOffset
				end

				tbl5.PickWeather = function(arg, arg2)
					if not arg or not arg.Weathers then
						return nil
					end
					local v6 = Random.new(arg2)
					local n = 0

					for _, weather in pairs(arg.Weathers) do
						n += weather.Chance or 0
					end

					if n <= 0 then
						return nil
					end
					local n2 = v6:NextNumber() * n
					local n3 = 0

					for k, weather in pairs(arg.Weathers) do
						n3 += weather.Chance or 0
						if n2 <= n3 then
							return k
						end
					end

					local v7, v8, v9 = pairs(arg.Weathers)
					local v10 = table.pack(u_1())
					if v10[1] then
						return v10[2]
					end
					return nil
				end

				return tbl5
			end

			local tbl5

			tbl5 = {
				Weather = fn15(),
				FormatTime = function(arg)
					local n = math.max(0, math.floor((tonumber(arg) or 0) + 0.5))
					local n2 = math.floor(n / 86400)
					local n3 = math.floor(n % 86400 / 3600)
					local n4 = math.floor(n % 3600 / 60)
					local n5 = n % 60
					if n2 > 0 then
						return string.format("%dd %02dh %02dm %02ds", n2, n3, n4, n5)
					end

					if n3 > 0 then
						return string.format("%dh %02dm %02ds", n3, n4, n5)
					end

					if n4 > 0 then
						return string.format("%dm %02ds", n4, n5)
					end
					return string.format("%ds", n5)
				end,
				GetWeatherTime = function(arg)
					if not arg then
						return nil
					end
					local weather = tbl5.Weather
					if not weather.Ready then
						return nil
					end
					local attribute = workspace:GetAttribute("ActivePhase")
					local attribute2 = workspace:GetAttribute("PhaseDuration")
					if not attribute or not attribute2 then
						return nil
					end
					local serverTimeNow = workspace:GetServerTimeNow()
					local n = nil

					for i, phase in ipairs(weather.Phases) do
						if phase.Name == attribute then
							n = i
							break
						else
							n = nil
						end
					end

					if not n then
						return nil
					end
					local v6 = weather.Phases[n]
					local flag = weather.PickWeather(v6, math.floor((attribute2 - v6.Duration) / weather.CycleLength) * 1000 + n) == arg
					local n2 = 0

					while n2 < 5000 do
						n2 += 1
						n += 1

						if n > #weather.Phases then
							n = 1
						end

						local v7 = weather.Phases[n]

						if weather.PickWeather(v7, math.floor(attribute2 / weather.CycleLength) * 1000 + n) == arg then
							local n3 = attribute2 - serverTimeNow
							local n4 = math.floor((os.time() + n3) / 60 + 0.5) * 60

							return {
								Name = arg,
								Phase = v7.Name,
								IsActiveNow = flag,
								SecondsAway = n3,
								Formatted = tbl5.FormatTime(n3),
								Unix = n4,
								Date = os.date("%Y/%m/%d %H:%M:%S", n4),
							}
						end

						attribute2 += v7.Duration
					end

					return nil
				end,
			}

			return tbl5
		end

		tbl4.Predicitions = fn14()

		local function fn15()
			local tbl5

			tbl5 = {
				GetShopList = function(arg)
					local tbl6 = { "None" }
					local stockValues = ReplicatedStorage:FindFirstChild("StockValues")
					stockValues = stockValues and stockValues:FindFirstChild(arg)
					if not stockValues then
						return tbl6
					end
					local items = stockValues:FindFirstChild("Items")
					if not items then
						return tbl6
					end

					for _, v6 in items:GetChildren() do
						table.insert(tbl6, v6.Name)
					end

					return tbl6
				end,
				GetPriceShop = function(arg, arg2)
					local v6 = playerGui and playerGui:FindFirstChild(arg)
					if not v6 then
						return nil
					end
					v6 = v6 and v6:FindFirstChild(arg2, true)
					if not v6 then
						return
					end
					local costText = v6:FindFirstChild("Cost_Text", true)
					if costText and costText.Text ~= "NO STOCK" then
						return tbl4.Converter.CorrectNumber(costText.Text)
					end
					return math.huge
				end,
				GetStockGeneric = function(arg, arg2, arg3)
					local leaderstats = localPlayer:FindFirstChild("leaderstats")
					local sheckles = leaderstats and leaderstats:FindFirstChild("Sheckles") or leaderstats and leaderstats:FindFirstChild("Leaves")
					local stockValues = ReplicatedStorage:FindFirstChild("StockValues")
					stockValues = stockValues and stockValues:FindFirstChild(arg)
					if not stockValues then
						return nil
					end
					local items = stockValues:FindFirstChild("Items")
					if not items then
						return nil
					end
					local name = nil

					for _, v6 in items:GetChildren() do
						if v6:IsA("ValueBase") and (arg3 == "no" or type(arg3) == "table" and table.find(arg3, v6.Name) or v6.Name == arg3) then
							local value = v6.Value
							local v7 = tbl5.GetPriceShop(arg, v6.Name)

							if value and value ~= 0 and v7 > 0 and v7 <= sheckles.Value then
								name = v6.Name
								break
							else
								name = nil
							end
						else
							name = nil
						end
					end

					return name
				end,
			}

			return tbl5
		end

		tbl4.Shop = fn15()

		local function fn16()
			return {
				EquipTool = function(arg)
					local character = localPlayer and localPlayer.Character
					character = character and character:FindFirstChild("Humanoid")
					local backpack = localPlayer and localPlayer:FindFirstChild("Backpack")
					backpack = backpack and backpack:FindFirstChild(arg)

					if backpack then
						character:EquipTool(backpack)
					end
				end,
				GetAllTool = function()
					local tbl5 = {}

					for _, child in ipairs(localPlayer.Backpack:GetChildren()) do
						if child:IsA("Tool") or child:IsA("Configuration") then
							table.insert(tbl5, child)
						end
					end

					for _, child in ipairs(localPlayer.Character:GetChildren()) do
						if child:IsA("Tool") or child:IsA("Configuration") then
							table.insert(tbl5, child)
						end
					end

					return tbl5
				end,
				IsMaxInventory = function()
					return localPlayer:GetAttribute("FruitCount") >= localPlayer:GetAttribute("MaxFruitCapacity")
				end,
			}
		end

		tbl4.ToolFunction = fn16()

		local function fn17()
			local tbl5 = {}
			local sharedModules = ReplicatedStorage:WaitForChild("SharedModules")
			local packet = sharedModules:FindFirstChild("Packet")
			local remoteEvent = packet and packet:FindFirstChild("RemoteEvent")
			local ok, result = pcall(fn5, packet and packet:FindFirstChild("Types"))
			local v6 = ok and result or nil
			local ok2, result2 = pcall(fn5, sharedModules:FindFirstChild("Networking"))
			local v7 = ok2 and result2 or nil
			local tbl6 = {}
			local tbl7 = {}
			local fn18 = nil

			fn18 = function(arg)
				if type(arg) ~= "table" or tbl7[arg] then
					return
				end
				tbl7[arg] = true
				if arg.Type == "Packet" and type(arg.Name) == "string" then
					tbl6[arg.Name] = arg
					return
				end

				for _, v8 in pairs(arg) do
					if type(v8) == "table" then
						fn18(v8)
					end
				end
			end

			if v7 then
				fn18(v7)
			end

			tbl5.GetPacket = function(arg)
				local v8 = tbl6[arg]
				if v8 then
					return v8
				end

				if v7 then
					table.clear(tbl6)
					local tbl8 = {}
					local fn19 = nil

					fn19 = function(arg2)
						if type(arg2) ~= "table" or tbl8[arg2] then
							return
						end
						tbl8[arg2] = true
						if arg2.Type == "Packet" and type(arg2.Name) == "string" then
							tbl6[arg2.Name] = arg2
							return
						end

						for _, v9 in pairs(arg2) do
							if type(v9) == "table" then
								fn19(v9)
							end
						end
					end

					fn19(v7)
					v8 = tbl6[arg]
				end

				return v8
			end

			local n = 0
			local n2 = 1

			tbl5.Fire = function(arg, ...)
				local v8 = tbl5.GetPacket(arg)
				if not v8 or not remoteEvent or not v6 then
					return false
				end
				local tbl8 = { ... }
				local writes = v8.Writes

				local ok3, result3, result4 = pcall(function()
					v6.Import({
						BufferLength = 128,
						BufferOffset = 0,
						InstancesOffset = 0,
						Buffer = buffer.create(128),
						Instances = {},
					})

					v6.Writes.NumberU16(v8.Id)

					if v8.ResponseReads then
						n += n2

						if n >= 20 then
							n2 = -1
						elseif n <= 1 then
							n2 = 1
						end

						v6.Writes.NumberU8(n)
					end

					for i = 1, #writes do
						writes[i](tbl8[i])
					end

					return v6.Truncate()
				end)

				if not ok3 or typeof(result3) ~= "buffer" then
					return false
				end

				if result4 then
					remoteEvent:FireServer(result3, result4)
				else
					remoteEvent:FireServer(result3)
				end

				return true
			end

			tbl5.Fire_Network = function(arg)
				if not v7 then
					return
				end
				local v8 = v7

				for i = 1, #arg do
					v8 = v8[arg[i]]
					if not v8 then
						return
					end
				end

				return v8
			end

			return tbl5
		end

		tbl4.Networker = fn17()

		local function fn18()
			if localPlayer:GetAttribute("FruitValue_Client_Initialized") then
				return
			end
			localPlayer:SetAttribute("FruitValue_Client_Initialized", true)

			local tbl5 = { GetPriceId = function(arg)
				local v6 = tbl4.Networker.Fire_Network({ "NPCS", "GetFruitBid" }):Fire(arg)
				if v6 and type(v6.CurrentSellValue) == "number" and v6.CurrentSellValue > 0 then
					return v6.CurrentSellValue
				end
				return nil
			end }

			local function fn19(child)
				if not child:GetAttribute("HarvestedFruit") then
					return
				end

				if not child:GetAttribute("Id") then
					return
				end
				local v6 = tbl5.GetPriceId(child:GetAttribute("Id"))

				if v6 then
					child:SetAttribute("FruitValue", v6)
				end
			end

			task.spawn(function()
				local v6 = tbl4.ToolFunction.GetAllTool()

				for _, v7 in ipairs(v6) do
					fn19(v7)
				end
			end)

			task.spawn(function()
				tbl4.Networker.Fire_Network({ "FruitStock", "Snapshot" }).OnClientEvent:Connect(function()
					task.wait(0.1)
					local v6 = tbl4.ToolFunction.GetAllTool()

					for _, v7 in ipairs(v6) do
						fn19(v7)
					end
				end)
			end)

			localPlayer.Backpack.ChildAdded:Connect(fn19)

			local function fn20(character)
				character.ChildAdded:Connect(fn19)
			end

			if localPlayer.Character then
				fn20(localPlayer.Character)
			end

			localPlayer.CharacterAdded:Connect(fn20)
			return tbl5
		end

		tbl4.FarmPriceFruit = fn18()

		local function fn19()
			local tbl5 = {
				"",
				"K",
				"M",
				"B",
				"T",
				"Qd",
				"Qn",
				"Sx",
				"Sp",
				"O",
				"N",
				"De",
				"Ud",
				"Dd",
				"TdD",
				"QdD",
				"QnD",
				"SxD",
				"SpD",
				"OcD",
				"NvD",
			}

			local tbl6 = {
				TimeToSecond = function(arg)
					local n = 0

					for k, v6 in next, string.split(arg, ":"), nil do
						local n2

						if k == 1 then
							n2 = 60
						else
							n2 = 1
						end

						n += (tonumber(v6) or 0) * n2
					end

					return n
				end,
				Abbreviate = function(arg, arg2)
					local n = arg2 or 1
					local str = ""

					if arg < 0 then
						arg = math.abs(arg)
						str = "-"
					end

					if arg < 1000 then
						return str .. tostring(math.floor(arg))
					end
					local n2 = math.floor(math.log10(arg) / 3)
					local v6 = tbl5[n2 + 1]
					if not v6 then
						return str .. tostring(arg)
					end
					local n3 = 10 ^ n
					return str .. string.format("%." .. n .. "f", math.floor(arg / 10 ^ (n2 * 3) * n3) / n3):gsub("%.?0+$", "") .. v6
				end,
			}

			local function fn20()
				local tbl7 = {}

				for i, v6 in ipairs(tbl5) do
					tbl7[v6:lower()] = 10 ^ ((i - 1) * 3)
				end

				return tbl7
			end

			local v6 = fn20()

			tbl6.CorrectNumber = function(arg)
				if arg == nil then
					return 0
				end
				local match, v7 = tostring(arg):gsub(",", ""):gsub("¢", ""):gsub("%s+", ""):lower():match("^([%d%.]+)(.*)$")
				local num = tonumber(match)
				if not num then
					return 0
				end

				if v7 ~= "" then
					local v8 = v6[v7]

					if v8 then
						num *= v8
					end
				end

				return num
			end

			tbl6.FormatGrams = function(arg)
				return string.format("%.2fkg", math.floor((tonumber(arg) or 0) * 100 + 0.5) / 100)
			end

			return tbl6
		end

		tbl4.Converter = fn19()

		local function fn20()
			local function fn21(arg)
				local fruitStockPrice = playerGui:FindFirstChild("FruitStockPrice")
				if not fruitStockPrice then
					return 0
				end
				local scrollingFrame = fruitStockPrice:FindFirstChild("ScrollingFrame", true)
				if not scrollingFrame then
					return 0
				end

				for _, v6 in scrollingFrame:GetChildren() do
					if not v6:IsA("Frame") then
						continue
					end

					if v6:GetAttribute("SeedToolTip") ~= arg then
						continue
					end
					local multiplier = v6:FindFirstChild("Multiplier", true)
					if not multiplier then
						return 0
					end
					local str = multiplier.Text:gsub("^X", "")
					return tonumber(str) or 0
				end

				return 0
			end

			local tbl5

			tbl5 = {
				BuildValueIndex = function()
					local tbl6 = {}

					for _, v6 in tbl4.ToolFunction.GetAllTool(), nil, nil do
						if v6:GetAttribute("HarvestedFruit") then
							if v6:GetAttribute("Id") then
								local attribute = v6:GetAttribute("FruitValue")

								if attribute and type(attribute) == "number" and attribute > 0 then
									local attribute2 = v6:GetAttribute("FruitName")

									if attribute2 then
										local str = attribute2 .. "|" .. tbl4.Converter.FormatGrams(v6:GetAttribute("Weight"))

										if not tbl6[str] then
											tbl6[str] = attribute
										end
									end
								end
							end
						end
					end

					return tbl6
				end,
				BuildMultiplierMap = function()
					local tbl6 = {}
					local fruitStockPrice = playerGui:FindFirstChild("FruitStockPrice")
					if not fruitStockPrice then
						return tbl6
					end
					local scrollingFrame = fruitStockPrice:FindFirstChild("ScrollingFrame", true)
					if not scrollingFrame then
						return tbl6
					end

					for _, v6 in scrollingFrame:GetChildren() do
						if v6:IsA("Frame") then
							local attribute = v6:GetAttribute("SeedToolTip")

							if attribute then
								local multiplier = v6:FindFirstChild("Multiplier", true)

								if multiplier then
									local v7 = tonumber
									local str = multiplier.Text:gsub("^X", "")
									tbl6[attribute] = v7(str) or 0
								end
							end
						end
					end

					return tbl6
				end,
				GetValueFruit = function(arg, arg2, arg3)
					local n

					if arg2 then
						n = arg2[arg.Name .. "|" .. arg.Weight] or 0
					else
						n = 0

						for _, v6 in tbl4.ToolFunction.GetAllTool(), nil, nil do
							if not v6:GetAttribute("HarvestedFruit") then
								continue
							elseif not v6:GetAttribute("Id") then
								continue
							else
								local name = arg.Name
								local flag = v6:GetAttribute("FruitName") == name

								if flag then
									local weight = arg.Weight
									flag = tbl4.Converter.FormatGrams(v6:GetAttribute("Weight")) == weight
								end

								if flag then
									n = v6:GetAttribute("FruitValue")
									if not (n and type(n) == "number" and n > 0) then
										n = 0
										continue
									end
								else
									continue
								end
							end

							break
						end
					end

					if enabled["Only Use Base Value For ESP Fruit"] then
						arg3 = arg3 and arg3[arg.Name] or fn21(arg.Name)

						if arg3 and arg3 > 0 then
							n /= arg3
						end
					end

					return n
				end,
				AddValue = function(parent, arg, arg2, arg3)
					local v6 = tbl5.GetValueFruit(arg, arg2, arg3)
					local value = parent:FindFirstChild("Value")

					if v6 > 0 then
						if not value then
							value = Instance.new("TextLabel")
							value.Name = "Value"
							value.Size = UDim2.new(1, -10, 0, 16)
							value.Position = UDim2.new(0, 5, 0, 0)
							value.BackgroundTransparency = 1
							value.TextColor3 = Color3.new(0, 1, 0)
							value.TextStrokeTransparency = 0
							value.TextStrokeColor3 = Color3.new(0, 0, 0)
							value.TextSize = 13
							value.ZIndex = 15
							value.Font = Enum.Font.GothamBold
							value.TextXAlignment = Enum.TextXAlignment.Right
							value.TextYAlignment = Enum.TextYAlignment.Top
							value.TextWrapped = true
							value.Parent = parent
						end

						local text = "$" .. tbl4.Converter.Abbreviate(v6)

						if value.Text ~= text then
							value.Text = text
						end
					elseif value then
						value:Destroy()
					end
				end,
				GetTotalFruitValue = function()
					local v6 = nil
					local n = 0

					for _, v7 in tbl4.ToolFunction.GetAllTool(), nil, v6 do
						if v7:GetAttribute("HarvestedFruit") and v7:GetAttribute("FruitValue") then
							n += v7:GetAttribute("FruitValue")
						end
					end

					return n
				end,
			}

			return tbl5
		end

		tbl4.Fruit_Misc = fn20()

		local function fn21()
			return {
				Connections = function(arg, arg2)
					local v6

					return (arg:Connect(function(...)
						if shx.Unloaded then
							if v6 then
								v6:Disconnect()
							end

							return
						end

						local ok, result = pcall(arg2, ...)

						if not ok then
							fn3(result, "")
						end
					end))
				end,
				StartLoop = function(arg, arg2)
					while not shx.Unloaded do
						if enabled[arg] then
							local ok, result = pcall(arg2)

							if not ok then
								fn3(result, arg)
							end
						end

						task.wait()
					end
				end,
				Fallback = function(arg, arg2, arg3)
					local n = cached.Count[arg2] or 0

					if arg ~= nil then
						n += 1
						cached.Count[arg2] = n
					end

					if n > 1 then
						if not enabled[arg2] then
							arg3()
						end
					end
				end,
			}
		end

		tbl4.Utils = fn21()

		tbl4.FlingPlayer = function(fling)
			local character = localPlayer and localPlayer.Character
			if not character then
				return
			end
			local flag = true
			local flag2 = false
			local humanoidRootPart

			if character then
				humanoidRootPart = character:FindFirstChild("HumanoidRootPart") or character:FindFirstChild("Torso") or character.PrimaryPart
			else
				humanoidRootPart = character
			end

			character = character and character:FindFirstChildOfClass("Humanoid")
			if not humanoidRootPart or not character then
				return
			end
			local cFrame = humanoidRootPart.CFrame

			task.spawn(function()
				local n = 0.1

				repeat
					task.wait()
					local velocity = humanoidRootPart.Velocity
					humanoidRootPart.Velocity = velocity * 10000 + Vector3.new(0, 10000, 0)
					RunService.RenderStepped:Wait()
					humanoidRootPart.Velocity = velocity
					RunService.Stepped:Wait()
					humanoidRootPart.Velocity = velocity + Vector3.new(0, n, 0)
					n *= -1
				until not flag

				flag2 = true
			end)

			fling = fling and fling.Character
			local humanoid = fling and fling:FindFirstChildOfClass("Humanoid")
			local humanoidRootPart2 = fling and (fling:FindFirstChild("HumanoidRootPart") or fling:FindFirstChild("Torso") or fling.PrimaryPart)
			local now = tick()

			if humanoid and humanoidRootPart2 then
				while true do
					task.wait()
					local ok = pcall(sethiddenproperty, humanoidRootPart, "PhysicsRepRootPart", humanoidRootPart2)
					stored.Fling = fling
					local magnitude = humanoidRootPart2.Velocity.Magnitude
					local moveDirection = humanoid and humanoid.MoveDirection or Vector3.zero
					local vector_

					if magnitude < 5 or ok then
						vector_ = Vector3.new(0, math.random(-0.5, 0.4), 0)
					else
						local vector_2 = Vector3.new
						vector_ = moveDirection * magnitude / Random.new():NextNumber(0.7, 8) - vector_2(0, math.random(-1, 1), 0)
					end

					local n = CFrame.new(humanoidRootPart2.Position) * CFrame.new(vector_)
					character.Sit = false
					workspace.CurrentCamera.CameraSubject = humanoid
					humanoidRootPart.CFrame = n * CFrame.Angles(math.random(0, 360), 0, 0)
					if not (tick() - now >= 2 or humanoidRootPart2.Velocity.Magnitude > 200 or not humanoidRootPart or not humanoidRootPart.Parent or not humanoidRootPart2 or not humanoidRootPart2.Parent or shx.Unloaded) then
						continue
					end
					break
				end

				stored.Fling = nil
			end

			flag = false
			stored.Fling = nil
			local now2 = tick()

			while true do
				RunService.Stepped:Wait()
				if not (flag2 or tick() - now2 >= 1) then
					continue
				end
				break
			end

			pcall(sethiddenproperty, humanoidRootPart, "PhysicsRepRootPart", nil)

			if humanoidRootPart and humanoidRootPart.Parent then
				humanoidRootPart.AssemblyLinearVelocity = Vector3.zero
				humanoidRootPart.AssemblyAngularVelocity = Vector3.zero
				humanoidRootPart.Velocity = Vector3.zero
				humanoidRootPart.RotVelocity = Vector3.zero
				humanoidRootPart.CFrame = cFrame

				for i = 1, 2 do
					RunService.Stepped:Wait()

					if humanoidRootPart and humanoidRootPart.Parent then
						humanoidRootPart.AssemblyLinearVelocity = Vector3.zero
						humanoidRootPart.CFrame = cFrame
					end
				end
			end

			workspace.CurrentCamera.CameraSubject = character
		end

		tbl4.SeatTeleport = function(arg, arg2)
			local character = localPlayer and localPlayer.Character
			local humanoid = character and character:FindFirstChildOfClass("Humanoid")
			character = character and character:FindFirstChild("HumanoidRootPart")
			if not humanoid or not character then
				return false
			end
			tbl4.TeleportManager.Stop()
			local cframe = typeof(arg) == "CFrame" and arg or typeof(arg) == "Vector3" and CFrame.new(arg) or character.CFrame
			local seat = Instance.new("Seat")
			seat.Name = "SHX_SeatTP"
			seat.Anchored = true
			seat.CanCollide = false
			seat.Transparency = 1
			seat.Size = Vector3.new(2, 1, 2)
			seat.CFrame = cframe
			seat.Parent = workspace
			local weld = Instance.new("Weld")
			weld.Name = "SeatWeld"
			weld.Part0 = seat
			weld.Part1 = character
			weld.C0 = CFrame.new(0, 1.5, 0)
			weld.Parent = character
			humanoid.Sit = true
			humanoid:ChangeState(Enum.HumanoidStateType.Seated)
			RunService.Heartbeat:Wait()

			if arg2 then
				pcall(arg2)
			end

			if weld and weld.Parent then
				weld:Destroy()
			end

			if seat and seat.Parent then
				seat:Destroy()
			end

			humanoid.Sit = false
			humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)

			if character and character.Parent then
				character.CFrame = cframe
				character.AssemblyLinearVelocity = Vector3.zero
				character.AssemblyAngularVelocity = Vector3.zero
			end

			return true
		end

		local function fn22()
			local tbl5

			tbl5 = {
				Called = false,
				_Cache = { Server = {} },
				_LastRequest = 0,
				Handler_Cursor = function()
					local fn23 = writefile or function()
					end

					local fn24 = readfile or function()
						return ""
					end

					local fn25 = isfile or function()
						return false
					end

					local placeId = game.PlaceId

					if isfolder and not isfolder("Speed Hub X Server System") then
						pcall(makefolder, "Speed Hub X Server System")
					end

					local str = "Speed Hub X Server System" .. "/Cached_Server_" .. placeId .. ".json"
					local str2 = "Speed Hub X Server System" .. "/Cursor_" .. placeId .. ".txt"
					local now = os.time()
					local lastRequest = tbl5._LastRequest
					if tick() - lastRequest < 2 then
						return tbl5._Cache
					end
					tbl5._LastRequest = tick()

					if fn25(str) then
						local ok, cache = pcall(function()
							return HttpService:JSONDecode(fn24(str))
						end)

						if ok and cache then
							if now - (cache.Cached_Time or 0) < 80 then
								tbl5._Cache = cache
								return cache
							end
						end
					end

					local v6 = fn25(str2) and fn24(str2) or nil
					local str3 = ("https://games.roblox.com/v1/games/" .. placeId .. "/servers/Public?sortOrder=Asc&limit=100") .. (v6 and "&cursor=" .. v6 or "")

					local ok, result = pcall(function()
						return game:HttpGet(str3)
					end)

					if not ok or not result then
						return tbl5._Cache
					end
					local data = HttpService:JSONDecode(result)
					pcall(fn23, str2, data.nextPageCursor or "")
					local cache = { Cached_Time = now, Server = data.data or {} }
					pcall(fn23, str, HttpService:JSONEncode(cache))
					tbl5._Cache = cache
					return cache
				end,
				Handler_Server = function(arg)
					local jobId = game.JobId
					local v6 = tbl5.Handler_Cursor()
					local tbl6 = {}
					if not v6 or not v6.Server then
						return tbl6
					end
					arg = arg or false

					for _, v7 in ipairs(v6.Server) do
						local id = v7.id

						if id and id ~= jobId then
							local playing = v7.playing or 0
							local maxPlayers = v7.maxPlayers or 0

							if playing < maxPlayers then
								if arg then
									if playing >= maxPlayers * 0.7 and playing < maxPlayers then
										tbl6[#tbl6 + 1] = v7
									end
								else
									tbl6[#tbl6 + 1] = v7
								end
							end
						end
					end

					return tbl6
				end,
				Hop = function(arg)
					local v6 = tbl5.Handler_Server(arg)

					if #v6 > 0 then
						local v7 = v6[math.random(1, #v6)]
						if not v7 or not v7.id then
							return
						end
						TeleportService:TeleportToPlaceInstance(game.PlaceId, v7.id)
						tbl5.Called = true
					end
				end,
			}

			TeleportService.TeleportInitFailed:Connect(function(arg)
				if arg ~= localPlayer then
					return
				end

				if not tbl5.Called then
					return
				end
				tbl5.Called = false
				tbl5.Hop()
			end)

			return tbl5
		end

		tbl4.Server_Hop = fn22()

		local function fn23()
			return {
				CreateESP = function(parent, arg)
					if not parent or not arg then
						return
					end

					if parent:FindFirstChild("ESP") then
						return
					end
					cached.ESP[parent] = arg
					local primaryPart = parent:IsA("Model") and (parent.PrimaryPart or parent:FindFirstChildWhichIsA("BasePart")) or parent
					if not primaryPart then
						return
					end
					local folder = Instance.new("Folder")
					folder.Name = "ESP"
					folder.Parent = parent
					local boxHandleAdornment = Instance.new("BoxHandleAdornment")
					boxHandleAdornment.Name = "ESP"
					boxHandleAdornment.Size = Vector3.new(1, 0, 1)
					boxHandleAdornment.Transparency = 1
					boxHandleAdornment.AlwaysOnTop = false
					boxHandleAdornment.ZIndex = 0
					boxHandleAdornment.Adornee = primaryPart
					boxHandleAdornment.Parent = folder
					local billboardGui = Instance.new("BillboardGui")
					billboardGui.Adornee = primaryPart
					billboardGui.Size = UDim2.new(0, 100, 0, 150)
					billboardGui.StudsOffset = Vector3.new(0, 1, 0)
					billboardGui.AlwaysOnTop = true
					billboardGui.Parent = boxHandleAdornment
					billboardGui.Enabled = arg.Enabled or true
					local textLabel = Instance.new("TextLabel")
					textLabel.BackgroundTransparency = 1
					textLabel.Position = UDim2.new(0, 0, 0, -50)
					textLabel.Size = UDim2.new(0, 100, 0, 100)
					textLabel.TextSize = 10
					textLabel.TextColor3 = arg.Color or Color3.fromRGB(255, 255, 0)
					textLabel.TextStrokeTransparency = 0
					textLabel.TextYAlignment = Enum.TextYAlignment.Bottom
					textLabel.RichText = true
					textLabel.Text = arg.Text or ""
					textLabel.ZIndex = 15
					textLabel.Parent = billboardGui

					if arg.Highlight and arg.Highlight.Enabled then
						local highlight = Instance.new("Highlight")
						highlight.Name = "ESPHighlight"
						highlight.FillColor = arg.Highlight.Color or Color3.fromRGB(255, 255, 255)
						highlight.OutlineColor = arg.Highlight.Color or Color3.fromRGB(255, 255, 255)
						highlight.FillTransparency = 0.5
						highlight.OutlineTransparency = 0
						highlight.Adornee = parent
						highlight.Parent = folder
					end
				end,
				Removes = function(arg)
					if not arg then
						return
					end

					task.spawn(function()
						local esp = arg:FindFirstChild("ESP")
						if not esp then
							return
						end
						local espHighlight = esp:FindFirstChild("ESPHighlight")

						if espHighlight then
							espHighlight:Destroy()
						end

						if esp then
							esp:Destroy()
						end
					end)
				end,
			}
		end

		tbl4.ESP = fn23()
		return tbl4
	end

	module.Modules = fn11()
	local handlers = {}
	local modules = module.Modules
	local toolFunction = modules.ToolFunction
	local utils = modules.Utils

	shx.OnUnloaded:Connect(function()
		local esp = cached.ESP
		local weatherPath = stored.Weather_Path

		if esp and next(esp) then
			for k in esp, nil, nil do
				modules.ESP.Removes(k)
			end
		end

		if weatherPath and next(weatherPath) then
			for k in weatherPath, nil, nil do
				k.Visible = false
			end
		end

		local hidePlant = stored.HidePlant

		if hidePlant then
			task.spawn(function()
				for _, v6 in { hidePlant.Tree, hidePlant.Fruit }, nil, nil do
					if not (not v6 or not next(v6)) then
						for _, v7 in v6, nil, nil do
							if v7.Parts then
								for _, v8 in v7.Parts, nil, nil do
									if v8.Part and v8.Part.Parent then
										v8.Part.Transparency = v8.Transparency
										v8.Part.CanCollide = v8.CanCollide
									end
								end
							end

							if v7.Effects then
								for _, v8 in v7.Effects, nil, nil do
									if v8.Object and v8.Object.Parent then
										v8.Object[v8.Property] = v8.Value
									end
								end
							end
						end

						table.clear(v6)
					end
				end
			end)
		end

		local backpackGui = playerGui:FindFirstChild("BackpackGui")
		local backpack = backpackGui and backpackGui:FindFirstChild("Backpack")
		if not backpack then
			return
		end
		local inventory = backpack and backpack:FindFirstChild("Inventory")
		inventory = inventory and inventory:FindFirstChild("FruitInventory")
		if not inventory then
			return
		end

		task.spawn(function()
			for _, v6 in backpack:QueryDescendants("#Value"), nil, nil do
				v6:Destroy()
			end
		end)

		if not inventory.Text:match("$") then
			return
		end
		inventory.Visible = false
		local getAttribute = localPlayer.GetAttribute
		inventory.Text = ("%*/%* Fruits"):format(localPlayer:GetAttribute("FruitCount"), getAttribute(localPlayer, "MaxFruitCapacity"))
	end)

	handlers.Managers = {}
	local managers = handlers.Managers

	managers.GetCurrentCash = function()
		local leaderstats = localPlayer:FindFirstChild("leaderstats")
		local sheckles = leaderstats and leaderstats:FindFirstChild("Sheckles") or leaderstats and leaderstats:FindFirstChild("Leaves")
		if not sheckles then
			return
		end
		return sheckles.Value
	end

	managers.GetSeedList = function()
		local tbl4 = { "None", "Gold", "Rainbow", "Mega" }
		local assets = ReplicatedStorage:FindFirstChild("Assets")
		assets = assets and assets:FindFirstChild("Plants")
		if not assets then
			return tbl4
		end

		for _, v6 in assets:GetChildren() do
			if v6:IsA("Model") then
				table.insert(tbl4, v6.Name)
			end
		end

		return tbl4
	end

	managers.GetWateringCanList = function()
		local tbl4 = { "None" }
		local assets = ReplicatedStorage:FindFirstChild("Assets")
		assets = assets and assets:FindFirstChild("WateringCans")
		if not assets then
			return tbl4
		end

		for _, v6 in assets:GetChildren() do
			if v6:IsA("Model") then
				table.insert(tbl4, v6.Name)
			end
		end

		return tbl4
	end

	managers.GetSeedPackList = function()
		local tbl4 = { "None" }
		local assets = ReplicatedStorage:FindFirstChild("Assets")
		assets = assets and assets:FindFirstChild("SeedPacks")
		if not assets then
			return tbl4
		end

		for _, v6 in assets:GetChildren() do
			if v6:IsA("Model") then
				table.insert(tbl4, v6.Name)
			end
		end

		return tbl4
	end

	managers.GetEggList = function()
		local tbl4 = { "None" }
		local assets = ReplicatedStorage:FindFirstChild("Assets")
		assets = assets and assets:FindFirstChild("Eggs")
		if not assets then
			return tbl4
		end

		for _, v6 in assets:GetChildren() do
			if v6:IsA("Model") then
				table.insert(tbl4, v6.Name)
			end
		end

		return tbl4
	end

	managers.GetSprinklerList = function()
		local tbl4 = { "None" }
		local assets = ReplicatedStorage:FindFirstChild("Assets")
		assets = assets and assets:FindFirstChild("Sprinklers")
		if not assets then
			return tbl4
		end

		for _, v6 in assets:GetChildren() do
			if v6:IsA("Model") then
				table.insert(tbl4, v6.Name)
			end
		end

		return tbl4
	end

	managers.GetRarityList = function()
		local tbl4 = { "None" }
		local sharedModules = ReplicatedStorage:FindFirstChild("SharedModules")
		sharedModules = sharedModules and sharedModules:FindFirstChild("RarityData")
		sharedModules = sharedModules and sharedModules:FindFirstChild("Gradients")
		if not sharedModules then
			return tbl4
		end

		for _, v6 in sharedModules:GetChildren() do
			if v6:IsA("UIGradient") then
				table.insert(tbl4, v6.Name)
			end
		end

		return tbl4
	end

	managers.GetPetList = function()
		local tbl4 = { "None" }
		local sharedModules = ReplicatedStorage:FindFirstChild("SharedModules")
		sharedModules = sharedModules and sharedModules:FindFirstChild("PetModules")
		if not sharedModules then
			return tbl4
		end

		for _, v6 in sharedModules:GetChildren() do
			table.insert(tbl4, v6.Name)
		end

		return tbl4
	end

	managers.GetMutationList = function()
		local tbl4 = { "None" }
		local sharedModules = ReplicatedStorage:FindFirstChild("SharedModules")
		sharedModules = sharedModules and sharedModules:FindFirstChild("MutationData")
		if not sharedModules then
			return tbl4
		end

		for _, v6 in sharedModules:GetChildren() do
			table.insert(tbl4, v6.Name)
		end

		return tbl4
	end

	managers.IsGardenLocked = function(arg, arg2)
		local v6 = Players:FindFirstChild(arg2)
		if not v6 or v6 == localPlayer then
			return false
		end
		return v6:GetAttribute("IsInOwnGarden") == true
	end

	managers.GetRandomPlant = function()
		local v6 = modules.GetOwnerPlot()
		if not v6 then
			return
		end
		local visual = v6:FindFirstChild("Visual")
		if not visual then
			return
		end
		local tbl4 = {}

		for _, v7 in visual:GetChildren() do
			if v7:IsA("Model") and v7.Name:find("BedSection") then
				table.insert(tbl4, v7)
			end
		end

		if #tbl4 == 0 then
			return
		end
		local boundingBox, v7 = tbl4[math.random(1, #tbl4)]:GetBoundingBox()
		local create = vector.create
		local x = v7.X
		local n = (math.random() - 0.5) * x
		local y = v7.Y
		local n2 = (math.random() - 0.5) * y
		local z = v7.Z
		local v8 = create(n, n2, (math.random() - 0.5) * z)
		return boundingBox:PointToWorldSpace(v8)
	end

	managers.GetNearFruitPositions = function(arg, arg2, arg3)
		local tbl4 = {}
		if not arg2 then
			return tbl4
		end
		local n = math.max(tonumber(arg3) or 8, 1)
		local plants = arg2:FindFirstChild("Plants")
		if not plants then
			return tbl4
		end
		local tbl5 = {}
		local sprinklers = arg2:FindFirstChild("Sprinklers")

		if sprinklers then
			for _, child in ipairs(sprinklers:GetChildren()) do
				local primaryPart = child.PrimaryPart or child:FindFirstChildWhichIsA("BasePart")

				if primaryPart then
					tbl5[math.floor(primaryPart.Position.X / n) .. "_" .. math.floor(primaryPart.Position.Z / n)] = true
				end
			end
		end

		local tbl6 = {}
		local tbl7 = {}

		for _, child in ipairs(plants:GetChildren()) do
			if child:IsA("Model") then
				local ok, result = pcall(function()
					return child:GetPivot().Position
				end)

				if not (not ok or not result) then
					local str = math.floor(result.X / n) .. "_" .. math.floor(result.Z / n)

					if not tbl5[str] then
						local tbl8 = tbl6[str]

						if not tbl8 then
							tbl8 = { X = 0, Y = 0, Z = 0, Count = 0 }
							tbl6[str] = tbl8
							table.insert(tbl7, str)
						end

						tbl8.X = tbl8.X + result.X
						tbl8.Y = tbl8.Y + result.Y
						tbl8.Z = tbl8.Z + result.Z
						tbl8.Count = tbl8.Count + 1
					end
				end
			end
		end

		for _, v6 in ipairs(tbl7) do
			local v7 = tbl6[v6]
			table.insert(tbl4, Vector3.new(v7.X / v7.Count, v7.Y / v7.Count, v7.Z / v7.Count))
		end

		return tbl4
	end

	managers.IsOnGarden = function()
		local v6 = modules.GetOwnerPlot()
		if not v6 then
			return false
		end
		local character = localPlayer.Character
		if not character then
			return false
		end
		local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
		if not humanoidRootPart then
			return false
		end
		local plotSizeReference = v6:FindFirstChild("PlotSizeReference")
		if not plotSizeReference or not plotSizeReference:IsA("BasePart") then
			return false
		end
		local v7 = plotSizeReference.CFrame:PointToObjectSpace(humanoidRootPart.Position)
		local n = plotSizeReference.Size.X / 2 + 16
		local flag = math.abs(v7.X) <= n

		if flag then
			local n2 = plotSizeReference.Size.Z / 2 + 16
			flag = math.abs(v7.Z) <= n2
		end

		return flag
	end

	managers.GetPlayerList = function()
		local tbl4 = {}

		for _, v6 in Players:GetPlayers(), nil, nil do
			if v6 ~= localPlayer then
				table.insert(tbl4, v6.Name)
			end
		end

		return tbl4
	end

	local managers2 = handlers.Managers

	handlers.LoadLibrary = function()
		local v6 = shx:CreateWindow({
			Title = "Speed Hub X | Version 5.1.5 | discord.gg/speedhubx",
			Description = "",
			["Tab Width"] = 130,
			SaveSystem = { Enable = true, File = "Grow A Garden 2" },
			Key = "KZgN0t5pK6hBaqVLAMLg27aqXNDb8v",
			Key1 = "c9RkyXAjNpJc9u1fexvw1cbxYTWvMy",
			Key2 = "Xp8712WzbaRn8EtrLnXk8gDdzQB8jF",
			Key3 = "wixUQtibEtmkTQ7WpSFGq4YfBuqJQy",
			Key4 = "KbSf6UWZ6vndbgp8Vh9EHdM0dU8DFf",
			Key5 = "mP3tTRKYwhNKLkpFCdVuj922xqTgJp",
			Key6 = "heMGEmHXFUaiTaStAihwTfwgSJguUwQQxdE",
			Key7 = "khEXYXSHSJpDabFqudKJWEWbEyzXYgLmgTF",
			Key8 = "MLGkWCxxHaqhumMpSmpvJMuiUEpeqUAYvxN",
		})

		local tbl4 = {
			Home = v6:CreateTab({ Name = "Home", Icon = "rbxassetid://10734942198" }),
			Main = v6:CreateTab({ Name = "Main", Icon = "rbxassetid://10723407389" }),
			Automatically = v6:CreateTab({ Name = "Automatically", Icon = "rbxassetid://10734923549" }),
			Inventory = v6:CreateTab({ Name = "Inventory", Icon = "rbxassetid://10709769841" }),
			Shop = v6:CreateTab({ Name = "Shop", Icon = "rbxassetid://10734952273" }),
			Webhook = v6:CreateTab({ Name = "Webhook", Icon = "rbxassetid://17320556264" }),
			Miscellaneous = v6:CreateTab({ Name = "Misc", Icon = "rbxassetid://11447063791" }),
			Settings = v6:CreateTab({ Name = "Settings", Icon = "rbxassetid://10734950309" }),
		}

		funcs:Button(tbl4.Home:AddSection("Discord", true), "Discord Invite", "Copy invite link", function()
			setclipboard("https://discord.gg/speedhubx")
		end)

		local LocalPlayer = tbl4.Home:AddSection("LocalPlayer")

		funcs:Textbox(LocalPlayer, "Set Speed", "", false, true, function(arg)
			enabled["Set Speed"] = tonumber(arg) or 20
		end)

		funcs:Toggle(LocalPlayer, "Enable Walkspeed", "", false, true, function(arg)
			enabled["Enable Walkspeed"] = arg
		end)

		funcs:Toggle(LocalPlayer, "No Clip", "", false, true, function(arg)
			enabled["No Clip"] = arg

			utils.Fallback(arg, "No Clip", function()
				local character = localPlayer and localPlayer.Character

				for _, child in pairs(character:GetChildren()) do
					if child:IsA("BasePart") then
						child.CanCollide = true
					end
				end
			end)
		end)

		funcs:Toggle(LocalPlayer, "Infinite Jump", "", false, true, function(arg)
			enabled["Infinite Jump"] = arg

			utils.Connections(UserInputService.JumpRequest, function()
				local character = localPlayer and localPlayer.Character
				character = character and character:FindFirstChild("Humanoid")

				if character and enabled["Infinite Jump"] then
					character:ChangeState("Jumping")
				end
			end)
		end)

		local v7 = tbl4.Main:AddSection("Teleport Manager")

		funcs:Dropdown(v7, "Select Mode", "", false, { "Tween", "Teleporter (Tool)", "Teleport" }, { "" }, true, function(arg)
			enabled["Select Mode"] = arg
		end)

		funcs:Textbox(v7, "Base Tween Speed", "", "1.5", true, function(arg)
			enabled["Base Tween Speed"] = tonumber(arg)
		end)

		local v8 = tbl4.Main:AddSection("Stack Farm Manager")
		v8:AddSeperator({ " - [ Priority Selection ] - " })

		for _, v9 in {
			"Auto Plants Seed",
			"Auto Plants All Seeds",
			"Auto Collect Fruit",
			"Auto Collect All Fruit",
			"Auto Collect Best Fruit",
			"Auto Collect Gold Seed",
			"Auto Collect Rainbow Seed",
			"Auto Collect Mega Seed",
			"Auto Steal Fruit",
			"Auto Steal Best Fruit",
			"Auto Lock Garden At Night",
			"Auto Buy Pet",
			"Auto Place Sprinkler",
			"Auto Place All Sprinkler",
			"Auto Collect Dropped Item",
			"Auto Hit Player Stolen",
		}, nil, nil do
			local function fn12()
				local tbl5 = { "None" }

				for i = 1, 15 do
					tbl5[i] = tostring(i)
				end

				return tbl5
			end

			funcs:Dropdown(v8, "Priority " .. v9, "", false, fn12(), { "" }, true, function(arg)
				modules.TeleportManager.SetPriority(v9, tonumber(arg))
			end)
		end

		v8:AddSeperator({ " - [ Stack Manager ] - " })

		funcs:Toggle(v8, "Enable Stack Farming", "This allows you to switch between farming features based on the highest selected priority. It prevents teleport spam and helps you AFK grind more efficiently.", false, true, function(arg)
			enabled["Enable Stack Farming"] = arg
		end)

		v8:AddParagraph({
			Title = "How Enable Stack Farming Priority does work?",
			Content = [[Basically,

You can set a priority number for each feature.

A lower number means a higher priority:
- Priority 1 is higher than 2
- Priority 2 is higher than 3
- And so on.

If a higher-priority feature is active, it will temporarily pause teleporting for all lower-priority features until it finishes.
]],
		})

		local v9 = tbl4.Main:AddSection("Automation Plants")
		v9:AddSeperator({ " - [ Config ] - " })

		funcs:Toggle(v9, "Disable Teleport", "", false, true, function(arg)
			enabled["Disable Teleport"] = arg
		end)

		v9:AddSeperator({ " - [ Plants ] - " })

		funcs:Dropdown(v9, "Select Seeds", "", true, managers2:GetSeedList(), { "" }, true, function(arg)
			enabled["Select Seeds"] = arg
		end)

		funcs:Dropdown(v9, "Select Position", "", false, { "Saved Position", "Random", "Player Position", "Sprinkler Radius" }, { "" }, true, function(arg)
			enabled["Select Position"] = arg
		end)

		funcs:Dropdown(v9, "Select Sprinkler For Plants", "Choose which sprinkler's radius to plant near (used when Select Position is 'Sprinkler Radius')", true, managers2:GetSprinklerList(), { "" }, true, function(arg)
			enabled["Select Sprinkler For Plants"] = arg
		end)

		funcs:Button(v9, "Save Position", "", function()
			if pcall(function()
				stored.Saved_Position.PlantSeed = localPlayer.Character.HumanoidRootPart.Position
			end) then
				shx:SetNotification({ "Speed Hub X", "", "Successfully Saved Position", 5, 0.5 })
			end
		end)

		funcs:Textbox(v9, "Delay To Plants", "", "0", true, function(arg)
			enabled["Delay To Plants"] = tonumber(arg)
		end)

		funcs:Toggle(v9, "Auto Plants Seed", "", false, true, function(arg)
			enabled["Auto Plants Seed"] = arg
		end)

		funcs:Toggle(v9, "Auto Plants All Seeds", "", false, true, function(arg)
			enabled["Auto Plants All Seeds"] = arg
		end)

		local v10 = tbl4.Main:AddSection("Automation Collection")
		v10:AddSeperator({ " - [ Config ] - " })

		funcs:Toggle(v10, "Disable Teleport ", "", false, true, function(arg)
			enabled["Disable Teleport "] = arg
		end)

		funcs:Toggle(v10, "Stop Collect If Backpack Is Full Max", "", false, true, function(arg)
			enabled["Stop Collect If Backpack Is Full Max"] = arg
		end)

		funcs:Textbox(v10, "Delay To Collect", "", "0", true, function(arg)
			enabled["Delay To Collect"] = tonumber(arg)
		end)

		funcs:Toggle(v10, "Disable Collect Prompt", "Prevention Accident Collect", false, true, function(arg)
			enabled["Disable Collect Prompt"] = arg

			utils.Fallback(arg, "Disable Collect Prompt", function()
				local plants = modules.GetOwnerPlot()
				plants = plants and plants:FindFirstChild("Plants")
				if not plants then
					return
				end

				for _, v11 in plants:QueryDescendants("ProximityPrompt") do
					local attribute = v11:GetAttribute("Backup_MaxDist")

					if attribute then
						v11.MaxActivationDistance = attribute
					end
				end
			end)
		end)

		v10:AddSeperator({ " - [ Collects ] - " })

		funcs:Dropdown(v10, "Select Filter", "", false, { "Blacklist", "Whitelist" }, { "" }, true, function(arg)
			enabled["Select Filter"] = arg
		end)

		funcs:Dropdown(v10, "Select Fruit", "", true, managers2:GetSeedList(), { "" }, true, function(arg)
			enabled["Select Fruit"] = arg
		end)

		funcs:Dropdown(v10, "Select Rarity", "", true, managers2:GetRarityList(), { "" }, true, function(arg)
			enabled["Select Rarity"] = arg
		end)

		funcs:Dropdown(v10, "Select Mutation", "", true, managers2:GetMutationList(), { "" }, true, function(arg)
			enabled["Select Mutation"] = arg
		end)

		v10:AddLine()

		funcs:Dropdown(v10, "Select Threshold Mode", "", false, { "Above", "Below" }, { "" }, true, function(arg)
			enabled["Select Threshold Mode"] = arg
		end)

		funcs:Textbox(v10, "Weight Threshold", "if you don't want use this, just input '0'", "0", true, function(arg)
			enabled["Weight Threshold"] = tonumber(arg)
		end)

		v10:AddLine()
		v10:AddLine()

		funcs:Toggle(v10, "Only Mutated Fruit", "This allows Auto Collect Fruit to collect only mutated fruits.", false, true, function(arg)
			enabled["Only Mutated Fruit"] = arg
		end)

		v10:AddLine()

		funcs:Toggle(v10, "Auto Collect Fruit", "", false, true, function(arg)
			enabled["Auto Collect Fruit"] = arg
		end)

		v10:AddLine()

		funcs:Toggle(v10, "Auto Collect All Fruit", "", false, true, function(arg)
			enabled["Auto Collect All Fruit"] = arg
		end)

		v10:AddLine()

		funcs:Toggle(v10, "Enable Filters", "you can select anything for auto collect best fruit", false, true, function(arg)
			enabled["Enable Filters"] = arg
		end)

		funcs:Toggle(v10, "Auto Collect Best Fruit", "", false, true, function(arg)
			enabled["Auto Collect Best Fruit"] = arg
		end)

		v10:AddSeperator({ " - [ Collect Event Seed ] - " })

		funcs:Toggle(v10, "Auto Collect Gold Seed", "", false, true, function(arg)
			enabled["Auto Collect Gold Seed"] = arg
		end)

		funcs:Toggle(v10, "Auto Collect Rainbow Seed", "", false, true, function(arg)
			enabled["Auto Collect Rainbow Seed"] = arg
		end)

		funcs:Toggle(v10, "Auto Collect Mega Seed", "", false, true, function(arg)
			enabled["Auto Collect Mega Seed"] = arg
		end)

		v10:AddSeperator({ " - [ Collect Dropped Item ] - " })

		funcs:Toggle(v10, "Auto Collect Dropped Item", "", false, true, function(arg)
			enabled["Auto Collect Dropped Item"] = arg
		end)

		local v11 = tbl4.Main:AddSection("Automation Steal")
		v11:AddSeperator({ " - [ Steal Fruits ] - " })

		funcs:Dropdown(v11, "Select Filter ", "", false, { "Blacklist", "Whitelist" }, { "" }, true, function(arg)
			enabled["Select Filter "] = arg
		end)

		funcs:Dropdown(v11, "Select Fruit ", "", true, managers2:GetSeedList(), { "" }, true, function(arg)
			enabled["Select Fruit "] = arg
		end)

		funcs:Dropdown(v11, "Select Rarity ", "", true, managers2:GetRarityList(), { "" }, true, function(arg)
			enabled["Select Rarity "] = arg
		end)

		funcs:Dropdown(v11, "Select Mutation ", "", true, managers2:GetMutationList(), { "" }, true, function(arg)
			enabled["Select Mutation "] = arg
		end)

		funcs:Toggle(v11, "Auto Steal Fruit", "", false, true, function(arg)
			enabled["Auto Steal Fruit"] = arg
		end)

		v11:AddSeperator({ " - [ Steal Best Fruit ] - " })

		funcs:Toggle(v11, "Auto Steal Best Fruit", "", false, true, function(arg)
			enabled["Auto Steal Best Fruit"] = arg
		end)

		v11:AddSeperator({ " - [ Locks Garden ] - " })

		funcs:Toggle(v11, "Auto Lock Garden At Night", "", false, true, function(arg)
			enabled["Auto Lock Garden At Night"] = arg
		end)

		v11:AddSeperator({ " - [ Hit Players ] - " })

		funcs:Toggle(v11, "Auto Hit Player Stolen", "", false, true, function(arg)
			enabled["Auto Hit Player Stolen"] = arg
		end)

		local v12 = tbl4.Main:AddSection("Automation Sell")
		v12:AddSeperator({ " - [ Config ] - " })

		funcs:Textbox(v12, "Delay To Sell Inventory", "", "0", true, function(arg)
			enabled["Delay To Sell Inventory"] = arg
		end)

		funcs:Toggle(v12, "Allow Sell If Backpack Is Max", "", false, true, function(arg)
			enabled["Allow Sell If Backpack Is Max"] = arg
		end)

		funcs:Toggle(v12, "Allows Double Or Nothing", "", false, true, function(arg)
			enabled["Allows Double Or Nothing"] = arg
		end)

		funcs:Toggle(v12, "Use Daily Deal", "", false, true, function(arg)
			enabled["Use Daily Deal"] = arg
		end)

		v12:AddLine()

		funcs:Dropdown(v12, "Select Target Fruit", "", true, managers2:GetSeedList(), { "" }, true, function(arg)
			enabled["Select Target Fruit"] = arg
		end)

		local function fn12()
			local tbl5 = { "None" }

			for i = 1, 5 do
				tbl5[i] = tostring(i)
			end

			return tbl5
		end

		funcs:Dropdown(v12, "Select Price Multiplier X", "", true, fn12(), { "" }, true, function(arg)
			enabled["Select Price Multiplier X"] = arg
		end)

		funcs:Toggle(v12, "Allow Sell at Multiplier", "When a selected target fruit reaches the specified Multiplier Price, it will allow Auto Sell.", false, true, function(arg)
			enabled["Allow Sell at Multiplier"] = arg
		end)

		v12:AddLine()
		v12:AddSeperator({ " - [ Sell All ] - " })

		funcs:Toggle(v12, "Auto Sell All", "", false, true, function(arg)
			enabled["Auto Sell All"] = arg
		end)

		funcs:Button(v12, "Sell All", "", function()
			if enabled["Allows Double Or Nothing"] then
				modules.Networker.Fire("DoubleOrNothing")
				task.wait(0.1)
				modules.Networker.Fire("CashOutDoubleOrNothing")
				task.wait(0.1)
			end

			if enabled["Use Daily Deal"] then
				modules.Networker.Fire("UseDailyDealAll")
			end

			modules.Networker.Fire("SellAll")
		end)

		v12:AddSeperator({ " - [ Sell Fruits ] - " })

		funcs:Dropdown(v12, "Select Sell Fruit", "", true, managers2:GetSeedList(), { "" }, true, function(arg)
			enabled["Select Sell Fruit"] = arg
		end)

		funcs:Dropdown(v12, "Select Sell Rarity", "", true, managers2:GetRarityList(), { "" }, true, function(arg)
			enabled["Select Sell Rarity"] = arg
		end)

		funcs:Dropdown(v12, "Select Sell Mutation", "", true, managers2:GetMutationList(), { "" }, true, function(arg)
			enabled["Select Sell Mutation"] = arg
		end)

		v12:AddLine()

		funcs:Dropdown(v12, "Select Threshold Mode   ", "", false, { "Above", "Below" }, { "" }, true, function(arg)
			enabled["Select Threshold Mode   "] = arg
		end)

		funcs:Textbox(v12, "Weight Threshold   ", "if you don't want use this, just input '0'", "0", true, function(arg)
			enabled["Weight Threshold   "] = tonumber(arg)
		end)

		v12:AddLine()

		funcs:Toggle(v12, "Auto Sell Fruit", "", false, true, function(arg)
			enabled["Auto Sell Fruit"] = arg
		end)

		v12:AddSeperator({ " - [ Sell Pets ] - " })

		funcs:Dropdown(v12, "Select Pets   ", "", true, managers2:GetPetList(), { "" }, true, function(arg)
			enabled["Select Pets   "] = arg
		end)

		funcs:Dropdown(v12, "Select Rarity Pets   ", "", true, managers2:GetRarityList(), { "" }, true, function(arg)
			enabled["Select Rarity Pets   "] = arg
		end)

		funcs:Dropdown(v12, "Select Size Pets   ", "", true, { "None", "Big", "Huge" }, { "" }, true, function(arg)
			enabled["Select Size Pets   "] = arg
		end)

		funcs:Toggle(v12, "Auto Sell Pets", "", false, true, function(arg)
			enabled["Auto Sell Pets"] = arg
		end)

		local v13 = tbl4.Main:AddSection("Automation Pets")

		funcs:Toggle(v13, "Pet Purchase Protection", "Prevent others from buying your pets by teleporting them away and detecting nearby players attempting to purchase them, then attacking them.", false, true, function(arg)
			enabled["Pet Purchase Protection"] = arg
		end)

		v13:AddSeperator({ " - [ Buys Pets ] - " })

		funcs:Dropdown(v13, "Select Pets", "", true, managers2:GetPetList(), { "" }, true, function(arg)
			enabled["Select Pets"] = arg
		end)

		funcs:Dropdown(v13, "Select Rarity Pets", "", true, managers2:GetRarityList(), { "" }, true, function(arg)
			enabled["Select Rarity Pets"] = arg
		end)

		funcs:Dropdown(v13, "Select Size Pets", "", true, { "None", "Big", "Huge" }, { "" }, true, function(arg)
			enabled["Select Size Pets"] = arg
		end)

		funcs:Textbox(v13, "Pet Sheckle Limit", "if you don't want use this, just input '0'", "0", true, function(arg)
			enabled["Pet Sheckle Limit"] = tonumber(arg) or 0
		end)

		funcs:Toggle(v13, "Auto Buy Pet", "", false, true, function(arg)
			enabled["Auto Buy Pet"] = arg
		end)

		local v14 = tbl4.Main:AddSection("Automation Pots")
		v14:AddSeperator({ " - [ Pot Plants ] - " })

		funcs:Dropdown(v14, "Select Pot Plant", "", true, managers2:GetSeedList(), { "" }, true, function(arg)
			enabled["Select Pot Plant"] = arg
		end)

		funcs:Textbox(v14, "Delay To Pot Plant", "", "0", true, function(arg)
			enabled["Delay To Pot Plant"] = tonumber(arg)
		end)

		funcs:Toggle(v14, "Auto Pot Plant", "", false, true, function(arg)
			enabled["Auto Pot Plant"] = arg
		end)

		v14:AddSeperator({ " - [ Place Potted Plants ] - " })

		funcs:Dropdown(v14, "Select Potted Plant", "", true, managers2:GetSeedList(), { "" }, true, function(arg)
			enabled["Select Potted Plant"] = arg
		end)

		funcs:Dropdown(v14, "Select Position For Potted Plant", "", false, { "Saved Position", "Random", "Player Position" }, { "" }, true, function(arg)
			enabled["Select Position For Potted Plant"] = arg
		end)

		funcs:Button(v14, "Save Position", "", function()
			if pcall(function()
				stored.Saved_Position.PottedPlant = localPlayer.Character.HumanoidRootPart.Position
			end) then
				shx:SetNotification({ "Speed Hub X", "", "Successfully Saved Position", 5, 0.5 })
			end
		end)

		funcs:Textbox(v14, "Delay To Place Potted Plant", "", "0", true, function(arg)
			enabled["Delay To Place Potted Plant"] = tonumber(arg)
		end)

		funcs:Toggle(v14, "Auto Place Potted Plant", "", false, true, function(arg)
			enabled["Auto Place Potted Plant"] = arg
		end)

		funcs:Toggle(v14, "Auto Place All Potted Plant", "", false, true, function(arg)
			enabled["Auto Place All Potted Plant"] = arg
		end)

		v14:AddSeperator({ " - [ Pick Up Potted Plants ] - " })

		funcs:Dropdown(v14, "Select Pick Up Potted Plant", "", true, managers2:GetSeedList(), { "" }, true, function(arg)
			enabled["Select Pick Up Potted Plant"] = arg
		end)

		funcs:Toggle(v14, "Auto Pick Up Potted Plant", "", false, true, function(arg)
			enabled["Auto Pick Up Potted Plant"] = arg
		end)

		funcs:Toggle(v14, "Auto Pick Up All Potted Plant", "", false, true, function(arg)
			enabled["Auto Pick Up All Potted Plant"] = arg
		end)

		local v15 = tbl4.Automatically:AddSection("Automation Sprinkler")
		v15:AddSeperator({ " - [ Config ] - " })

		funcs:Toggle(v15, "Disable Teleport  ", "", false, true, function(arg)
			enabled["Disable Teleport  "] = arg
		end)

		v15:AddSeperator({ " - [ Sprinkler ] - " })

		funcs:Dropdown(v15, "Select Sprinkler", "", true, managers2:GetSprinklerList(), { "" }, true, function(arg)
			enabled["Select Sprinkler"] = arg
		end)

		funcs:Dropdown(v15, "Select Position ", "", false, { "Saved Position", "Random", "Player Position", "Near Fruit" }, { "" }, true, function(arg)
			enabled["Select Position "] = arg
		end)

		funcs:Textbox(v15, "Sprinkler Spacing", "Offset distance between sprinklers when using 'Near Fruit' position", "8", true, function(arg)
			enabled["Sprinkler Spacing"] = tonumber(arg) or 8
		end)

		funcs:Button(v15, "Save Position", "", function()
			if pcall(function()
				stored.Saved_Position.PlaceSprinkler = localPlayer.Character.HumanoidRootPart.Position
			end) then
				shx:SetNotification({ "Speed Hub X", "", "Successfully Saved Position", 5, 0.5 })
			end
		end)

		funcs:Textbox(v15, "Delay To Sprinkler", "", "0", true, function(arg)
			enabled["Delay To Sprinkler"] = tonumber(arg)
		end)

		funcs:Toggle(v15, "Auto Place Sprinkler", "", false, true, function(arg)
			enabled["Auto Place Sprinkler"] = arg
		end)

		funcs:Toggle(v15, "Auto Place All Sprinkler", "", false, true, function(arg)
			enabled["Auto Place All Sprinkler"] = arg
		end)

		local v16 = tbl4.Automatically:AddSection("Automation Trowel")

		funcs:Dropdown(v16, "Select Plant", "", true, managers2:GetSeedList(), { "" }, true, function(arg)
			enabled["Select Plant"] = arg
		end)

		funcs:Dropdown(v16, "Select Position  ", "", false, { "Saved Position", "Random", "Player Position" }, { "" }, true, function(arg)
			enabled["Select Position  "] = arg
		end)

		funcs:Button(v16, "Save Position", "", function()
			if pcall(function()
				stored.Saved_Position.Trowel = localPlayer.Character.HumanoidRootPart.Position
			end) then
				shx:SetNotification({ "Speed Hub X", "", "Successfully Saved Position", 5, 0.5 })
			end
		end)

		funcs:Textbox(v16, "Delay To Trowel", "", "0", true, function(arg)
			enabled["Delay To Trowel"] = tonumber(arg)
		end)

		funcs:Toggle(v16, "Auto Trowel Plant", "", false, true, function(arg)
			enabled["Auto Trowel Plant"] = arg
		end)

		local v17 = tbl4.Automatically:AddSection("Automation Shovel")
		v17:AddSeperator({ " - [ Tree Shovel ] - " })

		funcs:Dropdown(v17, "Select Tree", "", true, managers2:GetSeedList(), { "" }, true, function(arg)
			enabled["Select Tree"] = arg
		end)

		funcs:Dropdown(v17, "Select Rarity Tree", "", true, managers2:GetRarityList(), { "" }, true, function(arg)
			enabled["Select Rarity Tree"] = arg
		end)

		funcs:Dropdown(v17, "Select Mutation Tree", "", true, managers2:GetMutationList(), { "" }, true, function(arg)
			enabled["Select Mutation Tree"] = arg
		end)

		funcs:Textbox(v17, "Delay To Shovel Tree", "", "0", true, function(arg)
			enabled["Delay To Shovel Tree"] = tonumber(arg)
		end)

		funcs:Toggle(v17, "Auto Shovel Tree", "", false, true, function(arg)
			enabled["Auto Shovel Tree"] = arg
		end)

		v17:AddSeperator({ " - [ Fruits Shovel ] - " })

		funcs:Dropdown(v17, "Select Fruit  ", "", true, managers2:GetSeedList(), { "" }, true, function(arg)
			enabled["Select Fruit  "] = arg
		end)

		funcs:Dropdown(v17, "Select Rarity  ", "", true, managers2:GetRarityList(), { "" }, true, function(arg)
			enabled["Select Rarity  "] = arg
		end)

		funcs:Dropdown(v17, "Select Mutation  ", "", true, managers2:GetMutationList(), { "" }, true, function(arg)
			enabled["Select Mutation  "] = arg
		end)

		v17:AddLine()

		funcs:Dropdown(v17, "Select Threshold Mode ", "", false, { "Above", "Below" }, { "" }, true, function(arg)
			enabled["Select Threshold Mode "] = arg
		end)

		funcs:Textbox(v17, "Weight Threshold ", "if you don't want use this, just input '0'", "0", true, function(arg)
			enabled["Weight Threshold "] = tonumber(arg)
		end)

		v17:AddLine()

		funcs:Textbox(v17, "Delay To Shovel Fruit", "", "0", true, function(arg)
			enabled["Delay To Shovel Fruit"] = tonumber(arg)
		end)

		funcs:Toggle(v17, "Auto Shovel Fruit", "", false, true, function(arg)
			enabled["Auto Shovel Fruit"] = arg
		end)

		local v18 = tbl4.Automatically:AddSection("Automation Watering Can")

		funcs:Dropdown(v18, "Select Water Plants", "", true, managers2:GetSeedList(), { "" }, true, function(arg)
			enabled["Select Water Plants"] = arg
		end)

		funcs:Dropdown(v18, "Select Watering Can", "", true, managers2:GetWateringCanList(), { "" }, true, function(arg)
			enabled["Select Watering Can"] = arg
		end)

		funcs:Toggle(v18, "Only Decaying Plants", "", false, true, function(arg)
			enabled["Only Decaying Plants"] = arg
		end)

		funcs:Textbox(v18, "Delay To Water", "", "0", true, function(arg)
			enabled["Delay To Water"] = tonumber(arg)
		end)

		funcs:Toggle(v18, "Auto Water Plants", "", false, true, function(arg)
			enabled["Auto Water Plants"] = arg
		end)

		funcs:Toggle(v18, "Auto Water All Plants", "", false, true, function(arg)
			enabled["Auto Water All Plants"] = arg
		end)

		local v19 = tbl4.Automatically:AddSection("Automation Drops Item")
		v19:AddSeperator({ " - [ Drop Seeds ] - " })

		funcs:Dropdown(v19, "Select Drop Seed", "", true, managers2:GetSeedList(), { "" }, true, function(arg)
			enabled["Select Drop Seed"] = arg
		end)

		funcs:Toggle(v19, "Auto Drop Seed", "", false, true, function(arg)
			enabled["Auto Drop Seed"] = arg
		end)

		v19:AddSeperator({ " - [ Drop Fruits ] - " })

		funcs:Dropdown(v19, "Select Drop Fruit", "", true, managers2:GetSeedList(), { "" }, true, function(arg)
			enabled["Select Drop Fruit"] = arg
		end)

		funcs:Dropdown(v19, "Select Drop Rarity", "", true, managers2:GetRarityList(), { "" }, true, function(arg)
			enabled["Select Drop Rarity"] = arg
		end)

		funcs:Dropdown(v19, "Select Drop Mutation", "", true, managers2:GetMutationList(), { "" }, true, function(arg)
			enabled["Select Drop Mutation"] = arg
		end)

		v19:AddLine()

		funcs:Dropdown(v19, "Select Threshold Mode    ", "", false, { "Above", "Below" }, { "" }, true, function(arg)
			enabled["Select Threshold Mode    "] = arg
		end)

		funcs:Textbox(v19, "Weight Threshold    ", "if you don't want use this, just input '0'", "0", true, function(arg)
			enabled["Weight Threshold    "] = tonumber(arg)
		end)

		v19:AddLine()

		funcs:Toggle(v19, "Auto Drop Fruit", "", false, true, function(arg)
			enabled["Auto Drop Fruit"] = arg
		end)

		v19:AddSeperator({ " - [ Drop Pets ] - " })

		funcs:Dropdown(v19, "Select Pets     ", "", true, managers2:GetPetList(), { "" }, true, function(arg)
			enabled["Select Pets     "] = arg
		end)

		funcs:Dropdown(v19, "Select Rarity Pets     ", "", true, managers2:GetRarityList(), { "" }, true, function(arg)
			enabled["Select Rarity Pets     "] = arg
		end)

		funcs:Dropdown(v19, "Select Size Pets     ", "", true, { "None", "Big", "Huge" }, { "" }, true, function(arg)
			enabled["Select Size Pets     "] = arg
		end)

		funcs:Toggle(v19, "Auto Drop Pet", "", false, true, function(arg)
			enabled["Auto Drop Pet"] = arg
		end)

		local v20 = tbl4.Automatically:AddSection("Automation Mailbox")

		funcs:Textbox(v20, "Player Username", "", "Input Username Player", true, function(arg)
			enabled["Player Username"] = arg
		end)

		funcs:Textbox(v20, "Send Note Message", "", "", true, function(arg)
			enabled["Send Note Message"] = arg
		end)

		v20:AddSeperator({ " - [ Send Seeds ] - " })

		funcs:Dropdown(v20, "Select Send Seed", "", true, managers2:GetSeedList(), { "" }, true, function(arg)
			enabled["Select Send Seed"] = arg
		end)

		funcs:Textbox(v20, "Amount Send", "Input an amount or `full` for full amount", "full", true, function(arg)
			enabled["Amount Send"] = arg
		end)

		funcs:Toggle(v20, "Auto Send Seed", "", false, true, function(arg)
			enabled["Auto Send Seed"] = arg
		end, "Are you sure you want to send seeds to another player?")

		v20:AddSeperator({ " - [ Send Gears ] - " })

		local function fn13()
			local tbl5 = {}

			for k in modules.MailBox_Gear, nil, nil do
				tbl5[#tbl5 + 1] = k
			end

			return tbl5
		end

		funcs:Dropdown(v20, "Select Send Gear", "", true, fn13(), { "" }, true, function(arg)
			enabled["Select Send Gear"] = arg
		end)

		funcs:Textbox(v20, "Amount Send", "Input an amount or `full` for full amount", "full", true, function(arg)
			enabled["Amount Send"] = arg
		end)

		funcs:Toggle(v20, "Auto Send Gear", "", false, true, function(arg)
			enabled["Auto Send Gear"] = arg
		end, "Are you sure you want to send gears to another player?")

		v20:AddSeperator({ " - [ Send Seed Pack ] - " })

		funcs:Dropdown(v20, "Select Send Seed Pack", "", true, managers2:GetSeedPackList(), { "" }, true, function(arg)
			enabled["Select Send Seed Pack"] = arg
		end)

		funcs:Textbox(v20, "Amount Send ", "Input an amount or `full` for full amount", "full", true, function(arg)
			enabled["Amount Send "] = arg
		end)

		funcs:Toggle(v20, "Auto Send Seed Pack", "", false, true, function(arg)
			enabled["Auto Send Seed Pack"] = arg
		end, "Are you sure you want to send Seed Pack to another player?")

		v20:AddSeperator({ " - [ Send Pets ] - " })

		funcs:Dropdown(v20, "Select Pets      ", "", true, managers2:GetPetList(), { "" }, true, function(arg)
			enabled["Select Pets      "] = arg
		end)

		funcs:Dropdown(v20, "Select Rarity Pets      ", "", true, managers2:GetRarityList(), { "" }, true, function(arg)
			enabled["Select Rarity Pets      "] = arg
		end)

		funcs:Dropdown(v20, "Select Size Pets      ", "", true, { "None", "Big", "Huge" }, { "" }, true, function(arg)
			enabled["Select Size Pets      "] = arg
		end)

		funcs:Toggle(v20, "Auto Send Pet", "", false, true, function(arg)
			enabled["Auto Send Pet"] = arg
		end, "Are you sure you want to send pets to another player?")

		v20:AddSeperator({ " - [ Send Fruits ] - " })

		funcs:Dropdown(v20, "Select Send Fruit", "", true, managers2:GetSeedList(), { "" }, true, function(arg)
			enabled["Select Send Fruit"] = arg
		end)

		funcs:Dropdown(v20, "Select Send Rarity", "", true, managers2:GetRarityList(), { "" }, true, function(arg)
			enabled["Select Send Rarity"] = arg
		end)

		funcs:Dropdown(v20, "Select Send Mutation", "", true, managers2:GetMutationList(), { "" }, true, function(arg)
			enabled["Select Send Mutation"] = arg
		end)

		v20:AddLine()

		funcs:Dropdown(v20, "Select Threshold Mode     ", "", false, { "Above", "Below" }, { "" }, true, function(arg)
			enabled["Select Threshold Mode     "] = arg
		end)

		funcs:Textbox(v20, "Weight Threshold     ", "if you don't want use this, just input '0'", "0", true, function(arg)
			enabled["Weight Threshold     "] = tonumber(arg)
		end)

		v20:AddLine()

		funcs:Toggle(v20, "Auto Send Fruit", "", false, true, function(arg)
			enabled["Auto Send Fruit"] = arg
		end, "Are you sure you want to send fruits to another player?")

		v20:AddSeperator({ " - [ Claim Mail ] - " })

		funcs:Toggle(v20, "Auto Claim Mail", "", false, true, function(arg)
			enabled["Auto Claim Mail"] = arg
		end)

		local v21 = tbl4.Automatically:AddSection("Automation Prevent Weather")

		funcs:Dropdown(v21, "Select Weather", "", true, modules.WeatherData, { "" }, true, function(arg)
			enabled["Select Weather"] = arg
		end)

		funcs:Textbox(v21, "Delay To Prevent", "", "5", true, function(arg)
			enabled["Delay To Prevent"] = tonumber(arg)
		end)

		funcs:Dropdown(v21, "Select Prevent Mode", "", false, { "Kick", "Rejoin", "Leave", "Hop Server" }, { "Rejoin" }, true, function(arg)
			enabled["Select Prevent Mode"] = arg
		end)

		funcs:Toggle(v21, "Auto Prevent Weather", "", false, true, function(arg)
			enabled["Auto Prevent Weather"] = arg
		end)

		local v22 = tbl4.Inventory:AddSection("Automation Favorite")

		funcs:Dropdown(v22, "Select Favorite Fruit", "", true, managers2:GetSeedList(), { "" }, true, function(arg)
			enabled["Select Favorite Fruit"] = arg
		end)

		funcs:Dropdown(v22, "Select Favorite Rarity", "", true, managers2:GetRarityList(), { "" }, true, function(arg)
			enabled["Select Favorite Rarity"] = arg
		end)

		funcs:Dropdown(v22, "Select Favorite Mutation", "", true, managers2:GetMutationList(), { "" }, true, function(arg)
			enabled["Select Favorite Mutation"] = arg
		end)

		v22:AddLine()

		funcs:Dropdown(v22, "Select Threshold Mode  ", "", false, { "Above", "Below" }, { "" }, true, function(arg)
			enabled["Select Threshold Mode  "] = arg
		end)

		funcs:Textbox(v22, "Weight Threshold  ", "if you don't want use this, just input '0'", "0", true, function(arg)
			enabled["Weight Threshold  "] = tonumber(arg)
		end)

		funcs:Textbox(v22, "Value Threshold", "if you don't want use this, just input '0'", "0", true, function(arg)
			enabled["Value Threshold"] = modules.Converter.CorrectNumber(arg) or 0
		end)

		v22:AddLine()

		funcs:Toggle(v22, "Auto Favorite Fruit", "", false, true, function(arg)
			enabled["Auto Favorite Fruit"] = arg
		end)

		funcs:Toggle(v22, "Auto UnFavorite Fruit", "", false, true, function(arg)
			enabled["Auto UnFavorite Fruit"] = arg
		end)

		funcs:Toggle(v22, "Auto UnFavorite All Fruit", "", false, true, function(arg)
			enabled["Auto UnFavorite All Fruit"] = arg
		end)

		local v23 = tbl4.Shop:AddSection("Shop Seeds")

		funcs:Dropdown(v23, "Select Seed ", "", true, modules.Shop.GetShopList("SeedShop"), { "" }, true, function(arg)
			enabled["Select Seed "] = arg
		end)

		funcs:Toggle(v23, "Auto Buy Seeds", "", false, true, function(arg)
			enabled["Auto Buy Seeds"] = arg
		end)

		funcs:Toggle(v23, "Auto Buy All Seeds", "", false, true, function(arg)
			enabled["Auto Buy All Seeds"] = arg
		end)

		local v24 = tbl4.Shop:AddSection("Shop Gear")

		funcs:Dropdown(v24, "Select Gear ", "", true, modules.Shop.GetShopList("GearShop"), { "" }, true, function(arg)
			enabled["Select Gear "] = arg
		end)

		funcs:Toggle(v24, "Auto Buy Gear", "", false, true, function(arg)
			enabled["Auto Buy Gear"] = arg
		end)

		funcs:Toggle(v24, "Auto Buy All Gear", "", false, true, function(arg)
			enabled["Auto Buy All Gear"] = arg
		end)

		local v25 = tbl4.Shop:AddSection("Shop Crate")

		funcs:Dropdown(v25, "Select Crate ", "", true, modules.Shop.GetShopList("CrateShop"), { "" }, true, function(arg)
			enabled["Select Crate "] = arg
		end)

		funcs:Toggle(v25, "Auto Buy Crate", "", false, true, function(arg)
			enabled["Auto Buy Crate"] = arg
		end)

		funcs:Toggle(v25, "Auto Buy All Crate", "", false, true, function(arg)
			enabled["Auto Buy All Crate"] = arg
		end)

		local v26 = tbl4.Shop:AddSection("Shop Auction")

		funcs:Dropdown(v26, "Select Seed  ", "", true, modules.Shop.GetShopList("SeedShop"), { "" }, true, function(arg)
			enabled["Select Seed  "] = arg
		end)

		funcs:Dropdown(v26, "Select Gear  ", "", true, modules.Shop.GetShopList("GearShop"), { "" }, true, function(arg)
			enabled["Select Gear  "] = arg
		end)

		funcs:Dropdown(v26, "Select Seed Pack", "", true, managers2:GetSeedPackList(), { "" }, true, function(arg)
			enabled["Select Seed Pack"] = arg
		end)

		funcs:Dropdown(v26, "Select Egg", "", true, managers2:GetEggList(), { "" }, true, function(arg)
			enabled["Select Egg"] = arg
		end)

		v26:AddLine()

		funcs:Dropdown(v26, "Auction Price Mode ", "", false, { "Above", "Below" }, { "" }, true, function(arg)
			enabled["Auction Price Mode "] = arg
		end)

		funcs:Textbox(v26, "Auction Price", "max/min cost to buy. if you don't want use this, just input '0'", "0", true, function(arg)
			enabled["Auction Price"] = modules.Converter.CorrectNumber(arg) or 0
		end)

		v26:AddLine()

		funcs:Toggle(v26, "Auto Buy Auction", "", false, true, function(arg)
			enabled["Auto Buy Auction"] = arg

			utils.Fallback(arg, "Auto Buy Auction", function()
				local auction = playerGui:FindFirstChild("Auction")
				if not auction then
					return
				end
				local frame = auction:FindFirstChild("Frame")
				if not (frame and frame:FindFirstChild("ScrollingFrame")) or not frame then
					return
				end

				if auction.Enabled and frame.Visible then
					auction.Enabled = false
					frame.Visible = true
				end
			end)
		end)

		local v27 = tbl4.Webhook:AddSection("Config Webhook")

		funcs:Textbox(v27, "Webhook URL", "Input your webhook URL.", false, true, function(arg)
			enabled["Webhook URL"] = arg
		end)

		funcs:Textbox(v27, "Ping Message/ID", "", false, true, function(arg)
			enabled["Ping Message/ID"] = arg
		end)

		funcs:Toggle(v27, "Allow Ping On Ping Message/ID", "", false, true, function(arg)
			enabled["Allow Ping On Ping Message/ID"] = arg
		end)

		local v28 = tbl4.Webhook:AddSection("Pets Purchase Webhook")

		funcs:Dropdown(v28, "Select Pets ", "", true, managers2:GetPetList(), { "" }, true, function(arg)
			enabled["Select Pets "] = arg
		end)

		funcs:Dropdown(v28, "Select Rarity Pets ", "", true, managers2:GetRarityList(), { "" }, true, function(arg)
			enabled["Select Rarity Pets "] = arg
		end)

		funcs:Dropdown(v28, "Select Size Pets ", "", true, { "None", "Big", "Huge" }, { "" }, true, function(arg)
			enabled["Select Size Pets "] = arg
		end)

		funcs:Toggle(v28, "Pets Purchase Webhook", "", false, true, function(arg)
			enabled["Pets Purchase Webhook"] = arg
		end)

		task.spawn(pcall, function()
			modules.Networker.Fire_Network({ "Pets", "WildPetTameResult" }).OnClientEvent:Connect(function(arg, arg2)
				if not enabled["Pets Purchase Webhook"] or shx.Unloaded then
					return
				end

				if arg2 ~= localPlayer.UserId then
					return
				end

				if not modules.PetFilter({ enabled["Select Pets "], enabled["Select Rarity Pets "], enabled["Select Size Pets "] }, arg) then
					return
				end
				local attribute = arg:GetAttribute("PetName")
				local attribute2 = arg:GetAttribute("Rarity")
				local attribute3 = arg:GetAttribute("PetSize") or "None"
				if not attribute or not attribute2 then
					return
				end
				local sharedModules = ReplicatedStorage:FindFirstChild("SharedModules")
				local rarityData = sharedModules and sharedModules:FindFirstChild("RarityData")
				rarityData = rarityData and rarityData:FindFirstChild("Gradients")
				rarityData = rarityData and rarityData:FindFirstChild(attribute2)
				local value = rarityData.Color.Keypoints[math.floor(#rarityData.Color.Keypoints / 2) + 1].Value
				local n = math.floor(value.R * 255) * 65536 + math.floor(value.G * 255) * 256 + math.floor(value.B * 255)
				sharedModules = sharedModules and sharedModules:FindFirstChild("GearImages")

				modules.Webhook(enabled["Webhook URL"], {
					content = "",
					embeds = {
						{
							title = "**Speed Hub X | Grow A Garden 2**",
							type = "rich",
							color = n,
							thumbnail = { url = modules.GetImageURL((sharedModules and sharedModules:FindFirstChild(attribute, true)).Value) or "" },
							fields = {
								{
									name = "** -> Profile : ** \n",
									value = "> Username : || " .. localPlayer.Name .. " ||",
									inline = false,
								},
								{
									name = "** -> Purchased Pet : ** \n",
									value = "> Pet: ``" .. attribute .. "``" .. "\n> Rarity: ``" .. attribute2 .. "``" .. "\n> Size: ``" .. attribute3 .. "``",
									inline = false,
								},
							},
						},
					},
				})
			end)
		end)

		local v29 = tbl4.Webhook:AddSection("Pets Spawned Webhook")

		funcs:Dropdown(v29, "Select Pets    ", "", true, managers2:GetPetList(), { "" }, true, function(arg)
			enabled["Select Pets    "] = arg
		end)

		funcs:Dropdown(v29, "Select Rarity Pets    ", "", true, managers2:GetRarityList(), { "" }, true, function(arg)
			enabled["Select Rarity Pets    "] = arg
		end)

		funcs:Dropdown(v29, "Select Size Pets    ", "", true, { "None", "Big", "Huge" }, { "" }, true, function(arg)
			enabled["Select Size Pets    "] = arg
		end)

		funcs:Toggle(v29, "Pets Spawned Webhook", "", false, true, function(arg)
			enabled["Pets Spawned Webhook"] = arg
		end)

		task.spawn(function()
			local map = workspace:WaitForChild("Map")
			local wildPetSpawns = map and map:WaitForChild("WildPetSpawns")
			local wildPetRef = map and map:WaitForChild("WildPetRef")
			if not wildPetSpawns or not wildPetRef then
				return
			end

			utils.Connections(wildPetSpawns.ChildAdded, function(arg)
				if not enabled["Pets Spawned Webhook"] or shx.Unloaded then
					return
				end

				if not arg:IsA("Model") then
					return
				end
				local match = arg.Name:match("%x%x%x%x%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%x%x%x%x%x%x%x%x")
				if not match then
					return
				end
				local v30 = wildPetRef:FindFirstChild("WildPet_" .. match) or wildPetRef:WaitForChild("WildPet_" .. match, 5)
				if not v30 then
					return
				end

				if not modules.PetFilter({ enabled["Select Pets    "], enabled["Select Rarity Pets    "], enabled["Select Size Pets    "] }, v30) then
					return
				end
				local attribute = v30:GetAttribute("PetName") or v30:GetAttribute("Pet")
				local attribute2 = v30:GetAttribute("Rarity")
				local attribute3 = v30:GetAttribute("PetSize") or "None"
				if not attribute or not attribute2 then
					return
				end
				local sharedModules = ReplicatedStorage:FindFirstChild("SharedModules")
				local rarityData = sharedModules and sharedModules:FindFirstChild("RarityData")
				rarityData = rarityData and rarityData:FindFirstChild("Gradients")
				rarityData = rarityData and rarityData:FindFirstChild(attribute2)
				local n = 0

				if rarityData then
					local value = rarityData.Color.Keypoints[math.floor(#rarityData.Color.Keypoints / 2) + 1].Value
					n = math.floor(value.R * 255) * 65536 + math.floor(value.G * 255) * 256 + math.floor(value.B * 255)
				end

				sharedModules = sharedModules and sharedModules:FindFirstChild("GearImages")
				sharedModules = sharedModules and sharedModules:FindFirstChild(attribute, true)
				local attribute4 = v30:GetAttribute("Price")
				local webhook = modules.Webhook
				local webhookUrl = enabled["Webhook URL"]
				local tbl5 = { content = "" }
				local embeds = {}

				local tbl6 = {
					title = "**Speed Hub X | Grow A Garden 2**",
					type = "rich",
					color = n,
					thumbnail = { url = sharedModules and modules.GetImageURL(sharedModules.Value) or "" },
				}

				local fields = {}
				local tbl7 = { name = "** -> Profile : ** \n", value = "> Username : || " .. localPlayer.Name .. " ||", inline = false }

				local tbl8 = {
					name = "** -> Spawned Pet : ** \n",
					value = "> Pet: ``" .. attribute .. "``" .. "\n> Rarity: ``" .. attribute2 .. "``" .. "\n> Size: ``" .. attribute3 .. "``" .. (attribute4 and "\n> Price: ``" .. tostring(attribute4) .. "``" or ""),
					inline = false,
				}

				fields[1] = tbl7
				fields[2] = tbl8
				tbl6.fields = fields
				embeds[1] = tbl6
				tbl5.embeds = embeds
				webhook(webhookUrl, tbl5)
			end)
		end)

		local v30 = tbl4.Webhook:AddSection("Webhook Collection Event Seed")

		funcs:Dropdown(v30, "Select Event Seed", "", true, { "None", "Rainbow", "Gold", "Mega" }, { "" }, true, function(arg)
			enabled["Select Event Seed"] = arg
		end)

		funcs:Toggle(v30, "Webhook Collection Event Seed", "", false, true, function(arg)
			enabled["Webhook Collection Event Seed"] = arg
		end)

		task.spawn(function()
			local v31 = modules.Networker.Fire_Network({ "SeedPackSpawn", "Claimed" })
			if not v31 then
				return
			end

			v31.OnClientEvent:Connect(function(arg, arg2)
				if not enabled["Webhook Collection Event Seed"] or shx.Unloaded then
					return
				end

				if arg ~= localPlayer.Name then
					return
				end

				if not arg2 then
					return
				end
				local str = arg2:gsub(" Seed", "")

				local function fn14()
					for _, v32 in localPlayer.Backpack:GetChildren() do
						if v32:GetAttribute("MainCategory") ~= "Seed" then
							continue
						end

						if v32:GetAttribute("SeedTool") ~= str then
							continue
						end
						return v32:GetAttribute("Count") or 0
					end

					return 0
				end

				if not table.find(enabled["Select Event Seed"], str) then
					return
				end
				local tbl5 = { 16711680, 16744192, 16776960, 65280, 255, 4915330, 9371903 }
				local flag = str == "Rainbow"
				local n = flag and tbl5[math.random(1, #tbl5)]

				if not n then
					local flag2 = str == "Mega"
					n = 255
					n = flag2 and n
					n = n or 13938487
				end

				local str2 = str == "Mega" and "rbxassetid://114891363508607" or flag and "rbxassetid://120945553785140" or "rbxassetid://80997083385476"
				local webhook = modules.Webhook
				local webhookUrl = enabled["Webhook URL"]
				local tbl6 = { content = "" }
				local embeds = {}

				local tbl7 = {
					title = "**Speed Hub X | Grow A Garden 2**",
					type = "rich",
					color = n,
					thumbnail = { url = modules.GetImageURL(str2) or "" },
				}

				local fields = {}
				local tbl8 = { name = "** -> Profile : **", value = "> Username : || " .. localPlayer.Name .. " ||", inline = false }

				local tbl9 = {
					name = "** -> Collected Seed : **",
					value = "> Type: ``" .. str .. "``" .. "\n> Total Inventory Count: ``" .. fn14(str) .. "``",
					inline = false,
				}

				fields[1] = tbl8
				fields[2] = tbl9
				tbl7.fields = fields
				embeds[1] = tbl7
				tbl6.embeds = embeds
				webhook(webhookUrl, tbl6)
			end)
		end)

		local v31 = tbl4.Miscellaneous:AddSection("Teleport World Event")
		v31:AddSeperator({ " - [ Fall Harvest ] - " })

		funcs:Toggle(v31, "Auto Teleport Fall Harvest", "", false, true, function(arg)
			enabled["Auto Teleport Fall Harvest"] = arg
		end)

		local esp = tbl4.Miscellaneous:AddSection("ESP")
		esp:AddSeperator({ " - [ ESP Fruit ] - " })

		funcs:Dropdown(esp, "Select ESP Fruit", "", true, managers2:GetSeedList(), { "" }, true, function(arg)
			enabled["Select ESP Fruit"] = arg
		end)

		funcs:Dropdown(esp, "Select ESP Rarity", "", true, managers2:GetRarityList(), { "" }, true, function(arg)
			enabled["Select ESP Rarity"] = arg
		end)

		funcs:Dropdown(esp, "Select ESP Mutation", "", true, managers2:GetMutationList(), { "" }, true, function(arg)
			enabled["Select ESP Mutation"] = arg
		end)

		funcs:Toggle(esp, "ESP Fruit", "", false, true, function(arg)
			enabled["ESP Fruit"] = arg

			utils.Fallback(arg, "ESP Fruit", function()
				local plants = modules.GetOwnerPlot()
				plants = plants and plants:FindFirstChild("Plants")
				if not plants then
					return
				end
				local v32 = modules.Collection.GetPlantList(plants, {})
				if not v32 then
					return
				end

				for _, v33 in next, v32, nil do
					modules.ESP.Removes(v33)
				end
			end)
		end)

		esp:AddSeperator({ " - [ ESP Spawned Pets ] - " })

		funcs:Dropdown(esp, "Select Pets  ", "", true, managers2:GetPetList(), { "" }, true, function(arg)
			enabled["Select Pets  "] = arg
		end)

		funcs:Dropdown(esp, "Select Rarity Pets  ", "", true, managers2:GetRarityList(), { "" }, true, function(arg)
			enabled["Select Rarity Pets  "] = arg
		end)

		funcs:Dropdown(esp, "Select Size Pets  ", "", true, { "None", "Big", "Huge" }, { "" }, true, function(arg)
			enabled["Select Size Pets  "] = arg
		end)

		funcs:Toggle(esp, "ESP Spawned Pets", "", false, true, function(arg)
			enabled["ESP Spawned Pets"] = arg

			utils.Fallback(arg, "ESP Spawned Pets", function()
				local map = workspace:FindFirstChild("Map")
				map = map and map:FindFirstChild("WildPetSpawns")
				if not map then
					return
				end
				local v32 = next
				local descendants, v33 = map:GetDescendants()

				for _, v34 in v32, descendants, v33 do
					modules.ESP.Removes(v34)
				end
			end)
		end)

		esp:AddSeperator({ " - [ ESP Sprinkler ] - " })

		funcs:Dropdown(esp, "Select Ignore Sprinkler", "", true, managers2:GetSprinklerList(), { "" }, true, function(arg)
			enabled["Select Ignore Sprinkler"] = arg
		end)

		funcs:Toggle(esp, "ESP Sprinkler", "", false, true, function(arg)
			enabled["ESP Sprinkler"] = arg

			utils.Fallback(arg, "ESP Sprinkler", function()
				local sprinklers = modules.GetOwnerPlot()
				sprinklers = sprinklers and sprinklers:FindFirstChild("Sprinklers")
				if not sprinklers then
					return
				end

				for _, v32 in sprinklers:GetChildren() do
					modules.ESP.Removes(v32)
				end
			end)
		end)

		funcs:Toggle(tbl4.Miscellaneous:AddSection("Miscellaneous Predicitions"), "Event Weather Predictions", "", false, true, function(arg)
			enabled["Event Weather Predictions"] = arg

			utils.Fallback(arg, "Event Weather Predictions", function()
				for k in stored.Weather_Path, nil, nil do
					k.Visible = false
				end

				table.clear(stored.Weather_Path)
			end)
		end)

		local v32 = tbl4.Miscellaneous:AddSection("Miscellaneous Inventory")
		v32:AddSeperator({ " - [ Config ] - " })

		funcs:Toggle(v32, "Only Use Base Value For ESP Fruit", "", false, true, function(arg)
			enabled["Only Use Base Value For ESP Fruit"] = arg
		end)

		v32:AddSeperator({ " - [ ESP Inventory ] - " })

		funcs:Toggle(v32, "ESP Fruit Value", "", false, true, function(arg)
			enabled["ESP Fruit Value"] = arg

			utils.Fallback(arg, "ESP Fruit Value", function()
				local backpackGui = playerGui:FindFirstChild("BackpackGui")
				backpackGui = backpackGui and backpackGui:FindFirstChild("Backpack")
				if not backpackGui then
					return
				end

				for _, v33 in backpackGui:QueryDescendants("#Value"), nil, nil do
					v33:Destroy()
				end
			end)
		end)

		funcs:Toggle(v32, "ESP Total Value", "", false, true, function(arg)
			enabled["ESP Total Value"] = arg

			utils.Fallback(arg, "ESP Total Value", function()
				local backpackGui = playerGui:FindFirstChild("BackpackGui")
				backpackGui = backpackGui and backpackGui:FindFirstChild("Backpack")
				if not backpackGui then
					return
				end
				backpackGui = backpackGui and backpackGui:FindFirstChild("Inventory")
				backpackGui = backpackGui and backpackGui:FindFirstChild("FruitInventory")
				if not backpackGui then
					return
				end

				if not backpackGui.Text:match("$") then
					return
				end
				backpackGui.Visible = false
				local getAttribute = localPlayer.GetAttribute
				backpackGui.Text = ("%*/%* Fruits"):format(localPlayer:GetAttribute("FruitCount"), getAttribute(localPlayer, "MaxFruitCapacity"))
			end)
		end)

		local Miscellaneous = tbl4.Miscellaneous:AddSection("Miscellaneous")
		Miscellaneous:AddSeperator({ " - [ Tutorial ] - " })

		funcs:Toggle(Miscellaneous, "Auto Complete Tutorial", "Instant Complete Tutorial", false, true, function(arg)
			enabled["Auto Complete Tutorial"] = arg
		end)

		Miscellaneous:AddSeperator({ " - [ Screen ] - " })

		funcs:Toggle(Miscellaneous, "Full Bright", "", false, true, function(arg)
			enabled["Full Bright"] = arg
		end)

		funcs:Toggle(Miscellaneous, "Infinite Zoom Out", "", false, true, function(arg)
			enabled["Infinite Zoom Out"] = arg

			utils.Fallback(arg, "Infinite Zoom Out", function()
				if localPlayer:GetAttribute("CameraMaxZoomDistance") then
					localPlayer.CameraMaxZoomDistance = localPlayer:GetAttribute("CameraMaxZoomDistance")
				end
			end)
		end)

		Miscellaneous:AddSeperator({ " - [ Fling ] - " })

		funcs:Toggle(Miscellaneous, "Anti-Fling", "", true, true, function(arg)
			enabled["Anti-Fling"] = arg
		end)

		Miscellaneous:AddSeperator({ " - [ Knockback ] - " })

		funcs:Toggle(Miscellaneous, "Less knockback", "", false, true, function(arg)
			enabled["Less knockback"] = arg

			if not arg and stored.Connections["Anti-Knockback"] then
				stored.Connections["Anti-Knockback"]:Disconnect()
				stored.Connections["Anti-Knockback"] = nil
			end
		end)

		Miscellaneous:AddSeperator({ " - [ Prompt ] - " })

		funcs:Toggle(Miscellaneous, "Instant Interact Prompt", "", false, true, function(arg)
			enabled["Instant Interact Prompt"] = arg
		end)

		Miscellaneous:AddSeperator({ " - [ Loading ] - " })

		funcs:Toggle(Miscellaneous, "Auto Skip Loading", "", false, true, function(arg)
			enabled["Auto Skip Loading"] = arg
			if not arg then
				return
			end
			local ProximityPromptService = game:GetService("ProximityPromptService")

			task.spawn(function()
				while true do
					task.wait(0.1)
					if not (not enabled["Auto Skip Loading"] or shx.Unloaded or CollectionService:HasTag(localPlayer, "PersistentLoaded") and CollectionService:HasTag(localPlayer, "DataLoaded") and localPlayer:GetAttribute("PlotId")) then
						continue
					end
					break
				end

				if not enabled["Auto Skip Loading"] or shx.Unloaded then
					return
				end
				local character = localPlayer.Character
				local playerGui2 = localPlayer:FindFirstChildOfClass("PlayerGui")
				local currentCamera = workspace.CurrentCamera
				local attribute = localPlayer:GetAttribute("PlotId")
				local gardens = workspace:FindFirstChild("Gardens")
				local loadingScreenMenu = workspace:FindFirstChild("LoadingScreenMenu")

				if loadingScreenMenu then
					pcall(function()
						loadingScreenMenu.Parent = nil
					end)
				end

				if currentCamera then
					currentCamera.CameraType = Enum.CameraType.Custom
					currentCamera.FieldOfView = 70
				end

				local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")

				if not humanoidRootPart and character then
					humanoidRootPart = character:WaitForChild("HumanoidRootPart", 5)
				end

				if humanoidRootPart then
					humanoidRootPart.Anchored = false
					gardens = gardens and gardens:FindFirstChild("Plot" .. attribute)
					gardens = gardens and gardens:FindFirstChild("SpawnPoint")

					if gardens then
						character:PivotTo(gardens.CFrame)
					end
				end

				local flag = false

				if getgc then
					local v33 = nil

					pcall(function()
						for _, v34 in ipairs(getgc(true)) do
							if type(v34) ~= "table" then
								continue
							else
								for k, v35 in pairs(v34) do
									if typeof(k) == "Instance" and k:IsA("ScreenGui") and k.Parent == playerGui2 and type(v35) == "boolean" then
										v33 = v34
										break
									end
								end

								if not v33 then
									continue
								end
							end

							break
						end
					end)

					flag = false

					if v33 then
						if getconnections then
							pcall(function()
								for k in pairs(v33) do
									for _, v34 in ipairs(getconnections(k:GetPropertyChangedSignal("Enabled"))) do
										v34:Disconnect()
									end
								end

								if playerGui2 then
									for _, v34 in ipairs(getconnections(playerGui2.ChildAdded)) do
										v34:Disconnect()
									end
								end
							end)
						end

						for k, v34 in pairs(v33) do
							pcall(function()
								k.Enabled = v34
							end)
						end

						flag = true
					end
				end

				if not flag and playerGui2 then
					local tbl5 = { CustomLoadingScreen = true, LoadingGui = true }
					local tbl6 = { "hud", "chat", "hotbar", "backpack", "main", "interface", "mobile", "button" }

					for _, child in ipairs(playerGui2:GetChildren()) do
						if not (not child:IsA("ScreenGui") or tbl5[child.Name]) then
							local str = child.Name:lower()

							for _, v33 in ipairs(tbl6) do
								if str:find(v33, 1, true) then
									pcall(function()
										child.Enabled = true
									end)

									break
								end
							end
						end
					end
				end

				ProximityPromptService.Enabled = true
				localPlayer:SetAttribute("LoadingScreenActive", false)
				localPlayer:SetAttribute("LoadingScreenDone", true)
			end)
		end)

		Miscellaneous:AddSeperator({ " - [ Gameplay Paused ] - " })

		funcs:Toggle(Miscellaneous, "Bypass Gameplay Paused", "Prevents the gameplay paused screen from appearing or quickly dismisses it.", true, true, function(arg)
			enabled["Bypass Gameplay Paused"] = arg
		end)

		task.spawn(function()
			utils.Connections(heartbeat, function()
				if not enabled["Bypass Gameplay Paused"] or shx.Unloaded then
					return
				end

				for i = 1, 5 do
					localPlayer.GameplayPaused = false
				end
			end)
		end)

		local v33 = tbl4.Miscellaneous:AddSection("Misc Garden")
		v33:AddSeperator({ " - [ Plants ] - " })

		funcs:Toggle(v33, "Noclip Plants", "", false, true, function(arg)
			enabled["Noclip Plants"] = arg
		end)

		v33:AddSeperator({ " - [ Hide Tree ] - " })

		funcs:Dropdown(v33, "Select Ignore Tree", "", true, managers2:GetSeedList(), { "" }, true, function(arg)
			enabled["Select Ignore Tree"] = arg
		end)

		funcs:Toggle(v33, "Hide All Tree", "", false, true, function(arg)
			enabled["Hide All Tree"] = arg

			utils.Fallback(arg, "Hide All Tree", function()
				local tree = stored.HidePlant.Tree
				if not tree or not next(tree) then
					return
				end

				for _, v34 in tree, nil, nil do
					if v34.Parts then
						for _, v35 in v34.Parts, nil, nil do
							if v35.Part and v35.Part.Parent then
								v35.Part.Transparency = v35.Transparency
								v35.Part.CanCollide = v35.CanCollide
							end
						end
					end

					if v34.Effects then
						for _, v35 in v34.Effects, nil, nil do
							if v35.Object and v35.Object.Parent then
								v35.Object[v35.Property] = v35.Value
							end
						end
					end
				end

				table.clear(stored.HidePlant.Tree)
			end)
		end)

		v33:AddSeperator({ " - [ Hide Fruit ] - " })

		funcs:Dropdown(v33, "Select Ignore Fruit", "", true, managers2:GetSeedList(), { "" }, true, function(arg)
			enabled["Select Ignore Fruit"] = arg
		end)

		funcs:Toggle(v33, "Hide All Fruit", "", false, true, function(arg)
			enabled["Hide All Fruit"] = arg

			utils.Fallback(arg, "Hide All Fruit", function()
				local fruit = stored.HidePlant.Fruit
				if not fruit or not next(fruit) then
					return
				end

				for _, v34 in fruit, nil, nil do
					if v34.Parts then
						for _, v35 in v34.Parts, nil, nil do
							if v35.Part and v35.Part.Parent then
								v35.Part.Transparency = v35.Transparency
								v35.Part.CanCollide = v35.CanCollide
							end
						end
					end

					if v34.Effects then
						for _, v35 in v34.Effects, nil, nil do
							if v35.Object and v35.Object.Parent then
								v35.Object[v35.Property] = v35.Value
							end
						end
					end
				end

				table.clear(stored.HidePlant.Fruit)
			end)
		end)

		local Server = tbl4.Miscellaneous:AddSection("Server")
		Server:AddSeperator({ " - [ Rejoin Server ] - " })

		funcs:Button(Server, "Rejoin", "", function()
			if modules.IsPrivateServer() and #Players:GetPlayers() > 1 then
				TeleportService:Teleport(game.PlaceId, localPlayer)
			else
				modules.Networker.Fire("AntiAfkRequestHop")
			end
		end)

		Server:AddLine()

		funcs:Textbox(Server, "Delay To Rejoin", "", "5", true, function(arg)
			enabled["Delay To Rejoin"] = tonumber(arg)
		end)

		funcs:Toggle(Server, "Auto Rejoin", "", false, true, function(arg)
			enabled["Auto Rejoin"] = arg
		end)

		Server:AddSeperator({ " - [ Ping ] - " })

		funcs:Textbox(Server, "Set Ping", "", "500", true, function(arg)
			enabled["Set Ping"] = tonumber(arg)
		end)

		funcs:Toggle(Server, "Enable Set Ping", "", false, true, function(arg)
			enabled["Enable Set Ping"] = arg

			task.spawn(function()
				if enabled["Enable Set Ping"] then
					settings():GetService("NetworkSettings").IncomingReplicationLag = math.clamp(enabled["Set Ping"] * 0.0006, 0, 1)
				else
					settings():GetService("NetworkSettings").IncomingReplicationLag = 0
				end
			end)
		end)

		Server:AddSeperator({ " - [ Job Server ] - " })

		funcs:Textbox(Server, "Job ID", "", "", true, function(arg)
			enabled["Job ID"] = arg
		end)

		funcs:Button(Server, "Join Job ID", "", function()
			TeleportService:TeleportToPlaceInstance(game.PlaceId, State["Job ID"], localPlayer)
		end)

		Server:AddSeperator({ " - [ Other ] - " })

		funcs:Toggle(Server, "Auto Execute Script When Reconnected", "this means when you reconnectd and then execute the speed hub x script without manually executing, and you must enable 'Auto Reconnect' first, it is useful for farmers ugphone or somethings", true, true, function(arg)
			enabled["Auto Execute Script When Reconnected"] = arg
		end)

		funcs:Toggle(Server, "Auto Reconnect ", "", false, true, function(arg)
			enabled["Auto Reconnect "] = arg
		end, "If you enable this, when you are in a private server and get kicked, it will reconnect you to a public server or show an error. There is no way to reconnect to a private server it’s not possible.")

		task.spawn(function()
			utils.Connections(CoreGui:FindFirstChild("RobloxPromptGui"):FindFirstChild("promptOverlay").ChildAdded, function(arg)
				if enabled["Auto Reconnect "] and arg.Name == "ErrorPrompt" then
					task.delay(2, function()
						if enabled["Auto Execute Script When Reconnected"] then
							queue_on_teleport(" loadstring(game:HttpGet(\"https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua\", true))() ")
						end

						TeleportService:Teleport(game.PlaceId, localPlayer)
					end)
				end
			end)
		end)

		Server:AddSeperator({ " - [ Auto Executes ] - " })

		funcs:Toggle(Server, "Auto Execute Script", "", false, true, function(arg)
			enabled["Auto Execute Script"] = arg

			task.spawn(function()
				if enabled["Auto Execute Script"] then
					queue_on_teleport(" loadstring(game:HttpGet(\"https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua\", true))() ")
				else
					queue_on_teleport("")
				end
			end)
		end)

		local v34 = tbl4.Miscellaneous:AddSection("Hop Server")
		v34:AddSeperator({ " - [ Hop Place Version | Current : " .. game.PlaceVersion .. " ] - " })

		funcs:Textbox(v34, "Place Version", "", "", true, function(arg)
			enabled["Place Version"] = arg
		end)

		funcs:Toggle(v34, "Saver Auto Hop Until Place Version", "This means that when you enable 'Auto Hop Until Place Version', it will stay enabled even after rejoining or hopping", false, true, function(arg)
			enabled["Saver Auto Hop Until Place Version"] = arg
		end)

		v34:AddToggle({
			Title = "Auto Hop Until Place Version",
			Description = "",
			Default = false,
			Callback = function(arg)
				enabled["Auto Hop Until Place Version"] = arg

				task.spawn(function()
					while enabled["Auto Hop Until Place Version"] and not shx.Unloaded do
						task.wait(1)

						if game.PlaceVersion ~= tonumber(enabled["Place Version"]) then
							modules.Server_Hop.Hop()
						end
					end
				end)
			end,
			Saver = enabled["Saver Auto Hop Until Place Version"] or false,
		})

		v34:AddSeperator({ " - [ Hop Server ] - " })

		funcs:Button(v34, "Hop Server", "", function()
			modules.Server_Hop.Hop()
		end)

		local v35 = tbl4.Miscellaneous:AddSection("More FPS")

		funcs:Toggle(v35, "Remove Owner Garden", "", false, true, function(arg)
			enabled["Remove Owner Garden"] = arg

			utils.Fallback(arg, "Remove Owner Garden", function()
				task.spawn(function()
					local v36 = nil
					local n = 0

					for k, v37 in stored.RemoveOwnerGarden, nil, v36 do
						k = k and k.Parent

						if k then
							if v37.Part then
								v37.Part.Transparency = v37.Transparency
								v37.Part.CanCollide = v37.CanCollide
							elseif v37.Object then
								v37.Object[v37.Property] = v37.Value
							end
						end

						n += 1

						if n % 200 == 0 then
							task.wait()
						end
					end

					table.clear(stored.RemoveOwnerGarden)
				end)
			end)
		end)

		funcs:Button(v35, "Remove Other Gardens", "This does NOT mean removing your garden, it can remove other players' gardens to fix lag", function()
			local gardens = workspace:FindFirstChild("Gardens")
			if not gardens then
				return
			end

			for _, v36 in gardens:GetChildren() do
				local name = localPlayer.Name

				if v36:GetAttribute("Owner") ~= name then
					v36:Destroy()
					task.wait()
				end
			end
		end)

		funcs:Toggle(v35, "Auto Remove Other Gardens", "This does NOT mean removing your garden, it can remove other players' gardens to fix lag", false, true, function(arg)
			enabled["Auto Remove Other Gardens"] = arg
		end)

		funcs:Toggle(v35, "Reduce Lag", "", false, true, function(arg)
			enabled["Reduce Lag"] = arg
		end)

		funcs:Toggle(v35, "Show Screen White", "", false, true, function(arg)
			RunService:Set3dRenderingEnabled(not arg)
		end)

		funcs:Toggle(v35, "Show Screen Black", "", false, true, function(arg)
			Lighting.ExposureCompensation = arg and -10 or 0
		end)

		funcs:Button(tbl4.Settings:AddSection("Reset Config"), "Reset Script Config", "", function()
			for _, v36 in next, { "Speed_Hub", "SpeedHubX", "Speed Hub X", "Speed Hub", "Speed_Hub_X" }, nil do
				if isfolder(v36) then
					delfolder(v36)
				end
			end
		end)

		task.spawn(shx.AddSettingUi, shx, v6)
	end

	handlers.LoadFunction = function()
		local function fn12(arg, arg2)
			task.spawn(function()
				utils.StartLoop(arg, arg2)
			end)
		end

		fn12("Enable Walkspeed", function()
			local character = localPlayer and localPlayer.Character
			character = character and character:FindFirstChild("Humanoid")
			local walkSpeed = tonumber(enabled["Set Speed"]) or 20

			if character then
				character.WalkSpeed = walkSpeed
			end
		end)

		fn12("No Clip", function()
			local character = localPlayer and localPlayer.Character
			if not character then
				return
			end

			for _, child in pairs(character:GetChildren()) do
				if child:IsA("BasePart") then
					child.CanCollide = false
				end
			end
		end)

		fn12("Auto Plants Seed", function()
			local v6 = toolFunction.GetAllTool()
			local v7 = modules.GetOwnerPlot()
			local spawnPoint = v7 and v7:FindFirstChild("SpawnPoint")

			for _, v8 in v6, nil, nil do
				if not enabled["Auto Plants Seed"] then
					break
				end

				if not v8:IsA("Tool") then
					continue
				end
				local attribute = v8:GetAttribute("MainCategory")
				if not attribute or attribute ~= "Seed" then
					continue
				end
				local selectPosition = enabled["Select Position"]
				local vector_

				if selectPosition == "Player Position" then
					local character = localPlayer.Character
					vector_ = Vector3.new(localPlayer.Character:GetPivot().Position.X, localPlayer.Character:GetPivot().Position.Y - 4.5, character:GetPivot().Position.Z)
				elseif selectPosition == "Saved Position" then
					vector_ = Vector3.new(stored.Saved_Position.PlantSeed.X, stored.Saved_Position.PlantSeed.Y - 4.5, stored.Saved_Position.PlantSeed.Z)
				elseif selectPosition == "Sprinkler Radius" then
					local selectSprinklerForPlants = enabled["Select Sprinkler For Plants"]
					local sprinklers = v7 and v7:FindFirstChild("Sprinklers")
					local v9 = nil

					if sprinklers then
						v9 = nil

						for _, v10 in sprinklers:GetChildren() do
							if not v10:IsA("Model") then
								v9 = nil
							else
								local attribute2 = v10:GetAttribute("SprinklerName")

								if attribute2 and table.find(selectSprinklerForPlants, attribute2) then
									v9 = v10
									break
								else
									v9 = nil
								end
							end
						end
					end

					vector_ = nil

					if v9 then
						local boundingBox, v10 = v9:GetBoundingBox()
						local n = nil

						if v10 then
							n = math.max(v10.X, v10.Z) * 0.5
						end

						local n2 = n * (1 + math.random() ^ 0.35 * 5)
						local n3 = math.random() * 3.1415926535897931 * 2
						local n4 = math.random() * n2
						local vector_2 = Vector3.new
						vector_ = v9:GetPivot().Position + vector_2(math.cos(n3) * n4, 0, math.sin(n3) * n4)
					end
				else
					vector_ = managers2:GetRandomPlant()
				end

				if not vector_ then
					continue
				end
				local attribute2 = v8:GetAttribute("SeedTool")
				if not attribute2 or not table.find(enabled["Select Seeds"], attribute2) then
					continue
				end
				local disableTeleport = enabled["Disable Teleport"]
				local v9 = managers2:IsOnGarden()

				if not disableTeleport and not v9 then
					modules.TeleportManager.GetTo(spawnPoint.CFrame, "Auto Plants Seed", nil, nil, nil, function()
						if managers2:IsOnGarden() then
							return true
						end
						return false
					end)

					return
				end

				if enabled["Delay To Plants"] ~= 0 then
					task.wait(enabled["Delay To Plants"])
				end

				modules.Networker.Fire("PlantSeed", vector_, attribute2, v8)
			end

			modules.TeleportManager.Reset("Auto Plants Seed")
		end)

		fn12("Auto Plants All Seeds", function()
			local v6 = toolFunction.GetAllTool()
			local v7 = modules.GetOwnerPlot()
			local spawnPoint = v7 and v7:FindFirstChild("SpawnPoint")

			for _, v8 in v6, nil, nil do
				if not enabled["Auto Plants All Seeds"] then
					break
				end

				if not v8:IsA("Tool") then
					continue
				end
				local attribute = v8:GetAttribute("MainCategory")
				if not attribute or attribute ~= "Seed" then
					continue
				end
				local selectPosition = enabled["Select Position"]
				local vector_

				if selectPosition == "Player Position" then
					local character = localPlayer.Character
					vector_ = Vector3.new(localPlayer.Character:GetPivot().Position.X, localPlayer.Character:GetPivot().Position.Y - 4.5, character:GetPivot().Position.Z)
				elseif selectPosition == "Saved Position" then
					vector_ = Vector3.new(stored.Saved_Position.PlantSeed.X, stored.Saved_Position.PlantSeed.Y - 4.5, stored.Saved_Position.PlantSeed.Z)
				elseif selectPosition == "Sprinkler Radius" then
					local selectSprinklerForPlants = enabled["Select Sprinkler For Plants"]
					local sprinklers = v7 and v7:FindFirstChild("Sprinklers")
					local v9 = nil

					if sprinklers then
						v9 = nil

						for _, v10 in sprinklers:GetChildren() do
							if not v10:IsA("Model") then
								v9 = nil
							else
								local attribute2 = v10:GetAttribute("SprinklerName")

								if attribute2 and table.find(selectSprinklerForPlants, attribute2) then
									v9 = v10
									break
								else
									v9 = nil
								end
							end
						end
					end

					vector_ = nil

					if v9 then
						local boundingBox, v10 = v9:GetBoundingBox()
						local n = nil

						if v10 then
							n = math.max(v10.X, v10.Z) * 0.5
						end

						local n2 = n * (1 + math.random() ^ 0.35 * 5)
						local n3 = math.random() * 3.1415926535897931 * 2
						local n4 = math.random() * n2
						local vector_2 = Vector3.new
						vector_ = v9:GetPivot().Position + vector_2(math.cos(n3) * n4, 0, math.sin(n3) * n4)
					end
				else
					vector_ = managers2:GetRandomPlant()
				end

				if not vector_ then
					continue
				end
				local attribute2 = v8:GetAttribute("SeedTool")
				if not attribute2 then
					continue
				end
				local disableTeleport = enabled["Disable Teleport"]
				local v9 = managers2:IsOnGarden()

				if not disableTeleport and not v9 then
					modules.TeleportManager.GetTo(spawnPoint.CFrame, "Auto Plants All Seeds", nil, nil, nil, function()
						if managers2:IsOnGarden() then
							return true
						end
						return false
					end)

					return
				end

				if enabled["Delay To Plants"] ~= 0 then
					task.wait(enabled["Delay To Plants"])
				end

				modules.Networker.Fire("PlantSeed", vector_, attribute2, v8)
			end

			modules.TeleportManager.Reset("Auto Plants All Seeds")
		end)

		fn12("Disable Collect Prompt", function()
			local plants = modules.GetOwnerPlot()
			plants = plants and plants:FindFirstChild("Plants")
			if not plants then
				return
			end

			for _, v6 in plants:QueryDescendants("ProximityPrompt") do
				if not enabled["Disable Collect Prompt"] then
					return
				end

				if v6:GetAttribute("Backup_MaxDist") == nil then
					v6:SetAttribute("Backup_MaxDist", v6.MaxActivationDistance)
				end

				if v6.MaxActivationDistance ~= 0 then
					v6.MaxActivationDistance = 0
				end
			end

			task.wait(1.5)
		end)

		fn12("Auto Collect Fruit", function()
			local spawnPoint = modules.GetOwnerPlot()
			local plants = spawnPoint and spawnPoint:FindFirstChild("Plants")
			if not plants then
				return
			end
			spawnPoint = spawnPoint and spawnPoint:FindFirstChild("SpawnPoint")
			local v6 = modules.Collection.GetPlantList(plants, {})
			if not v6 then
				return
			end
			local playerScripts = localPlayer and localPlayer:FindFirstChild("PlayerScripts")
			local v7 = fn5((playerScripts and playerScripts:FindFirstChild("Controllers")):FindFirstChild("FruitVisualizerController"))

			for _, v8 in ipairs(v6) do
				if not enabled["Auto Collect Fruit"] then
					break
				end

				if enabled["Stop Collect If Backpack Is Full Max"] and toolFunction.IsMaxInventory() then
					break
				end
				local attribute = v8:GetAttribute("PlantId")
				local attribute2 = v8:GetAttribute("FruitId") or ""
				if not attribute then
					continue
				end

				if not modules.FruitFilter({
					enabled["Select Fruit"],
					enabled["Select Rarity"],
					enabled["Select Mutation"],
					{
						enabled["Select Threshold Mode"],
						enabled["Weight Threshold"],
						attribute2 ~= "" and v7:CalculateFruitWeight(v8) or v7:CalculatePlantWeight(v8),
					},
				}, v8, enabled["Select Filter"]) then
					continue
				end

				local disableTeleport = enabled["Disable Teleport "]
				local v9 = managers2:IsOnGarden()

				if spawnPoint and not disableTeleport and not v9 then
					modules.TeleportManager.GetTo(spawnPoint.CFrame, "Auto Collect Fruit", nil, nil, nil, function()
						if managers2:IsOnGarden() then
							return true
						end
						return false
					end)

					return
				end

				if enabled["Delay To Collect"] ~= 0 then
					task.wait(enabled["Delay To Collect"] or 0)
				end

				modules.Networker.Fire("CollectFruit", attribute, attribute2)
				task.wait(0.01)
			end

			modules.TeleportManager.Reset("Auto Collect Fruit")
			task.wait(0.5)
		end)

		fn12("Auto Collect All Fruit", function()
			local spawnPoint = modules.GetOwnerPlot()
			local plants = spawnPoint and spawnPoint:FindFirstChild("Plants")
			if not plants then
				return
			end
			spawnPoint = spawnPoint and spawnPoint:FindFirstChild("SpawnPoint")
			local v6 = modules.Collection.GetPlantList(plants, {})
			if not v6 then
				return
			end

			for _, v7 in ipairs(v6) do
				if not enabled["Auto Collect All Fruit"] then
					break
				end

				if enabled["Stop Collect If Backpack Is Full Max"] and toolFunction.IsMaxInventory() then
					break
				end
				local attribute = v7:GetAttribute("PlantId")
				local attribute2 = v7:GetAttribute("FruitId") or ""
				if not attribute then
					continue
				end
				local disableTeleport = enabled["Disable Teleport "]
				local v8 = managers2:IsOnGarden()

				if not disableTeleport and not v8 then
					modules.TeleportManager.GetTo(spawnPoint.CFrame, "Auto Collect All Fruit", nil, nil, nil, function()
						if managers2:IsOnGarden() then
							return true
						end
						return false
					end)

					return
				end

				if enabled["Delay To Collect"] ~= 0 then
					task.wait(enabled["Delay To Collect"] or 0)
				end

				modules.Networker.Fire("CollectFruit", attribute, attribute2)
				task.wait(0.01)
			end

			modules.TeleportManager.Reset("Auto Collect All Fruit")
			task.wait(0.5)
		end)

		fn12("Auto Collect Best Fruit", function()
			local spawnPoint = modules.GetOwnerPlot()
			local plants = spawnPoint and spawnPoint:FindFirstChild("Plants")
			if not plants then
				return
			end
			spawnPoint = spawnPoint and spawnPoint:FindFirstChild("SpawnPoint")
			local v6 = modules.Collection.GetPlantList(plants, {})
			if not v6 then
				return
			end

			if enabled["Stop Collect If Backpack Is Full Max"] and toolFunction.IsMaxInventory() then
				return
			end
			local sharedModules = ReplicatedStorage:FindFirstChild("SharedModules")
			local v7 = fn5(sharedModules and sharedModules:FindFirstChild("FruitValueCalc"))
			local tbl4 = {}

			for _, v8 in ipairs(v6) do
				if enabled["Auto Collect Best Fruit"] then
					if not (enabled["Stop Collect If Backpack Is Full Max"] and toolFunction.IsMaxInventory()) then
						local attribute = v8:GetAttribute("CorePartName") or v8:GetAttribute("SeedName")
						local attribute2 = v8:GetAttribute("Mutation")
						local ok, result = pcall(v7, attribute, v8:GetAttribute("SizeMulti"), attribute2, localPlayer, nil)

						if not (not ok or result == 0) then
							if enabled["Enable Filters"] then
								if not modules.FruitFilter({ enabled["Select Fruit"], enabled["Select Rarity"], enabled["Select Mutation"] }, v8, enabled["Select Filter"]) then
									continue
								end
							end

							tbl4[#tbl4 + 1] = { Fruit = v8, Value = result }
						end

						continue
					end
				end

				break
			end

			table.sort(tbl4, function(arg, arg2)
				return arg.Value > arg2.Value
			end)

			for _, v8 in ipairs(tbl4) do
				if not enabled["Auto Collect Best Fruit"] then
					break
				end

				if enabled["Stop Collect If Backpack Is Full Max"] and toolFunction.IsMaxInventory() then
					break
				end
				local fruit = v8.Fruit
				local attribute = fruit:GetAttribute("PlantId")
				local attribute2 = fruit:GetAttribute("FruitId") or ""
				if not attribute then
					continue
				end
				local disableTeleport = enabled["Disable Teleport "]
				local v9 = managers2:IsOnGarden()

				if not disableTeleport and not v9 then
					modules.TeleportManager.GetTo(spawnPoint.CFrame, "Auto Collect Best Fruit", nil, nil, nil, function()
						if managers2:IsOnGarden() then
							return true
						end
						return false
					end)

					return
				end

				if enabled["Delay To Collect"] ~= 0 then
					task.wait(enabled["Delay To Collect"] or 0)
				end

				modules.Networker.Fire("CollectFruit", attribute, attribute2)
				task.wait(0.01)
			end

			modules.TeleportManager.Reset("Auto Collect Best Fruit")
			task.wait(0.5)
		end)

		local function fn13(arg, arg2, arg3)
			local map = workspace:FindFirstChild("Map")
			if not map then
				return
			end
			local seedPackSpawnServerLocations = map:FindFirstChild("SeedPackSpawnServerLocations")
			if not seedPackSpawnServerLocations then
				return
			end
			local tbl4 = {}

			for _, v6 in seedPackSpawnServerLocations:GetChildren() do
				if enabled[arg] then
					if v6:IsA("BasePart") then
						if v6:GetAttribute(arg2) then
							local proximityPrompt = v6:FindFirstChild("ProximityPrompt", true)

							if proximityPrompt and proximityPrompt.Enabled then
								table.insert(tbl4, { Part = v6, Prompt = proximityPrompt })
							end
						end
					end

					continue
				end

				break
			end

			if #tbl4 == 0 then
				stored.Teleport_Handler[arg3] = false
				modules.TeleportManager.Reset(arg)
				return
			end

			stored.Teleport_Handler[arg3] = true

			for _, v6 in tbl4, nil, nil do
				if enabled[arg] then
					local part = v6.Part
					local prompt = v6.Prompt

					while enabled[arg] and part.Parent and part:FindFirstChild("ProximityPrompt", true) and prompt.Enabled and not shx.Unloaded do
						modules.TeleportManager.GetTo(part.CFrame, arg, nil, nil, nil, function()
							return not part:FindFirstChild("ProximityPrompt", true) or not part.Parent
						end)

						prompt.HoldDuration = 0
						fn6(prompt)
						task.wait()
					end

					continue
				end

				break
			end
		end

		fn12("Auto Collect Gold Seed", function()
			fn13("Auto Collect Gold Seed", "GoldSeed", "Gold_Seed")
		end)

		fn12("Auto Collect Rainbow Seed", function()
			fn13("Auto Collect Rainbow Seed", "RainbowSeed", "Rainbow_Seed")
		end)

		fn12("Auto Collect Mega Seed", function()
			fn13("Auto Collect Mega Seed", "MegaSeed", "Mega_Seed")
		end)

		fn12("Auto Collect Dropped Item", function()
			local droppedItems = workspace:FindFirstChild("DroppedItems")

			if not droppedItems then
				stored.Teleport_Handler.Dropped_Item = false
				modules.TeleportManager.Reset("Auto Collect Dropped Item")
				return
			end

			local tbl4 = {}

			for _, v6 in droppedItems:GetChildren() do
				if enabled["Auto Collect Dropped Item"] then
					if v6:IsA("Model") or v6:IsA("BasePart") then
						local attribute = v6:GetAttribute("OwnerRestricted")
						local attribute2 = v6:GetAttribute("DroppedBy")

						if attribute and attribute2 == localPlayer.UserId or not attribute then
							local proximityPrompt = v6:FindFirstChildWhichIsA("ProximityPrompt", true)

							if proximityPrompt and proximityPrompt.Enabled then
								table.insert(tbl4, { Part = v6, Prompt = proximityPrompt })
							end
						end
					end

					continue
				end

				break
			end

			if #tbl4 == 0 then
				stored.Teleport_Handler.Dropped_Item = false
				modules.TeleportManager.Reset("Auto Collect Dropped Item")
				return
			end

			stored.Teleport_Handler.Dropped_Item = true

			for _, v6 in tbl4, nil, nil do
				if enabled["Auto Collect Dropped Item"] then
					local part = v6.Part
					local prompt = v6.Prompt

					while enabled["Auto Collect Dropped Item"] and part.Parent and part:FindFirstChildWhichIsA("ProximityPrompt", true) and prompt.Enabled and not shx.Unloaded do
						modules.TeleportManager.GetTo(part:IsA("Model") and part:GetPivot() or part.CFrame, "Auto Collect Dropped Item", nil, nil, nil, function()
							return not part:FindFirstChildWhichIsA("ProximityPrompt", true) or not part.Parent
						end)

						prompt.HoldDuration = 0
						fn6(prompt)
						task.wait()
					end

					continue
				end

				break
			end
		end)

		fn12("Auto Steal Fruit", function()
			local night = ReplicatedStorage:FindFirstChild("Night")
			if not (night and night.Value) then
				task.wait(1)
				return
			end

			if localPlayer:GetAttribute("CarryingStolenFruit") then
				local v6 = modules.GetOwnerPlot()
				if not v6 then
					task.wait(0.5)
					return
				end
				local plotSizeReference = v6:FindFirstChild("PlotSizeReference")
				if not plotSizeReference then
					task.wait(0.5)
					return
				end

				modules.TeleportManager.GetTo(plotSizeReference.CFrame, "Auto Steal Fruit", nil, nil, nil, function()
					return localPlayer:GetAttribute("CarryingStolenFruit")
				end)

				task.wait(0.2)
				stored.Teleport_Handler.Steal_Fruit = false
				modules.TeleportManager.Reset("Auto Steal Fruit")
				return
			end

			local gardens = workspace:FindFirstChild("Gardens")
			if not gardens then
				task.wait(1)
				return
			end

			for _, v6 in gardens:GetChildren() do
				if not enabled["Auto Steal Fruit"] then
					break
				end

				if localPlayer:GetAttribute("CarryingStolenFruit") then
					break
				end

				if not v6:IsA("Model") then
					continue
				end
				local attribute = v6:GetAttribute("Owner")
				if not attribute or attribute == localPlayer.Name then
					continue
				end

				if managers2:IsGardenLocked(attribute) then
					continue
				end
				local plants = v6:FindFirstChild("Plants")
				if not plants then
					continue
				end
				local v7 = modules.Collection.GetPlantList(plants, {})

				for i = 1, #v7 do
					if not enabled["Auto Steal Fruit"] then
						break
					end

					if localPlayer:GetAttribute("CarryingStolenFruit") then
						break
					end
					local v8 = v7[i]

					if v8 then
						if not modules.FruitFilter({ enabled["Select Fruit "], enabled["Select Rarity "], enabled["Select Mutation "] }, v8, enabled["Select Filter "]) then
							continue
						end
						local stealPrompt = v8:FindFirstChild("StealPrompt", true)
						local plotSizeReference = modules.GetOwnerPlot(Players:GetPlayerByUserId(v8:GetAttribute("UserId")).Name):FindFirstChild("PlotSizeReference")

						if stealPrompt and stealPrompt.Enabled and stealPrompt.HoldDuration == 0 then
							stored.Teleport_Handler.Steal_Fruit = true

							if modules.GetMagnitude(plotSizeReference:GetPivot()) > 30 then
								modules.TeleportManager.GetTo(plotSizeReference:GetPivot(), "Auto Steal Fruit", nil, nil, nil, function()
									local playerByUserId = Players:GetPlayerByUserId(v8:GetAttribute("UserId"))
									if playerByUserId and managers2:IsGardenLocked(playerByUserId.Name) then
										return true
									end
									local night2 = ReplicatedStorage:FindFirstChild("Night")
									if not (night2 and night2.Value) then
										return true
									end
									return localPlayer:GetAttribute("CarryingStolenFruit")
								end)

								continue
							end

							if localPlayer:GetAttribute("CarryingStolenFruit") then
								return
							end
							local getAttribute = v8.GetAttribute
							modules.Networker.Fire("BeginSteal", v8:GetAttribute("UserId"), v8:GetAttribute("PlantId"), getAttribute(v8, "FruitId"))
							modules.Networker.Fire("CompleteSteal")
							if localPlayer:GetAttribute("CarryingStolenFruit") then
								return
							end
						end
					end
				end
			end

			stored.Teleport_Handler.Steal_Fruit = false
			modules.TeleportManager.Reset("Auto Steal Fruit")
			task.wait(1)
		end)

		fn12("Auto Steal Best Fruit", function()
			local night = ReplicatedStorage:FindFirstChild("Night")
			if not (night and night.Value) then
				return
			end

			if localPlayer:GetAttribute("CarryingStolenFruit") then
				local v6 = modules.GetOwnerPlot()
				if not v6 then
					return
				end
				local plotSizeReference = v6:FindFirstChild("PlotSizeReference")
				if not plotSizeReference then
					return
				end

				modules.TeleportManager.GetTo(plotSizeReference.CFrame, "Auto Steal Best Fruit", nil, nil, nil, function()
					return not localPlayer:GetAttribute("CarryingStolenFruit")
				end)

				task.wait(0.2)
				stored.Teleport_Handler.Steal_BestFruit = false
				modules.TeleportManager.Reset("Auto Steal Best Fruit")
				return
			end

			local sharedModules = ReplicatedStorage:FindFirstChild("SharedModules")
			local v6 = fn5(sharedModules and sharedModules:FindFirstChild("FruitValueCalc"))
			local v7 = nil
			local gardens = workspace:FindFirstChild("Gardens")
			if not gardens then
				return
			end
			local n = 0

			for _, v8 in gardens:GetChildren() do
				if enabled["Auto Steal Best Fruit"] then
					if not localPlayer:GetAttribute("CarryingStolenFruit") then
						if v8:IsA("Model") then
							local attribute = v8:GetAttribute("Owner")

							if not (not attribute or attribute == localPlayer.Name) then
								if not managers2:IsGardenLocked(attribute) then
									local plants = v8:FindFirstChild("Plants")

									if plants then
										local v9 = modules.Collection.GetPlantList(plants, {})

										for i = 1, #v9 do
											if enabled["Auto Steal Best Fruit"] then
												if not localPlayer:GetAttribute("CarryingStolenFruit") then
													local v10 = v9[i]

													if v10 then
														local attribute2 = v10:GetAttribute("CorePartName") or v10:GetAttribute("SeedName")
														local attribute3 = v10:GetAttribute("Mutation")
														local ok, result = pcall(v6, attribute2, v10:GetAttribute("SizeMulti"), attribute3, localPlayer, nil)

														if not (not ok or result == 0) then
															if n < result then
																v7 = v10
																n = result
															end
														end
													end

													continue
												end
											end

											break
										end
									end
								end
							end
						end

						continue
					end
				end

				break
			end

			if v7 then
				local stealPrompt = v7:FindFirstChild("StealPrompt", true)
				local plotSizeReference = modules.GetOwnerPlot(Players:GetPlayerByUserId(v7:GetAttribute("UserId")).Name):FindFirstChild("PlotSizeReference")
				if not plotSizeReference then
					return
				end

				if stealPrompt and stealPrompt.Enabled and stealPrompt.HoldDuration == 0 then
					stored.Teleport_Handler.Steal_BestFruit = true

					if modules.GetMagnitude(plotSizeReference:GetPivot()) > 30 then
						modules.TeleportManager.GetTo(plotSizeReference:GetPivot(), "Auto Steal Best Fruit", nil, nil, nil, function()
							local playerByUserId = Players:GetPlayerByUserId(v7:GetAttribute("UserId"))
							if playerByUserId and managers2:IsGardenLocked(playerByUserId.Name) then
								return true
							end
							local night2 = ReplicatedStorage:FindFirstChild("Night")
							if not (night2 and night2.Value) then
								return true
							end
							return localPlayer:GetAttribute("CarryingStolenFruit")
						end)
					else
						if localPlayer:GetAttribute("CarryingStolenFruit") then
							return
						end
						local getAttribute = v7.GetAttribute
						modules.Networker.Fire("BeginSteal", v7:GetAttribute("UserId"), v7:GetAttribute("PlantId"), getAttribute(v7, "FruitId"))
						modules.Networker.Fire("CompleteSteal")
						if localPlayer:GetAttribute("CarryingStolenFruit") then
							return
						end
					end
				end
			end

			stored.Teleport_Handler.Steal_BestFruit = false
			modules.TeleportManager.Reset("Auto Steal Best Fruit")
			task.wait(0.3)
		end)

		fn12("Auto Lock Garden At Night", function()
			local night = ReplicatedStorage:FindFirstChild("Night")
			if not (night and night.Value) then
				modules.TeleportManager.Reset("Auto Lock Garden At Night")
				return
			end

			if localPlayer:GetAttribute("IsInOwnGarden") then
				modules.TeleportManager.Reset("Auto Lock Garden At Night")
				return
			end
			local v6 = modules.GetOwnerPlot()
			local plotSizeReference = v6:FindFirstChild("PlotSizeReference")
			if not plotSizeReference then
				return
			end

			if not v6:FindFirstChild("GardenZonePart", true) then
				return
			end

			modules.TeleportManager.GetTo(plotSizeReference.CFrame, "Auto Lock Garden At Night", nil, nil, nil, function()
				local night2 = ReplicatedStorage:FindFirstChild("Night")
				if not (night2 and night2.Value) then
					return true
				end

				if localPlayer:GetAttribute("IsInOwnGarden") then
					return true
				end
				return false
			end)
		end)

		fn12("Auto Hit Player Stolen", function()
			local flag = false

			for _, v6 in Players:GetChildren() do
				if enabled["Auto Hit Player Stolen"] then
					if v6 ~= localPlayer then
						local attribute = v6:GetAttribute("CarryingStolenFruit")

						if attribute then
							local userId = localPlayer.UserId
							attribute = v6:GetAttribute("StolenFruitVictimUserId") == userId
						end

						if attribute then
							if not localPlayer.Character:FindFirstChild("Shovel") then
								toolFunction.EquipTool("Shovel")
								task.wait(0.2)
							end

							modules.TeleportManager.GetTo(v6.Character:GetPivot(), "Auto Hit Player Stolen", function()
								local attribute2 = v6:GetAttribute("CarryingStolenFruit")

								if attribute2 then
									local userId = localPlayer.UserId
									attribute2 = v6:GetAttribute("StolenFruitVictimUserId") == userId
								end

								if attribute2 then
									return false
								end
								return true
							end)

							modules.Networker.Fire("SwingShovel")
							modules.Networker.Fire("HitPlayer", v6.UserId)
							flag = true
						end
					end

					continue
				end

				break
			end

			if not flag then
				modules.TeleportManager.Reset("Auto Hit Player Stolen")
			end

			task.wait(0.5)
		end)

		local function fn14()
			local fruitStockPrice = playerGui:FindFirstChild("FruitStockPrice")
			if not fruitStockPrice then
				return false
			end
			local scrollingFrame = fruitStockPrice:FindFirstChild("ScrollingFrame", true)
			if not scrollingFrame then
				return false
			end
			local tbl4 = {}

			for _, v6 in ipairs(enabled["Select Target Fruit"]) do
				if v6 ~= "" then
					table.insert(tbl4, v6)
				end
			end

			local flag = #tbl4 > 0 and not table.find(tbl4, "None")

			for _, v6 in scrollingFrame:GetChildren() do
				if not v6:IsA("Frame") then
					continue
				end
				local attribute = v6:GetAttribute("SeedToolTip")
				if not attribute then
					continue
				end

				if flag and not table.find(tbl4, attribute) then
					continue
				end
				local multiplier = v6:FindFirstChild("Multiplier", true)
				if not multiplier then
					continue
				end
				local str = multiplier.Text:gsub("^X", "")
				local num = tonumber(str)
				if not num then
					continue
				end

				for _, v7 in ipairs(enabled["Select Price Multiplier X"]) do
					if v7 ~= "" and v7 ~= "None" then
						local str2 = v7:gsub("^X", "")
						local num2 = tonumber(str2)
						if num2 and num >= num2 then
							return true
						end
					end
				end
			end

			return false
		end

		fn12("Auto Sell All", function()
			if not enabled["Auto Sell All"] then
				return
			end

			if localPlayer:GetAttribute("FruitCount") == 0 then
				return
			end

			if enabled["Allow Sell at Multiplier"] and not fn14() then
				return
			end

			if not enabled["Allow Sell If Backpack Is Max"] then
				if enabled["Allows Double Or Nothing"] then
					modules.Networker.Fire("DoubleOrNothing")
					task.wait(0.1)
					modules.Networker.Fire("CashOutDoubleOrNothing")
					task.wait(0.1)
				end

				if enabled["Use Daily Deal"] then
					modules.Networker.Fire("UseDailyDealAll")
				end

				modules.Networker.Fire("SellAll")
			elseif toolFunction.IsMaxInventory() then
				if enabled["Allows Double Or Nothing"] then
					modules.Networker.Fire("DoubleOrNothing")
					task.wait(0.1)
					modules.Networker.Fire("CashOutDoubleOrNothing")
					task.wait(0.1)
				end

				if enabled["Use Daily Deal"] then
					modules.Networker.Fire("UseDailyDealAll")
				end

				modules.Networker.Fire("SellAll")
			end

			task.wait(tonumber(enabled["Delay To Sell Inventory"]) or 0.05)
		end)

		fn12("Auto Sell Fruit", function()
			if localPlayer:GetAttribute("FruitCount") == 0 then
				return
			end

			if enabled["Allow Sell at Multiplier"] and not fn14() then
				return
			end

			for _, v6 in toolFunction.GetAllTool(), nil, nil do
				if enabled["Auto Sell Fruit"] then
					if not (enabled["Allow Sell at Multiplier"] and not fn14()) then
						if v6:GetAttribute("HarvestedFruit") then
							if not v6:GetAttribute("IsFavorite") then
								local tbl4 = {}
								local selectSellFruit = enabled["Select Sell Fruit"]
								local selectSellRarity = enabled["Select Sell Rarity"]
								local selectSellMutation = enabled["Select Sell Mutation"]

								local tbl5 = {
									enabled["Select Threshold Mode   "],
									enabled["Weight Threshold   "],
									v6:GetAttribute("Weight"),
								}

								tbl4[1] = selectSellFruit
								tbl4[2] = selectSellRarity
								tbl4[3] = selectSellMutation
								tbl4[4] = tbl5

								if modules.FruitFilter(tbl4, v6) then
									local attribute = v6:GetAttribute("Id")

									if attribute then
										if enabled["Use Daily Deal"] then
											modules.Networker.Fire("UseDailyDealSingle", attribute)
										end

										modules.Networker.Fire("SellFruit", attribute)
										task.wait(0.1)
									end
								end
							end
						end

						continue
					end
				end

				break
			end

			task.wait(0.5)
		end)

		fn12("Auto Sell Pets", function()
			for _, v6 in toolFunction.GetAllTool(), nil, nil do
				if enabled["Auto Sell Pets"] then
					if v6:GetAttribute("PetId") then
						if not v6:GetAttribute("IsFavorite") then
							if modules.PetFilter({ enabled["Select Pets   "], enabled["Select Rarity Pets   "], enabled["Select Size Pets   "] }, v6) then
								local attribute = v6:GetAttribute("PetId")

								if attribute then
									modules.Networker.Fire("SellPet", attribute)
									task.wait(0.1)
								end
							end
						end
					end

					continue
				end

				break
			end

			task.wait(0.5)
		end)

		fn12("Auto Buy Pet", function()
			local map = workspace:FindFirstChild("Map")
			local wildPetSpawns = map and map:FindFirstChild("WildPetSpawns")
			local wildPetRef = map and map:FindFirstChild("WildPetRef")
			if not wildPetSpawns or not wildPetRef then
				return
			end
			local leaderstats = localPlayer:FindFirstChild("leaderstats")
			leaderstats = leaderstats and leaderstats:FindFirstChild("Sheckles") or leaderstats and leaderstats:FindFirstChild("Leaves")
			if not leaderstats then
				return
			end

			local function fn15(arg)
				local name = arg.Name
				local match = name:match("_WildPet_(.+)$")
				if match and match ~= "" then
					return match
				end
				local attribute = arg:GetAttribute("PetName")

				if attribute then
					local str = name:gsub("WildPet_" .. attribute:gsub("(%W)", "%%%1") .. "_WildPet_", "")
					if str and str ~= name and str ~= "" then
						return str
					end
				end

				return nil
			end

			for _, v6 in wildPetSpawns:GetChildren() do
				if enabled["Auto Buy Pet"] then
					if v6:IsA("Model") then
						local v7 = fn15(v6)

						if v7 then
							local v8 = wildPetRef:FindFirstChild("WildPet_" .. v7)

							if v8 then
								local name = localPlayer.Name

								if v8:GetAttribute("OwnerName") ~= name then
									if modules.PetFilter({
										enabled["Select Pets"] or {},
										enabled["Select Rarity Pets"] or {},
										enabled["Select Size Pets"] or {},
									}, v8) then
										local attribute = v8:GetAttribute("Price")

										if not (attribute and leaderstats.Value < attribute) then
											local n = tonumber(enabled["Pet Sheckle Limit"]) or 0

											if not (n > 0 and attribute and attribute > n) then
												local function fn16()
													return v6:FindFirstChildWhichIsA("ProximityPrompt", true)
												end

												if fn16() then
													stored.Teleport_Handler.Buy_Pet = true

													local function fn17()
														local v9 = wildPetRef:FindFirstChild("WildPet_" .. v7)
														if not v9 then
															return true
														end
														local name2 = localPlayer.Name
														if v9:GetAttribute("OwnerName") == name2 then
															return true
														end
														return false
													end

													local function fn18()
														local character = localPlayer.Character
														character = character and character:FindFirstChild("HumanoidRootPart")
														if not character then
															return math.huge
														end
														return (character.Position - v6:GetPivot().Position).Magnitude
													end

													local function fn19()
														local v9 = fn16()

														if v9 and v9.Enabled then
															v9.HoldDuration = 0
															fn6(v9)
															fn7(v9)
														end

														local v10 = wildPetRef:FindFirstChild("WildPet_" .. v7)

														if v10 then
															modules.Networker.Fire("WildPetTame", v10)
														end
													end

													local now = tick()

													while true do
														modules.TeleportManager.GetTo(v6:GetPivot().Position + Vector3.new(0, 4, 0), "Auto Buy Pet", nil, nil, nil, function()
															return fn17()
														end)

														task.wait(0.1)
														if not (fn18() <= 8 or fn17() or not enabled["Auto Buy Pet"] or shx.Unloaded or tick() - now > 6) then
															continue
														end
														break
													end

													if fn17() then
													else
														if enabled["Pet Purchase Protection"] then
															local n2 = 0

															while true do
																task.wait()

																if not enabled["Pet Purchase Protection"] then
																	break
																else
																	if not (not v6.Parent or not enabled["Auto Buy Pet"] or shx.Unloaded) then
																		if wildPetRef:FindFirstChild("WildPet_" .. v7) then
																			modules.TeleportManager.GetTo(v6:GetPivot().Position + Vector3.new(0, 4, 0), "Auto Buy Pet", nil, nil, nil, function()
																				return fn17()
																			end)

																			if tick() - n2 >= 0.4 then
																				n2 = tick()
																				fn19()
																			end

																			for _, v9 in Players:GetChildren() do
																				if v9 ~= localPlayer then
																					if v9.Character then
																						local humanoidRootPart = v9.Character:FindFirstChild("HumanoidRootPart")

																						if humanoidRootPart then
																							if (humanoidRootPart.Position - v6:GetPivot().Position).Magnitude <= 25 then
																								if not localPlayer.Character:FindFirstChild("Shovel") then
																									toolFunction.EquipTool("Shovel")
																									task.wait(0.05)
																								end

																								modules.TeleportManager.GetTo(humanoidRootPart.CFrame, "Auto Buy Pet")

																								task.delay(0.3, function()
																									modules.Networker.Fire("SwingShovel")
																									modules.Networker.Fire("HitPlayer", v9.UserId)
																								end)
																							end
																						end
																					end
																				end
																			end

																			if not (fn17() or not v6.Parent or not enabled["Pet Purchase Protection"] or not enabled["Auto Buy Pet"] or shx.Unloaded) then
																				continue
																			end
																		end
																	end

																	break
																end
															end
														else
															local now2 = tick()

															while wildPetRef:FindFirstChild("WildPet_" .. v7) do
																modules.TeleportManager.GetTo(v6:GetPivot().Position + Vector3.new(0, 4, 0), "Auto Buy Pet", nil, nil, nil, function()
																	return fn17()
																end)

																fn19()
																task.wait(0.25)
																if not (fn17() or not enabled["Auto Buy Pet"] or shx.Unloaded or tick() - now2 > 6) then
																	continue
																end
																break
															end
														end
													end
												end
											end
										end
									end
								end
							end
						end
					end

					continue
				end

				break
			end

			stored.Teleport_Handler.Buy_Pet = false
			modules.TeleportManager.Reset("Auto Buy Pet")
			task.wait(1)
		end)

		fn12("Auto Pot Plant", function()
			local plants = modules.GetOwnerPlot()
			plants = plants and plants:FindFirstChild("Plants")
			if not plants then
				return
			end

			for _, v6 in plants:GetChildren() do
				if enabled["Auto Pot Plant"] then
					if v6:IsA("Model") then
						local attribute = v6:GetAttribute("SeedName")

						if not (not attribute or not table.find(enabled["Select Pot Plant"], attribute)) then
							local attribute2 = v6:GetAttribute("PlantId")

							if attribute2 then
								if enabled["Delay To Pot Plant"] ~= 0 then
									task.wait(enabled["Delay To Pot Plant"])
								end

								modules.Networker.Fire("GardenPotPlant", attribute2)
							end
						end
					end

					continue
				end

				break
			end

			task.wait(1)
		end)

		fn12("Auto Place Potted Plant", function()
			for _, v6 in toolFunction.GetAllTool(), nil, nil do
				if enabled["Auto Place Potted Plant"] then
					if v6:GetAttribute("PottedPlant") then
						local attribute = v6:GetAttribute("PlantName")

						if not (not attribute or not table.find(enabled["Select Potted Plant"], attribute)) then
							local vector_

							if enabled["Select Position For Potted Plant"] == "Player Position" then
								local character = localPlayer.Character
								vector_ = Vector3.new(localPlayer.Character:GetPivot().Position.X, localPlayer.Character:GetPivot().Position.Y - 4.5, character:GetPivot().Position.Z)
							elseif enabled["Select Position For Potted Plant"] == "Saved Position" then
								vector_ = Vector3.new(stored.Saved_Position.PottedPlant.X, stored.Saved_Position.PottedPlant.Y - 4.5, stored.Saved_Position.PottedPlant.Z)
							else
								vector_ = managers2:GetRandomPlant()
							end

							if vector_ then
								if enabled["Delay To Place Potted Plant"] ~= 0 then
									task.wait(enabled["Delay To Place Potted Plant"])
								end

								local attribute2 = v6:GetAttribute("Id")

								if attribute2 then
									modules.Networker.Fire("PotPlacementPlacePottedPlant", vector_, 0, attribute2)
								end
							end
						end
					end

					continue
				end

				break
			end

			task.wait(1)
		end)

		fn12("Auto Place All Potted Plant", function()
			for _, v6 in toolFunction.GetAllTool(), nil, nil do
				if enabled["Auto Place All Potted Plant"] then
					if v6:GetAttribute("PottedPlant") then
						if v6:GetAttribute("PlantName") then
							local vector_

							if enabled["Select Position For Potted Plant"] == "Player Position" then
								local character = localPlayer.Character
								vector_ = Vector3.new(localPlayer.Character:GetPivot().Position.X, localPlayer.Character:GetPivot().Position.Y - 4.5, character:GetPivot().Position.Z)
							elseif enabled["Select Position For Potted Plant"] == "Saved Position" then
								vector_ = Vector3.new(stored.Saved_Position.PottedPlant.X, stored.Saved_Position.PottedPlant.Y - 4.5, stored.Saved_Position.PottedPlant.Z)
							else
								vector_ = managers2:GetRandomPlant()
							end

							if vector_ then
								if enabled["Delay To Place Potted Plant"] ~= 0 then
									task.wait(enabled["Delay To Place Potted Plant"])
								end

								local attribute = v6:GetAttribute("Id")

								if attribute then
									modules.Networker.Fire("PotPlacementPlacePottedPlant", vector_, 0, attribute)
								end
							end
						end
					end

					continue
				end

				break
			end

			task.wait(1)
		end)

		fn12("Auto Pick Up Potted Plant", function()
			local plants = modules.GetOwnerPlot()
			plants = plants and plants:FindFirstChild("Plants")
			if not plants then
				return
			end

			for _, v6 in plants:GetChildren() do
				if enabled["Auto Pick Up Potted Plant"] then
					if v6:IsA("Model") then
						if v6:FindFirstChild("PotVisual", true) then
							local attribute = v6:GetAttribute("SeedName")

							if not (not attribute or not table.find(enabled["Select Pick Up Potted Plant"], attribute)) then
								local attribute2 = v6:GetAttribute("PlantId")

								if attribute2 then
									modules.Networker.Fire("PotPlacementPickUpPottedPlant", attribute2)
								end
							end
						end
					end

					continue
				end

				break
			end

			task.wait(0.5)
		end)

		fn12("Auto Pick Up All Potted Plant", function()
			local plants = modules.GetOwnerPlot()
			plants = plants and plants:FindFirstChild("Plants")
			if not plants then
				return
			end

			for _, v6 in plants:GetChildren() do
				if enabled["Auto Pick Up All Potted Plant"] then
					if v6:IsA("Model") then
						if v6:FindFirstChild("PotVisual", true) then
							local attribute = v6:GetAttribute("PlantId")

							if attribute then
								modules.Networker.Fire("PotPlacementPickUpPottedPlant", attribute)
							end
						end
					end

					continue
				end

				break
			end

			task.wait(0.5)
		end)

		fn12("Auto Place Sprinkler", function()
			local v6 = toolFunction.GetAllTool()
			local v7 = modules.GetOwnerPlot()
			local spawnPoint = v7 and v7:FindFirstChild("SpawnPoint")
			local selectPosition = enabled["Select Position "]
			local nearFruitPositions = selectPosition == "Near Fruit" and managers2:GetNearFruitPositions(v7, enabled["Sprinkler Spacing"] or 8) or nil

			for _, v8 in v6, nil, nil do
				if not enabled["Auto Place Sprinkler"] then
					break
				end

				if not v8:IsA("Tool") then
					continue
				end

				if v8:GetAttribute("MainCategory") ~= "Gear" then
					continue
				end
				local attribute = v8:GetAttribute("Sprinkler")
				if not attribute or not table.find(enabled["Select Sprinkler"], attribute) then
					continue
				end
				local vector_

				if selectPosition == "Player Position" then
					local character = localPlayer.Character
					vector_ = Vector3.new(localPlayer.Character:GetPivot().Position.X, localPlayer.Character:GetPivot().Position.Y - 4.5, character:GetPivot().Position.Z)
				elseif selectPosition == "Saved Position" then
					vector_ = Vector3.new(stored.Saved_Position.PlaceSprinkler.X, stored.Saved_Position.PlaceSprinkler.Y - 4.5, stored.Saved_Position.PlaceSprinkler.Z)
				elseif selectPosition == "Near Fruit" then
					vector_ = nearFruitPositions and table.remove(nearFruitPositions, 1)
				else
					vector_ = managers2:GetRandomPlant()
				end

				if not vector_ then
					continue
				end
				local disableTeleport = enabled["Disable Teleport  "]
				local v9 = managers2:IsOnGarden()

				if not disableTeleport and not v9 then
					modules.TeleportManager.GetTo(spawnPoint.CFrame, "Auto Place Sprinkler", nil, nil, nil, function()
						if managers2:IsOnGarden() then
							return true
						end
						return false
					end)

					return
				end

				if enabled["Delay To Sprinkler"] ~= 0 then
					task.wait(enabled["Delay To Sprinkler"])
				end

				localPlayer.Character.Humanoid:EquipTool(v8)
				task.wait(0.3)
				modules.Networker.Fire("PlaceSprinkler", vector_, attribute, v8, modules.GetOwnerPlotId())
				modules.TeleportManager.Reset("Auto Place Sprinkler")
				task.wait(1)
				return
			end

			modules.TeleportManager.Reset("Auto Place Sprinkler")
			task.wait(1)
		end)

		fn12("Auto Place All Sprinkler", function()
			local v6 = toolFunction.GetAllTool()
			local v7 = modules.GetOwnerPlot()
			local spawnPoint = v7 and v7:FindFirstChild("SpawnPoint")
			local selectPosition = enabled["Select Position "]
			local nearFruitPositions = selectPosition == "Near Fruit" and managers2:GetNearFruitPositions(v7, enabled["Sprinkler Spacing"] or 8) or nil

			for _, v8 in v6, nil, nil do
				if not enabled["Auto Place All Sprinkler"] then
					break
				end

				if not v8:IsA("Tool") then
					continue
				end

				if v8:GetAttribute("MainCategory") ~= "Gear" then
					continue
				end
				local attribute = v8:GetAttribute("Sprinkler")
				if not attribute then
					continue
				end
				local vector_

				if selectPosition == "Player Position" then
					local character = localPlayer.Character
					vector_ = Vector3.new(localPlayer.Character:GetPivot().Position.X, localPlayer.Character:GetPivot().Position.Y - 4.5, character:GetPivot().Position.Z)
				elseif selectPosition == "Saved Position" then
					vector_ = Vector3.new(stored.Saved_Position.PlaceSprinkler.X, stored.Saved_Position.PlaceSprinkler.Y - 4.5, stored.Saved_Position.PlaceSprinkler.Z)
				elseif selectPosition == "Near Fruit" then
					vector_ = nearFruitPositions and table.remove(nearFruitPositions, 1)
				else
					vector_ = managers2:GetRandomPlant()
				end

				if not vector_ then
					continue
				end
				local disableTeleport = enabled["Disable Teleport  "]
				local v9 = managers2:IsOnGarden()

				if not disableTeleport and not v9 then
					modules.TeleportManager.GetTo(spawnPoint.CFrame, "Auto Place All Sprinkler", nil, nil, nil, function()
						if managers2:IsOnGarden() then
							return true
						end
						return false
					end)

					return
				end

				if enabled["Delay To Sprinkler"] ~= 0 then
					task.wait(enabled["Delay To Sprinkler"])
				end

				localPlayer.Character.Humanoid:EquipTool(v8)
				task.wait(0.3)
				modules.Networker.Fire("PlaceSprinkler", vector_, attribute, v8, modules.GetOwnerPlotId())
				modules.TeleportManager.Reset("Auto Place All Sprinkler")
				task.wait(1)
				return
			end

			modules.TeleportManager.Reset("Auto Place All Sprinkler")
			task.wait(1)
		end)

		fn12("Auto Trowel Plant", function()
			local plants = modules.GetOwnerPlot()
			plants = plants and plants:FindFirstChild("Plants")
			if not plants then
				return
			end

			for _, v6 in plants:GetChildren() do
				if enabled["Auto Trowel Plant"] then
					if v6:IsA("Model") then
						local attribute = v6:GetAttribute("CorePartName") or v6:GetAttribute("SeedName")

						if not (not attribute or not table.find(enabled["Select Plant"], attribute)) then
							local selectPosition = enabled["Select Position  "]
							local vector_

							if selectPosition == "Player Position" then
								vector_ = Vector3.new(localPlayer.Character.HumanoidRootPart.Position.X, localPlayer.Character.HumanoidRootPart.Position.Y - 4.5, localPlayer.Character.HumanoidRootPart.Position.Z)
							elseif selectPosition == "Saved Position" then
								vector_ = Vector3.new(stored.Saved_Position.Trowel.X, stored.Saved_Position.Trowel.Y - 4.5, stored.Saved_Position.Trowel.Z)
							else
								vector_ = managers2:GetRandomPlant()
							end

							if vector_ then
								if not localPlayer.Character:FindFirstChild("Trowel") then
									toolFunction.EquipTool("Trowel")
									task.wait(0.1)
								end

								for _, v7 in v6:QueryDescendants("BasePart") do
									v7.CanCollide = false
								end

								modules.Networker.Fire("MovePlant", v6.Name, vector_, math.deg(CFrame.new(vector_):ToEulerAnglesYXZ()) or 0)
								task.wait(0.1)
							end
						end
					end

					continue
				end

				break
			end

			task.wait(1)
		end)

		fn12("Auto Shovel Tree", function()
			local plants = modules.GetOwnerPlot()
			plants = plants and plants:FindFirstChild("Plants")
			if not plants then
				return
			end

			for _, v6 in plants:GetChildren() do
				if enabled["Auto Shovel Tree"] then
					if v6:IsA("Model") then
						if modules.FruitFilter({ enabled["Select Tree"], enabled["Select Rarity Tree"], enabled["Select Mutation Tree"] }, v6) then
							local shovel = localPlayer.Character:FindFirstChild("Shovel")

							if not shovel then
								toolFunction.EquipTool("Shovel")
								task.wait(0.2)
							end

							local attribute = shovel:GetAttribute("Shovel")
							local attribute2 = v6:GetAttribute("PlantId")

							if enabled["Delay To Shovel Tree"] ~= 0 then
								task.wait(enabled["Delay To Shovel Tree"])
							end

							modules.Networker.Fire("UseShovel", attribute2, "", attribute, shovel)
						end
					end

					continue
				end

				break
			end

			task.wait(0.2)
		end)

		fn12("Auto Favorite Fruit", function()
			for _, v6 in toolFunction.GetAllTool(), nil, nil do
				if enabled["Auto Favorite Fruit"] then
					if v6:GetAttribute("HarvestedFruit") then
						if not v6:GetAttribute("IsFavorite") then
							local tbl4 = {}
							local selectFavoriteFruit = enabled["Select Favorite Fruit"]
							local selectFavoriteRarity = enabled["Select Favorite Rarity"]
							local selectFavoriteMutation = enabled["Select Favorite Mutation"]

							local tbl5 = {
								enabled["Select Threshold Mode  "],
								enabled["Weight Threshold  "],
								v6:GetAttribute("Weight"),
							}

							local tbl6 = {
								enabled["Select Threshold Mode  "],
								enabled["Value Threshold"],
								v6:GetAttribute("FruitValue"),
							}

							tbl4[1] = selectFavoriteFruit
							tbl4[2] = selectFavoriteRarity
							tbl4[3] = selectFavoriteMutation
							tbl4[4] = tbl5
							tbl4[5] = nil
							tbl4[6] = tbl6

							if modules.FruitFilter(tbl4, v6) then
								local attribute = v6:GetAttribute("Id")

								if attribute then
									modules.Networker.Fire("BackpackSetFruitFavorite", attribute, true)
								end
							end
						end
					end

					continue
				end

				break
			end

			task.wait(0.5)
		end)

		fn12("Auto UnFavorite Fruit", function()
			for _, v6 in toolFunction.GetAllTool(), nil, nil do
				if enabled["Auto UnFavorite Fruit"] then
					if v6:GetAttribute("HarvestedFruit") then
						if v6:GetAttribute("IsFavorite") then
							local tbl4 = {}
							local selectFavoriteFruit = enabled["Select Favorite Fruit"]
							local selectFavoriteRarity = enabled["Select Favorite Rarity"]
							local selectFavoriteMutation = enabled["Select Favorite Mutation"]

							local tbl5 = {
								enabled["Select Threshold Mode  "],
								enabled["Weight Threshold  "],
								v6:GetAttribute("Weight"),
							}

							local tbl6 = {
								enabled["Select Threshold Mode  "],
								enabled["Value Threshold"],
								v6:GetAttribute("FruitValue"),
							}

							tbl4[1] = selectFavoriteFruit
							tbl4[2] = selectFavoriteRarity
							tbl4[3] = selectFavoriteMutation
							tbl4[4] = tbl5
							tbl4[5] = nil
							tbl4[6] = tbl6

							if modules.FruitFilter(tbl4, v6) then
								local attribute = v6:GetAttribute("Id")

								if attribute then
									modules.Networker.Fire("BackpackSetFruitFavorite", attribute, false)
								end
							end
						end
					end

					continue
				end

				break
			end

			task.wait(0.5)
		end)

		fn12("Auto UnFavorite All Fruit", function()
			for _, v6 in toolFunction.GetAllTool(), nil, nil do
				if enabled["Auto UnFavorite All Fruit"] then
					if v6:GetAttribute("HarvestedFruit") then
						if v6:GetAttribute("IsFavorite") then
							local attribute = v6:GetAttribute("Id")

							if attribute then
								modules.Networker.Fire("BackpackSetFruitFavorite", attribute, false)
							end
						end
					end

					continue
				end

				break
			end

			task.wait(0.5)
		end)

		fn12("Auto Shovel Fruit", function()
			local plants = modules.GetOwnerPlot()
			plants = plants and plants:FindFirstChild("Plants")
			if not plants then
				return
			end
			local playerScripts = localPlayer and localPlayer:FindFirstChild("PlayerScripts")
			local v6 = fn5((playerScripts and playerScripts:FindFirstChild("Controllers")):FindFirstChild("FruitVisualizerController"))

			for _, v7 in plants:GetChildren() do
				if enabled["Auto Shovel Fruit"] then
					if v7:IsA("Model") then
						local fruits = v7:FindFirstChild("Fruits", true)

						if fruits then
							for _, v8 in fruits:GetChildren() do
								if enabled["Auto Shovel Fruit"] then
									if v8:IsA("Model") then
										local attribute = v8:GetAttribute("PlantId")
										local attribute2 = v8:GetAttribute("FruitId") or ""

										if not (not attribute or attribute2 == "") then
											if modules.FruitFilter({
												enabled["Select Fruit  "],
												enabled["Select Rarity  "],
												enabled["Select Mutation  "],
												{
													enabled["Select Threshold Mode "],
													enabled["Weight Threshold "],
													attribute2 ~= "" and v6:CalculateFruitWeight(v8) or v6:CalculatePlantWeight(v8),
												},
											}, v8) then
												if enabled["Delay To Shovel Fruit"] ~= 0 then
													task.wait(enabled["Delay To Shovel Fruit"])
												end

												local shovel = localPlayer.Character:FindFirstChild("Shovel")

												if not shovel then
													toolFunction.EquipTool("Shovel")
													task.wait(0.2)
												end

												modules.Networker.Fire("UseShovel", attribute, attribute2, shovel:GetAttribute("Shovel"), shovel)
												task.wait(0.1)
											end
										end
									end

									continue
								end

								break
							end
						end
					end

					continue
				end

				break
			end

			task.wait(0.2)
		end)

		fn12("Auto Water Plants", function()
			local plants = modules.GetOwnerPlot()
			plants = plants and plants:FindFirstChild("Plants")
			if not plants then
				return
			end
			local temporary = workspace:FindFirstChild("Temporary")

			local function fn15(arg, arg2)
				if not temporary then
					return false
				end

				for _, v6 in temporary:GetChildren() do
					if v6.Name == "WateringCanFx" and (arg2 - v6.Position).Magnitude <= arg + 0.1 then
						return true
					end
				end

				return false
			end

			for _, v6 in plants:GetChildren() do
				if enabled["Auto Water Plants"] then
					if v6:IsA("Model") then
						if not (enabled["Only Decaying Plants"] and not v6:GetAttribute("Decaying")) then
							local attribute = v6:GetAttribute("SeedName")

							if not (not attribute or not table.find(enabled["Select Water Plants"], attribute)) then
								local position = v6:GetPivot().Position

								for _, v7 in enabled["Select Watering Can"], nil, nil do
									if enabled["Auto Water Plants"] then
										if v7 == "" or v7 == "None" then
											continue
										elseif not fn15(v7 == "Super Watering Can" and 8 or 5, position) then
											local character = localPlayer.Character

											if character then
												local v8 = character:FindFirstChild(v7)

												if not v8 then
													toolFunction.EquipTool(v7)
													task.wait(0.2)
													local character2 = localPlayer.Character

													if character2 then
														v8 = character2:FindFirstChild(v7)

														if not v8 then
															continue
														else
															modules.Networker.Fire("UseWateringCan", position, v7, v8)
															break
														end
													end
												else
													modules.Networker.Fire("UseWateringCan", position, v7, v8)
													break
												end
											end
										end
									end

									break
								end

								task.wait()
							end
						end
					end

					continue
				end

				break
			end

			task.wait(enabled["Delay To Water"] or 0.1)
		end)

		fn12("Auto Water All Plants", function()
			local plants = modules.GetOwnerPlot()
			plants = plants and plants:FindFirstChild("Plants")
			if not plants then
				return
			end
			local temporary = workspace:FindFirstChild("Temporary")

			local function fn15(arg, arg2)
				if not temporary then
					return false
				end

				for _, v6 in temporary:GetChildren() do
					if v6.Name == "WateringCanFx" and (arg2 - v6.Position).Magnitude <= arg + 0.1 then
						return true
					end
				end

				return false
			end

			for _, v6 in plants:GetChildren() do
				if enabled["Auto Water All Plants"] then
					if v6:IsA("Model") then
						if not (enabled["Only Decaying Plants"] and not v6:GetAttribute("Decaying")) then
							local position = v6:GetPivot().Position

							for _, v7 in enabled["Select Watering Can"], nil, nil do
								if enabled["Auto Water All Plants"] then
									if v7 == "" or v7 == "None" then
										continue
									elseif not fn15(v7 == "Super Watering Can" and 8 or 5, position) then
										local character = localPlayer.Character

										if character then
											local v8 = character:FindFirstChild(v7)

											if not v8 then
												toolFunction.EquipTool(v7)
												task.wait(0.2)
												local character2 = localPlayer.Character

												if character2 then
													v8 = character2:FindFirstChild(v7)

													if not v8 then
														continue
													else
														modules.Networker.Fire("UseWateringCan", position, v7, v8)
														break
													end
												end
											else
												modules.Networker.Fire("UseWateringCan", position, v7, v8)
												break
											end
										end
									end
								end

								break
							end

							task.wait()
						end
					end

					continue
				end

				break
			end

			task.wait(enabled["Delay To Water"] or 0.1)
		end)

		fn12("Auto Drop Seed", function()
			for _, v6 in toolFunction.GetAllTool(), nil, nil do
				if enabled["Auto Drop Seed"] then
					if v6:GetAttribute("MainCategory") == "Seed" then
						if table.find(enabled["Select Drop Seed"], v6:GetAttribute("SeedTool")) then
							localPlayer.Character.Humanoid:EquipTool(v6)
							task.wait(0.5)
							modules.Networker.Fire("DroppedItemRequestDrop", "Seeds", v6:GetAttribute("SeedTool"))
							task.wait(0.2)
						end
					end

					continue
				end

				break
			end

			task.wait(0.5)
		end)

		fn12("Auto Drop Fruit", function()
			for _, v6 in toolFunction.GetAllTool(), nil, nil do
				if enabled["Auto Drop Fruit"] then
					if v6:GetAttribute("HarvestedFruit") then
						if not v6:GetAttribute("IsFavorite") then
							local tbl4 = {}
							local selectDropFruit = enabled["Select Drop Fruit"]
							local selectDropRarity = enabled["Select Drop Rarity"]
							local selectDropMutation = enabled["Select Drop Mutation"]

							local tbl5 = {
								enabled["Select Threshold Mode    "],
								enabled["Weight Threshold    "],
								v6:GetAttribute("Weight"),
							}

							tbl4[1] = selectDropFruit
							tbl4[2] = selectDropRarity
							tbl4[3] = selectDropMutation
							tbl4[4] = tbl5

							if modules.FruitFilter(tbl4, v6) then
								local attribute = v6:GetAttribute("Id")

								if attribute then
									localPlayer.Character.Humanoid:EquipTool(v6)
									task.wait(0.5)
									modules.Networker.Fire("DroppedItemRequestDrop", "HarvestedFruits", attribute)
									task.wait(0.1)
								end
							end
						end
					end

					continue
				end

				break
			end

			task.wait(0.5)
		end)

		fn12("Auto Drop Pet", function()
			for _, v6 in toolFunction.GetAllTool(), nil, nil do
				if enabled["Auto Drop Pet"] then
					if v6:GetAttribute("PetId") then
						if not v6:GetAttribute("IsFavorite") then
							if modules.PetFilter({
								enabled["Select Pets     "],
								enabled["Select Rarity Pets     "],
								enabled["Select Size Pets     "],
							}, v6) then
								local attribute = v6:GetAttribute("PetId")

								if attribute then
									localPlayer.Character.Humanoid:EquipTool(v6)
									task.wait(0.2)
									modules.Networker.Fire("DroppedItemRequestDrop", "Pets", attribute)
									task.wait(0.1)
								end
							end
						end
					end

					continue
				end

				break
			end

			task.wait(0.5)
		end)

		fn12("Auto Send Seed", function()
			for _, v6 in toolFunction.GetAllTool(), nil, nil do
				if enabled["Auto Send Seed"] then
					if v6:GetAttribute("MainCategory") == "Seed" then
						if table.find(enabled["Select Send Seed"], v6:GetAttribute("SeedTool")) then
							local playerUsername = enabled["Player Username"]

							if not (not playerUsername or playerUsername == "") then
								local userId

								if Players:FindFirstChild(playerUsername) then
									userId = Players[playerUsername].UserId
								else
									userId = modules.GetUserIdFromAPI(playerUsername)
								end

								if userId then
									local attribute = enabled["Amount Send"] == "full" and v6:GetAttribute("Count") or tonumber(enabled["Amount Send"]) or 1

									if not (attribute <= 0) then
										modules.Networker.Fire("MailboxSendBatch", userId, {
											{
												ItemKey = v6:GetAttribute("SeedTool"),
												Count = attribute,
												Category = "Seeds",
											},
										}, enabled["Send Note Message"])

										task.wait(0.2)
									end
								end
							end
						end
					end

					continue
				end

				break
			end

			task.wait(0.5)
		end)

		fn12("Auto Send Seed Pack", function()
			for _, v6 in toolFunction.GetAllTool(), nil, nil do
				if enabled["Auto Send Seed Pack"] then
					if v6:GetAttribute("MainCategory") == "SeedPack" then
						if table.find(enabled["Select Send Seed Pack"], v6:GetAttribute("SeedPack")) then
							local playerUsername = enabled["Player Username"]

							if not (not playerUsername or playerUsername == "") then
								local userId

								if Players:FindFirstChild(playerUsername) then
									userId = Players[playerUsername].UserId
								else
									userId = modules.GetUserIdFromAPI(playerUsername)
								end

								if userId then
									local attribute = enabled["Amount Send "] == "full" and v6:GetAttribute("Count") or tonumber(enabled["Amount Send "]) or 1

									if not (attribute <= 0) then
										modules.Networker.Fire("MailboxSendBatch", userId, {
											{
												ItemKey = v6:GetAttribute("SeedPack"),
												Count = attribute,
												Category = "SeedPacks",
											},
										}, enabled["Send Note Message"])

										task.wait(0.2)
									end
								end
							end
						end
					end

					continue
				end

				break
			end

			task.wait(0.5)
		end)

		fn12("Auto Send Gear", function()
			for _, v6 in toolFunction.GetAllTool(), nil, nil do
				if enabled["Auto Send Gear"] then
					if table.find(enabled["Select Send Gear"], v6.Name) then
						local playerUsername = enabled["Player Username"]

						if not (not playerUsername or playerUsername == "") then
							local userId

							if Players:FindFirstChild(playerUsername) then
								userId = Players[playerUsername].UserId
							else
								userId = modules.GetUserIdFromAPI(playerUsername)
							end

							if userId then
								local attribute = enabled["Amount Send"] == "full" and v6:GetAttribute("Count") or tonumber(enabled["Amount Send"]) or 1

								if not (attribute <= 0) then
									modules.Networker.Fire("MailboxSendBatch", userId, { { ItemKey = v6.Name, Count = attribute, Category = modules.MailBox_Gear[v6.Name] } }, enabled["Send Note Message"])
								end
							end
						end
					end

					continue
				end

				break
			end

			task.wait(0.5)
		end)

		fn12("Auto Send Pet", function()
			for _, v6 in toolFunction.GetAllTool(), nil, nil do
				if enabled["Auto Send Pet"] then
					if v6:GetAttribute("PetId") then
						if not v6:GetAttribute("IsFavorite") then
							if modules.PetFilter({
								enabled["Select Pets      "],
								enabled["Select Rarity Pets      "],
								enabled["Select Size Pets      "],
							}, v6) then
								local attribute = v6:GetAttribute("PetId")

								if attribute then
									local playerUsername = enabled["Player Username"]

									if not (not playerUsername or playerUsername == "") then
										local userId

										if Players:FindFirstChild(playerUsername) then
											userId = Players[playerUsername].UserId
										else
											userId = modules.GetUserIdFromAPI(playerUsername)
										end

										if userId then
											modules.Networker.Fire("MailboxSendBatch", userId, { { ItemKey = attribute, Count = 1, Category = "Pets" } }, enabled["Send Note Message"])
											task.wait(0.2)
										end
									end
								end
							end
						end
					end

					continue
				end

				break
			end

			task.wait(0.5)
		end)

		fn12("Auto Send Fruit", function()
			for _, v6 in toolFunction.GetAllTool(), nil, nil do
				if enabled["Auto Send Fruit"] then
					if v6:GetAttribute("HarvestedFruit") then
						if not v6:GetAttribute("IsFavorite") then
							local tbl4 = {}
							local selectSendFruit = enabled["Select Send Fruit"]
							local selectSendRarity = enabled["Select Send Rarity"]
							local selectSendMutation = enabled["Select Send Mutation"]

							local tbl5 = {
								enabled["Select Threshold Mode     "],
								enabled["Weight Threshold     "],
								v6:GetAttribute("Weight"),
							}

							tbl4[1] = selectSendFruit
							tbl4[2] = selectSendRarity
							tbl4[3] = selectSendMutation
							tbl4[4] = tbl5

							if modules.FruitFilter(tbl4, v6) then
								local attribute = v6:GetAttribute("Id")

								if attribute then
									local playerUsername = enabled["Player Username"]

									if not (not playerUsername or playerUsername == "") then
										local userId

										if Players:FindFirstChild(playerUsername) then
											userId = Players[playerUsername].UserId
										else
											userId = modules.GetUserIdFromAPI(playerUsername)
										end

										if userId then
											modules.Networker.Fire("MailboxSendBatch", userId, { { ItemKey = attribute, Count = 1, Category = "HarvestedFruits" } }, enabled["Send Note Message"])
											task.wait(0.2)
										end
									end
								end
							end
						end
					end

					continue
				end

				break
			end

			task.wait(0.5)
		end)

		fn12("Auto Claim Mail", function()
			local v6 = modules.Networker.Fire_Network({ "Mailbox", "OpenInbox" }):Fire()
			if not v6 or type(v6) ~= "table" then
				return
			end

			for k in v6, nil, nil do
				if enabled["Auto Claim Mail"] then
					modules.Networker.Fire("MailboxClaim", k)
					continue
				end
				break
			end

			task.wait(2)
		end)

		fn12("Auto Prevent Weather", function()
			local selectWeather = enabled["Select Weather"]
			if not selectWeather then
				return
			end
			local weatherValues = ReplicatedStorage:FindFirstChild("WeatherValues")
			if not weatherValues then
				return
			end
			local flag = false

			for _, v6 in selectWeather, nil, nil do
				if v6 ~= "" and v6 ~= "None" then
					if workspace:GetAttribute("ActiveWeather") == v6 or weatherValues:GetAttribute(v6 .. "_Playing") == true then
						flag = true
						break
					end
				end
			end

			if not flag then
				return
			end
			task.wait(enabled["Delay To Prevent"] or 5)
			local selectPreventMode = enabled["Select Prevent Mode"]

			if selectPreventMode == "Rejoin" then
				if modules.IsPrivateServer() and #Players:GetPlayers() > 1 then
					TeleportService:Teleport(game.PlaceId, localPlayer)
				else
					modules.Networker.Fire("AntiAfkRequestHop")
				end
			elseif selectPreventMode == "Hop Server" then
				modules.Server_Hop.Hop()
			elseif selectPreventMode == "Kick" then
				modules.Kick("Auto Prevent Weather: Weather Detected!")
			elseif selectPreventMode == "Leave" then
				game:Shutdown()
			end
		end)

		fn12("Auto Buy Seeds", function()
			local SeedShop = modules.Shop.GetStockGeneric("SeedShop", "Normal", enabled["Select Seed "])

			if SeedShop then
				modules.Networker.Fire("PurchaseSeed", SeedShop)
			end

			task.wait(0.3)
		end)

		fn12("Auto Buy All Seeds", function()
			local SeedShop = modules.Shop.GetStockGeneric("SeedShop", "Normal", "no")

			if SeedShop then
				modules.Networker.Fire("PurchaseSeed", SeedShop)
			end

			task.wait(0.3)
		end)

		fn12("Auto Buy Gear", function()
			local GearShop = modules.Shop.GetStockGeneric("GearShop", "Normal", enabled["Select Gear "])

			if GearShop then
				modules.Networker.Fire("PurchaseGear", GearShop)
			end

			task.wait(1)
		end)

		fn12("Auto Buy All Gear", function()
			local GearShop = modules.Shop.GetStockGeneric("GearShop", "Normal", "no")

			if GearShop then
				modules.Networker.Fire("PurchaseGear", GearShop)
			end

			task.wait(0.3)
		end)

		fn12("Auto Buy Crate", function()
			local CrateShop = modules.Shop.GetStockGeneric("CrateShop", "Normal", enabled["Select Crate "])

			if CrateShop then
				modules.Networker.Fire("PurchaseCrate", CrateShop)
			end

			task.wait(0.3)
		end)

		fn12("Auto Buy All Crate", function()
			local CrateShop = modules.Shop.GetStockGeneric("CrateShop", "Normal", "no")

			if CrateShop then
				modules.Networker.Fire("PurchaseCrate", CrateShop)
			end

			task.wait(0.3)
		end)

		fn12("Auto Buy Auction", function()
			local auction = playerGui:FindFirstChild("Auction")
			if not auction then
				return
			end
			local frame = auction:FindFirstChild("Frame")
			local scrollingFrame = frame and frame:FindFirstChild("ScrollingFrame")
			if not scrollingFrame or not frame then
				return
			end

			if not auction.Enabled then
				auction.Enabled = true
				frame.Visible = false
			end

			local tbl4 = {}

			for _, v6 in { enabled["Select Seed  "], enabled["Select Gear  "], enabled["Select Seed Pack"], enabled["Select Egg"] }, nil, nil do
				if type(v6) == "table" then
					for _, v7 in v6, nil, nil do
						if v7 ~= "None" and v7 ~= "" then
							tbl4[v7] = true
						end
					end
				end
			end

			for _, v6 in scrollingFrame:GetChildren() do
				if enabled["Auto Buy Auction"] then
					if not v6:IsA("Frame") then
						continue
					else
						local outOfStock = v6:FindFirstChild("OUT_OF_STOCK", true)
						local expired = v6:FindFirstChild("EXPIRED", true)

						if outOfStock and outOfStock.Visible or expired and expired.Visible then
							continue
						else
							local itemName = v6:FindFirstChild("ItemName", true)

							if not itemName or not tbl4[itemName.ContentText] then
								continue
							else
								local buyButton = v6:FindFirstChild("BuyButton", true)

								if not buyButton then
									continue
								else
									local textLabel = buyButton:FindFirstChild("TextLabel", true)

									if not textLabel then
										continue
									else
										local v7 = modules.Converter.CorrectNumber(textLabel.ContentText)

										if not v7 or v7 == 0 then
											continue
										elseif managers2:GetCurrentCash() < v7 then
											continue
										else
											local auctionPrice = enabled["Auction Price"] or 0

											if auctionPrice ~= 0 then
												local auctionPriceMode = enabled["Auction Price Mode "]

												if auctionPriceMode == "Above" and v7 <= auctionPrice then
													continue
												elseif auctionPriceMode == "Below" and v7 >= auctionPrice then
													continue
												else
													modules.Networker.Fire("AuctioneerPurchaseLot", v6.Name:gsub("Lot_", ""), v7)
													break
												end
											else
												modules.Networker.Fire("AuctioneerPurchaseLot", v6.Name:gsub("Lot_", ""), v7)
												break
											end
										end
									end
								end
							end
						end
					end
				end

				break
			end

			task.wait(0.3)
		end)

		fn12("ESP Fruit", function()
			local plants = modules.GetOwnerPlot()
			plants = plants and plants:FindFirstChild("Plants")
			if not plants then
				return
			end
			local v6 = modules.Collection.GetPlantList(plants, {}, nil, true)
			if not v6 then
				return
			end
			local playerScripts = localPlayer and localPlayer:FindFirstChild("PlayerScripts")
			playerScripts = playerScripts and playerScripts:FindFirstChild("Controllers")
			local sharedModules = ReplicatedStorage:FindFirstChild("SharedModules")
			sharedModules = sharedModules and sharedModules:FindFirstChild("FruitValueCalc")
			local v7 = fn5(playerScripts:FindFirstChild("FruitVisualizerController"))
			local v8 = fn5(sharedModules)

			for _, v9 in ipairs(v6) do
				if enabled["ESP Fruit"] then
					if v9:GetAttribute("PlantId") then
						local flag = (v9:GetAttribute("FruitId") or "") ~= "" and v7:CalculateFruitWeight(v9) or v7:CalculatePlantWeight(v9)

						if modules.FruitFilter({ enabled["Select ESP Fruit"], enabled["Select ESP Rarity"], enabled["Select ESP Mutation"] }, v9) then
							local attribute = v9:GetAttribute("CorePartName") or v9:GetAttribute("SeedName")
							local attribute2 = v9:GetAttribute("Mutation")
							local v10 = modules.Converter.FormatGrams(flag)
							local ok, result = pcall(v8, attribute, v9:GetAttribute("SizeMulti") or 1, attribute2, localPlayer, nil)

							if not result or type(result) ~= "number" then
								result = 0
							end

							local color = v9:FindFirstChild("1") and v9["1"].Color or Color3.new(1, 1, 1)
							local n = math.floor(color.R * 255)
							local n2 = math.floor(color.G * 255)
							local n3 = math.floor(color.B * 255)
							local flag2 = attribute2 and attribute2 ~= ""
							local str = ""

							if flag2 then
								str = string.format("\n<font color=\"rgb(%d,%d,%d)\">%s</font>", n, n2, n3, attribute2)
							end

							local text = string.format("<font color=\"rgb(255,255,255)\">%s [ </font><font color=\"rgb(200,200,200)\">%s</font><font color=\"rgb(255,255,255)\"> ]</font> %s%s", attribute, v10, string.format("<font color=\"rgb(255,255,255)\">[ </font><font color=\"rgb(0,255,0)\">$%s</font><font color=\"rgb(255,255,255)\"> ]</font>", modules.Converter.Abbreviate(result)), str)
							local esp = v9:FindFirstChild("ESP")

							if not esp then
								modules.ESP.CreateESP(v9, { Color = color, Text = text })
							else
								local billboardGui = esp:FindFirstChild("BillboardGui", true)
								billboardGui = billboardGui and billboardGui:FindFirstChild("TextLabel")

								if billboardGui and billboardGui.Text ~= text then
									billboardGui.Text = text
								end
							end
						end
					end

					continue
				end

				break
			end

			task.wait(2)
		end)

		fn12("ESP Spawned Pets", function()
			local map = workspace:FindFirstChild("Map")
			local wildPetSpawns = map and map:FindFirstChild("WildPetSpawns")
			map = map and map:FindFirstChild("WildPetRef")
			if not wildPetSpawns or not map then
				return
			end
			local sharedModules = ReplicatedStorage:FindFirstChild("SharedModules")
			sharedModules = sharedModules and sharedModules:FindFirstChild("RarityData")
			sharedModules = sharedModules and sharedModules:FindFirstChild("Gradients")

			for _, v6 in wildPetSpawns:GetChildren() do
				if enabled["ESP Spawned Pets"] then
					if v6:IsA("Model") then
						local v7 = map:FindFirstChild("WildPet_" .. v6.Name:match("%x%x%x%x%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%x%x%x%x%x%x%x%x"))

						if v7 then
							if modules.PetFilter({ enabled["Select Pets  "], enabled["Select Rarity Pets  "], enabled["Select Size Pets  "] }, v7) then
								local attribute = v7:GetAttribute("PetName")
								local attribute2 = v7:GetAttribute("Rarity")
								local attribute3 = v7:GetAttribute("PetSize")
								local attribute4 = v7:GetAttribute("Price")

								if not (not attribute or not attribute2) then
									local value = sharedModules and sharedModules:FindFirstChild(attribute2)
									value = value and value.Color.Keypoints[math.floor(#value.Color.Keypoints / 2) + 1].Value
									local n = value and math.floor(value.R * 255) or 255
									local n2 = value and math.floor(value.G * 255) or 255
									value = value and math.floor(value.B * 255) or 255
									local text = "<font color=\"rgb(255,255,255)\">" .. attribute .. "</font>" .. " [ " .. "<font color=\"rgb(" .. n .. "," .. n2 .. "," .. value .. ")\">" .. attribute2 .. "</font> ]"

									if attribute4 then
										text ..= " <font color=\"rgb(255,200,0)\">[ $" .. tostring(modules.Converter.Abbreviate(attribute4)) .. " ]</font>"
									end

									if attribute3 and attribute3 ~= "" then
										text ..= "\n" .. "<font color=\"rgb(255,255,0)\">" .. tostring(attribute3) .. "</font>"
									end

									local esp = v6:FindFirstChild("ESP")

									if not esp then
										modules.ESP.CreateESP(v6, { Color = Color3.fromRGB(n, n2, value), Text = text })
									else
										local billboardGui = esp:FindFirstChild("BillboardGui", true)
										billboardGui = billboardGui and billboardGui:FindFirstChild("TextLabel")

										if billboardGui and billboardGui.Text ~= text then
											billboardGui.Text = text
										end
									end
								end
							end
						end
					end

					continue
				end

				break
			end

			task.wait(2)
		end)

		fn12("ESP Sprinkler", function()
			local sprinklers = modules.GetOwnerPlot()
			sprinklers = sprinklers and sprinklers:FindFirstChild("Sprinklers")
			if not sprinklers then
				return
			end

			for _, v6 in sprinklers:GetChildren() do
				if enabled["ESP Sprinkler"] then
					if v6:IsA("Model") then
						local attribute = v6:GetAttribute("SprinklerName")

						if not (attribute and table.find(enabled["Select Ignore Sprinkler"], attribute)) then
							local sprinklerTimerUI = v6:FindFirstChild("SprinklerTimerUI")
							sprinklerTimerUI = sprinklerTimerUI and sprinklerTimerUI:FindFirstChild("TextLabel")
							local root = v6.Build:FindFirstChild("Root")
							local color = root and root:IsA("BasePart") and root.Color or Color3.fromRGB(0, 255, 255)
							local floor = math.floor
							local n = color.B * 255
							local text = string.format("<font color=\"%s\">%s</font> <font color=\"#FFFFFF\">[ %s ]</font>", string.format("#%02X%02X%02X", math.floor(color.R * 255), math.floor(color.G * 255), floor(n)), attribute or "Unknown Sprinkler", sprinklerTimerUI and sprinklerTimerUI.Text or "Unknown")
							local esp = v6:FindFirstChild("ESP")

							if not esp then
								modules.ESP.CreateESP(v6, { Color = color, Text = text, Highlight = { Enabled = true, Color = color } })
							else
								local billboardGui = esp:FindFirstChild("BillboardGui", true)
								billboardGui = billboardGui and billboardGui:FindFirstChild("TextLabel")

								if billboardGui and billboardGui.Text ~= text then
									billboardGui.Text = text
								end
							end
						end
					end

					continue
				end

				break
			end

			task.wait(2)
		end)

		fn12("Event Weather Predictions", function()
			local weatherUI = playerGui:FindFirstChild("WeatherUI")
			local frame = weatherUI and weatherUI:FindFirstChild("Frame")
			if not frame then
				return
			end

			for _, v6 in frame:GetChildren() do
				if not v6:IsA("ImageLabel") then
					continue
				elseif enabled["Event Weather Predictions"] then
					local time = v6:FindFirstChild("Time")

					if time then
						local Bloodmoon

						if v6.Name == "Bloodmoon" then
							Bloodmoon = modules.Predicitions.GetWeatherTime("Bloodmoon")
						elseif v6.Name == "Gold Moon" then
							Bloodmoon = modules.Predicitions.GetWeatherTime("Goldmoon")
						elseif v6.Name == "Rainbow Moon" then
							Bloodmoon = modules.Predicitions.GetWeatherTime("Rainbow Moon")
						elseif v6.Name == "Mega Moon" then
							Bloodmoon = modules.Predicitions.GetWeatherTime("Mega Moon")
						else
							Bloodmoon = nil

							if v6.Name == "Harvest Moon" then
								Bloodmoon = modules.Predicitions.GetWeatherTime("Harvest Moon")
							end
						end

						if Bloodmoon then
							v6.Visible = true
							time.Text = Bloodmoon.IsActiveNow and "Active" or Bloodmoon.Formatted

							if not stored.Weather_Path[v6] then
								stored.Weather_Path[v6] = true
							end
						end
					end

					continue
				end

				break
			end

			local function fn15(name, arg, image)
				if frame:FindFirstChild(name) then
					return
				end
				local v6 = frame:FindFirstChild(arg)
				if not v6 then
					return
				end
				local clone = v6:Clone()
				clone.Name = name
				clone.Parent = frame
				clone.Vector.Image = image
				clone.Weather.Text = name
			end

			fn15("Gold Moon", "Lightning", "rbxassetid://84902063004871")
			fn15("Rainbow Moon", "Rainbow", "rbxassetid://93602895495056")
			fn15("Mega Moon", "Aurora", "rbxassetid://107925838920918")
			fn15("Harvest Moon", "Aurora", "rbxassetid://133267062078756")
			task.wait(2)
		end)

		fn12("ESP Fruit Value", function()
			local backpackGui = playerGui:FindFirstChild("BackpackGui")
			backpackGui = backpackGui and backpackGui:FindFirstChild("Backpack")
			if not backpackGui then
				return
			end
			local v6 = modules.Fruit_Misc.BuildValueIndex()
			local onlyUseBaseValueForEspFruit = enabled["Only Use Base Value For ESP Fruit"] and modules.Fruit_Misc.BuildMultiplierMap() or nil

			for _, v7 in backpackGui:QueryDescendants("TextButton"), nil, nil do
				if enabled["ESP Fruit Value"] then
					local toolCount = v7:FindFirstChild("ToolCount")
					local toolName = v7:FindFirstChild("ToolName")

					if toolCount and toolName then
						modules.Fruit_Misc.AddValue(v7, { Weight = toolCount.Text, Name = toolName.Text }, v6, onlyUseBaseValueForEspFruit)
					end

					continue
				end

				break
			end

			task.wait(2.5)
		end)

		fn12("ESP Total Value", function()
			local backpackGui = playerGui:FindFirstChild("BackpackGui")
			backpackGui = backpackGui and backpackGui:FindFirstChild("Backpack")
			if not backpackGui then
				return
			end
			backpackGui = backpackGui and backpackGui:FindFirstChild("Inventory")
			backpackGui = backpackGui and backpackGui:FindFirstChild("FruitInventory")
			if not backpackGui then
				return
			end
			local getAttribute = localPlayer.GetAttribute
			local str = ("%*/%* Fruits"):format(localPlayer:GetAttribute("FruitCount"), getAttribute(localPlayer, "MaxFruitCapacity"))
			local v6 = modules.Fruit_Misc.GetTotalFruitValue()
			local text = str .. " | <font color=\"rgb(0,255,0)\">$" .. tostring(modules.Converter.Abbreviate(v6)) .. "</font>"

			if not backpackGui.Visible then
				backpackGui.Visible = true
			end

			if not backpackGui.RichText then
				backpackGui.RichText = true
			end

			if backpackGui.Text ~= text then
				backpackGui.Text = text
			end

			task.wait(2.5)
		end)

		fn12("Auto Teleport Fall Harvest", function()
			if workspace:GetAttribute("ActiveWorldId") == "FallHarvest" then
				return
			end
			modules.Networker.Fire("WorldsRequestTravel", "FallHarvest")
			task.wait(2)
		end)

		fn12("Auto Complete Tutorial", function()
			if workspace:GetAttribute("InTutorial") then
				modules.Networker.Fire("TutorialComplete")
				workspace:SetAttribute("InTutorial", nil)
			end
		end)

		fn12("Full Bright", function()
			Lighting.Brightness = 2
			Lighting.ClockTime = 14
			Lighting.FogEnd = 100000
			Lighting.GlobalShadows = false
			Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
		end)

		fn12("Infinite Zoom Out", function()
			if not localPlayer:GetAttribute("CameraMaxZoomDistance") then
				localPlayer:SetAttribute("CameraMaxZoomDistance", localPlayer.CameraMaxZoomDistance)
			end

			localPlayer.CameraMaxZoomDistance = 9e9
		end)

		fn12("Anti-Fling", function()
			for _, v6 in Players:GetPlayers() do
				if v6 ~= localPlayer then
					if v6.Character then
						for _, v7 in v6:QueryDescendants("BasePart") do
							v7.CanCollide = false
						end
					end
				end
			end

			task.wait(1)
		end)

		fn12("Less knockback", function()
			local character = localPlayer.Character
			if not character then
				return
			end
			local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
			if not humanoidRootPart then
				return
			end
			local tbl4 = { BodyVelocity = true, BodyForce = true, BodyGyro = true }

			if not stored.Connections["Anti-Knockback"] then
				stored.Connections["Anti-Knockback"] = humanoidRootPart.DescendantAdded:Connect(function(descendant)
					if not enabled["Less knockback"] or shx.Unloaded then
						if stored.Connections["Anti-Knockback"] then
							stored.Connections["Anti-Knockback"]:Disconnect()
							stored.Connections["Anti-Knockback"] = nil
						end

						return
					end

					if tbl4[descendant.ClassName] then
						descendant:Destroy()
					end
				end)
			end

			for _, v6 in humanoidRootPart:GetDescendants() do
				if tbl4[v6.ClassName] then
					v6:Destroy()
				end
			end
		end)

		fn12("Instant Interact Prompt", function()
			for _, v6 in workspace:QueryDescendants("ProximityPrompt") do
				v6.HoldDuration = 0
			end

			task.wait(1.5)
		end)

		fn12("Noclip Plants", function()
			local plants = modules.GetOwnerPlot()
			plants = plants and plants:FindFirstChild("Plants")
			if not plants then
				return
			end

			for _, v6 in plants:GetChildren() do
				if enabled["Noclip Plants"] then
					if v6:IsA("Model") then
						for _, v7 in v6:QueryDescendants("BasePart") do
							v7.CanCollide = false
						end
					end

					continue
				end

				break
			end

			task.wait(2)
		end)

		fn12("Hide All Tree", function()
			local plants = modules.GetOwnerPlot()
			plants = plants and plants:FindFirstChild("Plants")
			if not plants then
				return
			end

			for _, v6 in plants:GetChildren() do
				if enabled["Hide All Tree"] then
					if v6:IsA("Model") then
						if not stored.HidePlant.Tree[v6] then
							if not modules.FruitFilter({ enabled["Select Ignore Tree"], {}, {} }, v6) then
								local tbl4 = {}
								local tbl5 = {}
								local n = 0

								for _, v7 in v6:GetDescendants() do
									if enabled["Hide All Tree"] then
										if v7:IsA("BasePart") then
											tbl4[#tbl4 + 1] = {
												Part = v7,
												Transparency = v7.Transparency,
												CanCollide = v7.CanCollide,
											}

											v7.Transparency = 1
											v7.CanCollide = false
										elseif v7:IsA("ParticleEmitter") or v7:IsA("Trail") or v7:IsA("Beam") or v7:IsA("Fire") or v7:IsA("Smoke") or v7:IsA("Sparkles") or v7:IsA("Light") then
											tbl5[#tbl5 + 1] = { Object = v7, Property = "Enabled", Value = v7.Enabled }
											v7.Enabled = false
										elseif v7:IsA("Decal") or v7:IsA("Texture") then
											tbl5[#tbl5 + 1] = { Object = v7, Property = "Transparency", Value = v7.Transparency }
											v7.Transparency = 1
										end

										n += 1

										if n % 1000 == 0 then
											task.wait()
										end

										continue
									end

									break
								end

								stored.HidePlant.Tree[v6] = { Object = v6, Parts = tbl4, Effects = tbl5 }
							end
						end
					end

					continue
				end

				break
			end

			task.wait(4)
		end)

		fn12("Hide All Fruit", function()
			local plants = modules.GetOwnerPlot()
			plants = plants and plants:FindFirstChild("Plants")
			if not plants then
				return
			end
			local v6 = modules.Collection.GetPlantList(plants, {}, nil, true)
			if not v6 then
				return
			end

			for _, v7 in v6, nil, nil do
				if enabled["Hide All Fruit"] then
					if v7:IsA("Model") then
						if not stored.HidePlant.Fruit[v7] then
							if not modules.FruitFilter({ enabled["Select Ignore Fruit"], {}, {} }, v7) then
								local tbl4 = {}
								local tbl5 = {}
								local n = 0

								for _, v8 in v7:GetDescendants() do
									if enabled["Hide All Fruit"] then
										if v8:IsA("BasePart") then
											tbl4[#tbl4 + 1] = {
												Part = v8,
												Transparency = v8.Transparency,
												CanCollide = v8.CanCollide,
											}

											v8.Transparency = 1
											v8.CanCollide = false
										elseif v8:IsA("ParticleEmitter") or v8:IsA("Trail") or v8:IsA("Beam") or v8:IsA("Fire") or v8:IsA("Smoke") or v8:IsA("Sparkles") or v8:IsA("Light") then
											tbl5[#tbl5 + 1] = { Object = v8, Property = "Enabled", Value = v8.Enabled }
											v8.Enabled = false
										elseif v8:IsA("Decal") or v8:IsA("Texture") then
											tbl5[#tbl5 + 1] = {
												Object = v8,
												Property = "Transparency",
												Value = v8.Transparency,
											}

											v8.Transparency = 1
										end

										n += 1

										if n % 1000 == 0 then
											task.wait()
										end

										continue
									end

									break
								end

								stored.HidePlant.Fruit[v7] = { Object = v7, Parts = tbl4, Effects = tbl5 }
							end
						end
					end

					continue
				end

				break
			end

			task.wait(4)
		end)

		fn12("Auto Rejoin", function()
			task.wait(enabled["Delay To Rejoin"] or 1)

			if modules.IsPrivateServer() and #Players:GetPlayers() > 1 then
				TeleportService:Teleport(game.PlaceId, localPlayer)
			else
				modules.Networker.Fire("AntiAfkRequestHop")
			end
		end)

		fn12("Auto Remove Other Gardens", function()
			local gardens = workspace:FindFirstChild("Gardens")
			if not gardens then
				return
			end

			for _, v6 in gardens:GetChildren() do
				local name = localPlayer.Name

				if v6:GetAttribute("Owner") ~= name then
					v6:Destroy()
					task.wait()
				end
			end

			task.wait(1)
		end)

		fn12("Remove Owner Garden", function()
			local gardens = workspace:FindFirstChild("Gardens")

			if gardens then
				local n = 0

				for _, v6 in gardens:GetChildren() do
					if enabled["Remove Owner Garden"] then
						local name = localPlayer.Name

						if v6:GetAttribute("Owner") == name then
							local signs = v6:FindFirstChild("Signs")

							for _, v7 in v6:GetDescendants() do
								if enabled["Remove Owner Garden"] then
									if not (signs and v7:IsDescendantOf(signs)) then
										if v7:IsA("BasePart") then
											if not stored.RemoveOwnerGarden[v7] then
												stored.RemoveOwnerGarden[v7] = {
													Part = v7,
													Transparency = v7.Transparency,
													CanCollide = v7.CanCollide,
												}
											end

											v7.Transparency = 1
											v7.CanCollide = false
										elseif v7:IsA("ParticleEmitter") or v7:IsA("Trail") or v7:IsA("Beam") or v7:IsA("Fire") or v7:IsA("Smoke") or v7:IsA("Sparkles") or v7:IsA("Light") then
											if not stored.RemoveOwnerGarden[v7] then
												stored.RemoveOwnerGarden[v7] = { Object = v7, Property = "Enabled", Value = v7.Enabled }
											end

											v7.Enabled = false
										elseif v7:IsA("Decal") or v7:IsA("Texture") then
											if not stored.RemoveOwnerGarden[v7] then
												stored.RemoveOwnerGarden[v7] = {
													Object = v7,
													Property = "Transparency",
													Value = v7.Transparency,
												}
											end

											v7.Transparency = 1
										end

										n += 1

										if n % 200 == 0 then
											task.wait()
										end
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

			task.wait(3)
		end)

		fn12("Reduce Lag", function()
			local n = 0

			for _, descendant in pairs(workspace:GetDescendants()) do
				if enabled["Reduce Lag"] then
					local isBasePart = descendant:IsA("BasePart")

					if isBasePart then
						isBasePart = not (descendant.Parent and descendant.Parent:FindFirstChildWhichIsA("Humanoid"))
					end

					if isBasePart then
						descendant.Material = Enum.Material.SmoothPlastic
						descendant.CastShadow = false
						descendant.Reflectance = 0
					elseif descendant:IsA("Texture") or descendant:IsA("Decal") or descendant:IsA("ParticleEmitter") or descendant:IsA("Trail") then
						descendant:Destroy()
					end

					n += 1

					if n % 1000 == 0 then
						task.wait()
					end

					continue
				end

				break
			end

			task.wait(3)
		end)
	end

	local function fn12(arg)
		handlers[arg](handlers)
	end

	fn12("LoadFunction")
	fn12("LoadLibrary")
end

local tbl2

tbl2 = {
	Request = http_request or request or http and http.request,
	Script_ID = "d1d3b9e2a44648efbd1096d4d6c48fa6",
	Load = function(scriptKey)
		script_key = scriptKey
		getfenv(0).script_key = scriptKey
		getfenv(1).script_key = scriptKey
		getgenv().script_key = scriptKey
		loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/" .. tbl2.Script_ID .. ".lua"))()
	end,
	MathFloor = function(arg, arg2)
		local n = arg2 - arg2 % 1
		return arg2 < 0 and n ~= arg2 and n - 1 or n
	end,
	Uint32 = function(arg, arg2)
		return arg2 % 4294967296
	end,
	BitwiseXor = function(arg, arg2, arg3)
		local n = 0
		local n2 = 1

		while arg2 > 0 or arg3 > 0 do
			if arg2 % 2 ~= arg3 % 2 then
				n += n2
			end

			arg2 = tbl2:MathFloor(arg2 / 2)
			arg3 = tbl2:MathFloor(arg3 / 2)
			n2 *= 2
		end

		return n
	end,
	LeftShift = function(arg, arg2, arg3)
		return tbl2:Uint32(arg2 * 2 ^ arg3)
	end,
	RightShift = function(arg, arg2, arg3)
		return tbl2:MathFloor(arg2 / 2 ^ arg3) % 4294967296
	end,
	ToString = function(arg, arg2)
		return tostring(arg2)
	end,
	Concat = function(arg, arg2, arg3)
		local str = arg3 or ""
		local str2 = ""

		for i = 1, #arg2 do
			str2 ..= tbl2:ToString(arg2[i])

			if i ~= #arg2 then
				str2 ..= str
			end
		end

		return str2
	end,
	Encryption = function(arg, arg2)
		local tbl3 = { 1524013928, 62333482, 755453430, 3411017517 }
		local tbl4 = { 451, 41992, 38477, 17184 }
		local n = #arg2
		local n2 = 1

		while n2 <= n do
			local n3 = 0

			for i = 0, 3 do
				local n4 = n2 - 1 + i

				if n4 < n then
					n3 += arg2:byte(n4 + 1) * 2 ^ (8 * i)
				end
			end

			local v6 = tbl2:Uint32(n3)

			for i = 1, 4 do
				local v7 = tbl3[i % 4 + 1]
				local v8 = tbl2:BitwiseXor(tbl2:BitwiseXor(tbl3[i], v6), v7)
				local v9 = tbl2:Uint32(tbl2:LeftShift(v8, 5) + tbl2:RightShift(v8, 2) + tbl4[i])
				local v10 = tbl2:RightShift(v6, (i - 1) * 5 % 32)
				local v11 = tbl2:BitwiseXor(v9, v10)
				local v12 = tbl3[(i + 1) % 4 + 1]
				local v13 = tbl2:Uint32(tbl2:Uint32(v11) + v12)
				tbl3[i] = tbl2:Uint32(v13)
			end

			n2 += 4
		end

		for i = 1, 4 do
			local v6 = tbl3[(i + 2) % 4 + 1]
			local v7 = tbl2:BitwiseXor(tbl2:Uint32(tbl3[i] + tbl3[i % 4 + 1]), v6)
			local n3 = i * 7 % 32
			tbl3[i] = tbl2:Uint32(tbl2:LeftShift(v7, n3) + tbl2:RightShift(v7, 32 - n3))
		end

		local tbl5 = {}

		for i = 1, 4 do
			tbl5[i] = string.format("%08X", tbl3[i])
		end

		return tbl2:Concat(tbl5)
	end,
	NFyuXkNUFXqYueWyGPjhCrcMgiLMPNhLzAttSCFVWanYbrDSBKmCXghuwYgwPrqAGFcTnQcKiQvMXtLRkZAGdKNUgUHKrPqZaqYh = function()
		local ok, result = pcall(request, {
			Url = "https://raw.githubusercontent.com/AhmadV99/Main/refs/heads/main/Library/Key%20System/Encrypted",
			Method = "GET",
		})

		if not ok or not result then
			return false
		end

		if result.Body:find("$", 1, true) then
			return true
		end

		if result.Body:find("@", 1, true) then
			return true
		end

		if result.Body:find("&", 1, true) then
			return true
		end

		if result.Body:find("#", 1, true) then
			return true
		end

		if result.Body:find("%", 1, true) then
			return true
		end

		if result.Body:find("!", 1, true) then
			return true
		end

		if result.Body:find("*", 1, true) then
			return true
		end
		return false
	end,
	KqNajmBbtvaSwVktmdHAUSLHdbErNkfYxZJMxUydYMvhPKHBLCHBbjSCBjECVRFqyjGqzPGfgncLXRhtxCBeLrArAgVUxUhfnSWF = function()
		return os.date("*t").wday == 7
	end,
	JSONDecode = function(arg, arg2)
		return game:GetService("HttpService"):JSONDecode(arg2)
	end,
	CheckerKey = function(arg)
		local now = os.time()
		local str = tostring(arg)
		tbl2.Script_ID = tostring(tbl2.Script_ID)
		local data = tbl2:JSONDecode(tbl2.Request({ Url = "https://sdkapi-public.luarmor.net/sync", Method = "GET" }).Body)
		local nodes = data.nodes
		local str2 = "check_key?key=" .. str .. "&script_id=" .. tbl2.Script_ID
		local n = now + data.st - now

		local v6 = tbl2.Request({
			Url = nodes[math.random(1, #nodes)] .. str2,
			Method = "GET",
			Headers = {
				clienttime = tostring(n),
				catcat128 = tbl2:Encryption(str .. "_cfver1.0_" .. tbl2.Script_ID .. "_time_" .. n),
			},
		})

		if not v6 or not type(v6) == "table" then
			return nil
		end

		if v6.StatusMessage and v6.StatusMessage:find("{") then
			local match = v6.StatusMessage:match("(%b{})")
			if match then
				return tbl2:JSONDecode(match)
			end
		end

		return tbl2:JSONDecode(v6.Body)
	end,
}

if tbl2:KqNajmBbtvaSwVktmdHAUSLHdbErNkfYxZJMxUydYMvhPKHBLCHBbjSCBjECVRFqyjGqzPGfgncLXRhtxCBeLrArAgVUxUhfnSWF() or tbl2:NFyuXkNUFXqYueWyGPjhCrcMgiLMPNhLzAttSCFVWanYbrDSBKmCXghuwYgwPrqAGFcTnQcKiQvMXtLRkZAGdKNUgUHKrPqZaqYh() then
	task.spawn(fn2)
	return
end

if isfile("SpeedHubX_Key.txt") then
	local txt = readfile("SpeedHubX_Key.txt")
	local v6 = tbl2.CheckerKey(txt)

	if v6 and v6.code == "KEY_VALID" then
		task.spawn(fn2)
		task.spawn(tbl2.Load, txt)
		return
	end
end

if script_key and type(script_key) == "string" then
	local v6 = tbl2.CheckerKey(script_key)

	if v6 and v6.code == "KEY_VALID" then
		task.spawn(fn2)
		task.spawn(tbl2.Load, script_key)
		return
	end
end

local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Main/refs/heads/main/Library/KeySystemV2.5.lua"))()
local lib2 = loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Main/refs/heads/main/Library/Key%20System/Get%20Key%20API.lua"))()

local v6 = lib.Load({
	Name = "Speed Hub X",
	Icon = 136890595976124,
	DiscordLink = "discord.gg/speedhubx",
	Color = Color3.fromRGB(204, 33, 10),
	Callback = function(arg)
		local str = arg:gsub("%s+", " "):gsub("^%s*(.-)%s*$", "%1")
		local v6 = tbl2.CheckerKey(str)

		if v6.code == "KEY_VALID" then
			lib.Notify({ Title = "Key Valid!", Icon = 14939475472, Time = 5, Color = Color3.fromRGB(0, 255, 81) })

			delay(0.5, function()
				lib.Notify({ Title = "Loading script", Icon = 14939512891, Time = 5, Color = Color3.fromRGB(0, 255, 81) })
			end)

			delay(1.5, function()
				lib.DestroyUI()
			end)

			pcall(writefile, "SpeedHubX_Key.txt", str)
			task.spawn(fn2)
			task.spawn(tbl2.Load, str)
		elseif v6.code == "KEY_HWID_LOCKED" then
			lib.Notify({
				Title = "Key linked to a different HWID. Please reset it using our bot, join discord.gg/speedhubx !",
				Icon = 14943813832,
				Time = 5,
				Color = Color3.fromRGB(255, 37, 17),
			})
		elseif v6.code == "KEY_EXPIRED" then
			lib.Notify({
				Title = "The Provided Key has expired.",
				Icon = 14943813832,
				Time = 5,
				Color = Color3.fromRGB(240, 192, 96),
			})
		elseif v6.code == "KEY_BANNED" then
			lib.Notify({
				Title = "The Provided Key is banned.",
				Icon = 14943813832,
				Time = 5,
				Color = Color3.fromRGB(255, 37, 17),
			})
		elseif v6.code == "INVALID_EXECUTOR" then
			lib.Notify({
				Title = "your Executor is not supported",
				Icon = 14943813832,
				Time = 5,
				Color = Color3.fromRGB(255, 37, 17),
			})
		elseif v6.code == "KEY_INCORRECT" then
			lib.Notify({
				Title = "The Provided Key is incorrect / it does not exist.",
				Icon = 14943813832,
				Time = 5,
				Color = Color3.fromRGB(255, 37, 17),
			})
		elseif v6.code == "KEY_INVALID" then
			lib.Notify({
				Title = "The Provided Key is in an invalid format.",
				Icon = 14943813832,
				Time = 5,
				Color = Color3.fromRGB(255, 37, 17),
			})
		end
	end,
})

for k, v7 in next, lib2[game.GameId], nil do
	v6.New({
		Title = k,
		Icon = v7.Icon,
		Callback = function()
			pcall(setclipboard, v7.Url)
			lib.Notify({ Title = "Copied Get Key " .. k .. " Link", Icon = 14939475472, Time = 5 })
		end,
	})
end

v6.Explain("Keyless will be enabled every weekend.")
