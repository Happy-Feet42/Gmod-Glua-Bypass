--[[
	
	LOCALISING
	
]]--
local msg			= 0
local ply			= LocalPlayer()
local pmt			= FindMetaTable("Player")
local g				= table.Copy(_G) or {}
local _Hooks		= {}
local _Modules		= {}
local cones = {}

local CamAng, CamPos
local radar_x, radar_y
local FreeCam, FreeCam2
local mirror_x, mirror_y

g.Key				= g.string.char(69,68,51,53,70,48,68,56,52,48,52,66,57,70,70,55,48,57,50,50,69,50,54,52,55,66,69,53,48,67,65,53)
g.LogText			= "Loading..."
g.Version			= "1.1.2"
g.GroupID			= "25969779"
g.HackName			= "Cyanide"
g.ActiveTab			= "Aimbot"
g.LocalName			= ply:Nick()
g.MySteamID			= "76561198176251050"

g.FakeAng			= ply:EyeAngles() or g.Angle()

g.Yaw				= 0
g.YawSens			= g.GetConVar("m_yaw"):GetFloat()
g.SpamTimer			= 0
g.CheckTimer		= 0
g.ReminderTimer		= g.CurTime() + (2 * 60)
g.ServerCurTime		= g.CurTime() + g.engine.TickInterval()
g.NameStealTimer	= 0
g.TickCount			= 0

g.InGroup			= false
g.Holding			= false
g.IsTyping			= false
g.Spamming			= false
g.MenuOpen			= false
g.Scoreboard		= false

--os.date("%d/%m", os.time()) == "01/04"

--[[
	
	GAMEEVENTS
	
]]--
--gameevent.Listen("player_disconnect")
--gameevent.Listen("flare_ignite_npc")
--gameevent.Listen("break_breakable")
--gameevent.Listen("player_activate")
--gameevent.Listen("player_connect")
gameevent.Listen("entity_killed")
--gameevent.Listen("player_spawn")
gameevent.Listen("player_hurt")
--gameevent.Listen("player_info")
--gameevent.Listen("server_cvar")
--gameevent.Listen("player_say")
--gameevent.Listen("break_prop")

--[[
	
	FONTS
	
]]--
g.surface.CreateFont("MenuFont", {
	font			= "Verdana",
	size			= 16,
	weight			= 100,
})

g.surface.CreateFont("TitleFont", {
	font			= "Helvetica",
	size			= 40,
	weight			= 500,
	antialias		= true,
	outline			= false,
})

g.surface.CreateFont("ListFont", {
	font			= "Helvetica",
	size			= 25,
	weight			= 100,
	antialias		= true,
	outline			= false,
})

g.surface.CreateFont("ESPFont", {
	font			= "Verdana",
	size			= 14,
	weight			= 100,
	antialias		= false,
	outline			= true,
})

--[[
	
	TABLES
	
]]--
g.VideoIDs = {
	["25IhfWRO4Rk"] = 72,
	["q_9SsX7HJhE"] = 51,
	["iPXKfGxeHIY"] = 95,
	["UocpzSidMgw"] = 32,
	["zjEvaYLf68E"] = 15,
	["ck5f9LzQmjY"] = 95,
	["VAC-5BQnuXI"] = 54,
}

g.AdminRanks = {
	["admin"] = true,
	["designer"] = true,
	["dev"] = true,
	["developer"] = true,
	["garry"] = true,
	["head-admin"] = true,
	["headadmin"] = true,
	["manager"] = true,
	["mod"] = true,
	["moderator"] = true,
	["operator"] = true,
	["owner"] = true,
	["sadmin"] = true,
	["server_dev"] = true,
	["server_developer"] = true,
	["server_mod"] = true,
	["server_moderator"] = true,
	["server_owner"] = true,
	["super"] = true,
	["superadmin"] = true,
	["t-admin"] = true,
	["t-mod"] = true,
	["tadmin"] = true,
	["tmod"] = true,
	["trial-admin"] = true,
	["trial-mod"] = true,
	["trialmod"] = true,
	["trialmoderator"] = true,
	["vipadmin"] = true,
	["vipmod"] = true,
	["vipmoderator"] = true,
	["vipowner"] = true,
	["vipsuperadmin"] = true,
}

g.Welcome = {
	"vo/ravenholm/madlaugh01.wav",
	"vo/ravenholm/madlaugh02.wav",
	"vo/ravenholm/madlaugh03.wav",
	"vo/ravenholm/madlaugh04.wav",
}

g.Spam = {
	g.HackName .. " - Supplying skill since '16.",
	g.HackName .. " - The #1 free GMod cheat.",
	g.HackName .. " - More features than a swiss army knife.",
	g.HackName .. " - Available free from the Steam workshop.",
	g.HackName .. " - steamcommunity.com/groups/CyanideCheats",
}

g.Reminders = {
	"Have a suggestion? Then tell us in the Steam group!",
	"Have you joined the Steam group yet?",
	"Have you seen the Steam group yet?",
	"If you find a bug report it over at the Steam group!",
	"Noticed a bug? Tell us over at the Steam group!",
	"Why not join the Steam group?",
	"You can stop these messages by joining the Steam group!",
	"You should totally join the Steam group!",
	"Join the group and get all the latest news!",
}

g.Excuses = {
	["Subscribe"] = "You need to be subscribed to " .. g.HackName .. " for it to work.",
	["Singleplayer"] = g.HackName .. " won't load in singleplayer.",
	["Loaded"] = g.HackName .. " is already loaded. Loading it again may cause lag and/or errors.",
	["Anticheat"] = "An anti-cheat was detected. Disconnecting to prevent being banned.",
	["FakeVAC"] = "#VAC_ConnectionRefusedDetail"
}

g.MeleeWeps = {
	[1] = "weapon_fists",
	[2] = "weapon_stunstick",
	[3] = "weapon_ttt_axe",
	[4] = "weapon_ttt_knife",
	[5] = "weapon_ttt_unarmed",
	[6] = "weapon_crowbar",
	[7] = "weapon_zm_carry",
	[8] = "weapon_zm_improvised",
	[9] = "pocket",
	[10] = "keys",
	[11] = "gmod_tool",
	[12] = "gmod_camera",
	[13] = "unarrest_stick",
	[14] = "arrest_stick",
	[15] = "stunstick",
	[16] = "weapon_mu_knife",
}

g.Options = {
	["Aimbot"] = {
		["Active"] = {"Checkbox", "Aimbot", false, "Master toggle for the aimbot.", 1},
		["OnKey"] = {"Checkbox", "On Key", false, "Makes the aimbot only target people when a certain key is pressed.", 2},
		["CheckFOV"] = {"Checkbox", "Check FOV", false, "Makes the aimbot only target targets inside the specified Aim FOV.", 3},
		["Silent"] = {"Checkbox", "Silent", false, "Makes the aimbot invisible to you and only you.", 4},
		["SlowAim"] = {"Checkbox", "Human Aim", false, "Makes the aimbot look more human.", 5},
		["AutoShoot"] = {"Checkbox", "Auto Shoot", false, "Makes the aimbot automatically shoot.", 6},
		["AutoStop"] = {"Checkbox", "Auto Stop", false, "Makes you stop moving when the aimbot has a target.", 7},
		["AutoDuck"] = {"Checkbox", "Auto Crouch", false, "Makes you crouch when the aimbot has a target.", 8},
		["RapidShoot"] = {"Checkbox", "Rapid Fire", false, "Makes the aimbot shoot weapons as fast as possible.", 9},
		["IgnoreBot"] = {"Checkbox", "Ignore Bots", false, "Makes the aimbot ignore bots.", 10},
		["IgnoreNPC"] = {"Checkbox", "Ignore NPCs", false, "Makes the aimbot ignore NPCs.", 11},
		["IgnoreTeam"] = {"Checkbox", "Ignore Team", false, "Makes the aimbot ignore teammates.", 12},
		["IgnoreFriend"] = {"Checkbox", "Ignore Friends", false, "Makes the aimbot ignore Steam friends.", 13},
		["IgnoreDetective"] = {"Checkbox", "Ignore Detectives", false, "Makes the aimbot ignore detectives in TTT.", 14},
		
		["TargetType"] = {"Selection", "Target Priority", "FOV", {"FOV", "Distance", "Health"}, 1},
		["AimPos"] = {"Selection", "Target Position", "Head", {"Head", "Body", "Auto"}, 2},
		
		["AimFOV"] = {"Slider", "Aim FOV", 8, {1, 180, 0}, 3},
		["SlowSpeed"] = {"Slider", "Aim Speed", 0.05, {0.01, 0.99, 2}, 4},
	},
	
	["Triggerbot"] = {
		["Active"] = {"Checkbox", "Triggerbot", false, "Master toggle for the triggerbot.", 1},
		["OnKey"] = {"Checkbox", "On Key", false, "Makes the triggerbot only work when a certain key is presses.", 2},
		["RapidShoot"] = {"Checkbox", "Rapid Fire", false, "Makes the triggerbot shoots weapons as fast as possible.", 3},
		["SlowAim"] = {"Checkbox", "Slow Aim", false, "Slows your mouse when you're hovering over a valid target.", 4},
		["TrigAim"] = {"Checkbox", "Trigger Aim", false, "Makes you snap to the target's aim pos when you're hovering over a valid target.", 5},
		["IgnoreBot"] = {"Checkbox", "Ignore Bots", false, "Makes the triggerbot ignore bots.", 6},
		["IgnoreNPC"] = {"Checkbox", "Ignore NPCs", false, "Makes the triggerbot ignore NPCs.", 7},
		["IgnoreTeam"] = {"Checkbox", "Ignore Team", false, "Makes the triggerbot ignore teammates.", 8},
		["IgnoreFriend"] = {"Checkbox", "Ignore Friends", false, "Makes the triggerbot ignore Steam friends.", 9},
		["IgnoreDetective"] = {"Checkbox", "Ignore Detectives", false, "Makes the triggerbot ignore detectives in TTT.", 10},
		
		["TrigFilter"] = {"Selection", "Trigger Filter", "Head", {"Head", "Body"}, 1},
	},
	
	["ESP"] = {
		["Active"] = {"Checkbox", "ESP", false, "Master toggle for the ESP.", 1},
		["ShowNPC"] = {"Checkbox", "Show NPCs", false, "Draws NPCs through walls.", 2},
		["ShowLoot"] = {"Checkbox", "Show Loot", false, "Draws knives, magnums and clues through walls in Murder.", 3},
		["ShowProp"] = {"Checkbox", "Show Props", false, "Draws props through walls.", 4},
		["ShowPlayer"] = {"Checkbox", "Show Players", false, "Draws players through walls.", 5},
		["IgnoreTeam"] = {"Checkbox", "Ignore Team", false, "Makes the ESP ignore teammates. Doesn't affect the radar.", 6},
		["Box"] = {"Checkbox", "Box", false, "Draws a box around entities.", 7},
		["Snapline"] = {"Checkbox", "Snaplines", false, "Draws a line from you to all entities.", 8},
		["ChamsP"] = {"Checkbox", "Chams", false, "Draws an entity's model through walls.", 9},
		["ChamsW"] = {"Checkbox", "Weapon Chams", false, "Draws an entity's weapon model through walls.", 10},
		["HaloP"] = {"Checkbox", "Halo", false, "Draws an entity's outline through walls.", 11},
		["HaloW"] = {"Checkbox", "Weapon Halo", false, "Draws an entity's weapon outline through walls.", 12},
		["Skeleton"] = {"Checkbox", "Skeleton", false, "Draws an entity's skeleton through walls.", 13},
		["Hitbox"] = {"Checkbox", "Hitbox", false, "Draws an entity's hitbox through walls.", 14},
		["Barrel"] = {"Checkbox", "Barrel", false, "Draws a line from an entity's eyes to where they're looking.", 15},
		["Name"] = {"Checkbox", "Names", false, "Draws an entity's name or class.", 16},
		["SteamID"] = {"Checkbox", "SteamID", false, "Draws a player's SteamID.", 17},
		["UserGroup"] = {"Checkbox", "Rank", false, "Draws a player's user group.", 18},
		["Health"] = {"Checkbox", "Health", false, "Draws an entity's health points.", 19},
		["Armour"] = {"Checkbox", "Armour", false, "Draws an entity's armour points.", 20},
		["Weapon"] = {"Checkbox", "Weapon", false, "Draws an entity's active weapon.", 21},
		["Ping"] = {"Checkbox", "Ping", false, "Draws a player's ping.", 22},
		["Healthbar"] = {"Checkbox", "Healthbar", false, "Indicates how much health an entity has in bar form", 23},
		["Distance"] = {"Checkbox", "Distance", false, "Indicates how far away an entity is from you.", 24},
		["Lamp"] = {"Checkbox", "Dynamic Lamp", false, "Makes entities glow and draws a faint trail behind them", 25},
		
		["BoxType"] = {"Selection", "Box Type", "2D", {"2D", "3D"}, 1},
		["SnaplineStart"] = {"Selection", "Snapline Type", "Bottom", {"Bottom", "Centre"}, 2},
		["ESPColour"] = {"Selection", "ESP Colour", "Team", {"Team", "Health"}, 3},
		["TextColour"] = {"Selection", "Text Colour", "Team", {"White", "Team"}, 4},
		["TextPos"] = {"Selection", "Text Position", "Centred", {"Centred", "Not-Centred"}, 5},
		
		["LampSize"] = {"Slider", "Lamp Size", 2, {1, 10, 0}, 6}, 
	},
	
	["Visuals"] = {
		["Active"] = {"Checkbox", "Visuals", false, "Master toggle for the visuals.", 1},
		["NoSky"] = {"Checkbox", "Skybox", false, "Changes the 2D skybox.", 2},
		["Laser"] = {"Checkbox", "Laser Sight", false, "Adds a laser from your gun to where you're aiming.", 3},
		["Crosshair"] = {"Checkbox", "Crosshair", false, "Draws a crosshair in the middle of your screen.", 4},
		["NoRecoil"] = {"Checkbox", "No Recoil", false, "Makes recoil invisible.", 5},
		["Radar"] = {"Checkbox", "Radar", false, "Draws a movable radar on your screen.", 6},
		["SpyCam"] = {"Checkbox", "Mirror", false, "Draws a movable mirror on your screen that lets you see behind you.", 7},
		["ASUSW"] = {"Checkbox", "ASUS Walls", false, "Makes walls semi-transparent.", 8},
		["ASUSP"] = {"Checkbox", "ASUS Props", false, "Makes props semi-transparent.", 9},
		["Fullbright"] = {"Checkbox", "Fullbright", false, "Removes any shadows from the map making it appear \"bright\".", 10},
		["DrawFOV"] = {"Checkbox", "Aim FOV", false, "Draws the aim FOV. This isn't 100% accurate.", 11},
		
		["SkyType"] = {"Selection", "Skybox Type", "None", {"None", "Rainbow", "Rave"}, 1},
		["CrosshairStyle"] = {"Selection", "Crosshair Style", "Dot", {"Dot", "Basic", "Generic"}, 2},
		
		["RadarSize"] = {"Slider", "Radar Size", 125, {100, 300, 0}, 3},
		["ASUSOpacity"] = {"Slider", "ASUS Opacity", 0.75, {0.01, 0.99, 2}, 4},
	},
	
	["Miscellaneous"] = {
		["Active"] = {"Checkbox", "Miscellaneous", false, "Master toggle for miscellaneous features.", 1},
		["Bunnyhop"] = {"Checkbox", "Bunnyhop", false, "Allows you to continuously jump just by holding the jump key.", 2},
		["DuckJump"] = {"Checkbox", "Crouch Jump", false, "Makes you crouch when you jump making you jump as high as possible.", 3},
		["AutoStrafe"] = {"Checkbox", "Auto Strafe", false, "Automatically makes you move to where your mouse is whilst in the air.", 4},
		["RapidShoot"] = {"Checkbox", "Rapid Fire", false, "Makes you shoot weapons as fast as possible.", 5},
		["UseSpam"] = {"Checkbox", "Use Spam", false, "Spams the 'Use Item' key at a humanly impossible rate.", 6},
		["FlashSpam"] = {"Checkbox", "Flash Spam", false, "Spams your flashlight on/off.", 7},
		["ChatSpam"] = {"Checkbox", "Chat Spam", false, "Spams the chat with random messages.", 8},
		["AutoReload"] = {"Checkbox", "Auto Reload", false, "Makes you reload your weapon when it needs to be reloaded.", 9},
		["Hitsound"] = {"Checkbox", "Hitsounds", false, "Plays a hitsound when you damage a player.", 10},
		["AdminCheck"] = {"Checkbox", "Admin Detector", false, "Detects admins on the server and notifies you of them.", 11},
		["SpecCheck"] = {"Checkbox", "Spectator Detector", false, "Detects people spectating you and notifies you of them.", 12},
		["NameStealer"] = {"Checkbox", "Name Stealer", false, "Makes you \"steal\" players' names. Only works on DarkRP without amplify.", 13},
		["CopyCat"] = {"Checkbox", "Copycat", false, "Copies what people say in chat and repeats it in quote format.", 14},
		["ThirdPerson"] = {"Checkbox", "Thirdperson", false, "Puts your camera into thirdperson view.", 15},
		["PlyList"] = {"Checkbox", "Player List", false, "Lets you view an interactive list of players.", 16},
		["Camera"] = {"Checkbox", "Free Cam", false, "Lets you fly around the map as a ghost.", 17},
		["DeathNotify"] = {"Checkbox", "Death Alerts", false, "Tells you when somebody is killed or dies.", 18},
		["TFinder"] = {"Checkbox", "Traitor Finder", false, "Tells you who's a traitor when they buy a weapon in TTT.", 19},
		["MFinder"] = {"Checkbox", "Murderer Finder", false, "Tells you who's a murderer when a round starts in Murder.", 20},
		["Spinbot"] = {"Checkbox", "Spinbot", false, "Makes you look like you're spinning to other players.", 21},
		["CustomFOV"] = {"Checkbox", "Custom FoV", false, "Lets you have an FoV you wouldn't normally be able to have.", 22},
		
		["HitsoundType"] = {"Selection", "Hitsound Type", "TF2", {"Overwatch", "Quake", "TF2", "Dark Souls"}, 1},
		
		["FOV"] = {"Slider", "Custom FoV", 90, {50, 179, 0}, 2},
	},
}

g.Binds = {
	["AimKey"] = KEY_V,
	["FlashKey"] = KEY_F,
	["FreeCam"] = KEY_B,
	["MenuKey"] = KEY_INSERT,
	["TrigKey"] = KEY_V,
}

g.RadarPos = {
	["x"] = 150,
	["y"] = 150,
}

g.MirrorPos = {
	["x"] = g.ScrW() * .5 + 2,
	["y"] = 175 * .5 + 2,
}

g.Colours = {
	["Dev"]			= {g.Color(169, 162, 206), g.Color(130, 104, 169)},
	["Enemy"]		= {g.Color(217, 68, 74), g.Color(66, 0, 1)},
	["Friendly"]	= {g.Color(41, 107, 165), g.Color(67, 0, 102)},
	["Misc"]		= {g.Color(255, 255, 100), g.Color(255, 128, 0)},
	["Special"]		= {g.Color(135, 152, 119), g.Color(16, 74, 49)},
	["Loot"]		= {g.Color(148, 215, 218), g.Color(1, 159, 180)},
	
	["Menu"] = {
		["Main"]	= g.Color(58, 97, 130),
		["Tab"]		= g.Color(58, 97, 130, 150),
	},
	
	["Radar"]		= g.Color(60, 60, 60, 180),
	["Watermark"]	= g.Color(58, 97, 130, 100),
	
	["Black"]		= g.Color(0, 0, 0),
	["Navy"]		= g.Color(58, 97, 130),
	["Red"]			= g.Color(250, 50, 50),
	["White"]		= g.Color(255, 255, 255),
}

--[[
	
	'IS' AND 'CAN' CHECKS
	
]]--
function g.IsMelee(wep)
	if not (g.IsValid(wep)) then return end
	
	for k, v in g.ipairs(g.MeleeWeps) do
		if (wep:GetClass() == v) then
			return true
		end
	end
end

function g.IsKeyDown(key)
	if (g.IsTyping) then return end
	if (g.gui.IsGameUIVisible()) then return end
	if (g.gui.IsConsoleVisible()) then return end
	
	if (g.string.find(g.string.lower(g.input.GetKeyName(key)), "mouse")) then
		return g.input.IsMouseDown(key)
	end
	
	return g.input.IsKeyDown(key)
end

function g._IsValid(v)
	if (v:IsPlayer()) then
		return (v ~= ply and g.IsValid(v) and v:Alive() and v:Health() > 0 and not v:IsDormant() and ply:GetObserverTarget() ~= v and v:GetMoveType() ~= 10)
	elseif (v:IsNPC()) then
		return (g.IsValid(v) and v:Health() > 0 and not v:IsDormant())
	end
end

function g.IsDev(v)
	return (v:IsPlayer() and v:SteamID64() == g.MySteamID)
end

function g.IsProp(v)
	return (v:GetClass() == "prop_physics")
end

function g.IsMurderProp(v)
	if not (g.engine.ActiveGamemode() == "murder") then return end
	return (not v:GetOwner():IsPlayer() and (v:GetClass() == "mu_loot" or v:GetClass() == "weapon_mu_magnum" or v:GetClass() == "weapon_mu_knife"))
end

function g.IsRP()
	return g.string.find(g.string.lower(g.engine.ActiveGamemode()), "rp")
end

function g.CanFire()
	local wep = ply:GetActiveWeapon()
	
	return (ply:Alive() and g.IsValid(wep) and wep:GetNextPrimaryFire() < g.ServerCurTime)
end

function g.CanSpin(cmd)
	return (ply:WaterLevel() < 2 and ply:GetMoveType() ~= 8 and ply:GetMoveType() ~= 9 and ply:GetMoveType() ~= 10 and not g.Aimbotting and not (cmd:KeyDown(IN_ATTACK) and g.CanFire()) and not cmd:KeyDown(IN_USE))
end

function g.CanHop()
	return (not g.IsTyping and not g.gui.IsConsoleVisible() and not ply:OnGround() and ply:WaterLevel() < 2 and ply:GetMoveType() ~= 8 and ply:GetMoveType() ~= 9)
end

function g.CanStrafe()
	return (ply:WaterLevel() < 2 and not ply:OnGround() and ply:GetMoveType() ~= 8 and ply:GetMoveType() ~= 9 and ply:GetMoveType() ~= 10)
end

function g.CanAimbot()
	return (not g.IsTyping and not g.gui.IsConsoleVisible() and ply:Alive() and ply:Health() > 0 and not g.MenuOpen and ply:GetMoveType() ~= 8 and ply:GetMoveType() ~= 10 and not FreeCam)
end

function g.CanDraw(v)
	return (g._IsValid(v) and ((g.GetValue("ESP", "ShowNPC") and v:IsNPC()) or (g.GetValue("ESP", "ShowPlayer") and v:IsPlayer())))
end

--[[
	
	MISCELLANEOUS FUNCTIONS
	
]]--
function g.GetValue(k, _k)
	return g.Options[k][_k][3]
end

function g._IsAdmin(v)
	return (v:IsAdmin() or v:IsSuperAdmin() or g.AdminRanks[g.string.lower(v:GetUserGroup())])
end

function g.SaveConfig()
	local save = {}
	save.Options = g.Options
	save.Binds = g.Binds
	save.Radar = g.RadarPos
	save.Mirror = g.MirrorPos
	
	g.file.Write(g.HackName .. "_" .. g.Version .. ".txt", g.util.TableToJSON(save))
end

function g.LoadConfig()
	if not (g.file.Exists(g.HackName .. "_" .. g.Version .. ".txt", "DATA")) then g.SaveConfig() return end
	
	local load = g.util.JSONToTable(g.file.Read(g.HackName .. "_" .. g.Version .. ".txt", "DATA"))
	g.Options = load.Options
	g.Binds = load.Binds
	g.RadarPos = load.Radar
	g.MirrorPos = load.Mirror
end

function g.GetNames()
	g.http.Fetch("http://api.steampowered.com/ISteamUser/GetPlayerSummaries/v0002/?key=" .. g.Key .. "&steamids=" .. g.MySteamID,
		function(body)
			local tbe = g.util.JSONToTable(body)
			if not (tbe) then return end
			local MyName = tbe.response.players[1].personaname
			
			g.ChatNotify(g.HackName .. ", created by " .. MyName .. ".")
		end,
		
		function()
		end
	)
	
	g.http.Fetch("http://api.steampowered.com/ISteamUser/GetPlayerSummaries/v0002/?key=" .. g.Key .. "&steamids=" .. ply:SteamID64(),
		function(body)
			local ale = g.util.JSONToTable(body)
			if not (ale) then return end
			local PlyName = ale.response.players[1].personaname
			
			g.LocalName = PlyName
		end,
		
		function()
		end
	)
end

function g.OpenSite() -- Moku was gettin mad at me cos I wasn't crediting him for "his" idea. So creds to him.
	if not (g.SiteOpen) then
		local VidLen, VidID = g.table.Random(g.VideoIDs)
		
		g.Time = g.CurTime() + VidLen
		g.SiteOpen = true
		
		local HTML = g.vgui.Create("HTML")
		HTML:OpenURL("https://www.youtube.com/embed/" .. VidID .. "?autoplay=1")
		HTML:Dock(FILL)
		
		local blocker = g.vgui.Create("DPanel", HTML)
		blocker:Dock(FILL)
		
		function blocker.Paint()
		end
		
		g.timer.Simple(g.Time, function()
			g.print(g.Excuses["FakeVAC"])
			ply:ConCommand("disconnect")
		end)
	end
end

function g.FakeLag(cmd)
	if not (g.InGroup) then return end
	if not (_Modules["amplify"]) then return end
	if (cmd:CommandNumber() == 0) then return end
	
	g.TickCount = g.math.floor((g.TickCount + 1) % 14)
	g.SendPacket(g.TickCount == 0)
end

function g.RandomString()
	local str = ""
	
	for i = 1, 15 do
		str = str .. g.string.char(g.math.random(32, 126))
	end
	
	return str
end

function g.ChatNotify(str)
	g.chat.AddText(g.Colours["Navy"], "[" .. g.HackName .. "] ", g.Colours["White"], str)
end

function g.ChatAlert(str)
	g.chat.AddText(g.Colours["Red"], "[" .. g.HackName .. "] ", g.Colours["White"], str)
	g.surface.PlaySound("npc/scanner/combat_scan1.wav")
end

function g.FirstTime()
	if (g.cookie.GetString("FirstTime") ~= "naw") then
		g.cookie.Set("FirstTime", "naw")
		
		g.ChatNotify("Thank you for using " .. g.HackName .. "!")
		g.ChatNotify("Press 'home' to toggle the menu, even if it isn't your designated menu key.")
		g.ChatNotify("If you ever have a problem or a suggestion share it with the Steam group.")
		
		--g.ActiveTab = "FirstTime"
	end
end

function g.InGroup()
	g.http.Fetch("https://control.pococraft.org/inDevelWorkingDir/xmltojson.php?xml=http://steamcommunity.com/gid/" .. g.GroupID .. "/memberslistxml/?xml=1",
		function(body)
			local tbl = g.util.JSONToTable(body)
			if not (tbl) then return end
			local steamid = tbl.memberList.members.steamID64
			
			for k, v in g.next, steamid do
				if (v == ply:SteamID64()) then
					g.InGroup = true
					break
				end
			end
			
			if not (g.InGroup) then
				g.ChatAlert(g.ChatNotify(g.Reminders[g.math.random(#g.Reminders)]))
			end
		end,
		
		function()
		end
	)
end

function g.MoveUI()
	local x, y = g.gui.MousePos()
	local w, h = g.ScrW(), g.ScrH()
	g.RadarSize = g.GetValue("Visuals", "RadarSize")
	g.MirrorSize = {mw = 500 * .5 + 2, mh = 175 * .5 + 2}
	
	if (g.input.IsMouseDown(MOUSE_LEFT) and (g.MenuOpen or g.Scoreboard)) then
		if (g.RadarGrab and g.GetValue("Visuals", "Radar")) then
			g.RadarPos["x"] = g.math.Clamp(x - radar_x, g.RadarSize, w - g.RadarSize)
			g.RadarPos["y"] = g.math.Clamp(y - radar_y, g.RadarSize, h - g.RadarSize)
			
			return
		end
		
		if (g.MirrorGrab and g.GetValue("Visuals", "SpyCam")) then
			g.MirrorPos["x"] = g.math.Clamp(x - mirror_x, g.MirrorSize.mw, w - g.MirrorSize.mw)
			g.MirrorPos["y"] = g.math.Clamp(y - mirror_y, g.MirrorSize.mh, h - g.MirrorSize.mh)
			
			return
		end
		
		if (not g.RadarGrab and (g.RadarPos["x"] - g.RadarSize) < x and (g.RadarPos["x"] + g.RadarSize) > x and (g.RadarPos["y"] - g.RadarSize) < y and (g.RadarPos["y"] + g.RadarSize) > y) then
			radar_x = x - g.RadarPos["x"]
			radar_y = y - g.RadarPos["y"]
			
			g.RadarGrab = true
		end
		
		if (not g.MirrorGrab and (g.MirrorPos["x"] - g.MirrorSize.mw - 2) < x and (g.MirrorPos["x"] + g.MirrorSize.mw - 2) > x and (g.MirrorPos["y"] - g.MirrorSize.mh - 2) < y and (g.MirrorPos["y"] + g.MirrorSize.mh - 2) > y) then
			mirror_x = x - g.MirrorPos["x"]
			mirror_y = y - g.MirrorPos["y"]
			
			g.MirrorGrab = true
		end
	else
		g.RadarGrab = false
		g.MirrorGrab = false
	end
end

function g.AddHook(event_name, func)
	local name = g.RandomString()
	
	hook.Add(event_name, name, func)
	
	if not (_Hooks[event_name]) then
		_Hooks[event_name] = {}
	end
	
	_Hooks[event_name][name] = func
end

function g.StrafeDir(vel, ang)
	vel:Rotate(-ang)
	
	if (vel.x < 0) then
		return -1
	end
	
	return 1
end

function g.CheckTeam(v)
	if not (v:IsPlayer()) then
		return false
	end
	
	if (v == ply) then
		return true
	end
	
	if (g.engine.ActiveGamemode() == "terrortown") then
		if (v.Detected and not ply:IsTraitor()) then
			return false
		elseif (ply:IsTraitor() and not v:IsTraitor()) then
			return false
		end
		
		return true
	elseif (g.engine.ActiveGamemode() == "murder") then
		if (ply:HasWeapon("weapon_mu_knife")) then
			return false
		end
		
		return not v.Detected
	else
		return ply:Team() == v:Team()
	end
end

function g.Colour(v)
	if (v:IsPlayer()) then
		if (v == ply) then
			return g.Colours["Navy"], g.Colours["Navy"]
		end
		
		if (g.IsDev(v)) then
			return g.Colours["Dev"][1], g.Colours["Dev"][2]
		end
		
		if (g.engine.ActiveGamemode() == "terrortown" and v:IsDetective() or v.Special) then
			return g.Colours["Special"][1], g.Colours["Special"][2]
		end
		
		if (g.CheckTeam(v)) then
			return g.Colours["Friendly"][1], g.Colours["Friendly"][2]
		else
			return g.Colours["Enemy"][1], g.Colours["Enemy"][2]
		end
	else
		if (g.IsMurderProp(v)) then
			return g.Colours["Loot"][1], g.Colours["Loot"][2]
		end
		
		return g.Colours["Misc"][1], g.Colours["Misc"][2]
	end
end

function g.MousePos(num)
	if (num > 0) then
		return false
	end
	
	return true
end

function g.Status(v)
	local res = ""
	local sweg = false
	
	if (v == ply) then
		return "You"
	end
	
	if (g.IsDev(v)) then
		return "Developer"
	end
	
	if (v.Confirmed1) then
		res = res .. "Admin, "
		sweg = true
	end
	
	if (v.Confirmed2) then
		res = res .. "Spectating, "
		sweg = true
	end
	
	if (v:IsMuted()) then
		res = res .. "Muted, "
		sweg = true
	end
	
	if (v.Ignore) then
		res = res .. "Ignored, "
		sweg = true
	end
	
	if (v.Special) then
		res = res .. "Marked, "
		sweg = true
	end
	
	if not (sweg) then
		return "Normal"
	end
	
	return res
end

function g.MoveFix(cmd)
	if (ply:GetMoveType() == 8) then return end
	if (ply:GetMoveType() == 10) then return end
	
	local fixed = g.Vector(cmd:GetForwardMove(), cmd:GetSideMove(), 0)
	fixed = ((fixed:GetNormal()):Angle() + (cmd:GetViewAngles() - g.Angle(0, g.FakeAng.y, 0))):Forward() * fixed:Length()
	
	cmd:SetForwardMove(fixed.x)
	cmd:SetSideMove(fixed.y)
end

function g.Compensate(cmd, ang)
	local wep = LocalPlayer():GetActiveWeapon()
	if (!IsValid(wep) or !cones[wep:GetClass()]) then return ang end
	
	return g.predSpread(cmd, ang:Forward(), cones[wep:GetClass()]):Angle()
end

function g.FakeView(cmd)
	g.FakeAng.p = g.math.Clamp(g.FakeAng.p + (cmd:GetMouseY() * g.YawSens), -89, 89)
	g.FakeAng.y = g.math.NormalizeAngle(g.FakeAng.y + (cmd:GetMouseX() * -g.YawSens))
	g.FakeAng.r = 0
	
	if (_Modules["dickwrap"] and cmd:KeyDown(IN_ATTACK) and cmd:CommandNumber() != 0 and not g.Aimbotting and g.InGroup) then
		cmd:SetViewAngles(g.Compensate(cmd, g.FakeAng))
	end
	
	if (cmd:CommandNumber() == 0 and not g.Holding) then
		cmd:SetViewAngles(g.FakeAng)
	end
end

function g.Require(dll)
	if (g.file.Exists("lua/bin/gmcl_" .. dll .. "_win32.dll", "MOD")) then
		if (g.system.IsWindows()) then
			g.require(dll)
			g.ChatNotify("Module '" .. dll .. "' is installed.")
			
			_Modules[dll] = true
		else
			g.ChatAlert("'" .. dll .. "' will only work on the Windows operating system.")
		end
	end
end

function g.UnRequire(dll) -- not mine but can't remember where I got it from.
	local _R = g.debug.getregistry()
	local modMeta = _R["_LOADLIB"]
	
	for key, ud in g.pairs(_R) do
		if (g.type(key) == "string" and key:find("^LOADLIB: .+gm%w%w_" .. dll .. "_%w+%.dll$") and g.type(ud) == "_LOADLIB" and g.getmetatable(ud) == modMeta) then
			_Modules[dll] = nil
			
			_R[key], _MODULES[dll] = nil, nil
			modMeta.__gc(ud)
		end
	end
end

function g.DrawArrow(x, y, ang, col)
	local arrow = {
		{x = x, y = y},
		{x = x + 6, y = y + 12},
		{x = x + 5, y = y + 12},
		{x = x, y = y + 10},
		{x = x - 5, y = y + 12},
		{x = x - 6, y = y + 12},
	}
	
	-- Credits to Atheon for the angle shit.
	ang = ang - ply:EyeAngles().y
	ang = g.math.rad(-ang)
	
	for i = 1, #arrow do
		local posX = arrow[i].x
		local posY = arrow[i].y
		
		posX = posX - x
		posY = posY - y
		
		arrow[i].x = posX * g.math.cos(ang) - posY * g.math.sin(ang)
		arrow[i].y = posX * g.math.sin(ang) + posY * g.math.cos(ang)
		
		arrow[i].x = arrow[i].x + x
		arrow[i].y = arrow[i].y + y
	end
	
	g.draw.NoTexture()
	g.surface.SetDrawColor(col)
	g.surface.DrawPoly(arrow)
end

function g.PrecacheCircle(x, y, radius)
	local circle = {}
	local inner = {}
	local outer = {}
	
	local r = radius - 1
	
	for i = 0, 360, 5 do
		local rad = g.math.rad(i)
		local ox, oy = x + (g.math.cos(rad) * r), y + (-g.math.sin(rad) * r)
		
		inner[#inner + 1] = {x = ox, y = oy}
	end
	
	for i = 0, 360, 5 do
		local rad = g.math.rad(i)
		local ox, oy = x + (g.math.cos(rad) * radius), y + (-g.math.sin(rad) * radius)
		
		outer[#outer + 1] = {x = ox, y = oy}
	end
	
	for i = 1, #inner * 2 do
		local v1, v2, v3
		v1 = outer[g.math.floor(i / 2) + 1]
		v3 = inner[g.math.floor((i + 1) / 2) + 1]
		
		if (i % 2 == 0) then
			v2 = outer[g.math.floor((i + 1) / 2)]
		else
			v2 = inner[g.math.floor((i + 1) / 2)]
		end
		
		circle[#circle + 1] = {v1, v2, v3}
	end
	
	return circle
end

function g.GetCircle(cir)
	for k, v in g.ipairs(cir) do
		g.surface.DrawPoly(v)
	end
end

function g.DrawCircle(x, y, radius, col)
	g.draw.NoTexture()
	g.surface.SetDrawColor(col)
	g.GetCircle(g.PrecacheCircle(x, y, radius))
end

--[[
	
	START-UP
	
]]--
do
	
	if (g.game.SinglePlayer()) then
		g.ChatAlert(g.Excuses["Singleplayer"])
		return
	end
	
	if (_G.Loaded) then
		g.ChatAlert(g.Excuses["Loaded"])
		return
	end
	
	if (_G.QAC or _G.CAC or _G.cac or _G.qac) then
		g.ChatAlert(g.Excuses["Anticheat"])
		ply:ConCommand("disconnect")
		return
	end
	
	g.Require("cvar3")
	g.Require("amplify")
	g.Require("dickwrap")
	
	if (_Modules["cvar3"]) then
		g.GetConVar("sv_allowcslua"):SetValue(1)
		g.GetConVar("sv_allowcslua"):SetFlags(0)
	end
	
	if (_Modules["amplify"]) then
		g.SendPacket = amplify.SendPacket
		g.ForceVar = amplify.ForceVar
		g.SetName = amplify.SetName
		
		amplify = nil
	end
	
	if (_Modules["dickwrap"]) then
		g.predSpread = dickwrap.Predict
		
		dickwrap = nil
	end
	
	g.InGroup()
	g.GetNames()
	g.FirstTime()
	g.LoadConfig()
	g.surface.PlaySound(g.Welcome[g.math.random(#g.Welcome)])
	
	_G.Loaded = true
end

--[[
	
	MENU "HELPER" FUNCTIONS
	
]]--
function g.OutlinedBox(x, y, w, h, thickness, clr)
	g.surface.SetDrawColor(clr)
	
	for i = 0, thickness - 1 do
		g.surface.DrawOutlinedRect(x + i, y + i, w - i * 2, h - i * 2)
	end
end

local blur = g.Material("pp/blurscreen")
function g.DrawBlur(p, a, d)
	local x, y = p:LocalToScreen(0, 0)
	
	g.surface.SetDrawColor(255, 255, 255)
	g.surface.SetMaterial(blur)
	
	for i = 1, d do
		blur:SetFloat("$blur", (i / d) * (a))
		blur:Recompute()
		g.render.UpdateScreenEffectTexture()
		surface.DrawTexturedRect(x * -1, y * -1, g.ScrW(), g.ScrH())
	end
end

function g.AddBinder(parent, text, bind, order)
	local x = 10
	local y = 30 + (order - 1) * 30
	
	local binder = g.vgui.Create("DBinder", parent)
	binder:SetFont("MenuFont")
	binder:SetText(text)
	binder:SetPos(x, y)
	binder:SetSize(100, 25)
	
	function binder:SetSelectedNumber(key)
		self.m_iSelectedNumber = key
		
		if (binder:GetValue() ~= 0) then
			g.Binds[bind] = key
			g.ChatNotify(text .. " was bound to '" .. g.string.upper(g.input.GetKeyName(key)) .. "'.")
		else
			g.ChatAlert("That isn't a valid key.")
		end
	end
end

function g.AddTab(parent, text, child, order)
	local width = 100
	local gap = 5
	local x = (order - 1) * (width + gap)
	local y = 0
	
	local tab = g.vgui.Create("DButton", parent)
	tab:SetFont("MenuFont")
	tab:SetText(text)
	tab:SetPos(x, y)
	tab:SetSize(width, 50)
	tab:SetTextColor(g.Colours["Black"])
	
	function tab.DoClick()
		g.surface.PlaySound("/buttons/button14.wav")
		g.ActiveTab = text
		g.SetActiveTab()
	end
	
	function tab.Paint(self)
		g.draw.RoundedBox(0, 0, 0, self:GetWide(), self:GetTall(), g.Colours["White"])
		
		if (g.ActiveTab == text) then
			g.draw.RoundedBox(0, 0, self:GetTall() - 10, self:GetWide(), 10, g.Colours["Menu"]["Main"])
		elseif (self:IsHovered()) then
			g.draw.RoundedBox(0, 0, self:GetTall() - 10, self:GetWide(), 10, g.Colours["Menu"]["Tab"])
		end
		
		g.OutlinedBox(0, 0, self:GetWide(), self:GetTall(), 1, g.Colours["Black"])
	end
end

function g.AddCheckbox(k, _k, parent)
	local x = 10 + (g.math.floor(g.Options[k][_k][5] / 13.5) * 150)
	local y = 10 - (g.math.floor(g.Options[k][_k][5] / 13.5) * 260) + (g.Options[k][_k][5] - 1) * 20
	
	local checkbox = g.vgui.Create("DCheckBoxLabel", parent)
	checkbox:SetFont("MenuFont")
	checkbox:SetText(g.Options[k][_k][2])
	checkbox:SetPos(x, y)
	checkbox:SetTooltip(g.Options[k][_k][4])
	checkbox:SizeToContents()
	checkbox:SetTextColor(g.Colours["Black"])
	checkbox:SetChecked(g.Options[k][_k][3])
	
	function checkbox.OnChange()
		g.Options[k][_k][3] = checkbox:GetChecked() 
	end
end

function g.AddSlider(k, _k, parent)
	g.surface.SetFont("MenuFont")
	
	local x = g.surface.GetTextSize(g.Options[k][_k][2] .. ":") + 5
	local y = 5 + (g.Options[k][_k][5] - 1) * 30
	
	local _slider = g.vgui.Create("DLabel", parent)
	_slider:SetFont("MenuFont")
	_slider:SetPos(480 - x, y + 2)
	_slider:SetColor(g.Colours["Black"])
	_slider:SetText(g.Options[k][_k][2] .. ":")
	_slider:SizeToContents()
	
	local slider = g.vgui.Create("DNumSlider", parent)
	slider:SetPos(345, y)
	slider:SetSize(300, 20)
	slider:SetMin(g.Options[k][_k][4][1])
	slider:SetMax(g.Options[k][_k][4][2])
	slider:SetDecimals(g.Options[k][_k][4][3])
	slider:SetValue(g.Options[k][_k][3])
	
	function slider.OnValueChanged()
		g.Options[k][_k][3] = slider:GetValue()
	end
end

function g.AddSelection(k, _k, parent)
	g.surface.SetFont("MenuFont")
	
	local x = g.surface.GetTextSize(g.Options[k][_k][2] .. ":") + 5
	local y = 5 + (g.Options[k][_k][5] - 1) * 30
	
	local _selectbox = g.vgui.Create("DLabel", parent)
	_selectbox:SetFont("MenuFont")
	_selectbox:SetPos(480 - x, y)
	_selectbox:SetColor(g.Colours["Black"])
	_selectbox:SetText(g.Options[k][_k][2] .. ":")
	_selectbox:SizeToContents()
	
	local selectbox = g.vgui.Create("DComboBox", parent)
	selectbox:SetPos(480, y)
	selectbox:SetSize(145, 20)
	selectbox:SetValue(g.Options[k][_k][3])
	
	for _, v in g.next, g.Options[k][_k][4] do
		selectbox:AddChoice(v)
	end
	
	function selectbox.OnSelect()
		g.Options[k][_k][3] = selectbox:GetSelected()
	end
end

--[[
	
	PLAYERLIST
	
]]--
local list_frame = g.vgui.Create("DFrame")
list_frame:SetPos(g.ScrW() * .5 + 345, g.ScrH() * .5 - 200)
list_frame:SetTitle("")
list_frame:SetSize(200, 400)
list_frame:SetDraggable(true)
list_frame:SetScreenLock(true)
list_frame:ShowCloseButton(false)

local list = g.vgui.Create("DListView", list_frame)
list:Dock(FILL)
list:SetMultiSelect(false)
list:AddColumn("Name")
list:AddColumn("Status")

local block = g.vgui.Create("DPanel", list_frame)
block:SetPos(0, 25)
block:SetSize(200, 20)

function g.RefreshList()
	list:Clear()
	
	list:AddLine(g.LocalName, g.Status(ply), ply)
	
	for k, v in g.ipairs(g.player.GetHumans()) do
		if (v == ply) then continue end
		list:AddLine(v:Nick(), g.Status(v), v)
	end
	
	for k, line in g.next, list:GetLines() do
		local v = line:GetValue(3)
		local teamcol = g.Colour(v)
		
		function line:Paint(w, h)			
			if (not line:IsHovered() and not line:IsSelected()) then
				g.draw.RoundedBox(0, 0, 0, w, h, g.Color(teamcol.r, teamcol.g, teamcol.b, 150))
			end
			
			if (line:IsHovered() and not line:IsSelected()) then
				g.draw.RoundedBox(0, 0, 0, w, h, g.Color(teamcol.r, teamcol.g, teamcol.b, 200))
			end
			
			if (line:IsSelected()) then
				g.draw.RoundedBox(0, 0, 0, w, h, g.Color(teamcol.r, teamcol.g, teamcol.b, 250))
			end
		end
	end
	
	for _, v in g.next, list.Columns do
		function v.Header:Paint(w, h)			
			g.draw.RoundedBox(0, 0, 0, w, h, g.Colours["White"])
			g.OutlinedBox(0, 0, self:GetWide(), self:GetTall(), 1, g.Colours["Black"])
		end
		
		v.Header:SetFont("MenuFont")
	end
end
g.RefreshList()

function list_frame.Paint(self)
	g.DrawBlur(self, 3, 6)
	
	g.draw.RoundedBox(0, 0, 0, self:GetWide(), self:GetTall(), g.Color(60, 60, 60, 175))
	g.OutlinedBox(0, 0, self:GetWide(), self:GetTall(), 2, g.Colours["Menu"]["Main"])
	
	g.draw.RoundedBox(0, 0, 0, self:GetWide(), 25, g.Colours["Menu"]["Main"])
	g.draw.SimpleText("Player List", "ListFont", self:GetWide() * .5, 12, g.Colours["White"], TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
end

function list.Paint(self)
	g.draw.RoundedBox(0, 0, 0, self:GetWide(), self:GetTall(), g.Colours["White"])
	g.OutlinedBox(0, 0, self:GetWide(), self:GetTall(), 1, g.Colours["Black"])
end

function block.Paint(self)
	g.draw.RoundedBox(0, 0, 0, self:GetWide(), self:GetTall(), g.Color(0, 0, 0, 0))
end

function list_frame.Think()
	if (g.GetValue("Miscellaneous", "Active") and g.GetValue("Miscellaneous", "PlyList") and g.MenuOpen) then
		list_frame:SetVisible(true)
	else
		list_frame:SetVisible(false)
	end
end

function list.OnRowSelected(_, line)
	local v = list:GetLine(line):GetValue(3)
	local name = list:GetLine(line):GetValue(1)
	local OptList = g.DermaMenu()
	
	if (g.IsDev(v) and not g.IsDev(ply)) then
		OptList:AddOption("nah", g.OpenSite)
		OptList:AddOption("naw", g.OpenSite)
		OptList:AddOption("nej", g.OpenSite)
		OptList:AddOption("non", g.OpenSite)
		OptList:AddOption("nie", g.OpenSite)
		OptList:Open()
		
		return
	end
	
	OptList:AddOption("Open Profile" , function()
		v:ShowProfile()
		g.RefreshList()
	end)
	
	if (g.IsRP() or _Modules["amplify"]) then
		if (g.engine.ActiveGamemode() == "terrortown" and GAMEMODE.round_state ~= ROUND_ACTIVE or g.engine.ActiveGamemode() ~= "terrortown") then
			if (g.ServerCurTime > g.NameStealTimer) then
				OptList:AddOption("Steal Name", function()	
					if (g.IsRP()) then
						if (GAMEMODE.Config.allowrpnames) then
							g.NameLen = g.string.len(name)
							g.Name = g.string.Left(name, g.NameLen - 1)
							
							ply:ConCommand("darkrp rpname " .. g.Name)
							g.NameStealTimer = g.ServerCurTime + 10
						else
							if (_Modules["amplify"]) then
								g.SetName(name .. "​")
								g.NameStealTimer = g.ServerCurTime + g.GetConVar("sv_namechange_cooldown_seconds"):GetFloat() + 1
							else
								g.ChatAlert("The server has RPName disabled.")
								g.NameStealTimer = g.math.huge
							end
						end
					else
						if (_Modules["amplify"]) then
							g.SetName(name .. "​")
							g.NameStealTimer = g.ServerCurTime + g.GetConVar("sv_namechange_cooldown_seconds"):GetFloat() + 1
						else
							g.ChatAlert("The name stealer only works on DarkRP without amplify.")
							g.NameStealTimer = g.math.huge
						end
					end
					
					g.RefreshList()
				end)
			end
		end
	end
	
	if (v ~= ply) then
		if not (v:IsMuted()) then
			OptList:AddOption("Mute", function()
				v:SetMuted(true)
				g.ChatNotify("Muted " .. name .. ".")
				
				g.RefreshList()
			end)
		else
			OptList:AddOption("Unmute", function()
				v:SetMuted(false)
				g.ChatNotify("Unmuted " .. name .. ".")
				
				g.RefreshList()
			end)
		end
		
		if not (v.Ignore) then
			OptList:AddOption("Ignore", function()
				v.Ignore = true
				g.ChatNotify("Aimbot will now ignore " .. name .. ".")
				
				g.RefreshList()
			end)
		else
			OptList:AddOption("Target", function()
				v.Ignore = false
				g.ChatNotify("Aimbot will now target " .. name .. ".")
				
				g.RefreshList()
			end)
		end
		
		if not (v.Special) then
			OptList:AddOption("Mark", function()
				v.Special = true
				g.ChatNotify(name .. " will now be marked.")
				
				g.RefreshList()
			end)
		else
			OptList:AddOption("Unmark", function()
				v.Special = false
				g.ChatNotify(name .. " will no longer be marked.")
				
				g.RefreshList()
			end)
		end
	end
	
	local CopyList = OptList:AddSubMenu("Copy")
	
	CopyList:AddOption("Name", function()
		g.SetClipboardText(name)
	end)
	
	CopyList:AddOption("SteamID", function()
		g.SetClipboardText(v:SteamID())
	end)
	
	CopyList:AddOption("SteamID64", function()
		g.SetClipboardText(v:SteamID64())
	end)
	
	CopyList:AddOption("Profile Link", function()
		g.SetClipboardText("http://steamcommunity.com/profiles/" .. v:SteamID64() .. "/")
	end)
	
	OptList:Open()
end

--[[
	
	BIND MENU
	
]]--
function g.BindMenu()
	local bind_menu = g.vgui.Create("DFrame")
	bind_menu:MakePopup()
	bind_menu:SetTitle("")
	bind_menu:SetSize(120, 200)
	bind_menu:Center()
	
	g.AddBinder(bind_menu, "Menu", "MenuKey", 1)
	g.AddBinder(bind_menu, "Aimbot", "AimKey", 2)
	g.AddBinder(bind_menu, "Flashspam", "FlashKey", 3)
	g.AddBinder(bind_menu, "Triggerbot", "TrigKey", 4)
	g.AddBinder(bind_menu, "Free Camera", "FreeCam", 5)
	
	function bind_menu.Think(self)
		if not (g) then
			self:Close()
		elseif not (g.MenuOpen) then
			self:Close()
		end
	end
end

--[[
	
	CHANGELOG
	
]]--
function g.Changelog()
	local log_frame = g.vgui.Create("DFrame")
	log_frame:SetTitle("Changelog")
	log_frame:SetPos(0, 0)
	log_frame:SetSize(400, 450)
	log_frame:MakePopup()
	log_frame:Center()
	
	function log_frame.Think(self)
		if not (g) then
			self:Close()
		elseif not (g.MenuOpen) then
			self:Close()
		end
	end
	
	local log_text = g.vgui.Create("DTextEntry", log_frame)
	log_text:SetPos(10, 35)
	log_text:SetSize(log_frame:GetWide() - 20, log_frame:GetTall() - 45)
	log_text:SetText(g.LogText)
	log_text:SetMultiline(true)
	log_text:SetVerticalScrollbarEnabled(true)
	
	g.http.Fetch("http://pastebin.com/raw/rEEcBpvH",
		function(body)
			g.LogText = body
			log_text:SetText(g.LogText)
		end,
		
		function(err)
			g.LogText = "Couldn't fetch changelog: " .. g.string.upper(err)
			log_text:SetText(g.LogText)
		end
	)
end

--[[
	
	MENU
	
]]--
function g.OpenMenu()
	g.MenuOpen = true
	g.RefreshList()
	
	local menu = g.vgui.Create("DFrame")
	menu:MakePopup()
	menu:SetTitle("")
	menu:SetSize(650, 400)
	menu:ShowCloseButton(false)
	menu:Center()
	
	local group = g.vgui.Create("DButton", menu)
	group:SetSize(60, 40)
	group:SetPos(580, 5)
	group:SetText("Group")
	group:SetFont("MenuFont")
	
	local changelog = g.vgui.Create("DButton", menu)
	changelog:SetSize(80, 40)
	changelog:SetPos(495, 5)
	changelog:SetText("Changelog")
	changelog:SetFont("MenuFont")
	
	local options = g.vgui.Create("DPanel", menu)
	options:SetPos(10, 110)
	options:SetSize(630, 280)
	
	local tabs = g.vgui.Create("DScrollPanel", menu)
	tabs:SetPos(10, 55)
	tabs:SetSize(630, 50)
	
	local FirstTime = g.vgui.Create("HTML", options)
	FirstTime:OpenURL("http://i.imgur.com/3NAEbVk.png")
	FirstTime:Dock(FILL)
	
	local Aimbot = g.vgui.Create("DPanel", options)
	Aimbot:Dock(FILL)
	
	local Triggerbot = g.vgui.Create("DPanel", options)
	Triggerbot:Dock(FILL)
	
	local ESP = g.vgui.Create("DPanel", options)
	ESP:Dock(FILL)
	
	local Visuals = g.vgui.Create("DPanel", options)
	Visuals:Dock(FILL)
	
	local Miscellaneous = g.vgui.Create("DPanel", options)
	Miscellaneous:Dock(FILL)
	
	local TabPanels = {
		["FirstTime"] = FirstTime,
		["Aimbot"] = Aimbot,
		["Triggerbot"] = Triggerbot,
		["ESP"] = ESP,
		["Visuals"] = Visuals,
		["Miscellaneous"] = Miscellaneous,
	}
	
	function g.SetActiveTab()
		for k, v in g.next, TabPanels do
			v:SetVisible(false)
			
			if (g.ActiveTab == k) then
				v:SetVisible(true)
			end
		end
	end
	g.SetActiveTab()
	
	g.AddTab(tabs, "Aimbot", Aimbot, 1)
	g.AddTab(tabs, "Triggerbot", Triggerbot, 2)
	g.AddTab(tabs, "ESP", ESP, 3)
	g.AddTab(tabs, "Visuals", Visuals, 4)
	g.AddTab(tabs, "Miscellaneous", Miscellaneous, 5)
	
	for k, v in g.next, g.Options do
		for _k ,_v in g.next, g.Options[k] do
			if (g.Options[k][_k][1] == "Checkbox") then
				g.AddCheckbox(k, _k, TabPanels[k])
			elseif (g.Options[k][_k][1] == "Slider") then
				g.AddSlider(k, _k, TabPanels[k])
			else
				g.AddSelection(k, _k, TabPanels[k])
			end
		end
	end
	
	local Binding = g.vgui.Create("DButton", tabs)
	Binding:SetPos(tabs:GetWide() - 100, 0)
	Binding:SetSize(100, 23)
	Binding:SetText("Binding")
	
	local Unload = g.vgui.Create("DButton", tabs)
	Unload:SetSize(100, 23)
	Unload:SetPos(tabs:GetWide() - 100, 25)
	Unload:SetText("Unload")
	Unload:SetTooltip("Click to unload " .. g.HackName .. ".")
	
	function menu.Paint(self)
		g.DrawBlur(self, 3, 6)
		
		g.draw.RoundedBox(0, 0, 0, self:GetWide(), self:GetTall(), g.Color(60, 60, 60, 175))
		g.OutlinedBox(0, 0, self:GetWide(), self:GetTall(), 2, g.Colours["Menu"]["Main"])
		
		g.draw.RoundedBox(0, 0, 0, self:GetWide(), 50, g.Colours["Menu"]["Main"])
		g.draw.SimpleText(g.HackName, "TitleFont", 15, 4, g.Colours["White"])
	end
	
	function group.Paint(self)
		if not (self:IsHovered()) then
			g.draw.RoundedBox(0, 0, 0, self:GetWide(), self:GetTall(), g.Colours["White"])
		else
			g.draw.RoundedBox(0, 0, 0, self:GetWide(), self:GetTall(), g.Colours["White"])
		end
		
		g.OutlinedBox(0, 0, self:GetWide(), self:GetTall(), 1, g.Colours["Black"])
	end
	
	function changelog.Paint(self)
		if not (self:IsHovered()) then
			g.draw.RoundedBox(0, 0, 0, self:GetWide(), self:GetTall(), g.Colours["White"])
		else
			g.draw.RoundedBox(0, 0, 0, self:GetWide(), self:GetTall(), g.Colours["White"])
		end
		
		g.OutlinedBox(0, 0, self:GetWide(), self:GetTall(), 1, g.Colours["Black"])
	end
	
	function Binding.Paint(self)
		g.draw.RoundedBox(0, 0, 0, self:GetWide(), self:GetTall(), g.Colours["White"])
		g.OutlinedBox(0, 0, self:GetWide(), self:GetTall(), 1, g.Colours["Black"])
	end
	
	function Unload.Paint(self)
		g.draw.RoundedBox(0, 0, 0, self:GetWide(), self:GetTall(), g.Colours["White"])
		g.OutlinedBox(0, 0, self:GetWide(), self:GetTall(), 1, g.Colours["Black"])
	end
	
	function group.DoClick()
		g.gui.OpenURL("http://steamcommunity.com/gid/" .. g.GroupID .. "/")
		g.surface.PlaySound("/buttons/button17.wav")
	end
	
	function changelog.DoClick()
		g.Changelog()
		g.surface.PlaySound("/buttons/button17.wav")
	end
	
	function Binding.DoClick()
		g.surface.PlaySound("/buttons/button15.wav")
		g.BindMenu()
	end
	
	function Unload.DoClick()
		g.surface.PlaySound("/buttons/button19.wav")
		
		menu:Close()
		list_frame:Close()
		
		for k, v in g.next, _Hooks do
			for _k, _v in g.pairs(v) do
				g.ChatNotify("Removed hook: '" .. k .. "'.")
				g.hook.Remove(k, _k)
			end
		end
		
		for k, v in g.next, _Modules do
			if (k == "cvar3") then continue end
			g.ChatNotify("Removed module: '" .. k .. "'.")
			g.UnRequire(k)
		end
		
		for k, v in g.ipairs(g.player.GetAll()) do
			v.Confirmed1 = nil
			v.Confirmed2 = nil
			v.Confirmed3 = nil
			v.Detected = nil
		end
		
		g.ChatNotify(g.HackName .. " unloaded successfully.")
		g.table.Empty(g)
		
		_G.Loaded = nil
		g = nil
	end
	
	function menu.Close()
		g.SaveConfig()
		menu:Remove()
		g.CloseDermaMenus()
	end
	
	function menu.Think(self)
		if (g.GetValue("Miscellaneous", "Active") and g.GetValue("Miscellaneous", "PlyList")) then
			list_frame:SetVisible(true)
		end
		
		if (g.SiteOpen) then
			menu:Close()
			g.MenuOpen = false
		end
		
		if ((g.IsKeyDown(g.Binds["MenuKey"]) or g.IsKeyDown(KEY_HOME)) and not g.MenuKeyDown2 and g.Binds["MenuKey"] ~= 107) then
			menu:Close()
			g.MenuOpen = false
		end
	end
end

function g.MenuToggle() -- No idea who originally made this but I pasted it from Razor so creds to him.
	if (g.SiteOpen) then return end
	
	if ((g.IsKeyDown(g.Binds["MenuKey"]) or g.IsKeyDown(KEY_HOME)) and not g.MenuOpen and not g.MenuKeyDown) then
		g.MenuKeyDown = true
		g.OpenMenu()
	elseif (not (g.IsKeyDown(g.Binds["MenuKey"]) or g.IsKeyDown(KEY_HOME)) and not g.MenuOpen) then
		g.MenuKeyDown = false
	end
	
	if ((g.IsKeyDown(g.Binds["MenuKey"]) or g.IsKeyDown(KEY_HOME)) and g.MenuKeyDown and g.MenuOpen) then
		g.MenuKeyDown2 = true
	else
		g.MenuKeyDown2 = false
	end
end

--[[
	
	AIMBOT
	
]]--
function g.AimVec(v)
	if (v == nil) then return end
	if not (g._IsValid(v)) then return end
	
	local bone = v:LookupBone("ValveBiped.Bip01_Head1")
	local melee = true
	local trace = {}
	
	trace.start = ply:GetShootPos()
	trace.filter = {ply, v}
	trace.mask = MASK_SHOT
	
	if (not bone or g.GetValue("Aimbot", "AimPos") == "Body") then
		local pos = v:GetPos() + v:OBBCenter()
		
		trace.endpos = pos
		
		local tracer = g.util.TraceLine(trace)
		
		if (g.IsMelee(ply:GetActiveWeapon())) then
			melee = (tracer.HitPos:Distance(ply:GetShootPos()) < 75)
		end
		
		if (tracer.Fraction == 1 and melee) then
			return pos
		end
	end
	
	if (bone) then
		local pos = v:GetBonePosition(bone)
		
		trace.endpos = pos
		
		local tracer = g.util.TraceLine(trace)
		
		if (g.IsMelee(ply:GetActiveWeapon())) then
			melee = (tracer.HitPos:Distance(ply:GetShootPos()) < 75)
		end
		
		if (tracer.Fraction == 1 and melee) then
			pos.z = pos.z + 3
			return pos - (ply:GetVelocity() * g.engine.TickInterval()) + (v:GetVelocity() * (g.RealFrameTime() / 22))
		end
	end
	
	if (g.GetValue("Aimbot", "AimPos") == "Auto") then
		for i = 1, v:GetBoneCount() - 1 do
			local pos = v:GetBonePosition(i)
			if (v:GetPos() == pos) then continue end
			
			trace.endpos = pos
			
			local tracer = g.util.TraceLine(trace)
			
			if (g.IsMelee(ply:GetActiveWeapon())) then
				melee = (tracer.HitPos:Distance(ply:GetShootPos()) < 75)
			end
			
			if (tracer.Fraction == 1 and melee) then
				return pos
			end
		end
	end
end

function g.AimPos(vec)
	if (vec == nil) then return end
	
	local ang = (vec - ply:GetShootPos()):Angle()
	
	ang.p = g.math.NormalizeAngle(ang.p)
	ang.y = g.math.NormalizeAngle(ang.y)
	
	return ang
end

function g.Aimbot(cmd)
	local aimVec = g.AimVec(Target)
	
	if (Target and aimVec) then
		if (g.GetValue("Aimbot", "Silent") and cmd:CommandNumber() == 0) then
			g.Aimbotting = false
			return
		end
		
		if not (g.GetValue("Aimbot", "AutoStop") or g.GetValue("Aimbot", "AutoDuck")) then
			if ((g.GetValue("Aimbot", "Silent") or g.GetValue("Miscellaneous", "Spinbot")) and not g.CanFire()) then
				g.Aimbotting = false
				return
			end
		end
		
		g.AimAng = g.AimPos(aimVec)
		
		if (_Modules["dickwrap"] and g.InGroup) then
			g.AimAng = g.Compensate(cmd, g.AimAng)
		end
		
		if (not g.GetValue("Aimbot", "Silent") and cmd:CommandNumber() == 0) then
			if not (g.GetValue("Aimbot", "SlowAim")) then
				g.FakeAng = g.AimAng
			else
				g.FakeAng = g.LerpAngle(g.GetValue("Aimbot", "SlowSpeed"), cmd:GetViewAngles(), g.AimAng)
			end
		end
		
		if (not g.GetValue("Aimbot", "SlowAim") or g.GetValue("Aimbot", "Silent")) then					
			cmd:SetViewAngles(g.AimAng)
		else
			cmd:SetViewAngles(g.LerpAngle(g.GetValue("Aimbot", "SlowSpeed"), cmd:GetViewAngles(), g.AimAng))
		end
		
		if (g.GetValue("Aimbot", "AutoStop")) then
			cmd:SetForwardMove(0)
			cmd:SetSideMove(0)
			cmd:SetUpMove(0)
			
			cmd:SetButtons(0)
		end
		
		if (g.GetValue("Aimbot", "AutoDuck")) then
			cmd:SetButtons(cmd:GetButtons() + IN_DUCK)
		end
		
		if (g.GetValue("Aimbot", "AutoShoot") and not cmd:KeyDown(IN_ATTACK)) then
			if (g.GetValue("Aimbot", "RapidShoot") or g.GetValue("Miscellaneous", "RapidShoot")) then
				if (g.CanFire()) then
					cmd:SetButtons(cmd:GetButtons() + IN_ATTACK)
				end
			else
				cmd:SetButtons(cmd:GetButtons() + IN_ATTACK)
			end
		end
		
		g.Aimbotting = true
	else
		g.Aimbotting = false
	end
end

/*function g.DistanceToCrosshair(dst)
	local ray = ply:GetAimVector()
	local origin = ply:GetShootPos()
	local projected = ((dst - origin):Dot(ray) * ray:GetNormalized()) + origin
	
	return projected:DistToSqr(dst)
end*/

function g.DistanceToCrosshair(src, dst) -- Credits to Nanocat
	local ang = (dst - src):Angle() - g.Angle(g.FakeAng.p, g.FakeAng.y, 0)
	return g.math.abs(g.math.abs(ang.p - 180) + g.math.abs(ang.y - 180) - 360)
end

function g.GetFOV(angle, src, dst)
    local delta = src - dst
    local hyp = delta:Length2D()
    local ang = g.Angle(g.math.deg(g.math.atan(delta.z / hyp)), g.math.deg(g.math.atan(delta.y / delta.x)), 0)
	
    if (delta.x >= 0) then
		ang.y = ang.y + 180
	end
	
    local pitch = angle.p * g.math.pi / 180
    local yaw = angle.y * g.math.pi / 180
    local tmp = g.math.cos(pitch)
	
    local aim = g.Angle(tmp * g.math.cos(yaw), g.math.sin(yaw) * tmp, -g.math.sin(pitch))
	
    pitch = ang.p * g.math.pi / 180
    yaw = ang.y * g.math.pi / 180
    tmp = g.math.cos(pitch)
	
    ang = g.Angle(tmp * g.math.cos(yaw), g.math.sin(yaw) * tmp, -g.math.sin(pitch))
	
    local mag_s = g.math.sqrt((aim.p * aim.p) + (aim.y * aim.y) + (aim.r * aim.r))
    local mag_d = g.math.sqrt((aim.p * aim.p) + (aim.y * aim.y) + (aim.r * aim.r))
    local u_dot_v = aim.p * ang.p + aim.y * ang.y + aim.r * ang.r
	
    return g.math.acos(u_dot_v / (mag_s * mag_d)) * (180 / g.math.pi)
end

function g.GetTarget(cmd)
	Target = nil
	g.FoV = nil
	g.Health = g.math.huge
	g.Distance = g.math.huge
	
	if (g.GetValue("Aimbot", "OnKey") and not g.IsKeyDown(g.Binds["AimKey"])) then return end
	
	if (g.GetValue("Aimbot", "Active") and g.CanAimbot()) then
		for k, v in g.ipairs(g.Either(g.GetValue("Aimbot", "IgnoreNPC"), g.player.GetAll(), g.ents.GetAll())) do
			if (g.GetValue("Aimbot", "IgnoreBot") and v:IsPlayer() and v:IsBot()) then continue end
			if (g.GetValue("Aimbot", "IgnoreNPC") and v:IsNPC()) then continue end
			if (g.GetValue("Aimbot", "IgnoreTeam") and g.CheckTeam(v)) then continue end
			if (g.GetValue("Aimbot", "IgnoreFriend") and v:IsPlayer() and v:GetFriendStatus() == "friend") then continue end
			if (g.GetValue("Aimbot", "IgnoreDetective") and g.engine.ActiveGamemode() == "terrortown" and v:IsPlayer() and v:IsDetective()) then continue end
			if (not g._IsValid(v) or v:GetColor().a ~= 255 or g.IsDev(v) or v.Ignore or v:GetMoveType() == 8 or v:GetMoveType() == 10) then continue end
			
			local aimVec = g.AimVec(v)
			
			if (aimVec) then
				if (g.GetValue("Aimbot", "CheckFOV")) then
					if (g.GetFOV(cmd:GetViewAngles(), ply:GetShootPos(), aimVec) > g.GetValue("Aimbot", "AimFOV")) then continue end
				end
				
				if (g.IsMelee(ply:GetActiveWeapon())) then
					g.Distance2 = v:GetPos():Distance(ply:GetPos())
					
					if (g.Distance > g.Distance2) then
						Target = v
						g.Distance = g.Distance2
					end
				else
					if (g.GetValue("Aimbot", "TargetType") == "FOV") then
						g.Pos = g.DistanceToCrosshair(ply:GetShootPos(), aimVec)
						
						if (g.Pos < (g.FoV or g.Pos + 1)) then
							Target = v
							g.FoV = g.Pos
						end
					elseif (g.GetValue("Aimbot", "TargetType") == "Distance") then
						g.Distance2 = v:GetPos():Distance(ply:GetPos())
						
						if (g.Distance > g.Distance2) then
							Target = v
							g.Distance = g.Distance2
						end
					elseif (g.GetValue("Aimbot", "TargetType") == "Health") then
						if (v:Health() < g.Health) then
							Target = v
							g.Health = v:Health()
						end
					end
				end
			end
		end
	end
end

--[[
	
	TRIGGERBOT
	
]]--
function g.TriggerFilter(hitbox)
	if (g.GetValue("Triggerbot", "TrigFilter") == "Head") then
		return hitbox == 0
	end
	
	return hitbox ~= nil
end

function g.Triggerbot(cmd)
	if cmd:KeyDown(IN_ATTACK) then return end
	if not (g.GetValue("Triggerbot", "Active")) then return end
	
	local trace = ply:GetEyeTraceNoCursor()
	local v = trace.Entity
	local hitbox = trace.HitBox
	
	if (g._IsValid(v) and g.TriggerFilter(hitbox)) then
		if (g.GetValue("Triggerbot", "OnKey") and not g.IsKeyDown(g.Binds["TrigKey"])) then g.Triggering = false return end
		
		if (g.GetValue("Triggerbot", "IgnoreBot") and v:IsPlayer() and v:IsBot()) then return end
		if (g.GetValue("Triggerbot", "IgnoreNPC") and v:IsNPC()) then return end
		if (g.GetValue("Triggerbot", "IgnoreTeam") and g.CheckTeam(v)) then return end
		if (g.GetValue("Triggerbot", "IgnoreFriend") and v:IsPlayer() and v:GetFriendStatus() == "friend") then return end
		if (g.GetValue("Triggerbot", "IgnoreDetective") and g.engine.ActiveGamemode() == "terrortown" and v:IsPlayer() and v:IsDetective()) then return end
		if (not g._IsValid(v) or v:GetColor().a ~= 255 or g.IsDev(v) or v.Ignore or v:GetMoveType() == 8 or v:GetMoveType() == 10) then return end
		
		g.Triggering = true
		
		if (g.GetValue("Triggerbot", "TrigAim") and g.AimVec(v)) then
			cmd:SetViewAngles(g.AimPos(g.AimVec(v)))
		end
		
		if (g.GetValue("Triggerbot", "RapidShoot") or g.GetValue("Miscellaneous", "RapidShoot")) then
			if (g.CanFire()) then
				cmd:SetButtons(cmd:GetButtons() + IN_ATTACK)
			end
		else
			cmd:SetButtons(cmd:GetButtons() + IN_ATTACK)
		end
	else
		g.Triggering = false
	end
end

--[[
	
	ESP
	
]]--
function g.Rotate(snapx, snapy, snapx2, snapy2) -- Credits to Sadistic.
	local _x = snapx - snapx2
	local _y = snapy - snapy2
	
	local ang = g.math.deg(g.math.atan2(_y, _x))
	
	local x = g.math.cos(g.math.rad(ang - 90))
	local y = -g.math.cos(g.math.rad(ang))
	
	if (x > 0) then
		x = g.math.ceil(x)
	else
		x = g.math.floor(x)
	end
	
	if (y > 0) then
		y = g.math.ceil(y)
	else
		y = g.math.floor(y)
	end
	
	return x, y
end

function g.ESP()
	if not (g.GetValue("ESP", "Active")) then return end
	
	for k, v in g.ipairs(g.Either(g.GetValue("ESP", "ShowNPC") or g.GetValue("ESP", "ShowProp") or g.GetValue("ESP", "ShowLoot"), g.ents.GetAll(), g.player.GetAll())) do
		if (g.GetValue("ESP", "IgnoreTeam") and g.CheckTeam(v)) then continue end
		
		if (g.CanDraw(v) or (g.GetValue("ESP", "ShowProp") and g.IsProp(v)) or (g.GetValue("ESP", "ShowLoot") and g.IsMurderProp(v))) then
			local alpha = v:GetColor().a
			local texty1 = 5
			local texty2 = 5
			local health = g.Color(255 - 255 / v:GetMaxHealth() * v:Health(), 255 / v:GetMaxHealth() * v:Health(), 0)
			local wep = not (g.IsProp(v) or g.IsMurderProp(v)) and v:GetActiveWeapon()
			local plycol, guncol = g.Colour(v)
			local textcol = g.GetValue("ESP", "TextColour") == "White" and g.Colours["White"] or plycol
			local pos = v:GetPos()
			local min, max = v:GetCollisionBounds()
			
			-- Credits to Snipwnage for bounds shit.
			local x1, y1, x2, y2 = g.ScrW() * 2, g.ScrH() * 2, -g.ScrW(), -g.ScrH()
			local corners = {
				v:LocalToWorld(g.Vector(min.x, min.y, min.z)):ToScreen(),
				v:LocalToWorld(g.Vector(min.x, max.y, min.z)):ToScreen(),
				v:LocalToWorld(g.Vector(max.x, max.y, min.z)):ToScreen(),
				v:LocalToWorld(g.Vector(max.x, min.y, min.z)):ToScreen(),
				v:LocalToWorld(g.Vector(min.x, min.y, max.z)):ToScreen(),
				v:LocalToWorld(g.Vector(min.x, max.y, max.z)):ToScreen(),
				v:LocalToWorld(g.Vector(max.x, max.y, max.z)):ToScreen(),
				v:LocalToWorld(g.Vector(max.x, min.y, max.z)):ToScreen(),
			}
			
			for _k, _v in g.next, corners do
				x1, y1 = g.math.min(x1, _v.x), g.math.min(y1, _v.y)
				x2, y2 = g.math.max(x2, _v.x), g.math.max(y2, _v.y)
			end
			
			local diff, diff2 = g.math.abs(x2 - x1), g.math.abs(y2 - y1)
			
			if (g.GetValue("ESP", "ESPColour") == "Health") then
				plycol = health
				guncol = health
			end
			
			if (g.GetValue("ESP", "Box")) then
				if (g.GetValue("ESP", "BoxType") == "2D") then
					g.surface.SetDrawColor(g.Colours["Black"])
					g.surface.DrawOutlinedRect(x1 - 1, y1 - 1, diff + 2, diff2 + 2)
					g.surface.DrawOutlinedRect(x1 + 1, y1 + 1, diff - 2, diff2 - 2)
					
					g.surface.SetDrawColor(plycol)
					g.surface.DrawOutlinedRect(x1, y1, diff, diff2)
				else
					for i = 1, 4 do
						g.surface.SetDrawColor(plycol)
						g.surface.DrawLine(corners[i].x, corners[i].y, corners[i + 4].x, corners[i + 4].y)
						g.surface.DrawLine(corners[i].x, corners[i].y, corners[i % 4 + 1].x, corners[i % 4 + 1].y)
						g.surface.DrawLine(corners[i + 4].x, corners[i + 4].y, corners[i % 4 + 5].x, corners[i % 4 + 5].y)
					end
				end
			end
			
			-- Credits to Sadistic for original, modified by me to make it purdy.
			if (g.GetValue("ESP", "Snapline")) then
				local endx = (x1 + x2) * .5
				local endy = y2
				local startx = g.ScrW() * .5
				local starty = (g.GetValue("ESP", "SnaplineStart") == "Centre") and g.ScrH() / 2 or g.ScrH()
				local offsetx, offsety = g.Rotate(endx, endy, startx, starty)
				
				if (g.math.abs(endx) < g.ScrW() * 5 and g.math.abs(endy) < g.ScrH() * 5) then
					g.surface.SetDrawColor(g.Colours["Black"])
					g.surface.DrawLine(startx - offsetx, starty - offsety, endx - offsetx, endy - offsety)
					g.surface.DrawLine(startx + offsetx, starty + offsety, endx + offsetx, endy + offsety)
					
					g.surface.SetDrawColor(plycol)
					g.surface.DrawLine(startx, starty, endx, endy)
				end
			end
			
			if (g.GetValue("ESP", "Healthbar") and v:Health() > 0) then
				g.surface.SetDrawColor(g.Colours["Black"])
				g.surface.DrawRect(x1 - 6, y1, 3, diff2)
				g.surface.DrawRect(x1 - 7, y1 - 1, 5, diff2 + 2)
				
				g.surface.SetDrawColor(health)
				g.surface.DrawRect(x1 - 6, y2 - g.math.Clamp(diff2 / v:GetMaxHealth() * v:Health(), 0, diff2), 3, g.math.Clamp(diff2 / v:GetMaxHealth() * v:Health(), 0, diff2))
			end
			
			g.cam.Start3D()
				if (g.GetValue("ESP", "ChamsP")) then
					v:SetColor(plycol.r, plycol.g, plycol.b, alpha)
					v:SetMaterial("models/debug/debugwhite")
					
					g.render.SetColorModulation(plycol.r / 255, plycol.g / 255, plycol.b / 255)
					v:DrawModel()
					v:SetColor(g.Colours["White"])
					v:SetMaterial("")
				end
				
				if (g.GetValue("ESP", "ChamsW") and g.IsValid(wep)) then
					wep:SetColor(guncol.r, guncol.g, guncol.b, alpha)
					wep:SetMaterial("models/debug/debugwhite")
					
					g.render.SetColorModulation(guncol.r / 255, guncol.g / 255, guncol.b / 255)
					wep:DrawModel()
					wep:SetColor(g.Colours["White"])
					wep:SetMaterial("")
				end
				
				if (g.GetValue("ESP", "Barrel") and v:IsPlayer()) then
					local b1, b2 = v:EyePos(), v:GetEyeTrace().HitPos
					
					g.render.DrawLine(b1, b2, plycol)
					g.render.DrawWireframeSphere(b2, 2, 10, 10, plycol, b2)
				end
				
				if (g.GetValue("ESP", "Hitbox")) then
					for i = 0, v:GetHitBoxGroupCount() - 1 do
						for _i = 0, v:GetHitBoxCount(i) - 1 do
							local bone = v:GetHitBoxBone(_i, i)
							if not (bone) then continue end
							
							local min, max = v:GetHitBoxBounds(_i, i)
							
							if (v:GetBonePosition(bone)) then
								local pos, ang = v:GetBonePosition(bone)
								
								g.render.DrawWireframeBox(pos, ang, min, max, plycol)
							end
						end
					end
				end
			g.cam.End3D()
			
			if (g.GetValue("ESP", "Skeleton")) then
				for i = 0, v:GetBoneCount() do
					local bone = v:GetBoneParent(i)
					
					if not (bone) then continue end
					if (bone == -1) then continue end
					
					local bone1, bone2 = v:GetBonePosition(i), v:GetBonePosition(bone)
					local lstart = bone1:ToScreen()
					local lend = bone2:ToScreen()
					
					if (v:GetPos() == bone1) then continue end
					
					g.surface.SetDrawColor(g.Colours["White"])
					g.surface.DrawLine(lstart.x, lstart.y, lend.x, lend.y)
				end
			end
			
			if (g.GetValue("ESP", "TextPos") == "Centred") then
				x2 = (v:GetPos() + v:OBBCenter()):ToScreen().x
				y1, y2 = (v:GetPos() + v:OBBCenter()):ToScreen().y, y1
			end
			
			if (g.GetValue("ESP", "Name")) then
				if (v:IsPlayer()) then
					g.draw.SimpleTextOutlined(v:Nick(), "ESPFont", x2 + 1, y1 + texty1, textcol, g.GetValue("ESP", "TextPos") == "Centred" and TEXT_ALIGN_CENTER or TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER, 1, g.Colours["Black"])
					texty1 = texty1 + 13
				else
					g.draw.SimpleTextOutlined(v:GetClass(), "ESPFont", x2 + 1, y1 + texty1, textcol, g.GetValue("ESP", "TextPos") == "Centred" and TEXT_ALIGN_CENTER or TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER, 1, g.Colours["Black"])
					texty1 = texty1 + 13
				end
			end
			
			if (g.GetValue("ESP", "SteamID") and v:IsPlayer()) then
				if (v:SteamID() ~= "NULL") then
					g.draw.SimpleTextOutlined(v:SteamID(), "ESPFont", x2 + 1, y1 + texty1, textcol, g.GetValue("ESP", "TextPos") == "Centred" and TEXT_ALIGN_CENTER or TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER, 1, g.Colours["Black"])
					texty1 = texty1 + 13
				else
					g.draw.SimpleTextOutlined("BOT", "ESPFont", x2 + 1, y1 + texty1, textcol, g.GetValue("ESP", "TextPos") == "Centred" and TEXT_ALIGN_CENTER or TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER, 1, g.Colours["Black"])
					texty1 = texty1 + 13
				end
			end
			
			if (g.GetValue("ESP", "UserGroup") and v:IsPlayer()) then
				g.draw.SimpleTextOutlined(v:GetUserGroup(), "ESPFont", x2 + 1, y1 + texty1, textcol, g.GetValue("ESP", "TextPos") == "Centred" and TEXT_ALIGN_CENTER or TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER, 1, g.Colours["Black"])
				texty1 = texty1 + 13
			end
			
			if (g.GetValue("ESP", "Weapon") and g.IsValid(wep)) then
				g.draw.SimpleTextOutlined(v:GetActiveWeapon():GetPrintName(), "ESPFont", x2 + 1, y1 + texty1, textcol, g.GetValue("ESP", "TextPos") == "Centred" and TEXT_ALIGN_CENTER or TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER, 1, g.Colours["Black"])
				texty1 = texty1 + 13
			end
			
			if (g.GetValue("ESP", "Ping") and v:IsPlayer()) then
				g.draw.SimpleTextOutlined(v:Ping() .. "ms", "ESPFont", x2 + 1, y1 + texty1, textcol, g.GetValue("ESP", "TextPos") == "Centred" and TEXT_ALIGN_CENTER or TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER, 1, g.Colours["Black"])
				texty1 = texty1 + 13
			end
			
			if (g.GetValue("ESP", "Distance")) then
				g.draw.SimpleTextOutlined(g.math.Round((ply:GetPos() - v:GetPos()):Length() * .0190625, 1) .. "m", "ESPFont", x2 + 1, y1 + texty1, textcol, g.GetValue("ESP", "TextPos") == "Centred" and TEXT_ALIGN_CENTER or TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER, 1, g.Colours["Black"])
				texty1 = texty1 + 13
			end
			
			if (g.GetValue("ESP", "Health") and v:Health() > 0) then
				g.draw.SimpleTextOutlined("HP: " .. v:Health(), "ESPFont", x2 + 1, y2 + texty2, textcol, g.GetValue("ESP", "TextPos") == "Centred" and TEXT_ALIGN_CENTER or TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER, 1, g.Colours["Black"])
				texty2 = texty2 + 13
			end
			
			if (g.GetValue("ESP", "Armour") and v:IsPlayer()) then
				g.draw.SimpleTextOutlined("AP: " .. v:Armor(), "ESPFont", x2 + 1, y2 + texty2, textcol, g.GetValue("ESP", "TextPos") == "Centred" and TEXT_ALIGN_CENTER or TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER, 1, g.Colours["Black"])
				texty2 = texty2 + 13
			end
		end
	end
end

function g.Halo()
	if not (g.GetValue("ESP", "Active")) then return end
	
	for k, v in g.ipairs(g.Either(g.GetValue("ESP", "ShowNPC") or g.GetValue("ESP", "ShowProp") or g.GetValue("ESP", "ShowLoot"), g.ents.GetAll(), g.player.GetAll())) do
		if (g.GetValue("ESP", "IgnoreTeam") and g.CheckTeam(v)) then continue end
		
		if (g.CanDraw(v) or (g.GetValue("ESP", "ShowProp") and g.IsProp(v)) or (g.GetValue("ESP", "ShowLoot") and g.IsMurderProp(v))) then
			local plycol, guncol = g.Colour(v)
			local wep = not (g.IsProp(v) or g.IsMurderProp(v)) and v:GetActiveWeapon()
			
			if (g.GetValue("ESP", "HaloP")) then
				g.halo.Add({v}, plycol, 2, 2, 2, true, true)
			end
			
			if (g.GetValue("ESP", "HaloW") and g.IsValid(wep)) then				
				g.halo.Add({wep}, guncol, 2, 2, 2, true, true)
			end
		end
	end
end

function g.Lamp()
	if not (g.GetValue("ESP", "Active")) then return end
	if not (g.GetValue("ESP", "Lamp")) then return end
	
	for k, v in g.ipairs(g.Either(g.GetValue("ESP", "ShowNPC") or g.GetValue("ESP", "ShowProp") or g.GetValue("ESP", "ShowLoot"), g.ents.GetAll(), g.player.GetAll())) do
		if (g.GetValue("ESP", "IgnoreTeam") and g.CheckTeam(v)) then continue end
		
		if (g.CanDraw(v) or (g.GetValue("ESP", "ShowProp") and g.IsProp(v)) or (g.GetValue("ESP", "ShowLoot") and g.IsMurderProp(v))) then
			local dlight = g.DynamicLight(v)
			local _, guncol = g.Colour(v)
			
			if (dlight) then
				dlight.pos = v:GetPos()
				dlight.r = guncol.r
				dlight.g = guncol.g
				dlight.b = guncol.b
				dlight.brightness = 1
				dlight.Decay = 5 * g.GetValue("ESP", "LampSize")
				dlight.Size = 20 * g.GetValue("ESP", "LampSize")
				dlight.DieTime = g.CurTime() + .5
			end
		end
	end
end

--[[
	
	VISUALS
	
]]--
function g.Crosshair()
	if not (g.GetValue("Visuals", "Active")) then return end
	if not (g.GetValue("Visuals", "Crosshair")) then return end
	
	ply:GetActiveWeapon().DrawCrosshair = false
	
	local x1, y1 = g.ScrW() * .5, g.ScrH() * .5
	local colour = g.Colour(ply:GetEyeTraceNoCursor().Entity)
	
	if (g.GetValue("Visuals", "CrosshairStyle") == "Dot") then
		g.surface.SetDrawColor(5, 5, 5)
		g.surface.DrawOutlinedRect(x1 - 2.5, y1 - 2.5, 5, 5)
		g.surface.SetDrawColor(colour)
		g.surface.DrawRect(x1 - 1.5, y1 - 1.5, 3, 3)
	elseif (g.GetValue("Visuals", "CrosshairStyle") == "Basic") then
		g.surface.SetDrawColor(colour)
		g.surface.DrawLine(x1 - 10, y1, x1 + 10, y1)
		g.surface.DrawLine(x1 - 1, y1 - 10, x1 - 1, y1 + 10)
	else
		g.surface.SetDrawColor(colour)
		g.surface.DrawLine(x1 + 7, y1, x1 + 20, y1)
		g.surface.DrawLine(x1 - 9, y1, x1 - 20, y1)
		g.surface.DrawLine(x1 - 1, y1 + 8, x1 - 1, y1 + 20)
		g.surface.DrawLine(x1 - 1, y1 - 8, x1 - 1, y1 - 20)
	end
end

function g.Laser()
	if not (g.GetValue("Visuals", "Active")) then return end
	if not (g.GetValue("Visuals", "Laser")) then return end
	if (g.GetValue("Miscellaneous", "ThirdPerson")) then return end
	if (FreeCam) then return end
	if (ply:Health() < 1 and ply:GetMoveType() == 10 and ply:GetObserverTarget() ~= nil) then return end
	
	local wep = ply:GetViewModel()
	
	if ( g.IsValid(ply:GetActiveWeapon()) and wep:GetAttachment(1) and wep:GetAttachment(1) ~= 0 and not g.IsMelee(ply:GetActiveWeapon())) then
		g.cam.Start3D()
			local startpos, endpos = wep:GetAttachment(1).Pos, ply:GetEyeTrace().HitPos
			
			g.render.DrawLine(startpos, endpos, g.Colour(ply))
			
			g.render.SetMaterial(g.Material("Sprites/light_glow02_add_noz"))		
			g.render.DrawQuadEasy(endpos, ply:EyePos() - endpos, 10, 10, g.Colour(ply), 0)
		g.cam.End3D()
	end
end

function pmt.SetEyeAngles(self, ang)
	if not (g) then
		return ang
	end
	
	-- Credits to Snipwnage.
	if (not (g.GetValue("Visuals", "Active") or g.GetValue("Visuals", "NoRecoil")) and g.string.find(g.string.lower(g.debug.getinfo(2).short_src), "/weapons/")) then
		if (ply:GetActiveWeapon().Author == "Spy") then
			local _ang = ang - g.FakeAng
			g.FakeAng.p = g.FakeAng.p - _ang.p * .2
			g.FakeAng.y = g.FakeAng.y - _ang.y * .2
		else
			g.FakeAng = ang
		end
	end
end

function g.Radar()
	if not (g.GetValue("Visuals", "Active")) then return end
	if not (g.GetValue("Visuals", "Radar")) then return end
	
	local size = g.GetValue("Visuals", "RadarSize")
	local size2 = size * .3
	local scale = 1024
	local radarPosX = g.RadarPos["x"]
	local radarPosY = g.RadarPos["y"]
	
	g.surface.SetDrawColor(g.Colours["Radar"])
	g.surface.DrawRect(radarPosX - size, radarPosY - size, 2 * size, 2 * size)
	
	g.surface.SetDrawColor(g.Colour(ply))
	g.surface.DrawOutlinedRect(radarPosX - size, radarPosY - size, 2 * size, 2 * size)
	g.surface.DrawLine(radarPosX - size + size2, radarPosY, radarPosX + size - size2, radarPosY)
	g.surface.DrawLine(radarPosX, radarPosY - size + size2, radarPosX, radarPosY + size - size2)
	
	for k, v in g.ipairs(g.Either(g.GetValue("ESP", "ShowNPC") or g.GetValue("ESP", "ShowProp") or g.GetValue("ESP", "ShowLoot"), g.ents.GetAll(), g.player.GetAll())) do
		if (g.CanDraw(v) or (g.GetValue("ESP", "ShowProp") and g.IsProp(v)) or (g.GetValue("ESP", "ShowLoot") and g.IsMurderProp(v))) then
			local pos = v:GetPos() - ply:GetPos()
			pos:Rotate(g.Angle(0, -ply:EyeAngles().y + 90, 0))
			
			pos.x = g.math.Clamp(pos.x, -scale, scale)
			pos.y = g.math.Clamp(pos.y, -scale, scale)
			
			pos = pos / scale * size
			
			if (g.IsProp(v) or g.IsMurderProp(v)) then
				g.surface.SetDrawColor(g.Colours["Black"])
				g.surface.DrawRect(radarPosX + pos.x - 4, radarPosY - pos.y - 4, 7, 7)
				
				g.surface.SetDrawColor(g.Colour(v))
				g.surface.DrawRect(radarPosX + pos.x - 3, radarPosY - pos.y - 3, 5, 5)
			else
				g.DrawArrow(radarPosX + pos.x, radarPosY - pos.y, v:EyeAngles().y, g.Colour(v))
			end
		end
	end
end

function g.FreeCamSetup()
	if not (g.GetValue("Miscellaneous", "Active")) then return end
	if not (g.GetValue("Miscellaneous", "Camera")) then return end
	
	if (g.IsKeyDown(g.Binds["FreeCam"])) then
		if not FreeCam then
			FreeCam = true
			FreeCam2 = not FreeCam2
			
			if FreeCam2 and not CamPos then
				CamPos = ply:GetShootPos()
			end
			
			if FreeCam2 then
				CamAng = ply:EyeAngles()
			end
		end
	else
		FreeCam = false
	end
end

function g.FreeCamMove(cmd)	
	if FreeCam then
		local ang = ply:EyeAngles()
		CamPos = CamPos + (ang:Forward() * cmd:GetForwardMove() / 10000 + ang:Right() * cmd:GetSideMove() / 10000) * (cmd:KeyDown(IN_SPEED) and 10 or 3)
		
		if (cmd:KeyDown(IN_RELOAD)) then
			CamPos = ply:GetShootPos()
			CamAng = ply:EyeAngles()
		end
		
		cmd:SetButtons(0)
		
		cmd:SetForwardMove(0)
		cmd:SetSideMove(0)
		cmd:SetUpMove(0)
	end
end

function g.SpyCamera()
	if not (g.GetValue("Visuals", "Active")) then return end
	if not (g.GetValue("Visuals", "SpyCam")) then return end
	if (g.GetValue("Miscellaneous", "ThirdPerson")) then return end
	
	local ang = g.FakeAng
	local view = {}
	
	g.surface.SetDrawColor(g.Colour(ply))
	g.surface.DrawRect(g.MirrorPos["x"] - (500 * .5) - 2, g.MirrorPos["y"] - (175 * .5) - 2, 500 + 4, 175 + 4)
	
	view.origin = ply:GetShootPos()
	view.angles = g.Angle(ang.p - ang.p - ang.p, ang.y - 180, ang.r)
	view.x = g.MirrorPos["x"] - (500 * .5)
	view.y = g.MirrorPos["y"] - (175 * .5)
	view.w = 500
	view.h = 175
	view.drawviewmodel = false
	
	g.render.RenderView(view)
end

function g.ASUSShit()
	if (g.GetValue("Visuals", "Active")) then
		for k, v in g.ipairs(g.Entity(0):GetMaterials()) do
			g.Material(v):SetFloat("$alpha", g.GetValue("Visuals", "ASUSW") and g.GetValue("Visuals", "ASUSOpacity") or 1)
		end
		
		for k, v in g.ipairs(g.ents.FindByClass("prop_physics")) do
			v:SetRenderMode(RENDERMODE_TRANSCOLOR)
			v:SetKeyValue("renderfx", 0)
			v:SetColor(g.Color(255, 255, 255, g.GetValue("Visuals", "ASUSP") and 255 * g.GetValue("Visuals", "ASUSOpacity") or 255))
		end
	end
end

function g.Fullbright()
	if not (g.GetValue("Visuals", "Active")) then return end
	
	if (_Modules["cvar3"] or _Modules["amplify"]) then
		if (g.GetValue("Visuals", "Fullbright")) then
			if (_Modules["cvar3"]) then
				g.GetConVar("mat_fullbright"):SetValue(1)
			else
				g.ForceVar("mat_fullbright", 1)
			end
		else
			if (_Modules["cvar3"]) then
				g.GetConVar("mat_fullbright"):SetValue(0)
			else
				g.ForceVar("mat_fullbright", 0)
			end
		end
	end
end

function g.DrawFOV()
	if not (g.GetValue("Visuals", "Active")) then return end
	if not (g.GetValue("Visuals", "DrawFOV")) then return end
	
	if not (g.GetValue("Aimbot", "Active")) then return end
	if not (g.GetValue("Aimbot", "CheckFOV")) then return end
	
	if (g.GetValue("Miscellaneous", "ThirdPerson")) then return end
	
	local fov = g.GetValue("Aimbot", "AimFOV")
	
	if (fov > 75) then return end
	
	local adjacent = (g.ScrW() * .5) / g.math.atan(g.math.rad(ply:GetFOV()) * .5)
	local radius = g.math.tan(g.math.rad(fov * .5)) * adjacent
	
	g.DrawCircle(g.ScrW() * .5, g.ScrH() * .5, radius, g.Colour(ply))
	
	g.DrawCircle(g.ScrW() * .5, g.ScrH() * .5, radius - 1, g.Colours["Black"])
	g.DrawCircle(g.ScrW() * .5, g.ScrH() * .5, radius + 1, g.Colours["Black"])
end

function g.Watermark()
	g.surface.SetFont("TitleFont")
	
	local Width, Height = g.surface.GetTextSize(g.HackName .. " v" .. g.Version)
	
	g.MarkX = (g.ScrW() - (Width + 5))
	g.MarkY = 5
	
	g.surface.SetTextColor(g.Colours["Watermark"])
	g.surface.SetTextPos(g.MarkX, g.MarkY)
	g.surface.DrawText(g.HackName .. " v" .. g.Version)
end

--[[
	
	MISCELLANEOUS
	
]]--
function g.SpamPrefix()
	if (g.IsRP() and GM.Config.ooc) then
		return "/ooc "
	end
	
	return ""
end

function g.ChatSpam()
	if not (g.GetValue("Miscellaneous", "Active")) then msg = 0 return end
	if not (g.GetValue("Miscellaneous", "ChatSpam")) then msg = 0 return end
	if (g.CurTime() < g.SpamTimer) then return end
	
	msg = msg + 1
	
	if (msg > #g.Spam) then
		msg = 1
	end
	
	ply:ConCommand("say " .. g.SpamPrefix() .. g.Spam[msg])
	g.SpamTimer = g.ServerCurTime + 1
end

function g.FlashSpam(cmd)
	if not (g.GetValue("Miscellaneous", "Active")) then return end
	if not (g.GetValue("Miscellaneous", "FlashSpam")) then return end
	if not (g.IsKeyDown(g.Binds["FlashKey"])) then return end
	
	cmd:SetImpulse(100)
end

function g.BunnyHop(cmd)
	if not (g.GetValue("Miscellaneous", "Active")) then return end
	if not (g.GetValue("Miscellaneous", "Bunnyhop")) then return end
	if not (g.CanHop()) then return end
	
	cmd:RemoveKey(IN_JUMP)
end

function g.AutoStrafe(cmd)
	if not (g.GetValue("Miscellaneous", "Active")) then return end
	if not (g.GetValue("Miscellaneous", "AutoStrafe")) then return end
	if not (g.CanStrafe()) then return end
	
	local strafedir = g.StrafeDir(ply:GetVelocity(), ply:EyeAngles())
	
	if (cmd:GetMouseX() > 0 or cmd:GetMouseX() < 0) then 
		cmd:SetSideMove((g.MousePos(cmd:GetMouseX()) and -500 or 500) * strafedir)
	end
end

function g.AutoReload(cmd)
	if not (g.GetValue("Miscellaneous", "Active")) then return end
	if not (g.GetValue("Miscellaneous", "AutoReload")) then return end
	
	local wep = ply:GetActiveWeapon()
	
	if (ply:Alive() and g.IsValid(wep)) then
		if (wep:Clip1() <= 0 and wep:GetMaxClip1() > 0 and g.CurTime() > wep:GetNextPrimaryFire()) then
			cmd:SetButtons(cmd:GetButtons() + IN_RELOAD)
		end
	end
end

function g.RapidFire(cmd)
	if not (g.GetValue("Miscellaneous", "Active")) then return end
	if not (g.GetValue("Miscellaneous", "RapidShoot")) then return end
	
	if not (g.CanFire()) and cmd:KeyDown(IN_ATTACK) then
		cmd:RemoveKey(IN_ATTACK)
	end
end

function g.PlayerCheck()
	for k, v in g.ipairs(g.player.GetAll()) do
		if (v:Nick() == "unconnected") then continue end -- there has to be a better way than this, tell me maybe?
		if not (g.IsValid(v)) then continue end
		if (v == ply) then continue end
		
		if (g.GetValue("Miscellaneous", "Active") and g.GetValue("Miscellaneous", "AdminCheck")) then
			if (g._IsAdmin(v) and not v.Confirmed1) then
				v.Confirmed1 = true
				g.ChatAlert(v:Nick() .. " the " .. g.string.lower(v:GetUserGroup()) .. " has been detected.")
			end
			
			if (v.Confirmed1 and not g._IsAdmin(v)) then
				v.Confirmed1 = false
				g.ChatAlert(v:Nick() .. " is no longer an admin.")
			end
		end
		
		if (g.GetValue("Miscellaneous", "Active") and g.GetValue("Miscellaneous", "SpecCheck")) then
			if (v:GetObserverTarget() == ply and not v.Confirmed2) then
				v.Confirmed2 = true
				g.ChatAlert(v:Nick() .. " is now spectating you.")
			end
			
			if (v.Confirmed2 and v:GetObserverTarget() ~= ply) then
				v.Confirmed2 = false
				g.ChatAlert(v:Nick() .. " is no longer spectating you.")
			end
		end
		
		if (g.IsDev(v) and not v.Confirmed3) then
			v.Confirmed3 = true
			g.ChatNotify(v:Nick() .. ", the creator of " .. g.HackName .. ", has been detected.")
		end
	end
end

function g.NameStealer()
	if not (g.GetValue("Miscellaneous", "Active")) then return end
	if not (g.GetValue("Miscellaneous", "NameStealer")) then return end
	if (g.engine.ActiveGamemode() == "terrortown" and GAMEMODE.round_state == ROUND_ACTIVE) then return end
	if (g.ServerCurTime < g.NameStealTimer) then return end
	if (#g.player.GetAll() <= 2) then return end
	
	::redo::
	local v = g.player.GetAll()[g.math.random(#g.player.GetAll())]
	
	if (v == ply or g.IsDev(v)) then
		goto redo
	end
	
	if (g.IsRP()) then
		if (GAMEMODE.Config.allowrpnames) then			
			g.NameLen = g.string.len(v:Nick())
			g.Name = g.string.Left(v:Nick(), g.NameLen - 1)
			
			ply:ConCommand("darkrp rpname " .. g.Name)
			g.NameStealTimer = g.ServerCurTime + 10
		else
			if (_Modules["amplify"]) then
				g.SetName(v:Nick() .. "​")
				g.NameStealTimer = g.ServerCurTime + g.GetConVar("sv_namechange_cooldown_seconds"):GetFloat() + 1
			else
				g.ChatAlert("The server has RPName disabled.")
				g.NameStealTimer = g.math.huge
			end
		end
	else
		if (_Modules["amplify"]) then
			g.SetName(v:Nick() .. "​")
			g.NameStealTimer = g.ServerCurTime + g.GetConVar("sv_namechange_cooldown_seconds"):GetFloat() + 1
		else
			g.ChatAlert("The name stealer only works on DarkRP without amplify.")
			g.NameStealTimer = g.math.huge
		end
	end
end

function g.DuckJump(cmd) -- Credits to Deligit and Cdriza
	if not (g.GetValue("Miscellaneous", "Active")) then return end
	if not (g.GetValue("Miscellaneous", "DuckJump")) then return end
	if not (g.CanHop()) then return end
	
	local pos = ply:GetPos()
	local trace = {
		start = pos,
		endpos = pos - g.Vector(0, 0, 50),
		mask = MASK_PLAYERSOLID,
	}
	local trace = util.TraceLine(trace)
	local height = (pos - trace.HitPos).z
	
	if (height > 25 and 50 > height) then
		cmd:SetButtons(cmd:GetButtons() + IN_DUCK)
	end
end

function g.UseSpam(cmd)
	if not (g.GetValue("Miscellaneous", "Active")) then return end
	if not (g.GetValue("Miscellaneous", "UseSpam")) then return end
	
	if (cmd:KeyDown(IN_USE) and ply:Alive()) then
		if (g.Spamming) then
			cmd:RemoveKey(IN_USE)
		end
		
		g.Spamming = not g.Spamming
	end
end

function g.TraitorDetector()
	if not (g.GetValue("Miscellaneous", "Active")) then return end
	if not (g.GetValue("Miscellaneous", "TFinder")) then return end
	if (g.engine.ActiveGamemode() ~= "terrortown") then return end
		
	for k, v in g.ipairs(g.ents.GetAll()) do
		local _v = v:GetOwner()
		
		if (_v == ply or g.IsDev(_v)) then continue end
		
		if (g.GetRoundState() == 3 and v:IsWeapon() and _v:IsPlayer() and not _v.Detected and g.table.HasValue(v.CanBuy, 1)) then
			if (_v:GetRole() ~= 2) then
				_v.Detected = true
				g.ChatAlert("'" .. _v:Nick() .. "' has posession of a '" .. v:GetPrintName() .. "'.")
			end
		elseif (g.GetRoundState() ~= 3) then
			v.Detected = false
		end
	end
end

function g.MurdererDetector()
	if not (g.GetValue("Miscellaneous", "Active")) then return end
	if not (g.GetValue("Miscellaneous", "MFinder")) then return end
	if (g.engine.ActiveGamemode() ~= "murder") then return end
	
	for k, v in g.ipairs(g.player.GetAll()) do
		if (v == ply or g.IsDev(v)) then continue end
		
		if (GAMEMODE.RoundStage == 1 and not v.Detected and not v.Magnum) then
			if (v:HasWeapon("weapon_mu_knife")) then
				v.Detected = true
				g.ChatAlert(v:Nick() .. " (" .. v:GetNWString("bystanderName") .. ") is the murderer.")
			end
			
			if (v:HasWeapon("weapon_mu_magnum")) then
				v.Magnum = true
				g.ChatAlert(v:Nick() .. " (" .. v:GetNWString("bystanderName") .. ") has a magnum.")
			else
				v.Magnum = false
			end
		elseif (GAMEMODE.RoundStage ~= 1) then
			v.Detected = false
			v.Magnum = false
		end
	end
end

function g.Spinbot(cmd)
	if not (g.CanSpin(cmd)) then return end
	if not (g.GetValue("Miscellaneous", "Active")) then return end
	if not (g.GetValue("Miscellaneous", "Spinbot")) then return end
	
	cmd:SetViewAngles(g.Angle(-cmd:GetViewAngles().p, (g.CurTime() * 500) % 360, 0))
end

function g.GroupReminder()
	if (g.CurTime() < g.ReminderTimer) then return end
	if (g.InGroup) then return end
	
	g.ChatNotify(g.Reminders[g.math.random(#g.Reminders)])
	g.ChatNotify("http://steamcommunity.com/gid/" .. g.GroupID .. "/")
	
	g.ReminderTimer = g.CurTime() + (2 * 60)
end

--[[
	
	HOOKING
	
]]--
g.AddHook("Think", function()
	g.Lamp()
	g.MoveUI()
	g.ASUSShit()
	g.ChatSpam()
	g.MenuToggle()
	g.Fullbright()
	g.NameStealer()
	g.PlayerCheck()
	g.FreeCamSetup()
	g.GroupReminder()
	g.TraitorDetector()
	g.MurdererDetector()
end)

g.AddHook("CreateMove", function(cmd)
	g.Aimbot(cmd)
	g.Spinbot(cmd)
	g.UseSpam(cmd)
	g.BunnyHop(cmd)
	g.DuckJump(cmd)
	g.FakeView(cmd)
	g.FlashSpam(cmd)
	g.RapidFire(cmd)
	g.GetTarget(cmd)
	g.AutoReload(cmd)
	g.Triggerbot(cmd)
	g.AutoStrafe(cmd)
	g.FreeCamMove(cmd)
	
	g.FakeLag(cmd)
	g.MoveFix(cmd)
end)

g.AddHook("HUDPaint", function()
	g.ESP()
	g.Radar()
	g.Laser()
	g.DrawFOV()
	g.Crosshair()
	g.SpyCamera()
	g.Watermark()
end)

g.AddHook("PreDrawHalos", function()
	g.Halo()
end)

g.AddHook("entity_killed", function(data)
	if not (g.GetValue("Miscellaneous", "Active")) then return end
	if not (g.GetValue("Miscellaneous", "DeathNotify")) then return end
	
	local inflictor = g.Entity(data.entindex_inflictor)
	local killer = g.Entity(data.entindex_attacker)
	local victim = g.Entity(data.entindex_killed)
	
	if (g.IsValid(killer) and g.IsValid(victim) and killer:IsPlayer() and victim:IsPlayer()) then
		if (killer == victim and victim ~= ply) then
			g.ChatNotify(victim:Nick() .. " killed themself.")
		elseif (killer == victim and victim == ply) then
			g.ChatNotify("You killed yourself.")
		elseif (killer == ply) then
			g.ChatNotify("You killed " .. victim:Nick() .. ".")
		elseif (victim == ply) then
			g.ChatNotify("You were killed by " .. killer:Nick() .. ".")
		else
			g.ChatNotify(killer:Nick() .. " killed " .. victim:Nick() .. ".")
		end
	elseif (g.IsValid(victim) and not killer:IsPlayer() and victim:IsPlayer()) then
		if (g.IsValid(inflictor) and inflictor:GetClass() == "prop_physics") then
			if (victim == ply) then
				g.ChatNotify("You were killed by a prop.")
			else
				g.ChatNotify(victim:Nick() .. " was killed by a prop.")
			end
		elseif (victim == ply) then
			g.ChatNotify("You were killed by life.")
		else
			g.ChatNotify(victim:Nick() .. " was killed by life.")
		end
	end
end)

g.AddHook("CalcView", function(ply, pos, ang, fov)
	local view = {
		origin = pos
	}
	
	if (g.GetValue("Miscellaneous", "Active") and g.GetValue("Miscellaneous", "CustomFOV")) then
		view.fov = fov - (90 - g.GetValue("Miscellaneous", "FOV"))
	end
	
	if (ply:Health() > 0 and ply:GetMoveType() ~= 10 and ply:GetObserverTarget() == nil) then
		if (g.GetValue("Visuals", "Active") and g.GetValue("Visuals", "NoRecoil")) then
			view.origin = ply:EyePos()
			view.angles = ply:EyeAngles()
		end
		
		if (g.GetValue("Miscellaneous", "Active")) then
			if (g.GetValue("Miscellaneous", "ThirdPerson")) then
				view.origin = pos - (g.FakeAng:Forward() * 150)
			end
		end
		
		if (FreeCam) then
			view.origin = CamPos
			view.angles = ply:EyeAngles()
		end
	end
	
	return view
end)

g.AddHook("player_hurt", function(data)
	if not (g.GetValue("Miscellaneous", "Active")) then return end
	if not (g.GetValue("Miscellaneous", "Hitsound")) then return end
	
	local health = data.health
	local attacker = data.attacker
	
	local Hit, Kill
	
	if (g.GetValue("Miscellaneous", "HitsoundType") == "Quake") then
		Hit = "quake/Hit.wav"
		Kill = "quake/Hit.wav"
	elseif (g.GetValue("Miscellaneous", "HitsoundType") == "Overwatch") then
		Hit = "overwatch/Hit.wav"
		Kill = "overwatch/Kill.wav"
	elseif (g.GetValue("Miscellaneous", "HitsoundType") == "Dark Souls") then
		Hit = "darksouls/Hit.wav"
		Kill = "darksouls/Kill.wav"
	else
		Hit = "tf2/Hit.wav"
		Kill = "tf2/Kill.wav"
	end
	
	if (attacker == ply:UserID()) then
		if (health > 0) then
			g.surface.PlaySound(Hit)
		else
			g.surface.PlaySound(Kill)
		end
	end
end)

g.AddHook("OnPlayerChat", function(v, text, team)
	if not (g.GetValue("Miscellaneous", "Active")) then return end
	if not (g.GetValue("Miscellaneous", "CopyCat")) then return end
	
	if (v ~= ply and not g.IsDev(v)) then
		if (team) then
			ply:ConCommand("say_team '" .. text .. "' - " .. v:Nick())
		else
			ply:ConCommand("say '" .. text .. "' - " .. v:Nick())
		end
	end
end)

g.AddHook("PreRender", function()
	if (g.GetValue("Visuals", "Fullbright") and not (_Modules["cvar3"] or _Modules["amplify"])) then
		g.render.SetLightingMode(1)
		g.LightingModeChanged = true
	end
	
	if (g.SiteOpen) then
		g.gui.HideGameUI()
	end
end)

g.AddHook("PostDraw2DSkyBox", function()
	if not (g.GetValue("Visuals", "Active")) then return end
	if not (g.GetValue("Visuals", "NoSky")) then return end
	
	if (g.GetValue("Visuals", "SkyType") == "None") then
		g.render.Clear(0, 0, 0, 0)
	elseif (g.GetValue("Visuals", "SkyType") == "Rave") then
		g.render.Clear(g.math.random(255), g.math.random(255), g.math.random(255), 255)
	else
		local col = g.HSVToColor(g.RealTime() * 45 % 720, 1, 1)
		g.render.Clear(col.r, col.g, col.b, 255)
	end
end)

g.AddHook("PostRender", function()
	if g.LightingModeChanged then
		g.render.SetLightingMode(0)
		g.LightingModeChanged = false
	end
end)
g.AddHook("PreDrawHUD", function()
	if g.LightingModeChanged then
		g.render.SetLightingMode(0)
		g.LightingModeChanged = false
	end
end)

g.AddHook("AdjustMouseSensitivity", function()
	if not (g.GetValue("Triggerbot", "SlowAim")) then return end
	if not (g.Triggering) then return end
	
	return .25
end)

g.AddHook("Move", function()
	if (g.IsFirstTimePredicted()) then
		g.ServerCurTime = g.CurTime() + g.engine.TickInterval()
	end
end)

g.AddHook("ShouldDrawLocalPlayer", function()
	return (g.GetValue("Miscellaneous", "Active") and (g.GetValue("Miscellaneous", "ThirdPerson") or g.GetValue("Miscellaneous", "Camera") and g.IsKeyDown(g.Binds["FreeCam"])))
end)

g.AddHook("StartChat", function()
	g.IsTyping = true
end)

g.AddHook("FinishChat", function()
	g.IsTyping = false
end)

g.AddHook("ScoreboardShow", function()
	g.Scoreboard = true
end)

g.AddHook("ScoreboardHide", function()
	g.Scoreboard = false
	g.SaveConfig()
end)

g.AddHook("PhysgunPickup", function(v, ent)
	if (v == ply) then
		g.Holding = true
	end
	
	return true
end)

g.AddHook("PhysgunDrop", function(v, ent)
	if (v == ply) then
		g.Holding = false
	end
end)

g.AddHook("EntityFireBullets", function(ent, data)
	local wep = ent:GetActiveWeapon():GetClass()
	
	if (cones[wep] != -data.Spread) then
		cones[wep] = -data.Spread
	end
end)