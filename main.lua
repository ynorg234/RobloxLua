function tweenpos(x,y,z)
     local serv = game:GetService("TweenService")
     local root = game.Players.LocalPlayer.Character.HumanoidRootPart
     local info = TweenInfo.new(
         0.5,
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
    tweenpos(otherplr.LocalPlayer.Character.HumanoidRootPart.X+3, otherplr.LocalPlayer.Character.HumanoidRootPart.Y+1, otherplr.LocalPlayer.Character.HumanoidRootPart.Z)
end
--[=[
 d888b  db    db d888888b      .d888b.      db      db    db  .d8b.  
88' Y8b 88    88   `88'        VP  `8D      88      88    88 d8' `8b 
88      88    88    88            odD'      88      88    88 88ooo88 
88  ooo 88    88    88          .88'        88      88    88 88~~~88 
88. ~8~ 88b  d88   .88.        j88.         88booo. 88b  d88 88   88    @uniquadev
 Y888P  ~Y8888P' Y888888P      888888D      Y88888P ~Y8888P' YP   YP  CONVERTER 
]=]

-- Instances: 7 | Scripts: 2 | Modules: 0
local G2L = {};

-- StarterGui.ScreenGui
G2L["1"] = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"));
G2L["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;

-- StarterGui.ScreenGui.Frame
G2L["2"] = Instance.new("Frame", G2L["1"]);
G2L["2"]["BorderSizePixel"] = 0;
G2L["2"]["BackgroundColor3"] = Color3.fromRGB(132, 132, 132);
G2L["2"]["Size"] = UDim2.new(0, 249, 0, 116);
G2L["2"]["Position"] = UDim2.new(0.34727, 0, 0.37702, 0);
G2L["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);

-- StarterGui.ScreenGui.Frame.TextButton
G2L["3"] = Instance.new("TextButton", G2L["2"]);
G2L["3"]["BorderSizePixel"] = 0;
G2L["3"]["TextSize"] = 14;
G2L["3"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["3"]["BackgroundColor3"] = Color3.fromRGB(124, 124, 124);
G2L["3"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["3"]["Size"] = UDim2.new(0, 158, 0, 24);
G2L["3"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["3"]["Text"] = [[Go!]];
G2L["3"]["Position"] = UDim2.new(0.1821, 0, 0.78797, 0);

-- StarterGui.ScreenGui.Frame.TextLabel
G2L["4"] = Instance.new("TextLabel", G2L["2"]);
G2L["4"]["BorderSizePixel"] = 0;
G2L["4"]["BackgroundColor3"] = Color3.fromRGB(132, 132, 132);
G2L["4"]["TextSize"] = 30;
G2L["4"]["FontFace"] = Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["4"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["4"]["Size"] = UDim2.new(0, 200, 0, 50);
G2L["4"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["4"]["Text"] = [[FE Player TP]];
G2L["4"]["Position"] = UDim2.new(0.09815, 0, -0.00379, 0);

-- StarterGui.ScreenGui.Frame.TextBox
G2L["5"] = Instance.new("TextBox", G2L["2"]);
G2L["5"]["SelectionStart"] = 1;
G2L["5"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["5"]["BorderSizePixel"] = 0;
G2L["5"]["TextSize"] = 14;
G2L["5"]["BackgroundColor3"] = Color3.fromRGB(124, 124, 124);
G2L["5"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["5"]["Size"] = UDim2.new(0, 194, 0, 32);
G2L["5"]["Position"] = UDim2.new(0.12048, 0, 0.42241, 0);
G2L["5"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["5"]["Text"] = [[Enter Username here!]];
return G2L["1"], require;

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
local DRAG_SPEED = (8); -- // The speed of the UI darg.
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
		local text = game.Players.LocalPlayer.PlayerGui.ScreenGui.Frame.TextBox.Text
		tweento(text)
	end)
