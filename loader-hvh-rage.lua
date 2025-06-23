--!nocheck

if not LPH_OBFUSCATED then    
    LPH_JIT_MAX        = function(...) return ... end
    LPH_NO_UPVALUES    = function(...) return ... end 
    LPH_NO_VIRTUALIZE  = function(...) return ... end 
    LPH_CRASH          = function(...) return ... end 
end

local request = syn and syn.request or http and http.request or http_request or fluxus and fluxus.request or request
local setthreadidentity = setthreadidentity or set_thread_identity or setthreadcontext or setidentity
local getthreadidentity = getthreadidentity or get_thread_identity or getthreadcontext or getidentity
local hookfunction = hookfunction or hookfunc

do 
    get = function(URL)
        return request({Url=URL,Method="GET"}).Body
    end
end

local Data = Data
if not Data then
    Data = {
        InviteToDiscord = false,
        Intro = true,
        KillSayStuff = {
            Normal = {
                "bro, respawn faster, I need more %XP% XP",
                "can someone hvh me?? im guessing nobody can 🤣",
                "你的WiFi是土豆吗, %Died%?",
                "你打游戏好像老奶奶一样",
                "atleast u died to kona, %Died%",
                "你是NPC吗, %Died%?",
                "你的技能和样老",
                "fix ur aim %Died%",
                "damn is 😂",
                "听说你用Internet Explorer在玩游戏",
                "お前の反応はカタツムリより遅いぞ",
                "你在玩手机上吗, %Died%?",
                "你刚才是睡着了吗?",
                "🤖 你是一台机器人吗, %Died%?",
                "Internet says ‘how to dodge in Combat Warriors’",
                "turn off 'get beaten by skids' in cw settings",
                "左, 右, 晚安 :skull:",
                "お前はもう死んでいる",
                "ты был удалён с сервера",
                "איפה הכבוד שלך, %Died%?",
                "あなたはゲームをやめるべきです",
                "your kd is negative btw %Died%",
                "你的存活率比0%还低",
                "parrying 💔💔",
                "Internet says 'how to recover from public humiliation'",

                "get this script at /V4Z7Y58pja!",
                "join /SCFH9cDYWV for dragon slayer",
                "ds accounts drop at /V4Z7Y58pja!",
                "want a chance of getting a free ds account go to /V4Z7Y58pja!",
                "tired of cheaters? become one yourself and combat them! /V4Z7Y58pja!",
                
                "kona best private script"
            },
            Assist = {
                "你没死于我, 是死于团队合作",
                "split my %XP% XP and %Credits% credits with a random, ty for the donation %Died%",
                "お前は味方にやられた",
                "ты просто статистика",
                "你被团队协作打败了",
                "didnt need an assist to kill u %Died%",
                "谁帮我补刀的? 这次算你赚到",
                "yo %Died%, we both know I didn't need the assist",
            },
            Finish = {
                "你的账号已被暂停, %Died%",
                "bro got sent to the shadow realm by a %Weapon%",
                "%Died%, should’ve dodged, oh wait… too late 💀",
                "yo %Died%, your Roblox career ended faster than a limited item stock",
                "Ты уничтожен",
                "ur name should be ‘free kill’, %Died%",
                "%Died% died so fast that Roblox lagged 💀",
                "お前の敗北は確定していた",
                "お前の人生はチェックメイト",
                "fatality.",
                "bro went out like a YouTube tutorial dummy",
                "bro got cooked, fried, and served",
                "bro’s internet provider officially disowned him",
                "Mustache Man once said: 'The greatest defeat comes when one refuses to accept their fate.'",
                "Napoleon once declared: 'The war is won in the mind before the battlefield.'",
                "Sun Tzu once wrote: 'The battlefield is not just a place, it is a state of mind.'",
                "Genghis Khan once proclaimed: 'A warrior’s life ends when they fail to adapt to the changing tides.'",
                "Einstein once said: 'In the end, only the smart survive.'",
            },
            Glory = {
                "你的死亡动画很美, %Died%",
                "someone clip that dawg, %Died% just got packed",
                "%Died%, wanna see my recoil script? (it's called skill)",
                "yo %Died%, ur gameplay lookin like a speedrun to the death screen",
                "bro's last words: ‘I got this’ 💀",
                "удар был смертельным",
                "ur name should be ‘free kill’, %Died%",
                "%Died% died so fast that Roblox lagged 💀",
                "お前の存在が消えた",
                "я сохранил этот момент",
                "bro thought he was the protagonist, I made sure he wasn't",
                "Google says ‘how to recover from a humiliation kill’",
                "%Died%, that was a fatality, not a kill",
                "bro got deleted so hard, he's gonna respawn in another server",
                "I'm screenshotting this kill for my collection %Died%",
                "你只是我今天的另一个XP点数 ",
                "お前は何だったの？",
                "left right goodnight :skull:",
                "clip that, I need it for my mixtape",
                "bro got an express ticket to spectate mode",
                "100% uninstall speedrun, new record %Died%",
                "bro thought he had a chance, but the script said no",
                "Mustache Man once said: 'Victory is a sweet taste for those who dare to fight without hesitation.'",
                "Sun Tzu once wrote: 'The only true defeat is one suffered without a fight.'",
                "Einstein once said: 'It’s not about how fast you run, but how you use your momentum.'",
                "Genghis Khan once declared: 'A battle is not won by strength alone, but by will and intellect.'",
                "Napoleon said: 'The best way to predict the future is to make it.'",
            }
        }
    }
end

local Changelogs = [[!!NOTICE!!
Our script doesn't have a key BTW!
Also join our discord at .gg/SCFH9cDYWV pls!
%NEWBULLET%
New things:
No Ghost Potion Effect
UI Themes
Case Opener (GOLD GOLD GOLD)
Keybind List
Regain Network On Anticheat
%NEWBULLET%
Fixes:
Ragebot works with guns now
Lowered Maximum speed to 40 to avoid kick
Invis-fling doesn't shake your camera now
%NEWBULLET%
Minor things:
Kill Aura Play Animation now syncs
Alt + Key To Attempt Kill instead of Ctrl
Bigger Hitboxes]]

game:GetService("ScriptContext"):SetTimeout(5)

--// VARIABLES (from old script) dont mind this shitty ahh habit from my old
local ReGui = loadstring(get('https://raw.githubusercontent.com/depthso/Dear-ReGui/refs/heads/main/ReGui.lua'))()
local EffectHolder = game:GetObjects("rbxassetid://17192721766")[1]
local Prefabs = game:GetObjects("rbxassetid://"..ReGui.PrefabsId)[1]

local executor = identifyexecutor and identifyexecutor() or "No Name"

if Data.InviteToDiscord then
    pcall(function()
        request({
            Url = "http://127.0.0.1:6463/rpc?v=1",
            Method = "POST",
            Headers = {["Content-Type"] = "application/json", ["Origin"] = "https://discord.com"},
            Body = game:GetService("HttpService"):JSONEncode({
                cmd = "INVITE_BROWSER",
                args = {
                    code = "SCFH9cDYWV"
                },
                nonce = game:GetService("HttpService"):GenerateGUID(false)
            })
        })
    end)
end

if executor == "Xeno" or executor == "Solara" or executor == "Zorara" or executor == "Velocity" then
    return game.Players.LocalPlayer:Kick("You are using "..executor..", which isn't supported due to lack of functions.\nConsider using something like Cryptic or Altantis instead.\n(Not an advertisement just saying.)")
end

local KeyframeSequenceProvider = cloneref(game:GetService("KeyframeSequenceProvider"))
local PathfindingService   = cloneref(game:GetService("PathfindingService"))
local CollectionService    = cloneref(game:GetService("CollectionService"))
local ReplicatedStorage   = cloneref(game:GetService("ReplicatedStorage"))
local UserInputService    = cloneref(game:GetService("UserInputService"))
local TextChatService     = cloneref(game:GetService("TextChatService"))
local TeleportService    = cloneref(game:GetService("TeleportService"))
local TweenService        = cloneref(game:GetService("TweenService"))
local HttpService         = cloneref(game:GetService("HttpService"))
local RunService          = cloneref(game:GetService("RunService"))
local Workspace           = cloneref(game:GetService("Workspace"))
local Lighting            = cloneref(game:GetService("Lighting"))
local Players             = cloneref(game:GetService("Players"))
local CoreGui             = cloneref(game:GetService("CoreGui"))
local Debris              = cloneref(game:GetService("Debris")) 

local LocalPlayer = Players.LocalPlayer
local Camera              = Workspace.CurrentCamera
local Mouse               = LocalPlayer:GetMouse()

local Debug = false
local OnTp = false
local GrenadeNear = false
local ClaimingAirdrop = false
local KADebounce = false

local PlayerCharacters = Workspace:FindFirstChild("PlayerCharacters")
local EffectsJunk = Workspace:FindFirstChild("EffectsJunk")
local Map  = Workspace:FindFirstChild("Map")

local Colors = {}
local Classes = {}
local Labels = {}
local Objects = {}
local WireFrameDraw = {}
local ParryingCharacters = {}

local CurrentBlocksNumber = 0

local LockedTarget

local R6BodyParts = {
    "Head",
    "Torso",
    "Left Arm",
    "Right Arm",
    "Left Leg",
    "Right Leg"
}

local PlayerDrawings = {}
local UtilityDrawings = {}
local ESPSettings = {
    Line = {
        Thickness = 1,
        Color = Color3.fromRGB(0, 255, 0)
    },
    Text = {
        Size = 13,
        Center = true,
        Outline = true,
        Font = Drawing.Fonts.Plex,
        Color = Color3.fromRGB(255, 255, 255)
    },
    Square = {
        Thickness = 1,
        Color = Colors.ESP or Color3.new(1,1,1),
        Filled = false
    },
    Triangle = {
        Color = Color3.fromRGB(255, 255, 255),
        Filled = true,
        Visible = false,
        Thickness = 1
    }
}

local AimbotHighlight = Instance.new("Highlight", workspace.Terrain)
local RagebotHighlight = Instance.new("Highlight", workspace.Terrain)
local SilentAimHighlight = Instance.new("Highlight", workspace.Terrain)

AimbotHighlight.FillColor = Color3.new(1, 1, 1)
RagebotHighlight.FillColor = Color3.new(1, 1, 1)
SilentAimHighlight.FillColor = Color3.new(1, 1, 1)

--// TELEPORTS N THING (from old script)
local Skyboxes = {
    ["None"] = {},
    ["Nebula"] = {
        SkyboxLf = "rbxassetid://159454286",
        SkyboxBk = "rbxassetid://159454299",
        SkyboxDn = "rbxassetid://159454296",
        SkyboxFt = "rbxassetid://159454293",
        SkyboxRt = "rbxassetid://159454300",
        SkyboxUp = "rbxassetid://159454288",
    },
    ["Vaporwave"] = {
        SkyboxLf = "rbxassetid://1417494402",
        SkyboxBk = "rbxassetid://1417494030",
        SkyboxDn = "rbxassetid://1417494146",
        SkyboxFt = "rbxassetid://1417494253",
        SkyboxRt = "rbxassetid://1417494499",
        SkyboxUp = "rbxassetid://1417494643",
    },
    ["Clouds"] = {
        SkyboxLf = "rbxassetid://570557620",
        SkyboxBk = "rbxassetid://570557514",
        SkyboxDn = "rbxassetid://570557775",
        SkyboxFt = "rbxassetid://570557559",
        SkyboxRt = "rbxassetid://570557672",
        SkyboxUp = "rbxassetid://570557727",
    },
    ["Twilight"] = {
        SkyboxLf = "rbxassetid://264909758",
        SkyboxBk = "rbxassetid://264908339",
        SkyboxDn = "rbxassetid://264907909",
        SkyboxFt = "rbxassetid://264909420",
        SkyboxRt = "rbxassetid://264908886",
        SkyboxUp = "rbxassetid://264907379",
    },
}

local SoundTables = {
	Defaults = {
		NukeAlarm = "rbxassetid://3237286675",
		Heal      = "rbxassetid://577886343",
		Explosion = "rbxassetid://3521555808",
		Kill      = "rbxassetid://2868331684",
		Parry     = "rbxassetid://211059855"
	},
	Customs = {
		Default = "",
		TF2   = "rbxassetid://5650646664",
		CSGO  = "rbxassetid://8679627751",
		FART  = "rbxassetid://6999993863",
		BOINK = "rbxassetid://5451260445",
		RAGE  = "rbxassetid://6911556519",
		RUST  = "rbxassetid://5043539486"
	},
	Variables = {
		NUKE       = ReplicatedStorage.Shared.Assets.Sounds.NukeAlarm.SoundId,
		HEAL       = ReplicatedStorage.Shared.Assets.Sounds.Heal.SoundId,
		EXPOSION   = ReplicatedStorage.Shared.Assets.Sounds.ExplosionHit.SoundId,
		KILLSOUND  = ReplicatedStorage.Shared.Assets.Sounds.Kill.SoundId,
		PARRY      = ReplicatedStorage.Shared.Assets.Sounds.Parry.SoundId
	},
	GetNames = function(Tbl,Name)
		local tb = {}
		for i,v in pairs(Tbl[Name]) do
			table.insert(tb,i)
		end
		return tb
	end
}

local Teleports = {
    Crossroads = {
        Teleports = {
            ["Black Mountain"] 		  = CFrame.new(-167, 91, 246),
            ["Black Mountain (Back)"] = CFrame.new(-187, 25, 319),
            ["Brown Mountain"] 		  = CFrame.new(143, 101, 251),
            ["Brown Mountain (Back)"] = CFrame.new(147, 26, 326),
            ["Green Mountain"] 		  = CFrame.new(159, 86, -131),
            ["Green Mountain (Back)"] = CFrame.new(273, 25, -207),

            ["Front Beach"] 		  = CFrame.new(-255, 28, -6),
            ["Left Beach"] 			  = CFrame.new(-46, 22, -231),
            ["Right Beach"] 		  = CFrame.new(-41, 25, 328),
            ["Back Beach"] 			  = CFrame.new(271, 23, 13),

            ["Center"] 				  = CFrame.new(0, 22, 0),
            ["Grey Tower"] 			  = CFrame.new(-48, 60, 55),
            ["Blue Tower"] 		      = CFrame.new(-86, 67, -76),
            ["Red Tower"] 			  = CFrame.new(150, 69, 159),
            ["Basement"] 			  = CFrame.new(157, 26, -80),
            ["Bridge"]	 			  = CFrame.new(-174, 45, -47),
        },
        GetNames = function(self)
            local tb = {}
            for i, v in self.Teleports do
                table.insert(tb, i)
            end
            return tb
        end
    }
}

local Skybox = Lighting:FindFirstChildOfClass("Sky")
if Skybox then
    Skyboxes.None.SkyboxLf = Skybox.SkyboxLf
    Skyboxes.None.SkyboxBk = Skybox.SkyboxBk
    Skyboxes.None.SkyboxDn = Skybox.SkyboxDn
    Skyboxes.None.SkyboxFt = Skybox.SkyboxFt
    Skyboxes.None.SkyboxLf = Skybox.SkyboxLf
    Skyboxes.None.SkyboxRt = Skybox.SkyboxRt
    Skyboxes.None.SkyboxUp = Skybox.SkyboxUp
end

function DbgWarn(...)
    if Debug then
        local args = {...}
        local timestamp = os.date("%Y-%m-%d %H:%M:%S") 
        warn(string.format("[%s] DEBUG:", timestamp), unpack(args))
    end
end

local function map(N, OldMin, OldMax, Min, Max)
	return (N - OldMin) / (OldMax - OldMin) * (Max - Min) + Min
end

local NotifLogs = {}
local CreateNotification
do
	local notes = {}
	local function DrawingObject(t, col)
		local d = Drawing.new(t)

		d.Visible = true
		d.Transparency = 1
		d.Color = col

		return d
	end

	local function Rectangle(sizex, sizey, fill, col)
		local s = DrawingObject("Square", col)

		s.Filled = fill
		s.Thickness = 1
		s.Position = Vector2.new()
		s.Size = Vector2.new(sizex, sizey)

		return s
	end

	local function Text(text)
		local s = DrawingObject("Text", Color3.new(1, 1, 1))

		s.Text = text
		s.Size = 13
		s.Center = false
		s.Outline = true
		s.Position = Vector2.new()
		s.Font = 2

		return s
	end

	CreateNotification = function(t, customcolor)
		table.insert(NotifLogs, string.format("[%s]: %s", os.date("%X"), t))
		local gap = 25
		local width = 18

		local alpha = 255
		local time = 0
		local estep = 0
		local eestep = 0.02

		local insety = 0

		local Note = {

			enabled = true,

			targetPos = Vector2.new(0, 110),

			size = Vector2.new(200, width),

			drawings = {
				outline = Rectangle(202, width + 2, false, Color3.new(0, 0, 0)),
				fade = Rectangle(202, width + 2, false, Color3.new(0, 0, 0)),
			},

			Remove = function(self, d)
				if d.Position.x < d.Size.x then
					for k, drawing in pairs(self.drawings) do
						drawing:Remove()
						drawing = false
					end
					self.enabled = false
				end
			end,

			Update = function(self, num, listLength, dt)
				local pos = self.targetPos

				local indexOffset = (listLength - num) * gap
				if insety < indexOffset then
					insety -= (insety - indexOffset) * 0.2
				else
					insety = indexOffset
				end
				local size = self.size

				local tpos = Vector2.new(pos.x - size.x / time - map(alpha, 0, 255, size.x, 0), pos.y + insety)
				self.pos = tpos

				local locRect = {
					x = math.ceil(tpos.x),
					y = math.ceil(tpos.y),
					w = math.floor(size.x - map(255 - alpha, 0, 255, 0, 70)),
					h = size.y,
				}

				local fade = math.min(time * 12, alpha)
				fade = fade > 255 and 255 or fade < 0 and 0 or fade

				if self.enabled then
					local linenum = 1
					for i, drawing in pairs(self.drawings) do
						drawing.Transparency = fade / 255

						if type(i) == "number" then
							drawing.Position = Vector2.new(locRect.x + 1, locRect.y + i)
							drawing.Size = Vector2.new(locRect.w - 2, 1)
						elseif i == "text" then
							drawing.Position = tpos + Vector2.new(6, 2)
						elseif i == "outline" then
							drawing.Position = Vector2.new(locRect.x, locRect.y)
							drawing.Size = Vector2.new(locRect.w, locRect.h)
						elseif i == "fade" then
							drawing.Position = Vector2.new(locRect.x - 1, locRect.y - 1	)
							drawing.Size = Vector2.new(locRect.w + 2, locRect.h + 2)
							local t = (200 - fade) / 255 / 3
							drawing.Transparency = t < 0.4 and 0.4 or t
						elseif i:find("line") then
							drawing.Position = Vector2.new(locRect.x + linenum, locRect.y + 1)
							linenum += 1
						end
					end

					time += estep * dt * 128 --> TODO need to do the duration
					estep += eestep * dt * 64
				end
			end,

			Fade = function(self, num, len, dt)
				if self.pos.x > self.targetPos.x - 0.2 * len or self.fading then
					if not self.fading then
						estep = 0
					end
					self.fading = true
					alpha -= estep / 4 * len * dt * 50
					eestep += 0.01 * dt * 100
				end
				if alpha <= 0 then
					self:Remove(self.drawings[1])
				end
			end,
		}

		for i = 1, Note.size.y - 2 do
			local c = 0.28 - i / 80
			Note.drawings[i] = Rectangle(200, 1, true, Color3.new(c, c, c))
		end
		local color = customcolor

		Note.drawings.text = Text(t)
		if Note.drawings.text.TextBounds.x + 7 > Note.size.x then --> expand the note size to fit if it's less than the default size
			Note.size = Vector2.new(Note.drawings.text.TextBounds.x + 7, Note.size.y)
		end
		Note.drawings.line = Rectangle(1, Note.size.y - 2, true, color)
		Note.drawings.line1 = Rectangle(1, Note.size.y - 2, true, color)

		notes[#notes + 1] = Note
	end

	renderStepped = RunService.RenderStepped:Connect(function(dt)
		Camera = workspace.CurrentCamera
		local smallest = math.huge
		for k = 1, #notes do
			local v = notes[k]
			if v and v.enabled then
				smallest = k < smallest and k or smallest
			else
				table.remove(notes, k)
			end
		end
		local length = #notes
		for k = 1, #notes do
			local note = notes[k]
			note:Update(k, length, dt)
			if k <= math.ceil(length / 10) or note.fading then
				note:Fade(k, length, dt)
			end
		end
	end)
	--> CreateNotification("" , NotiColor)
end

--// UI START

if Debug then
    func = function() return CoreGui:FindFirstChild('RobloxGui') end
    getgenv().gethui = func
    getgenv().get_hidden_gui = func
end

local Modules = {Name = {},Id = {}}
local UtilityIds = {}
local WeaponIds = {}
local RenderSteppedFunctions = {}
local RenderSteppedDelayedFunctions = {}

setthreadidentity(2)
for _, child in pairs(ReplicatedStorage:GetDescendants()) do
	if child:IsA("ModuleScript") then
		local success, module = pcall(require, child)
		if success then
			Modules.Name[child.Name] = module
		end
	end
end
setthreadidentity(8)

for i,v in Modules.Name['UtilityIds'] do
    UtilityIds[i:lower()] = v
end
for i,v in Modules.Name['WeaponIds'] do
    WeaponIds[i:lower()] = v
end
local Network = Modules.Name["Network"]
local EventHandler

for i, v in getgc(true) do
    if typeof(v) == "function" then
        local name = debug.info(v, "n")
        if name and name:match("GetEventHandler") then
            EventHandler = v
            DbgWarn("Got event handler. Executor Name: "..executor)
            break
        end
    end
end

local Remotes;
if EventHandler then
    Remotes = getupvalue(EventHandler, 1)
end

ReGui:Init({
	Prefabs = Prefabs
})

ReGui:DefineTheme("Monochrome", Data.Theme or {
	TitleAlign = Enum.TextXAlignment.Center,
	TextDisabled = Color3.fromRGB(225, 225, 225),
	Text = Color3.fromRGB(200, 200, 200),
	
	FrameBg = Color3.fromRGB(25, 25, 25),
	FrameBgTransparency = 0.4,
	FrameBgActive = Color3.fromRGB(225, 225, 225),
	FrameBgTransparencyActive = 0.4,
	
	CheckMark = Color3.fromRGB(150, 150, 150),
	SliderGrab = Color3.fromRGB(45, 45, 45),
	ButtonsBg = Color3.fromRGB(150, 150, 150),
	CollapsingHeaderBg = Color3.fromRGB(150, 150, 150),
	CollapsingHeaderText = Color3.fromRGB(200, 200, 200),
	RadioButtonHoveredBg = Color3.fromRGB(150, 150, 150),
	
	WindowBg = Color3.fromRGB(35, 35, 35),
	TitleBarBg = Color3.fromRGB(35, 35, 35),
	TitleBarBgActive = Color3.fromRGB(50, 50, 50),
	
	Border = Color3.fromRGB(50, 50, 50),
	ResizeGrab = Color3.fromRGB(50, 50, 50),
	RegionBgTransparency = 1,
})

ReGui:DefineTheme("Loader", Data.LoaderTheme or {
	TitleAlign = Enum.TextXAlignment.Center,
	TextDisabled = Color3.fromRGB(225, 225, 225),
	Text = Color3.fromRGB(255, 255, 255),
	
	FrameBg = Color3.fromRGB(25, 25, 25),
	FrameBgTransparency = 0.4,
	FrameBgActive = Color3.fromRGB(225, 225, 225),
	FrameBgTransparencyActive = 0.4,
	
	CheckMark = Color3.fromRGB(150, 150, 150),
	SliderGrab = Color3.fromRGB(100, 83, 255),
	ButtonsBg = Color3.fromRGB(150, 150, 150),
	CollapsingHeaderBg = Color3.fromRGB(150, 150, 150),
	CollapsingHeaderText = Color3.fromRGB(200, 200, 200),
	RadioButtonHoveredBg = Color3.fromRGB(150, 150, 150),
	
	WindowBg = Color3.fromRGB(35, 35, 35),
	TitleBarBg = Color3.fromRGB(35, 35, 35),
	TitleBarBgActive = Color3.fromRGB(50, 50, 50),
	
	Border = Color3.fromRGB(50, 50, 50),
	ResizeGrab = Color3.fromRGB(50, 50, 50),
	RegionBgTransparency = 1,
})

local Loader = ReGui:Window({
	Title = "rehydra",
	Theme = "Loader",
	NoClose = true,
    NoCollapse = true,
    NoScrolling = true,
    NoScrollBar = true,
    NoResize = true,
	Size = UDim2.new(0, 0, 0, 0),
}):Center()

local LoaderList, LoaderListObject = Loader:List()
LoaderList:Image({
	Image = Data.UIIcon or 120348119180361,
    Ratio = 1.25,
    RatioAxis = Enum.DominantAxis.Width,
    Size = UDim2.fromOffset(300, 300)
})

LoaderListObject.UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Top
LoaderListObject.UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center

local LoaderProgress = LoaderList:SliderProgress({
    Value = 0,

    Label = "",
    Format = "Loading",

    Minimum = 0,
    Maximum = 100,

    ReadOnly = true,
    Border = false,

    Ratio = 20
})

-- very fancy for no reason lol!

LoaderProgress:SetValueText("")
if not EventHandler then
    task.wait(1)
    LoaderProgress:SetValueText("Unable to get GetEventHandler, some features may be disabled for you")
end

for i = 100, 100 do
    LoaderProgress:SetValue(i)
    LoaderProgress:SetValueText(i.."%")
    task.wait(math.random()/8)
end


LoaderProgress:SetValueText("")

Loader:Close()

-- [[ FRAMEWORK ]]

local Framework = {}

local Hooks = {}
local Modify = {}

local OnFireServer = Network.FireServer

function Handle(_,Name,...)
    local Args = {...}
    if (Modify[Name] and Modify[Name].check(Name,unpack(Args))) then
        if typeof(Modify[Name].check(Name,unpack(Args))) == "table" then
			table.foreach(Modify[Name].check(Name,unpack(Args)),function(i,v)
				Args[i] = v
			end)
		else
			for i,v in Modify[Name].Args do
				Args[i] = v
			end
		end
    end
    if Hooks[Name] then
        return pcall(Hooks[Name],OnFireServer,_,Name,...)
    end
    return OnFireServer(_,Name,unpack(Args))
end

Network.FireServer = function(_,Name,...)
    return Handle(_,Name,...)
end

function Framework:AddHook(Name,Function)
	Hooks[Name] = Function
end

function Framework:ArgModify(Name,ToModify,Check)
    Modify[Name] = {Args={ToModify}}
	Modify[Name].check = function(n,...)
		local _,r = pcall(Check,n,...)
	    return r
	end
end

function Framework:RemoveHook(Name)
    table.remove(Hooks,table.find(Hooks,Name))
end

function Framework:RemoveArgModifier(Name,ToModify)
    table.remove(Modify,table.find(Modify,Name))
end

function Framework:FireServer(Name,...)
    Network:FireServer(Name,...)
end

function Framework:InvokeServer(Name, ...)
	Network:InvokeServer(Name,...)
end

function Framework.HookClient(Table,Name,NewFunction)
    if not Remotes then return end

    local ToHook
    for i,v in pairs(getconnections(Remotes[Name].Remote.OnClientEvent)) do
        ToHook = v.Function
        break
    end

    local OldHook; OldHook = hookfunction(ToHook, LPH_NO_UPVALUES(function(...)
        return NewFunction(...)
    end))

    return OldHook
end

function Framework:GetMetadata(ItemName,ItemId) 
	if not WeaponIds[ItemName:lower():gsub(' ','')] then 
		return 
	end
	
	return ItemName and Modules.Name["WeaponMetadata"][WeaponIds[ItemName:lower():gsub(' ','')]] or Modules.Name["WeaponMetadata"][ItemId]
end

function Framework:GetUtility(ItemName,ItemId) 
	if not UtilityIds[ItemName:lower():gsub(' ','')] then 
		return 
	end
	
	return ItemName and Modules.Name["UtilityMetadata"][UtilityIds[ItemName:lower():gsub(' ','')]] or Modules.Name["UtilityMetadata"][ItemId]
end

function Framework:GetWeapon(Player)
	local Player = Player or LocalPlayer
	local Character = Player.Character or Player.CharacterAdded:Wait()

	for i,v in Character:GetChildren() do
		if not v:IsA("Tool") then continue end
		if v:GetAttribute("ItemType") == "weapon" and Modules.Name["WeaponMetadata"][v:GetAttribute("ItemId")].class:lower():match("melee") then
			return v, Modules.Name["MeleeWeaponClient"].getObj(v)
		end
	end
    return
end

function Framework:GetRanged(Player)
	local Player = Player or LocalPlayer
	local Character = Player.Character or Player.CharacterAdded:Wait()

	for i,v in Character:GetChildren() do
		if not v:IsA("Tool") then continue end
		if v:GetAttribute("ItemType") == "weapon" and Modules.Name["WeaponMetadata"][v:GetAttribute("ItemId")].class:lower():match("ranged") then
			return v, Modules.Name["RangedWeaponClient"].getObj(v)
		end
	end
    return
end

function Framework:GetState()
    return Modules.Name["RoduxStore"].store:getState()
end

function Framework:GetSessionData(Player)
    return Modules.Name["DataHandler"].getSessionDataRoduxStoreForPlayer(Player or LocalPlayer)
end

function Framework:GetClosest(Distance,Priority,CheckFunction)
    local function n(Player)
        if (Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") and Player.Character:FindFirstChild("Humanoid") and Player.Character.Humanoid.Health ~= 0) then
            return true
        end
        return
    end

	local Distance = Distance or math.huge
	local CheckFunction = CheckFunction or n
	local Player = {}
	
	for i,v in Players:GetPlayers() do
		if v == LocalPlayer then continue end
        if Classes.WhitelistFriends.Value and LocalPlayer:IsFriendsWith(v.UserId) then continue end
        if not CheckFunction(v) then continue end
        if Framework:InMenu(v) then continue end
		
		local HRP = v.Character.HumanoidRootPart
		local Magnitude = (HRP.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
		
		if Magnitude < Distance  then
			Distance = Magnitude
			Player[v.Name] = v.Character.Humanoid.Health
		end
	end

    if Priority then
	    table.sort(Player)  
    end
	
	return Player
end

function Framework:GetClosest2(Distance,CheckFunction)
    local function n(Player)
        if (Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") and Player.Character:FindFirstChild("Humanoid") and Player.Character.Humanoid.Health ~= 0 and not Player.Character:FindFirstChildOfClass("ForceField")) then
            return true
        end
        return
    end

	local Distance = Distance or math.huge
	local CheckFunction = CheckFunction or n
	local Player
	
	for i,v in Players:GetPlayers() do
		if v == LocalPlayer then continue end
        if Classes.WhitelistFriends.Value and LocalPlayer:IsFriendsWith(v.UserId) then continue end
        if not CheckFunction(v) then continue end
        if Framework:InMenu(v) then continue end
		
		local HRP = v.Character.HumanoidRootPart
		local Magnitude = (HRP.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
		
		if Magnitude < Distance  then
			Distance = Magnitude
			Player = v.Name
		end
	end
	
	return Player and {[Player] = true} or nil
end

function Framework:GetClosestToMouse(Distance,Priority,CheckFunction)
    local function n(Player)
        if (Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") and Player.Character:FindFirstChild("Humanoid") and Player.Character.Humanoid.Health ~= 0) then
            return true
        end
        return
    end

	local Distance = Distance or math.huge
	local CheckFunction = CheckFunction or n
	local Player = nil

	local MousePosition = UserInputService:GetMouseLocation()

	for i,v in Players:GetPlayers() do
		if v == LocalPlayer then continue end
        if Classes.WhitelistFriends.Value and LocalPlayer:IsFriendsWith(v.UserId) then continue end
		if not CheckFunction(v) then continue end
        if Framework:InMenu(v) then continue end

		local HRP = v.Character.HumanoidRootPart

		local vector, onScreen = Camera:WorldToScreenPoint(HRP.Position)
		if onScreen then
			local Magnitude = (MousePosition - Vector2.new(vector.X, vector.Y)).Magnitude

			if Magnitude < Distance then
				Distance = Magnitude
				Player = v
			end
		end
	end

	return Player
end

local Classes = Classes -- silence! typecheck

setthreadidentity(2)
local PlayerModule = require(LocalPlayer.PlayerScripts:WaitForChild("PlayerModule"))
setthreadidentity(7)

function Framework:Fly()
	if (Classes.Fly.Value and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character.HumanoidRootPart:FindFirstChild("flyVel") == nil) then
		local Attachment = Instance.new('Attachment',LocalPlayer.Character.HumanoidRootPart)
		local LinearVelocity = Modules.Name["AntiCheatHandler"].createBodyMover("LinearVelocity")
		LinearVelocity.Name = "flyVel"
		LinearVelocity.Attachment0 = Attachment
		LinearVelocity.VectorVelocity = Vector3.new()
		LinearVelocity.MaxForce = math.huge
		LinearVelocity.Parent = LocalPlayer.Character.HumanoidRootPart
	elseif (Classes.Fly.Value and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character.HumanoidRootPart:FindFirstChild("flyVel") ~= nil) then
		local MoveVector = PlayerModule:GetControls():GetMoveVector()
		local LinearVelocity = LocalPlayer.Character.HumanoidRootPart.flyVel
		LinearVelocity.VectorVelocity = ((Camera.CFrame.LookVector * (-MoveVector.Z)) * Classes.FlySpeed.Value) + ((Camera.CFrame.RightVector * MoveVector.X) * Classes.FlySpeed.Value)
	end
	if (not Classes.Fly.Value and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character.HumanoidRootPart:FindFirstChild("flyVel") ~= nil) then
		LocalPlayer.Character.HumanoidRootPart.flyVel:Destroy()
	end
end

local spinAnim = Instance.new("Animation")
spinAnim.AnimationId = "rbxassetid://188632011"

local Loaded = {}
function Framework:SpinLoop()
    if (Classes.Spin.Value and not Loaded[LocalPlayer.Character.Humanoid]) then
        Loaded[LocalPlayer.Character.Humanoid] = LocalPlayer.Character.Humanoid:LoadAnimation(spinAnim)
    elseif (Classes.Spin.Value and Loaded[LocalPlayer.Character.Humanoid]) then
        Loaded[LocalPlayer.Character.Humanoid].Priority = Enum.AnimationPriority.Action4
        Loaded[LocalPlayer.Character.Humanoid].Looped = true
        Loaded[LocalPlayer.Character.Humanoid]:AdjustSpeed(Classes.SpinSpeed.Value)
        if not Loaded[LocalPlayer.Character.Humanoid].IsPlaying then
            Loaded[LocalPlayer.Character.Humanoid]:Play()
        end
    end
    if (not Classes.Spin.Value and Loaded[LocalPlayer.Character.Humanoid]) then
        Loaded[LocalPlayer.Character.Humanoid]:Stop()
    end
end

function Framework.IsParrying(self,Player)
	local State = self:GetSessionData():getState()
	return State.parry.isParrying
end

function Framework:GetCurrentGameMode()
	local CurrentMap = Map:FindFirstChildOfClass("Model")
	if CurrentMap then
		local Gamemodes = CurrentMap.MapConfiguration.Gamemodes
		for i,v in Gamemodes:GetDescendants() do
			if v:IsA("ObjectValue") then
				return v:FindFirstAncestorOfClass("Folder")
			end
		end
	end
    return
end

function Framework:GetPointEnemyPoint(Gamemode)
    for i,v in Gamemode:GetDescendants() do
        if (v:IsA("ObjectValue") and v.Value and v.Value:FindFirstChild("Inner")) then
            if v.Value.Inner.BrickColor ~= LocalPlayer.Team.TeamColor then
                return v.Parent
            end
        end
    end
    return
end

function Framework:GetPointTeamPoint(Gamemode)
    for i,v in Gamemode:GetDescendants() do
        if (v:IsA("ObjectValue") and v.Value and v.Value:FindFirstChild("Inner")) then
            if v.Value.Inner.BrickColor == LocalPlayer.Team.TeamColor then
                return v.Parent
            end
        end
    end
    return
end

function Framework:GetClosestCharacterToOrigin(Origin, dist)
    local dis = math.huge
    local target;
	for i,v in PlayerCharacters.GetChildren(PlayerCharacters) do
        local Player = Players:GetPlayerFromCharacter(v)
        if Player then
            if Classes.WhitelistFriends.Value and LocalPlayer:IsFriendsWith(Player.UserId) then continue end
        end

		if (v ~= LocalPlayer.Character and v.FindFirstChild(v,"HumanoidRootPart")) then
			if (v.HumanoidRootPart.Position-Origin).Magnitude < dist then
                dis = dis
				target = v
			end
		end
	end

    return target, dis
end

function Framework:GetClosestCharactersToOrigin(Origin, Dist)
    local dis = math.huge
    local closests = {}
	for i,v in PlayerCharacters:GetChildren() do
        local Player = Players:GetPlayerFromCharacter(v)
        if Player then
            if Classes.WhitelistFriends.Value and LocalPlayer:IsFriendsWith(Player.UserId) then continue end
        end

		if (v ~= LocalPlayer.Character and v:FindFirstChild("HumanoidRootPart")) then
			if (v.HumanoidRootPart.Position-Origin).Magnitude < Dist then
                dis = dis
				table.insert(closests,v)
			end
		end
	end
	return closests
end

function Framework:Chance(number) 
	return (math.floor(Random.new().NextNumber(Random.new(),0,1) * 100) / 100) <= math.floor(number) / 100
end

function Framework:IsPartClose(Part,Distance)
	local Character = LocalPlayer.Character
	local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
	if not HumanoidRootPart then return end
	if (Part and Part:IsA('BasePart')) then
		local Mag = (Part.Position - HumanoidRootPart.Position).Magnitude
		return Mag <= Distance
	end
    return
end

function Framework.GetMeleeFuncs(Table)
    local tool = Table:GetWeapon()
    if not tool then return {parry = function() end} end
    for i,v in getconnections(tool.Equipped) do
        if v.Function then
            local uv = getupvalues(v.Function)
            if #uv == 1 and uv[1].singleWeaponMetadata then
                return uv[1]
            end
        end
    end
    return
end

function Framework:Teleport(CF)
    LocalPlayer.Character.HumanoidRootPart.CFrame = CF
    task.wait(1)
    repeat
        LocalPlayer.Character.Humanoid:EquipTool(LocalPlayer.Backpack:GetChildren()[1])
        task.wait()
        LocalPlayer.Character.Humanoid:UnequipTools()
    until LocalPlayer.Character.HumanoidRootPart.ReceiveAge == 0
    task.wait()
    LocalPlayer.Character.HumanoidRootPart.CFrame = CF
end

function Framework:BindToRenderStep(func,delay)
    if delay then
        RenderSteppedDelayedFunctions[func] = delay
        return
    end
    table.insert(RenderSteppedFunctions, func)
end

function Framework:InMenu(Player)
    local IsMenu = true
    if not Player.Character then 
        return IsMenu 
    end
    for i, v in Player.Character:GetChildren() do
        if v:GetAttribute("ParryShieldId") then
            IsMenu = false
        end
    end
    return IsMenu
end

function Framework:Check(Character)
    if not Character or table.find(ParryingCharacters, Character) then return end

    local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")

    local Player = Players:GetPlayerFromCharacter(Character)
    if Player then
        local Rodux = Framework:GetSessionData(Player)
        if Rodux and Rodux:getState().parry.isParrying then
            return
        end
    end

    if Humanoid then
        local Animator = Humanoid.Animator
        local PlayingAnimations = Animator:GetPlayingAnimationTracks()
        for i, v in PlayingAnimations do
            local Name = v.Animation.Name:match("Parry")
            if Name then
                return
            end
        end
    end

    for i, v in Character:GetChildren() do
        if v:GetAttribute("ParryShieldId") and #v:GetChildren() == 1 then
            return v:GetChildren()[1].Transparency == 1
        end
    end

    return
end

function Framework:WaitForDescendant(Root, Name, Condition, Timeout)
    local Descendant = nil
    local Timedout = false

    task.delay(Timeout or 9e9, function() Timedout = true end)

    repeat
        local Instance: boolean = Root:FindFirstChild(Name, true)
        if Instance and Condition(Instance) then
            Descendant = Instance
            break
        end
        RunService.RenderStepped:Wait()
    until Descendant or Timedout

    return Descendant
end

local KalmanFilter = {}
KalmanFilter.__index = KalmanFilter

function KalmanFilter.new()
    return setmetatable({
        x = Vector3.zero,  -- Estimated position
        v = Vector3.zero,  -- Estimated velocity
        a = Vector3.zero,  -- Estimated acceleration
        p = 1,             -- Estimate uncertainty
        r = 0.01,          -- Measurement noise
        q = 0.001,         -- Process noise
    }, KalmanFilter)
end

function KalmanFilter:update(measured_pos, measured_vel, dt)
    local predicted_x = self.x + self.v * dt + 0.5 * self.a * dt * dt
    local predicted_v = self.v + self.a * dt
    
    local p_pred = self.p + self.q
    local k = p_pred / (p_pred + self.r)  -- Kalman gain
    
    self.x = predicted_x + k * (measured_pos - predicted_x)
    self.v = predicted_v + k * (measured_vel - predicted_v)
    self.p = (1 - k) * p_pred
    
    return self.x, self.v
end

function PredictTargetPosition(origin, destination, weapon_speed, ping, gravity)
    local filter = destination.KalmanFilter or KalmanFilter.new()
    destination.KalmanFilter = filter
    
    local measured_pos = destination.Position
    local measured_vel = destination.Velocity or Vector3.zero
    local dt = RunService.Heartbeat:Wait()
    
    local estimated_pos, estimated_vel = filter:update(measured_pos, measured_vel, dt)
    local network_delay = ping / 1000
    
    local future_pos = estimated_pos + estimated_vel * network_delay
    
    local travel_time = (future_pos - origin).magnitude / weapon_speed
    if measured_vel.Y <= -15 or measured_vel.Y >= 15 then
        measured_vel = Vector3.new(measured_vel.X, measured_vel.Y * travel_time, measured_vel.Z)
    end
    
    future_pos = future_pos + estimated_vel * travel_time
    future_pos = future_pos + Vector3.new(0, -0.5 * gravity * travel_time^2, 0)
    
    return future_pos
end

function SpawnBlock(Target)
    Modules.Name["VFXClient"].runAndReplicateEffect("GunMagThrow", {
        Target,
    }, "reset")
    Modules.Name["VFXClient"].runAndReplicateEffect("GunMagThrow", {
        Target,
        Vector3.new(9e9,9e9,9e9),
        Vector3.new(9e9,9e9,9e9),
        PhysicalProperties.new(2, 1.975, 0.5)
    })
end

local function waitUntilTimeout(event, timeout)
    local signal = Modules.Name["Signal"].new()
    local conn = nil
    conn = event:Connect(function(...)
        conn:Disconnect()
        signal:Fire(...)
    end)

    delay(timeout, function()
        if (conn ~= nil) then
            conn:Disconnect()
            conn = nil
            signal:Fire("Timed out")
        end
    end)

    return signal:Wait()
end

local rangedOg = {}
local weaponOrder = {}
local ranged = {}

for i, v in Modules.Name["WeaponsInOrder"] do
    weaponOrder[v.id] = v
end

for i, v in Modules.Name["WeaponIds"] do
    if weaponOrder[v] and weaponOrder[v].class == "ranged" then
        table.insert(ranged, i)
    end
end

for i,v in ranged do
	local m = Framework:GetMetadata(v) or Framework:GetUtility(v)
	if m then
		table.insert(rangedOg,{Name = v,OG = table.clone(m)})
	end
end

function modifyRanged(name,val)
	for i,v in rangedOg do
		local m = Framework:GetMetadata(v.Name) or Framework:GetUtility(v.Name)
		if m[name] then
			m[name] = val
		end
	end
end

function revertRanged(name)
	for i,v in rangedOg do
		local m = Framework:GetMetadata(v.Name) or Framework:GetUtility(v.Name)
		if m[name] then
			m[name] = v.OG[name]
		end
	end
end

--// Tabs
local Active = true
local Window = ReGui:Window({
	Title = "",
	Theme = "Monochrome",
	NoClose = true,
    NoCollapse = true,
    NoScrolling = true,
    NoScrollBar = true,
    NoResize = false,
	Size = UDim2.new(0, 600, 0, 600),
    CloseCallback = function()
        Active = false
        if cleardrawcache then
            cleardrawcache()
        end
    end
}):Center()

local typeshit = "surge.lol [rehydra modded]"
local delay = .02

task.spawn(function()
	while true do
		for i = 1, #typeshit do
			Window:SetTitle(typeshit:sub(1, i))
			task.wait(delay + math.sin(i / #typeshit * math.pi) * 0.03)
		end
		task.wait(.7)
		for i = #typeshit, 0, -1 do
			Window:SetTitle(typeshit:sub(1, i))
			task.wait(delay + math.sin(i / #typeshit * math.pi) * 0.03)
		end
		task.wait(.5)
	end
end)

local player = Players.LocalPlayer
if not player then
    Players.PlayerAdded:Wait()
    player = Players.LocalPlayer
end

local playerGui = player:WaitForChild("PlayerGui")

-- Create the main ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "prext_renamed" -- You can rename this if needed
screenGui.ResetOnSpawn = false -- Keep the UI even after the player respawns
screenGui.IgnoreGuiInset = true -- Ensures the UI fills the entire screen, ignoring Roblox's top bar
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.Parent = playerGui -- Parent it directly to the player's PlayerGui
screenGui.Enabled = false -- Start disabled, will be enabled by UI toggle

-- Create the main background frame
local backgroundFrame = Instance.new("Frame")
backgroundFrame.Name = "prext_snow19h2x"
backgroundFrame.Size = UDim2.new(1, 0, 1, 0) -- Full screen
backgroundFrame.Position = UDim2.new(0, 0, 0, 0)
backgroundFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- Black
backgroundFrame.BackgroundTransparency = 1 -- Start fully transparent (hidden)
backgroundFrame.BorderSizePixel = 0
backgroundFrame.Parent = screenGui -- Parent to the newly created ScreenGui
backgroundFrame.ZIndex = 0 -- Keep it behind other UI elements if needed

-- Create a container for the snow particles
local snowContainer = Instance.new("Frame")
snowContainer.Name = "prext_containerUb2"
snowContainer.Size = UDim2.new(1, 0, 1, 0) -- Full size of the background frame
snowContainer.Position = UDim2.new(0, 0, 0, 0)
snowContainer.BackgroundTransparency = 1 -- Transparent
snowContainer.BorderSizePixel = 0
snowContainer.ClipsDescendants = true -- Important: Snowflakes will be clipped if they go outside this frame
snowContainer.Parent = backgroundFrame -- Parent to the background frame
snowContainer.ZIndex = 1 -- Snowflakes appear on top of the background frame

-- Create the title text label
local titleTextLabel = Instance.new("TextLabel")
titleTextLabel.Name = "prext_text13"
-- Using RichText for different text colors within the same label
titleTextLabel.Text = "<font color=\"#FFFFFF\">surge</font><font color=\"#00FFFF\">.lol</font><font color=\"#FFFFFF\"> [BETA]</font>"
titleTextLabel.RichText = true -- Enable RichText for the color formatting to work
titleTextLabel.TextStrokeTransparency = 0 -- No stroke transparency
titleTextLabel.BackgroundTransparency = 1 -- Transparent background
titleTextLabel.TextColor3 = Color3.fromRGB(255, 255, 255) -- Default text color (white)
titleTextLabel.FontFace = Font.new("rbxasset://fonts/families/Inconsolata.json") -- Corrected: Use FontFace for Font.new()
titleTextLabel.TextScaled = true -- Scales text to fit the label size
titleTextLabel.Size = UDim2.new(0.12, 0, 0.023, 0)
titleTextLabel.TextTransparency = 1 -- Start fully transparent (hidden)
titleTextLabel.Position = UDim2.new(0.009, 0, 0.91, 0) -- Positioned at bottom left, slightly above the bottom
titleTextLabel.TextXAlignment = Enum.TextXAlignment.Left -- Align text to the left within the label
titleTextLabel.TextYAlignment = Enum.TextYAlignment.Center
titleTextLabel.ZIndex = 4 -- Ensure it's on top of snow and background
titleTextLabel.Parent = screenGui -- Parent to the main ScreenGui


-- Configuration for snow particles
local SNOWFLAKE_TEXT = "*"
local MIN_TEXT_SIZE = 10
local MAX_TEXT_SIZE = 23
local MIN_FALL_TIME = 5
local MAX_FALL_TIME = 12
local MIN_FADE_DELAY = 3
local MAX_FADE_DELAY = 6.3
local MIN_FADE_TIME = 3.3
local MAX_FADE_TIME = 5
local SNOWFLAKE_GENERATION_DELAY = .03 -- How often new snowflakes are created

-- Function to create a new snowflake
local function createSnowflake(): TextLabel
    local snowflake = Instance.new("TextLabel")
    snowflake.Name = "prext_snowflake"
    snowflake.Text = SNOWFLAKE_TEXT
    snowflake.TextColor3 = Color3.fromRGB(255, 255, 255)
    snowflake.TextTransparency = 0.4
    snowflake.TextStrokeTransparency = 0
    snowflake.BackgroundTransparency = 1 -- Transparent background for the text label
    snowflake.TextScaled = false -- We will set TextSize manually
    snowflake.Font = Enum.Font.Arial -- Or any other desired font
    snowflake.TextXAlignment = Enum.TextXAlignment.Center
    snowflake.TextYAlignment = Enum.TextYAlignment.Center

    -- Dynamic size and initial transparency
    local randomSize = math.random(MIN_TEXT_SIZE, MAX_TEXT_SIZE)
    snowflake.TextSize = randomSize
    -- Estimate size based on TextSize for accurate positioning/collision (approx)
    snowflake.Size = UDim2.new(0, randomSize, 0, randomSize)

    -- Random initial X position (from left to right edge of container)
    local randomX = math.random(0, snowContainer.AbsoluteSize.X - snowflake.Size.X.Offset)
    -- Start slightly above the container top
    local startYOffset = -snowflake.Size.Y.Offset -- Start just outside the top boundary
    snowflake.Position = UDim2.new(0, randomX, 0, startYOffset)

    -- Slightly transparent to begin with, for a softer look
    snowflake.TextTransparency = math.random() * 0.3 -- 0 to 0.3 transparency

    snowflake.Parent = snowContainer
    snowflake.ZIndex = 2 -- Above the container frame

    return snowflake
end

-- Function to animate a snowflake
local function animateSnowflake(snowflake: TextLabel)
    if not snowflake or not snowflake.Parent then return end -- Check if snowflake still exists

    local fallTime = math.random(MIN_FALL_TIME * 10, MAX_FALL_TIME * 10) / 10 -- Random fall duration
    local fadeDelay = math.random(MIN_FADE_DELAY * 10, MAX_FADE_DELAY * 10) / 10 -- Random delay before fading
    local fadeTime = math.random(MIN_FADE_TIME * 10, MAX_FADE_TIME * 10) / 10 -- Random fade duration

    -- Target position at the bottom of the snow container
    -- Position is relative to parent, so 1 on Y scale means bottom edge
    local targetY = snowContainer.Size.Y.Scale - (snowflake.Size.Y.Offset / snowContainer.AbsoluteSize.Y) -- Adjust for snowflake height
    local endPosition = UDim2.new(snowflake.Position.X.Scale, snowflake.Position.X.Offset, targetY, 0)

    -- TweenInfo for falling
    local fallTweenInfo = TweenInfo.new(
        fallTime,
        Enum.EasingStyle.Linear, -- Consistent fall speed
        Enum.EasingDirection.Out,
        0, -- No repeats
        false, -- Does not reverse
        0 -- No delay
    )

    -- Create and play the fall tween
    local fallTween = TweenService:Create(snowflake, fallTweenInfo, {Position = endPosition})
    fallTween:Play()
    fallTween.Completed:Wait() -- Wait for the snowflake to reach the bottom

    -- "Freeze" at the bottom for a few seconds
    task.wait(fadeDelay)

    -- Check again if snowflake still exists after the delay
    if not snowflake or not snowflake.Parent then return end

    -- TweenInfo for fading out
    local fadeTweenInfo = TweenInfo.new(
        fadeTime,
        Enum.EasingStyle.Linear,
        Enum.EasingDirection.Out,
        0, -- No repeats
        false, -- Does not reverse
        0 -- No delay
    )

    -- Create and play the fade tween
    local fadeTween = TweenService:Create(snowflake, fadeTweenInfo, {TextTransparency = 1})
    fadeTween:Play()
    fadeTween.Completed:Wait() -- Wait for the snowflake to fully fade out

    -- Clean up the snowflake after it has faded
    snowflake:Destroy()
end

-- Main loop to continuously create snowflakes
local snowGenerationConnection = nil
local function startSnowGeneration()
    if snowGenerationConnection then return end -- Already running

    snowGenerationConnection = RunService.Heartbeat:Connect(function()
        if screenGui.Enabled then -- Only generate if the ScreenGui is enabled
            local newSnowflake = createSnowflake()
            -- Start the animation in a new coroutine so it's not blocking the main loop
            task.spawn(function()
                animateSnowflake(newSnowflake)
            end)
        end
        task.wait(SNOWFLAKE_GENERATION_DELAY)
    end)
end

local function stopSnowGeneration()
    if snowGenerationConnection then
        snowGenerationConnection:Disconnect()
        snowGenerationConnection = nil
    end
    -- Clear existing snowflakes when stopping
    for _, child in snowContainer:GetChildren() do
        if child:IsA("TextLabel") and child.Name == "prext_snowflake" then
            child:Destroy()
        end
    end
end

-- IMPORTANT: You MUST place this entire snow script after the 'Active' variable
-- is defined in your main executor script for this to work correctly.

-- Function to update the visibility of the snow effect based on 'Active'
local function updateSnowEffectVisibility(isVisible: boolean)
    -- Set screenGui.Enabled to control snow particle generation and rendering
    screenGui.Enabled = isVisible

    -- Directly control the transparency of the background frame and title text
    if isVisible then
        backgroundFrame.BackgroundTransparency = 0.5 -- Make background visible
        titleTextLabel.TextTransparency = 0.2 -- Make title text visible (or your desired visible transparency)
        startSnowGeneration()
    else
        backgroundFrame.BackgroundTransparency = 1 -- Make background fully transparent
        titleTextLabel.TextTransparency = 1 -- Make title text fully transparent
        stopSnowGeneration()
    end
end

-- Call this function initially to set the state based on the initial 'Active' value
updateSnowEffectVisibility(Active)

-- **IMPORTANT INTEGRATION STEP FOR YOU:**
-- In your main executor script, find the Keybind's Callback where you toggle the UI:
-- For example, in your provided snippet:
-- local NewRow = OptionsSection:Row()
-- NewRow:Keybind({
--     Label = "",
--     Value = Enum.KeyCode.RightShift,
--     Callback = function(_, NewKeybind)
--         if bg.BackgroundTransparency == 0.5 then
--             bg.BackgroundTransparency = 1
--         else
--             bg.BackgroundTransparency = 0.5
--         end

--         local IsVisible = Window.Visible -- This is the state *before* it's toggled by Window:SetVisible
--         Window:SetVisible(not IsVisible)

--         -- ADD THE FOLLOWING LINE HERE:
--         updateSnowEffectVisibility(not IsVisible) -- Pass the *new* visibility state after Window:SetVisible has been called
--     end
-- })
-- You need to ensure 'Active' variable is consistently updated by your main UI script
-- when the window visibility changes (e.g., within your Keybind's Callback).

-- The Heartbeat connection to monitor 'Active' is removed, as you will explicitly call
-- 'updateSnowEffectVisibility' when your UI toggle happens.

local KeybindList = ReGui:Window({
	Title = "Keybinds",
	Theme = "Monochrome",
    NoCollapse = true,
    NoScrolling = true,
    NoScrollBar = true,
    NoResize = true,
    NoMove = true,
    NoClose = true,
	Size = UDim2.new(0, 300, 0, 300),
    AutomaticSize = Enum.AutomaticSize.Y
})

KeybindList:SetVisible(false)

local Size = KeybindList:GetWindowSize() / 2
KeybindList:SetPosition(UDim2.new(0.1, -Size.X, 0.5, -Size.Y))

local TitleCanvas = Window:MakeTitleBarCanvas()

TitleCanvas:Image({
	LayoutOrder = 1,
	Image = Data.UIIcon or 120348119180361,
    Ratio = 1.25,
    RatioAxis = Enum.DominantAxis.Width,
    Size = UDim2.fromOffset(19, 19)
})

function ViewChangelogs()
    local J = false
    local ModalWindow; ModalWindow = Window:PopupModal({
        Title = "Changelogs",
        AutoSize = "Y",
        NoClose = false,
        NoScroll = false,
        CloseCallback = function()
            if J then return end
            J = true
            ModalWindow:ClosePopup()
        end
    })
    
    local changelogs = string.split(Changelogs, "\n")
    local bullets = {{}}
    for i,v in changelogs do
        if v ~= "%NEWBULLET%" then
            local currentIndex = #bullets[#bullets]
            if (currentIndex + 1) == 1 then
                table.insert(bullets[#bullets], "%HEADER%"..v)
                continue
            end
            table.insert(bullets[#bullets], v)
        else
            bullets[#bullets + 1] = {}
        end
    end
    
    for i, v in bullets do
        if v[1]:match("%%HEADER%%") then
            ModalWindow:Label({
                Text = v[1]:gsub("%%HEADER%%", ""),
                Bold = true
            })
            table.remove(v, 1)
            if #v ~= 0 then
                ModalWindow:Separator()
            end
        end
        if #v ~= 0 then
            ModalWindow:BulletText({
                Padding = 25,
                Rows = v
            })
        end
    end
    
    ModalWindow:Button({
        Text = "Okay",
        Callback = function()
            ModalWindow:ClosePopup()
        end,
    })
end

local ActiveKeybinds = {}
function UpdateKeybinds()
    local Keybind = {}
    for i, v in Classes do
        if Classes[i.."Keybind"] then
            if Classes[i.."Keybind"].Value then
                Keybind[i] = `{Labels[i]} (%s) [%s]`
            else
                if ActiveKeybinds[i] then
                    ActiveKeybinds[i][1]:Remove()
                    ActiveKeybinds[i] = nil
                end
            end
        end
    end

    for Index, Text in Keybind do
        if ActiveKeybinds[Index] then
            ActiveKeybinds[Index][2].Text = string.format(`{Labels[Index]} (%s) [%s]`, Classes[Index].Value and "ON" or "OFF", Classes[Index.."Keybind"].Value.Name)
            continue
        end

        local Object = KeybindList:Bullet({Padding = 25})
        local Class = Object:Label({
            Text = string.format(Text, Classes[Index].Value and "ON" or "OFF", Classes[Index.."Keybind"].Value.Name),
            LayoutOrder = 2,
            Size = UDim2.fromOffset(0,14),
        })
        ActiveKeybinds[Index] = {Object, Class}
    end
    
    local Size = KeybindList:GetWindowSize() / 2
    KeybindList:SetPosition(UDim2.new(0.1, -Size.X, 0.5, -Size.Y))
end

ViewChangelogs()

local Group = Window:List({
	UiPadding = 2,
	HorizontalFlex = Enum.UIFlexAlignment.Fill,
})

local TabsBar = Group:List({
	Border = false,
	UiPadding = 5,
	BorderColor = Window:GetThemeKey("Border"),
	BorderThickness = 1,
	HorizontalFlex = Enum.UIFlexAlignment.Fill,
	HorizontalAlignment = Enum.HorizontalAlignment.Center,
	AutomaticSize = Enum.AutomaticSize.None,
	FlexMode = Enum.UIFlexMode.None,
	Size = UDim2.new(1, 0, 0, 40),
	CornerRadius = UDim.new(0, 5)
})
local TabSelector, SelectorObject = Group:TabSelector({
	NoTabsBar = true,
	Size = UDim2.fromScale(0.5, 1)
})
SelectorObject.Body.ScrollBarThickness = 4

-- INFORMATION WINDOW
local Green = Color3.fromRGB(198, 255, 198)
local Red = Color3.fromRGB(255, 85, 85)

local InformationWindow = ReGui:Window({
	Title = "Target Information",
	Theme = "Monochrome",
    NoCollapse = true,
    NoScrolling = true,
    NoScrollBar = true,
    NoResize = true,
    NoMove = true,
    NoClose = true,
    NoTitleBar = false,
	Size = UDim2.new(0, 400, 0, 160),
})

local Size = InformationWindow:GetWindowSize() / 2
InformationWindow:SetPosition(UDim2.new(0.5, -(Size.X + 565), 0.5, (Size.Y + 160)))

local Row = InformationWindow:Row({
    Spacing = 7,
})
local Image = Row:Image({
    Image = 5205790785,
    Border = true,
	BorderColor = InformationWindow:GetThemeKey("Border"),
	BorderThickness = 1,
    CornerRadius = UDim.new(0, 2)
})
local List, ListObj = Row:List({
    Ratio = 3.2
})
local User = List:Label({Text = "Username: Unknown (@DisplayName)", Bold = true, Italic = true})
local UserID = List:Label({Text = "User ID: 1", Italic = true})
local UserLevel = List:Label({Text = "Level: 1", Italic = true})
local UserScore = List:Label({Text = "Score: 1", Italic = true})
local UserDistance = List:Label({Text = "Distance: 0m", Italic = true})
local UserTool = List:Label({Text = "Equipped Tool: Tool Name", Italic = true})
ListObj.UIListLayout.Padding = UDim.new(0, 5)
ListObj.UIListLayout.FillDirection = Enum.FillDirection.Vertical
ListObj.UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Top

local UserHealth, SliderObj = InformationWindow:SliderProgress({
    Value = 115,
    Label = "",
    Format = "",
    Minimum = 0,
    Maximum = 115,
    ReadOnly = true,
    NoAnimation = true,
    Ratio = 20
})

SliderObj.Track.Grab.BackgroundColor3 = Green
InformationWindow:SetVisible(false)

local ShowingInfo
local function ShowInformation(Player)
    if Player == nil then ShowingInfo = nil; return end
    if ShowingInfo == Player then return end

    InformationWindow:SetVisible(true)

    local userId = Player.UserId
    local thumbType = Enum.ThumbnailType.HeadShot
    local thumbSize = Enum.ThumbnailSize.Size180x180
    local content, isReady = Players:GetUserThumbnailAsync(userId, thumbType, thumbSize)

    if executor ~= "Velocity" then
        if Classes.StreamerMode.Value and Classes.HidePlayerNames.Value then
            userId = 0
        end
    end

    User.Text = "Username: "..Player.Name.." (@"..Player.DisplayName..")"
    UserID.Text = "User ID: "..Player.UserId

    if executor ~= "Velocity" then
        if Classes.StreamerMode.Value and Classes.HidePlayerNames.Value then
            Image.Image = "rbxassetid:/5205790785"
        else
            Image.Image = (isReady and content) or "rbxassetid://0"
        end
    else
        Image.Image = (isReady and content) or "rbxassetid://0"
    end

    ShowingInfo = Player
    task.spawn(function()
        while ShowingInfo == Player do
            local Leaderstats = Player:FindFirstChild("leaderstats")
            if Leaderstats then
                UserLevel.Text = "Level: "..Leaderstats.Level.Value
                UserScore.Text = "Score: "..Leaderstats.Score.Value
            else
                break
            end

            local Character = Player.Character
            local PlayerCharacter = LocalPlayer.Character
            if Character then
                local Tool = Character:FindFirstChildOfClass("Tool")
                local Humanoid = Character:FindFirstChildOfClass("Humanoid")
                local OurHumanoid = PlayerCharacter:FindFirstChildOfClass("Humanoid")
                if Humanoid then
                    if Humanoid.Health == 0 then
                        break
                    end
                    local Root = Humanoid.RootPart
                    if OurHumanoid and Root then
                        local OurRoot = OurHumanoid.RootPart
                        local Distance = (Root.Position - OurRoot.Position).Magnitude

                        UserDistance.Text = "Distance: "..math.round(tonumber(Distance)).."m"
                    end

                    local ratio = math.clamp(Humanoid.Health / 115, 0, 1)

                    UserHealth:SetValue(Humanoid.Health)
                    SliderObj.Track.Grab.BackgroundColor3 = Green:lerp(Red, 1 - ratio)
                else
                    break
                end
                if Tool then
                    UserTool.Text = "Equipped Tool: "..Tool.Name
                else
                    UserTool.Text = "Equipped Tool: None"
                end
            else
                break
            end
            RunService.RenderStepped:Wait()
        end
        if ShowingInfo == nil then
            UserTool.Text = "Equipped Tool: None"
            UserDistance.Text = "Distance: 0m"
            UserHealth:SetValue(0)
            InformationWindow:SetVisible(false)
        end
        if ShowingInfo == Player then
            UserTool.Text = "Equipped Tool: None"
            UserDistance.Text = "Distance: 0m"
            UserHealth:SetValue(0)
            task.wait(2)
            ShowingInfo = nil
            InformationWindow:SetVisible(false)
        end
    end)
end

-- END

local lol = false
local TabButton = {}
local function CreateTab(Name, Icon, CanvasSize)
	local Tab = TabSelector:CreateTab({
		Name = Name
	})

	local List = Tab:List({
		HorizontalFlex = Enum.UIFlexAlignment.Fill,
        VerticalFlex = Enum.UIFlexAlignment.Fill,
		UiPadding = 1,
		Spacing = 10,
	})

	local Button, Obj = TabsBar:Image({
		Image = Icon,
		Ratio = 1,
		RatioAxis = Enum.DominantAxis.Width,
		Size = UDim2.fromScale(2, 2),
		Callback = function(self)
            for i, v in TabButton do
                local color = i == Name and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(150, 150, 150)
                local tween = TweenService:Create(v, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0), {ImageColor3 = color})
                tween:Play()
            end
			TabSelector:SetActiveTab(Tab)
            SelectorObject.Body.CanvasSize = CanvasSize
		end,
	})
    TabButton[Name] = Obj
    if lol then
        Obj.ImageColor3 = Color3.fromRGB(150, 150, 150)
    end

    Button.Parent:FindFirstChild("UIListLayout").Padding = UDim.new(0, 25)

	ReGui:SetItemTooltip(Button, function(Canvas)
		Canvas:Label({
			Text = Name
		})
	end)

    lol = true
	return List
end

local function CreateRegion(Parent, Title, Scroll)
	local Region = Parent:Region({
		Border = true,
		BorderColor = Window:GetThemeKey("Border"),
		BorderThickness = 1,
		CornerRadius = UDim.new(0, 5),
        Scroll = Scroll or false
	})

	if Title ~= "" then
        Region:Label({
            Text = Title
        })
    end

	return Region
end

local CopiedColor = Color3.new(1, 1, 1)
local function Create(Parent, Name, Props, InstName, Tooltip, Keybind, Colorpicker, KeybindNoToggle, OgColor)
    Parent = (Keybind or Colorpicker) and Parent:Row() or Parent
    if Classes[InstName] then
        warn("!! DUPLICATE !!", Name, InstName)
    end
    if Name == "Checkbox" then
        Labels[InstName] = Props.Label
        
        local OriginalCallback = Props.Callback or function() end
        Props.Callback = function(...)
            UpdateKeybinds()
            return OriginalCallback(...)
        end
    end
    local Class, Object = Parent[Name](Parent, Props)
    if InstName then
        Classes[InstName] = Class
        Objects[InstName] = Object
    end
    if Tooltip then
        ReGui:SetItemTooltip(Class, function(Canvas)
            Canvas:Label({
                Text = Tooltip
            })
        end)
    end
    if Keybind then
        local KeybindClass, _ = Parent:Keybind({
            Size = UDim2.fromOffset(55, 19), 
            Label = "", 
            IgnoreGameProcessed = false, 
            Callback = function() 
                UpdateKeybinds();
                if not KeybindNoToggle then
                    Class:Toggle() 
                    CreateNotification(`Toggled {Labels[InstName] or "Unknown"} to {Classes[InstName].Value and "ON" or "OFF"}`, Color3.fromRGB(73, 67, 255))
                end 
            end,
            OnKeybindSet = UpdateKeybinds
        })
        Classes[InstName.."Keybind"] = KeybindClass
    end
    if Colorpicker then
        Colors[InstName] = (OgColor and OgColor or Color3.new(1,1,1))
        local _, Obj; Obj = Parent:Button({
            Size = UDim2.fromOffset(19, 19),
            BackgroundTransparency = 0,
            Ratio = 1,
		    RatioAxis = Enum.DominantAxis.Width,
            UiPadding = 0,
            ColorTag = "",
            ElementStyle = "",
            Text = "",
            BackgroundColor3 = Colors[InstName],
            Border = true,
            BorderThickness = 1,
	        BorderColor = Color3.new(0, 0, 0),
            Callback = function()
                local Color = Colors[InstName] and Colors[InstName] or (OgColor and OgColor or Color3.new(1,1,1))
                Obj.BackgroundColor3 = Color
                local ModalWindow = Window:PopupModal({
                    Title = "Colorpicker",
                    AutoSize = "Y"
                })
                local Slider = ModalWindow:SliderColor3({
                    Value = Color,
                    Label = "Color",
                    Callback = function(_,color)
                        Obj.BackgroundColor3 = color
                        Colors[InstName] = color
                    end
                })
                local Row = ModalWindow:Row({
                    Spacing = 5
                })
                local _, ColorButton;
                Row:Button({
                    Text = "Copy Color",
                    Callback = function()
                        ColorButton.BackgroundColor3 = Colors[InstName]
                        CopiedColor = Colors[InstName]
                    end,
                })
                Row:Button({
                    Text = "Paste Color",
                    Callback = function()
                        Slider:SetValue(CopiedColor)
                    end,
                })
                _, ColorButton = Row:Button({
                    Size = UDim2.fromOffset(19, 19),
                    BackgroundTransparency = 0,
                    Ratio = 1,
                    RatioAxis = Enum.DominantAxis.Width,
                    UiPadding = 0,
                    ColorTag = "",
                    ElementStyle = "",
                    Text = "",
                    BackgroundColor3 = CopiedColor,
                    Border = true,
                    BorderThickness = 1,
                    BorderColor = Color3.new(0, 0, 0),
                })
                ModalWindow:Button({
                    Text = "Done",
                    Size = UDim2.fromScale(1, 0),
                    Callback = function()
                        ModalWindow:ClosePopup()
                    end,
                })
            end
        })

        Framework:BindToRenderStep(LPH_NO_VIRTUALIZE(function()
            local Color = Colors[InstName] and Colors[InstName] or (OgColor and OgColor or Color3.new(1,1,1))
            Obj.BackgroundColor3 = Color
        end))
    end
    return Class, Object
end

local CloseRange = CreateTab("Close-Range", "rbxassetid://124159074947754", UDim2.new(0, 0, 1.175, 0))
local Ranged = CreateTab("Ranged", "rbxassetid://92157041036177", UDim2.new(0, 0, 1.05, 0))
local Character = CreateTab("Character", "rbxassetid://81489458260315", UDim2.new(0, 0, 1.075, 0))
local Visuals = CreateTab("Visuals", "rbxassetid://7300480952", UDim2.new(0, 0, 0, 0))
local Misc = CreateTab("Misc", "rbxassetid://7734042071", UDim2.new(0, 0, 1.3, 0))
local Settings = CreateTab("Settings", "rbxassetid://7300486042", UDim2.new(0, 0, 0, 0))

SelectorObject.Body.CanvasSize = UDim2.new(0, 0, 1.175, 0)

--// Melee Tab
local CombatSection = CreateRegion(CloseRange, "Kill Aura") do --// Kill Aura
    Create(CombatSection, "Checkbox", {Label = "Kill Aura", Value = false}, "KillAura", "Automatically hits people for you", true)
    Create(CombatSection, "Checkbox", {Label = "Play Animation", Value = false}, "PlayAnimation", "Plays animation on slash", true)
    Create(CombatSection, "Checkbox", {Label = "Teleport To Enemy", Value = false}, "TPEnemy", "Teleports to enemy, making you harder to hit", true)
    Create(CombatSection, "Checkbox", {Label = "Use Weapon Cooldown", Value = false}, "UseWeaponCD", "Use your weapon cooldown or your own specified one", true)
    Create(CombatSection, "Combo", {Label = "Kill Aura Type", Selected = 1, Items = {"Single Person", "Multiple People"}}, "KillAuraType", "Self explantory... I think?")

    Create(CombatSection, "SliderProgress", {Label = "Range", Value = 15, Minimum = 5, Maximum = 15, Format = "%.f studs"}, "KillAuraRange", "The range for Kill Aura")
    Create(CombatSection, "SliderProgress", {Label = "Cooldown", Value = 0.35, Minimum = 0.35, Maximum = 1, Format = "%.2f seconds"}, "KillAuraCooldown", "The cooldown for Kill Aura if Use Weapon Cooldown is off")
    Create(CombatSection, "Combo", {Label = "Teleport Type", Selected = 1, Items = {"Behind", "Orbit", "Above", "Random"}}, "TPType", "Teleport type")
    Create(CombatSection, "SliderProgress", {Label = "TP Range", Value = 10, Minimum = 0, Maximum = 12, Format = "%.f studs"}, "TPRange", "The range for TP To Enemy")
    
    Create(CombatSection, "Checkbox", {Label = "Range Indicator", Value = false}, "RangeIndicator", "Shows your detection range", true, true)
end

local Modifications = CreateRegion(CloseRange, "Modifications") do --// Modificationss
    Create(Modifications, "Checkbox", {Label = "Always Hit", Value = false}, "AlwaysHit", "Always hit your target if they're in your range", true)
    Create(Modifications, "Combo", {Label = "Hit Part", Selected = 1, Items = {"Head", "Torso"}}, "AlwaysHitPart", "What to hit")
    Create(Modifications, "SliderProgress", {Label = "Range", Value = 15, Minimum = 5, Maximum = 15, Format = "%.f studs"}, "AlwaysHitRange", "The range for Always Hit")

    Modifications:Separator({Text = "Others"})

    Create(Modifications, "Checkbox", {Label = "Anti Parry", Value = false}, "AntiParry", "Prevents you from getting parried most of the time", true)
    Create(Modifications, "Checkbox", {Label = "Auto Equip", Value = false}, "AutoEquip", "Automatically equips your weapon", true)
    Create(Modifications, "Checkbox", {Label = "Fake Swing", Value = false}, "FakeSwing", "Plays swing animation to bait shitty Auto Parry", true)
    Create(Modifications, "Checkbox", {Label = "Play Swing Sound", Value = false}, "SwingSound", "Plays swing sound to bait decent Auto Parry", true, false, true)
    Create(Modifications, "Checkbox", {Label = "Burst Swing", Value = false}, "BurstSwing", "Delays your first swing to deal alot of damage in a short time", true)
    Create(Modifications, "Checkbox", {Label = "Lower Swing Cooldown", Value = false}, "LowerSwingCooldown", "Lowers your swing cooldown", true)
    Create(Modifications, "SliderProgress", {Label = "Lower by", Value = 0.2, Minimum = 0, Maximum = 1, Format = "%.2f seconds"}, "LowerSwingValue", "How many seconds to lwoer it by")

    UserInputService.InputBegan:Connect(function(i, gp)
        if gp then return end
        if Classes.SwingSound.Value and (i.KeyCode == Classes.SwingSoundKeybind.Value or i.UserInputType == Classes.SwingSoundKeybind.Value) then
            local Weapon = Framework:GetWeapon()
            if Weapon then
                Network:FireServer("MeleeSwing", Weapon, math.random(1, 3))
            end
        end
    end)
end

CloseRange:Separator({Text = "Parry"})

local ParrySection = CreateRegion(CloseRange, "") do --// Auto Parry
    Create(ParrySection, "Checkbox", {Label = "Auto Parry", Value = false}, "AutoParry", "Automatically parries incoming attacks", true)
    Create(ParrySection, "Checkbox", {Label = "Random Chance", Value = false}, "RandomChance", "Randomize auto parry chance", true)
    Create(ParrySection, "Checkbox", {Label = "Check If Looking", Value = false}, "LookCheck", "Checks if enemy is looking at you", true)
    Create(ParrySection, "Combo", {Label = "Check Method", Selected = 1, Items = {"Sounds", "Animations"}}, "APCheck", "What to check")
    Create(ParrySection, "Combo", {Label = "Auto Parry Type", Selected = 1, Items = {"Rage", "Legit"}}, "APType", "Rage means no animation and Legit plays animation, shows the shield")

    Create(ParrySection, "SliderProgress", {Label = "Delay", Value = 0, Minimum = 0, Maximum = 1, Format = "%.1f seconds"}, "APDelay", "How many seconds to wait before parrying")
    Create(ParrySection, "SliderProgress", {Label = "Range", Value = 15, Minimum = 1, Maximum = 15, Format = "%.f studs"}, "APRange", "How far does it detect the enemies")
    Create(ParrySection, "SliderProgress", {Label = "Chance", Value = 100, Minimum = 1, Maximum = 100, Format = "%.f%%"}, "APChance", "Chance to parry")
    Create(ParrySection, "SliderProgress", {Label = "Look Angle", Value = 45, Minimum = 1, Maximum = 180, Format = "%.f degrees"}, "APAngle", "The angle for Check If Looking")
    Create(ParrySection, "SliderProgress", {Label = "Marker Threshold", Value = 0.3, Minimum = 0, Maximum = 1, Format = "%.1f seconds"}, "Threshold", "Threshold for animation")

    Create(ParrySection, "Checkbox", {Label = "Range Indicator", Value = false}, "APRangIndicator", "Shows your parry range", true, true)
    Create(ParrySection, "Checkbox", {Label = "Player Look Angle Indicator", Value = false}, "LookIndicator", "Visualizes Look Angle on enemies", true, true)
end

--// Character Tab
local CharModifications = CreateRegion(Character, "Character Modifications") do --// Mods
    local First = false
    Create(CharModifications, "Checkbox", {Label = "Walkspeed", Value = false, Callback = function(self, bool)
        if not bool and First then -- when u execute toggle fires and u walk super slow lol
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then 
                Modules.Name["WalkSpeedHandlerClient"].getValueContainer():setBaseValue(16) 
            end 
        else
            First = true
        end
    end}, "WS", "Custom walkspeed", true)
    Create(CharModifications, "SliderProgress", {Label = "Speed", Value = 40, Minimum = 16, Maximum = 40, Format = "%.f studs/s"}, "WSValue", "Your custom walkspeed")

    Create(CharModifications, "Checkbox", {Label = "Teleport Walk", Value = false}, "TPWalk", "Walkspeed with extra steps", true)
    Create(CharModifications, "SliderProgress", {Label = "Speed", Value = 2, Minimum = 1, Maximum = 2, Format = "%.f ws"}, "TPWalkValue", "Teleport Walk speed")

    Create(CharModifications, "Checkbox", {Label = "Jump Power", Value = false, Callback = function(self, bool)
        if not bool then
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then 
                Modules.Name["JumpHandlerClient"].getJumpPowerValueContainer():setBaseValue(50)
            end
        end
    end}, "JP", "Custom jump power", true)
    Create(CharModifications, "SliderProgress", {Label = "Power", Value = 50, Minimum = 50, Maximum = 1000, Format = "%.f power"}, "JPValue", "Your custom jump power")

    CharModifications:Separator({Text = "Others"})

    Create(CharModifications, "Checkbox", {Label = "Fly", Value = false}, "Fly", "Be able to fly", true)
    Create(CharModifications, "Checkbox", {Label = "B-Hop", Value = false}, "Bhop", "Automatically jumps for you", true)
    Create(CharModifications, "Checkbox", {Label = "Spin", Value = false}, "Spin", "You spin me right round, baby, right round", true)
    Create(CharModifications, "Checkbox", {Label = "No Animations", Value = false}, "NoAnimations", "Stops any playing animation", true)
    Create(CharModifications, "Checkbox", {Label = "Infinite Jump", Value = false}, "InfiniteJump", "Be able to jump in the air", true)
    Create(CharModifications, "SliderProgress", {Label = "Fly Speed", Value = 40, Minimum = 1, Maximum = 40, Format = "%.f stud/s"}, "FlySpeed", "Fly speed")
    Create(CharModifications, "SliderProgress", {Label = "Spin Speed", Value = 100, Minimum = 1, Maximum = 100, Format = "%.f"}, "SpinSpeed", "Spin speed")

    CharModifications:Separator({Text = "Revive"})

    Create(CharModifications, "Checkbox", {Label = "Auto Revive", Value = false}, "AR", "Automatically revives you", true)

    CharModifications:Separator({Text = "Hitbox"})

    local parts = table.clone(R6BodyParts)
    table.insert(parts, 'Random')
    Create(CharModifications, "Checkbox", {Label = "Hitbox Expander", Value = false}, "HitboxExpand", "Expands people hitbox", true, true, false, Color3.fromRGB(100, 83, 255))
    Create(CharModifications, "Checkbox", {Label = "Show Expanded Hitbox", Value = false}, "ShowHitbox", "Shows expanded hitbox", true)
    Create(CharModifications, "Combo", {Label = "Hitpart", Selected = 1, Items = parts}, "HBEPart", "What part to hit")
    Create(CharModifications, "SliderProgress", {Label = "Hitbox Size", Value = 20, Minimum = 1, Maximum = 20, Format = "%.f stud"}, "HitboxSize", "Hitbox size")
    
    local FakeHitboxes = {}
    function ApplyHitbox(Character)
        task.wait()

        local FakeHitbox = Instance.new("Part")
        FakeHitbox.Size = Vector3.new(Classes.HitboxSize.Value, Classes.HitboxSize.Value, Classes.HitboxSize.Value)
        FakeHitbox.CanCollide = false
        if Classes.ShowHitbox.Value then
            FakeHitbox.Transparency = 0.7
        else
            FakeHitbox.Transparency = 1
        end
        FakeHitbox.Name = "FakeHitbox"
        FakeHitbox.Color = Colors.HitboxExpand or Color3.fromRGB(100, 83, 255)
        FakeHitbox:SetAttribute("IsCharacterHitbox", Classes.HitboxExpand.Value)
        FakeHitbox.Massless = true
        FakeHitbox.CastShadow = false
        FakeHitbox.Parent = Character

        FakeHitbox:AddTag("RANGED_CASTER_IGNORE_LIST")

        local Weld = Instance.new("Weld")
        Weld.Part0 = Character:WaitForChild("HumanoidRootPart")
        Weld.Part1 = FakeHitbox
        Weld.Parent = FakeHitbox

        table.insert(FakeHitboxes, FakeHitbox)
    end

    for i, v in PlayerCharacters:GetChildren() do
        if v ~= LocalPlayer.Character then
            ApplyHitbox(v)
        end
    end

    for i, v in Players:GetPlayers() do
        if v ~= LocalPlayer then
            v.CharacterAdded:Connect(ApplyHitbox)
        end
    end

    Players.PlayerAdded:Connect(function(Player)
        Player.CharacterAdded:Connect(ApplyHitbox)
    end)

    Framework:BindToRenderStep(LPH_NO_VIRTUALIZE(function()
        for i, v in FakeHitboxes do
            if not v:IsDescendantOf(game) then
                table.remove(FakeHitboxes, i)
                continue
            end

            local toExpand = v.Parent:FindFirstChild(Classes.HBEPart.Value)
            if toExpand and v.Weld.Part0 ~= toExpand then
                v.Weld.Part0 = toExpand
            end

            v.Transparency = (Classes.HitboxExpand.Value and Classes.ShowHitbox.Value) and 0.7 or 1
            v.Color = Colors.HitboxExpand or Color3.fromRGB(223, 120, 255)
            v.Size = Vector3.new(Classes.HitboxSize.Value, Classes.HitboxSize.Value, Classes.HitboxSize.Value)

            v:SetAttribute("IsCharacterHitbox", Classes.HitboxExpand.Value)
            if not Classes.HitboxExpand.Value then
                if not v:HasTag("RANGED_CASTER_IGNORE_LIST") then
                    v:AddTag("RANGED_CASTER_IGNORE_LIST")
                end
            else
                if v:HasTag("RANGED_CASTER_IGNORE_LIST") then
                    v:RemoveTag("RANGED_CASTER_IGNORE_LIST")
                end
            end
        end
    end))
end

local CharModifications2 = CreateRegion(Character, "Character Modifications 2") do --// Others
    Create(CharModifications2, "Checkbox", {Label = "Infinite Stamina", Value = false}, "IS", "Never run out of stamina", true)
    Create(CharModifications2, "Checkbox", {Label = "Infinite Air", Value = false, Callback = function(self, bool)
        if bool then
            Modules.Name["AirConstants"].AIR_TO_ADD_PER_SECOND_WHILE_SWIMMING = 0
        else
            Modules.Name["AirConstants"].AIR_TO_ADD_PER_SECOND_WHILE_SWIMMING = -15
        end
    end}, "IA", "Never run out of air", true)

    Create(CharModifications2, "Checkbox", {Label = "Can Always Jump", Value = false}, "CAJ", "Be able to jump even when downed", true)

    Create(CharModifications2, "Checkbox", {Label = "No Jump Cooldown", Value = false, Callback = function(self, bool)
        if bool then
            Modules.Name["JumpConstants"].JUMP_DELAY_ADD = 0
        else
            Modules.Name["JumpConstants"].JUMP_DELAY_ADD = 1
        end
    end}, "NJCD", "No jump cooldown", true)
    Create(CharModifications2, "Checkbox", {Label = "No Dash Cooldown", Value = false, Callback = function(self, bool)
        if bool then
            Modules.Name["DashConstants"].DASH_COOLDOWN = 0
        else
            Modules.Name["DashConstants"].DASH_COOLDOWN = 3
        end
    end}, "NDCD", "No dash cooldown", true)
    Create(CharModifications2, "Checkbox", {Label = "No Name Tag", Value = false}, "NT", "No name tag above your head", true)
    Create(CharModifications2, "Checkbox", {Label = "No Utilities Trigger", Value = false}, "NUD", "Disables beartrap and claymore", true)
    Create(CharModifications2, "Checkbox", {Label = "Instant Use Utilities", Value = false, Callback = function(self, bool)
        if bool then
            for i,v in Modules.Name["UtilityMetadata"] do
                if v.displayName ~= "Medkit" then
                    v.cacheDur = v.preThrowDuration or 0.001
                    v.cacheTime = v.useTime or 0
                    
                    v.preThrowDuration = 0.001
                    v.useTime = 0
                end
            end
        else
            for i,v in Modules.Name["UtilityMetadata"] do
                if v.displayName ~= "Medkit" then
                    v.preThrowDuration = v.cacheDur or v.preThrowDuration
                    v.useTime = v.cacheTime or v.useTime
                end
            end
        end
    end}, "IUU", "Disables beartrap and claymore", true)
    Create(CharModifications2, "Checkbox", {Label = "No Knockback", Value = false}, "NKB", "Disables knockback", true)
    Create(CharModifications2, "Checkbox", {Label = "No Fall Damage", Value = false, Callback = function(self, bool)
        Framework:GetSessionData():getState().fallDamageClient.isDisabled = bool
    end}, "NFD", "Disables fall damage", true)
    Create(CharModifications2, "Checkbox", {Label = "No Ragdoll", Value = false}, "NR", "Disables ragdoll", true)
    Create(CharModifications2, "Checkbox", {Label = "No Parry Stun", Value = false}, "NPS", "Disables parry stun", true)
    Create(CharModifications2, "Checkbox", {Label = "No Parry Slowdown", Value = false}, "NPS2", "Disables slowdown on parry", true)
    if Remotes then
        Create(CharModifications2, "Checkbox", {Label = "No Flash Effect", Value = false}, "NoFlash", "Disables every flashbang/bomb effects", true)
    else
        Create(CharModifications2, "Label", {Text = "Due to your executor this feature has been disabled"})
    end
    Create(CharModifications2, "Checkbox", {Label = "No Low Health Effect", Value = false}, "NoHealth", "Disables low health effects", true)
    Create(CharModifications2, "Checkbox", {Label = "No Ghost Potion Effect", Value = false}, "NoGhostPotEffect", "Disables ghost potion effects", true)
    Create(CharModifications2, "Checkbox", {Label = "Walk On Water", Value = false, Callback = function(self, bool)
        for i, v in Map:GetDescendants() do
            if v:IsA("BasePart") and v.Name == "WaterArea" then
                v.CanCollide = bool
            end
        end
    end}, "WOW", "Be able to walk on maps with water", true)

    CharModifications2:Separator({Text = "Others"})

    Create(CharModifications2, "Checkbox", {Label = "Desync", Value = false}, "Desync", "Turn this on if you want to disrupt Silent Aim calculations", true)
    Create(CharModifications2, "Checkbox", {Label = "Invisible", Value = false}, "Invisible", "Makes your body invisible (Wear lesser accessory or none at all)", true)
    Create(CharModifications2, "Checkbox", {Label = "TP To Death Pos", Value = false}, "DTP", "Teleports you to where you last died", true)
    Create(CharModifications2, "Checkbox", {Label = "Hide Weapon On Back", Value = false, Callback = function(self, bool)
        if bool then
            local Character = LocalPlayer.Character
            local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
            if Humanoid then
                Humanoid:EquipTool(LocalPlayer.Backpack:GetChildren()[1])
                task.wait()
                Humanoid:UnequipTools()
            end
        end
    end}, "HideWeaponOnBack", "Disables tweapon on your back (turn on with Invisible to go full invis)", true)

    local Conn; Conn = Map.DescendantAdded:Connect(function(Part)
        if not Active then
            Conn:Disconnect()
            return
        end
        if Part:IsA("BasePart") and Part.Name == "WaterArea" then
            Part.CanCollide = Classes.WOW.Value
        end
    end)
end

--// Ranged Tab
local AimbotSection = CreateRegion(Ranged, "Aimbot") do --// Aimbot
    Create(AimbotSection, "Checkbox", {Label = "Aimbot", Value = false}, "Aimbot", "Automatically aims for you", true, false, true)
    Create(AimbotSection, "Checkbox", {Label = "Smooth Out", Value = false}, "Smooth", "Smooths out camera", true, false)
    Create(AimbotSection, "Checkbox", {Label = "Prediction", Value = false}, "Prediction", "Whether to predict the target next position or not", true)
    Create(AimbotSection, "Checkbox", {Label = "Hold Keybind", Value = false}, "Hold", "Whether to hold keybind to activate or not", true)
    Create(AimbotSection, "Checkbox", {Label = "Show FOV", Value = false}, "ShowFOVAimbot", "Shows the FOV of the Aimbot", true, true)
    Create(AimbotSection, "Checkbox", {Label = "Show Target", Value = false, Callback = function(self, bool)
        if not bool then
            AimbotHighlight.Adornee = nil
            ShowInformation(nil)
        end
    end}, "ShowTargetAB", "Shows aimbot target", true, true)
    Create(AimbotSection, "SliderProgress", {Label = "FOV Size", Value = 500, Minimum = 10, Maximum = 500, Format = "%.f"}, "FOVSizeAimbot", "Change how big the FOV is")
    Create(AimbotSection, "Combo", {Label = "Hit Part", Selected = 1, Items = {"Head", "Torso"}}, "AimbotHitPart", "What to aim to & hit")
end
local SilentAimSection = CreateRegion(Ranged, "Silent Aim") do --// Silent Aim
    Create(SilentAimSection, "Checkbox", {Label = "Silent Aim", Value = false}, "SilentAim", "Manipulates arrow to always hit", true)
    Create(SilentAimSection, "Checkbox", {Label = "Show FOV", Value = false}, "ShowFOV", "Shows the FOV of the Silent Aim", true, true)
    Create(SilentAimSection, "SliderProgress", {Label = "FOV Size", Value = 500, Minimum = 10, Maximum = 500, Format = "%.f"}, "FOVSize", "Change how big the FOV is")
    Create(SilentAimSection, "Checkbox", {Label = "Resolver", Value = false}, "Resolver", "Resolves the target and get their real position", true)
    Create(SilentAimSection, "Checkbox", {Label = "Show Target", Value = false, Callback = function(self, bool)
        if not bool then
            SilentAimHighlight.Adornee = nil
            ShowInformation(nil)
        end
    end}, "ShowTargetSA", "Shows silent aim target", true, true)
    Create(SilentAimSection, "Combo", {Label = "Check Type", Selected = 1, Items = {"Closest To Mouse", "Closest To Arrow", "Only Redirect To Target"}}, "ClosestType", "Explantory")
    Create(SilentAimSection, "Combo", {Label = "Hit Part", Selected = 1, Items = {"Head", "Torso", "Random"}}, "SilentHitPart", "What to aim to & hit")
    Create(SilentAimSection, "SliderProgress", {Label = "Hit Chance", Value = 100, Minimum = 1, Maximum = 100, Format = "%.f%%"}, "HitChance", "Chance to hit")
    Create(SilentAimSection, "SliderProgress", {Label = "Range", Value = 19, Minimum = 1, Maximum = 19, Format = "%.f studs"}, "SilentAimRange", "How to far detect")
end
Ranged:Separator({Text = "Modifications"})
local ModificationsSection = CreateRegion(Ranged, "") do --// Mods
    Create(ModificationsSection, "Checkbox", {Label = "No Spread", Value = false, Callback = function(_, bool)
        if bool then
            modifyRanged("minSpread",0)
            modifyRanged("maxSpread",0)
        else
            revertRanged("minSpread")
            revertRanged("maxSpread")
        end
    end}, "NoSpread", "No projectile spread", true)
    Create(ModificationsSection, "Checkbox", {Label = "No Recoil", Value = false, Callback = function(_, bool)
        if bool then
            modifyRanged("recoilAmount",0)
        else
            revertRanged("recoilAmount")
        end
    end}, "NoRecoil", "No projectile recoil", true)
    Create(ModificationsSection, "Checkbox", {Label = "No Gravity", Value = false, Callback = function(_, bool)
        if bool then
            modifyRanged("gravity",Vector3.new(0,0,0))
        else
            revertRanged("gravity")
        end
    end}, "NoGravity", "No projectile gravity", true)
    Create(ModificationsSection, "Checkbox", {Label = "No Reload Cancel", Value = false}, "NoReloadCancel", "No ranged reload cancel", true)
    Create(ModificationsSection, "Checkbox", {Label = "No Reload Slowdown", Value = false, Callback = function(_, bool)
        if bool then
            modifyRanged("reloadWalkSpeedMultiplier",1)
        else
            revertRanged("reloadWalkSpeedMultiplier")
        end
    end}, "NoReloadSlow", "No slowdown on reload", true)
    Create(ModificationsSection, "Checkbox", {Label = "Instant Charge", Value = false, Callback = function(_, bool)
        if bool then
            modifyRanged("chargeOnDuration", 0.01)
            modifyRanged("chargeOffDuration", 0.01)
        else
            revertRanged("chargeOnDuration")
            revertRanged("chargeOffDuration")
        end
    end}, "InstantCharge", "No charge time", true)
    Create(ModificationsSection, "Checkbox", {Label = "Infinite Range", Value = false, Callback = function(_, bool)
        if bool then
            modifyRanged("maxDistance", 10000)
        else
            revertRanged("maxDistance")
        end
    end}, "InfiniteRange", "Shoot very fair", true)
    Create(ModificationsSection, "Checkbox", {Label = "Wallbang", Value = false}, "Wallbang", "Ignore walls and only hit players", true)
    Create(ModificationsSection, "Checkbox", {Label = "Always Head", Value = false}, "AlwaysHead", "Always hit head even if you hit other parts", true)
    Create(ModificationsSection, "Combo", {Label = "Hit Hit Effect", Selected = 1, Items = {"None", "Blackhole", "Bubble", "Flame", "Glow", "Ground Spiral", "Impact", "KO", "MLG", "Shock Bubble", "Shockwave", "Shockwave Explosion", "Slash", "Soul Slash", "Sparkles", "Sparks", "Spiral", "Spiral Slash", "Shine", "Summon", "Supernova", "Tornado", "Zzz"}}, "HitEffect", "When arrow lands, show an effect", false, true, false, Color3.fromRGB(87, 112, 255))
end

--// Visuals Tab
local ESPSection = CreateRegion(Visuals, "ESP") do
    Create(ESPSection, "Checkbox", {Label = "Enabled", Value = false}, "ESP", "Show enemies locations", true)
    Create(ESPSection, "SliderProgress", {Label = "Max Distance", Value = 5000, Minimum = 250, Maximum = 5000, Format = "%.f studs"}, "ESPMaxDistance", "How far does the ESP goes")
    ESPSection:Separator({Text = "Configuration"})
    Create(ESPSection, "Checkbox", {Label = "Box", Value = false}, "Boxes", "Show enemies location as boxes", true, true)
    Create(ESPSection, "Checkbox", {Label = "Name", Value = false}, "Names", "Show enemies names", true, true)
    Create(ESPSection, "Checkbox", {Label = "Health", Value = false}, "Health", "Show enemies health", true, true, false, Color3.fromRGB(0, 255, 0))
    Create(ESPSection, "Checkbox", {Label = "Indicators", Value = false}, "Indicators", "Show indicators", true, true)
    Create(ESPSection, "Combo", {Label = "Types", Selected = 1, Items = {"None", "Tool", "Distance", "Both"}}, "ESPTypes", "Type of ESP")
    ESPSection:Separator({Text = "Out Of FOV"})
    Create(ESPSection, "Checkbox", {Label = "Enabled", Value = false}, "OutOfFOV", "Show enemies that are out of your field of view", true, true)
    Create(ESPSection, "SliderProgress", {Label = "Size", Value = 15, Minimum = 10, Maximum = 15, Format = "%.f"}, "OutFOVSize", "How big the indicator is")
    Create(ESPSection, "SliderProgress", {Label = "Offset", Value = 400, Minimum = 100, Maximum = 700, Format = "%.f"}, "OutFOVOffset", "The offset of the indicator")
    Create(ESPSection, "Combo", {Label = "Settings", Selected = 1, Items = {"None", "Outline", "Blinking", "Both"}}, "OFFSettings", "Type of indicator")
    ESPSection:Separator({Text = "Utility ESP"})
    Create(ESPSection, "Checkbox", {Label = "Enabled", Value = false}, "UtilityESP", "Show utilities locations", true)
    Create(ESPSection, "SliderProgress", {Label = "Max Distance", Value = 5000, Minimum = 250, Maximum = 5000, Format = "%.f studs"}, "UtilityESPMaxDistance", "How far does the ESP goes")
    ESPSection:Separator({Text = "Configuration"})
    Create(ESPSection, "Checkbox", {Label = "C4", Value = false}, "C4", "Show C4", true, true)
    Create(ESPSection, "Checkbox", {Label = "Grenade", Value = false}, "Grenade", "Show grenades", true, true)
    Create(ESPSection, "Checkbox", {Label = "Claymore", Value = false}, "Claymore", "Show claymore", true, true)
    Create(ESPSection, "Checkbox", {Label = "Bear Trap", Value = false}, "Beartrap", "Show Bear Trap", true, true)
    
    function New(Type, Outline, Name)
        local drawing = Drawing.new(Type)
        for i, v in pairs(ESPSettings[Type]) do
            drawing[i] = v
        end
        if Outline then
            drawing.Color = Color3.new(0, 0, 0)
            drawing.Thickness = 3
        end
        return drawing
    end
    
    local PlrConnections = {}
    function Add(Player)
        PlrConnections[Player] = Player.CharacterAdded:Connect(function(Character)
            local PlayerDrawing = PlayerDrawings[Player]
            if PlayerDrawing then
                PlayerDrawing.RootPart = Character:WaitForChild("HumanoidRootPart")
                PlayerDrawing.Humanoid = Character:WaitForChild("Humanoid")
            end
        end)

        if not PlayerDrawings[Player] then
            local Character = Player.Character

            PlayerDrawings[Player] = {
                Offscreen = New("Triangle", nil, "Offscreen"),
                Name = New("Text", nil, "Name"),
                Tool = New("Text", nil, "Tool"),
                Distance = New("Text", nil, "Distance"),
                BoxOutline = New("Square", true, "BoxOutline"),
                Box = New("Square", nil, "Box"),
                HealthOutline = New("Line", true, "HealthOutline"),
                Health = New("Line", nil, "Health"),

                RootPart = Character and Character:FindFirstChild("HumanoidRootPart"),
                Humanoid = Character and Character:FindFirstChild("Humanoid")
            }
        end
    end

    function AddUtility(Utility, Name)
        if not UtilityDrawings[Utility] then
            UtilityDrawings[Utility] = {
                Name = New("Text", nil, "Name"),
                Box = New("Square", nil, "Box"),
                BoxOutline = New("Square", true, "BoxOutline"),
                Distance = New("Text", nil, "Distance"),
                
                ObjectName = Name,
            }
        end 
    end
    
    for _, Player in pairs(Players:GetPlayers()) do
        if Player ~= LocalPlayer then
            Add(Player)
        end
    end
    
    Players.PlayerAdded:Connect(Add)
    Players.PlayerRemoving:Connect(function(Player)
        if PlayerDrawings[Player] then
            for i, v in pairs(PlayerDrawings[Player]) do
                if v then
                    v:Remove()
                end
            end
    
            if PlrConnections[Player] then
                PlrConnections[Player]:Disconnect()
            end
            
            PlayerDrawings[Player] = nil
        end
    end)

    local function Check(Utility)
        if Utility.Name == "PlacedClaymore" then
            AddUtility(Utility, "Claymore")
        end

        if Utility.Name == "utility7Proxy" then
            AddUtility(Utility, "C4")
        end

        if Utility.Name == "utility5Proxy" then
            AddUtility(Utility, "Grenade")
        end

        if Utility.Name == "OpenBearTrap" then
            AddUtility(Utility, "Bear Trap")
        end
    end

    for i, v in pairs(Map:GetChildren()) do
        Check(v)
    end

    for i, v in pairs(EffectsJunk:GetChildren()) do
        Check(v)
    end

    Map.ChildAdded:Connect(function(Utility)
        Check(Utility)
    end)
    
    EffectsJunk.ChildAdded:Connect(function(Utility)
        Check(Utility)
    end)

    Map.ChildRemoved:Connect(function(Utility)
        if UtilityDrawings[Utility] then
            for i, v in pairs(UtilityDrawings[Utility]) do
                if i ~= "ObjectName" and v then
                    v:Remove()
                end
            end
    
            UtilityDrawings[Utility] = nil
        end
    end)

    EffectsJunk.ChildRemoved:Connect(function(Utility)
        if UtilityDrawings[Utility] then
            for i, v in pairs(UtilityDrawings[Utility]) do
                if i ~= "ObjectName" and v then
                    v:Remove()
                end
            end
    
            UtilityDrawings[Utility] = nil
        end
    end)

    local function Rotate(point, center, angle)
        angle = math.rad(angle)
        return Vector2.new(
            math.floor(math.cos(angle) * (point.X - center.X) - math.sin(angle) * (point.Y - center.Y) + center.X),
            math.floor(math.sin(angle) * (point.X - center.X) + math.cos(angle) * (point.Y - center.Y) + center.Y)
        )
    end

    local function Draw(Name, Box, BoxOutline, Distance, ObjectName, BoxSize, BoxPos, Dist, BottomOffset, ClassName)
        Name.Text = ObjectName
        Name.Position = Vector2.new(BoxSize.X / 2 + BoxPos.X, BoxPos.Y - 16)
        Name.Color = Colors[ClassName] or Color3.new(1, 1, 1)
        Name.Font = 3
        Name.Visible = true
        Name.ZIndex = 1

        Box.Size = BoxSize
        Box.Position = BoxPos
        Box.Visible = true
        Box.Color = Colors[ClassName] or Color3.new(1, 1, 1)
        Box.ZIndex = 1

        BoxOutline.Size = BoxSize
        BoxOutline.Position = BoxPos
        BoxOutline.Visible = true
        BoxOutline.ZIndex = 0

        Distance.Text = math.floor(Dist) .. "m"
        Distance.Position = Vector2.new(BoxSize.X / 2 + BoxPos.X, BottomOffset)
        Distance.Color = Colors[ClassName] or Color3.new(1, 1, 1)
        Distance.Font = 3
        Distance.Visible = true
        Distance.ZIndex = 1
    end

    Framework:BindToRenderStep(LPH_JIT_MAX(function()
        for i, v in pairs(UtilityDrawings) do
            if not v then continue end

            for i, drawing in pairs(v) do
                if i ~= "ObjectName" then
                    drawing.Visible = false
                end
            end

            if not Classes.UtilityESP.Value then
                continue
            end

            local Root = i
            local Distance = (Camera.CFrame.Position - Root.Position).Magnitude

            if Classes.UtilityESPMaxDistance.Value < Distance then
                continue
            end

            local Pos, OnScreen = Camera:WorldToViewportPoint(Root.Position)
            if OnScreen then
                local Size = (Camera:WorldToViewportPoint(Root.Position - Vector3.new(0, 3, 0)).Y - Camera:WorldToViewportPoint(Root.Position + Vector3.new(0, 2.6, 0)).Y) / 2
                local BoxSize = Vector2.new(math.floor(Size), math.floor(Size))
                local BoxPos = Vector2.new(math.floor(Pos.X - Size / 2), math.floor(Pos.Y - Size / 2))

                local Name = v.Name
                local Box = v.Box
                local BoxOutline = v.BoxOutline
                local Dist = v.Distance

                local ObjectName = v.ObjectName

                local BottomOffset = BoxSize.Y + BoxPos.Y + 1

                if Classes.C4.Value and ObjectName == "C4" then
                    Draw(Name, Box, BoxOutline, Dist, ObjectName, BoxSize, BoxPos, Distance, BottomOffset, "C4")
                end

                if Classes.Grenade.Value and ObjectName == "Grenade" then
                    Draw(Name, Box, BoxOutline, Dist, ObjectName, BoxSize, BoxPos, Distance, BottomOffset, "Grenade")
                end

                if Classes.Claymore.Value and ObjectName == "Claymore" then
                    Draw(Name, Box, BoxOutline, Dist, ObjectName, BoxSize, BoxPos, Distance, BottomOffset, "Claymore")
                end

                if Classes.Beartrap.Value and ObjectName == "Bear Trap" then
                    Draw(Name, Box, BoxOutline, Dist, ObjectName, BoxSize, BoxPos, Distance, BottomOffset, "Beartrap")
                end
            end
        end

        for _, Player in pairs(Players:GetPlayers()) do
            local PlayerDrawing = PlayerDrawings[Player]
            if not PlayerDrawing then continue end
    
            for Ind, Drawing in pairs(PlayerDrawing) do
                if Ind ~= "RootPart" and Ind ~= "Humanoid" then
                    Drawing.Visible = false
                end
            end
    
            if not Classes.ESP.Value then
                continue
            end
    
            local RootPart = PlayerDrawing.RootPart
            local Humanoid = PlayerDrawing.Humanoid
            if not Player.Character or not RootPart or not Humanoid then continue end
    
            local DistanceFromCharacter = (Camera.CFrame.Position - RootPart.Position).Magnitude
            if Classes.ESPMaxDistance.Value < DistanceFromCharacter then
                continue
            end
    
            local Pos, OnScreen = Camera:WorldToViewportPoint(RootPart.Position)
            if not OnScreen then
                local RootPos = RootPart.Position
                local CameraVector = Camera.CFrame.Position
                local LookVector = Camera.CFrame.LookVector
                local Dot = LookVector:Dot(RootPos - CameraVector)
    
                if Dot <= 0 then
                    RootPos = CameraVector + ((RootPos - CameraVector) - ((LookVector * Dot) * 1.01))
                end
    
                local ScreenPos, OnScreen = Camera:WorldToScreenPoint(RootPos)
                if not OnScreen then
                    local Drawing = PlayerDrawing.Offscreen
                    local FOV = 800 - Classes.OutFOVOffset.Value
                    local Size = Classes.OutFOVSize.Value
                    local Center = Camera.ViewportSize / 2
                    local Direction = (Vector2.new(ScreenPos.X, ScreenPos.Y) - Center).Unit
                    local Radian = math.atan2(Direction.X, Direction.Y)
                    local Angle = (((math.pi * 2) / FOV) * Radian)
                    local ClampedPosition = Center + (Direction * math.min(
                        math.abs(((Center.Y - FOV) / math.sin(Angle)) * FOV),
                        math.abs((Center.X - FOV) / (math.cos(Angle)) / 2)
                    ))
                    local Point = Vector2.new(
                        math.floor(ClampedPosition.X - (Size / 2)),
                        math.floor((ClampedPosition.Y - (Size / 2) - 15))
                    )
    
                    local OFFSettings = Classes.OFFSettings.Value
                    local Rotation = math.floor(-math.deg(Radian)) - 47
                    Drawing.PointA = Rotate(Point + Vector2.new(Size, Size), Point, Rotation)
                    Drawing.PointB = Rotate(Point + Vector2.new(-Size, -Size), Point, Rotation)
                    Drawing.PointC = Rotate(Point + Vector2.new(-Size, Size), Point, Rotation)
                    Drawing.Color = Colors.OutOfFOV or Color3.new(1, 1, 1)
                    Drawing.Filled = not ((OFFSettings == "Outline" or OFFSettings == "Both") or false)
                    Drawing.Transparency = ((OFFSettings == "Blinking" or OFFSettings == "Both") or false)
                        and (math.sin(tick() * 5) + 1) / 2 or 1
                    Drawing.Visible = Classes.OutOfFOV.Value
                end
            else
                local Size = (Camera:WorldToViewportPoint(RootPart.Position - Vector3.new(0, 3, 0)).Y - Camera:WorldToViewportPoint(RootPart.Position + Vector3.new(0, 2.6, 0)).Y) / 2
                local BoxSize = Vector2.new(math.floor(Size * 1.5), math.floor(Size * 1.9))
                local BoxPos = Vector2.new(math.floor(Pos.X - Size * 1.5 / 2), math.floor(Pos.Y - Size * 1.6 / 2))
    
                local Name = PlayerDrawing.Name
                local Tool = PlayerDrawing.Tool
                local Distance = PlayerDrawing.Distance
                local Box = PlayerDrawing.Box
                local BoxOutline = PlayerDrawing.BoxOutline
                local Health = PlayerDrawing.Health
                local HealthOutline = PlayerDrawing.HealthOutline

                Name.ZIndex = 2
                Tool.ZIndex = 2
                Distance.ZIndex = 2
                Box.ZIndex = 2
                BoxOutline.ZIndex = 1
                Health.ZIndex = 2
                HealthOutline.ZIndex = 1
    
                if Classes.Boxes.Value then
                    Box.Size = BoxSize
                    Box.Position = BoxPos
                    Box.Visible = true
                    Box.Color = Colors.Boxes or Color3.new(1, 1, 1)
                    BoxOutline.Size = BoxSize
                    BoxOutline.Position = BoxPos
                    BoxOutline.Visible = true
                end
    
                if Classes.Health.Value then
                    Health.From = Vector2.new((BoxPos.X - 5), BoxPos.Y + BoxSize.Y)
                    Health.To = Vector2.new(Health.From.X, Health.From.Y - (Humanoid.Health / Humanoid.MaxHealth) * BoxSize.Y)
                    Health.Color = Colors.Health or Color3.new(0, 1, 0)
                    Health.Visible = true
                    HealthOutline.From = Vector2.new(Health.From.X, BoxPos.Y + BoxSize.Y + 1)
                    HealthOutline.To = Vector2.new(Health.From.X, Health.From.Y - BoxSize.Y - 1)
                    HealthOutline.Visible = true
                end
    
                if Classes.Names.Value then
                    Name.Text = Player.Name
                    Name.Position = Vector2.new(BoxSize.X / 2 + BoxPos.X, BoxPos.Y - 16)
                    Name.Color = Colors.Names or Color3.new(1, 1, 1)
                    Name.Font = 1
                    Name.Visible = true
                end
    
                if Classes.Indicators.Value then
                    local BottomOffset = BoxSize.Y + BoxPos.Y + 1
                    local ESPType = Classes.ESPTypes.Value
                    if ESPType == "Tool" or ESPType == "Both" then
                        Tool.Text = (Character:FindFirstChildOfClass("Tool") and Character:FindFirstChildOfClass("Tool").Name) or "None"
                        Tool.Position = Vector2.new(BoxSize.X / 2 + BoxPos.X, BottomOffset)
                        Tool.Color = Colors.Indicators or Color3.new(1, 1, 1)
                        Tool.Font = 1
                        Tool.Visible = true
                        BottomOffset = BottomOffset + 15
                    end
                    if ESPType == "Distance" or ESPType == "Both" then
                        Distance.Text = math.floor(DistanceFromCharacter) .. "m"
                        Distance.Position = Vector2.new(BoxSize.X / 2 + BoxPos.X, BottomOffset)
                        Distance.Color = Colors.Indicators or Color3.new(1, 1, 1)
                        Distance.Font = 1
                        Distance.Visible = true
                    end
                end
            end
        end
    end))
end

local LightingSection = CreateRegion(Visuals, "Lighting") do
    if not Lighting:FindFirstChild("atmosphere") then
        Instance.new("Atmosphere", Lighting).Name = "atmosphere"
    end

    local originalAtmosphere = {
        Density = Lighting.atmosphere.Density,
        Decay = Lighting.atmosphere.Decay,
        Offset = Lighting.atmosphere.Offset,
        Glare = Lighting.atmosphere.Glare,
        Haze = Lighting.atmosphere.Haze
    }

    Create(LightingSection, "Checkbox", {Label = "World Ambience", Value = false}, "Ambience", "Changes ambience", true, true)
    Create(LightingSection, "Checkbox", {Label = "Color Correction", Value = false}, "ColorCorrection", "Changes Color Correction", true, true)
    Create(LightingSection, "Combo", {Label = "Skybox", Selected = 1, Items = {"None", "Nebula","Vaporwave","Clouds","Twilight"}}, "Skybox", "Changes Skybox")
    Create(LightingSection, "Checkbox", {Label = "Clock Time", Value = false}, "ClockTime", "Changes Clock Time", true)
    Create(LightingSection, "Checkbox", {Label = "Max Zoom", Value = false}, "MaxZoom", "Changes Max Zoom", true)
    Create(LightingSection, "Checkbox", {Label = "Field Of View", Value = false, Callback = function(_, bool)
        if not bool then
            Camera.FieldOfView = 70
        end
    end}, "FieldOfView", "Changes FOV", true)
    Create(LightingSection, "Checkbox", {Label = "Brightness", Value = false}, "Brightness", "Changes Brightness", true)
    Create(LightingSection, "Checkbox", {Label = "Environmental", Value = false}, "Environmental", "Changes Environmental Effects", true)
    Create(LightingSection, "Checkbox", {Label = "Exposure Compensation", Value = false}, "Exposure", "Changes Exposure Effects", true)
    Create(LightingSection, "SliderProgress", {Label = "Time", Value = 12, Minimum = 1, Maximum = 24, Format = "%.f"}, "Time", "The time for Clock Time")
    Create(LightingSection, "SliderProgress", {Label = "FOV Value", Value = 70, Minimum = 1, Maximum = 120, Format = "%.f"}, "FOVLighting", "Your field of view")
    Create(LightingSection, "SliderProgress", {Label = "Brightness", Value = 2, Minimum = 1, Maximum = 10, Format = "%.f"}, "BrightnessValue", "How bright you want it to be")
    Create(LightingSection, "SliderProgress", {Label = "Exposure", Value = 0, Minimum = 0, Maximum = 10, Format = "%.f"}, "ExposureValue", "Exposure scale")
    Create(LightingSection, "SliderProgress", {Label = "Diffuse % Specular", Value = 1, Minimum = 0, Maximum = 1, Format = "%.1f"}, "EnvironmentValue", "Effect Scale")
    Create(LightingSection, "SliderProgress", {Label = "Max Zoom Value", Value = 24, Minimum = 1, Maximum = 1000, Format = "%.f studs"}, "MaxZoomVal", "How far you want to zoom out to")

    LightingSection:Separator({Text = "Fog"})

    Create(LightingSection, "Checkbox", {Label = "Fog", Value = false}, "Fog", "Enables Fog", true, true)
    Create(LightingSection, "SliderProgress", {Label = "Density", Value = 1, Minimum = 0, Maximum = 1, Format = "%.2f"}, "Density", "Fog Density")
    Create(LightingSection, "SliderProgress", {Label = "Glare", Value = 0, Minimum = 0, Maximum = 10, Format = "%.f"}, "Glare", "Fog Glare")
    Create(LightingSection, "SliderProgress", {Label = "Haze", Value = 0, Minimum = 0, Maximum = 10, Format = "%.f"}, "Haze", "Fog Haze")

    local FOVConnection; FOVConnection = Camera:GetPropertyChangedSignal("FieldOfView"):Connect(function()
        if not Active then FOVConnection:Disconnect(); return end
        if Classes.FieldOfView.Value then
            Camera.FieldOfView = Classes.FOVLighting.Value
        end
    end)

    local ColorCorrection = Lighting:FindFirstChildOfClass("ColorCorrectionEffect") or Instance.new("ColorCorrectionEffect")
    local OldCorrection = ColorCorrection.TintColor
    local OldAmbience         = Lighting.OutdoorAmbient
    local OldAmbience2        = Lighting.Ambient
    local OldDiffuse         = Lighting.EnvironmentDiffuseScale
    local OldDiffuse2         = Lighting.EnvironmentSpecularScale
    local OldBrightness         = Lighting.Brightness
    local OldExposure         = Lighting.ExposureCompensation
    local OldClock            = Lighting.ClockTime
    local OldZoom             = LocalPlayer.CameraMaxZoomDistance

    Map.ChildAdded:Connect(function(map)
        task.wait(3)
        if map:GetAttribute("MapId") then
            ColorCorrection     = Lighting:FindFirstChildOfClass("ColorCorrectionEffect") or Instance.new("ColorCorrectionEffect")
            OldCorrection       = ColorCorrection.TintColor
            OldAmbience         = Lighting.OutdoorAmbient
            OldAmbience2        = Lighting.Ambient
            OldDiffuse          = Lighting.EnvironmentDiffuseScale
            OldDiffuse2         = Lighting.EnvironmentSpecularScale
            OldBrightness       = Lighting.Brightness
            OldExposure         = Lighting.ExposureCompensation
            OldClock            = Lighting.ClockTime
            OldZoom             = LocalPlayer.CameraMaxZoomDistance
        end
    end)

    OldCorrection = ColorCorrection.TintColor

    Framework:BindToRenderStep(LPH_NO_VIRTUALIZE(function()
        if not Lighting:FindFirstChild("atmosphere") then
            Instance.new("Atmosphere", Lighting).Name = "atmosphere"
        end

        local Sky = Lighting:FindFirstChildOfClass("Sky")
        if not Sky then
            return
        end
    
        local Skybox = Skyboxes[Classes.Skybox.Value]
    
        for i,v in next, Skybox do
            Sky[i] = v
        end

        if Classes.FieldOfView.Value then
            Camera.FieldOfView = Classes.FOVLighting.Value
        end

        if Classes.Fog.Value then
            Lighting.atmosphere.Density = Classes.Density.Value
            Lighting.atmosphere.Decay = Colors["Fog"] or Color3.new(1,1,1)
            Lighting.atmosphere.Offset = 1
            Lighting.atmosphere.Glare = Classes.Glare.Value
            Lighting.atmosphere.Haze = Classes.Haze.Value
        else
            for i, v in pairs(originalAtmosphere) do
                Lighting.atmosphere[i] = v
            end
        end

        if Classes.Ambience.Value then
            Lighting.OutdoorAmbient = Colors["Ambience"] or Color3.new(1,1,1)
            Lighting.Ambient = Colors["Ambience"] or Color3.new(1,1,1)
        else
            Lighting.OutdoorAmbient = OldAmbience
            Lighting.Ambient = OldAmbience2
        end

        if Classes.MaxZoom.Value then
            LocalPlayer.CameraMaxZoomDistance = Classes.MaxZoomVal.Value
        else
            LocalPlayer.CameraMaxZoomDistance = OldZoom
        end

        if Classes.ClockTime.Value then
            Lighting.ClockTime = Classes.Time.Value
        else
            Lighting.ClockTime = OldClock
        end

        if Classes.ColorCorrection.Value then
            ColorCorrection.Enabled = true
            ColorCorrection.TintColor = Colors["ColorCorrection"] or Color3.new(1,1,1)
        else
            ColorCorrection.Enabled = false
            ColorCorrection.TintColor = OldCorrection
        end

        if Classes.Brightness.Value then
            Lighting.Brightness = Classes.BrightnessValue.Value
        else
            Lighting.Brightness = OldBrightness
        end

        if Classes.Environmental.Value then
            Lighting.EnvironmentDiffuseScale = Classes.EnvironmentValue.Value
            Lighting.EnvironmentSpecularScale = Classes.EnvironmentValue.Value
        else
            Lighting.EnvironmentDiffuseScale = OldDiffuse
            Lighting.EnvironmentSpecularScale = OldDiffuse2
        end

        if Classes.Exposure.Value then
            Lighting.ExposureCompensation = Classes.ExposureValue.Value
        else
            Lighting.ExposureCompensation = OldExposure
        end
    end))
end

--// Misc
local Section = CreateRegion(Misc, "Main") do
    local CratesReversed = {
        skinsCase = "Skins",
        enchantsCase = "Enchants",
        killEffectsCase = "Kill Effects",
        case4 = "Bundles",
        case5 = "Character Auras",
        case6 = "Parry Shields",
        case7 = "Emotes",
        case8 = "Emotes Icon",
        case9 = "Matatibi",
        case10 = "Christmas 2022",
        case11 = "Energy (Credits)",
        case12 = "Energy (Robux)",
        case13 = "Adoration",
        case14 = "Winter 2024 Event Energy"
    }
    
    Create(Section, "Checkbox", {Label = "Killsay", Value = false}, "Killsay", "Cause annoyance and make people delulu trying to talk to you", true)
    Create(Section, "Checkbox", {Label = "Ragebot", Value = false}, "Ragebot", "Automatically shoots and reload for you", true)
    Create(Section, "Checkbox", {Label = "Show Target", Value = false, Callback = function(self, bool)
        if not bool then
            RagebotHighlight.Adornee = nil
            ShowInformation(nil)
        end
    end}, "ShowRageBotTarget", "Show target of ragebot", true)
    Create(Section, "Checkbox", {Label = "Visualize Arrow Line", Value = false}, "ShowLine", "Show line", true, true)
    Create(Section, "Checkbox", {Label = "Visualize Arrow Trajectory", Value = false}, "ShowArrow", "Show arrows path", true)
    Create(Section, "SliderProgress", {Label = "Ragebot Distance", Value = 1000, Minimum = 150, Maximum = 1000, Format = "%.f studs"}, "RagebotDist", "How far to detect player")
    Section:Separator({Text = "Auto"})
    Create(Section, "Checkbox", {Label = "Pathfind", Value = false}, "Pathfind", "Pathfinds to people (enable kill aura)", true)
    Create(Section, "Checkbox", {Label = "Fast respawn", Value = false}, "FastRespawn", "Respawn faster", true)
    Create(Section, "Checkbox", {Label = "Loop Spawn", Value = false}, "LoopSpawn", "Automatically spawns you in", true)
    Create(Section, "SliderProgress", {Label = "Pathfind Speed", Value = 45, Minimum = 1, Maximum = 45, Format = "%.f studs/s"}, "PFSpeed", "How fast to walk in pathfind mode")
    Section:Separator({Text = "Airdrop"})
    Create(Section, "Checkbox", {Label = "Auto Airdrop Claimer", Value = false}, "ClaimAirdrop", "Automatically claims airdrop", true)
    Section:Separator({Text = "Teleports"})
    Create(Section, "Combo", {Label = "Places", Selected = 1, Items = Teleports.Crossroads:GetNames()}, "CRTeleports", "Places to teleport to in crossroads")
    Create(Section, "Button", {Text = "Teleport To Selected", Callback = function()
        Framework:Teleport(Teleports.Crossroads.Teleports[Classes.CRTeleports.Value])
    end}, "TTS", "Teleports to selected place (Crossroads)")
    Section:Separator({Text = "Cosmetics"})
    Create(Section, "Button", {Text = "Get Cat", Callback = function()
        Network:FireServer("ExecuteCommand","getCat",{})
    end}, "GetCat", "Gets a...... CAT!")
    Create(Section, "Button", {Text = "Unlock All Emotes", Callback = function()
        local rodux = Framework:GetState()
        for i,v in Modules.Name["EmotesInOrder"] do
            if typeof(v) == 'table' then
                rodux.OwnedEmotes[v.id] = 1
            end
        end
    end}, "GetEmote", "Unlocks all emotes")
    Create(Section, "Checkbox", {Label = "Squeeze Others Cat", Value = false}, "SqueezeCat", "Squeeze other people's cat", true)
    Create(Section, "Checkbox", {Label = "Regain Network On Anticheat", Value = false}, "Network", "Attempts to regain network when you get Anticheated", true)

    Section:Separator({Text = "Block Spawner"})

    Create(Section, "Label", {Text = "Blocks in character: 0"}, "BlockInCharacter", "Self explanatory")
    Create(Section, "Label", {Text = "Blocks in workspace: 0"}, "BlockInWorkspace", "Self explanatory")
    Create(Section, "Checkbox", {Label = "Loop Spawn Blocks", Value = false}, "LoopSpawnBlocks", "Automatically spawn blocks", true)
    Create(Section, "Button", {Text = "Release Blocks", Callback = function()
        Network:FireServer("SelfDamage", -1, {
            ignoreForcefield = true
        })
    end}, "idontneedtowriteshithere", "Release the blocks on your character")

    Section:Separator({Text = "Crates"})

    Create(Section, "InputText", {Label = "Case Id", Placeholder = "Look in the discord for ids"}, "CaseId", "Case to open")
    Create(Section, "SliderProgress", {Label = "Open Amount", Value = 10, Minimum = 1, Maximum = 10, Format = "%.f time(s)"}, "CaseAmount", "How many cases to open")
    Create(Section, "Button", {Text = "Open Case", Callback = function()
        local Found = false
        for i, v in Modules.Name["CaseIds"] do
            if v == Classes.CaseId.Value then
                Found = true
                break
            end
        end
        if Found then
            local Success, Response = Network:InvokeServer("PurchaseCase", Classes.CaseId.Value, Classes.CaseAmount.Value)
            if Success then
                setthreadidentity(2)
                Modules.Name["ToastNotificationActionsClient"].add("success", `Opened {tostring(Classes.CaseAmount.Value)} case(s) of {CratesReversed[Classes.CaseId.Value]}`, 2)(Modules.Name["RoduxStore"].store)
                Modules.Name["SoundHandler"].playSound({
                    soundObject = ReplicatedStorage.Shared.Assets.Sounds.Success,
                    parent = Workspace.Sounds
                })
                setthreadidentity(7)
            else
                setthreadidentity(2)
                Modules.Name["ToastNotificationActionsClient"].add("error", Response, 2, true)(Modules.Name["RoduxStore"].store)
                setthreadidentity(7)
            end
        end
    end}, "CrateOpen", "Opens specified amount of crates")

    Map.ChildAdded:Connect(LPH_NO_VIRTUALIZE(function(Airdrop)
        local Character = LocalPlayer.Character
        if not Character then return end
        local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
        if not HumanoidRootPart then return end
        if not Airdrop:GetAttribute("MapId") and Airdrop.Name:match("Airdrop") then
            task.wait(0.5)
            local ProximityPrompt: ProximityPrompt = Airdrop:FindFirstChild("ProximityPrompt", true)
            if ProximityPrompt and ProximityPrompt.ActionText ~= "Verify Biometrics" and ProximityPrompt.ObjectText ~= "Verify Biometrics" then
                local Hitbox = ProximityPrompt.Parent
                if Classes.ClaimAirdrop.Value then
                    local RayResult
                    local RayParams = RaycastParams.new()
                    RayParams.FilterType = Enum.RaycastFilterType.Exclude
                    RayParams:AddToFilter(Airdrop)

                    repeat 
                        task.wait() 
                        firetouchinterest(Character.Head, Hitbox, 0)
                        task.wait()
                        firetouchinterest(Character.Head, Hitbox, 1)
                        local HitboxRay = Workspace:Raycast(Hitbox.Position, Vector3.new(0, -10, 0), RayParams)
                        if HitboxRay then
                            RayResult = HitboxRay
                        end
                    until RayResult or not Character.Parent

                    if not Character.Parent then return end

                    ClaimingAirdrop = true
                    Framework:Teleport(CFrame.new(RayResult.Position + Vector3.new(0, 4, 0)))

                    local Attachment = Instance.new("Attachment", Workspace.Terrain)
                    
                    local TweenGoing = true
                    local A; A = RunService.RenderStepped:Connect(function()
                        if not Active or not Attachment or not Attachment.Parent then
                            A:Disconnect()
                            return
                        end
                        if TweenGoing then
                            HumanoidRootPart.Velocity = Vector3.new(0,0,0)
                            HumanoidRootPart.RotVelocity = Vector3.new(0,0,0)
                        end
                        if not TweenGoing then
                            Attachment.WorldCFrame = Camera.CFrame * CFrame.new(0,0,-5)
                        end
                    end)

                    ProximityPrompt.Parent = Attachment
                    TweenGoing = false

                    ProximityPrompt.MaxActivationDistance = 9e9

                    while ProximityPrompt.Parent or not Character.Parent do
                        task.wait(2)
                        ProximityPrompt:InputHoldEnd()
                        HumanoidRootPart.CFrame = CFrame.new(Hitbox.Position) * CFrame.new(0, 4, 0)
                        ProximityPrompt:InputHoldBegin()
                    end

                    Attachment:Destroy()
                    ClaimingAirdrop = false
                end
            end
        end
    end))

    EffectsJunk.ChildAdded:Connect(LPH_NO_VIRTUALIZE(function(Grenade)
        local Character = LocalPlayer.Character
        if not Character then return end
        local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
        if not HumanoidRootPart then return end
        if (Grenade.Name == "utility5Proxy" or Grenade.Name == "utility7Proxy") and Classes.Pathfind.Value then
            local LastCF = HumanoidRootPart.CFrame
            while RunService.RenderStepped:Wait() do
                if Grenade:IsDescendantOf(game)  then
                    if Grenade.Name == "utility7Proxy" and Grenade:GetAttribute("HasBeepingVisuals") then
                        continue
                    end
    
                    if not GrenadeNear then
                        LastCF = HumanoidRootPart.CFrame
                    else
                        HumanoidRootPart.CFrame = CFrame.new(LastCF.X, 500, LastCF.Z)
                    end
    
                    if Framework:IsPartClose(Grenade, 15) then
                        GrenadeNear = true
                    end
                else
                    break
                end
            end
            GrenadeNear = false
            HumanoidRootPart.CFrame = LastCF
        end
    end))

    Framework:BindToRenderStep(LPH_NO_VIRTUALIZE(function()
        local BlocksCount = 0
        for i, v in pairs(EffectsJunk:GetChildren()) do
            if v.Name == "Stomp" then
                BlocksCount += 3
            end
        end
        Classes.BlockInCharacter.Text = "Blocks In Character: "..tostring(CurrentBlocksNumber)
        Classes.BlockInWorkspace.Text = "Blocks In Workspace: "..tostring(BlocksCount)

        if Classes.FastRespawn.Value then
            local Character = LocalPlayer.Character
            if Character then
                local Humanoid = Character:FindFirstChild("Humanoid")
                if Humanoid and Humanoid.Health == 0 then 
                    Network:FireServer("StartFastRespawn")
                    Network:InvokeServer("CompleteFastRespawn")
                end
            end
        end
    end))

    Framework:BindToRenderStep(LPH_NO_VIRTUALIZE(function()
        if Classes.LoopSpawn.Value then
            if Framework:InMenu(LocalPlayer) then
                Modules.Name["SpawnHandlerClient"].spawnCharacter(true)
            end
        end
        if Classes.SqueezeCat.Value then
            for i,v in pairs(Players:GetPlayers()) do
                if (v ~= LocalPlayer and v.Character and v.Character:FindFirstChild("Cat")) then
                    Network:FireServer("SqueezeCat",v.Character.Cat)
                end
            end
        end
    end), 1)

    Framework:BindToRenderStep(LPH_NO_VIRTUALIZE(function() 
        if Classes.LoopSpawnBlocks.Value then
            local Character = LocalPlayer.Character
            if Character then
                local Stomp = Character:FindFirstChild("Stomp")
                if Stomp then
                    CurrentBlocksNumber += 3
                    SpawnBlock(Stomp)
                end
            end
        end
    end), 2)

    local KillSayStuff = Data.KillSayStuff
    local MockHandler = Modules.Name["MockPlayerHandler"]
    local KillStreak = Modules.Name["KillStreakConfigs"]

    if executor ~= "Velocity" then
        local realNames = {}
        local listNames = {}
    
        local PlayerScrollList = Framework:WaitForDescendant(CoreGui, "PlayerScrollList", function(inst)
            if inst:IsA("Frame") and inst:FindFirstChild("SizeOffsetFrame") then 
                return true 
            end
            return
        end)
        local ScrollerFrame = PlayerScrollList.SizeOffsetFrame.ScrollingFrameContainer.ScrollingFrameClippingFrame.ScollingFrame.OffsetUndoFrame
    
        Framework:BindToRenderStep(LPH_JIT_MAX(function()
            if (Classes.HidePlayerNames.Value and Classes.StreamerMode.Value) then
                for i,v in pairs(ScrollerFrame:GetChildren()) do
                    if not listNames[v] then
                        local text = v.ChildrenFrame.NameFrame.BGFrame.OverlayFrame.PlayerName.PlayerName.Text
                        listNames[v] = text
                        v.ChildrenFrame.NameFrame.BGFrame.OverlayFrame.PlayerName.PlayerName.Text = "surge.lol"
                    else
                        v.ChildrenFrame.NameFrame.BGFrame.OverlayFrame.PlayerName.PlayerName.Text = "surge.lol"
                    end
                end
            elseif (not Classes.HidePlayerNames.Value or not Classes.StreamerMode.Value) then
                for i,v in pairs(ScrollerFrame:GetChildren()) do
                    if (listNames[v] and v:FindFirstChild("ChildrenFrame")) then
                        v.ChildrenFrame.NameFrame.BGFrame.OverlayFrame.PlayerName.PlayerName.Text = listNames[v]
                    end
                end
            end
            for i,v in pairs(Players:GetPlayers()) do
                if v:GetAttribute('FakePlayer') then continue end
                if (Classes.HidePlayerNames.Value and Classes.StreamerMode.Value) then
                    if not realNames[v] then
                        realNames[v] = {v.Name,v.DisplayName}
                        if v == LocalPlayer then
                            v.Name = "surge.lol"
                            v.DisplayName = "surge.lol"
                        else
                            v.Name = "non-surge.lol user"
                            v.DisplayName = "non-surge.lol user"
                        end
                        if v.Character then
                            local hum = v.Character:FindFirstChildOfClass("Humanoid")
                            if hum then
                                hum.DisplayName = "non-surge.lol user"
                            end
                        end
                    else
                        if v == LocalPlayer then
                            v.Name = "surge.lol"
                            v.DisplayName = "surge.lol"
                        else
                            v.Name = "non-surge.lol user"
                            v.DisplayName = "non-surge.lol user"
                        end
                        if v.Character then
                            local hum = v.Character:FindFirstChildOfClass("Humanoid")
                            if hum then
                                hum.DisplayName = "non-surge.lol user"
                            end
                        end
                    end
                elseif (not Classes.HidePlayerNames.Value or not Classes.StreamerMode.Value) then
                    if realNames[v] then
                        v.Name = realNames[v][1]
                        v.DisplayName = realNames[v][2] or ""
                        if v.Character then
                            local hum = v.Character:FindFirstChildOfClass("Humanoid")
                            if hum then
                                hum.DisplayName = v.DisplayName == "" and realNames[v][1] or v.DisplayName
                            end
                        end
                        realNames[v] = nil
                    end
                end
            end
        end))
    
        local fakeCharacter = Instance.new("Model")
        fakeCharacter.Name = "non-surge.lol user"
    
        local ItemAdded = getupvalue(Modules.Name["DamageHandlerClient"]._startModule, 7)
        CurrentIdx = getupvalue(ItemAdded, 1)
    
        local getcallbackvalue = getcallbackvalue or function() return end
        local callback = getcallbackvalue(TextChatService, "OnIncomingMessage")
    
        if callback then
            TextChatService.OnIncomingMessage = function(obj)
                setthreadidentity(2)
                local iboughtaproperty = callback(obj)
                local source = obj.TextSource
                if source and Classes.StreamerMode.Value and Classes.HidePlayerNames.Value then
                    iboughtaproperty.PrefixText = "<font color=\"rgb(255, 119, 119)\">non-surge.lol user</font>"
                    if source.UserId ~= LocalPlayer.UserId then
                        iboughtaproperty.PrefixText = "<font color=\"rgb(255, 119, 119)\">non-surge.lol user</font>"
                    else
                        iboughtaproperty.PrefixText = "<font color=\"rgb(100, 83, 255)\">surge.lol:</font>"
                    end
                end
                setthreadidentity(7)
                return iboughtaproperty
            end
        end
    end

    local old = Modules.Name["RoduxStore"].store.dispatch
        Modules.Name["RoduxStore"].store.dispatch = function(table, sigma)
            if typeof(sigma) == "table" then
                if sigma.type == "KILL_FEED_LIST_ADD" then
                    if executor ~= "Velocity" then
                        local payload = sigma.payload
                        local playerThatKilled = payload.playerThatKilled
                        local playerThatDied = payload.playerThatDied
                        if Classes.StreamerMode.Value and Classes.HidePlayerNames then
                            if playerThatKilled == LocalPlayer then
                                payload.item.firstHalfStr = "surge.lol"
                                payload.item.firstHalfStrColor = Color3.fromRGB(0,255,255)
                            else
                                payload.item.firstHalfStr = "non-surge.lol user"
                            end
                            if playerThatDied == LocalPlayer then
                                payload.item.secondHalfStr = "surge.lol"
                                payload.item.secondHalfStrColor = Color3.fromRGB(0,255,255)
                            else
                                payload.item.secondHalfStr = "non-surge.lol user"
                            end
                        end
                
                        if Classes.CustomKillfeedName.Value ~= "" then
                            if playerThatKilled == LocalPlayer then
                                payload.item.firstHalfStr = Classes.CustomKillfeedName.Value
                                payload.item.firstHalfStrColor = Colors.CustomKillfeedName or Color3.fromRGB(0,255,255)
                            end
                            if playerThatDied == LocalPlayer then
                                payload.item.secondHalfStr = Classes.CustomKillfeedName.Value
                                payload.item.secondHalfStrColor = Colors.CustomKillfeedName or Color3.fromRGB(1, 1, 1)
                            end
                        end
                    end
                elseif sigma.type == "FALL_DAMAGE_DISABLED_COUNT_REMOVE" then
                    if Classes.NFD.Value then
                        return
                    end
                elseif sigma.type == "PARRY_IS_PARRIED_CHANGE" or sigma.type == "PARRY_IS_KNEELED_CHANGE" then
                    if Classes.NPS.Value then
                        local JumpPower = Modules.Name["JumpHandlerClient"]
                        local Walkspeed = Modules.Name["WalkSpeedHandlerClient"]
                        local AutoRotate = Modules.Name["AutoRotateHandlerClient"]
                        if JumpPower and Walkspeed and AutoRotate then
                            local WSContainer = Walkspeed.getValueContainer()
                            local JPContainer = JumpPower.getJumpPowerValueContainer()
                            local ARContainer = AutoRotate.getAutoRotateToggleCounter()
                            task.spawn(function()
                                task.wait(0.1)
    
                                DbgWarn("Removing parry effects")
                                
                                Modules.Name["CoreGuiHandlerClient"].toggleBackpack(true)
                                Modules.Name["CoreGuiHandlerClient"].toggleResetButton(true)
    
                                old(table, {
                                    type = "STUN_CLIENT_IS_STUNNED_COUNT_DECREMENT"
                                })
    
                                Modules.Name["ToolHandlerClient"].reEquipToolSet()
                                Modules.Name["EnvironmentCommunication"]:Fire("ToggleAnimationKind", "idle", "parried", false, {
                                    ["playTransitionTime"] = 0.1,
                                    ["stopTransitionTime"] = 0.1
                                })
    
                                WSContainer:removeFromZeroValueCount()
                                JPContainer:removeFromZeroValueCount()
                                ARContainer:add(1000)
                            end)
                        end
                    end
                elseif sigma.type == "PARRY_CLIENT_IS_AFTER_PARRY_STUNNED_CHANGE" then
                    if Classes.NPS2.Value then
                        return
                    end
                elseif sigma.type == "GLORY_KILL_GLORY_KILLING_CHANGE" then
                    if Classes.AutoGlory.Value then
                        return
                    end
                end
            end
    
            return old(table, sigma)
        end

    local CanSend = true
    TextChatService.MessageReceived:Connect(function(message)
        if message.Text:match("You must wait before sending another message.") and CanSend then
            CanSend = false
            task.delay(4.5, function()
                CanSend = true
            end)
        end
    end)

    Network:BindEvents({
        CreateAntiCheatNotification = function(data)
            if data.punishType == "rectified" and Classes.Network.Value and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                repeat
                    LocalPlayer.Character.Humanoid:EquipTool(LocalPlayer.Backpack:GetChildren()[1])
                    task.wait()
                    LocalPlayer.Character.Humanoid:UnequipTools()
                until LocalPlayer.Character.HumanoidRootPart.ReceiveAge == 0
                Modules.Name["CoreGuiHandlerClient"].sendNotification({
                    Title = "Regained Network",
                    Text = "Attempt to regain network has been successful"
                })
            end
        end,
        KilledPlayer = function(statData)
            local diedPlayer = MockHandler.getPlayerOrMockFromPlayerOrMockUserId(statData.playerOrMockUserIdThatDied)
            local killType = statData.singleKillType
            local killStreak = statData.killStreak
            local headShot= statData.isHeadshot
            local collat = statData.isCollat
            local multiplier = statData.xpMult
            local baseXp = statData.baseXpToGive
            local baseCredits = statData.baseCreditsToGive

            if diedPlayer and Classes.Killsay.Value then
                local PickFrom = KillSayStuff.Normal
                local GotXp = baseXp
                local GotCredits = baseCredits 

                if killType == "2" then
                    PickFrom = KillSayStuff.Assist
                elseif killType == "3" then
                    PickFrom = KillSayStuff.Finish
                    GotXp = statData.finishXpToGive
                    GotCredits = statData.finishCreditsToGive
                elseif killType == "4" then
                    PickFrom = KillSayStuff.Glory
                    GotXp = statData.gkXpToGive
                    GotCredits = statData.gkCreditsToGive
                end

                if headShot then
                    PickFrom = PickFrom.Headshot or PickFrom
                    GotXp = statData.headshotXpToGive
                    GotCredits = statData.headshotCreditsToGive
                end

                if collat then
                    PickFrom = PickFrom.Collat or PickFrom
                    GotXp = statData.collatXpToGive
                    GotCredits = statData.collatCreditsToGive
                end

                local killStreakData = killStreak > 1 and (KillStreak[killStreak - 1] or KillStreak[#KillStreak])
                if killStreakData then
                    GotXp = statData.killStreakXpToGive
                    GotCredits = statData.killStreakCreditsToGive
                end

                local Message 
                repeat
                    Message = PickFrom[math.random(1, #PickFrom)]
                    task.wait()
                until typeof(Message) == "string"
                Message = Message:gsub("%%Died%%", diedPlayer.DisplayName)
                Message = Message:gsub("%%XP%%", GotXp * multiplier)
                Message = Message:gsub("%%Credits%%", GotCredits)
                if killStreakData then
                    Message = Message:gsub("%%KillstreakDisplayName%%", killStreakData.displayName)
                else
                    Message = Message:gsub("%%KillstreakDisplayName%%", "Double Kill")
                end

                local Weapon = Framework:GetWeapon() or Framework:GetRanged()
                if Weapon then
                    Message = Message:gsub("%%Weapon%%", Weapon.Name)
                end
                
                if CanSend then
                    TextChatService.TextChannels.RBXGeneral:SendAsync(Message)
                end
            end
        end
    })
end
local PlayersRegion = CreateRegion(Misc, "Main 2") do
    local function m(str)
        local newStr = str:split(" ")
        return newStr[#newStr]:gsub("%(@", ""):gsub("%)","")
    end

    local PlayerNames = {}
    for i, v in Players:GetPlayers() do
        table.insert(PlayerNames, v.DisplayName.." (@"..v.Name..")")
    end

    Players.PlayerAdded:Connect(function(Player)
        table.insert(PlayerNames, Player.DisplayName.." (@"..Player.Name..")")
    end)

    Players.PlayerRemoving:Connect(function(Player)
        for i, v in PlayerNames do
            local realName = m(v)
            if Player.Name == realName then
                table.remove(PlayerNames, i)
                if Classes.PlayersTable.Value == v then
                    local name = PlayerNames[1] or "Unknown"
                    Classes.SelectedPlayer.Text = "Selected: "..name
                    Classes.PlayersTable:SetValue(1)
                end
            end
        end
    end)

    Create(PlayersRegion, "Label", {Text = "Selected: "..PlayerNames[1], TextWrapped = true}, "SelectedPlayer")
    Create(PlayersRegion, "Combo", {Label = "", Selected = 1, Items = PlayerNames, GetItems = function() return PlayerNames end, Callback = function(_, Value) Classes.SelectedPlayer.Text = "Selected: "..Value end}, "PlayersTable", "Changes target player")
    Create(PlayersRegion, "Button", {Text = "Attempt Fling", Callback = function()
        local realName = m(Classes.PlayersTable.Value)
        local target = Players:FindFirstChild(realName)

        if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
            Framework:Teleport(target.Character.HumanoidRootPart.CFrame)

            task.wait(0.5)

            while target.Character.Parent and target.Character.HumanoidRootPart.Velocity.Magnitude < 250 do
                if not Active then RunService.Heartbeat:Wait(); break end
                RunService.Heartbeat:Wait()
                local Character = LocalPlayer.Character
                if not Character then RunService.Heartbeat:Wait(); break end
                local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
                if not HumanoidRootPart then RunService.Heartbeat:Wait(); break end
                local vel, movel = nil, 0.1
                vel = HumanoidRootPart.Velocity
                HumanoidRootPart.Velocity = vel * 10000 + Vector3.new(0, 10000, 0)
                RunService.RenderStepped:Wait()
                if Character and Character.Parent and HumanoidRootPart and HumanoidRootPart.Parent then
                    HumanoidRootPart.Velocity = vel
                end
                RunService.Stepped:Wait()
                if Character and Character.Parent and HumanoidRootPart and HumanoidRootPart.Parent then
                    HumanoidRootPart.Velocity = vel + Vector3.new(0, movel, 0)
                    movel = movel * -1
                end
            end
        end
    end}, "Fling", "Attempts to fling player")
    Create(PlayersRegion, "Button", {Text = "Attempt Kill", Callback = function()
        local realName = m(Classes.PlayersTable.Value)
        local target = Players:FindFirstChild(realName)

        if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
            local Character = LocalPlayer.Character
            if not Character then return end
            local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
            if not HumanoidRootPart then return end

            Framework:Teleport(target.Character.HumanoidRootPart.CFrame)

            task.wait(0.2)

            local j = true
            task.spawn(function() -- Gain Velocity
                repeat RunService.Heartbeat:Wait()
                    local vel,movel = nil, 0.1
                    vel = HumanoidRootPart.Velocity
                    HumanoidRootPart.Velocity = vel * 100000 + Vector3.new(0, 100000, 0)
                    RunService.RenderStepped:Wait()
                    HumanoidRootPart.Velocity = vel
                    RunService.Stepped:Wait()
                    HumanoidRootPart.Velocity = vel + Vector3.new(0, movel, 0)
                    movel = movel * -1
                until not j or not HumanoidRootPart.Parent
            end)

            task.wait(0.2)

            HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame

            task.wait(0.2)

            for i = 1,10 do
                HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame
                Network:FireServer("StartFallDamage")
                Network:FireServer("TakeFallDamage",75,Vector3.new(0,-1,0),HumanoidRootPart.Position)
                task.wait()
            end

            task.wait(1)

            j = false
        end
    end}, "AttemptKill", "Attempts to kill player")
    Create(PlayersRegion, "Button", {Text = "Teleport To Player", Callback = function()
        local realName = m(Classes.PlayersTable.Value)
        local target = Players:FindFirstChild(realName)

        if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
            Framework:Teleport(target.Character.HumanoidRootPart.CFrame)
        end
    end}, "TPButton", "Teleports to selected player")

    Classes.SelectedPlayer.Text = "Selected: "..PlayerNames[1]

    Create(PlayersRegion, "Checkbox", {Label = "Alt + Key to Attempt Kill", Value = false}, "AttemptKillKey", "Attempt kill but you can use mouse", true, false, true)

    PlayersRegion:Separator({Text = "Sounds"})

    local UpdateSounds = function() end
    Create(PlayersRegion, "Combo", {Label = "Nuke Alarm", Selected = 2, Items = SoundTables:GetNames("Customs"), Callback = function() UpdateSounds() end}, "NukeAlarm", "Changes Nuke Alarm sound")
    Create(PlayersRegion, "Combo", {Label = "Heal", Selected = 2, Items = SoundTables:GetNames("Customs"), Callback = function() UpdateSounds() end}, "Heal", "Changes Heal sound")
    Create(PlayersRegion, "Combo", {Label = "Explosion", Selected = 2, Items = SoundTables:GetNames("Customs"), Callback = function() UpdateSounds() end}, "Explosion", "Changes Explosion sound")
    Create(PlayersRegion, "Combo", {Label = "Kill Sound", Selected = 2, Items = SoundTables:GetNames("Customs"), Callback = function() UpdateSounds() end}, "KillSound", "Changes Kill sound")
    Create(PlayersRegion, "Combo", {Label = "Parry Sound", Selected = 2, Items = SoundTables:GetNames("Customs"), Callback = function() UpdateSounds() end}, "ParrySound", "Changes Parry sound")

    UpdateSounds = function()
        local Nuke = SoundTables.Customs[Classes.NukeAlarm.Value]
        local Heal = SoundTables.Customs[Classes.Heal.Value]
        local Explosion = SoundTables.Customs[Classes.Explosion.Value]
        local KillSound = SoundTables.Customs[Classes.KillSound.Value]
        local ParrySound = SoundTables.Customs[Classes.ParrySound.Value]

        Nuke = Nuke == "" and SoundTables.Defaults.NukeAlarm or Nuke
        Heal = Heal == "" and SoundTables.Defaults.Heal or Heal
        Explosion = Nuke == "" and SoundTables.Defaults.Explosion or Explosion
        KillSound = KillSound == "" and SoundTables.Defaults.Kill or KillSound
        ParrySound = ParrySound == "" and SoundTables.Defaults.Parry or ParrySound

        ReplicatedStorage.Shared.Assets.Sounds.NukeAlarm.SoundId = Nuke
        ReplicatedStorage.Shared.Assets.Sounds.Heal.SoundId = Heal
        ReplicatedStorage.Shared.Assets.Sounds.ExplosionHit.SoundId = Explosion
        ReplicatedStorage.Shared.Assets.Sounds.Kill.SoundId = KillSound
        ReplicatedStorage.Shared.Assets.Damage.Sounds.CriticalKill.SoundId = KillSound
        ReplicatedStorage.Shared.Assets.Sounds.Parry.SoundId = ParrySound
    end

    PlayersRegion:Separator({Text = "Others"})

    Create(PlayersRegion, "Checkbox", {Label = "Loop Attempt Kill All", Value = false}, "LoopKillAll", "Loop kill all using Attempt Kill", true)
    Create(PlayersRegion, "Checkbox", {Label = "Beartrap Enemy", Value = false}, "BeartrapEnemy", "Automatically beartraps people near you", true)
    Create(PlayersRegion, "Checkbox", {Label = "Auto Attach C4", Value = false}, "AutoAttachC4", "Automatically attaches C4 to people near you", true)
    Create(PlayersRegion, "Checkbox", {Label = "Auto Detonate C4", Value = false}, "AutoDetonateC4", "Automatically detonates C4", true)
    Create(PlayersRegion, "Checkbox", {Label = "Whitelist Friends", Value = false}, "WhitelistFriends", "Whitelist your friends from features that detect players", true)
    Create(PlayersRegion, "Button", {Text = "Load Invis-fling", Callback = function()
        loadstring(get("https://gist.githubusercontent.com/t1ware/3f9284f9c8160ece251b05952c8812de/raw/bd584e4aca1a3b5eb1ee87769ca126919a954dc6/invisfling.luau"))()
    end}, "thisdoesnotneedaflag", "Loads up Invis-fling")

    PlayersRegion:Separator({Text = "Glory & Stomp"})

    Create(PlayersRegion, "Checkbox", {Label = "Auto Glory", Value = false}, "AutoGlory", "Automatically glory kill someone near you", true)
    Create(PlayersRegion, "Checkbox", {Label = "Auto Stomp/Shove", Value = false}, "AutoStompShove", "Automatically stomps/shove people near you", true)
    Create(PlayersRegion, "SliderProgress", {Label = "Glory Delay", Value = 0.5, Minimum = 0, Maximum = 1, Format = "%.1f seconds"}, "GloryDelay", "The delay on the glory kill")
    Create(PlayersRegion, "SliderProgress", {Label = "Glory Range", Value = 10, Minimum = 1, Maximum = 10, Format = "%.f studs/s"}, "GloryRange", "The range on glory kill")
    Create(PlayersRegion, "SliderProgress", {Label = "Stomp/Shove Range", Value = 10, Minimum = 1, Maximum = 10, Format = "%.f studs/s"}, "StompShoveRange", "The range on stomp/shove")

    PlayersRegion:Separator({Text = "Servers"})

    Create(PlayersRegion, "Button", {Text = "Rejoin", Callback = function()
        TeleportService:TeleportToPlaceInstance(game.PlaceId,game.JobId,LocalPlayer)
    end}, "Rejoin", "Rejoins game")
    Create(PlayersRegion, "Button", {Text = "Serverhop to lowest", Callback = function()
        local response = request({Url = "https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Desc&limit=100&excludeFullGames=true", Method="GET"})
        if response.StatusCode == 200 then
            local data = HttpService:JSONDecode(response.Body)
            TeleportService:TeleportToPlaceInstance(game.PlaceId,data.data[#data.data].id,LocalPlayer)
        end
    end}, "ServerhopHighest", "Serverhop to highest player count")
    Create(PlayersRegion, "Button", {Text = "Serverhop to highest", Callback = function()
        local response = request({Url = "https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Desc&limit=100&excludeFullGames=true", Method="GET"})
        if response.StatusCode == 200 then
            local data = HttpService:JSONDecode(response.Body)
            TeleportService:TeleportToPlaceInstance(game.PlaceId,data.data[1].id,LocalPlayer)
        end
    end}, "ServerhopLowest", "Serverhop to lowest player count")

    task.spawn(function()
        while task.wait() do
            if Classes.LoopKillAll.Value then
                for i, v in Players:GetPlayers() do
                    if v ~= LocalPlayer and 
                        not Framework:InMenu(v) and 
                            v.Character and 
                                v.Character:FindFirstChild("Humanoid") and 
                                    v.Character:FindFirstChild("HumanoidRootPart") and 
                                        v.Character.Humanoid.Health ~= 0 and
                                            not v.Character:FindFirstChildOfClass("ForceField") then

                        if not Classes.LoopKillAll.Value or Framework:InMenu(v) or (v.Character and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health == 0) then continue end

                        local Character = LocalPlayer.Character
                        if not Character then break end
                        local Humanoid = Character:FindFirstChild("Humanoid")
                        local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
                        if not HumanoidRootPart or not Humanoid then break end
                        if Humanoid.Health == 0 then break end
            
                        local Distance = (HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude
                        if Distance > 40 then
                            Framework:Teleport(v.Character.HumanoidRootPart.CFrame)
                        end
            
                        task.wait(0.2)

                        if not Classes.LoopKillAll.Value or Framework:InMenu(v) or (v.Character and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health == 0) then continue end
            
                        local j = true
                        task.spawn(function() -- Gain Velocity
                            repeat RunService.Heartbeat:Wait()
                                local vel,movel = nil, 0.1
                                vel = HumanoidRootPart.Velocity
                                HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame * CFrame.new(0, 2, 0)
                                HumanoidRootPart.Velocity = vel * 100000 + Vector3.new(0, 100000, 0)
                                RunService.RenderStepped:Wait()
                                HumanoidRootPart.Velocity = vel
                                RunService.Stepped:Wait()
                                HumanoidRootPart.Velocity = vel + Vector3.new(0, movel, 0)
                                movel = movel * -1
                            until not j or not HumanoidRootPart.Parent or not v.Character or not v.Character:FindFirstChild("Humanoid") or v.Character.Humanoid.Health == 0 or not v.Character:FindFirstChild("HumanoidRootPart") 
                        end)
            
                        task.wait(0.2)

                        if not Classes.LoopKillAll.Value or Framework:InMenu(v) or (v.Character and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health == 0) then continue end

                        HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame

                        task.wait(0.2)

                        if not Classes.LoopKillAll.Value or Framework:InMenu(v) or (v.Character and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health == 0) then continue end
            
                        for i = 1,10 do
                            Network:FireServer("StartFallDamage")
                            Network:FireServer("TakeFallDamage",75,Vector3.new(0,-1,0),HumanoidRootPart.Position)
                            task.wait()
                        end
            
                        task.wait(1)

                        if not Classes.LoopKillAll.Value or Framework:InMenu(v) or (v.Character and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health == 0) then continue end
            
                        j = false
                    end
                end
            end
        end
    end)
end

--// Settings
local OptionsSection = CreateRegion(Settings, "Options") 
local ConfigSection = CreateRegion(Settings, "Configurations") 

do
    if not isfolder("rehydra/settings/") then
        makefolder("rehydra/settings/")
    end

    if not isfolder("rehydra/themes/") then
        makefolder("rehydra/themes/")
    end

    function GetConfigs()
        local list = listfiles('rehydra/settings')
        
        local out = {}
        for i = 1, #list do
            local file = list[i]
            if file:sub(-5) == '.json' then
                local pos = file:find('.json', 1, true)
                local start = pos
        
                local char = file:sub(pos, pos)
                while char ~= '/' and char ~= '\\' and char ~= '' do
                    pos = pos - 1
                    char = file:sub(pos, pos)
                end
        
                if char == '/' or char == '\\' then
                    table.insert(out, file:sub(pos + 1, start - 1))
                end
            end
        end

        return out
    end

    function GetThemes()
        local list = listfiles('rehydra/themes')
        
        local out = {}
        for i = 1, #list do
            local file = list[i]
            if file:sub(-5) == '.json' then
                local pos = file:find('.json', 1, true)
                local start = pos
        
                local char = file:sub(pos, pos)
                while char ~= '/' and char ~= '\\' and char ~= '' do
                    pos = pos - 1
                    char = file:sub(pos, pos)
                end
        
                if char == '/' or char == '\\' then
                    table.insert(out, file:sub(pos + 1, start - 1))
                end
            end
        end

        return out
    end

    function Save(name)
        if name == "" then return end

        local SaveData = {}
        local NewColors = {}
        local NewClasses = {}
        for i, v in Colors do
            NewColors[i] = tostring(v)
        end
        for i, v in Classes do
            if typeof(v) ~= "table" then continue end
            if typeof(v.Value) == "EnumItem" then
                NewClasses[i] = tostring(v.Value)
                continue
            end
            NewClasses[i] = v.Value or false
        end
        table.insert(SaveData, NewClasses)
        table.insert(SaveData, NewColors)
        
        local filename = "rehydra/settings/"..name..".json"
        DbgWarn(filename)
        writefile(filename, HttpService:JSONEncode(SaveData))
    end

    function SaveTheme(name)
        if name == "" then return end

        local Theme = ReGui.ThemeConfigs[Window.Theme].Values
        if Theme then
            for i, v in Theme do
                local Type = typeof(v)
                if Type == "TweenInfo" then
                    local tweenData = {
                        v.Time,
                        tostring(v.EasingStyle):gsub("Enum.EasingStyle.", ""),
                        tostring(v.EasingDirection):gsub("Enum.EasingDirection.", ""),
                        v.RepeatCount,
                        v.Reverses,
                        v.DelayTime
                    }

                    Theme[i] = tweenData
                elseif Type == "Color3" then
                    local SplitColor = tostring(v):split(", ")
                    Theme[i] = SplitColor
                elseif Type == "Font" then
                    Theme[i] = v.Family
                elseif Type == "EnumItem" then
                    Theme[i] = {
                        tostring(v.EnumType),
                        v.Name
                    }
                end
            end

            local filename = "rehydra/themes/"..name..".json"
            DbgWarn(filename)
            writefile(filename, HttpService:JSONEncode(Theme))
        end
    end

    function Load(name)
        if name == "" then return end
        if not isfile("rehydra/settings/"..name..".json") then return end

        local Decoded = HttpService:JSONDecode(readfile("rehydra/settings/"..name..".json"))
        if Decoded then
            local DecodedClasses = Decoded[1]
            local DecodedColors = Decoded[2]

            for i, v in DecodedClasses do
                if not Classes[i] then continue end

                local setValue = v
                if typeof(v) == "string" and v:match("Enum.KeyCode.") then
                    setValue = Enum.KeyCode[v:gsub("Enum.KeyCode.", "")]
                end
                local class = Classes[i]
                local method = class.SetValue or class.SetTicked
                
                if method then
                    local s, r = pcall(method, class, setValue)
                    if not s then
                        DbgWarn(i, r)
                    end
                end
            end

            for i, v in DecodedColors do
                local decode = v:split(", ")
                local RealColor = Color3.new(decode[1], decode[2], decode[3])

                Colors[i] = RealColor
            end
        end
    end

    function LoadTheme(name)
        if name == "" then return end
        if ReGui.ThemeConfigs[name] then Window:SetTheme(name); return end
        if not isfile("rehydra/themes/"..name..".json") then return end

        local Decoded = HttpService:JSONDecode(readfile("rehydra/themes/"..name..".json"))
        if Decoded then
            for i, v in Decoded do
                if typeof(v) == "table" then
                    if #v == 6 then
                        v[2] = Enum.EasingStyle[v[2]]
                        v[3] = Enum.EasingDirection[v[3]]
                        Decoded[i] = TweenInfo.new(unpack(v))
                    elseif #v == 3 then
                        Decoded[i] = Color3.new(unpack(v))
                    elseif #v == 2 then
                        Decoded[i] = Enum[v[1]][v[2]]
                    end
                elseif typeof(v) == "string" then
                    Decoded[i] = Font.new(v)
                end
            end

            --table.foreach(Decoded, print)

            ReGui:DefineTheme(name, Decoded)
            Window:SetTheme(name)
        end
    end

    local NewRow = OptionsSection:Row()
    NewRow:Keybind({
        Label = "",
        Value = Enum.KeyCode.RightShift,
        Callback = function(_, NewKeybind)
            local IsVisible = Window.Visible
            Window:SetVisible(not IsVisible)
            updateSnowEffectVisibility(not IsVisible) -- Pass the *new* visibility state
        end
    })
    NewRow:Label({
        Text = "Show/Hide GUI"
    })

    OptionsSection:Separator()
    
    OptionsSection:Button({
        Text = "Unload Script",
        Callback = function()
            Window:Close()
        end
    })

    OptionsSection:Button({
        Text = "View Changelogs",
        Callback = ViewChangelogs
    })

    Create(OptionsSection, "Checkbox", {Label = "Keybind List", Value = false, Callback = function(self, bool)
        KeybindList:SetVisible(bool)
    end}, "KeybindList", "Shows keybind list")

    if executor ~= "Velocity" then
        Create(OptionsSection, "InputText", {Label = "", Placeholder = "Custom Killfeed Name", Value = ""}, "CustomKillfeedName", "Your custom killfeed name", false, true)
        Create(OptionsSection, "Checkbox", {Label = "Streamer Mode", Value = false}, "StreamerMode", "Hide your information", true)
        Create(OptionsSection, "Checkbox", {Label = "Hide Player Names", Value = false}, "HidePlayerNames", "Hide player names", true)
        Create(OptionsSection, "Checkbox", {Label = "Hide Appearence", Value = false, Callback = function(_, State)
            if State then
                for i,v in pairs(PlayerCharacters:GetChildren()) do
                    table.foreach(v:GetChildren(),function(_,child)
                        if child:IsA("Shirt") then
                            child:Destroy()
                        end
                        if child:IsA("Pants") then
                            child:Destroy()
                        end
                        if child:IsA("Accessory") then
                            child:Destroy()
                        end
                        if child:IsA("CharacterMesh") then
                            child:Destroy()
                        end
                    end)
                end
            end
        end}, "HideAppearence", "Hide appearences", true)
    else
        Create(OptionsSection, "Label", {Text = "Due to your executor this feature has been disabled"})
    end

    OptionsSection:Separator()

    OptionsSection:Label({Text = "Credits:", Bold = true})
    OptionsSection:Label({Text = "xn1781 (len), leaked - og rehydra devs"})
    OptionsSection:Label({Text = "unvhook, pointer.cpp - rehydra modded devs"})
    OptionsSection:Label({Text = "depso/depthso - Dear-ReGui"})
    
    --// Configurations
    local ConfigCombo = ConfigSection:Combo({
        Label = "Config",
        Selected = 1,
        GetItems = function() return GetConfigs() end,
    })

    local ConfigName = ConfigSection:InputText({
        Placeholder = "Config name",
        Value = "",
        Label = ""
    })

    local ConfigRow = ConfigSection:Row()
    
    ConfigRow:Button({
        Text = "Load Config",
        Callback = function()
            Load(ConfigCombo.Value)
        end
    })

    ConfigRow:Button({
        Text = "Save Config",
        Callback = function()
            Save(ConfigName.Value)
        end
    })
    ConfigRow:Button({
        Text = "Delete Config",
        Callback = function()
            local file = "rehydra/settings/"..ConfigCombo.Value..".json"
            if isfile(file) then
                delfile(file)
            end
        end
    })

    ConfigSection:Separator({Text = "Themes"})

    local ThemeCombo = ConfigSection:Combo({
        Label = "Theme",
        Selected = 1,
        GetItems = function() return GetThemes() end,
    })

    local ThemeName = ConfigSection:InputText({
        Placeholder = "Theme name",
        Value = "",
        Label = ""
    })

    local ThemeRow = ConfigSection:Row()
    
    ThemeRow:Button({
        Text = "Load Theme",
        Callback = function()
            LoadTheme(ThemeCombo.Value)
        end
    })

    ThemeRow:Button({
        Text = "Save Theme",
        Callback = function()
            SaveTheme(ThemeName.Value)
        end
    })
    ThemeRow:Button({
        Text = "Delete Theme",
        Callback = function()
            local file = "rehydra/themes/"..ThemeCombo.Value..".json"
            if isfile(file) then
                delfile(file)
            end
        end
    })


    if executor ~= "Velocity" then
        for i,v in pairs(Players:GetPlayers()) do
            v.CharacterAppearanceLoaded:Connect(function(plrChar)
                task.wait()
                if not Classes.HideAppearence.Value then return end
                repeat
                    for i,v in pairs(plrChar:GetChildren()) do
                        if v:IsA("Shirt") then
                            v:Destroy()
                        end
                        if v:IsA("Pants") then
                            v:Destroy()
                        end
                        if v:IsA("Accessory") then
                            v:Destroy()
                        end
                        if v:IsA("CharacterMesh") then
                            v:Destroy()
                        end
                    end
                until not plrChar:FindFirstChildOfClass("Shirt") or not plrChar:FindFirstChildOfClass("Pants")
            end)
        end
    end
end

do --// Combat Section
    Framework:BindToRenderStep(LPH_JIT_MAX(function()
        if Classes.KillAura.Value and not KADebounce then
            local weapon, metadata = Framework:GetWeapon()
            if weapon and metadata then
                local closest = Framework:GetClosest(Classes.KillAuraRange.Value, true)
                if closest and next(closest) then
                    KADebounce = true
                    local onCooldown = false
                    if Classes.UseWeaponCD.Value then
                        onCooldown = metadata._cooldownProgressTimer:getValue() < 0.75
                    else
                        if weapon.Name == "Sickle" then
                            task.wait(0.25)
                        else
                            task.wait(math.clamp(metadata._itemConfig.cooldown - Classes.KillAuraCooldown.Value, 0.45, math.huge) - 0.1)
                        end
                    end
                    if not onCooldown then 
                        if not Classes.PlayAnimation.Value then
                            local slash = math.random(1, #metadata._itemConfig.slashMetadata)
    
                            metadata._cooldownProgressTimer:setValue(0)
    
                            metadata:setSlashCount(slash)
    
                            Network:FireServer("MeleeSwing", weapon, slash)
    
                            metadata._lastSlashTick = tick()
                            weapon:SetAttribute("LastSlashTick", metadata._lastSlashTick)
                        
                            task.wait(0.1)
                            
                            for i, v in metadata.meleeHitboxes do
                                for playerName, health in closest do
                                    local targetPlayer = Players:FindFirstChild(playerName)
    
                                    if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("Head") and health ~= 0 and Framework:Check(targetPlayer.Character) then
                                        local character = targetPlayer.Character
                                        local session = Framework:GetSessionData(targetPlayer)
    
                                        if session and not session:getState().parry.isParrying then
                                            local data = metadata._humanoidsAlreadyHit[character]
                                            if not data then
                                                metadata._humanoidsAlreadyHit[character] = {
                                                    ["hitDetectionStage"] = 0,
                                                    ["amountOfTimesHit"] = 0,
                                                    ["lastHitTick"] = 0
                                                }
                                                data = metadata._humanoidsAlreadyHit[character]
                                            end
    
                                            Network:FireServer("MeleeDamage", 
                                                weapon, 
                                                character.Head, 
                                                i, 
                                                character.Head.Position, 
                                                character.Head.CFrame:ToObjectSpace(CFrame.new(character.Head.Position)), 
                                                metadata._character.HumanoidRootPart.CFrame.LookVector, 
                                                (character.Head.Position - character.Head.Position).Unit, 
                                                Vector3.yAxis, 
                                                tick() - metadata._lastSlashTick
                                            )
    
                                            data.hitDetectionStage = metadata.hitDetectionStage or 1
                                            data.amountOfTimesHit += 1
                                            data.lastHitTick = tick()
    
                                            if Classes.KillAuraType.Value == "Single Person" then
                                                break
                                            end
                                        end
                                    end
                                end
                                break
                            end
                        else
                            if metadata:getShouldSlash() then
                                metadata._activateSignal:Fire()

                                local anim = metadata.animations.slashes[metadata._currSlashCount]
                                local response = waitUntilTimeout(anim:GetMarkerReachedSignal("startHitDetection"), 2)
                                
                                if response ~= "Timed out" then
                                    for i, v in metadata.meleeHitboxes do
                                        v.HitboxStopTime = 1
                                        for playerName, health in closest do
                                            local targetPlayer = Players:FindFirstChild(playerName)
            
                                            if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("Head") and health ~= 0 and Framework:Check(targetPlayer.Character) then
                                                local character = targetPlayer.Character
                                                local data = Framework:GetSessionData(targetPlayer)
            
                                                if data and not data:getState().parry.isParrying then
                                                    v.OnHit:Fire(character.Head, character.Humanoid, {
                                                        Distance = 1,
                                                        Instance = character.Head,
                                                        Material = Enum.Material.SmoothPlastic,
                                                        Position = character.Head.Position,
                                                        Normal = Vector3.yAxis
                                                    }, character.Head.Position, character.Head.Position)
            
                                                    if Classes.KillAuraType.Value == "Single Person" then
                                                        break
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                    KADebounce = false
                end
            end
        end
    end))

    local angle = 0
    local orbitCF = CFrame.new()
    local Connection; Connection = RunService.Heartbeat:Connect(function(dt)
        if not Active then
            Connection:Disconnect()
            return
        end

	    angle = (angle + dt * 10) % (2 * math.pi)
	    orbitCF = CFrame.new(math.cos(angle) * Classes.TPRange.Value, 0, math.sin(angle) * Classes.TPRange.Value)
    end)

    Framework:BindToRenderStep(LPH_NO_VIRTUALIZE(function()
        local Type = Classes.TPType.Value
        local Character = LocalPlayer.Character
        if Character then
            local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")

            if HumanoidRootPart then
                local weapon = Framework:GetWeapon() or Framework:GetRanged()
                local CameraSubject 
                if Character:GetAttribute("CameraSubject") then
                    CameraSubject = Character:FindFirstChild(Character:GetAttribute("CameraSubject"))
                else
                    CameraSubject = Character:FindFirstChildOfClass("Humanoid") or HumanoidRootPart
                end
                if weapon and (Classes.KillAura.Value or Classes.Ragebot.Value) then
                    if not Classes.TPEnemy.Value then return end
                    local closest = Framework:GetClosest(Classes.KillAuraRange.Value, true)
                    if next(closest) then
                        OnTp = false
                        local targetPlayer = Players:FindFirstChild(next(closest))
                        if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("Head") then
                            OnTp = true

                            HumanoidRootPart.Velocity = Vector3.zero
                            HumanoidRootPart.RotVelocity = Vector3.zero

                            if Type == "Behind" then
                                local _, y, _ = targetPlayer.Character.HumanoidRootPart.CFrame:ToEulerAnglesYXZ()
                                HumanoidRootPart.CFrame = CFrame.new(targetPlayer.Character.HumanoidRootPart.Position) * CFrame.new(0, Classes.TPRange.Value, 0)
                            elseif Type == "Orbit" then
                                HumanoidRootPart.CFrame = CFrame.new(targetPlayer.Character.HumanoidRootPart.Position) * orbitCF
                            elseif Type == "Above" then
                                HumanoidRootPart.CFrame = CFrame.new(targetPlayer.Character.HumanoidRootPart.Position) * CFrame.new(0, -10, 0)
                            else
                                local X, Y, Z = math.random(-6, 6), math.random(-3, 3), math.random(-6, 6)
                                local XA, YA, ZA = math.random(-180, 180), math.random(-180, 180), math.random(-180, 180)
                                HumanoidRootPart.CFrame = CFrame.new(targetPlayer.Character.HumanoidRootPart.Position) * CFrame.new(X, Y, Z) * CFrame.Angles(math.rad(XA), math.rad(YA), math.rad(ZA))
                                Camera.CameraSubject = targetPlayer.Character.HumanoidRootPart
                            end
        
                            if Type ~= "Random" then
                                Camera.CameraSubject = CameraSubject
                            end
                        end
                    else
                        OnTp = false
                        Camera.CameraSubject = CameraSubject
                    end
                else
                    OnTp = false
                    Camera.CameraSubject = CameraSubject
                end
        
                if not weapon then
                    if Classes.AutoEquip.Value then
                        for _,v in pairs(LocalPlayer.Backpack:GetChildren()) do
                            if v:IsA("Tool") and (v:FindFirstChild("Hitboxes") or v:GetAttribute("IsRangedWeapon")) then
                                Character.Humanoid:EquipTool(v)
                                break
                            end
                        end
                    end
                end
            end
        end
    end))

    Framework:BindToRenderStep(LPH_JIT_MAX(function()
        if Classes.AutoStompShove.Value then
            local Character = LocalPlayer.Character
            local closest = Framework:GetClosest(Classes.StompShoveRange.Value, true)
            if Character and Character:FindFirstChild("Stomp") and closest and next(closest) then
                local metadata = Modules.Name["MeleeWeaponClient"].getObj(Character.Stomp)
                if metadata and metadata._cooldownProgressTimer:getValue() > 0.75 then
                    local slashData = metadata._itemConfig.slashMetadata[metadata._currSlashCount]
                    local hitbox = slashData.getHitboxInfo(metadata.tool)
                    local hitboxes = metadata:getHitboxesToUseFromHitboxParts(hitbox.hitboxPartsToUse)
                    for i, v in hitboxes do
                        if not v.HitboxPendingRemoval then
                            for playerName, health in closest do
                                local targetPlayer = Players:FindFirstChild(playerName)
                                local data = targetPlayer and Framework:GetSessionData(targetPlayer)
                                local state = data and data:getState()
    
                                if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("Head") and targetPlayer.Character:FindFirstChild("Humanoid") and health ~= 0 and (health <= 15 or (state and state.parry.isParried) or targetPlayer.Character.Humanoid:GetAttribute("IsRagdolledServer")) then
                                    setthreadidentity(2)
                                    metadata:slash()
                                    setthreadidentity(7)

                                    local humanoid = targetPlayer.Character.Humanoid
                                    local head = targetPlayer.Character.Head

                                    v.OnHit:Fire(head, humanoid,{
                                        Distance = 1,
                                        Instance = head,
                                        Material = Enum.Material.SmoothPlastic,
                                        Position = head.Position,
                                        Normal = Vector3.yAxis
                                    }, head.Position, head.Position)
                                end
                            end
                            break
                        end
                    end
                end
            end
        end
    end))

    task.spawn(LPH_NO_VIRTUALIZE(function()
        while RunService.RenderStepped:Wait() do 
            if Classes.AutoGlory.Value then
                task.wait(Classes.GloryDelay.Value)

                local closest = Framework:GetClosest(Classes.GloryRange.Value, true)
                local tool = Framework:GetWeapon() 
    
                if tool and closest and next(closest) then 
                    local targetPlayer = Players:FindFirstChild(next(closest))
                    if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("Humanoid") and targetPlayer.Character.Humanoid.Health <= 20 then
                        Network:FireServer("StartGloryKill", tool, targetPlayer.Character, CFrame.new(), Vector3.new())
                    end
                end
            end
        end
    end))
end

do -- Aimbot
    local Holding = false
    local HoldingCTRL = false
    local CurrentTarget;

    local Began; Began = UserInputService.InputBegan:Connect(function(Key,Process)
        if not Active then Began:Disconnect(); return end

        if Key.KeyCode == Enum.KeyCode.LeftAlt then
            HoldingCTRL = true
        end
        -- dont think this is aimbot mate
        if Classes.AttemptKillKey.Value and HoldingCTRL and (Key.KeyCode == Classes.AttemptKillKeyKeybind.Value or Key.UserInputType == Classes.AttemptKillKeyKeybind.Value) then
            local HitPart = Mouse.Target
            local Character = HitPart and HitPart:FindFirstAncestorOfClass("Model")
            local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
            if HitPart and Character and Humanoid then
                local LocalCharacter = LocalPlayer.Character
                if not Character then return end
                local HumanoidRootPart = LocalCharacter:FindFirstChild("HumanoidRootPart")
                if not HumanoidRootPart then return end
    
                Framework:Teleport(Character.HumanoidRootPart.CFrame)
    
                task.wait(0.2)
    
                local j = true
                task.spawn(function() -- Gain Velocity
                    repeat RunService.Heartbeat:Wait()
                        local vel,movel = nil, 0.1
                        vel = HumanoidRootPart.Velocity
                        HumanoidRootPart.Velocity = vel * 100000 + Vector3.new(0, 100000, 0)
                        RunService.RenderStepped:Wait()
                        HumanoidRootPart.Velocity = vel
                        RunService.Stepped:Wait()
                        HumanoidRootPart.Velocity = vel + Vector3.new(0, movel, 0)
                        movel = movel * -1
                    until not j or not HumanoidRootPart.Parent
                end)
    
                task.wait(0.2)
    
                HumanoidRootPart.CFrame = Character.HumanoidRootPart.CFrame
    
                task.wait(0.2)
    
                for i = 1,10 do
                    HumanoidRootPart.CFrame = Character.HumanoidRootPart.CFrame
                    Network:FireServer("StartFallDamage")
                    Network:FireServer("TakeFallDamage",75, Vector3.new(0,-1,0), HumanoidRootPart.Position)
                    task.wait()
                end
    
                task.wait(1)
    
                j = false
            end
        end

        if Classes.Aimbot.Value and (Key.KeyCode == Classes.AimbotKeybind.Value or Key.UserInputType == Classes.AimbotKeybind.Value) then
            local Target = Framework:GetClosestToMouse(Classes.FOVSizeAimbot.Value)
            if Classes.Hold.Value then
                Holding = true
                CurrentTarget = Target
            else
                if CurrentTarget then
                    CurrentTarget = nil
                else
                    CurrentTarget = Target
                end
            end
        end
    end)

    local Ended; Ended = UserInputService.InputEnded:Connect(function(Key,Process)
        if not Active then Ended:Disconnect(); return end

        if Key.KeyCode == Enum.KeyCode.LeftAlt then
            HoldingCTRL = false
        end

        if Classes.Aimbot.Value and (Key.KeyCode == Classes.AimbotKeybind.Value or Key.UserInputType == Classes.AimbotKeybind.Value) then
            if Classes.Hold.Value then
                Holding = false
                CurrentTarget = nil
            end
        end
    end)

    Framework:BindToRenderStep(LPH_NO_VIRTUALIZE(function()
        if not Classes.Aimbot.Value then CurrentTarget = nil; end
        if Classes.Hold.Value and not Holding then CurrentTarget = nil; end

        if CurrentTarget and not Framework:InMenu(CurrentTarget)  then 
            local Character = CurrentTarget.Character
            if Character then  
                local HitPart = Character:FindFirstChild(Classes.AimbotHitPart.Value)
                if HitPart then
                    if Classes.ShowTargetAB.Value then
                        ShowInformation(CurrentTarget)
                        AimbotHighlight.Adornee = Character
                    end
            
                    local Ranged, Metadata = Framework:GetRanged()
            
                    local FinalPos
                    if not Classes.Prediction.Value then
                        FinalPos = HitPart.Position
                    else
                        if Ranged and Metadata then
                            local cheatedOrigin = Metadata:getCheatedBackOriginIfInObject(Metadata._mainCasterBehavior.RaycastParams)
                            local projectileSpeed = Metadata._itemConfig.speed or 200
                            local projectileGravity = Metadata._itemConfig.gravity or Vector3.new(0, 0, 0)
            
                            if cheatedOrigin or projectileSpeed or projectileGravity then
                                FinalPos = PredictTargetPosition(cheatedOrigin, {Position = HitPart.Position, Velocity = HitPart.Velocity}, projectileSpeed, LocalPlayer:GetNetworkPing() * 1000, projectileGravity)
                            end
                        end
                    end
                    Camera.CFrame = Camera.CFrame:lerp(CFrame.lookAt(Camera.CFrame.Position, FinalPos or HitPart.Position), Classes.Smooth.Value and 0.1 or 1) -- Smooth out
                else
                    ShowInformation(nil)
                    CurrentTarget = nil;
                end
            else
                ShowInformation(nil)
                CurrentTarget = nil;
            end
        else
            ShowInformation(nil)
            CurrentTarget = nil
        end
    end))
end

do -- Silent Aim
    setthreadidentity(2)
    local ActiveCast = require(ReplicatedStorage.Shared.Vendor.FastCast.ActiveCast)
    setthreadidentity(7)

    local cache = {}
    local chanceCache = {}
    local currentSilentAimTarget = nil
    local OldSimulateCast = getupvalue(ActiveCast.new, 6)
    local OldCalculateFire = Modules.Name["RangedWeaponHandler"].calculateFireDirection
    function newSimulate(...)
        local args = {...}
        local caster = args[1]

        pcall(LPH_JIT_MAX(function()
            local weapon,metadata = Framework:GetRanged()

            local Chance = Framework:Chance(Classes.HitChance.Value)
            if not Chance then
                table.insert(chanceCache, caster)
            end

            if not table.find(chanceCache, caster) and Chance and caster and caster.UserData and caster.StateInfo and caster.UserData.tool == weapon and (Classes.SilentAim.Value or Classes.Ragebot.Value) and weapon and metadata then
                local Player = Framework:GetClosestCharacterToOrigin(caster:GetPosition(), 19)
                if Classes.ClosestType.Value == "Only Redirect To Target" then
                    Player = nil
                    local Characters = Framework:GetClosestCharactersToOrigin(caster:GetPosition(), 19)
                    if table.find(Characters, currentSilentAimTarget) then
                        Player = currentSilentAimTarget
                    end
                end
                local MouseClosest = Framework:GetClosestToMouse(Classes.FOVSize.Value)
                
                if Player then
                    local Head = Player:FindFirstChild("Head")
                    local Character = LocalPlayer.Character
                    local HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart")
                    if Classes.Ragebot.Value and Head and HumanoidRootPart then
                        DbgWarn("Hitting guy", Player.Name, (Head.Position - caster:GetPosition()).Magnitude)
                        DbgWarn("Attempting hit")
    
                        if Classes.ShowLine.Value then
                            table.insert(WireFrameDraw, {
                                Origin = HumanoidRootPart.Position,
                                Destination = Head.Position,
                                ExpiresIn = 2
                            })
                        end
    
                        caster.Caster.RayHit:Fire(caster, {
                            Distance = 1,
                            Instance = Head,
                            Material = Enum.Material.SmoothPlastic,
                            Position = Head.Position,
                            Normal = Vector3.yAxis
                        }, nil, caster.RayInfo.CosmeticBulletObject)
    
                        caster:Terminate()
                    end
                end
    
                if Classes.SilentAim.Value then
                    if Classes.ClosestType.Value == "Closest To Mouse" then
                        if MouseClosest then
                            local PlayerChar = MouseClosest.Character
                            if PlayerChar then
                                local HitPart = PlayerChar:FindFirstChild(Classes.SilentHitPart.Value == "Random" and R6BodyParts[math.random(1,#R6BodyParts)] or Classes.SilentHitPart.Value)
                                if HitPart and (HitPart.Position - caster:GetPosition()).Magnitude <= Classes.SilentAimRange.Value then
                                    local Vel = (HitPart.Position - caster:GetPosition()).Unit * 3000
                                    caster:SetVelocity(Vel)
                                end
                            end
                        end
                    elseif Classes.ClosestType.Value == "Closest To Arrow" or Classes.ClosestType.Value == "Only Redirect To Target" then
                        if Player then
                            local HitPart = Player:FindFirstChild(Classes.SilentHitPart.Value == "Random" and R6BodyParts[math.random(1,#R6BodyParts)] or Classes.SilentHitPart.Value)
                            if HitPart and (HitPart.Position - caster:GetPosition()).Magnitude <= Classes.SilentAimRange.Value then
                                local Vel = (HitPart.Position - caster:GetPosition()).Unit * 3000
                                caster:SetVelocity(Vel)
                            end
                        end
                    end
                end
    
                if Classes.ShowArrow.Value and caster.SetStaticFastCastReference and not cache[caster] then
                    table.insert(cache, caster)
                    caster.SetStaticFastCastReference({
                        DebugLogging = false,
                        VisualizeCasts = true
                    })
                end
            end
        end))

        if caster and caster.UserData and caster.StateInfo then
            return OldSimulateCast(...)
        end

        return
    end

    function newCalculateFire(...)
        local args = {...}
        local target = Framework:GetClosestToMouse(Classes.FOVSize.Value)
        local ranged, metadata = Framework:GetRanged()

        if Classes.SilentAim.Value and target and ranged and metadata and Framework:Chance(Classes.HitChance.Value) and not Framework:InMenu(target) then
            if Classes.ShowTargetSA.Value then
                setthreadidentity(7)
                ShowInformation(target)
                SilentAimHighlight.Adornee = target.Character
                setthreadidentity(2)
            end

            local hitPart = target.Character:FindFirstChild(Classes.SilentHitPart.Value)
            local humanoid = target.Character:FindFirstChildOfClass("Humanoid")
            if hitPart and humanoid then
                local cheatedOrigin = metadata:getCheatedBackOriginIfInObject(metadata._mainCasterBehavior.RaycastParams)
                local projectileSpeed = metadata._itemConfig.speed or 200
                local projectileGravity = metadata._itemConfig.gravity or Vector3.new(0, 0, 0)
    
                if cheatedOrigin and projectileSpeed and projectileGravity then
                    currentSilentAimTarget = target.Character
                    local predictedPos = PredictTargetPosition(cheatedOrigin, {Position = hitPart.Position, Velocity = (Classes.Resolver.Value and humanoid.MoveDirection or hitPart.Velocity)}, projectileSpeed, LocalPlayer:GetNetworkPing() * 1000, projectileGravity)
                    args[1] = CFrame.lookAt(Vector3.new(), (predictedPos - cheatedOrigin).Unit)
                end
            end
        else
            ShowInformation(nil)
        end

        return OldCalculateFire(unpack(args))
    end

    setupvalue(ActiveCast.new, 6, function(...)
        return newSimulate(...)
    end)

    Modules.Name["RangedWeaponHandler"].calculateFireDirection = newCalculateFire

    local VisualizerFolder = Instance.new("Folder", Workspace.Terrain)
    VisualizerFolder.Name = "FastCastVisualizationObjects"
    VisualizerFolder.ChildAdded:Connect(function(child)
        task.wait()
        Debris:AddItem(child, 0.7)
    end)

    task.spawn(LPH_NO_VIRTUALIZE(function() -- Desync
        while true do
            RunService.Heartbeat:Wait()

            if not Active then RunService.Heartbeat:Wait(); break end
            if not Classes.Desync.Value then RunService.Heartbeat:Wait(); continue end
            local Character = LocalPlayer.Character
            if not Character then RunService.Heartbeat:Wait(); continue end
            local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
            if not HumanoidRootPart then RunService.Heartbeat:Wait(); continue end

            local vel, movel = nil, 0.1

            vel = HumanoidRootPart.Velocity
            HumanoidRootPart.Velocity = Vector3.new( math.random(-1500, 1500), math.random(-300, 300), math.random(-1500, 1500) )

            RunService.RenderStepped:Wait()
            if Character and Character.Parent and HumanoidRootPart and HumanoidRootPart.Parent then
                HumanoidRootPart.Velocity = vel
            end

            RunService.Stepped:Wait()
            if Character and Character.Parent and HumanoidRootPart and HumanoidRootPart.Parent then
                HumanoidRootPart.Velocity = vel + Vector3.new(0, movel, 0)
                movel = movel * -1
            end
        end
    end))

    task.spawn(LPH_JIT_MAX(function()
        while task.wait() do 
            if not Active then break end
            local Character = LocalPlayer.Character
            if Classes.Ragebot.Value and Character then
                local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
                if HumanoidRootPart then
                    local forcefield = Character:FindFirstChildOfClass("ForceField")
                    if not forcefield or not (forcefield and forcefield.Name ~= "ff") then
                        local ranged, metadata = Framework:GetRanged()
                        if ranged and metadata then
                            local player = LockedTarget or Framework:GetClosest2(Classes.RagebotDist.Value)
                            if LockedTarget and not next(LockedTarget) then
                                LockedTarget = nil
                                DbgWarn('Deleted current target 3')
                                continue
                            end
                            if player and next(player) then
                                if metadata.canShootBulletssss == nil then
                                    metadata.canShootBulletssss = true
                                end
                                if metadata._clientAmmoVO.Value > 0 then
                                    if not metadata.canShootBulletssss then
                                        if metadata._itemConfig.maxAmmo == 1 then
                                            metadata.canShootBulletssss = true
                                        end
                                    end
                                    if metadata._mainCasterBehavior and metadata._mainCaster and metadata.canShootBulletssss then
                                        DbgWarn(tostring(metadata.canShootBulletssss))
                                        DbgWarn('Firing!')
        
                                        local targetPlayer = Players:FindFirstChild(next(player))
                                        if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("Humanoid") then
                                            if targetPlayer.Character.Humanoid.Health == 0 then
                                                LockedTarget = nil
                                                DbgWarn('Deleted current target 1')
                                                continue
                                            end
        
                                            if Framework:InMenu(targetPlayer) then
                                                LockedTarget = nil
                                                DbgWarn('Deleted current target 4')
                                                continue
                                            end
                                        end
        
                                        if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("Head") and not targetPlayer.Character:FindFirstChildOfClass("ForceField") then
                                            metadata.canShootBulletssss = false

                                            local Head = targetPlayer.Character.Head

                                            if Classes.ShowRageBotTarget.Value then
                                                ShowInformation(targetPlayer)
                                                RagebotHighlight.Adornee = targetPlayer.Character
                                            end
        
                                            LockedTarget = player
                                            --debug.Adornee = targetPlayer.Character
        
                                            metadata._mainCasterBehavior.RaycastParams.FilterDescendantsInstances = {
                                                metadata._mainCasterBehavior.RaycastParams.FilterDescendantsInstances,
                                                PlayerCharacters,
                                                Map,
                                                Workspace.Terrain
                                            }
            
                                            local origin = metadata:getCheatedBackOriginIfInObject(metadata._mainCasterBehavior.RaycastParams)
                                            local projectileSpeed = metadata._itemConfig.speed or 200
                                            local projectileGravity = metadata._itemConfig.gravity or Vector3.new(0, 0, 0)
            
                                            local finalPos = PredictTargetPosition(origin, {Position = Head.Position, Velocity = Head.Velocity}, projectileSpeed, LocalPlayer:GetNetworkPing() * 1000, projectileGravity)
            
                                            local CF = CFrame.new(Vector3.new(), (finalPos - origin).Unit)
                                            local dir = OldCalculateFire(CF, 0, 0, 5000)
            
                                            local fakeBehavior = {
                                                RaycastParams = metadata._mainCasterBehavior.RaycastParams,
                                                Acceleration = Vector3.new(),
                                                MaxDistance = 5000,
                                                HighFidelityBehavior = 1,
                                                HighFidelitySegmentSize = 0.5,
                                                CosmeticBulletContainer = EffectsJunk,
                                                AutoIgnoreContainer = true
                                            }
            
                                            local template = metadata._cosmeticProjectileTemplate
                                            if typeof(fakeBehavior) == "Instance" then
                                                fakeBehavior.CosmeticBulletProvider = nil
                                                fakeBehavior.CosmeticBulletTemplate = template
                                            else
                                                fakeBehavior.CosmeticBulletProvider = template
                                                fakeBehavior.CosmeticBulletTemplate = nil
                                            end
                                            
                                            local cast = metadata._mainCaster:Fire(origin, dir, projectileSpeed, fakeBehavior)
                                            metadata._cheatId = metadata._cheatId and metadata._cheatId + 1 or 1
                                            cast.UserData = {
                                                ["player"] = LocalPlayer,
                                                ["tool"] = ranged,
                                                ["shotId"] = tostring(metadata._cheatId),
                                                ["origin"] = origin
                                            }
                                            Network:FireServer("RangedFire", ranged, origin, {
                                                [tostring(metadata._cheatId)] = dir.Unit
                                            }, {
                                                [tostring(metadata._cheatId)] = dir
                                            }, {
                                                [1] = tostring(metadata._cheatId)
                                            }, nil, Camera.CFrame, Workspace:GetServerTimeNow())
                                            metadata._clientAmmoVO.Value = metadata._clientAmmoVO.Value - 1

                                            local distance = (origin - Head.Position).Magnitude
                                            local timeToHit = distance / projectileSpeed

                                            DbgWarn("Takes:", timeToHit)

                                            if not (ranged.Name == "Longbow" or ranged.Name == "Crossbow" or ranged.Name == "Heavy Bow") then
                                                task.delay(timeToHit, function()
                                                    if cast.UserData and cast.StateInfo and cast.StateInfo.UpdateConnection then
                                                        if Classes.ShowLine.Value then
                                                            table.insert(WireFrameDraw, {
                                                                Origin = HumanoidRootPart.Position,
                                                                Destination = Head.Position,
                                                                ExpiresIn = 2
                                                            })
                                                        end

                                                        metadata._mainCaster.RayHit:Fire(cast, {
                                                            Distance = 1,
                                                            Instance = Head,
                                                            Material = Enum.Material.SmoothPlastic,
                                                            Position = Head.Position,
                                                            Normal = Vector3.yAxis
                                                        }, nil, cast.RayInfo.CosmeticBulletObject)

                                                        cast:Terminate()
                                                    end
                                                end)
                                            end

                                            if metadata._clientAmmoVO.Value ~= 0 then
                                                DbgWarn("CD Takes:",metadata._itemConfig.cooldown)
                                                task.wait(metadata._itemConfig.cooldown)
                                            end

                                            metadata.canShootBulletssss = true
                                        else
                                            LockedTarget = nil
                                            DbgWarn('Deleted current target 2')
                                            continue
                                        end
                                    end
                                else
                                    if metadata._clientAmmoVO.Value <= 0 then
                                        Network:FireServer("StartRangedReload", ranged)
                                        task.wait(metadata._itemConfig.reloadTime-0.2)
                                        if ranged then 
                                            pcall(function()
                                                local reloaded, _ = Network:InvokeServer("FinishedRangedReload", ranged)
                                                if reloaded then
                                                    metadata._clientAmmoVO.Value = metadata._itemConfig.maxAmmo
                                                    if not metadata.canShootBulletssss then
                                                        metadata.canShootBulletssss = true
                                                    end
                                                end
                                            end)
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end)) -- Ragebot

    local Line = Drawing.new("Line")
    Line.Color = Colors.ShowTargetSA or Color3.new(1, 1, 1)
    Line.Thickness = 1
    Line.Visible = false
    Line.From = UserInputService:GetMouseLocation()

    local Line2 = Drawing.new("Line")
    Line2.Color = Colors.ShowTargetAB or Color3.new(1, 1, 1)
    Line2.Thickness = 1
    Line2.Visible = false
    Line2.From = UserInputService:GetMouseLocation()

    local Inset, _ = game:GetService("GuiService"):GetGuiInset()

    Framework:BindToRenderStep(LPH_NO_VIRTUALIZE(function()
        if Classes.ShowTargetSA.Value or Classes.ShowTargetAB.Value then
            local MouseLocation = UserInputService:GetMouseLocation()

            Line.Color = Colors.ShowTargetSA or Color3.new(1, 1, 1)
            Line2.Color = Colors.ShowTargetAB or Color3.new(1, 1, 1)
    
            Line.From = MouseLocation
            Line2.From = MouseLocation
    
            local target = Framework:GetClosestToMouse(Classes.FOVSize.Value)
            local target2 = Framework:GetClosestToMouse(Classes.FOVSizeAimbot.Value)
    
            if target and not Framework:InMenu(target) and Classes.ShowTargetSA.Value then
                local Root = target.Character:FindFirstChild("HumanoidRootPart")
                if Root then
                    ShowInformation(target)
    
                    Line.Visible = true
        
                    local position, onScreen = Camera:WorldToScreenPoint(Root.Position)
                    if onScreen then
                        Line.To = Vector2.new(position.X, position.Y + Inset.Y)
                    end
                else
                    ShowInformation(nil)
                    Line.Visible = false
                end
            else
                ShowInformation(nil)
                Line.Visible = false
            end
    
            if target2 and not Framework:InMenu(target2) and Classes.ShowTargetAB.Value then
                local Root = target2.Character:FindFirstChild("HumanoidRootPart")
                if Root then
                    ShowInformation(target2)
    
                    Line2.Visible = true
        
                    local position, onScreen = Camera:WorldToScreenPoint(Root.Position)
                    if onScreen then
                        Line2.To = Vector2.new(position.X, position.Y + Inset.Y)
                    end
                else
                    ShowInformation(nil)
                    Line2.Visible = false
                end
            else
                ShowInformation(nil)
                Line2.Visible = false
            end
        else
            Line.Visible = Classes.ShowTargetSA.Value
            Line2.Visible = Classes.ShowTargetAB.Value
        end
    end))
end

do --// Combat Modifications
    setthreadidentity(2)
    local Hitboxes = require(ReplicatedStorage.Shared.Vendor.RaycastHitbox.HitboxCaster)
    setthreadidentity(7)

    function getHitboxes()
        return getupvalue(Hitboxes._FindHitbox,1)
    end

    local AlreadySet = {}
    local Cache = {}
    local Connections = {}

    local DeathPosition = CFrame.new()

    local function OnNewCharacter(Character)
        CurrentBlocksNumber = 0
        KADebounce = false
        LockedTarget = nil

        local Session = Framework:GetSessionData()
        local State = Session:getState()
        State.fallDamageClient.isDisabled = Classes.NFD.Value

        local Humanoid = Character:WaitForChild("Humanoid")
        local Animator = Humanoid:WaitForChild("Animator")

        table.insert(Connections, Humanoid.Died:Connect(function()
            DeathPosition = CFrame.new(Humanoid.RootPart.Position)
        end))

        table.insert(Connections, Character.ChildAdded:Connect(function(ParryShield)
            if Classes.DTP.Value and ParryShield:GetAttribute("ParryShieldId") then
                task.wait()
                Framework:Teleport(DeathPosition or CFrame.new())
            end
        end))

        table.insert(Connections, Humanoid:GetPropertyChangedSignal("JumpPower"):Connect(function()
            if Humanoid.JumpPower == 0 then
                Humanoid.JumpPower = 50
            end
        end))

        local LastPlayed
        local SwingNumber = 0
        local ShouldAdjust = false
        table.insert(Connections, Animator.AnimationPlayed:Connect(function(Track)
            local Weapon, Metadata = Framework:GetWeapon()
            if Weapon and Metadata then
                for i, v in Metadata.animations.slashes do
                    if v == Track then
                        ShouldAdjust = false
                        local Check = Metadata._currSlashCount % 2 == 0
                        if LastPlayed == Track then
                            SwingNumber += 1
                            Check = SwingNumber % 2 == 0
                        else
                            SwingNumber = 0
                        end
                        LastPlayed = Track
                        if Classes.LowerSwingCooldown.Value then
                            Metadata._cooldownProgressTimer:setValue(Classes.LowerSwingValue.Value)
                        end
                        if Classes.BurstSwing.Value then
                            local speed = 2

                            if not Check and not ShouldAdjust then
                                local weaponCooldown = Metadata._itemConfig.cooldown + 0.4
    
                                local animLength = Track.Length or 1
                                local slowmoDuration = math.min(weaponCooldown * 0.5, animLength * 0.7)
                                local remainingTime = weaponCooldown - slowmoDuration
    
                                Track:AdjustSpeed(0.1)
                                task.wait(slowmoDuration - 0.2)
    
                                local speedMultiplier = animLength / remainingTime 
                                speedMultiplier = math.clamp(speedMultiplier, 2, 4)

                                speed = speedMultiplier
                            else
                                if not ShouldAdjust then
                                    speed = 2
                                end
                            end

                            Track:AdjustSpeed(speed)

                            task.spawn(function()
                                ShouldAdjust = true
                                while Track and Track.IsPlaying and ShouldAdjust do
                                    Track:AdjustSpeed(speed)
                                    RunService.RenderStepped:Wait()
                                end
                            end)
                        end
                        break
                    end
                end
            end
        end))

        table.insert(Connections, Character.ChildAdded:Connect(function(Tool)
            if Classes.HitEffect.Value ~= "None" and Tool:IsA("Tool") and not table.find(Cache, Tool) then
                local _, Metadata = Framework:GetRanged()
                if Metadata then
                    table.insert(Cache, Tool)

                    Metadata._mainCaster.RayHit:Connect(function(caster, raycast, _, cosmeticBullet)
                        local Effects = EffectHolder:Clone()
                        local EffectName = Classes.HitEffect.Value
                        Effects.CFrame = CFrame.new(0,0,0)*CFrame.lookAt(raycast.Position, raycast.Position + raycast.Normal) * CFrame.Angles(math.rad(90),0,0)
                        Effects.Parent = EffectsJunk
                        Effects[EffectName].Parent = Effects.Attachment
                        for i,v in ipairs(Effects.Attachment[EffectName]:GetChildren()) do
                            v.Color = ColorSequence.new(Colors["HitEffect"] or Color3.new(1, 1, 1))
                            v.Emit(v, 1)
                        end
                        Effects.Attachment[EffectName].Parent = Effects
                        task.delay(3, function()
                            Effects:Destroy()
                        end)
                    end)
                end
            end
        end))

        task.spawn(function()
            while Character:IsDescendantOf(game) do
                if Classes.Invisible.Value then
                    for i,v in pairs(Character:GetChildren()) do
                        if (v:IsA("BasePart") or v:IsA("Accessory") or v:IsA("MeshPart")) and v.Name ~= "HumanoidRootPart" then
                            Network:FireServer("ReplicateEffect", "GunMagThrow", {
                                v,
                            })
                            
                            if v:IsA("BasePart") or v:IsA("MeshPart") then
                                v.Transparency = 1
                            end

                            for i, child in v:GetDescendants() do
                                if child:IsA("BasePart") or child:IsA("MeshPart") then
                                    child.Transparency = 1
                                end
                            end
                            
                            task.wait(4)
                        end
                    end
                end
                RunService.RenderStepped:Wait()
            end
        end)
    end

    OnNewCharacter(LocalPlayer.Character)
    LocalPlayer.CharacterAdded:Connect(OnNewCharacter)
    
    local Agent = PathfindingService:CreatePath({
        AgentRadius = 0,
        AgentHeight = 5,
        AgentCanJump = true
    })

    Framework:BindToRenderStep(LPH_JIT_MAX(function()
        if LocalPlayer.Character then 
            local hitboxes = getHitboxes()
            if hitboxes and next(hitboxes) and Classes.AlwaysHit.Value then
                for i, v in hitboxes do
                    if not AlreadySet[v] then
                        AlreadySet[v] = true
    
                        table.insert(Connections, v.OnUpdate:Connect(function()
                            v.HitboxStopTime = 1
    
                            local closest = Framework:GetClosest(Classes.AlwaysHitRange.Value, true)
                            if not closest or not next(closest) then return end
    
                            for player, h in pairs(closest) do
                                local target = Players:FindFirstChild(player)
    
                                if target and target.Character and target.Character:FindFirstChildOfClass("Humanoid") then
                                    local char = target.Character
                                    local bodyPart = char:FindFirstChild(Classes.AlwaysHitPart.Value)
    
                                    if bodyPart then
                                        v.OnHit:Fire(bodyPart,char.Humanoid,{
                                            Distance = 1,
                                            Instance = bodyPart,
                                            Material = Enum.Material.SmoothPlastic,
                                            Position = bodyPart.Position,
                                            Normal = Vector3.yAxis
                                        },bodyPart.Position,bodyPart.Position)
                                    end
                                end
                            end
                        end))
                    end
                end
            end
        else
            for i,v in Connections do
                v:Disconnect()
            end

            table.clear(Connections)

            if next(AlreadySet) then
                table.clear(AlreadySet)
            end
        end
    end))

    RunService.Heartbeat:Connect(LPH_NO_VIRTUALIZE(function()
        if Classes.Pathfind.Value then
            local Character = LocalPlayer.Character
            if not Character then return end
            local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
            if not HumanoidRootPart then return end
            local forcefield = Character:FindFirstChildOfClass("ForceField")
            if forcefield and forcefield.Name ~= "ff" then return end

            local closest = Framework:GetClosest(1000, true)

            if not closest or not next(closest) then return end

            HumanoidRootPart.Velocity = Vector3.new(0,0,0)
            HumanoidRootPart.RotVelocity = Vector3.new(0,0,0)
        end
    end))

    local Finished = true
    Framework:BindToRenderStep(LPH_JIT_MAX(function()
        if Classes.Pathfind.Value then
            if Finished and (not GrenadeNear or not OnTp or not ClaimingAirdrop) then 
                local Character = LocalPlayer.Character
                local forcefield = Character and Character:FindFirstChildOfClass("ForceField")
                if Character and (not forcefield or not (forcefield and forcefield.Name ~= "ff")) then
                    local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
                    if HumanoidRootPart then
                        local weapon = Framework:GetWeapon() or Framework:GetRanged()
                        local closest = Framework:GetClosest(1000, false)
                        if weapon and closest and next(closest) then
                            Finished = false

                            for player, h in pairs(closest) do
                                local target = Players:FindFirstChild(player)
                                if target and target.Character and target.Character:FindFirstChildOfClass("Humanoid") and target.Character.Humanoid.Health ~= 0 then
                                    local twen
                                    local twen2
                                    repeat RunService.RenderStepped:Wait()
                                        local Success, _ = pcall(function()
                                            Agent:ComputeAsync(HumanoidRootPart.Position, target.Character.Humanoid.RootPart.Position)
                                        end)
                                        if Success and Agent.Status == Enum.PathStatus.Success then
                                            local Waypoints = Agent:GetWaypoints()
                                            if not next(Waypoints) then
                                                local speed = (HumanoidRootPart.Position - target.Character.Humanoid.RootPart.Position).Magnitude / Classes.PFSpeed.Value
                                                local tween = TweenService:Create(HumanoidRootPart, TweenInfo.new(speed, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {Position = target.Character.Humanoid.RootPart.Position + Vector3.new(0, 6, 0)})
                                                tween:Play()
                                            else
                                                for i,v in Waypoints do
                                                    if Waypoints[i - 1] then
                                                        if OnTp or GrenadeNear or ClaimingAirdrop then break end
                                                        if not Character:IsDescendantOf(game) or
                                                            not target or 
                                                                not target.Character or 
                                                                    not target.Character:IsDescendantOf(game) or 
                                                                        not target.Character:FindFirstChildOfClass("Humanoid") or 
                                                                            target.Character.Humanoid.Health == 0 then break end
                                                        local speed = (Waypoints[i - 1].Position - v.Position).Magnitude / Classes.PFSpeed.Value
                                                        local tween = TweenService:Create(HumanoidRootPart, TweenInfo.new(speed, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {Position = v.Position + Vector3.new(0, 6, 0)})
                                                        twen = tween
                                                        tween:Play()
                                                        tween.Completed:Wait()
                                                    end
                                                end
                                            end
                                        else
                                            local speed = (HumanoidRootPart.Position - target.Character.Humanoid.RootPart.Position).Magnitude / Classes.PFSpeed.Value
                                            local tween = TweenService:Create(HumanoidRootPart, TweenInfo.new(speed, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {Position = target.Character.Humanoid.RootPart.Position + Vector3.new(0, 6, 0)})
                                            tween:Play()
                                            twen2 = tween
                                            if twen then
                                                twen:Pause()
                                            end
                                            break
                                        end
                                        RunService.RenderStepped:Wait()
                                    until not Character:IsDescendantOf(game) or
                                            not target or 
                                                not target.Character or 
                                                    not target.Character:IsDescendantOf(game) or 
                                                        not target.Character:FindFirstChildOfClass("Humanoid") or 
                                                            target.Character.Humanoid.Health == 0 or OnTp or ClaimingAirdrop
                                    if twen then
                                        twen:Pause()
                                    end
                                    if twen2 then
                                        twen2:Pause()
                                    end
                                    break
                                end
                            end

                            Finished = true
                        end
                    end
                end
            end
        end
    end))
end

do --// Parry Things
    local blacklist = {
        "rbxassetid://106649093705106",
        "rbxassetid://6423003415",
        "rbxassetid://101463478179793"
    }

    function Parry(metadata)
        local apdelay = math.round(Classes.APDelay.Value)
        if apdelay > 0 then
            task.wait(apdelay)
        end

        if Classes.APType.Value == "Rage" then
            Network:FireServer("Parry")
        else
            metadata:parry()
        end
    end

    local scraped = {}
    function getevent(animID)
        if scraped[animID] then
            return scraped[animID]
        end
        local markers = {}
        local ks
        local s, _ = pcall(function()
            ks = KeyframeSequenceProvider:GetKeyframeSequenceAsync(animID)
        end)
        if (s and ks) then
            local function recurse(parent)
                for _, child in pairs(parent:GetChildren()) do
                    if (child:IsA("KeyframeMarker")) then
                        local kf = child:FindFirstAncestor("Keyframe")
                        if kf then
                            markers[child.Name] = kf.Time
                        end
                    end
                    if (#child:GetChildren() > 0) then
                        recurse(child)
                    end
                end
            end
            recurse(ks)
            scraped[animID] = markers
            return markers
        end
        return
    end

    local HumanoidToParry = {}
    for i, v in pairs(PlayerCharacters:GetChildren()) do
        if v ~= LocalPlayer.Character and v:FindFirstChildOfClass("Humanoid") then
            local humanoid = v:FindFirstChildOfClass("Humanoid")

            table.insert(HumanoidToParry, humanoid)
        end
    end

    PlayerCharacters.ChildAdded:Connect(function(char)
        if char ~= LocalPlayer.Character and char:FindFirstChildOfClass("Humanoid") then
            local humanoid = char:FindFirstChildOfClass("Humanoid")

            table.insert(HumanoidToParry, humanoid)
        end
    end)

    local playSoundOld = Modules.Name["SoundHandler"].playSound; Modules.Name["SoundHandler"].playSound = function(sound)
		if Classes.AutoParry.Value and Classes.APCheck.Value == "Sounds" and typeof(sound.parent) == "Instance" and sound.parent and sound.parent.Parent and sound.parent.Parent.Parent and sound.parent.Parent.Parent.Parent and sound.parent.Name:match("Hitbox") and sound.parent:FindFirstAncestorOfClass("Tool") then
            local Weapon, Metadata = Framework:GetWeapon()
            local Other = sound.parent.Parent.Parent.Parent
            local OtherRoot = Other and Other:FindFirstChild("HumanoidRootPart")
            if Weapon and Metadata and Other and OtherRoot then
                if Other ~= LocalPlayer.Character and Framework:IsPartClose(OtherRoot, Classes.APRange.Value) and Framework:Chance(Classes.RandomChance.Value and math.random(1,100) or Classes.APChance.Value) then
                    local CanParry = false
                    if Classes.LookCheck.Value then
                        local BadPlrPos = Other:GetPivot().Position
                        local BadPlrDirection = (BadPlrPos - LocalPlayer.Character.Head.Position).Unit
                        local ToCheck = LocalPlayer.Character.Head.CFrame.LookVector
    
                        if math.deg(math.acos(BadPlrDirection:Dot(ToCheck))) <= Classes.APAngle.Value then
                            CanParry = true
                        end
                    else
                        CanParry = true
                    end
    
                    if CanParry then
                        task.spawn(Parry, Metadata)
                    end
                end
            end
		end

        if sound.soundObject and sound.soundObject.Name == "Parry" and typeof(sound.parent) == "Instance" then
            local parryShield = sound.parent:FindFirstAncestorOfClass("Model")
            local Character = parryShield.Parent

            if parryShield and parryShield:GetAttribute("ParryShieldId") and Character then
                table.insert(ParryingCharacters, Character)

                task.delay(Modules.Name["ParryConstants"].PARRY_DURATION_IN_SECONDS, function()
                    table.remove(ParryingCharacters, table.find(ParryingCharacters, Character))
                end)
            end
        end

	    return playSoundOld(sound)
	end

    Framework:BindToRenderStep(LPH_JIT_MAX(function() -- I took this from my Balthazar script lol
        if not Classes.AutoParry.Value then return end
        if Classes.APCheck.Value == "Sounds" then return end

        local Character = LocalPlayer.Character
        if Character then
            local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
            if HumanoidRootPart then
                local tool, metadata = Framework:GetWeapon()

                if tool and metadata then
                    for _,humanoid in pairs(HumanoidToParry) do
                        local rootPart = humanoid.RootPart
                        if rootPart then
                            local Distance = (HumanoidRootPart.Position - rootPart.Position).Magnitude
                            if Distance <= Classes.APRange.Value then
                                local Animations = humanoid.Animator:GetPlayingAnimationTracks()
                                for _,anim in pairs(Animations) do
                                    if table.find(blacklist, anim.Animation.AnimationId) then continue end
                                    if anim.Animation.Name:find("^Finish%w*") then continue end
                                    local markers = getevent(anim.Animation.AnimationId)
                                    if not markers then continue end
        
                                    for i,v in pairs(markers) do
                                        if i == "startHitDetection" then
                                            if (anim.TimePosition >= math.clamp(v - Classes.Threshold.Value, 0, math.huge) and not (anim.TimePosition > v)) and Framework:Chance(Classes.RandomChance.Value and math.random(1,100) or Classes.APChance.Value) then
                                                local CanParry = false
                                                if Classes.LookCheck.Value then
                                                    local BadPlrPos = rootPart:GetPivot().Position
                                                    local BadPlrDirection = (BadPlrPos - Character.Head.Position).Unit
                                                    local ToCheck = Character.Head.CFrame.LookVector
                                
                                                    if math.deg(math.acos(BadPlrDirection:Dot(ToCheck))) <= Classes.APAngle.Value then
                                                        CanParry = true
                                                    end
                                                else
                                                    CanParry = true
                                                end
        
                                                if CanParry then
                                                    local rodux = Framework:GetSessionData() 
                                                    if rodux and rodux:getState().parry.isParried and not rodux:getState().parry.isKneeled then
                                                        task.spawn(Parry, true)
                                                    else
                                                        task.spawn(Parry)
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end))
end

do --// Character Mods
    if Remotes then
        local binded = Remotes.ApplyFlashbangEffect.Callbacks[1]
        local binded2 = Remotes.ApplyFlashbombEffect.Callbacks[1]
    
        Remotes.ApplyFlashbangEffect.Callbacks = {function(...)
            if Classes.NoFlash.Value then
                return
            end
            return binded(...)
        end}
    
        Remotes.ApplyFlashbombEffect.Callbacks = {function(...)
            if Classes.NoFlash.Value then
                return
            end
            return binded2(...)
        end}
    end

    local oldMaxHealth = Modules.Name["HealthHandler"].getRealHealth; Modules.Name["HealthHandler"].getRealHealth = function(...)
        if Classes.NoHealth.Value then
            return math.huge
        end
        return oldMaxHealth(...)
    end

    local oldKnockback = Modules.Name["KnockbackHandler"].knockbackCharacterPart; Modules.Name["KnockbackHandler"].knockbackCharacterPart = function(part, ...)
        if part:IsDescendantOf(LocalPlayer.Character) and Classes.NKB.Value then
            return
        end
        return oldKnockback(part, ...)
    end

    local oldKnockbackAngular = Modules.Name["KnockbackHandler"].knockbackCharacterPartAngular; Modules.Name["KnockbackHandler"].knockbackCharacterPartAngular = function(part, ...)
        if part:IsDescendantOf(LocalPlayer.Character) and Classes.NKB.Value then
            return
        end
        return oldKnockbackAngular(part, ...)
    end

    local oldImpulse = Modules.Name["KnockbackHandler"].impulseCharacterPart; Modules.Name["KnockbackHandler"].impulseCharacterPart = function(part, ...)
        if part:IsDescendantOf(LocalPlayer.Character) and Classes.NKB.Value then
            return
        end
        return oldImpulse(part, ...)
    end

    local oldImpulseAngular = Modules.Name["KnockbackHandler"].impulseCharacterPartAngular; Modules.Name["KnockbackHandler"].impulseCharacterPartAngular = function(part, ...)
        if part:IsDescendantOf(LocalPlayer.Character) and Classes.NKB.Value then
            return
        end
        return oldImpulseAngular(part, ...)
    end

    local oldRagdoll = Modules.Name["RagdollableClient"].attemptToggleActualRagdollClient; Modules.Name["RagdollableClient"].attemptToggleActualRagdollClient = function(...)
        if Classes.NR.Value then
            return
        end
        return oldRagdoll(...)
    end

    local oldJump = Modules.Name["JumpHandlerClient"].getCanJump; Modules.Name["JumpHandlerClient"].getCanJump = function(...)
        if Classes.CAJ.Value then
            return true
        end
        return oldJump(...)
    end

    local oldBear = Modules.Name["OpenBearTrapPartClient"].new; Modules.Name["OpenBearTrapPartClient"].new = function(...)
        if Classes.NUD.Value then
            return
        end
        return oldBear(...)
    end
    
    local oldClaymore = Modules.Name["ClaymoreTrapPartClient"].new; Modules.Name["ClaymoreTrapPartClient"].new = function(...)
        if Classes.NUD.Value then
            return
        end
        return oldClaymore(...)
    end

    local oldCancel = Modules.Name["RangedWeaponClient"].cancelReload; Modules.Name["RangedWeaponClient"].cancelReload = function(...)
        if Classes.NoReloadCancel.Value then
            return
        end
        return oldCancel(...)
    end

    local oldHittable = Modules.Name["CharacterUtil"].getIsHittableCharacterPart; Modules.Name["CharacterUtil"].getIsHittableCharacterPart = function(part, unused)
        if Classes.AntiParry.Value and not Framework:Check(part.Parent) then
            return false
        end

        return oldHittable(part, unused)
    end

    local oldAttach = Modules.Name["ItemAttachmentHandlerClient"].addItemAttachment; Modules.Name["ItemAttachmentHandlerClient"].addItemAttachment = function(...)
        if Classes.HideWeaponOnBack.Value then
            return
        end
        
        return oldAttach(...)
    end

    local oldAddInst = Modules.Name["InstancePropsHandler"].add; Modules.Name["InstancePropsHandler"].add = function(a, b, c, ...)
        if Classes.NoGhostPotEffect.Value and a ~= LocalPlayer.Character and c == "GHOST_POTION" then
            return
        end
        
        return oldAddInst(a, b, c, ...)
    end

    local JumpContainer = Modules.Name["JumpHandlerClient"].getJumpPowerValueContainer()
    if JumpContainer then
        local jpZero = JumpContainer.addToZeroValueCount; JumpContainer.addToZeroValueCount = function(...)
            if Classes.JP.Value then
                return
            end

            return jpZero(...)
        end
    end

    local oldRangedVisuals = Modules.Name["RangedHitVisuals"].defaultHit; Modules.Name["RangedHitVisuals"].defaultHit = function(player, tool, config, hitpart, hitcf, normal, material, cosmetic)
        local newHitCf = hitcf
        if Classes.HitboxExpand.Value and hitpart and hitpart.Name == "FakeHitbox" then
            local part = hitpart.Parent:FindFirstChild(Classes.HBEPart.Value == "Random" and R6BodyParts[math.random(1, #R6BodyParts)] or Classes.HBEPart.Value) or hitpart.Parent:FindFirstChild("Torso")
            if part then
                local metadata = Framework:GetMetadata(tool.Name)
                if metadata then
                    task.wait((hitcf.Position - part.Position).Magnitude / metadata.speed)
                end
                newHitCf = part.CFrame *
                    cosmetic.CFrame.Rotation * 
                        CFrame.new(
                            (math.random() * math.random(-1, 1)) * (part.Size.X / 2), 
                            (math.random() * math.random(-1, 1)) * (part.Size.Y / 2), 
                            (math.random() * math.random(-1, 1)) * (part.Size.Z / 2)
                        )
            end
        end
        return oldRangedVisuals(player, tool, config, hitpart, newHitCf, normal, material, cosmetic)
    end

    Modules.Name["RangedWeaponClient"].updateIgnoreList = function(rangedData)
        if tick() - rangedData._lastIgnoreListUpdateTick < 5 then
            return rangedData._ignoreList
        end

        rangedData._lastIgnoreListUpdateTick = tick()
        local character = rangedData._character
        local tagged = CollectionService:GetTagged("RANGED_CASTER_IGNORE_LIST")

        table.insert(tagged, character)

        if Classes.Wallbang.Value then
            table.insert(tagged, Map)
            table.insert(tagged, Workspace.Terrain)
        end

        rangedData._ignoreList = tagged
        return tagged
    end

    local Debounce = false
    Framework:BindToRenderStep(LPH_NO_VIRTUALIZE(function()
        local Character = LocalPlayer.Character
        if Character and not Framework:InMenu(LocalPlayer) then
            local Humanoid = Character:FindFirstChild("Humanoid")
            local Stamina = Modules.Name["DefaultStaminaHandlerClient"].getDefaultStamina()
            local JumpPower = Modules.Name["JumpHandlerClient"].getJumpPowerValueContainer()
            local SessionsData = Framework:GetSessionData()
    
            local Weapon, Metadata = Framework:GetWeapon()
            local Closest = Framework:GetClosest(15, true)
            local CurrentTool = Character:FindFirstChildOfClass("Tool")

            Framework:Fly()
            Framework:SpinLoop()
    
            if Weapon and Metadata then
                if Classes.FakeSwing.Value and not Debounce then
                    Debounce = true
    
                    Metadata.animations.slashes[math.random(1,#Metadata.animations.slashes)]:Play()
    
                    task.delay(0.5, function()
                        Debounce = false
                    end)
                end
            end
    
            if next(Closest) then -- i took this from samuelhook
                local TargetPlayer = Players:FindFirstChild(next(Closest))
    
                if Classes.BeartrapEnemy.Value and CurrentTool and CurrentTool.Name == "Bear Trap" then
                    pcall(function()  
                        Network:InvokeServer("PlaceBearTrap", CurrentTool, TargetPlayer.Character.Humanoid.RootPart.CFrame * CFrame.new(0, -1, 0))
                    end)
                end
    
                if Classes.AutoAttachC4.Value and CurrentTool and CurrentTool.Name == "C4" then
                    local Head = TargetPlayer.Character:FindFirstChild("Head")
                    if Head then
                        local Distance = ( Humanoid.RootPart.Position - Head.Position ).Magnitude
    
                        if Distance <= 15 then
                            local finalPos = Head.Position + ( Head.Velocity * (Distance / 100) )
        
                            pcall(function() 
                                Network:InvokeServer("ReplicateThrowable", CurrentTool, finalPos, finalPos)
                            end)
                        end
                    end
                end
    
                if Classes.AutoDetonateC4.Value and CurrentTool and CurrentTool.Name == "C4" then
                    Network:FireServer("DetonateC4", CurrentTool)
                end
            end
    
            if Stamina then
                if Classes.IS.Value then
                    Stamina:setStamina(math.huge)
                else
                    if Stamina:getStamina() >= 10000 then
                        Stamina:setStamina(Modules.Name["DefaultStaminaConstants"].MAX_STAMINA)
                    end
                end
            end
    
            if Classes.WS.Value then
                if Character and Humanoid then
                    Modules.Name["WalkSpeedHandlerClient"].getValueContainer():setBaseValue(Classes.WSValue.Value)
                end
            end
    
            if Classes.JP.Value then
                if Character and Humanoid then
                    JumpPower:setBaseValue(Classes.JPValue.Value)
                end
            end
    
            if Classes.TPWalk.Value then
                if Character and Humanoid then
                    if Humanoid.MoveDirection.Magnitude > 0 then
                        Character:TranslateBy(Humanoid.MoveDirection * (Classes.TPWalkValue.Value / 10))
                    end
                end
            end
    
            if Classes.NDCD.Value and SessionsData then
                SessionsData:getState().dashClient.isDashing = false
            end
    
            if Classes.Bhop.Value then
                if Character and Humanoid then
                    Humanoid.Jump = true
                end
            end
    
            if Classes.NoAnimations.Value then
                if Character and Humanoid then
                    for i, v in Humanoid:GetPlayingAnimationTracks() do
                        if v.Animation ~= spinAnim then
                            v:Stop()
                        end
                    end
                end
            end

            if Classes.NUD.Value then
                if Character and not Character:FindFirstChild("ff") then
                    local force = Instance.new("ForceField", Character)
                    force.Visible = false
                    force.Name = "ff"
                end
            else
                if Character and Character:FindFirstChild("ff") then
                    Character.ff:Destroy()
                end
            end

            if SessionsData then
                SessionsData:getState().fallDamageClient.isDisabled = Classes.NFD.Value
            end
        end
    end))

    Framework:BindToRenderStep(LPH_NO_VIRTUALIZE(function()
        if Classes.AR.Value then
			if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") and LocalPlayer.Character.Humanoid.Health <= 15 then
				Network:FireServer("SelfReviveStart")
				Network:FireServer("SelfRevive")
			end
		end
    end), 0.1)

    local Con; Con = UserInputService.InputBegan:Connect(function(i, gp)
        if not Active then Con:Disconnect(); return end
        if gp then return end
        if i.KeyCode == Enum.KeyCode.Space and Classes.InfiniteJump.Value and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end)
end

do --// remotes thing
    Framework:ArgModify("MeleeDamage", {}, function(n,...)
        local args = {...}
        if Classes.AntiParry.Value and not Framework:Check(args[2].Parent) then
            return {[1] = nil}
        end
        if Classes.HitboxExpand.Value and args[2].Name == "FakeHitbox" then
            local part = args[2].Parent:FindFirstChild(Classes.HBEPart.Value == "Random" and R6BodyParts[math.random(1, #R6BodyParts)] or Classes.HBEPart.Value) or args[2].Parent:FindFirstChild("Torso")
            if part then
                return {[2] = part, [5] = CFrame.new(
                    (math.random() * math.random(-1, 1)) * (part.Size.X / 2), 
                    (math.random() * math.random(-1, 1)) * (part.Size.Y / 2), 
                    (math.random() * math.random(-1, 1)) * (part.Size.Z / 2)
                )}
            end
        end
        return
    end)

    Framework:ArgModify("MeleeFinish", {}, function(n,...)
        local args = {...}
        if Classes.HitboxExpand.Value and args[2].Name == "FakeHitbox" then
            local part = args[2].Parent:FindFirstChild(Classes.HBEPart.Value == "Random" and R6BodyParts[math.random(1, #R6BodyParts)] or Classes.HBEPart.Value) or args[2].Parent:FindFirstChild("Torso")
            if part then
                return {[2] = part}
            end
        end
        return
    end)

    Framework:ArgModify("UpdateIsCrouching",{[1] = true},function(n,...)
        if Classes.NT.Value then
            return true
        end
        return
    end)

    Framework:ArgModify("RangedHit",{},function(n,...)
        local args = {...}
        if Classes.HitboxExpand.Value and args[2].Name == "FakeHitbox" then
            local part = args[2].Parent:FindFirstChild(Classes.HBEPart.Value == "Random" and R6BodyParts[math.random(1, #R6BodyParts)] or Classes.HBEPart.Value) or args[2].Parent:FindFirstChild("Torso")
            if part then
                return {
                    [2] = part,
                    [4] = part.Position,
                    [5] = --part.CFrame:ToObjectSpace(
                        CFrame.Angles(args[5]:ToEulerAnglesYXZ())
                        * CFrame.new(
                            (math.random() * math.random(-1, 1)) * (part.Size.X / 2), 
                            (math.random() * math.random(-1, 1)) * (part.Size.Y / 2), 
                            (math.random() * math.random(-1, 1)) * (part.Size.Z / 2)
                        )
                    --)
                }
            end
        end
        if Classes.AlwaysHead.Value then
            return {[2] = args[2].Parent:FindFirstChild("Head")}
        end
        return
    end)
end

do 
    local circle = Drawing.new('Circle')
    circle.Position = Vector2.new(0,0)
    circle.Radius = 500
    circle.Thickness = 1
    circle.Filled = false
    circle.Transparency = 0
    circle.NumSides = 360
    circle.Visible = true
    circle.Color = Colors["ShowFOV"] or Color3.new(1,1,1)

    local circle2 = Drawing.new('Circle')
    circle2.Position = Vector2.new(0,0)
    circle2.Radius = 500
    circle2.Thickness = 1
    circle2.Filled = false
    circle2.Transparency = 0
    circle2.NumSides = 360
    circle2.Visible = true
    circle2.Color = Colors["ShowFOVAimbot"] or Color3.new(1,1,1)

    local Inset,_ = game:GetService("GuiService"):GetGuiInset()
    local MouseCon; MouseCon = Mouse.Move:Connect(function()
        if not Active then MouseCon:Disconnect(); return end

        if Classes.ShowFOV.Value then
            circle.Color = Colors["ShowFOV"] or Color3.new(1,1,1)
            circle.Radius = Classes.FOVSize.Value
            circle.Transparency = 1
            circle.Position = Vector2.new(Mouse.X,Mouse.Y+Inset.Y)
        else
            circle.Color = Colors["ShowFOV"] or Color3.new(1,1,1)
            circle.Radius = Classes.FOVSize.Value
            circle.Transparency = 0
            circle.Position = Vector2.new(Mouse.X,Mouse.Y+Inset.Y)
        end

        if Classes.ShowFOVAimbot.Value then
            circle2.Color = Colors["ShowFOVAimbot"] or Color3.new(1,1,1)
            circle2.Radius = Classes.FOVSizeAimbot.Value
            circle2.Transparency = 1
            circle2.Position = Vector2.new(Mouse.X,Mouse.Y+Inset.Y)
        else
            circle2.Color = Colors["ShowFOVAimbot"] or Color3.new(1,1,1)
            circle2.Radius = Classes.FOVSizeAimbot.Value
            circle2.Transparency = 0
            circle2.Position = Vector2.new(Mouse.X,Mouse.Y+Inset.Y)
        end
    end)

    Workspace.WorldPivot = CFrame.identity
    local Adornment = Instance.new('WireframeHandleAdornment')
    Adornment.Name = 'Gizmos'
    Adornment.Parent = Workspace
    Adornment.Color3 = Color3.new(1, 1, 1)
    Adornment.Adornee = Workspace
    Adornment.AlwaysOnTop = true

    local Adornment2 = Instance.new('WireframeHandleAdornment')
    Adornment2.Name = 'Gizmos2'
    Adornment2.Parent = Workspace
    Adornment2.Color3 = Color3.new(1, 1, 1)
    Adornment2.Adornee = Workspace
    Adornment2.AlwaysOnTop = true

    local Adornment3 = Instance.new('WireframeHandleAdornment')
    Adornment3.Name = 'Gizmos3'
    Adornment3.Parent = Workspace
    Adornment3.Color3 = Color3.new(1, 1, 1)
    Adornment3.Adornee = Workspace
    Adornment3.AlwaysOnTop = true

    local Adornment4 = Instance.new('WireframeHandleAdornment')
    Adornment4.Name = 'Gizmos4'
    Adornment4.Parent = Workspace
    Adornment4.Color3 = Color3.new(1, 1, 1)
    Adornment4.Adornee = Workspace
    Adornment4.AlwaysOnTop = true

    local Adornment5 = Instance.new('WireframeHandleAdornment')
    Adornment5.Name = 'Gizmos5'
    Adornment5.Parent = Workspace
    Adornment5.Color3 = Color3.new(1, 1, 1)
    Adornment5.Adornee = Workspace
    Adornment5.AlwaysOnTop = true

    Adornment:Clear()
    Adornment2:Clear()
    Adornment3:Clear()
    Adornment4:Clear()
    Adornment5:Clear()

    function drawCircle(norm, radius, identifier)
        local Character = LocalPlayer.Character
	    local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
	    if not HumanoidRootPart then return end

        local segments = 50
        local cf = CFrame.lookAlong(HumanoidRootPart.Position, norm)
        local angle = 2 * math.pi / segments
    
        local points = {}
        for i = 1, segments do
            local localpoint = Vector3.new(math.cos(i * angle), math.sin(i * angle), 0) * radius
            local point = cf:PointToWorldSpace(localpoint)
            table.insert(points, point)
        end

        if identifier == "ka" then
            Adornment:AddPath(points, true)
        end

        if identifier == "ap" then
            Adornment4:AddPath(points, true)
        end
    end

    Framework:BindToRenderStep(LPH_NO_VIRTUALIZE(function()
        Adornment:Clear()
        Adornment2:Clear()
        Adornment3:Clear()
        Adornment4:Clear()
        Adornment5:Clear()

        Adornment.Color3 = Colors["RangeIndicator"] or Color3.new(1,1,1)
        Adornment2.Color3 = Colors["LookIndicator"] or Color3.new(1,1,1)
        Adornment3.Color3 = Colors["ShowLine"] or Color3.new(1,1,1)
        Adornment4.Color3 = Colors["APRangIndicator"] or Color3.new(1,1,1)

        if Classes.RangeIndicator.Value then
            drawCircle(Vector3.yAxis, Classes.KillAuraRange.Value, "ka")
        end

        if Classes.APRangIndicator.Value then 
            drawCircle(Vector3.yAxis, Classes.APRange.Value, "ap")
        end


        if Classes.LookIndicator.Value then
            local closest = Framework:GetClosest(Classes.APRange.Value)

            if next(closest) then
                for i, v in closest do
                    local targetPlayer = Players:FindFirstChild(i)
                    if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        local root = targetPlayer.Character.HumanoidRootPart
                        local _, y, _ = root.CFrame:ToEulerAnglesYXZ()

                        local noY = CFrame.new(root.Position) * CFrame.Angles(0,y,0)

                        local First = CFrame.lookAt(root.Position, (noY * CFrame.Angles(0,math.rad(Classes.APAngle.Value),0) * CFrame.new(0,0,-5)).Position).LookVector * 15
                        local Second = CFrame.lookAt(root.Position, (noY * CFrame.Angles(0,math.rad(-Classes.APAngle.Value),0) * CFrame.new(0,0,-5)).Position).LookVector * 15

                        Adornment2:AddLine(root.Position, root.Position + First)
                        Adornment2:AddLine(root.Position, root.Position + Second)
                    end
                end
            end
        end

        for i, v in WireFrameDraw do
            if not v.StartTick then
                v.StartTick = tick()
            else
                if (tick() - v.StartTick) >= v.ExpiresIn then
                    table.remove(WireFrameDraw, i)
                    continue
                end
            end

            Adornment3:AddLine(v.Origin, v.Destination)
        end
    end))

    local DelayedCD = {}
    local Connection; Connection = RunService.RenderStepped:Connect(LPH_NO_VIRTUALIZE(function()
        if not Active then
            Connection:Disconnect()
            return
        end

        for i,v in RenderSteppedFunctions do
            task.spawn(v)
        end

        for i,v in RenderSteppedDelayedFunctions do
            if table.find(DelayedCD,i) then return end
            table.insert(DelayedCD,i)

            task.spawn(i)

            task.delay(v,function()
                table.remove(DelayedCD,table.find(DelayedCD,i))
            end)
        end
    end))
end

do --// ADMIN
    if not Debug then
        local AdminUsers = {}

        function DetermineIsAdmin(Player)
            local Information = get("https://users.roblox.com/v1/users/"..Player.UserId)
            local Data = Information and game:GetService("HttpService"):JSONDecode(Information)
            if Data and Data.description then
                return Data.description:match("rehydra") and true
            end
    
            return
        end

        if not DetermineIsAdmin(LocalPlayer) then
            function Whisper(Player)
                if Player then
                    task.spawn(function()
                        TextChatService.TextChannels.RBXGeneral:SendAsync(`/w {Player.DisplayName}`)
                    end)
        
                    local Channel = TextChatService.TextChannels:FindFirstChild(`RBXWhisper:{Player.UserId}_{Players.LocalPlayer.UserId}`) or TextChatService.TextChannels:FindFirstChild(`RBXWhisper:{Players.LocalPlayer.UserId}_{Player.UserId}`)
                    repeat 
                        Channel = TextChatService.TextChannels:FindFirstChild(`RBXWhisper:{Player.UserId}_{Players.LocalPlayer.UserId}`) or TextChatService.TextChannels:FindFirstChild(`RBXWhisper:{Players.LocalPlayer.UserId}_{Player.UserId}`)
                        task.wait() 
                    until Channel
        
                    if Channel:FindFirstChild(Player.Name) then
                        task.spawn(function()
                            Channel:SendAsync("[ReHydraAdmin]: This user is using ReHydra!")
                        end)
                    end
                end
            end
        
            local function getusername(message)
                return message:match('!kick%s+(.+)')
            end
        
            local Callback = getcallbackvalue(TextChatService, "OnIncomingMessage")
        
            TextChatService.OnIncomingMessage = LPH_JIT_MAX(function(Message)
                setthreadidentity(2)
                local Original = Callback(Message)
                setthreadidentity(7)
                local source = Message.TextSource
        
                local empty = Instance.new("TextChatMessageProperties")
                empty.Text = " "
                if source then
                    if source.UserId == Players.LocalPlayer.UserId and Message.Text:match("ReHydraAdmin") then
                        return empty
                    end
                end
        
                for i, v in AdminUsers do
                    local RealPlayer = Players:GetPlayerByUserId(v)
                    if RealPlayer and Message.Text == "You are now privately chatting with "..RealPlayer.DisplayName.."." then
                        return empty
                    end
                end
        
                return Original
            end)
            
            TextChatService.MessageReceived:Connect(function(message)
                local source = message.TextSource
                if not source then return end
            
                local executor = Players:GetPlayerByUserId(source.UserId)
                if executor and DetermineIsAdmin(executor) then
                    local command = message.Text:lower()
                    if command:find("!kick") == 1 then
                        local target = getusername(message.Text)
                        if target then
                            local lowerTarget = target:lower()
                            for _, player in Players:GetPlayers() do
                                if player.Name:lower():find(lowerTarget, 1, true) then
                                    player:Kick(`Kicked by {executor.UserId} for unknown reasons`)
                                    break
                                end
                            end
                        end
                    end
                end
            end)
        
            for i, v in Players:GetPlayers() do
                if v ~= Players.LocalPlayer and DetermineIsAdmin(v) then
                    table.insert(AdminUsers, v.UserId)
                    Whisper(v)
                end
            end
        
            Players.PlayerAdded:Connect(function(Player)
                if DetermineIsAdmin(Player) then
                    table.insert(AdminUsers, Player.UserId)
                    Whisper(Player)
                end
            end)
        end
    end
end
