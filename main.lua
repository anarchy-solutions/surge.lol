--[=[
 d888b  db    db d888888b      .d888b.      db      db    db  .d8b.  
88' Y8b 88    88   `88'        VP  `8D      88      88    88 d8' `8b 
88      88    88    88            odD'      88      88    88 88ooo88 
88  ooo 88    88    88          .88'        88      88    88 88~~~88 
88. ~8~ 88b  d88   .88.        j88.         88booo. 88b  d88 88   88    @uniquadev
 Y888P  ~Y8888P' Y888888P      888888D      Y88888P ~Y8888P' YP   YP  CONVERTER 
]=]

-- Instances: 20 | Scripts: 3 | Modules: 0 | Tags: 0
local G2L = {};

-- StarterGui.loader
G2L["1"] = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"));
G2L["1"]["Name"] = [[loader]];
G2L["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;


-- StarterGui.loader.main
G2L["2"] = Instance.new("Frame", G2L["1"]);
G2L["2"]["BorderSizePixel"] = 0;
G2L["2"]["BackgroundColor3"] = Color3.fromRGB(15, 14, 14);
G2L["2"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["2"]["Size"] = UDim2.new(0, 500, 0, 440);
G2L["2"]["Position"] = UDim2.new(0.49994, 0, 0.49933, 0);
G2L["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["2"]["Name"] = [[main]];


-- StarterGui.loader.main.UIStroke
G2L["3"] = Instance.new("UIStroke", G2L["2"]);
G2L["3"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
G2L["3"]["Thickness"] = 1.3;
G2L["3"]["Color"] = Color3.fromRGB(171, 255, 255);


-- StarterGui.loader.main.border1
G2L["4"] = Instance.new("Frame", G2L["2"]);
G2L["4"]["BorderSizePixel"] = 0;
G2L["4"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["4"]["Size"] = UDim2.new(0, 488, 0, 398);
G2L["4"]["Position"] = UDim2.new(0.012, 0, 0.07955, 0);
G2L["4"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["4"]["Name"] = [[border1]];
G2L["4"]["BackgroundTransparency"] = 1;


-- StarterGui.loader.main.border1.UIStroke
G2L["5"] = Instance.new("UIStroke", G2L["4"]);
G2L["5"]["Color"] = Color3.fromRGB(68, 68, 68);


-- StarterGui.loader.main.border1.stroke
G2L["6"] = Instance.new("Frame", G2L["4"]);
G2L["6"]["BorderSizePixel"] = 0;
G2L["6"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["6"]["Size"] = UDim2.new(0, 476, 0, 387);
G2L["6"]["Position"] = UDim2.new(0.0123, 0, 0.01759, 0);
G2L["6"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["6"]["Name"] = [[stroke]];
G2L["6"]["BackgroundTransparency"] = 1;


-- StarterGui.loader.main.border1.stroke.UIStroke
G2L["7"] = Instance.new("UIStroke", G2L["6"]);
G2L["7"]["Color"] = Color3.fromRGB(68, 68, 68);


-- StarterGui.loader.main.border1.stroke.UIStroke.UIGradient
G2L["8"] = Instance.new("UIGradient", G2L["7"]);
G2L["8"]["Rotation"] = 90;
G2L["8"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(14, 13, 13))};


-- StarterGui.loader.main.border1.stroke.updates
G2L["9"] = Instance.new("TextLabel", G2L["6"]);
G2L["9"]["TextWrapped"] = true;
G2L["9"]["TextStrokeTransparency"] = 0;
G2L["9"]["BorderSizePixel"] = 0;
G2L["9"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["9"]["TextYAlignment"] = Enum.TextYAlignment.Top;
G2L["9"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["9"]["TextSize"] = 14;
G2L["9"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["9"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["9"]["BackgroundTransparency"] = 1;
G2L["9"]["RichText"] = true;
G2L["9"]["Size"] = UDim2.new(0, 466, 0, 317);
G2L["9"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["9"]["Text"] = [[                                                           yooooo]];
G2L["9"]["Name"] = [[updates]];
G2L["9"]["Position"] = UDim2.new(0.01471, 0, 0.02842, 0);


-- StarterGui.loader.main.border1.stroke.updates.LocalScript
G2L["a"] = Instance.new("LocalScript", G2L["9"]);



-- StarterGui.loader.main.border1.stroke.updates.UIPadding
G2L["b"] = Instance.new("UIPadding", G2L["9"]);
G2L["b"]["PaddingTop"] = UDim.new(0, 8);
G2L["b"]["PaddingLeft"] = UDim.new(0, 5);


-- StarterGui.loader.main.border1.stroke.bar
G2L["c"] = Instance.new("Frame", G2L["6"]);
G2L["c"]["BorderSizePixel"] = 0;
G2L["c"]["BackgroundColor3"] = Color3.fromRGB(41, 41, 41);
G2L["c"]["Size"] = UDim2.new(0, 317, 0, 13);
G2L["c"]["Position"] = UDim2.new(0.16597, 0, 0.93023, 0);
G2L["c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["c"]["Name"] = [[bar]];


-- StarterGui.loader.main.border1.stroke.bar.completion
G2L["d"] = Instance.new("Frame", G2L["c"]);
G2L["d"]["BorderSizePixel"] = 0;
G2L["d"]["BackgroundColor3"] = Color3.fromRGB(0, 255, 0);
G2L["d"]["Size"] = UDim2.new(0, 0, 0, 13);
G2L["d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["d"]["Name"] = [[completion]];


-- StarterGui.loader.main.border1.stroke.step
G2L["e"] = Instance.new("TextLabel", G2L["6"]);
G2L["e"]["TextWrapped"] = true;
G2L["e"]["TextStrokeTransparency"] = 0;
G2L["e"]["BorderSizePixel"] = 0;
G2L["e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["e"]["TextSize"] = 14;
G2L["e"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["e"]["TextColor3"] = Color3.fromRGB(131, 131, 131);
G2L["e"]["BackgroundTransparency"] = 1;
G2L["e"]["RichText"] = true;
G2L["e"]["Size"] = UDim2.new(0, 317, 0, -24);
G2L["e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["e"]["Text"] = [[Current step...]];
G2L["e"]["Name"] = [[step]];
G2L["e"]["Position"] = UDim2.new(0.16597, 0, 0.90956, 0);


-- StarterGui.loader.main.titleborder
G2L["f"] = Instance.new("Frame", G2L["2"]);
G2L["f"]["BorderSizePixel"] = 0;
G2L["f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["f"]["Size"] = UDim2.new(0, 488, 0, 21);
G2L["f"]["Position"] = UDim2.new(0.012, 0, 0.01818, 0);
G2L["f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["f"]["Name"] = [[titleborder]];
G2L["f"]["BackgroundTransparency"] = 1;


-- StarterGui.loader.main.titleborder.UIStroke
G2L["10"] = Instance.new("UIStroke", G2L["f"]);
G2L["10"]["Color"] = Color3.fromRGB(68, 68, 68);


-- StarterGui.loader.main.titleborder.title
G2L["11"] = Instance.new("TextLabel", G2L["f"]);
G2L["11"]["TextWrapped"] = true;
G2L["11"]["TextStrokeTransparency"] = 0;
G2L["11"]["BorderSizePixel"] = 0;
G2L["11"]["TextStrokeColor3"] = Color3.fromRGB(14, 14, 14);
G2L["11"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["11"]["BackgroundColor3"] = Color3.fromRGB(0, 255, 255);
G2L["11"]["TextSize"] = 13;
G2L["11"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["11"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["11"]["BackgroundTransparency"] = 1;
G2L["11"]["RichText"] = true;
G2L["11"]["Size"] = UDim2.new(0, 460, 0, 14);
G2L["11"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["11"]["Text"] = [[serenium.tech]];
G2L["11"]["Name"] = [[title]];
G2L["11"]["Position"] = UDim2.new(0.0123, 0, 0.04762, 0);


-- StarterGui.loader.main.titleborder.title.UIPadding
G2L["12"] = Instance.new("UIPadding", G2L["11"]);
G2L["12"]["PaddingTop"] = UDim.new(0, 5);


-- StarterGui.loader.main.titleborder.title.LocalScript
G2L["13"] = Instance.new("LocalScript", G2L["11"]);



-- StarterGui.loader.loader func
G2L["14"] = Instance.new("LocalScript", G2L["1"]);
G2L["14"]["Name"] = [[loader func]];


-- StarterGui.loader.main.border1.stroke.updates.LocalScript
local function C_a()
local script = G2L["a"];
	-- Make sure the TextLabel supports RichText
	local label = script.Parent
	label.RichText = true
	
	label.Text = '<font color="rgb(0, 255, 0)">[+]</font> | New game added: "Combat Warriors" [BETA]\n\n<font color="rgb(255, 0, 0)">[-]</font> | Nothing\n\n<font color="rgb(255, 255, 0)">[!]</font> | Fixed ragebot on Phantom Forces (ty exo)\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nLog date: 29/03/2025'
end;
task.spawn(C_a);
-- StarterGui.loader.main.titleborder.title.LocalScript
local function C_13()
local script = G2L["13"];
	script.Parent.RichText = true
	script.Parent.Text = 'serenium.<font color="rgb(170, 255, 255)">tech</font> | PUBLIC BETA'
end;
task.spawn(C_13);
-- StarterGui.loader.loader func
local function C_14()
local script = G2L["14"];
	local bar = script.Parent:WaitForChild("main"):WaitForChild("border1"):WaitForChild("stroke"):WaitForChild("bar"):WaitForChild("completion")
	local stepLabel = script.Parent:WaitForChild("main"):WaitForChild("border1"):WaitForChild("stroke"):WaitForChild("step")
	local steps = {"Verifying version..", "Checking game...", "Bypassing A-C...", "Verifying User..."}
	local stepIndex = 1
	local tweenService = game:GetService("TweenService")
	
	local function advanceBar(duration)
		local goal = {Size = UDim2.new(0, 317 * (stepIndex / #steps), 0, 13)}
		local tween = game:GetService("TweenService"):Create(bar, TweenInfo.new(duration), goal)
		tween:Play()
	end
	
	local function induceFreeze(seconds)
		local startTime = os.clock()
		while os.clock() - startTime < seconds do
			print("LOADED")
		end
	end
	
	local function completeStep()
		stepLabel.Text = "Done!"
		stepLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
		wait(3)  -- Wait for the "Done" text to be displayed for 3 seconds
		induceFreeze(1.4)  -- Freeze the game for 3 seconds
		script.Parent.main.Visible = false
		task.wait()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/anarchy-solutions/surge.lol/refs/heads/main/loader-hvh-rage.lua"))
		task.wait(3)
		warn("[ERROR HANDLER] Synatx error on line: 3871:21")
	
	
	end
	
	local function updateStep()
		stepLabel.Text = steps[stepIndex]
	
		local duration
		if stepIndex == 1 then
			duration = math.random(2, 35) / 10  -- Random between 2 and 3.5 seconds for "Verifying version"
		else
			duration = math.random(3, 7) -- Random between 3 and 7 seconds for other steps
		end
	
		advanceBar(duration)
	
		if stepIndex == #steps then
			wait(duration)
			completeStep()
		else
			wait(duration)
			stepIndex += 1
			updateStep()
		end
	end
	
	updateStep()
end;
task.spawn(C_14);

return G2L["1"], require;
