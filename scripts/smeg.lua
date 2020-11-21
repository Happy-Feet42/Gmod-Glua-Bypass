--[[
          _____                    _____                    _____                    _____                            _____                    _____                    _____                    _____          
         /\    \                  /\    \                  /\    \                  /\    \                          /\    \                  /\    \                  /\    \                  /\    \         
        /::\    \                /::\____\                /::\    \                /::\    \                        /::\____\                /::\    \                /::\    \                /::\____\        
       /::::\    \              /::::|   |               /::::\    \              /::::\    \                      /:::/    /               /::::\    \              /::::\    \              /:::/    /        
      /::::::\    \            /:::::|   |              /::::::\    \            /::::::\    \                    /:::/    /               /::::::\    \            /::::::\    \            /:::/    /         
     /:::/\:::\    \          /::::::|   |             /:::/\:::\    \          /:::/\:::\    \                  /:::/    /               /:::/\:::\    \          /:::/\:::\    \          /:::/    /          
    /:::/__\:::\    \        /:::/|::|   |            /:::/__\:::\    \        /:::/  \:::\    \                /:::/____/               /:::/__\:::\    \        /:::/  \:::\    \        /:::/____/           
    \:::\   \:::\    \      /:::/ |::|   |           /::::\   \:::\    \      /:::/    \:::\    \              /::::\    \              /::::\   \:::\    \      /:::/    \:::\    \      /::::\    \           
  ___\:::\   \:::\    \    /:::/  |::|___|______    /::::::\   \:::\    \    /:::/    / \:::\    \            /::::::\    \   _____    /::::::\   \:::\    \    /:::/    / \:::\    \    /::::::\____\________  
 /\   \:::\   \:::\    \  /:::/   |::::::::\    \  /:::/\:::\   \:::\    \  /:::/    /   \:::\ ___\          /:::/\:::\    \ /\    \  /:::/\:::\   \:::\    \  /:::/    /   \:::\    \  /:::/\:::::::::::\    \ 
/::\   \:::\   \:::\____\/:::/    |:::::::::\____\/:::/__\:::\   \:::\____\/:::/____/  ___\:::|    |        /:::/  \:::\    /::\____\/:::/  \:::\   \:::\____\/:::/____/     \:::\____\/:::/  |:::::::::::\____\
\:::\   \:::\   \::/    /\::/    / ~~~~~/:::/    /\:::\   \:::\   \::/    /\:::\    \ /\  /:::|____|        \::/    \:::\  /:::/    /\::/    \:::\  /:::/    /\:::\    \      \::/    /\::/   |::|~~~|~~~~~     
 \:::\   \:::\   \/____/  \/____/      /:::/    /  \:::\   \:::\   \/____/  \:::\    /::\ \::/    /          \/____/ \:::\/:::/    /  \/____/ \:::\/:::/    /  \:::\    \      \/____/  \/____|::|   |          
  \:::\   \:::\    \                  /:::/    /    \:::\   \:::\    \       \:::\   \:::\ \/____/                    \::::::/    /            \::::::/    /    \:::\    \                    |::|   |          
   \:::\   \:::\____\                /:::/    /      \:::\   \:::\____\       \:::\   \:::\____\                       \::::/    /              \::::/    /      \:::\    \                   |::|   |          
    \:::\  /:::/    /               /:::/    /        \:::\   \::/    /        \:::\  /:::/    /                       /:::/    /               /:::/    /        \:::\    \                  |::|   |          
     \:::\/:::/    /               /:::/    /          \:::\   \/____/          \:::\/:::/    /                       /:::/    /               /:::/    /          \:::\    \                 |::|   |          
      \::::::/    /               /:::/    /            \:::\    \               \::::::/    /                       /:::/    /               /:::/    /            \:::\    \                |::|   |          
       \::::/    /               /:::/    /              \:::\____\               \::::/    /                       /:::/    /               /:::/    /              \:::\____\               \::|   |          
        \::/    /                \::/    /                \::/    /                \::/____/                        \::/    /                \::/    /                \::/    /                \:|   |          
         \/____/                  \/____/                  \/____/                                                   \/____/                  \/____/                  \/____/                  \|___|          
        Made by mmmaaalll1.                                                                                                                                                                                                              
--]]

/*
	I don’t claim this to be the best hack in the world, in fact this is my first gLua hack (and my first real cheat). I would consider this cheat to be feature full, however being a relatively new gLua coder I accept that all my coding
	is probably shit, feed back is welcome. As I have progressed with this cheat I have realized that I could have done things differently with much more efficient code etc. but I haven’t been bothered to fix it.

	Fyi, due to a update to Garry's Mod the incrementvar exploit (speed hack) no longer works.
*/


//Variables
local SmegHack = {}
SmegHack.FriendsList = {}
SmegHack.TextEntries = {}
SmegHack.Hooks = {}
SmegHack.EntityESP = {}
SmegHack.BoneOrder = {}
SmegHack.Traitors = {}
SmegHack.Murderers = {}

SmegHack.Options = {}

SmegHack.Options["Aimbot_Toggle"] = false
SmegHack.Options["Aimbot_LOSCheck"] = false
SmegHack.Options["Aimbot_AutoWall"] = true
SmegHack.Options["Aimbot_AimOnKey"] = false
SmegHack.Options["Aimbot_AimOnKey_Key"] = 0
SmegHack.Options["Aimbot_SmoothAim"] = false
SmegHack.Options["Aimbot_SmoothAim_Value"] = 600
SmegHack.Options["Aimbot_AimPriority"] = "Distance"
SmegHack.Options["Aimbot_FOV"] = false
if LocalPlayer():GetFOV() != nil then SmegHack.Options["Aimbot_FOV_Value"] = LocalPlayer():GetFOV() else SmegHack.Options["Aimbot_FOV_Value"] = 75 end
SmegHack.Options["Aimbot_StickToTarget"] = false
SmegHack.Options["Aimbot_BoneAim"] = false
SmegHack.Options["Aimbot_AutoShoot"] = false

SmegHack.Options["Aimbot_AimTeam"] = false
SmegHack.Options["Aimbot_AimOpponents"] = true
SmegHack.Options["Aimbot_AimFriends"] = false
SmegHack.Options["Aimbot_AimEnemies"] = false
SmegHack.Options["Aimbot_AimNPCs"] = false
SmegHack.Options["Aimbot_AimSpectators"] = false
SmegHack.Options["Aimbot_AimTeamV"] = "Aim"
SmegHack.Options["Aimbot_AimOpponentsV"] = "Aim"
SmegHack.Options["Aimbot_AimFriendsV"] = "Aim"
SmegHack.Options["Aimbot_AimEnemiesV"] = "Aim"
SmegHack.Options["Aimbot_AimNPCsV"] = "Aim"
SmegHack.Options["Aimbot_AimSpectatorsV"] = "Aim"

SmegHack.Options["Aimbot_OffsetX"] = 0
SmegHack.Options["Aimbot_OffsetY"] = 0

SmegHack.Options["ESP_Toggle"] = false
SmegHack.Options["ESP_ShowTeam"] = true
SmegHack.Options["ESP_ShowOpponents"] = true
SmegHack.Options["ESP_ShowFriends"] = false
SmegHack.Options["ESP_ShowEnemies"] = false
SmegHack.Options["ESP_ShowNPCs"] = false
SmegHack.Options["ESP_ShowSpectators"] = false

SmegHack.Options["ESP_ShowTeamV"] = "Show"
SmegHack.Options["ESP_ShowOpponentsV"] = "Show"
SmegHack.Options["ESP_ShowFriendsV"] = "Show"
SmegHack.Options["ESP_ShowEnemiesV"] = "Show"
SmegHack.Options["ESP_ShowNPCsV"] = "Show"
SmegHack.Options["ESP_ShowSpectatorsV"] = "Show"

SmegHack.Options["ESP_Entity_Toggle"] = false
SmegHack.Options["ESP_Entities_NameTags"] = false
SmegHack.Options["ESP_Entities_BoundaryBoxes"] = false
SmegHack.Options["ESP_Entities_BoundaryBoxes_Mode"] = "2D"

SmegHack.Options["ESP_BoundaryBoxes"] = false
SmegHack.Options["ESP_BoundaryBoxes_Mode"] = "2D"
SmegHack.Options["ESP_NameTags"] = false
SmegHack.Options["ESP_Weapon"] = false
SmegHack.Options["ESP_Distance"] = false
SmegHack.Options["ESP_Health"] = false
SmegHack.Options["ESP_Skeleton"] = false
SmegHack.Options["ESP_Crosshair"] = false
SmegHack.Options["ESP_Crosshair_Size"] = 50
SmegHack.Options["ESP_Crosshair_Mode"] = "Team"
SmegHack.Options["ESP_Crosshair_Color_R"] = 0
SmegHack.Options["ESP_Crosshair_Color_G"] = 0
SmegHack.Options["ESP_Crosshair_Color_B"] = 255
SmegHack.Options["ESP_Crosshair_Color_A"] = 255

SmegHack.Options["Misc_Clock"] = false
SmegHack.Options["Misc_Clock_Mode"] = "Fast"
if GetConVarNumber("host_timescale") != nil then SmegHack.Options["Misc_Clock_Speed"] = GetConVarNumber("host_timescale") else SmegHack.Options["Misc_Clock_Speed"] = 1 end
SmegHack.Options["Misc_AdminBox"] = false
SmegHack.Options["Misc_AdminBox_Mode"] = "Auto"
SmegHack.Options["Misc_AdminBox_PosX"] = 0
SmegHack.Options["Misc_AdminBox_PosY"] = 0
SmegHack.Options["Misc_SpectatorsBox"] = false
SmegHack.Options["Misc_SpectatorsBox_Mode"] = "Auto"
SmegHack.Options["Misc_SpectatorsBox_PosX"] = 150
SmegHack.Options["Misc_SpectatorsBox_PosY"] = 0
SmegHack.Options["Misc_AutoButton"] = false

SmegHack.Options["Friends_FriendIsEnemy"] = false
SmegHack.Options["Friends_SteamFriends"] = false
SmegHack.Options["Friends_SteamEnemies"] = false

SmegHack.Options["Cams_Toggle"] = false
SmegHack.Options["Cams_CSNoclip"] = false
SmegHack.Options["Cams_CSNoclip_Speed"] = 10
SmegHack.Options["Cams_ThirdPerson"] = false
SmegHack.Options["Cams_ThirdPerson_Zoom"] = 30

SmegHack.Options["Bhop_Toggle"] = false
SmegHack.Options["Bhop_FastWalk"] = false
SmegHack.Options["Bhop_AutoHop"] = false
SmegHack.Options["Bhop_AutoStrafe"] = false
SmegHack.Options["Bhop_EdgeJump"] = false
SmegHack.Options["Bhop_EdgeJump_Distance"] = 40
SmegHack.Options["Bhop_Sideways"] = false
SmegHack.Options["Bhop_WOnly"] = false

SmegHack.Options["Spam_Toggle"] = false
SmegHack.Options["Spam_Delay"] = false
SmegHack.Options["Spam_Delay_Value"] = 10
SmegHack.Options["Spam_AntiAntiSpam"] = false
SmegHack.Options["Spam_Message_1"] = false
SmegHack.Options["Spam_Message_2"] = false
SmegHack.Options["Spam_Message_3"] = false
SmegHack.Options["Spam_Message_4"] = false
SmegHack.Options["Spam_Message_5"] = false


local function RandomString() return tostring(math.random(-9999999999, 9999999999)) end
local function RandomShortString() return tostring(math.random(0, 100)) end
local MenuOpen = false
local UpdateBoneThink = false
local UpdateBoneThinkNum = 0
local NormSvCheats, NormHostTimeScale, TimeScaleChange = 0, 1, false
local FPSValue = 0
local DisplayBoxWidths = 0
local AdminsListBool = false
local SpecsListBool = false
local AdminBoxTall, AdminBoxWide, SpecBoxTall, SpecBoxWide = 0, 0, 0, 0
local GMode
local MDone = false
if string.find(string.lower(GAMEMODE.Name), "terror") != nil then
	GMode = 1
elseif string.find(string.lower(GAMEMODE.Name), "murder") != nil then
	GMode = 2
else
	GMode = 3
end

//Fonts
surface.CreateFont("Menu_Title",{font = "coolvetica", size = 25})
surface.CreateFont("ESP_Font_Main",{font = "coolvetica", size = 20})
surface.CreateFont("ESP_Font_Entity",{font = "coolvetica", size = 17})
surface.CreateFont("ESP_Font_Health",{font = "coolvetica", size = 12})
surface.CreateFont("Cams",{font = "Arial", size = 25})

//Hack Management
function AddHook( NormID, Event, ID, Function )
	table.insert( SmegHack.Hooks, NormID.."|"..Event.."|"..ID )
	hook.Add( Event, ID, Function )
end

function RemoveHook( NormID )
	for k, v in pairs( SmegHack.Hooks ) do
		local SubTable = string.Explode( "|", v )
		if SubTable[1] == NormID then
			hook.Remove( SubTable[2], SubTable[3] )
			table.remove( SmegHack.Hooks, k )
		end
	end
end

function GetTeam( Ply )
	local Team = Ply:Team()
	local t, c
	if GMode == 1 then
		if Team == TEAM_SPECTATOR then
			t = Team
			c = team.GetColor(Team)
		else
			if table.HasValue(SmegHack.Traitors, Ply:SteamID()) then
				t = 1
				c = Color(255,0,0)
			elseif Ply:GetRole() == 2 then
				t = 0
				c = Color(0,0,255)
			else
				t = 0
				c = Color(0,255,0)
			end
		end
	elseif GMode == 2 then
		if Team == TEAM_SPECTATOR then
			t = Team
			c = team.GetColor(Team)
		else
			if table.HasValue(SmegHack.Murderers, Ply:SteamID()) then
				t = 2
				c = Color(255,0,0)
			else
				t = 1
				local Moo = false
				for k, v in pairs(Ply:GetWeapons()) do
					if v:GetClass() == "weapon_mu_magnum" then
						Moo = true
						break
					end
				end
				if Moo == true then
					c = Color(0,0,255)
				else
					c = Color(0,255,0)
				end
			end
		end
	else
		t = Team
		c = team.GetColor(Team)
	end
	return t, c
end

function UnloadSmegHack( Display )
	//Menu
	concommand.Remove("SmegHack_Menu")

	//Hooks
	SmegHack.Options["Misc_AdminBox"] = false
	SmegHack.Options["Misc_SpectatorsBox"] = false //These remove the admin/spectator boxes

	timer.Simple( 0.5, function() 
		for k, v in pairs( SmegHack.Hooks ) do
			local SubTable = string.Explode( "|", v )
			hook.Remove( SubTable[2], SubTable[3] )
		end
		table.Empty( SmegHack.Hooks )

		//Clock Speed Manipulator
		if GetConVarNumber("sv_cheats") != NormSvCheats then LocalPlayer():ConCommand("incrementvar sv_cheats "..NormSvCheats.." "..NormSvCheats.." "..NormSvCheats) end
		if GetConVarNumber("host_timescale") != NormHostTimeScale then LocalPlayer():ConCommand("incrementvar host_timescale "..NormHostTimeScale.." "..NormHostTimeScale.." "..NormHostTimeScale) end
		if Display then
			AddHook( "Unloaded", "HUDPaint", RandomString(), function()
				draw.SimpleTextOutlined( "Smeg Hack Unloaded Successfully!", "Menu_Title", ScrW()/2, 50, Color(0,150,150), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color(0,0,0) )
				timer.Simple( 3, function()
					RemoveHook("Unloaded")
				end)
			end)
		end
	end)
end

function ReloadSmegHack( Display )
	local Admin = SmegHack.Options["Misc_AdminBox"]
	local Spec = SmegHack.Options["Misc_SpectatorsBox"]
	UnloadSmegHack()
	timer.Simple( 0.5, function()
		LoadSmegHack()
		if Admin then
			SmegHack.Options["Misc_AdminBox"] = true
			AddDisplayBox( "Admins", 1 )
		end
		if Spec then
			SmegHack.Options["Misc_SpectatorsBox"] = true
			AddDisplayBox( "Spectators", 2 )
		end
		LocalPlayer():ConCommand("SmegHack_Menu")
		if Display then
			AddHook( "Reloaded", "HUDPaint", RandomString(), function()
				draw.SimpleTextOutlined( "Smeg Hack Reloaded Successfully!", "Menu_Title", ScrW()/2, 50, Color(0,150,150), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color(0,0,0) )
				timer.Simple( 3, function()
					RemoveHook("Reloaded")
				end)
			end)
		end
	end)
end

function LoadSmegHack( Display )
	//Commands
	CreateClientConVar("SmegHack_Panic", 0, false, false)
	concommand.Add("SmegHack_Menu", SmegHackMenu)

	local EntTable = ents.GetAll()
	local FastWalk = false
	local MenuDelay, FPSDelay = false, false
	local ForwardMove = 0
	local SideMove = 0
	local TapS = false
	local WLeft, WRight, WForward, WBack, WActive = false, false, true, false, false
	local NoclipPos, NoclipAngles, NoclipOn, NoclipX, NoclipY, NoclipDuck, NoclipJump = LocalPlayer():EyePos(), LocalPlayer():GetAngles(), false, 0, 0, false, false
	local ScaleActive, ScaleNum = false, 1
	local SpamWait, Spam1, Spam2, Spam3, Spam4, Spam5 = false, false, false, false, false, false
	
	//Hooks
	AddHook( "Menu", "Think", RandomString(), function()
		if input.IsKeyDown(KEY_INSERT) && !MenuDelay then
			MenuDelay = true
			SmegHackMenu()
			timer.Simple( 0.5, function() MenuDelay = false end )
		end

		//For FPS
		if FPSDelay == false then
			FPSDelay = true
			timer.Simple( 0.5, function() FPSValue = math.Round(1/RealFrameTime()) FPSDelay = false end )
		end

		//For Time Scale
		if SmegHack.Options["Misc_Clock"] && GetConVarNumber("SmegHack_Panic") == 0 then
			if GetConVarNumber("sv_cheats") != 1 then LocalPlayer():ConCommand("incrementvar sv_cheats 1 1 1") end
			if SmegHack.Options["Misc_Clock_Speed"] != ScaleNum || !ScaleActive || TimeScaleChange then
				local k
				if SmegHack.Options["Misc_Clock_Mode"] == "Slow" then k = 1-(SmegHack.Options["Misc_Clock_Speed"]/10) else k = SmegHack.Options["Misc_Clock_Speed"] end
				LocalPlayer():ConCommand("incrementvar host_timescale "..k.." "..k.." "..k) //Sozz, but I had to add kkk in somewhere :P
				ScaleNum = k
				if !ScaleActive then ScaleActive = true end
			end
		elseif SmegHack.Options["Misc_Clock"] && GetConVarNumber("SmegHack_Panic") == 1 then
			if ScaleActive then
				LocalPlayer():ConCommand("incrementvar sv_cheats "..NormSvCheats.." "..NormSvCheats.." "..NormSvCheats)
				LocalPlayer():ConCommand("incrementvar host_timescale "..NormHostTimeScale.." "..NormHostTimeScale.." "..NormHostTimeScale)
				ScaleActive = false
			end
		end
		//Reset T Round
		if GMode == 1 then
			if GetRoundState() != 3 then
				table.Empty(SmegHack.Traitors)
			else
				for k, v in pairs(player.GetAll()) do
					local Ply = v
					local Team = Ply:GetRole()
					if Team == 2 then return end
					if LocalPlayer():GetRole() != 1 then
						for k, v in pairs(Ply:GetWeapons()) do
							if table.HasValue(v.CanBuy, 1) && !table.HasValue(SmegHack.Traitors, Ply:SteamID()) then
								table.insert(SmegHack.Traitors, Ply:SteamID())
							end
						end
					else
						if Team == 1 && !table.HasValue(SmegHack.Traitors, Ply:SteamID()) then
							table.insert(SmegHack.Traitors, Ply:SteamID())
						end
					end
				end
			end
		elseif GMode == 2 then
			if !MDone then
				for k, v in pairs(ents.GetAll()) do
					if v:GetClass() == "weapon_mu_knife" then
						table.insert(SmegHack.Murderers, v:GetOwner():SteamID())
					end
				end
				MDone = true
			else
				for k, v in pairs(ents.GetAll()) do
					if v:GetClass() == "weapon_mu_knife" then
						if !table.HasValue(SmegHack.Murderers, v:GetOwner():SteamID()) then
							table.Empty(SmegHack.Murderers)
							MDone = false
						end
					end
				end
			end
		end
	end)

	AddHook( "Aimbot", "Think", RandomString(), function()
		if GetConVarNumber("SmegHack_Panic") == 0 && SmegHack.Options["Aimbot_Toggle"] && !MenuOpen && !(SmegHack.Options["Cams_Toggle"] && SmegHack.Options["Cams_CSNoclip"]) then
			if !SmegHack.Options["Aimbot_AimOnKey"] || ( ( ( SmegHack.Options["Aimbot_AimOnKey_Key"] >= 107 && SmegHack.Options["Aimbot_AimOnKey_Key"] <= 113 ) && input.IsMouseDown(SmegHack.Options["Aimbot_AimOnKey_Key"]) ) || input.IsKeyDown(SmegHack.Options["Aimbot_AimOnKey_Key"]) ) then
				local FinAngleP
				local AimSpotT = {}
				local PlayerDistance, NewPlayerDistance, MousePos, NewMousePos = math.huge, math.huge, math.huge, math.huge
				if !SmegHack.Options["Aimbot_StickToTarget"] then EntTable = ents.GetAll() end
				for k, v in pairs(EntTable) do
					if v != LocalPlayer() && v:IsValid() && v:Health() > 0 && ( v:IsNPC() || v:IsPlayer() ) then
						local Ent = v
						local AimTeam, AimOpponents, AimFriends, AimEnemies, AimSpectators, AimNPCs = false, false, false, false, false, false
						local AimTeamV, AimOpponentsV, AimFriendsV, AimEnemiesV, AimSpectatorsV, AimNPCsV = true, true, true, true, true, true
						if !Ent:IsNPC() then
							local Team, _ = GetTeam(Ent)
							if Ent:Team() != TEAM_SPECTATOR && SmegHack.Options["Aimbot_AimTeam"] && Team == GetTeam(LocalPlayer()) then
								if SmegHack.Options["Aimbot_AimTeamV"] == "Aim" then
									AimTeam = true
								else
									AimTeamV = false
								end
							end
							if Ent:Team() != TEAM_SPECTATOR && SmegHack.Options["Aimbot_AimOpponents"] && Team != GetTeam(LocalPlayer()) then
								if SmegHack.Options["Aimbot_AimOpponentsV"] == "Aim" then
									AimOpponents = true
								else
									AimOpponentsV = false
								end
							end
							if Ent:Team() != TEAM_SPECTATOR && SmegHack.Options["Aimbot_AimFriends"] && ( (!SmegHack.Options["Friends_FriendIsEnemy"] && table.HasValue( SmegHack.FriendsList, Ent:SteamID() ) ) || (SmegHack.Options["Friends_FriendIsEnemy"] && !table.HasValue( SmegHack.FriendsList, Ent:SteamID() ) ) ) then
								if SmegHack.Options["Aimbot_AimFriendsV"] == "Aim" then
									AimFriends = true
								else
									AimFriendsV = false
								end
							end
							if Ent:Team() != TEAM_SPECTATOR && SmegHack.Options["Aimbot_AimEnemies"] && ( (!SmegHack.Options["Friends_FriendIsEnemy"] && !table.HasValue( SmegHack.FriendsList, Ent:SteamID() ) ) || (SmegHack.Options["Friends_FriendIsEnemy"] && table.HasValue( SmegHack.FriendsList, Ent:SteamID() ) ) ) then
								if SmegHack.Options["Aimbot_AimEnemiesV"] == "Aim" then
									AimEnemies = true
								else
									AimEnemiesV = false
								end
							end
							if SmegHack.Options["Aimbot_AimSpectators"] && Ent:Team() == TEAM_SPECTATOR then
								if SmegHack.Options["AimSpectatorsV"] == "Aim" then
									AimSpectators = true
								else
									AimSpectatorsV = false
								end
							end
						else
							if SmegHack.Options["Aimbot_AimNPCs"] && SmegHack.Options["Aimbot_AimNPCsV"] == "Aim" then
								if SmegHack.Options["Aimbot_AimNPCsV"] == "Aim" then
									AimNPCs = true
								else
									AimNPCsV = false
								end
							end
						end
						if (AimTeam || AimOpponents || AimFriends || AimEnemies || AimSpectators || AimNPCs) && (AimTeamV && AimOpponentsV && AimFriendsV && AimEnemiesV && AimSpectatorsV && AimNPCsV) then
							local LOS, AimP, AimF = false, false, false
							local AimSpot

							if SmegHack.Options["Aimbot_BoneAim"] && SmegHack.BoneOrder[1] != nil then
								table.Empty( AimSpotT )
								for k, v in pairs(SmegHack.BoneOrder) do
									if Ent:GetBonePosition(Ent:LookupBone(v)) != nil && AimSpot == nil then
										AimSpot = Ent:GetBonePosition(Ent:LookupBone(v))
									end
									if Ent:GetBonePosition(Ent:LookupBone(v)) != nil then
										local BonePos = Ent:GetBonePosition(Ent:LookupBone(v))
										if v == "ValveBiped.Bip01_Head1" then BonePos = BonePos+Vector(0,0,1) end
										table.insert( AimSpotT, BonePos )
									end
								end
								if AimSpot == nil then AimSpot = Ent:LocalToWorld(Ent:OBBCenter()) end
								if AimSpotT == nil then AimSpotT = {Ent:LocalToWorld(Ent:OBBCenter())} end
							else
								AimSpot = Ent:LocalToWorld(Ent:OBBCenter())
								AimSpotT = {Ent:LocalToWorld(Ent:OBBCenter())}
							end

							local CurAngle = LocalPlayer():EyeAngles()
							local CurPos = LocalPlayer():GetShootPos()

							AimSpot = AimSpot+(CurAngle:Right()*SmegHack.Options["Aimbot_OffsetX"]) //This is screw up when close to your target
							AimSpot.z = AimSpot.z + SmegHack.Options["Aimbot_OffsetY"]

							local FinAngle = ( AimSpot - CurPos ):Angle()
							if FinAngle.y > 180 then
								FinAngle.y = FinAngle.y-360
							end

							if SmegHack.Options["Aimbot_AimPriority"] == "Distance" then
								if LocalPlayer():GetShootPos():Distance(AimSpot) < PlayerDistance then NewPlayerDistance = LocalPlayer():GetShootPos():Distance(AimSpot) AimP = true end
							elseif SmegHack.Options["Aimbot_AimPriority"] == "Crosshair" then
								local FirstCalc = math.Distance( CurAngle.x, CurAngle.y, FinAngle.x, FinAngle.y )
								local Calc
								if FirstCalc > 180 && ( ( CurAngle.y >= 0 && FinAngle.y < 0 ) || ( CurAngle.y < 0 && FinAngle.y >= 0 ) ) then
									Calc = 360 - math.Distance( CurAngle.x, CurAngle.y, FinAngle.x, FinAngle.y )
								else
									Calc = math.Distance( CurAngle.x, CurAngle.y, FinAngle.x, FinAngle.y )
								end
								if Calc < MousePos then NewMousePos = Calc AimP = true end
							end

							if SmegHack.Options["Aimbot_FOV"] then
								local CalcX = FinAngle.y - CurAngle.y
								local CalcY = FinAngle.x - CurAngle.x
								if CalcY < 0 then CalcY = CalcY * -1 end
								if CalcX < 0 then CalcX = CalcX * -1 end
								if CalcY > 180 then CalcY = 360 - CalcY end
								if CalcX > 180 then CalcX = 360 - CalcX end
								if CalcX <= SmegHack.Options["Aimbot_FOV_Value"]/2 && CalcY <= SmegHack.Options["Aimbot_FOV_Value"]*0.4 then AimF = true end
							else
								AimF = true
							end

							if SmegHack.Options["Aimbot_LOSCheck"] || SmegHack.Options["Aimbot_AutoWall"] then
								for k, v in pairs(AimSpotT) do
									local TrLOS = {}
									TrLOS.start = LocalPlayer():GetShootPos()
									TrLOS.endpos = v
									TrLOS.filter = {}
									if SmegHack.Options["Aimbot_StickToTarget"] then
										for k, v in pairs(ents.GetAll()) do
											if v:IsValid() && ( v:IsPlayer() || v:IsNPC() ) then
												table.insert( TrLOS.filter, v )
											end
										end
									else TrLOS.filter = {LocalPlayer(), Ent} end
									if SmegHack.Options["Aimbot_AutoWall"] then TrLOS.mask = MASK_SHOT else TrLOS.mask = MASK_VISIBLE_AND_NPCS end
									if util.TraceLine(TrLOS).Fraction == 1 then
										LOS = true
										AimSpot = v
										break
									end
								end
							else
								LOS = true
							end
							if LOS && AimP && AimF then
								EntTable = {Ent}
								FinAngleP = FinAngle
								PlayerDistance = NewPlayerDistance
								MousePos = NewMousePos
							elseif SmegHack.Options["Aimbot_StickToTarget"] && EntTable[2] != nil then
								EntTable = ents.GetAll()
							end
						end
					end
				end
				if EntTable != nil && FinAngleP != nil then
					if SmegHack.Options["Aimbot_SmoothAim"] then
						SmoothAngles( FinAngleP, SmegHack.Options["Aimbot_SmoothAim_Value"] )
					else
						if SmegHack.Options["Aimbot_AutoShoot"] then
							LocalPlayer():SetEyeAngles(FinAngleP)
							LocalPlayer():ConCommand("+attack")
							timer.Simple( 0.1, function() LocalPlayer():ConCommand("-attack") end )
						else
							LocalPlayer():SetEyeAngles(FinAngleP)
						end
					end
				elseif EntTable[2] == nil then
					EntTable = ents.GetAll()
				end
			else
				if EntTable[2] == nil then
					EntTable = ents.GetAll()
				end
			end
		end
	end)
	AddHook( "ChatSpam", "Think", RandomString(), function()
		if GetConVarNumber("SmegHack_Panic") == 0 then
			if !SpamWait then
				if SmegHack.Options["Spam_Toggle"] then
					if SmegHack.Options["Spam_Delay"] then
						SpamWait = true
						Spam1, Spam2, Spam3, Spam4, Spam5 = false, false, false, false, false
						local Timer = SmegHack.Options["Spam_Delay_Value"]
						if SmegHack.Options["Spam_Message_1"] && SmegHack.TextEntries["Spam1"] != nil then
							local String = SmegHack.TextEntries["Spam1"]
							if SmegHack.Options["Spam_AntiAntiSpam"] then String = String.." ("..RandomShortString()..")" end
							timer.Simple( Timer, function()
								LocalPlayer():ConCommand("say "..String)
								Spam1 = true
							end)
							Timer = Timer + SmegHack.Options["Spam_Delay_Value"]
						else Spam1 = true end

						if SmegHack.Options["Spam_Message_2"] && SmegHack.TextEntries["Spam2"] != nil then
							local String = SmegHack.TextEntries["Spam2"]
							if SmegHack.Options["Spam_AntiAntiSpam"] then String = String.." ("..RandomShortString()..")" end
							timer.Simple( Timer, function()
								LocalPlayer():ConCommand("say "..String)
								Spam2 = true
							end)
							Timer = Timer + SmegHack.Options["Spam_Delay_Value"]
						else Spam2 = true end

						if SmegHack.Options["Spam_Message_3"] && SmegHack.TextEntries["Spam3"] != nil then
							local String = SmegHack.TextEntries["Spam3"]
							if SmegHack.Options["Spam_AntiAntiSpam"] then String = String.." ("..RandomShortString()..")" end
							timer.Simple( Timer, function()
								LocalPlayer():ConCommand("say "..String)
								Spam3 = true
							end)
							Timer = Timer + SmegHack.Options["Spam_Delay_Value"]
						else Spam3 = true end

						if SmegHack.Options["Spam_Message_4"] && SmegHack.TextEntries["Spam4"] != nil then
							local String = SmegHack.TextEntries["Spam4"]
							if SmegHack.Options["Spam_AntiAntiSpam"] then String = String.." ("..RandomShortString()..")" end
							timer.Simple( Timer, function()
								LocalPlayer():ConCommand("say "..String)
								Spam4 = true
							end)
							Timer = Timer + SmegHack.Options["Spam_Delay_Value"]
						else Spam4 = true end

						if SmegHack.Options["Spam_Message_5"] && SmegHack.TextEntries["Spam5"] != nil then
							local String = SmegHack.TextEntries["Spam5"]
							if SmegHack.Options["Spam_AntiAntiSpam"] then String = String.." ("..RandomShortString()..")" end
							timer.Simple( Timer, function()
								LocalPlayer():ConCommand("say "..String)
								Spam5 = true
							end)
							Timer = Timer + SmegHack.Options["Spam_Delay_Value"]
						else Spam5 = true end
					else
						if SmegHack.Options["Spam_Message_1"] && SmegHack.TextEntries["Spam1"] != nil then
							local String = SmegHack.TextEntries["Spam1"]
							if SmegHack.Options["Spam_AntiAntiSpam"] then String = String.." ("..RandomShortString()..")" end
							LocalPlayer():ConCommand("say "..String)
						end
						if SmegHack.Options["Spam_Message_1"] && SmegHack.TextEntries["Spam2"] != nil then
							local String = SmegHack.TextEntries["Spam2"]
							if SmegHack.Options["Spam_AntiAntiSpam"] then String = String.." ("..RandomShortString()..")" end
							LocalPlayer():ConCommand("say "..String)
						end
						if SmegHack.Options["Spam_Message_1"] && SmegHack.TextEntries["Spam3"] != nil then
							local String = SmegHack.TextEntries["Spam3"]
							if SmegHack.Options["Spam_AntiAntiSpam"] then String = String.." ("..RandomShortString()..")" end
							LocalPlayer():ConCommand("say "..String)
						end
						if SmegHack.Options["Spam_Message_1"] && SmegHack.TextEntries["Spam4"] != nil then
							local String = SmegHack.TextEntries["Spam4"]
							if SmegHack.Options["Spam_AntiAntiSpam"] then String = String.." ("..RandomShortString()..")" end
							LocalPlayer():ConCommand("say "..String)
						end
						if SmegHack.Options["Spam_Message_1"] && SmegHack.TextEntries["Spam5"] != nil then
							local String = SmegHack.TextEntries["Spam5"]
							if SmegHack.Options["Spam_AntiAntiSpam"] then String = String.." ("..RandomShortString()..")" end
							LocalPlayer():ConCommand("say "..String)
						end
					end
				end
			else
				if Spam1 && Spam2 && Spam3 && Spam4 && Spam5 then SpamWait = false end
			end
		end
	end)
	AddHook( "ESP", "HUDPaint", RandomString(), function()
		if GetConVarNumber("SmegHack_Panic") == 0 then
			if SmegHack.Options["Cams_Toggle"] && SmegHack.Options["Cams_CSNoclip"] then
				local MaxX, MaxY, MinX, MinY = ESPGetPos( LocalPlayer() )
				local Dist = math.floor(LocalPlayer():GetPos():Distance(NoclipPos)/40)
				draw.SimpleTextOutlined( "You are here ".."["..Dist.."]", "Cams", ((MaxX-MinX)/2)+MinX, MinY-5, Color(0,150,250), TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP, 1, Color(0,0,0) )
				surface.SetDrawColor( Color(0,0,255) )
				surface.DrawLine( MaxX, MaxY, MinX, MaxY )
				surface.DrawLine( MaxX, MaxY, MaxX, MinY )
				surface.DrawLine( MinX, MinY, MaxX, MinY )
				surface.DrawLine( MinX, MinY, MinX, MaxY )
			end
			if SmegHack.Options["ESP_Toggle"] || SmegHack.Options["ESP_Entity_Toggle"] then
				for k, v in pairs( ents.GetAll() ) do
					if v:IsValid() && v != LocalPlayer() && !v:IsDormant() then
						local Ent = v
						if SmegHack.Options["ESP_Entity_Toggle"] then
							for k, v in pairs( SmegHack.EntityESP ) do
								if v == Ent:GetClass() && Ent:GetOwner() != LocalPlayer()  then
									local MaxX, MaxY, MinX, MinY, V1, V2, V3, V4, V5, V6, V7, V8 = ESPGetPos( Ent )
									if SmegHack.Options["ESP_Entities_NameTags"] == true then
										local Name = Ent:GetClass()
										local Dist = math.floor(Ent:GetPos():Distance(LocalPlayer():GetShootPos())/40)
										draw.SimpleTextOutlined( Name.." ["..Dist.."]", "ESP_Font_Entity", ((MaxX-MinX)/2)+MinX, MinY-5, Color(0,160,240), TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP, 1, Color(0,0,0) )
									end
									if SmegHack.Options["ESP_Entities_BoundaryBoxes"] == true then
										surface.SetDrawColor( Color(0,160,240) )
										if SmegHack.Options["ESP_Entities_BoundaryBoxes_Mode"] == "2D" then
											surface.DrawLine( MaxX, MaxY, MinX, MaxY )
											surface.DrawLine( MaxX, MaxY, MaxX, MinY )
											surface.DrawLine( MinX, MinY, MaxX, MinY )
											surface.DrawLine( MinX, MinY, MinX, MaxY )
										else
											//Top Box
											surface.DrawLine( V4.x, V4.y, V6.x, V6.y )
											surface.DrawLine( V1.x, V1.y, V8.x, V8.y )
											surface.DrawLine( V6.x, V6.y, V8.x, V8.y )
											surface.DrawLine( V4.x, V4.y, V1.x, V1.y )

											//Bottom Box
											surface.DrawLine( V3.x, V3.y, V5.x, V5.y )
											surface.DrawLine( V2.x, V2.y, V7.x, V7.y )
											surface.DrawLine( V3.x, V3.y, V2.x, V2.y )
											surface.DrawLine( V5.x, V5.y, V7.x, V7.y )

											//Verticals
											surface.DrawLine( V3.x, V3.y, V4.x, V4.y )
											surface.DrawLine( V2.x, V2.y, V1.x, V1.y )
											surface.DrawLine( V7.x, V7.y, V8.x, V8.y )
											surface.DrawLine( V5.x, V5.y, V6.x, V6.y )
										end
									end
								end
							end
						end
						if SmegHack.Options["ESP_Toggle"] then
							if SmegHack.Options["ESP_Crosshair"] == true then
								local _, TeamColor = GetTeam(LocalPlayer())
								if SmegHack.Options["ESP_Crosshair_Mode"] == "Team" && Color(SmegHack.Options["ESP_Crosshair_Color_R"], SmegHack.Options["ESP_Crosshair_Color_G"], SmegHack.Options["ESP_Crosshair_Color_B"]) != TeamColor then
									SmegHack.Options["ESP_Crosshair_Color_R"] = TeamColor.r
									SmegHack.Options["ESP_Crosshair_Color_G"] = TeamColor.g
									SmegHack.Options["ESP_Crosshair_Color_B"] = TeamColor.b
								end
								surface.SetDrawColor(Color(SmegHack.Options["ESP_Crosshair_Color_R"], SmegHack.Options["ESP_Crosshair_Color_G"], SmegHack.Options["ESP_Crosshair_Color_B"], SmegHack.Options["ESP_Crosshair_Color_A"]))
								surface.DrawLine((ScrW()/2)-SmegHack.Options["ESP_Crosshair_Size"], ScrH()/2, (ScrW()/2)+SmegHack.Options["ESP_Crosshair_Size"], ScrH()/2)
								surface.DrawLine(ScrW()/2, (ScrH()/2)-SmegHack.Options["ESP_Crosshair_Size"], ScrW()/2, (ScrH()/2)+SmegHack.Options["ESP_Crosshair_Size"])
							end
							if Ent:IsNPC() || Ent:IsPlayer() then
								local Name
								local ShowTeam, ShowOpponents, ShowFriends, ShowEnemies, ShowNPCs, ShowSpectators = false, false, false, false, false, false
								local ShowTeamV, ShowOpponentsV, ShowFriendsV, ShowEnemiesV, ShowNPCsV, ShowSpectatorsV = true, true, true, true, true, true

								if !Ent:IsNPC() && Ent:Health() > 0 then
									local Team, _ = GetTeam(Ent)
									if Ent:Team() != TEAM_SPECTATOR && SmegHack.Options["ESP_ShowTeam"] && Team == GetTeam(LocalPlayer()) then
										if SmegHack.Options["ESP_ShowTeamV"] == "Show" then
											ShowTeam = true
										else
											ShowTeamV = false
										end
									end
									if Ent:Team() != TEAM_SPECTATOR && SmegHack.Options["ESP_ShowOpponents"] && Team != GetTeam(LocalPlayer()) then
										if SmegHack.Options["ESP_ShowOpponentsV"] == "Show" then
											ShowOpponents = true
										else
											ShowOpponentsV = false
										end
									end
									if Ent:Team() != TEAM_SPECTATOR && SmegHack.Options["ESP_ShowFriends"] && ( (!SmegHack.Options["Friends_FriendIsEnemy"] && table.HasValue( SmegHack.FriendsList, Ent:SteamID() ) ) || (SmegHack.Options["Friends_FriendIsEnemy"] && !table.HasValue( SmegHack.FriendsList, Ent:SteamID() ) ) ) then
										if SmegHack.Options["ESP_ShowFriendsV"] == "Show" then
											ShowFriends = true
										else
											ShowFriendsV = false
										end
									end
									if Ent:Team() != TEAM_SPECTATOR && SmegHack.Options["ESP_ShowEnemies"] && ( (!SmegHack.Options["Friends_FriendIsEnemy"] && !table.HasValue( SmegHack.FriendsList, Ent:SteamID() ) ) || (SmegHack.Options["Friends_FriendIsEnemy"] && table.HasValue( SmegHack.FriendsList, Ent:SteamID() ) ) ) then
										if SmegHack.Options["ESP_ShowEnemiesV"] =="Show" then
											ShowEnemies = true
										else
											ShowEnemiesV = false
										end
									end
									if SmegHack.Options["ESP_ShowSpectators"] && Ent:Team() == TEAM_SPECTATOR then
										if SmegHack.Options["ESP_ShowSpectatorsV"] == "Show" then
											ShowSpectators = true
										else
											ShowSpectatorsV = false
										end
									end
									Name = Ent:Nick()
								else
									if SmegHack.Options["ESP_ShowNPCs"] && Ent:IsNPC() then
										if SmegHack.Options["ESP_ShowNPCsV"] == "Show" then
											ShowNPCs = true
										else
											ShowNPCsV = false
										end
									end
									Name = Ent:GetClass()
								end
								if (ShowTeam || ShowOpponents || ShowFriends || ShowEnemies || ShowNPCs || ShowSpectators) && (ShowTeamV && ShowOpponentsV && ShowFriendsV && ShowEnemiesV && ShowNPCsV && ShowSpectatorsV) then
									local MaxX, MaxY, MinX, MinY, V1, V2, V3, V4, V5, V6, V7, V8 = ESPGetPos( Ent )
									local DrawColor
									local ESPPos = MinY
									if Ent:IsNPC() then	DrawColor = Color(170,220,120) else _, DrawColor = GetTeam(Ent) end
									if SmegHack.Options["ESP_BoundaryBoxes"] then
										surface.SetDrawColor( DrawColor )
										if SmegHack.Options["ESP_BoundaryBoxes_Mode"] == "2D" then
											surface.DrawLine( MaxX, MaxY, MinX, MaxY )
											surface.DrawLine( MaxX, MaxY, MaxX, MinY )
											surface.DrawLine( MinX, MinY, MaxX, MinY )
											surface.DrawLine( MinX, MinY, MinX, MaxY )
										else
											//Top Box
											surface.DrawLine( V4.x, V4.y, V6.x, V6.y )
											surface.DrawLine( V1.x, V1.y, V8.x, V8.y )
											surface.DrawLine( V6.x, V6.y, V8.x, V8.y )
											surface.DrawLine( V4.x, V4.y, V1.x, V1.y )

											//Bottom Box
											surface.DrawLine( V3.x, V3.y, V5.x, V5.y )
											surface.DrawLine( V2.x, V2.y, V7.x, V7.y )
											surface.DrawLine( V3.x, V3.y, V2.x, V2.y )
											surface.DrawLine( V5.x, V5.y, V7.x, V7.y )

											//Verticals
											surface.DrawLine( V3.x, V3.y, V4.x, V4.y )
											surface.DrawLine( V2.x, V2.y, V1.x, V1.y )
											surface.DrawLine( V7.x, V7.y, V8.x, V8.y )
											surface.DrawLine( V5.x, V5.y, V6.x, V6.y )
										end
									end
									if SmegHack.Options["ESP_Health"] then					
										local HealthColor = Color( (1-(Ent:Health()/Ent:GetMaxHealth()))*255, (Ent:Health()/Ent:GetMaxHealth())*255, 0 )
										local HealthString = tostring(Ent:Health())

										if MaxY-MinY <= 45 then
											local TopHealthFar = ((1-(Ent:Health()/Ent:GetMaxHealth()))*43)+MinY+1
											local BottomHealthFar = 43-((1-(Ent:Health()/Ent:GetMaxHealth()))*43)
											draw.RoundedBox( 0, MinX-15, MinY, 10, 45, Color(0,0,0) )
											draw.RoundedBox( 0, MinX-14, TopHealthFar, 8, BottomHealthFar, HealthColor )
											draw.SimpleTextOutlined( HealthString.."%", "ESP_Font_Entity", MinX-17, MinY+22.5, HealthColor, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER, 1, Color(0,0,0) )
										else
											local TopHealthClose = (MinY+((1-(Ent:Health()/Ent:GetMaxHealth()))*(MaxY-MinY)))+1
											local BottomHealthClose = ((Ent:Health()/Ent:GetMaxHealth())*(MaxY-MinY))-2
											draw.RoundedBox( 0, MinX-15, MinY, 10, MaxY-MinY, Color(0,0,0) )
											draw.RoundedBox( 0, MinX-14, TopHealthClose, 8, BottomHealthClose, HealthColor )
											draw.SimpleTextOutlined( HealthString.."%", "ESP_Font_Entity", MinX-17, ((MinY-MaxY)/2)+MaxY, HealthColor, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER, 1, Color(0,0,0) )
										end

									end
									if SmegHack.Options["ESP_NameTags"] then
										if GMode == 2 && Ent:GetBystanderName() != nil then

											draw.SimpleTextOutlined( "N: "..Name.." ("..Ent:GetBystanderName()..")", "ESP_Font_Main", MaxX+5, ESPPos, DrawColor, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM, 1, Color(0,0,0) )
										else
											draw.SimpleTextOutlined( "N: "..Name, "ESP_Font_Main", MaxX+5, ESPPos, DrawColor, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM, 1, Color(0,0,0) )
										end
										ESPPos = ESPPos + 15
									end
									if SmegHack.Options["ESP_Weapon"] then
										if Ent:GetActiveWeapon():IsValid() then
											local WName = Ent:GetActiveWeapon():GetPrintName()
											draw.SimpleTextOutlined( "W: "..WName, "ESP_Font_Main", MaxX+5, ESPPos, DrawColor, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM, 1, Color(0,0,0) )
											ESPPos = ESPPos + 15
										end
									end
									if SmegHack.Options["ESP_Distance"] then
										local Dist = math.floor(Ent:GetPos():Distance(LocalPlayer():GetShootPos())/40)
										draw.SimpleTextOutlined( "D: "..Dist, "ESP_Font_Main", MaxX+5, ESPPos, DrawColor, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM, 1, Color(0,0,0) )
										ESPPos = ESPPos + 15
									end
									if SmegHack.Options["ESP_Skeleton"] then
										local Bones = {}
										local Success = true
										for k, v in pairs(SmegHack.Bones) do
											if Ent:LookupBone(v) != nil && Ent:GetBonePosition(Ent:LookupBone(v)) != nil then
												table.insert( Bones, Ent:GetBonePosition(Ent:LookupBone(v)):ToScreen() )
											else
												Success = false //Just incase entities have some bones but not others (I have no idea if that happens, but I figgured better safe then sorry)
												return
											end
										end
										if Success then
											surface.SetDrawColor( DrawColor )
											//Spine
											surface.DrawLine( Bones[1].x, Bones[1].y, Bones[2].x, Bones[2].y )
											surface.DrawLine( Bones[2].x, Bones[2].y, Bones[3].x, Bones[3].y )
											surface.DrawLine( Bones[3].x, Bones[3].y, Bones[4].x, Bones[4].y )
											surface.DrawLine( Bones[4].x, Bones[4].y, Bones[5].x, Bones[5].y )
											surface.DrawLine( Bones[5].x, Bones[5].y, Bones[6].x, Bones[6].y )
											surface.DrawLine( Bones[6].x, Bones[6].y, Bones[7].x, Bones[7].y )

											//Legs
											surface.DrawLine( Bones[7].x, Bones[7].y, Bones[14].x, Bones[14].y )
											surface.DrawLine( Bones[14].x, Bones[14].y, Bones[15].x, Bones[15].y )
											surface.DrawLine( Bones[15].x, Bones[15].y, Bones[16].x, Bones[16].y )
											surface.DrawLine( Bones[16].x, Bones[16].y, Bones[17].x, Bones[17].y )

											surface.DrawLine( Bones[7].x, Bones[7].y, Bones[18].x, Bones[18].y )
											surface.DrawLine( Bones[18].x, Bones[18].y, Bones[19].x, Bones[19].y )
											surface.DrawLine( Bones[19].x, Bones[19].y, Bones[20].x, Bones[20].y )
											surface.DrawLine( Bones[20].x, Bones[20].y, Bones[21].x, Bones[21].y )

											//Arms
											surface.DrawLine( Bones[3].x, Bones[3].y, Bones[8].x, Bones[8].y )
											surface.DrawLine( Bones[8].x, Bones[8].y, Bones[9].x, Bones[9].y )
											surface.DrawLine( Bones[9].x, Bones[9].y, Bones[10].x, Bones[10].y )

											surface.DrawLine( Bones[3].x, Bones[3].y, Bones[11].x, Bones[11].y )
											surface.DrawLine( Bones[11].x, Bones[11].y, Bones[12].x, Bones[12].y )
											surface.DrawLine( Bones[12].x, Bones[12].y, Bones[13].x, Bones[13].y )

										end
									end
								end
							end
						end
					end
				end
			end
		end
	end)

	AddHook( "BhopCalcView", "CalcView", RandomString(), function( ply, pos, angles, fov )
		if GetConVarNumber("SmegHack_Panic") == 0 && SmegHack.Options["Bhop_Toggle"] then
			if SmegHack.Options["Bhop_Sideways"] then
				local CamData = {}
				if TapS then CamData.angles = LocalPlayer():EyeAngles()+Angle(0,180,0) else CamData.angles = LocalPlayer():EyeAngles()+Angle(0,90,0) end
				CamData.origin = LocalPlayer():GetShootPos()
				CamData.fov = fov

				return CamData
			elseif SmegHack.Options["Bhop_WOnly"] then
				local CamData = {}
				if WLeft then
					CamData.angles = LocalPlayer():EyeAngles()-Angle(0,90,0)
				elseif WRight then
					CamData.angles = LocalPlayer():EyeAngles()+Angle(0,90,0)
				elseif WBack then
					CamData.angles = LocalPlayer():EyeAngles()+Angle(0,180,0)
				end
				CamData.origin = LocalPlayer():GetShootPos()
				CamData.fov = fov

				return CamData
			end
		end
	end)
	AddHook( "Bhop", "CreateMove", RandomString(), function(ucmd)
		if SmegHack.Options["Bhop_Toggle"] && GetConVarNumber("SmegHack_Panic") == 0 then
			if SmegHack.Options["Bhop_FastWalk"] then
				if LocalPlayer():IsOnGround() && ( ucmd:KeyDown(IN_FORWARD) || ucmd:KeyDown(IN_BACK) ) then
					if FastWalk == false then
						ucmd:SetSideMove(ucmd:GetSideMove()-5000)
					else
						ucmd:SetSideMove(ucmd:GetSideMove()+5000)
					end
					FastWalk = !FastWalk
				end
			end
			if SmegHack.Options["Bhop_AutoHop"] then
				if ucmd:KeyDown(IN_JUMP) then
					if LocalPlayer():WaterLevel() <= 1 && LocalPlayer():GetMoveType() != MOVETYPE_LADDER && !LocalPlayer():IsOnGround() then
						ucmd:RemoveKey(IN_JUMP)
					end
				end
			end
			if SmegHack.Options["Bhop_AutoStrafe"] && !LocalPlayer():IsOnGround() && LocalPlayer():WaterLevel() <= 1 && LocalPlayer():GetMoveType() != MOVETYPE_LADDER && !( LocalPlayer():KeyDown(IN_FORWARD) || LocalPlayer():KeyDown(IN_BACK) || LocalPlayer():KeyDown(IN_MOVELEFT) || LocalPlayer():KeyDown(IN_MOVERIGHT) ) then
				if SmegHack.Options["Bhop_Sideways"] && !TapS then
					if ucmd:GetMouseX() < 0 then
						ucmd:SetForwardMove(-1000000)
					end
					if ucmd:GetMouseX() > 0 then
						ucmd:SetForwardMove(1000000)
					end
				elseif SmegHack.Options["Bhop_WOnly"] then
					if ucmd:GetMouseX() < 0 then
						ucmd:SetForwardMove(1000000)
						if !WLeft then
							if WRight then
								ucmd:SetViewAngles(ucmd:GetViewAngles()+Angle(0,180,0))
							elseif WForward then
								ucmd:SetViewAngles(ucmd:GetViewAngles()+Angle(0,90,0))
							elseif WBack then
								ucmd:SetViewAngles(ucmd:GetViewAngles()-Angle(0,90,0))
							end
							WLeft = true
							WRight, WForward, WBack = false, false, false
						end
					elseif ucmd:GetMouseX() > 0 then
						ucmd:SetForwardMove(1000000)
						if !WRight then
							if WLeft then
								ucmd:SetViewAngles(ucmd:GetViewAngles()+Angle(0,180,0))
							elseif WForward then
								ucmd:SetViewAngles(ucmd:GetViewAngles()-Angle(0,90,0))
							elseif WBack then
								ucmd:SetViewAngles(ucmd:GetViewAngles()+Angle(0,90,0))
							end
							WRight = true
							WLeft, WForward, WBack = false, false, false
						end
					end
				else
					if ucmd:GetMouseX() < 0 then
						ucmd:SetSideMove(-1000000)
					end
					if ucmd:GetMouseX() > 0 then
						ucmd:SetSideMove(1000000)
					end
				end
			end
			if SmegHack.Options["Bhop_EdgeJump"] then
				if LocalPlayer():IsOnGround() then
					local WalkAngle
					if LocalPlayer():GetVelocity():Length() != 0 then
						WalkAngle = Angle( 0, LocalPlayer():GetVelocity():Angle().y, 0 )
					else
						WalkAngle = Angle( 0, LocalPlayer():EyeAngles().y, 0 )
					end
					local FinPos = LocalPlayer():EyePos() + (WalkAngle:Forward()*(SmegHack.Options["Bhop_EdgeJump_Distance"]-50))
					FinPos.z = LocalPlayer():GetPos().z-5
					local GroundDetect = {
							start = LocalPlayer():GetShootPos(),
							endpos = FinPos,
							filter = LocalPlayer(),
							mask = MASK_PLAYERSOLID
						}
					if util.TraceLine(GroundDetect).Fraction == 1 then
						ucmd:SetButtons( ucmd:GetButtons() + IN_JUMP )
					end
				end
				//LocalPlayer():SetEyeAngles(Angle( 0,LocalPlayer():GetVelocity():Angle().y,LocalPlayer():GetVelocity():Angle().z )) <-Just for safe keeping
			end
			if SmegHack.Options["Bhop_Sideways"] then
				if ucmd:KeyDown(IN_MOVELEFT) && !TapS then
					if ucmd:KeyDown(IN_MOVERIGHT) then ForwardMove = 0 elseif ForwardMove == 0 then ForwardMove = -1000000 end
					ucmd:SetSideMove(SideMove)
					ucmd:SetForwardMove(ForwardMove)
				end
				if ucmd:KeyDown(IN_MOVERIGHT) && !TapS then
					if ucmd:KeyDown(IN_MOVELEFT) then ForwardMove = 0 elseif ForwardMove == 0 then ForwardMove = 1000000 end
					ucmd:SetSideMove(SideMove)
					ucmd:SetForwardMove(ForwardMove)
				end
				if !ucmd:KeyDown(IN_MOVELEFT) && !ucmd:KeyDown(IN_MOVERIGHT) && !TapS then ForwardMove = 0 end

				if ucmd:KeyDown(IN_FORWARD) && !TapS then
					if ucmd:KeyDown(IN_BACK) then SideMove = 0 elseif SideMove == 0 then SideMove = -1000000 end
					ucmd:SetSideMove(SideMove)
					ucmd:SetForwardMove(ForwardMove)
				end
				if ucmd:KeyDown(IN_BACK) && LocalPlayer():IsOnGround() && !TapS then
					if ucmd:KeyDown(IN_FORWARD) then SideMove = 0 elseif SideMove == 0 then SideMove = 1000000 end
					ucmd:SetSideMove(SideMove)
					ucmd:SetForwardMove(ForwardMove)
				elseif ucmd:KeyDown(IN_BACK) && !LocalPlayer():IsOnGround() && !TapS then
					ForwardMove = 1000000
					ucmd:SetViewAngles(ucmd:GetViewAngles()-Angle(0,90,0))
					ucmd:SetForwardMove(ForwardMove)
					TapS = true
				end
				if !ucmd:KeyDown(IN_FORWARD) && !ucmd:KeyDown(IN_BACK) && !TapS then SideMove = 0 end
				if !LocalPlayer():IsOnGround() && ucmd:KeyDown(IN_BACK) && TapS then
					ucmd:SetForwardMove(1000000)
				elseif ( !ucmd:KeyDown(IN_BACK) || LocalPlayer():IsOnGround() ) && TapS then
					ucmd:SetViewAngles(ucmd:GetViewAngles()+Angle(0,90,0))
					TapS = false
				end
			elseif SmegHack.Options["Bhop_WOnly"] then
				if ucmd:KeyDown(IN_MOVELEFT) && !WLeft then
					if WRight then
						ucmd:SetViewAngles(ucmd:GetViewAngles()+Angle(0,180,0))
					elseif WForward then
						ucmd:SetViewAngles(ucmd:GetViewAngles()+Angle(0,90,0))
					elseif WBack then
						ucmd:SetViewAngles(ucmd:GetViewAngles()-Angle(0,90,0))
					end
					WLeft = true
					WRight, WForward, WBack = false, false, false
				elseif ucmd:KeyDown(IN_MOVERIGHT) && !WRight then
					if WLeft then
						ucmd:SetViewAngles(ucmd:GetViewAngles()+Angle(0,180,0))
					elseif WForward then
						ucmd:SetViewAngles(ucmd:GetViewAngles()-Angle(0,90,0))
					elseif WBack then
						ucmd:SetViewAngles(ucmd:GetViewAngles()+Angle(0,90,0))
					end
					WRight = true
					WLeft, WForward, WBack = false, false, false
				elseif ucmd:KeyDown(IN_FORWARD) && !WForward then
					if WRight then
						ucmd:SetViewAngles(ucmd:GetViewAngles()+Angle(0,90,0))
					elseif WLeft then
						ucmd:SetViewAngles(ucmd:GetViewAngles()-Angle(0,90,0))
					elseif WBack then
						ucmd:SetViewAngles(ucmd:GetViewAngles()+Angle(0,180,0))
					end
					WForward = true
					WLeft, WRight, WBack = false, false, false
				elseif ucmd:KeyDown(IN_BACK) && !WBack then
					if WRight then
						ucmd:SetViewAngles(ucmd:GetViewAngles()-Angle(0,90,0))
					elseif WForward then
						ucmd:SetViewAngles(ucmd:GetViewAngles()+Angle(0,180,0))
					elseif WLeft then
						ucmd:SetViewAngles(ucmd:GetViewAngles()+Angle(0,90,0))
					end
					WBack = true
					WLeft, WRight, WForward = false, false, false
				end
				if !ucmd:KeyDown(IN_MOVELEFT) && !ucmd:KeyDown(IN_MOVERIGHT) && !ucmd:KeyDown(IN_FORWARD) && !ucmd:KeyDown(IN_BACK) then WActive = false else WActive = true end
				if WActive then
					ucmd:SetForwardMove(1000000)
					ucmd:SetSideMove(0)
				end
			end
		end
	end)

	AddHook( "Cams", "CalcView", RandomString(), function( ply, Pos, Ang, FOV )
		if SmegHack.Options["Cams_Toggle"] && GetConVarNumber("SmegHack_Panic") == 0 then
			local CamData = {}
			if SmegHack.Options["Cams_CSNoclip"] then
				local Speed = SmegHack.Options["Cams_CSNoclip_Speed"]/5
				local MouseAngs = Angle( NoclipY, NoclipX, 0 )
				if LocalPlayer():KeyDown(IN_SPEED) then
					Speed = Speed * 5
				end
				if LocalPlayer():KeyDown(IN_FORWARD) then
					NoclipPos = NoclipPos+(MouseAngs:Forward()*Speed)
				end
				if LocalPlayer():KeyDown(IN_BACK) then
					NoclipPos = NoclipPos-(MouseAngs:Forward()*Speed)
				end
				if LocalPlayer():KeyDown(IN_MOVELEFT) then
					NoclipPos = NoclipPos-(MouseAngs:Right()*Speed)
				end
				if LocalPlayer():KeyDown(IN_MOVERIGHT) then
					NoclipPos = NoclipPos+(MouseAngs:Right()*Speed)
				end
				if NoclipJump then
					NoclipPos = NoclipPos+Vector(0,0,Speed)
				end
				if NoclipDuck then
					NoclipPos = NoclipPos-Vector(0,0,Speed)
				end
				CamData.origin = NoclipPos
				CamData.angles = MouseAngs
				CamData.fov = FOV
				CamData.drawviewer = true
			elseif SmegHack.Options["Cams_ThirdPerson"] then
				CamData.origin = Pos-(Ang:Forward()*(SmegHack.Options["Cams_ThirdPerson_Zoom"]*10))
				CamData.angles = Ang
				CamData.fov = FOV
				CamData.drawviewer = true
			end
			return CamData
		end
	end)
	AddHook( "Bhop", "CreateMove", RandomString(), function(ucmd)
		if SmegHack.Options["Cams_Toggle"] && SmegHack.Options["Cams_CSNoclip"] && GetConVarNumber("SmegHack_Panic") == 0 then
			if NoclipOn == false then
				NoclipPos, NoclipAngles = LocalPlayer():EyePos(), ucmd:GetViewAngles()
				NoclipY, NoclipX = ucmd:GetViewAngles().x, ucmd:GetViewAngles().y
				NoclipOn = true
			end
			ucmd:ClearMovement()
			if ucmd:KeyDown(IN_JUMP) then
				ucmd:RemoveKey(IN_JUMP)
				NoclipJump = true
			elseif NoclipJump then
				NoclipJump = false
			end
			if ucmd:KeyDown(IN_DUCK) then
				ucmd:RemoveKey(IN_DUCK)
				NoclipDuck = true
			elseif NoclipDuck then
				NoclipDuck = false
			end
			NoclipX = NoclipX-(ucmd:GetMouseX()/50)
			if NoclipY+(ucmd:GetMouseY()/50) > 89 then NoclipY = 89 elseif NoclipY+(ucmd:GetMouseY()/50) < -89 then NoclipY = -89 else NoclipY = NoclipY+(ucmd:GetMouseY()/50) end
			ucmd:SetViewAngles(NoclipAngles)
		elseif NoclipOn == true then
			NoclipOn = false
		end
	end)
	if Display then
		AddHook( "Loaded", "HUDPaint", RandomString(), function()
			draw.SimpleTextOutlined( "Smeg Hack Loaded Successfully!", "Menu_Title", ScrW()/2, 50, Color(0,150,150), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color(0,0,0) )
			timer.Simple( 3, function()
				RemoveHook("Loaded")
			end)
		end)
	end
end

//Bones
SmegHack.Bones = {
"ValveBiped.Bip01_Head1",
"ValveBiped.Bip01_Neck1",
"ValveBiped.Bip01_Spine4",
"ValveBiped.Bip01_Spine2",
"ValveBiped.Bip01_Spine1",
"ValveBiped.Bip01_Spine",
"ValveBiped.Bip01_Pelvis",
"ValveBiped.Bip01_R_UpperArm",
"ValveBiped.Bip01_R_Forearm",
"ValveBiped.Bip01_R_Hand",
"ValveBiped.Bip01_L_UpperArm",
"ValveBiped.Bip01_L_Forearm",
"ValveBiped.Bip01_L_Hand",
"ValveBiped.Bip01_R_Thigh",
"ValveBiped.Bip01_R_Calf",
"ValveBiped.Bip01_R_Foot",
"ValveBiped.Bip01_R_Toe0",
"ValveBiped.Bip01_L_Thigh",
"ValveBiped.Bip01_L_Calf",
"ValveBiped.Bip01_L_Foot",
"ValveBiped.Bip01_L_Toe0"
}

//Key Binds
SmegHack.KeyBinds = {
[0] = "NONE",
[1] = "0",
[2] = "1",
[3] = "2",
[4] = "3",
[5] = "4",
[6] = "5",
[7] = "6",
[8] = "7",
[9] = "8",
[10] = "9",
[11] = "A",
[12] = "B",
[13] = "C",
[14] = "D",
[15] = "E",
[16] = "F",
[17] = "G",
[18] = "H",
[19] = "I",
[20] = "J",
[21] = "K",
[22] = "L",
[23] = "M",
[24] = "N",
[25] = "O",
[26] = "P",
[27] = "Q",
[28] = "R",
[29] = "S",
[30] = "T",
[31] = "U",
[32] = "V",
[33] = "W",
[34] = "X",
[35] = "Y",
[36] = "Z",
[37] = "PAD_0",
[38] = "PAD_1",
[39] = "PAD_2",
[40] = "PAD_3",
[41] = "PAD_4",
[42] = "PAD_5",
[43] = "PAD_6",
[44] = "PAD_7",
[45] = "PAD_8",
[46] = "PAD_9",
[47] = "PAD_DIVIDE",
[48] = "PAD_MULTIPLY",
[49] = "PAD_MINUS",
[50] = "PAD_PLUS",
[51] = "PAD_ENTER",
[52] = "PAD_DECIMAL",
[53] = "LBRACKET",
[54] = "RBRACKET",
[55] = "SEMICOLON",
[56] = "APOSTROPHE",
[57] = "BACKQUOTE",
[58] = "COMMA",
[59] = "PERIOD",
[60] = "SLASH",
[61] = "BACKSLASH",
[62] = "MINUS",
[63] = "EQUAL",
[64] = "ENTER",
[65] = "SPACE",
[66] = "BACKSPACE",
[67] = "TAB",
[68] = "CAPSLOCK",
[69] = "NUMLOCK",
[70] = "ESCAPE",
[71] = "SCROLLLOCK",
[72] = "INSERT",
[73] = "DELETE",
[74] = "HOME",
[75] = "END",
[76] = "PAGEUP",
[77] = "PAGEDOWN",
[78] = "BREAK",
[79] = "LSHIFT",
[80] = "RSHIFT",
[81] = "LALT",
[82] = "RALT",
[83] = "LCONTROL",
[84] = "RCONTROL",
[85] = "LWIN",
[86] = "RWIN",
[87] = "APP",
[88] = "UP",
[89] = "LEFT",
[90] = "DOWN",
[91] = "RIGHT",
[92] = "F1",
[93] = "F2",
[94] = "F3",
[95] = "F4",
[96] = "F5",
[97] = "F6",
[98] = "F7",
[99] = "F8",
[100] = "F9",
[101] = "F10",
[102] = "F11",
[103] = "F12",
//[104] = "CAPSLOCKTOGGLE",   These three screw up the binding process, probably wont bother working out how to fix it
//[105] = "NUMLOCKTOGGLE",
//[106] = "SCROLLLOCKTOGGLE",

//Xbox Controller Binds - These are untested as I don't own an xbox controller, so they might not work
[114] = "XBUTTON_A",
[115] = "XBUTTON_B",
[116] = "XBUTTON_X",
[117] = "XBUTTON_Y",
[118] = "XBUTTON_LEFT_SHOULDER",
[119] = "XBUTTON_RIGHT_SHOULDER",
[120] = "XBUTTON_BACK",
[121] = "XBUTTON_START",
[122] = "XBUTTON_STICK1",
[123] = "XBUTTON_STICK2",
[146] = "XBUTTON_UP",
[147] = "XBUTTON_RIGHT",
[148] = "XBUTTON_DOWN",
[149] = "XBUTTON_LEFT",
[150] = "XSTICK1_RIGHT",
[151] = "XSTICK1_LEFT",
[152] = "XSTICK1_DOWN",
[153] = "XSTICK1_UP",
[154] = "XBUTTON_LTRIGGER",
[155] = "XBUTTON_RTRIGGER",
[156] = "XSTICK2_RIGHT",
[157] = "XSTICK2_LEFT",
[158] = "XSTICK2_DOWN",
[159] = "XSTICK2_UP"
}

//Mouse Binds (Needs to be separate otherwise it doesn't work)
SmegHack.MouseBinds = {
[107] = "MOUSE_LEFT",
[108] = "MOUSE_RIGHT",
[109] = "MOUSE_MIDDLE",
[110] = "MOUSE_4",
[111] = "MOUSE_5",
[112] = "MOUSE_WHEEL_UP",
[113] = "MOUSE_WHEEL_DOWN"
}

//Aimbot
function Aimbot( FinAngle )
	if SmegHack.Options["Aimbot_SmoothAim"] then
		SmoothAngles( FinAngle, SmegHack.Options["Aimbot_SmoothAim_Value"] )
	else
		LocalPlayer():SetEyeAngles(FinAngle)
	end
end

function SmoothAngles( FinAngle, SmoothValue )
	local SmoothValue = 10-(10*(SmoothValue/1000))
	local CloseToAngle = false
	local SmoothDirectionX = 1
	local SmoothDirectionY = 1
	local CurAngle = LocalPlayer():EyeAngles()
	if FinAngle.x > 89 then FinAngle.x = FinAngle.x - 360 end
	if CurAngle == FinAngle then
		SmoothDirectionX = 1
	elseif CurAngle.y < 0 && FinAngle.y < 0 then
		CloseToAngle = true
		if CurAngle.y > FinAngle.y then
			SmoothDirectionX = 2
		elseif CurAngle.y < FinAngle.y then
			SmoothDirectionX = 3
		end
	elseif CurAngle.y >= 0 && FinAngle.y >= 0 then
		CloseToAngle = true
		if CurAngle.y > FinAngle.y then
			SmoothDirectionX = 2
		elseif CurAngle.y < FinAngle.y then
			SmoothDirectionX = 3
		end
	elseif CurAngle.y >= 0 && FinAngle.y < 0 then
		local FlipAngle = CurAngle-(Angle(0,180,0))
		if FlipAngle.y > FinAngle.y then
			SmoothDirectionX = 3
		elseif FlipAngle.y < FinAngle.y then
			SmoothDirectionX = 2
		end
	elseif CurAngle.y < 0 && FinAngle.y >= 0 then
		local FlipAngle = CurAngle+(Angle(0,180,0))
		if FlipAngle.y < FinAngle.y then
			SmoothDirectionX = 2	
		elseif FlipAngle.y > FinAngle.y then
			SmoothDirectionX = 3
		end
	end
	if FinAngle.x < CurAngle.x then
		SmoothDirectionY = 2
	elseif FinAngle.x > CurAngle.x then
		SmoothDirectionY = 3
	end
	local X, Y = false, false
	if SmoothDirectionX == 2 then
		if CurAngle.y-SmoothValue < FinAngle.y && CloseToAngle then
			LocalPlayer():SetEyeAngles(Angle(CurAngle.x,FinAngle.y,CurAngle.z))
			Y = true
		else
			LocalPlayer():SetEyeAngles(Angle(CurAngle.x,CurAngle.y-SmoothValue,CurAngle.z))
		end
	elseif SmoothDirectionX == 3 then
		if CurAngle.y+SmoothValue > FinAngle.y && CloseToAngle then
			LocalPlayer():SetEyeAngles(Angle(CurAngle.x,FinAngle.y,CurAngle.z))
			Y = true
		else
			LocalPlayer():SetEyeAngles(Angle(CurAngle.x,CurAngle.y+SmoothValue,CurAngle.z))
		end
	end
	if SmoothDirectionY == 2 then
		//up
		if CurAngle.x-SmoothValue < FinAngle.x then
			LocalPlayer():SetEyeAngles(Angle(FinAngle.x,LocalPlayer():EyeAngles().y,LocalPlayer():EyeAngles().z))
			X = true
		else
			LocalPlayer():SetEyeAngles(Angle(CurAngle.x-SmoothValue,LocalPlayer():EyeAngles().y,LocalPlayer():EyeAngles().z))
		end
	elseif SmoothDirectionY == 3 then
		//down
		if CurAngle.x+SmoothValue > FinAngle.x then
			LocalPlayer():SetEyeAngles(Angle(FinAngle.x,LocalPlayer():EyeAngles().y,LocalPlayer():EyeAngles().z))
			X = true
		else
			LocalPlayer():SetEyeAngles(Angle(CurAngle.x+SmoothValue,LocalPlayer():EyeAngles().y,LocalPlayer():EyeAngles().z))
		end
	end
	if SmegHack.Options["Aimbot_AutoShoot"] && X && Y then
		LocalPlayer():ConCommand("+attack")
		timer.Simple( 0.1, function() LocalPlayer():ConCommand("-attack") end )
	end
end

//ESP Functions
function ESPGetPos( Ent )
	if Ent:IsValid() then
		local Points = {
			Vector( Ent:OBBMaxs().x, Ent:OBBMaxs().y, Ent:OBBMaxs().z ),
			Vector( Ent:OBBMaxs().x, Ent:OBBMaxs().y, Ent:OBBMins().z ),
			Vector( Ent:OBBMaxs().x, Ent:OBBMins().y, Ent:OBBMins().z ),
			Vector( Ent:OBBMaxs().x, Ent:OBBMins().y, Ent:OBBMaxs().z ),
			Vector( Ent:OBBMins().x, Ent:OBBMins().y, Ent:OBBMins().z ),
			Vector( Ent:OBBMins().x, Ent:OBBMins().y, Ent:OBBMaxs().z ),
			Vector( Ent:OBBMins().x, Ent:OBBMaxs().y, Ent:OBBMins().z ),
			Vector( Ent:OBBMins().x, Ent:OBBMaxs().y, Ent:OBBMaxs().z )
		}
		local MaxX, MaxY, MinX, MinY
		local V1, V2, V3, V4, V5, V6, V7, V8
		for k, v in pairs( Points ) do
			local ScreenPos = Ent:LocalToWorld( v ):ToScreen()
			if MaxX != nil then
				MaxX, MaxY, MinX, MinY = math.max( MaxX, ScreenPos.x ), math.max( MaxY, ScreenPos.y), math.min( MinX, ScreenPos.x ), math.min( MinY, ScreenPos.y)
			else
				MaxX, MaxY, MinX, MinY = ScreenPos.x, ScreenPos.y, ScreenPos.x, ScreenPos.y
			end

			if V1 == nil then
				V1 = ScreenPos
			elseif V2 == nil then
				V2 = ScreenPos
			elseif V3 == nil then
				V3 = ScreenPos
			elseif V4 == nil then
				V4 = ScreenPos
			elseif V5 == nil then
				V5 = ScreenPos
			elseif V6 == nil then
				V6 = ScreenPos
			elseif V7 == nil then
				V7 = ScreenPos
			elseif V8 == nil then
				V8 = ScreenPos
			end
		end
		return MaxX, MaxY, MinX, MinY, V1, V2, V3, V4, V5, V6, V7, V8
	end
end

//Menu Items
function AddMenuTab( Parent, Text, Tab, PosX, PosY, TabID )
	local AddMenuTab = vgui.Create( "DButton", Parent )
	AddMenuTab:SetText( Text )
	AddMenuTab:SetTextColor( Color(255,255,255) )
	AddMenuTab:SetPos( PosX, PosY )
	function AddMenuTab:Paint() end
	AddMenuTab.DoClick = function()
		ChangeTab( Tab, TabID )
	end
	if TabID == 12 then
		AddMenuTab:SetSize( 48, 30 )
	else
		AddMenuTab:SetSize( 49, 30 )
	end
end

function AddLabel( Parent, Text, PosX, PosY, CloseOn )
	local AddLabel = vgui.Create("DLabel", Parent)
	AddLabel:SetText( Text )
	AddLabel:SetPos( PosX, PosY )
	AddLabel:SetColor(Color(255,255,255,255))
	AddLabel:SizeToContents()
	if CloseOn != nil then
		AddLabel.Think = function()
			if CloseOn == "Admins" then
				if AdminsListBool then
					AddLabel:Remove()
				end
			elseif CloseOn == "Spectators" then
				if SpecsListBool then
					AddLabel:Remove()
				end
			end
		end
	end
	return AddLabel:GetSize()
end

function AddMainMenuButton( Parent, Text, PosX, PosY, DoClick )
	local AddMainMenuButton = vgui.Create( "DButton", Parent )
	AddMainMenuButton:SetText( Text )
	AddMainMenuButton:SetTextColor( Color(255,255,255) )
	AddMainMenuButton:SetSize( 100, 30 )
	AddMainMenuButton:SetPos( PosX, PosY )
	function AddMainMenuButton:Paint( w, h )
		draw.RoundedBox( 0, 0, 0, w, h, Color(150,150,150,255) )
		
		surface.SetDrawColor( Color(0,0,0,255) )
		surface.DrawOutlinedRect( 0, 0, w, h )
	end
	AddMainMenuButton.DoClick = DoClick
end

function AddGenericButton( Parent, Text, SizeX, SizeY, PosX, PosY, DoClick )
	local AddGenericButton = vgui.Create( "DButton", Parent )
	AddGenericButton:SetText( Text )
	AddGenericButton:SetTextColor( Color(255,255,255) )
	AddGenericButton:SetSize( SizeX, SizeY )
	AddGenericButton:SetPos( PosX, PosY )
	function AddGenericButton:Paint( w, h )
		draw.RoundedBox( 0, 0, 0, w, h, Color(150,150,150,255) )
		
		surface.SetDrawColor( Color(0,0,0,255) )
		surface.DrawOutlinedRect( 0, 0, w, h )
	end
	AddGenericButton.DoClick = DoClick
end

function AddKeyBind( Parent, PosX, PosY, Var )
	local KeyBind = vgui.Create( "DButton", Parent )
	if SmegHack.Options["Aimbot_AimOnKey_Key"] >= 107 && SmegHack.Options["Aimbot_AimOnKey_Key"] <= 113 then
		KeyBind:SetText( SmegHack.MouseBinds[SmegHack.Options["Aimbot_AimOnKey_Key"]])
	else
		KeyBind:SetText( SmegHack.KeyBinds[SmegHack.Options["Aimbot_AimOnKey_Key"]])
	end
	KeyBind:SetTextColor( Color(255,255,255,255) )
	KeyBind:SetSize( 100, 15 )
	KeyBind:SetPos( PosX, PosY )
	KeyBind:SetTooltip( "Click button then press any key to change bind" )
	KeyBind.Paint = function()
		draw.RoundedBox( 0, 1, 1, 99, 14, Color(150,150,150,255) )
		surface.SetDrawColor( Color(0,0,0) )
		surface.DrawOutlinedRect( 0, 0, 100, 15 )
	end
	KeyBind.DoClick = function()
		KeyBind:SetText("...")
		local NoClickMenu = vgui.Create( "DFrame" )
		NoClickMenu:SetTitle("")
		NoClickMenu:ShowCloseButton(false)
		NoClickMenu:SetDraggable(false)
		NoClickMenu:SetSize(ScrW(), ScrH())
		NoClickMenu:Center()
		NoClickMenu:MakePopup()
		function NoClickMenu:Paint( w, h )
			draw.RoundedBox( 0, 0, 0, w, h, Color(0,0,0,150) )
			draw.SimpleTextOutlined( "Press Any Key", "Menu_Title", w/2, h/2, Color(255,255,255),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER,1,Color(0,0,0))
			draw.SimpleTextOutlined( "Press ESC to cancel", "Menu_Title", w/2, h/2+30, Color(255,255,255),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER,1,Color(0,0,0))
			draw.SimpleTextOutlined( "Hold ESC to clear bind", "Menu_Title", w/2, h/2+60, Color(255,255,255),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER,1,Color(0,0,0))
		end
		local ESCStuff, ESCNum = false, 0
		KeyBind.Think = function()
			if !ESCStuff then
				for i = 107, 113 do
					if input.IsMouseDown(i) then
						SmegHack.Options[Var] = i
						KeyBind:SetText(SmegHack.MouseBinds[i])
						NoClickMenu:Close()
						KeyBind.Think = nil
					end
				end
				for i = 0, 159 do
					if input.IsKeyDown(i) then
						if i == 70 then
							LocalPlayer():ConCommand("cancelselect")
							ESCStuff = true
						else
							SmegHack.Options[Var] = i
							KeyBind:SetText(SmegHack.KeyBinds[i])
							NoClickMenu:Close()
							KeyBind.Think = nil
						end
					end
				end
			else
				if input.IsKeyDown(70) then
					if ESCNum >= 200 then
						SmegHack.Options[Var] = 0
						KeyBind:SetText(SmegHack.KeyBinds[0])
						NoClickMenu:Close()
						KeyBind.Think = nil
					else ESCNum = ESCNum + 1 end
				else
					KeyBind:SetText(SmegHack.KeyBinds[SmegHack.Options[Var]])
					NoClickMenu:Close()
					KeyBind.Think = nil
				end
			end
		end
	end
end

function AddCheckBox( Parent, Text, PosX, PosY, ToolTip, Var, ExtraFunc )
	local AddCheckBox = vgui.Create( "DCheckBoxLabel", Parent )
	AddCheckBox:SetText( Text )
	AddCheckBox:SetPos( PosX, PosY )
	AddCheckBox:SetTooltip( ToolTip )
	AddCheckBox:SetTextColor( Color(255,255,255,255) )
	AddCheckBox:SizeToContents()
	AddCheckBox:SetChecked( SmegHack.Options[Var] )
	AddCheckBox.OnChange = function()
		SmegHack.Options[Var] = AddCheckBox:GetChecked()
		if ExtraFunc != nil then
			local IsChecked = AddCheckBox:GetChecked()
			ExtraFunc()
		end
	end
end

function AddBoneButton( Parent, PosX, PosY, Bone )
	local AddBoneButton = vgui.Create( "DButton", Parent )
	if table.HasValue( SmegHack.BoneOrder, Bone ) then
		for k, v in pairs(SmegHack.BoneOrder) do
			if v == Bone then
				AddBoneButton:SetText(tostring(k))
			end
		end
	else
		AddBoneButton:SetText("-")
	end
	AddBoneButton:SetTextColor( Color(255,255,255,255) )
	AddBoneButton:SetSize( 16, 16 )
	AddBoneButton:SetPos( PosX-8, PosY-8 )
	AddBoneButton:SetTooltip( "Select bones in the order you want to aim at them" )
	function AddBoneButton:Paint( w, h )
		draw.RoundedBox( 0, 0, 0, w, h, Color(150,150,150,255) )
		
		surface.SetDrawColor( Color(0,0,0,255) )
		surface.DrawOutlinedRect( 0, 0, w, h )
	end
	AddBoneButton.DoRightClick = function()
		local BoneNum
		if table.HasValue( SmegHack.BoneOrder, Bone ) then
			for k, v in pairs( SmegHack.BoneOrder ) do
				if v == Bone then BoneNum = k end
			end
		else BoneNum = 0 end

		if BoneNum == 0 then
			table.insert( SmegHack.BoneOrder, Bone )
		elseif BoneNum == 1 then
			table.remove( SmegHack.BoneOrder, BoneNum )
		else
			table.remove( SmegHack.BoneOrder, BoneNum )
			table.insert( SmegHack.BoneOrder, BoneNum-1, Bone )
		end
		UpdateBoneThink = true
	end
	AddBoneButton.DoClick = function()
		local BoneNum
		if table.HasValue( SmegHack.BoneOrder, Bone ) then
			for k, v in pairs( SmegHack.BoneOrder ) do
				if v == Bone then BoneNum = k end
			end
		else BoneNum = 0 end

		if BoneNum == 0 then
			table.insert( SmegHack.BoneOrder, 1, Bone )
		elseif BoneNum == 21 then
			table.remove( SmegHack.BoneOrder, BoneNum )
		else
			if BoneNum != table.Count( SmegHack.BoneOrder ) then
				table.remove( SmegHack.BoneOrder, BoneNum )
				table.insert( SmegHack.BoneOrder, BoneNum+1, Bone )
			else
				table.remove( SmegHack.BoneOrder, BoneNum )
			end
		end
		UpdateBoneThink = true
	end
	AddBoneButton.Think = function()
		if UpdateBoneThink then
			if UpdateBoneThinkNum != 21 then
				local BoneNum
				if table.HasValue( SmegHack.BoneOrder, Bone ) then
					for k, v in pairs( SmegHack.BoneOrder ) do
						if v == Bone then BoneNum = k end
					end
				else BoneNum = 0 end
				if BoneNum != 0 then
					AddBoneButton:SetText(tostring(BoneNum))
				else
					AddBoneButton:SetText("-")
				end
				UpdateBoneThinkNum = UpdateBoneThinkNum+1
			end
			if UpdateBoneThinkNum == 21 then
				UpdateBoneThinkNum = 0
				UpdateBoneThink = false
			end
		end
	end
end

function AddComboBox( Parent, PosX, PosY, SizeX, SizeY, Var, ChoiceTable, ExtraFunc )
	local AddComboBox = vgui.Create( "DComboBox", Parent )
	AddComboBox:SetPos( PosX, PosY )
	AddComboBox:SetSize( SizeX, SizeY )
	AddComboBox:SetValue(SmegHack.Options[Var])
	for k, v in pairs( ChoiceTable ) do
		AddComboBox:AddChoice(v)
	end
	AddComboBox.OnSelect = function(Selected)
		SmegHack.Options[Var] = Selected:GetValue()
		if ExtraFunc != nil then
			ExtraFunc()
		end
	end
end

function AddSlider( Parent, Var, PosX, PosY, Min, Max, Decimals )
	local AddSlider = vgui.Create( "Slider", Parent )
	AddSlider:SetSize( 150, 15 )
	AddSlider:SetPos( PosX, PosY )
	AddSlider:SetMin( Min )
	AddSlider:SetMax( Max )
	AddSlider:SetDecimals( Decimals )
	AddSlider:SetValue( SmegHack.Options[Var] )
	AddSlider.OnValueChanged = function( Panel, Value )
		SmegHack.Options[Var] = math.Round( Value, Decimals )
	end
	AddSlider.Paint = function()
		draw.RoundedBox( 0, 0, 0, 135, 15, Color(255,255,255,255) )
		surface.SetDrawColor(Color(0,0,0,255))
		surface.DrawOutlinedRect( 0, 0, 135, 15 )
		surface.DrawLine( 105, 0, 105, 15 )
	end
end

function AddTextEntry( Parent, Width, PosX, PosY, DefaultText, Var, Save )
	local AddTextEntry = vgui.Create("DTextEntry", Parent)
	AddTextEntry:SetWide(Width)
	AddTextEntry:SetPos(PosX,PosY)
	if Save != nil && SmegHack.TextEntries[Var] != nil then
		AddTextEntry:SetText(SmegHack.TextEntries[Var])
	else
		AddTextEntry:SetText(DefaultText)
	end
	AddTextEntry.OnGetFocus = function()
		if AddTextEntry:GetText() == DefaultText then
			AddTextEntry:SetText("")
		end
	end
	AddTextEntry.OnLoseFocus = function()
		if AddTextEntry:GetText() == "" then
			AddTextEntry:SetText(DefaultText)
			SmegHack.TextEntries[Var] = nil
		else
			SmegHack.TextEntries[Var] = AddTextEntry:GetText()
		end
	end
end

function AddDisplayBox( Title, Mode )
	local DisplayBox = vgui.Create( "DFrame" )
	DisplayBox:SetTitle("")
	DisplayBox:ShowCloseButton(false)
	DisplayBox:SetDraggable(true)
	DisplayBox:SetSize( 150, 50 )
	function DisplayBox:Paint( w, h )
		draw.RoundedBox( 0, 0, 0, w, 24, Color(0,0,0,255) )
		draw.RoundedBox( 0, 0, 0, w, h, Color(0,10,20,245) )
		draw.SimpleText( Title, "Menu_Title", w/2, 13, Color(0,100,200), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end

	if Mode == 1 then
		DisplayBox:SetPos( SmegHack.Options["Misc_AdminBox_PosX"], SmegHack.Options["Misc_AdminBox_PosY"] )
		local AdminTable = {"Moo"}
		local Wait = false
		AddHook( "AdminDisplayBox", "Think", RandomString(), function()
			if !SmegHack.Options["Misc_AdminBox"] then
				DisplayBox:Close()
				RemoveHook("AdminDisplayBox")
			end
			local PoX, PoY = DisplayBox:GetPos()
			if  SmegHack.Options["Misc_AdminBox_PosX"] != PoX ||  SmegHack.Options["Misc_AdminBox_PosY"] != PoY then
				SmegHack.Options["Misc_AdminBox_PosX"], SmegHack.Options["Misc_AdminBox_PosY"] = PoX, PoY
			end
			local TempAdminTable = {}
			for k, v in pairs(player.GetAll()) do
				if v:IsAdmin() || v:IsSuperAdmin() then
					table.insert( TempAdminTable, v:Nick() )
				end
			end
			if table.concat(TempAdminTable) != table.concat(AdminTable) then
				if !AdminsListBool && !Wait then
					AdminsListBool = true
					timer.Simple( 0.1, function() AdminsListBool = false Wait = true end )
				elseif Wait then
					AdminTable = table.Copy(TempAdminTable)
					local TextWidth, Tall = 140, 30
					local OldWidth, OldTall = DisplayBox:GetSize()
					if AdminTable[1] != nil then
						for k, v in pairs(AdminTable) do
							local TempTextWidth = AddLabel( DisplayBox, v, 5, Tall, "Admins" )
							if TempTextWidth > TextWidth then TextWidth = TempTextWidth end
							Tall = Tall + 15
						end
						DisplayBox:SetSize( TextWidth + 10, Tall+5 )
					else
						AddLabel( DisplayBox, "No Admins Online", 5, Tall, "Admins" )
						DisplayBox:SetSize( 150, 50 )
					end
					local DifferenceX, DifferenceY = OldWidth - TextWidth+10, OldTall - Tall+5
					local Var = "AdminBox" //This used to be a function but it screwed up, so I just added it to the hook and I couldn't be bothered making it look normal incase you are wondering what the point of this is
					if DifferenceX < 0 then
						DifferenceX = DifferenceX * -1
						RightPos = SmegHack.Options["Misc_"..Var.."_PosX"] - DifferenceX
					else
						RightPos = SmegHack.Options["Misc_"..Var.."_PosX"] + DifferenceX
					end
					if DifferenceY < 0 then
						DifferenceY = DifferenceY * -1
						BottomPos = SmegHack.Options["Misc_"..Var.."_PosY"] - DifferenceY
					else
						BottomPos = SmegHack.Options["Misc_"..Var.."_PosY"] + DifferenceY
					end

					if SmegHack.Options["Misc_"..Var.."_Mode"] == "Auto" then
						local PosX, PosY
						if SmegHack.Options["Misc_"..Var.."_PosX"] > ScrW()/2 then PosX = RightPos else PosX = SmegHack.Options["Misc_"..Var.."_PosX"] end
						if SmegHack.Options["Misc_"..Var.."_PosY"] > ScrH()/2 then PosY = BottomPos else PosY = SmegHack.Options["Misc_"..Var.."_PosY"] end
						DisplayBox:SetPos( PosX, PosY )
					elseif SmegHack.Options["Misc_"..Var.."_Mode"] == "Top Right" then
						DisplayBox:SetPos( RightPos, SmegHack.Options["Misc_"..Var.."_PosY"] )
					elseif SmegHack.Options["Misc_"..Var.."_Mode"] == "Bottom Left" then
						DisplayBox:SetPos( SmegHack.Options["Misc_"..Var.."_PosX"], BottomPos )
					elseif SmegHack.Options["Misc_"..Var.."_Mode"] == "Bottom Right" then
						DisplayBox:SetPos( RightPos, BottomPos )
					end
					Wait = false
				end
			end
		end)
	elseif Mode == 2 then
		DisplayBox:SetPos( SmegHack.Options["Misc_SpectatorsBox_PosX"], SmegHack.Options["Misc_SpectatorsBox_PosY"] )
		local SpecsTable = {"Moo"}
		local Wait = false
		AddHook( "SpecDisplayBox", "Think", RandomString(), function()
			if !SmegHack.Options["Misc_SpectatorsBox"] then
				DisplayBox:Close()
				RemoveHook("SpecDisplayBox")
			end
			local PoX, PoY = DisplayBox:GetPos()
			if  SmegHack.Options["Misc_SpectatorsBox_PosX"] != PoX ||  SmegHack.Options["Misc_SpectatorsBox_PosY"] != PoY then
				SmegHack.Options["Misc_SpectatorsBox_PosX"], SmegHack.Options["Misc_SpectatorsBox_PosY"] = PoX, PoY
			end
			local TempSpecsTable = {}
			for k, v in pairs(player.GetAll()) do
				if v:GetObserverTarget() == LocalPlayer() then
					table.insert( TempSpecsTable, v:Nick() )
				end
			end
			if table.concat(TempSpecsTable) != table.concat(SpecsTable) then
				if !SpecsListBool && !Wait then
					SpecsListBool = true
					timer.Simple( 0.1, function() SpecsListBool = false Wait = true end )
				elseif Wait then
					SpecsTable = table.Copy(TempSpecsTable)
					local TextWidth, Tall = 140, 30
					local OldWidth, OldTall = DisplayBox:GetSize()
					if SpecsTable[1] != nil then
						for k, v in pairs(SpecsTable) do
							local TempTextWidth = AddLabel( DisplayBox, v, 5, Tall, "Spectators" )
							if TempTextWidth > TextWidth then TextWidth = TempTextWidth end
							Tall = Tall + 15
						end
						DisplayBox:SetSize( TextWidth + 10, Tall+5 )
					else
						AddLabel( DisplayBox, "No Spectators", 5, Tall, "Spectators" )
						DisplayBox:SetSize( 150, 50 )
					end
					local DifferenceX, DifferenceY = OldWidth - TextWidth+10, OldTall - Tall+5
					local Var = "SpectatorsBox"
					if DifferenceX < 0 then
						DifferenceX = DifferenceX * -1
						RightPos = SmegHack.Options["Misc_"..Var.."_PosX"] - DifferenceX
					else
						RightPos = SmegHack.Options["Misc_"..Var.."_PosX"] + DifferenceX
					end
					if DifferenceY < 0 then
						DifferenceY = DifferenceY * -1
						BottomPos = SmegHack.Options["Misc_"..Var.."_PosY"] - DifferenceY
					else
						BottomPos = SmegHack.Options["Misc_"..Var.."_PosY"] + DifferenceY
					end

					if SmegHack.Options["Misc_"..Var.."_Mode"] == "Auto" then
						local PosX, PosY
						if SmegHack.Options["Misc_"..Var.."_PosX"] > ScrW()/2 then PosX = RightPos else PosX = SmegHack.Options["Misc_"..Var.."_PosX"] end
						if SmegHack.Options["Misc_"..Var.."_PosY"] > ScrH()/2 then PosY = BottomPos else PosY = SmegHack.Options["Misc_"..Var.."_PosY"] end
						DisplayBox:SetPos( PosX, PosY )
					elseif SmegHack.Options["Misc_"..Var.."_Mode"] == "Top Right" then
						DisplayBox:SetPos( RightPos, SmegHack.Options["Misc_"..Var.."_PosY"] )
					elseif SmegHack.Options["Misc_"..Var.."_Mode"] == "Bottom Left" then
						DisplayBox:SetPos( SmegHack.Options["Misc_"..Var.."_PosX"], BottomPos )
					elseif SmegHack.Options["Misc_"..Var.."_Mode"] == "Bottom Right" then
						DisplayBox:SetPos( RightPos, BottomPos )
					end
					Wait = false
				end
			end
		end)
	end
end

function AddSavePage( Parent, Mode )
	local ManageSaves = vgui.Create("DListView", Parent)
	ManageSaves:SetPos( 25, 55 )
	ManageSaves:SetSize( 550, 200 )
	ManageSaves:SetMultiSelect(false)
	ManageSaves:AddColumn("Title")
	ManageSaves:AddColumn("Date Created")
	function RefreshSaveList(Location, Parent)
		Parent:Clear()
		if !file.Exists( "sh/"..Location, "DATA" ) then file.CreateDir( "sh/"..Location ) end
		if file.Exists( "sh/"..Location, "DATA" ) then
			local Files, Dirs = file.Find( "sh/"..Location.."/*", "DATA" )
			for k, v in pairs( Files ) do
				local Title = string.StripExtension(v)
				local SaveTable = string.Explode( "|", file.Read( "sh/"..Location.."/"..v, "DATA" ) )
				local Date = SaveTable[1]
				local Time = SaveTable[2]
				if Time != nil && Date != nil then
					Parent:AddLine(Title, Date.."|"..Time)
				else
					Parent:AddLine(Title, "This save has been corrupted")
				end
			end
		end
	end
	RefreshSaveList(Mode, ManageSaves)
	
	AddTextEntry( Parent, 275, 25, 275, "Input Save Title", Mode )
	AddGenericButton( Parent, "Refresh Listings", 100, 20, 475, 275, function () RefreshSaveList(Mode, ManageSaves) end )
	AddGenericButton( Parent, "Delete", 51, 20, 419, 275, function()
		if ManageSaves:GetSelectedLine() != nil then
			local SaveTitle = ManageSaves:GetLine(ManageSaves:GetSelectedLine()):GetValue(1)
			if file.Exists( "sh/"..Mode.."/"..SaveTitle..".txt", "DATA" ) then file.Delete( "sh/"..Mode.."/"..SaveTitle..".txt" ) end
			RefreshSaveList(Mode, ManageSaves)
		end
	end)
	AddGenericButton( Parent, "Load", 52, 20, 362, 275, function()
		if ManageSaves:GetSelectedLine() != nil then
			local SaveTitle = ManageSaves:GetLine(ManageSaves:GetSelectedLine()):GetValue(1)
			if file.Exists( "sh/"..Mode.."/"..SaveTitle..".txt", "DATA" ) then
				local SaveFile = file.Read( "sh/"..Mode.."/"..SaveTitle..".txt" )
				local SaveFileTable = string.Explode( "|", SaveFile )
				for k, v in pairs( SaveFileTable ) do
					if k != 1 && k != 2 then
						if ManageSaves:GetLine(ManageSaves:GetSelectedLine()):GetValue(2) != "This save has been corrupted" then
							if Mode == "Friends" then
								table.insert( SmegHack.FriendsList, v )
							elseif Mode == "Configs" then
								if string.Left( v, 1 ) == "{" then
									SmegHack.BoneOrder = util.JSONToTable( v )
								else
									local CommandTable = string.Explode( " ", v )
									if CommandTable[3] == "true" || CommandTable[3] == "false" then
										SmegHack.Options[CommandTable[1]] = tobool(CommandTable[3])
									elseif isnumber(tonumber(CommandTable[3])) then
										SmegHack.Options[CommandTable[1]] = tonumber(CommandTable[3])
									else
										SmegHack.Options[CommandTable[1]] = tostring(CommandTable[3])
									end
								end
							elseif Mode == "Entities" then
								table.insert( SmegHack.EntityESP, v )
							end
						end
					end
				end
				if ManageSaves:GetLine(ManageSaves:GetSelectedLine()):GetValue(2) != "This save has been corrupted" then
					if Mode == "Friends" then
						RefreshFriendsList()
					elseif Mode == "Configs" then
						//RefreshSaveList( Mode, ManageSaves )
						CloseMenu()
						ReloadSmegHack(false)
					elseif Mode == "Entities" then
						RefreshEntsList()
					end
				end
			end
		end
	end)
	AddGenericButton( Parent, "Save", 52, 20, 305, 275, function()
		if SmegHack.TextEntries[Mode] != nil then
			local Files, Dirs = file.Find( "sh/"..Mode.."/*", "DATA" )
			for k, v in pairs( Files ) do
				local Title = string.StripExtension(v)
				if Title == SmegHack.TextEntries[Mode] then return end
			end
			if !file.Exists( "sh/"..Mode, "DATA" ) then file.CreateDir( "sh/"..Mode ) end
			if file.Exists( "sh/"..Mode, "DATA" ) then
				if tonumber( os.date("%H"), 10 ) < 12 then
					local SaveText = os.date("%d/%m/%y | %I:%M AM")
					if Mode == "Friends" then
						for k, v in pairs( SmegHack.FriendsList ) do
							SaveText = SaveText.."|"..v
						end
						file.Write( "sh/"..Mode.."/"..SmegHack.TextEntries[Mode]..".txt", SaveText)
					elseif Mode == "Configs" then
						for k, v in pairs( SmegHack.Options ) do
							SaveText = SaveText.."|"..k.." = "..tostring(v)
						end
						SaveText = SaveText.."|"..util.TableToJSON( SmegHack.BoneOrder )
						file.Write( "sh/"..Mode.."/"..SmegHack.TextEntries[Mode]..".txt", SaveText)
					elseif Mode == "Entities" then
						for k, v in pairs( SmegHack.EntityESP ) do
							SaveText = SaveText.."|"..v
						end
						file.Write( "sh/"..Mode.."/"..SmegHack.TextEntries[Mode]..".txt", SaveText)
					end
				else
					local SaveText = os.date("%d/%m/%y | %I:%M PM")
					if Mode == "Friends" then
						for k, v in pairs( SmegHack.FriendsList ) do
							SaveText = SaveText.."|"..v
						end
						file.Write( "sh/"..Mode.."/"..SmegHack.TextEntries[Mode]..".txt", SaveText)
					elseif Mode == "Configs" then
						for k, v in pairs( SmegHack.Options ) do
							SaveText = SaveText.."|"..k.." = "..tostring(v)
						end
						SaveText = SaveText.."|"..util.TableToJSON( SmegHack.BoneOrder )
						file.Write( "sh/"..Mode.."/"..SmegHack.TextEntries[Mode]..".txt", SaveText)
					elseif Mode == "Entities" then
						for k, v in pairs( SmegHack.EntityESP ) do
							SaveText = SaveText.."|"..v
						end
						file.Write( "sh/"..Mode.."/"..SmegHack.TextEntries[Mode]..".txt", SaveText)
					end
				end
			end
			RefreshSaveList(Mode, ManageSaves)
		end
	end)
	AddGenericButton( Parent, "Rename", 52, 20, 305, 300, function()
		if ManageSaves:GetSelectedLine() != nil && SmegHack.TextEntries[Mode] != nil then
			local SaveTitle = ManageSaves:GetLine(ManageSaves:GetSelectedLine()):GetValue(1)
			if file.Exists( "sh/"..Mode.."/"..SaveTitle..".txt", "DATA" ) then
				local Files, Dirs = file.Find( "sh/"..Mode.."/*", "DATA" )
				for k, v in pairs( Files ) do
					local Title = string.StripExtension(v)
					if Title == SmegHack.TextEntries[Mode] then return end
				end
				local SaveFileText = file.Read( "sh/"..Mode.."/"..SaveTitle..".txt", "DATA" )
				file.Delete( "sh/"..Mode.."/"..SaveTitle..".txt" )
				file.Write( "sh/"..Mode.."/"..SmegHack.TextEntries[Mode]..".txt", SaveFileText )
				RefreshSaveList(Mode, ManageSaves)
			end
		end
	end)
end

function SmegHackMenu()
	if MenuOpen then
		CloseMenu()
		return
	end
	MenuOpen = true
	//Menu Frame
	local Menu = vgui.Create("DFrame")
	Menu:SetTitle("")
	Menu:ShowCloseButton(false)
	Menu:SetDraggable(true)
	Menu:SetSize(600, 400)
	Menu:Center()
	Menu:MakePopup()
	function Menu:Paint( w, h )
		//Title Bar
		draw.RoundedBox( 0, 0, 0, w, 24, Color(0,0,0,255) )
		draw.RoundedBox( 0, 0, 0, w, h, Color(0,10,20,245) )
		
		draw.SimpleText( "Smeg Hack", "Menu_Title", w/2, 11, Color(0,100,200), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
		draw.SimpleText( "FPS: "..FPSValue, "ESP_Font_Main", 5, 2, Color(0,255,0),TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM )
		draw.SimpleText( "Ping: "..LocalPlayer():Ping(), "ESP_Font_Main", 65, 2, Color(0,255,0), TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM )
		
		//Menu Tabs
		draw.RoundedBox( 0, 0, 25, w, 30, Color(128,128,128,255) )
		surface.SetDrawColor( Color(0,0,0) )
		surface.DrawLine( 0, 24, w, 24 )
		surface.DrawLine( 0, 55, w, 55 )
		surface.DrawLine( 0, 24, 0, 55 )
		surface.DrawLine( 50, 24, 50, 55 )
		surface.DrawLine( 100, 24, 100, 55 )
		surface.DrawLine( 150, 24, 150, 55 )
		surface.DrawLine( 200, 24, 200, 55 )
		surface.DrawLine( 250, 24, 250, 55 )
		surface.DrawLine( 300, 24, 300, 55 )
		surface.DrawLine( 350, 24, 350, 55 )
		surface.DrawLine( 400, 24, 400, 55 )
		surface.DrawLine( 450, 24, 450, 55 )
		surface.DrawLine( 500, 24, 500, 55 )
		surface.DrawLine( 550, 24, 550, 55 )
		surface.DrawLine( 599, 24, 599, 55 )
    end
	
	//Tab Frames
	local Main = vgui.Create("DPanel", Menu)
	Main:SetPos( 0 , 25 )
	Main:SetSize( Menu:GetWide(), Menu:GetTall()-25 )
	Main:SetVisible( false )
	function Main:Paint()
		draw.RoundedBox( 0, 1, 0, 49, 30, Color(0,0,255,255) )
	end
	
	local Aimbot = vgui.Create("DPanel", Menu)
	Aimbot:SetPos( 0 , 25 )
	Aimbot:SetSize( Menu:GetWide(), Menu:GetTall()-25 )
	Aimbot:SetVisible( false )
	function Aimbot:Paint()
		draw.RoundedBox( 0, 51, 0, 49, 30, Color(0,0,255,255) )

		surface.SetDrawColor( Color(255,255,255,255) )

		//Head
		surface.DrawCircle( 490, 75, 30, {255,255,255,255} )

		//Spine
		surface.DrawLine( 490, 105, 490, 255 )

		//Arms
		surface.DrawLine( 490, 180, 440, 130 )
		surface.DrawLine( 490, 180, 540, 130 )
		//Hands
		surface.DrawLine( 440, 130, 420, 130 )
		surface.DrawLine( 540, 130, 560, 130 )

		//Legs
		surface.DrawLine( 490, 255, 440, 305 )
		surface.DrawLine( 490, 255, 540, 305 )
		//Feet
		surface.DrawLine( 440, 305, 400, 305 )
		surface.DrawLine( 540, 305, 580, 305 )
	end
	
	local ESP = vgui.Create("DPanel", Menu)
	ESP:SetPos( 0 , 25 )
	ESP:SetSize( Menu:GetWide(), Menu:GetTall()-25 )
	ESP:SetVisible( false )
	function ESP:Paint()
		draw.RoundedBox( 0, 101, 0, 49, 30, Color(0,0,255,255) )
	end
	
	local Ents = vgui.Create("DPanel", Menu)
	Ents:SetPos( 0 , 25 )
	Ents:SetSize( Menu:GetWide(), Menu:GetTall()-25 )
	Ents:SetVisible( false )
	function Ents:Paint()
		draw.RoundedBox( 0, 151, 0, 49, 30, Color(0,0,255,255) )
	end
	
	local Misc = vgui.Create("DPanel", Menu)
	Misc:SetPos( 0 , 25 )
	Misc:SetSize( Menu:GetWide(), Menu:GetTall()-25 )
	Misc:SetVisible( false )
	function Misc:Paint()
		draw.RoundedBox( 0, 201, 0, 49, 30, Color(0,0,255,255) )
	end
	
	local Friends = vgui.Create("DPanel", Menu)
	Friends:SetPos( 0 , 25 )
	Friends:SetSize( Menu:GetWide(), Menu:GetTall()-25 )
	Friends:SetVisible( false )
	function Friends:Paint()
		draw.RoundedBox( 0, 251, 0, 49, 30, Color(0,0,255,255) )
		draw.SimpleText( "Friends                                                       Enemies", "ESP_Font_Main", 300, 43, Color(0,255,0), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end
	
	local Cams = vgui.Create("DPanel", Menu)
	Cams:SetPos( 0 , 25 )
	Cams:SetSize( Menu:GetWide(), Menu:GetTall()-25 )
	Cams:SetVisible( false )
	function Cams:Paint()
		draw.RoundedBox( 0, 301, 0, 49, 30, Color(0,0,255,255) )
	end
	
	local Bhop = vgui.Create("DPanel", Menu)
	Bhop:SetPos( 0 , 25 )
	Bhop:SetSize( Menu:GetWide(), Menu:GetTall()-25 )
	Bhop:SetVisible( false )
	function Bhop:Paint()
		draw.RoundedBox( 0, 351, 0, 49, 30, Color(0,0,255,255) )
	end
	
	local Spam = vgui.Create("DPanel", Menu)
	Spam:SetPos( 0 , 25 )
	Spam:SetSize( Menu:GetWide(), Menu:GetTall()-25 )
	Spam:SetVisible( false )
	function Spam:Paint()
		draw.RoundedBox( 0, 401, 0, 49, 30, Color(0,0,255,255) )
	end
	
	local Test10 = vgui.Create("DPanel", Menu)
	Test10:SetPos( 0 , 25 )
	Test10:SetSize( Menu:GetWide(), Menu:GetTall()-25 )
	Test10:SetVisible( false )
	function Test10:Paint()
		draw.RoundedBox( 0, 451, 0, 49, 30, Color(0,0,255,255) )
	end
	
	local Test11 = vgui.Create("DPanel", Menu)
	Test11:SetPos( 0 , 25 )
	Test11:SetSize( Menu:GetWide(), Menu:GetTall()-25 )
	Test11:SetVisible( false )
	function Test11:Paint()
		draw.RoundedBox( 0, 501, 0, 49, 30, Color(0,0,255,255) )
	end
	
	local Config = vgui.Create("DPanel", Menu)
	Config:SetPos( 0 , 25 )
	Config:SetSize( Menu:GetWide(), Menu:GetTall()-25 )
	Config:SetVisible( false )
	function Config:Paint()
		draw.RoundedBox( 0, 551, 0, 48, 30, Color(0,0,255,255) )
		draw.SimpleText( "Configuration save manager", "ESP_Font_Main", 300, 43, Color(0,255,0), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end
	
	local FriendSaves = vgui.Create("DPanel", Menu)
	FriendSaves:SetPos( 0 , 25 )
	FriendSaves:SetSize( Menu:GetWide(), Menu:GetTall()-25 )
	FriendSaves:SetVisible( false )
	function FriendSaves:Paint()
		draw.RoundedBox( 0, 251, 0, 49, 30, Color(0,0,255,255) )
		draw.SimpleText( "Friends list save manager", "ESP_Font_Main", 300, 43, Color(0,255,0), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end
	
	local EntitySaves = vgui.Create("DPanel", Menu)
	EntitySaves:SetPos( 0 , 25 )
	EntitySaves:SetSize( Menu:GetWide(), Menu:GetTall()-25 )
	EntitySaves:SetVisible( false )
	function EntitySaves:Paint()
		draw.RoundedBox( 0, 151, 0, 49, 30, Color(0,0,255,255) )
		draw.SimpleText( "Entity ESP save manager", "ESP_Font_Main", 300, 43, Color(0,255,0), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end

	local CustomCrosshair = vgui.Create("DPanel", Menu)
	CustomCrosshair:SetPos( 0 , 25 )
	CustomCrosshair:SetSize( Menu:GetWide(), Menu:GetTall()-25 )
	CustomCrosshair:SetVisible( false )
	function CustomCrosshair:Paint()
		draw.RoundedBox( 0, 101, 0, 49, 30, Color(0,0,255,255) )
		draw.SimpleText( "Custom Crosshair", "ESP_Font_Main", 300, 43, Color(0,255,0), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end
	
	//Close Button		
	local CloseButton = vgui.Create("DButton", Menu)
	CloseButton:SetSize(24, 24)
	CloseButton:SetPos(Menu:GetWide()-24, 0)
	CloseButton:SetText("X")
	CloseButton:SetColor(Color(255,255,255))
	function CloseButton:Paint( w, h )
		draw.RoundedBox( 0, 0, 0, w, h, Color(0,30,100,200) )
	end
	CloseButton.DoClick = function() CloseMenu() end
	
	//Panic Button
	local PanicButton = vgui.Create("DButton", Menu)
	PanicButton:SetSize(40, 24)
	PanicButton:SetPos(Menu:GetWide()-64, 0)
	if GetConVarNumber("SmegHack_Panic") == 1 then
		PanicButton:SetText("Enable")
		PanicButton:SetColor(Color(50,200,0,255))
	else
		PanicButton:SetText("Disable")
		PanicButton:SetColor(Color(255,0,0,255))
	end
	function PanicButton:Paint( w, h )
		draw.RoundedBox( 0, 0, 0, w, h, Color(150,150,150,255) )
	end
	PanicButton.DoClick = function()
		if GetConVarNumber("SmegHack_Panic") == 1 then
			RunConsoleCommand("SmegHack_Panic", 0)
			PanicButton:SetText("Disable")
			PanicButton:SetColor(Color(255,0,0,255))
		else
			RunConsoleCommand("SmegHack_Panic", 1)
			PanicButton:SetText("Enable")
			PanicButton:SetColor(Color(50,200,0,255))
		end
	end
		
	//Menu Tabs
	AddMenuTab( Menu, "Main", Main, 1, 25, 1 )
	AddMenuTab( Menu, "Aimbot", Aimbot, 51, 25, 2 )
	AddMenuTab( Menu, "ESP", ESP, 101, 25, 3 )
	AddMenuTab( Menu, "Ents", Ents, 151, 25, 4 )
	AddMenuTab( Menu, "Misc", Misc, 201, 25, 5 )
	AddMenuTab( Menu, "Friends", Friends, 251, 25, 6 )
	AddMenuTab( Menu, "Cams", Cams, 301, 25, 7 )
	AddMenuTab( Menu, "Bhop", Bhop, 351, 25, 8 )
	AddMenuTab( Menu, "Spam", Spam, 401, 25, 9 )
	AddMenuTab( Menu, "Test10", Test10, 451, 25, 10 )
	AddMenuTab( Menu, "Test11", Test11, 501, 25, 11 )
	AddMenuTab( Menu, "Config", Config, 551, 25, 12 )
	
	function ChangeTab ( Tab, TabID )
		Main:SetVisible(false)
		Aimbot:SetVisible(false)
		ESP:SetVisible(false)
		Ents:SetVisible(false)
		Misc:SetVisible(false)
		Friends:SetVisible(false)
		Cams:SetVisible(false)
		Bhop:SetVisible(false)
		Spam:SetVisible(false)
		Test10:SetVisible(false)
		Test11:SetVisible(false)
		Config:SetVisible(false)
		FriendSaves:SetVisible(false)
		EntitySaves:SetVisible(false)
		CustomCrosshair:SetVisible(false)
		
		Tab:SetVisible(true)
		SmegHack.ActiveTab = TabID
	end
	
	//Main Tab
	AddMainMenuButton( Main, "Unload Hack", 100, 60, function()
		CloseMenu()
		UnloadSmegHack(true)
	end)
	AddMainMenuButton( Main, "Reload Hack", 250, 60, function()
		CloseMenu()
		ReloadSmegHack(true)
	end)
	AddMainMenuButton( Main, "Clear Saved Files", 400, 60, function()
		if file.Exists( "sh", "DATA" ) then
			local Files, Dirs = file.Find( "sh/*", "DATA" )
			for k, v in pairs( Files ) do
				file.Delete( "sh/"..v )
			end
			for k, v in pairs( Dirs ) do
				local Files, Dirs = file.Find( "sh/"..v.."/*", "DATA" )
				local Dir = v
				for k, v in pairs( Files ) do
					file.Delete( "sh/"..Dir.."/"..v )
				end
			end
		end
	end)
	
	//Aimbot Tab
	AddCheckBox( Aimbot, "Aimbot", 15, 45, "Enables/Disables Aimbot", "Aimbot_Toggle" )
	AddCheckBox( Aimbot, "LOS Check", 15, 65, "Only aims at visible players (players within your line of sight)", "Aimbot_LOSCheck" )
	AddCheckBox( Aimbot, "Auto Wall", 15, 85, "Aim at people behind walls that can be shot through", "Aimbot_AutoWall")
	AddCheckBox( Aimbot, "Auto Shoot", 100, 85, "Automatically shoot when the aimbot is locked onto someone", "Aimbot_AutoShoot")

	AddCheckBox( Aimbot, "Aim On Key", 15, 105, "Aimbot only active when selected key is held down", "Aimbot_AimOnKey" )
	AddKeyBind( Aimbot, 100, 105, "Aimbot_AimOnKey_Key" )
	AddLabel( Aimbot, "Aim Priority:", 40, 125 )
	AddComboBox( Aimbot, 100, 125, 100, 15, "Aimbot_AimPriority", {"Distance", "Crosshair"} )
	AddCheckBox( Aimbot, "Smooth Aim", 15, 145, "Aims at other players slowly (looks more legit)", "Aimbot_SmoothAim")
	AddSlider( Aimbot, "Aimbot_SmoothAim_Value", 100, 145, 0, 1000, 0 )
	AddCheckBox( Aimbot, "FOV", 15, 165, "Only aim at players within the selected field of view", "Aimbot_FOV")
	AddSlider( Aimbot, "Aimbot_FOV_Value", 100, 165, 0, 360, 0 )
	AddCheckBox( Aimbot, "Stick To Target", 15, 185, "Will stay aiming at the one target as long as they fall within the selected criteria above", "Aimbot_StickToTarget" )
	AddCheckBox( Aimbot, "Bone Aim", 15, 205, "Aims only at selected bone", "Aimbot_BoneAim" )

	AddCheckBox( Aimbot, "Team", 15, 245, "Aim at/ignore players on your team", "Aimbot_AimTeam" )
	AddCheckBox( Aimbot, "Opponents", 15, 265, "Aim at/ignore players on the other team", "Aimbot_AimOpponents" )
	AddCheckBox( Aimbot, "Friends", 15, 285, "Aim at/ignore players on your friends list", "Aimbot_AimFriends" )
	AddCheckBox( Aimbot, "Enemies", 15, 305, "Aim at/ignore players on your enemies list", "Aimbot_AimEnemies" )
	AddCheckBox( Aimbot, "NPCs", 15, 325, "Aim at/ignore NPCs", "Aimbot_AimNPCs" )
	AddCheckBox( Aimbot, "Spectators", 15, 345, "Aim at/ignore players who are in spectator mode", "Aimbot_AimSpectators" )

	AddComboBox( Aimbot, 100, 245, 70, 15, "Aimbot_AimTeamV", {"Aim", "Ignore"} )
	AddComboBox( Aimbot, 100, 265, 70, 15, "Aimbot_AimOpponentsV", {"Aim", "Ignore"} )
	AddComboBox( Aimbot, 100, 285, 70, 15, "Aimbot_AimFriendsV", {"Aim", "Ignore"} )
	AddComboBox( Aimbot, 100, 305, 70, 15, "Aimbot_AimEnemiesV", {"Aim", "Ignore"} )
	AddComboBox( Aimbot, 100, 325, 70, 15, "Aimbot_AimNPCsV", {"Aim", "Ignore"} )
	AddComboBox( Aimbot, 100, 345, 70, 15, "Aimbot_AimSpectatorsV", {"Aim", "Ignore"} )

	//AddLabel( Parent, Text, PosX, PosY, CloseOn )
	AddLabel( Aimbot, "Offset X:", 200, 325 )
	AddLabel( Aimbot, "Offset Y:", 200, 345 )
	AddSlider( Aimbot, "Aimbot_OffsetX", 250, 320, -100, 100, 0 )
	AddSlider( Aimbot, "Aimbot_OffsetY", 250, 340, -100, 100, 0 )
	
	AddBoneButton( Aimbot, 490, 75, "ValveBiped.Bip01_Head1" )
	AddBoneButton( Aimbot, 490, 120, "ValveBiped.Bip01_Neck1" )
	AddBoneButton( Aimbot, 490, 150, "ValveBiped.Bip01_Spine4" )
	AddBoneButton( Aimbot, 490, 175, "ValveBiped.Bip01_Spine2" )
	AddBoneButton( Aimbot, 490, 200, "ValveBiped.Bip01_Spine1" )
	AddBoneButton( Aimbot, 490, 225, "ValveBiped.Bip01_Spine" )
	AddBoneButton( Aimbot, 490, 255, "ValveBiped.Bip01_Pelvis" )
	AddBoneButton( Aimbot, 470, 160, "ValveBiped.Bip01_R_UpperArm" )
	AddBoneButton( Aimbot, 450, 140, "ValveBiped.Bip01_R_Forearm" )
	AddBoneButton( Aimbot, 430, 130, "ValveBiped.Bip01_R_Hand" )
	AddBoneButton( Aimbot, 510, 165, "ValveBiped.Bip01_L_UpperArm" )
	AddBoneButton( Aimbot, 530, 140, "ValveBiped.Bip01_L_Forearm" )
	AddBoneButton( Aimbot, 550, 130, "ValveBiped.Bip01_L_Hand" )
	AddBoneButton( Aimbot, 470, 275, "ValveBiped.Bip01_R_Thigh" )
	AddBoneButton( Aimbot, 450, 295, "ValveBiped.Bip01_R_Calf" )
	AddBoneButton( Aimbot, 430, 305, "ValveBiped.Bip01_R_Foot" )
	AddBoneButton( Aimbot, 410, 305, "ValveBiped.Bip01_R_Toe0" )
	AddBoneButton( Aimbot, 510, 275, "ValveBiped.Bip01_L_Thigh" )
	AddBoneButton( Aimbot, 530, 295, "ValveBiped.Bip01_L_Calf" )
	AddBoneButton( Aimbot, 550, 305, "ValveBiped.Bip01_L_Foot" )
	AddBoneButton( Aimbot, 570, 305, "ValveBiped.Bip01_L_Toe0" )

	AddGenericButton( Aimbot, "Fill", 85, 30, 400, 325, function()
		for k, v in pairs(SmegHack.Bones) do
			if !table.HasValue( SmegHack.BoneOrder, v ) then
				table.insert( SmegHack.BoneOrder, v )
			end
		end
		UpdateBoneThink = true
	end)
	AddGenericButton( Aimbot, "Clear", 85, 30, 495, 325, function()
		table.Empty( SmegHack.BoneOrder )
		UpdateBoneThink = true
	end)
	

	//ESP Tab
	AddCheckBox( ESP, "ESP", 15, 45, "Enables/Disables ESP", "ESP_Toggle" )
	AddCheckBox( ESP, "Team", 15, 65, "Draw/Ignore ESP for players on your team", "ESP_ShowTeam" )
	AddCheckBox( ESP, "Opponents", 15, 85, "Draw/Ignore ESP for players not on your team", "ESP_ShowOpponents" )
	AddCheckBox( ESP, "Friends", 15, 105, "Draw/Ignore ESP for players on your friends list", "ESP_ShowFriends" )
	AddCheckBox( ESP, "Enemies", 15, 125, "Draw/Ignore ESP for players on your enemies list", "ESP_ShowEnemies" )
	AddCheckBox( ESP, "NPCs", 15, 145, "Draw/Ignore ESP for NPCs", "ESP_ShowNPCs" )
	AddCheckBox( ESP, "Spectators", 15, 165, "Draw/Ignore ESP for spectators", "ESP_ShowSpectators" )

	AddComboBox( ESP, 100, 65, 70, 15, "ESP_ShowTeamV", {"Show", "Ignore"} )
	AddComboBox( ESP, 100, 85, 70, 15, "ESP_ShowOpponentsV", {"Show", "Ignore"} )
	AddComboBox( ESP, 100, 105, 70, 15, "ESP_ShowFriendsV", {"Show", "Ignore"} )
	AddComboBox( ESP, 100, 125, 70, 15, "ESP_ShowEnemiesV", {"Show", "Ignore"} )
	AddComboBox( ESP, 100, 145, 70, 15, "ESP_ShowNPCsV", {"Show", "Ignore"} )
	AddComboBox( ESP, 100, 165, 70, 15, "ESP_ShowSpectatorsV", {"Show", "Ignore"} )

	AddCheckBox( ESP, "Boundary Boxes", 15, 190, "Display a box around players", "ESP_BoundaryBoxes" )
	AddComboBox( ESP, 120, 190, 35, 15, "ESP_BoundaryBoxes_Mode", { "2D", "3D" } )
	AddCheckBox( ESP, "Name Tags", 15, 210, "Display player names", "ESP_NameTags" )
	AddCheckBox( ESP, "Weapon", 15, 230, "Display equipped weapon of players", "ESP_Weapon" )
	AddCheckBox( ESP, "Distance", 15, 250, "Display distance between you and other players", "ESP_Distance" )
	AddCheckBox( ESP, "Health", 15, 270, "Display health of players", "ESP_Health" )
	AddCheckBox( ESP, "Skeleton", 15, 290, "Draws the skeleton of players", "ESP_Skeleton" )
	AddCheckBox( ESP, "Crosshair", 15, 310, "Draws crosshair on screen", "ESP_Crosshair" )
	AddGenericButton( ESP, "Customize", 80, 15, 90, 310, function() ChangeTab(CustomCrosshair,15) end )

	AddCheckBox( ESP, "Entity ESP", 185, 65, "Draw ESP for selected entities", "ESP_Entity_Toggle" )
	AddCheckBox( ESP, "Name Tags", 185, 85, "Draw ESP for selected entities", "ESP_Entities_NameTags" )
	AddCheckBox( ESP, "Boundary Boxes", 185, 105, "Draw ESP for selected entities", "ESP_Entities_BoundaryBoxes" )
	AddComboBox( ESP, 290, 105, 40, 15, "ESP_Entities_BoundaryBoxes_Mode", { "2D", "3D" } )

	//Crosshair Custimization
	AddGenericButton( CustomCrosshair, "<-- Finished   ", 100, 20, 25, 335, function () ChangeTab( ESP, 3 ) end )
	AddLabel( CustomCrosshair, "Size:", 15, 60 )
	AddLabel( CustomCrosshair, "Mode:", 15, 80)
	AddSlider( CustomCrosshair, "ESP_Crosshair_Size", 50, 60, 1, ScrW()/2, 0 )
	AddComboBox( CustomCrosshair, 50, 80, 105, 15, "ESP_Crosshair_Mode", { "Team", "Custom" } )

	local Mixer = vgui.Create( "DColorMixer", CustomCrosshair )
	Mixer:SetSize( 250, 160 )
	Mixer:SetPos( 335, 60 )
	Mixer:SetPalette( false )
	Mixer:SetAlphaBar( true )
	Mixer:SetWangs( true )
	if SmegHack.Options["ESP_Crosshair_Mode"] == "Team" then
		Mixer:SetColor( team.GetColor(LocalPlayer():Team()) )
	else
		Mixer:SetColor( Color(SmegHack.Options["ESP_Crosshair_Color_R"], SmegHack.Options["ESP_Crosshair_Color_G"], SmegHack.Options["ESP_Crosshair_Color_B"], SmegHack.Options["ESP_Crosshair_Color_A"]) )
	end
	Mixer.Think = function()
		if SmegHack.Options["ESP_Crosshair_Mode"] == "Custom" then
			SmegHack.Options["ESP_Crosshair_Color_R"] = Mixer:GetColor().r
			SmegHack.Options["ESP_Crosshair_Color_G"] = Mixer:GetColor().g
			SmegHack.Options["ESP_Crosshair_Color_B"] = Mixer:GetColor().b
		end
		SmegHack.Options["ESP_Crosshair_Color_A"] = Mixer:GetColor().a
	end

	//Ents Tab
	local ESPOffEntsList = vgui.Create("DListView", Ents)
	ESPOffEntsList:SetPos( 25, 55 )
	ESPOffEntsList:SetSize( 225, 295 )
	ESPOffEntsList:SetMultiSelect(false)
	ESPOffEntsList:AddColumn("Off ESP")
	
	local ESPOnEntsList = vgui.Create("DListView", Ents)
	ESPOnEntsList:SetPos( 350, 55 )
	ESPOnEntsList:SetSize( 225, 295 )
	ESPOnEntsList:SetMultiSelect(false)
	ESPOnEntsList:AddColumn("On ESP")
	
	function RefreshEntsList()
		ESPOnEntsList:Clear()
		ESPOffEntsList:Clear()
		for k, v in pairs( SmegHack.EntityESP ) do
			ESPOnEntsList:AddLine(v)
		end
		for k, v in pairs( ents.GetAll() ) do
			local Name = v:GetClass()
			local Copy = false
			if Name != "player" then
				if !table.HasValue( SmegHack.EntityESP, Name ) then
					for k, v in pairs (ESPOffEntsList:GetLines() ) do
						if v:GetValue(1) == Name then Copy = true end
					end
					if Copy == false then ESPOffEntsList:AddLine(Name) end
				end
			end
		end
	end
	RefreshEntsList()
	
	AddGenericButton( Ents, "Refresh", 80, 30, 260, 55, function() RefreshEntsList() end )
	AddGenericButton( Ents, "------->", 80, 30, 260, 167.5, function()
		if ESPOffEntsList:GetSelectedLine() != nil then
			table.insert( SmegHack.EntityESP, ESPOffEntsList:GetLine(ESPOffEntsList:GetSelectedLine()):GetValue(1) )
		end
		RefreshEntsList()
	end)
	AddGenericButton( Ents, "<-------", 80, 30, 260, 207.5, function()
		if ESPOnEntsList:GetSelectedLine() != nil then
			for k, v in pairs( SmegHack.EntityESP ) do
				if v == ESPOnEntsList:GetLine(ESPOnEntsList:GetSelectedLine()):GetValue(1) then
					table.remove( SmegHack.EntityESP, k )
				end
			end
		end
		RefreshEntsList()
	end)
	AddGenericButton( Ents, "Add All", 80, 30, 260, 95, function()
		for k, v in pairs( ESPOffEntsList:GetLines() ) do
			table.insert( SmegHack.EntityESP, v:GetValue(1) )
		end
		RefreshEntsList() 
	end)
	AddGenericButton( Ents, "Clear Ents", 80, 30, 260, 280, function() table.Empty( SmegHack.EntityESP ) RefreshEntsList() end )
	AddGenericButton( Ents, "Manage Saves", 80, 30, 260, 320, function() ChangeTab(EntitySaves, 14) end )
	
	//Entity Saves Manager
	AddSavePage( EntitySaves, "Entities" )
	AddGenericButton( EntitySaves, "<-- Finished   ", 100, 20, 25, 335, function () ChangeTab( Ents, 4 ) end )

	//Misc Tab
	AddCheckBox( Misc, "Clock Speed Manipulator", 15, 45, "Speed hack", "Misc_Clock", function()
		if SmegHack.Options["Misc_Clock"] then
			TimeScaleChange = true
		else
			LocalPlayer():ConCommand("incrementvar sv_cheats "..NormSvCheats.." "..NormSvCheats.." "..NormSvCheats)
			LocalPlayer():ConCommand("incrementvar host_timescale "..NormHostTimeScale.." "..NormHostTimeScale.." "..NormHostTimeScale)
		end
	end)
	AddSlider( Misc, "Misc_Clock_Speed", 160, 45, 0, 10, 0 )
	AddComboBox( Misc, 300, 45, 50, 15, "Misc_Clock_Mode", {"Fast", "Slow"}, function() TimeScaleChange = true end )

	AddCheckBox( Misc, "Admin Box", 15, 65, "Display all admins in a box", "Misc_AdminBox", function()
		if SmegHack.Options["Misc_AdminBox"] then
			AddDisplayBox( "Admins", 1 )
		end
	end)
	AddComboBox( Misc, 120, 65, 90, 15, "Misc_AdminBox_Mode", {"Auto", "Top Left", "Top Right", "Bottom Left", "Bottom Right"} )
	AddCheckBox( Misc, "Spectators Box", 15, 85, "Display all people spectating you in a box", "Misc_SpectatorsBox", function()
		if SmegHack.Options["Misc_SpectatorsBox"] then
			AddDisplayBox( "Spectators", 2 )
		end
	end)
	AddComboBox( Misc, 120, 85, 90, 15, "Misc_SpectatorsBox_Mode", {"Auto", "Top Left", "Top Right", "Bottom Left", "Bottom Right"} )
	
	//Friends Tab
	local FriendsList = vgui.Create("DListView", Friends)
	FriendsList:SetPos( 25, 55 )
	FriendsList:SetSize( 275, 200 )
	FriendsList:SetMultiSelect(false)
	FriendsList:AddColumn("Player Name")
	FriendsList:AddColumn("Steam ID")
	
	local EnemiesList = vgui.Create("DListView", Friends)
	EnemiesList:SetPos( 300, 55 )
	EnemiesList:SetSize( 275, 200 )
	EnemiesList:SetMultiSelect(false)
	EnemiesList:AddColumn("Player Name")
	EnemiesList:AddColumn("Steam ID")
	
	function RefreshFriendsList()
		FriendsList:Clear()
		EnemiesList:Clear()
		for k, v in pairs(player.GetAll()) do
			if v != LocalPlayer() then
				if SmegHack.Options["Friends_SteamFriends"] && v:GetFriendStatus() == "friend" then
					if !table.HasValue(SmegHack.FriendsList, v:SteamID()) then table.insert(SmegHack.FriendsList, v:SteamID()) end
				end
				if SmegHack.Options["Friends_SteamEnemies"] && v:GetFriendStatus() == "friend" then
					local PlayerSteamID = v:SteamID()
					for k, v in pairs(SmegHack.FriendsList) do
						if v == PlayerSteamID then
							table.remove(SmegHack.FriendsList, k)
						end
					end
					if table.HasValue(SmegHack.FriendsList, v:SteamID()) then table.remove(SmegHack.FriendsList, v:SteamID()) end
				end
				if SmegHack.Options["Friends_FriendIsEnemy"] then
					if table.HasValue(SmegHack.FriendsList, v:SteamID()) then
						EnemiesList:AddLine(v:Nick(), v:SteamID())
					else
						FriendsList:AddLine(v:Nick(), v:SteamID())
					end
				else
					if table.HasValue(SmegHack.FriendsList, v:SteamID()) then
						FriendsList:AddLine(v:Nick(), v:SteamID())
					else
						EnemiesList:AddLine(v:Nick(), v:SteamID())
					end
				end
			end
		end
	end
	RefreshFriendsList()
	
	AddMainMenuButton( Friends, "Remove Friend", 112.5, 260, function()
		local SelectedLine = FriendsList:GetSelectedLine()
		if SelectedLine != nil then
			local PlayerNick = FriendsList:GetLine(SelectedLine):GetValue(1)
			local PlayerSteamID = FriendsList:GetLine(SelectedLine):GetValue(2)
			if SmegHack.Options["Friends_FriendIsEnemy"] then
				table.insert(SmegHack.FriendsList, PlayerSteamID)
			else
				for k, v in pairs(SmegHack.FriendsList) do
					if v == PlayerSteamID then
						table.remove(SmegHack.FriendsList, k)
						break
					end
				end
			end
			RefreshFriendsList()
		end
	end)
	
	AddMainMenuButton( Friends, "Add Friend", 387.5, 260, function()
		local SelectedLine = EnemiesList:GetSelectedLine()
		if SelectedLine != nil then
			local PlayerNick = EnemiesList:GetLine(SelectedLine):GetValue(1)
			local PlayerSteamID = EnemiesList:GetLine(SelectedLine):GetValue(2)
			if SmegHack.Options["Friends_FriendIsEnemy"] then
				for k, v in pairs(SmegHack.FriendsList) do
					if v == PlayerSteamID then
						table.remove(SmegHack.FriendsList, k)
						break
					end
				end
			else
				table.insert(SmegHack.FriendsList, PlayerSteamID)
			end
			RefreshFriendsList()
		end
	end)
	
	AddMainMenuButton( Friends, "Refresh List", (Friends:GetWide()/2)-50, 260, function() RefreshFriendsList() end )
	AddMainMenuButton( Friends, "Manage Saves", (Friends:GetWide()/2)-50, 300, function() ChangeTab( FriendSaves, 13 ) end )
	AddMainMenuButton( Friends, "Clear Friends", 387.5, 300, function() table.Empty( SmegHack.FriendsList ) RefreshFriendsList() end )
	AddCheckBox( Friends, "Friend Is Enemy", 5, 265, "Turns the friends list into the enemies list", "Friends_FriendIsEnemy", function() RefreshFriendsList() end )
	AddCheckBox( Friends, "Steam Friends", 5, 285, "Make your friends on steam automatically appear on the friends list", "Friends_SteamFriends", function() RefreshFriendsList() end )
	AddCheckBox( Friends, "Steam Enemies", 5, 305, "Make your friends on steam automatically appear on the enemies list", "Friends_SteamEnemies", function() RefreshFriendsList() end )
	
	//Manage Friend Saves
	AddSavePage( FriendSaves, "Friends" )
	AddGenericButton( FriendSaves, "<-- Finished   ", 100, 20, 25, 335, function () ChangeTab( Friends, 6 ) end )

	//Cams Tab
	AddCheckBox( Cams, "Cams", 15, 45, "Enables/Disables cams hacks", "Cams_Toggle" )
	AddCheckBox( Cams, "Client Side Noclip", 15, 65, "Fly around the map freely (everyone else on the server wont see you flying)", "Cams_CSNoclip" )
	AddSlider( Cams, "Cams_CSNoclip_Speed", 125, 65, 0, 100, 0 )
	AddCheckBox( Cams, "Thirdperson", 15, 85, "An over shoulder view", "Cams_ThirdPerson" )
	AddSlider( Cams, "Cams_ThirdPerson_Zoom", 125, 85, 0, 100, 0 )

	//Bhop Tab
	AddCheckBox( Bhop, "Bhop", 15, 45, "Enables/Disables Bhop hacks", "Bhop_Toggle" )
	AddCheckBox( Bhop, "Fast Walk", 15, 65, "Makes you walk slightly faster", "Bhop_FastWalk" )
	AddCheckBox( Bhop, "Auto Hop", 15, 85, "Hold space to bhop", "Bhop_AutoHop" )
	AddCheckBox( Bhop, "Auto Strafe", 15, 105, "Automatically turns in the air", "Bhop_AutoStrafe")
	AddCheckBox( Bhop, "Edge Jump", 15, 125, "Jumps just before an edge", "Bhop_EdgeJump")
	AddSlider( Bhop, "Bhop_EdgeJump_Distance", 100, 125, 0, 100, 0 )
	AddCheckBox( Bhop, "Sideways", 15, 145, "Turns your camera so you can bhop normally while in Sideways mode", "Bhop_Sideways")
	AddCheckBox( Bhop, "W-Only", 15, 165, "Turns your camera so you can bhop normally while in W-Only mode", "Bhop_WOnly")

	//Spam Tab
	AddCheckBox( Spam, "Spam", 15, 45, "Enables/Disables Chat Spammer", "Spam_Toggle" )
	AddCheckBox( Spam, "Delay", 15, 65, "Pauses between each spam for x seeconds", "Spam_Delay" )
	AddSlider( Spam, "Spam_Delay_Value", 80, 65, 0, 10, 2 )
	AddCheckBox( Spam, "Anti-Anti-Spam", 15, 85, "Adds a random number to the end of your message to help avoid Anti-Spammers", "Spam_AntiAntiSpam" )

	AddCheckBox( Spam, "Message 1", 15, 265, "Enable spam message #1", "Spam_Message_1" )
	AddCheckBox( Spam, "Message 2", 15, 285, "Enable spam message #2", "Spam_Message_2" )
	AddCheckBox( Spam, "Message 3", 15, 305, "Enable spam message #3", "Spam_Message_3" )
	AddCheckBox( Spam, "Message 4", 15, 325, "Enable spam message #4", "Spam_Message_4" )
	AddCheckBox( Spam, "Message 5", 15, 345, "Enable spam message #5", "Spam_Message_5" )
	AddTextEntry( Spam, 485, 100, 262, "", "Spam1", true )
	AddTextEntry( Spam, 485, 100, 282, "", "Spam2", true )
	AddTextEntry( Spam, 485, 100, 302, "", "Spam3", true )
	AddTextEntry( Spam, 485, 100, 322, "", "Spam4", true )
	AddTextEntry( Spam, 485, 100, 342, "", "Spam5", true )
	
	//Config Tab
	AddSavePage( Config, "Configs" )
	
	if SmegHack.ActiveTab == nil then SmegHack.ActiveTab = 1 end
	if SmegHack.ActiveTab == 1 then ChangeTab( Main, 1 )
	elseif SmegHack.ActiveTab == 2 then ChangeTab( Aimbot, 2 )
	elseif SmegHack.ActiveTab == 3 then ChangeTab( ESP, 3 )
	elseif SmegHack.ActiveTab == 4 then ChangeTab( Ents, 4 )
	elseif SmegHack.ActiveTab == 5 then ChangeTab( Misc, 5 )
	elseif SmegHack.ActiveTab == 6 then ChangeTab( Friends, 6 )
	elseif SmegHack.ActiveTab == 7 then ChangeTab( Cams, 7 )
	elseif SmegHack.ActiveTab == 8 then ChangeTab( Bhop, 8 )
	elseif SmegHack.ActiveTab == 9 then ChangeTab( Spam, 9 )
	elseif SmegHack.ActiveTab == 10 then ChangeTab( Test10, 10 )
	elseif SmegHack.ActiveTab == 11 then ChangeTab( Test11, 11 )
	elseif SmegHack.ActiveTab == 12 then ChangeTab( Config, 12 )
	elseif SmegHack.ActiveTab == 13 then ChangeTab ( FriendSaves, 13 )
	elseif SmegHack.ActiveTab == 14 then ChangeTab ( EntitySaves, 14 )
	elseif SmegHack.ActiveTab == 15 then ChangeTab ( CustomCrosshair, 15 ) end

	function CloseMenu()
		MenuOpen = false
		Menu:Close()
	end
end
LoadSmegHack(true)