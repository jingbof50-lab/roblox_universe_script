local Players = game:GetService("Players")
local PlayerGui = Players.LocalPlayer:WaitForChild("PlayerGui")
--創造容器
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "UI_O"
screenGui.Parent = PlayerGui   
screenGui.ResetOnSpawn = false
--變量
local Type = "A"
local Type_yOffset = 0 
local Type_buttonGap = 5
local Function_yOffset = 0 
local Function_buttonGap = 5
--顏色
local Buttoncolor = Color3.fromRGB(146, 146, 146)
local ScrollingFramecolor = Color3.fromRGB(121, 121, 121)
local backgroundcolor = Color3.fromRGB(66, 66, 66)
local Textcolor  = Color3.fromRGB(0, 0, 0)
local TextSize = 10
--背景
local background_Frame = Instance.new("Frame")
background_Frame.Parent = screenGui
background_Frame .Name = "background_Frame"
background_Frame.Position = UDim2.new(0.178, 0, 0.112, 0)
background_Frame.Size = UDim2.new(0, 459, 0, 231)
background_Frame.BackgroundColor3 = backgroundcolor 
background_Frame.BackgroundTransparency = 0.2

local background_UICorner = Instance.new("UICorner")
background_UICorner.Parent = background_Frame
background_UICorner.CornerRadius = UDim.new(0, 15)
--分類區域
local type_ScrollingFrame = Instance.new("ScrollingFrame")
type_ScrollingFrame.Parent = background_Frame
type_ScrollingFrame.Name = "type_ScrollingFrame"
type_ScrollingFrame.Position = UDim2.new(0.018, 0, 0.034, 0)
type_ScrollingFrame.Size = UDim2.new(0, 101, 0, 214)
type_ScrollingFrame.BackgroundColor3 = ScrollingFramecolor
type_ScrollingFrame.BackgroundTransparency = 0.5
type_ScrollingFrame.ScrollBarThickness = 0
type_ScrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y

local type_UICorner = Instance.new("UICorner")
type_UICorner.Parent = type_ScrollingFrame
type_UICorner.CornerRadius = UDim.new(0, 15)
--功能區域
local Function_ScrollingFrame = Instance.new("ScrollingFrame")
Function_ScrollingFrame.Parent = background_Frame
Function_ScrollingFrame.Name = "Function_ScrollingFrame"
Function_ScrollingFrame.Position = UDim2.new(0.258, 0, 0.03, 0)
Function_ScrollingFrame.Size = UDim2.new(0, 332, 0, 214)
Function_ScrollingFrame.BackgroundColor3 = ScrollingFramecolor
Function_ScrollingFrame.BackgroundTransparency = 0.5
Function_ScrollingFrame.ScrollBarThickness = 0
Function_ScrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y

local Function_UICorner = Instance.new("UICorner")
Function_UICorner.Parent = Function_ScrollingFrame
Function_UICorner.CornerRadius = UDim.new(0, 15)
--清理功能
local function Clearfunction()
	local Players = game:GetService("Players")
	local localPlayer = Players.LocalPlayer
	local playerGui = localPlayer:WaitForChild("PlayerGui")
	local uiO = playerGui:WaitForChild("UI_O")
	local backgroundFrame = uiO:WaitForChild("background_Frame")
	local functionScrollingFrame = backgroundFrame:WaitForChild("Function_ScrollingFrame")
	for _, child in ipairs(functionScrollingFrame:GetChildren()) do
		child:Destroy()
	end
	local Function_UICorner = Instance.new("UICorner")
	Function_UICorner.Parent = Function_ScrollingFrame
	Function_UICorner.CornerRadius = UDim.new(0, 15)
	Function_yOffset = 0 
end
--分類按鈕
local function typeButton(Name,text,script)

	local TextButton = Instance.new("TextButton")
	TextButton.Parent = type_ScrollingFrame
	TextButton.Name = Name
	TextButton.Position = UDim2.new(0, 0, 0, Type_yOffset)
	TextButton.Size = UDim2.new(0, 101, 0, 50)
	TextButton.BackgroundColor3 = Buttoncolor
	TextButton.BackgroundTransparency = 0.5
	TextButton.Text = text
	TextButton.TextSize = TextSize
	TextButton.TextColor3 = Textcolor

	local UICorner = Instance.new("UICorner")
	UICorner.Parent = TextButton
	UICorner.CornerRadius = UDim.new(0, 15)
	Type_yOffset = Type_yOffset + TextButton.Size.Y.Offset + Type_buttonGap

	TextButton.MouseButton1Click:Connect(function()
		Type = text
		script()
		--TextButton.Text = Type
	end)

end
--功能按鈕
local function FunctionButton(Name,text,script)

	local TextButton = Instance.new("TextButton")
	TextButton.Parent = Function_ScrollingFrame
	TextButton.Name = Name
	TextButton.Position = UDim2.new(0, 0, 0, Function_yOffset)
	TextButton.Size = UDim2.new(0, 331, 0, 50)
	TextButton.BackgroundColor3 = Buttoncolor
	TextButton.BackgroundTransparency = 0.5
	TextButton.Text = text
	TextButton.TextSize = TextSize
	TextButton.TextColor3 = Textcolor

	local UICorner = Instance.new("UICorner")
	UICorner.Parent = TextButton
	UICorner.CornerRadius = UDim.new(0, 15)

	Function_yOffset = Function_yOffset+ TextButton.Size.Y.Offset + Function_buttonGap 

	TextButton.MouseButton1Click:Connect(function()
		script()
	end)

end
--功能輸入
local function Functionenter(Name,text,script)

	local TextBox = Instance.new("TextBox")
	TextBox.Parent = Function_ScrollingFrame
	TextBox.Name = Name
	TextBox.Position = UDim2.new(0, 0, 0, Function_yOffset)
	TextBox.Size = UDim2.new(0, 331, 0, 50)
	TextBox.BackgroundColor3 = Buttoncolor
	TextBox.BackgroundTransparency = 0.5
	TextBox.Text = text
	TextBox.TextSize = TextSize
	TextBox.TextColor3 = Textcolor

	local UICorner = Instance.new("UICorner")
	UICorner.Parent = TextBox
	UICorner.CornerRadius = UDim.new(0, 15)

	Function_yOffset = Function_yOffset + TextBox.TextBounds.Y + Function_buttonGap + 35

	TextBox:GetPropertyChangedSignal("Text"):Connect(function()
		script(TextBox.Text)
	end)
end
--功能開關
local function FunctionSwitch(Name,text,script)

	local TextButton = Instance.new("TextButton")
	TextButton.Parent = Function_ScrollingFrame
	TextButton.Name = Name
	TextButton.Position = UDim2.new(0, 0, 0, Function_yOffset)
	TextButton.Size = UDim2.new(0, 331, 0, 50)
	TextButton.BackgroundColor3 = Buttoncolor
	TextButton.BackgroundTransparency = 0.5
	TextButton.Text = text
	TextButton.TextSize = TextSize
	TextButton.TextColor3 = Textcolor


	local SwitchFrame = Instance.new("Frame")
	SwitchFrame.Parent = TextButton
	SwitchFrame.Name = "or"
	SwitchFrame.Position = UDim2.new(0.865, 0, 0.5, -19.5) 
	SwitchFrame.Size = UDim2.new(0, 39, 0, 39)
	SwitchFrame.BackgroundColor3 = backgroundcolor
	local yesorno = false

	local btnCorner = Instance.new("UICorner")
	btnCorner.Parent = TextButton
	btnCorner.CornerRadius = UDim.new(0, 15)

	local frameCorner = Instance.new("UICorner")
	frameCorner.Parent = SwitchFrame
	frameCorner.CornerRadius = UDim.new(1, 0) 

	TextButton.MouseButton1Click:Connect(function()
		yesorno = not yesorno
		SwitchFrame.BackgroundColor3 = yesorno and Textcolor or backgroundcolor
		if script then

		end
		script(yesorno) 
	end)

	Function_yOffset = TextButton.Size.Y.Offset + Function_buttonGap + 110
end
--隱藏顯示
local UserInputService = game:GetService("UserInputService")
UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
	if gameProcessedEvent then return end
	if input.KeyCode == Enum.KeyCode.F then
		background_Frame.Visible = false
	end
end)
UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
	if gameProcessedEvent then return end
	if input.KeyCode == Enum.KeyCode.G then
		background_Frame.Visible = true
	end
end)

--获取本地玩家
local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer
local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
--變量
local run = humanoid.WalkSpeed
local Jump = humanoid.JumpHeight
local hipheight = humanoid.HipHeight
local locking_run = false
local locking_Jump = false

typeButton("首頁","首頁",function()
	Clearfunction()
	FunctionButton("作者","快手號:4708518336")
end)
typeButton("角色","角色",function()
	Clearfunction()
	FunctionButton("重置人物","重置人物",function()
		humanoid.Health = 0
	end)
	Functionenter("移動速度修改","移動速度"..run,function(txt)
		run = txt
	end)
	FunctionButton("確定修改移動速度","確定修改移動速度",function()
		--获取本地玩家
		local Players = game:GetService("Players")
		local localPlayer = Players.LocalPlayer
		local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
		local humanoid = character:WaitForChild("Humanoid")
		--修改
		humanoid.WalkSpeed = run
	end)
	FunctionSwitch("鎖定移動速度","鎖定移動速度",function(yesorno)
		locking_run = yesorno
	end)
	Function_yOffset = Function_yOffset + 55
	Functionenter("跳高度修改","跳高度"..Jump,function(txt)
		Jump = txt
	end)
	FunctionButton("確定跳高度修改","確定跳高度修改",function()
		--获取本地玩家
		local Players = game:GetService("Players")
		local localPlayer = Players.LocalPlayer
		local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
		local humanoid = character:WaitForChild("Humanoid")
		--修改
		humanoid.JumpHeight = Jump
	end)
	FunctionSwitch("鎖定跳高度","鎖定跳高度",function(yesorno)
		locking_Jump = yesorno
	end)
	Function_yOffset = Function_yOffset + 165 +55
	Functionenter("身體高度修改","身體高度"..hipheight,function(txt)
		hipheight = txt
	end)
	FunctionButton("確定身體高度修改","確定身體高度修改",function()
		--获取本地玩家
		local Players = game:GetService("Players")
		local localPlayer = Players.LocalPlayer
		local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
		local humanoid = character:WaitForChild("Humanoid")
		--修改
		humanoid.HipHeight = hipheight
	end)
	FunctionButton("站","站",function()
		humanoid.Sit = false
		humanoid.PlatformStand = false
	end)
	FunctionButton("坐下","坐下",function()
		humanoid.Sit = true
	end)
	FunctionButton("倒下","倒下",function()
		humanoid.PlatformStand = true
	end)
end)
typeButton("功能","功能",function()
	Clearfunction()
	FunctionButton("飛行","飛行",function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/jingbof50-lab/roblox_universe_script/refs/heads/main/script_flight"))()
	end)
	FunctionButton("飛行(超人動畫)","飛行(超人動畫)",function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/jingbof50-lab/roblox_universe_script/main/script_superman_flight"))()
	end)
	FunctionButton("甩飛腳本(肘擊)","甩飛腳本(肘擊)",function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/jingbof50-lab/roblox_universe_script/main/script_throw_away"))()
	end)
end)
typeButton("武器獲得","武器獲得",function()
	Clearfunction()
	FunctionButton("傳送工具","傳送工具",function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/jingbof50-lab/roblox_universe_script/main/scrript_click-to-deliver"))()
	end)
	FunctionButton("破壞之錘(可以破壞地圖的方塊)","破壞之錘(可以破壞地圖的方塊)",function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/jingbof50-lab/roblox_universe_script/main/script_hammer_destruction"))()
	end)
	FunctionButton("火箭筒","火箭筒",function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/jingbof50-lab/roblox_universe_script/main/script_bazooka"))()
	end)
	FunctionButton("F3X(方塊修改)","F3X(方塊修改)",function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/jingbof50-lab/roblox_universe_script/refs/heads/main/script_F3X"))()
	end)
end)
typeButton("擴展菜單","擴展菜單",function()
	Clearfunction()
	FunctionButton("dex(修改器)","dex(修改器)",function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/jingbof50-lab/roblox_universe_script/main/script_dex"))()
	end)
	FunctionButton("動作跳舞菜單(R15)","動作跳舞菜單(R15)",function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/jingbof50-lab/roblox_universe_script/main/script_action_menu"))()
	end)
	FunctionButton("透視菜單","透視菜單",function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/jingbof50-lab/roblox_universe_script/main/script_EFP"))()
	end)
	FunctionButton("物體控制菜單","物體控制菜單",function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/jingbof50-lab/roblox_universe_script/main/script_controlled_items"))()
	end)
	FunctionButton("地圖貼圖修改","地圖貼圖修改",function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/jingbof50-lab/roblox_universe_script/main/script_map_change"))()
	end)
end)
typeButton("最強戰場","最強戰場",function()
	Clearfunction()
	FunctionButton("特效","特效",function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/IdkRandomUsernameok/PublicAssets/refs/heads/main/Releases/MUI.lua"))()
	end)
	FunctionButton("五条悟(最強英雄)","五条悟(最強英雄)",function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/jingbof50-lab/roblox_universe_script/main/script_gojo_satoru_all.lua"))()
	end)
	FunctionButton("五条悟2(最強英雄)","五条悟2(最強英雄)",function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/jingbof50-lab/roblox_universe_script/refs/heads/main/script_gojo_satoru_2.lua",true))()
	end)
	FunctionButton("火車頭(英雄獵人)","火車頭(英雄獵人)",function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/jingbof50-lab/roblox_universe_script/main/script_the_flash_all.lua"))()
	end)
end)
typeButton("偷走一顆腦紅","偷走一顆腦紅",function()
	Clearfunction()
	FunctionButton("菜單(修改)","菜單(修改)",function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/jingbof50-lab/roblox_universe_script/main/script_Property_modification_menu"))() 
	end)
end)

while true do
	wait(0.01)
	if locking_run == true then
		--获取本地玩家
		local Players = game:GetService("Players")
		local localPlayer = Players.LocalPlayer
		local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
		local humanoid = character:WaitForChild("Humanoid")
		--修改
		humanoid.WalkSpeed = run
	end
	if locking_Jump == true then
		--获取本地玩家
		local Players = game:GetService("Players")
		local localPlayer = Players.LocalPlayer
		local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
		local humanoid = character:WaitForChild("Humanoid")
		--修改
		humanoid.JumpHeight = Jump
	end
end

