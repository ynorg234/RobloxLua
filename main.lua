function tweenpos(x,y,z)
     local serv = game:GetService("TweenService")
     local root = game.Players.LocalPlayer.Character.HumanoidRootPart
     local info = TweenInfo.new(
         1,
         Enum.EasingStyle.Quad,
         Enum.EasingDirection.Out,
         0,
         false,
         0
     )
     local tween = serv:Create(root, info, {
         CFrame = CFrame.new(x, y, z)
     })
     tween:Play()
end
function getPlr(Name)
		 if Name:lower() == "random" then
			 return game.Players:GetPlayers()[math.random(#game.Players:GetPlayers())]
		 else
			 Name = Name:lower():gsub("%s", "")
			 for _, x in next, game.Players:GetPlayers() do
				 if x.Name:lower():match(Name) then
					 return x
				 elseif x.DisplayName:lower():match("^" .. Name) then
					 return x
				 end
			 end
		 end
	 end
function tweento(plr)
    local otherplr = getPlr(plr)
    tweenpos(otherplr.Character.HumanoidRootPart.Position.X, otherplr.Character.HumanoidRootPart.Position.Y, otherplr.Character.HumanoidRootPart.Position.Z)
end
--[=[
 d888b  db    db d888888b      .d888b.      db      db    db  .d8b.  
88' Y8b 88    88   `88'        VP  `8D      88      88    88 d8' `8b 
88      88    88    88            odD'      88      88    88 88ooo88 
88  ooo 88    88    88          .88'        88      88    88 88~~~88 
88. ~8~ 88b  d88   .88.        j88.         88booo. 88b  d88 88   88    @uniquadev
 Y888P  ~Y8888P' Y888888P      888888D      Y88888P ~Y8888P' YP   YP  CONVERTER 
]=]

-- Instances: 5 | Scripts: 0 | Modules: 0
local G2L = {};

-- StarterGui.ScreenGui
G2L["1"] = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"));
G2L["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;

-- StarterGui.ScreenGui.Frame
G2L["2"] = Instance.new("Frame", G2L["1"]);
G2L["2"]["BorderSizePixel"] = 0;
G2L["2"]["BackgroundColor3"] = Color3.fromRGB(132, 132, 132);
G2L["2"]["Size"] = UDim2.new(0, 263, 0, 119);
G2L["2"]["Position"] = UDim2.new(0.36227, 0, 0.33657, 0);
G2L["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);

-- StarterGui.ScreenGui.Frame.TextLabel
G2L["3"] = Instance.new("TextLabel", G2L["2"]);
G2L["3"]["BorderSizePixel"] = 0;
G2L["3"]["BackgroundColor3"] = Color3.fromRGB(132, 132, 132);
G2L["3"]["TextSize"] = 30;
G2L["3"]["FontFace"] = Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["3"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["3"]["Size"] = UDim2.new(0, 200, 0, 50);
G2L["3"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["3"]["Text"] = [[FE Player TP]];
G2L["3"]["Position"] = UDim2.new(0.11787, 0, 0, 0);

-- StarterGui.ScreenGui.Frame.TextButton
G2L["4"] = Instance.new("TextButton", G2L["2"]);
G2L["4"]["BorderSizePixel"] = 0;
G2L["4"]["TextSize"] = 14;
G2L["4"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["4"]["BackgroundColor3"] = Color3.fromRGB(124, 124, 124);
G2L["4"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["4"]["Size"] = UDim2.new(0, 200, 0, 23);
G2L["4"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["4"]["Text"] = [[Go!]];
G2L["4"]["Position"] = UDim2.new(0.11597, 0, 0.80418, 0);

-- StarterGui.ScreenGui.Frame.TextBox
G2L["5"] = Instance.new("TextBox", G2L["2"]);
G2L["5"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["5"]["BorderSizePixel"] = 0;
G2L["5"]["TextSize"] = 14;
G2L["5"]["BackgroundColor3"] = Color3.fromRGB(124, 124, 124);
G2L["5"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["5"]["Size"] = UDim2.new(0, 200, 0, 21);
G2L["5"]["Position"] = UDim2.new(0.11787, 0, 0.47899, 0);
G2L["5"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["5"]["Text"] = [[]];

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
local DRAG_SPEED = (15);
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
    local plr = game.Players.LocalPlayer.PlayerGui.ScreenGui.Frame.TextBox.Text
    tweento(plr)
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
