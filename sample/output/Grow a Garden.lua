repeat
	task.wait()
until game:IsLoaded()

local tbl

tbl = {
	IsDetected = false,
	_unpack = function(arg, arg2, arg3)
		arg2 = arg2 or 1
		local n = arg3 or #arg
		if n < arg2 then
			return
		end
		return arg[arg2], tbl._unpack(arg, arg2 + 1, n)
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

local v_, v_2 = tbl._pcall(debug.info, fn, "f")

if not v_ or v_2 ~= fn then
	tbl.IsDetected = true
	LPH_CRASH()
end

local v_3, v_4 = tbl._pcall(debug.info, 2, "f")

if not v_3 or v_4 ~= pcall then
	tbl.IsDetected = true
	LPH_CRASH()
end

local v_5 = (cloneref or function(arg)
	return arg
end)(game:GetService("RunService"))

if v_5:IsStudio() then
	tbl.IsDetected = true
	LPH_CRASH()
end

if v_5:IsServer() then
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
	game:GetService("CollectionService")
	local TeleportService = game:GetService("TeleportService")
	local CoreGui = game:GetService("CoreGui")
	local MarketplaceService = game:GetService("MarketplaceService")
	local localPlayer = Players.LocalPlayer
	local playerGui = localPlayer:WaitForChild("PlayerGui")
	local heartbeat = RunService.Heartbeat
	local gameEvents = ReplicatedStorage:WaitForChild("GameEvents")

	local tbl2 = {
		Enabled = { IsSelling = false },
		Module = {},
		Connections = {},
		Cached = {
			Team = "",
			PetMutations = {},
			ServerList = { Data = {}, Timestamp = 0 },
			Image = {},
			ClearEmptyList = {},
			LastFired = {},
			VIPServer = {},
			JSON = {},
			Count = { WalkSpeed = 0, NoClip = 0 },
			SellPrevent = {},
			HideTree = {},
			HideFruit = {},
			ESP = {},
			Cached_Decompiled = {},
		},
		Stored = {
			Pet_Switcher = {
				["Egg Reduction Time"] = false,
				["Hatching Egg"] = false,
				["Selling Pet"] = false,
				["Place Egg"] = false,
				["Pick Place Active"] = false,
				["Stop Switch"] = false,
				["Is Switching"] = false,
				["Switch Lock"] = false,
				["Last Switch Time"] = 0,
				["Current Operation"] = nil,
			},
			PetCooldown = {},
			PetProgressing = {},
			Planted = {},
			Data = {},
			Killed = {},
		},
	}

	local module = tbl2.Module
	local cached = tbl2.Cached
	local stored = tbl2.Stored
	local enabled = tbl2.Enabled

	local function fn3(arg, arg2)
		local StarterGui = game:GetService("StarterGui")
		local name = localPlayer.Name

		if name == "fanoffgteev999" or name == "KXbMrzy" or name == "blacjacqv" or name == "asudhasuohdasuo" or name == "asuhdpas9gudhas9h" then
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

	local function fn5(arg)
		if cached.JSON[arg] then
			return cached.JSON[arg]
		end

		local ok, result = pcall(function()
			return game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Main/refs/heads/main/Data%20Game/Grow%20A%20Garden/" .. arg)
		end)

		if ok then
			local data = HttpService:JSONDecode(result)
			cached.JSON[arg] = data
			return data
		end
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

	local fn7 = require or function()
	end

	local fn8 = isfile or function()
	end

	local fn9 = isfolder or function()
	end

	local fn10 = makefolder or function()
	end

	local fn11 = queue_on_teleport or queueonteleport or function()
	end

	local str = identifyexecutor() or getnameexecutor() or ""

	local tbl3 = {
		SHX = fn4("https://raw.githubusercontent.com/AhmadV99/Main/refs/heads/main/Library/Lib_5.5.0.lua"),
		Funcs = (loadstring or load)("local a={}do function a:Toggle(b,c,d,e,f,g,h)c=c or\"\"d=d or\"\"e=e or false;f=f or false;g=g or function()end;h=h or\"\"return b:AddToggle({Title=c,Content=d,Default=e,Callback=g,Saver=f,Warnings=h})end;function a:Button(b,c,d,g,e)c=c or\"\"d=d or\"\"g=g or function()end;e=e or\"\"return b:AddButton({Title=c,Content=d,Callback=g,Warnings=e})end;function a:Dropdown(b,c,d,h,i,e,f,g)c=c or\"\"d=d or\"\"h=h or false;i=i or{}e=e or{}f=f or false;g=g or function()end;return b:AddDropdown({Title=c,Content=d,Multi=h,Options=i,Default=e,Callback=g,Saver=f})end;function a:Textbox(b,c,d,e,f,g)c=c or\"\"d=d or\"\"e=e or\"\"f=f or false;g=g or function()end;return b:AddInput({Title=c,Content=d,Default=e,Callback=g,Saver=f})end;function a:Slider(b,c,d,j,k,l,e,m,f,g)c=c or\"\"d=d or\"\"l=l or 0.1;j=j or 0.1;k=k or 1;e=e or 0;f=f or false;m=m or false;g=g or function()end;return b:AddSlider({Title=c,Content=d,Increment=l,Min=j,Max=k,Default=e,AutoUpdate=m,Callback=g,Saver=f})end end;return a")(),
	}

	local shx = tbl3.SHX
	local funcs = tbl3.Funcs

	task.spawn(function()
		if not fn9(shx.FolderPath .. "/PetTeams") then
			fn10(shx.FolderPath .. "/PetTeams")
		end
	end)

	local function fn12()
		local tbl4

		tbl4 = {
			API = {
				Variant = { "Normal", 1000, 1 },
				{ "Silver", -1, 5 },
				{ "Gold", 10, 20 },
				{ "Rainbow", 1, 50 },
				{ "Diamond", -1, 50 },
				{ "Jelly", -1, 50 },
				Craft = fn5("Crafting%20Table.json"),
				Data = fn5("Data.json"),
			},
			Variant = { "Normal", "Gold", "Rainbow", "Silver", "Diamond", "Jelly" },
			ListGears = {
				"Watering Can",
				"Trowel",
				"Recall Wrench",
				"Basic Sprinkler",
				"Firework",
				"Advanced Sprinkler",
				"Medium Treat",
				"Medium Toy",
				"Star Caller",
				"Night Staff",
				"Godly Sprinkler",
				"Chocolate Sprinkler",
				"Nectar Staff",
				"Pollen Radar",
				"Master Sprinkler",
				"Cleaning Spray",
				"Favorite Tool",
				"Harvest Tool",
				"Friendship Pot",
				"Level Up Lollipop",
				"Lightning Rod",
				"Berry Blusher Sprinkler",
				"Flower Froster Sprinkler",
				"Spice Spritzer Sprinkler",
				"Stalk Sprout Sprinkler",
				"Sweet Soaker Sprinkler",
				"Tropical Mist Sprinkler",
				"Reclaimer",
				"Small Toy",
				"Small Treat",
			},
			BoostStats = {
				PASSIVE_BOOST = { BaseValue = 1, Amount = { Small = 0.1, Medium = 0.2, Large = 0.3 } },
				PET_XP_BOOST = { BaseValue = 1, Amount = { Small = 0.5, Medium = 2, Smith = 5 } },
				SIZE_MODIFICATION = { BaseValue = 1, Amount = { Small = 10, Medium = 30 } },
			},
			GetMagnitude = function(arg)
				if typeof(arg) == "CFrame" then
					return localPlayer:DistanceFromCharacter(arg.Position)
				end

				if typeof(arg) == "Vector3" then
					return localPlayer:DistanceFromCharacter(arg)
				end
			end,
			GetTo = function(arg)
				local cframe = typeof(arg) == "Vector3" and CFrame.new(arg) or arg
				local character = localPlayer and localPlayer.Character
				character = character and character.PrimaryPart

				if character and not enabled.IsSelling then
					character.CFrame = cframe
				end
			end,
			MoveTo = function(arg)
				(localPlayer and localPlayer.Character):MoveTo(arg)
			end,
			GetOwnerFarm = function(arg)
				local farm = workspace:FindFirstChild("Farm")
				if not farm then
					return
				end

				for _, child in ipairs(farm:GetChildren()) do
					local important = child:FindFirstChild("Important")
					if not important then
						continue
					end
					local data = important:FindFirstChild("Data")
					if not data then
						continue
					end
					local owner = data:FindFirstChild("Owner")
					if not owner then
						continue
					end

					if owner and owner.Value == arg then
						return child
					end
				end

				return nil
			end,
			GetFarmPath = function(arg)
				local v_6 = tbl4.GetOwnerFarm(localPlayer.Name)
				if not v_6 then
					return
				end
				local important = v_6:FindFirstChild("Important")
				if not important then
					return
				end
				return important:FindFirstChild(arg)
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
			IsAlive = function(arg)
				local humanoid = arg:FindFirstChild("Humanoid")
				return humanoid and humanoid.Health > 0
			end,
			GetImageURL = function(arg)
				if cached.Image[arg] then
					return cached.Image[arg]
				end
				local str2 = tostring(arg):gsub("rbxassetid://", "")

				local ok, result = pcall(function()
					return game:HttpGet("https://thumbnails.roblox.com/v1/assets?assetIds=" .. str2 .. "&size=420x420&format=Png&isCircular=false")
				end)

				if not ok then
					return nil
				end
				local data = HttpService:JSONDecode(result)
				local data2 = data and data.data and data.data[1]
				data2 = data2 and data2.imageUrl or nil

				if data2 then
					cached.Image[arg] = data2
				end

				return data2
			end,
			FireDelay = function(arg, arg2, arg3)
				local now = tick()

				if not cached.LastFired[arg3] or now - cached.LastFired[arg3] >= arg then
					cached.LastFired[arg3] = now
					task.spawn(arg2)
				end
			end,
			FruitFilter = function(arg, arg2)
				local tbl5 = arg[1] or {}
				local tbl6 = arg[2] or {}
				local tbl7 = arg[3] or {}
				local attribute = arg2:FindFirstChild("Item_String") and arg2.Item_String.Value or arg2:GetAttribute("f") or arg2.Name:gsub("%b[]", ""):gsub("^%s*(.-)%s*$", "%1")
				local value = arg2:FindFirstChild("Variant") and arg2.Variant.Value
				local flag = #tbl5 > 1 and not table.find(tbl5, "None")
				local flag2 = #tbl6 > 1 and not table.find(tbl6, "None")
				local flag3 = #tbl7 > 1 and not table.find(tbl7, "None")
				if flag and not table.find(tbl5, attribute) then
					return false
				end

				if flag2 then
					local flag4 = false

					for i = 1, #tbl6 do
						if arg2:GetAttribute(tbl6[i]) then
							flag4 = true
							break
						end
					end

					if not flag4 then
						return false
					end
				end

				if flag3 and value ~= nil and not table.find(tbl7, value) then
					return false
				end
				return flag or flag2 or flag3
			end,
			PetFilter = function(arg, arg2)
				local tbl5 = arg[1] or {}
				local flag = #tbl5 > 1 and not table.find(tbl5, "None")

				if flag then
					local flag2 = false

					for i = 1, #tbl5 do
						if arg2:GetAttribute(tbl5[i]) then
							flag2 = true
							break
						end
					end

					if not flag2 then
						return false
					end
				end

				return flag
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
			FormatNumber = function(arg)
				return tostring(arg):reverse():gsub("(%d%d%d)", "%1,"):reverse():gsub("^,", "")
			end,
			FormatNumer1 = function(arg)
				local tbl5 = {
					"CENT",
					"VIG",
					"NOV",
					"OCT",
					"SEP",
					"SXD",
					"QUI",
					"QUA",
					"TR",
					"DU",
					"UN",
					"DE",
					"NO",
					"OC",
					"SP",
					"SX",
					"QI",
					"QA",
					"T",
					"B",
					"M",
					"K",
				}

				if arg < 1000 then
					return tostring(arg)
				end
				local n = math.floor(math.floor(math.log10(arg)) / 3)

				if #tbl5 < n then
					n = #tbl5
				end

				return string.format("%.2f%s", arg / 10 ^ (n * 3), tbl5[n])
			end,
		}

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

		local function fn13()
			local tbl6 = {}

			for i, v_6 in ipairs(tbl5) do
				tbl6[v_6:lower()] = 10 ^ ((i - 1) * 3)
			end

			return tbl6
		end

		local v_6 = fn13()

		tbl4.CorrectNumber = function(arg)
			if arg == nil then
				return 0
			end
			local match, v_7 = tostring(arg):gsub(",", ""):gsub("¢", ""):gsub("%s+", ""):lower():match("^([%d%.]+)(.*)$")
			local num = tonumber(match)
			if not num then
				return 0
			end

			if v_7 ~= "" then
				local v_8 = v_6[v_7]

				if v_8 then
					num *= v_8
				end
			end

			return num
		end

		tbl4.CountDictionary = function(arg)
			local n = 0

			for k in arg, nil, nil do
				n += 1
			end

			return n
		end

		local function fn14()
			return {
				Cached_Purchases = {},
				GetListProduct = function(arg)
					local tbl6 = {}

					for k in pairs(cached[arg]) do
						tbl6[#tbl6 + 1] = k
					end

					return tbl6
				end,
				GetIdProduct = function(arg, arg2)
					return cached[arg2][arg]
				end,
			}
		end

		tbl4.Market_Product = fn14()

		local function fn15()
			local tbl6 = {}

			return {
				Set = function(arg, arg2, arg3)
					tbl6[arg2] = os.clock() + arg3
				end,
				Expired = function(arg, arg2)
					local flag = not tbl6[arg2]
					local flag2

					if flag then
						flag2 = flag
					else
						local v_7 = tbl6[arg2]
						flag2 = os.clock() >= v_7
					end

					return flag2
				end,
			}
		end

		tbl4.CustomDelay = fn15()

		local function fn16()
			local str2 = shx.FolderPath .. "/PetTeams"

			return {
				SetSaveJSON = function(arg, arg2)
					local json = HttpService:JSONEncode(arg2)

					if json then
						pcall(writefile, str2 .. "/" .. arg .. ".json", json)
					end
				end,
				GetListFile = function()
					local tbl6 = { "None" }
					local tbl7 = listfiles(str2) or {}

					for _, v_7 in tbl7, nil, nil do
						local str3 = v_7:gsub("[\\/]", "/"):gsub("^/?SpeedHubX/PetTeams/?", ""):gsub("%.json", "")
						table.insert(tbl6, str3)
					end

					return tbl6
				end,
				ReadPetTeam = function(arg)
					local ok, result = pcall(readfile, str2 .. "/" .. arg .. ".json")
					if ok then
						return (HttpService:JSONDecode(result))
					end
				end,
				DeleteFile = function(arg)
					if pcall(delfile, str2 .. "/" .. arg .. ".json") then
						return true
					end
					return false
				end,
			}
		end

		tbl4.PetTeams = fn16()

		tbl4.CheckEggToHatch = function(arg)
			local flag = arg or false
			local Objects_Physical = tbl4.GetFarmPath("Objects_Physical")
			if not Objects_Physical then
				return
			end

			if flag then
				for _, child in ipairs(Objects_Physical:GetChildren()) do
					if child.Name == "PetEgg" and child:IsA("Model") then
						local attribute = child:GetAttribute("TimeToHatch")
						if attribute and attribute > 0 then
							return false
						end
					end
				end

				return true
			end

			for _, child in ipairs(Objects_Physical:GetChildren()) do
				if child.Name == "PetEgg" and child:IsA("Model") then
					local attribute = child:GetAttribute("TimeToHatch")
					if attribute and attribute == 0 then
						return true
					end
				end
			end

			return false
		end

		tbl4.CheckPets = function(arg)
			for _, child in pairs(workspace.PetsPhysical:GetChildren()) do
				local name = localPlayer.Name
				if child:GetAttribute("OWNER") ~= name then
					continue
				end

				if type(arg) == "table" then
					if table.find(arg, child:GetAttribute("UUID")) then
						return true
					end
					continue
				end

				if child:GetAttribute("UUID") == arg then
					return true
				end
			end

			return false
		end

		tbl4.IsPrivateServer = function()
			if cached.VIPServer.VIPServer1 then
				return true
			end

			local ok, result = pcall(function()
				return game:GetService("RobloxReplicatedStorage").GetServerType:InvokeServer()
			end)

			if ok and result == "VIPServer" then
				cached.VIPServer.VIPServer1 = true
				return true
			end
			return false
		end

		local function fn17()
			local tbl6

			tbl6 = {
				EquipTool = function(arg)
					local character = localPlayer and localPlayer.Character
					character = character and character:FindFirstChild("Humanoid")
					local backpack = localPlayer and localPlayer:FindFirstChild("Backpack")
					backpack = backpack and backpack:FindFirstChild(arg)

					if backpack then
						character:EquipTool(backpack)
					end
				end,
				EquipTool_Find = function(arg, arg2)
					local character = localPlayer and localPlayer.Character
					character = character and character:FindFirstChild("Humanoid")

					for _, child in ipairs(localPlayer.Backpack:GetChildren()) do
						local pos = child:IsA("Tool") and child.Name:find(arg)
						local flag

						if pos then
							flag = not arg2 or child:GetAttribute("b") == "j"
						else
							flag = pos
						end

						if flag then
							character:EquipTool(child)
							break
						end
					end
				end,
				GetTypeEnum = {
					a = "Seed Pack",
					L = "Leaf Blower",
					e = "Night Staff",
					f = "Harvest Tool",
					g = "Pollen Radar",
					h = "Favorite Tool",
					i = "Lightning Rod",
					u = "Food",
					k = "Star Caller",
					s = "SprayBottle",
					y = "Pet Pouch",
					n = "Seed",
					m = "FriendshipPot",
					F = "Fairy Caller",
					b = "Trowel",
					c = "PetEgg",
					d = "Sprinkler",
					t = "Tranquil Radar",
					G = "Luminous Wand",
					O = "Grow All",
					M = "Maple Leaf Kite",
					w = "Packaged Seed",
					K = "Firefly Jar",
					D = "Fairy Summoner",
					H = "Fairy Net",
					z = "PetBoost",
					N = "Steal",
					J = "Fairy Jar",
					j = "Holdable",
					E = "Fairy Power Extender",
					l = "Pet",
					A = "PetShard",
					v = "Trading Ticket",
					B = "Event Lantern",
					C = "Glimmering Radar",
					q = "Recall Wrench",
					o = "Watering Can",
					x = "Fertilizer",
					p = "Nectar Staff",
					r = "CosmeticCrate",
				},
				IsEquipped = function(arg, arg2)
					local character = localPlayer and localPlayer.Character
					if not character then
						return
					end

					for _, child in ipairs(character:GetChildren()) do
						if child:IsA("Tool") and not child:GetAttribute("d") then
							local v_7 = tbl6.GetTypeEnum[child:GetAttribute("b")]

							if not arg2 or v_7 == arg2 then
								local attribute = v_7 == "PetEgg" and child:GetAttribute("h") or child:GetAttribute("f") or child.Name:gsub("%b[]", ""):gsub("^%s*(.-)%s*$", "%1")
								if not arg or type(arg) == "table" and table.find(arg, attribute) or attribute == arg then
									return child
								end
							end
						end
					end

					return nil
				end,
				GetItem = function(arg, arg2)
					local character = localPlayer and localPlayer.Character

					if character then
						character:FindFirstChild("Humanoid")
					end

					for _, child in ipairs(localPlayer.Backpack:GetChildren()) do
						if child:IsA("Tool") and not child:GetAttribute("d") then
							local str2 = tbl6.GetTypeEnum[child:GetAttribute("b")] or nil

							if arg2 == "SprayBottle" and child:GetAttribute("l") then
								str2 = "SprayBottle"
							end

							arg = arg == "Smith Hammer of Harvest" and "Smith Hammer Harvest" or arg

							if not str2 or str2 == arg2 then
								if (str2 == "PetShard" and child:GetAttribute("u") or str2 == "PetBoost" and child.Name:gsub(" x%d+", ""):gsub("%[.+%]", ""):gsub(" Pet ", " ") or str2 == "SprayBottle" and child:GetAttribute("l") or str2 == "PetEgg" and child:GetAttribute("h") or child:GetAttribute("f") or child.Name:gsub(" x%d+$", ""):gsub("%b[]", ""):gsub("^%s*(.-)%s*$", "%1")) == arg then
									return child
								end
							end
						end
					end
				end,
				Equip = function(arg, arg2, arg3)
					local v_7 = arg3 or nil
					local character = localPlayer and localPlayer.Character
					character = character and character:FindFirstChild("Humanoid")

					for _, child in ipairs(localPlayer.Backpack:GetChildren()) do
						if child:IsA("Tool") and (v_7 or not child:GetAttribute("d")) then
							local v_8 = tbl6.GetTypeEnum[child:GetAttribute("b")]

							if not arg2 or v_8 == arg2 then
								local attribute = v_8 == "PetEgg" and child:GetAttribute("h") or child:GetAttribute("f") or child.Name:gsub("%b[]", ""):gsub("^%s*(.-)%s*$", "%1")
								local flag = not arg

								if not flag then
									flag = type(arg) == "table" and table.find(arg, attribute) or attribute == arg
								end

								if flag then
									character:EquipTool(child)
									return child
								end
							end
						end
					end
				end,
				CurrentTool = function(arg)
					local character = localPlayer and localPlayer.Character
					local backpack = localPlayer:FindFirstChild("Backpack")

					local function fn18(arg2, arg3)
						for _, child in pairs(arg2:GetChildren()) do
							if child:IsA("Tool") and (arg3 == "Seed" and child:GetAttribute("Seed") or child:GetAttribute("ITEM_TYPE") == arg3) then
								return child
							end
						end
					end

					return fn18(character, arg) or fn18(backpack, arg)
				end,
				EquipEgg = function(arg)
					local character = localPlayer and localPlayer.Character

					for _, child in pairs(localPlayer.Backpack:GetChildren()) do
						if child:IsA("Tool") and child:GetAttribute("h") == arg then
							character.Humanoid:EquipTool(child)
						end
					end
				end,
				FindHoldable = function(arg)
					local tbl7 = {}

					for _, v_7 in localPlayer.Character:GetChildren() do
						if v_7:IsA("Tool") and v_7:GetAttribute("b") == "j" and tbl4.Calculator.StipFlavourText(v_7.Name) == arg then
							table.insert(tbl7, v_7)
						end
					end

					for _, v_7 in localPlayer.Backpack:GetChildren() do
						if v_7:IsA("Tool") and v_7:GetAttribute("b") == "j" and tbl4.Calculator.StipFlavourText(v_7.Name) == arg then
							table.insert(tbl7, v_7)
						end
					end

					return tbl7
				end,
				GetCountFruit = function(arg)
					return tbl4.CountDictionary(tbl6.FindHoldable(arg))
				end,
				GetUnlockedCapGarden = function()
					local gardenCoinShopUi = playerGui:FindFirstChild("GardenCoinShop_UI")
					gardenCoinShopUi = gardenCoinShopUi and gardenCoinShopUi:FindFirstChild("Plant Inventory Capacity", true)
					gardenCoinShopUi = gardenCoinShopUi and gardenCoinShopUi:FindFirstChild("Description_Text", true)
					if not gardenCoinShopUi then
						return 0
					end
					return (tonumber(gardenCoinShopUi.Text:match("%((%d+)%s*/%s*%d+%)")) or 0) * 10
				end,
				IsMaxInventory = function()
					return (localPlayer:GetAttribute("Holdable_Backpack") or 0) >= 200 + (tbl6.GetUnlockedCapGarden() or 0)
				end,
				GetAllTool = function()
					local tbl7 = {}

					for _, child in ipairs(localPlayer.Backpack:GetChildren()) do
						if child:IsA("Tool") then
							table.insert(tbl7, child)
						end
					end

					for _, child in ipairs(localPlayer.Character:GetChildren()) do
						if child:IsA("Tool") then
							table.insert(tbl7, child)
						end
					end

					return tbl7
				end,
				GetSeedName = function(arg)
					for _, v_7 in tbl6.GetAllTool(), nil, nil do
						if not v_7:IsA("Tool") then
							continue
						end
						local attribute = v_7:GetAttribute("b")
						if attribute and attribute ~= "n" then
							continue
						end
						local attribute2 = v_7:GetAttribute("f")
						if not attribute2 then
							continue
						end
						local attribute3 = v_7:GetAttribute("Seed")
						if attribute3 and attribute3 == arg or attribute2 and attribute2 == arg then
							return v_7
						end
					end
				end,
			}

			return tbl6
		end

		tbl4.ToolFunction = fn17()

		local function fn18()
			return {
				GetPlantList = function(arg, arg2, arg3)
					local flag = arg3 or false

					for _, child in ipairs(arg:GetChildren()) do
						local function fn19(arg4, arg5)
							if flag or arg5 and arg5.Enabled then
								arg2[#arg2 + 1] = arg4
							end
						end

						local fruits = child:FindFirstChild("Fruits")

						if fruits then
							for _, child2 in ipairs(fruits:GetChildren()) do
								local proximityPrompt = child2:FindFirstChildWhichIsA("ProximityPrompt", true)

								if proximityPrompt then
									fn19(child2, proximityPrompt)
								end
							end
						end

						local proximityPrompt = child:FindFirstChildWhichIsA("ProximityPrompt", true)

						if proximityPrompt then
							fn19(child, proximityPrompt)
						end
					end

					return arg2
				end,
				GetPlantList1 = function(arg, arg2, arg3, arg4)
					local flag = arg4 or false

					for _, child in ipairs(arg:GetChildren()) do
						local function fn19(arg5)
							if arg5 and (flag or not arg5:GetAttribute("Favorited")) then
								arg2[#arg2 + 1] = arg5
							end
						end

						if arg3 then
							local fruits = child:FindFirstChild("Fruits")

							if fruits then
								for _, child2 in ipairs(fruits:GetChildren()) do
									fn19(child2)
								end
							end
						else
							fn19(child)
						end
					end

					return arg2
				end,
				GetPositionPlant = function(arg)
					local Plants_Physical = tbl4.GetFarmPath("Plants_Physical")

					for _, child in pairs(Plants_Physical:GetChildren()) do
						if child:IsA("Model") and table.find(arg, child.Name) then
							return child:GetPivot().Position
						end
					end
				end,
				GetCountPlant = function(arg)
					local Plants_Physical = tbl4.GetFarmPath("Plants_Physical")
					local n = 0

					for _, child in ipairs(Plants_Physical:GetChildren()) do
						if child:IsA("Model") and table.find(arg, child.Name) then
							local fruits = child:FindFirstChild("Fruits")

							if fruits then
								for _, child2 in ipairs(fruits:GetChildren()) do
									if child2 then
										n += 1
									end
								end
							end

							if child then
								n += 1
							end
						end
					end

					return n
				end,
			}
		end

		tbl4.Collection = fn18()

		local function fn19()
			local tbl6

			tbl6 = {
				Sell = function()
					local character = localPlayer and localPlayer.Character
					if not character then
						return
					end
					local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
					if not humanoidRootPart then
						return
					end
					local cFrame = humanoidRootPart.CFrame
					humanoidRootPart.CFrame = CFrame.new(36.5854721, 2.76619363, 0.426784277, 0, 0, -1, 0, 1, 0, 1, 0, 0)
					task.wait(0.3)
					gameEvents.Sell_Item:FireServer()
					task.wait(0.3)
					humanoidRootPart.CFrame = cFrame
				end,
				CallSell = function(arg)
					local tbl7 = {}
					local tbl8 = {}

					for _, child in ipairs(localPlayer.Backpack:GetChildren()) do
						if not (arg and not enabled[arg]) then
							if child:IsA("Tool") and child:GetAttribute("b") == "j" and not child:GetAttribute("d") then
								local v_7 = tbl4.FruitFilter({
									enabled["Prevent Sell Fruits"],
									enabled["Prevent Sell Mutation"],
									enabled["Prevent Sell Variant"],
								}, child)

								if enabled["Enable Prevent Mode"] and not v_7 then
									table.insert(tbl7, child)
								elseif not enabled["Enable Prevent Mode"] then
									table.insert(tbl7, child)
								end
							end

							continue
						end

						break
					end

					for _, v_7 in localPlayer.Character:GetChildren() do
						if v_7:IsA("Tool") then
							v_7.Parent = localPlayer.Backpack
						end
					end

					for _, v_7 in ipairs(tbl7) do
						if not (arg and not enabled[arg]) then
							for _, v_8 in v_7:QueryDescendants("BasePart") do
								v_8:Destroy()
							end

							v_7.Parent = localPlayer.Character
							table.insert(tbl8, v_7)
							continue
						end

						break
					end

					if #tbl8 > 0 then
						tbl6.Sell()
					end
				end,
			}

			return tbl6
		end

		tbl4.SellFunction = fn19()

		local function fn20()
			local tbl6

			tbl6 = {
				StipFlavourText = function(arg)
					if arg and arg ~= "" then
						return arg:gsub("%b[]", ""):gsub("^%s*(.-)%s*$", "%1")
					end
					return nil
				end,
				GetFruitData = function(arg)
					local v_7 = tbl4.API.Data.Fruits[tbl6.StipFlavourText(arg)]
					if v_7 then
						return v_7
					end
					return nil
				end,
				GetMutations = function()
					return tbl4.API.Data.Mutations
				end,
				CalculatorMutation = function(arg)
					local n = 1

					for _, v_7 in tbl6.GetMutations() do
						if arg:GetAttribute(v_7.Name) then
							n += v_7.ValueMulti - 1
						end
					end

					return (math.max(1, n))
				end,
				CalculatorVariant = function(arg)
					for _, v_7 in tbl4.API.Variant, nil, nil do
						if v_7[1] == arg then
							return v_7[3]
						end
					end

					return 0
				end,
				CalculatorFruit = function(arg)
					local itemString = arg:FindFirstChild("Item_String")
					local variant = arg:FindFirstChild("Variant")
					local weight = arg:FindFirstChild("Weight")
					if not variant or not weight then
						return 0
					end
					local v_7 = tbl6.GetFruitData(itemString and itemString.Value or tbl6.StipFlavourText(arg.Name))
					if not v_7 then
						return 0
					end
					local v_8 = v_7[2]
					local v_9 = v_7[1]
					if not v_8 or not v_9 then
						return 0
					end
					local v_10 = tbl6.CalculatorVariant(variant.Value)
					local n = v_8 * tbl6.CalculatorMutation(arg) * v_10
					local n2 = weight.Value / v_9
					local n3 = n2 < 0.95 and 0.95 or n2
					local n4 = n * n3 * n3
					return n4 + 0.5 - (n4 + 0.5) % 1
				end,
				CalculateWeight = function(arg, arg2)
					return arg + arg * 0.1 * arg2
				end,
				CurrentWeight = function(arg, arg2)
					local n = math.min(arg2, 100)
					return (tbl6.CalculateWeight(arg, n))
				end,
			}

			return tbl6
		end

		tbl4.Calculator = fn20()

		local function fn21()
			return {
				GetShopList = function(arg)
					local tbl6 = { "None" }
					local v_7 = playerGui:FindFirstChild(arg)
					if not v_7 then
						return tbl6
					end
					local scrollingFrame = v_7:FindFirstChild("Frame") and v_7.Frame:FindFirstChild("ScrollingFrame")
					if not scrollingFrame then
						return tbl6
					end

					for _, child in pairs(scrollingFrame:GetChildren()) do
						if child:IsA("Frame") and not child.Name:find("Padding") then
							table.insert(tbl6, child.Name)
						end
					end

					return tbl6
				end,
				GetStockGeneric = function(arg, arg2, arg3, arg4)
					local flag = arg4 or false
					local currencyUI = playerGui:FindFirstChild("CurrencyUI")
					currencyUI = currencyUI and currencyUI:FindFirstChild("CurrencyHolder")
					local sheckles = currencyUI and currencyUI:FindFirstChild("Sheckles")
					sheckles = sheckles and sheckles:FindFirstChild("val", true)
					local gardenCoinCurrencyUi = playerGui:FindFirstChild("GardenCoinCurrency_UI")
					gardenCoinCurrencyUi = gardenCoinCurrencyUi and gardenCoinCurrencyUi:FindFirstChild("Frame")

					if gardenCoinCurrencyUi then
						gardenCoinCurrencyUi:FindFirstChild("TextLabel1")
					end

					currencyUI = currencyUI and currencyUI:FindFirstChild("GardenCoins")
					currencyUI = currencyUI and currencyUI:FindFirstChild("val", true)
					flag = flag and currencyUI and currencyUI.Value or sheckles and sheckles.Value or 0
					local n = 0
					local name = nil

					for _, child in pairs(arg:GetChildren()) do
						local isFrame = child:IsA("Frame")

						if isFrame then
							local flag2 = arg3 == "no"

							if flag2 then
								isFrame = flag2
							else
								isFrame = type(arg3) == "table" and table.find(arg3, child.Name)
							end

							isFrame = isFrame or child.Name == arg3
						end

						if isFrame then
							local mainFrame = child:FindFirstChild("Main_Frame")
							local inStock = child:FindFirstChild("Frame") and child.Frame:FindFirstChild("Sheckles_Buy") and child.Frame.Sheckles_Buy:FindFirstChild("In_Stock")

							if mainFrame and inStock and inStock.Visible then
								local costText = inStock:FindFirstChild("Cost_Text")
								costText:FindFirstChild("TEXT")
								costText = costText and tbl4.CorrectNumber(costText.Text)

								if costText and flag >= costText then
									if arg2 == "Best" then
										if flag >= costText and costText > n then
											name = child.Name
											n = costText
										end

										continue
									end

									return child.Name
								end
							end
						end
					end

					return name
				end,
				GetListCosmetic = function()
					local tbl6 = {}
					local cosmeticShopUi = playerGui:FindFirstChild("CosmeticShop_UI")
					local topSegment = cosmeticShopUi:FindFirstChild("TopSegment", true)
					local bottomSegment = cosmeticShopUi:FindFirstChild("BottomSegment", true)

					for _, v_7 in { topSegment, bottomSegment }, nil, nil do
						for _, v_8 in v_7:GetChildren() do
							if v_8:IsA("Frame") then
								table.insert(tbl6, v_8.Name)
							end
						end
					end

					return tbl6
				end,
				GetStockCosmetic = function()
					local cosmeticShopUi = playerGui:FindFirstChild("CosmeticShop_UI")
					local topSegment = cosmeticShopUi:FindFirstChild("TopSegment", true)
					local bottomSegment = cosmeticShopUi:FindFirstChild("BottomSegment", true)
					local tbl6 = {}

					for _, v_7 in { topSegment, bottomSegment }, nil, nil do
						for _, v_8 in v_7:GetChildren() do
							if v_8:IsA("Frame") then
								local stockText = v_8:FindFirstChild("STOCK_TEXT", true)

								if (tonumber(stockText and stockText.Text:match("%d+")) or 0) ~= 0 then
									table.insert(tbl6, { Name = v_8.Name, Type = v_7.Name })
								end
							end
						end
					end

					return tbl6
				end,
			}
		end

		tbl4.Shop = fn21()

		local function fn22()
			return {
				CreateESP = function(parent, arg)
					if not parent or not arg then
						return
					end

					if parent:FindFirstChild("ESP") then
						return
					end
					cached.ESP[parent] = arg
					local isModel = parent:IsA("Model")
					local primaryPart

					if isModel then
						primaryPart = parent.PrimaryPart or parent:FindFirstChildWhichIsA("BasePart")
					else
						primaryPart = isModel
					end

					primaryPart = primaryPart or parent
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

		tbl4.ESP = fn22()

		local function fn23()
			local tbl6

			tbl6 = {
				GetData = function()
					local ok, result = pcall(fn7, ReplicatedStorage.Modules.DataService)
					if ok then
						return result:GetData()
					end
					return nil
				end,
				GetPet_Data = function(arg)
					local petsData = tbl6.GetData()
					if not petsData then
						return
					end
					petsData = petsData and petsData.PetsData
					return (petsData and petsData.PetInventory.Data)[arg]
				end,
				GetPet_BoostData = function(arg)
					local v_7 = tbl6.GetPet_Data(arg)
					return v_7 and v_7.PetData and v_7.PetData.Boosts or nil
				end,
				GetLevel = function(arg)
					local v_7 = tbl6.GetPet_Data(arg)
					if not v_7 then
						return
					end
					return v_7 and v_7.PetData and v_7.PetData.Level
				end,
				GetSaved_Data = function()
					local saveSlots = tbl6.GetData()
					saveSlots = saveSlots and saveSlots.SaveSlots
					return saveSlots and saveSlots.AllSlots[saveSlots.SelectedSlot].SavedObjects
				end,
				GetBeeData = function()
					local v_7 = tbl6.GetData()
					return (v_7 and v_7.BeeEventData).BeeInventoryData
				end,
			}

			return tbl6
		end

		tbl4.DataClient = fn23()

		local function fn24()
			local tbl6

			tbl6 = {
				GetBoothActive = function()
					local dataAsync = require(ReplicatedStorage.Modules.ReplicationReciever).new("Booths"):GetDataAsync()
					local booths = dataAsync and dataAsync.Booths or {}
					local tbl7 = {}

					for _, v_7 in booths, nil, nil do
						if v_7 and v_7.Owner and v_7.Owner ~= "Player_" .. localPlayer.UserId then
							table.insert(tbl7, v_7.Owner)
						end
					end

					return tbl7
				end,
				GetBoothInventory = function(arg)
					local data = require(ReplicatedStorage.Modules.ReplicationReciever).new("Booths"):GetData()
					local tbl7 = {}

					for _, v_7 in tbl6.GetBoothActive(), nil, nil do
						local players = data and data.Players and data.Players[v_7]
						players = players and players.Items
						if arg and v_7 == "Player_" .. arg then
							return players
						end
						table.insert(tbl7, { Owner = v_7, Items = players })
					end

					return tbl7
				end,
				GetPriceItem = function(arg, arg2)
					local dataAsync = require(ReplicatedStorage.Modules.ReplicationReciever).new("Booths"):GetDataAsync()

					for _, v_7 in tbl6.GetBoothActive(), nil, nil do
						if arg and arg ~= v_7 then
							continue
						end
						local players = dataAsync and dataAsync.Players and dataAsync.Players[v_7]
						players = players and players.Listings

						for _, v_8 in players, nil, nil do
							if v_8 and v_8.ItemId == arg2 then
								return v_8.Price
							end
						end
					end

					return nil
				end,
				GetListingId = function(arg, arg2)
					local dataAsync = require(ReplicatedStorage.Modules.ReplicationReciever).new("Booths"):GetDataAsync()

					for _, v_7 in tbl6.GetBoothActive(), nil, nil do
						if arg and arg ~= v_7 then
							continue
						end
						local players = dataAsync and dataAsync.Players and dataAsync.Players[v_7]
						local listings = players and players.Listings

						for k, v_8 in listings, nil, nil do
							v_8 = v_8 and v_8.ItemId == arg2
							if v_8 then
								return k
							end
						end
					end

					return nil
				end,
			}

			return tbl6
		end

		tbl4.Booth_Client = fn24()

		local function fn25()
			if localPlayer:GetAttribute("Holdable_Client_Initialized") then
				return
			end
			localPlayer:SetAttribute("Holdable_Client_Initialized", true)
			local backpack = localPlayer:WaitForChild("Backpack")
			local connection = nil
			local connection2 = nil

			local function fn26(arg)
				return arg:IsA("Tool") and arg:GetAttribute("b") == "j"
			end

			local function fn27()
				local n = 0
				local tbl6 = {}

				task.spawn(function()
					local v_7 = tbl4.ToolFunction.GetAllTool()

					for _, v_8 in ipairs(v_7) do
						if fn26(v_8) and not tbl6[v_8] then
							tbl6[v_8] = true
							n += 1
						end
					end

					localPlayer:SetAttribute("Holdable_Backpack", n)
				end)
			end

			backpack.ChildAdded:Connect(fn27)
			backpack.ChildRemoved:Connect(fn27)

			local function fn28(character)
				if connection then
					connection:Disconnect()
					connection = nil
				end

				if connection2 then
					connection2:Disconnect()
					connection2 = nil
				end

				connection = character.ChildAdded:Connect(fn27)
				connection2 = character.ChildRemoved:Connect(fn27)
				fn27()
			end

			if localPlayer.Character then
				fn28(localPlayer.Character)
			else
				localPlayer:SetAttribute("Holdable_Backpack", 0)
			end

			localPlayer.CharacterAdded:Connect(fn28)
			fn27()
		end

		tbl4.Holdable_Client = fn25()

		local function fn26()
			local tbl6

			tbl6 = {
				Create_AttributePet = function(arg, arg2, arg3)
					for _, child in pairs(workspace.PetsPhysical:GetChildren()) do
						local name = localPlayer.Name

						if child:GetAttribute("OWNER") == name and child:GetAttribute("UUID") == arg2 then
							child:SetAttribute(arg, arg3)
						end
					end
				end,
				WebhookMutation = function(arg, arg2)
					local v_7 = tbl4.API.Data.PetMutationsCode[arg]
					local selectWhitelistMutationsPets = enabled["Select Whitelist Mutations Pets"]
					if not (table.find(selectWhitelistMutationsPets, "All") or table.find(selectWhitelistMutationsPets, v_7)) then
						return
					end
					local webhook = tbl4.Webhook
					local webhookUrl = enabled["Webhook URL"]
					local tbl7 = { content = enabled["Allow Ping On Ping Message/ID"] and enabled["Ping Message/ID"] or "" }
					local embeds = {}
					local tbl8 = { title = "**Speed Hub X | Grow A Garden**", type = "rich", color = tonumber("0xfa0c0c") }
					local fields = {}
					local tbl9 = { name = "** -> Profile : ** \n", value = "> Username : || " .. localPlayer.Name .. " ||", inline = false }

					local tbl10 = {
						name = "** -> Mutation Result : ** \n",
						value = "> Pet Name: ``" .. arg2 .. "``" .. "\n> Mutation Name: ``" .. (tostring(v_7) or "N/A") .. "``",
						inline = false,
					}

					fields[1] = tbl9
					fields[2] = tbl10
					tbl8.fields = fields
					tbl8.thumbnail = { url = tbl4.GetImageURL(tbl4.API.Data.Pets[arg2].Icon) or "" }
					embeds[1] = tbl8
					tbl7.embeds = embeds
					webhook(webhookUrl, tbl7)
				end,
				WebhookHatch = function(arg, arg2)
					local selectWhitelistPets = enabled["Select Whitelist Pets"]
					if not (table.find(selectWhitelistPets, "All") or table.find(selectWhitelistPets, arg2)) then
						return
					end
					local n = tonumber(enabled["Weights Threshold    "]) or 0
					local selectThresholdMode = enabled["Select Threshold Mode    "]
					local v_7 = tbl4.Calculator.CurrentWeight(arg.BaseWeight or 1, arg.Level or 1)
					local str2 = v_7 > 9 and "Titanic"
					local str3

					if str2 then
						str3 = str2
					else
						str3 = v_7 >= 6 and v_7 <= 9 and "Semi Titanic"
					end

					str3 = str3 or v_7 > 3 and "Huge" or "Small"

					if n == 0 or v_7 and (selectThresholdMode == "Above" and v_7 > n or v_7 < n) then
						local webhook = tbl4.Webhook
						local webhookUrl = enabled["Webhook URL"]
						local tbl7 = { content = enabled["Allow Ping On Ping Message/ID"] and enabled["Ping Message/ID"] or "" }
						local embeds = {}
						local tbl8 = { title = "**Speed Hub X | Grow A Garden**", type = "rich", color = tonumber("0xfa0c0c") }
						local fields = {}

						local tbl9 = {
							name = "** -> Profile : ** \n",
							value = "> Username : || " .. localPlayer.Name .. " ||",
							inline = false,
						}

						local tbl10 = {
							name = "** -> Hatched : ** \n",
							value = "> Pet Name: ``" .. arg2 .. "``" .. "\n> Hatched From: ``" .. (arg.HatchedFrom or "N/A") .. "``" .. "\n> Weight: ``" .. (tostring(math.floor(v_7) == v_7 and v_7 or ("%.2f"):format(v_7)) .. " KG" or "N/A") .. "``" .. "\n> Weight Status: ``" .. str3 .. "``" .. "\n> Hunger: ``" .. tostring(arg.Hunger or "N/A") .. "``",
							inline = false,
						}

						fields[1] = tbl9
						fields[2] = tbl10
						tbl8.fields = fields
						tbl8.thumbnail = { url = tbl4.GetImageURL(tbl4.API.Data.Pets[arg2].Icon) or "" }
						embeds[1] = tbl8
						tbl7.embeds = embeds
						webhook(webhookUrl, tbl7)
					end
				end,
				EggClient = function(arg)
					if not enabled["Webhook Egg Once Ready"] then
						return
					end

					pcall(function()
						local v_7 = tbl4.DataClient.GetSaved_Data()
						local v_8

						while true do
							task.wait()
							v_8 = v_7[arg]
							if not (type(v_8) == "table" or shx.Unloaded or not enabled["Webhook Egg Once Ready"]) then
								continue
							end
							break
						end

						local data = v_8.Data
						local type_ = data.Type or "N/A"
						local baseWeight = data.BaseWeight or 1
						local eggName = data.EggName or "N/A"
						local selectWhitelistPets = enabled["Select Whitelist Pets "]

						if not (selectWhitelistPets and #selectWhitelistPets > 1) then
							selectWhitelistPets = { "", "All" }
						end

						local selectWhitelistEggs = enabled["Select Whitelist Eggs"]

						if not (selectWhitelistEggs and #selectWhitelistEggs > 1) then
							selectWhitelistEggs = { "", "All" }
						end

						if not (table.find(selectWhitelistPets, "All") or table.find(selectWhitelistPets, type_)) then
							return
						end

						if not (table.find(selectWhitelistEggs, "All") or table.find(selectWhitelistEggs, eggName)) then
							return
						end
						local n = tonumber(enabled["Weights Pet Threshold"]) or 0
						local selectThresholdMode = enabled["Select Threshold Mode      "]
						local v_9 = tbl4.Calculator.CurrentWeight(baseWeight, 1)
						local str2 = v_9 > 9 and "Titanic"

						if not str2 then
							str2 = v_9 >= 6 and v_9 <= 9 and "Semi Titanic"
						end

						str2 = str2 or v_9 > 3 and "Huge" or "Small"

						if n == 0 or v_9 and (selectThresholdMode == "Above" and v_9 > n or v_9 < n) then
							local webhook = tbl4.Webhook
							local webhookUrl = enabled["Webhook URL"]
							local tbl7 = { content = enabled["Allow Ping On Ping Message/ID"] and enabled["Ping Message/ID"] or "" }
							local embeds = {}
							local tbl8 = { title = "**Speed Hub X | Grow A Garden**", type = "rich", color = tonumber("0xfa0c0c") }
							local fields = {}

							local tbl9 = {
								name = "** -> Profile : ** \n",
								value = "> Username : || " .. localPlayer.Name .. " ||",
								inline = false,
							}

							local tbl10 = {
								name = "** -> Egg Result : ** \n",
								value = "> Egg: ``" .. eggName .. "``" .. "\n> Pet: ``" .. type_ .. "``" .. "\n> Weight: ``" .. (tostring(math.floor(v_9) == v_9 and v_9 or ("%.2f"):format(v_9)) .. " KG" or "N/A") .. "``" .. "\n> Weight Status: ``" .. str2 .. "``",
								inline = false,
							}

							fields[1] = tbl9
							fields[2] = tbl10
							tbl8.fields = fields
							tbl8.thumbnail = { url = tbl4.GetImageURL(tbl4.API.Data.Pets[type_].Icon) or "" }
							embeds[1] = tbl8
							tbl7.embeds = embeds
							webhook(webhookUrl, tbl7)
						end
					end)
				end,
				LogClient = function(...)
					local tbl7 = { ... }
					local v_7 = tbl7[2]

					if tbl7[1] == "UpdateData" then
						if v_7 == "ActivePetsService_Replicator" then
							local tbl8 = tbl7[3]
							local v_8 = ipairs
							tbl8 = tbl8 or {}

							for _, v_9 in v_8(tbl8) do
								local v_10 = v_9[1]
								local v_11 = v_9[2]

								pcall(function()
									if string.find(v_10, localPlayer.Name) and string.find(v_10, "PetInventory") then
										local petType = v_11.PetType
										local petData = v_11.PetData
										if type(petType) ~= "string" or type(petData) ~= "table" then
											return
										end

										if enabled["Webhook Mutations Machine"] and petData.MutationType then
											task.spawn(tbl6.WebhookMutation, petData.MutationType, petType)
										end

										if enabled["Webhook Hatch Eggs"] then
											task.spawn(tbl6.WebhookHatch, petData, petType)
										end
									end
								end)
							end
						end

						if v_7 == localPlayer.Name .. "_DataServiceProfile" then
							local tbl8 = tbl7[3]
							local v_8 = ipairs
							tbl8 = tbl8 or {}

							for _, v_9 in v_8(tbl8) do
								local data = stored.Data
								local v_10 = v_9[2]
								local parts = v_9[1]:split("/")

								for i = 1, #parts do
									local v_11 = parts[i]

									if v_11 ~= "ROOT" then
										if v_11 ~= "PetsData" then
											if not data[v_11] then
												data[v_11] = {}
											end

											if i == #parts then
												if type(v_10) == "table" then
													for k, v_12 in v_10, nil, nil do
														data[v_11][k] = v_12
													end
												else
													data[v_11] = v_10
												end
											end

											data = data[v_11]
										end
									end
								end

								local petInventory = stored.Data.PetInventory

								if type(petInventory) == "table" and next(petInventory) then
									for k, v_11 in pairs(petInventory.Data) do
										local hunger = v_11.PetData and v_11.PetData.Hunger

										if hunger then
											task.spawn(tbl6.Create_AttributePet, "Hunger", k, hunger)
										end
									end
								end
							end
						end
					end
				end,
			}

			local connection = nil

			connection = gameEvents.DataStream.OnClientEvent:Connect(function(...)
				if shx.Unloaded then
					connection:Disconnect()
					connection = nil
					return
				end

				task.spawn(tbl6.LogClient, ...)
			end)

			local connection2 = nil

			connection2 = gameEvents.EggReadyToHatch_RE.OnClientEvent:Connect(function(arg, arg2)
				if shx.Unloaded then
					connection2:Disconnect()
					connection2 = nil
					return
				end

				task.spawn(tbl6.EggClient, arg2)
			end)

			local connection3 = nil

			connection3 = gameEvents.PetCooldownsUpdated.OnClientEvent:Connect(function(arg, arg2)
				if shx.Unloaded then
					connection3:Disconnect()
					connection3 = nil
					return
				end

				if type(arg) ~= "string" or type(arg2) ~= "table" then
					return
				end
				stored.PetCooldown[arg] = arg2
			end)

			return tbl6
		end

		tbl4.DataStream = fn26()

		local function fn27()
			return {
				Connections = function(arg, arg2)
					local v_7 = nil

					return (arg:Connect(function(...)
						if shx.Unloaded then
							if v_7 then
								v_7:Disconnect()
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
				Fallback = function(arg, arg2, arg3, arg4)
					local str2 = arg4 or ""
					if not arg2 or not arg3 then
						return
					end
					cached.Count[arg2] = (cached.Count[arg2] or 0) + (arg ~= nil and 1 or 0)
					local v_7 = enabled[arg2]

					if cached.Count[arg2] > 1 then
						if str2 == "TextBox" and v_7 or str2 ~= "TextBox" and not v_7 then
							task.spawn(arg3)
						end
					end
				end,
			}
		end

		tbl4.Utils = fn27()

		local function fn28()
			local tbl6

			tbl6 = {
				Called = false,
				_Cache = { Server = {} },
				_LastRequest = 0,
				Handler_Cursor = function()
					local fn29 = writefile or function()
					end

					local fn30 = readfile or function()
						return ""
					end

					local fn31 = fn8 or function()
						return false
					end

					local placeId = game.PlaceId

					if fn9 and not fn9("Speed Hub X Server System") then
						pcall(fn10, "Speed Hub X Server System")
					end

					local str2 = "Speed Hub X Server System" .. "/Cached_Server_" .. placeId .. ".json"
					local str3 = "Speed Hub X Server System" .. "/Cursor_" .. placeId .. ".txt"
					local now = os.time()
					local lastRequest = tbl6._LastRequest
					if tick() - lastRequest < 2 then
						return tbl6._Cache
					end
					tbl6._LastRequest = tick()

					if fn31(str2) then
						local ok, cache = pcall(function()
							return HttpService:JSONDecode(fn30(str2))
						end)

						if ok and cache then
							if now - (cache.Cached_Time or 0) < 80 then
								tbl6._Cache = cache
								return cache
							end
						end
					end

					local v_7 = fn31(str3) and fn30(str3) or nil
					local str4 = ("https://games.roblox.com/v1/games/" .. placeId .. "/servers/Public?sortOrder=Asc&limit=100") .. (v_7 and "&cursor=" .. v_7 or "")

					local ok, result = pcall(function()
						return game:HttpGet(str4)
					end)

					if not ok or not result then
						return tbl6._Cache
					end
					local data = HttpService:JSONDecode(result)
					pcall(fn29, str3, data.nextPageCursor or "")
					local cache = { Cached_Time = now, Server = data.data or {} }
					pcall(fn29, str2, HttpService:JSONEncode(cache))
					tbl6._Cache = cache
					return cache
				end,
				Handler_Server = function(arg)
					local jobId = game.JobId
					local v_7 = tbl6.Handler_Cursor()
					local tbl7 = {}
					if not v_7 or not v_7.Server then
						return tbl7
					end
					arg = arg or false

					for _, v_8 in ipairs(v_7.Server) do
						local id = v_8.id

						if id and id ~= jobId then
							local playing = v_8.playing or 0
							local maxPlayers = v_8.maxPlayers or 0

							if playing < maxPlayers then
								if arg then
									if playing >= maxPlayers * 0.7 and playing < maxPlayers then
										tbl7[#tbl7 + 1] = v_8
									end
								else
									tbl7[#tbl7 + 1] = v_8
								end
							end
						end
					end

					return tbl7
				end,
				Hop = function(arg)
					local v_7 = tbl6.Handler_Server(arg)

					if #v_7 > 0 then
						local v_8 = v_7[math.random(1, #v_7)]
						if not v_8 or not v_8.id then
							return
						end
						TeleportService:TeleportToPlaceInstance(game.PlaceId, v_8.id)
						tbl6.Called = true
					end
				end,
			}

			TeleportService.TeleportInitFailed:Connect(function(arg)
				if arg ~= localPlayer then
					return
				end

				if not tbl6.Called then
					return
				end
				tbl6.Called = false
				tbl6.Hop()
			end)

			return tbl6
		end

		tbl4.Server_Hop = fn28()
		return tbl4
	end

	module.Modules = fn12()
	local handlers = {}
	local modules = module.Modules
	local utils = modules.Utils
	local customDelay = modules.CustomDelay
	local toolFunction = modules.ToolFunction
	local collection = modules.Collection
	local sellFunction = modules.SellFunction
	local calculator = modules.Calculator
	local shop = modules.Shop
	local esp = modules.ESP
	local petTeams = modules.PetTeams

	shx.OnUnloaded:Connect(function()
		local esp2 = cached.ESP

		if esp2 and next(esp2) then
			for k in esp2, nil, nil do
				modules.ESP.Removes(k)
			end
		end
	end)

	handlers.Managers = {}
	local managers = handlers.Managers

	managers.GetSeedList = function(arg, arg2)
		local tbl4 = { "None" }

		for k in modules.API.Data.Fruits, nil, nil do
			if not (arg2 and not k:find(arg2)) then
				table.insert(tbl4, k)
			end
		end

		return tbl4
	end

	managers.GetListSeedPack = function()
		return {
			"All",
			"Night Seed Pack",
			"Festive Container",
			"Rainbow Exotic Flower Seed Pack",
			"Rare Gift",
			"Zenith Seed Pack",
			"Rainbow Exotic Culinarian Chest",
			"Rainbow Exotic Crafters Seed Pack",
			"Rainbow Exotic Enchanted Seed Pack",
			"Gourmet Seed Pack",
			"Normal Seed Pack",
			"Flower Seed Pack",
			"Silver Divine Seed Pack",
			"Exotic Hive Seed Pack",
			"Rainbow Exotic Sprout Seed Pack",
			"Rainbow Exotic Hive Seed Pack",
			"Exotic Gardener Seed Pack",
			"Hive Seed Pack",
			"Silver Common Seed Pack",
			"Silver Rare Seed Pack",
			"Exotic Kitsune Chest",
			"Exotic Zen Seed Pack",
			"Honey Hive Seed Pack",
			"Rainbow Exotic Easter Seed Pack",
			"Exotic Easter Seed Pack",
			"Exotic Santa's Surprise Present",
			"Easter Seed Pack",
			"Rainbow Exotic Enchanted Chest",
			"Admin Pack",
			"Exotic Enchanted Seed Pack",
			"Premium Night Seed Pack",
			"Rainbow Exotic Kitsune Chest",
			"Exotic Zenith Seed Pack",
			"Rainbow Gift",
			"Gold Gift",
			"Elemental Container",
			"Safari Seed Pack",
			"Mythical Gift",
			"Culinarian Chest",
			"Kitsune Chest",
			"Exotic Season 4 Seed Pack",
			"Rainbow Exotic Nutty Chest",
			"Rainbow Exotic Holiday Seed Pack",
			"Exotic Flower Seed Pack",
			"Bad Present",
			"Exotic Holiday Seed Pack",
			"Basic Seed Pack",
			"Exotic Nutty Chest",
			"Prime Seed Pack",
			"Exotic Summer Seed Pack",
			"Rainbow Exotic Santa's Surprise Present",
			"Rainbow Exotic Season 4 Seed Pack",
			"Rainbow Exotic Gourmet Seed Pack",
			"Halloween Gear Box",
			"Enchanted Chest",
			"Sprout Seed Pack",
			"Christmas Present",
			"Normal Present",
			"Silver Legendary Seed Pack",
			"Rare Present",
			"Rainbow Exotic Buttercup Chest",
			"Rainbow Exotic Skyroot Chest",
			"Exotic Buttercup Chest",
			"Exotic Ancient Seed Pack",
			"Rainbow Buttercup Chest",
			"Rainbow Basic Seed Pack",
			"Silver Mythical Seed Pack",
			"Silver Uncommon Seed Pack",
			"Rainbow Premium Seed Pack",
			"Artisan Container",
			"Zen Seed Pack",
			"Exotic Gem Chest",
			"Nutty Chest",
			"Rainbow Exotic Gem Chest",
			"Season 4 Seed Pack",
			"Gem Chest",
			"Rainbow Exotic Safari Seed Pack",
			"Exotic Crafters Seed Pack",
			"Exotic Safari Seed Pack",
			"Special Exotic Spooky Chest",
			"Common Gift",
			"Santa's Surprise Present",
			"Exotic Season 5 Seed Pack",
			"Exotic Spooky Chest",
			"Rainbow Exotic Fall Seed Pack",
			"Holiday Seed Pack",
			"Rainbow Exotic Season 5 Seed Pack",
			"Exotic Seed Pack",
			"Ancient Seed Pack",
			"Season 5 Seed Pack",
			"Silver Fall Seed Pack",
			"Rainbow Exotic Zen Seed Pack",
			"Rainbow Exotic Prime Seed Pack",
			"Exotic Enchanted Chest",
			"Exotic Culinarian Chest",
			"Enchanted Seed Pack",
			"Exotic Fall Seed Pack",
			"Rainbow Exotic Zenith Seed Pack",
			"Fall Seed Pack",
			"Summer Seed Pack",
			"Exotic Sprout Seed Pack",
			"Rainbow Gardener Seed Pack",
			"Crafters Seed Pack",
			"Rainbow Exotic Ancient Seed Pack",
			"Silver Prismatic Seed Pack",
			"Exotic Skyroot Chest",
			"Skyroot Chest",
			"Premium Seed Pack",
			"Gardener Seed Pack",
			"Buttercup Chest",
			"Spooky Chest",
			"Exotic Prime Seed Pack",
			"Exotic Gourmet Seed Pack",
			"Rainbow Exotic Summer Seed Pack",
		}
	end

	managers.GetMutationList = function(arg, arg2)
		local flag = arg2 or false
		local tbl4 = {}

		for k in modules.API.Data.Mutations, nil, nil do
			if not flag or flag ~= k then
				table.insert(tbl4, k)
			end
		end

		return tbl4
	end

	managers.GetSprinklerList = function()
		local tbl4 = {}

		for _, child in pairs(ReplicatedStorage.ObjectModels:GetChildren()) do
			if child:IsA("Model") and child.Name:find("Sprinkler") then
				table.insert(tbl4, child.Name)
			end
		end

		return tbl4
	end

	managers.GetPetFromUUID = function(arg, arg2)
		local ok, result = pcall(require, ReplicatedStorage.Modules.DataService)

		if ok and result then
			local data = result:GetData()

			if data and data.PetsData then
				local v_6 = data.PetsData.PetInventory.Data[arg2]
				if v_6 and v_6.PetType then
					return v_6.PetType
				end
			end
		end

		local petType = arg2 and playerGui:FindFirstChild(arg2, true)
		petType = petType and petType:FindFirstChild("PET_TYPE", true)
		if petType and petType:IsA("TextLabel") then
			return petType.Text
		end
	end

	managers.GetPetsList = function()
		local tbl4 = {}
		local petsPhysical = workspace:FindFirstChild("PetsPhysical")
		if not petsPhysical then
			return
		end

		for _, child in pairs(petsPhysical:GetChildren()) do
			local name = localPlayer.Name

			if child:GetAttribute("OWNER") == name and child:FindFirstChildWhichIsA("Model") then
				local attribute = child:GetAttribute("UUID")
				local petFromUUID = managers:GetPetFromUUID(attribute)

				if petFromUUID then
					table.insert(tbl4, petFromUUID .. " " .. attribute)
				end
			end
		end

		return tbl4
	end

	managers.GetPlayerList = function()
		local tbl4 = {}

		for _, v_6 in Players:GetPlayers(), nil, nil do
			if v_6 ~= localPlayer then
				table.insert(tbl4, v_6.Name)
			end
		end

		return tbl4
	end

	managers.GetPetsLists = function()
		local tbl4 = {}

		for k in pairs(modules.API.Data.Pets) do
			table.insert(tbl4, k)
		end

		return tbl4
	end

	managers.GetCrateList = function()
		local tbl4 = {}
		local crateModels = ReplicatedStorage:FindFirstChild("CrateModels", true)
		if not crateModels then
			return tbl4
		end

		for _, child in pairs(crateModels:GetChildren()) do
			if child:IsA("Model") then
				table.insert(tbl4, child.Name)
			end
		end

		return tbl4
	end

	managers.GetItemCrateList = function()
		local tbl4 = {}

		for _, crate in pairs(modules.API.Data.Crates) do
			table.insert(tbl4, crate)
		end

		return tbl4
	end

	managers.GetEggList = function(arg, arg2)
		local flag = arg2 or false
		local tbl4 = {}

		if flag then
			tbl4 = { "All" }
		end

		for _, child in pairs(ReplicatedStorage.Assets.Models.EggModels:GetChildren()) do
			table.insert(tbl4, child.Name)
		end

		return tbl4
	end

	managers.GetGoodPositions = function()
		local Plant_Locations = modules.GetFarmPath("Plant_Locations")
		if not Plant_Locations then
			return
		end
		local children = Plant_Locations:GetChildren()
		if #children == 0 then
			return
		end
		local tbl4 = {}

		for _, child in ipairs(children) do
			local n = math.floor(child.Size.X / 4)
			local n2 = math.floor(child.Size.Z / 4)

			for i = -n, n do
				for i2 = -n2, n2 do
					local vector_ = Vector3.new(i * 2, 0, i2 * 2)
					local v_6 = child.CFrame:PointToWorldSpace(vector_)
					table.insert(tbl4, v_6)
				end
			end
		end

		return tbl4
	end

	managers.GetRandomPlant = function()
		local Plant_Locations = modules.GetFarmPath("Plant_Locations")
		if not Plant_Locations then
			return
		end
		local children = Plant_Locations:GetChildren()
		local v_6 = children[math.random(1, #children)]
		local create = vector.create
		local x = v_6.Size.X
		local n = (math.random() - 0.5) * x
		local y = v_6.Size.Y
		local n2 = (math.random() - 0.5) * y
		local z = v_6.Size.Z
		local v_7 = create(n, n2, (math.random() - 0.5) * z)
		return v_6.CFrame:PointToWorldSpace(v_7)
	end

	managers.GetPetTime = function(arg, arg2)
		local v_6 = stored.PetCooldown[arg2]

		if v_6 then
			local tbl4 = {}
			local tbl5 = {}
			local tbl6 = {}

			for _, v_7 in pairs(v_6) do
				local time = v_7.Time
				local passive = v_7.Passive
				table.insert(tbl5, time)
				table.insert(tbl6, passive)

				if time <= 0 then
					table.insert(tbl4, "READY")
				elseif time >= 60 then
					table.insert(tbl4, ("%d:%02dm"):format(math.floor(time / 60), time % 60))
				else
					table.insert(tbl4, ("%ds"):format(time))
				end
			end

			return { Result = table.concat(tbl4, " | "), Time = tbl5, Passive = tbl6 }
		end
	end

	managers.GetPetPosition = function(arg, arg2, arg3)
		local flag = arg3 or false
		local tbl4 = {}
		local petsPhysical = workspace:FindFirstChild("PetsPhysical")
		if not petsPhysical then
			return tbl4
		end

		for _, child in ipairs(petsPhysical:GetChildren()) do
			local name = localPlayer.Name

			if child:GetAttribute("OWNER") == name then
				local attribute = child:GetAttribute("UUID")

				if attribute then
					local petFromUUID = managers:GetPetFromUUID(attribute)

					if petFromUUID and table.find(arg2, petFromUUID .. " " .. attribute) then
						local flag2

						if not flag then
							flag2 = true
						else
							local petTime = managers:GetPetTime(attribute)
							flag2 = petTime and petTime.Result and petTime.Result:find("READY")
						end

						if flag2 then
							tbl4[#tbl4 + 1] = { CFrame = child.CFrame }
						end
					end
				end
			end
		end

		return tbl4
	end

	managers.IsWeather = function()
		for k, v_6 in workspace:GetAttributes() do
			if v_6 == true and k ~= "AllowFakePurchase" and k ~= "AllWeather" then
				return true
			end
		end

		return false
	end

	managers.GetMutationName = function(arg, arg2)
		for k in modules.API.Data.Mutations, nil, nil do
			if arg2:GetAttribute(k) then
				return k
			end
		end

		return "None"
	end

	managers.GetMutationName_T = function(arg, arg2)
		local tbl4 = {}

		for k in modules.API.Data.Mutations, nil, nil do
			if arg2:GetAttribute(k) then
				table.insert(tbl4, k)
			end
		end

		return #tbl4 > 0 and table.concat(tbl4, ", ") or "None"
	end

	managers.FormatMutation = function(arg, arg2)
		if not arg2 or arg2 == "None" then
			return ""
		end
		local flag = type(arg2) == "table" and arg2 or string.split(arg2, ", ")
		local tbl4 = {}
		local insert = table.insert
		local mutations = modules.API.Data.Mutations

		for _, v_6 in ipairs(flag) do
			local color = mutations[v_6]
			color = color and color.Color
			local color2 = color and Color3.fromRGB(color.r, color.g, color.b) or Color3.new(1, 1, 1)
			insert(tbl4, ("<font color=\"rgb(%d,%d,%d)\">%s</font>"):format(math.floor(color2.R * 255), math.floor(color2.G * 255), math.floor(color2.B * 255), v_6))
		end

		return table.concat(tbl4, ", ")
	end

	managers.FormatVariant = function(arg, arg2, arg3)
		if not arg2 then
			return "<font color=\"rgb(255,255,255)\">None</font>"
		end
		local value = arg2.Value
		local str2

		if value == "Gold" then
			str2 = "rgb(255,215,0)"
		elseif value == "Rainbow" then
			local n = math.floor(arg3.R * 255)
			local n2 = math.floor(arg3.G * 255)
			local n3 = math.floor(arg3.B * 255)
			str2 = ("rgb(%d,%d,%d)"):format(n, n2, n3)
		else
			str2 = "rgb(255,255,255)"
		end

		return ("<font color=\"%s\">%s</font>"):format(str2, value)
	end

	managers.GetSpinnerClosest = function()
		local rollCrateUi = playerGui:FindFirstChild("RollCrate_UI")
		if not (rollCrateUi and rollCrateUi.Enabled) then
			return
		end
		local frame = rollCrateUi:FindFirstChild("Frame")
		if not frame then
			return
		end
		local section = frame:FindFirstChild("Section")
		section = section and section:FindFirstChild("Spinner")
		local arrow = frame:FindFirstChild("Arrow")
		if not (section and arrow) then
			return
		end
		local x = arrow.AbsolutePosition.X
		local huge = math.huge
		local v_6 = nil

		for i = 1, #section:GetChildren() do
			local v_7 = section:GetChildren()[i]

			if v_7:IsA("Frame") then
				local n = math.abs(v_7.AbsolutePosition.X - x)

				if n < huge then
					huge = n
					v_6 = v_7
				end
			end
		end

		return v_6
	end

	managers.DecimalNumberFormat = function(arg, arg2)
		return math.floor(arg2) == arg2 and arg2 or ("%.2f"):format(arg2)
	end

	managers.GetCraftTable = function(arg, arg2)
		local tbl4 = { "None" }

		for k, v_6 in modules.API.Craft, nil, nil do
			if v_6.MachineTypes and v_6.MachineTypes[1] == arg2 then
				table.insert(tbl4, k)
			end
		end

		return tbl4
	end

	managers.ProgressCraft = function(arg, arg2, arg3, arg4, arg5, arg6)
		local craftingProximityPrompt = arg4:FindFirstChild("CraftingProximityPrompt", true)

		if craftingProximityPrompt and craftingProximityPrompt.ActionText == "Skip" then
			local flag

			if enabled["Auto Switch File "] then
				flag = managers:FireFile(enabled["Select File (For Speed Up)"], "Delay To Switch   ")
			elseif enabled["Auto Switch Loadouts "] then
				flag = managers:FireSlotLoadout(enabled["Select Slot (For Speed Up)"], "Delay To Switch ")
			else
				flag = true
			end

			if flag then
				return
			end
		end

		if craftingProximityPrompt.ActionText == "Claim" then
			local flag

			if enabled["Auto Switch File "] then
				flag = managers:FireFile(enabled["Select File (For Claim Craft)"], "Delay To Switch   ")
			elseif enabled["Auto Switch Loadouts "] then
				flag = managers:FireSlotLoadout(enabled["Select Slot (For Claim Craft)"], "Delay To Switch ")
			else
				flag = true
			end

			if flag then
				gameEvents.CraftingGlobalObjectService:FireServer("Claim", arg4, arg3, 1)
				task.wait(1)
				return
			end
		end

		for k, v_6 in arg5.Inputs, nil, nil do
			if enabled[arg2] then
				if craftingProximityPrompt.ActionText == "Select Recipe" then
					gameEvents.CraftingGlobalObjectService:FireServer("SetRecipe", arg4, arg3, arg6)
					task.wait(1)
				end

				local v_7 = toolFunction.GetItem(v_6.ItemData.ItemName, v_6.ItemType)

				if v_7 then
					local flag

					if enabled["Auto Switch File "] then
						flag = managers:FireFile(enabled["Select File (For Crafting)"], "Delay To Switch   ")
					elseif enabled["Auto Switch Loadouts "] then
						flag = managers:FireSlotLoadout(enabled["Select Slot (For Crafting)"], "Delay To Switch ")
					else
						flag = true
					end

					if flag then
						gameEvents.CraftingGlobalObjectService:FireServer("InputItem", arg4, arg3, k, { ItemType = v_6.ItemType, ItemData = { UUID = v_7:GetAttribute("c") } })
						task.wait(1.5)
						gameEvents.CraftingGlobalObjectService:FireServer("Craft", arg4, arg3)
					end
				end

				continue
			end

			break
		end
	end

	managers.GetPetMutationName = function(arg, arg2)
		for _, v_6 in modules.API.Data.PetMutations, nil, nil do
			if arg2:find(v_6, 1, true) then
				return v_6
			end
		end

		return nil
	end

	managers.CleanMutation_Pet = function(arg, arg2)
		if not ({
			["Rainbow Bacon Pig"] = true,
			["Corrupted Kodama"] = true,
			["Rainbow Kodama"] = true,
			["Rainbow Cardinal"] = true,
			["Rainbow Chinchilla"] = true,
			Crocodile = true,
			Rhino = true,
			["Silver Monkey"] = true,
			Giraffe = true,
			["Rainbow Griffin"] = true,
			["Corrupted Kitsune"] = true,
			["Rainbow Maneki-neko"] = true,
			["Silver Dragonfly"] = true,
			["Rainbow Mizuchi"] = true,
			["Golden Bee"] = true,
			["Rainbow Pachycephalosaurus"] = true,
			["Rainbow Giraffe"] = true,
			["Rainbow Stag Beetle"] = true,
			["Rainbow Farmer Chipmunk"] = true,
			["Rainbow Elk"] = true,
			["Rainbow Blue Jay"] = true,
			Oxpecker = true,
			["Rainbow Shroomie"] = true,
			["Rainbow Hydra"] = true,
			["Rainbow Oxpecker"] = true,
			["Rainbow Hotdog Daschund"] = true,
			["Rainbow Fortune Squirrel"] = true,
			["Rainbow Idol Chipmunk"] = true,
			["Rainbow Dilophosaurus"] = true,
			["Lemon Lion"] = true,
			["Rainbow Elephant"] = true,
			["Rainbow Zebra"] = true,
			["Rainbow Rhino"] = true,
			["GIANT Silver Dragonfly"] = true,
			["Rainbow Corrupted Kitsune"] = true,
			["Rainbow Ankylosaurus"] = true,
			["Glimmering Sprite"] = true,
			["Rainbow Mandrake"] = true,
			["Luminous Sprite"] = true,
			Lion = true,
			["Rainbow Phoenix"] = true,
			["Golden Lab"] = true,
			["Rainbow Lobster Thermidor"] = true,
			["Rainbow Parasaurolophus"] = true,
			["Rainbow Spinosaurus"] = true,
			["Golden Goose"] = true,
			["Rainbow Iguanodon"] = true,
		})[arg2] then
			local petMutationName = managers:GetPetMutationName(arg2)

			if petMutationName then
				arg2 = arg2:gsub(petMutationName, "", 1):gsub("^%s", "")
			end
		end

		return arg2
	end

	managers.ListBoostItem = function()
		local tbl4 = {}
		local petBoosts = ReplicatedStorage:FindFirstChild("PetBoosts", true)

		for _, v_6 in petBoosts:GetChildren() do
			if v_6:IsA("Model") then
				table.insert(tbl4, v_6.Name)
			end
		end

		return tbl4
	end

	managers.IsPlacedMax = function()
		local Objects_Physical = modules.GetFarmPath("Objects_Physical")
		if not Objects_Physical then
			return
		end
		local n = 0

		for _, child in ipairs(Objects_Physical:GetChildren()) do
			if child:IsA("Model") and child.Name == "PetEgg" then
				n += 1
			end
		end

		return n >= enabled["Place Egg Max"]
	end

	managers.IsSwitchingActive = function()
		return stored.Pet_Switcher["Switch Lock"] or stored.Pet_Switcher["Is Switching"]
	end

	managers.IsOperationBlocked = function()
		return stored.Pet_Switcher["Hatching Egg"] or stored.Pet_Switcher["Selling Pet"] or stored.Pet_Switcher["Place Egg"] or stored.Pet_Switcher["Stop Switch"] or stored.Pet_Switcher["Pick Place Active"] or managers:IsSwitchingActive()
	end

	managers.CanSwitch = function()
		if managers:IsSwitchingActive() then
			return false
		end
		return not (stored.Pet_Switcher["Hatching Egg"] or stored.Pet_Switcher["Selling Pet"] or stored.Pet_Switcher["Place Egg"] or stored.Pet_Switcher["Pick Place Active"])
	end

	managers.SlotLoadout = function(arg, arg2)
		if not arg2 or arg2 == "None" or arg2 == "" then
			return false
		end
		local n = arg2 == "3" and 2
		local n2

		if n then
			n2 = n
		else
			n2 = arg2 == "2" and 3
		end

		n2 = n2 or arg2 == "4" and 4 or arg2 == "5" and 5 or arg2 == "6" and 6 or 1
		local activePetUI = playerGui:FindFirstChild("ActivePetUI")
		if not activePetUI then
			return false
		end
		local buttonHolder = activePetUI:FindFirstChild("ButtonHolder", true)
		if not buttonHolder then
			return false
		end
		local v_6 = buttonHolder:FindFirstChild("PET_LOADOUT_" .. n2)
		if not v_6 then
			return false
		end
		return v_6.BackgroundColor3 == Color3.fromRGB(36, 227, 36)
	end

	managers.SetLoadout = function(arg, arg2)
		if not arg2 or arg2 == "None" or arg2 == "" then
			return false
		end
		local n = arg2 == "3" and 2 or arg2 == "2" and 3 or arg2 == "4" and 4 or arg2 == "5" and 5
		local n2

		if n then
			n2 = n
		else
			n2 = arg2 == "6" and 6
		end

		local n3 = n2 or 1

		return (pcall(function()
			gameEvents.PetsService:FireServer("SwapPetLoadout", n3)
		end))
	end

	managers.FireSlotLoadout = function(arg, loadout, arg2)
		if not loadout or loadout == "None" or loadout == "" then
			return false
		end

		if managers:SlotLoadout(loadout) then
			return true
		end
		task.wait(tonumber(enabled[arg2]) or 1)

		if stored.Pet_Switcher["Switch Lock"] then
			local n = 0

			while stored.Pet_Switcher["Switch Lock"] and n < 15 do
				task.wait(0.5)
				n += 0.5
			end

			if stored.Pet_Switcher["Switch Lock"] then
				return false
			end
		end

		stored.Pet_Switcher["Switch Lock"] = true
		stored.Pet_Switcher["Is Switching"] = true
		stored.Pet_Switcher["Current Operation"] = "Loadout: " .. loadout
		local n = 0
		local n2 = 0
		local flag

		while true do
			local flag2 = not enabled["Auto Switch Loadouts"] and not enabled["Auto Switch Loadouts "]

			if flag2 then
				flag2 = not (enabled["Auto Mutations Pets"] and enabled["Allows Switch Loadouts"])
			end

			flag = false

			if not flag2 then
				if not shx.Unloaded then
					managers:SetLoadout(loadout)
					task.wait(0.4)

					if managers:SlotLoadout(loadout) then
						flag = true
						break
					else
						n += 0.4
						n2 += 1
						if not (n >= 12 or n2 >= 30) then
							continue
						end
					end
				end
			end

			break
		end

		stored.Pet_Switcher["Switch Lock"] = false
		stored.Pet_Switcher["Is Switching"] = false
		stored.Pet_Switcher["Current Operation"] = nil

		if flag then
			stored.Pet_Switcher["Last Switch Time"] = tick()
			task.wait(1.5)
		end

		return flag
	end

	managers.SetFile = function(arg, team)
		if team == nil or team == "" or team == "None" then
			return false
		end
		local v_6 = petTeams.ReadPetTeam(team)
		if not v_6 then
			return false
		end
		local tbl4 = {}

		if #v_6 > 0 then
			local petsPhysical = workspace:FindFirstChild("PetsPhysical")

			if petsPhysical then
				for _, child in ipairs(petsPhysical:GetChildren()) do
					local name = localPlayer.Name

					if child:GetAttribute("OWNER") == name then
						pcall(function()
							gameEvents.PetsService:FireServer("UnequipPet", child:GetAttribute("UUID"))
						end)
					end
				end
			end

			task.wait(0.8)

			for _, v_7 in ipairs(v_6) do
				if pcall(function()
					gameEvents.PetsService:FireServer("EquipPet", v_7, localPlayer.Character.HumanoidRootPart.CFrame)
				end) then
					table.insert(tbl4, v_7)
				end
			end

			local n = 0

			while #tbl4 > 0 and n < 35 do
				for i = #tbl4, 1, -1 do
					if modules.CheckPets(tbl4[i]) == true then
						table.remove(tbl4, i)
					end
				end

				if #tbl4 > 0 then
					task.wait(0.15)
					n += 0.15
				end
			end

			if #tbl4 == 0 then
				cached.Team = team
				shx:SetNotification({ "Speed Hub X", "", "Successfully Equipped " .. team, 5, 0.5 })
				return true
			end

			cached.Team = nil

			shx:SetNotification({
				"Speed Hub X",
				"",
				"Failed to equip team " .. team .. ". " .. #tbl4 .. " pets missing.",
				5,
				0.5,
			})

			return false
		end

		return false
	end

	managers.FireFile = function(arg, file, arg2)
		if not file or file == "" or file == "None" then
			return false
		end

		if cached.Team == file then
			return true
		end
		task.wait(tonumber(enabled[arg2]) or 1)

		if stored.Pet_Switcher["Switch Lock"] then
			local n = 0

			while stored.Pet_Switcher["Switch Lock"] and n < 15 do
				task.wait(0.5)
				n += 0.5
			end

			if stored.Pet_Switcher["Switch Lock"] then
				return false
			end
		end

		stored.Pet_Switcher["Switch Lock"] = true
		stored.Pet_Switcher["Is Switching"] = true
		stored.Pet_Switcher["Current Operation"] = "File: " .. file
		local flag = false
		local n = 0

		while true do
			if not (not enabled["Auto Switch File"] and not enabled["Auto Switch File "]) then
				if not shx.Unloaded then
					flag = managers:SetFile(file)

					if not flag then
						task.wait(1)
						n += 1
						if not (n >= 12) then
							continue
						end
					end
				end
			end

			break
		end

		stored.Pet_Switcher["Switch Lock"] = false
		stored.Pet_Switcher["Is Switching"] = false
		stored.Pet_Switcher["Current Operation"] = nil

		if flag then
			stored.Pet_Switcher["Last Switch Time"] = tick()
			task.wait(1.5)
		end

		return flag
	end

	local function fn13()
		managers.CheckEgg = function(arg, arg2)
			if not (str:find("Solara") or str:find("Xeno")) then
				local v_6 = modules.DataClient.GetSaved_Data()
				if not v_6 or not v_6[arg2] then
					return true
				end
				local v_7 = v_6[arg2]
				if not v_7 or not v_7.Data then
					return true
				end
				local data = v_7.Data
				local type_ = data.Type or "N/A"
				local baseWeight = data.BaseWeight or 1
				local choosePets = enabled["Choose Pets "]

				if #choosePets > 1 and not table.find(choosePets, "None") then
					if enabled["Select Filter Mode"] == "Blacklist" then
						if table.find(choosePets, type_) then
							return false
						end
					elseif not table.find(choosePets, type_) then
						return false
					end
				end

				local n = tonumber(enabled["Weights Pet Threshold "]) or 0
				local selectThresholdMode = enabled["Select Threshold Mode       "]
				local v_8 = modules.Calculator.CurrentWeight(baseWeight, 1)
				return n == 0 or v_8 and selectThresholdMode == "Above" and v_8 > n or selectThresholdMode ~= "Above" and v_8 < n
			end

			return true
		end
	end

	fn13()

	managers.GetCountPlacedEggs = function()
		local Objects_Physical = modules.GetFarmPath("Objects_Physical")
		if not Objects_Physical then
			return false
		end
		local n = 0

		for _, child in ipairs(Objects_Physical:GetChildren()) do
			if child:IsA("Model") and child.Name == "PetEgg" then
				n += 1
			end
		end

		return n
	end

	managers.GetRequiredEvent = function()
		local easter2026 = workspace:FindFirstChild("Easter2026", true)
		easter2026 = easter2026 and easter2026:FindFirstChild("TurnIn")
		easter2026 = easter2026 and easter2026:FindFirstChild("RequestSign")
		easter2026 = easter2026 and easter2026:FindFirstChild("SurfaceGui", true)
		if not easter2026 then
			return
		end
		local infoLabel = easter2026:FindFirstChild("InfoLabel")
		local nameLabel = easter2026:FindFirstChild("NameLabel")
		local tbl4 = { Normal = true, Gold = true, Rainbow = true, Silver = true }
		infoLabel = infoLabel and infoLabel.Text
		local num = nil
		local v_6 = nil
		local v_7 = nil

		if infoLabel then
			local tbl5 = {}

			for match in string.gmatch(infoLabel, "([^,]+)") do
				tbl5[#tbl5 + 1] = match:gsub("^%s+", ""):gsub("%s+$", "")
			end

			num = nil

			if tbl5[1] then
				num = tonumber(tbl5[1]:match("([%d%.%-]+)"))
			end

			v_6 = nil
			v_7 = nil

			for i = 2, #tbl5 do
				local v_8 = tbl5[i]

				if tbl4[v_8] then
					v_6 = v_8
				else
					v_7 = v_8
				end
			end
		end

		return nameLabel and nameLabel.Text or nil, num, v_6, v_7
	end

	managers.GetCurrentChoc = function()
		local chocCoinCurrencyUi = playerGui:FindFirstChild("ChocCoinCurrency_UI")
		chocCoinCurrencyUi = chocCoinCurrencyUi and chocCoinCurrencyUi:FindFirstChild("Frame")
		chocCoinCurrencyUi = chocCoinCurrencyUi and chocCoinCurrencyUi:FindFirstChild("val", true)
		return chocCoinCurrencyUi and chocCoinCurrencyUi.Value or 0
	end

	managers.GetCurrentToken = function()
		local tradeTokenCurrencyUi = playerGui:FindFirstChild("TradeTokenCurrency_UI")
		local tradeTokens = tradeTokenCurrencyUi and tradeTokenCurrencyUi:FindFirstChild("TradeTokens")
		tradeTokens = tradeTokens and tradeTokens:FindFirstChild("TextLabel1")
		tradeTokens = tradeTokens and tradeTokens:FindFirstChild("val", true)
		return tradeTokens and tradeTokens.Value or 0
	end

	managers.GetCurrentHoney = function()
		local honeyCoinCurrencyUi = playerGui:FindFirstChild("HoneyCoinCurrency_UI")
		honeyCoinCurrencyUi = honeyCoinCurrencyUi and honeyCoinCurrencyUi:FindFirstChild("val", true)
		return honeyCoinCurrencyUi and honeyCoinCurrencyUi.Value or 0
	end

	managers.GetCurrentJelly = function()
		local royalJellyCurrencyUi = playerGui:FindFirstChild("RoyalJellyCurrency_UI")
		royalJellyCurrencyUi = royalJellyCurrencyUi and royalJellyCurrencyUi:FindFirstChild("val", true)
		return royalJellyCurrencyUi and royalJellyCurrencyUi.Value or 0
	end

	managers.GetStackOwner = function()
		local candyPackaging = workspace:FindFirstChild("CandyPackaging", true)
		candyPackaging = candyPackaging and candyPackaging:FindFirstChild("Stacks")

		for _, child in pairs(candyPackaging:GetChildren()) do
			local sign = child:FindFirstChild("Sign")
			sign = sign and sign:FindFirstChild("Billboard")
			sign = sign and sign:FindFirstChild("SurfaceGui")
			local textLabel = sign and sign:FindFirstChild("Frame") and sign.Frame:FindFirstChild("TextLabel")
			if textLabel and textLabel.Text == localPlayer.Name then
				return child
			end
		end

		return nil
	end

	managers.GetPlantTrait = function(arg, arg2)
		local v_6 = fn7(ReplicatedStorage.Modules.PlantTraitsData)
		if not v_6 then
			return
		end
		return v_6[arg2]
	end

	local managers2 = handlers.Managers

	handlers.LoadLibrary = function()
		local v_6 = shx:CreateWindow({
			Title = "Speed Hub X | Version 5.5.3 | discord.gg/speedhubx",
			Description = "",
			["Tab Width"] = 130,
			SaveSystem = { Enable = true, File = "Grow a Garden" },
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
			Home = v_6:CreateTab({ Name = "Home", Icon = "rbxassetid://10734942198" }),
			Main = v_6:CreateTab({ Name = "Main", Icon = "rbxassetid://10723407389" }),
			Automatically = v_6:CreateTab({ Name = "Automatically", Icon = "rbxassetid://10734923549" }),
			Inventory = v_6:CreateTab({ Name = "Inventory", Icon = "rbxassetid://10709769841" }),
			Shop = v_6:CreateTab({ Name = "Shop", Icon = "rbxassetid://10734952273" }),
			TradingMarket = v_6:CreateTab({ Name = "Trading Market", Icon = "rbxassetid://82291850711895" }),
			Webhook = v_6:CreateTab({ Name = "Webhook", Icon = "rbxassetid://17320556264" }),
			Miscellaneous = v_6:CreateTab({ Name = "Misc", Icon = "rbxassetid://11447063791" }),
			Settings = v_6:CreateTab({ Name = "Settings", Icon = "rbxassetid://10734950309" }),
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

			task.spawn(function()
				utils.Fallback(arg, "Enable Walkspeed", function()
					local character = localPlayer and localPlayer.Character
					character = character and character:FindFirstChild("Humanoid")

					if character then
						character.WalkSpeed = 16
					end
				end)
			end)
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

		local v_7 = tbl4.Main:AddSection("Automation Plants")

		funcs:Dropdown(v_7, "Select Seeds", "", true, managers2:GetSeedList(), { "" }, true, function(arg)
			enabled["Select Seeds"] = arg
		end)

		funcs:Dropdown(v_7, "Select Position", "", false, { "Good Position", "Random", "Player Position" }, { "" }, true, function(arg)
			enabled["Select Position"] = arg
		end)

		funcs:Textbox(v_7, "Delay To Plants", "", "0", true, function(arg)
			enabled["Delay To Plants"] = tonumber(arg)
		end)

		funcs:Toggle(v_7, "Auto Plants Seed", "", false, true, function(arg)
			enabled["Auto Plants Seed"] = arg
		end)

		funcs:Toggle(v_7, "Auto Plants All Seeds", "", false, true, function(arg)
			enabled["Auto Plants All Seeds"] = arg
		end)

		local v_8 = tbl4.Main:AddSection("Automation Collection")
		v_8:AddSeperator({ " - [ Config ] - " })

		funcs:Toggle(v_8, "Stop Collect If Weather Is Here", "", false, true, function(arg)
			enabled["Stop Collect If Weather Is Here"] = arg
		end)

		funcs:Toggle(v_8, "Instant Collect", "It will lag/freeze if you have too many plants, but the lag/freeze will stop after 5 seconds.", false, true, function(arg)
			enabled["Instant Collect"] = arg
		end)

		funcs:Toggle(v_8, "Stop Collect If Backpack Is Full Max", "", false, true, function(arg)
			enabled["Stop Collect If Backpack Is Full Max"] = arg
		end)

		funcs:Toggle(v_8, "Disable Collect Prompt", "Prevention Accident Collect", false, true, function(arg)
			enabled["Disable Collect Prompt"] = arg

			task.spawn(pcall, function()
				if not arg then
					return
				end

				for _, v_9 in modules.GetFarmPath("Plants_Physical"):QueryDescendants("ProximityPrompt") do
					if v_9:GetAttribute("Backup_MaxDist") == nil then
						v_9:SetAttribute("Backup_MaxDist", v_9.MaxActivationDistance)
					end

					if arg then
						v_9.MaxActivationDistance = 0
					end
				end
			end)

			utils.Fallback(arg, "Disable Collect Prompt", function()
				for _, v_9 in modules.GetFarmPath("Plants_Physical"):QueryDescendants("ProximityPrompt") do
					local attribute = v_9:GetAttribute("Backup_MaxDist")

					if attribute then
						v_9.MaxActivationDistance = attribute
					end
				end
			end)
		end)

		funcs:Textbox(v_8, "Delay To Collect", "", "0", true, function(arg)
			enabled["Delay To Collect"] = tonumber(arg)
		end)

		v_8:AddSeperator({ " - [ Collect Whitelist Fruit ] - " })

		funcs:Dropdown(v_8, "Select Whitelist Fruit", "", true, managers2:GetSeedList(), { "" }, true, function(arg)
			enabled["Select Whitelist Fruit"] = arg
		end)

		funcs:Toggle(v_8, "Auto Collect Whitelisted Fruits", "", false, true, function(arg)
			enabled["Auto Collect Whitelisted Fruits"] = arg
		end)

		v_8:AddSeperator({ " - [ Collect Whitelist Mutation ] - " })

		funcs:Dropdown(v_8, "Select Whitelist Mutations", "", true, managers2:GetMutationList(), { "" }, true, function(arg)
			enabled["Select Whitelist Mutations"] = arg
		end)

		funcs:Toggle(v_8, "Auto Collect Whitelisted Mutations", "", false, true, function(arg)
			enabled["Auto Collect Whitelisted Mutations"] = arg
		end)

		v_8:AddSeperator({ " - [ Collect Whitelist ] - " })

		funcs:Dropdown(v_8, "Select Whitelist Fruits", "", true, managers2:GetSeedList(), { "" }, true, function(arg)
			enabled["Select Whitelist Fruits"] = arg
		end)

		funcs:Dropdown(v_8, "Select Whitelist Mutation", "", true, managers2:GetMutationList(), { "" }, true, function(arg)
			enabled["Select Whitelist Mutation"] = arg
		end)

		funcs:Dropdown(v_8, "Select Whitelist Variant", "", true, modules.Variant, { "" }, true, function(arg)
			enabled["Select Whitelist Variant"] = arg
		end)

		funcs:Dropdown(v_8, "Whitelist Weight Mode", "", false, { "Above", "Below" }, { "" }, true, function(arg)
			enabled["Whitelist Weight Mode"] = arg
		end)

		funcs:Textbox(v_8, "Whitelist Weight", "If you don't use this, Just Input `0`", "0", true, function(arg)
			enabled["Whitelist Weight"] = tonumber(arg)
		end)

		funcs:Toggle(v_8, "Auto Collect Fruits ", "", false, true, function(arg)
			enabled["Auto Collect Fruits (Whitelist)"] = arg
		end)

		v_8:AddSeperator({ " - [ Collect Blacklist ] - " })

		funcs:Dropdown(v_8, "Select Blacklist Fruits", "", true, managers2:GetSeedList(), { "" }, true, function(arg)
			enabled["Select Blacklist Fruits"] = arg
		end)

		funcs:Dropdown(v_8, "Select Blacklist Mutation", "", true, managers2:GetMutationList(), { "" }, true, function(arg)
			enabled["Select Blacklist Mutation"] = arg
		end)

		funcs:Dropdown(v_8, "Select Blacklist Variant", "", true, modules.Variant, { "" }, true, function(arg)
			enabled["Select Blacklist Variant"] = arg
		end)

		funcs:Dropdown(v_8, "Blacklist Weight Mode", "", false, { "Above", "Below" }, { "" }, true, function(arg)
			enabled["Blacklist Weight Mode"] = arg
		end)

		funcs:Textbox(v_8, "Blacklist Weight", "If you don't use this, Just Input `0`", "0", true, function(arg)
			enabled["Blacklist Weight"] = tonumber(arg)
		end)

		funcs:Toggle(v_8, "Auto Collect Fruits", "", false, true, function(arg)
			enabled["Auto Collect Fruits (Blacklist)"] = arg
		end)

		v_8:AddSeperator({ " - [ Other ] - " })

		funcs:Toggle(v_8, "Auto Collect All Fruits", "", false, true, function(arg)
			enabled["Auto Collect All Fruits"] = arg
		end)

		local v_9 = tbl4.Main:AddSection("Automation Sprinkler")

		funcs:Dropdown(v_9, "Select Sprinkler", "", true, managers2:GetSprinklerList(), { "" }, true, function(arg)
			enabled["Select Sprinkler"] = arg
		end)

		funcs:Dropdown(v_9, "Select Plants ", "", true, managers2:GetSeedList(), { "" }, true, function(arg)
			enabled["Select Plants Sprinkler"] = arg
		end)

		funcs:Dropdown(v_9, "Select Position ", "", false, { "Selected Plant", "Random", "Player Position" }, { "" }, true, function(arg)
			enabled["Select Position1"] = arg
		end)

		funcs:Textbox(v_9, "Delay To Sprinkler", "", "0", true, function(arg)
			enabled["Delay To Sprinkler"] = arg
		end)

		funcs:Toggle(v_9, "Auto Sprinkler", "", false, true, function(arg)
			enabled["Auto Sprinkler"] = arg
		end)

		local v_10 = tbl4.Main:AddSection("Automation Eggs / Crate")

		funcs:Dropdown(v_10, "Select Eggs", "", true, managers2:GetEggList(), { "" }, true, function(arg)
			enabled["Select Eggs"] = arg
		end)

		funcs:Dropdown(v_10, "Select Position  ", "", false, { "Good Position", "Random", "Player Position" }, { "" }, true, function(arg)
			enabled["Select Position  "] = arg
		end)

		funcs:Textbox(v_10, "Delay To Place Eggs", "", "0", true, function(arg)
			enabled["Delay To Place Eggs"] = tonumber(arg)
		end)

		funcs:Textbox(v_10, "Place Egg Max", "", "3", true, function(arg)
			enabled["Place Egg Max"] = tonumber(arg)
		end)

		funcs:Toggle(v_10, "Allow Placing If No Egg in Garden", "This means if your garden doesn’t have any eggs, it will place egg. If there is already an egg, it will stop.", false, true, function(arg)
			enabled["Allow Placing If No Egg in Garden"] = arg
		end)

		funcs:Toggle(v_10, "Auto Place Eggs", "", false, true, function(arg)
			enabled["Auto Place Eggs"] = arg
		end)

		v_10:AddSeperator({ " - [ Hatch Eggs ] - " })

		funcs:Dropdown(v_10, "Select Eggs ", "", true, managers2:GetEggList(true), { "" }, true, function(arg)
			enabled["Select Eggs "] = arg
		end)

		funcs:Textbox(v_10, "Delay To Hatch", "", "0", true, function(arg)
			enabled["Delay To Hatch"] = tonumber(arg)
		end)

		funcs:Toggle(v_10, "All Eggs Ready Only", "Auto Hatch Egg will only work when all of your eggs are ready. If even one egg isn’t ready, Auto Hatch Egg won’t work", false, true, function(arg)
			enabled["All Eggs Ready Only"] = arg
		end)

		if not (str:find("Solara") or str:find("Xeno")) then
			funcs:Dropdown(v_10, "Select Filter Mode", "", false, { "Whitelist", "Blacklist" }, { "" }, true, function(arg)
				enabled["Select Filter Mode"] = arg
			end)

			local function fn14()
				local tbl5 = { "None" }

				for _, v_11 in managers2:GetPetsLists() do
					table.insert(tbl5, v_11)
				end

				return tbl5
			end

			funcs:Dropdown(v_10, "Choose Pets ", "", true, fn14(), { "" }, true, function(arg)
				enabled["Choose Pets "] = arg
			end)

			funcs:Dropdown(v_10, "Select Threshold Mode       ", "", false, { "Above", "Below" }, { "" }, true, function(arg)
				enabled["Select Threshold Mode       "] = arg
			end)

			funcs:Textbox(v_10, "Weights Pet Threshold ", "if you don't want use this, just input '0' ", "0", true, function(arg)
				enabled["Weights Pet Threshold "] = arg
			end)
		end

		funcs:Toggle(v_10, "Auto Hatch Eggs", "", false, true, function(arg)
			enabled["Auto Hatch Eggs"] = arg
		end)

		v_10:AddSeperator({ " - [ Crate ] - " })

		funcs:Dropdown(v_10, "Select Crate", "", true, managers2:GetCrateList(), { "" }, true, function(arg)
			enabled["Select Crate"] = arg
		end)

		funcs:Textbox(v_10, "Delay To Place Crate", "", "0", true, function(arg)
			enabled["Delay To Place Crate"] = arg
		end)

		funcs:Toggle(v_10, "Auto Place Crate", "", false, true, function(arg)
			enabled["Auto Place Crate"] = arg
		end)

		local v_11 = tbl4.Main:AddSection("Automation Sell")
		v_11:AddSeperator({ " - [ Config ] - " })

		funcs:Textbox(v_11, "Delay To Sell Inventory", "", "0", true, function(arg)
			enabled["Delay To Sell Inventory"] = arg
		end)

		funcs:Toggle(v_11, "Allow Sell If Backpack Is Max", "", false, true, function(arg)
			enabled["Allow Sell If Backpack Is Max"] = arg
		end)

		v_11:AddSeperator({ " - [ Seller ] - " })

		funcs:Dropdown(v_11, "Prevent Sell Fruits", "", true, managers2:GetSeedList(), { "" }, true, function(arg)
			enabled["Prevent Sell Fruits"] = arg
		end)

		funcs:Dropdown(v_11, "Prevent Sell Mutation", "", true, managers2:GetMutationList(), { "" }, true, function(arg)
			enabled["Prevent Sell Mutation"] = arg
		end)

		funcs:Dropdown(v_11, "Prevent Sell Variant", "", true, modules.Variant, { "" }, true, function(arg)
			enabled["Prevent Sell Variant"] = arg
		end)

		funcs:Toggle(v_11, "Enable Prevent Mode", "", false, true, function(arg)
			enabled["Enable Prevent Mode"] = arg
		end)

		funcs:Toggle(v_11, "Auto Sell", "", false, true, function(arg)
			enabled["Auto Sell"] = arg
		end)

		funcs:Button(v_11, "Sell", "", function()
			sellFunction.CallSell()
		end)

		v_11:AddSeperator({ " - [ Sell Pets ] - " })

		funcs:Dropdown(v_11, "Sell Pets", "", true, managers2:GetPetsLists(), { "" }, true, function(arg)
			enabled["Sell Pets"] = arg
		end)

		funcs:Dropdown(v_11, "Anti-Sell Pets", "", true, managers2:GetPetsLists(), { "" }, true, function(arg)
			enabled["Anti-Sell Pets"] = arg
		end)

		funcs:Dropdown(v_11, "Select Threshold Mode  ", "", false, { "Above", "Below", "Don't Sell Above", "Don't Sell Below" }, { "" }, true, function(arg)
			enabled["Select Threshold Mode  "] = arg
		end)

		funcs:Textbox(v_11, "Weights Threshold  ", "if you don't want use this, just input '0' ", "0", true, function(arg)
			enabled["Weights Threshold  "] = arg
		end)

		funcs:Textbox(v_11, "Age Threshold  ", "if you don't want use this, just input '0' ", "0", true, function(arg)
			enabled["Age Threshold  "] = arg
		end)

		funcs:Textbox(v_11, "Delay to Sell Pets", "", "0", true, function(arg)
			enabled["Delay to Sell Pets"] = arg
		end)

		funcs:Dropdown(v_11, "Select Sell Version", "", false, { "V1", "V2" }, { "" }, true, function(arg)
			enabled["Select Sell Version"] = arg
		end)

		funcs:Toggle(v_11, "Auto Sell Pets", "", false, true, function(arg)
			enabled["Auto Sell Pets"] = arg
		end)

		funcs:Button(v_11, "Sell Held Pets", "", function()
			local tool = localPlayer.Character:FindFirstChildWhichIsA("Tool")

			if tool and tool:GetAttribute("b") == "l" and not tool:GetAttribute("d") then
				gameEvents.SellPet_RE:FireServer(tool)
			end
		end)

		funcs:Button(v_11, "Sell All Pets", "", function()
			local character = localPlayer.Character
			if not character then
				return
			end

			if managers2:IsSwitchingActive() then
				return
			end
			local selectSellVersion = enabled["Select Sell Version"] or "V1"
			local v_12 = toolFunction.GetAllTool()
			local tbl5 = {}

			for _, v_13 in ipairs(v_12) do
				if v_13:IsA("Tool") and v_13:GetAttribute("PetType") == "Pet" and not v_13:GetAttribute("d") then
					table.insert(tbl5, v_13)
				end
			end

			if #tbl5 == 0 then
				shx:SetNotification({ "Speed Hub X", "", "No pets to sell!", 5, 0.5 })
				return
			end
			shx:SetNotification({ "Speed Hub X", "", "Selling " .. #tbl5 .. " pets...", 5, 0.5 })
			local n = 0

			for _, v_13 in ipairs(tbl5) do
				task.wait(tonumber(enabled["Delay to Sell Pets"]) or 0.1)

				if selectSellVersion == "V2" then
					gameEvents.SellPetShopSelected:FireServer(v_13)
					n += 1
				else
					while true do
						task.wait()
						character.Humanoid:EquipTool(v_13)
						if not (character:FindFirstChild(v_13.Name) or not v_13.Parent) then
							continue
						end
						break
					end

					local v_14 = character:FindFirstChild(v_13.Name)

					if v_14 and v_14:GetAttribute("PetType") == "Pet" and not v_14:GetAttribute("d") then
						gameEvents.SellPet_RE:FireServer(v_14)
						n += 1
					end
				end
			end

			shx:SetNotification({ "Speed Hub X", "", "Sold " .. n .. " pets!", 5, 0.5 })
		end, "This will sell all the pets in your backpack. Are you sure you want to do this?")

		local v_12 = tbl4.Main:AddSection("Automation Pets")
		v_12:AddSeperator({ " - [ Equip Pets ] - " })

		funcs:Toggle(v_12, "Auto Equip All Pets", "", false, true, function(arg)
			enabled["Auto Equip All Pets"] = arg
		end)

		v_12:AddSeperator({ " - [ Lead Pets ] - " })

		local v_13 = funcs:Dropdown(v_12, "Select Pets        ", "", true, managers2:GetPetsList() or { "" }, { "" }, true, function(arg)
			enabled["Select Pets        "] = arg
		end)

		funcs:Button(v_12, "Refresh Select Pets", "", function()
			v_13:Clear()
			v_13:Refresh(managers2:GetPetsList(), { "" })
		end)

		funcs:Toggle(v_12, "Auto Lead Pets", "", false, true, function(arg)
			enabled["Auto Lead Pets"] = arg
		end)

		v_12:AddSeperator({ " - [ Cleansing Pet Shard ] - " })

		local v_14 = funcs:Dropdown(v_12, "Select Pets         ", "", true, managers2:GetPetsList() or { "" }, { "" }, true, function(arg)
			enabled["Select Pets         "] = arg
		end)

		funcs:Button(v_12, "Refresh Select Pets", "", function()
			v_14:Clear()
			v_14:Refresh(managers2:GetPetsList(), { "" })
		end)

		funcs:Dropdown(v_12, "Select Pet Mutations", "", true, modules.API.Data.PetMutations, { "" }, true, function(arg)
			enabled["Select Pet Mutations"] = arg
		end)

		funcs:Toggle(v_12, "Auto Cleansing Pet Shard", "", false, true, function(arg)
			enabled["Auto Cleansing Pet Shard"] = arg
		end)

		v_12:AddSeperator({ " - [ Feed Pets ] - " })

		local v_15 = funcs:Dropdown(v_12, "Select Pets", "", true, managers2:GetPetsList() or { "" }, { "" }, true, function(arg)
			enabled["Select Pets"] = arg
		end)

		funcs:Button(v_12, "Refresh Select Pets", "", function()
			v_15:Clear()
			v_15:Refresh(managers2:GetPetsList(), { "" })
		end)

		funcs:Dropdown(v_12, "Select Feed Type", "", false, { "Food", "Fruit" }, { "" }, true, function(arg)
			enabled["Select Feed Type"] = arg
		end)

		funcs:Dropdown(v_12, "Select Fruits", "", true, managers2:GetSeedList(), { "" }, true, function(arg)
			enabled["Select Fruits"] = arg
		end)

		funcs:Dropdown(v_12, "Select Food", "", true, {
			"None",
			"Corndog",
			"CandyApple",
			"Soup",
			"Waffle",
			"Donut",
			"Pie",
			"Smoothie",
			"Sushi",
			"Pizza",
			"Sandwich",
			"Spaghetti",
			"HotDog",
			"SweetTea",
			"Salad",
			"Cake",
			"Burger",
			"Porridge",
			"IceCream",
		}, { "" }, true, function(arg)
			enabled["Select Food"] = arg
		end)

		funcs:Dropdown(v_12, "Prevent Feed Mutation Fruit", "", true, managers2:GetMutationList(), { "" }, true, function(arg)
			enabled["Prevent Feed Mutation Fruit"] = arg
		end)

		funcs:Textbox(v_12, "Threshold Hunger % ", "", "50", true, function(arg)
			enabled["Threshold Hunger % "] = tonumber(arg)
		end)

		funcs:Toggle(v_12, "Auto Feed Pets", "", false, true, function(arg)
			enabled["Auto Feed Pets"] = arg
		end)

		v_12:AddSeperator({ " - [ Automation Pick Place ] - " })

		funcs:Dropdown(v_12, "Select Pets            ", "", true, managers2:GetPetsLists() or { "" }, { "" }, true, function(arg)
			enabled["Select Pets            "] = arg
		end)

		funcs:Textbox(v_12, "Pet Timer", "", "15", true, function(arg)
			enabled["Pet Timer"] = tonumber(arg)
		end)

		funcs:Textbox(v_12, "Delay To Pick", "", "0.5", true, function(arg)
			enabled["Delay To Pick"] = tonumber(arg)
		end)

		funcs:Textbox(v_12, "Delay To Place", "", "0.5", true, function(arg)
			enabled["Delay To Place"] = tonumber(arg)
		end)

		funcs:Toggle(v_12, "Reduce Pets VFX", "", false, true, function(arg)
			enabled["Reduce Pets VFX"] = arg
		end)

		funcs:Toggle(v_12, "Auto Pick Place", "", false, true, function(arg)
			enabled["Auto Pick Place"] = arg
		end)

		local v_16 = tbl4.Main:AddSection("Automation Shovel")

		funcs:Dropdown(v_16, "Select Tree  ", "", true, managers2:GetSeedList(), { "" }, true, function(arg)
			enabled["Select Tree Shovel"] = arg
		end)

		funcs:Textbox(v_16, "Delay To Shovel Tree", "", "0", true, function(arg)
			enabled["Delay To Shovel Tree"] = tonumber(arg)
		end)

		funcs:Toggle(v_16, "Auto Shovel Tree", "", false, true, function(arg)
			enabled["Auto Shovel Tree"] = arg
		end)

		v_16:AddSeperator({ " - [ Fruits Shovel ] - " })

		funcs:Dropdown(v_16, "Select Fruits      ", "", true, managers2:GetSeedList(), { "" }, true, function(arg)
			enabled["Select Fruits Shovel"] = arg
		end)

		funcs:Dropdown(v_16, "Select Mutation         ", "", true, managers2:GetMutationList(), { "" }, true, function(arg)
			enabled["Select Mutation Shovel"] = arg
		end)

		funcs:Dropdown(v_16, "Select Variant         ", "", true, modules.Variant, { "" }, true, function(arg)
			enabled["Select Variant Shovel"] = arg
		end)

		funcs:Dropdown(v_16, "Select Threshold Mode", "", false, { "Above", "Below" }, { "" }, true, function(arg)
			enabled["Select Threshold Mode"] = arg
		end)

		funcs:Textbox(v_16, "Weight Threshold", "if you don't want use this, just input '0'", "0", true, function(arg)
			enabled["Weight Threshold"] = tonumber(arg)
		end)

		funcs:Textbox(v_16, "Delay To Shovel Fruit", "", "0", true, function(arg)
			enabled["Delay To Shovel Fruit"] = tonumber(arg)
		end)

		funcs:Toggle(v_16, "Auto Shovel Fruits", "", false, true, function(arg)
			enabled["Auto Shovel Fruits"] = arg
		end)

		v_16:AddSeperator({ " - [ Sprinkler Shovel ] - " })

		funcs:Dropdown(v_16, "Select Sprinkler  ", "", true, managers2:GetSprinklerList(), { "" }, true, function(arg)
			enabled["Select Sprinkler  "] = arg
		end)

		funcs:Textbox(v_16, "Delay To Shovel Sprinkler", "", "0", true, function(arg)
			enabled["Delay To Shovel Sprinkler"] = tonumber(arg)
		end)

		funcs:Toggle(v_16, "Auto Shovel Sprinkler", "", false, true, function(arg)
			enabled["Auto Shovel Sprinkler"] = arg
		end)

		local v_17 = tbl4.Main:AddSection("Automation Favorite Plants")

		funcs:Dropdown(v_17, "Select Tree   ", "", true, managers2:GetSeedList(), { "" }, true, function(arg)
			enabled["Select Tree Favorite"] = arg
		end)

		funcs:Toggle(v_17, "Auto Favorite Tree", "", false, true, function(arg)
			enabled["Auto Favorite Tree"] = arg
		end)

		funcs:Toggle(v_17, "Auto UnFavorite Tree", "", false, true, function(arg)
			enabled["Auto UnFavorite Tree"] = arg
		end)

		v_17:AddSeperator({ " - [ Favorite Fruits ] - " })

		funcs:Dropdown(v_17, "Select Fruits       ", "", true, managers2:GetSeedList(), { "" }, true, function(arg)
			enabled["Select Fruits Favorite"] = arg
		end)

		funcs:Dropdown(v_17, "Select Mutation          ", "", true, managers2:GetMutationList(), { "" }, true, function(arg)
			enabled["Select Mutation Favorite"] = arg
		end)

		funcs:Dropdown(v_17, "Select Variant          ", "", true, modules.Variant, { "" }, true, function(arg)
			enabled["Select Variant Favorite"] = arg
		end)

		funcs:Dropdown(v_17, "Select Threshold Mode ", "", false, { "Above", "Below" }, { "" }, true, function(arg)
			enabled["Select Threshold Mode "] = arg
		end)

		funcs:Textbox(v_17, "Weight Threshold ", "if you don't want use this, just input '0'", "0", true, function(arg)
			enabled["Weight Threshold "] = tonumber(arg)
		end)

		funcs:Toggle(v_17, "Auto Favorite Fruits", "", false, true, function(arg)
			enabled["Auto Favorite Fruits"] = arg
		end)

		funcs:Toggle(v_17, "Auto UnFavorite Fruits", "", false, true, function(arg)
			enabled["Auto UnFavorite Fruits"] = arg
		end)

		v_17:AddSeperator({ " - [ Other ] - " })

		funcs:Toggle(v_17, "Auto UnFavorite All Tree", "", false, true, function(arg)
			enabled["Auto UnFavorite All Tree"] = arg
		end)

		funcs:Toggle(v_17, "Auto UnFavorite All Fruits", "", false, true, function(arg)
			enabled["Auto UnFavorite All Fruits"] = arg
		end)

		local v_18 = tbl4.Main:AddSection("Automation Water")

		funcs:Dropdown(v_18, "Select Fruits  ", "", true, managers2:GetSeedList(), { "" }, true, function(arg)
			enabled["Select Water Fruits"] = arg
		end)

		funcs:Textbox(v_18, "Delay to Water ", "", "1", true, function(arg)
			enabled["Delay to Water "] = tonumber(arg)
		end)

		funcs:Toggle(v_18, "Auto Equip Watering Can", "", false, true, function(arg)
			enabled["Auto Equip Watering Can"] = arg
		end)

		funcs:Toggle(v_18, "Auto Water Fruits", "", false, true, function(arg)
			enabled["Auto Water Fruits"] = arg
		end)

		local v_19 = tbl4.Automatically:AddSection("Automation Fall Event")
		v_19:AddSeperator({ " - [ Fall Bloom ] - " })

		funcs:Toggle(v_19, "Auto Collect Required Fruit", "", false, true, function(arg)
			enabled["Auto Collect Required Fruit"] = arg
		end)

		funcs:Toggle(v_19, "Auto Submit Fall Bloom", "", false, true, function(arg)
			enabled["Auto Submit Fall Bloom"] = arg
		end)

		v_19:AddSeperator({ " - [ Fall Shop ] - " })

		local tbl5 = {
			["Fall Market Gear Shop"] = {
				"Firefly Jar",
				"Sky Lantern",
				"Maple Leaf Kite",
				"Leaf Blower",
				"Maple Syrup",
				"Maple Sprinkler",
				"Bonfire",
				"Harvest Basket",
				"Maple Leaf Charm",
				"Golden Acorn",
			},
			["Fall Market Cosmetic Shop"] = {
				"Fall Crate",
				"Fall Leaf Chair",
				"Maple Flag",
				"Fall Hay Bale",
				"Flying Kite",
				"Autumn Crate",
				"Fall Fountain",
			},
			["Fall Market Seed Shop"] = {
				"Turnip",
				"Parsley",
				"Autumn Seed Pack",
				"Meyer Lemon",
				"Carnival Pumpkin",
				"Kniphofia",
				"Golden Peach",
				"Maple Resin",
			},
			["Fall Market Pet Shop"] = { "Fall Egg", "Chipmunk", "Red Squirrel", "Marmot", "Sugar Glider", "Space Squirrel" },
		}

		funcs:Dropdown(v_19, "Select Fall Market Seed Shop", "", true, tbl5["Fall Market Seed Shop"], { "" }, true, function(arg)
			enabled["Select Fall Market Seed Shop"] = arg
		end)

		funcs:Dropdown(v_19, "Select Fall Market Gear Shop", "", true, tbl5["Fall Market Gear Shop"], { "" }, true, function(arg)
			enabled["Select Fall Market Gear Shop"] = arg
		end)

		funcs:Dropdown(v_19, "Select Fall Market Cosmetic Shop", "", true, tbl5["Fall Market Cosmetic Shop"], { "" }, true, function(arg)
			enabled["Select Fall Market Cosmetic Shop"] = arg
		end)

		funcs:Dropdown(v_19, "Select Fall Market Pet Shop", "", true, tbl5["Fall Market Pet Shop"], { "" }, true, function(arg)
			enabled["Select Fall Market Pet Shop"] = arg
		end)

		funcs:Toggle(v_19, "Auto Buy Fall Shop", "", false, true, function(arg)
			enabled["Auto Buy Fall Shop"] = arg
		end)

		local v_20 = tbl4.Automatically:AddSection("Automation Bee Event")
		v_20:AddSeperator({ " - [ Honey Compressor ] - " })

		funcs:Toggle(v_20, "Auto Honey Compressor", "", false, true, function(arg)
			enabled["Auto Honey Compressor"] = arg
		end)

		v_20:AddSeperator({ " - [ Bee Egg Inventory ] - " })

		funcs:Toggle(v_20, "ESP Bee Egg", "", false, true, function(arg)
			enabled["ESP Bee Egg"] = arg

			utils.Fallback(arg, "ESP Bee Egg", function()
				for _, v_21 in workspace:GetChildren() do
					if v_21:IsA("BasePart") then
						if v_21.Name:find("Bee Egg") then
							local userId = localPlayer.UserId

							if v_21:GetAttribute("OwnerUserId") == userId then
								if v_21:GetAttribute("BeeName") then
									esp.Removes(v_21)
								end
							end
						end
					end
				end
			end)
		end)

		v_20:AddSeperator({ " - [ Bee Wasp ] - " })
		local v_21 = v_20:AddParagraph({ Title = "Dungeon Wasp Status: ", Content = "N/A" })

		task.spawn(function()
			local function fn14(arg)
				v_21:Set({ Title = "Dungeon Wasp Status: ", Content = arg })
			end

			while task.wait(2) do
				pcall(function()
					local response = gameEvents.WaspWaveSurvival.GetState:InvokeServer()
					if not response or type(response) ~= "table" then
						fn14("N/A")
						return
					end

					if not response.Active then
						fn14("N/A")
						return
					end
					local wave = response.Wave or "N/A"
					local maxWaves = response.MaxWaves or "100"
					local totalKilled = response.TotalKilled or "N/A"
					fn14("> Wave: " .. tostring(wave) .. " / " .. tostring(maxWaves) .. "\n> Total Killed: " .. tostring(totalKilled))
				end)
			end
		end)

		funcs:Toggle(v_20, "Instant Kill Wasp", "", false, true, function(arg)
			enabled["Instant Kill Wasp"] = arg
		end)

		funcs:Toggle(v_20, "God Mode in Dungeon Wasp", "This helps you reach 100 waves. If your bee gets killed, you won’t be defeated, allowing you to reach higher waves using Instant Kill and AFK grinding.", false, true, function(arg)
			enabled["God Mode in Dungeon Wasp"] = arg

			if not arg then
				table.clear(stored.Killed)
			end
		end)

		funcs:Toggle(v_20, "Auto Enter Dungeon Wasp", "", false, true, function(arg)
			enabled["Auto Enter Dungeon Wasp"] = arg
		end)

		funcs:Toggle(v_20, "Auto Exit/Claim Dungeon at 100 Wave", "Use this to exit if you're stuck at Wave 100.", false, true, function(arg)
			enabled["Auto Exit/Claim Dungeon at 100 Wave"] = arg
		end)

		funcs:Toggle(v_20, "Auto Collect Chest", "", false, true, function(arg)
			enabled["Auto Collect Chest"] = arg
		end)

		funcs:Toggle(v_20, "Hop servers if no wasp is found", "", false, true, function(arg)
			enabled["Hop servers if no wasp is found"] = arg
		end)

		v_20:AddSeperator({ " - [ Upgrade Tree ] - " })

		funcs:Toggle(v_20, "Auto Upgrade Tree", "", false, true, function(arg)
			enabled["Auto Upgrade Tree"] = arg
		end)

		v_20:AddSeperator({ " - [ Bee Egg Shop ] - " })

		funcs:Dropdown(v_20, "Select Bee Egg Shop", "", true, { "None", "Common Bee Egg", "Rare Bee Egg", "Mythical Bee Egg", "Transcendent Bee Egg" }, { "" }, true, function(arg)
			enabled["Select Bee Egg Shop"] = arg
		end)

		funcs:Toggle(v_20, "Auto Buy Bee Egg Shop", "", false, true, function(arg)
			enabled["Auto Buy Bee Egg Shop"] = arg
		end)

		v_20:AddSeperator({ " - [ Honey Seed Shop ] - " })

		funcs:Dropdown(v_20, "Select Honey Seed Shop", "", true, {
			"None",
			"Honey Carrot",
			"Honey Strawberry",
			"Honey Blueberry",
			"Honey Buttercup",
			"Honey Tomato",
			"Honey Corn",
			"Honey Daffodil",
			"Honey Watermelon",
			"Honey Pumpkin",
			"Honey Apple",
			"Honey Bamboo",
			"Honey Coconut",
			"Honey Cactus",
			"Honey Dragon Fruit",
			"Honey Mango",
			"Honey Grape",
			"Honey Mushroom",
			"Honey Pepper",
			"Honey Cacao",
			"Honey Sunflower",
			"Honey Beanstalk",
			"Honey Ember Lily",
			"Honey Sugar Apple",
			"Honey Burning Bud",
			"Honey Giant Pinecone",
			"Honey Elder Strawberry",
			"Honey Romanesco",
			"Honey Crimson Thorn",
			"Honey Zebrazinkle",
			"Honey Octobloom",
			"Honey Alien Apple",
			"Honey Pollenvine",
		}, { "" }, true, function(arg)
			enabled["Select Honey Seed Shop"] = arg
		end)

		funcs:Toggle(v_20, "Auto Buy Honey Seed Shop", "", false, true, function(arg)
			enabled["Auto Buy Honey Seed Shop"] = arg
		end)

		v_20:AddSeperator({ " - [ Honey Coin Shop ] - " })

		funcs:Dropdown(v_20, "Select Honey Coin Shop", "", true, {
			"None",
			"Honey Honey Daisy",
			"Honey Honey Dew",
			"Honey Hive Seed Pack",
			"Honey Ambercomb",
			"Pollen Radar 2026",
			"Honey Coneflower",
			"Hive Egg",
			"Hive Crate",
			"Professor Bee",
			"Honey Birds of Paradise",
			"Honey Badger",
			"Honey Honey Hollow",
		}, { "" }, true, function(arg)
			enabled["Select Honey Coin Shop"] = arg
		end)

		funcs:Toggle(v_20, "Auto Buy Honey Coin Shop", "", false, true, function(arg)
			enabled["Auto Buy Honey Coin Shop"] = arg
		end)

		v_20:AddSeperator({ " - [ Royal Jelly Shop ] - " })

		funcs:Dropdown(v_20, "Select Royal Jelly Shop", "", true, {
			"None",
			"Pollen Puffball",
			"Grape Droplet",
			"Carpenter Bee",
			"Pet Shard RoyalJelly",
			"Royal Jelly Fountain",
			"King Bee",
			"Pohutukawa",
		}, { "" }, true, function(arg)
			enabled["Select Royal Jelly Shop"] = arg
		end)

		funcs:Toggle(v_20, "Auto Buy Royal Jelly Shop", "", false, true, function(arg)
			enabled["Auto Buy Royal Jelly Shop"] = arg
		end)

		local v_22 = tbl4.Automatically:AddSection("Automation Cooking Pot")
		v_22:AddSeperator({ " - [ Cooking Pot ] - " })

		funcs:Dropdown(v_22, "Ingredient 1", "", false, managers2:GetSeedList(), { "" }, true, function(arg)
			enabled["Ingredient 1"] = arg
		end)

		funcs:Dropdown(v_22, "Ingredient 2", "", false, managers2:GetSeedList(), { "" }, true, function(arg)
			enabled["Ingredient 2"] = arg
		end)

		funcs:Dropdown(v_22, "Ingredient 3", "", false, managers2:GetSeedList(), { "" }, true, function(arg)
			enabled["Ingredient 3"] = arg
		end)

		funcs:Dropdown(v_22, "Ingredient 4", "", false, managers2:GetSeedList(), { "" }, true, function(arg)
			enabled["Ingredient 4"] = arg
		end)

		funcs:Dropdown(v_22, "Ingredient 5", "", false, managers2:GetSeedList(), { "" }, true, function(arg)
			enabled["Ingredient 5"] = arg
		end)

		funcs:Toggle(v_22, "Only Mutation Fruits", "This means that if you enable it, Auto Cook Pot will only use mutated fruits.", false, true, function(arg)
			enabled["Only Mutation Fruits"] = arg
		end)

		funcs:Toggle(v_22, "Auto Cook Pot", "", false, true, function(arg)
			enabled["Auto Cook Pot"] = arg

			if not arg then
				table.clear(cached.ClearEmptyList)
			end
		end)

		funcs:Toggle(v_22, "Auto Claim Cooked Pot", "", false, true, function(arg)
			enabled["Auto Claim Cooked Pot"] = arg
		end)

		local v_23 = tbl4.Automatically:AddSection("Automation Pet Mutations")

		funcs:Dropdown(v_23, "Select Pets     ", "", true, managers2:GetPetsLists(), { "" }, true, function(arg)
			enabled["Select Pets Mutations"] = arg
		end)

		funcs:Dropdown(v_23, "Prevent Mutations Pets", "", true, modules.API.Data.PetMutations, { "" }, true, function(arg)
			enabled["Prevent Mutations Pets"] = arg
		end)

		funcs:Dropdown(v_23, "Select Slot (For EXP Farm)", "Put pets that will help level up the focus pet (example: Peacocks + Ferret + the pet you want to age)", false, { "None", "1", "2", "3" }, { "" }, true, function(arg)
			enabled["Select Slot (For EXP Farm)"] = arg
		end)

		funcs:Dropdown(v_23, "Select Slot (For Mutation Chamber Boost)", "Put Golem + Peacock. This slot is used to make the chamber time faster", false, { "None", "1", "2", "3" }, { "" }, true, function(arg)
			enabled["Select Slot (For Mutation Chamber Boost)"] = arg
		end)

		funcs:Dropdown(v_23, "Select Slot (For Phoenix Team)", "", false, { "None", "1", "2", "3" }, { "" }, true, function(arg)
			enabled["Select Slot (For Phoenix Team)"] = arg
		end)

		funcs:Textbox(v_23, "Threshold Level Pet", "Only submit pets that reach this level (example: 100 = only use level 100 pets)", "100", true, function(arg)
			enabled["Threshold Level Pet"] = arg
		end)

		funcs:Toggle(v_23, "Allows Switch Loadouts", "", false, true, function(arg)
			enabled["Allows Switch Loadouts"] = arg
		end)

		funcs:Toggle(v_23, "Auto Mutations Pets", "", false, true, function(arg)
			enabled["Auto Mutations Pets"] = arg

			if not arg then
				for k in pairs(cached.PetMutations) do
					cached.PetMutations[k] = nil
				end
			end
		end)

		local v_24 = tbl4.Automatically:AddSection("Automation Pet Boost")

		local v_25 = funcs:Dropdown(v_24, "Select Pets      ", "", true, managers2:GetPetsList(), { "" }, true, function(arg)
			enabled["Select Pets Boost"] = arg
		end)

		funcs:Button(v_24, "Refresh Select Pets", "", function()
			v_25:Clear()
			v_25:Refresh(managers2:GetPetsList(), { "" })
		end)

		funcs:Dropdown(v_24, "Select Boost Item", "", true, managers2:ListBoostItem(), { "" }, true, function(arg)
			enabled["Select Boost Item"] = arg
		end)

		funcs:Toggle(v_24, "Auto Boost Pets", "", false, true, function(arg)
			enabled["Auto Boost Pets"] = arg
		end)

		v_24:AddSeperator({ " - [ Maple Syrup ] - " })

		local v_26 = funcs:Dropdown(v_24, "Select Pets       ", "", true, managers2:GetPetsList(), { "" }, true, function(arg)
			enabled["Select Pets Maple"] = arg
		end)

		funcs:Button(v_24, "Refresh Select Pets", "", function()
			v_26:Clear()
			v_26:Refresh(managers2:GetPetsList(), { "" })
		end)

		funcs:Toggle(v_24, "Auto Maple Syrup Pets", "", false, true, function(arg)
			enabled["Auto Maple Syrup Pets"] = arg
		end)

		local v_27 = tbl4.Automatically:AddSection("Automation Ascension")

		funcs:Textbox(v_27, "Multiplier Ascension", "If you use the Vulnerability Multiplier method, you will get a lot of Garden Coins, but you will lose a lot of Sheckles. Use it at your own risk", "100", true, function(arg)
			enabled["Multiplier Ascension"] = tonumber(arg)
		end)

		funcs:Toggle(v_27, "Auto Ascension", "", false, true, function(arg)
			enabled["Auto Ascension"] = arg
		end)

		local v_28 = tbl4.Automatically:AddSection("Automation Finder")

		funcs:Toggle(v_28, "Auto Find Marmot Mound", "", false, true, function(arg)
			enabled["Auto Find Marmot Mound"] = arg
		end)

		funcs:Toggle(v_28, "Auto Find Acorn", "", false, true, function(arg)
			enabled["Auto Find Acorn"] = arg
		end)

		funcs:Toggle(v_28, "Auto Find Camel", "", false, true, function(arg)
			enabled["Auto Find Camel"] = arg
		end)

		local v_29 = tbl4.Automatically:AddSection("Automation Crafting")

		funcs:Dropdown(v_29, "Select Gear Recipes", "", false, managers2:GetCraftTable("GearEventWorkbench"), { "" }, true, function(arg)
			enabled["Select Gear Recipes"] = arg
		end)

		funcs:Dropdown(v_29, "Select Seed Recipes", "", false, managers2:GetCraftTable("SeedEventWorkbench"), { "" }, true, function(arg)
			enabled["Select Seed Recipes"] = arg
		end)

		funcs:Toggle(v_29, "Auto Craft", "", false, true, function(arg)
			enabled["Auto Craft"] = arg
		end)

		local v_30 = tbl4.Automatically:AddSection("Move Plants System")

		funcs:Dropdown(v_30, "Select Plants", "", true, managers2:GetSeedList(), { "" }, true, function(arg)
			enabled["Select Move Plants"] = arg
		end)

		funcs:Dropdown(v_30, "Select Position   ", "", false, { "Random", "Player Position" }, { "" }, true, function(arg)
			enabled["Select Position Move Plants"] = arg
		end)

		funcs:Toggle(v_30, "Enable Move Plants", "", false, true, function(arg)
			enabled["Enable Move Plants"] = arg
		end)

		v_30:AddSeperator({ " - [ Move Plant To Pets ] - " })

		local v_31 = funcs:Dropdown(v_30, "Select Pets   ", "", true, managers2:GetPetsList() or { "" }, { "" }, true, function(arg)
			enabled["Select Pets   "] = arg
		end)

		funcs:Button(v_30, "Refresh Select Pets", "", function()
			v_31:Clear()
			v_31:Refresh(managers2:GetPetsList(), { "" })
		end)

		funcs:Dropdown(v_30, "Select Plants  ", "", false, managers2:GetSeedList(), { "" }, true, function(arg)
			enabled["Select Move Plants  "] = arg
		end)

		funcs:Toggle(v_30, "Allow Move Plants to Pets If Passive is ready", "This means that if your pet's passive is ready, it will enable moving plants to the pet on Auto Move Plants To Pets", false, true, function(arg)
			enabled["Allow Move Plants to Pets If Passive is ready"] = arg
		end)

		funcs:Toggle(v_30, "Auto Move Plants To Pets", "", false, true, function(arg)
			enabled["Auto Move Plants To Pets"] = arg
		end)

		local v_32 = tbl4.Automatically:AddSection("Reclaimer Plants System")

		funcs:Dropdown(v_32, "Select Plants  ", "", true, managers2:GetSeedList(), { "" }, true, function(arg)
			enabled["Select Plants Reclaimer"] = arg
		end)

		funcs:Toggle(v_32, "Auto Reclaimer Plants", "", false, true, function(arg)
			enabled["Auto Reclaimer Plants"] = arg
		end)

		local v_33 = tbl4.Automatically:AddSection("Automation Spray")
		v_33:AddSeperator({ " - [ Cleaning Spray ] - " })

		funcs:Dropdown(v_33, "Select Fruits     ", "", true, managers2:GetSeedList(), { "" }, true, function(arg)
			enabled["Select Fruits Cleaning Spray"] = arg
		end)

		funcs:Dropdown(v_33, "Select Mutations     ", "", true, managers2:GetMutationList(), { "" }, true, function(arg)
			enabled["Select Mutations Cleaning Spray"] = arg
		end)

		funcs:Toggle(v_33, "Auto Cleaning Spray Fruits", "", false, true, function(arg)
			enabled["Auto Cleaning Spray Fruits"] = arg
		end)

		v_33:AddSeperator({ " - [ Spray Mutations ] - " })

		funcs:Dropdown(v_33, "Select Spray Mutations", "", true, {
			"Choc",
			"Pollinated",
			"Shocked",
			"Cloudtouched",
			"Burnt",
			"Chilled",
			"Amber",
			"Windstruck",
			"Verdant",
			"Disco",
			"Wet",
			"Tranquil",
			"Corrupt",
			"HoneyGlazed",
			"Fried",
			"Cooked",
			"Bloom",
			"Glimmering",
		}, { "" }, true, function(arg)
			enabled["Select Spray Mutations"] = arg
		end)

		funcs:Dropdown(v_33, "Select Fruits        ", "", true, managers2:GetSeedList(), { "" }, true, function(arg)
			enabled["Select Fruits Mutations Spray"] = arg
		end)

		funcs:Toggle(v_33, "Auto Spray Fruits", "", false, true, function(arg)
			enabled["Auto Spray Fruits"] = arg
		end)

		local v_34 = tbl4.Automatically:AddSection("Automation Seed pack")

		funcs:Dropdown(v_34, "Select Seed Pack", "", true, managers2:GetListSeedPack(), { "" }, true, function(arg)
			enabled["Select Seed Pack"] = arg
		end)

		funcs:Toggle(v_34, "Auto Open Seedpack", "", false, true, function(arg)
			enabled["Auto Open Seedpack"] = arg
		end)

		v_34:AddSeperator({ " - [ Skipper ] - " })

		funcs:Dropdown(v_34, "Select Rarity Seed ", "", true, { "Common", "Uncommon", "Rare", "Legendary", "Mythical", "Divine", "Prismatic" }, { "" }, true, function(arg)
			enabled["Select Rarity Seed "] = arg
		end)

		funcs:Toggle(v_34, "Auto Skipper At Rarity", "This will get you a good seed or something by skipping.", false, true, function(arg)
			enabled["Auto Skipper At Rarity"] = arg
		end)

		funcs:Toggle(tbl4.Automatically:AddSection("Automation Weather"), "Auto Activate Crystal", "", false, true, function(arg)
			enabled["Auto Activate Crystal"] = arg
		end)

		local v_35 = tbl4.Main:AddSection("Automation Crate")

		funcs:Dropdown(v_35, "Select Items  ", "Note: Xeno ,Solara, Luna, JJSploit is not supports", true, managers2:GetItemCrateList(), { "" }, true, function(arg)
			enabled["Select Items  "] = arg
		end)

		funcs:Textbox(v_35, "Delay To Hop", "Recommended: 10", "5", true, function(arg)
			enabled["Delay To Hop"] = tonumber(arg)
		end)

		funcs:Toggle(v_35, "Auto Hop Until Found Crate Has Items  ", "Note: Xeno ,Solara, Luna, JJSploit is not supports", false, true, function(arg)
			enabled["Auto Hop Until Found Crate Has Items  "] = arg
		end)

		funcs:Toggle(v_35, "Auto Open If Found Crate Has Items  ", "Note: Xeno ,Solara, Luna, JJSploit is not supports", false, true, function(arg)
			enabled["Auto Open If Found Crate Has Items  "] = arg
		end)

		local v_36 = tbl4.Inventory:AddSection("Favourite Fruits")

		funcs:Dropdown(v_36, "Select Fruits    ", "", true, managers2:GetSeedList(), { "" }, true, function(arg)
			enabled["Select Fruits Favourite"] = arg
		end)

		funcs:Dropdown(v_36, "Select Mutations    ", "", true, managers2:GetMutationList(), { "" }, true, function(arg)
			enabled["Select Mutations Favorite"] = arg
		end)

		funcs:Dropdown(v_36, "Select Variant    ", "", true, modules.Variant, { "" }, true, function(arg)
			enabled["Select Variant Favorite"] = arg
		end)

		funcs:Dropdown(v_36, "Threshold Weight Mode  ", "", false, { "Above", "Below" }, { "" }, true, function(arg)
			enabled["Threshold Weight Mode  "] = arg
		end)

		funcs:Textbox(v_36, "Threshold Weight   ", "If you don't use this, Just Input `0`", "0", true, function(arg)
			enabled["Threshold Weight   "] = tonumber(arg)
		end)

		funcs:Toggle(v_36, "Auto Favourite Fruits", "", false, true, function(arg)
			enabled["Auto Favourite Fruits"] = arg
		end)

		funcs:Toggle(v_36, "Auto UnFavourite Fruits", "", false, true, function(arg)
			enabled["Auto UnFavourite Fruits"] = arg
		end)

		funcs:Toggle(v_36, "Auto Favourite / UnFavourite Fruits", "", false, true, function(arg)
			enabled["Auto Favourite / UnFavourite Fruits"] = arg
		end)

		funcs:Toggle(v_36, "Auto UnFavourite All Fruits", "", false, true, function(arg)
			enabled["Auto UnFavourite All Fruits"] = arg
		end)

		local v_37 = tbl4.Inventory:AddSection("Favourite Pets")

		funcs:Dropdown(v_37, "Select Pets       ", "", true, managers2:GetPetsLists(), { "" }, true, function(arg)
			enabled["Select Pets Favourite"] = arg
		end)

		funcs:Dropdown(v_37, "Select Threshold Mode     ", "", false, { "Above", "Below" }, { "" }, true, function(arg)
			enabled["Select Threshold Mode     "] = arg
		end)

		funcs:Textbox(v_37, "Weights Threshold     ", "if you don't want use this, just input '0' ", "0", true, function(arg)
			enabled["Weights Threshold     "] = arg
		end)

		funcs:Textbox(v_37, "Age Threshold     ", "if you don't want use this, just input '0' ", "0", true, function(arg)
			enabled["Age Threshold     "] = arg
		end)

		funcs:Toggle(v_37, "Auto Favourite Pets", "", false, true, function(arg)
			enabled["Auto Favourite Pets"] = arg
		end)

		funcs:Toggle(v_37, "Auto UnFavourite Pets", "", false, true, function(arg)
			enabled["Auto UnFavourite Pets"] = arg
		end)

		funcs:Toggle(v_37, "Auto Favourite / UnFavourite Pets", "", false, true, function(arg)
			enabled["Auto Favourite / UnFavourite Pets"] = arg
		end)

		funcs:Toggle(v_37, "Auto UnFavourite All Pets", "", false, true, function(arg)
			enabled["Auto UnFavourite All Pets"] = arg
		end)

		local v_38 = tbl4.Inventory:AddSection("Automation Trade / Gift")

		local v_39 = funcs:Dropdown(v_38, "Select Players", "", false, managers2:GetPlayerList(), { "" }, true, function(arg)
			enabled["Select Players"] = arg
		end)

		funcs:Button(v_38, "Refresh Select Players", "", function()
			v_39:Clear()
			v_39:Refresh(managers2:GetPlayerList(), { "" })
		end)

		v_38:AddSeperator({ " - [ Fruits ] - " })

		funcs:Dropdown(v_38, "Select Fruits   ", "", true, managers2:GetSeedList(), { "" }, true, function(arg)
			enabled["Select Fruits Trade"] = arg
		end)

		funcs:Dropdown(v_38, "Select Mutation   ", "", true, managers2:GetMutationList(), { "" }, true, function(arg)
			enabled["Select Mutation Trade"] = arg
		end)

		funcs:Dropdown(v_38, "Select Variant   ", "", true, modules.Variant, { "" }, true, function(arg)
			enabled["Select Variant Trade"] = arg
		end)

		funcs:Textbox(v_38, "Delay To Gift", "", "0.1", true, function(arg)
			enabled["Delay To Gift"] = arg
		end)

		funcs:Toggle(v_38, "Auto Give Fruits To Player", "", false, true, function(arg)
			enabled["Auto Give Fruits To Player"] = arg
		end)

		funcs:Toggle(v_38, "Auto Give Favourited Fruits To Player", "", false, true, function(arg)
			enabled["Auto Give Favourited Fruits To Player"] = arg
		end)

		v_38:AddSeperator({ " - [ Pets ] - " })

		funcs:Dropdown(v_38, "Choose Pets", "", true, managers2:GetPetsLists(), { "" }, true, function(arg)
			enabled["Choose Pets"] = arg
		end)

		funcs:Dropdown(v_38, "Select Threshold Mode   ", "", false, { "Above", "Below" }, { "" }, true, function(arg)
			enabled["Select Threshold Mode   "] = arg
		end)

		funcs:Textbox(v_38, "Weights Threshold   ", "if you don't want use this, just input '0' ", "0", true, function(arg)
			enabled["Weights Threshold   "] = arg
		end)

		funcs:Textbox(v_38, "Age Threshold   ", "if you don't want use this, just input '0' ", "0", true, function(arg)
			enabled["Age Threshold   "] = arg
		end)

		funcs:Textbox(v_38, "Delay To Give", "", "0.1", true, function(arg)
			enabled["Delay To Give"] = arg
		end)

		funcs:Toggle(v_38, "Auto Give Pet To Players", "", false, true, function(arg)
			enabled["Auto Give Pet To Players"] = arg
		end)

		v_38:AddSeperator({ " - [ Other ] - " })

		funcs:Textbox(v_38, "Delay To Accept", "", "0.1", true, function(arg)
			enabled["Delay To Accept"] = arg
		end)

		funcs:Toggle(v_38, "Auto Accept Trade", "", false, true, function(arg)
			enabled["Auto Accept Trade"] = arg
		end)

		v_38:AddSeperator({ " - [ Trade System ] - " })

		funcs:Toggle(v_38, "Hide Trade Ui", "", false, true, function(arg)
			enabled["Hide Trade Ui"] = arg

			task.spawn(function()
				local tradingUI = playerGui:FindFirstChild("TradingUI")
				tradingUI = tradingUI and tradingUI:FindFirstChild("LiveTrade")

				if tradingUI then
					for _, v_40 in Lighting:QueryDescendants("BlurEffect") do
						v_40.Enabled = not arg
					end

					tradingUI.Visible = not arg
				end
			end)
		end)

		local v_40 = tbl4.Shop:AddSection("Shop Seeds")

		funcs:Dropdown(v_40, "Select Seed ", "", true, shop.GetShopList("Seed_Shop"), { "" }, true, function(arg)
			enabled["Select Seed "] = arg
		end)

		funcs:Toggle(v_40, "Auto Buy Seeds", "", false, true, function(arg)
			enabled["Auto Buy Seeds"] = arg
		end)

		funcs:Toggle(v_40, "Auto Buy All Seeds", "", false, true, function(arg)
			enabled["Auto Buy All Seeds"] = arg
		end)

		funcs:Toggle(v_40, "Auto Buy Best Seeds", "", false, true, function(arg)
			enabled["Auto Buy Best Seeds"] = arg
		end)

		v_40:AddSeperator({ " - [ Dailys Deals ] - " })

		funcs:Dropdown(v_40, "Select Dailys Deals", "", true, {
			"Feijoa",
			"Cocomango",
			"Avocado",
			"Mushroom",
			"Romanesco",
			"Bell Pepper",
			"Pitcher Plant",
			"Cacao",
			"Grape",
			"Broccoli",
			"Kiwi",
			"Giant Pinecone",
			"Burning Bud",
			"Prickly Pear",
			"Cauliflower",
			"Sugar Apple",
			"Ember Lily",
			"Beanstalk",
			"Pepper",
			"Orange Tulip",
			"Crimson Thorn",
			"Elder Strawberry",
			"Loquat",
			"Pineapple",
			"Green Apple",
			"Banana",
			"Rafflesia",
			"Potato",
			"Brussels Sprout",
		}, { "" }, true, function(arg)
			enabled["Select Dailys Deals"] = arg
		end)

		funcs:Toggle(v_40, "Auto Buy Dailys Deals", "", false, true, function(arg)
			enabled["Auto Buy Dailys Deals"] = arg
		end)

		local v_41 = tbl4.Shop:AddSection("Shop Eggs")

		funcs:Dropdown(v_41, "Select Eggs  ", "", true, shop.GetShopList("PetShop_UI"), { "" }, true, function(arg)
			enabled["Select Eggs  "] = arg
		end)

		funcs:Toggle(v_41, "Auto Buy Eggs", "", false, true, function(arg)
			enabled["Auto Buy Eggs"] = arg
		end)

		funcs:Toggle(v_41, "Auto Buy All Eggs", "", false, true, function(arg)
			enabled["Auto Buy All Eggs"] = arg
		end)

		funcs:Toggle(v_41, "Auto Buy Best Eggs", "", false, true, function(arg)
			enabled["Auto Buy Best Eggs"] = arg
		end)

		local v_42 = tbl4.Shop:AddSection("Shop Gears")

		funcs:Dropdown(v_42, "Select Gears", "", true, shop.GetShopList("Gear_Shop"), { "" }, true, function(arg)
			enabled["Select Gears"] = arg
		end)

		funcs:Toggle(v_42, "Auto Buy Gears", "", false, true, function(arg)
			enabled["Auto Buy Gears"] = arg
		end)

		funcs:Toggle(v_42, "Auto Buy All Gears", "", false, true, function(arg)
			enabled["Auto Buy All Gears"] = arg
		end)

		funcs:Toggle(v_42, "Auto Buy Best Gears", "", false, true, function(arg)
			enabled["Auto Buy Best Gears"] = arg
		end)

		local v_43 = tbl4.Shop:AddSection("Shop Garden Ascension")

		funcs:Dropdown(v_43, "Select Garden", "", true, shop.GetShopList("GardenCoinShop_UI"), { "" }, true, function(arg)
			enabled["Select Garden"] = arg
		end)

		funcs:Toggle(v_43, "Auto Buy Garden", "", false, true, function(arg)
			enabled["Auto Buy Garden"] = arg
		end)

		funcs:Toggle(v_43, "Auto Buy All Garden", "", false, true, function(arg)
			enabled["Auto Buy All Garden"] = arg
		end)

		funcs:Toggle(v_43, "Auto Buy Best Garden", "", false, true, function(arg)
			enabled["Auto Buy Best Garden"] = arg
		end)

		local v_44 = tbl4.Shop:AddSection("Shop Pass Season")

		funcs:Dropdown(v_44, "Select Pass Season", "", true, {
			"Season 7 Crate",
			"Smith Hammer of Harvest",
			"Anchor",
			"Season 7 Seed Pack",
			"Levelup Lollipop",
			"Grow All",
			"Spirecrest",
		}, { "" }, true, function(arg)
			enabled["Select Pass Season"] = arg
		end)

		funcs:Toggle(v_44, "Auto Buy Pass Season", "", false, true, function(arg)
			enabled["Auto Buy Pass Season"] = arg
		end)

		local v_45 = tbl4.Shop:AddSection("Shop Cosmetic")

		funcs:Dropdown(v_45, "Select Cosmetic", "", true, shop.GetListCosmetic(), { "" }, true, function(arg)
			enabled["Select Cosmetic"] = arg
		end)

		funcs:Toggle(v_45, "Auto Buy Cosmetic", "", false, true, function(arg)
			enabled["Auto Buy Cosmetic"] = arg
		end)

		local v_46 = tbl4.Shop:AddSection("Merchant Shop")

		funcs:Dropdown(v_46, "Select American Merchant", "", true, { "None", "Liberty Lily", "Firework Flower", "Firework", "Bald Eagle", "July 4th Crate" }, { "" }, true, function(arg)
			enabled["Select American Merchant"] = arg
		end)

		funcs:Dropdown(v_46, "Select Gnome Merchant", "", true, { "None", "Common Gnome Crate", "Farmers Gnome Crate", "Classic Gnome Crate", "Iconic Gnome Crate" }, { "" }, true, function(arg)
			enabled["Select Gnome Merchant"] = arg
		end)

		funcs:Dropdown(v_46, "Select Honey Merchant", "", true, { "None", "Flower Seed Pack", "Honey Sprinkler", "Bee Egg", "Bee Crate", "Honey Crafters Crate" }, { "" }, true, function(arg)
			enabled["Select Honey Merchant"] = arg
		end)

		funcs:Dropdown(v_46, "Select Sky Merchant", "", true, { "None", "Night Staff", "Star Caller", "Mutation Spray Cloudtouched" }, { "" }, true, function(arg)
			enabled["Select Sky Merchant"] = arg
		end)

		funcs:Dropdown(v_46, "Select Spray Merchant", "", true, { "None", "Mutation Spray Wet", "Mutation Spray Windstruck", "Mutation Spray Verdant" }, { "" }, true, function(arg)
			enabled["Select Spray Merchant"] = arg
		end)

		funcs:Dropdown(v_46, "Select Sprinkler Merchant", "", true, {
			"None",
			"Tropical Mist Sprinkler",
			"Berry Blusher Sprinkler",
			"Spice Spritzer Sprinkler",
			"Sweet Soaker Sprinkler",
			"Flower Froster Sprinkler",
			"Stalk Sprout Sprinkler",
		}, { "" }, true, function(arg)
			enabled["Select Sprinkler Merchant"] = arg
		end)

		funcs:Dropdown(v_46, "Select Summer Merchant", "", true, {
			"None",
			"Cauliflower",
			"Rafflesia",
			"Green Apple",
			"Avocado",
			"Banana",
			"Pineapple",
			"Kiwi",
			"Bell Pepper",
			"Prickly Pear",
			"Loquat",
			"Feijoa",
			"Pitcher Plant",
			"Common Summer Egg",
			"Rare Summer Egg",
			"Paradise Egg",
		}, { "" }, true, function(arg)
			enabled["Select Summer Merchant"] = arg
		end)

		funcs:Dropdown(v_46, "Select Fall Merchant", "", true, {
			"None",
			"Fall Seed Pack",
			"Kniphofia",
			"Maple Resin",
			"Fall Egg",
			"Chipmunk",
			"Space Squirrel",
			"Red Panda",
			"Bonfire",
			"Harvest Basket",
			"Super Leaf Blower",
			"Rake",
			"Fall Crate",
			"Maple Crate",
			"Fall Fountain",
		}, { "" }, true, function(arg)
			enabled["Select Fall Merchant"] = arg
		end)

		funcs:Dropdown(v_46, "Select Halloween Merchant", "", true, {
			"None",
			"Spider Vine",
			"Monster Flower",
			"Frightwork",
			"Vampire Fang",
			"Specter",
			"Lich Statue",
			"SKULL",
			"GRAVE",
		}, { "" }, true, function(arg)
			enabled["Select Halloween Merchant"] = arg
		end)

		funcs:Dropdown(v_46, "Select Safari Merchant", "", true, {
			"None",
			"Orange Delight",
			"Explorer's Compass",
			"Safari Crate",
			"Zebra Whistle",
			"Protea",
			"Lush Sprinkler",
			"Mini Shipping Container",
			"Baobab",
			"Pet Shard JUMBO",
			"Savannah Crate",
			"Gecko",
			"Hyena",
			"Cape Buffalo",
			"Hippo",
			"Ancestral Horn",
			"Crocodile",
			"Lion",
		}, { "" }, true, function(arg)
			enabled["Select Safari Merchant"] = arg
		end)

		funcs:Toggle(v_46, "Auto Buy Merchant", "", false, true, function(arg)
			enabled["Auto Buy Merchant"] = arg
		end)

		funcs:Toggle(v_46, "Auto Buy All Merchant", "", false, true, function(arg)
			enabled["Auto Buy All Merchant"] = arg
		end)

		funcs:Toggle(v_46, "Auto Buy Best Merchant", "", false, true, function(arg)
			enabled["Auto Buy Best Merchant"] = arg
		end)

		local Booths = tbl4.TradingMarket:AddSection("Booths")
		Booths:AddSeperator({ " - [ Claim Booths ] - " })

		funcs:Toggle(Booths, "Auto Claim Booths", "", false, true, function(arg)
			enabled["Auto Claim Booths"] = arg
		end)

		local v_47 = tbl4.TradingMarket:AddSection("Sniper Booth Pets")
		v_47:AddSeperator({ " - [ Snipe Booth Pets ] - " })

		funcs:Dropdown(v_47, "Choose Pets  ", "", true, managers2:GetPetsLists(), { "" }, true, function(arg)
			enabled["Choose Pets  "] = arg
		end)

		funcs:Dropdown(v_47, "Choose Mutations Pets", "", true, modules.API.Data.PetMutations, { "" }, true, function(arg)
			enabled["Choose Mutations Pets"] = arg
		end)

		funcs:Dropdown(v_47, "Select Threshold Mode          ", "", false, { "Above", "Below" }, { "" }, true, function(arg)
			enabled["Select Threshold Mode          "] = arg
		end)

		funcs:Textbox(v_47, "Weights Threshold      ", "if you don't want use this, just input '0' ", "0", true, function(arg)
			enabled["Weights Threshold      "] = arg
		end)

		funcs:Textbox(v_47, "Age Threshold      ", "if you don't want use this, just input '0' ", "0", true, function(arg)
			enabled["Age Threshold      "] = arg
		end)

		funcs:Textbox(v_47, "Purchase Token Max", "if you don't want use this, just input '0' ", "0", true, function(arg)
			enabled["Purchase Token Max"] = arg
		end)

		funcs:Toggle(v_47, "Hop Server If Not Found", "Automatically hop to another server if no matching pets are found in current server booths", false, true, function(arg)
			enabled["Hop Server If Not Found"] = arg
		end)

		v_47:AddSeperator({ " - [ Webhook ] - " })

		funcs:Textbox(v_47, "Webhook URL Snipe", "Input your webhook URL for snipe notifications", false, true, function(arg)
			enabled["Webhook URL Snipe"] = arg
		end)

		funcs:Toggle(v_47, "Webhook Snipe Booth", "Send webhook notification when successfully sniping a pet", false, true, function(arg)
			enabled["Webhook Snipe Booth"] = arg
		end)

		v_47:AddSeperator({ " - [ Snipe ] - " })

		funcs:Toggle(v_47, "Auto Snipe Booth Pets", "", false, true, function(arg)
			enabled["Auto Snipe Booth Pets"] = arg
		end)

		local v_48 = tbl4.Webhook:AddSection("Config Webhook")

		funcs:Textbox(v_48, "Webhook URL", "Input your webhook URL.", false, true, function(arg)
			enabled["Webhook URL"] = arg
		end)

		funcs:Textbox(v_48, "Ping Message/ID", "", false, true, function(arg)
			enabled["Ping Message/ID"] = arg
		end)

		funcs:Toggle(v_48, "Allow Ping On Ping Message/ID", "", false, true, function(arg)
			enabled["Allow Ping On Ping Message/ID"] = arg
		end)

		local v_49 = tbl4.Webhook:AddSection("Webhook Hatch Egg")

		local function fn14()
			local tbl6 = { "All" }

			for _, v_50 in managers2:GetPetsLists() do
				table.insert(tbl6, v_50)
			end

			return tbl6
		end

		funcs:Dropdown(v_49, "Select Whitelist Pets", "", true, fn14(), { "" }, true, function(arg)
			enabled["Select Whitelist Pets"] = arg
		end)

		funcs:Dropdown(v_49, "Select Threshold Mode    ", "", false, { "Above", "Below" }, { "" }, true, function(arg)
			enabled["Select Threshold Mode    "] = arg
		end)

		funcs:Textbox(v_49, "Weights Threshold    ", "if you don't want use this, just input '0' ", "0", true, function(arg)
			enabled["Weights Threshold    "] = arg
		end)

		funcs:Toggle(v_49, "Webhook Hatch Eggs", "", false, true, function(arg)
			enabled["Webhook Hatch Eggs"] = arg
		end)

		local v_50 = tbl4.Webhook:AddSection("Webhook Mutations Machine")

		local function fn15()
			local tbl6 = { "All" }

			for _, v_51 in modules.API.Data.PetMutations, nil, nil do
				if v_51 ~= "None" then
					table.insert(tbl6, v_51)
				end
			end

			return tbl6
		end

		funcs:Dropdown(v_50, "Select Whitelist Mutations Pets", "", true, fn15(), { "" }, true, function(arg)
			enabled["Select Whitelist Mutations Pets"] = arg
		end)

		funcs:Toggle(v_50, "Webhook Mutations Machine", "", false, true, function(arg)
			enabled["Webhook Mutations Machine"] = arg
		end)

		local v_51 = tbl4.Webhook:AddSection("Webhook Egg Once Ready")

		funcs:Dropdown(v_51, "Select Whitelist Eggs", "", true, managers2:GetEggList(true), { "" }, true, function(arg)
			enabled["Select Whitelist Eggs"] = arg
		end)

		local function fn16()
			local tbl6 = { "All" }

			for _, v_52 in managers2:GetPetsLists() do
				table.insert(tbl6, v_52)
			end

			return tbl6
		end

		funcs:Dropdown(v_51, "Select Whitelist Pets ", "", true, fn16(), { "" }, true, function(arg)
			enabled["Select Whitelist Pets "] = arg
		end)

		funcs:Dropdown(v_51, "Select Threshold Mode      ", "", false, { "Above", "Below" }, { "" }, true, function(arg)
			enabled["Select Threshold Mode      "] = arg
		end)

		funcs:Textbox(v_51, "Weights Pet Threshold", "if you don't want use this, just input '0' ", "0", true, function(arg)
			enabled["Weights Pet Threshold"] = arg
		end)

		funcs:Toggle(v_51, "Webhook Egg Once Ready", "", false, true, function(arg)
			enabled["Webhook Egg Once Ready"] = arg
		end)

		funcs:Toggle(tbl4.Webhook:AddSection("Webhook Disconnection Detection"), "Webhook Disconnection", "", false, true, function(arg)
			enabled["Webhook Disconnection"] = arg
		end)

		task.spawn(function()
			utils.Connections(CoreGui:FindFirstChild("RobloxPromptGui"):FindFirstChild("promptOverlay").ChildAdded, function(arg)
				if enabled["Webhook Disconnection"] and arg.Name == "ErrorPrompt" and not shx.Unloaded then
					local errorMessage = arg:FindFirstChild("ErrorMessage", true)

					if errorMessage then
						local webhook = modules.Webhook
						local webhookUrl = enabled["Webhook URL"]
						local tbl6 = { content = enabled["Allow Ping On Ping Message/ID"] and enabled["Ping Message/ID"] or "" }
						local embeds = {}
						local tbl7 = { title = "**Speed Hub X**", type = "rich", color = tonumber("0xfa0c0c") }
						local fields = {}

						local tbl8 = {
							name = "** -> Disconnection : ** \n",
							value = "> Username: " .. localPlayer.Name .. "\n> Game: " .. (game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name or "Unknown"),
							inline = false,
						}

						local tbl9 = {
							name = "** -> Disconnection Message : ** \n",
							value = "```" .. errorMessage.Text .. "```",
							inline = true,
						}

						fields[1] = tbl8
						fields[2] = tbl9
						tbl7.fields = fields
						embeds[1] = tbl7
						tbl6.embeds = embeds
						webhook(webhookUrl, tbl6)
					end
				end
			end)
		end)

		local v_52 = tbl4.Miscellaneous:AddSection("Pet Loadout Switcher")

		funcs:Dropdown(v_52, "Select Slot (For Egg Reduction Time)", "", false, { "None", "1", "2", "3", "4", "5", "6" }, { "" }, true, function(arg)
			enabled["Select Slot (For Egg Reduction Time)"] = arg
		end)

		funcs:Dropdown(v_52, "Select Slot (For Hatch Egg)", "", false, { "None", "1", "2", "3", "4", "5", "6" }, { "" }, true, function(arg)
			enabled["Select Slot (For Hatch Egg)"] = arg
		end)

		funcs:Dropdown(v_52, "Select Slot (For Sell Pet)", "", false, { "None", "1", "2", "3", "4", "5", "6" }, { "" }, true, function(arg)
			enabled["Select Slot (For Sell Pet)"] = arg
		end)

		funcs:Dropdown(v_52, "Select Slot (For Farm Size Pet In Egg)", "When your egg becomes large, it will hatch all other eggs except the big one. Then it will switch to ‘Select File (For Farm Size Pet)’ to increase the egg’s size. Wait 15 seconds, and after that, it will hatch the big egg", false, { "None", "1", "2", "3", "4", "5", "6" }, { "" }, true, function(arg)
			enabled["Select Slot (For Farm Size Pet In Egg)"] = arg
		end)

		funcs:Textbox(v_52, "Weight Threshold (For Farm Size Pet In Egg)  ", "If you don't use this, Just Input `0`", "0", true, function(arg)
			enabled["Weight Threshold (For Farm Size Pet In Egg)  "] = arg
		end)

		funcs:Dropdown(v_52, "Select Slot (For Default)", "Switch back to this slot after hatching or selling pets", false, { "None", "1", "2", "3", "4", "5", "6" }, { "" }, true, function(arg)
			enabled["Select Slot (For Default)"] = arg
		end)

		funcs:Textbox(v_52, "Delay To Switch", "", "10", true, function(arg)
			enabled["Delay To Switch"] = tonumber(arg)
		end)

		_G.AutoSwitchSlot = funcs:Toggle(v_52, "Auto Switch Loadouts", "", false, true, function(arg)
			enabled["Auto Switch Loadouts"] = arg

			if enabled["Auto Switch Loadouts"] == true then
				if enabled["Auto Switch File"] and _G.AutoSwitchFile then
					_G.AutoSwitchFile:Set(false)
				end
			end
		end)

		v_52:AddSeperator({ " - [ Craft ] - " })

		funcs:Dropdown(v_52, "Select Slot (For Crafting)", "", false, { "None", "1", "2", "3" }, { "" }, true, function(arg)
			enabled["Select Slot (For Crafting)"] = arg
		end)

		funcs:Dropdown(v_52, "Select Slot (For Speed Up)", "", false, { "None", "1", "2", "3" }, { "" }, true, function(arg)
			enabled["Select Slot (For Speed Up)"] = arg
		end)

		funcs:Dropdown(v_52, "Select Slot (For Claim Craft)", "", false, { "None", "1", "2", "3" }, { "" }, true, function(arg)
			enabled["Select Slot (For Claim Craft)"] = arg
		end)

		funcs:Textbox(v_52, "Delay To Switch ", "", "10", true, function(arg)
			enabled["Delay To Switch "] = tonumber(arg)
		end)

		_G.AutoSwitchSlot1 = funcs:Toggle(v_52, "Auto Switch Loadouts ", "", false, true, function(arg)
			enabled["Auto Switch Loadouts "] = arg

			if enabled["Auto Switch Loadouts "] == true then
				if enabled["Auto Switch File "] and _G.AutoSwitchFile1 then
					_G.AutoSwitchFile1:Set(false)
				end
			end
		end)

		local v_53 = tbl4.Miscellaneous:AddSection("Pet Team Switcher")

		_G.File_Team1 = funcs:Dropdown(v_53, "Select File (For Egg Reduction Time)", "", false, petTeams.GetListFile(), { "" }, true, function(arg)
			enabled["Select File (For Egg Reduction Time)"] = arg
		end)

		_G.File_Team2 = funcs:Dropdown(v_53, "Select File (For Hatch Egg)", "", false, petTeams.GetListFile(), { "" }, true, function(arg)
			enabled["Select File (For Hatch Egg)"] = arg
		end)

		_G.File_Team3 = funcs:Dropdown(v_53, "Select File (For Sell Pet)", "", false, petTeams.GetListFile(), { "" }, true, function(arg)
			enabled["Select File (For Sell Pet)"] = arg
		end)

		_G.File_Team4 = funcs:Dropdown(v_53, "Select File (For Farm Size Pet In Egg)", "When your egg becomes large, it will hatch all other eggs except the big one. Then it will switch to ‘Select File (For Farm Size Pet)’ to increase the egg’s size. Wait 15 seconds, and after that, it will hatch the big egg", false, petTeams.GetListFile(), { "" }, true, function(arg)
			enabled["Select File (For Farm Size Pet In Egg)"] = arg
		end)

		_G.File_DefaultTeam = funcs:Dropdown(v_53, "Select File (For Default)", "Switch back to this file/team after hatching or selling pets", false, petTeams.GetListFile(), { "" }, true, function(arg)
			enabled["Select File (For Default)"] = arg
		end)

		funcs:Textbox(v_53, "Weight Threshold (For Farm Size Pet In Egg)    ", "If you don't use this, Just Input `0`", "0", true, function(arg)
			enabled["Weight Threshold (For Farm Size Pet In Egg)    "] = arg
		end)

		funcs:Textbox(v_53, "Delay To Switch  ", "", "10", true, function(arg)
			enabled["Delay To Switch  "] = tonumber(arg)
		end)

		_G.AutoSwitchFile = funcs:Toggle(v_53, "Auto Switch File", "", false, true, function(arg)
			enabled["Auto Switch File"] = arg

			if enabled["Auto Switch File"] == true then
				if enabled["Auto Switch Loadouts"] and _G.AutoSwitchSlot then
					_G.AutoSwitchSlot:Set(false)
				end
			end
		end)

		v_53:AddSeperator({ " - [ Craft ] - " })

		_G.CraftFile1 = funcs:Dropdown(v_53, "Select File (For Crafting)", "", false, petTeams.GetListFile(), { "" }, true, function(arg)
			enabled["Select File (For Crafting)"] = arg
		end)

		_G.CraftFile2 = funcs:Dropdown(v_53, "Select File (For Speed Up)", "", false, petTeams.GetListFile(), { "" }, true, function(arg)
			enabled["Select File (For Speed Up)"] = arg
		end)

		_G.CraftFile3 = funcs:Dropdown(v_53, "Select File (For Claim Craft)", "", false, petTeams.GetListFile(), { "" }, true, function(arg)
			enabled["Select File (For Claim Craft)"] = arg
		end)

		funcs:Textbox(v_53, "Delay To Switch   ", "", "10", true, function(arg)
			enabled["Delay To Switch   "] = tonumber(arg)
		end)

		_G.AutoSwitchFile1 = funcs:Toggle(v_53, "Auto Switch File ", "", false, true, function(arg)
			enabled["Auto Switch File "] = arg

			if enabled["Auto Switch File "] == true then
				if enabled["Auto Switch Loadouts "] and _G.AutoSwitchSlot1 then
					_G.AutoSwitchSlot1:Set(false)
				end
			end
		end)

		local v_54 = tbl4.Miscellaneous:AddSection("Pet Teams")
		v_54:AddSeperator({ " - [ Create Saver File ] - " })

		local v_55 = funcs:Textbox(v_54, "File Name", "", "", true, function(arg)
			enabled["File Name"] = arg
		end)

		funcs:Button(v_54, "Create File", "", function()
			local fileName = enabled["File Name"]
			if fileName == "" or fileName == nil then
				return shx:SetNotification({ "Speed Hub X", "", "Please You need input File name.", 5, 0.5 })
			end
			local tbl6 = {}

			for _, child in pairs(workspace.PetsPhysical:GetChildren()) do
				local name = localPlayer.Name

				if child:GetAttribute("OWNER") == name then
					local attribute = child:GetAttribute("UUID")
					table.insert(tbl6, attribute)
				end
			end

			if #tbl6 > 0 then
				if pcall(function()
					petTeams.SetSaveJSON(fileName, tbl6)
				end) then
					v_55:Set("")
					shx:SetNotification({ "Speed Hub X", "", "Successfully Created File: " .. fileName, 5, 0.5 })

					if _G.SelectFilePetTeam then
						_G.SelectFilePetTeam:Clear()
						_G.SelectFilePetTeam:Refresh(petTeams.GetListFile(), { "" })
					end

					table.foreach({
						_G.File_Team1,
						_G.File_Team2,
						_G.File_Team3,
						_G.File_Team4,
						_G.CraftFile1,
						_G.CraftFile2,
						_G.CraftFile3,
					}, function(arg, arg2)
						if arg2 then
							arg2:Clear()
							arg2:Refresh(petTeams.GetListFile(), { "" })
						end
					end)
				end
			end
		end)

		v_54:AddSeperator({ " - [ Switch Pet Teams ] - " })

		_G.SelectFilePetTeam = funcs:Dropdown(v_54, "Select File", "", false, petTeams.GetListFile(), { "" }, true, function(arg)
			enabled["Select File"] = arg
		end)

		funcs:Button(v_54, "Switch File Pet Team", "", function()
			local selectFile = enabled["Select File"]
			if selectFile == "" or selectFile == nil then
				return shx:SetNotification({ "Speed Hub X", "", "Please Select File.", 5, 0.5 })
			end
			local v_56 = petTeams.ReadPetTeam(selectFile)
			local tbl6 = {}

			if #v_56 > 0 then
				for _, child in ipairs(workspace.PetsPhysical:GetChildren()) do
					local name = localPlayer.Name

					if child:GetAttribute("OWNER") == name then
						gameEvents.PetsService:FireServer("UnequipPet", child:GetAttribute("UUID"))
					end
				end

				task.wait(0.5)

				for _, v_57 in ipairs(v_56) do
					gameEvents.PetsService:FireServer("EquipPet", v_57, localPlayer.Character.HumanoidRootPart.CFrame)
					table.insert(tbl6, v_57)
				end

				local n = 0

				while #tbl6 > 0 and n < 4 do
					for i = #tbl6, 1, -1 do
						if modules.CheckPets(tbl6[i]) == true then
							table.remove(tbl6, i)
						end
					end

					if #tbl6 > 0 then
						task.wait(0.1)
						n += 0.1
					end
				end

				if #tbl6 == 0 then
					cached.Team = selectFile
					shx:SetNotification({ "Speed Hub X", "", "Successfully Equipped Pet Team.", 5, 0.5 })
				else
					shx:SetNotification({ "Speed Hub X", "", "Failed to equip some pets. Try again.", 5, 0.5 })
				end
			end
		end)

		v_54:AddSeperator({ " - [ Delete Pet Teams ] - " })

		funcs:Button(v_54, "Delete File", "", function()
			local selectFile = enabled["Select File"]
			if selectFile == "" or selectFile == nil then
				return shx:SetNotification({ "Speed Hub X", "", "Please Select File.", 5, 0.5 })
			end

			if petTeams.DeleteFile(selectFile) then
				shx:SetNotification({ "Speed Hub X", "", "Successfully Deleted File: " .. selectFile, 5, 0.5 })

				if cached.Team == selectFile then
					cached.Team = nil
				end

				if _G.SelectFilePetTeam then
					_G.SelectFilePetTeam:Clear()
					_G.SelectFilePetTeam:Refresh(petTeams.GetListFile(), { "" })
				end

				table.foreach({
					_G.File_Team1,
					_G.File_Team2,
					_G.File_Team3,
					_G.File_Team4,
					_G.CraftFile1,
					_G.CraftFile2,
					_G.CraftFile3,
				}, function(arg, arg2)
					if arg2 then
						arg2:Clear()
						arg2:Refresh(petTeams.GetListFile(), { "" })
					end
				end)
			end
		end)

		local Performance = tbl4.Miscellaneous:AddSection("Performance")
		Performance:AddSeperator({ " - [ Tree ] - " })

		funcs:Dropdown(Performance, "Select Blacklist Tree", "", true, managers2:GetSeedList(), { "" }, true, function(arg)
			enabled["Select Blacklist Tree"] = arg
		end)

		funcs:Toggle(Performance, "Hide All Tree", "This won't Destroy your tree, Only Hide", false, true, function(arg)
			enabled["Hide All Tree"] = arg

			task.spawn(function()
				if not enabled["Hide All Tree"] then
					local hideTree = cached.HideTree
					if not hideTree or not next(hideTree) then
						return
					end

					for _, v_56 in next, hideTree, nil do
						local object = v_56.Object

						if object then
							if v_56.CanCollide ~= nil then
								object.CanCollide = v_56.CanCollide
							end

							if v_56.Transparency ~= nil then
								object.Transparency = v_56.Transparency
							end
						end
					end
				end
			end)
		end)

		Performance:AddSeperator({ " - [ Fruit ] - " })

		funcs:Dropdown(Performance, "Select Blacklist Fruits  ", "", true, managers2:GetSeedList(), { "" }, true, function(arg)
			enabled["Select Blacklist Hide Fruit"] = arg
		end)

		funcs:Toggle(Performance, "Hide All Fruits", "This won't Destroy your Fruit, Only Hide", false, true, function(arg)
			enabled["Hide All Fruits"] = arg

			task.spawn(function()
				if not enabled["Hide All Fruits"] then
					local hideFruit = cached.HideFruit
					if not hideFruit or not next(hideFruit) then
						return
					end

					for _, v_56 in next, hideFruit, nil do
						local object = v_56.Object

						if object then
							if v_56.CanCollide ~= nil then
								object.CanCollide = v_56.CanCollide
							end

							if v_56.Transparency ~= nil then
								object.Transparency = v_56.Transparency
							end
						end
					end
				end
			end)
		end)

		Performance:AddSeperator({ " - [ Other ] - " })

		funcs:Button(Performance, "Remove All Garden Players", "This does NOT mean removing your garden, it can remove other players' gardens to fix lag", function()
			for _, player in pairs(Players:GetPlayers()) do
				if player ~= localPlayer then
					local v_56 = modules.GetOwnerFarm(player.Name)

					if v_56 then
						v_56:Destroy()
					end
				end
			end
		end)

		funcs:Toggle(Performance, "Auto Remove All Garden Players", "This does NOT mean removing your garden, it can remove other players' gardens to fix lag", false, true, function(arg)
			enabled["Auto Remove All Garden Players"] = arg
		end)

		funcs:Toggle(Performance, "Remove Notification UI", "", false, true, function(arg)
			enabled["Remove Notification UI"] = arg

			task.spawn(function()
				playerGui.Top_Notification.Enabled = not enabled["Remove Notification UI"]
			end)
		end)

		local Calculator = tbl4.Miscellaneous:AddSection("Calculator")
		local v_56 = Calculator:AddParagraph({ Title = "Inventory Total : 0", Content = "" })
		local v_57 = Calculator:AddParagraph({ Title = "Plants Total : 0", Content = "" })

		funcs:Button(Calculator, "Update Inventory Total", "", function()
			local backpack = localPlayer:FindFirstChild("Backpack")
			local n = 0

			for _, child in pairs(backpack:GetChildren()) do
				if child:IsA("Tool") then
					local v_58 = calculator.CalculatorFruit(child)

					if v_58 and v_58 > 0 then
						n += v_58
					end
				end
			end

			v_56:Set({ Title = "Inventory Total : " .. (modules.FormatNumber(n) or "0"), Content = "" })
		end)

		funcs:Button(Calculator, "Update Plants Total", "", function()
			local n = 0

			for _, v_58 in collection.GetPlantList(modules.GetFarmPath("Plants_Physical"), {}), nil, nil do
				local v_59 = calculator.CalculatorFruit(v_58)

				if v_59 and v_59 > 0 then
					n += v_59
				end
			end

			v_57:Set({ Title = "Plants Total : " .. (modules.FormatNumber(n) or "0"), Content = "" })
		end)

		local Stealer = tbl4.Miscellaneous:AddSection("Stealer")

		local v_58 = Stealer:AddParagraph({
			Title = "Best Value",
			Content = [[Player: N/A 
Fruit: N/A
Weight: N/A 
Mutation: N/A 
Variant: N/A 
Value: N/A 
]],
		})

		funcs:Button(Stealer, "Update Best Value", "", function()
			local n = 0
			local v_59 = nil
			local str2 = "N/A"

			for _, player in pairs(Players:GetPlayers()) do
				if player ~= localPlayer then
					local v_60 = modules.GetOwnerFarm(player.Name)

					if v_60 then
						local important = v_60:FindFirstChild("Important")
						important = important and important:FindFirstChild("Plants_Physical")

						if important then
							local v_61 = collection.GetPlantList(important, {})

							for _, v_62 in pairs(v_61) do
								local v_63 = calculator.CalculatorFruit(v_62)

								if typeof(v_63) == "number" and v_63 > n then
									str2 = player.Name
									n = v_63
									v_59 = v_62
								end
							end
						end
					end
				end
			end

			if not v_59 then
				return
			end
			local color = v_59:FindFirstChild("1") and v_59["1"].Color or Color3.new(1, 1, 1)
			local weight = v_59:FindFirstChild("Weight")
			local v_60 = v_58
			local set = v_60.Set
			local tbl6 = { Title = "Best Value" }
			local name = v_59.Name
			weight = weight and ("%.2fkg"):format(weight.Value) or "N/A"
			local v_61 = managers2
			tbl6.Content = "Player: " .. str2 .. "\nFruit: " .. name .. "\nWeight: " .. weight .. "\nMutation: " .. managers2:FormatMutation(managers2:GetMutationName_T(v_59)) .. "\nVariant: " .. v_61:FormatVariant(v_59:FindFirstChild("Variant"), color) .. "\nValue: <b><font color=\"rgb(0,255,0)\">" .. modules.FormatNumber(n) .. "$</font></b>\n"
			set(v_60, tbl6)
		end)

		funcs:Button(Stealer, "Steal Best Value", "only If you have robux", function()
			local n = 0
			local v_59 = nil

			for _, player in pairs(Players:GetPlayers()) do
				if player ~= localPlayer then
					local v_60 = modules.GetOwnerFarm(player.Name)

					if v_60 then
						local important = v_60:FindFirstChild("Important")
						important = important and important:FindFirstChild("Plants_Physical")

						if important then
							local v_61 = collection.GetPlantList(important, {})

							for _, v_62 in pairs(v_61) do
								local v_63 = calculator.CalculatorFruit(v_62)

								if v_63 and v_63 > n then
									n = v_63
									v_59 = v_62
								end
							end
						end
					end
				end
			end

			if v_59 then
				gameEvents.Crops.Collect:FireServer({ v_59 })
			end
		end)

		local v_59 = tbl4.Miscellaneous:AddSection("Inventory Ui")
		local backpack = playerGui:WaitForChild("BackpackGui"):WaitForChild("Backpack")
		local hotbar = backpack:WaitForChild("Hotbar")
		local uiGridFrame = backpack:WaitForChild("Inventory"):WaitForChild("ScrollingFrame"):WaitForChild("UIGridFrame")

		local function fn17(arg)
			local character = localPlayer.Character
			local backpack2 = localPlayer:FindFirstChild("Backpack")

			for _, child in pairs(character:GetChildren()) do
				if child:IsA("Tool") and child.Name == arg then
					local v_60 = calculator.CalculatorFruit(child)
					if v_60 > 0 then
						return v_60
					end
				end
			end

			for _, child in pairs(backpack2:GetChildren()) do
				if child:IsA("Tool") and child.Name == arg then
					local v_60 = calculator.CalculatorFruit(child)
					if v_60 > 0 then
						return v_60
					end
				end
			end

			return 0
		end

		local function fn18(arg)
			for _, child in ipairs(arg:GetChildren()) do
				if child:IsA("TextButton") then
					local toolName = child:FindFirstChild("ToolName")

					if toolName then
						local v_60 = fn17(toolName.Text)
						local value = child:FindFirstChild("Value")

						if v_60 > 0 then
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
								value.Parent = child
							end

							value.Text = "$" .. modules.FormatNumer1(v_60)
						elseif value then
							value:Destroy()
						end
					end
				end
			end
		end

		local function fn19(arg)
			for _, child in pairs(arg:GetChildren()) do
				if child:IsA("TextButton") then
					local value = child:FindFirstChild("Value")

					if value then
						value:Destroy()
					end
				end
			end
		end

		funcs:Toggle(v_59, "Show Value Money In Fruits", "", false, true, function(arg)
			enabled["Show Value Money In Fruits"] = arg

			task.defer(function()
				while enabled["Show Value Money In Fruits"] and not shx.Unloaded do
					fn18(hotbar)
					fn18(uiGridFrame)
					task.wait(2)
				end

				fn19(hotbar)
				fn19(uiGridFrame)
			end)
		end)

		local v_60 = tbl4.Miscellaneous:AddSection("Prompt Purchase")
		v_60:AddSeperator({ " - [ Config ] - " })

		funcs:Dropdown(v_60, "Purchase Type", "", false, { "Token", "Robux" }, { "" }, true, function(arg)
			enabled["Purchase Type"] = arg
		end)

		v_60:AddSeperator({ " - [ Shop Purchase ] - " })

		local v_61 = funcs:Dropdown(v_60, "Select Purchase", "", false, { "Please Click Load Purchase List Option" }, { "" }, true, function(arg)
			enabled["Select Purchase"] = arg
		end)

		funcs:Button(v_60, "Load Purchase List Option", "", function()
			local developerProductsAsync = MarketplaceService:GetDeveloperProductsAsync()
			local cachedPurchases = {}
			shx:SetNotification({ "Speed Hub X", "", "Loading Purchase List...", 5, 0.5 })

			while true do
				local currentPage = developerProductsAsync:GetCurrentPage()

				for _, v_62 in ipairs(currentPage) do
					cachedPurchases[v_62.Name] = v_62.ProductId
				end

				if not developerProductsAsync.IsFinished then
					developerProductsAsync:AdvanceToNextPageAsync()
					continue
				end
				break
			end

			if not next(cachedPurchases) then
				return shx:SetNotification({ "Speed Hub X", "", "No Purchases Found.", 5, 0.5 })
			end
			shx:SetNotification({ "Speed Hub X", "", "Purchase List Loaded.", 5, 0.5 })
			modules.Market_Product.Cached_Purchases = cachedPurchases
			v_61:Clear()

			local function fn20()
				local tbl6 = {}

				for k in pairs(cachedPurchases) do
					table.insert(tbl6, k)
				end

				return tbl6
			end

			v_61:Refresh(fn20(), { "" })
		end)

		funcs:Button(v_60, "Purchase", "", function()
			local cachedPurchases = modules.Market_Product.Cached_Purchases and modules.Market_Product.Cached_Purchases[enabled["Select Purchase"]]
			if not cachedPurchases or cachedPurchases == "" then
				return shx:SetNotification({ "Speed Hub X", "", "Please Select Purchase.", 5, 0.5 })
			end

			if enabled["Purchase Type"] == "Token" then
				gameEvents.TradeEvents.TradeTokens.Purchase:InvokeServer(cachedPurchases)
			else
				pcall(function()
					local function_ = getconnections(game:GetService("Players").LocalPlayer.PlayerGui.Seed_Shop.Frame.ScrollingFrame.Carrot.Frame.Robux_Buy.Activated)[2].Function
					local getupvalue_ = getupvalue or debug.getupvalue
					local purchaseID = getupvalue_(function_, 2).PurchaseID
					rawset(getupvalue_(function_, 2), "PurchaseID", cachedPurchases)
					local robuxBuy = playerGui.Seed_Shop.Frame.ScrollingFrame.Carrot.Frame.Robux_Buy
					local parent = robuxBuy.Parent
					local transparency = robuxBuy.Transparency
					local text = robuxBuy.Price.Text
					robuxBuy.Transparency = 1
					robuxBuy.Price.Text = "NULL"
					local screenGui = Instance.new("ScreenGui")
					screenGui.Name = "Purchase_Screen"
					screenGui.ResetOnSpawn = false
					screenGui.IgnoreGuiInset = true
					screenGui.Parent = playerGui
					robuxBuy.Parent = screenGui
					task.wait(0.15)
					robuxBuy.Active = true
					robuxBuy.Selectable = true
					robuxBuy.Visible = true
					local n = robuxBuy.AbsolutePosition + robuxBuy.AbsoluteSize / 2
					virtualInputManager:SendMouseButtonEvent(n.X, n.Y, 0, true, game, 0)
					task.wait()
					virtualInputManager:SendMouseButtonEvent(n.X, n.Y, 0, false, game, 0)
					task.wait(0.1)
					robuxBuy.Parent = parent
					robuxBuy.Transparency = transparency
					robuxBuy.Price.Text = text
					screenGui:Destroy()
					rawset(getupvalue_(function_, 2), "PurchaseID", purchaseID)
				end)
			end
		end, "This has some risk. If you buy something that doesn’t give you anything in-game, you use it at your own risk.")

		local Server = tbl4.Miscellaneous:AddSection("Server")
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
			game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, State["Job ID"], localPlayer)
		end)

		Server:AddSeperator({ " - [ Other ] - " })

		funcs:Toggle(Server, "Auto Execute Script When Reconnected", "this means when you reconnectd and then execute the speed hub x script without manually executing, and you must enable 'Auto Reconnect' first, it is useful for farmers ugphone or somethings", true, true, function(arg)
			enabled["Auto Execute Script When Reconnected"] = arg
		end)

		funcs:Toggle(Server, "Auto Reconnect", "", false, true, function(arg)
			enabled["Auto Reconnect"] = arg
		end)

		task.spawn(function()
			utils.Connections(CoreGui:FindFirstChild("RobloxPromptGui"):FindFirstChild("promptOverlay").ChildAdded, function(arg)
				if enabled["Auto Reconnect"] and arg.Name == "ErrorPrompt" then
					task.delay(2, function()
						if enabled["Auto Execute Script When Reconnected"] then
							fn11("                loadstring(game:HttpGet(\"https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua\", true))()\n              ")
						end

						TeleportService:Teleport(game.PlaceId, localPlayer)
					end)
				end
			end)
		end)

		local v_62 = tbl4.Miscellaneous:AddSection("Hop Server")
		v_62:AddSeperator({ " - [ Hop Place Version | Current : " .. game.PlaceVersion .. " ] - " })

		funcs:Textbox(v_62, "Place Version", "", "", true, function(arg)
			enabled["Place Version"] = arg
		end)

		funcs:Toggle(v_62, "Saver Auto Hop Until Place Version", "This means that when you enable 'Auto Hop Until Place Version', it will stay enabled even after rejoining or hopping", false, true, function(arg)
			enabled["Saver Auto Hop Until Place Version"] = arg
		end)

		v_62:AddToggle({
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

		v_62:AddSeperator({ " - [ Hop Server ] - " })

		funcs:Button(v_62, "Hop Server", "", function()
			modules.Server_Hop.Hop()
		end)

		local esp2 = tbl4.Miscellaneous:AddSection("ESP")

		funcs:Dropdown(esp2, "Select Fruits    ", "", true, managers2:GetSeedList(), { "" }, true, function(arg)
			enabled["Select Fruits ESP"] = arg
		end)

		funcs:Dropdown(esp2, "Select Mutations    ", "", true, managers2:GetMutationList(), { "" }, true, function(arg)
			enabled["Select Mutation ESP"] = arg
		end)

		funcs:Dropdown(esp2, "Select Variant    ", "", true, modules.Variant, { "" }, true, function(arg)
			enabled["Select Variant ESP"] = arg
		end)

		funcs:Toggle(esp2, "Allow Show Value Money", "", false, true, function(arg)
			enabled["Allow Show Value Money"] = arg
		end)

		funcs:Toggle(esp2, "ESP Fruit", "", false, true, function(arg)
			enabled["ESP Fruit"] = arg

			utils.Fallback(arg, "ESP Fruit", function()
				local v_63 = collection.GetPlantList(modules.GetFarmPath("Plants_Physical"), {}, true)
				if #v_63 == 0 then
					return
				end

				for _, v_64 in next, v_63, nil do
					esp.Removes(v_64)
				end
			end)
		end)

		esp2:AddSeperator({ " - [ Eggs ] - " })

		funcs:Toggle(esp2, "Disable ESP Cooldown Egg", "", false, true, function(arg)
			enabled["Disable ESP Cooldown Egg"] = arg
		end)

		funcs:Toggle(esp2, "ESP Eggs", "", false, true, function(arg)
			enabled["ESP Eggs"] = arg

			utils.Fallback(arg, "ESP Eggs", function()
				local Objects_Physical = modules.GetFarmPath("Objects_Physical")
				if not Objects_Physical then
					return
				end

				for _, child in pairs(Objects_Physical:GetChildren()) do
					local name = localPlayer.Name

					if child:GetAttribute("OWNER") == name then
						esp.Removes(child)
					end
				end
			end)
		end)

		esp2:AddSeperator({ " - [ Other ] - " })

		funcs:Toggle(esp2, "ESP Crates", "", false, true, function(arg)
			enabled["ESP Crates"] = arg

			utils.Fallback(arg, "ESP Crates", function()
				local Objects_Physical = modules.GetFarmPath("Objects_Physical")
				if not Objects_Physical then
					return
				end

				for _, child in pairs(Objects_Physical:GetChildren()) do
					local name = localPlayer.Name

					if child:GetAttribute("OWNER") == name and child:GetAttribute("CrateType") then
						esp.Removes(child)
					end
				end
			end)
		end)

		local function fn20()
			local tbl6 = { "All" }

			for _, v_63 in managers2:GetPetsList() do
				table.insert(tbl6, v_63)
			end

			return tbl6
		end

		local v_63 = funcs:Dropdown(esp2, "Select Pets    ", "", true, fn20(), { "All" }, true, function(arg)
			enabled["Select Pets ESP"] = arg
		end)

		funcs:Button(esp2, "Refresh Select Pets", "", function()
			v_63:Clear()
			v_63:Refresh(fn20(), { "" })
		end)

		funcs:Toggle(esp2, "ESP Pets", "", false, true, function(arg)
			enabled["ESP Pets"] = arg

			task.spawn(function()
				if not enabled["ESP Pets"] then
					local petsPhysical = workspace:FindFirstChild("PetsPhysical")
					if not petsPhysical then
						return
					end

					for _, child in ipairs(petsPhysical:GetChildren()) do
						local name = localPlayer.Name

						if child:GetAttribute("OWNER") == name then
							esp.Removes(child)
						end
					end
				end
			end)
		end)

		local v_64 = tbl4.Miscellaneous:AddSection("More FPS")

		funcs:Button(v_64, "Reduce Lag", "", function()
			for _, descendant in pairs(Workspace:GetDescendants()) do
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
			end
		end)

		funcs:Toggle(v_64, "Show Screen White", "", false, true, function(arg)
			RunService:Set3dRenderingEnabled(not arg)
		end)

		funcs:Toggle(v_64, "Show Screen Black", "", false, true, function(arg)
			Lighting.ExposureCompensation = arg and -10 or 0
		end)

		funcs:Toggle(v_64, "Reduce Pet Visual Effects", "", false, true, function(arg)
			enabled["Reduce Pet Visual Effects"] = arg
		end)

		funcs:Toggle(v_64, "Reduce Pet Animation", "", false, true, function(arg)
			enabled["Reduce Pet Animation"] = arg
		end)

		funcs:Button(tbl4.Settings:AddSection("Reset Config"), "Reset Script Config", "", function()
			for _, v_65 in next, { "Speed_Hub", "SpeedHubX", "Speed Hub X", "Speed Hub", "Speed_Hub_X" }, nil do
				if fn9(v_65) then
					delfolder(v_65)
				end
			end
		end)

		task.spawn(shx.AddSettingUi, shx, v_6)
	end

	handlers.LoadFunction = function()
		local function fn14(arg, arg2)
			task.spawn(function()
				utils.StartLoop(arg, arg2)
			end)
		end

		fn14("Enable Walkspeed", function()
			local character = localPlayer and localPlayer.Character
			character = character and character:FindFirstChild("Humanoid")
			local walkSpeed = tonumber(enabled["Set Speed"]) or 20

			if character then
				character.WalkSpeed = walkSpeed
			end
		end)

		fn14("No Clip", function()
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

		fn14("Auto Plants Seed", function()
			local character = localPlayer and localPlayer.Character
			character = character and character.PrimaryPart

			for _, v_6 in enabled["Select Seeds"], nil, nil do
				local tool = localPlayer.Character and localPlayer.Character:FindFirstChildWhichIsA("Tool")

				if not (tool and tool.Name:find(v_6 .. " Seed")) then
					toolFunction.Equip(v_6, "Seed")
				else
					local selectPosition = enabled["Select Position"]

					if selectPosition == "Good Position" then
						for _, v_7 in ipairs(managers2:GetGoodPositions()) do
							if enabled["Auto Plants Seed"] then
								gameEvents.Plant_RE:FireServer(v_7, tool:GetAttribute("Seed"))
								task.wait(0.1)
								continue
							end

							break
						end
					else
						local position

						if selectPosition == "Player Position" then
							position = character.Position
						else
							position = managers2:GetRandomPlant()
						end

						if position then
							gameEvents.Plant_RE:FireServer(position, tool:GetAttribute("Seed"))
						end
					end
				end
			end

			task.wait(enabled["Delay To Plants"] or 0)
		end)

		fn14("Auto Plants All Seeds", function()
			local character = localPlayer and localPlayer.Character
			character = character and character.PrimaryPart
			local Seed = toolFunction.CurrentTool("Seed")

			if Seed then
				local attribute = Seed:GetAttribute("Seed")

				if not toolFunction.IsEquipped(attribute, "Seed") then
					toolFunction.Equip(attribute, "Seed")
				else
					local tool = localPlayer.Character and localPlayer.Character:FindFirstChildWhichIsA("Tool")
					local selectPosition = enabled["Select Position"]

					if selectPosition == "Good Position" then
						for _, v_6 in ipairs(managers2:GetGoodPositions()) do
							if enabled["Auto Plants All Seeds"] then
								gameEvents.Plant_RE:FireServer(v_6, tool:GetAttribute("Seed"))
								task.wait()
								continue
							end

							break
						end
					else
						local position

						if selectPosition == "Player Position" then
							position = character.Position
						else
							position = managers2:GetRandomPlant()
						end

						if position then
							gameEvents.Plant_RE:FireServer(position, tool:GetAttribute("Seed"))
						end
					end
				end
			end

			task.wait(enabled["Delay To Plants"] or 0)
		end)

		fn14("Auto Collect Whitelisted Fruits", function()
			local v_6 = collection.GetPlantList(modules.GetFarmPath("Plants_Physical"), {})
			local tbl4 = { enabled["Select Whitelist Fruit"], {}, {} }
			local n = 0

			for i = 1, #v_6 do
				if enabled["Auto Collect Whitelisted Fruits"] then
					if not (enabled["Stop Collect If Backpack Is Full Max"] and toolFunction.IsMaxInventory()) then
						local v_7 = v_6[i]

						if not v_7:GetAttribute("Favorited") and modules.FruitFilter(tbl4, v_7) then
							if not enabled["Instant Collect"] then
								task.wait(enabled["Delay To Collect"] or 0)
							end

							gameEvents.Crops.Collect:FireServer({ v_7 })
							n += 1

							if not enabled["Instant Collect"] then
								task.wait(0.02)
							end

							if not (enabled["Instant Collect"] and n > 50) then
								continue
							end
						else
							continue
						end
					end
				end

				break
			end

			task.wait(1)
		end)

		fn14("Auto Collect Whitelisted Mutations", function()
			local v_6 = collection.GetPlantList(modules.GetFarmPath("Plants_Physical"), {})
			local tbl4 = { {}, enabled["Select Whitelist Mutations"], {} }
			local n = 0

			for i = 1, #v_6 do
				if enabled["Auto Collect Whitelisted Mutations"] then
					if not (enabled["Stop Collect If Backpack Is Full Max"] and toolFunction.IsMaxInventory()) then
						local v_7 = v_6[i]

						if not v_7:GetAttribute("Favorited") and modules.FruitFilter(tbl4, v_7) then
							if not enabled["Instant Collect"] then
								task.wait(enabled["Delay To Collect"] or 0)
							end

							gameEvents.Crops.Collect:FireServer({ v_7 })
							n += 1

							if not enabled["Instant Collect"] then
								task.wait(0.02)
							end

							if not (enabled["Instant Collect"] and n > 50) then
								continue
							end
						else
							continue
						end
					end
				end

				break
			end

			task.wait(1)
		end)

		fn14("Auto Collect Fruits (Whitelist)", function()
			if enabled["Stop Collect If Weather Is Here"] and managers2:IsWeather() then
				return
			end
			local v_6 = collection.GetPlantList(modules.GetFarmPath("Plants_Physical"), {})

			local tbl4 = {
				enabled["Select Whitelist Fruits"],
				enabled["Select Whitelist Mutation"],
				enabled["Select Whitelist Variant"],
			}

			local n = 0

			for i = 1, #v_6 do
				if enabled["Auto Collect Fruits (Whitelist)"] then
					if not (enabled["Stop Collect If Backpack Is Full Max"] and toolFunction.IsMaxInventory()) then
						local v_7 = v_6[i]
						local weight = v_7:FindFirstChild("Weight")
						local whitelistWeight = enabled["Whitelist Weight"]
						local whitelistWeightMode = enabled["Whitelist Weight Mode"]
						local flag = not weight or not whitelistWeight or whitelistWeight == "" or whitelistWeight == 0
						local flag2

						if flag then
							flag2 = flag
						else
							flag2 = whitelistWeightMode == "Above" and weight.Value > whitelistWeight
						end

						flag2 = flag2 or weight.Value < whitelistWeight
						flag2 = not v_7:GetAttribute("Favorited") and modules.FruitFilter(tbl4, v_7) and flag2

						if flag2 then
							if not enabled["Instant Collect"] then
								task.wait(enabled["Delay To Collect"] or 0)
							end

							gameEvents.Crops.Collect:FireServer({ v_7 })
							n += 1

							if not enabled["Instant Collect"] then
								task.wait(0.02)
							end

							if not (enabled["Instant Collect"] and n > 50) then
								continue
							end
						else
							continue
						end
					end
				end

				break
			end

			task.wait(1)
		end)

		fn14("Auto Collect Fruits (Blacklist)", function()
			if enabled["Stop Collect If Weather Is Here"] and managers2:IsWeather(managers2) then
				return
			end
			local v_6 = collection.GetPlantList(modules.GetFarmPath("Plants_Physical"), {})

			local tbl4 = {
				enabled["Select Blacklist Fruits"],
				enabled["Select Blacklist Mutation"],
				enabled["Select Blacklist Variant"],
			}

			local n = 0

			for i = 1, #v_6 do
				if enabled["Auto Collect Fruits (Blacklist)"] then
					if not (enabled["Stop Collect If Backpack Is Full Max"] and toolFunction.IsMaxInventory()) then
						local v_7 = v_6[i]
						local weight = v_7:FindFirstChild("Weight")
						local blacklistWeight = enabled["Blacklist Weight"]
						local flag = not weight or not blacklistWeight or blacklistWeight == "" or blacklistWeight == 0 or enabled["Blacklist Weight Mode"] == "Above" and weight.Value <= blacklistWeight or weight.Value >= blacklistWeight

						if not v_7:GetAttribute("Favorited") and not modules.FruitFilter(tbl4, v_7) and flag then
							if not enabled["Instant Collect"] then
								task.wait(enabled["Delay To Collect"] or 0)
							end

							gameEvents.Crops.Collect:FireServer({ v_7 })
							n += 1

							if not enabled["Instant Collect"] then
								task.wait(0.02)
							end

							if not (enabled["Instant Collect"] and n > 50) then
								continue
							end
						else
							continue
						end
					end
				end

				break
			end

			task.wait(1)
		end)

		fn14("Auto Collect All Fruits", function()
			if enabled["Stop Collect If Weather Is Here"] and managers2:IsWeather() then
				return
			end
			local v_6 = collection.GetPlantList(modules.GetFarmPath("Plants_Physical"), {})
			if #v_6 == 0 then
				return
			end
			local n = 0

			for i = 1, #v_6 do
				if enabled["Auto Collect All Fruits"] then
					if not (enabled["Stop Collect If Backpack Is Full Max"] and toolFunction.IsMaxInventory()) then
						local v_7 = v_6[i]

						if not v_7:GetAttribute("Favorited") then
							if not enabled["Instant Collect"] then
								task.wait(enabled["Delay To Collect"] or 0)
							end

							gameEvents.Crops.Collect:FireServer({ v_7 })
							n += 1

							if not enabled["Instant Collect"] then
								task.wait(0.02)
							end

							if not (enabled["Instant Collect"] and n > 50) then
								continue
							end
						else
							continue
						end
					end
				end

				break
			end

			task.wait(1)
		end)

		fn14("Auto Sprinkler", function()
			local character = localPlayer and localPlayer.Character
			character = character and character.PrimaryPart
			if not character then
				return
			end

			for _, v_6 in ipairs(toolFunction.GetAllTool()) do
				if enabled["Auto Sprinkler"] then
					if v_6:IsA("Tool") and v_6:GetAttribute("b") == "d" and table.find(enabled["Select Sprinkler"], v_6:GetAttribute("f")) then
						task.wait(tonumber(enabled["Delay To Sprinkler"]) or 0)
						localPlayer.Character.Humanoid:EquipTool(v_6)
						task.wait(0.5)
						local selectPosition1 = enabled["Select Position1"]
						local position = selectPosition1 == "Player Position" and character.Position or selectPosition1 == "Selected Plant" and collection.GetPositionPlant(enabled["Select Plants Sprinkler"]) or managers2:GetRandomPlant()

						if position then
							gameEvents.SprinklerService:FireServer("Create", CFrame.new(position) + Vector3.new(0, 0.135, 0))
							break
						else
							continue
						end
					else
						continue
					end
				end

				break
			end

			task.wait(1)
		end)

		fn14("Auto Place Eggs", function()
			local character = localPlayer and localPlayer.Character
			if not character then
				return
			end

			if managers2:IsPlacedMax() then
				return
			end

			if enabled["Allow Placing If No Egg in Garden"] and managers2:GetCountPlacedEggs() ~= 0 then
				return
			end

			if enabled["Auto Switch File"] or enabled["Auto Switch Loadouts"] then
				if managers2:IsOperationBlocked() then
					return
				end
			end

			local tbl4 = {}

			for _, v_6 in ipairs(toolFunction.GetAllTool()) do
				if not enabled["Auto Place Eggs"] then
					break
				end

				if managers2:IsPlacedMax() then
					break
				end

				if v_6:IsA("Tool") and v_6:GetAttribute("b") == "c" and table.find(enabled["Select Eggs"], v_6:GetAttribute("h")) then
					stored.Pet_Switcher["Place Egg"] = true
					task.wait(enabled["Delay To Place Eggs"] or 0)

					if enabled["Auto Switch File"] or enabled["Auto Switch Loadouts"] then
						if stored.Pet_Switcher["Hatching Egg"] or stored.Pet_Switcher["Selling Pet"] or stored.Pet_Switcher["Stop Switch"] or managers2:IsSwitchingActive() then
							stored.Pet_Switcher["Place Egg"] = false
							return
						end
					end

					localPlayer.Character.Humanoid:EquipTool(v_6)
					task.wait(0.5)
					local selectPosition = enabled["Select Position  "]

					if selectPosition == "Good Position" then
						for _, v_7 in ipairs(managers2:GetGoodPositions()) do
							if not managers2:IsPlacedMax() then
								if enabled["Auto Place Eggs"] then
									stored.Pet_Switcher["Place Egg"] = true
									table.insert(tbl4, v_7)
									gameEvents.PetEggService:FireServer("CreateEgg", v_7)
									task.wait()
									continue
								end
							end

							break
						end
					else
						local position

						if selectPosition == "Player Position" then
							position = character.PrimaryPart.Position
						else
							position = managers2:GetRandomPlant()
						end

						if position then
							stored.Pet_Switcher["Place Egg"] = true
							table.insert(tbl4, position)
							gameEvents.PetEggService:FireServer("CreateEgg", position)
						end
					end
				end
			end

			stored.Pet_Switcher["Place Egg"] = false

			if #tbl4 > 0 then
				task.wait(1)
			end

			task.wait(1)
		end)

		fn14("Auto Hatch Eggs", function()
			local Objects_Physical = modules.GetFarmPath("Objects_Physical")
			if not Objects_Physical then
				return
			end

			if enabled["All Eggs Ready Only"] and not modules.CheckEggToHatch(true) then
				return
			end

			if enabled["Auto Switch File"] or enabled["Auto Switch Loadouts"] then
				if managers2:IsOperationBlocked() then
					return
				end
			end

			local tbl4 = {}
			local tbl5 = {}

			for _, child in ipairs(Objects_Physical:GetChildren()) do
				if enabled["Auto Hatch Eggs"] then
					if child:IsA("Model") and child.Name == "PetEgg" then
						local attribute = child:GetAttribute("EggName")
						local attribute2 = child:GetAttribute("OBJECT_UUID")
						local attribute3 = child:GetAttribute("READY")
						local attribute4 = child:GetAttribute("TimeToHatch")

						if (table.find(enabled["Select Eggs "], "All") or table.find(enabled["Select Eggs "], attribute)) and attribute3 and attribute4 == 0 then
							local autoSwitchFile = not (str:find("Solara") or str:find("Xeno")) and (enabled["Auto Switch File"] or enabled["Auto Switch Loadouts"])
							local flag = false

							if autoSwitchFile then
								local selectSlotForFarmSizePetInEgg, n

								if enabled["Auto Switch Loadouts"] then
									selectSlotForFarmSizePetInEgg = enabled["Select Slot (For Farm Size Pet In Egg)"]
									n = tonumber(enabled["Weight Threshold (For Farm Size Pet In Egg)  "]) or 0
								else
									selectSlotForFarmSizePetInEgg = nil
									n = nil

									if enabled["Auto Switch File"] then
										selectSlotForFarmSizePetInEgg = enabled["Select File (For Farm Size Pet In Egg)"]
										n = tonumber(enabled["Weight Threshold (For Farm Size Pet In Egg)    "]) or 0
									end
								end

								if selectSlotForFarmSizePetInEgg and selectSlotForFarmSizePetInEgg ~= "" and selectSlotForFarmSizePetInEgg ~= "None" then
									local v_6 = modules.DataClient.GetSaved_Data()[attribute2]

									if v_6 and v_6.Data then
										local v_7 = modules.Calculator.CurrentWeight(v_6.Data.BaseWeight, 1)

										if n ~= 0 and n ~= "" and n ~= nil and v_7 >= n then
											flag = true
										end
									end
								end
							end

							if managers2:CheckEgg(attribute2) then
								if flag then
									table.insert(tbl5, child)
								else
									table.insert(tbl4, child)
								end
							end
						end
					end

					continue
				end

				break
			end

			if #tbl4 > 0 then
				local flag

				if enabled["Auto Switch File"] then
					flag = managers2:FireFile(enabled["Select File (For Hatch Egg)"], "Delay To Switch  ")
				else
					flag = true

					if enabled["Auto Switch Loadouts"] then
						flag = managers2:FireSlotLoadout(enabled["Select Slot (For Hatch Egg)"], "Delay To Switch")
					end
				end

				if flag then
					stored.Pet_Switcher["Hatching Egg"] = true

					for _, v_6 in ipairs(tbl4) do
						if enabled["Auto Hatch Eggs"] then
							local attribute = v_6:GetAttribute("OBJECT_UUID")

							if managers2:CheckEgg(attribute) then
								gameEvents.PetEggService:FireServer("HatchPet", v_6)
							end

							continue
						end

						break
					end

					task.wait(1)
					stored.Pet_Switcher["Hatching Egg"] = false
				end
			end

			if (enabled["Auto Switch File"] or enabled["Auto Switch Loadouts"]) and #tbl5 > 0 then
				stored.Pet_Switcher["Hatching Egg"] = true
				local flag

				if enabled["Auto Switch File"] then
					flag = managers2:FireFile(enabled["Select File (For Farm Size Pet In Egg)"], "Delay To Switch  ")
				else
					flag = false

					if enabled["Auto Switch Loadouts"] then
						flag = managers2:FireSlotLoadout(enabled["Select Slot (For Farm Size Pet In Egg)"], "Delay To Switch")
					end
				end

				if flag then
					task.wait(15)

					for _, v_6 in ipairs(tbl5) do
						if enabled["Auto Hatch Eggs"] then
							gameEvents.PetEggService:FireServer("HatchPet", v_6)
							continue
						end
						break
					end

					task.wait(1)
				end

				stored.Pet_Switcher["Hatching Egg"] = false
			end

			if enabled["Auto Switch File"] or enabled["Auto Switch Loadouts"] then
				if enabled["Auto Switch Loadouts"] and enabled["Select Slot (For Default)"] and enabled["Select Slot (For Default)"] ~= "None" and enabled["Select Slot (For Default)"] ~= "" then
					task.wait(1)
					managers2:FireSlotLoadout(enabled["Select Slot (For Default)"], "Delay To Switch")
				elseif enabled["Auto Switch File"] and enabled["Select File (For Default)"] and enabled["Select File (For Default)"] ~= "None" and enabled["Select File (For Default)"] ~= "" then
					task.wait(1)
					managers2:FireFile(enabled["Select File (For Default)"], "Delay To Switch  ")
				end
			end

			task.wait(1)
		end)

		fn14("Auto Place Crate", function()
			for _, child in ipairs(localPlayer.Backpack:GetChildren()) do
				if child:IsA("Tool") and child:GetAttribute("b") == "r" and table.find(enabled["Select Crate"], child:GetAttribute("i")) then
					localPlayer.Character:FindFirstChild("Humanoid"):EquipTool(child)
					task.wait(0.5)
					gameEvents.CosmeticCrateService:FireServer("CreateCrate", managers2:GetRandomPlant())
					break
				end
			end
		end)

		fn14("Auto Sell", function()
			if not enabled["Auto Sell"] then
				return
			end

			if not enabled["Allow Sell If Backpack Is Max"] then
				sellFunction.CallSell("Auto Sell")
			elseif toolFunction.IsMaxInventory() then
				sellFunction.CallSell("Auto Sell")
			end

			task.wait(tonumber(enabled["Delay To Sell Inventory"]) or 0.05)
		end)

		fn14("Auto Sell Pets", function()
			local character = localPlayer.Character
			if not character then
				return
			end
			local sellPets = enabled["Sell Pets"]
			local antiSellPets = enabled["Anti-Sell Pets"]
			local n = tonumber(enabled["Age Threshold  "]) or 0
			local n2 = tonumber(enabled["Weights Threshold  "]) or 0
			local selectThresholdMode = enabled["Select Threshold Mode  "]
			local tbl4 = {}

			if enabled["Auto Switch File"] or enabled["Auto Switch Loadouts"] then
				if stored.Pet_Switcher["Hatching Egg"] or managers2:IsSwitchingActive() then
					return
				end
			end

			for _, v_6 in ipairs(toolFunction.GetAllTool()) do
				if v_6:IsA("Tool") and v_6:GetAttribute("PetType") == "Pet" and not v_6:GetAttribute("d") then
					local v_7 = managers2:CleanMutation_Pet(v_6.Name:gsub("%b[]", ""):gsub("^%s*(.-)%s*$", "%1"))

					if table.find(sellPets, v_7) and not table.find(antiSellPets, v_7) then
						local num = tonumber(v_6.Name:match("%[(.-) KG%]") or "")
						local num2 = modules.DataClient.GetLevel(v_6:GetAttribute("PET_UUID"))

						if not num2 then
							num2 = tonumber(v_6.Name:match("%[Age (%d+)%]") or "")
						end

						local flag = n2 == 0

						if not flag then
							if num then
								flag = selectThresholdMode == "Above" and num > n2 or selectThresholdMode == "Don't Sell Above" and num <= n2 or selectThresholdMode == "Don't Sell Below" and num >= n2 or num < n2
							else
								flag = num
							end
						end

						local flag2 = n == 0

						if not flag2 then
							if num2 then
								local flag3 = selectThresholdMode == "Above" and num2 > n or selectThresholdMode == "Don't Sell Above" and num2 <= n

								if flag3 then
									flag2 = flag3
								else
									flag2 = selectThresholdMode == "Don't Sell Below" and num2 >= n
								end

								flag2 = flag2 or num2 < n
							else
								flag2 = num2
							end
						end

						if flag and flag2 then
							stored.Pet_Switcher["Stop Switch"] = true
							task.wait(enabled["Delay to Sell Pets"] or 0)

							if enabled["Select Sell Version"] == "V2" then
								local flag3

								if enabled["Auto Switch File"] then
									flag3 = managers2:FireFile(enabled["Select File (For Sell Pet)"], "Delay To Switch  ")
								else
									flag3 = true

									if enabled["Auto Switch Loadouts"] then
										flag3 = managers2:FireSlotLoadout(enabled["Select Slot (For Sell Pet)"], "Delay To Switch")
									end
								end

								if flag3 then
									stored.Pet_Switcher["Selling Pet"] = true
								end

								if stored.Pet_Switcher["Selling Pet"] then
									table.insert(tbl4, v_6)
									gameEvents.SellPetShopSelected:FireServer(v_6)
								end
							else
								local flag3

								if enabled["Auto Switch File"] then
									flag3 = managers2:FireFile(enabled["Select File (For Sell Pet)"], "Delay To Switch  ")
								else
									flag3 = true

									if enabled["Auto Switch Loadouts"] then
										flag3 = managers2:FireSlotLoadout(enabled["Select Slot (For Sell Pet)"], "Delay To Switch")
									end
								end

								if flag3 then
									stored.Pet_Switcher["Selling Pet"] = true
								end

								if stored.Pet_Switcher["Selling Pet"] then
									repeat
										task.wait()
										character.Humanoid:EquipTool(v_6)
									until character:FindFirstChild(v_6.Name)

									local v_8 = character:FindFirstChild(v_6.Name)

									if v_8 and v_8:GetAttribute("PetType") == "Pet" and not v_8:GetAttribute("d") then
										table.insert(tbl4, v_8)
										gameEvents.SellPet_RE:FireServer(v_8)
									end
								end
							end
						end
					end
				end
			end

			if #tbl4 > 0 then
				stored.Pet_Switcher["Stop Switch"] = false
				stored.Pet_Switcher["Selling Pet"] = false

				if enabled["Auto Switch File"] or enabled["Auto Switch Loadouts"] then
					if enabled["Auto Switch Loadouts"] and enabled["Select Slot (For Default)"] and enabled["Select Slot (For Default)"] ~= "None" and enabled["Select Slot (For Default)"] ~= "" then
						task.wait(1)
						managers2:FireSlotLoadout(enabled["Select Slot (For Default)"], "Delay To Switch")
					elseif enabled["Auto Switch File"] and enabled["Select File (For Default)"] and enabled["Select File (For Default)"] ~= "None" and enabled["Select File (For Default)"] ~= "" then
						task.wait(1)
						managers2:FireFile(enabled["Select File (For Default)"], "Delay To Switch  ")
					end
				end

				task.wait(1)
			else
				stored.Pet_Switcher["Stop Switch"] = false
				stored.Pet_Switcher["Selling Pet"] = false
			end

			task.wait(0.35)
		end)

		fn14("Auto Equip All Pets", function()
			local v_6 = toolFunction.IsEquipped(false, "Pet")

			if not v_6 then
				toolFunction.Equip(false, "Pet")
			end

			if v_6 then
				local cframe = CFrame.new
				gameEvents.PetsService:FireServer("EquipPet", v_6:GetAttribute("PET_UUID"), cframe(-101.48099517822266, 0, -101.09691619873047, 1, 0, 0, 0, 1, 0, 0, 0, 1))
			end
		end)

		fn14("Auto Lead Pets", function()
			local petsPhysical = workspace:FindFirstChild("PetsPhysical")
			if not petsPhysical then
				return
			end
			local selectPets = enabled["Select Pets        "]

			for _, child in ipairs(petsPhysical:GetChildren()) do
				local name = localPlayer.Name

				if child:GetAttribute("OWNER") == name then
					local attribute = child:GetAttribute("UUID")
					local petFromUUID = managers2:GetPetFromUUID(attribute)

					if not (not petFromUUID or not table.find(selectPets, petFromUUID .. " " .. attribute)) then
						local v_6 = child:FindFirstChild(attribute)

						if v_6 and not v_6:GetAttribute("FollowingPlayer") then
							local tool = localPlayer.Character and localPlayer.Character:FindFirstChildWhichIsA("Tool")

							if tool and tool.Name:find("Pet Lead") then
								gameEvents.PetLeadService_RE:FireServer(v_6)
							else
								toolFunction.EquipTool_Find("Pet Lead")
							end
						end
					end
				end
			end

			task.wait(1)
		end)

		fn14("Auto Cleansing Pet Shard", function()
			local petsPhysical = workspace:FindFirstChild("PetsPhysical")
			if not petsPhysical then
				return
			end
			local selectPets = enabled["Select Pets         "]
			if not selectPets or #selectPets == 0 then
				return
			end
			local selectPetMutations = enabled["Select Pet Mutations"]
			if not selectPetMutations or #selectPetMutations == 0 then
				return
			end

			for _, child in ipairs(petsPhysical:GetChildren()) do
				if enabled["Auto Cleansing Pet Shard"] then
					local name = localPlayer.Name

					if child:GetAttribute("OWNER") ~= name then
						continue
					else
						local attribute = child:GetAttribute("UUID")

						if not attribute then
							continue
						else
							local petFromUUID = managers2:GetPetFromUUID(attribute)

							if not petFromUUID then
								continue
							elseif not table.find(selectPets, petFromUUID .. " " .. attribute) then
								continue
							else
								local v_6 = child:FindFirstChild(attribute)

								if not v_6 then
									continue
								else
									local flag = false

									for _, selectPetMutation in ipairs(selectPetMutations) do
										if v_6:GetAttribute(selectPetMutation) then
											flag = true
											break
										end
									end

									if flag then
										local character = localPlayer.Character

										if character then
											local tool = character:FindFirstChildWhichIsA("Tool")

											if tool and tool.Name:find("Cleansing Pet Shard") then
												if pcall(function()
													gameEvents.PetShardService_RE:FireServer("ApplyShard", v_6)
												end) then
													task.wait(1)
												end
											else
												local v_7 = nil

												for _, child2 in ipairs(localPlayer.Backpack:GetChildren()) do
													if child2:IsA("Tool") and child2.Name:find("Cleansing Pet Shard") then
														v_7 = child2
														break
													end
												end

												if v_7 then
													if pcall(function()
														character.Humanoid:EquipTool(v_7)
													end) then
														task.wait(0.5)
													end
												end
											end

											continue
										end
									else
										continue
									end
								end
							end
						end
					end
				end

				break
			end

			task.wait(1)
		end)

		fn14("Auto Feed Pets", function()
			local petsPhysical = workspace:FindFirstChild("PetsPhysical")
			if not petsPhysical then
				return
			end
			local selectPets = enabled["Select Pets"]
			local selectFruits = enabled["Select Fruits"]
			local n = tonumber(enabled["Threshold Hunger % "]) or 50
			local selectFeedType = enabled["Select Feed Type"]

			for _, child in ipairs(petsPhysical:GetChildren()) do
				local name = localPlayer.Name

				if child:GetAttribute("OWNER") == name then
					local attribute = child:GetAttribute("UUID")
					local petFromUUID = managers2:GetPetFromUUID(attribute)

					if not (not petFromUUID or not table.find(selectPets, petFromUUID .. " " .. attribute)) then
						local n2 = tonumber(child:GetAttribute("Hunger")) or 0
						local v_6 = modules.API.Data.Pets[managers2:CleanMutation_Pet(petFromUUID)]

						if v_6 then
							if not (n / 100 <= n2 / v_6.DefaultHunger) then
								local function fn15(arg, arg2, arg3)
									for _, child2 in ipairs(localPlayer.Backpack:GetChildren()) do
										if not enabled["Auto Feed Pets"] then
											return
										end

										if not child2:IsA("Tool") or child2:GetAttribute("d") then
											continue
										end
										local attribute2 = child2:GetAttribute("f")
										if child2:GetAttribute("b") ~= arg2 or not table.find(arg, attribute2) then
											continue
										end

										if arg3 == "Fruit" and modules.FruitFilter({ {}, enabled["Prevent Feed Mutation Fruit"], {} }, child2) then
											continue
										end
										localPlayer.Character.Humanoid:EquipTool(child2)
										task.wait(0.35)
										gameEvents.ActivePetService:FireServer("Feed", attribute)
										return
									end
								end

								if selectFeedType == "Food" then
									fn15(enabled["Select Food"], "u", "Food")
								else
									fn15(selectFruits, "j", "Fruit")
								end
							end
						end
					end
				end
			end

			task.wait(0.5)
		end)

		fn14("Reduce Pets VFX", function()
			local spiderWebFX = workspace:FindFirstChild("SpiderWebFX")
			local julyFirework = workspace:FindFirstChild("JulyFirework")

			if spiderWebFX then
				spiderWebFX:Destroy()
			end

			if julyFirework then
				julyFirework:Destroy()
			end
		end)

		fn14("Auto Pick Place", function()
			if not next(stored.PetCooldown) then
				return
			end

			if enabled["Auto Switch File"] or enabled["Auto Switch Loadouts"] then
				if stored.Pet_Switcher["Hatching Egg"] or stored.Pet_Switcher["Selling Pet"] or stored.Pet_Switcher["Stop Switch"] then
					return
				end
			end

			for k, v_6 in stored.PetCooldown, nil, nil do
				if enabled["Auto Pick Place"] then
					local petFromUUID = managers2:GetPetFromUUID(k)

					if not stored.PetProgressing[k] then
						if petFromUUID and table.find(enabled["Select Pets            "], petFromUUID) then
							for _, v_7 in ipairs(v_6) do
								if not stored.PetProgressing[k] then
									if enabled["Auto Pick Place"] then
										if not (stored.Pet_Switcher["Hatching Egg"] or stored.Pet_Switcher["Selling Pet"] or stored.Pet_Switcher["Place Egg"] or stored.Pet_Switcher["Stop Switch"]) then
											if v_7.Time <= enabled["Pet Timer"] then
												stored.PetProgressing[k] = true
												task.wait(enabled["Delay To Pick"] or 0.1)
												gameEvents.PetsService:FireServer("UnequipPet", k)
												task.wait(enabled["Delay To Place"] or 0.1)
												gameEvents.PetsService:FireServer("EquipPet", k, localPlayer.Character.HumanoidRootPart.CFrame)
												stored.PetProgressing[k] = false
											end

											continue
										end
									end
								end

								break
							end
						end
					end

					continue
				end

				break
			end
		end)

		fn14("Auto Shovel Tree", function()
			local v_6 = collection.GetPlantList1(modules.GetFarmPath("Plants_Physical"), {}, false)
			if #v_6 == 0 then
				return
			end

			for _, v_7 in ipairs(v_6) do
				if enabled["Auto Shovel Tree"] then
					if v_7 and table.find(enabled["Select Tree Shovel"], v_7.Name) then
						local shovelDestroyPlants = localPlayer.Character:FindFirstChild("Shovel [Destroy Plants]") or toolFunction.EquipTool("Shovel [Destroy Plants]")
						local part = v_7:FindFirstChildWhichIsA("Part")

						if shovelDestroyPlants and part then
							task.wait(enabled["Delay To Shovel Tree"] or 0)
							gameEvents.Remove_Item:FireServer(part)
							task.wait(0.1)
						end
					end

					continue
				end

				break
			end

			task.wait(0.1)
		end)

		fn14("Auto Shovel Fruits", function()
			local v_6 = collection.GetPlantList1(modules.GetFarmPath("Plants_Physical"), {}, true)
			if #v_6 == 0 then
				return
			end

			for _, v_7 in ipairs(v_6) do
				if enabled["Auto Shovel Fruits"] then
					if v_7 and modules.FruitFilter({
						enabled["Select Fruits Shovel"],
						enabled["Select Mutation Shovel"],
						enabled["Select Variant Shovel"],
					}, v_7) then
						local weight = v_7:FindFirstChild("Weight")
						local weightThreshold = enabled["Weight Threshold"]

						if weightThreshold == 0 or weight and weight.Value and (enabled["Select Threshold Mode"] == "Above" and weight.Value > weightThreshold or weight.Value < weightThreshold) then
							if localPlayer.Character:FindFirstChild("Shovel [Destroy Plants]") or toolFunction.EquipTool("Shovel [Destroy Plants]") then
								local part = v_7:FindFirstChildWhichIsA("Part")

								if part then
									task.wait(enabled["Delay To Shovel Fruit"] or 0)
									gameEvents.Remove_Item:FireServer(part)
									task.wait(0.1)
								end
							end
						end
					end

					continue
				end

				break
			end

			task.wait(0.1)
		end)

		fn14("Auto Shovel Sprinkler", function()
			local Objects_Physical = modules.GetFarmPath("Objects_Physical")

			for _, child in pairs(Objects_Physical:GetChildren()) do
				if enabled["Auto Shovel Sprinkler"] then
					if child:IsA("Model") and table.find(enabled["Select Sprinkler  "], child.Name) then
						if localPlayer.Character:FindFirstChild("Shovel [Destroy Plants]") or toolFunction.EquipTool("Shovel [Destroy Plants]") then
							task.wait(enabled["Delay To Shovel Sprinkler"] or 0)
							gameEvents.DeleteObject:FireServer(child)
						end
					end

					continue
				end

				break
			end
		end)

		fn14("Auto Activate Crystal", function()
			local weatherVisuals = workspace:FindFirstChild("WeatherVisuals")
			weatherVisuals = weatherVisuals and weatherVisuals:FindFirstChild("CrystalBeams")
			if not weatherVisuals then
				return
			end

			for _, child in ipairs(weatherVisuals.Crystals:GetChildren()) do
				if child:IsA("BasePart") then
					local proximityPrompt = child:FindFirstChildWhichIsA("ProximityPrompt", true)

					if proximityPrompt and proximityPrompt.Enabled then
						modules.GetTo(child.CFrame)
						task.wait(0.25)
						fn6(proximityPrompt)
						break
					end
				end
			end
		end)

		fn14("Auto Favorite Tree", function()
			local v_6 = collection.GetPlantList1(modules.GetFarmPath("Plants_Physical"), {}, false, true)
			if #v_6 == 0 then
				return
			end

			for _, v_7 in v_6, nil, nil do
				if enabled["Auto Favorite Tree"] then
					if v_7 and table.find(enabled["Select Tree Favorite"], v_7.Name) and not v_7:GetAttribute("Favorited") then
						local tool = localPlayer.Character and localPlayer.Character:FindFirstChildWhichIsA("Tool")

						if tool and tool.Name:find("Favorite") then
							gameEvents.FavoriteToolRemote:InvokeServer(tool, v_7, true)
						else
							toolFunction.EquipTool_Find("Favorite")
						end
					end

					continue
				end

				break
			end

			task.wait(0.1)
		end)

		fn14("Auto UnFavorite Tree", function()
			local v_6 = collection.GetPlantList1(modules.GetFarmPath("Plants_Physical"), {}, false, true)
			if #v_6 == 0 then
				return
			end

			for _, v_7 in v_6, nil, nil do
				if enabled["Auto UnFavorite Tree"] then
					if v_7 and table.find(enabled["Select Tree Favorite"], v_7.Name) and v_7:GetAttribute("Favorited") then
						local tool = localPlayer.Character and localPlayer.Character:FindFirstChildWhichIsA("Tool")

						if tool and tool.Name:find("Favorite") then
							gameEvents.FavoriteToolRemote:InvokeServer(tool, v_7, false)
						else
							toolFunction.EquipTool_Find("Favorite")
						end
					end

					continue
				end

				break
			end

			task.wait(0.1)
		end)

		fn14("Auto Favorite Fruits", function()
			local v_6 = collection.GetPlantList1(modules.GetFarmPath("Plants_Physical"), {}, true, true)
			if #v_6 == 0 then
				return
			end

			for _, v_7 in ipairs(v_6) do
				if enabled["Auto Favorite Fruits"] then
					if v_7 and modules.FruitFilter({
						enabled["Select Fruits Favorite"],
						enabled["Select Mutation Favorite"],
						enabled["Select Variant Favorite"],
					}, v_7) and not v_7:GetAttribute("Favorited") then
						local weight = v_7:FindFirstChild("Weight")
						local weightThreshold = enabled["Weight Threshold "]

						if weightThreshold == 0 or weight and weight.Value and (enabled["Select Threshold Mode "] == "Above" and weight.Value > weightThreshold or weight.Value < weightThreshold) then
							local tool = localPlayer.Character and localPlayer.Character:FindFirstChildWhichIsA("Tool")

							if tool and tool.Name:find("Favorite") then
								gameEvents.FavoriteToolRemote:InvokeServer(tool, v_7, true)
							else
								toolFunction.EquipTool_Find("Favorite")
							end
						end
					end

					continue
				end

				break
			end

			task.wait(0.1)
		end)

		fn14("Auto UnFavorite Fruits", function()
			local v_6 = collection.GetPlantList1(modules.GetFarmPath("Plants_Physical"), {}, true, true)
			if #v_6 == 0 then
				return
			end

			for _, v_7 in ipairs(v_6) do
				if enabled["Auto UnFavorite Fruits"] then
					if v_7 and modules.FruitFilter({
						enabled["Select Fruits Favorite"],
						enabled["Select Mutation Favorite"],
						enabled["Select Variant Favorite"],
					}, v_7) and v_7:GetAttribute("Favorited") then
						local weight = v_7:FindFirstChild("Weight")
						local weightThreshold = enabled["Weight Threshold "]

						if weightThreshold == 0 or weight and weight.Value and (enabled["Select Threshold Mode "] == "Above" and weight.Value > weightThreshold or weight.Value < weightThreshold) then
							local tool = localPlayer.Character and localPlayer.Character:FindFirstChildWhichIsA("Tool")

							if tool and tool.Name:find("Favorite") then
								gameEvents.FavoriteToolRemote:InvokeServer(tool, v_7, false)
							else
								toolFunction.EquipTool_Find("Favorite")
							end
						end
					end

					continue
				end

				break
			end

			task.wait(0.1)
		end)

		fn14("Auto UnFavorite All Tree", function()
			local v_6 = collection.GetPlantList1(modules.GetFarmPath("Plants_Physical"), {}, false, true)
			if #v_6 == 0 then
				return
			end

			for _, v_7 in v_6, nil, nil do
				if enabled["Auto UnFavorite All Tree"] then
					if v_7 and v_7:GetAttribute("Favorited") then
						local tool = localPlayer.Character and localPlayer.Character:FindFirstChildWhichIsA("Tool")

						if tool and tool.Name:find("Favorite") then
							gameEvents.FavoriteToolRemote:InvokeServer(tool, v_7, false)
						else
							toolFunction.EquipTool_Find("Favorite")
						end
					end

					continue
				end

				break
			end

			task.wait(0.1)
		end)

		fn14("Auto UnFavorite All Fruits", function()
			local v_6 = collection.GetPlantList1(modules.GetFarmPath("Plants_Physical"), {}, true, true)
			if #v_6 == 0 then
				return
			end

			for _, v_7 in v_6, nil, nil do
				if enabled["Auto UnFavorite All Fruits"] then
					if v_7 and v_7:GetAttribute("Favorited") then
						local tool = localPlayer.Character and localPlayer.Character:FindFirstChildWhichIsA("Tool")

						if tool and tool.Name:find("Favorite") then
							gameEvents.FavoriteToolRemote:InvokeServer(tool, v_7, false)
						else
							toolFunction.EquipTool_Find("Favorite")
						end
					end

					continue
				end

				break
			end

			task.wait(0.1)
		end)

		fn14("Auto Equip Watering Can", function()
			local tool = localPlayer.Character:FindFirstChildWhichIsA("Tool")
			if tool and tool.Name:match("Watering Can") then
				return
			end

			for _, child in ipairs(localPlayer.Backpack:GetChildren()) do
				if child:IsA("Tool") and child.Name:match("Watering Can") and child:GetAttribute("b") == "o" then
					child.Parent = localPlayer.Character
					break
				end
			end
		end)

		fn14("Auto Water Fruits", function()
			task.wait(enabled["Delay to Water "] or 0.1)
			local Plants_Physical = modules.GetFarmPath("Plants_Physical")
			if not Plants_Physical then
				return
			end
			local tool = localPlayer.Character:FindFirstChildWhichIsA("Tool")

			for _, child in ipairs(Plants_Physical:GetChildren()) do
				if enabled["Auto Water Fruits"] then
					if tool and tool.Name:match("Watering Can") then
						if child:IsA("Model") and table.find(enabled["Select Water Fruits"], child.Name) then
							gameEvents.Water_RE:FireServer(child:GetPivot().Position)
							task.wait(0.15)
						end

						continue
					end
				end

				break
			end
		end)

		fn14("Auto Honey Compressor", function()
			if game.PlaceId == 129954712878723 then
				return
			end
			local beeEvent = workspace:FindFirstChild("BeeEvent", true)
			beeEvent = beeEvent and beeEvent:FindFirstChild("HoneyMachine2026")
			beeEvent = beeEvent and beeEvent:FindFirstChild("HoneyCompressor")
			if not beeEvent then
				return
			end
			local output = beeEvent and beeEvent:FindFirstChild("Output")
			output = output and output:FindFirstChild("CollectPrompt", true)
			beeEvent = beeEvent and beeEvent:FindFirstChild("Sign")
			beeEvent = beeEvent and beeEvent:FindFirstChild("TextLabel", true)
			if output and output.Enabled then
				gameEvents.HoneyMachine2026Service_RE:FireServer("CollectHoney")
				return
			end

			local function fn15(arg, arg2)
				local attributes = arg:GetAttributes()
				if not attributes then
					return false
				end

				for k in next, attributes, nil do
					if tostring(k):find(arg2) then
						return true
					end
				end

				return false
			end

			local flag = false

			for _, v_6 in localPlayer.Backpack:GetChildren() do
				if v_6:IsA("Tool") and v_6:GetAttribute("b") == "j" and fn15(v_6, "Pollinated") then
					flag = true
					break
				end
			end

			if not flag then
				return
			end

			if not beeEvent.Text:find("% Full") then
				return
			end
			gameEvents.HoneyMachine2026Service_RE:FireServer("SubmitAll")
			task.wait(0.1)
		end)

		fn14("ESP Bee Egg", function()
			for _, v_6 in workspace:GetChildren() do
				if v_6:IsA("BasePart") then
					if v_6.Name:find("Bee Egg") then
						local userId = localPlayer.UserId

						if v_6:GetAttribute("OwnerUserId") == userId then
							local attribute = v_6:GetAttribute("BeeName")

							if attribute then
								local esp2 = v_6:FindFirstChild("ESP")

								if not esp2 then
									esp.CreateESP(v_6, {
										Color = Color3.fromRGB(235, 169, 55),
										Text = attribute,
										Highlight = { Enabled = true, Color = Color3.fromRGB(235, 169, 55) },
									})
								else
									local billboardGui = esp2:FindFirstChild("BillboardGui", true)
									billboardGui = billboardGui and billboardGui:FindFirstChild("TextLabel")

									if billboardGui and billboardGui.Text ~= attribute then
										billboardGui.Text = attribute
									end
								end
							end
						end
					end
				end
			end

			task.wait(2)
		end)

		local tbl4 = {
			BeeCapacity = { MaxTier = 8 },
			BeeSpeed = { MaxTier = 4 },
			CompressorCapacity = { MaxTier = 4 },
			CompressorSpeed = { MaxTier = 4 },
			PollinationAmount = { MaxTier = 4 },
		}

		local tbl5 = {
			Wasp = { MaxHealth = 30 },
			["Razorsting Wasp"] = { MaxHealth = 30 },
			["Acidwing Wasp"] = { MaxHealth = 130 },
			["Dreadhorn Wasp"] = { MaxHealth = 350 },
			["Wasp King"] = { MaxHealth = 1000 },
			["Warsong Wasp"] = { MaxHealth = 150 },
			["Bloomvein Wasp"] = { MaxHealth = 100 },
			["Hiveburn Wasp"] = { MaxHealth = 180 },
			["Thunderbuzz Wasp"] = { MaxHealth = 210 },
			["Juggerhorn Wasp"] = { MaxHealth = 700 },
		}

		fn14("Instant Kill Wasp", function()
			local character = localPlayer.Character
			if not character then
				return
			end
			local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
			if not humanoidRootPart then
				return
			end
			local shovelDestroyPlants = character:FindFirstChild("Shovel [Destroy Plants]") or localPlayer.Backpack:FindFirstChild("Shovel [Destroy Plants]")
			shovelDestroyPlants = shovelDestroyPlants and shovelDestroyPlants:FindFirstChild("HitWasp")
			if not shovelDestroyPlants then
				return
			end
			local dataPing = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]
			local tbl6 = {}

			for _, child in ipairs(workspace:GetChildren()) do
				if child:IsA("BasePart") then
					local attribute = child:GetAttribute("BeeName")

					if not (not attribute or not attribute:find("Wasp")) then
						if not (child:GetAttribute("Health") <= 0) then
							local attribute2 = child:GetAttribute("BeeIdentifier")

							if attribute2 then
								table.insert(tbl6, {
									Part = child,
									Id = attribute2,
									Dist = (child.Position - humanoidRootPart.Position).Magnitude,
									Name = attribute,
								})
							end
						end
					end
				end
			end

			table.sort(tbl6, function(arg, arg2)
				return arg.Dist < arg2.Dist
			end)

			local n = 0

			for _, v_6 in tbl6, nil, nil do
				if n >= 5 then
					break
				end
				local part = v_6.Part
				local id = v_6.Id
				local name = v_6.Name
				local maxHealth = tbl5[name] and tbl5[name].MaxHealth or 100

				for i = 1, maxHealth do
					if dataPing:GetValue() >= 1000 then
						task.wait(dataPing:GetValue() / 1000)
					end

					if not part or not part.Parent then
						break
					end

					if part:GetAttribute("Health") == 0 then
						break
					end

					if not modules.IsAlive(localPlayer.Character) then
						return
					end
					shovelDestroyPlants:FireServer(id)
				end

				n += 1
			end

			task.wait(2)
		end)

		fn14("God Mode in Dungeon Wasp", function()
			if not modules.IsAlive(localPlayer.Character) then
				return
			end

			if localPlayer:GetAttribute("InWaspWaveSurvival") == true then
				task.wait(2)

				if not stored.Killed[localPlayer.UserId] then
					stored.Killed[localPlayer.UserId] = true
					localPlayer.Character.Humanoid.Health = 0
				end
			end
		end)

		fn14("Auto Enter Dungeon Wasp", function()
			if localPlayer:GetAttribute("InWaspWaveSurvival") == true then
				return
			end
			local waspDungeonPortal = workspace:FindFirstChild("WaspDungeonPortal", true)
			if not waspDungeonPortal then
				return
			end
			local rewardsAttachment = waspDungeonPortal:FindFirstChild("RewardsAttachment")
			rewardsAttachment = rewardsAttachment and rewardsAttachment:FindFirstChild("Timer")
			if not rewardsAttachment then
				return
			end
			local label = rewardsAttachment:FindFirstChild("Label")
			if not label then
				return
			end

			if label.Text == "READY FOR IGNITION" or label.Text == "READY" then
				gameEvents.WaspWaveSurvival.RequestStart:InvokeServer()
			end

			task.wait(1)
		end)

		fn14("Auto Exit/Claim Dungeon at 100 Wave", function()
			local response = gameEvents.WaspWaveSurvival.GetState:InvokeServer()
			if not response or type(response) ~= "table" then
				return
			end

			if not response.Active then
				return
			end

			if response.WavesCleared == 100 then
				gameEvents.WaspWaveSurvival.RequestClaim:FireServer()
				task.wait(0.5)
				gameEvents.WaspWaveSurvival.RequestExit:FireServer()
			end

			task.wait(2)
		end)

		fn14("Hop servers if no wasp is found", function()
			if workspace:FindFirstChild("WaspEgg") then
				return
			end

			if #workspace:FindFirstChild("LocalLootChests"):GetChildren() > 0 then
				return
			end
			task.wait(3)
			modules.Server_Hop.Hop()
		end)

		fn14("Auto Teleport To Wasp", function()
			local waspEgg = workspace:FindFirstChild("WaspEgg")
			if not waspEgg then
				return
			end

			if modules.GetMagnitude(waspEgg:GetPivot()) > 10 then
				modules.GetTo(waspEgg:GetPivot())
			end
		end)

		fn14("Auto Collect Chest", function()
			local localLootChests = workspace:FindFirstChild("LocalLootChests")
			if not localLootChests then
				return
			end

			for _, v_6 in localLootChests:QueryDescendants("ProximityPrompt") do
				if v_6.Enabled then
					v_6.HoldDuration = 0
					v_6.MaxActivationDistance = math.huge
					task.wait()
					fn6(v_6)
				end
			end
		end)

		fn14("Auto Upgrade Tree", function()
			for k, v_6 in next, tbl4, nil do
				local maxTier = v_6.MaxTier or 0

				if not (maxTier <= 0) then
					for i = 1, maxTier do
						gameEvents.BeeSkillTreeService.PurchaseUpgrade:InvokeServer(k, i)
						task.wait(0.1)
					end
				end
			end

			task.wait(1)
		end)

		local tbl6 = {
			["Common Bee Egg"] = 10,
			["Rare Bee Egg"] = 100,
			["Mythical Bee Egg"] = 500,
			["Transcendent Bee Egg"] = 5000,
		}

		fn14("Auto Buy Bee Egg Shop", function()
			local beeEvent = workspace:FindFirstChild("BeeEvent", true)
			local beeSwarmEggShop = beeEvent and beeEvent:FindFirstChild("BeeSwarmEggShop")
			beeSwarmEggShop = beeSwarmEggShop and beeSwarmEggShop:FindFirstChild("Nodes")
			if not beeSwarmEggShop then
				return
			end

			for _, v_6 in beeSwarmEggShop:GetChildren() do
				if v_6:IsA("Model") then
					local eggModel = v_6:FindFirstChild("EggModel", true)

					if eggModel then
						local eggInfo = eggModel and eggModel:FindFirstChild("EggInfo", true)

						if eggInfo then
							local item = eggInfo:FindFirstChild("Item")

							if item then
								local text = item.Text

								if table.find(enabled["Select Bee Egg Shop"], text) then
									local v_7 = tbl6[text]

									if v_7 and managers2:GetCurrentHoney() >= v_7 then
										gameEvents.BeeColonyEggShopService.BuyBeeEggStock:InvokeServer(text)
										task.wait(0.3)
									end
								end
							end
						end
					end
				end
			end

			task.wait(1)
		end)

		local tbl7 = {
			["Honey Carrot"] = 10,
			["Honey Strawberry"] = 50,
			["Honey Blueberry"] = 75,
			["Honey Buttercup"] = 250,
			["Honey Tomato"] = 100,
			["Honey Corn"] = 150,
			["Honey Daffodil"] = 400,
			["Honey Watermelon"] = 100,
			["Honey Pumpkin"] = 150,
			["Honey Apple"] = 600,
			["Honey Bamboo"] = 80,
			["Honey Coconut"] = 1500,
			["Honey Cactus"] = 2000,
			["Honey Dragon Fruit"] = 2750,
			["Honey Mango"] = 3500,
			["Honey Grape"] = 4500,
			["Honey Mushroom"] = 55,
			["Honey Pepper"] = 225,
			["Honey Cacao"] = 255,
			["Honey Sunflower"] = 300,
			["Honey Beanstalk"] = 335,
			["Honey Ember Lily"] = 355,
			["Honey Sugar Apple"] = 11000,
			["Honey Burning Bud"] = 16000,
			["Honey Giant Pinecone"] = 17000,
			["Honey Elder Strawberry"] = 18000,
			["Honey Romanesco"] = 22000,
			["Honey Crimson Thorn"] = 26000,
			["Honey Zebrazinkle"] = 32000,
			["Honey Octobloom"] = 38000,
			["Honey Alien Apple"] = 60000,
			["Honey Pollenvine"] = 20000,
		}

		local tbl8 = {
			["Honey Honey Daisy"] = 10,
			["Honey Honey Dew"] = 100,
			["Honey Hive Seed Pack"] = 2500,
			["Honey Ambercomb"] = 2000,
			["Pollen Radar 2026"] = 8,
			["Honey Coneflower"] = 2000,
			["Hive Egg"] = 2500,
			["Hive Crate"] = 3000,
			["Professor Bee"] = 2500,
			["Honey Birds of Paradise"] = 10000,
			["Honey Badger"] = 3500,
			["Honey Honey Hollow"] = 30000,
		}

		local tbl9 = {
			["Pollen Puffball"] = 25,
			["Grape Droplet"] = 75,
			["Carpenter Bee"] = 150,
			["Pet Shard RoyalJelly"] = 500,
			["Royal Jelly Fountain"] = 800,
			["King Bee"] = 1200,
			Pohutukawa = 2500,
		}

		fn14("Auto Buy Honey Seed Shop", function()
			local selectHoneySeedShop = enabled["Select Honey Seed Shop"]
			if not selectHoneySeedShop then
				return
			end

			for _, v_6 in selectHoneySeedShop, nil, nil do
				if enabled["Auto Buy Honey Seed Shop"] then
					if not (v_6 == "None" or v_6 == "") then
						local v_7 = tbl7[v_6]

						if v_7 then
							if v_6 == "Honey Carrot" then
								gameEvents.BuyEventShopStock:FireServer(v_6, "Honey Seed Shop")
							elseif v_7 <= managers2:GetCurrentHoney() then
								gameEvents.BuyEventShopStock:FireServer(v_6, "Honey Seed Shop")
							end
						end
					end

					continue
				end

				break
			end

			task.wait(1)
		end)

		fn14("Auto Buy Honey Coin Shop", function()
			local selectHoneyCoinShop = enabled["Select Honey Coin Shop"]
			if not selectHoneyCoinShop then
				return
			end

			for _, v_6 in selectHoneyCoinShop, nil, nil do
				if enabled["Auto Buy Honey Coin Shop"] then
					if not (v_6 == "None" or v_6 == "") then
						local v_7 = tbl8[v_6]

						if v_7 then
							if v_7 <= managers2:GetCurrentHoney() then
								gameEvents.BuyEventShopStock:FireServer(v_6, "Honey Coin Shop")
							end
						end
					end

					continue
				end

				break
			end

			task.wait(1)
		end)

		fn14("Auto Buy Royal Jelly Shop", function()
			local selectRoyalJellyShop = enabled["Select Royal Jelly Shop"]
			if not selectRoyalJellyShop then
				return
			end

			for _, v_6 in selectRoyalJellyShop, nil, nil do
				if enabled["Auto Buy Royal Jelly Shop"] then
					if not (v_6 == "None" or v_6 == "") then
						local v_7 = tbl9[v_6]

						if v_7 then
							if managers2:GetCurrentJelly() >= v_7 then
								gameEvents.BuyEventShopStock:FireServer(v_6, "Royal Jelly Shop")
							end
						end
					end

					continue
				end

				break
			end

			task.wait(1)
		end)

		local function fn15()
			local fallMarketModel = workspace:FindFirstChild("FallMarketModel", true)
			fallMarketModel = fallMarketModel and fallMarketModel:FindFirstChild("ProgressBillboard", true)
			local progressionLabel = fallMarketModel and fallMarketModel:FindFirstChild("ProgressionLabel", true)
			if not progressionLabel then
				return
			end
			return progressionLabel.Text:find("Cooldown") ~= nil
		end

		fn14("Auto Submit Fall Bloom", function()
			if fn15() then
				return
			end
			gameEvents.Events.FallMarketEvent.SubmitAllPlants:FireServer()
			task.wait(2)
		end)

		local function fn16()
			local fallMarketModel = workspace:FindFirstChild("FallMarketModel", true)
			fallMarketModel = fallMarketModel and fallMarketModel:FindFirstChild("BubbleBillboard", true)
			fallMarketModel = fallMarketModel and fallMarketModel:FindFirstChild("TextLabel", true)
			if not fallMarketModel then
				return
			end
			return (fallMarketModel.ContentText:gsub("The Heartseed needs ", ""):gsub(" plants!", ""))
		end

		fn14("Auto Collect Required Fruit", function()
			local plantTrait = managers2:GetPlantTrait(fn16())
			if not plantTrait then
				return
			end
			local tbl10 = {}

			for k in plantTrait, nil, nil do
				table.insert(tbl10, k)
			end

			if #tbl10 == 0 then
				return
			end
			local v_6 = collection.GetPlantList(modules.GetFarmPath("Plants_Physical"), {})

			for i = 1, #v_6 do
				if enabled["Auto Collect Required Fruit"] then
					if not toolFunction.IsMaxInventory() then
						local v_7 = v_6[i]

						if not v_7:GetAttribute("Favorited") and table.find(tbl10, v_7.Name) then
							gameEvents.Crops.Collect:FireServer({ v_7 })
							task.wait(0.02)
						end

						continue
					end
				end

				break
			end

			task.wait(1)
		end)

		fn14("Auto Buy Fall Shop", function()
			for _, v_6 in enabled["Select Fall Market Seed Shop"], nil, nil do
				gameEvents.BuyEventShopStock:FireServer(v_6, "Fall Market Seed Shop")
				task.wait(0.5)
			end

			for _, v_6 in enabled["Select Fall Market Gear Shop"], nil, nil do
				gameEvents.BuyEventShopStock:FireServer(v_6, "Fall Market Gear Shop")
				task.wait(0.5)
			end

			for _, v_6 in enabled["Select Fall Market Cosmetic Shop"], nil, nil do
				gameEvents.BuyEventShopStock:FireServer(v_6, "Fall Market Cosmetic Shop")
				task.wait(0.5)
			end

			for _, v_6 in enabled["Select Fall Market Pet Shop"], nil, nil do
				gameEvents.BuyEventShopStock:FireServer(v_6, "Fall Market Pet Shop")
				task.wait(0.5)
			end

			task.wait(2)
		end)

		local function fn17(arg)
			local insidePotFrame = arg and arg:FindFirstChild("InsidePotFrame", true)
			gameEvents.CookingPotService_RE:FireServer("EmptyPot", arg.Parent:GetAttribute("CosmeticUUID"))

			for _, child in ipairs(insidePotFrame:GetChildren()) do
				if child:IsA("Frame") then
					child:Destroy()
				end
			end
		end

		fn14("Auto Cook Pot", function()
			local Cosmetic_Physical = modules.GetFarmPath("Cosmetic_Physical")

			for _, child in ipairs(Cosmetic_Physical:GetChildren()) do
				if child:IsA("BasePart") then
					local cookingKit = child:FindFirstChild("Cooking Kit")

					if cookingKit then
						local insidePotFrame = cookingKit:FindFirstChild("InsidePotFrame", true)
						local cookButton = cookingKit:FindFirstChild("CookButton", true)
						cookButton = cookButton and cookButton:FindFirstChild("Button")
						local attribute = cookingKit.Parent:GetAttribute("CosmeticUUID")

						if not cached.ClearEmptyList[attribute] then
							fn17(cookingKit)
							cached.ClearEmptyList[attribute] = true
						end

						if cookButton and cookButton.Color == Color3.fromRGB(91, 154, 76) then
							local tbl10 = {}
							local flag = true

							for _, v_6 in next, {
								enabled["Ingredient 1"],
								enabled["Ingredient 2"],
								enabled["Ingredient 3"],
								enabled["Ingredient 4"],
								enabled["Ingredient 5"],
							}, nil do
								if v_6 and v_6 ~= "" and v_6 ~= "None" then
									tbl10[v_6] = (tbl10[v_6] or 0) + 1
									local v_7 = tbl10[v_6]
									local n = 0

									for _, child2 in ipairs(insidePotFrame:GetChildren()) do
										if child2:IsA("Frame") and child2.Name == v_6 then
											n += 1
										end
									end

									local n2 = v_7 - n

									if n2 > 0 then
										for _, child2 in ipairs(localPlayer.Backpack:GetChildren()) do
											if not (n2 <= 0) then
												if child2:IsA("Tool") and child2:GetAttribute("b") == "j" and not child2:GetAttribute("d") then
													local flag2 = child2:GetAttribute("f") == v_6

													if flag2 then
														flag2 = not enabled["Only Mutation Fruits"]

														if not flag2 then
															local fruitFilter = modules.FruitFilter
															local tbl11 = {}
															local mutationList = managers2:GetMutationList()
															tbl11[1] = {}
															tbl11[2] = mutationList
															tbl11[3] = {}
															flag2 = fruitFilter(tbl11, child2)
														end
													end

													if flag2 then
														localPlayer.Character.Humanoid:EquipTool(child2)
														task.wait(1)
														gameEvents.CookingPotService_RE:FireServer("SubmitHeldPlant", attribute)
														n2 -= 1
														task.wait(1)
													end
												end

												continue
											end

											break
										end
									end

									if n2 > 0 then
										flag = false
									end
								end
							end

							if flag then
								gameEvents.CookingPotService_RE:FireServer("CookBest", attribute)
								cached.ClearEmptyList[attribute] = false
							end
						end
					end
				end
			end

			task.wait(1)
		end)

		fn14("Auto Claim Cooked Pot", function()
			local Cosmetic_Physical = modules.GetFarmPath("Cosmetic_Physical")

			for _, child in ipairs(Cosmetic_Physical:GetChildren()) do
				if child:IsA("BasePart") then
					local cookingKit = child:FindFirstChild("Cooking Kit")

					if cookingKit then
						local getFoodProxPrompt = cookingKit and cookingKit:FindFirstChild("GetFoodProxPrompt", true)

						if getFoodProxPrompt and getFoodProxPrompt.Enabled then
							gameEvents.CookingPotService_RE:FireServer("GetFoodFromPot", cookingKit.Parent:GetAttribute("CosmeticUUID"))
						end
					end
				end
			end

			task.wait(1)
		end)

		fn14("Auto Mutations Pets", function()
			local character = localPlayer.Character
			local humanoid = character and character:FindFirstChildOfClass("Humanoid")
			local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
			if not character or not humanoid or not humanoidRootPart then
				return
			end

			if managers2:IsSwitchingActive() then
				return
			end
			local petMutationMachineProximityPromp = workspace:FindFirstChild("PetMutationMachineProximityPrompt", true)
			if not petMutationMachineProximityPromp or not petMutationMachineProximityPromp:IsA("ProximityPrompt") then
				return
			end
			local str2 = tostring(petMutationMachineProximityPromp.ActionText or "")
			local n = tonumber(enabled["Threshold Level Pet"]) or 100

			local function fn18(arg, ...)
				return pcall(function(...)
					arg:FireServer(...)
				end, ...)
			end

			local function fn19(arg)
				if not arg then
					return
				end

				local ok, result = pcall(function()
					return modules.DataClient.GetPet_Data(arg)
				end)

				if ok then
					return result
				end
			end

			local function fn20(arg, arg2)
				local petData = arg2 and arg2.PetData
				local num = nil

				if petData then
					num = tonumber(arg2.PetData.Level)
				end

				if not num and arg then
					num = tonumber(tostring(arg.Name):match("%[Age (%d+)%]"))
				end

				return num or 0
			end

			local function fn21(arg)
				if not arg:IsA("Tool") then
					return false
				end

				if arg:GetAttribute("b") ~= "l" then
					return false
				end

				if arg:GetAttribute("d") then
					return false
				end
				local attribute = arg:GetAttribute("PET_UUID")
				if not attribute then
					return false
				end
				local v_6 = fn19(attribute)
				if not v_6 or not v_6.PetType or not v_6.PetData then
					return false
				end
				local str3 = modules.API.Data.PetMutationsCode[v_6.PetData.MutationType or "N/A"] or "N/A"
				if not table.find(enabled["Select Pets Mutations"], v_6.PetType) then
					return false
				end

				if table.find(enabled["Prevent Mutations Pets"], str3) then
					return false
				end
				return true, attribute, v_6
			end

			if str2 == "Submit Pet" then
				local petsPhysical = workspace:FindFirstChild("PetsPhysical")

				if petsPhysical then
					for _, child in ipairs(petsPhysical:GetChildren()) do
						if enabled["Auto Mutations Pets"] then
							local name = localPlayer.Name

							if child:GetAttribute("OWNER") == name then
								local attribute = child:GetAttribute("UUID")

								if attribute then
									local v_6 = fn19(attribute)

									if not (not v_6 or not v_6.PetType or not v_6.PetData) then
										if table.find(enabled["Select Pets Mutations"], v_6.PetType) then
											if not table.find(enabled["Prevent Mutations Pets"], modules.API.Data.PetMutationsCode[v_6.PetData.MutationType or "N/A"] or "N/A") then
												if n <= fn20(nil, v_6) then
													if fn18(gameEvents.PetsService, "UnequipPet", attribute) then
														cached.PetMutations[attribute] = nil
														task.wait(0.25)
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
				end

				local flag = false

				for _, child in ipairs(localPlayer.Backpack:GetChildren()) do
					if enabled["Auto Mutations Pets"] then
						local v_6, v_7, v_8 = fn21(child)

						if not v_6 then
							continue
						elseif n <= fn20(child, v_8) then
							if pcall(function()
								humanoid:EquipTool(child)
							end) and child.Parent == character then
								task.wait(0.35)

								if fn18(gameEvents.PetMutationMachineService_RE, "SubmitHeldPet") then
									cached.PetMutations[v_7] = nil
									flag = true
									break
								else
									continue
								end
							else
								continue
							end
						else
							if enabled["Allows Switch Loadouts"] then
								local selectSlotForExpFarm = enabled["Select Slot (For EXP Farm)"]

								if selectSlotForExpFarm and selectSlotForExpFarm ~= "None" and not cached.PetMutations[v_7] then
									if managers2:FireSlotLoadout(selectSlotForExpFarm, "Delay To Switch") then
										cached.PetMutations[v_7] = { PetType = v_8.PetType, StartTime = tick() }
										task.wait(0.5)

										if fn18(gameEvents.PetsService, "EquipPet", v_7, humanoidRootPart.CFrame) then
											task.wait(0.5)
										end
									end
								end
							end

							continue
						end
					end

					break
				end

				if not flag and enabled["Allows Switch Loadouts"] then
					for k, petMutation in pairs(cached.PetMutations) do
						if enabled["Auto Mutations Pets"] then
							local v_6 = fn19(k)

							if v_6 and v_6.PetData then
								if n <= fn20(nil, v_6) then
									if fn18(gameEvents.PetsService, "UnequipPet", k) then
										cached.PetMutations[k] = nil
										task.wait(0.25)
									end
								end
							elseif tick() - (petMutation.StartTime or 0) > 300 then
								cached.PetMutations[k] = nil
							end

							continue
						end

						break
					end
				end
			elseif string.find(str2, "Start Mutation") then
				if managers2:IsSwitchingActive() then
					return
				end
				local flag = true

				if enabled["Allows Switch Loadouts"] then
					local selectSlotForMutationChamberBoos = enabled["Select Slot (For Mutation Chamber Boost)"]

					if selectSlotForMutationChamberBoos and selectSlotForMutationChamberBoos ~= "None" then
						flag = managers2:FireSlotLoadout(selectSlotForMutationChamberBoos, "Delay To Switch")
					end
				end

				if flag then
					task.wait(0.5)
					fn18(gameEvents.PetMutationMachineService_RE, "StartMachine")
				end
			elseif str2 == "Claim Pet" then
				if managers2:IsSwitchingActive() then
					return
				end
				local flag = true

				if enabled["Allows Switch Loadouts"] then
					local selectSlotForPhoenixTeam = enabled["Select Slot (For Phoenix Team)"]

					if selectSlotForPhoenixTeam and selectSlotForPhoenixTeam ~= "None" then
						flag = managers2:FireSlotLoadout(selectSlotForPhoenixTeam, "Delay To Switch")
					end
				end

				if flag then
					task.wait(0.5)

					if fn18(gameEvents.PetMutationMachineService_RE, "ClaimMutatedPet") then
						task.wait(0.5)
					end
				end
			end

			task.wait(0.5)
		end)

		fn14("Auto Boost Pets", function()
			local petsPhysical = workspace:FindFirstChild("PetsPhysical")
			if not petsPhysical then
				return
			end
			local tbl10 = {}

			for _, v_6 in enabled["Select Pets Boost"], nil, nil do
				tbl10[v_6] = true
			end

			local tbl11 = {}

			for _, v_6 in enabled["Select Boost Item"], nil, nil do
				tbl11[v_6] = true
			end

			local v_6 = toolFunction.GetAllTool()

			for _, v_7 in petsPhysical:GetChildren() do
				local name = localPlayer.Name

				if v_7:GetAttribute("OWNER") == name then
					if v_7:FindFirstChildWhichIsA("Model") then
						local attribute = v_7:GetAttribute("UUID")
						local petFromUUID = managers2:GetPetFromUUID(attribute)

						if petFromUUID then
							if tbl10[petFromUUID .. " " .. attribute] then
								local v_8 = modules.DataClient.GetPet_BoostData(attribute)

								if v_8 then
									for _, v_9 in v_6, nil, nil do
										if enabled["Auto Boost Pets"] then
											if v_9:IsA("Tool") then
												if v_9:GetAttribute("b") == "z" then
													if tbl11[v_9.Name:gsub(" x%d+", ""):gsub("%[.+%]", ""):gsub(" Pet ", " ")] then
														local attribute2 = v_9:GetAttribute("q")
														local attribute3 = v_9:GetAttribute("r")

														if not (not attribute2 or not attribute3) then
															local v_10 = modules.BoostStats[attribute2]
															local amount = v_10 and v_10.Amount and v_10.Amount[attribute3]

															if amount then
																local flag = true

																for _, v_11 in v_8, nil, nil do
																	if v_11.BoostType == attribute2 and v_11.BoostAmount == amount then
																		flag = false
																		break
																	end
																end

																if flag then
																	localPlayer.Character.Humanoid:EquipTool(v_9)
																	gameEvents.PetBoostService:FireServer("ApplyBoost", attribute)
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
								end
							end
						end
					end
				end
			end

			task.wait(1)
		end)

		fn14("Auto Maple Syrup Pets", function()
			local petsPhysical = workspace:FindFirstChild("PetsPhysical")
			if not petsPhysical then
				return
			end
			local selectPetsMaple = enabled["Select Pets Maple"]

			for _, child in ipairs(petsPhysical:GetChildren()) do
				local name = localPlayer.Name

				if child:GetAttribute("OWNER") == name then
					local attribute = child:GetAttribute("UUID")
					local petFromUUID = managers2:GetPetFromUUID(attribute)

					if petFromUUID and table.find(selectPetsMaple, petFromUUID .. " " .. attribute) then
						local tool = localPlayer.Character and localPlayer.Character:FindFirstChildWhichIsA("Tool")

						if tool and tool.Name:find("Maple Syrup") then
							gameEvents.TryMapleSyrup:FireServer(child[attribute])
						else
							toolFunction.EquipTool_Find("Maple Syrup")
						end
					end
				end
			end

			task.wait(2)
		end)

		fn14("Auto Ascension", function()
			local rebirthConfirmation = playerGui:FindFirstChild("RebirthConfirmation")
			if not rebirthConfirmation then
				return
			end
			local confirm = rebirthConfirmation:FindFirstChild("Confirm", true)

			if confirm and confirm.Visible and confirm.Image ~= "rbxassetid://104713419928195" then
				local multiplierAscension = enabled["Multiplier Ascension"] or 1

				for i = 1, multiplierAscension do
					gameEvents.BuyRebirth:FireServer()
				end
			end

			task.wait(1)
		end)

		fn14("Auto Find Marmot Mound", function()
			for _, child in ipairs(workspace:GetChildren()) do
				if child.Name == "Marmot Mound" then
					local position

					if child:IsA("BasePart") then
						position = child.Position
					else
						position = nil

						if child:IsA("Model") then
							position = child:GetPivot().Position
						end
					end

					if position then
						modules.GetTo(CFrame.new(position))
					end
				end
			end

			task.wait(1)
		end)

		fn14("Auto Find Acorn", function()
			for _, child in ipairs(workspace:GetChildren()) do
				if child.Name == "Acorn" then
					local position

					if child:IsA("BasePart") then
						position = child.Position
					else
						position = nil

						if child:IsA("Model") then
							position = child:GetPivot().Position
						end
					end

					if position then
						modules.GetTo(CFrame.new(position))
					end
				end
			end

			task.wait(1)
		end)

		fn14("Auto Find Camel", function()
			for _, child in ipairs(workspace:GetChildren()) do
				if child.Name == "Camel" then
					local position

					if child:IsA("BasePart") then
						position = child.Position
					else
						position = nil

						if child:IsA("Model") then
							position = child:GetPivot().Position
						end
					end

					if position then
						modules.GetTo(CFrame.new(position))
					end
				end
			end

			task.wait(1)
		end)

		fn14("Auto Craft", function()
			if stored.Pet_Switcher["Selling Pet"] or stored.Pet_Switcher["Place Egg"] or stored.Pet_Switcher["Stop Switch"] then
				return
			end
			local v_6 = modules.API.Craft[enabled["Select Gear Recipes"]]
			local v_7 = modules.API.Craft[enabled["Select Seed Recipes"]]
			local craftingTables = workspace:FindFirstChild("CraftingTables", true) or workspace.Interaction.UpdateItems:FindFirstChild("CraftingTables", true)

			if v_6 and v_6.MachineTypes and v_6.MachineTypes[1] == "GearEventWorkbench" then
				managers2:ProgressCraft("Auto Craft", "GearEventWorkbench", craftingTables.EventCraftingWorkBench, v_6, enabled["Select Gear Recipes"])
			end

			if v_7 and v_7.MachineTypes and v_7.MachineTypes[1] == "SeedEventWorkbench" then
				managers2:ProgressCraft("Auto Craft", "SeedEventWorkbench", craftingTables.SeedEventCraftingWorkBench, v_7, enabled["Select Seed Recipes"])
			end
		end)

		fn14("Auto Gift Player", function()
			for _, v_6 in ipairs(toolFunction.GetAllTool()) do
				if enabled["Auto Gift Player"] then
					if v_6:IsA("Tool") and v_6.Name:match("Player Gift") then
						for _, child in ipairs(Players:GetChildren()) do
							if child ~= localPlayer and table.find(enabled["Select Players "], child.Name) then
								localPlayer.Character.Humanoid:EquipTool(v_6)
								task.wait(0.5)
								gameEvents.TryUseGear:FireServer("Player Gift", vplr)
								break
							end
						end
					end

					continue
				end

				break
			end

			task.wait(1)
		end)

		fn14("Auto Gift All Player", function()
			for _, v_6 in ipairs(toolFunction.GetAllTool()) do
				if enabled["Auto Gift All Player"] then
					if v_6:IsA("Tool") and v_6.Name:match("Player Gift") then
						for _, child in ipairs(Players:GetChildren()) do
							if child ~= localPlayer then
								localPlayer.Character.Humanoid:EquipTool(v_6)
								task.wait(0.5)
								gameEvents.TryUseGear:FireServer("Player Gift", child)
							end
						end
					end

					continue
				end

				break
			end

			task.wait(1)
		end)

		fn14("Auto Give Fruits To Player", function()
			local n = tonumber(enabled["Delay To Gift"]) or 0.1
			if not customDelay:Expired("Auto Give Fruits To Player") then
				return
			end
			customDelay:Set("Auto Give Fruits To Player", n)
			local v_6 = Players and Players:FindFirstChild(enabled["Select Players"])
			if not v_6 then
				return
			end
			local character = v_6.Character
			if not character then
				return
			end
			local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
			local proximityPrompt = humanoidRootPart and humanoidRootPart:FindFirstChildWhichIsA("ProximityPrompt")
			if humanoidRootPart and modules.GetMagnitude(humanoidRootPart.CFrame) > 10 then
				modules.GetTo(humanoidRootPart.CFrame)
				return
			end

			if proximityPrompt and proximityPrompt.Enabled then
				fn6(proximityPrompt)
				return
			end
			local backpack = localPlayer:FindFirstChild("Backpack")
			local character2 = localPlayer.Character
			local humanoid = character2 and character2:FindFirstChild("Humanoid")
			if not (backpack and humanoid) then
				return
			end

			for _, child in ipairs(backpack:GetChildren()) do
				if child:IsA("Tool") then
					if modules.FruitFilter({ enabled["Select Fruits Trade"], enabled["Select Mutation Trade"], enabled["Select Variant Trade"] }, child) then
						humanoid:EquipTool(child)
						task.wait(0.1)
						if not character2:FindFirstChild(child.Name) then
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
		end)

		fn14("Auto Give Favourited Fruits To Player", function()
			local n = tonumber(enabled["Delay To Gift"]) or 0.1
			if not customDelay:Expired("Auto Give Favourited Fruits To Player") then
				return
			end
			customDelay:Set("Auto Give Favourited Fruits To Player", n)
			local v_6 = Players and Players:FindFirstChild(enabled["Select Players"])
			if not v_6 then
				return
			end
			local character = v_6.Character
			if not character then
				return
			end
			local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
			local proximityPrompt = humanoidRootPart and humanoidRootPart:FindFirstChildWhichIsA("ProximityPrompt")
			if humanoidRootPart and modules.GetMagnitude(humanoidRootPart.CFrame) > 10 then
				modules.GetTo(humanoidRootPart.CFrame)
				return
			end

			if proximityPrompt and proximityPrompt.Enabled then
				fn6(proximityPrompt)
				return
			end
			local backpack = localPlayer:FindFirstChild("Backpack")
			local character2 = localPlayer.Character
			local humanoid = character2 and character2:FindFirstChild("Humanoid")
			if not (backpack and humanoid) then
				return
			end

			for _, child in ipairs(backpack:GetChildren()) do
				if child:IsA("Tool") then
					if child:GetAttribute("d") then
						humanoid:EquipTool(child)
						task.wait(0.1)
						if not character2:FindFirstChild(child.Name) then
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
		end)

		fn14("Auto Give Pet To Players", function()
			local n = tonumber(enabled["Delay To Give"]) or 0.1
			if not customDelay:Expired("Auto Give Pet To Players") then
				return
			end
			customDelay:Set("Auto Give Pet To Players", n)
			local v_6 = Players and Players:FindFirstChild(enabled["Select Players"])
			if not v_6 then
				return
			end
			local character = localPlayer.Character
			if not character then
				return
			end
			local choosePets = enabled["Choose Pets"]
			local n2 = tonumber(enabled["Age Threshold   "]) or 0
			local n3 = tonumber(enabled["Weights Threshold   "]) or 0
			local selectThresholdMode = enabled["Select Threshold Mode   "]

			for _, child in ipairs(localPlayer.Backpack:GetChildren()) do
				if child:IsA("Tool") and not child:GetAttribute("d") then
					local str2 = child.Name:gsub("%b[]", ""):gsub("^%s*(.-)%s*$", "%1")

					if table.find(choosePets, str2) then
						local num = tonumber(child.Name:match("%[(.-) KG%]") or "")
						local num2 = tonumber(child.Name:match("%[Age (%d+)%]") or "")

						if (n3 == 0 or num and (selectThresholdMode == "Above" and num > n3 or num < n3)) and (n2 == 0 or num2 and (selectThresholdMode == "Above" and num2 > n2 or num2 < n2)) then
							repeat
								task.wait()
								character.Humanoid:EquipTool(child)
							until character:FindFirstChild(child.Name)

							if character:FindFirstChild(child.Name) then
								gameEvents.PetGiftingService:FireServer("GivePet", v_6)
								break
							end
						end
					end
				end
			end
		end)

		fn14("Auto Accept Trade", function()
			local n = tonumber(enabled["Delay To Accept"]) or 0.1
			if not customDelay:Expired("Auto Accept Trade") then
				return
			end
			customDelay:Set("Auto Accept Trade", n)
			local accept = playerGui:WaitForChild("Gift_Notification"):FindFirstChild("Accept", true)

			if accept then
				modules.ClickUI(accept)
			end

			task.wait(0.1)
		end)

		fn14("Enable Move Plants", function()
			local character = localPlayer.Character
			local primaryPart = character and character.PrimaryPart
			if not primaryPart then
				return
			end
			local Plants_Physical = modules.GetFarmPath("Plants_Physical")
			if not Plants_Physical then
				return
			end
			local selectMovePlants = enabled["Select Move Plants"]
			local flag = enabled["Select Position Move Plants"] == "Player Position"

			for _, child in ipairs(Plants_Physical:GetChildren()) do
				if not enabled["Enable Move Plants"] then
					break
				end

				if table.find(selectMovePlants, child.Name) then
					local position = flag and primaryPart.Position or managers2:GetRandomPlant()
					if not position then
						return
					end

					for _, v_6 in child:QueryDescendants("BasePart") do
						v_6.CanCollide = false
					end

					local tool = localPlayer.Character and localPlayer.Character:FindFirstChildWhichIsA("Tool")

					if tool and tool.Name:find("Trowel") then
						pcall(function()
							gameEvents.TrowelRemote:InvokeServer("Pickup", tool, child)
							gameEvents.TrowelRemote:InvokeServer("Place", tool, child, CFrame.new(position))
						end)
					else
						toolFunction.EquipTool_Find("Trowel")
					end
				end
			end

			task.wait(0.5)
		end)

		fn14("Auto Move Plants To Pets", function()
			local character = localPlayer.Character
			if not character or not character.PrimaryPart then
				return
			end
			local Plants_Physical = modules.GetFarmPath("Plants_Physical")
			if not Plants_Physical then
				return
			end
			local selectMovePlants = enabled["Select Move Plants  "]
			local tbl10 = {}

			for _, child in ipairs(Plants_Physical:GetChildren()) do
				if child.Name == selectMovePlants then
					tbl10[#tbl10 + 1] = child
				end
			end

			if #tbl10 == 0 then
				return
			end
			local petPosition = managers2:GetPetPosition(enabled["Select Pets   "], enabled["Allow Move Plants to Pets If Passive is ready"])
			if #petPosition == 0 then
				return
			end

			if not (toolFunction.IsEquipped(false, "Holdable") or toolFunction.Equip(false, "Holdable")) then
				return
			end

			for _, v_6 in ipairs(tbl10) do
				for _, v_7 in v_6:QueryDescendants("BasePart") do
					if v_7.CanCollide then
						v_7.CanCollide = false
					end
				end

				for _, v_7 in petPosition, nil, nil do
					local tool = localPlayer.Character and localPlayer.Character:FindFirstChildWhichIsA("Tool")

					if tool and tool.Name:find("Trowel") then
						pcall(function()
							gameEvents.TrowelRemote:InvokeServer("Pickup", tool, v_6)
							local random = math.random
							gameEvents.TrowelRemote:InvokeServer("Place", tool, v_6, v_7.CFrame + Vector3.new(math.random(-5, 5), 0, random(-5, 5)))
						end)
					else
						toolFunction.EquipTool_Find("Trowel")
					end
				end
			end
		end)

		fn14("Auto Reclaimer Plants", function()
			local v_6 = collection.GetPlantList1(modules.GetFarmPath("Plants_Physical"), {}, false)
			if #v_6 == 0 then
				return
			end

			for _, v_7 in v_6, nil, nil do
				if v_7 and table.find(enabled["Select Plants Reclaimer"], v_7.Name) and not v_7:GetAttribute("Favorited") then
					local tool = localPlayer.Character and localPlayer.Character:FindFirstChildWhichIsA("Tool")

					if tool and tool.Name:find("Reclaimer") then
						gameEvents.ReclaimerService_RE:FireServer("TryReclaim", v_7)
					else
						toolFunction.EquipTool_Find("Reclaimer")
					end
				end
			end
		end)

		fn14("Auto Cleaning Spray Fruits", function()
			for _, v_6 in collection.GetPlantList(modules.GetFarmPath("Plants_Physical"), {}, true), nil, nil do
				if v_6 and modules.FruitFilter({ enabled["Select Fruits Cleaning Spray"], enabled["Select Mutations Cleaning Spray"], {} }, v_6) then
					local tool = localPlayer.Character and localPlayer.Character:FindFirstChildWhichIsA("Tool")

					if tool and tool.Name:find("Cleaning Spray") then
						gameEvents.SprayService_RE:FireServer("TrySpray", v_6)
					else
						toolFunction.EquipTool_Find("Cleaning Spray")
					end
				end
			end

			task.wait(2)
		end)

		fn14("Auto Spray Fruits", function()
			for _, v_6 in collection.GetPlantList(modules.GetFarmPath("Plants_Physical"), {}, true), nil, nil do
				if enabled["Auto Spray Fruits"] then
					if v_6 and modules.FruitFilter({ enabled["Select Fruits Mutations Spray"], {}, {} }, v_6) then
						for _, v_7 in toolFunction.GetAllTool() do
							if v_7:IsA("Tool") and v_7:GetAttribute("b") == "s" then
								if v_7:GetAttribute("l") == "Mutation Spray" and table.find(enabled["Select Spray Mutations"], v_7:GetAttribute("m")) then
									localPlayer.Character.Humanoid:EquipTool(v_7)
									task.wait(0.5)
									gameEvents.SprayService_RE:FireServer("TrySpray", v_6)
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

		fn14("Auto Open Seedpack", function()
			local selectSeedPack = not table.find(enabled["Select Seed Pack"], "All") and enabled["Select Seed Pack"]

			local function fn18(arg)
				local v_6 = toolFunction.IsEquipped(arg, "Seed Pack") or toolFunction.Equip(arg, "Seed Pack")

				if v_6 then
					v_6:Activate()
				end
			end

			if not selectSeedPack then
				fn18(false)
			else
				for i = 1, #selectSeedPack do
					fn18(selectSeedPack[i])
				end
			end
		end)

		utils.Connections(heartbeat, function()
			if enabled["Auto Skipper At Rarity"] then
				local spinnerClosest = managers2:GetSpinnerClosest()

				if spinnerClosest then
					local night = spinnerClosest.Night
					local normal = spinnerClosest.Normal
					local rainbow = spinnerClosest.Rainbow

					if table.find(enabled["Select Rarity Seed "], night.Rarity.Text ~= "EPIC" and night.Rarity.Text or normal.Rarity.Text ~= "EPIC" and normal.Rarity.Text or rainbow.Rarity.Text ~= "EPIC" and rainbow.Rarity.Text) then
						modules.ClickUI(playerGui.RollCrate_UI.Frame.Skip)
					end
				end
			end
		end)

		local flag = false

		fn14("Auto Hop Until Found Crate Has Items  ", function()
			local Objects_Physical = modules.GetFarmPath("Objects_Physical")
			if not Objects_Physical then
				return
			end
			local v_6 = modules.DataClient.GetSaved_Data()
			if not v_6 then
				return
			end

			for _, v_7 in Objects_Physical:GetChildren() do
				local name = localPlayer.Name

				if v_7:GetAttribute("OWNER") == name and v_7:GetAttribute("CrateType") and v_7:GetAttribute("TimeToOpen") <= 0 then
					local v_8 = v_6[v_7:GetAttribute("OBJECT_UUID")]

					if v_8 then
						local cosmeticType = v_8.Data.CosmeticType

						if table.find(enabled["Select Items  "], cosmeticType) then
							local setNotification = shx.SetNotification
							local v_9 = shx
							local tbl10 = {}
							local attribute = v_7:GetAttribute("CrateType") or "?"
							tbl10[1] = "Speed Hub X"
							tbl10[2] = ""
							tbl10[3] = "Found!, Crate : " .. attribute .. " | Items: " .. cosmeticType
							tbl10[4] = 5
							tbl10[5] = 0.5
							setNotification(v_9, tbl10)
							flag = true
							return
						end

						if not flag then
							task.delay(5, function()
								if Players.MaxPlayers <= #Players:GetPlayers() then
									if not pcall(TeleportService.Teleport, TeleportService, game.PlaceId) then
										modules.Server_Hop.Hop()
									end
								else
									pcall(TeleportService.Teleport, TeleportService, game.PlaceId)
								end
							end)
						end
					end
				end
			end

			task.wait(2)
		end)

		fn14("Auto Open If Found Crate Has Items  ", function()
			local Objects_Physical = modules.GetFarmPath("Objects_Physical")
			if not Objects_Physical then
				return
			end
			local v_6 = modules.DataClient.GetSaved_Data()
			if not v_6 then
				return
			end

			for _, child in ipairs(Objects_Physical:GetChildren()) do
				local name = localPlayer.Name

				if child:GetAttribute("OWNER") == name and child:GetAttribute("CrateType") and child:GetAttribute("TimeToOpen") <= 0 then
					local v_7 = v_6[child:GetAttribute("OBJECT_UUID")]

					if v_7 then
						if table.find(enabled["Select Items  "], v_7.Data.CosmeticType) then
							gameEvents.CosmeticCrateService:FireServer("OpenCrate", child)
							return
						end
					end
				end
			end

			task.wait(2)
		end)

		fn14("Auto Favourite Fruits", function()
			for _, v_6 in ipairs(toolFunction.GetAllTool()) do
				if v_6:IsA("Tool") and v_6:GetAttribute("b") == "j" and not v_6:GetAttribute("d") then
					local weight = v_6:FindFirstChild("Weight")
					local thresholdWeight = enabled["Threshold Weight   "]
					local flag2 = not weight or not thresholdWeight or thresholdWeight == "" or thresholdWeight == 0 or enabled["Threshold Weight Mode  "] == "Above" and weight.Value > thresholdWeight or weight.Value < thresholdWeight

					if modules.FruitFilter({
						enabled["Select Fruits Favourite"],
						enabled["Select Mutations Favorite"],
						enabled["Select Variant Favorite"],
					}, v_6) and flag2 then
						gameEvents.Favorite_Item:FireServer(v_6)
					end
				end
			end

			task.wait(1)
		end)

		fn14("Auto UnFavourite Fruits", function()
			if not localPlayer:FindFirstChild("Backpack") then
				return
			end

			for _, v_6 in ipairs(toolFunction.GetAllTool()) do
				if v_6:IsA("Tool") and v_6:GetAttribute("b") == "j" and v_6:GetAttribute("d") then
					local weight = v_6:FindFirstChild("Weight")
					local thresholdWeight = enabled["Threshold Weight   "]
					local flag2 = not weight or not thresholdWeight or thresholdWeight == "" or thresholdWeight == 0 or enabled["Threshold Weight Mode  "] == "Above" and weight.Value > thresholdWeight or weight.Value < thresholdWeight

					if modules.FruitFilter({
						enabled["Select Fruits Favourite"],
						enabled["Select Mutations Favorite"],
						enabled["Select Variant Favorite"],
					}, v_6) and flag2 then
						gameEvents.Favorite_Item:FireServer(v_6)
					end
				end
			end

			task.wait(1)
		end)

		fn14("Auto Favourite / UnFavourite Fruits", function()
			if not localPlayer:FindFirstChild("Backpack") then
				return
			end

			for _, v_6 in ipairs(toolFunction.GetAllTool()) do
				if v_6:IsA("Tool") and v_6:GetAttribute("b") == "j" then
					local weight = v_6:FindFirstChild("Weight")
					local thresholdWeight = enabled["Threshold Weight   "]
					local thresholdWeightMode = enabled["Threshold Weight Mode  "]
					local flag2 = not weight or not thresholdWeight or thresholdWeight == "" or thresholdWeight == 0
					local flag3

					if flag2 then
						flag3 = flag2
					else
						flag3 = thresholdWeightMode == "Above" and weight.Value > thresholdWeight
					end

					flag3 = flag3 or weight.Value < thresholdWeight

					flag3 = modules.FruitFilter({
						enabled["Select Fruits Favourite"],
						enabled["Select Mutations Favorite"],
						enabled["Select Variant Favorite"],
					}, v_6) and flag3

					if flag3 then
						gameEvents.Favorite_Item:FireServer(v_6)
						task.wait(0.5)
					end
				end
			end

			task.wait(1)
		end)

		fn14("Auto UnFavourite All Fruits", function()
			for _, v_6 in ipairs(toolFunction.GetAllTool()) do
				if v_6:IsA("Tool") and v_6:GetAttribute("b") == "j" and v_6:GetAttribute("d") then
					gameEvents.Favorite_Item:FireServer(v_6)
				end
			end

			task.wait(1)
		end)

		fn14("Auto Favourite Pets", function()
			local n = tonumber(enabled["Age Threshold     "]) or 0
			local n2 = tonumber(enabled["Weights Threshold     "]) or 0
			local selectThresholdMode = enabled["Select Threshold Mode     "]

			for _, child in ipairs(localPlayer.Backpack:GetChildren()) do
				if child:IsA("Tool") and not child:GetAttribute("d") then
					local str2 = child.Name:gsub("%b[]", ""):gsub("^%s*(.-)%s*$", "%1")

					if table.find(enabled["Select Pets Favourite"], str2) then
						local num = tonumber(child.Name:match("%[(.-) KG%]") or "")
						local num2 = tonumber(child.Name:match("%[Age (%d+)%]") or "")

						if (n2 == 0 or num and (selectThresholdMode == "Above" and num > n2 or num < n2)) and (n == 0 or num2 and (selectThresholdMode == "Above" and num2 > n or num2 < n)) then
							gameEvents.Favorite_Item:FireServer(child)
						end
					end
				end
			end

			task.wait(1)
		end)

		fn14("Auto UnFavourite Pets", function()
			local n = tonumber(enabled["Age Threshold     "]) or 0
			local n2 = tonumber(enabled["Weights Threshold     "]) or 0
			local selectThresholdMode = enabled["Select Threshold Mode     "]

			for _, child in ipairs(localPlayer.Backpack:GetChildren()) do
				if child:IsA("Tool") and child:GetAttribute("d") then
					local str2 = child.Name:gsub("%b[]", ""):gsub("^%s*(.-)%s*$", "%1")

					if table.find(enabled["Select Pets Favourite"], str2) then
						local num = tonumber(child.Name:match("%[(.-) KG%]") or "")
						local num2 = tonumber(child.Name:match("%[Age (%d+)%]") or "")
						local flag2 = n2 == 0

						if not flag2 then
							if num then
								flag2 = selectThresholdMode == "Above" and num > n2 or num < n2
							else
								flag2 = num
							end
						end

						if flag2 and (n == 0 or num2 and (selectThresholdMode == "Above" and num2 > n or num2 < n)) then
							gameEvents.Favorite_Item:FireServer(child)
						end
					end
				end
			end

			task.wait(1)
		end)

		fn14("Auto Favourite / UnFavourite Pets", function()
			local n = tonumber(enabled["Age Threshold     "]) or 0
			local n2 = tonumber(enabled["Weights Threshold     "]) or 0
			local selectThresholdMode = enabled["Select Threshold Mode     "]

			for _, child in ipairs(localPlayer.Backpack:GetChildren()) do
				if child:IsA("Tool") then
					local str2 = child.Name:gsub("%b[]", ""):gsub("^%s*(.-)%s*$", "%1")

					if table.find(enabled["Select Pets Favourite"], str2) then
						local num = tonumber(child.Name:match("%[(.-) KG%]") or "")
						local num2 = tonumber(child.Name:match("%[Age (%d+)%]") or "")
						local flag2 = n2 == 0 or num and (selectThresholdMode == "Above" and num > n2 or num < n2)
						local flag3 = n == 0

						if flag3 then
							num2 = flag3
						elseif num2 then
							num2 = selectThresholdMode == "Above" and num2 > n or num2 < n
						end

						if flag2 and num2 then
							gameEvents.Favorite_Item:FireServer(child)
							task.wait(0.5)
						end
					end
				end
			end

			task.wait(1)
		end)

		fn14("Auto UnFavourite All Pets", function()
			for _, child in ipairs(localPlayer.Backpack:GetChildren()) do
				if child:IsA("Tool") and child:GetAttribute("b") == "l" and child:GetAttribute("d") then
					gameEvents.Favorite_Item:FireServer(child)
				end
			end

			task.wait(1)
		end)

		fn14("Auto Buy Seeds", function()
			local v_6 = shop.GetStockGeneric(playerGui.Seed_Shop.Frame.ScrollingFrame, "Normal", enabled["Select Seed "])

			if v_6 then
				gameEvents.BuySeedStock:FireServer("Shop", v_6)
			end
		end)

		fn14("Auto Buy All Seeds", function()
			local v_6 = shop.GetStockGeneric(playerGui.Seed_Shop.Frame.ScrollingFrame, "Normal", "no")

			if v_6 then
				gameEvents.BuySeedStock:FireServer("Shop", v_6)
			end
		end)

		fn14("Auto Buy Best Seeds", function()
			local v_6 = shop.GetStockGeneric(playerGui.Seed_Shop.Frame.ScrollingFrame, "Best", "no")

			if v_6 then
				gameEvents.BuySeedStock:FireServer("Shop", v_6)
			end
		end)

		fn14("Auto Buy Dailys Deals", function()
			for _, v_6 in next, enabled["Select Dailys Deals"], nil do
				gameEvents.BuyDailySeedShopStock:FireServer(v_6)
				task.wait(0.5)
			end

			task.wait(1)
		end)

		fn14("Auto Buy Pass Season", function()
			for _, v_6 in enabled["Select Pass Season"], nil, nil do
				gameEvents.SeasonPass.BuySeasonPassStock:FireServer(v_6)
			end

			task.wait(1)
		end)

		fn14("Auto Buy Eggs", function()
			local v_6 = shop.GetStockGeneric(playerGui.PetShop_UI.Frame.ScrollingFrame, "Normal", enabled["Select Eggs  "])

			if v_6 then
				gameEvents.BuyPetEgg:FireServer(v_6)
			end

			task.wait(0.5)
		end)

		fn14("Auto Buy All Eggs", function()
			local v_6 = shop.GetStockGeneric(playerGui.PetShop_UI.Frame.ScrollingFrame, "Normal", "no")

			if v_6 then
				gameEvents.BuyPetEgg:FireServer(v_6)
			end
		end)

		fn14("Auto Buy Best Eggs", function()
			local v_6 = shop.GetStockGeneric(playerGui.PetShop_UI.Frame.ScrollingFrame, "Best", "no")

			if v_6 then
				gameEvents.BuyPetEgg:FireServer(v_6)
			end
		end)

		fn14("Auto Buy Gears", function()
			local v_6 = shop.GetStockGeneric(playerGui.Gear_Shop.Frame.ScrollingFrame, "Normal", enabled["Select Gears"])

			if v_6 then
				gameEvents.BuyGearStock:FireServer(v_6)
			end
		end)

		fn14("Auto Buy All Gears", function()
			local v_6 = shop.GetStockGeneric(playerGui.Gear_Shop.Frame.ScrollingFrame, "Normal", "no")

			if v_6 then
				gameEvents.BuyGearStock:FireServer(v_6)
			end
		end)

		fn14("Auto Buy Best Gears", function()
			local v_6 = shop.GetStockGeneric(playerGui.Gear_Shop.Frame.ScrollingFrame, "Best", "no")

			if v_6 then
				gameEvents.BuyGearStock:FireServer(v_6)
			end
		end)

		fn14("Auto Buy Garden", function()
			local v_6 = shop.GetStockGeneric(playerGui.GardenCoinShop_UI.Frame.ScrollingFrame, "Normal", enabled["Select Garden"], true)

			if v_6 then
				gameEvents.BuyGardenCoinShopStock:FireServer(v_6)
			end
		end)

		fn14("Auto Buy All Garden", function()
			local v_6 = shop.GetStockGeneric(playerGui.GardenCoinShop_UI.Frame.ScrollingFrame, "Normal", "no", true)

			if v_6 then
				gameEvents.BuyGardenCoinShopStock:FireServer(v_6)
			end
		end)

		fn14("Auto Buy Best Garden", function()
			local v_6 = shop.GetStockGeneric(playerGui.GardenCoinShop_UI.Frame.ScrollingFrame, "Normal", "no", true)

			if v_6 then
				gameEvents.BuyGardenCoinShopStock:FireServer(v_6)
			end
		end)

		fn14("Auto Buy Cosmetic", function()
			for _, v_6 in shop.GetStockCosmetic(), nil, nil do
				if v_6 and table.find(enabled["Select Cosmetic"], v_6.Name) then
					gameEvents.BuyCosmeticCrate:FireServer(v_6.Name)
					gameEvents.BuyCosmeticItem:FireServer(v_6.Name)
				end
			end

			task.wait(0.5)
		end)

		fn14("Auto Buy Merchant", function()
			local v_6

			if workspace:FindFirstChild("American Traveling Merchant") then
				v_6 = shop.GetStockGeneric(playerGui.TravelingMerchantShop_UI.Frame.ScrollingFrame, "Normal", enabled["Select American Merchant"])
			elseif workspace:FindFirstChild("Gnome Traveling Merchant") then
				v_6 = shop.GetStockGeneric(playerGui.TravelingMerchantShop_UI.Frame.ScrollingFrame, "Normal", enabled["Select Gnome Merchant"])
			elseif workspace:FindFirstChild("Honey Traveling Merchant") then
				v_6 = shop.GetStockGeneric(playerGui.TravelingMerchantShop_UI.Frame.ScrollingFrame, "Normal", enabled["Select Honey Merchant"])
			elseif workspace:FindFirstChild("SkyTravelingMerchant") then
				v_6 = shop.GetStockGeneric(playerGui.TravelingMerchantShop_UI.Frame.ScrollingFrame, "Normal", enabled["Select Sky Merchant"])
			elseif workspace:FindFirstChild("Spray Traveling Merchant") then
				v_6 = shop.GetStockGeneric(playerGui.TravelingMerchantShop_UI.Frame.ScrollingFrame, "Normal", enabled["Select Spray Merchant"])
			elseif workspace:FindFirstChild("Sprinkler Traveling Merchant") then
				v_6 = shop.GetStockGeneric(playerGui.TravelingMerchantShop_UI.Frame.ScrollingFrame, "Normal", enabled["Select Sprinkler Merchant"])
			elseif workspace:FindFirstChild("Summer Traveling Merchant") then
				v_6 = shop.GetStockGeneric(playerGui.TravelingMerchantShop_UI.Frame.ScrollingFrame, "Normal", enabled["Select Summer Merchant"])
			elseif workspace:FindFirstChild("Fall Traveling Merchant") then
				v_6 = shop.GetStockGeneric(playerGui.TravelingMerchantShop_UI.Frame.ScrollingFrame, "Normal", enabled["Select Fall Merchant"])
			elseif workspace:FindFirstChild("Halloween Traveling Merchant") then
				v_6 = shop.GetStockGeneric(playerGui.TravelingMerchantShop_UI.Frame.ScrollingFrame, "Normal", enabled["Select Halloween Merchant"])
			else
				local v_7 = workspace
				v_6 = nil

				if v_7:FindFirstChild("Safari Traveling Merchant") then
					v_6 = shop.GetStockGeneric(playerGui.TravelingMerchantShop_UI.Frame.ScrollingFrame, "Normal", enabled["Select Safari Merchant"])
				end
			end

			if v_6 then
				gameEvents.BuyTravelingMerchantShopStock:FireServer(v_6)
			end
		end)

		fn14("Auto Buy All Merchant", function()
			if workspace:FindFirstChild("American Traveling Merchant") or workspace:FindFirstChild("Gnome Traveling Merchant") or workspace:FindFirstChild("Honey Traveling Merchant") or workspace:FindFirstChild("SkyTravelingMerchant") or workspace:FindFirstChild("Spray Traveling Merchant") or workspace:FindFirstChild("Sprinkler Traveling Merchant") or workspace:FindFirstChild("Summer Traveling Merchant") or workspace:FindFirstChild("Fall Traveling Merchant") or workspace:FindFirstChild("Halloween Traveling Merchant") or workspace:FindFirstChild("Safari Traveling Merchant") then
				local v_6 = shop.GetStockGeneric(playerGui.TravelingMerchantShop_UI.Frame.ScrollingFrame, "Normal", "no")

				if v_6 then
					gameEvents.BuyTravelingMerchantShopStock:FireServer(v_6)
				end
			end

			task.wait(1)
		end)

		fn14("Auto Buy Best Merchant", function()
			if workspace:FindFirstChild("American Traveling Merchant") or workspace:FindFirstChild("Gnome Traveling Merchant") or workspace:FindFirstChild("Honey Traveling Merchant") or workspace:FindFirstChild("SkyTravelingMerchant") or workspace:FindFirstChild("Spray Traveling Merchant") or workspace:FindFirstChild("Sprinkler Traveling Merchant") or workspace:FindFirstChild("Summer Traveling Merchant") or workspace:FindFirstChild("Fall Traveling Merchant") or workspace:FindFirstChild("Halloween Traveling Merchant") or workspace:FindFirstChild("Safari Traveling Merchant") then
				local v_6 = shop.GetStockGeneric(playerGui.TravelingMerchantShop_UI.Frame.ScrollingFrame, "Best", "no")

				if v_6 then
					gameEvents.BuyTravelingMerchantShopStock:FireServer(v_6)
				end
			end

			task.wait(1)
		end)

		fn14("Auto Claim Booths", function()
			if game.PlaceId ~= 129954712878723 then
				return
			end
			local tradeWorld = workspace:FindFirstChild("TradeWorld")
			tradeWorld = tradeWorld and tradeWorld:FindFirstChild("Booths")
			if not tradeWorld then
				return
			end
			local v_6 = nil

			for _, v_7 in tradeWorld:GetChildren() do
				if not v_7:IsA("Model") then
					v_6 = nil
					continue
				end
				local surfaceGui = v_7:FindFirstChild("SurfaceGui", true)
				local textLabel = surfaceGui and surfaceGui:FindFirstChild("TextLabel")
				if not textLabel then
					v_6 = nil
					continue
				end

				if textLabel.Text:find(localPlayer.Name) then
					return task.wait(1)
				end
				v_6 = v_7

				if v_6 then
					gameEvents.TradeEvents.Booths.ClaimBooth:FireServer(v_6)
				end

				task.wait(1)
				return
			end

			if v_6 then
				gameEvents.TradeEvents.Booths.ClaimBooth:FireServer(v_6)
			end

			task.wait(1)
		end)

		fn14("Auto Snipe Booth Pets", function()
			local function fn18(arg)
				local choosePets = enabled["Choose Pets  "]
				local chooseMutationsPets = enabled["Choose Mutations Pets"]
				local selectThresholdMode = enabled["Select Threshold Mode          "]
				local n = tonumber(enabled["Age Threshold      "]) or 0
				local n2 = tonumber(enabled["Weights Threshold      "]) or 0
				local petType = arg and arg.PetType
				arg = arg and arg.PetData
				local level = arg and arg.Level
				local v_6 = modules.Calculator.CurrentWeight(arg.BaseWeight, level)
				local str2 = modules.API.Data.PetMutationsCode[arg and arg.MutationType or ""] or "N/A"
				local flag2 = #choosePets > 1 and not table.find(choosePets, "None")
				local flag3 = #chooseMutationsPets > 1 and not table.find(chooseMutationsPets, "None")
				if flag2 and not table.find(choosePets, petType) then
					return false
				end

				if flag3 and not table.find(chooseMutationsPets, str2) then
					return false
				end
				local flag4 = n > 0

				if flag4 then
					flag4 = not (selectThresholdMode == "Above" and level > n or selectThresholdMode == "Below" and level < n)
				end

				if flag4 then
					return false
				end
				local flag5 = n2 > 0
				local flag6

				if flag5 then
					flag6 = not (selectThresholdMode == "Above" and v_6 > n2 or selectThresholdMode == "Below" and v_6 < n2)
				else
					flag6 = flag5
				end

				if flag6 then
					return false
				end
				return flag2 or flag3 or n > 0 or n2 > 0
			end

			if game.PlaceId ~= 129954712878723 then
				gameEvents.TradeWorld.TravelToTradeWorld:FireServer()
				task.wait(1)
				return
			end

			local v_6 = modules.Booth_Client.GetBoothInventory()

			if not v_6 or #v_6 == 0 then
				if enabled["Hop Server If Not Found"] then
					shx:SetNotification({ "Speed Hub X", "", "No booths available. Hopping to highest server...", 3, 0.5 })
					task.wait(2)
					modules.Server_Hop.Hop(true)
					task.wait(5)
				end

				return
			end

			local n = tonumber(enabled["Purchase Token Max"]) or 0
			local buyListing = gameEvents.TradeEvents.Booths.BuyListing
			local tbl10 = {}

			for _, v_7 in ipairs(v_6) do
				if enabled["Auto Snipe Booth Pets"] then
					local owner = v_7.Owner
					local items = v_7.Items

					if not (not owner or not items) then
						local str2 = owner:gsub("Player_", "")
						local playerByUserId = Players:GetPlayerByUserId(tonumber(str2))

						if playerByUserId then
							for k, item in pairs(items) do
								if enabled["Auto Snipe Booth Pets"] then
									if item and item.PetType and fn18(item) then
										local v_8 = modules.Booth_Client.GetPriceItem(owner, k)
										local v_9 = modules.Booth_Client.GetListingId(owner, k)
										local currentToken = managers2:GetCurrentToken()

										if not (currentToken and currentToken < v_8) then
											if v_8 and (n == 0 or v_8 <= n) then
												table.insert(tbl10, {
													UUID = k,
													ItemData = item,
													Price = v_8,
													SellerPlayer = playerByUserId,
													Owner = owner,
													ListingId = v_9,
												})
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

			if #tbl10 > 0 then
				table.sort(tbl10, function(arg, arg2)
					return arg.Price < arg2.Price
				end)

				local v_7 = tbl10[1]
				local price = v_7.Price

				if managers2:GetCurrentToken() >= price then
					local ok, result = pcall(function()
						return buyListing:InvokeServer(v_7.SellerPlayer, v_7.ListingId)
					end)

					if ok and result then
						local v_8 = shx
						local setNotification = v_8.SetNotification
						local tbl11 = {}
						local petType = v_7.ItemData.PetType or "Unknown"
						tbl11[1] = "Speed Hub X"
						tbl11[2] = ""
						tbl11[3] = "Purchased " .. petType .. "!"
						tbl11[4] = 3
						tbl11[5] = 0.5
						setNotification(v_8, tbl11)

						if enabled["Webhook Snipe Booth"] and enabled["Webhook URL Snipe"] and enabled["Webhook URL Snipe"] ~= "" then
							local petData = v_7.ItemData.PetData
							local level = petData and petData.Level or 0
							local n2 = petData and modules.Calculator.CurrentWeight(petData.BaseWeight, level) or 0
							local str2 = modules.API.Data.PetMutationsCode[petData and petData.MutationType or ""] or "None"
							local webhook = modules.Webhook
							local webhookUrlSnipe = enabled["Webhook URL Snipe"]
							local tbl12 = { content = "" }
							local embeds = {}

							local tbl13 = {
								title = "**Speed Hub X | Booth Sniper**",
								type = "rich",
								color = tonumber("0x00ff00"),
							}

							local fields = {}

							local tbl14 = {
								name = "** -> Profile : ** \n",
								value = "> Username : || " .. localPlayer.Name .. " ||",
								inline = false,
							}

							local tbl15 = {
								name = "** -> Purchased Pet : ** \n",
								value = "> Pet Name: ``" .. (v_7.ItemData.PetType or "Unknown") .. "``" .. "\n> Price: ``" .. v_7.Price .. " Tokens``" .. "\n> Seller: ``" .. v_7.SellerPlayer.Name .. "``" .. "\n> Age/Level: ``" .. level .. "``" .. "\n> Weight: ``" .. (tostring(math.floor(n2) == n2 and n2 or ("%.2f"):format(n2)) .. " KG") .. "``" .. "\n> Mutation: ``" .. str2 .. "``",
								inline = false,
							}

							fields[1] = tbl14
							fields[2] = tbl15
							tbl13.fields = fields

							tbl13.thumbnail = {
								url = modules.GetImageURL(modules.API.Data.Pets[v_7.ItemData.PetType] and modules.API.Data.Pets[v_7.ItemData.PetType].Icon) or "",
							}

							embeds[1] = tbl13
							tbl12.embeds = embeds
							webhook(webhookUrlSnipe, tbl12)
						end
					end
				elseif enabled["Hop Server If Not Found"] then
					shx:SetNotification({ "Speed Hub X", "", "Not enough tokens. Hopping to highest server...", 3, 0.5 })
					task.wait(2)
					modules.Server_Hop.Hop(true)
					task.wait(5)
				end
			elseif enabled["Hop Server If Not Found"] then
				shx:SetNotification({ "Speed Hub X", "", "No matching pets found. Hopping to highest server...", 3, 0.5 })
				task.wait(2)
				modules.Server_Hop.Hop(true)
				task.wait(5)
			end

			task.wait(2)
		end)

		fn14("Hide All Fruits", function()
			local v_6 = collection.GetPlantList1(modules.GetFarmPath("Plants_Physical"), {}, true, true)
			if #v_6 == 0 then
				return
			end

			table.foreach(v_6, function(arg, arg2)
				local v_7 = next
				local children, v_8 = arg2:GetChildren()

				for _, v_9 in v_7, children, v_8 do
					if v_9:IsA("BasePart") or v_9:IsA("Part") and not table.find(enabled["Select Blacklist Hide Fruit"], v.Name) then
						if not cached.HideFruit[v_9] then
							cached.HideFruit[v_9] = { Object = v_9, CanCollide = v_9.CanCollide, Transparency = v_9.Transparency }
						end

						v_9.CanCollide = false
						v_9.Transparency = 1
					end
				end
			end)

			task.wait(2)
		end)

		fn14("Hide All Tree", function()
			local v_6 = collection.GetPlantList1(modules.GetFarmPath("Plants_Physical"), {}, false, true)
			if #v_6 == 0 then
				return
			end

			table.foreach(v_6, function(arg, arg2)
				local v_7 = next
				local children, v_8 = arg2:GetChildren()

				for _, v_9 in v_7, children, v_8 do
					if v_9:IsA("BasePart") or v_9:IsA("Part") and not table.find(enabled["Select Blacklist Tree"], v.Name) then
						if not cached.HideTree[v_9] then
							cached.HideTree[v_9] = { Object = v_9, CanCollide = v_9.CanCollide, Transparency = v_9.Transparency }
						end

						v_9.CanCollide = false
						v_9.Transparency = 1
					end
				end
			end)

			task.wait(2)
		end)

		fn14("Auto Remove All Garden Players", function()
			for _, player in pairs(Players:GetPlayers()) do
				if player ~= localPlayer then
					local v_6 = modules.GetOwnerFarm(player.Name)

					if v_6 then
						v_6:Destroy()
					end
				end
			end
		end)

		fn14("ESP Fruit", function()
			local selectFruitsEsp = enabled["Select Fruits ESP"]
			local selectMutationEsp = enabled["Select Mutation ESP"]
			local selectVariantEsp = enabled["Select Variant ESP"]
			local allowShowValueMoney = enabled["Allow Show Value Money"]
			local v_6 = collection.GetPlantList(modules.GetFarmPath("Plants_Physical"), {}, true)
			if #v_6 == 0 then
				return
			end
			local formatNumber = modules.FormatNumber
			local calculatorFruit = calculator.CalculatorFruit
			local createESP = esp.CreateESP
			local removes = esp.Removes

			for _, v_7 in next, v_6, nil do
				if v_7:IsA("Model") and modules.FruitFilter({ selectFruitsEsp, selectMutationEsp, selectVariantEsp }, v_7) then
					local esp2 = v_7:FindFirstChild("ESP")
					local color = v_7:FindFirstChild("1") and v_7["1"].Color or Color3.new(1, 1, 1)
					local str2 = allowShowValueMoney and ("<font color=\"rgb(17,245,5)\">$%s</font>"):format(formatNumber(calculatorFruit(v_7))) or ""
					local weight = v_7:FindFirstChild("Weight")

					local text = ([[<font color="rgb(255,255,255)">%s [ </font>%s<font color="rgb(255,255,255)"> | </font>%s<font color="rgb(255,255,255)"> ]</font>
%s
%s%s]]):format(v_7.Name, str2, weight and ("<font color=\"rgb(181,181,179)\">%.2fkg</font>"):format(weight.Value) or "", managers2:FormatMutation(managers2:GetMutationName_T(v_7)), managers2:FormatVariant(v_7:FindFirstChild("Variant"), color), v_7:GetAttribute("Favorited") and ("\n<font color=\"rgb(255,0,0)\">%s</font>"):format("Favorited") or "")

					if not esp2 then
						createESP(v_7, { Color = color, Text = text })
					else
						local billboardGui = esp2:FindFirstChild("BillboardGui", true)
						billboardGui = billboardGui and billboardGui:FindFirstChild("TextLabel")

						if billboardGui and billboardGui.Text ~= text then
							billboardGui.Text = text
						end
					end
				else
					removes(v_7)
				end
			end

			task.wait(2)
		end)

		local function fn18(arg)
			local n = math.floor(arg)
			local n2 = math.floor(n / 86400)
			local n3 = math.floor(n % 86400 / 3600)
			local n4 = math.floor(n % 3600 / 60)
			local n5 = n % 60
			if n2 > 0 then
				return string.format("%d:%02d:%02d:%02d", n2, n3, n4, n5)
			end

			if n3 > 0 then
				return string.format("%d:%02d:%02d", n3, n4, n5)
			end

			if n4 > 0 then
				return string.format("%d:%02d", n4, n5)
			end
			return tostring(n5)
		end

		fn14("ESP Eggs", function()
			local Objects_Physical = modules.GetFarmPath("Objects_Physical")
			if not Objects_Physical then
				return
			end
			local v_6 = modules.DataClient.GetSaved_Data()
			if not v_6 then
				return
			end
			local n = 1

			for _, child in ipairs(Objects_Physical:GetChildren()) do
				pcall(function()
					local name = localPlayer.Name

					if child:GetAttribute("OWNER") == name then
						local esp2 = child:FindFirstChild("ESP")

						if not esp2 then
							esp.CreateESP(child, { Color = Color3.fromRGB(255, 255, 255), Text = "", Enabled = false })
							esp2 = child:FindFirstChild("ESP")
						end

						if esp2 then
							local billboardGui = esp2:FindFirstChild("BillboardGui", true)
							local textLabel = billboardGui and billboardGui:FindFirstChild("TextLabel")

							if billboardGui then
								billboardGui.Enabled = true
							end

							if child:GetAttribute("READY") then
								local attribute = child:GetAttribute("TimeToHatch")
								local attribute2 = child:GetAttribute("OBJECT_UUID")
								local text

								if attribute and attribute > 0 then
									n = enabled["Disable ESP Cooldown Egg"] and 1 or 0

									text = enabled["Disable ESP Cooldown Egg"] and "" or string.format([[<font color='rgb(3,211,252)'>%s</font>
<font color='rgb(255,215,0)'>%s</font>
]], tostring(child:GetAttribute("EggName")), fn18(attribute))
								else
									n = 1
									local v_7 = v_6[attribute2]
									text = nil

									if v_7 then
										local data = v_7.Data
										local type_ = data.Type
										local v_8 = modules.Calculator.CurrentWeight(data.BaseWeight or 1, 1)
										local v_9 = managers2:DecimalNumberFormat(v_8)
										local str2 = v_8 > 9 and "Titanic" or v_8 >= 6 and v_8 <= 9 and "Semi Titanic"
										local str3

										if str2 then
											str3 = str2
										else
											str3 = v_8 > 3 and "Huge"
										end

										str3 = str3 or "Small"

										text = string.format([[<font color='rgb(3,211,252)'>%s</font>
<font color='rgb(255,215,0)'>%s</font>
<font color='rgb(100,255,100)'>%s (%s)</font>]], tostring(child:GetAttribute("EggName")), type_, tostring(v_9) .. " KG" or "N/A", str3)
									end
								end

								if text and textLabel and textLabel.Text ~= text then
									textLabel.Text = text
								end
							end
						end
					end
				end)
			end

			task.wait(n)
		end)

		fn14("ESP Crates", function()
			local Objects_Physical = modules.GetFarmPath("Objects_Physical")
			if not Objects_Physical then
				return
			end
			local v_6 = modules.DataClient.GetSaved_Data()
			if not v_6 then
				return
			end

			for _, child in ipairs(Objects_Physical:GetChildren()) do
				pcall(function()
					local name = localPlayer.Name

					if child:GetAttribute("OWNER") == name and child:GetAttribute("CrateType") and child:GetAttribute("TimeToOpen") <= 0 then
						local v_7 = v_6[child:GetAttribute("OBJECT_UUID")]

						if v_7 then
							local cosmeticType = v_7.Data.CosmeticType

							if cosmeticType then
								esp.CreateESP(child, {
									Color = Color3.fromRGB(5, 134, 255),
									Text = "Crate: " .. tostring(child:GetAttribute("CrateType")) .. "\nItem: " .. cosmeticType .. "\n \n \n \n \n",
								})
							end
						end
					end
				end)
			end

			task.wait(2)
		end)

		fn14("ESP Pets", function()
			local petsPhysical = workspace:FindFirstChild("PetsPhysical")
			if not petsPhysical then
				return
			end

			for _, child in ipairs(petsPhysical:GetChildren()) do
				local name = localPlayer.Name

				if child:GetAttribute("OWNER") == name then
					if child:FindFirstChildWhichIsA("Model") then
						local attribute = child:GetAttribute("UUID")

						if attribute then
							local petFromUUID = managers2:GetPetFromUUID(attribute) or "N/A"
							local selectPetsEsp = enabled["Select Pets ESP"]

							if table.find(selectPetsEsp, "All") or table.find(selectPetsEsp, petFromUUID .. " " .. attribute) then
								local esp2 = child:FindFirstChild("ESP")
								local petTime = managers2:GetPetTime(attribute)
								local str2 = petTime and petTime.Result or "N/A"
								local passive = petTime and petTime.Passive and petTime.Passive[1] or "N/A"
								local petMutationName = managers2:GetPetMutationName(petFromUUID) or "N/A"

								if not esp2 then
									esp.CreateESP(child, {
										Color = Color3.fromRGB(92, 247, 240),
										Text = "Pets: " .. petFromUUID .. "\nTime: " .. str2 .. "\nPassive: " .. passive .. "\nMutation: " .. petMutationName .. "\n\n",
									})
								else
									local billboardGui = esp2:FindFirstChild("BillboardGui", true)
									billboardGui = billboardGui and billboardGui:FindFirstChild("TextLabel")

									if billboardGui then
										billboardGui.Text = "Pets: " .. petFromUUID .. "\nTime: " .. str2 .. "\nPassive: " .. passive .. "\nMutation: " .. petMutationName .. "\n\n"
									end
								end
							end
						end
					end
				end
			end

			task.wait(2)
		end)

		fn14("Reduce Pet Visual Effects", function()
			local petsPhysical = workspace:FindFirstChild("PetsPhysical")
			if not petsPhysical then
				return
			end

			for _, descendant in ipairs(petsPhysical:GetDescendants()) do
				if descendant:IsA("ParticleEmitter") or descendant:IsA("Trail") or descendant:IsA("Beam") or descendant:IsA("Fire") or descendant:IsA("Smoke") or descendant:IsA("Sparkles") then
					descendant.Enabled = false
					descendant:Destroy()
				elseif descendant:IsA("PointLight") or descendant:IsA("SpotLight") or descendant:IsA("SurfaceLight") then
					descendant.Enabled = false
					descendant:Destroy()
				elseif descendant:IsA("Sound") then
					descendant.Volume = 0
					descendant:Destroy()
				end
			end
		end)

		fn14("Reduce Pet Animation", function()
			local petsPhysical = workspace:FindFirstChild("PetsPhysical")
			if not petsPhysical then
				return
			end

			for _, descendant in ipairs(petsPhysical:GetDescendants()) do
				if descendant:IsA("Animation") then
					descendant:Destroy()
				end
			end

			for _, descendant in ipairs(petsPhysical:GetDescendants()) do
				if descendant:IsA("AnimationController") then
					for _, v_6 in ipairs(descendant:GetPlayingAnimationTracks()) do
						v_6:Stop()
					end

					descendant:Destroy()
				end
			end
		end)

		fn14("Auto Switch Loadouts", function()
			if stored.Pet_Switcher["Stop Switch"] then
				return
			end
			local selectSlotForEggReductionTime = enabled["Select Slot (For Egg Reduction Time)"]

			if selectSlotForEggReductionTime and selectSlotForEggReductionTime ~= "None" and selectSlotForEggReductionTime ~= "" then
				if stored.Pet_Switcher["Hatching Egg"] or stored.Pet_Switcher["Selling Pet"] or stored.Pet_Switcher["Place Egg"] or stored.Pet_Switcher["Stop Switch"] then
					return
				end

				if not modules.CheckEggToHatch(enabled["All Eggs Ready Only"]) then
					stored.Pet_Switcher["Egg Reduction Time"] = true
					if stored.Pet_Switcher["Hatching Egg"] or stored.Pet_Switcher["Selling Pet"] or stored.Pet_Switcher["Place Egg"] or stored.Pet_Switcher["Stop Switch"] then
						return
					end

					if managers2:SlotLoadout(selectSlotForEggReductionTime) then
						return
					end

					if not managers2:FireSlotLoadout(selectSlotForEggReductionTime, "Delay To Switch") then
						stored.Pet_Switcher["Egg Reduction Time"] = false
						task.wait(2)
						return
					end
				end

				while true do
					if enabled["Auto Switch Loadouts"] and not shx.Unloaded then
						if not (stored.Pet_Switcher["Hatching Egg"] or stored.Pet_Switcher["Selling Pet"] or stored.Pet_Switcher["Place Egg"] or stored.Pet_Switcher["Stop Switch"]) then
							if not modules.CheckEggToHatch(enabled["All Eggs Ready Only"]) then
								task.wait()
								continue
							end
						end
					end

					break
				end

				stored.Pet_Switcher["Egg Reduction Time"] = false
			end
		end)

		fn14("Auto Switch File", function()
			if stored.Pet_Switcher["Stop Switch"] then
				return
			end
			local selectFileForEggReductionTime = enabled["Select File (For Egg Reduction Time)"]

			if selectFileForEggReductionTime and selectFileForEggReductionTime ~= "None" and selectFileForEggReductionTime ~= "" then
				if stored.Pet_Switcher["Hatching Egg"] or stored.Pet_Switcher["Selling Pet"] or stored.Pet_Switcher["Place Egg"] or stored.Pet_Switcher["Stop Switch"] then
					return
				end

				if not modules.CheckEggToHatch(enabled["All Eggs Ready Only"]) then
					stored.Pet_Switcher["Egg Reduction Time"] = true
					if stored.Pet_Switcher["Hatching Egg"] or stored.Pet_Switcher["Selling Pet"] or stored.Pet_Switcher["Place Egg"] or stored.Pet_Switcher["Stop Switch"] then
						return
					end

					if cached.Team == selectFileForEggReductionTime then
						return
					end

					if not managers2:FireFile(selectFileForEggReductionTime, "Delay To Switch  ") then
						stored.Pet_Switcher["Egg Reduction Time"] = false
						task.wait(2)
						return
					end
				end

				while true do
					if enabled["Auto Switch File"] and not shx.Unloaded then
						if not (stored.Pet_Switcher["Hatching Egg"] or stored.Pet_Switcher["Selling Pet"] or stored.Pet_Switcher["Place Egg"] or stored.Pet_Switcher["Stop Switch"]) then
							if not modules.CheckEggToHatch(enabled["All Eggs Ready Only"]) then
								task.wait()
								continue
							end
						end
					end

					break
				end

				stored.Pet_Switcher["Egg Reduction Time"] = false
			end
		end)
	end

	local function fn14(arg)
		handlers[arg](handlers)
	end

	fn14("LoadFunction")
	fn14("LoadLibrary")
end

local tbl2 = {}
local v_6 = http_request or request
local request_

if v_6 then
	request_ = v_6
else
	request_ = http and http.request
end

tbl2.Request = request_
tbl2.Script_ID = "547693c3e906ace27e5cb820e701dffc"

tbl2.Load = function(scriptKey)
	script_key = scriptKey
	getfenv(0).script_key = scriptKey
	getfenv(1).script_key = scriptKey
	getgenv().script_key = scriptKey
	loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/" .. tbl2.Script_ID .. ".lua"))()
end

tbl2.MathFloor = function(arg, arg2)
	local n = arg2 - arg2 % 1
	return arg2 < 0 and n ~= arg2 and n - 1 or n
end

tbl2.Uint32 = function(arg, arg2)
	return arg2 % 4294967296
end

tbl2.BitwiseXor = function(arg, arg2, arg3)
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
end

tbl2.LeftShift = function(arg, arg2, arg3)
	return tbl2:Uint32(arg2 * 2 ^ arg3)
end

tbl2.RightShift = function(arg, arg2, arg3)
	return tbl2:MathFloor(arg2 / 2 ^ arg3) % 4294967296
end

tbl2.ToString = function(arg, arg2)
	return tostring(arg2)
end

tbl2.Concat = function(arg, arg2, arg3)
	local str = arg3 or ""
	local str2 = ""

	for i = 1, #arg2 do
		str2 ..= tbl2:ToString(arg2[i])

		if i ~= #arg2 then
			str2 ..= str
		end
	end

	return str2
end

tbl2.Encryption = function(arg, arg2)
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

		local v_7 = tbl2:Uint32(n3)

		for i = 1, 4 do
			local v_8 = tbl3[i % 4 + 1]
			local v_9 = tbl2:BitwiseXor(tbl2:BitwiseXor(tbl3[i], v_7), v_8)
			local v_10 = tbl4[i]
			local v_11 = tbl2:Uint32(tbl2:LeftShift(v_9, 5) + tbl2:RightShift(v_9, 2) + v_10)
			local v_12 = tbl2:RightShift(v_7, (i - 1) * 5 % 32)
			local v_13 = tbl2:BitwiseXor(v_11, v_12)
			local v_14 = tbl3[(i + 1) % 4 + 1]
			local v_15 = tbl2:Uint32(tbl2:Uint32(v_13) + v_14)
			tbl3[i] = tbl2:Uint32(v_15)
		end

		n2 += 4
	end

	for i = 1, 4 do
		local v_7 = tbl3[(i + 2) % 4 + 1]
		local v_8 = tbl2:BitwiseXor(tbl2:Uint32(tbl3[i] + tbl3[i % 4 + 1]), v_7)
		local n3 = i * 7 % 32
		tbl3[i] = tbl2:Uint32(tbl2:LeftShift(v_8, n3) + tbl2:RightShift(v_8, 32 - n3))
	end

	local tbl5 = {}

	for i = 1, 4 do
		tbl5[i] = string.format("%08X", tbl3[i])
	end

	return tbl2:Concat(tbl5)
end

tbl2.NFyuXkNUFXqYueWyGPjhCrcMgiLMPNhLzAttSCFVWanYbrDSBKmCXghuwYgwPrqAGFcTnQcKiQvMXtLRkZAGdKNUgUHKrPqZaqYh = function()
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
end

tbl2.KqNajmBbtvaSwVktmdHAUSLHdbErNkfYxZJMxUydYMvhPKHBLCHBbjSCBjECVRFqyjGqzPGfgncLXRhtxCBeLrArAgVUxUhfnSWF = function()
	return os.date("*t").wday == 7
end

tbl2.JSONDecode = function(arg, arg2)
	return game:GetService("HttpService"):JSONDecode(arg2)
end

tbl2.CheckerKey = function(arg)
	local now = os.time()
	local str = tostring(arg)
	tbl2.Script_ID = tostring(tbl2.Script_ID)
	local data = tbl2:JSONDecode(tbl2.Request({ Url = "https://sdkapi-public.luarmor.net/sync", Method = "GET" }).Body)
	local nodes = data.nodes
	local str2 = "check_key?key=" .. str .. "&script_id=" .. tbl2.Script_ID
	local n = now + data.st - now

	local v_7 = tbl2.Request({
		Url = nodes[math.random(1, #nodes)] .. str2,
		Method = "GET",
		Headers = {
			clienttime = tostring(n),
			catcat128 = tbl2:Encryption(str .. "_cfver1.0_" .. tbl2.Script_ID .. "_time_" .. n),
		},
	})

	if not v_7 or not type(v_7) == "table" then
		return nil
	end

	if v_7.StatusMessage and v_7.StatusMessage:find("{") then
		local match = v_7.StatusMessage:match("(%b{})")
		if match then
			return tbl2:JSONDecode(match)
		end
	end

	return tbl2:JSONDecode(v_7.Body)
end

tbl2.Check = function()
	if getfenv().Username or getgenv().Username or _G.Username or Username then
		return true
	end

	if getfenv().Webhook or getgenv().Webhook or _G.Webhook or Webhook then
		return true
	end

	if getfenv().URL or getgenv().URL or _G.URL or URL then
		return true
	end
end

tbl2.K = function()
	game:GetService("Players").LocalPlayer:Kick([[Unofficial script detected! 

 Join the official server to get the real script: discord.gg/speedhubx]])

	local flag = false

	repeat
		task.wait()

		pcall(function()
			local errorPrompt = game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ErrorPrompt
			errorPrompt.TitleFrame.ErrorTitle.Text = "Speed Hub X | Security"

			errorPrompt.MessageArea.ErrorFrame.ErrorMessage.Text = [[Unofficial script detected! 

 Join the official server to get the real script: discord.gg/speedhubx]]

			if errorPrompt.MessageArea.ErrorFrame.ErrorMessage.Text == [[Unofficial script detected! 

 Join the official server to get the real script: discord.gg/speedhubx]] then
				flag = true
			end
		end)
	until flag
end

task.spawn(function()
	while not tbl2:Check() do
		task.wait()
	end

	tbl2:K()
end)

if tbl2:KqNajmBbtvaSwVktmdHAUSLHdbErNkfYxZJMxUydYMvhPKHBLCHBbjSCBjECVRFqyjGqzPGfgncLXRhtxCBeLrArAgVUxUhfnSWF() or tbl2:NFyuXkNUFXqYueWyGPjhCrcMgiLMPNhLzAttSCFVWanYbrDSBKmCXghuwYgwPrqAGFcTnQcKiQvMXtLRkZAGdKNUgUHKrPqZaqYh() then
	task.spawn(fn2)
	return
end

if isfile("SpeedHubX_Key.txt") then
	local txt = readfile("SpeedHubX_Key.txt")
	local v_7 = tbl2.CheckerKey(txt)

	if v_7 and v_7.code == "KEY_VALID" then
		task.spawn(fn2)
		task.spawn(tbl2.Load, txt)
		return
	end
end

if script_key and type(script_key) == "string" then
	local v_7 = tbl2.CheckerKey(script_key)

	if v_7 and v_7.code == "KEY_VALID" then
		task.spawn(fn2)
		task.spawn(tbl2.Load, script_key)
		return
	end
end

local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Main/refs/heads/main/Library/KeySystemV2.5.lua"))()
local lib2 = loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Main/refs/heads/main/Library/Key%20System/Get%20Key%20API.lua"))()

local v_7 = lib.Load({
	Name = "Speed Hub X",
	Icon = 136890595976124,
	DiscordLink = "discord.gg/speedhubx",
	Color = Color3.fromRGB(204, 33, 10),
	Callback = function(arg)
		local str = arg:gsub("%s+", " "):gsub("^%s*(.-)%s*$", "%1")
		local v_7 = tbl2.CheckerKey(str)

		if v_7.code == "KEY_VALID" then
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
		elseif v_7.code == "KEY_HWID_LOCKED" then
			lib.Notify({
				Title = "Key linked to a different HWID. Please reset it using our bot, join discord.gg/speedhubx !",
				Icon = 14943813832,
				Time = 5,
				Color = Color3.fromRGB(255, 37, 17),
			})
		elseif v_7.code == "KEY_EXPIRED" then
			lib.Notify({
				Title = "The Provided Key has expired.",
				Icon = 14943813832,
				Time = 5,
				Color = Color3.fromRGB(240, 192, 96),
			})
		elseif v_7.code == "KEY_BANNED" then
			lib.Notify({
				Title = "The Provided Key is banned.",
				Icon = 14943813832,
				Time = 5,
				Color = Color3.fromRGB(255, 37, 17),
			})
		elseif v_7.code == "INVALID_EXECUTOR" then
			lib.Notify({
				Title = "your Executor is not supported",
				Icon = 14943813832,
				Time = 5,
				Color = Color3.fromRGB(255, 37, 17),
			})
		elseif v_7.code == "KEY_INCORRECT" then
			lib.Notify({
				Title = "The Provided Key is incorrect / it does not exist.",
				Icon = 14943813832,
				Time = 5,
				Color = Color3.fromRGB(255, 37, 17),
			})
		elseif v_7.code == "KEY_INVALID" then
			lib.Notify({
				Title = "The Provided Key is in an invalid format.",
				Icon = 14943813832,
				Time = 5,
				Color = Color3.fromRGB(255, 37, 17),
			})
		end
	end,
})

for k, v_8 in next, lib2[game.GameId], nil do
	v_7.New({
		Title = k,
		Icon = v_8.Icon,
		Callback = function()
			pcall(setclipboard, v_8.Url)
			lib.Notify({ Title = "Copied Get Key " .. k .. " Link", Icon = 14939475472, Time = 5 })
		end,
	})
end

v_7.Explain("Keyless will be enabled every weekend.")
