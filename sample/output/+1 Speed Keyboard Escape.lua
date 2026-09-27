repeat
	task.wait()
until game:IsLoaded()

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

local function fn()
	local Players = game:GetService("Players")
	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	local UserInputService = game:GetService("UserInputService")
	local GuiService = game:GetService("GuiService")
	local virtualInputManager = Instance.new("VirtualInputManager")
	local RunService = game:GetService("RunService")
	local Lighting = game:GetService("Lighting")
	local VirtualUser = game:GetService("VirtualUser")
	local HttpService = game:GetService("HttpService")
	game:GetService("CollectionService")
	local TeleportService = game:GetService("TeleportService")
	local CoreGui = game:GetService("CoreGui")
	local localPlayer = Players.LocalPlayer
	local playerGui = localPlayer:WaitForChild("PlayerGui")
	local character = localPlayer.Character
	local humanoid = character:WaitForChild("Humanoid")
	local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
	local remotes = ReplicatedStorage:FindFirstChild("Remotes")
	local updateSpeed = remotes:FindFirstChild("UpdateSpeed")
	local showWin = remotes:FindFirstChild("ShowWin")
	local container = ReplicatedStorage:FindFirstChild("Packages"):FindFirstChild("remo"):FindFirstChild("container")
	local ClientState = require(ReplicatedStorage:FindFirstChild("ClientState"))

	local tbl = {
		Enabled = { IsTeleporting = false },
		Module = {},
		Connections = {},
		Cached = {
			Stuck = os.time(),
			JSON = {},
			Count = { WalkSpeed = 0, NoClip = 0, Fail = 0 },
			Image = {},
			Temporary = {},
			Task = {},
		},
		Stored = { Data = {}, UI = {} },
	}

	local module = tbl.Module
	local connections = tbl.Connections
	local cached = tbl.Cached
	local enabled = tbl.Enabled

	local function fn2(arg)
		return print(arg)
	end

	local function fn3(arg)
		local ok, result = pcall(function()
			return (load or loadstring)(game:HttpGet(arg))()
		end)

		if ok then
			return result
		end
	end

	local function fn4(arg)
		local n = os.clock() + (arg or 0)

		repeat
			task.wait()
		until os.clock() >= n
	end

	local tbl2 = {
		SHX = fn3("https://raw.githubusercontent.com/AhmadV99/Main/refs/heads/main/Library/Lib_5.5.0.lua"),
		Funcs = fn3("https://raw.githubusercontent.com/AhmadV99/Main/refs/heads/main/Library/Example/FuncsV4.lua"),
	}

	local shx = tbl2.SHX
	local funcs = tbl2.Funcs

	task.spawn(function()
		if _G.Speed_AntiAFK then
			return
		end
		_G.Speed_AntiAFK = true

		while task.wait(600) do
			VirtualUser:CaptureController()
			VirtualUser:ClickButton2(Vector2.new())
		end
	end)

	local function fn5()
		local function fn6()
			return {
				Connections = function(arg, arg2, arg3)
					local connection = nil

					connection = arg:Connect(function(...)
						if shx.Unloaded then
							if connection then
								connection:Disconnect()
							end

							return
						end

						local ok, result = pcall(arg2, ...)

						if not ok then
							fn2(result, "")
						end
					end)

					if arg3 then
						connections[arg3] = connection
					end

					return connection
				end,
				Disconnect = function(arg)
					if connections[arg] then
						connections[arg]:Disconnect()
						connections[arg] = nil
					end
				end,
				StartLoop = function(arg, arg2)
					while not shx.Unloaded do
						if enabled[arg] then
							local ok, result = pcall(arg2)

							if not ok then
								fn2(result, arg)
							end
						end

						task.wait(0)
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

		local function fn7()
			local tbl3 = {}
			local brickColor = BrickColor.new("Lily white")
			BrickColor.new("Bright red")
			local plastic = Enum.Material.Plastic

			tbl3.GetPath = function(arg, ...)
				for _, v in ipairs({ ... }) do
					arg = arg:WaitForChild(v)
				end

				return arg
			end

			tbl3.ApplyBaseProperties = function(arg, arg2)
				local tbl4 = arg2 or {}
				arg.CanCollide = tbl4.CanCollide ~= false
				arg.Anchored = tbl4.Anchored ~= false
				arg.Transparency = tbl4.Transparency or 1
				arg.CastShadow = tbl4.CastShadow == true
				arg.BrickColor = tbl4.BrickColor or brickColor
				arg.Material = tbl4.Material or plastic
			end

			tbl3.CreatePartOnce = function(parent, arg, name, size, cFrame, arg2)
				local v = parent:FindFirstChild(name)
				if v then
					return v
				end
				local instance = Instance.new(arg or "Part")
				instance.Name = name
				instance.Size = size
				instance.CFrame = cFrame
				tbl3.ApplyBaseProperties(instance, arg2)

				if arg2 and arg2.Shape then
					instance.Shape = arg2.Shape
				end

				instance.Parent = parent
				return instance
			end

			tbl3.CreateWeld = function(part0, part1, name)
				local weldConstraint = Instance.new("WeldConstraint")
				weldConstraint.Name = name or "SupportWeld"
				weldConstraint.Part0 = part0
				weldConstraint.Part1 = part1
				weldConstraint.Parent = part1
				return weldConstraint
			end

			tbl3.MakeInvisibleTrapSafe = function(arg, transparency)
				if not arg or not arg:IsA("BasePart") then
					return
				end
				arg.CanCollide = false
				arg.Transparency = transparency or 0.4

				for _, child in ipairs(arg:GetChildren()) do
					if child.Name == "Texture" and child:IsA("Texture") then
						child.Transparency = transparency or 0.4
					elseif child.Name == "TouchInterest" then
						child:Destroy()
					end
				end
			end

			tbl3.DeleteByPosition = function(arg, arg2, arg3, arg4)
				local n = arg4 or 0.05

				while arg and arg.Parent do
					for _, descendant in ipairs(arg:GetDescendants()) do
						if descendant:IsA("BasePart") then
							if (not arg3 or descendant.Name == arg3) and (descendant.Position - arg2).Magnitude <= n then
								descendant:Destroy()
								return
							end
						end
					end

					task.wait()
				end
			end

			tbl3.ApplyWorld = function()
				if cached.CurrentWorld ~= "World 1" then
					return
				end

				if not Workspace:FindFirstChild("Support 1") then
					tbl3.CreatePartOnce(Workspace, "Part", "Support 1", Vector3.new(1460, 130, 80), CFrame.new(-7586.771, 474.001556, 1487.38672))
					tbl3.CreatePartOnce(Workspace, "WedgePart", "Support 2", Vector3.new(60, 38, 42), CFrame.new(-6835.55127, 520, 1487.61877) * CFrame.Angles(0, -1.5707963267948966, 0))
					tbl3.CreatePartOnce(Workspace, "Part", "Support 3", Vector3.new(50, 50, 2), CFrame.new(-8379.56348, 520, 1487.38501, 0, 0, -1, 0, 1, 0, 1, 0, 0))
					tbl3.CreatePartOnce(Workspace, "Part", "Support 4", Vector3.new(1300, 85, 100), CFrame.new(-11407.3945, 750.55426, 3580.27637) * CFrame.Angles(0, 0, 0))

					task.spawn(function()
						local structure = Workspace:WaitForChild("Structure")
						local v = tbl3.GetPath(structure, "Stage14", "Murs et sol", "Folder")
						local v2 = tbl3.GetPath(structure, "Stage15", "Stage15")
						local v3 = tbl3.GetPath(structure, "Level15", "SpeedRunPart", "Murs et sol")

						while #v2:GetChildren() == 0 do
							task.wait()
						end

						task.spawn(tbl3.DeleteByPosition, v, Vector3.new(-8320.521, 534.82385, 1487.3867), "Stud Part")
						task.spawn(tbl3.DeleteByPosition, v2, Vector3.new(-8350.563, 537.49396, 1487.385))
						task.spawn(tbl3.DeleteByPosition, v2, Vector3.new(-8350.563, 521.9941, 1487.385))
						task.spawn(tbl3.DeleteByPosition, v3, Vector3.new(-8350.563, 537.49396, 1485.135))
					end)
				end
			end

			tbl3.DeleteWorld = function()
				for _, v in ipairs({ "Support 1", "Support 2", "Support 3", "Support 4" }) do
					for _, descendant in ipairs(Workspace:GetDescendants()) do
						if descendant.Name == v then
							descendant:Destroy()
						end
					end
				end
			end

			return tbl3
		end

		local tbl3 = {
			GetMagnitude = function(arg)
				local character2 = localPlayer and localPlayer.Character
				character2 = character2 and character2.PrimaryPart
				local position = typeof(arg) == "CFrame" and arg.Position or arg
				if character2 then
					return (character2.Position - position).Magnitude
				end
				return math.huge
			end,
			GetTo = function(arg)
				local character2 = localPlayer and localPlayer.Character

				if character2 and not enabled.IsTeleporting then
					character2:PivotTo(arg)
				end
			end,
			Teleport = function(cFrame)
				local position

				repeat
					position = localPlayer.Character.HumanoidRootPart.CFrame.Position
					fn4(1)
					localPlayer.Character.HumanoidRootPart.CFrame = cFrame
				until (position - cFrame.Position).Magnitude < 1
			end,
			MoveTo = function(arg)
				local character2 = localPlayer and localPlayer.Character
				local primaryPart = character2 and character2.PrimaryPart

				if primaryPart then
					primaryPart.Velocity = Vector3.zero
					primaryPart.RotVelocity = Vector3.zero
					primaryPart.Anchored = true
					local cframe = CFrame.new(arg + Vector3.new(0, 2.5, 0), arg + Vector3.new(0, 2.5, -1))
					enabled.IsTeleporting = true
					character2:SetPrimaryPartCFrame(cframe)
					task.wait(0.06)
					enabled.IsTeleporting = false
					primaryPart.Anchored = false
					primaryPart.Velocity = Vector3.zero
					primaryPart.RotVelocity = Vector3.zero
				end
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
			GetImageURL = function(arg)
				if cached.Image[arg] then
					return cached.Image[arg]
				end
				local str = tostring(arg):gsub("rbxassetid://", "")

				local ok, result = pcall(function()
					return game:HttpGet("https://thumbnails.roblox.com/v1/assets?assetIds=" .. str .. "&size=420x420&format=Png&isCircular=false")
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
			PlayAnimation = function(animationId)
				local humanoid2 = localPlayer.Character:WaitForChild("Humanoid")
				local animator = humanoid2:FindFirstChildOfClass("Animator") or Instance.new("Animator", humanoid2)

				for _, v in ipairs(animator:GetPlayingAnimationTracks()) do
					v:Stop()
				end

				local animation = Instance.new("Animation")
				animation.AnimationId = animationId
				Track = animator:LoadAnimation(animation)
				Track:Play()
				return Track
			end,
			Utils = fn7(),
			World = fn7(),
		}

		local function fn8()
			local tbl4
			tbl4 = {}
			local vector, fn9, fn10, fn11, fn12, fn13, fn14, fn15, fn16, fn17
			local fn18, fn19, fn20, fn21, fn22, fn23

			do
				local TweenService = game:GetService("TweenService")
				local n = 10
				vector = Vector3.new(0, 3, 0)
				local n2 = 15
				cached.autoWalkRunning = false
				cached.autoWinRunId = 0

				local function getCurrentMaxSpeed()
					local speedGameUI = playerGui:FindFirstChild("SpeedGameUI")
					if not speedGameUI then
						return nil
					end

					local ok, result = pcall(function()
						return speedGameUI.Frames.RightFrame.ButtonsFrame.ImageLabel.MaxCustomSpeed.Text
					end)

					if not ok then
						return nil
					end
					local match, v = tostring(result):gsub(",", ""):match("([%d%.]+)%s*([KkMmBb]?)")
					local num = tonumber(match)
					if not num then
						return nil
					end
					return num * (({ K = 1000, M = 1000000, B = 1e9 })[string.upper(v)] or 1)
				end

				local function fn24(arg)
					local num = tonumber(arg)
					if num and num > 0 then
						return num
					end

					if enabled and enabled["Smart Speed"] then
						local v = getCurrentMaxSpeed()
						if v and v > 0 then
							return v
						end
					end

					return tonumber(cached.DEFAULT_WALK_SPEED) or 120
				end

				tbl4.GetCurrentMaxSpeed = getCurrentMaxSpeed

				local tbl5 = {
					idle = "rbxassetid://507766666",
					walk = "rbxassetid://507777826",
					run = "rbxassetid://507767714",
					swim = "rbxassetid://507784897",
					swimidle = "rbxassetid://507785072",
					jump = "rbxassetid://507765000",
					fall = "rbxassetid://507767968",
					climb = "rbxassetid://507765644",
					sit = "rbxassetid://2506281703",
					wave = "rbxassetid://507770239",
					point = "rbxassetid://507770453",
					dance = "rbxassetid://507771019",
					dance2 = "rbxassetid://507776043",
					dance3 = "rbxassetid://507777268",
					laugh = "rbxassetid://507770818",
					cheer = "rbxassetid://507770677",
				}

				fn9 = function(arg, arg2, arg3, arg4)
					local faceNextProgress, speed, animation

					if typeof(arg2) == "string" then
						faceNextProgress = nil
						speed = nil

						if typeof(arg3) == "boolean" then
							animation = arg2
						else
							local flag = typeof(arg3) == "number" and arg3 <= 1
							local flag2 = true
							local flag3 = true

							if flag then
								animation = arg2
								faceNextProgress = arg3
								speed = arg4
								arg3 = flag2
							else
								animation = arg2
								faceNextProgress = arg4
								speed = arg3
								arg3 = flag3
							end
						end
					else
						animation = nil
						faceNextProgress = nil
						arg3 = true

						if typeof(arg2) ~= "table" then
							speed = arg2
						else
							animation = arg2.Animation
							speed = arg2.Speed
							faceNextProgress = arg2.FaceNextProgress
							arg3 = arg2.DetectSpawnWin ~= false
						end
					end

					return {
						Type = "Move",
						Position = arg,
						Speed = speed,
						Animation = animation,
						FaceNextProgress = faceNextProgress,
						DetectSpawnWin = arg3,
					}
				end

				fn10 = function(arg, arg2, arg3)
					return { Type = "WaitPosition", Position = arg, Tolerance = arg2 or 5, Timeout = arg3 or 5 }
				end

				fn11 = function(arg, arg2, arg3, arg4, arg5, arg6, arg7)
					local num = nil

					if typeof(arg5) ~= "boolean" then
						local num2 = typeof(arg5) == "number" or tonumber(arg5)
						local flag = false
						num = nil

						if num2 then
							num = tonumber(arg5)
							arg5 = false
						else
							arg7 = arg6
							arg6 = arg5
							arg5 = flag
						end
					end

					return {
						Type = "Jump",
						Axis = string.lower(tostring(arg or "")),
						Start = arg2,
						Land = arg3,
						JumpHeight = arg4 or 8,
						FollowY = arg5,
						LandingY = num,
						Speed = arg6,
						FaceNextProgress = arg7,
					}
				end

				fn12 = function(arg, arg2, arg3)
					return { Type = "Climb", StartY = tonumber(arg) or arg, EndY = tonumber(arg2) or arg2, Facing = arg3 }
				end

				fn13 = function(arg, arg2)
					return { Type = "DeleteObject", GetTarget = arg, DeleteOnce = arg2 or false, Deleted = false }
				end

				fn14 = function(arg)
					return { Type = "SetFlying", State = arg }
				end

				fn15 = function(arg, arg2, arg3)
					return {
						Type = "WinBlock",
						GetTarget = arg,
						Delay = arg2 or 0.15,
						Timeout = arg3 or 12,
						CheckInterval = 0.15,
					}
				end

				fn16 = function(arg, arg2)
					return { Type = "WaitForTimer", GetTimer = arg, Target = arg2 or 0 }
				end

				fn17 = function(arg, arg2)
					return {
						Type = "WaitTouched",
						Object = arg,
						Target = arg2,
						Size = Vector3.new(10, 10, 10),
						TriggerZone = nil,
						Connection = nil,
						Touched = false,
					}
				end

				fn18 = function()
					local character2 = localPlayer.Character or localPlayer.CharacterAdded:Wait()
					return character2, character2:WaitForChild("Humanoid"), (character2:WaitForChild("HumanoidRootPart"))
				end

				fn19 = function(arg)
					if shx and shx.Unloaded then
						return false
					end

					if not cached.autoWalkRunning or cached.autoWinRunId ~= arg then
						return false
					end
					return humanoid ~= nil and humanoidRootPart ~= nil and humanoid.Health > 0
				end

				fn20 = function(arg)
					if not UserInputService.TouchEnabled then
						return
					end

					if arg then
						if cached.NoInputEnabled then
							return
						end

						if cached.AutoWinTouchControlsDisabled then
							return
						end

						if not cached.Controls then
							local ok, controls = pcall(function()
								return require(localPlayer:WaitForChild("PlayerScripts"):WaitForChild("PlayerModule")):GetControls()
							end)

							if ok then
								cached.Controls = controls
							end
						end

						if cached.Controls then
							cached.Controls:Disable()
							cached.AutoWinTouchControlsDisabled = true
						end
					elseif cached.AutoWinTouchControlsDisabled then
						if cached.Controls and not cached.NoInputEnabled then
							cached.Controls:Enable()
						end

						cached.AutoWinTouchControlsDisabled = false
					end
				end

				fn21 = function(arg)
					return arg == "World 3" and UserInputService.TouchEnabled
				end

				tbl4.ParseWinAmount = function(arg)
					local str = tostring(arg):gsub("Wins", ""):gsub("Cash", ""):gsub(" ", "")
					local tbl6 = { k = 1000, K = 1000, m = 1000000, M = 1000000, b = 1e9, B = 1e9 }
					local str2 = str:sub(-1)

					if tbl6[str2] then
						local str3 = str:sub(1, -2)
						local num = tonumber(str3)
						if num then
							return num * tbl6[str2]
						end
					end

					return tonumber(str) or 0
				end

				tbl4.IsWinLessThanSelected = function(arg)
					local autoWinEffectiveTarget = cached.AutoWinEffectiveTarget or enabled["Select Win Amount"]
					if not autoWinEffectiveTarget then
						return false
					end
					local v = tbl4.ParseWinAmount(autoWinEffectiveTarget)
					return tbl4.ParseWinAmount(tostring(arg)) < v
				end

				local function fn25()
					local speedGameUI = playerGui:FindFirstChild("SpeedGameUI")
					speedGameUI = speedGameUI and speedGameUI:FindFirstChild("Frames")
					speedGameUI = speedGameUI and speedGameUI:FindFirstChild("LevelFrame")
					speedGameUI = speedGameUI and speedGameUI:FindFirstChild("ProgressBg")
					speedGameUI = speedGameUI and speedGameUI:FindFirstChild("LevelText")
					return speedGameUI and tonumber(speedGameUI.Text:match("%d+")) or nil
				end

				local tbl6 = {
					["World 1"] = {
						DefaultTarget = "10 Wins",
						Requirements = {
							{ Level = 5, Target = "20 Wins" },
							{ Level = 13, Target = "50 Wins" },
							{ Level = 28, Target = "150 Wins" },
							{ Level = 35, Target = "300 Wins" },
							{ Level = 40, Target = "500 Wins" },
							{ Level = 54, Target = "10000 Wins" },
							{ Level = 59, Target = "25000 Wins" },
							{ Level = 89, Target = "50000 Wins" },
							{ Level = 100, Target = "150K Wins" },
						},
					},
					BBNO = {
						DefaultTarget = "300 Cash",
						Requirements = {
							{ Level = 40, Target = "500 Cash" },
							{ Level = 54, Target = "10000 Cash" },
							{ Level = 89, Target = "25000 Cash" },
							{ Level = 110, Target = "50000 Cash" },
						},
					},
				}

				tbl4.ResolveSmartTarget = function(arg, arg2)
					local v = tbl6[arg]
					if not v or typeof(arg2) ~= "string" then
						cached.SmartPlayNotificationKey = nil
						return arg2
					end
					local v2 = fn25()
					if not v2 then
						return arg2
					end
					local defaultTarget = v.DefaultTarget

					for _, requirement in ipairs(v.Requirements) do
						if requirement.Level <= v2 then
							defaultTarget = requirement.Target
							continue
						end
						break
					end

					if arg2 == "Smart" then
						cached.SmartPlayNotificationKey = nil
						return defaultTarget
					end

					if tbl4.ParseWinAmount(arg2) <= tbl4.ParseWinAmount(defaultTarget) then
						cached.SmartPlayNotificationKey = nil
						return arg2
					end
					local smartPlayNotificationKey = arg .. ":" .. arg2 .. "->" .. defaultTarget

					if cached.SmartPlayNotificationKey ~= smartPlayNotificationKey then
						cached.SmartPlayNotificationKey = smartPlayNotificationKey
						local v3 = shx
						local setNotification = v3.SetNotification
						local tbl7 = {}
						local str = string.format("Level %d is too low for %s. Switching to %s.", v2, arg2, defaultTarget)
						tbl7[1] = "SMART PLAY"
						tbl7[2] = ""
						tbl7[3] = str
						tbl7[4] = 8
						tbl7[5] = 0.5
						setNotification(v3, tbl7)
					end

					return defaultTarget
				end

				tbl4.EnsureWinRemoteListener = function()
					if connections.WinRemote then
						return
					end

					tbl3.Utils.Connections(showWin.OnClientEvent, function(arg)
						if tbl4.IsWinLessThanSelected(arg) then
							print("Special Keys?")
						else
							cached.winReceived = true
							local spawnLocation = workspace:FindFirstChild("PersistentSpawn") and workspace.PersistentSpawn:FindFirstChild("SpawnLocation")

							if spawnLocation and character then
								local humanoidRootPart2 = character:FindFirstChild("HumanoidRootPart")
								local humanoid2 = character:FindFirstChild("Humanoid")

								if humanoidRootPart2 and humanoid2 then
									if (humanoidRootPart2.Position - spawnLocation.Position).Magnitude > 10 then
										print("Player not near spawn, checking for 3 seconds...")
										local now = tick()
										local flag

										while true do
											task.wait(0.5)
											local humanoidRootPart3 = character:FindFirstChild("HumanoidRootPart")

											if humanoidRootPart3 then
												if (humanoidRootPart3.Position - spawnLocation.Position).Magnitude <= 10 then
													print("Player Near Spawn !")
													flag = true
													break
												else
													flag = false
													if not (tick() - now >= 3) then
														continue
													end
												end

												break
											else
												flag = false
												if not (tick() - now >= 3) then
													continue
												end
												break
											end
										end

										if not flag then
											humanoid2.Health = 0
										end
									end
								end
							end
						end
					end, "WinRemote")
				end

				fn22 = function()
					local character2 = localPlayer.Character
					local humanoid2 = character2 and character2:FindFirstChildOfClass("Humanoid")
					character2 = character2 and character2:FindFirstChild("HumanoidRootPart")

					if humanoid2 and character2 then
						humanoid2:MoveTo(character2.Position)
						humanoid2:Move(Vector3.zero, false)
						character2.AssemblyLinearVelocity = Vector3.zero
						character2.AssemblyAngularVelocity = Vector3.zero
						local autoWinBodyGyro = character2:FindFirstChild("AutoWinBodyGyro")

						if autoWinBodyGyro then
							autoWinBodyGyro:Destroy()
						end

						local autoWinBodyVelocity = character2:FindFirstChild("AutoWinBodyVelocity")

						if autoWinBodyVelocity then
							autoWinBodyVelocity:Destroy()
						end

						humanoid2.PlatformStand = false
					end
				end

				local function fn26(arg)
					local character2 = localPlayer.Character
					local humanoid2 = character2 and character2:FindFirstChildOfClass("Humanoid")
					character2 = character2 and character2:FindFirstChild("HumanoidRootPart")
					if not character2 or not humanoid2 then
						return
					end

					if arg then
						if not character2:FindFirstChild("AutoWinBodyVelocity") then
							humanoid2.PlatformStand = true
							local bodyGyro = Instance.new("BodyGyro")
							bodyGyro.Name = "AutoWinBodyGyro"
							bodyGyro.P = 90000
							bodyGyro.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
							bodyGyro.CFrame = character2.CFrame
							bodyGyro.Parent = character2
							local bodyVelocity = Instance.new("BodyVelocity")
							bodyVelocity.Name = "AutoWinBodyVelocity"
							bodyVelocity.Velocity = Vector3.zero
							bodyVelocity.MaxForce = Vector3.new(9e9, 9e9, 9e9)
							bodyVelocity.Parent = character2
						end
					else
						local autoWinBodyGyro = character2:FindFirstChild("AutoWinBodyGyro")

						if autoWinBodyGyro then
							autoWinBodyGyro:Destroy()
						end

						local autoWinBodyVelocity = character2:FindFirstChild("AutoWinBodyVelocity")

						if autoWinBodyVelocity then
							autoWinBodyVelocity:Destroy()
						end

						humanoid2.PlatformStand = false
					end
				end

				local function fn27(arg, arg2)
					if arg and arg.AutomaticScalingEnabled and arg.HipHeight then
						return math.max(arg.HipHeight / 2, 0.01)
					end

					if arg2 and arg2.GetScale then
						local ok, result = pcall(function()
							return arg2:GetScale()
						end)

						if ok and result and result > 0 then
							return result
						end
					end

					return 1
				end

				local function fn28(arg, arg2, arg3, arg4)
					if arg == "run" then
						local max = math.max
						arg2 = arg2 or 120
						return max(arg2 * 1.25 / 16 * fn27(arg3, arg4), 0.0001)
					end

					if arg == "climb" then
						return math.max((arg2 or 120) / 5 * fn27(arg3, arg4), 0.0001)
					end
					return 1
				end

				local function fn29(arg, arg2, arg3)
					local v = arg and tbl5[arg]
					if not v then
						return nil
					end
					local character2 = localPlayer.Character
					local humanoid2 = character2 and character2:FindFirstChildOfClass("Humanoid")
					if not humanoid2 then
						return nil
					end
					local animator = humanoid2:FindFirstChildOfClass("Animator") or Instance.new("Animator", humanoid2)
					local animation = Instance.new("Animation")
					animation.AnimationId = v
					local v2 = animator:LoadAnimation(animation)
					v2.Priority = Enum.AnimationPriority.Movement
					v2.Looped = arg3 ~= false
					v2:Play(0.1)
					v2:AdjustSpeed(fn28(arg, arg2, humanoid2, character2))
					animation:Destroy()
					return v2
				end

				local function fn30(arg)
					if typeof(arg) ~= "number" then
						return 0.85
					end
					return math.clamp(arg, 0, 1)
				end

				local tbl7 = {
					north = Vector3.new(0, 0, -1),
					south = Vector3.new(0, 0, 1),
					east = Vector3.new(1, 0, 0),
					west = Vector3.new(-1, 0, 0),
					northeast = Vector3.new(1, 0, -1),
					northwest = Vector3.new(-1, 0, -1),
					southeast = Vector3.new(1, 0, 1),
					southwest = Vector3.new(-1, 0, 1),
				}

				local function fn31(arg)
					local vector2 = Vector3.new(arg.X, 0, arg.Z)
					if vector2.Magnitude <= 0.01 then
						return Vector3.new(0, 0, -1)
					end
					return vector2.Unit
				end

				local function fn32(arg, arg2)
					if typeof(arg) == "Vector3" then
						return fn31(arg)
					end
					local v = tbl7[string.lower(tostring(arg or "")):gsub("%s+", "")]
					if v then
						return v.Unit
					end
					return fn31(arg2)
				end

				local function fn33(arg, arg2, arg3, arg4, arg5, arg6, arg7)
					if not fn19(arg3) then
						return false
					end
					local v, v2, v3 = fn18()
					local v4 = fn24(arg2)
					local n3 = math.max((v3.Position - arg).Magnitude / v4, 0.05)
					local position = v3.Position
					local v5 = fn31(v3.CFrame.LookVector)
					local n4 = arg - position
					local n5

					if n4.Magnitude > 0.01 then
						n5 = arg + n4.Unit
					else
						n5 = arg + v3.CFrame.LookVector
					end

					local function fn34(arg8)
						if arg5 == "jump" then
							return v3.Position + v5
						end

						if arg4 and arg8 >= fn30(arg6) then
							return arg4
						end
						local n6 = arg - v3.Position
						if n6.Magnitude > 0.01 then
							return arg + n6.Unit
						end
						return n5
					end

					local tween = TweenService:Create(v3, TweenInfo.new(n3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), { Position = arg })
					local now = os.clock()
					tween:Play()
					local v6 = fn29(arg5, v4)

					while tween.PlaybackState == Enum.PlaybackState.Playing do
						if arg7 ~= false then
							local spawnLocation = workspace:FindFirstChild("SpawnLocation")

							if spawnLocation and spawnLocation:IsA("BasePart") then
								if (v3.Position - spawnLocation.Position).Magnitude <= n2 then
									cached.winReceived = true
									tween:Cancel()
									fn22()

									if v6 then
										v6:Stop(0.1)
										v6:Destroy()
									end

									return false
								end
							end
						end

						if not fn19(arg3) or cached.winReceived then
							tween:Cancel()
							fn22()

							if v6 then
								v6:Stop(0.1)
								v6:Destroy()
							end

							return false
						end

						local n6 = math.clamp((os.clock() - now) / n3, 0, 1)
						local cframe = CFrame.lookAt
						local position2 = v3.Position
						local v7 = fn34(n6)
						v3.CFrame = cframe(position2, v7)
						local autoWinBodyGyro = v3:FindFirstChild("AutoWinBodyGyro")

						if autoWinBodyGyro then
							autoWinBodyGyro.CFrame = v3.CFrame
						end

						task.wait(0.03)
					end

					local flag = tween.PlaybackState == Enum.PlaybackState.Completed

					if v6 then
						v6:Stop(0.1)
						v6:Destroy()
					end

					return flag
				end

				local function fn34(arg, arg2, arg3)
					if not fn19(arg3) then
						return false
					end
					local v, v2, v3 = fn18()
					arg2 = arg2 or 4
					local position = v3.Position
					local now = os.clock()
					v2.PlatformStand = false
					v2:MoveTo(arg)

					while fn19(arg3) and not cached.winReceived do
						if (v3.Position - arg).Magnitude <= arg2 then
							fn22()
							return true
						end

						if not fn19(arg3) or cached.winReceived then
							fn22()
							return false
						end

						if (v3.Position - position).Magnitude > 0.5 then
							position = v3.Position
							now = os.clock()
						elseif os.clock() - now > 2 then
							v2.Jump = true
							v2:MoveTo(arg)
							now = os.clock()
						else
							v2:MoveTo(arg)
						end

						task.wait(0.1)
					end

					fn22()
					return cached.winReceived
				end

				local function fn35(arg, arg2, arg3)
					local axis = arg.Axis
					local num = tonumber(arg.Start)
					local num2 = tonumber(arg.Land)
					local y = tonumber(arg.LandingY) or arg2.Y

					if not arg.LandingY and arg.FollowY and arg3 then
						y = arg3.Y
					end

					if axis == "xz" and typeof(arg.Start) == "table" and typeof(arg.Land) == "table" then
						local num3 = tonumber(arg.Land[1])
						local num4 = tonumber(arg.Land[2])
						if num3 and num4 then
							return Vector3.new(num3, y, num4)
						end
					end

					if not num or not num2 then
						if arg3 and arg.FollowY then
							return arg3
						end
						arg3 = arg3 and Vector3.new(arg3.X, y, arg3.Z)
						return arg3
					end

					if axis == "x" then
						return Vector3.new(num2, y, arg2.Z)
					end

					if axis == "y" or axis == "z" then
						return Vector3.new(arg2.X, y, num2)
					end
					return arg3 and Vector3.new(arg3.X, y, arg3.Z)
				end

				local function fn36(arg, arg2, arg3, arg4, arg5)
					local axis = arg3.Axis
					local num = tonumber(arg3.Start)
					local num2 = tonumber(arg3.Land)
					local n3 = arg.X + (arg2.X - arg.X) * arg5
					local n4 = arg.Z + (arg2.Z - arg.Z) * arg5

					if axis == "xz" and typeof(arg3.Start) == "table" and typeof(arg3.Land) == "table" then
						local num3 = tonumber(arg3.Start[1])
						local num4 = tonumber(arg3.Start[2])
						local num5 = tonumber(arg3.Land[1])
						local num6 = tonumber(arg3.Land[2])

						if num3 and num4 and num5 and num6 then
							n3 = num3 + (num5 - num3) * arg5
							n4 = num4 + (num6 - num4) * arg5
						end
					elseif axis == "x" and num and num2 then
						n3 = num + (num2 - num) * arg5
						n4 = arg.Z
					elseif (axis == "y" or axis == "z") and num and num2 then
						n3 = arg.X
						n4 = num + (num2 - num) * arg5
					end

					return Vector3.new(n3, arg.Y + (arg2.Y - arg.Y) * arg5 + math.sin(3.1415926535897931 * arg5) * arg4, n4)
				end

				local function fn37(arg, arg2, arg3)
					if not fn19(arg3) then
						return false
					end
					local v, v2, v3 = fn18()
					local v4 = fn24(arg.Speed)
					local position = v3.Position
					local v5 = fn35(arg, position, arg2)
					if not v5 then
						return false
					end
					local n3 = math.max(Vector3.new(v5.X - position.X, 0, v5.Z - position.Z).Magnitude / v4, 0.05)
					local jumpHeight = arg.JumpHeight or 8
					local jump = fn29("jump", v4, false)
					local now = os.clock()
					v2.PlatformStand = false
					v2:ChangeState(Enum.HumanoidStateType.Jumping)

					while true do
						if fn19(arg3) and not cached.winReceived then
							local n4 = math.clamp((os.clock() - now) / n3, 0, 1)
							local v6 = fn36(position, v5, arg, jumpHeight, n4)
							local vector2 = Vector3.new(v5.X, v6.Y, v5.Z)

							if n4 < fn30(arg.FaceNextProgress) then
								local n5 = v5 - v3.Position
								local vector3 = Vector3.new(n5.X, 0, n5.Z)

								if vector3.Magnitude > 0.01 then
									vector2 = v6 + vector3.Unit
								end
							end

							v3.CFrame = CFrame.lookAt(v6, vector2)
							local autoWinBodyGyro = v3:FindFirstChild("AutoWinBodyGyro")

							if autoWinBodyGyro then
								autoWinBodyGyro.CFrame = v3.CFrame
							end

							if not (n4 >= 1) then
								RunService.Heartbeat:Wait()
								continue
							end
						end

						break
					end

					if jump then
						jump:Stop(0.1)
						jump:Destroy()
					end

					if not fn19(arg3) or cached.winReceived then
						fn22()
						return cached.winReceived
					end
					local lookVector = v3.CFrame.LookVector
					local vector2 = Vector3.new(lookVector.X, 0, lookVector.Z)

					if vector2.Magnitude <= 0.01 then
						vector2 = Vector3.new(0, 0, -1)
					end

					v3.CFrame = CFrame.lookAt(v5, v5 + vector2.Unit)
					return true
				end

				local function fn38(arg, arg2)
					if not fn19(arg2) then
						return false
					end
					local v, v2, v3 = fn18()
					local num = tonumber(arg.StartY)
					local num2 = tonumber(arg.EndY)
					if not num or not num2 then
						return false
					end
					local v4 = fn24(arg.Speed)
					local vector2 = Vector3.new(v3.Position.X, num, v3.Position.Z)
					local vector3 = Vector3.new(v3.Position.X, num2, v3.Position.Z)
					local n3 = math.max(math.abs(num2 - num) / v4, 0.05)
					local v5 = fn32(arg.Facing, v3.CFrame.LookVector)
					local climb = fn29("climb", v4, true)
					local now = os.clock()
					v2.PlatformStand = false
					v2:ChangeState(Enum.HumanoidStateType.Climbing)

					while true do
						if fn19(arg2) and not cached.winReceived then
							local n4 = math.clamp((os.clock() - now) / n3, 0, 1)
							local v6 = vector2:Lerp(vector3, n4)
							v3.CFrame = CFrame.lookAt(v6, v6 + v5)
							local autoWinBodyGyro = v3:FindFirstChild("AutoWinBodyGyro")

							if autoWinBodyGyro then
								autoWinBodyGyro.CFrame = v3.CFrame
							end

							if not (n4 >= 1) then
								RunService.Heartbeat:Wait()
								continue
							end
						end

						break
					end

					if climb then
						climb:Stop(0.1)
						climb:Destroy()
					end

					if not fn19(arg2) or cached.winReceived then
						fn22()
						return cached.winReceived
					end
					v3.CFrame = CFrame.lookAt(vector3, vector3 + v5)
					return true
				end

				local function fn39(arg, arg2)
					local now = os.clock()
					local result

					while true do
						local flag = fn19(arg2) and not cached.winReceived

						if flag then
							local timeout = arg.Timeout
							flag = os.clock() - now < timeout
						end

						result = nil

						if flag then
							local ok
							ok, result = pcall(arg.GetTarget)
							if not (ok and typeof(result) == "Instance" and result:IsA("BasePart")) then
								task.wait(arg.CheckInterval)
								continue
							end
						end

						break
					end

					if not result then
						return false
					end
					task.wait(arg.Delay)
					if not fn19(arg2) or cached.winReceived then
						return cached.winReceived
					end

					if fn33(result.Position + vector, arg.Speed, arg2) and fn19(arg2) and not cached.winReceived then
						local v, v2 = fn18()
						v2:MoveTo(result.Position)
					end

					local now2 = os.clock()

					while true do
						if fn19(arg2) and not cached.winReceived and os.clock() - now2 < n then
							local spawnLocation = workspace:FindFirstChild("SpawnLocation")
							local character2 = localPlayer.Character
							character2 = character2 and character2:FindFirstChild("HumanoidRootPart")

							if spawnLocation and spawnLocation:IsA("BasePart") and character2 then
								if (character2.Position - spawnLocation.Position).Magnitude <= n2 then
									print("Player Teleported???")
									cached.winReceived = true
									break
								else
									task.wait(0.05)
									continue
								end
							else
								task.wait(0.05)
								continue
							end
						end

						break
					end

					if fn19(arg2) and not cached.winReceived then
						local character2 = localPlayer.Character
						character2 = character2 and character2:FindFirstChildOfClass("Humanoid")

						if character2 then
							character2.Health = 0
						end
					end

					return cached.winReceived
				end

				local function fn40(arg, arg2, arg3)
					local ok, result = pcall(arg)
					if not ok or not result then
						return
					end

					while true do
						task.wait(0.1)
						local flag = not fn19(arg3)

						if not flag then
							flag = math.abs((tonumber(result.Text) or math.huge) - arg2) <= 0.1
						end

						if not flag then
							continue
						end
						break
					end
				end

				local function fn41(arg)
					if typeof(arg) == "function" then
						local ok, result = pcall(arg)
						if ok then
							return result
						end
						return nil
					end

					return arg
				end

				local function fn42(arg, position)
					local triggerZone = arg.TriggerZone

					if not triggerZone or not triggerZone.Parent then
						triggerZone = Instance.new("Part")
						triggerZone.Name = "AutoWinWaitTouchedZone"
						triggerZone.Size = arg.Size or Vector3.new(10, 10, 10)
						triggerZone.Anchored = true
						triggerZone.CanCollide = false
						triggerZone.CanTouch = true
						triggerZone.CanQuery = true
						triggerZone.Transparency = 1
						triggerZone.Parent = workspace
						arg.TriggerZone = triggerZone
					end

					if typeof(position) == "Instance" and position:IsA("BasePart") then
						triggerZone.CFrame = position.CFrame
					elseif typeof(position) == "Vector3" then
						triggerZone.Position = position
					elseif typeof(position) == "CFrame" then
						triggerZone.CFrame = position
					end

					return triggerZone
				end

				local function fn43(arg, arg2)
					arg.Touched = false
					local v = fn41(arg.Object)
					local v2 = fn41(arg.Target)
					if not v or not v2 then
						return false
					end
					local v3 = fn42(arg, v2)

					if arg.Connection then
						arg.Connection:Disconnect()
					end

					arg.Connection = v3.Touched:Connect(function(hit)
						if hit == fn41(arg.Object) then
							arg.Touched = true
						end
					end)

					while true do
						if fn19(arg2) and not cached.winReceived and not arg.Touched then
							local v4 = fn41(arg.Object)
							local v5 = fn41(arg.Target)

							if not (not v4 or not v5) then
								fn42(arg, v5)

								if typeof(v4) == "Instance" and v4:IsA("BasePart") then
									local v6 = ipairs
									local v7 = table.pack(workspace:GetPartBoundsInBox(v3.CFrame, v3.Size))
									v7.n = 1 + v7.n - 1
									table.move(v7, 1, v7.n, 1, v7)

									for _, v8 in v6(table.unpack(v7, 1, v7.n)) do
										if v8 == v4 then
											arg.Touched = true
											break
										end
									end
								end

								task.wait(0.05)
								continue
							end
						end

						break
					end

					if arg.Connection then
						arg.Connection:Disconnect()
						arg.Connection = nil
					end

					return arg.Touched or cached.winReceived
				end

				local function fn44(arg, arg2)
					if not arg then
						return nil
					end

					for i = arg2 + 1, #arg do
						local v = arg[i]
						if v and v.Type == "Move" then
							return v.Position
						end

						if v and v.Type == "WinBlock" then
							local ok, result = pcall(v.GetTarget)
							if ok and typeof(result) == "Instance" and result:IsA("BasePart") then
								return result.Position + vector
							end
						end
					end

					return nil
				end

				fn23 = function(arg, arg2, arg3, arg4)
					if not arg or not fn19(arg2) or cached.winReceived then
						return false
					end

					if arg.Type == "Move" then
						local animation = arg.Animation
						local faceNextProgress = arg.FaceNextProgress
						local detectSpawnWin = arg.DetectSpawnWin
						return fn33(arg.Position, arg.Speed, arg2, fn44(arg3, arg4), animation, faceNextProgress, detectSpawnWin)
					end

					if arg.Type == "Jump" then
						return fn37(arg, fn44(arg3, arg4), arg2)
					end

					if arg.Type == "Climb" then
						return fn38(arg, arg2)
					end

					if arg.Type == "Walk" then
						return fn34(arg.Position, arg.MagnitudeTolerance, arg2)
					end

					if arg.Type == "SetFlying" then
						fn26(arg.State)
						return fn19(arg2)
					end

					if arg.Type == "WinBlock" then
						return fn39(arg, arg2)
					end

					if arg.Type == "WaitForTimer" then
						fn40(arg.GetTimer, arg.Target, arg2)
						return fn19(arg2)
					end

					if arg.Type == "WaitTouched" then
						return fn43(arg, arg2)
					end

					if arg.Type == "DeleteObject" then
						if arg.DeleteOnce and arg.Deleted then
							return fn19(arg2)
						end

						if arg.DeleteOnce then
							arg.Deleted = true
						end

						task.spawn(function()
							local ok, result = pcall(arg.GetTarget)

							if ok and result and result:IsA("Instance") then
								result:Destroy()
							end
						end)

						return fn19(arg2)
					end

					if arg.Type == "Wait" then
						local now = os.clock()

						while true do
							local flag = fn19(arg2) and not cached.winReceived

							if flag then
								flag = os.clock() - now < (arg.Duration or 0)
							end

							if flag then
								task.wait(0.05)
								continue
							end
							break
						end

						return fn19(arg2)
					end

					if arg.Type == "WaitPosition" then
						local character2 = game.Players.LocalPlayer.Character
						if not character2 then
							return false
						end
						local humanoidRootPart2 = character2:FindFirstChild("HumanoidRootPart")
						if not humanoidRootPart2 then
							return false
						end
						local position = arg.Position
						local tolerance = arg.Tolerance or 5
						local n3 = tonumber(arg.Timeout) or 5
						local now = os.clock()

						while fn19(arg2) and not cached.winReceived and os.clock() - now < n3 do
							if (humanoidRootPart2.Position - position).Magnitude <= tolerance then
								return true
							end
							task.wait(0.1)
						end

						if fn19(arg2) and not cached.winReceived then
							local humanoid2 = character2:FindFirstChildOfClass("Humanoid")

							if humanoid2 then
								humanoid2.Health = 0
							end

							return false
						end

						return cached.winReceived
					end

					return true
				end
			end

			local fn24

			fn24 = function(arg, arg2)
				local tbl5 = {}
				local n = #arg - 2

				if arg and n > 0 then
					for i = 1, n do
						tbl5[i] = arg[i]
					end
				end

				for _, v in ipairs(arg2) do
					table.insert(tbl5, v)
				end

				return tbl5
			end

			local tbl5
			tbl5 = {}

			do
				local tbl6 = {}
				local v = fn9(Vector3.new(2.81, 7.68, 129.98), "run", false)
				local v2 = fn9(Vector3.new(-0.48, 7.68, 284.92), "run", 0.95)
				local v3 = fn9(Vector3.new(-13.25, 11.31, 285.25), "run")

				local v4 = fn15(function()
					return workspace.Structure.Stage2.WinBlock1
				end, 0.2)

				tbl6[1] = v
				tbl6[2] = v2
				tbl6[3] = v3
				tbl6[4] = v4
				tbl5["1 Win"] = tbl6
			end

			do
				local n1Win = tbl5["1 Win"]
				local tbl6 = {}
				local v = fn9(Vector3.new(50.45, 7.68, 399.32), "run")
				local v2 = fn9(Vector3.new(0.22, 7.68, 504.8), "run")
				local v3 = fn9(Vector3.new(-16.12, 10.65, 507.26), "run")

				local v4 = fn15(function()
					return workspace.Structure.Stage3.WinBlock2
				end, 0.2)

				tbl6[1] = v
				tbl6[2] = v2
				tbl6[3] = v3
				tbl6[4] = v4
				tbl5["3 Wins"] = fn24(n1Win, tbl6)
			end

			do
				local n3Wins = tbl5["3 Wins"]
				local tbl6 = {}
				local v = fn9(Vector3.new(-12.28, 7.68, 526.86), "run")
				local v2 = fn9(Vector3.new(-15.79, 7.68, 559.83), "run")
				local v3 = fn9(Vector3.new(-16.23, 49.29, 677.16), "run")
				local v4 = fn9(Vector3.new(-15.94, 75.96, 757.34), "run")
				local v5 = fn9(Vector3.new(-15.92, 77.92, 774.04), "run")

				local v6 = fn15(function()
					return workspace.Structure.Stage4.WinBlock3
				end, 0.2)

				tbl6[1] = v
				tbl6[2] = v2
				tbl6[3] = v3
				tbl6[4] = v4
				tbl6[5] = v5
				tbl6[6] = v6
				tbl5["10 Wins"] = fn24(n3Wins, tbl6)
			end

			do
				local n10Wins = tbl5["10 Wins"]
				local tbl6 = {}
				local v = fn9(Vector3.new(1.09, 77.14, 789.13), "run")
				local v2 = fn9(Vector3.new(2.33, 77.14, 817.71), "run")
				local v3 = fn11("z", 817.71, 853.24, 5)
				local v4 = fn9(Vector3.new(3.68, 77.14, 900.07), "run")
				local v5 = fn11("z", 900.07, 921.4, 5)
				local v6 = fn9(Vector3.new(3.89, 77.14, 945.26), "run")
				local v7 = fn11("z", 945.26, 998.72, 5)
				local v8 = fn9(Vector3.new(3.8, 77.14, 1013.27), "run")
				local v9 = fn11("z", 1013.27, 1036.98, 5)
				local v10 = fn9(Vector3.new(-3.04, 77.14, 1103.8), "run")
				local v11 = fn9(Vector3.new(-14.89, 78.94, 1108.95), "run")

				local v12 = fn15(function()
					return workspace.Structure.Stage5.WinBlock4
				end, 0.2)

				tbl6[1] = v
				tbl6[2] = v2
				tbl6[3] = v3
				tbl6[4] = v4
				tbl6[5] = v5
				tbl6[6] = v6
				tbl6[7] = v7
				tbl6[8] = v8
				tbl6[9] = v9
				tbl6[10] = v10
				tbl6[11] = v11
				tbl6[12] = v12
				tbl5["20 Wins"] = fn24(n10Wins, tbl6)
			end

			do
				local n20Wins = tbl5["20 Wins"]
				local tbl6 = {}
				local v = fn9(Vector3.new(-0.39, 77.14, 1125.59), "run")
				local v2 = fn9(Vector3.new(-0.17, 77.14, 1151.55), "run")
				local v3 = fn9(Vector3.new(1.67, 77.14, 1358.6), "run")
				local v4 = fn9(Vector3.new(2.12, 77.14, 1410.29), "run")
				local v5 = fn9(Vector3.new(-20.89, 78.4, 1412.88), "run")

				local v6 = fn15(function()
					return workspace.Structure.Stage6.WinBlock5
				end, 0.2)

				tbl6[1] = v
				tbl6[2] = v2
				tbl6[3] = v3
				tbl6[4] = v4
				tbl6[5] = v5
				tbl6[6] = v6
				tbl5["50 Wins"] = fn24(n20Wins, tbl6)
			end

			do
				local n50Wins = tbl5["50 Wins"]
				local tbl6 = {}
				local v = fn9(Vector3.new(1.71, 75.96, 1420.83), { Animation = "run", Speed = 150 })

				local v2 = fn16(function()
					return workspace["NPC & Piege"].Tsunami1.TimerPart.StageGui.Timer
				end, 0.1)

				local v3 = fn9(Vector3.new(-126.49, 53.31, 1444.94), { Animation = "run", Speed = 150 })
				local v4 = fn9(Vector3.new(-433.16, 53.31, 1463.62), { Animation = "run", Speed = 150 })
				local v5 = fn9(Vector3.new(-546.43, 53.32, 1463.7), { Animation = "run", Speed = 150 })
				local v6 = fn9(Vector3.new(-539.85, 55.15, 1448.3), { Animation = "run", Speed = 150 })

				local v7 = fn15(function()
					return workspace.Structure.Stage7.WinBlock6
				end, 0.2)

				tbl6[1] = v
				tbl6[2] = v2
				tbl6[3] = v3
				tbl6[4] = v4
				tbl6[5] = v5
				tbl6[6] = v6
				tbl6[7] = v7
				tbl5["100 Wins"] = fn24(n50Wins, tbl6)
			end

			do
				local n100Wins = tbl5["100 Wins"]
				local tbl6 = {}
				local v = fn9(Vector3.new(-712.52, 53.32, 1465.25), "run")
				local v2 = fn9(Vector3.new(-1007.36, 53.32, 1466.5), "run")
				local v3 = fn9(Vector3.new(-1008.4, 55.29, 1451.05), "run")

				local v4 = fn15(function()
					return workspace.Structure.Stage8.WinBlock7
				end, 0.2)

				tbl6[1] = v
				tbl6[2] = v2
				tbl6[3] = v3
				tbl6[4] = v4
				tbl5["150 Wins"] = fn24(n100Wins, tbl6)
			end

			do
				local n150Wins = tbl5["150 Wins"]
				local tbl6 = {}
				local v = fn9(Vector3.new(-1028.58, 54.5, 1467.1), "run")
				local v2 = fn9(Vector3.new(-1087.28, 58.04, 1467.11), "run")
				local v3 = fn12(58.04, 295.23, "west")
				local v4 = fn9(Vector3.new(-1093.82, 296.5, 1466.77), "run")
				local v5 = fn9(Vector3.new(-1121.53, 296.5, 1464.99), "run")
				local v6 = fn9(Vector3.new(-1123.63, 298.61, 1452.2), "run")

				local v7 = fn15(function()
					return workspace.Structure.Stage9.WinBlock8
				end, 0.2)

				tbl6[1] = v
				tbl6[2] = v2
				tbl6[3] = v3
				tbl6[4] = v4
				tbl6[5] = v5
				tbl6[6] = v6
				tbl6[7] = v7
				tbl5["300 Wins"] = fn24(n150Wins, tbl6)
			end

			local n300Wins
			n300Wins = tbl5["300 Wins"]
			local tbl6
			tbl6 = {}

			do
				local v = fn9(Vector3.new(-1133.99, 296.5, 1466.29), "run")
				local v2 = fn9(Vector3.new(-1185.22, 296.61, 1466.74), "run")
				local v3 = fn9(Vector3.new(-1244.5, 303.8, 1467.25), "run")
				local v4 = fn11("x", -1244.5, -1357.63, 8, 282.47)
				local v5 = fn9(Vector3.new(-1368.79, 282.47, 1468.33), "run")
				local v6 = fn9(Vector3.new(-1379.12, 291.39, 1468.48), "run")
				local v7 = fn9(Vector3.new(-1390.21, 302.46, 1468.64), "run")
				local v8 = fn9(Vector3.new(-1401.94, 314.2, 1468.82), "run")
				local v9 = fn9(Vector3.new(-1414.42, 326.69, 1469.01), "run")
				local v10 = fn9(Vector3.new(-1422.28, 334.55, 1469.1), "run")
				local v11 = fn9(Vector3.new(-1436.97, 336.87, 1469.23), "run")
				local v12 = fn9(Vector3.new(-1467.19, 336.87, 1469.49), "run")
				local v13 = fn9(Vector3.new(-1506.06, 336.87, 1469.83), "run")
				local v14 = fn11("x", -1506.06, -1565.56, 8, 321.27)
				local v15 = fn9(Vector3.new(-1624.22, 321.27, 1470.85), "run")
				local v16 = fn11("x", -1624.22, -1746.12, 8, 290.87)
				local v17 = fn9(Vector3.new(-1778.99, 291.09, 1472.18), "run")
				local v18 = fn9(Vector3.new(-1818.14, 301.58, 1472.52), "run")
				local v19 = fn9(Vector3.new(-1861.72, 317.34, 1472.83), "run")
				local v20 = fn11("x", -1861.72, -1934.48, 8, 307.45)
				local v21 = fn9(Vector3.new(-2045.2, 307.45, 1474.42), "run")
				local v22 = fn11("x", -2045.2, -2127.3, 8, 307.67)
				local v23 = fn9(Vector3.new(-2155.3, 317.38, 1475.39), "run")
				local v24 = fn9(Vector3.new(-2175.94, 324.53, 1475.57), "run")
				local v25 = fn11("x", -2175.94, -2251.62, 8, 314.07)
				local v26 = fn9(Vector3.new(-2279.1, 314.07, 1476.47), "run")
				local v27 = fn9(Vector3.new(-2307.45, 314.07, 1476.71), "run")
				local v28 = fn9(Vector3.new(-2342.51, 325.01, 1477.02), "run")
				local v29 = fn11("x", -2342.51, -2417.97, 8, 322.77)
				local v30 = fn9(Vector3.new(-2429.93, 322.77, 1474.25), "run")
				local v31 = fn9(Vector3.new(-2494.78, 322.76, 1472.55), "run")
				local v32 = fn9(Vector3.new(-2523.56, 322.77, 1486.14), "run")
				local v33 = fn11("x", -2523.56, -2627.28, 8, 294.27)
				local v34 = fn9(Vector3.new(-2650.38, 294.27, 1499.56), "run")
				local v35 = fn9(Vector3.new(-2703.93, 294.27, 1484.21), "run")
				local v36 = fn9(Vector3.new(-2786.51, 308.04, 1472.55), "run")
				local v37 = fn11("x", -2786.51, -2871.51, 8, 283.33)
				local v38 = fn9(Vector3.new(-2880.38, 283.33, 1474.26), "run")
				local v39 = fn9(Vector3.new(-2972.13, 296.5, 1468.36), "run")
				local v40 = fn9(Vector3.new(-2973.39, 299.56, 1449.55), "run")

				local v41 = fn15(function()
					return workspace.Structure.Stage10.WinBlock9
				end, 0.2)

				tbl6[1] = v
				tbl6[2] = v2
				tbl6[3] = v3
				tbl6[4] = v4
				tbl6[5] = v5
				tbl6[6] = v6
				tbl6[7] = v7
				tbl6[8] = v8
				tbl6[9] = v9
				tbl6[10] = v10
				tbl6[11] = v11
				tbl6[12] = v12
				tbl6[13] = v13
				tbl6[14] = v14
				tbl6[15] = v15
				tbl6[16] = v16
				tbl6[17] = v17
				tbl6[18] = v18
				tbl6[19] = v19
				tbl6[20] = v20
				tbl6[21] = v21
				tbl6[22] = v22
				tbl6[23] = v23
				tbl6[24] = v24
				tbl6[25] = v25
				tbl6[26] = v26
				tbl6[27] = v27
				tbl6[28] = v28
				tbl6[29] = v29
				tbl6[30] = v30
				tbl6[31] = v31
				tbl6[32] = v32
				tbl6[33] = v33
				tbl6[34] = v34
				tbl6[35] = v35
				tbl6[36] = v36
				tbl6[37] = v37
				tbl6[38] = v38
				tbl6[39] = v39
				tbl6[40] = v40
				tbl6[41] = v41
			end

			tbl5["500 Wins"] = fn24(n300Wins, tbl6)

			do
				local n500Wins = tbl5["500 Wins"]
				local tbl7 = {}
				local v = fn9(Vector3.new(-3251.58, 295.32, 1468.47), "run")
				local v2 = fn9(Vector3.new(-3732.62, 295.32, 1464.91), "run")
				local v3 = fn9(Vector3.new(-3943.55, 295.32, 1466.12), "run")
				local v4 = fn9(Vector3.new(-3939.01, 299.56, 1447.85), "run")

				local v5 = fn15(function()
					return workspace.Structure.Stage11.WinBlock10
				end, 0.2)

				tbl7[1] = v
				tbl7[2] = v2
				tbl7[3] = v3
				tbl7[4] = v4
				tbl7[5] = v5
				tbl5["1000 Wins"] = fn24(n500Wins, tbl7)
			end

			do
				local n1000Wins = tbl5["1000 Wins"]
				local tbl7 = {}
				local v = fn9(Vector3.new(-3944.82, 296.5, 1465.57), "run")
				local v2 = fn9(Vector3.new(-3992.31, 296.5, 1463.09), "run")
				local v3 = fn11("x", -3992.31, -4101.22, 8, 296.5)
				local v4 = fn9(Vector3.new(-4186.61, 296.5, 1464.14), "run")
				local v5 = fn11("x", -4186.61, -4292.88, 8, 296.5)
				local v6 = fn9(Vector3.new(-4302.06, 296.48, 1467.15), "run")
				local v7 = fn12(296.48, 342.63)
				local v8 = fn9(Vector3.new(-4308.52, 371.21, 1467.09), "jump")
				local v9 = fn9(Vector3.new(-4294.34, 448.33, 1502.85), "jump")
				local v10 = fn9(Vector3.new(-4298.7, 504.16, 1525.44), "jump")
				local v11 = fn9(Vector3.new(-4298.7, 497.07, 1525.44), "jump")
				local v12 = fn9(Vector3.new(-4309.03, 472.36, 1527.47), "run")
				local v13 = fn9(Vector3.new(-4366.92, 471.01, 1526.97), "run")
				local v14 = fn9(Vector3.new(-4368.75, 474.62, 1513.47), "run")

				local v15 = fn15(function()
					return workspace.Structure.Stage12.WinBlock11
				end, 0.1)

				tbl7[1] = v
				tbl7[2] = v2
				tbl7[3] = v3
				tbl7[4] = v4
				tbl7[5] = v5
				tbl7[6] = v6
				tbl7[7] = v7
				tbl7[8] = v8
				tbl7[9] = v9
				tbl7[10] = v10
				tbl7[11] = v11
				tbl7[12] = v12
				tbl7[13] = v13
				tbl7[14] = v14
				tbl7[15] = v15
				tbl5["2500 Wins"] = fn24(n1000Wins, tbl7)
			end

			do
				local n2500Wins = tbl5["2500 Wins"]
				local tbl7 = {}
				local v = fn9(Vector3.new(-4584.82, 469.65, 1529.69), "run")
				local v2 = fn9(Vector3.new(-4628.37, 469.65, 1141.16), "run")
				local v3 = fn9(Vector3.new(-5046.67, 469.65, 1588.44), "run")
				local v4 = fn9(Vector3.new(-5266.65, 469.65, 1477.57), "run")
				local v5 = fn9(Vector3.new(-5341.57, 469.43, 1477.3), "run")
				local v6 = fn9(Vector3.new(-5341.17, 472.4, 1459.22), "run")

				local v7 = fn15(function()
					return workspace.Structure.Stage13.WinBlock12
				end, 0.1)

				tbl7[1] = v
				tbl7[2] = v2
				tbl7[3] = v3
				tbl7[4] = v4
				tbl7[5] = v5
				tbl7[6] = v6
				tbl7[7] = v7
				tbl5["10000 Wins"] = fn24(n2500Wins, tbl7)
			end

			do
				local n10000Wins = tbl5["10000 Wins"]
				local tbl7 = {}
				local v = fn9(Vector3.new(-5398.84, 476.83, 1480.4), "run")
				local v2 = fn9(Vector3.new(-5902.1, 486.11, 1565.53), "run")
				local v3 = fn9(Vector3.new(-6479.85, 488.56, 1388.15), "run")
				local v4 = fn9(Vector3.new(-6808.44, 520.43, 1487.06), "run")
				local v5 = fn9(Vector3.new(-6808.57, 523.6, 1470.37), "run")

				local v6 = fn15(function()
					return workspace.Structure.Stage14.WinBlock13
				end, 0.1)

				tbl7[1] = v
				tbl7[2] = v2
				tbl7[3] = v3
				tbl7[4] = v4
				tbl7[5] = v5
				tbl7[6] = v6
				tbl5["25000 Wins"] = fn24(n10000Wins, tbl7)
			end

			do
				local n25000Wins = tbl5["25000 Wins"]
				local tbl7 = {}
				local v = fn9(Vector3.new(-6858.1, 551.99, 1489.02), "run")
				local v2 = fn9(Vector3.new(-8308.83, 551.99, 1489.02), "run")
				local v3 = fn9(Vector3.new(-8345.8, 484.49, 1489.52), "run")
				local v4 = fn9(Vector3.new(-8353.04, 490.49, 1468.88), "run")

				local v5 = fn15(function()
					return workspace.Structure.Stage15.WinBlock14
				end, 0.1)

				tbl7[1] = v
				tbl7[2] = v2
				tbl7[3] = v3
				tbl7[4] = v4
				tbl7[5] = v5
				tbl5["50000 Wins"] = fn24(n25000Wins, tbl7)
			end

			local n50000Wins
			n50000Wins = tbl5["50000 Wins"]
			local tbl7
			tbl7 = {}

			do
				local v = fn9(Vector3.new(-8453.98, 484.49, 1490.244), "run")
				local v2 = fn9(Vector3.new(-8802.23, 500.14, 1486.852), "run")
				local v3 = fn9(Vector3.new(-9143.41, 503.41, 1393.124), "run")
				local v4 = fn9(Vector3.new(-9375.97, 505.18, 1388.144), "run")
				local v5 = fn9(Vector3.new(-9507.49, 506.27, 1484.711), "run")
				local v6 = fn9(Vector3.new(-9899.78, 500.4, 1484.911), "run")
				local v7 = fn9(Vector3.new(-10160.3, 504.36, 1484.862), "run")
				local v8 = fn9(Vector3.new(-10253.13, 504.21, 1485.302), "run")
				local v9 = fn9(Vector3.new(-10256.06, 527.41, 1593.329), "run")
				local v10 = fn9(Vector3.new(-10352.32, 436.98, 1716.224), "run")
				local v11 = fn9(Vector3.new(-10360.53, 442.96, 1792.248), "run")
				local v12 = fn9(Vector3.new(-10360.24, 545.07, 2339.724), "run")
				local v13 = fn9(Vector3.new(-10359.65, 745.49, 3417.401), "run")
				local v14 = fn9(Vector3.new(-10474.12, 751.02, 3580.787), "run")
				local v15 = fn9(Vector3.new(-10684.21, 751.61, 3579.589), "run")
				local v16 = fn9(Vector3.new(-10745.23, 808.04, 3586.674), "run")
				local v17 = fn9(Vector3.new(-12045.39, 804.5, 3574.341), "run")
				local v18 = fn9(Vector3.new(-12118.14, 751.43, 3576.324), "run")
				local v19 = fn9(Vector3.new(-13209.91, 750.54, 3586.828), "run")
				local v20 = fn9(Vector3.new(-13406.26, 750.54, 3679.525), "run")
				local v21 = fn9(Vector3.new(-13424.09, 750.54, 3382.024), "run")
				local v22 = fn9(Vector3.new(-13625.38, 750.54, 3349.125), "run")
				local v23 = fn9(Vector3.new(-13632.23, 750.54, 3198.804), "run")
				local v24 = fn9(Vector3.new(-13869.61, 750.54, 3224.189), "run")
				local v25 = fn9(Vector3.new(-13718.49, 750.54, 3448.185), "run")
				local v26 = fn9(Vector3.new(-13709.48, 750.54, 3779.334), "run")
				local v27 = fn9(Vector3.new(-13637.45, 750.54, 3975.037), "run")
				local v28 = fn9(Vector3.new(-13989.7, 750.54, 3964.212), "run")
				local v29 = fn9(Vector3.new(-13994.57, 750.54, 3172.296), "run")
				local v30 = fn9(Vector3.new(-14002.12, 750.54, 3097.345), "run")
				local v31 = fn9(Vector3.new(-14001.91, 754.54, 3067.99), "run")

				local v32 = fn15(function()
					return workspace.Structure.Stage15.WinBlock14
				end, 0.1)

				tbl7[1] = v
				tbl7[2] = v2
				tbl7[3] = v3
				tbl7[4] = v4
				tbl7[5] = v5
				tbl7[6] = v6
				tbl7[7] = v7
				tbl7[8] = v8
				tbl7[9] = v9
				tbl7[10] = v10
				tbl7[11] = v11
				tbl7[12] = v12
				tbl7[13] = v13
				tbl7[14] = v14
				tbl7[15] = v15
				tbl7[16] = v16
				tbl7[17] = v17
				tbl7[18] = v18
				tbl7[19] = v19
				tbl7[20] = v20
				tbl7[21] = v21
				tbl7[22] = v22
				tbl7[23] = v23
				tbl7[24] = v24
				tbl7[25] = v25
				tbl7[26] = v26
				tbl7[27] = v27
				tbl7[28] = v28
				tbl7[29] = v29
				tbl7[30] = v30
				tbl7[31] = v31
				tbl7[32] = v32
			end

			tbl5["150K Wins"] = fn24(n50000Wins, tbl7)
			local tbl8
			tbl8 = {}

			do
				local tbl9 = {}
				local v = fn9(Vector3.new(-393.47, 505, -44.82), "run", false)
				local v2 = fn9(Vector3.new(-393.71, 504.09, 2.43), "run")
				local v3 = fn11("z", 2.43, 48.95, 7.65)
				local v4 = fn9(Vector3.new(-400.65, 504.09, 74.35), "run")
				local v5 = fn11("z", 74.35, 121.47, 7.65)
				local v6 = fn9(Vector3.new(-402.55, 504.09, 136.23), "run")
				local v7 = fn11("z", 136.23, 175.91, 7.65)
				local v8 = fn9(Vector3.new(-415.55, 500.99, 189.32), "run", 0.95)

				local v9 = fn15(function()
					return workspace["WORLD 2"].Winblocks.WinBlock16
				end, 0.1)

				tbl9[1] = v
				tbl9[2] = v2
				tbl9[3] = v3
				tbl9[4] = v4
				tbl9[5] = v5
				tbl9[6] = v6
				tbl9[7] = v7
				tbl9[8] = v8
				tbl9[9] = v9
				tbl8["250K Wins"] = tbl9
			end

			do
				local n250kWins = tbl8["250K Wins"]
				local tbl9 = {}
				local v = fn9(Vector3.new(-399.46, 498.99, 198.01), "run")
				local v2 = fn9(Vector3.new(-399.82, 498.99, 267.71), "run")
				local v3 = fn9(Vector3.new(-400.21, 498.99, 341.16), "run")
				local v4 = fn9(Vector3.new(-400.58, 498.99, 412.84), "run")
				local v5 = fn9(Vector3.new(-416.32, 500.83, 433.69), "run")

				local v6 = fn15(function()
					return workspace["WORLD 2"].Winblocks.WinBlock17
				end, 0.1)

				tbl9[1] = v
				tbl9[2] = v2
				tbl9[3] = v3
				tbl9[4] = v4
				tbl9[5] = v5
				tbl9[6] = v6
				tbl8["400K Wins"] = fn24(n250kWins, tbl9)
			end

			do
				local n400kWins = tbl8["400K Wins"]
				local tbl9 = {}
				local v = fn9(Vector3.new(-398.2, 500.03, 463.03), "run")
				local v2 = fn9(Vector3.new(-347.46, 500.03, 469.68), "run")
				local v3 = fn9(Vector3.new(-349.14, 527.1, 573.13), "run")
				local v4 = fn9(Vector3.new(-447.89, 527.1, 576.56), "run")
				local v5 = fn9(Vector3.new(-452.08, 554.1, 472.3), "run")
				local v6 = fn9(Vector3.new(-352.86, 554.1, 465.77), "run")
				local v7 = fn9(Vector3.new(-349.44, 581.17, 571.67), "run")
				local v8 = fn9(Vector3.new(-454.37, 581.17, 573.74), "run")
				local v9 = fn9(Vector3.new(-448.42, 608.17, 475.03), "run")
				local v10 = fn9(Vector3.new(-398.27, 608.17, 473.62), "run")
				local v11 = fn9(Vector3.new(-398.65, 607.96, 597.59), "run")
				local v12 = fn9(Vector3.new(-417.61, 608.64, 607.74), "run")

				local v13 = fn15(function()
					return workspace["WORLD 2"].Winblocks.WinBlock18
				end, 0.1)

				tbl9[1] = v
				tbl9[2] = v2
				tbl9[3] = v3
				tbl9[4] = v4
				tbl9[5] = v5
				tbl9[6] = v6
				tbl9[7] = v7
				tbl9[8] = v8
				tbl9[9] = v9
				tbl9[10] = v10
				tbl9[11] = v11
				tbl9[12] = v12
				tbl9[13] = v13
				tbl8["600K Wins"] = fn24(n400kWins, tbl9)
			end

			do
				local n600kWins = tbl8["600K Wins"]
				local tbl9 = {}
				local v = fn9(Vector3.new(-398.68, 606.78, 608.25), "run")
				local v2 = fn11("z", 608.25, 839.73, 15.5)
				local v3 = fn9(Vector3.new(-418.31, 608.6, 841.45), "run")

				local v4 = fn15(function()
					return workspace["WORLD 2"].Winblocks.WinBlock19
				end, 0.1)

				tbl9[1] = v
				tbl9[2] = v2
				tbl9[3] = v3
				tbl9[4] = v4
				tbl8["1M Wins"] = fn24(n600kWins, tbl9)
			end

			do
				local n1mWins = tbl8["1M Wins"]
				local tbl9 = {}
				local v = fn9(Vector3.new(-400.1, 606.34, 844.76), "run")
				local v2 = fn9(Vector3.new(-400.4, 606.34, 1069.42), "run")
				local v3 = fn9(Vector3.new(-398.86, 606.34, 1260.08), "run")
				local v4 = fn9(Vector3.new(-415.33, 608.22, 1261.47), "run")

				local v5 = fn15(function()
					return workspace["WORLD 2"].Winblocks.WinBlock20
				end, 0.1)

				tbl9[1] = v
				tbl9[2] = v2
				tbl9[3] = v3
				tbl9[4] = v4
				tbl9[5] = v5
				tbl8["1.5M Wins"] = fn24(n1mWins, tbl9)
			end

			do
				local n15mWins = tbl8["1.5M Wins"]
				local tbl9 = {}
				local v = fn9(Vector3.new(-398.84, 607.52, 1287.8), "run")
				local v2 = fn9(Vector3.new(-399.64, 619.24, 1332.89), "run")
				local v3 = fn11("z", 1332.89, 1432.4, 5)
				local v4 = fn9(Vector3.new(-393.64, 607.52, 1455.49), "jump")
				local v5 = fn9(Vector3.new(-391.58, 607.52, 1463.43), "run")
				local v6 = fn9(Vector3.new(-386.61, 607.54, 1477.1), "run")
				local v7 = fn9(Vector3.new(-364.94, 627.82, 1540.56), "run")
				local v8 = fn9(Vector3.new(-364.42, 628.31, 1600.44), "run")
				local v9 = fn11("z", 1600.44, 1694.74, 5)
				local v10 = fn9(Vector3.new(-362.27, 605.4, 1723.56), "jump")
				local v11 = fn9(Vector3.new(-362.05, 605.4, 1752.47), "run")
				local v12 = fn9(Vector3.new(-368.45, 616.15, 1789.31), "run")
				local v13 = fn11("z", 1789.31, 1860.39, 5)
				local v14 = fn9(Vector3.new(-398.33, 607.52, 1884.31), "jump")
				local v15 = fn9(Vector3.new(-401.3, 607.52, 1917.52), "run")
				local v16 = fn9(Vector3.new(-401.18, 618.63, 1956.97), "run")
				local v17 = fn11("z", 1956.97, 2068, 5)
				local v18 = fn9(Vector3.new(-398.73, 607.52, 2098.8), "run")
				local v19 = fn9(Vector3.new(-399.39, 618.21, 2136.59), "run")
				local v20 = fn11("z", 2136.59, 2249.81, 5)
				local v21 = fn9(Vector3.new(-401.83, 607.52, 2276.35), "run")
				local v22 = fn9(Vector3.new(-402.5, 624.35, 2314.6), "run")
				local v23 = fn11("z", 2314.6, 2380.09, 5)
				local v24 = fn9(Vector3.new(-404.03, 624, 2402.7), "run")
				local v25 = fn9(Vector3.new(-417.27, 624, 2415.65), "run")

				local v26 = fn15(function()
					return workspace["WORLD 2"].Winblocks.WinBlock21
				end, 0.1)

				tbl9[1] = v
				tbl9[2] = v2
				tbl9[3] = v3
				tbl9[4] = v4
				tbl9[5] = v5
				tbl9[6] = v6
				tbl9[7] = v7
				tbl9[8] = v8
				tbl9[9] = v9
				tbl9[10] = v10
				tbl9[11] = v11
				tbl9[12] = v12
				tbl9[13] = v13
				tbl9[14] = v14
				tbl9[15] = v15
				tbl9[16] = v16
				tbl9[17] = v17
				tbl9[18] = v18
				tbl9[19] = v19
				tbl9[20] = v20
				tbl9[21] = v21
				tbl9[22] = v22
				tbl9[23] = v23
				tbl9[24] = v24
				tbl9[25] = v25
				tbl9[26] = v26
				tbl8["2.5M Wins"] = fn24(n15mWins, tbl9)
			end

			do
				local n25mWins = tbl8["2.5M Wins"]
				local tbl9 = {}
				local v = fn9(Vector3.new(-400.82, 623.41, 2632.3), "run")
				local v2 = fn9(Vector3.new(-417.27, 621.4, 2650.78), "run")

				local v3 = fn15(function()
					return workspace["WORLD 2"].Winblocks.WinBlock22
				end, 0.1)

				tbl9[1] = v
				tbl9[2] = v2
				tbl9[3] = v3
				tbl8["4M Wins"] = fn24(n25mWins, tbl9)
			end

			do
				local n4mWins = tbl8["4M Wins"]
				local tbl9 = {}
				local v = fn9(Vector3.new(-400.52, 623.43, 3153.41), "run")
				local v2 = fn9(Vector3.new(-417.27, 621.22, 3158.65), "run")

				local v3 = fn15(function()
					return workspace["WORLD 2"].Winblocks.WinBlock23
				end, 0.1)

				tbl9[1] = v
				tbl9[2] = v2
				tbl9[3] = v3
				tbl8["6M Wins"] = fn24(n4mWins, tbl9)
			end

			do
				local n6mWins = tbl8["6M Wins"]
				local tbl9 = {}
				local v = fn9(Vector3.new(-389.13, 623.43, 3336.43), "run")
				local v2 = fn9(Vector3.new(-196.84, 623.43, 3348.66), "run")
				local v3 = fn9(Vector3.new(-165.79, 623.43, 3259.28), "run")
				local v4 = fn9(Vector3.new(-111.84, 623.43, 3267.77), "run")
				local v5 = fn9(Vector3.new(-114.05, 623.43, 3423.23), "run")
				local v6 = fn9(Vector3.new(-272.18, 623.43, 3438.41), "run")
				local v7 = fn9(Vector3.new(-252.02, 623.43, 3627.99), "run")
				local v8 = fn9(Vector3.new(-549.29, 623.43, 3618.9), "run")
				local v9 = fn9(Vector3.new(-566.19, 623.43, 3800.48), "run")
				local v10 = fn9(Vector3.new(-125.02, 623.43, 3798.86), "run")
				local v11 = fn9(Vector3.new(-117.85, 623.43, 3869.58), "run")
				local v12 = fn9(Vector3.new(-61.37, 623.5, 3868.81), "run")
				local v13 = fn9(Vector3.new(-59.9, 624.76, 3881.49), "run")

				local v14 = fn15(function()
					return workspace["WORLD 2"].Winblocks.WinBlock24
				end, 0.1)

				tbl9[1] = v
				tbl9[2] = v2
				tbl9[3] = v3
				tbl9[4] = v4
				tbl9[5] = v5
				tbl9[6] = v6
				tbl9[7] = v7
				tbl9[8] = v8
				tbl9[9] = v9
				tbl9[10] = v10
				tbl9[11] = v11
				tbl9[12] = v12
				tbl9[13] = v13
				tbl9[14] = v14
				tbl8["10M Wins"] = fn24(n6mWins, tbl9)
			end

			do
				local n10mWins = tbl8["10M Wins"]
				local tbl9 = {}
				local v = fn14(true)
				local v2 = fn9(Vector3.new(-32.21, 624.22, 3864.24), "run")
				local v3 = fn9(Vector3.new(1177.52, 625.06, 3866.53), "run")
				local v4 = fn9(Vector3.new(1211.29, 624.74, 3866.8), "run")
				local v5 = fn14(false)
				local v6 = fn9(Vector3.new(1228.42, 621.59, 3908.94), "run")

				local v7 = fn15(function()
					return workspace.Winblocks.WinBlock25
				end, 0.1)

				tbl9[1] = v
				tbl9[2] = v2
				tbl9[3] = v3
				tbl9[4] = v4
				tbl9[5] = v5
				tbl9[6] = v6
				tbl9[7] = v7
				tbl8["15M Wins"] = fn24(n10mWins, tbl9)
			end

			do
				local n15mWins = tbl8["15M Wins"]
				local tbl9 = {}
				local v = fn9(Vector3.new(1321.79, 619.6, 3864.47), "run")
				local v2 = fn9(Vector3.new(1541.89, 628.48, 3799.19), "jump")
				local v3 = fn9(Vector3.new(1741.58, 638.05, 3943.17), "jump")
				local v4 = fn9(Vector3.new(1950.87, 635.78, 3800.74), "jump")
				local v5 = fn9(Vector3.new(2081.97, 642.01, 3958.54), "jump")
				local v6 = fn9(Vector3.new(2294.8, 629.97, 3870.72), "jump")
				local v7 = fn9(Vector3.new(2390.38, 629.42, 3871.08), "jump")
				local v8 = fn9(Vector3.new(2400.21, 625.54, 3887.94), "run")

				local v9 = fn15(function()
					return workspace.Winblocks.WinBlock27
				end, 0.1)

				tbl9[1] = v
				tbl9[2] = v2
				tbl9[3] = v3
				tbl9[4] = v4
				tbl9[5] = v5
				tbl9[6] = v6
				tbl9[7] = v7
				tbl9[8] = v8
				tbl9[9] = v9
				tbl8["25M Wins"] = fn24(n15mWins, tbl9)
			end

			do
				local n25mWins = tbl8["25M Wins"]
				local tbl9 = {}
				local v = fn9(Vector3.new(2435.81, 627.63, 3871.18), "run")
				local v2 = fn9(Vector3.new(2490.45, 639.51, 3871.59), "run")
				local v3 = fn9(Vector3.new(2546.37, 639.63, 3869.79), "run")
				local v4 = fn11("x", 2546.37, 2674.71, 8)
				local v5 = fn9(Vector3.new(2703.03, 634.63, 3865.92), "run")
				local v6 = fn9(Vector3.new(2742.21, 628.97, 3869.99), "jump")
				local v7 = fn9(Vector3.new(2742.21, 575.63, 3869.99), "jump")
				local v8 = fn9(Vector3.new(2768.79, 575.63, 3870.23), "run")
				local v9 = fn9(Vector3.new(2825.36, 575.63, 3870.73), "run")
				local v10 = fn9(Vector3.new(2864.97, 582.33, 3871.07), "run")
				local v11 = fn9(Vector3.new(2884.59, 592.78, 3871.28), "run")
				local v12 = fn9(Vector3.new(2916.35, 604.52, 3871.55), "run")
				local v13 = fn9(Vector3.new(2972.13, 576.61, 3870.13), "jump")
				local v14 = fn9(Vector3.new(2999.43, 576.61, 3871.04), "run")
				local v15 = fn9(Vector3.new(3047.81, 591.5, 3871.4), "run")
				local v16 = fn11("x", 3047.81, 3189.62, 8)
				local v17 = fn9(Vector3.new(3217.29, 592.61, 3872.6), "run")
				local v18 = fn9(Vector3.new(3263.77, 592.63, 3871.93), "run")
				local v19 = fn9(Vector3.new(3269.21, 590.63, 3887.94), "run")

				local v20 = fn15(function()
					return workspace.Winblocks.WinBlock28
				end, 0.1)

				tbl9[1] = v
				tbl9[2] = v2
				tbl9[3] = v3
				tbl9[4] = v4
				tbl9[5] = v5
				tbl9[6] = v6
				tbl9[7] = v7
				tbl9[8] = v8
				tbl9[9] = v9
				tbl9[10] = v10
				tbl9[11] = v11
				tbl9[12] = v12
				tbl9[13] = v13
				tbl9[14] = v14
				tbl9[15] = v15
				tbl9[16] = v16
				tbl9[17] = v17
				tbl9[18] = v18
				tbl9[19] = v19
				tbl9[20] = v20
				tbl8["40M Wins"] = fn24(n25mWins, tbl9)
			end

			local n40mWins
			n40mWins = tbl8["40M Wins"]

			do
				local tbl9 = {}
				local v = fn14(true)
				local v2 = fn9(Vector3.new(3324.58, 668.46, 3872.93), "run")
				local v3 = fn9(Vector3.new(3344.39, 666.98, 3947.49), "run")
				local v4 = fn9(Vector3.new(3340.76, 670.38, 4159.59), "run")
				local v5 = fn9(Vector3.new(3340.76, 670.38, 4259.59), "run")
				local v6 = fn9(Vector3.new(3340.76, 670.38, 4359.59), "run")
				local v7 = fn9(Vector3.new(3340.76, 670.38, 4459.59), "run")
				local v8 = fn9(Vector3.new(3340.76, 670.38, 4559.59), "run")
				local v9 = fn9(Vector3.new(3340.76, 670.38, 4659.59), "run")
				local v10 = fn9(Vector3.new(3340.76, 670.38, 4759.59), "run")
				local v11 = fn9(Vector3.new(3340.76, 670.38, 4859.59), "run")
				local v12 = fn9(Vector3.new(3340.76, 670.38, 4959.59), "run")
				local v13 = fn9(Vector3.new(3440.61, 666.36, 5144.65), "run")
				local v14 = fn9(Vector3.new(3540.61, 666.36, 5144.65), "run")
				local v15 = fn9(Vector3.new(3640.61, 666.36, 5144.65), "run")
				local v16 = fn9(Vector3.new(3740.61, 666.36, 5144.65), "run")
				local v17 = fn9(Vector3.new(3840.61, 666.36, 5144.65), "run")
				local v18 = fn9(Vector3.new(3940.61, 666.36, 5144.65), "run")
				local v19 = fn9(Vector3.new(4040.61, 666.36, 5144.65), "run")
				local v20 = fn9(Vector3.new(4140.61, 666.36, 5144.65), "run")
				local v21 = fn9(Vector3.new(4240.61, 666.36, 5144.65), "run")
				local v22 = fn9(Vector3.new(4340.61, 666.36, 5144.65), "run")
				local v23 = fn9(Vector3.new(4440.61, 666.36, 5144.65), "run")
				local v24 = fn9(Vector3.new(4540.61, 666.36, 5144.65), "run")
				local v25 = fn9(Vector3.new(4613.28, 664.56, 5141.97), "run")
				local v26 = fn14(false)
				local v27 = fn9(Vector3.new(4634.11, 565.7, 5159.4), "run")

				local v28 = fn15(function()
					return workspace.Winblocks.WinBlock29
				end, 0.1)

				tbl9[1] = v
				tbl9[2] = v2
				tbl9[3] = v3
				tbl9[4] = v4
				tbl9[5] = v5
				tbl9[6] = v6
				tbl9[7] = v7
				tbl9[8] = v8
				tbl9[9] = v9
				tbl9[10] = v10
				tbl9[11] = v11
				tbl9[12] = v12
				tbl9[13] = v13
				tbl9[14] = v14
				tbl9[15] = v15
				tbl9[16] = v16
				tbl9[17] = v17
				tbl9[18] = v18
				tbl9[19] = v19
				tbl9[20] = v20
				tbl9[21] = v21
				tbl9[22] = v22
				tbl9[23] = v23
				tbl9[24] = v24
				tbl9[25] = v25
				tbl9[26] = v26
				tbl9[27] = v27
				tbl9[28] = v28
				tbl8["60M Wins"] = fn24(n40mWins, tbl9)
			end

			do
				local n60mWins = tbl8["60M Wins"]
				local tbl9 = {}
				local v = fn9(Vector3.new(4650.84, 566.84, 5143.59), "run")
				local v2 = fn9(Vector3.new(4717.82, 565.83, 5142.59), "run")
				local v3 = fn9(Vector3.new(4808.75, 592.92, 5144.15), "run")
				local v4 = fn9(Vector3.new(4879.62, 566.2, 5142.28), "run")
				local v5 = fn9(Vector3.new(4913.15, 568.72, 5023.33), "run")
				local v6 = fn9(Vector3.new(4912.98, 676.88, 5023.31), "run")
				local v7 = fn9(Vector3.new(4805.1, 675.12, 5036.15), "run")
				local v8 = fn9(Vector3.new(4681.35, 674.53, 5038.3), "run")
				local v9 = fn9(Vector3.new(4675.33, 673.67, 5136.85), "run")
				local v10 = fn9(Vector3.new(4673.61, 674.25, 5246.92), "run")
				local v11 = fn9(Vector3.new(4892.01, 672.98, 5241.74), "run")
				local v12 = fn9(Vector3.new(4994.24, 672.98, 5244.03), "run")
				local v13 = fn9(Vector3.new(4992.15, 686.16, 5142.58), "run")
				local v14 = fn9(Vector3.new(4989.77, 556.73, 5145.89), "run")
				local v15 = fn9(Vector3.new(5033.11, 555.68, 5159.02), "run")

				local v16 = fn15(function()
					return workspace.Winblocks.WinBlock30
				end, 0.1)

				tbl9[1] = v
				tbl9[2] = v2
				tbl9[3] = v3
				tbl9[4] = v4
				tbl9[5] = v5
				tbl9[6] = v6
				tbl9[7] = v7
				tbl9[8] = v8
				tbl9[9] = v9
				tbl9[10] = v10
				tbl9[11] = v11
				tbl9[12] = v12
				tbl9[13] = v13
				tbl9[14] = v14
				tbl9[15] = v15
				tbl9[16] = v16
				tbl8["100M Wins"] = fn24(n60mWins, tbl9)
			end

			local n100mWins
			n100mWins = tbl8["100M Wins"]
			local tbl9
			tbl9 = {}
			local v

			v = fn13(function()
				return workspace:WaitForChild("NPC15_World2")
			end)

			local v2

			v2 = fn13(function()
				return workspace:FindFirstChild("WORLD 2"):WaitForChild("Stage15"):WaitForChild("Levels"):WaitForChild("MovingWalls")
			end)

			local v3

			v3 = fn13(function()
				return workspace:FindFirstChild("Pieges & Lava"):WaitForChild("Lava_Stage15", 9e9)
			end)

			local v4
			v4 = fn9(Vector3.new(5068.92, 557.74, 5144.38), "run")
			local v5
			v5 = fn9(Vector3.new(5128.76, 557.74, 5142.96), "run")
			local v6
			v6 = fn9(Vector3.new(5211.79, 580.24, 5143.06), "run")
			local v7
			v7 = fn9(Vector3.new(5296.07, 556.97, 5141.94), "run")
			local v8
			v8 = fn9(Vector3.new(5359.12, 557.79, 5143.17), "run")
			local v9
			v9 = fn9(Vector3.new(5452.83, 586.31, 5139.5), "run")
			local v10
			v10 = fn9(Vector3.new(5511.7, 558.91, 5142.62), "run")

			do
				local v11 = fn9(Vector3.new(5590.65, 558, 5143.76), "run")
				local v12 = fn9(Vector3.new(5671.54, 581.22, 5143.29), "run")
				local v13 = fn9(Vector3.new(5739.79, 557.29, 5143.85), "run")
				local v14 = fn9(Vector3.new(6171.37, 558.64, 5141.97), "run")
				local v15 = fn9(Vector3.new(6183.89, 557.77, 5145.04), "run")
				local v16 = fn9(Vector3.new(6227.48, 557.59, 5082.8), "run")
				local v17 = fn9(Vector3.new(6363.85, 591.62, 5082.37), "run")
				local v18 = fn9(Vector3.new(6363.49, 591.62, 5203.34), "run")
				local v19 = fn9(Vector3.new(6227.78, 625.56, 5209.23), "run")
				local v20 = fn9(Vector3.new(6229.19, 625.56, 5086.88), "run")
				local v21 = fn9(Vector3.new(6359.62, 659.58, 5082.64), "run")
				local v22 = fn9(Vector3.new(6364.83, 659.58, 5203.34), "run")
				local v23 = fn9(Vector3.new(6224.91, 693.52, 5205.57), "run")
				local v24 = fn9(Vector3.new(6224.08, 693.52, 5145.71), "run")
				local v25 = fn9(Vector3.new(6394.67, 693.52, 5141.8), "run")
				local v26 = fn9(Vector3.new(6449.74, 693.52, 5147.57), "run")
				local v27 = fn9(Vector3.new(6533.68, 713.56, 5182.09), "run")
				local v28 = fn9(Vector3.new(6633.47, 733.99, 5186.79), "run")
				local v29 = fn9(Vector3.new(6667.66, 680.66, 5186.06), "run")
				local v30 = fn9(Vector3.new(6770.89, 694.43, 5187.8), "run")
				local v31 = fn9(Vector3.new(6955.48, 680.66, 5189.23), "run")
				local v32 = fn9(Vector3.new(7048.27, 702.73, 5187.25), "run")
				local v33 = fn9(Vector3.new(7135.76, 722.04, 5185.98), "run")
				local v34 = fn9(Vector3.new(7237.6, 694.3, 5181.04), "run")
				local v35 = fn9(Vector3.new(7292.34, 709.59, 5180.98), "run")
				local v36 = fn9(Vector3.new(7381.1, 730.08, 5184.13), "run")
				local v37 = fn9(Vector3.new(7499.82, 692.23, 5181.45), "run")
				local v38 = fn9(Vector3.new(7538.27, 716.47, 5180.83), "run")
				local v39 = fn9(Vector3.new(7585.95, 716.3, 5182.49), "run")
				local v40 = fn9(Vector3.new(7586.4, 716.07, 5150.84), "run")
				local v41 = fn9(Vector3.new(7585.95, 666.35, 5150.84), "run")
				local v42 = fn9(Vector3.new(7719.94, 666.35, 5148.5), "run")
				local v43 = fn9(Vector3.new(7774.98, 682.35, 5145.33), "run")
				local v44 = fn9(Vector3.new(7827.94, 712.17, 5145.54), "run")
				local v45 = fn9(Vector3.new(7912.64, 712.3, 5144.52), "run")
				local v46 = fn9(Vector3.new(7987.47, 710.31, 5143.42), "run")

				local v47 = fn15(function()
					return workspace.Winblocks.WinBlock31
				end, 0.1)

				tbl9[1] = v
				tbl9[2] = v2
				tbl9[3] = v3
				tbl9[4] = v4
				tbl9[5] = v5
				tbl9[6] = v6
				tbl9[7] = v7
				tbl9[8] = v8
				tbl9[9] = v9
				tbl9[10] = v10
				tbl9[11] = v11
				tbl9[12] = v12
				tbl9[13] = v13
				tbl9[14] = v14
				tbl9[15] = v15
				tbl9[16] = v16
				tbl9[17] = v17
				tbl9[18] = v18
				tbl9[19] = v19
				tbl9[20] = v20
				tbl9[21] = v21
				tbl9[22] = v22
				tbl9[23] = v23
				tbl9[24] = v24
				tbl9[25] = v25
				tbl9[26] = v26
				tbl9[27] = v27
				tbl9[28] = v28
				tbl9[29] = v29
				tbl9[30] = v30
				tbl9[31] = v31
				tbl9[32] = v32
				tbl9[33] = v33
				tbl9[34] = v34
				tbl9[35] = v35
				tbl9[36] = v36
				tbl9[37] = v37
				tbl9[38] = v38
				tbl9[39] = v39
				tbl9[40] = v40
				tbl9[41] = v41
				tbl9[42] = v42
				tbl9[43] = v43
				tbl9[44] = v44
				tbl9[45] = v45
				tbl9[46] = v46
				tbl9[47] = v47
			end

			tbl8["200M Wins"] = fn24(n100mWins, tbl9)
			local tbl10
			tbl10 = {}

			do
				local tbl11 = {}
				local v11 = fn9(Vector3.new(-1436.38, -159.43, -934.65), "run", false)
				local v12 = fn9(Vector3.new(-1434.34, -159.43, -887.05), "run")
				local v13 = fn11("z", -887.05, -837.57, 5, -158.57)
				local v14 = fn11("z", -837.57, -732.15, 15, -125.42)
				local v15 = fn11("z", -732.15, -630.24, 15, -93.37)
				local v16 = fn11("z", -630.24, -534.11, 15, -69.54)
				local v17 = fn9(Vector3.new(-1441.31, -69.54, -526.62), "run")
				local v18 = fn9(Vector3.new(-1481.83, -71.65, -515.77), "run")

				local v19 = fn15(function()
					return workspace.Structure.Stage1.SAS.WinBlock32
				end, 0.1)

				tbl11[1] = v11
				tbl11[2] = v12
				tbl11[3] = v13
				tbl11[4] = v14
				tbl11[5] = v15
				tbl11[6] = v16
				tbl11[7] = v17
				tbl11[8] = v18
				tbl11[9] = v19
				tbl10["300M Wins"] = tbl11
			end

			do
				local n300mWins = tbl10["300M Wins"]
				local tbl11 = {}
				local v11 = fn9(Vector3.new(-1454.82, -70.04, -462.58), "run")
				local v12 = fn9(Vector3.new(-1454.82, -59.06, -396.55), "run")
				local v13 = fn11("z", -392.9, -340.07, 7, -57.04)
				local v14 = fn9(Vector3.new(-1434.52, -57.04, -305.09), "run")
				local v15 = fn11("x", -1434.74, -1377.35, 7)
				local v16 = fn9(Vector3.new(-1341.17, -57.04, -292.06), "run")
				local v17 = fn11("x", -1341.17, -1291.83, 7)
				local v18 = fn9(Vector3.new(-1271.14, -57.04, -266.85), "run")
				local v19 = fn11("z", -266.85, -212.67, 7)
				local v20 = fn9(Vector3.new(-1272.2, -57.04, -172.78), "run")
				local v21 = fn11("z", -172.78, -115.44, 7)
				local v22 = fn9(Vector3.new(-1291.02, -57.04, -113.47), "run")
				local v23 = fn11("x", -1291.02, -1342.12, 7)
				local v24 = fn9(Vector3.new(-1382.5, -57.04, -109.47), "run")
				local v25 = fn11("x", -1382.5, -1433.22, 7)
				local v26 = fn9(Vector3.new(-1460.27, -57.04, -47.56), "run")
				local v27 = fn9(Vector3.new(-1480.76, -59.41, -15.81), "run")

				local v28 = fn15(function()
					return workspace.Structure.Stage1.SAS.WinBlock33
				end, 0.1)

				tbl11[1] = v11
				tbl11[2] = v12
				tbl11[3] = v13
				tbl11[4] = v14
				tbl11[5] = v15
				tbl11[6] = v16
				tbl11[7] = v17
				tbl11[8] = v18
				tbl11[9] = v19
				tbl11[10] = v20
				tbl11[11] = v21
				tbl11[12] = v22
				tbl11[13] = v23
				tbl11[14] = v24
				tbl11[15] = v25
				tbl11[16] = v26
				tbl11[17] = v27
				tbl11[18] = v28
				tbl10["500M Wins"] = fn24(n300mWins, tbl11)
			end

			do
				local n500mWins = tbl10["500M Wins"]
				local tbl11 = {}
				local v11 = fn9(Vector3.new(-1454.71, -57.05, 21.75), "run")
				local v12 = fn9(Vector3.new(-1453.34, -53.92, 83.79), "run")
				local v13 = fn12(-53.92, 87.65, "south")
				local v14 = fn9(Vector3.new(-1453.08, 89.95, 94.88), "run")
				local v15 = fn9(Vector3.new(-1433.74, 89.94, 95.68), "run")
				local v16 = fn12(89.94, 213.81, "south")
				local v17 = fn9(Vector3.new(-1434.6, 214.96, 102.57), "run")
				local v18 = fn9(Vector3.new(-1446.15, 222.69, 176.72), "run")
				local v19 = fn11("z", 176.72, 232.09, 10)
				local v20 = fn9(Vector3.new(-1443.58, 215.96, 257.46), "run")
				local v21 = fn9(Vector3.new(-1457.24, 214.71, 322.68), "run")
				local v22 = fn9(Vector3.new(-1480.77, 212.6, 332.14), "run")

				local v23 = fn15(function()
					return workspace.Structure.Stage1.SAS.WinBlock34
				end, 0.1)

				tbl11[1] = v11
				tbl11[2] = v12
				tbl11[3] = v13
				tbl11[4] = v14
				tbl11[5] = v15
				tbl11[6] = v16
				tbl11[7] = v17
				tbl11[8] = v18
				tbl11[9] = v19
				tbl11[10] = v20
				tbl11[11] = v21
				tbl11[12] = v22
				tbl11[13] = v23
				tbl10["800M Wins"] = fn24(n500mWins, tbl11)
			end

			do
				local n800mWins = tbl10["800M Wins"]
				local tbl11 = {}
				local v11 = fn9(Vector3.new(-1458.22, 214.71, 378.48), "run")
				local v12 = fn9(Vector3.new(-1458.94, 214.71, 461.01), "run")
				local v13 = fn11("z", 461.01, 535.01, 10)
				local v14 = fn9(Vector3.new(-1456.73, 214.72, 627.46), "run")
				local v15 = fn12(214.72, 363.65, "south")
				local v16 = fn9(Vector3.new(-1436.28, 360.71, 622.02), "jump")
				local v17 = fn9(Vector3.new(-1436.83, 360.71, 580.85), "run")
				local v18 = fn11("z", 580.85, 516.73, 10, 359.91)
				local v19 = fn11("x", -1432.85, -1370.77, 10, 359.8)
				local v20 = fn9(Vector3.new(-1329.42, 363.38, 514.71), "run")
				local v21 = fn11("x", -1329.42, -1256.57, 10, 328.2)
				local v22 = fn9(Vector3.new(-1249.38, 328.17, 518.92), "run")
				local v23 = fn11("z", 518.92, 579.21, 10, 318.02)
				local v24 = fn9(Vector3.new(-1237, 324.37, 604.52), "run")
				local v25 = fn11("z", 604.52, 641.39, 7, 328.55)
				local v26 = fn9(Vector3.new(-1236.11, 328.55, 682.06), "run")
				local v27 = fn11("z", 682.06, 754.47, 10, 334.78)
				local v28 = fn9(Vector3.new(-1218.74, 345.87, 835.48), "run")
				local v29 = fn11("x", -1218.74, -1256.9, 10, 349.44)
				local v30 = fn9(Vector3.new(-1371.46, 364.31, 839.3), "run")
				local v31 = fn9(Vector3.new(-1402.59, 358.73, 839.35), "jump")
				local v32 = fn9(Vector3.new(-1404.02, 373.7, 724.2), "run")
				local v33 = fn12(373.7, 561.72, "north")
				local v34 = fn9(Vector3.new(-1404.13, 532.72, 754.06), "jump")
				local v35 = fn9(Vector3.new(-1416.31, 532.72, 757.31), "run")
				local v36 = fn9(Vector3.new(-1431.33, 532.62, 759.62), "run")

				local v37 = fn15(function()
					return workspace.Structure.Stage1.SAS.WinBlock35
				end, 0.1)

				tbl11[1] = v11
				tbl11[2] = v12
				tbl11[3] = v13
				tbl11[4] = v14
				tbl11[5] = v15
				tbl11[6] = v16
				tbl11[7] = v17
				tbl11[8] = v18
				tbl11[9] = v19
				tbl11[10] = v20
				tbl11[11] = v21
				tbl11[12] = v22
				tbl11[13] = v23
				tbl11[14] = v24
				tbl11[15] = v25
				tbl11[16] = v26
				tbl11[17] = v27
				tbl11[18] = v28
				tbl11[19] = v29
				tbl11[20] = v30
				tbl11[21] = v31
				tbl11[22] = v32
				tbl11[23] = v33
				tbl11[24] = v34
				tbl11[25] = v35
				tbl11[26] = v36
				tbl11[27] = v37
				tbl10["1.25B Wins"] = fn24(n800mWins, tbl11)
			end

			do
				local n125bWins = tbl10["1.25B Wins"]
				local tbl11 = {}

				local v11 = fn13(function()
					return workspace:WaitForChild("NPC_LolMonster", 9e9)
				end)

				local v12 = fn9(Vector3.new(-1391.47, 532.72, 857.95), "run")
				local v13 = fn9(Vector3.new(-1309.55, 532.72, 1216.51), "run")
				local v14 = fn9(Vector3.new(-1395.61, 532.72, 1322.67), "run")
				local v15 = fn9(Vector3.new(-1431.45, 530.61, 1329.82), "run")

				local v16 = fn15(function()
					return workspace.Structure.Stage1.SAS.WinBlock36
				end, 0.1)

				tbl11[1] = v11
				tbl11[2] = v12
				tbl11[3] = v13
				tbl11[4] = v14
				tbl11[5] = v15
				tbl11[6] = v16
				tbl10["2B Wins"] = fn24(n125bWins, tbl11)
			end

			do
				local n2bWins = tbl10["2B Wins"]
				local tbl11 = {}
				local v11 = fn9(Vector3.new(-1403.92, 532.72, 1370.41), "run")
				local v12 = fn9(Vector3.new(-1440.89, 532.72, 1437.77), "run")
				local v13 = fn9(Vector3.new(-1450.16, 508.72, 1446.18), "run")
				local v14 = fn9(Vector3.new(-2034.55, 508.72, 1447.4), "run")
				local v15 = fn9(Vector3.new(-2061.63, 442.72, 1483.68), "jump")
				local v16 = fn9(Vector3.new(-2062.37, 440.61, 1459.37), "run")

				local v17 = fn15(function()
					return workspace.Structure.Stage1.SAS.WinBlock37
				end, 0.1)

				tbl11[1] = v11
				tbl11[2] = v12
				tbl11[3] = v13
				tbl11[4] = v14
				tbl11[5] = v15
				tbl11[6] = v16
				tbl11[7] = v17
				tbl10["3.5B Wins"] = fn24(n2bWins, tbl11)
			end

			do
				local n35bWins = tbl10["3.5B Wins"]
				local tbl11 = {}
				local v11 = fn9(Vector3.new(-2108.13, 442.72, 1480.43), "run")
				local v12 = fn9(Vector3.new(-2167.62, 450.9, 1483.76), "run")
				local v13 = fn11("x", -2167.62, -2277.46, 5, 438.72)
				local v14 = fn9(Vector3.new(-2303.95, 438.72, 1488.53), "run")
				local v15 = fn9(Vector3.new(-2336.33, 446.07, 1489.94), "run")
				local v16 = fn9(Vector3.new(-2377.42, 447.72, 1486.59), "run")
				local v17 = fn9(Vector3.new(-2416.13, 438.72, 1482.57), "run")
				local v18 = fn9(Vector3.new(-2448.73, 438.72, 1483.99), "run")
				local v19 = fn9(Vector3.new(-2495.35, 446.36, 1486.04), "run")
				local v20 = fn9(Vector3.new(-2530.1, 458, 1487.55), "run")
				local v21 = fn9(Vector3.new(-2546.52, 464.21, 1488.27), "run")
				local v22 = fn11("x", -2546.52, -2663.29, 15, 442.72)
				local v23 = fn9(Vector3.new(-2689.61, 442.72, 1489.92), "run")
				local v24 = fn9(Vector3.new(-2728.75, 450.67, 1489.92), "run")
				local v25 = fn11("x", -2728.75, -2859, 15, 467.14)
				local v26 = fn9(Vector3.new(-2863.25, 578.98, 1484.21), "jump")
				local v27 = fn9(Vector3.new(-2936.68, 546.35, 1485.69), "jump")
				local v28 = fn9(Vector3.new(-2935.84, 644.02, 1487.8), "jump")
				local v29 = fn9(Vector3.new(-3011.83, 615.9, 1486.04), "jump")
				local v30 = fn9(Vector3.new(-2999.28, 720.88, 1486.99), "jump")
				local v31 = fn9(Vector3.new(-3087.81, 674.12, 1488.96), "jump")
				local v32 = fn9(Vector3.new(-3163.04, 672.24, 1486.99), "run")
				local v33 = fn9(Vector3.new(-3212.15, 672.23, 1486.47), "run")
				local v34 = fn9(Vector3.new(-3217.24, 672.12, 1459.43), "run")

				local v35 = fn15(function()
					return workspace.Structure.Stage1.SAS.WinBlock38
				end, 0.1)

				tbl11[1] = v11
				tbl11[2] = v12
				tbl11[3] = v13
				tbl11[4] = v14
				tbl11[5] = v15
				tbl11[6] = v16
				tbl11[7] = v17
				tbl11[8] = v18
				tbl11[9] = v19
				tbl11[10] = v20
				tbl11[11] = v21
				tbl11[12] = v22
				tbl11[13] = v23
				tbl11[14] = v24
				tbl11[15] = v25
				tbl11[16] = v26
				tbl11[17] = v27
				tbl11[18] = v28
				tbl11[19] = v29
				tbl11[20] = v30
				tbl11[21] = v31
				tbl11[22] = v32
				tbl11[23] = v33
				tbl11[24] = v34
				tbl11[25] = v35
				tbl10["5.5B Wins"] = fn24(n35bWins, tbl11)
			end

			do
				local n55bWins = tbl10["5.5B Wins"]
				local tbl11 = {}
				local v11 = fn9(Vector3.new(-3240.66, 672.23, 1487.13), "run")
				local v12 = fn9(Vector3.new(-3628.39, 618.53, 1486.45), "run")
				local v13 = fn9(Vector3.new(-3653.68, 616.57, 1486.45), "run")
				local v14 = fn9(Vector3.new(-3657.56, 614.46, 1459.28), "run")

				local v15 = fn15(function()
					return workspace.Structure.Stage1.SAS.WinBlock39
				end, 0.1)

				tbl11[1] = v11
				tbl11[2] = v12
				tbl11[3] = v13
				tbl11[4] = v14
				tbl11[5] = v15
				tbl10["8.5B Wins"] = fn24(n55bWins, tbl11)
			end

			do
				local n85bWins = tbl10["8.5B Wins"]
				local tbl11 = {}

				local v11 = fn13(function()
					return workspace.Structure.Stage9:WaitForChild("MovingWalls", 5)
				end)

				local v12 = fn13(function()
					return workspace.Structure.Stage9:WaitForChild("MovingWalls", 5)
				end)

				local v13 = fn9(Vector3.new(-3755.15, 616.57, 1485.15), "run")
				local v14 = fn9(Vector3.new(-4020.58, 616.57, 1485.51), "run")
				local v15 = fn9(Vector3.new(-4125.63, 616.57, 1483.66), "run")
				local v16 = fn9(Vector3.new(-4130.56, 616.57, 1458.66), "run")

				local v17 = fn15(function()
					return workspace.Structure.Stage1.SAS.WinBlock40
				end, 0.1)

				tbl11[1] = v11
				tbl11[2] = v12
				tbl11[3] = v13
				tbl11[4] = v14
				tbl11[5] = v15
				tbl11[6] = v16
				tbl11[7] = v17
				tbl10["16B Wins"] = fn24(n85bWins, tbl11)
			end

			do
				local n16bWins = tbl10["16B Wins"]
				local tbl11 = {}
				local v11 = fn9(Vector3.new(-4139.9, 616.57, 1486.43), "run")
				local v12 = fn9(Vector3.new(-4151.03, 616.57, 1486.04), "run")
				local v13 = fn9(Vector3.new(-4168.21, 615.4, 1485.44), "run")
				local v14 = fn9(Vector3.new(-4179.58, 616.51, 1494.16), "run")
				local xz = fn11("xz", { -4179.58, 1494.16 }, { -4363.05, 1547.26 }, 20)
				local v15 = fn9(Vector3.new(-4400.25, 615.51, 1554.08), "run")
				local xz2 = fn11("xz", { -4400.25, 1554.08 }, { -4599.12, 1447.29 }, 20)
				local v16 = fn9(Vector3.new(-4631.69, 616.09, 1444.71), "run")
				local xz3 = fn11("xz", { -4631.69, 1444.71 }, { -4811.47, 1556.46 }, 20)
				local v17 = fn9(Vector3.new(-4844.01, 616.07, 1548.85), "run")
				local xz4 = fn11("xz", { -4844.01, 1548.85 }, { -4930.58, 1496.13 }, 20)
				local v18 = fn9(Vector3.new(-4969.32, 616.58, 1489.51), "run")
				local v19 = fn9(Vector3.new(-4967.56, 614.46, 1458.66), "run")

				local v20 = fn15(function()
					return workspace.Structure.Stage1.SAS.WinBlock41
				end, 0.1)

				tbl11[1] = v11
				tbl11[2] = v12
				tbl11[3] = v13
				tbl11[4] = v14
				tbl11[5] = xz
				tbl11[6] = v15
				tbl11[7] = xz2
				tbl11[8] = v16
				tbl11[9] = xz3
				tbl11[10] = v17
				tbl11[11] = xz4
				tbl11[12] = v18
				tbl11[13] = v19
				tbl11[14] = v20
				tbl10["25B Wins"] = fn24(n16bWins, tbl11)
			end

			do
				local n25bWins = tbl10["25B Wins"]
				local tbl11 = {}
				local v11 = fn9(Vector3.new(-4985.52, 616.58, 1484.81), "run")
				local v12 = fn9(Vector3.new(-5022.58, 616.58, 1484.8), "run")
				local v13 = fn9(Vector3.new(-5072.18, 624.6, 1484.8), "run")
				local v14 = fn11("x", -5072.18, -5170.8, 10, 634.47)
				local v15 = fn12(634.47, 671.41, "west")
				local v16 = fn9(Vector3.new(-5173.76, 676.22, 1485.15), "run")
				local v17 = fn9(Vector3.new(-5216.98, 675.58, 1485.15), "run")
				local v18 = fn9(Vector3.new(-5250.32, 683.11, 1485.15), "run")
				local v19 = fn11("x", -5250.32, -5351.21, 10, 692.65)
				local v20 = fn12(692.65, 730.63, "west")
				local v21 = fn9(Vector3.new(-5359.03, 734.58, 1484.16), "run")
				local v22 = fn9(Vector3.new(-5395.67, 734.58, 1484.16), "run")
				local v23 = fn9(Vector3.new(-5431.06, 742.3, 1484.16), "run")
				local v24 = fn11("x", -5431.06, -5531.03, 10, 745.22)
				local v25 = fn12(745.22, 790.91, "west")
				local v26 = fn9(Vector3.new(-5533.4, 794.22, 1484.16), "run")
				local v27 = fn9(Vector3.new(-5553.13, 793.58, 1484.16), "run")
				local v28 = fn9(Vector3.new(-5579.03, 793.58, 1484.16), "run")
				local v29 = fn9(Vector3.new(-5611.81, 801.5, 1484.16), "run")
				local v30 = fn11("x", -5611.81, -5710.39, 10, 811.15)
				local v31 = fn12(811.15, 849.05, "west")
				local v32 = fn9(Vector3.new(-5714.52, 852.88, 1484.16), "run")
				local v33 = fn9(Vector3.new(-5737.97, 851.59, 1483.68), "run")
				local v34 = fn9(Vector3.new(-5740.56, 849.48, 1458.59), "run")

				local v35 = fn15(function()
					return workspace.Structure.Stage1.SAS.WinBlock42
				end, 0.1)

				tbl11[1] = v11
				tbl11[2] = v12
				tbl11[3] = v13
				tbl11[4] = v14
				tbl11[5] = v15
				tbl11[6] = v16
				tbl11[7] = v17
				tbl11[8] = v18
				tbl11[9] = v19
				tbl11[10] = v20
				tbl11[11] = v21
				tbl11[12] = v22
				tbl11[13] = v23
				tbl11[14] = v24
				tbl11[15] = v25
				tbl11[16] = v26
				tbl11[17] = v27
				tbl11[18] = v28
				tbl11[19] = v29
				tbl11[20] = v30
				tbl11[21] = v31
				tbl11[22] = v32
				tbl11[23] = v33
				tbl11[24] = v34
				tbl11[25] = v35
				tbl10["40B Wins"] = fn24(n25bWins, tbl11)
			end

			do
				local n40bWins = tbl10["40B Wins"]
				local tbl11 = {}

				local v11 = fn13(function()
					return workspace["NPC & Piege"]:WaitForChild("FanEffects", 5)
				end)

				local v12 = fn9(Vector3.new(-5803.62, 850.32, 1484.3), "run")
				local v13 = fn9(Vector3.new(-5862.47, 850.32, 1482.63), "run")
				local v14 = fn9(Vector3.new(-5889.31, 850.32, 1455.8), "run")
				local v15 = fn9(Vector3.new(-5920.81, 850.32, 1422.61), "run")
				local v16 = fn9(Vector3.new(-5951.26, 850.32, 1390.54), "run")
				local v17 = fn9(Vector3.new(-5975.19, 850.32, 1365.86), "run")
				local v18 = fn9(Vector3.new(-6002.38, 850.32, 1390.27), "run")
				local v19 = fn9(Vector3.new(-6028.38, 850.32, 1414.95), "run")
				local v20 = fn9(Vector3.new(-6054.6, 850.32, 1439.85), "run")
				local v21 = fn9(Vector3.new(-6124.64, 850.32, 1518.69), "run")
				local v22 = fn9(Vector3.new(-6197.93, 850.32, 1588.27), "run")
				local v23 = fn9(Vector3.new(-6225.82, 850.32, 1588.97), "run")
				local v24 = fn9(Vector3.new(-6271.42, 850.32, 1536.66), "run")
				local v25 = fn9(Vector3.new(-6362.84, 850.32, 1441.09), "run")
				local v26 = fn9(Vector3.new(-6472.38, 850.32, 1410.04), "run")
				local v27 = fn9(Vector3.new(-6510.15, 850.32, 1443.25), "run")
				local v28 = fn9(Vector3.new(-6564.22, 850.32, 1473.84), "run")
				local v29 = fn9(Vector3.new(-6612.82, 850.32, 1483.51), "run")
				local v30 = fn9(Vector3.new(-6657.07, 851.6, 1488.95), "run")
				local v31 = fn9(Vector3.new(-6662.01, 849.49, 1458.52), "run")

				local v32 = fn15(function()
					return workspace.Structure.Stage1.SAS.WinBlock43
				end, 0.1)

				tbl11[1] = v11
				tbl11[2] = v12
				tbl11[3] = v13
				tbl11[4] = v14
				tbl11[5] = v15
				tbl11[6] = v16
				tbl11[7] = v17
				tbl11[8] = v18
				tbl11[9] = v19
				tbl11[10] = v20
				tbl11[11] = v21
				tbl11[12] = v22
				tbl11[13] = v23
				tbl11[14] = v24
				tbl11[15] = v25
				tbl11[16] = v26
				tbl11[17] = v27
				tbl11[18] = v28
				tbl11[19] = v29
				tbl11[20] = v30
				tbl11[21] = v31
				tbl11[22] = v32
				tbl10["65B Wins"] = fn24(n40bWins, tbl11)
			end

			do
				local n65bWins = tbl10["65B Wins"]
				local tbl11 = {}
				local v11 = fn9(Vector3.new(-6676.14, 851.6, 1485.11), { Animation = "run", Speed = 200 })
				local v12 = fn9(Vector3.new(-7309.39, 851.6, 1490.66), { Animation = "run", Speed = 200 })
				local v13 = fn9(Vector3.new(-7387.3, 851.6, 1390.58), { Animation = "run", Speed = 200 })
				local v14 = fn9(Vector3.new(-7460.04, 851.6, 1308.37), { Animation = "run", Speed = 200 })
				local v15 = fn9(Vector3.new(-7519.64, 851.6, 1254.93), { Animation = "run", Speed = 200 })
				local v16 = fn9(Vector3.new(-7598.44, 851.6, 1258.79), { Animation = "run", Speed = 200 })
				local v17 = fn9(Vector3.new(-7677.33, 851.6, 1253.96), { Animation = "run", Speed = 200 })
				local v18 = fn9(Vector3.new(-7825.59, 851.6, 1255.85), { Animation = "run", Speed = 200 })
				local v19 = fn9(Vector3.new(-7904.39, 851.6, 1259.86), { Animation = "run", Speed = 200 })
				local v20 = fn9(Vector3.new(-8070.12, 851.6, 1248.2), { Animation = "run", Speed = 200 })
				local v21 = fn9(Vector3.new(-8129.69, 851.6, 1183.82), { Animation = "run", Speed = 200 })
				local v22 = fn9(Vector3.new(-8195.79, 851.6, 1109.1), { Animation = "run", Speed = 200 })
				local v23 = fn9(Vector3.new(-8248.76, 851.6, 1049.18), { Animation = "run", Speed = 200 })
				local v24 = fn9(Vector3.new(-8331.35, 851.6, 1028.8), { Animation = "run", Speed = 200 })
				local v25 = fn9(Vector3.new(-8430.27, 851.6, 1022.75), { Animation = "run", Speed = 200 })
				local v26 = fn9(Vector3.new(-8520.13, 851.6, 1017.25), { Animation = "run", Speed = 200 })
				local v27 = fn9(Vector3.new(-8688.67, 851.6, 1014.53), { Animation = "run", Speed = 200 })
				local v28 = fn9(Vector3.new(-8893.52, 851.6, 1024.45), { Animation = "run", Speed = 200 })
				local v29 = fn9(Vector3.new(-8937.58, 851.6, 1063.44), { Animation = "run", Speed = 200 })
				local v30 = fn9(Vector3.new(-8997.14, 851.6, 1116.13), { Animation = "run", Speed = 200 })
				local v31 = fn9(Vector3.new(-9062.03, 851.6, 1173.55), { Animation = "run", Speed = 200 })
				local v32 = fn9(Vector3.new(-9124.44, 851.6, 1228.77), { Animation = "run", Speed = 200 })
				local v33 = fn9(Vector3.new(-9361.88, 851.6, 1480.46), { Animation = "run", Speed = 200 })
				local v34 = fn9(Vector3.new(-9450.71, 851.6, 1501.86), { Animation = "run", Speed = 200 })
				local v35 = fn9(Vector3.new(-9514.07, 849.49, 1458.52), "run")

				local v36 = fn15(function()
					return workspace.Structure.Stage1.SAS.WinBlock44
				end, 0.1)

				tbl11[1] = v11
				tbl11[2] = v12
				tbl11[3] = v13
				tbl11[4] = v14
				tbl11[5] = v15
				tbl11[6] = v16
				tbl11[7] = v17
				tbl11[8] = v18
				tbl11[9] = v19
				tbl11[10] = v20
				tbl11[11] = v21
				tbl11[12] = v22
				tbl11[13] = v23
				tbl11[14] = v24
				tbl11[15] = v25
				tbl11[16] = v26
				tbl11[17] = v27
				tbl11[18] = v28
				tbl11[19] = v29
				tbl11[20] = v30
				tbl11[21] = v31
				tbl11[22] = v32
				tbl11[23] = v33
				tbl11[24] = v34
				tbl11[25] = v35
				tbl11[26] = v36
				tbl10["100B Wins"] = fn24(n65bWins, tbl11)
			end

			do
				local n100bWins = tbl10["100B Wins"]
				local tbl11 = {}
				local v11 = fn9(Vector3.new(-9523.64, 851.6, 1484.18), "run")
				local v12 = fn9(Vector3.new(-9619.38, 859.8, 1480.84), "run")
				local v13 = fn11("x", -9619.38, -9741.35, 10, 851.6)
				local v14 = fn9(Vector3.new(-9759.7, 851.6, 1479.5), "run")
				local v15 = fn9(Vector3.new(-9792.43, 854.19, 1480.35), "run")
				local v16 = fn9(Vector3.new(-9813.39, 859.75, 1480.9), "run")
				local v17 = fn11("x", -9813.39, -9904.47, 10, 851.6)
				local v18 = fn9(Vector3.new(-9922.79, 851.6, 1482.02), "run")
				local v19 = fn9(Vector3.new(-9929.09, 851.6, 1572.48), "run")
				local v20 = fn9(Vector3.new(-9954.64, 851.6, 1671.78), "run")
				local v21 = fn9(Vector3.new(-9978.88, 851.6, 1718.81), "run")
				local v22 = fn11("x", -9978.88, -10078.84, 10, 851.6)
				local v23 = fn9(Vector3.new(-10139.2, 851.6, 1717.19), "run")
				local v24 = fn9(Vector3.new(-10386.11, 851.6, 1709.46), "run")
				local v25 = fn11("x", -10386.11, -10474.5, 10, 851.6)
				local v26 = fn9(Vector3.new(-10482.66, 851.6, 1714.08), "run")
				local v27 = fn9(Vector3.new(-10492.01, 851.6, 1607.1), "run")
				local v28 = fn9(Vector3.new(-10547.77, 851.6, 1488.72), "run")
				local v29 = fn11("x", -10547.77, -10639.19, 10, 851.6)
				local v30 = fn9(Vector3.new(-10671.35, 851.6, 1489.79), "run")
				local v31 = fn9(Vector3.new(-10683.54, 854.48, 1489.9), "run")
				local v32 = fn9(Vector3.new(-10702.81, 859.58, 1490.06), "run")
				local v33 = fn11("x", -10702.81, -10786.4, 10, 851.6)
				local v34 = fn9(Vector3.new(-10809.74, 851.6, 1483.34), "run")
				local v35 = fn9(Vector3.new(-10806.21, 849.48, 1458.52), "run")

				local v36 = fn15(function()
					return workspace.Structure.Stage1.SAS.WinBlock45
				end, 0.1)

				tbl11[1] = v11
				tbl11[2] = v12
				tbl11[3] = v13
				tbl11[4] = v14
				tbl11[5] = v15
				tbl11[6] = v16
				tbl11[7] = v17
				tbl11[8] = v18
				tbl11[9] = v19
				tbl11[10] = v20
				tbl11[11] = v21
				tbl11[12] = v22
				tbl11[13] = v23
				tbl11[14] = v24
				tbl11[15] = v25
				tbl11[16] = v26
				tbl11[17] = v27
				tbl11[18] = v28
				tbl11[19] = v29
				tbl11[20] = v30
				tbl11[21] = v31
				tbl11[22] = v32
				tbl11[23] = v33
				tbl11[24] = v34
				tbl11[25] = v35
				tbl11[26] = v36
				tbl10["200B Wins"] = fn24(n100bWins, tbl11)
			end

			local tbl11
			tbl11 = {}

			do
				local tbl12 = {}

				local v11 = fn13(function()
					return workspace.Stages.Stage1.SkipWalls:GetChildren()[2]
				end)

				local v12 = fn9(Vector3.new(-412.64, 360.76, -759.45), "run", false)
				local v13 = fn9(Vector3.new(-361.21, 360.76, -761.24), "run")
				local v14 = fn9(Vector3.new(-311.38, 361.39, -762.97), "run")
				local v15 = fn9(Vector3.new(-274.07, 361.39, -764.27), "run")
				local v16 = fn9(Vector3.new(-262.52, 361.39, -775.76), "run")
				local v17 = fn9(Vector3.new(-240.44, 361.39, -780.92), "run")
				local v18 = fn9(Vector3.new(-222.72, 361.39, -781.54), "run")
				local v19 = fn9(Vector3.new(-198.2, 361.39, -782.39), "run")
				local v20 = fn9(Vector3.new(-165.93, 361.39, -768.03), "run")
				local v21 = fn9(Vector3.new(-136.87, 361.38, -752.25), "run")
				local v22 = fn9(Vector3.new(-128.74, 358.98, -735.94), "run")

				local v23 = fn15(function()
					return workspace.Stages.Stage1.SAS.WinBlock1
				end, 0.1)

				tbl12[1] = v11
				tbl12[2] = v12
				tbl12[3] = v13
				tbl12[4] = v14
				tbl12[5] = v15
				tbl12[6] = v16
				tbl12[7] = v17
				tbl12[8] = v18
				tbl12[9] = v19
				tbl12[10] = v20
				tbl12[11] = v21
				tbl12[12] = v22
				tbl12[13] = v23
				tbl11["1 Wins"] = tbl12
			end

			do
				local n1Wins = tbl11["1 Wins"]
				local tbl12 = {}
				local v11 = fn9(Vector3.new(-118.22, 361.38, -746.61), "run")
				local v12 = fn9(Vector3.new(-101.35, 361.39, -745.73), "run")
				local v13 = fn9(Vector3.new(-90.43, 361.39, -745.15), "run")
				local v14 = fn11("x", -90.43, -70.16, 8)
				local v15 = fn9(Vector3.new(-60.58, 361.39, -743.59), "run")
				local v16 = fn11("x", -60.58, -34.58, 8)
				local v17 = fn9(Vector3.new(-26.16, 361.39, -742), "run")
				local v18 = fn11("x", -26.16, 17.88, 12)
				local v19 = fn9(Vector3.new(36.95, 361.39, -742.1), "run")
				local v20 = fn9(Vector3.new(62.69, 361.39, -745.3), "run")
				local v21 = fn9(Vector3.new(86.78, 361.4, -747.41), "run")
				local v22 = fn9(Vector3.new(102.87, 359, -735.99), "run")

				local v23 = fn15(function()
					return workspace.Stages.Stage2.SAS.WinBlock2
				end, 0.1)

				tbl12[1] = v11
				tbl12[2] = v12
				tbl12[3] = v13
				tbl12[4] = v14
				tbl12[5] = v15
				tbl12[6] = v16
				tbl12[7] = v17
				tbl12[8] = v18
				tbl12[9] = v19
				tbl12[10] = v20
				tbl12[11] = v21
				tbl12[12] = v22
				tbl12[13] = v23
				tbl11["3 Wins"] = fn24(n1Wins, tbl12)
			end

			do
				local n3Wins = tbl11["3 Wins"]
				local tbl12 = {}
				local v11 = fn9(Vector3.new(102.57, 361.4, -748.47), "run")
				local v12 = fn9(Vector3.new(117.9, 361.4, -751.31), "run")
				local v13 = fn9(Vector3.new(137.68, 361.4, -758.48), "run")
				local v14 = fn9(Vector3.new(165.08, 361.4, -758.64), "run")
				local v15 = fn9(Vector3.new(184.77, 361.4, -757.77), "run")
				local v16 = fn9(Vector3.new(212.95, 361.4, -759.4), "run")
				local v17 = fn11("x", 212.95, 214.71, 12, 389.65)
				local v18 = fn11("x", 214.71, 277.13, 12, 361.4)
				local v19 = fn9(Vector3.new(293.3, 361.4, -762.73), "run")
				local v20 = fn11("x", 293.3, 295.47, 12, 389.65)
				local v21 = fn11("x", 295.47, 369.77, 12, 361.4)
				local v22 = fn9(Vector3.new(396.01, 361.4, -760.75), "run")
				local v23 = fn9(Vector3.new(436.47, 361.4, -762.56), "run")
				local v24 = fn9(Vector3.new(456.03, 361.4, -758.84), "run")
				local v25 = fn9(Vector3.new(463.7, 359, -735.83), "run")

				local v26 = fn15(function()
					return workspace.Stages.Stage3.SAS.WinBlock3
				end, 0.1)

				tbl12[1] = v11
				tbl12[2] = v12
				tbl12[3] = v13
				tbl12[4] = v14
				tbl12[5] = v15
				tbl12[6] = v16
				tbl12[7] = v17
				tbl12[8] = v18
				tbl12[9] = v19
				tbl12[10] = v20
				tbl12[11] = v21
				tbl12[12] = v22
				tbl12[13] = v23
				tbl12[14] = v24
				tbl12[15] = v25
				tbl12[16] = v26
				tbl11["10 Wins"] = fn24(n3Wins, tbl12)
			end

			do
				local n10Wins = tbl11["10 Wins"]
				local tbl12 = {}

				local v11 = fn13(function()
					return workspace.Stages.Stage4:WaitForChild("EyesLaser", 5)
				end)

				local v12 = fn9(Vector3.new(471.18, 361.4, -756.22), "run")
				local v13 = fn9(Vector3.new(510.41, 361.4, -781.57), "run")
				local v14 = fn9(Vector3.new(546.26, 361.4, -791.21), "run")
				local v15 = fn9(Vector3.new(580.35, 361.4, -797.54), "run")
				local v16 = fn9(Vector3.new(616.09, 361.4, -795.54), "run")
				local v17 = fn9(Vector3.new(660.79, 361.4, -789.09), "run")
				local v18 = fn9(Vector3.new(695.01, 361.4, -780.95), "run")
				local v19 = fn9(Vector3.new(729.89, 361.4, -773.54), "run")
				local v20 = fn9(Vector3.new(763.6, 361.4, -766.38), "run")
				local v21 = fn9(Vector3.new(782.13, 359, -734.99), "run")

				local v22 = fn15(function()
					return workspace.Stages.Stage4.SAS.WinBlock4
				end, 0.1)

				tbl12[1] = v11
				tbl12[2] = v12
				tbl12[3] = v13
				tbl12[4] = v14
				tbl12[5] = v15
				tbl12[6] = v16
				tbl12[7] = v17
				tbl12[8] = v18
				tbl12[9] = v19
				tbl12[10] = v20
				tbl12[11] = v21
				tbl12[12] = v22
				tbl11["20 Wins"] = fn24(n10Wins, tbl12)
			end

			do
				local n20Wins = tbl11["20 Wins"]
				local tbl12 = {}
				local v11 = fn9(Vector3.new(789.74, 361.4, -756.12), "run")
				local v12 = fn9(Vector3.new(827.79, 361.4, -756.82), "run")
				local xz = fn11("xz", { 827.79, -756.82 }, { 887.87, -747.98 }, 9, 374.95)
				local xz2 = fn11("xz", { 887.88, -747.99 }, { 925.14, -759.93 }, 9, 361.34)
				local v13 = fn9(Vector3.new(945.15, 361.62, -759.96), "run")
				local xz3 = fn11("xz", { 945.15, -759.96 }, { 998.75, -771.67 }, 9, 374.35)
				local xz4 = fn11("xz", { 998.75, -771.67 }, { 1043.27, -756.66 }, 9, 362.77)
				local v14 = fn9(Vector3.new(1050.3, 361.4, -756.67), "run")
				local v15 = fn9(Vector3.new(1092.15, 361.4, -753.95), "run")
				local v16 = fn9(Vector3.new(1142.12, 361.4, -751.19), "run")
				local v17 = fn9(Vector3.new(1142.93, 359, -734.85), "run")

				local v18 = fn15(function()
					return workspace.Stages.Stage5.SAS.WinBlock5
				end, 0.1)

				tbl12[1] = v11
				tbl12[2] = v12
				tbl12[3] = xz
				tbl12[4] = xz2
				tbl12[5] = v13
				tbl12[6] = xz3
				tbl12[7] = xz4
				tbl12[8] = v14
				tbl12[9] = v15
				tbl12[10] = v16
				tbl12[11] = v17
				tbl12[12] = v18
				tbl11["50 Wins"] = fn24(n20Wins, tbl12)
			end

			do
				local n50Wins = tbl11["50 Wins"]
				local tbl12 = {}
				local v11 = fn9(Vector3.new(1147.71, 361.4, -752.45), "run")
				local v12 = fn9(Vector3.new(1217.29, 361.51, -761.11), "run")
				local xz = fn11("xz", { 1217.29, -761.11 }, { 1256.46, -749.53 }, 9, 361.85)
				local v13 = fn9(Vector3.new(1275.36, 362.05, -746.5), "run")
				local xz2 = fn11("xz", { 1280.68, -743.76 }, { 1302.33, -718.28 }, 9, 361.64)
				local v14 = fn9(Vector3.new(1313.37, 361.65, -716.38), "run")
				local v15 = fn9(Vector3.new(1364.82, 361.33, -713.92), "run")
				local v16 = fn9(Vector3.new(1398.73, 361.33, -723.3), "run")
				local xz3 = fn11("xz", { 1398.73, -723.3 }, { 1456.5, -758.65 }, 9, 367.98)
				local xz4 = fn11("xz", { 1456.5, -758.64 }, { 1547.62, -755.46 }, 9, 360.53)
				local v17 = fn9(Vector3.new(1560.22, 361.99, -748.87), "run")
				local v18 = fn9(Vector3.new(1560.9, 359.59, -734.85), "run")

				local v19 = fn15(function()
					return workspace.Stages.Stage6.SAS.WinBlock6
				end, 0.1)

				tbl12[1] = v11
				tbl12[2] = v12
				tbl12[3] = xz
				tbl12[4] = v13
				tbl12[5] = xz2
				tbl12[6] = v14
				tbl12[7] = v15
				tbl12[8] = v16
				tbl12[9] = xz3
				tbl12[10] = xz4
				tbl12[11] = v17
				tbl12[12] = v18
				tbl12[13] = v19
				tbl11["100 Wins"] = fn24(n50Wins, tbl12)
			end

			local tbl12
			tbl12 = {}

			do
				local tbl13 = {}
				local v11 = fn9(Vector3.new(-132.72, 59.43, -234.29), "run", false)
				local v12 = fn9(Vector3.new(-113.82, 59.44, -234.29), "run")
				local v13 = fn11("x", -113.82, -97.56, 5)
				local v14 = fn9(Vector3.new(-84.66, 59.43, -234.29), "run")
				local v15 = fn11("x", -84.66, -68.74, 5)
				local v16 = fn9(Vector3.new(-55.84, 59.43, -234.3), "run")
				local v17 = fn11("x", -55.84, -39.96, 5)
				local v18 = fn9(Vector3.new(-25.96, 59.43, -234.3), "run")
				local v19 = fn11("x", -25.96, -12.15, 5)
				local v20 = fn9(Vector3.new(2.17, 59.43, -232.79), "run")
				local v21 = fn11("x", 2.17, 20.56, 5)
				local v22 = fn9(Vector3.new(32.55, 59.43, -232.86), "run")
				local v23 = fn11("x", 33.03, 45.95, 5)
				local v24 = fn9(Vector3.new(61.6, 59.43, -233.85), "run")
				local v25 = fn11("x", 61.6, 78.22, 5)
				local v26 = fn9(Vector3.new(130.19, 59.53, -229.55), "run")
				local v27 = fn9(Vector3.new(139.02, 59.53, -206.93), "run")
				local v28 = fn9(Vector3.new(142.63, 59.53, -193.49), "run")

				local v29 = fn15(function()
					return workspace:FindFirstChild("EverythingElse", true):FindFirstChild("WinBlock1", true)
				end, 0.1)

				tbl13[1] = v11
				tbl13[2] = v12
				tbl13[3] = v13
				tbl13[4] = v14
				tbl13[5] = v15
				tbl13[6] = v16
				tbl13[7] = v17
				tbl13[8] = v18
				tbl13[9] = v19
				tbl13[10] = v20
				tbl13[11] = v21
				tbl13[12] = v22
				tbl13[13] = v23
				tbl13[14] = v24
				tbl13[15] = v25
				tbl13[16] = v26
				tbl13[17] = v27
				tbl13[18] = v28
				tbl13[19] = v29
				tbl12["1 Cash"] = tbl13
			end

			do
				local n1Cash = tbl12["1 Cash"]
				local tbl13 = {}

				local v11 = fn13(function()
					return workspace:WaitForChild("Stage2LocalNPC_Local", 5)
				end)

				local v12 = fn9(Vector3.new(177.88, 59.53, -214.3), "run")
				local v13 = fn9(Vector3.new(240.43, 59.52, -192.1), "run")
				local v14 = fn9(Vector3.new(303.1, 59.52, -178.79), "run")
				local v15 = fn9(Vector3.new(343.46, 59.52, -188.04), "run")
				local v16 = fn9(Vector3.new(382.64, 59.52, -210.75), "run")
				local v17 = fn9(Vector3.new(446.74, 59.52, -231.04), "run")
				local v18 = fn9(Vector3.new(470.86, 59.52, -235.57), "run")
				local v19 = fn9(Vector3.new(493.38, 59.52, -236.01), "run")
				local v20 = fn10(Vector3.new(1075, 167, -702), 20)
				local v21 = fn9(Vector3.new(1079.35, 167.64, -682.96), "run")
				local v22 = fn9(Vector3.new(1067.85, 167.66, -639.57), "run")
				local v23 = fn11("z", -639.57, -617.47, 5)
				local v24 = fn9(Vector3.new(1057.62, 167.66, -604.86), "run")
				local v25 = fn11("z", -604.86, -579.66, 5)
				local v26 = fn9(Vector3.new(1050.03, 167.66, -572.77), "run")
				local v27 = fn11("z", -572.77, -539.64, 5)
				local v28 = fn9(Vector3.new(1075.53, 168.65, -538.68), "run")
				local v29 = fn11("z", -538.68, -507.89, 5)
				local v30 = fn9(Vector3.new(1087.46, 168.65, -496.78), "run")
				local v31 = fn11("z", -496.78, -470.13, 5)
				local v32 = fn9(Vector3.new(1088.57, 167.66, -451.37), "run")
				local v33 = fn9(Vector3.new(1054.93, 167.64, -388.9), "run")
				local v34 = fn9(Vector3.new(1032.29, 167.47, -385.5), "run")

				local v35 = fn15(function()
					return workspace:FindFirstChild("EverythingElse", true):FindFirstChild("WinBlock3", true)
				end, 0.1)

				tbl13[1] = v11
				tbl13[2] = v12
				tbl13[3] = v13
				tbl13[4] = v14
				tbl13[5] = v15
				tbl13[6] = v16
				tbl13[7] = v17
				tbl13[8] = v18
				tbl13[9] = v19
				tbl13[10] = v20
				tbl13[11] = v21
				tbl13[12] = v22
				tbl13[13] = v23
				tbl13[14] = v24
				tbl13[15] = v25
				tbl13[16] = v26
				tbl13[17] = v27
				tbl13[18] = v28
				tbl13[19] = v29
				tbl13[20] = v30
				tbl13[21] = v31
				tbl13[22] = v32
				tbl13[23] = v33
				tbl13[24] = v34
				tbl13[25] = v35
				tbl12["10 Cash"] = fn24(n1Cash, tbl13)
			end

			do
				local n10Cash = tbl12["10 Cash"]
				local tbl13 = {}
				local v11 = fn9(Vector3.new(1054, 167.64, -356.57), "run")
				local v12 = fn9(Vector3.new(1068.66, 167.64, -339.77), "run")
				local v13 = fn9(Vector3.new(1072.24, 167.64, -113.27), "run")
				local v14 = fn9(Vector3.new(1053.44, 167.64, -70.75), "run")
				local v15 = fn9(Vector3.new(1032.29, 167.47, -65.5), "run")

				local v16 = fn15(function()
					return workspace:FindFirstChild("EverythingElse", true):FindFirstChild("WinBlock4", true)
				end, 0.1)

				tbl13[1] = v11
				tbl13[2] = v12
				tbl13[3] = v13
				tbl13[4] = v14
				tbl13[5] = v15
				tbl13[6] = v16
				tbl12["20 Cash"] = fn24(n10Cash, tbl13)
			end

			do
				local n20Cash = tbl12["20 Cash"]
				local tbl13 = {}

				local v11 = fn13(function()
					return workspace["NPC & Piege"]:WaitForChild("Stage5", 5)
				end)

				local v12 = fn9(Vector3.new(1051.58, 167.64, -61.34), "run")
				local v13 = fn9(Vector3.new(1075.25, 167.64, -9.33), "run")
				local v14 = fn9(Vector3.new(1074.93, 167.64, 201.89), "run")
				local v15 = fn9(Vector3.new(1051.58, 167.64, 251.63), "run")
				local v16 = fn9(Vector3.new(1032.29, 165.47, 254.49), "run")

				local v17 = fn15(function()
					return workspace:FindFirstChild("EverythingElse", true):FindFirstChild("WinBlock5", true)
				end, 0.1)

				tbl13[1] = v11
				tbl13[2] = v12
				tbl13[3] = v13
				tbl13[4] = v14
				tbl13[5] = v15
				tbl13[6] = v16
				tbl13[7] = v17
				tbl12["50 Cash"] = fn24(n20Cash, tbl13)
			end

			do
				local n50Cash = tbl12["50 Cash"]
				local tbl13 = {}

				local v11 = fn13(function()
					return workspace["NPC & Piege"]:WaitForChild("Stage6", 5)
				end)

				local v12 = fn9(Vector3.new(1073.64, 167.64, 290.62), "run")
				local v13 = fn9(Vector3.new(1072.98, 167.64, 329.23), "run")
				local v14 = fn9(Vector3.new(1071.46, 167.64, 744.65), "run")
				local v15 = fn9(Vector3.new(1071.89, 167.64, 796.01), "run")
				local v16 = fn9(Vector3.new(1075.1, 165.47, 815.61), "run")

				local v17 = fn15(function()
					return workspace:FindFirstChild("EverythingElse", true):FindFirstChild("WinBlock6", true)
				end, 0.1)

				tbl13[1] = v11
				tbl13[2] = v12
				tbl13[3] = v13
				tbl13[4] = v14
				tbl13[5] = v15
				tbl13[6] = v16
				tbl13[7] = v17
				tbl12["100 Cash"] = fn24(n50Cash, tbl13)
			end

			do
				local n100Cash = tbl12["100 Cash"]
				local tbl13 = {}
				local v11 = fn9(Vector3.new(1058.25, 167.64, 787.8), "run")
				local v12 = fn9(Vector3.new(1030.43, 167.64, 775), "run")
				local v13 = fn9(Vector3.new(989.49, 167.39, 774.46), "run")
				local v14 = fn11("x", 989.49, 903.64, 10)
				local v15 = fn9(Vector3.new(896.68, 152.78, 775.28), "run")
				local v16 = fn9(Vector3.new(858.7, 162.71, 775.62), "run")
				local v17 = fn11("x", 858.7, 804.76, 10, 171.39)
				local v18 = fn9(Vector3.new(792.59, 171.39, 776.21), "run")
				local v19 = fn9(Vector3.new(766.19, 167.9, 776.44), "run")
				local v20 = fn9(Vector3.new(750.57, 161.7, 776.58), "run")
				local v21 = fn9(Vector3.new(734.33, 161.02, 776.72), "run")
				local v22 = fn9(Vector3.new(717.31, 163.94, 776.87), "run")
				local v23 = fn9(Vector3.new(700.75, 166.79, 777.01), "run")
				local v24 = fn9(Vector3.new(682.97, 169.88, 777.16), "run")
				local v25 = fn9(Vector3.new(678.3, 170.83, 777.2), "run")
				local v26 = fn11("x", 678.3, 591.58, 10, 153.93)
				local v27 = fn9(Vector3.new(576.58, 153.93, 776.55), "run")
				local v28 = fn9(Vector3.new(560.15, 157.11, 776.4), "run")
				local v29 = fn9(Vector3.new(548, 160.49, 776.3), "run")
				local v30 = fn11("x", 548, 474.8, 10, 153.87)
				local v31 = fn9(Vector3.new(461.37, 153.87, 776.39), "run")
				local v32 = fn9(Vector3.new(422.97, 165.56, 776.42), "run")
				local v33 = fn9(Vector3.new(399.79, 167.64, 775.21), "jump")
				local v34 = fn9(Vector3.new(375.96, 167.64, 754.9), "run")
				local v35 = fn9(Vector3.new(354.61, 167.64, 745.35), "run")
				local v36 = fn9(Vector3.new(354.29, 165.47, 732.48), "run")

				local v37 = fn15(function()
					return workspace:FindFirstChild("EverythingElse", true):FindFirstChild("WinBlock7", true)
				end, 0.1)

				tbl13[1] = v11
				tbl13[2] = v12
				tbl13[3] = v13
				tbl13[4] = v14
				tbl13[5] = v15
				tbl13[6] = v16
				tbl13[7] = v17
				tbl13[8] = v18
				tbl13[9] = v19
				tbl13[10] = v20
				tbl13[11] = v21
				tbl13[12] = v22
				tbl13[13] = v23
				tbl13[14] = v24
				tbl13[15] = v25
				tbl13[16] = v26
				tbl13[17] = v27
				tbl13[18] = v28
				tbl13[19] = v29
				tbl13[20] = v30
				tbl13[21] = v31
				tbl13[22] = v32
				tbl13[23] = v33
				tbl13[24] = v34
				tbl13[25] = v35
				tbl13[26] = v36
				tbl13[27] = v37
				tbl12["150 Cash"] = fn24(n100Cash, tbl13)
			end

			do
				local n150Cash = tbl12["150 Cash"]
				local tbl13 = {}

				local v11 = fn13(function()
					return workspace["NPC & Piege"]:WaitForChild("Stage8", 5)
				end)

				local v12 = fn9(Vector3.new(327.48, 167.64, 758.88), "run")
				local v13 = fn9(Vector3.new(310.44, 167.64, 773.39), "run")
				local v14 = fn9(Vector3.new(151.04, 167.64, 768.83), "run")
				local v15 = fn9(Vector3.new(-113.87, 167.64, 779.67), "run")
				local v16 = fn9(Vector3.new(-207.99, 167.64, 775.43), "run")
				local v17 = fn9(Vector3.new(-387.62, 167.64, 773.66), "run")
				local v18 = fn9(Vector3.new(-463.2, 167.64, 775.82), "run")
				local v19 = fn9(Vector3.new(-493.73, 166.28, 775.21), "run")
				local v20 = fn10(Vector3.new(-173, 307, -897), 20)
				local v21 = fn9(Vector3.new(-172.2, 305.51, -853.5), "run")

				local v22 = fn15(function()
					return workspace:FindFirstChild("EverythingElse", true):FindFirstChild("WinBlock8", true)
				end, 0.1)

				tbl13[1] = v11
				tbl13[2] = v12
				tbl13[3] = v13
				tbl13[4] = v14
				tbl13[5] = v15
				tbl13[6] = v16
				tbl13[7] = v17
				tbl13[8] = v18
				tbl13[9] = v19
				tbl13[10] = v20
				tbl13[11] = v21
				tbl13[12] = v22
				tbl12["300 Cash"] = fn24(n150Cash, tbl13)
			end

			do
				local n300Cash = tbl12["300 Cash"]
				local tbl13 = {}

				local v11 = fn13(function()
					return workspace["NPC & Piege"].Stage9:WaitForChild("EyesLaser", 5)
				end)

				local v12 = fn9(Vector3.new(-137.69, 307.68, -896.06), "run")
				local v13 = fn9(Vector3.new(-52.99, 307.67, -846.61), "run")
				local v14 = fn9(Vector3.new(219.98, 307.67, -945.54), "run")
				local v15 = fn9(Vector3.new(525.09, 307.67, -864.82), "run")
				local v16 = fn9(Vector3.new(555.58, 307.67, -865.87), "run")
				local v17 = fn11("x", 555.58, 645.77, 8)
				local v18 = fn9(Vector3.new(671.2, 307.67, -882.11), "run")
				local v19 = fn9(Vector3.new(739.02, 307.68, -870.92), "run")
				local v20 = fn9(Vector3.new(744.29, 305.51, -853.49), "run")

				local v21 = fn15(function()
					return workspace:FindFirstChild("EverythingElse", true):FindFirstChild("WinBlock9", true)
				end, 0.1)

				tbl13[1] = v11
				tbl13[2] = v12
				tbl13[3] = v13
				tbl13[4] = v14
				tbl13[5] = v15
				tbl13[6] = v16
				tbl13[7] = v17
				tbl13[8] = v18
				tbl13[9] = v19
				tbl13[10] = v20
				tbl13[11] = v21
				tbl12["500 Cash"] = fn24(n300Cash, tbl13)
			end

			do
				local n500Cash = tbl12["500 Cash"]
				local tbl13 = {}
				local v11 = fn9(Vector3.new(770.32, 307.68, -888.46), "run")
				local v12 = fn9(Vector3.new(1135.07, 306.24, -896.29), "run")
				local v13 = fn9(Vector3.new(1528.4, 307.68, -895.34), "run")
				local v14 = fn9(Vector3.new(1607.47, 305.5, -896.3), "run")

				local v15 = fn15(function()
					return workspace:FindFirstChild("EverythingElse", true):FindFirstChild("WinBlock10", true)
				end, 0.1)

				tbl13[1] = v11
				tbl13[2] = v12
				tbl13[3] = v13
				tbl13[4] = v14
				tbl13[5] = v15
				tbl12["1000 Cash"] = fn24(n500Cash, tbl13)
			end

			do
				local n1000Cash = tbl12["1000 Cash"]
				local tbl13 = {}

				local v11 = fn13(function()
					return workspace:WaitForChild("Stage11LocalNPC_Local", 1)
				end)

				local v12 = fn9(Vector3.new(1591.33, 307.68, -879.96), "run")
				local v13 = fn9(Vector3.new(1590.5, 306.64, -831.37), "run")
				local v14 = fn9(Vector3.new(1637.7, 306.64, -774.82), "run")
				local v15 = fn9(Vector3.new(1768.62, 306.64, -708.91), "run")
				local v16 = fn9(Vector3.new(1870.8, 306.64, -558.7), "run")
				local v17 = fn9(Vector3.new(1961.49, 306.64, -83.75), "run")
				local v18 = fn9(Vector3.new(1871.89, 306.64, -47.08), "run")
				local v19 = fn9(Vector3.new(1829.88, 307.68, 14.27), "run")
				local v20 = fn9(Vector3.new(1799.73, 307.68, 24.07), "run")
				local v21 = fn9(Vector3.new(1785.29, 305.51, 24.49), "run")

				local v22 = fn15(function()
					return workspace:FindFirstChild("EverythingElse", true):FindFirstChild("WinBlock11", true)
				end, 0.1)

				tbl13[1] = v11
				tbl13[2] = v12
				tbl13[3] = v13
				tbl13[4] = v14
				tbl13[5] = v15
				tbl13[6] = v16
				tbl13[7] = v17
				tbl13[8] = v18
				tbl13[9] = v19
				tbl13[10] = v20
				tbl13[11] = v21
				tbl13[12] = v22
				tbl12["2500 Cash"] = fn24(n1000Cash, tbl13)
			end

			do
				local n2500Cash = tbl12["2500 Cash"]
				local tbl13 = {}

				local v11 = fn13(function()
					return workspace["NPC & Piege"]:WaitForChild("Stage12", 5)
				end)

				local v12 = fn9(Vector3.new(1820.94, 307.68, 58.98), "run")
				local v13 = fn9(Vector3.new(1822.18, 307.68, 67.28), "run")
				local v14 = fn9(Vector3.new(1826, 307.68, 168.84), "run")
				local v15 = fn9(Vector3.new(1827.18, 307.68, 167.82), "run")
				local v16 = fn12(307.68, 810.22, "south")
				local v17 = fn9(Vector3.new(1826.56, 810.68, 178.63), "run")
				local v18 = fn9(Vector3.new(1827.79, 810.68, 339.95), "run")
				local v19 = fn11("z", 339.95, 425.76, 10)
				local v20 = fn9(Vector3.new(1830.23, 810.68, 468.44), "run")
				local v21 = fn9(Vector3.new(1827.63, 810.68, 600.55), "run")
				local v22 = fn11("z", 600.55, 695.27, 10)
				local v23 = fn9(Vector3.new(1827.63, 810.68, 755.36), "run")
				local v24 = fn9(Vector3.new(1822.7, 810.68, 859.54), "run")
				local v25 = fn9(Vector3.new(1822.7, 810.68, 958.97), "run")
				local v26 = fn9(Vector3.new(1828.09, 808.51, 987.68), "run")

				local v27 = fn15(function()
					return workspace:FindFirstChild("EverythingElse", true):FindFirstChild("WinBlock12", true)
				end, 0.1)

				tbl13[1] = v11
				tbl13[2] = v12
				tbl13[3] = v13
				tbl13[4] = v14
				tbl13[5] = v15
				tbl13[6] = v16
				tbl13[7] = v17
				tbl13[8] = v18
				tbl13[9] = v19
				tbl13[10] = v20
				tbl13[11] = v21
				tbl13[12] = v22
				tbl13[13] = v23
				tbl13[14] = v24
				tbl13[15] = v25
				tbl13[16] = v26
				tbl13[17] = v27
				tbl12["10000 Cash"] = fn24(n2500Cash, tbl13)
			end

			do
				local n10000Cash = tbl12["10000 Cash"]
				local tbl13 = {}
				local v11 = fn9(Vector3.new(1756.28, 810.68, 948.19), "run")
				local v12 = fn9(Vector3.new(1637.89, 810.68, 932.86), "run")
				local v13 = fn9(Vector3.new(1569.13, 817.75, 891.75), "run")
				local v14 = fn11("x", 1569.13, 1428.92, 15, 810.67)
				local v15 = fn9(Vector3.new(1424.5, 810.67, 871.66), "jump")
				local v16 = fn9(Vector3.new(1409.38, 810.67, 860.12), "run")
				local v17 = fn9(Vector3.new(1375.46, 818.18, 845.95), "run")
				local v18 = fn11("x", 1375.46, 1210.54, 15, 810.67)
				local v19 = fn9(Vector3.new(1085.42, 810.67, 852.56), "run")
				local v20 = fn11("x", 1085.42, 948.61, 15, 804.28)
				local v21 = fn9(Vector3.new(936.15, 810.67, 851.35), "run")
				local v22 = fn9(Vector3.new(914.45, 810.67, 900.74), "run")
				local v23 = fn9(Vector3.new(883.44, 810.67, 942.78), "run")
				local v24 = fn9(Vector3.new(855.03, 810.68, 951.44), "run")
				local v25 = fn9(Vector3.new(809.69, 810.68, 921.83), "run")
				local v26 = fn9(Vector3.new(807.29, 808.51, 902.49), "run")

				local v27 = fn15(function()
					return workspace:FindFirstChild("EverythingElse", true):FindFirstChild("WinBlock13", true)
				end, 0.1)

				tbl13[1] = v11
				tbl13[2] = v12
				tbl13[3] = v13
				tbl13[4] = v14
				tbl13[5] = v15
				tbl13[6] = v16
				tbl13[7] = v17
				tbl13[8] = v18
				tbl13[9] = v19
				tbl13[10] = v20
				tbl13[11] = v21
				tbl13[12] = v22
				tbl13[13] = v23
				tbl13[14] = v24
				tbl13[15] = v25
				tbl13[16] = v26
				tbl13[17] = v27
				tbl12["25000 Cash"] = fn24(n10000Cash, tbl13)
			end

			do
				local n25000Cash = tbl12["25000 Cash"]
				local tbl13 = {}

				local v11 = fn13(function()
					return workspace:WaitForChild("Stage14LocalNPC_Local", 5)
				end)

				local v12 = fn9(Vector3.new(766.63, 810.68, 942.38), "run")
				local v13 = fn9(Vector3.new(733.98, 810.75, 935.17), "run")
				local v14 = fn9(Vector3.new(714.95, 810.75, 699.8), "run")
				local v15 = fn9(Vector3.new(712.65, 810.75, 573.42), "run")
				local v16 = fn9(Vector3.new(598.73, 810.75, 566.76), "run")
				local v17 = fn9(Vector3.new(594.86, 810.75, 476.48), "run")
				local v18 = fn9(Vector3.new(403.02, 810.75, 468.67), "run")
				local v19 = fn9(Vector3.new(401.96, 810.75, 732.33), "run")
				local v20 = fn9(Vector3.new(505.19, 810.75, 739.38), "run")
				local v21 = fn9(Vector3.new(515.39, 810.75, 839.95), "run")
				local v22 = fn9(Vector3.new(320.87, 810.75, 840.91), "run")
				local v23 = fn9(Vector3.new(315.45, 810.75, 946.99), "run")
				local v24 = fn9(Vector3.new(202, 810.75, 948.63), "run")
				local v25 = fn9(Vector3.new(126.13, 810.68, 945.22), "run")
				local v26 = fn9(Vector3.new(100.12, 808.96, 945.9), "run")

				local v27 = fn15(function()
					return workspace.EverythingElse.FinalSAS.WinPad:FindFirstChild("WinBlock14")
				end, 0.1)

				tbl13[1] = v11
				tbl13[2] = v12
				tbl13[3] = v13
				tbl13[4] = v14
				tbl13[5] = v15
				tbl13[6] = v16
				tbl13[7] = v17
				tbl13[8] = v18
				tbl13[9] = v19
				tbl13[10] = v20
				tbl13[11] = v21
				tbl13[12] = v22
				tbl13[13] = v23
				tbl13[14] = v24
				tbl13[15] = v25
				tbl13[16] = v26
				tbl13[17] = v27
				tbl12["50000 Cash"] = fn24(n25000Cash, tbl13)
			end

			do
				local routes = {
					["World 1"] = tbl5,
					["World 2"] = tbl8,
					["World 3"] = tbl10,
					["World 3 Tween"] = tbl10,
					["World 4"] = tbl11,
					["World 4 (G2)"] = tbl11,
					BBNO = tbl12,
				}

				tbl4.Routes = routes

				local function getRoute(arg, arg2)
					local v11 = routes[arg]
					if not v11 then
						return nil
					end
					local v12 = v11[arg2]
					if not v12 then
						return nil
					end
					return v12
				end

				tbl4.UpdateRoute = function(arg)
					if arg == "Wait" then
						local v11 = tbl10
						local tbl13 = {}
						local v12 = fn9(Vector3.new(-1433.18, -159.43, -918.69), "run", false)
						local v13 = fn9(Vector3.new(-1443.18, -159.43, -918.69), "run")

						local v14 = fn17(function()
							return workspace["NPC & Piege"].Ball1.KillBall
						end, function()
							return workspace["NPC & Piege"].Ball1.BallSpawn
						end)

						local v15 = fn9(Vector3.new(-1442.42, -160.68, -856), "run")
						local v16 = fn9(Vector3.new(-1433.7, -157.07, -832.8), "run")

						local v17 = fn17(function()
							return workspace["NPC & Piege"].Ball1.KillBall
						end, function()
							return workspace["NPC & Piege"].Ball1.BallSpawn
						end)

						local v18 = fn9(Vector3.new(-1443.7, -157.07, -832.8), "run")
						local v19 = fn9(Vector3.new(-1442.99, -142.74, -787.21), "run")
						local v20 = fn9(Vector3.new(-1442.94, -125.83, -733.44), "run")
						local v21 = fn9(Vector3.new(-1430.96, -125.73, -733.13), "run")

						local v22 = fn17(function()
							return workspace["NPC & Piege"].Ball1.KillBall
						end, function()
							return workspace.Bottom_
						end)

						local v23 = fn9(Vector3.new(-1440.96, -125.73, -733.13), "run")
						local v24 = fn9(Vector3.new(-1444.83, -111, -686.28), "run")
						local v25 = fn9(Vector3.new(-1442.15, -92.21, -630.54), "run")
						local v26 = fn9(Vector3.new(-1431.08, -90.91, -630.42), "run")

						local v27 = fn17(function()
							return workspace["NPC & Piege"].Ball1.KillBall
						end, function()
							return workspace.Top_
						end)

						local v28 = fn9(Vector3.new(-1445.38, -83.54, -618.05), "run")
						local v29 = fn9(Vector3.new(-1443.04, -68.54, -532.27), "run")
						local v30 = fn9(Vector3.new(-1481.83, -68.65, -515.77), "run")

						local function fn25()
							return workspace.Structure.Stage1.SAS.WinBlock32
						end

						tbl13[1] = v12
						tbl13[2] = v13
						tbl13[3] = v14
						tbl13[4] = v15
						tbl13[5] = v16
						tbl13[6] = v17
						tbl13[7] = v18
						tbl13[8] = v19
						tbl13[9] = v20
						tbl13[10] = v21
						tbl13[11] = v22
						tbl13[12] = v23
						tbl13[13] = v24
						tbl13[14] = v25
						tbl13[15] = v26
						tbl13[16] = v27
						tbl13[17] = v28
						tbl13[18] = v29
						tbl13[19] = v30

						do
							local values = table.pack(fn15(fn25, 0.1))
							table.move(values, 1, values.n, 20, tbl13)
						end

						v11["300M Wins"] = tbl13
					else
						local v11 = tbl10
						local tbl13 = {}
						local v12 = fn9(Vector3.new(-1436.38, -159.43, -934.65), "run", false)
						local v13 = fn9(Vector3.new(-1434.34, -159.43, -887.05), "run")
						local v14 = fn11("z", -887.05, -837.57, 5, -158.57)
						local v15 = fn11("z", -837.57, -732.15, 15, -125.42)
						local v16 = fn11("z", -732.15, -630.24, 15, -93.37)
						local v17 = fn11("z", -630.24, -534.11, 15, -69.54)
						local v18 = fn9(Vector3.new(-1441.31, -69.54, -526.62), "run")
						local v19 = fn9(Vector3.new(-1481.83, -71.65, -515.77), "run")

						local function fn25()
							return workspace.Structure.Stage1.SAS.WinBlock32
						end

						tbl13[1] = v12
						tbl13[2] = v13
						tbl13[3] = v14
						tbl13[4] = v15
						tbl13[5] = v16
						tbl13[6] = v17
						tbl13[7] = v18
						tbl13[8] = v19

						do
							local values = table.pack(fn15(fn25, 0.1))
							table.move(values, 1, values.n, 9, tbl13)
						end

						v11["300M Wins"] = tbl13
					end
				end

				tbl4.GetRoute = getRoute

				tbl4.Run = function(arg, arg2, arg3)
					local tbl13 = arg3 or {}
					local v11 = tbl4.ResolveSmartTarget(arg, arg2)
					cached.AutoWinEffectiveTarget = v11
					local v12 = getRoute(arg, v11)
					if not v12 then
						return false
					end
					tbl4.EnsureWinRemoteListener()
					cached.winReceived = false
					cached.autoWalkRunning = true
					cached.autoWinRunId = cached.autoWinRunId + 1

					if fn21(arg) then
						fn20(true)
					end

					local autoWinRunId = cached.autoWinRunId
					local v13
					v13, v13 = fn18()

					local connection = v13.Died:Connect(function()
						if cached.autoWinRunId == autoWinRunId then
							cached.autoWalkRunning = false
							cached.autoWinRunId = cached.autoWinRunId + 1
							fn22()
						end
					end)

					for i, v14 in ipairs(v12) do
						if not (not fn19(autoWinRunId) or cached.winReceived) then
							if enabled and enabled["Auto Win"] == false then
								cached.autoWalkRunning = false
								break
							elseif fn23(v14, autoWinRunId, v12, i) then
								continue
							end
						end

						break
					end

					if connection then
						connection:Disconnect()
					end

					if tbl13.StopAfterRun ~= false then
						cached.autoWalkRunning = false
					end

					if tbl13.StopAfterRun ~= false or not cached.autoWalkRunning then
						fn20(false)
					end

					return true
				end

				tbl4.Start = function(arg, arg2, arg3)
					local delayBetweenRuns = (arg3 or {}).DelayBetweenRuns or 1.5
					if cached.autoWalkRunning then
						return
					end
					tbl4.EnsureWinRemoteListener()
					cached.autoWalkRunning = true

					task.spawn(function()
						if fn21(arg) then
							fn20(true)
						end

						while cached.autoWalkRunning do
							local v11 = tbl4.ResolveSmartTarget(arg, arg2)
							cached.AutoWinEffectiveTarget = v11
							local v12 = getRoute(arg, v11)

							if not v12 then
								cached.autoWalkRunning = false
								break
							else
								for i, v13 in ipairs(v12) do
									if cached.autoWalkRunning then
										cached.autoWinRunId = cached.autoWinRunId + 1
										if fn23(v13, cached.autoWinRunId, v12, i) then
											continue
										end
									end

									break
								end

								if cached.autoWalkRunning then
									task.wait(delayBetweenRuns)
								end
							end
						end

						fn20(false)
					end)
				end
			end

			tbl4.Stop = function()
				cached.autoWalkRunning = false
				cached.autoWinRunId = cached.autoWinRunId + 1
				cached.AutoWinEffectiveTarget = nil
				fn22()
				fn20(false)
			end

			return tbl4
		end

		tbl3.AutoWin = fn8()

		local function fn9()
			local tbl4 = {}
			local currentCamera = workspace.CurrentCamera
			local ContextActionService = game:GetService("ContextActionService")

			tbl4.BypassWalkSpeed = function()
				if cached.BypassSpeed then
					return
				end
				cached.BypassSpeed = true
				local v = getrawmetatable(game)
				setreadonly(v, false)
				local index = v.__index

				v.__index = newcclosure(function(arg, arg2)
					if arg2 == "WalkSpeed" then
						return 16
					end
					return index(arg, arg2)
				end)
			end

			tbl4.FreezeAndClone = function()
				if cached.Frozen then
					return
				end
				cached.Frozen = true
				cached.FrozenCFrame = currentCamera.CFrame
				cached.SavedParts = {}
				cached.SavedDecals = {}
				local archivable = character.Archivable
				character.Archivable = true
				cached.CharacterClone = character:Clone()
				character.Archivable = archivable
				cached.CharacterClone.Name = "Checkpoint"

				for _, descendant in ipairs(cached.CharacterClone:GetDescendants()) do
					if descendant:IsA("Script") or descendant:IsA("LocalScript") then
						descendant:Destroy()
					elseif descendant:IsA("BasePart") then
						descendant.Anchored = true
						descendant.CanCollide = false
						descendant.CanTouch = false
						descendant.CanQuery = false
						descendant.LocalTransparencyModifier = 0

						if descendant.Name == "HumanoidRootPart" then
							descendant.Transparency = 1
						end
					elseif descendant:IsA("Decal") or descendant:IsA("Texture") then
						descendant.Transparency = 0
					end
				end

				local humanoid2 = cached.CharacterClone:FindFirstChildOfClass("Humanoid")

				if humanoid2 then
					humanoid2.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
				end

				cached.CharacterClone.Parent = workspace

				for _, descendant in ipairs(character:GetDescendants()) do
					if descendant:IsA("BasePart") then
						cached.SavedParts[descendant] = descendant.LocalTransparencyModifier
						descendant.LocalTransparencyModifier = 1
					elseif descendant:IsA("Decal") or descendant:IsA("Texture") then
						cached.SavedDecals[descendant] = descendant.Transparency
						descendant.Transparency = 1
					end
				end

				currentCamera.CameraType = Enum.CameraType.Scriptable
				currentCamera.CFrame = cached.FrozenCFrame

				if connections.FreezeConnection then
					connections.FreezeConnection:Disconnect()
				end

				connections.FreezeConnection = RunService.RenderStepped:Connect(function()
					if cached.Frozen and cached.FrozenCFrame then
						currentCamera.CameraType = Enum.CameraType.Scriptable
						currentCamera.CFrame = cached.FrozenCFrame
					end
				end)
			end

			tbl4.UnfreezeAndDeleteClone = function()
				if not cached.Frozen then
					return
				end
				cached.Frozen = false

				if connections.FreezeConnection then
					connections.FreezeConnection:Disconnect()
					connections.FreezeConnection = nil
				end

				local v = pairs
				local savedParts = cached.SavedParts or {}

				for k, savedPart in v(savedParts) do
					if k and k.Parent and k:IsA("BasePart") then
						k.LocalTransparencyModifier = savedPart
					end
				end

				local v2 = pairs
				local savedDecals = cached.SavedDecals or {}

				for k, savedDecal in v2(savedDecals) do
					if k and k.Parent and (k:IsA("Decal") or k:IsA("Texture")) then
						k.Transparency = savedDecal
					end
				end

				cached.SavedParts = {}
				cached.SavedDecals = {}

				if cached.CharacterClone then
					cached.CharacterClone:Destroy()
					cached.CharacterClone = nil
				end

				cached.FrozenCFrame = nil
				local character2 = localPlayer.Character
				character2 = character2 and character2:FindFirstChildOfClass("Humanoid")
				currentCamera.CameraType = Enum.CameraType.Custom

				if character2 then
					currentCamera.CameraSubject = character2
				end
			end

			tbl4.EnableNoInput = function()
				if cached.NoInputEnabled then
					return
				end
				cached.NoInputEnabled = true

				if not cached.Controls then
					cached.Controls = require(localPlayer:WaitForChild("PlayerScripts"):WaitForChild("PlayerModule")):GetControls()
				end

				if cached.ScreenText then
					cached.ScreenText.Enabled = true
				else
					cached.ScreenText = Instance.new("ScreenGui")
					cached.ScreenText.Name = "NoInputWarningGui"
					cached.ScreenText.ResetOnSpawn = false
					cached.ScreenText.IgnoreGuiInset = true
					cached.ScreenText.Parent = localPlayer:WaitForChild("PlayerGui")
					cached.ScreenTextLabel = Instance.new("TextLabel")
					cached.ScreenTextLabel.Name = "WarningText"
					cached.ScreenTextLabel.Size = UDim2.fromScale(1, 0.15)
					cached.ScreenTextLabel.Position = UDim2.fromScale(0, 0.42)
					cached.ScreenTextLabel.BackgroundTransparency = 1
					cached.ScreenTextLabel.Text = "[START]"
					cached.ScreenTextLabel.TextScaled = true
					cached.ScreenTextLabel.Font = Enum.Font.GothamBold
					cached.ScreenTextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
					cached.ScreenTextLabel.TextStrokeTransparency = 0
					cached.ScreenTextLabel.Parent = cached.ScreenText
				end

				cached.Controls:Disable()

				ContextActionService:BindActionAtPriority("BlockAllPlayerInput", function()
					return Enum.ContextActionResult.Sink
				end, false, 999999, Enum.UserInputType.Keyboard, Enum.UserInputType.MouseButton1, Enum.UserInputType.MouseButton2, Enum.UserInputType.MouseButton3, Enum.UserInputType.MouseMovement, Enum.UserInputType.MouseWheel, Enum.UserInputType.Touch, Enum.UserInputType.Gamepad1, Enum.UserInputType.Gamepad2, Enum.UserInputType.Gamepad3, Enum.UserInputType.Gamepad4)
			end

			tbl4.DisableNoInput = function()
				if not cached.NoInputEnabled then
					return
				end
				cached.NoInputEnabled = false
				ContextActionService:UnbindAction("BlockAllPlayerInput")

				if cached.Controls then
					cached.Controls:Enable()
				end

				if cached.ScreenText then
					cached.ScreenText.Enabled = false
				end
			end

			return tbl4
		end

		tbl3.Misc = fn9()

		local function fn10()
			local tbl4 = {}

			local tbl5 = {
				RequestState = container:WaitForChild("SummerEventItemsShop.RequestState"),
				BuyCoins = container:WaitForChild("SummerEventItemsShop.BuyCoins"),
				ShopUpdate = container:WaitForChild("SummerEventItemsShop.ShopUpdate"),
			}

			local tbl6 = { "Common", "Uncommon", "Rare", "Mysterious" }
			cached.SummerShopState = {}

			tbl3.Utils.Connections(tbl5.ShopUpdate.OnClientEvent, function(summerShopState)
				if type(summerShopState) == "table" then
					cached.SummerShopState = summerShopState
				end
			end, "SummerShopUpdate")

			tbl4.Refresh = function()
				tbl5.RequestState:FireServer()
			end

			tbl4.GetState = function()
				return cached.SummerShopState
			end

			tbl4.GetStock = function(arg)
				local summerShopState = cached.SummerShopState
				local slots = summerShopState and summerShopState.slots and summerShopState.slots[arg]
				if not slots then
					return 0
				end

				if slots.unlimited then
					return math.huge
				end
				return slots.remaining or 0
			end

			tbl4.BuyOnce = function()
				local selectBuySlot = enabled["Select Buy Slot"]
				if not selectBuySlot or #selectBuySlot == 0 then
					return false
				end
				local tbl7 = {}

				for _, v in ipairs(selectBuySlot) do
					tbl7[v] = true
				end

				for _, v in ipairs(tbl6) do
					if tbl7[v] and tbl4.GetStock(v) > 0 then
						tbl5.BuyCoins:FireServer(v)
						return true
					end
				end

				return false
			end

			return tbl4
		end

		tbl3.SummerShop = fn10()

		local function fn11()
			local tbl4 = {}

			local tbl5 = {
				requestState = container:WaitForChild("requestState"),
				stateUpdate = container:WaitForChild("stateUpdate"),
				claimQuest = container:WaitForChild("claimQuest"),
			}

			cached.SummerQuestsState = {}

			tbl3.Utils.Connections(tbl5.stateUpdate.OnClientEvent, function(summerQuestsState)
				if type(summerQuestsState) == "table" then
					cached.SummerQuestsState = summerQuestsState
				end
			end, "SummerQuestsUpdate")

			tbl4.Refresh = function()
				tbl5.requestState:FireServer()
			end

			tbl4.GetQuests = function()
				local summerQuestsState = cached.SummerQuestsState
				return summerQuestsState and summerQuestsState.quests or {}
			end

			tbl4.ClaimNext = function()
				for _, v in ipairs(tbl4.GetQuests()) do
					if v.done and not v.claimed then
						tbl5.claimQuest:FireServer(v.id)
						return true
					end
				end

				return false
			end

			return tbl4
		end

		tbl3.SummerQuests = fn11()

		local function fn12()
			local tbl4 = {}
			local itemAction = remotes:WaitForChild("ItemAction")
			cached.MergeUpdated = true

			tbl3.Utils.Connections(itemAction.OnClientEvent, function(arg)
				if arg == "Update" or arg == "MergeSuccess" then
					cached.MergeUpdated = true
				end
			end, "ItemMergeUpdate")

			local function getCandidates()
				local ok, result = pcall(function()
					return ClientState:Get()
				end)

				if not ok or not result then
					return nil
				end
				local Items = require(ReplicatedStorage:WaitForChild("FeatureConfigs"):WaitForChild("Items"))
				local tbl5 = {}
				local v = ipairs
				local items = result.Items or {}

				for _, item in v(items) do
					local v2 = Items.KeyOf(item)
					local v3 = Items.TierOf(item)

					if v2 and v3 ~= nil then
						local str = v2 .. "\0" .. tostring(v3)
						local tbl6 = tbl5[str]

						if not tbl6 then
							tbl6 = { Key = v2, Tier = v3, Count = 0 }
							tbl5[str] = tbl6
						end

						tbl6.Count = tbl6.Count + 1
					end
				end

				local tbl6 = {}

				for _, v2 in pairs(tbl5) do
					if v2.Count >= Items.MERGE_COUNT and v2.Tier < Items.MAX_TIER then
						table.insert(tbl6, v2)
					end
				end

				table.sort(tbl6, function(arg, arg2)
					if arg.Tier == arg2.Tier then
						if arg.Count == arg2.Count then
							return arg.Key < arg2.Key
						end
						return arg.Count > arg2.Count
					end

					return arg.Tier > arg2.Tier
				end)

				return tbl6
			end

			tbl4.GetCandidates = getCandidates

			tbl4.MergeOnce = function()
				if not cached.MergeUpdated then
					return false
				end
				local v = getCandidates()
				if not v or #v == 0 then
					return false
				end
				local v2 = v[1]
				cached.MergeUpdated = false
				itemAction:FireServer("Merge", v2.Key, v2.Tier)
				return true
			end

			return tbl4
		end

		tbl3.ItemMerger = fn12()
		return tbl3
	end

	module.Modules = fn5()
	local modules = module.Modules
	local utils = modules.Utils
	local misc = modules.Misc
	local tbl3 = { Managers = {} }

	tbl3.Managers.CreatePart = function(arg, name, cFrame, parent)
		local v = parent and parent:FindFirstChild(name) or workspace:FindFirstChild(name)

		if not v then
			local part = Instance.new("Part")
			part.Name = name
			part.Size = Vector3.new(10, 1, 10)
			part.CFrame = cFrame
			part.Anchored = true
			part.Transparency = 0.5
			part.Material = Enum.Material.Wood
			part.Parent = parent or workspace
			return part
		end

		return v
	end

	tbl3.LoadLibrary = function()
		local v = shx:CreateWindow({
			Title = "Speed Hub X | 1.2.0 | discord.gg/speedhubx",
			Description = "",
			["Tab Width"] = 130,
			SaveSystem = { Enable = true, File = "Plus1Speed" },
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
			Home = v:CreateTab({ Name = "Home", Icon = "rbxassetid://10734942198" }),
			Automation = v:CreateTab({ Name = "Automation", Icon = "rbxassetid://10723407389" }),
			Items = v:CreateTab({ Name = "Shop", Icon = "rbxassetid://10734952479" }),
			Special = v:CreateTab({ Name = "Special", Icon = "rbxassetid://10709806995" }),
			Risk = v:CreateTab({ Name = "Risk", Icon = "rbxassetid://10723374276" }),
			Miscellaneous = v:CreateTab({ Name = "Misc", Icon = "rbxassetid://11447063791" }),
			Settings = v:CreateTab({ Name = "Settings", Icon = "rbxassetid://10734950309" }),
		}

		funcs:Button(tbl4.Home:AddSection("Discord", true), "Discord Invite", "Copy invite link", function()
			setclipboard("https://discord.gg/speedhubx")
		end)

		local Events = tbl4.Automation:AddSection("Events", true)

		funcs:Toggle(Events, "Auto Collect Coins", "Collect Summer Coins Automatically", false, true, function(arg)
			enabled["Auto Collect Coins"] = arg
		end)

		funcs:Toggle(Events, "Auto Claim Summer Quests", "Claim completed Summer Quests Automatically", false, true, function(arg)
			enabled["Auto Claim Summer Quests"] = arg
		end)

		local v2 = tbl4.Automation:AddSection("Auto Win")
		v2:AddSeperator({ " - [ Config ] - " })

		local function fn6(arg, arg2)
			if arg == "5.5B Wins" and arg2 < 630 then
				shx:SetNotification({
					"WARNING !!!",
					"",
					"Low level detected - anti-cheat may flag you. Recommend leveling up before proceeding.",
					10,
					0.5,
				})
			elseif arg == "8.5B Wins" and arg2 < 680 then
				shx:SetNotification({
					"WARNING !!!",
					"",
					"Low level detected - anti-cheat may flag you. Recommend leveling up before proceeding.",
					10,
					0.5,
				})
			elseif arg == "16B Wins" and arg2 < 730 then
				shx:SetNotification({
					"WARNING !!!",
					"",
					"Low level detected - anti-cheat may flag you. Recommend leveling up before proceeding.",
					10,
					0.5,
				})
			end
		end

		funcs:Dropdown(v2, "Select Win Amount", "", false, cached.WinAmount, { "" }, true, function(arg)
			enabled["Select Win Amount"] = arg
			modules.AutoWin.ResolveSmartTarget(cached.CurrentWorld, arg)

			if enabled["Select Win Amount"] then
				local num = tonumber(playerGui.SpeedGameUI.Frames:WaitForChild("LevelFrame").ProgressBg.LevelText.Text:match("%d+"))
				fn6(enabled["Select Win Amount"], num)

				if (enabled["Select Win Amount"] == "150K Wins" or enabled["Select Win Amount"] == "50000 Wins") and num < 100 then
					shx:SetNotification({
						"WARNING !!!",
						"",
						"Low level detected — anti-cheat may flag you. Recommend leveling up before proceeding.",
						10,
						0.5,
					})
				elseif (enabled["Select Win Amount"] == "100M Wins" or enabled["Select Win Amount"] == "200M Wins") and num < 500 then
					shx:SetNotification({
						"WARNING !!!",
						"",
						"Low level detected — anti-cheat may flag you. Recommend leveling up before proceeding.",
						10,
						0.5,
					})
				end
			end
		end)

		if cached.CurrentWorld == "World 3" then
			funcs:Dropdown(v2, "300M Route", "", false, { "Jump", "Wait" }, { "" }, true, function(arg)
				enabled["300M Route"] = arg

				if enabled["300M Route"] then
					modules.AutoWin.UpdateRoute(enabled["300M Route"])
				end
			end)
		end

		enabled["Movement Speed"] = tonumber(enabled["Movement Speed"]) or 150
		cached.DEFAULT_WALK_SPEED = enabled["Movement Speed"]

		funcs:Textbox(v2, "Movement Speed", "", "150", true, function(arg)
			local defaultWalkSpeed = tonumber(arg)
			if not defaultWalkSpeed or defaultWalkSpeed <= 0 then
				return
			end
			enabled["Movement Speed"] = defaultWalkSpeed
			cached.DEFAULT_WALK_SPEED = defaultWalkSpeed
			local v3 = modules.AutoWin.GetCurrentMaxSpeed()

			if defaultWalkSpeed and v3 and defaultWalkSpeed > v3 and not enabled["Smart Speed"] then
				shx:SetNotification({ "WARNING !!!", "", "Your speed is more than your max speed, your win may not count", 10, 0.5 })
			end
		end)

		funcs:Toggle(v2, "Smart Speed", "Use Your Current Max Speed", false, true, function(arg)
			enabled["Smart Speed"] = arg
		end)

		funcs:Textbox(v2, "Loop Delay", "", "2", true, function(arg)
			enabled["Loop Delay"] = tonumber(arg)
		end)

		v2:AddSeperator({ " - [ Toggle ] - " })

		funcs:Toggle(v2, "Auto Win", "", false, true, function(arg)
			enabled["Auto Win"] = arg

			if not enabled["Auto Win"] then
				modules.AutoWin.Stop()
			else
				if enabled["Select Win Amount"] then
					local num = tonumber(playerGui.SpeedGameUI.Frames:WaitForChild("LevelFrame").ProgressBg.LevelText.Text:match("%d+"))
					fn6(enabled["Select Win Amount"], num)

					if (enabled["Select Win Amount"] == "150K Wins" or enabled["Select Win Amount"] == "50000 Wins") and num < 100 then
						shx:SetNotification({
							"WARNING !!!",
							"",
							"Low level detected — anti-cheat may flag you. Recommend leveling up before proceeding.",
							10,
							0.5,
						})
					elseif (enabled["Select Win Amount"] == "100M Wins" or enabled["Select Win Amount"] == "200M Wins") and num < 500 then
						shx:SetNotification({
							"WARNING !!!",
							"",
							"Low level detected — anti-cheat may flag you. Recommend leveling up before proceeding.",
							10,
							0.5,
						})
					end
				end

				task.spawn(function()
					while enabled["Auto Win"] do
						if enabled["Auto Win"] then
							updateSpeed:FireServer("Walking")
							task.wait(0.1)
							continue
						end

						break
					end
				end)

				modules.AutoWin.EnsureWinRemoteListener()

				if not cached.ObstacleDestroyed then
					modules.World.ApplyWorld()

					if cached.CurrentWorld == "World 1" then
						local npcPiege = workspace:WaitForChild("NPC & Piege")

						if npcPiege then
							if npcPiege:FindFirstChild("Zone1") then
								npcPiege.Zone1:Destroy()
							end

							if npcPiege:FindFirstChild("CorridorTrap") then
								npcPiege.CorridorTrap:Destroy()
							end

							if npcPiege:FindFirstChild("LavaTower") then
								npcPiege.LavaTower:Destroy()
							end

							if npcPiege:FindFirstChild("NPC_Zone10") then
								npcPiege.NPC_Zone10:Destroy()
							end

							if npcPiege:FindFirstChild("NPC_Zone12") then
								npcPiege.NPC_Zone12:Destroy()
							end

							if npcPiege:FindFirstChild("CorridorTrap2") then
								npcPiege.CorridorTrap2:Destroy()
							end
						end

						task.spawn(function()
							workspace:WaitForChild("NPC15", 9e9):Destroy()
						end)
					elseif cached.CurrentWorld == "World 2" then
						local world2 = workspace:FindFirstChild("WORLD 2")

						for _, descendant in ipairs(world2:GetDescendants()) do
							if descendant.Name == "MovingWalls" or descendant.Name == "Wind" or descendant.Name == "Ventilateurs" then
								descendant:Destroy()
							end
						end

						local stage10 = world2:FindFirstChild("Stage10")

						if stage10 then
							if stage10:FindFirstChild("DoorWall1") then
								stage10.DoorWall1:Destroy()
							end

							if stage10:FindFirstChild("DoorWall2") then
								stage10.DoorWall2:Destroy()
							end

							if stage10:FindFirstChild("DoorWall3") then
								stage10.DoorWall3:Destroy()
							end
						end

						local piegesLava = workspace:FindFirstChild("Pieges & Lava")

						if piegesLava then
							if piegesLava:FindFirstChild("Lava_Stage3") then
								piegesLava.Lava_Stage3:Destroy()
							end

							if piegesLava:FindFirstChild("Twomps") then
								piegesLava.Twomps:Destroy()
							end

							if piegesLava:FindFirstChild("FanEffects") then
								piegesLava.FanEffects:Destroy()
							end
						end

						local npcPiege = workspace:FindFirstChild("NPC & Piege")

						if npcPiege then
							if npcPiege:FindFirstChild("NPC_Zone5") then
								npcPiege.NPC_Zone5:Destroy()
							end

							if npcPiege:FindFirstChild("NPC_Zone9") then
								npcPiege.NPC_Zone9:Destroy()
							end
						end

						local keycaps = workspace:FindFirstChild("Keycaps")

						if keycaps then
							for _, v3 in ipairs({ "Stage10Bridge", "Stage10Bridge2", "Stage10Bridge3" }) do
								local bridge = keycaps:FindFirstChild(v3)
								bridge = bridge and bridge:FindFirstChild("Bridge")

								if bridge and bridge:FindFirstChild("TouchInterest") then
									bridge.TouchInterest:Destroy()
								end
							end
						end
					elseif cached.CurrentWorld == "World 3" then
						if workspace:FindFirstChild("NPC & Piege"):FindFirstChild("Lava_Stage3") then
							workspace["NPC & Piege"].Lava_Stage3:Destroy()
						end

						local part = Instance.new("Part")
						part.Name = "Top_"
						part.Size = Vector3.new(10, 10, 10)
						part.Position = Vector3.new(-1455.9448, -99.99493, -651.29736)
						part.Transparency = 1
						part.CanCollide = false
						part.Anchored = true
						part.Parent = workspace
						local part2 = Instance.new("Part")
						part2.Name = "Bottom_"
						part2.Size = Vector3.new(10, 10, 10)
						part2.Position = Vector3.new(-1452.0388, -142.08012, -785.12317)
						part2.Transparency = 1
						part2.CanCollide = false
						part2.Anchored = true
						part2.Parent = workspace
					end

					cached.ObstacleDestroyed = true
				end
			end
		end)

		funcs:Toggle(tbl4.Automation:AddSection("Auto Rebirth"), "Auto Rebirth", "", false, true, function(arg)
			enabled["Auto Rebirth"] = arg
		end)

		local v3 = tbl4.Automation:AddSection("World Teleport")
		v3:AddSeperator({ " - [ Config ] - " })

		funcs:Dropdown(v3, "World Selection", "", false, { "World 1", "World 2", "World 3", "World 4 (G2)" }, { "" }, true, function(arg)
			enabled["World Selection"] = arg
		end)

		v3:AddSeperator({ " - [ Toggle ] - " })

		funcs:Toggle(v3, "Auto Teleport World", "10s Before Teleport", false, true, function(arg)
			enabled["Auto Teleport World"] = arg
		end)

		local v4 = tbl4.Items:AddSection("Buy Trails")
		v4:AddSeperator({ " - [ Config ] - " })

		funcs:Dropdown(v4, "Select Buy Trails", "", true, {
			"Green",
			"Blue",
			"Purple",
			"Red",
			"Rainbow",
			"Cosmic",
			"Void",
			"Supernova",
			"Godlike",
			"Divine",
			"Celestial",
			"Eternal",
			"Ascendant",
			"Transcendent",
		}, {}, true, function(arg)
			enabled["Select Buy Trails"] = arg
		end)

		v4:AddSeperator({ " - [ Toggle ] - " })

		funcs:Toggle(v4, "Auto Buy Trails", "", false, true, function(arg)
			enabled["Auto Buy Trails"] = arg
		end)

		local v5 = tbl4.Items:AddSection("Buy Aura")
		v5:AddSeperator({ " - [ Config ] - " })

		funcs:Dropdown(v5, "Select Buy Aura", "", true, { "Glow", "Wind", "Water", "Fire", "Electric", "Chocolate", "Candy", "Storm", "Alphabet" }, {}, true, function(arg)
			enabled["Select Buy Aura"] = arg
		end)

		funcs:Dropdown(v5, "Select Buy Aura (Galaxy 2)", "", true, { "Orange", "Pink", "Cyan", "Yellow", "Caramel", "WhiteChocolate" }, {}, true, function(arg)
			enabled["Select Buy Aura (Galaxy 2)"] = arg
		end)

		v5:AddSeperator({ " - [ Toggle ] - " })

		funcs:Toggle(v5, "Auto Buy Aura", "", false, true, function(arg)
			enabled["Auto Buy Aura"] = arg
		end)

		funcs:Toggle(v5, "Auto Buy Aura (Galaxy 2)", "", false, true, function(arg)
			enabled["Auto Buy Aura (Galaxy 2)"] = arg
		end)

		local v6 = tbl4.Items:AddSection("Buy Items")
		v6:AddSeperator({ " - [ Config ] - " })

		funcs:Dropdown(v6, "Select Buy Rarity", "", true, { "Common", "Uncommon", "Rare", "Epic", "Legendary", "Mythic", "Secret" }, {}, true, function(arg)
			enabled["Select Buy Rarity"] = arg
		end)

		v6:AddSeperator({ " - [ Toggle ] - " })

		funcs:Toggle(v6, "Auto Buy Items", "", false, true, function(arg)
			enabled["Auto Buy Items"] = arg
		end)

		funcs:Toggle(tbl4.Items:AddSection("Equip Items"), "Auto Equip Best", "", false, true, function(arg)
			enabled["Auto Equip Best"] = arg
		end)

		funcs:Toggle(tbl4.Items:AddSection("Merge Items"), "Auto Merge Items", "Merge 5 same items to upgrade tier", false, true, function(arg)
			enabled["Auto Merge Items"] = arg
		end)

		local v7 = tbl4.Items:AddSection("Summer Shop")
		v7:AddSeperator({ " - [ Config ] - " })

		funcs:Dropdown(v7, "Select Buy Slot", "", true, { "Common", "Uncommon", "Rare", "Mysterious" }, {}, true, function(arg)
			enabled["Select Buy Slot"] = arg
		end)

		funcs:Button(v7, "Buy Selected (Coins)", "Buy one selected summer item with Summer Coins", function()
			modules.SummerShop.Refresh()
			task.wait(0.75)

			if not modules.SummerShop.BuyOnce() then
				shx:SetNotification({ "SUMMER SHOP", "", "No selected slot in stock", 4, 0.5 })
			end
		end)

		v7:AddSeperator({ " - [ Toggle ] - " })

		funcs:Toggle(v7, "Auto Buy Summer Shop", "", false, true, function(arg)
			enabled["Auto Buy Summer Shop"] = arg
		end)

		local v8 = tbl4.Special:AddSection("Unlock Gamepass")
		v8:AddSeperator({ " - [ Treadmill ] - " })

		funcs:Toggle(v8, "Gold Treadmill", "", false, true, function(arg)
			enabled["Gold Treadmill"] = arg
			if not enabled["Gold Treadmill"] then
				return
			end

			pcall(function()
				local get = ClientState.Get

				ClientState.Get = function(arg2, ...)
					local v9 = get(arg2, ...)
					v9.GoldTreadmillActive = true
					return v9
				end
			end)
		end)

		funcs:Toggle(v8, "Diamond Treadmill", "", false, true, function(arg)
			enabled["Diamond Treadmill"] = arg
			if not enabled["Diamond Treadmill"] then
				return
			end

			pcall(function()
				local get = ClientState.Get

				ClientState.Get = function(arg2, ...)
					local v9 = table.pack(...)
					local v10 = get
					v9.n = 2 + v9.n - 1
					table.move(v9, 1, v9.n, 2, v9)
					v9[1] = arg2
					local v11 = v10(table.unpack(v9, 1, v9.n))
					v11.DiamondTreadmillActive = true
					return v11
				end
			end)
		end)

		funcs:Toggle(v8, "Candy Treadmill", "", false, true, function(arg)
			enabled["Candy Treadmill"] = arg
			if not enabled["Candy Treadmill"] then
				return
			end

			pcall(function()
				local get = ClientState.Get

				ClientState.Get = function(arg2, ...)
					local v9 = table.pack(...)
					local v10 = get
					v9.n = 2 + v9.n - 1
					table.move(v9, 1, v9.n, 2, v9)
					v9[1] = arg2
					local v11 = v10(table.unpack(v9, 1, v9.n))
					v11.CandyTreadmillActive = true
					return v11
				end
			end)
		end)

		funcs:Toggle(v8, "Admin Treadmill", "", false, true, function(arg)
			enabled["Admin Treadmill"] = arg
			if not enabled["Admin Treadmill"] then
				return
			end

			pcall(function()
				local get = ClientState.Get

				ClientState.Get = function(arg2, ...)
					local v9 = table.pack(...)
					local v10 = get
					v9.n = 2 + v9.n - 1
					table.move(v9, 1, v9.n, 2, v9)
					v9[1] = arg2
					local v11 = v10(table.unpack(v9, 1, v9.n))
					v11.AdminTreadmillActive = true
					return v11
				end
			end)
		end)

		v8:AddSeperator({ " - [ Visuals ] - " })

		funcs:Dropdown(v8, "Select Visual Trail", "", false, {
			"Ascendant",
			"Bbno",
			"BbnoFace",
			"Blue",
			"Brazil",
			"Burger",
			"Canada",
			"Caramel",
			"Celestial",
			"Cosmic",
			"Cyan",
			"Divine",
			"Dollars",
			"Eternal",
			"Galaxy",
			"Godlike",
			"Green",
			"Infinity",
			"Larper",
			"Orange",
			"Pink",
			"Purple",
			"Rainbow",
			"Red",
			"Supernova",
			"Transcendent",
			"Void",
			"WhiteChocolate",
			"Yellow",
		}, { "Green" }, true, function(arg)
			enabled["Select Visual Trail"] = arg
		end)

		funcs:Toggle(v8, "Equip Trails Visual", "Visual only for unowned trails", false, true, function(arg)
			enabled["Equip Trails Visual"] = arg
			if not enabled["Equip Trails Visual"] then
				return
			end

			pcall(function()
				local get = ClientState.Get

				ClientState.Get = function(arg2, ...)
					local v9 = table.pack(...)
					local v10 = get
					v9.n = 2 + v9.n - 1
					table.move(v9, 1, v9.n, 2, v9)
					v9[1] = arg2
					local v11 = v10(table.unpack(v9, 1, v9.n))

					if enabled["Equip Trails Visual"] and enabled["Select Visual Trail"] then
						local selectVisualTrail = enabled["Select Visual Trail"]
						local pos = selectVisualTrail:find("Trail$") and selectVisualTrail or selectVisualTrail .. "Trail"
						v11.EquippedTrail = pos
						v11.Trail = pos
					end

					return v11
				end
			end)
		end)

		funcs:Dropdown(v8, "Select Visual Aura", "", false, {
			"Alphabet",
			"Burger",
			"Candy",
			"Chocolate",
			"Cruz",
			"Darkness",
			"Dollars",
			"Electric",
			"Fire",
			"Glow",
			"Medal",
			"Splink",
			"Storm",
			"Water",
			"Wind",
		}, { "Glow" }, true, function(arg)
			enabled["Select Visual Aura"] = arg
		end)

		funcs:Toggle(v8, "Equip Aura Visuals", "Visual only for unowned auras", false, true, function(arg)
			enabled["Equip Aura Visuals"] = arg
			if not enabled["Equip Aura Visuals"] then
				return
			end

			pcall(function()
				local get = ClientState.Get

				ClientState.Get = function(arg2, ...)
					local v9 = table.pack(...)
					local v10 = get
					v9.n = 2 + v9.n - 1
					table.move(v9, 1, v9.n, 2, v9)
					v9[1] = arg2
					local v11 = v10(table.unpack(v9, 1, v9.n))

					if enabled["Equip Aura Visuals"] and enabled["Select Visual Aura"] then
						local selectVisualAura = enabled["Select Visual Aura"]
						local pos = selectVisualAura:find("Aura$") and selectVisualAura or selectVisualAura .. "Aura"
						v11.EquippedAura = pos
						v11.Aura = pos
					end

					return v11
				end
			end)
		end)

		v8:AddSeperator({ " - [ Sound ] - " })

		funcs:Dropdown(v8, "Select Sound Pack", "", false, {
			"Creamy",
			"Clacky",
			"Bubble",
			"Candy",
			"Chocolate",
			"Christmas",
			"Honey",
			"Lava",
			"Premium",
			"Slime",
			"Snow",
			"Water",
			"BBNO_BOTTLE",
			"BBNO_GOOFY",
			"BBNO_OOF",
			"BBNO_PAH",
			"BBNO_POP",
			"BBNO_TAK",
			"BBNO_UHH",
			"BBNO_YAP",
		}, { "Creamy" }, true, function(arg)
			enabled["Select Sound Pack"] = arg

			if enabled["Equip Sound"] and arg then
				pcall(function()
					localPlayer:SetAttribute("EquippedSoundPack", arg)
				end)
			end
		end)

		funcs:Toggle(v8, "Equip Sound", "Equip sound pack attribute", false, true, function(arg)
			enabled["Equip Sound"] = arg
			local selectSoundPack = enabled["Select Sound Pack"] or "Creamy"

			if arg then
				pcall(function()
					localPlayer:SetAttribute("EquippedSoundPack", selectSoundPack)
				end)
			else
				pcall(function()
					localPlayer:SetAttribute("EquippedSoundPack", "Creamy")
				end)
			end
		end)

		funcs:Button(tbl4.Special:AddSection("Rewards"), "Claim Group Reward", "", function()
			ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("ClaimGift")
		end)

		local Risk = tbl4.Risk:AddSection("Risk")

		funcs:Toggle(Risk, "Instant Win +1", "", false, true, function(arg)
			enabled["Instant Win +1"] = arg
		end)

		Risk:AddSeperator({ " - [ Local Player ] - " })

		funcs:Toggle(Risk, "No Clip", "", false, true, function(arg)
			enabled["No Clip"] = arg

			utils.Fallback(arg, "No Clip", function()
				local character2 = localPlayer and localPlayer.Character

				for _, child in pairs(character2:GetChildren()) do
					if child:IsA("BasePart") then
						child.CanCollide = true
					end
				end
			end)
		end)

		funcs:Toggle(Risk, "Infinite Jump", "", false, true, function(arg)
			enabled["Infinite Jump"] = arg

			utils.Connections(UserInputService.JumpRequest, function()
				local character2 = localPlayer and localPlayer.Character
				character2 = character2 and character2:FindFirstChild("Humanoid")

				if character2 and enabled["Infinite Jump"] then
					character2:ChangeState("Jumping")
				end
			end)
		end)

		funcs:Textbox(Risk, "Set Speed", "", false, true, function(arg)
			enabled["Set Speed"] = tonumber(arg) or 20
		end)

		funcs:Toggle(Risk, "Bypass Walkspeed", "", false, true, function(arg)
			enabled["Bypass Walkspeed"] = arg

			utils.Connections(localPlayer.CharacterAdded, function(arg2)
				misc.BypassWalkSpeed()
				local setSpeed = enabled["Set Speed"]
				arg2:WaitForChild("Humanoid").WalkSpeed = setSpeed
			end)
		end)

		local Misc = tbl4.Miscellaneous:AddSection("Misc")

		funcs:Button(Misc, "Reduce Lag", "", function()
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

		funcs:Toggle(Misc, "Auto Reconnect", "", false, true, function(arg)
			enabled["Auto Reconnect"] = arg

			if enabled["Auto Reconnect"] then
				CoreGui.ChildAdded:Connect(function(child)
					if child.Name == "ErrorPrompt" then
						task.wait(5)
						TeleportService:Teleport(game.PlaceId, localPlayer)
					end
				end)
			end
		end)

		funcs:Toggle(Misc, "Show Screen White", "", false, true, function(arg)
			RunService:Set3dRenderingEnabled(not arg)
		end)

		funcs:Toggle(Misc, "Show Screen Black", "", false, true, function(arg)
			Lighting.ExposureCompensation = arg and -10 or 0
		end)

		funcs:Button(tbl4.Settings:AddSection("Reset Config"), "Reset Script Config", "", function()
			for _, v9 in next, { "Speed_Hub", "SpeedHubX", "Speed Hub X", "Speed Hub", "Speed_Hub_X" }, nil do
				if isfolder(v9) then
					delfolder(v9)
				end
			end
		end)

		task.spawn(shx.AddSettingUi, shx, v)
	end

	tbl3.LoadFunction = function()
		local function fn6(arg, arg2)
			task.spawn(function()
				utils.StartLoop(arg, arg2)
			end)
		end

		fn6("Bypass Walkspeed", function()
			local setSpeed = enabled["Set Speed"]
			Players.LocalPlayer.Character:WaitForChild("Humanoid").WalkSpeed = setSpeed
			task.wait()
		end)

		fn6("No Clip", function()
			local character2 = localPlayer and localPlayer.Character
			if not character2 then
				return
			end

			for _, child in pairs(character2:GetChildren()) do
				if child:IsA("BasePart") then
					child.CanCollide = false
				end
			end
		end)

		fn6("Instant Win +1", function()
			local winBlock1 = game:GetService("Workspace").Structure.Stage2.WinBlock1
			sethiddenproperty(humanoidRootPart, "PhysicsRepRootPart", winBlock1)
			winBlock1.CFrame = humanoidRootPart.CFrame + Vector3.new(0, -4, 0)
			pcall(firetouchinterest, humanoidRootPart, winBlock1, 0)
			task.wait()
			pcall(firetouchinterest, humanoidRootPart, winBlock1, 1)
			task.wait()
		end)

		fn6("Auto Rebirth", function()
			local ok, result = pcall(function()
				return ClientState:Get()
			end)

			if not ok or not result then
				task.wait(1)
				return
			end
			local rebirth = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Rebirth")
			local n = result.Rebirths + 1
			local v = require(ReplicatedStorage:WaitForChild("Config")).REBIRTH_TIERS[n]

			if v and v.level and result.Level >= v.level then
				rebirth:FireServer()
				task.wait(0.75)
			end

			task.wait(1)
		end)

		fn6("Auto Collect Coins", function()
			local v = ipairs
			local summerCoinsLocal = workspace:FindFirstChild("SummerCoinsLocal")

			for _, child in v(summerCoinsLocal:GetChildren()) do
				local attribute = child:GetAttribute("CoinId")

				if attribute then
					container:WaitForChild("SummerCoinCollect"):FireServer(attribute)
					task.wait(0.2)
				end
			end

			task.wait(1)
		end)

		fn6("Auto Claim Summer Quests", function()
			modules.SummerQuests.Refresh()
			task.wait(0.75)

			if modules.SummerQuests.ClaimNext() then
				task.wait(1.2)
			else
				task.wait(5)
			end
		end)

		fn6("Auto Buy Summer Shop", function()
			modules.SummerShop.Refresh()
			task.wait(0.75)

			if modules.SummerShop.BuyOnce() then
				task.wait(1.2)
			else
				task.wait(3)
			end
		end)

		fn6("Auto Buy Items", function()
			task.wait(2)
			local selectBuyRarity = enabled["Select Buy Rarity"]
			if not selectBuyRarity or #selectBuyRarity == 0 then
				return
			end
			local shopItemsFrame = game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("SpeedGameUI", true) and game.Players.LocalPlayer.PlayerGui.SpeedGameUI:FindFirstChild("Modals", true) and game.Players.LocalPlayer.PlayerGui.SpeedGameUI.Modals:FindFirstChild("ItemShopModal", true) and game.Players.LocalPlayer.PlayerGui.SpeedGameUI.Modals.ItemShopModal:FindFirstChild("ShopItemsFrame")
			if not shopItemsFrame then
				return
			end
			local tbl4 = {}

			for _, v in ipairs(selectBuyRarity) do
				tbl4[v] = true
			end

			for _, v in ipairs({ "Common", "Uncommon", "Rare" }) do
				if not tbl4[v] then
					continue
				end
				local v2 = shopItemsFrame:FindFirstChild(v)
				if not v2 then
					continue
				end
				local numberFrame = v2:FindFirstChild("NumberFrame")
				local n = 0

				if numberFrame then
					local numberText = numberFrame:FindFirstChild("NumberText")

					if numberText and numberText:IsA("TextLabel") then
						local text = numberText.Text

						if text ~= "Sold out" then
							local match = text:match("^(%d+)/")

							if match then
								n = tonumber(match)
							end
						end
					end
				end

				if not (n > 0) then
					continue
				end
				container.BuyWins:FireServer(v)
				return
			end

			if not (tbl4.Epic or tbl4.Legendary or tbl4.Mythic or tbl4.Secret) then
				return
			end
			local mysterious = shopItemsFrame:FindFirstChild("Mysterious")
			if not mysterious then
				return
			end
			local numberFrame = mysterious:FindFirstChild("NumberFrame")
			local n = 0

			if numberFrame then
				local numberText = numberFrame:FindFirstChild("NumberText")

				if numberText and numberText:IsA("TextLabel") then
					local text = numberText.Text

					if text ~= "Sold out" then
						local match = text:match("^(%d+)/")

						if match then
							n = tonumber(match)
						end
					end
				end
			end

			if n <= 0 then
				return
			end
			local rarity = mysterious:FindFirstChild("Rarity")
			if not rarity then
				return
			end
			local rarityText = rarity:FindFirstChild("RarityText")
			if not rarityText or not rarityText:IsA("TextLabel") then
				return
			end

			if tbl4[rarityText.Text] then
				container.BuyWins:FireServer("Mysterious")
			end
		end)

		fn6("Auto Equip Best", function()
			remotes:WaitForChild("ItemAction"):FireServer("EquipBest")
			task.wait(5)
		end)

		fn6("Auto Merge Items", function()
			if modules.ItemMerger.MergeOnce() then
				local n = os.clock() + 2

				while not cached.MergeUpdated and os.clock() < n do
					task.wait(0.1)
				end
			else
				task.wait(3)
			end
		end)

		fn6("Auto Win", function()
			local currentWorld = cached.CurrentWorld
			local selectWinAmount = enabled["Select Win Amount"]
			local loopDelay = enabled["Loop Delay"]
			cached.DEFAULT_WALK_SPEED = enabled["Movement Speed"] or 120

			local ok, result = pcall(function()
				modules.AutoWin.Run(currentWorld, selectWinAmount, { StopAfterRun = true })
			end)

			if not ok then
				if fn2 then
					fn2(result, "Auto Win")
				else
					warn("[Auto Win]", result)
				end
			end

			task.wait(loopDelay)
		end)

		fn6("Anti Special Key", function()
			if workspace:FindFirstChild("SpecialKeys") then
				local children = workspace.SpecialKeys:GetChildren()

				if #children > 0 then
					for _, child in ipairs(children) do
						child:Destroy()
					end
				end
			end

			task.wait(1)
		end)

		fn6("Auto Buy Aura", function()
			local selectBuyAura = enabled["Select Buy Aura"]
			if #selectBuyAura == 0 then
				return
			end
			local tbl4 = {}

			for _, v in selectBuyAura, nil, nil do
				table.insert(tbl4, v .. "Aura")
			end

			local children = localPlayer.PlayerGui:WaitForChild("SpeedGameUI").Modals.InventoryModal.ModalsFrame.Auras.ScrollingFrame:GetChildren()
			local num = tonumber(localPlayer.leaderstats.Wins.Value)

			for _, v in children, nil, nil do
				if v:IsA("Frame") and table.find(tbl4, v.Name) then
					if v:FindFirstChild("BuyWins") and v:FindFirstChild("BuyWins").Visible == true then
						local v2 = cached.auraPrices[v.Name]

						if v2 and v2 > 0 and num >= v2 then
							container:WaitForChild("BuyAura"):InvokeServer(v.Name, "Wins")
							task.wait(1)
						end
					end
				end
			end

			task.wait(1)
		end)

		fn6("Auto Buy Aura (Galaxy 2)", function()
			if cached.CurrentWorld ~= "World 4" and cached.CurrentWorld ~= "World 4 (G2)" and cached.CurrentWorld ~= "Galaxy 2" then
				return
			end
			local selectBuyAuraGalaxy2 = enabled["Select Buy Aura (Galaxy 2)"] or {}
			if #selectBuyAuraGalaxy2 == 0 then
				return
			end
			local tbl4 = {}

			for _, v in selectBuyAuraGalaxy2, nil, nil do
				table.insert(tbl4, v .. "Aura")
				table.insert(tbl4, v .. "Trail")
				table.insert(tbl4, v)
			end

			local children = localPlayer.PlayerGui:WaitForChild("SpeedGameUI").Modals.InventoryModal.ModalsFrame.Auras.ScrollingFrame:GetChildren()
			local num = tonumber(localPlayer.leaderstats.Wins.Value)
			local auraPrices2 = cached.auraPrices_2 or cached.auraPrices or {}

			for _, v in children, nil, nil do
				if v:IsA("Frame") and (table.find(tbl4, v.Name) or table.find(selectBuyAuraGalaxy2, v.Name)) then
					if v:FindFirstChild("BuyWins") and v:FindFirstChild("BuyWins").Visible == true then
						local v2 = auraPrices2[v.Name] or auraPrices2[v.Name:gsub("Aura", "Trail")] or auraPrices2[v.Name .. "Aura"]

						if v2 and v2 > 0 and num and num >= v2 then
							container:WaitForChild("BuyAura"):InvokeServer(v.Name, "Wins")
							task.wait(1)
						end
					end
				end
			end

			task.wait(1)
		end)

		fn6("Auto Buy Trails", function()
			local selectBuyTrails = enabled["Select Buy Trails"]
			if #selectBuyTrails == 0 then
				return
			end
			local tbl4 = {}

			for _, v in selectBuyTrails, nil, nil do
				table.insert(tbl4, v .. "Trail")
			end

			local children = localPlayer.PlayerGui:WaitForChild("SpeedGameUI").Modals.InventoryModal.ModalsFrame.Trails.ScrollingFrame:GetChildren()
			local num = tonumber(localPlayer.leaderstats.Wins.Value)

			for _, v in children, nil, nil do
				if v:IsA("Frame") and table.find(tbl4, v.Name) then
					if v:FindFirstChild("BuyWins") and v:FindFirstChild("BuyWins").Visible == true then
						local v2 = cached.trailPrices[v.Name]

						if v2 and v2 > 0 and num >= v2 then
							container:WaitForChild("BuyTrail"):InvokeServer(v.Name, "Wins")
							task.wait(1)
						end
					end
				end
			end

			task.wait(1)
		end)

		fn6("Auto Teleport World", function()
			task.wait(5)

			if enabled["World Selection"] ~= cached.CurrentWorld then
				local num = tonumber(string.match(enabled["World Selection"], "%d+"))
				remotes:WaitForChild("RequestWorldTeleport"):FireServer(num)
			end
		end)
	end

	tbl3.Dependency = function()
		local world = require(ReplicatedStorage:WaitForChild("Config")).WORLD

		if world == 1 then
			cached.CurrentWorld = "World 1"

			cached.WinAmount = {
				"Smart",
				"1 Win",
				"3 Wins",
				"10 Wins",
				"20 Wins",
				"50 Wins",
				"100 Wins",
				"150 Wins",
				"300 Wins",
				"500 Wins",
				"1000 Wins",
				"2500 Wins",
				"10000 Wins",
				"25000 Wins",
				"50000 Wins",
				"150K Wins",
			}
		elseif world == 2 then
			cached.CurrentWorld = "World 2"

			cached.WinAmount = {
				"250K Wins",
				"400K Wins",
				"600K Wins",
				"1M Wins",
				"1.5M Wins",
				"2.5M Wins",
				"4M Wins",
				"6M Wins",
				"10M Wins",
				"15M Wins",
				"25M Wins",
				"40M Wins",
				"60M Wins",
				"100M Wins",
				"200M Wins",
			}
		elseif world == 3 then
			cached.CurrentWorld = "World 3"

			cached.WinAmount = {
				"300M Wins",
				"500M Wins",
				"800M Wins",
				"1.25B Wins",
				"2B Wins",
				"3.5B Wins",
				"5.5B Wins",
				"8.5B Wins",
				"16B Wins",
				"25B Wins",
				"40B Wins",
				"65B Wins",
				"100B Wins",
				"200B Wins",
			}
		elseif world == 4 then
			cached.CurrentWorld = "World 4 (G2)"
			cached.WinAmount = { "1 Wins", "3 Wins", "10 Wins", "20 Wins", "50 Wins", "100 Wins" }
		end

		utils.Connections(localPlayer.CharacterAdded, function(arg)
			character = arg
			humanoid = character:WaitForChild("Humanoid")
			humanoidRootPart = character:WaitForChild("HumanoidRootPart")
		end, "Dependency_001")

		cached.auraPrices = {
			GlowAura = 1000000,
			WindAura = 5000000,
			WaterAura = 10000000,
			MedalAura = 0,
			FireAura = 25000000,
			ElectricAura = 50000000,
			CandyAura = 100000000,
			ChocolateAura = 250000000,
			StormAura = 500000000,
			DollarsAura = 1000000,
			BurgerAura = 5000000,
			AlphabetAura = 1e9,
			OrangeAura = 500,
			PinkAura = 1500,
			CyanAura = 5000,
			YellowAura = 25000,
			CaramelAura = 100000,
			WhiteChocolateAura = 500000,
			OrangeTrail = 500,
			PinkTrail = 1500,
			CyanTrail = 5000,
			YellowTrail = 25000,
			CaramelTrail = 100000,
			WhiteChocolateTrail = 500000,
		}

		cached.trailPrices = {
			PurpleTrail = 5000,
			SupernovaTrail = 500000000,
			RedTrail = 25000,
			EasterTrail = 0,
			CosmicTrail = 5000000,
			RainbowTrail = 100000,
			InfinityTrail = 0,
			VoidTrail = 50000000,
			GreenTrail = 500,
			EasterGoldenTrail = 0,
			GodlikeTrail = 5e9,
			BlueTrail = 1500,
			GalaxyTrail = 0,
			DivineTrail = 1e10,
			CelestialTrail = 2e10,
			EternalTrail = 5e10,
			AscendantTrail = 7.5e11,
			TranscendentTrail = 1.5e11,
		}
	end

	tbl3:Dependency()
	tbl3:LoadFunction()
	tbl3:LoadLibrary()
end

local tbl

tbl = {
	Request = http_request or request or http and http.request,
	Script_ID = "e821edf60189009796fd23711192d93d",
	Load = function(scriptKey)
		script_key = scriptKey
		getfenv(0).script_key = scriptKey
		getfenv(1).script_key = scriptKey
		getgenv().script_key = scriptKey
		loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/" .. tbl.Script_ID .. ".lua"))()
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

			arg2 = tbl:MathFloor(arg2 / 2)
			arg3 = tbl:MathFloor(arg3 / 2)
			n2 *= 2
		end

		return n
	end,
	LeftShift = function(arg, arg2, arg3)
		return tbl:Uint32(arg2 * 2 ^ arg3)
	end,
	RightShift = function(arg, arg2, arg3)
		return tbl:MathFloor(arg2 / 2 ^ arg3) % 4294967296
	end,
	ToString = function(arg, arg2)
		return tostring(arg2)
	end,
	Concat = function(arg, arg2, arg3)
		local str = arg3 or ""
		local str2 = ""

		for i = 1, #arg2 do
			str2 ..= tbl:ToString(arg2[i])

			if i ~= #arg2 then
				str2 ..= str
			end
		end

		return str2
	end,
	Encryption = function(arg, arg2)
		local tbl2 = { 1524013928, 62333482, 755453430, 3411017517 }
		local tbl3 = { 451, 41992, 38477, 17184 }
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

			local v = tbl:Uint32(n3)

			for i = 1, 4 do
				local v2 = tbl2[i % 4 + 1]
				local v3 = tbl:BitwiseXor(tbl:BitwiseXor(tbl2[i], v), v2)
				local v4 = tbl3[i]
				local v5 = tbl:Uint32(tbl:LeftShift(v3, 5) + tbl:RightShift(v3, 2) + v4)
				local v6 = tbl:RightShift(v, (i - 1) * 5 % 32)
				local v7 = tbl:BitwiseXor(v5, v6)
				local v8 = tbl2[(i + 1) % 4 + 1]
				local v9 = tbl:Uint32(tbl:Uint32(v7) + v8)
				tbl2[i] = tbl:Uint32(v9)
			end

			n2 += 4
		end

		for i = 1, 4 do
			local v = tbl2[(i + 2) % 4 + 1]
			local v2 = tbl:BitwiseXor(tbl:Uint32(tbl2[i] + tbl2[i % 4 + 1]), v)
			local n3 = i * 7 % 32
			tbl2[i] = tbl:Uint32(tbl:LeftShift(v2, n3) + tbl:RightShift(v2, 32 - n3))
		end

		local tbl4 = {}

		for i = 1, 4 do
			tbl4[i] = string.format("%08X", tbl2[i])
		end

		return tbl:Concat(tbl4)
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
		tbl.Script_ID = tostring(tbl.Script_ID)
		local data = tbl:JSONDecode(tbl.Request({ Url = "https://sdkapi-public.luarmor.net/sync", Method = "GET" }).Body)
		local nodes = data.nodes
		local str2 = "check_key?key=" .. str .. "&script_id=" .. tbl.Script_ID
		local n = now + data.st - now

		local v = tbl.Request({
			Url = nodes[math.random(1, #nodes)] .. str2,
			Method = "GET",
			Headers = {
				clienttime = tostring(n),
				catcat128 = tbl:Encryption(str .. "_cfver1.0_" .. tbl.Script_ID .. "_time_" .. n),
			},
		})

		if not v or not type(v) == "table" then
			return nil
		end

		if v.StatusMessage and v.StatusMessage:find("{") then
			local match = v.StatusMessage:match("(%b{})")
			if match then
				return tbl:JSONDecode(match)
			end
		end

		return tbl:JSONDecode(v.Body)
	end,
}

if tbl:KqNajmBbtvaSwVktmdHAUSLHdbErNkfYxZJMxUydYMvhPKHBLCHBbjSCBjECVRFqyjGqzPGfgncLXRhtxCBeLrArAgVUxUhfnSWF() then
	task.spawn(fn)
	return
end

if isfile("SpeedHubX_Key.txt") then
	local txt = readfile("SpeedHubX_Key.txt")
	local v = tbl.CheckerKey(txt)

	if v and v.code == "KEY_VALID" then
		task.spawn(fn)
		task.spawn(tbl.Load, txt)
		return
	end
end

if script_key and type(script_key) == "string" then
	local v = tbl.CheckerKey(script_key)

	if v and v.code == "KEY_VALID" then
		task.spawn(fn)
		task.spawn(tbl.Load, script_key)
		return
	end
end

local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Main/refs/heads/main/Library/KeySystemV2.5.lua"))()
local lib2 = loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Main/refs/heads/main/Library/Key%20System/Get%20Key%20API.lua"))()

local v = lib.Load({
	Name = "Speed Hub X",
	Icon = 136890595976124,
	DiscordLink = "discord.gg/speedhubx",
	Color = Color3.fromRGB(204, 33, 10),
	Callback = function(arg)
		local str = arg:gsub("%s+", " "):gsub("^%s*(.-)%s*$", "%1")
		local v = tbl.CheckerKey(str)

		if v.code == "KEY_VALID" then
			lib.Notify({ Title = "Key Valid!", Icon = 14939475472, Time = 5, Color = Color3.fromRGB(0, 255, 81) })

			delay(0.5, function()
				lib.Notify({ Title = "Loading script", Icon = 14939512891, Time = 5, Color = Color3.fromRGB(0, 255, 81) })
			end)

			delay(1.5, function()
				lib.DestroyUI()
			end)

			pcall(writefile, "SpeedHubX_Key.txt", str)
			task.spawn(fn)
			task.spawn(tbl.Load, str)
		elseif v.code == "KEY_HWID_LOCKED" then
			lib.Notify({
				Title = "Key linked to a different HWID. Please reset it using our bot, join discord.gg/speedhubx !",
				Icon = 14943813832,
				Time = 5,
				Color = Color3.fromRGB(255, 37, 17),
			})
		elseif v.code == "KEY_EXPIRED" then
			lib.Notify({
				Title = "The Provided Key has expired.",
				Icon = 14943813832,
				Time = 5,
				Color = Color3.fromRGB(240, 192, 96),
			})
		elseif v.code == "KEY_BANNED" then
			lib.Notify({
				Title = "The Provided Key is banned.",
				Icon = 14943813832,
				Time = 5,
				Color = Color3.fromRGB(255, 37, 17),
			})
		elseif v.code == "INVALID_EXECUTOR" then
			lib.Notify({
				Title = "your Executor is not supported",
				Icon = 14943813832,
				Time = 5,
				Color = Color3.fromRGB(255, 37, 17),
			})
		elseif v.code == "KEY_INCORRECT" then
			lib.Notify({
				Title = "The Provided Key is incorrect / it does not exist.",
				Icon = 14943813832,
				Time = 5,
				Color = Color3.fromRGB(255, 37, 17),
			})
		elseif v.code == "KEY_INVALID" then
			lib.Notify({
				Title = "The Provided Key is in an invalid format.",
				Icon = 14943813832,
				Time = 5,
				Color = Color3.fromRGB(255, 37, 17),
			})
		end
	end,
})

for k, v2 in next, lib2[game.GameId], nil do
	v.New({
		Title = k,
		Icon = v2.Icon,
		Callback = function()
			pcall(setclipboard, v2.Url)
			lib.Notify({ Title = "Copied Get Key " .. k .. " Link", Icon = 14939475472, Time = 5 })
		end,
	})
end

v.Explain("Keyless will be enabled every weekend.")
task.spawn(fn)
