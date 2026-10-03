local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")
game:IsLoaded()
local PlayerGui = Players.LocalPlayer:FindFirstChildOfClass("PlayerGui")
local HoshiHubLoader = PlayerGui:FindFirstChild("HoshiHubLoader")
HoshiHubLoader:Destroy()
local HoshiHub_Loader_Boot = CoreGui:FindFirstChild("HoshiHub_Loader_Boot")
HoshiHub_Loader_Boot:GetAttribute("JobId")
HoshiHub_Loader_Boot:SetAttribute("JobId", tostring(game.JobId))
HoshiHub_Loader_Boot:SetAttribute("Stamp", 1791037101)
print("[HoshiHub] loader v1.5.7")
task.spawn(function(...)
	local response = game:HttpGet("https://api.hoshihub.site/api/loader/keyless")
	HttpService:JSONDecode(response)
	local ScreenGui2 = Instance.new("ScreenGui")
	ScreenGui2.Name = "HoshiHubLoader"
	ScreenGui2.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	ScreenGui2.ResetOnSpawn = false
	ScreenGui2.IgnoreGuiInset = true
	ScreenGui2.DisplayOrder = 999
	ScreenGui2.Parent = PlayerGui
	local Frame2 = Instance.new("Frame")
	Frame2.AnchorPoint = Vector2.new(0.5, 0.5)
	Frame2.Position = UDim2.fromScale(0.5, 0.5)
	Frame2.ClipsDescendants = true
	Frame2.BackgroundColor3 = Color3.fromRGB(11, 13, 18)
	Frame2.BorderSizePixel = 0
	Frame2.Size = UDim2.fromOffset(440, 318)
	Frame2.Parent = ScreenGui2
	local UICorner = Instance.new("UICorner")
	UICorner.CornerRadius = UDim.new(0, 8)
	UICorner.Parent = Frame2
	local UIStroke = Instance.new("UIStroke")
	UIStroke.Color = Color3.fromRGB(42, 42, 48)
	UIStroke.Thickness = 1
	UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	UIStroke.Parent = Frame2
	local Frame3 = Instance.new("Frame")
	Frame3.BackgroundTransparency = 1
	Frame3.Size = UDim2.new(1, 0, 0, 52)
	Frame3.Parent = Frame2
	local TextLabel = Instance.new("TextLabel")
	TextLabel.TextXAlignment = Enum.TextXAlignment.Left
	TextLabel.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold)
	TextLabel.BackgroundTransparency = 1
	TextLabel.Position = UDim2.new(0, 20, 0, 12)
	TextLabel.TextColor3 = Color3.fromRGB(230, 232, 238)
	TextLabel.Text = "HoshiHub"
	TextLabel.TextSize = 18
	TextLabel.Size = UDim2.new(1, -50, 0, 20)
	TextLabel.Parent = Frame3
	local TextLabel2 = Instance.new("TextLabel")
	TextLabel2.TextXAlignment = Enum.TextXAlignment.Left
	TextLabel2.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium)
	TextLabel2.BackgroundTransparency = 1
	TextLabel2.Position = UDim2.new(0, 20, 0, 32)
	TextLabel2.TextColor3 = Color3.fromRGB(148, 150, 158)
	TextLabel2.Text = "key verification"
	TextLabel2.TextSize = 11
	TextLabel2.Size = UDim2.new(1, -50, 0, 14)
	TextLabel2.Parent = Frame3
	local TextButton = Instance.new("TextButton")
	TextButton.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium)
	TextButton.TextColor3 = Color3.fromRGB(90, 92, 100)
	TextButton.Text = "×"
	TextButton.AutoButtonColor = false
	TextButton.AnchorPoint = Vector2.new(1, 0.5)
	TextButton.BackgroundTransparency = 1
	TextButton.Position = UDim2.new(1, -14, 0.5, 0)
	TextButton.TextSize = 20
	TextButton.Size = UDim2.fromOffset(24, 24)
	TextButton.Parent = Frame3
	TextButton.MouseEnter:Connect(function(arg)
		local tween = TweenService:Create(TextButton, TweenInfo.new(0.13, Enum.EasingStyle.Quad), { TextColor3 = Color3.fromRGB(230, 232, 238) })
		tween:Play()
	end)
	TextButton.MouseLeave:Connect(function(arg2)
		local tween2 = TweenService:Create(TextButton, TweenInfo.new(0.13, Enum.EasingStyle.Quad), { TextColor3 = Color3.fromRGB(90, 92, 100) })
		tween2:Play()
	end)
	TextButton.MouseButton1Click:Connect(function()
		ScreenGui2:Destroy()
	end)
	local Frame4 = Instance.new("Frame")
	Frame4.Position = UDim2.fromOffset(0, 52)
	Frame4.BackgroundColor3 = Color3.fromRGB(42, 42, 48)
	Frame4.BorderSizePixel = 0
	Frame4.Size = UDim2.new(1, 0, 0, 1)
	Frame4.Parent = Frame2
	local Frame5 = Instance.new("Frame")
	Frame5.Position = UDim2.new(0, 20, 0, 64)
	Frame5.BackgroundTransparency = 1
	Frame5.Size = UDim2.new(1, -40, 0, 244)
	Frame5.Parent = Frame2
	local TextLabel3 = Instance.new("TextLabel")
	TextLabel3.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold)
	TextLabel3.BackgroundTransparency = 1
	TextLabel3.TextColor3 = Color3.fromRGB(230, 232, 238)
	TextLabel3.TextXAlignment = Enum.TextXAlignment.Left
	TextLabel3.Text = "License Key"
	TextLabel3.TextSize = 13
	TextLabel3.Size = UDim2.new(1, 0, 0, 16)
	TextLabel3.Parent = Frame5
	local Frame6 = Instance.new("Frame")
	Frame6.Position = UDim2.fromOffset(0, 20)
	Frame6.BackgroundColor3 = Color3.fromRGB(19, 19, 22)
	Frame6.BorderSizePixel = 0
	Frame6.Size = UDim2.new(1, 0, 0, 32)
	Frame6.Parent = Frame5
	local UICorner2 = Instance.new("UICorner")
	UICorner2.CornerRadius = UDim.new(0, 6)
	UICorner2.Parent = Frame6
	local UIStroke2 = Instance.new("UIStroke")
	UIStroke2.Color = Color3.fromRGB(90, 92, 100)
	UIStroke2.Thickness = 1
	UIStroke2.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	UIStroke2.Parent = Frame6
	local TextBox = Instance.new("TextBox")
	TextBox.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium)
	TextBox.TextColor3 = Color3.fromRGB(230, 232, 238)
	TextBox.Text = ""
	TextBox.ClearTextOnFocus = false
	TextBox.TextXAlignment = Enum.TextXAlignment.Left
	TextBox.BackgroundTransparency = 1
	TextBox.PlaceholderColor3 = Color3.fromRGB(90, 92, 100)
	TextBox.Position = UDim2.fromOffset(10, 0)
	TextBox.PlaceholderText = "Your key"
	TextBox.TextSize = 13
	TextBox.Size = UDim2.new(1, -20, 1, 0)
	TextBox.Parent = Frame6
	TextBox.Focused:Connect(function(arg3)
		local tween3 = TweenService:Create(UIStroke2, TweenInfo.new(0.13, Enum.EasingStyle.Quad), { Color = Color3.fromRGB(228, 228, 234) })
		tween3:Play()
	end)
	TextBox.FocusLost:Connect(function(enterPressed, inputObject)
		local tween4 = TweenService:Create(UIStroke2, TweenInfo.new(0.13, Enum.EasingStyle.Quad), { Color = Color3.fromRGB(90, 92, 100) })
		tween4:Play()
	end)
	local TextButton2 = Instance.new("TextButton")
	TextButton2.AutoButtonColor = false
	TextButton2.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold)
	TextButton2.BackgroundColor3 = Color3.fromRGB(218, 220, 228)
	TextButton2.Position = UDim2.fromOffset(0, 62)
	TextButton2.TextColor3 = Color3.fromRGB(15, 18, 30)
	TextButton2.Text = "Verify Key"
	TextButton2.TextSize = 13
	TextButton2.Size = UDim2.new(1, 0, 0, 40)
	TextButton2.Parent = Frame5
	local UICorner3 = Instance.new("UICorner")
	UICorner3.CornerRadius = UDim.new(0, 8)
	UICorner3.Parent = TextButton2
	local ImageLabel = Instance.new("ImageLabel")
	ImageLabel.AnchorPoint = Vector2.new(1, 0.5)
	ImageLabel.Image = "rbxassetid://10709791437"
	ImageLabel.BackgroundTransparency = 1
	ImageLabel.Position = UDim2.new(1, -10, 0.5, 0)
	ImageLabel.ZIndex = 3
	ImageLabel.ImageColor3 = Color3.fromRGB(15, 18, 30)
	ImageLabel.Size = UDim2.fromOffset(14, 14)
	ImageLabel.Parent = TextButton2
	TextButton2.MouseEnter:Connect(function(arg4)
		local tween5 = TweenService:Create(TextButton2, TweenInfo.new(0.13, Enum.EasingStyle.Quad), { BackgroundColor3 = Color3.fromRGB(232, 234, 242) })
		tween5:Play()
	end)
	TextButton2.MouseLeave:Connect(function(arg5)
		local tween6 = TweenService:Create(TextButton2, TweenInfo.new(0.13, Enum.EasingStyle.Quad), { BackgroundColor3 = Color3.fromRGB(218, 220, 228) })
		tween6:Play()
	end)
	local TextButton3 = Instance.new("TextButton")
	TextButton3.AutoButtonColor = false
	TextButton3.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold)
	TextButton3.BackgroundColor3 = Color3.fromRGB(38, 40, 50)
	TextButton3.Position = UDim2.fromOffset(0, 108)
	TextButton3.TextColor3 = Color3.fromRGB(230, 232, 238)
	TextButton3.Text = "Get Free Key"
	TextButton3.TextSize = 13
	TextButton3.Size = UDim2.new(1, 0, 0, 40)
	TextButton3.Parent = Frame5
	local UICorner4 = Instance.new("UICorner")
	UICorner4.CornerRadius = UDim.new(0, 8)
	UICorner4.Parent = TextButton3
	local UIStroke3 = Instance.new("UIStroke")
	UIStroke3.Color = Color3.fromRGB(42, 42, 48)
	UIStroke3.Thickness = 1
	UIStroke3.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	UIStroke3.Parent = TextButton3
	local ImageLabel2 = Instance.new("ImageLabel")
	ImageLabel2.AnchorPoint = Vector2.new(1, 0.5)
	ImageLabel2.Image = "rbxassetid://10709791437"
	ImageLabel2.BackgroundTransparency = 1
	ImageLabel2.Position = UDim2.new(1, -10, 0.5, 0)
	ImageLabel2.ZIndex = 3
	ImageLabel2.ImageColor3 = Color3.fromRGB(90, 92, 100)
	ImageLabel2.Size = UDim2.fromOffset(14, 14)
	ImageLabel2.Parent = TextButton3
	TextButton3.MouseEnter:Connect(function(arg6)
		local tween7 = TweenService:Create(TextButton3, TweenInfo.new(0.13, Enum.EasingStyle.Quad), { BackgroundColor3 = Color3.fromRGB(52, 54, 66) })
		tween7:Play()
	end)
	TextButton3.MouseLeave:Connect(function(arg7)
		local tween8 = TweenService:Create(TextButton3, TweenInfo.new(0.13, Enum.EasingStyle.Quad), { BackgroundColor3 = Color3.fromRGB(38, 40, 50) })
		tween8:Play()
	end)
	local TextButton4 = Instance.new("TextButton")
	TextButton4.AutoButtonColor = false
	TextButton4.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold)
	TextButton4.BackgroundColor3 = Color3.fromRGB(38, 40, 50)
	TextButton4.Position = UDim2.fromOffset(0, 154)
	TextButton4.TextColor3 = Color3.fromRGB(230, 232, 238)
	TextButton4.Text = "Join Discord"
	TextButton4.TextSize = 13
	TextButton4.Size = UDim2.new(1, 0, 0, 40)
	TextButton4.Parent = Frame5
	local UICorner5 = Instance.new("UICorner")
	UICorner5.CornerRadius = UDim.new(0, 8)
	UICorner5.Parent = TextButton4
	local UIStroke4 = Instance.new("UIStroke")
	UIStroke4.Color = Color3.fromRGB(42, 42, 48)
	UIStroke4.Thickness = 1
	UIStroke4.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	UIStroke4.Parent = TextButton4
	local ImageLabel3 = Instance.new("ImageLabel")
	ImageLabel3.AnchorPoint = Vector2.new(1, 0.5)
	ImageLabel3.Image = "rbxassetid://10709791437"
	ImageLabel3.BackgroundTransparency = 1
	ImageLabel3.Position = UDim2.new(1, -10, 0.5, 0)
	ImageLabel3.ZIndex = 3
	ImageLabel3.ImageColor3 = Color3.fromRGB(90, 92, 100)
	ImageLabel3.Size = UDim2.fromOffset(14, 14)
	ImageLabel3.Parent = TextButton4
	TextButton4.MouseEnter:Connect(function(arg8)
		local tween9 = TweenService:Create(TextButton4, TweenInfo.new(0.13, Enum.EasingStyle.Quad), { BackgroundColor3 = Color3.fromRGB(52, 54, 66) })
		tween9:Play()
	end)
	TextButton4.MouseLeave:Connect(function(arg9)
		local tween10 = TweenService:Create(TextButton4, TweenInfo.new(0.13, Enum.EasingStyle.Quad), { BackgroundColor3 = Color3.fromRGB(38, 40, 50) })
		tween10:Play()
	end)
	local TextLabel4 = Instance.new("TextLabel")
	TextLabel4.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold)
	TextLabel4.TextColor3 = Color3.fromRGB(148, 150, 158)
	TextLabel4.Text = ""
	TextLabel4.TextWrapped = true
	TextLabel4.BackgroundTransparency = 1
	TextLabel4.Position = UDim2.fromOffset(0, 206)
	TextLabel4.TextXAlignment = Enum.TextXAlignment.Center
	TextLabel4.TextYAlignment = Enum.TextYAlignment.Center
	TextLabel4.TextSize = 14
	TextLabel4.Size = UDim2.new(1, 0, 0, 24)
	TextLabel4.Parent = Frame5
	local Frame7 = Instance.new("Frame")
	Frame7.AnchorPoint = Vector2.new(0, 1)
	Frame7.Position = UDim2.new(0, 0, 1, 0)
	Frame7.BackgroundTransparency = 1
	Frame7.Size = UDim2.new(1, 0, 0, 24)
	Frame7.Parent = Frame2
	local Frame8 = Instance.new("Frame")
	Frame8.BackgroundColor3 = Color3.fromRGB(42, 42, 48)
	Frame8.BorderSizePixel = 0
	Frame8.Size = UDim2.new(1, 0, 0, 1)
	Frame8.Parent = Frame7
	local TextLabel5 = Instance.new("TextLabel")
	TextLabel5.TextXAlignment = Enum.TextXAlignment.Left
	TextLabel5.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium)
	TextLabel5.BackgroundTransparency = 1
	TextLabel5.Position = UDim2.fromOffset(12, 0)
	TextLabel5.TextColor3 = Color3.fromRGB(90, 92, 100)
	TextLabel5.Text = "HoshiHub  ·  loader v1.5.7"
	TextLabel5.TextSize = 10
	TextLabel5.Size = UDim2.new(1, -24, 1, 0)
	TextLabel5.Parent = Frame7
	Frame3.InputBegan:Connect(function(input, gameProcessed)
	end)
	UserInputService.InputChanged:Connect(function(input2, gameProcessed2)
	end)
	UserInputService.InputEnded:Connect(function(input3, gameProcessed3)
	end)
	TextButton2.MouseButton1Click:Connect(function()
		TextLabel4.Text = "Key too short."
		TextLabel4.TextColor3 = Color3.fromRGB(220, 90, 90)
	end)
	TextBox.FocusLost:Connect(function(enterPressed2, inputObject2)
		TextLabel4.Text = "Key too short."
		TextLabel4.TextColor3 = Color3.fromRGB(220, 90, 90)
	end)
	TextButton3.MouseButton1Click:Connect(function()
		local BrowserService = game:GetService("BrowserService")
		BrowserService:OpenBrowserWindow("https://hoshihub.site/get")
		local MessageBusService = game:GetService("MessageBusService")
		local messageId = MessageBusService:GetMessageId("Linking", "openURLRequest")
		MessageBusService:Publish(messageId, { url = "https://hoshihub.site/get" })
		local GuiService = game:GetService("GuiService")
		GuiService:OpenBrowserWindow("https://hoshihub.site/get")
		TextLabel4.Text = "https://hoshihub.site/get"
		TextLabel4.TextColor3 = Color3.fromRGB(80, 200, 120)
	end)
	TextButton4.MouseButton1Click:Connect(function()
		BrowserService:OpenBrowserWindow("https://discord.gg/bxXvuTygSa")
		local messageId2 = MessageBusService:GetMessageId("Linking", "openURLRequest")
		MessageBusService:Publish(messageId2, { url = "https://discord.gg/bxXvuTygSa" })
		GuiService:OpenBrowserWindow("https://discord.gg/bxXvuTygSa")
		TextLabel4.Text = "https://discord.gg/bxXvuTygSa"
		TextLabel4.TextColor3 = Color3.fromRGB(80, 200, 120)
	end)
end)
