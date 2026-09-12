--========================================================--
--                    99x_DEV V3                          --
--          KURDISTAN 99X • MOBILE • CLEAN               --
--========================================================--

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

--========================================================--
-- CONFIG
--========================================================--

local OWNER = "TheRealRoger160"
local ADMIN = "XxkikoxX_99x"

local LOGO_ID = "rbxassetid://85020917727787"

local BLUE = Color3.fromRGB(0,170,255)
local RED = Color3.fromRGB(220,45,55)
local YELLOW = Color3.fromRGB(225,165,25)
local PURPLE = Color3.fromRGB(135,75,220)

local DARK = Color3.fromRGB(7,8,12)
local PANEL = Color3.fromRGB(14,15,21)
local BUTTON = Color3.fromRGB(25,27,36)

--========================================================--
-- REMOVE OLD
--========================================================--

local Old = PlayerGui:FindFirstChild("99x_Dev")

if Old then
	Old:Destroy()
end

--========================================================--
-- GUI
--========================================================--

local GUI = Instance.new("ScreenGui")
GUI.Name = "99x_Dev"
GUI.ResetOnSpawn = false
GUI.IgnoreGuiInset = true
GUI.Parent = PlayerGui

local Main = Instance.new("Frame")
Main.Name = "Main"
Main.Size = UDim2.fromOffset(370,500)
Main.Position = UDim2.new(0.5,-185,0.5,-250)
Main.BackgroundColor3 = DARK
Main.BorderSizePixel = 0
Main.Parent = GUI

local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0,20)
Corner.Parent = Main

local Stroke = Instance.new("UIStroke")
Stroke.Color = BLUE
Stroke.Thickness = 2
Stroke.Parent = Main

--========================================================--
-- HEADER
--========================================================--

local Header = Instance.new("Frame")
Header.Size = UDim2.new(1,0,0,65)
Header.BackgroundColor3 = PANEL
Header.BorderSizePixel = 0
Header.Parent = Main

local HeaderCorner = Instance.new("UICorner")
HeaderCorner.CornerRadius = UDim.new(0,20)
HeaderCorner.Parent = Header

local Logo = Instance.new("ImageLabel")
Logo.Size = UDim2.fromOffset(48,48)
Logo.Position = UDim2.fromOffset(10,8)
Logo.BackgroundTransparency = 1
Logo.Image = LOGO_ID
Logo.Parent = Header

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1,-115,1,0)
Title.Position = UDim2.fromOffset(68,0)
Title.BackgroundTransparency = 1
Title.Text = "99x_Dev"
Title.TextColor3 = BLUE
Title.TextSize = 24
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = Header

local Close = Instance.new("TextButton")
Close.Size = UDim2.fromOffset(40,40)
Close.Position = UDim2.new(1,-50,0,12)
Close.BackgroundColor3 = RED
Close.Text = "×"
Close.TextColor3 = Color3.new(1,1,1)
Close.TextSize = 27
Close.Font = Enum.Font.GothamBold
Close.Parent = Header

Instance.new("UICorner",Close).CornerRadius = UDim.new(0,12)

Close.MouseButton1Click:Connect(function()
	Main.Visible = false
end)

--========================================================--
-- DRAG
--========================================================--

local Dragging = false
local DragStart
local StartPos

Header.InputBegan:Connect(function(Input)

	if Input.UserInputType == Enum.UserInputType.MouseButton1
	or Input.UserInputType == Enum.UserInputType.Touch then

		Dragging = true
		DragStart = Input.Position
		StartPos = Main.Position
	end

end)

Header.InputEnded:Connect(function(Input)

	if Input.UserInputType == Enum.UserInputType.MouseButton1
	or Input.UserInputType == Enum.UserInputType.Touch then

		Dragging = false
	end

end)

UIS.InputChanged:Connect(function(Input)

	if not Dragging then
		return
	end

	if Input.UserInputType == Enum.UserInputType.MouseMovement
	or Input.UserInputType == Enum.UserInputType.Touch then

		local Delta = Input.Position - DragStart

		Main.Position = UDim2.new(
			StartPos.X.Scale,
			StartPos.X.Offset + Delta.X,
			StartPos.Y.Scale,
			StartPos.Y.Offset + Delta.Y
		)

	end

end)

--========================================================--
-- CONTENT
--========================================================--

local Content = Instance.new("Frame")
Content.Size = UDim2.new(1,-24,1,-78)
Content.Position = UDim2.fromOffset(12,70)
Content.BackgroundTransparency = 1
Content.Parent = Main

local function Clear()

	for _,Object in ipairs(Content:GetChildren()) do
		Object:Destroy()
	end

end

local function PageTitle(Name,Description)

	local TitleLabel = Instance.new("TextLabel")
	TitleLabel.Size = UDim2.new(1,0,0,35)
	TitleLabel.BackgroundTransparency = 1
	TitleLabel.Text = Name
	TitleLabel.TextColor3 = Color3.new(1,1,1)
	TitleLabel.TextSize = 23
	TitleLabel.Font = Enum.Font.GothamBold
	TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
	TitleLabel.Parent = Content

	local Desc = Instance.new("TextLabel")
	Desc.Size = UDim2.new(1,0,0,20)
	Desc.Position = UDim2.fromOffset(0,35)
	Desc.BackgroundTransparency = 1
	Desc.Text = Description or ""
	Desc.TextColor3 = Color3.fromRGB(145,150,165)
	Desc.TextSize = 12
	Desc.Font = Enum.Font.Gotham
	Desc.TextXAlignment = Enum.TextXAlignment.Left
	Desc.Parent = Content

end

local function Button(Text,Y,Color,Callback)

	local B = Instance.new("TextButton")

	B.Size = UDim2.new(1,0,0,43)
	B.Position = UDim2.fromOffset(0,Y)
	B.BackgroundColor3 = Color or BUTTON
	B.BorderSizePixel = 0

	B.Text = Text
	B.TextColor3 = Color3.new(1,1,1)
	B.TextSize = 15
	B.Font = Enum.Font.GothamBold

	B.Parent = Content

	Instance.new("UICorner",B).CornerRadius = UDim.new(0,12)

	B.MouseButton1Click:Connect(function()

		if Callback then
			Callback()
		end

	end)

end

--========================================================--
-- VARIABLES
--========================================================--

local Speed = 16
local Jump = 50

local Invisible = false
local GodMode = false

local Home
local KurdishObby
local Cheat
local AdminCheat
local Rank
local Support

--========================================================--
-- CHARACTER
--========================================================--

local function GetCharacter()

	local Character = Player.Character or Player.CharacterAdded:Wait()

	local Humanoid =
		Character:FindFirstChildOfClass("Humanoid")

	return Character,Humanoid

end

local function ApplyMovement()

	local _,Humanoid = GetCharacter()

	if Humanoid then

		Humanoid.WalkSpeed = Speed

		Humanoid.UseJumpPower = true

		Humanoid.JumpPower = Jump

	end

end

--========================================================--
-- INVISIBLE
--========================================================--

local function SetInvisible(State)

	Invisible = State

	local Character = Player.Character

	if not Character then
		return
	end

	for _,Object in ipairs(Character:GetDescendants()) do

		if Object:IsA("BasePart") then

			Object.LocalTransparencyModifier =
				State and 1 or 0

		end

	end

end

--========================================================--
-- GOD MODE
--========================================================--

local GodConnection

local function SetGodMode(State)

	GodMode = State

	if GodConnection then

		GodConnection:Disconnect()

		GodConnection = nil

	end

	if State then

		GodConnection =
			RunService.Heartbeat:Connect(function()

				local Character =
					Player.Character

				local Humanoid =
					Character
					and Character:FindFirstChildOfClass("Humanoid")

				if Humanoid and Humanoid.Health > 0 then

					Humanoid.Health =
						Humanoid.MaxHealth

				end

			end)

	end

end

--========================================================--
-- HOME
--========================================================--

Home = function()

	Clear()

	PageTitle(
		"🏠 Home",
		"Welcome to 99x Team"
	)

	Button(
		"🏴 Kurdish Obby",
		70,
		Color3.fromRGB(35,35,47),
		KurdishObby
	)

	Button(
		"🔴 Cheat",
		122,
		RED,
		Cheat
	)

	Button(
		"🟡 Admin Cheat",
		174,
		YELLOW,
		AdminCheat
	)

	Button(
		"👑 Rank",
		226,
		PURPLE,
		Rank
	)

	Button(
		"💬 Support / Social Media",
		278,
		Color3.fromRGB(25,105,150),
		Support
	)

end

--========================================================--
-- KURDISH OBBY
--========================================================--

KurdishObby = function()

	Clear()

	PageTitle(
		"🏴 Kurdish Obby",
		"99x Kurdish Obby"
	)

	Button(
		"← Back",
		70,
		Color3.fromRGB(45,47,58),
		Home
	)

	Button(
		"🛡️ Anti AFK",
		122,
		Color3.fromRGB(25,105,165),
		function()
		end
	)

	Button(
		"⚡ VR7",
		174,
		Color3.fromRGB(35,75,150),
		function()
		end
	)

	Button(
		"🔵 KurdHub",
		226,
		Color3.fromRGB(25,120,170),
		function()
		end
	)

	Button(
		Invisible
		and "👻 Invisible : ON"
		or "👻 Invisible : OFF",
		278,
		PURPLE,
		function()

			SetInvisible(not Invisible)

			KurdishObby()

		end
	)

	Button(
		"😎 Gaze Emote",
		330,
		Color3.fromRGB(105,60,160),
		function()

			local _,Humanoid =
				GetCharacter()

			if Humanoid then

				pcall(function()
					Humanoid:PlayEmote("wave")
				end)

			end

		end
	)

	Button(
		"💃 Bang V2",
		382,
		Color3.fromRGB(150,50,105),
		function()

			local _,Humanoid =
				GetCharacter()

			if Humanoid then

				pcall(function()
					Humanoid:PlayEmote("dance")
				end)

			end

		end
	)

end

--========================================================--
-- CHEAT
--========================================================--

Cheat = function()

	Clear()

	PageTitle(
		"🔴 Cheat",
		"Character controls"
	)

	Button(
		"← Back",
		70,
		Color3.fromRGB(45,47,58),
		Home
	)

	Button(
		GodMode
		and "❤️ God Mode : ON"
		or "❤️ God Mode : OFF",
		122,
		RED,
		function()

			SetGodMode(not GodMode)

			Cheat()

		end
	)

	Button(
		Invisible
		and "👻 Invisible : ON"
		or "👻 Invisible : OFF",
		174,
		PURPLE,
		function()

			SetInvisible(not Invisible)

			Cheat()

		end
	)

	Button(
		"🏃 Speed : "..Speed,
		235,
		Color3.fromRGB(35,75,120),
		function()

			Speed =
				Speed >= 60
				and 1
				or Speed + 5

			ApplyMovement()

			Cheat()

		end
	)

	Button(
		"🦘 Jump : "..Jump,
		288,
		Color3.fromRGB(35,75,120),
		function()

			Jump =
				Jump >= 70
				and 1
				or Jump + 5

			ApplyMovement()

			Cheat()

		end
	)

	Button(
		"🔄 Reset Movement",
		341,
		Color3.fromRGB(45,75,100),
		function()

			Speed = 16
			Jump = 50

			ApplyMovement()

			Cheat()

		end
	)

end

--========================================================--
-- ADMIN CHEAT
--========================================================--

AdminCheat = function()

	Clear()

	PageTitle(
		"🟡 Admin Cheat",
		"Owner / Admin controls"
	)

	Button(
		"← Back",
		70,
		Color3.fromRGB(45,47,58),
		Home
	)

	if Player.Name ~= OWNER
	and Player.Name ~= ADMIN then

		Button(
			"🔒 ADMIN ONLY",
			125,
			Color3.fromRGB(125,30,40)
		)

		return

	end

	Button(
		"⚡ Speed : "..Speed,
		130,
		Color3.fromRGB(120,75,30),
		function()

			Speed =
				Speed >= 150
				and 1
				or Speed + 10

			ApplyMovement()

			AdminCheat()

		end
	)

	Button(
		GodMode
		and "❤️ God Mode : ON"
		or "❤️ God Mode : OFF",
		183,
		RED,
		function()

			SetGodMode(not GodMode)

			AdminCheat()

		end
	)

	Button(
		Invisible
		and "👻 Invisible : ON"
		or "👻 Invisible : OFF",
		236,
		PURPLE,
		function()

			SetInvisible(not Invisible)

			AdminCheat()

		end
	)

	Button(
		"❄️ Castle Snow",
		289,
		Color3.fromRGB(50,90,135),
		function()
		end
	)

	Button(
		"🔄 Reset",
		342,
		Color3.fromRGB(50,52,62),
		function()

			Speed = 16
			Jump = 50

			ApplyMovement()

			AdminCheat()

		end
	)

end

--========================================================--
-- RANK
--========================================================--

Rank = function()

	Clear()

	PageTitle(
		"👑 Rank",
		"99x Team"
	)

	Button(
		"← Back",
		70,
		Color3.fromRGB(45,47,58),
		Home
	)

	Button(
		"👑 Owner • Xx99x_LokiXx",
		125,
		YELLOW
	)

	Button(
		"⭐ Admin • SarOk_99x",
		178,
		Color3.fromRGB(120,75,30)
	)

	if Player.Name == OWNER then

		Button(
			"🔐 Open Admin",
			231,
			Color3.fromRGB(145,80,30),
			AdminCheat
		)

	end

end

--========================================================--
-- SUPPORT
--========================================================--

Support = function()

	Clear()

	PageTitle(
		"💬 Support",
		"Contact the 99x Team"
	)

	Button(
		"← Back",
		70,
		Color3.fromRGB(45,47,58),
		Home
	)

	local Box = Instance.new("TextBox")

	Box.Size = UDim2.new(1,0,0,110)

	Box.Position =
		UDim2.fromOffset(0,125)

	Box.BackgroundColor3 =
		Color3.fromRGB(18,19,26)

	Box.TextColor3 =
		Color3.new(1,1,1)

	Box.PlaceholderText =
		"Write your message..."

	Box.TextSize = 15

	Box.Font =
		Enum.Font.Gotham

	Box.MultiLine = true

	Box.ClearTextOnFocus = false

	Box.TextWrapped = true

	Box.Parent = Content

	Instance.new("UICorner",Box)
		.CornerRadius =
		UDim.new(0,13)

	Button(
		"📨 Send",
		250,
		Color3.fromRGB(20,115,160),
		function()

			Box.Text = ""

		end
	)

end

--========================================================--
-- MINI BUTTON
--========================================================--

local Mini = Instance.new("TextButton")

Mini.Size =
	UDim2.fromOffset(58,58)

Mini.Position =
	UDim2.new(0,15,0.5,0)

Mini.BackgroundColor3 =
	DARK

Mini.Text = "❄️"

Mini.TextSize = 28

Mini.TextColor3 =
	Color3.new(1,1,1)

Mini.Parent = GUI

Instance.new("UICorner",Mini)
	.CornerRadius =
	UDim.new(1,0)

local MiniStroke =
	Instance.new("UIStroke")

MiniStroke.Color = BLUE
MiniStroke.Thickness = 2
MiniStroke.Parent = Mini

Mini.MouseButton1Click:Connect(function()

	Main.Visible =
		not Main.Visible

end)

--========================================================--
-- CHARACTER RESPAWN
--========================================================--

Player.CharacterAdded:Connect(function()

	task.wait(0.5)

	ApplyMovement()

	if Invisible then
		SetInvisible(true)
	end

end)

--========================================================--
-- START
--========================================================--

Home()
