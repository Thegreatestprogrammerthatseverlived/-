local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local localplayer = Players.LocalPlayer
local playerGui = localplayer:WaitForChild("PlayerGui")

local character = localplayer.Character or localplayer.CharacterAdded:Wait()
local localhrp = character:WaitForChild("HumanoidRootPart")
local camera = workspace.CurrentCamera

local aimbotEnabled = false

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "AimbotSettingsGui"
screenGui.ResetOnSpawn = false
screenGui.IgnoreGuiInset = true
screenGui.Parent = playerGui

local openButton = Instance.new("TextButton")
openButton.Name = "OpenButton"
openButton.Size = UDim2.fromOffset(110, 38)
openButton.Position = UDim2.new(0, 20, 0.5, -19)
openButton.BackgroundColor3 = Color3.fromRGB(32, 35, 43)
openButton.Text = "Settings"
openButton.TextColor3 = Color3.fromRGB(240, 240, 245)
openButton.TextSize = 15
openButton.Font = Enum.Font.GothamMedium
openButton.AutoButtonColor = false
openButton.Parent = screenGui

local openCorner = Instance.new("UICorner")
openCorner.CornerRadius = UDim.new(0, 10)
openCorner.Parent = openButton

local openStroke = Instance.new("UIStroke")
openStroke.Color = Color3.fromRGB(65, 69, 82)
openStroke.Thickness = 1
openStroke.Parent = openButton

local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
mainFrame.Size = UDim2.fromOffset(430, 260)
mainFrame.Position = UDim2.fromScale(0.5, 0.5)
mainFrame.BackgroundColor3 = Color3.fromRGB(22, 24, 30)
mainFrame.Visible = false
mainFrame.Parent = screenGui

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 14)
mainCorner.Parent = mainFrame

local mainStroke = Instance.new("UIStroke")
mainStroke.Color = Color3.fromRGB(54, 58, 70)
mainStroke.Thickness = 1
mainStroke.Parent = mainFrame

local topBar = Instance.new("Frame")
topBar.Name = "TopBar"
topBar.Size = UDim2.new(1, 0, 0, 65)
topBar.BackgroundTransparency = 1
topBar.Parent = mainFrame

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -100, 0, 28)
title.Position = UDim2.fromOffset(22, 13)
title.BackgroundTransparency = 1
title.Text = "Aimbot Settings"
title.TextColor3 = Color3.fromRGB(245, 245, 250)
title.TextSize = 20
title.Font = Enum.Font.GothamBold
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = topBar

local subtitle = Instance.new("TextLabel")
subtitle.Size = UDim2.new(1, -100, 0, 18)
subtitle.Position = UDim2.fromOffset(22, 39)
subtitle.BackgroundTransparency = 1
subtitle.Text = "Toggle your aimbot."
subtitle.TextColor3 = Color3.fromRGB(145, 149, 165)
subtitle.TextSize = 12
subtitle.Font = Enum.Font.Gotham
subtitle.TextXAlignment = Enum.TextXAlignment.Left
subtitle.Parent = topBar

local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.fromOffset(34, 34)
closeButton.Position = UDim2.new(1, -49, 0, 15)
closeButton.BackgroundColor3 = Color3.fromRGB(36, 39, 48)
closeButton.Text = "×"
closeButton.TextColor3 = Color3.fromRGB(190, 194, 205)
closeButton.TextSize = 24
closeButton.Font = Enum.Font.GothamMedium
closeButton.AutoButtonColor = false
closeButton.Parent = topBar

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 9)
closeCorner.Parent = closeButton

local divider = Instance.new("Frame")
divider.Size = UDim2.new(1, -40, 0, 1)
divider.Position = UDim2.fromOffset(20, 66)
divider.BackgroundColor3 = Color3.fromRGB(48, 51, 62)
divider.BorderSizePixel = 0
divider.Parent = mainFrame

local settingCard = Instance.new("Frame")
settingCard.Size = UDim2.new(1, -40, 0, 92)
settingCard.Position = UDim2.fromOffset(20, 88)
settingCard.BackgroundColor3 = Color3.fromRGB(29, 32, 39)
settingCard.Parent = mainFrame

local cardCorner = Instance.new("UICorner")
cardCorner.CornerRadius = UDim.new(0, 11)
cardCorner.Parent = settingCard

local cardStroke = Instance.new("UIStroke")
cardStroke.Color = Color3.fromRGB(47, 51, 62)
cardStroke.Thickness = 1
cardStroke.Parent = settingCard

local settingTitle = Instance.new("TextLabel")
settingTitle.Size = UDim2.new(1, -110, 0, 24)
settingTitle.Position = UDim2.fromOffset(18, 18)
settingTitle.BackgroundTransparency = 1
settingTitle.Text = "Aimbot"
settingTitle.TextColor3 = Color3.fromRGB(235, 237, 243)
settingTitle.TextSize = 16
settingTitle.Font = Enum.Font.Gotham
settingTitle.TextXAlignment = Enum.TextXAlignment.Left
settingTitle.Parent = settingCard

local settingDescription = Instance.new("TextLabel")
settingDescription.Size = UDim2.new(1, -110, 0, 20)
settingDescription.Position = UDim2.fromOffset(18, 47)
settingDescription.BackgroundTransparency = 1
settingDescription.Text = "Automatically aims at nearby targets."
settingDescription.TextColor3 = Color3.fromRGB(137, 141, 156)
settingDescription.TextSize = 12
settingDescription.Font = Enum.Font.Gotham
settingDescription.TextXAlignment = Enum.TextXAlignment.Left
settingDescription.Parent = settingCard

local toggleButton = Instance.new("TextButton")
toggleButton.Name = "AimbotToggle"
toggleButton.AnchorPoint = Vector2.new(1, 0.5)
toggleButton.Size = UDim2.fromOffset(58, 30)
toggleButton.Position = UDim2.new(1, -18, 0.5, 0)
toggleButton.BackgroundColor3 = Color3.fromRGB(63, 67, 78)
toggleButton.Text = ""
toggleButton.AutoButtonColor = false
toggleButton.Parent = settingCard

local toggleCorner = Instance.new("UICorner")
toggleCorner.CornerRadius = UDim.new(1, 0)
toggleCorner.Parent = toggleButton

local toggleCircle = Instance.new("Frame")
toggleCircle.Name = "Circle"
toggleCircle.AnchorPoint = Vector2.new(0, 0.5)
toggleCircle.Size = UDim2.fromOffset(24, 24)
toggleCircle.Position = UDim2.new(0, 3, 0.5, 0)
toggleCircle.BackgroundColor3 = Color3.fromRGB(230, 232, 238)
toggleCircle.Parent = toggleButton

local circleCorner = Instance.new("UICorner")
circleCorner.CornerRadius = UDim.new(1, 0)
circleCorner.Parent = toggleCircle

local statusLabel = Instance.new("TextLabel")
statusLabel.Size = UDim2.new(1, -40, 0, 30)
statusLabel.Position = UDim2.fromOffset(20, 196)
statusLabel.BackgroundTransparency = 1
statusLabel.Text = "Aimbot: OFF"
statusLabel.TextColor3 = Color3.fromRGB(145, 149, 165)
statusLabel.TextSize = 13
statusLabel.Font = Enum.Font.GothamMedium
statusLabel.TextXAlignment = Enum.TextXAlignment.Left
statusLabel.Parent = mainFrame

local function updateToggle()
	local backgroundColor
	local circlePosition
	local statusColor
	local statusText

	if aimbotEnabled then
		backgroundColor = Color3.fromRGB(78, 134, 255)
		circlePosition = UDim2.new(1, -27, 0.5, 0)
		statusColor = Color3.fromRGB(104, 158, 255)
		statusText = "Aimbot: ON"
	else
		backgroundColor = Color3.fromRGB(63, 67, 78)
		circlePosition = UDim2.new(0, 3, 0.5, 0)
		statusColor = Color3.fromRGB(145, 149, 165)
		statusText = "Aimbot: OFF"
	end

	TweenService:Create(
		toggleButton,
		TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
		{
			BackgroundColor3 = backgroundColor,
		}
	):Play()

	TweenService:Create(
		toggleCircle,
		TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
		{
			Position = circlePosition,
		}
	):Play()

	statusLabel.Text = statusText
	statusLabel.TextColor3 = statusColor
end

local function setMenuVisible(visible)
	if visible then
		mainFrame.Visible = true
		mainFrame.Size = UDim2.fromOffset(390, 225)
		mainFrame.BackgroundTransparency = 1

		TweenService:Create(
			mainFrame,
			TweenInfo.new(
				0.22,
				Enum.EasingStyle.Back,
				Enum.EasingDirection.Out
			),
			{
				Size = UDim2.fromOffset(430, 260),
				BackgroundTransparency = 0,
			}
		):Play()
	else
		local closeTween = TweenService:Create(
			mainFrame,
			TweenInfo.new(
				0.16,
				Enum.EasingStyle.Quad,
				Enum.EasingDirection.In
			),
			{
				Size = UDim2.fromOffset(400, 235),
				BackgroundTransparency = 1,
			}
		)

		closeTween:Play()

		closeTween.Completed:Once(function()
			mainFrame.Visible = false
		end)
	end
end

local function aimbotHandler()
	local targetPos = nil
	local closestUser = nil
	local closestDist = math.huge
	
	for _, player in game.Players:GetPlayers() do
		if player == localplayer then continue end
		
		local userHRP = player.Character.HumanoidRootPart or player.Character:FindFirstChild("HumanoidRootPart")
		local userDistance = (localhrp.Position - userHRP.Position).Magnitude
		
		if userDistance < closestDist then
			closestDist = userDistance
			closestUser = player
		else continue end
	end
	
	if closestUser == nil then return end
	
	targetPos = closestUser.Character.HumanoidRootPart.Position

	local direction = (targetPos - camera.CFrame.Position).Unit

	camera.CFrame = CFrame.lookAt(camera.CFrame.Position, camera.CFrame.Position + direction)
end

toggleButton.MouseButton1Click:Connect(function()
	aimbotEnabled = not aimbotEnabled

	updateToggle()

	game:GetService("RunService").Heartbeat:Connect(function()
		if aimbotEnabled then
			aimbotHandler()
		end
	end)
end)

openButton.MouseButton1Click:Connect(function()
	setMenuVisible(not mainFrame.Visible)
end)

closeButton.MouseButton1Click:Connect(function()
	setMenuVisible(false)
end)

openButton.MouseEnter:Connect(function()
	TweenService:Create(
		openButton,
		TweenInfo.new(0.15),
		{
			BackgroundColor3 = Color3.fromRGB(42, 46, 56),
		}
	):Play()
end)

openButton.MouseLeave:Connect(function()
	TweenService:Create(
		openButton,
		TweenInfo.new(0.15),
		{
			BackgroundColor3 = Color3.fromRGB(32, 35, 43),
		}
	):Play()
end)

closeButton.MouseEnter:Connect(function()
	TweenService:Create(
		closeButton,
		TweenInfo.new(0.15),
		{
			BackgroundColor3 = Color3.fromRGB(180, 65, 72),
			TextColor3 = Color3.fromRGB(255, 255, 255),
		}
	):Play()
end)

closeButton.MouseLeave:Connect(function()
	TweenService:Create(
		closeButton,
		TweenInfo.new(0.15),
		{
			BackgroundColor3 = Color3.fromRGB(36, 39, 48),
			TextColor3 = Color3.fromRGB(190, 194, 205),
		}
	):Play()
end)

updateToggle()
setMenuVisible(true)
