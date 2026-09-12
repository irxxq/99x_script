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
