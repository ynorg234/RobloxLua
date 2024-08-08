
local G2L = {};

-- StarterGui.ScreenGui
G2L["1"] = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"));
G2L["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;

-- StarterGui.ScreenGui.Frame
G2L["2"] = Instance.new("Frame", G2L["1"]);
G2L["2"]["BorderSizePixel"] = 0;
G2L["2"]["BackgroundColor3"] = Color3.fromRGB(132, 132, 132);
G2L["2"]["Size"] = UDim2.new(0, 282, 0, 132);
G2L["2"]["Position"] = UDim2.new(0.36226, 0, 0.42059, 0);
G2L["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);

-- StarterGui.ScreenGui.Frame.TextLabel
G2L["3"] = Instance.new("TextLabel", G2L["2"]);
G2L["3"]["BorderSizePixel"] = 0;
G2L["3"]["BackgroundColor3"] = Color3.fromRGB(132, 132, 132);
G2L["3"]["TextSize"] = 30;
G2L["3"]["FontFace"] = Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["3"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["3"]["Size"] = UDim2.new(0, 208, 0, 50);
G2L["3"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["3"]["Text"] = [[FE Hitbox Expander]];
G2L["3"]["Position"] = UDim2.new(0.14539, 0, 0, 0);

-- StarterGui.ScreenGui.Frame.TextButton
G2L["4"] = Instance.new("TextButton", G2L["2"]);
G2L["4"]["BorderSizePixel"] = 0;
G2L["4"]["TextSize"] = 25;
G2L["4"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["4"]["BackgroundColor3"] = Color3.fromRGB(156, 201, 0);
G2L["4"]["FontFace"] = Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["4"]["Size"] = UDim2.new(0, 200, 0, 36);
G2L["4"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["4"]["Text"] = [[Enable]];
G2L["4"]["Position"] = UDim2.new(0.14539, 0, 0.68182, 0);

-- StarterGui.ScreenGui.Frame.TextBox
G2L["5"] = Instance.new("TextBox", G2L["2"]);
G2L["5"]["CursorPosition"] = -1;
G2L["5"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["5"]["BorderSizePixel"] = 0;
G2L["5"]["TextSize"] = 14;
G2L["5"]["BackgroundColor3"] = Color3.fromRGB(124, 124, 124);
G2L["5"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["5"]["Size"] = UDim2.new(0, 200, 0, 28);
G2L["5"]["Position"] = UDim2.new(0.14539, 0, 0.39394, 0);
G2L["5"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["5"]["Text"] = [[Enter size here...]];

-- Main Script
_G.HeadSize = 50
 _G.OldSize = game.Players.LocalPlayer.Character.HumanoidRootPart.Size.X
_G.Enabled = false
function enable()
		for i,v in next, game:GetService('Players'):GetPlayers() do
    if v.Name ~= game:GetService('Players').LocalPlayer.Name then
        pcall(function()
        v.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize)
        v.Character.HumanoidRootPart.Transparency = 0.7
        v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really blue")
        v.Character.HumanoidRootPart.Material = "Neon"
        v.Character.HumanoidRootPart.CanCollide = false   
    end)
    end
end
end
function disable()
	pcall(function()
	    for i,v in next, game:GetService("Players"):GetPlayers() do
		    if v.Name ~= game.Players.LocalPlayer.Name then	
		            v.Character.HumanoidRootPart.Size = Vector3.new(_G.OldSize,_G.OldSize,_G.OldSize)
		            v.Character.HumanoidRootPart.Transparency = 1
				end
			end
        end)
end
-- smooth gui drag
local UserInputService = game:GetService("UserInputService")
local runService = (game:GetService("RunService"));

local gui = game.Players.LocalPlayer.PlayerGui.ScreenGui.Frame

local dragging
local dragInput
local dragStart
local startPos

function Lerp(a, b, m)
	return a + (b - a) * m
end;

local lastMousePos
local lastGoalPos
local DRAG_SPEED = (8); -- // ballz.
function Update(dt)
	if not (startPos) then return end;
	if not (dragging) and (lastGoalPos) then
		gui.Position = UDim2.new(startPos.X.Scale, Lerp(gui.Position.X.Offset, lastGoalPos.X.Offset, dt * DRAG_SPEED), startPos.Y.Scale, Lerp(gui.Position.Y.Offset, lastGoalPos.Y.Offset, dt * DRAG_SPEED))
		return 
	end;

	local delta = (lastMousePos - UserInputService:GetMouseLocation())
	local xGoal = (startPos.X.Offset - delta.X);
	local yGoal = (startPos.Y.Offset - delta.Y);
	lastGoalPos = UDim2.new(startPos.X.Scale, xGoal, startPos.Y.Scale, yGoal)
	gui.Position = UDim2.new(startPos.X.Scale, Lerp(gui.Position.X.Offset, xGoal, dt * DRAG_SPEED), startPos.Y.Scale, Lerp(gui.Position.Y.Offset, yGoal, dt * DRAG_SPEED))
end;

gui.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startPos = gui.Position
		lastMousePos = UserInputService:GetMouseLocation()

		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

gui.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
		dragInput = input
	end
end)

runService.Heartbeat:Connect(Update)

local button = game.Players.LocalPlayer.PlayerGui.ScreenGui.Frame.TextButton
button.MouseButton1Click:Connect(function() 
    if _G.Enabled == false then
        button.Text = "Disable"
        button.BackgroundColor3 = Color3.fromRGB(237, 38, 0)
        _G.Enabled = true
        _G.HeadSize = game.Players.LocalPlayer.PlayerGui.ScreenGui.Frame.TextBox.Text
	enable()
        return nil
    end
    if _G.Enabled == true then
        button.Text = "Enable"
        button.BackgroundColor3 = Color3.fromRGB(156, 201, 0)
        _G.Enabled = false
        _G.HeadSize = game.Players.LocalPlayer.PlayerGui.ScreenGui.Frame.TextBox.Text
	disable()
        return nil
    end
    end)
game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "How to remove GUI",
	Text = "Reset character"
})
wait(0.1)
game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "Made by ynorg234 on Github",
	Text = "if any other person calls this theirs they are skidding"
})
return G2L["1"], require;
