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

-- StarterGui.ScreenGui.Frame.LocalScript
G2L["3"] = Instance.new("LocalScript", G2L["2"]);


-- StarterGui.ScreenGui.Frame.TextButton
G2L["4"] = Instance.new("TextButton", G2L["2"]);
G2L["4"]["BorderSizePixel"] = 0;
G2L["4"]["TextSize"] = 14;
G2L["4"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["4"]["BackgroundColor3"] = Color3.fromRGB(124, 124, 124);
G2L["4"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["4"]["Size"] = UDim2.new(0, 158, 0, 24);
G2L["4"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["4"]["Text"] = [[Go!]];
G2L["4"]["Position"] = UDim2.new(0.1821, 0, 0.78797, 0);

-- StarterGui.ScreenGui.Frame.TextButton.LocalScript
G2L["5"] = Instance.new("LocalScript", G2L["4"]);


-- StarterGui.ScreenGui.Frame.TextLabel
G2L["6"] = Instance.new("TextLabel", G2L["2"]);
G2L["6"]["BorderSizePixel"] = 0;
G2L["6"]["BackgroundColor3"] = Color3.fromRGB(132, 132, 132);
G2L["6"]["TextSize"] = 30;
G2L["6"]["FontFace"] = Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["6"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["6"]["Size"] = UDim2.new(0, 200, 0, 50);
G2L["6"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["6"]["Text"] = [[FE Player TP]];
G2L["6"]["Position"] = UDim2.new(0.09815, 0, -0.00379, 0);

-- StarterGui.ScreenGui.Frame.TextBox
G2L["7"] = Instance.new("TextBox", G2L["2"]);
G2L["7"]["SelectionStart"] = 1;
G2L["7"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["7"]["BorderSizePixel"] = 0;
G2L["7"]["TextSize"] = 14;
G2L["7"]["BackgroundColor3"] = Color3.fromRGB(124, 124, 124);
G2L["7"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["7"]["Size"] = UDim2.new(0, 194, 0, 32);
G2L["7"]["Position"] = UDim2.new(0.12048, 0, 0.42241, 0);
G2L["7"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["7"]["Text"] = [[Enter Username here!]];

-- StarterGui.ScreenGui.Frame.LocalScript
local function C_3()
local script = G2L["3"];
	local UserInputService = game:GetService("UserInputService")
	
	local gui = script.Parent
	
	local dragging
	local dragInput
	local dragStart
	local startPos
	
	local function update(input)
		local delta = input.Position - dragStart
		gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end
	
	gui.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = gui.Position
	
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
	
	UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			update(input)
		end
	end)
end;
task.spawn(C_3);
-- StarterGui.ScreenGui.Frame.TextButton.LocalScript
local function C_5()
local script = G2L["5"];
	local player = game.Players.LocalPlayer.PlayerGui.ScreenGui.Frame.TextBox.Text
	tweento(player)
	
end;
task.spawn(C_5);

return G2L["1"], require;
