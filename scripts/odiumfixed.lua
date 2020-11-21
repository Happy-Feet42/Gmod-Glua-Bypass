local s, odium = pcall( collectgarbage, 'odium' ) /*=======================================================================



   ▄████████  ▄████████    ▄████████ ▀█████████▄   ▄██████▄      ███     

  ███    ███ ███    ███   ███    ███   ███    ███ ███    ███ ▀█████████▄ 

  ███    ███ ███    █▀    ███    █▀    ███    ███ ███    ███    ▀███▀▀██ 

  ███    ███ ███         ▄███▄▄▄      ▄███▄▄▄██▀  ███    ███     ███   ▀ 

▀███████████ ███        ▀▀███▀▀▀     ▀▀███▀▀▀██▄  ███    ███     ███     

  ███    ███ ███    █▄    ███    █▄    ███    ██▄ ███    ███     ███     

  ███    ███ ███    ███   ███    ███   ███    ███ ███    ███     ███     

  ███    █▀  ████████▀    ██████████ ▄█████████▀   ▀██████▀     ▄████▀   

                                                                         

A revolutionary lua multihack created by LegendofRobbo, Edited by: NotWill

Designed for usage with Project Odium

Lick my taint dumb nigger



Copyrighted by MingeTec Inc - putting pubbies their place since 2013



=======================================================================*/



--local odium = jit.status( "_O" )



local AB = AB or {}

/*

AB.Version = "1.10 - May 26 2017"

AB.LatestChanges = {

    "More reliable targeting on aimbot, shouldn't snap to random targets anymore",

    "Added spectator detection window, moved spectator and witness detection to utility tab",

    "Added file protection for the acebot settings file",

    "Improved ent marker with class searching algorithm",

    "Added invalid's cac UD bhop script",

    "Added sticky targeting setting to aimbot",

    "Namestealer no longer saves between sessions",

    "Added big secret feature",

}

*/

AB.Version = "1.11 - Jul 04 2017"

AB.LatestChanges = {

    "Rewrote xray core to be 100% screengrab safe",

    "Changed notification system over to aegis.Notify",

    "Minor performance tweaks",

}



MsgC( Color( 0, 150, 250 ), "==========>----- Acebot Initialized (Version "..AB.Version..") -----<==========\n" )

MsgC( Color( 0, 150, 250 ), "Latest Changes:\n" )

for k, v in SortedPairs(AB.LatestChanges, false) do

    MsgC( Color( 150, 200, 250 ), v.."\n" )



end



AB.Changelog = {

    " ===== 1.09 (May 11 2017) ===== ",

    "Fixed silent aim to have proper movement correction",

    "Added aimbot auto-trigger setting",

    "Made aimbot kick into rage mode targeting at 180 FOV (experimental)",

    "Added in-hud freecam",

    " ===== 1.08 (Apr 28 2017) ===== ",

    "Rewrote aimbot core systems to be faster, more efficient and more stable",

    "Made silent aim correctly choke bsendpacket",

    "Added adaptive body targeting",

    "Deprecated aegis_printlogs",

    "Made everything on ESP derender when offscreen to boost fps",

    " ===== 1.07 (Apr 21 2017) ===== ",

    "Stopped aimbot from locking on to spawn protected players in darkrp",

    "Added darkrp arrest dodger",

    "Added random rpname on death option",

    "Added suicide when physgunned option",

    "Added ace_base_set, ace_base_remove and ace_base_setsize",

    " ===== 1.06 (Apr 5 2017) ===== ",

    "Added promotional chatspam",

    "Added m9k wallbang mode",

    "Added proper aimbot bind key mode",

    "Numerical variables now save properly between sessions",

    " ===== 1.05 (Mar 24 2017) ===== ",

    "Added more insult modes",

    "Added silent aim",

    "Added esp range slider",

    "Cleaned up aimbot core",

    "Added pattern matching to chat spammer",

    "Added clientside flashlight",

    " ===== 1.04 (Mar 12 2017) ===== ",

    "Added spread compensation to aimbot for xtreme accuracy",

    "Added ace_insult4",

    " ===== 1.03 (Feb 8 2017) ===== ",

    "Added more aegis debug commands",

    "Expanded insult generator",

    "Added wraith vision mode",

    "Added ace_exploit_rapeconsole",

    " ===== 1.02 (Feb 8 2017) ===== ",

    "Fixed 180up",

    "Fixed error that would occasionally happen and betray our presence to server admins",

    " ===== 1.01 (Nov 15 2016) ===== ",

    "Added /PM Spam mode",

    "Fixed innocent roleplayer printing a bunch of crap",

    "Added ace_insult3 and crash jackson macros",

    "Fixed TTT lua errors",

    " ===== 1.00 (Aug 30 2016) ===== ",

    "Finalized menu theme",

    "Added bhop basic auto strafe",

    "Added vote spammer module",

    "Changed namestealer to use the new odium lua API",

    "Added options for disabling squares and player names on the ESP",

    "Fixed rear vision mirror",

    " ===== 0.98 (Jul 29 2016) ===== ",

    "Added more insult fragments to ace_insult",

    "Added propkill visual settings",

    " ===== 0.97 (Jul 20 2016) ===== ",

    "Added entity scanner mode, allows you to gather advanced information and use bd macros directly on a target",

    "Added ace_innocent_roleplayer and ace_random_rpname for hiding from admins",

    "Backdoor CP now checks if backdoor is functional before a message is sent",

    "Namestealer should be more reliable now",

    "Better tooltips on some menu buttons",

    "More changes to backdoor CP",

    " ===== 0.96 (Jun 14 2016) ===== ",

    "Added more backdoor macros",

    "Added ace_180up_vertical_angle command for people who like to adjust their launch angles",

    " ===== 0.95 (Apr 22 2016) ===== ",

    "Improved backdoor macro menu with more macros and fixes for old ones",

    "Fixed ace_pk_180up not looking up",

    " ===== 0.94 (Mar 25 2016) ===== ",

    "Added support for the cw2 base for the inspect weapon menu",

    "Triggerbot now uses the same targeting logic as aimbot",

    "Further unfucked the aimbot and added more options",

    "Added damage hitmarker function to crosshair",

    "Fixed ab_init not being called, should fix the TTT traitor detector",

    "Added random insult mode to chat spammer",

    " ===== 0.93b (Mar 15 2016) ===== ",

    "Made ace_insult and ace_insult2 more savage",

    "Added a couple more macros to the entfinder",

    "Changed draw order so ESP draws over the top of xray",

    "Minor backend cleanup",

    " ===== 0.93 (Mar 11 2016) ===== ",

    "Added easy macros to the ent finder menu",

    "Fixed broken calcview hook",

    "Made aimbot refresh its target buffer when in fire only on snap mode",

    " ===== 0.92 (Mar 08 2016) ===== ",

    "Fixed a bunch of error spew",

    "Updated aegis detours system to detect anticheats and have proper logs",

    " ===== 0.91 (Mar 07 2016) ===== ",

    "Made chat spammer option always default to off and not get saved",

    "Added TTT traitor detection system (fucking finally)",

    "Got target highlighting system working",

    "Improved the fucked up aimbot a bit more",

    "Removed a bunch of bugged and unused options from the aimbot control panel",

    "Removed broken and dated minge alts system",

    " ===== 0.90 (Feb 26 2016) ===== ",

    "Lubed my anus for project odium",

    "Fixed the janky inspect weapon script and moved it to utilities",

    "Improved the acebot console with live updates and better logging",

    "Added chat spammer",

    " ===== 0.84b (Jan 28 2016) ===== ",

    "Minor system fixes, passing invalid players etc",

    " ===== 0.84a (Jan 23 2016) ===== ",

    "Removed inject SCI function since it's now built into wraithnet",

    "Improved headshot accuracy for aimbot",

    "Added the option to target heads or centre of mass for aimbot",

    "Added teleport, gas, become unbannable macros, extended range on most trace based macros",

    " ===== Alpha phase (June 2015 - Jan 2016) ===== ",

    "Acebot created, cac bypassed, many shitRP servers pooped on",

}



AB.Vars = AB.Vars or {}

AB.NumberVars = AB.NumberVars or {} -- need a seperate table here coz im a lazy cunt

AB.Buddies = AB.Buddies or {}

AB.Targets = AB.Targets or {}

AB.TheyHaveEyesEverywhere = AB.TheyHaveEyesEverywhere or {}

AB.Witnesses = AB.Witnesses or {}

AB.Debug = AB.Debug or {}

AB.MarkedEnts = AB.MarkedEnts or {}

AB.Traitors = AB.Traitors or {}

AB.RenderPanic = false

AB.NameStealName = "Garry :D"

AB.NameStealPlayer = LocalPlayer()

AB.CrossHairAlpha = 0

AB.ScrollDelta = 0 -- lets you set mouse wheel scroll from outside of createmove

AB.AimbotBone = "ValveBiped.Bip01_Head1"

AB.ViewAngle = Angle(0,0,0)

AB.AimbotTarget = game.GetWorld()

AB.AimbotPreviewTarget = -1

AB.HoldingProp = game.GetWorld()

AB.ChatSpamText = "@getodium"

AB.OPhysColor = Vector( GetConVarString( "cl_weaponcolor" ) ) or Vector( 1,1,1 )

AB.CurrentBase = 0

AB.BaseAreaSize = 10

AB.InternalFakeAngles = 0

AB.MemoryDebug = {

    ["hud"] = 0,

    ["logic"] = 0,

    ["aimbot"] = 0,

}

AB.Freecam = false

AB.FreecamCoordinates = { pos = Vector( 0, 0, 0 ), ang = Angle( 0, 0, 0 ) }



-- general settings

AB.Vars.Notifications = AB.Vars.Notifications or true



-- vision

AB.Vars.Vision = AB.Vars.Vision or true

AB.Vars.ShowESP = AB.Vars.ShowESP or true

AB.Vars.ShowDead = AB.Vars.ShowDead or false

AB.Vars.ShowHP = AB.Vars.ShowHP or false

AB.Vars.ShowFriends = AB.Vars.ShowFriends or true

AB.Vars.ShowTargets = AB.Vars.ShowTargets or true

AB.Vars.TeamColors = AB.Vars.TeamColors or false

AB.Vars.ShowRanks = AB.Vars.ShowRanks or true

AB.Vars.ShowTraitors = AB.Vars.ShowTraitors or true

AB.Vars.ShowDistance = AB.Vars.ShowDistance or false

AB.Vars.ESPProps = AB.Vars.ESPProps or false

AB.Vars.Entfinder = AB.Vars.Entfinder or false

AB.Vars.Vizlines = AB.Vars.Vizlines or false

AB.Vars.BoundingBox = AB.Vars.BoundingBox or false

AB.Vars.BoundingBox3d = AB.Vars.BoundingBox3d or false

AB.Vars.VSquares = AB.Vars.VSquares or true

AB.Vars.VNames = AB.Vars.VNames or true

AB.Vars.PKVelocity = AB.Vars.PKVelocity or false

AB.Vars.PKChams = AB.Vars.PKChams or false

AB.Vars.PKPropCam = AB.Vars.PKPropCam or false

AB.Vars.PKPropBeams = AB.Vars.PKPropBeams or false

AB.Vars.PKPlayerBeams = AB.Vars.PKPlayerBeams or false

AB.Vars.PKVerticalBeams = AB.Vars.PKVerticalBeams or false

AB.Vars.CSFlashlight = AB.Vars.CSFlashlight or false

AB.NumberVars.VisionDist = AB.NumberVars.VisionDist or 2000



-- utility



AB.Vars.CameraSpam = AB.Vars.CameraSpam or true

AB.Vars.FlashlightSpam = AB.Vars.FlashlightSpam or false

AB.Vars.NoRecoil = AB.Vars.NoRecoil or true



AB.Vars.WitnessDetector = AB.Vars.WitnessDetector or false

AB.Vars.Mirror = AB.Vars.Mirror or false

AB.Vars.Radar = AB.Vars.Radar or false

AB.Vars.RadarColors = AB.Vars.RadarColors or false

AB.Vars.Xray = AB.Vars.Xray or false

AB.Vars.Crosshair = AB.Vars.Crosshair or false

AB.Vars.NameStealer = false

AB.Vars.NotifyKills = AB.Vars.NotifyKills or false



AB.Vars.XrayPlayers = AB.Vars.XrayPlayers or true

AB.Vars.XrayProps = AB.Vars.XrayProps or true

AB.Vars.XrayEntfinder = AB.Vars.XrayEntfinder or false

AB.Vars.NoChamColours = AB.Vars.NoChamColours or true

AB.Vars.XraySolid = AB.Vars.XraySolid or false



AB.Vars.AutoAddSteamFriends = AB.Vars.AutoAddSteamFriends or true



AB.Vars.ChatSpam = false

AB.Vars.ChatSpamOOC = AB.Vars.ChatSpamOOC or false

AB.Vars.ChatSpamBind = AB.Vars.ChatSpamBind or false

AB.Vars.ChatSpamInsult = AB.Vars.ChatSpamInsult or false

AB.Vars.ChatSpamPM = AB.Vars.ChatSpamPM or false

AB.Vars.ChatSpamPMAdmins = AB.Vars.ChatSpamPMAdmins or false



AB.EntScanner = false

AB.EntScannerTab = {}

AB.EntScannerEnt = game.GetWorld()



AB.Vars.DemoteSpam = false

AB.Vars.WantedSpam = false

AB.Vars.ULXVotekickSpam = false

AB.Vars.ULXVotebanSpam = false



AB.Vars.KillTaunts = false

AB.Vars.DeathTaunts = false



AB.Vars.DodgeArrest = false

AB.Vars.NewLifeRule = false

AB.Vars.DontTouchMeThere = false



AB.Vars.KeypadJew = false

AB.Vars.FreecamControls = false



-- aimbot



AB.Vars.Aimbot = AB.Vars.Aimbot or false

AB.Vars.AimbotTargetMode = AB.Vars.AimbotTargetMode or true

AB.Vars.AutoShoot = AB.Vars.AutoShoot or false

AB.Vars.AutoTrigger = AB.Vars.AutoTrigger or false

AB.Vars.AimbotShootThroughWalls = AB.Vars.AimbotShootThroughWalls or false

AB.Vars.SnapOnFire = AB.Vars.SnapOnFire or false

AB.Vars.TargetFriends = AB.Vars.TargetFriends or true

AB.Vars.TargetHighlighted = AB.Vars.TargetHighlighted or true

AB.Vars.TargetNormies = AB.Vars.TargetNormies or true

AB.Vars.TargetAdmins = AB.Vars.TargetAdmins or true

AB.Vars.TargetSameTeam = AB.Vars.TargetSameTeam or true

AB.Vars.TargetNoclippers = AB.Vars.TargetNoclippers or true

AB.Vars.PreviewTarget = AB.Vars.PreviewTarget or true

AB.Vars.CompSpread = AB.Vars.CompSpread or false

AB.Vars.SilentAim = AB.Vars.SilentAim or false

AB.Vars.AimbotBindMode = AB.Vars.AimbotBindMode or false

AB.Vars.AimbotWallbanger = AB.Vars.AimbotWallbanger or false

AB.Vars.AimbotAdaptiveTarget = AB.Vars.AimbotAdaptiveTarget or false

AB.Vars.AimbotStickyLock = AB.Vars.AimbotStickyLock or true



AB.NumberVars.AimbotMaxFOV = AB.NumberVars.AimbotMaxFOV or 20

AB.NumberVars.AimbotDist = AB.NumberVars.AimbotDist or 200

AB.NumberVars.AimbotSmooth = AB.NumberVars.AimbotSmooth or 0

AB.NumberVars.PKRotateAngle = AB.NumberVars.PKRotateAngle or 30



AB.NumberVars.AimbotBindKey = AB.NumberVars.AimbotBindKey or 107



AB.NumberVars.FreecamForward = AB.NumberVars.FreecamForward or 50

AB.NumberVars.FreecamBack = AB.NumberVars.FreecamBack or 49

AB.NumberVars.FreecamLeft = AB.NumberVars.FreecamLeft or 41

AB.NumberVars.FreecamRight = AB.NumberVars.FreecamRight or 43

AB.NumberVars.FreecamUp = AB.NumberVars.FreecamUp or 45

AB.NumberVars.FreecamDown = AB.NumberVars.FreecamDown or 42



-- default menu and esp colours

AB.DefaultSchemes = {

    [1] = {"Spectral Blue", Color(205,205,255,255), Color(105,105,255,255)},

    [2] = {"Ocean Blue", Color(100,100,255,255), Color(50,50,155,255)},

    [3] = {"Sage Green", Color(100,250,100,255), Color(0,200,0,255)},

    [4] = {"Javelin Orange", Color(250,250,0,255), Color(250,150,0,255)},

    [5] = {"Predator Red", Color(255,0,0,255), Color(200,0,0,255)},

    [6] = {"Miami Pink", Color(255,0,255,255), Color(150,0,150,255)},

    [7] = {"Anus Brown", Color(125,0,0,255), Color(50,0,0,255)},

    [8] = {"Jungle Green", Color(50,150,50,255), Color(0,50,0,255)},

    [9] = {"Noir Grey", Color(150,150,150,255), Color(50,50,50,255)},

}



AB.DefaultScheme = Color(205,205,255,255)

AB.DefaultScheme2 = Color(80,80,255,255)

AB.Matinfo = {

    ["$basetexture"] = "models/debug/debugwhite",

    ["$model"]       = 1,

    ["$nocull"]      = 1,

    ["$ignorez"] = 1,

}



AB.Mat1 = (CreateMaterial( "abchams2", "VertexLitGeneric", AB.Matinfo )) 

AB.ColScheme = Vector(AB.DefaultScheme.r / 255, AB.DefaultScheme.g / 255, AB.DefaultScheme.b / 255)

AB.ColScheme2 = Vector(AB.DefaultScheme2.r / 255, AB.DefaultScheme2.g / 255, AB.DefaultScheme2.b / 255)



AB.NumberVars.ColorScheme = AB.NumberVars.ColorScheme or 1



-- herkz

AB.Vars.Aimbot = AB.Vars.Aimbot or false



AB.Vars.Autoclick = AB.Vars.Autoclick or false

AB.Vars.Bhop = AB.Vars.Bhop or false

AB.Vars.BhopAutostrafe = AB.Vars.BhopAutostrafe or false

AB.Vars.RopeStorm = AB.Vars.RopeStorm or false

AB.Vars.Triggerbot = AB.Vars.Triggerbot or false

AB.Vars.Thirdperson = AB.Vars.Thirdperson or false





AB.NumberVars.MirrorX = AB.NumberVars.MirrorX or 0

AB.NumberVars.MirrorY = AB.NumberVars.MirrorY or 0

AB.NumberVars.MirrorSize = AB.NumberVars.MirrorSize or 30

AB.NumberVars.MirrorAxis = AB.NumberVars.MirrorAxis or 0



AB.NumberVars.XrayDistance = AB.NumberVars.XrayDistance or 200

AB.NumberVars.TPSDistance = AB.NumberVars.TPSDistance or 100

AB.NumberVars.TPSOffset = AB.NumberVars.TPSOffset or 0



AB.NumberVars.RadarX = AB.NumberVars.RadarX or ScrW() - 280

AB.NumberVars.RadarY = AB.NumberVars.RadarY or 20

AB.NumberVars.RadarAlpha = AB.NumberVars.RadarAlpha or 255

AB.NumberVars.RadarSize = AB.NumberVars.RadarSize or 250

AB.NumberVars.RadarZoom = AB.NumberVars.RadarZoom or 50



/*

local plymeta = FindMetaTable( "Player" )

plymeta.ConCommand2 = plymeta.ConCommand2 or plymeta.ConCommand

function plymeta:ConCommand( command )

if command == "jpeg" and AB.Vars.CameraSpam then return else

return self:ConCommand2( command )

end

end

*/



local ncomponent = { color = Color( 205, 205, 255 ), name = "Acebot" }

function AB.ChatText( message, col, typ )

    typ = typ or 1

    if odium and odium.aegis then

        if col.r - ( col.g + col.b ) > 150 then typ = 4 end -- probably an error message

        if col.r == 255 and col.g == 205 and col.b == 205 then typ = 2 end

        if col.g >= (col.r + col.b) then typ = 3 end

        odium.aegis.Notify( ncomponent, typ, message )

    else

        chat.AddText( Color(195,205,255,255), "[Acebot] ", col, message )

    end

end





------------------------------------------------------------------------ACEBOT UTILITIES--------------------------------------------------------------------------------------



function AB.SetPlayerName( name )

    if !odium or !odium.player or !odium.player.SetName then

        AB.ChatText( "Odium main module not present or malfunctioning! Name changing will not work!", Color(255,100,0) )

        AB.Vars.NameStealer = false

        return 

    end 

    odium.player.SetName( name )

end



local nstries = 0

--local ninjacharacter = "⁮"

local ninjacharacter = "⁮"



function AB.NameStealer()

if !AB.Vars.NameStealer or !LocalPlayer():IsValid() then return end

if !AB.NameStealPlayer:IsValid() then AB.NameStealPlayer = LocalPlayer() end



-- set your name to a given string, unfucks bytefalls random malfunctions

if AB.NameStealName != LocalPlayer():Nick() and AB.NameStealPlayer == LocalPlayer() then

    nstries = nstries + 1

    AB.NameStealName = LocalPlayer():Nick() 

--    LocalPlayer():ConCommand( "odium_setname "..AB.NameStealName )

    AB.SetPlayerName( AB.NameStealName )

    if AB.NameStealName == LocalPlayer():Nick() then nstries = 0 end

end



local unfuckedname = string.Replace( AB.NameStealName, ninjacharacter, "" ) -- gotta clear the ninjas out so we can check if the namesteal worked properly



-- dank namestealerinos :^)

if AB.NameStealPlayer != LocalPlayer() and unfuckedname != AB.NameStealPlayer:Nick() then

    nstries = nstries + 1

    local theirname = AB.NameStealPlayer:Nick()

    local ipos = math.random(1, #theirname)

    local strname = theirname[ipos]

    local fixd = string.Replace(theirname, strname, strname..ninjacharacter )



    AB.NameStealName = fixd

    AB.SetPlayerName( fixd )

--    LocalPlayer():ConCommand( "odium_setname "..fixd )

    if AB.NameStealName == unfuckedname then nstries = 0 end

end



end

timer.Create("ab_namesteal", 1, 0, AB.NameStealer)



function AB.NameStealerShutoff()

steamworks.RequestPlayerInfo( LocalPlayer():SteamID64() )

timer.Simple( 0.5, function() AB.SetPlayerName(steamworks.GetPlayerName(LocalPlayer():SteamID64())) end)

AB.Vars.NameStealer = false

AB.NameStealName = LocalPlayer():Nick()

AB.NameStealPlayer = LocalPlayer()

if AB.Vars.Notifications then AB.ChatText( "Shut namestealer script down", Color(255,255,255) ) end

end



function AB.ManualNameSet( ply, cmd, args, argstr )

--    local n = ""

  --  for k, v in pairs( args ) do if k != 1 then n = n.." "..v else n = n..v end end

    AB.SetPlayerName( argstr )

end

concommand.Add( "odium_setname", AB.ManualNameSet )





function AB.SaveSettings()

local StringToWrite = ""

    for k, v in pairs(AB.Vars) do

        if( StringToWrite == "" ) then

            StringToWrite = k .. ";" .. tostring(v)

        else

            StringToWrite = StringToWrite .. "\n" .. k .. ";" .. tostring(v)

        end

    end

    StringToWrite = StringToWrite.."--NUMBERVARS--\n"

    for k, v in pairs(AB.NumberVars) do

        if( StringToWrite == "" ) then

            StringToWrite = k .. ";" .. tostring(v)

        else

            StringToWrite = StringToWrite .. "\n" .. k .. ";" .. tostring(v)

        end

    end

/*

if not file.IsDir("acebot", "DATA") then

   file.CreateDir("acebot")

end

*/

if file.IsDir("acebot", "DATA") then

    file.Delete( "acebot/settings.txt" ) 

    file.Delete( "acebot" ) 

end



file.Write( "acebot_settings.dat", StringToWrite )

end

concommand.Add("ace_save_settings", AB.SaveSettings)



function AB.LoadSettings()

/*

if not file.IsDir("acebot", "DATA") then

   file.CreateDir("acebot")

end

*/

if !file.Exists("acebot_settings.dat", "DATA") then AB.SaveSettings() return end



local TheFile = file.Read( "acebot_settings.dat", "DATA" )

local halves = string.Explode( "--NUMBERVARS--\n", TheFile )

if !halves[2] then file.Delete( "acebot_settings.dat" )

    AB.ChatText( "Invalid data file and/or data file is using an outdated format! type ace_save_settings into console to fix this", Color(255,205,205) )

    return 

end



TheFile = halves[1]

local DataPieces = string.Explode( "\n", TheFile )



for k, v in pairs( DataPieces ) do

    local TheLine = string.Explode( ";", v )

    AB.Vars[TheLine[1]] = tobool(TheLine[2])

end



TheFile = halves[2]

local DataPieces = string.Explode( "\n", TheFile )



for k, v in pairs( DataPieces ) do

    local TheLine = string.Explode( ";", v )

    AB.NumberVars[TheLine[1]] = tonumber(TheLine[2])

end



AB.Vars.NameStealer = false



end

concommand.Add("ace_load_settings", AB.LoadSettings)

AB.LoadSettings() -- load our shit right away

AB.Vars.ChatSpam = false -- reset this to false so we dont get cucked by anticheats



-- covert source units(inches) to metres

function AB.ToMetric( num )

if not isnumber(num) then return end

return math.floor(num * 0.0254)

end



-- check if an entity is actually visible on our screen, used to boost efficiency in the xray and esp code

function AB.OnScreen( ent, ws )

    local ws = ws or 0

    local bpos = (ent:LocalToWorld(ent:OBBCenter())):ToScreen()

    if ( bpos.x < (ScrW() + ws) and bpos.x > (0 - ws) and bpos.y < (ScrH() + ws) and bpos.y > (0 - ws) ) then return true end

    return false

end



function AB.IsDead( ply )

if !ply:IsValid() or !ply:Alive() or ply:GetObserverMode() != OBS_MODE_NONE then return true end

return false

end



-- compatible with ulx, assmod, evolve, vermillion 2 and traditional admin/superadmin detection may or may not pick up unknown admin mods

function AB.GetRank( ply )

if !ply or !ply:IsValid() then return "user" end

local rank = "user"

if ply:GetNWString("usergroup") then rank = ply:GetNWString("usergroup") return rank end

--if evolve then rank = ply:EV_GetRank() return rank end

if ply:GetNetworkedString( "UserGroup" ) then rank = ply:GetNetworkedString( "UserGroup" ) return rank end

if ply:GetNWString("Vermilion_Rank") then rank = ply:GetNWString("Vermilion_Rank") return rank end

if ply:IsSuperAdmin() then rank = "SUPERADMIN" return rank end

if ply:IsAdmin() then rank = "ADMIN" return rank end



return rank -- if they aren't any kind of admin that we know of then this will return "user"

end





function AB.GetESPColor( ply )

local col1, col2 = AB.DefaultScheme, AB.DefaultScheme2



if AB.IsTarget( ply ) then

    col1, col2 = Color(255,205,0,255), Color(205,160,0,255)

    return col1, col2

end



if AB.IsFriend( ply ) then

    col1, col2 = Color(0,255,0,255), Color(100,250,100,255)

    return col1, col2

end



if AB.GetRank( ply ) != "user" then

    col1, col2 = Color(255,100,0,255), Color(255,50,0,255)

    return col1, col2

end



if AB.Vars.TeamColors then

col1 = team.GetColor(ply:Team())

col2 = Color(math.Clamp(col1.r - 100, 0, 255), math.Clamp(col1.g - 100, 0, 255), math.Clamp(col1.b - 100, 0, 255), 255)

return col1, col2

end



return col1, col2

end





-- friends and targets system









function AB.AddTarget( ply )

    if !ply or !ply:IsValid() then return end

    if table.HasValue( AB.Targets, ply ) then return end

    table.insert( AB.Targets, ply )

    AB.DebugLog( "Added "..ply:Nick().." to your targets list", Color( 250, 150, 50) )

end



function AB.RemoveTarget( ply )

    if !ply or !ply:IsValid() then return end

    if not table.HasValue( AB.Targets, ply ) then AB.ChatText( ply:Nick().." isn't a target!", Color(255,205,205) ) return end

    table.RemoveByValue( AB.Targets, ply )

    AB.DebugLog( "Removed "..ply:Nick().." from your targets list", Color( 250, 150, 50) )

end



function AB.IsTarget( ply )

    if !ply or !ply:IsValid() then return false end

    return table.HasValue( AB.Targets, ply )

end







function AB.IsFriend( ply )

    if !ply or !ply:IsValid() then return false end

    return table.HasValue( AB.Buddies, ply )

end



function AB.AddFriend( ply )

    if !ply:IsValid() then return end

    if table.HasValue( AB.Buddies, ply ) then return end

    table.insert( AB.Buddies, ply )

    AB.DebugLog( "Added "..ply:Nick().." to your friends list", Color( 50, 250, 50) )

end



function AB.RemoveFriend( ply )

    if !ply:IsValid() then return end

    if not table.HasValue( AB.Buddies, ply ) then AB.ChatText( ply:Nick().." isn't on your friends list!", Color(255,205,205) ) return end

    table.RemoveByValue( AB.Buddies, ply )

    AB.DebugLog( "Removed "..ply:Nick().." from your friends list", Color( 50, 250, 50) )

end



function AB.RemoveInvalidFriends()

    for k, v in pairs(AB.Buddies) do

        if !v:IsValid() then table.remove( AB.Buddies, k ) end

    end

end



function AB.AddConnectedFriends()

    for k, v in pairs(player.GetAll()) do

        if v:GetFriendStatus() == "friend" then AB.AddFriend( v ) end

    end

end

concommand.Add("ace_refresh_friends", AB.AddConnectedFriends)

timer.Create( "ab_keep_friends_updated", 10, 0, AB.AddConnectedFriends )



gameevent.Listen( "player_spawn" )

hook.Add( "player_spawn", "addsteamfriends", function( data )

    local id = data.userid

    local ply =  player.GetByID( id )

    if !ply:IsValid() then return end

    if ply:GetFriendStatus() == "friend" and AB.Vars.AutoAddSteamFriends and !table.HasValue( AB.Buddies, ply ) then

        AB.AddFriend( ply )

    end

end )



-- this is for faggots that attempt to restrict ulx who



function AB.Who()

    local plys = player.GetAll()

    for k, v in pairs(plys) do

        if v:GetNWString("usergroup") then

            local col = Color( 150, 150, 200, 255 )

            if v:GetNWString("usergroup") != "user" then col = Color( 250, 200, 150, 255 ) end

            MsgC(col, v:GetName() .. string.rep("\t", math.Round(8 / #v:GetName())), v:GetNWString("usergroup").."\n")

        end

    end

end

concommand.Add("ace_who", AB.Who)



local grad = Material( "gui/gradient" )

local upgrad = Material( "gui/gradient_up" )

local downgrad = Material( "gui/gradient_down" )

local o_color1 = Color( 0, 0, 50, 255 )

local o_color2 = Color(155, 155, 155, 255)





function AB.ToggleVar( var, fancyname )

if AB.Vars[var] then

if AB.Vars.Notifications then AB.ChatText( "Disabled "..fancyname, Color(255,205,205) ) end

if string.find(var, "Xray") or var == "Vision" then AB.XrayShutoff() end -- need to run this function to properly unfuck things that have been xray'd

AB.Vars[var] = false

else

if AB.Vars.Notifications then AB.ChatText( "Enabled "..fancyname, Color(255,255,255) ) end

AB.Vars[var] = true

end

AB.SaveSettings()

end



for k, v in pairs(AB.Vars) do

    concommand.Add("ace_togglevar_"..string.lower(k), function() AB.ToggleVar( k, k ) end)

end





function AB.ChangeColorScheme( num )

if not isnumber(num) then return end

if num <= 0 or num > #AB.DefaultSchemes then print("I don't know how you fucked up this badly but you are trying to change to a colour scheme that doesn't exist!") return end

local c1 = AB.DefaultSchemes[num][2]

local c2 = AB.DefaultSchemes[num][3]



if AB.Vars.Notifications then AB.ChatText( "Changed colour scheme to "..AB.DefaultSchemes[num][1], c1 ) end

AB.DefaultScheme = c1

AB.DefaultScheme2 = c2

AB.ColScheme = Vector(c1.r / 255, c1.g / 255, c1.b / 255)

AB.ColScheme2 = Vector(c2.r / 255, c2.g / 255, c2.b / 255)



-- AB.NumberVars.ColorScheme = num -- done inside the button logic



end



function AB.MakeToggleButton( parent, x, y, btext, var, vartext, tooltip)

if !parent:IsValid() then return end



local TButton = vgui.Create( "DButton" )

TButton:SetParent( parent )  

TButton:SetPos( x, y )

TButton:SetText( btext )

TButton:SetTextColor( Color(255, 255, 255, 255) )

TButton:SetSize( 110, 25 )

if tooltip != nil then TButton:SetToolTip( tooltip ) end



TButton.Paint = function( self, w, h )

    surface.SetDrawColor( Color(60, 60, 90, 200) )

    TButton:SetText( btext )

    surface.DrawRect( 0, 0, w, h )

    surface.SetDrawColor( o_color1 )

    surface.SetMaterial( downgrad )

    surface.DrawTexturedRect( 0, 0, w, h/ 2 )



    if AB.Vars[var] then

        surface.SetDrawColor( Color(150, 250, 150, 255) )

    else

        surface.SetDrawColor( Color(100, 100, 100, 255) )

    end

    surface.DrawOutlinedRect( 0, 0, w, h )

end





TButton.DoClick = function()

AB.ToggleVar( var, vartext )

end



end



function AB.MakeFunctionButton( parent, x, y, btext, func, tooltip)

if !parent:IsValid() then return end



local TButton = vgui.Create( "DButton" )

TButton:SetParent( parent )  

TButton:SetPos( x, y )

TButton:SetText( btext )

TButton:SetTextColor( Color(255, 255, 255, 255) )

TButton:SetSize( 110, 25 )

if tooltip != nil then TButton:SetToolTip( tooltip ) end



TButton.Paint = function( self, w, h )

    surface.SetDrawColor( Color(60, 60, 90, 200) )

    TButton:SetText( btext )

    surface.DrawRect( 0, 0, w, h )

    surface.SetDrawColor( o_color1 )

    surface.SetMaterial( downgrad )

    surface.DrawTexturedRect( 0, 0, w, h/ 2 )



    surface.SetDrawColor( Color(100, 100, 100, 255) )

    surface.DrawOutlinedRect( 0, 0, w, h )

end





TButton.DoClick = function()

func()

end



end



function AB.MakeFloatingButton( x, y, btext, func)

local TButton = vgui.Create( "DButton" )

TButton:SetPos( x, y )

TButton:SetText( btext )

TButton:SetTextColor( Color(255, 255, 255, 255) )

TButton:SetSize( 110, 25 )



TButton.Paint = function( self, w, h )

    surface.SetDrawColor( Color(60, 60, 90, 200) )

    TButton:SetText( btext )

    surface.DrawRect( 0, 0, w, h )

    surface.SetDrawColor( Color(100, 100, 100, 255) )

    surface.DrawOutlinedRect( 0, 0, w, h )

end





TButton.DoClick = function()

func()

end

return TButton

end



function AB.MakeSlider( parent, x, y, length, text, min, max, var )

if !parent:IsValid() then return end



local sbg = vgui.Create( "DPanel" )

sbg:SetParent( parent )

sbg:SetPos( x, y )

sbg:SetSize( length, 25 )



sbg.Paint = function( self, w, h ) -- Paint function

    surface.SetDrawColor( 50, 50, 90, 255 )

    surface.DrawRect(0, 0, w, h )

    surface.SetDrawColor( o_color1 )

    surface.SetMaterial( downgrad )

    surface.DrawTexturedRect( 0, 0, w, h/ 2 )

    surface.SetDrawColor( 50, 50, 90, 255 )

    surface.DrawOutlinedRect(0, 0, w, h )



end



local NumSlider = vgui.Create( "DNumSlider", sbg )

NumSlider:SetPos( 10,-5 )

NumSlider:SetWide( length - 10 )

NumSlider:SetText( text )

NumSlider:SetMin( min )

NumSlider:SetMax( max )

NumSlider:SetValue( AB.NumberVars[var] )

NumSlider:SetDecimals( 0 )

NumSlider.OnValueChanged = function( panel, val ) AB.NumberVars[var] = math.floor(val) end



end



function AB.MakeKeyBinder( parent, x, y, length, height, keyvar, changetxt )



local binder = vgui.Create( "DBinder", parent )

binder:SetSize( length, height )

binder:SetPos( x, y )

binder:SetTextColor( Color(255,255,255) )

binder:SetSelected( AB.NumberVars[keyvar] )

binder.Paint = function( self, w, h )

    surface.SetDrawColor( Color(60, 60, 90, 200) )

    surface.DrawRect( 0, 0, w, h )

    surface.SetDrawColor( o_color1 )

    surface.SetMaterial( downgrad )

    surface.DrawTexturedRect( 0, 0, w, h/ 2 )



    surface.SetDrawColor( Color(100, 100, 100, 255) )

    surface.DrawOutlinedRect( 0, 0, w, h )

end

function binder:SetSelectedNumber( num )

    AB.ChatText( "Set new "..changetxt.." bind key", Color(255,255,255) )

    self.m_iSelectedNumber = num

    AB.NumberVars[keyvar] = num

end



end



------------------------------------------------------------------------ACEBOT MENU--------------------------------------------------------------------------------------





function AB.Menu()



if AceMenu then return false end



local AceMenu = vgui.Create("DFrame")

AceMenu:SetSize(500,700)

AceMenu:SetTitle("Acebot - A component of Project Odium                    Edited by NotWill")

AceMenu:Center()

AceMenu:MakePopup()



AceMenu.Paint = function( panel, w, h )



surface.SetDrawColor( Color(50, 50, 90, 255) )

surface.DrawRect( 0, 0, w, h )



surface.SetDrawColor( o_color1 )

surface.SetMaterial( upgrad )

surface.DrawTexturedRect( 0, h / 2, w, h / 2 )



surface.SetDrawColor( o_color1 )

surface.SetMaterial( downgrad )

surface.DrawTexturedRect( 0, 0, w, h/ 2 )



surface.SetDrawColor( o_color2 )

surface.DrawOutlinedRect( 0, 0, w, h )

surface.DrawOutlinedRect( 1, 1, w - 2, h - 2 )

end





local PropertySheet = vgui.Create( "DPropertySheet" )

PropertySheet:SetParent( AceMenu )

PropertySheet:SetPos( 10, 30 )

PropertySheet:SetSize( 480, AceMenu:GetTall() - 40 )



PropertySheet.Paint = function()

    surface.SetDrawColor( Color(0, 0, 0, 200) )

    surface.DrawRect(0, 0, PropertySheet:GetWide(), PropertySheet:GetTall())

    for k, v in pairs(PropertySheet.Items) do

       if v.Tab then

           v.Tab.Paint = function(self,w,h)

              draw.RoundedBox(0, 0, 0, w, h, Color(50,90,120))

           end

        end

    end

end





--------------------------------------------Tabs-------------------------------------------





local General = vgui.Create( "DPanel" )

General:SetPos( 0, 0 )

General:SetSize( 480, AceMenu:GetTall() - 40 )



General.Paint = function() -- Paint function

    surface.SetDrawColor(50, 50, 50 ,255)

    surface.DrawOutlinedRect(0, 0, General:GetWide(), General:GetTall())

    surface.SetDrawColor(0, 0, 0 ,200)

    surface.DrawRect(0, 0, General:GetWide(), General:GetTall())

    surface.SetDrawColor( 50, 50, 90, 255 )

    surface.DrawRect(0, 40, General:GetWide(), 2)

end



local Utility = vgui.Create( "DPanel" )

Utility:SetPos( 0, 0 )

Utility:SetSize( 480, AceMenu:GetTall() - 40 )



Utility.Paint = function() -- Paint function

    surface.SetDrawColor(50, 50, 50 ,255)

    surface.DrawOutlinedRect(0, 0, Utility:GetWide(), Utility:GetTall())

    surface.SetDrawColor(0, 0, 0 ,200)

    surface.DrawRect(0, 0, Utility:GetWide(), Utility:GetTall())

end



local Botsettings = vgui.Create( "DPanel" )

Botsettings:SetPos( 0, 0 )

Botsettings:SetSize( 480, AceMenu:GetTall() - 40 )



Botsettings.Paint = function() -- Paint function

    surface.SetDrawColor(50, 50, 50 ,255)

    surface.DrawOutlinedRect(0, 0, Botsettings:GetWide(), Botsettings:GetTall())

    surface.SetDrawColor(0, 0, 0 ,200)

    surface.DrawRect(0, 0, Botsettings:GetWide(), Botsettings:GetTall())

end



local Debug = vgui.Create( "DPanel" )

Debug:SetPos( 0, 0 )

Debug:SetSize( 480, AceMenu:GetTall() - 40 )



Debug.Paint = function() -- Paint function

    surface.SetDrawColor(50, 50, 50 ,255)

    surface.DrawOutlinedRect(0, 0, Debug:GetWide(), Debug:GetTall())

    surface.SetDrawColor(0, 0, 0 ,200)

    surface.DrawRect(0, 0, Debug:GetWide(), Debug:GetTall())

    if AB.MemoryDebug then

        draw.DrawText( "Visuals Memory Usage: "..AB.MemoryDebug["hud"].."kb", "Default", 10, 530, Color(255,255,255) )

        draw.DrawText( "Logic Core Memory Usage: "..AB.MemoryDebug["logic"].."kb", "Default", 10, 545, Color(255,255,255) )

        draw.DrawText( "Aimbot Core Memory Usage: "..AB.MemoryDebug["aimbot"].."kb", "Default", 10, 560, Color(255,255,255) )

        surface.SetDrawColor(100, 100, 200 ,255)

        surface.DrawRect(250, 532, math.Clamp( AB.MemoryDebug["hud"] * 0.75, 0, 200), 10 )

        surface.DrawRect(250, 547, math.Clamp( AB.MemoryDebug["logic"] * 20, 0, 200), 10 )

        surface.DrawRect(250, 562, math.Clamp( AB.MemoryDebug["aimbot"] * 20, 0, 200), 10 )

        surface.SetDrawColor(150, 150, 250 ,255)

        surface.DrawOutlinedRect(250, 532, 200, 10 )

        surface.DrawOutlinedRect(250, 547, 200, 10 )

        surface.DrawOutlinedRect(250, 562, 200, 10 )

    end

end





--------------------------------------------Buttons-------------------------------------------





function AB.RefreshConsole()

if richtext then richtext:Remove() end

if !ValidPanel(Debug) then return end

richtext = vgui.Create( "RichText", Debug )

richtext:SetPos(5, 5)

richtext:SetSize( 440, AceMenu:GetTall() - 180 )



for idx, tab in pairs(AB.Debug) do

    richtext:InsertColorChange( tab[2].r, tab[2].g, tab[2].b, 255 )

    richtext:AppendText( tab[1].."\n" )

end

end



timer.Create("ab_refreshconsole", 1, 0, function() AB.RefreshConsole() end)





AB.MakeToggleButton( General, 5, 10, "Vision", "Vision", "Vision Mode")



AB.MakeSlider( General, 5, 590, 455, "Max Vision Range (Metres)", 0, 2000, "VisionDist" )



AB.MakeToggleButton( General, 5, 70, "ESP Enabled", "ShowESP", "Show ESP")

AB.MakeToggleButton( General, 120, 70, "Show Dead Players", "ShowDead", "Show Dead Players")

AB.MakeToggleButton( General, 235, 70, "Show Friends", "ShowFriends", "Show Friends")

AB.MakeToggleButton( General, 350, 70, "Radar Colours", "RadarColors", "Coloured players on radar")

AB.MakeToggleButton( General, 350, 100, "Show Traitors", "ShowTraitors", "Show Traitors (TTT)", "Controls whether the ESP shows known traitors in the TTT gamemode")

AB.MakeToggleButton( General, 235, 100, "Highlight Targets", "ShowTargets", "Highlight Targets", "Highlights people that are on your targets list")

AB.MakeToggleButton( General, 120, 100, "Show Admins", "ShowRanks", "Show Admins")

AB.MakeToggleButton( General, 5, 100, "Show Distance", "ShowDistance", "Show Distance")

AB.MakeToggleButton( General, 5, 130, "Highlight Props", "ESPProps", "ESP Highlight Props")

AB.MakeToggleButton( General, 120, 130, "Show Marked Ents", "Entfinder", "ESP Show Marked Ents")

AB.MakeToggleButton( General, 235, 130, "Show Team Colours", "TeamColors", "Show Team Colours")

AB.MakeToggleButton( General, 350, 130, "Show Health", "ShowHP", "Show Health")

AB.MakeToggleButton( General, 5, 490, "Vision Lines", "Vizlines", "Shows which direction players are looking")

AB.MakeToggleButton( General, 120, 490, "Add Steam Friends", "AutoAddSteamFriends", "Automatically add steam friends to your ESP")

AB.MakeToggleButton( General, 5, 160, "Show Position", "VSquares", "Show player positions on the esp")

AB.MakeToggleButton( General, 120, 160, "Show Names", "VNames", "Show player names on the esp")



AB.MakeToggleButton( General, 5, 190, "Rear Vision Mirror", "Mirror", "Rear Vision Mirror")



AB.MakeSlider( General, 5, 225, 225, "Mirror X", 0, ScrW(), "MirrorX" )

AB.MakeSlider( General, 235, 225, 220, "Mirror Y", 0, ScrH(), "MirrorY" )

AB.MakeSlider( General, 235, 190, 220, "Mirror Size", 0, 60, "MirrorSize" )

AB.MakeFunctionButton( General, 120, 190, "Mirror Vertical Axis", function()

if AB.NumberVars.MirrorAxis == 0 then

if AB.Vars.Notifications then AB.ChatText( "Set mirror axis mode to mimic", Color(255,255,255) ) end

AB.NumberVars.MirrorAxis = 1

elseif AB.NumberVars.MirrorAxis == 1 then

if AB.Vars.Notifications then AB.ChatText( "Set mirror axis mode to reverse", Color(255,255,255) ) end

AB.NumberVars.MirrorAxis = 2

else

if AB.Vars.Notifications then AB.ChatText( "Set mirror axis mode to none", Color(255,255,255) ) end

AB.NumberVars.MirrorAxis = 0

end

end)



AB.MakeFunctionButton( General, 5, 260, "Toggle Freecam", function() 

    AB.Freecam = !AB.Freecam

    AB.ChatText( "Set freecam mode to: "..tostring(AB.Freecam), Color(255,255,255) )

end, "Hijacks the rear vision mirror and turns it into a ghetto freecam system")

AB.MakeFunctionButton( General, 120, 260, "Bring Freecam Here", function() 

    AB.FreecamCoordinates.pos = LocalPlayer():EyePos() 

    AB.FreecamCoordinates.ang = LocalPlayer():EyeAngles()

    AB.ChatText( "Brought freecam to my eye pos", Color(255,255,255) )

end, "Snaps the freecam to your view position")

AB.MakeToggleButton( General, 120, 290, "Freecam Is Movable", "FreecamControls", "Freecam controls active")





AB.MakeKeyBinder(General, 400, 260, 50, 20, "FreecamForward", "freecam move forward" )

AB.MakeKeyBinder(General, 400, 290, 50, 20, "FreecamBack", "freecam move backwards" )

AB.MakeKeyBinder(General, 235, 275, 50, 20, "FreecamLeft", "freecam turn left" )

AB.MakeKeyBinder(General, 345, 275, 50, 20, "FreecamRight", "freecam turn right" )

AB.MakeKeyBinder(General, 290, 260, 50, 20, "FreecamUp", "freecam pitch up" )

AB.MakeKeyBinder(General, 290, 290, 50, 20, "FreecamDown", "freecam pitch down" )



AB.MakeToggleButton( General, 5, 320, "Player Radar", "Radar", "Player Radar")

AB.MakeSlider( General, 120, 320, 165, "Radar Size", 50, 600, "RadarSize" )

AB.MakeSlider( General, 290, 320, 165, "Radar Zoom", 10, 150, "RadarZoom" )

AB.MakeSlider( General, 5, 350, 145, "Radar X", 0, ScrW(), "RadarX" )

AB.MakeSlider( General, 155, 350, 145, "Radar Y", 0, ScrH(), "RadarY" )

AB.MakeSlider( General, 305, 350, 150, "Rad Alpha", 0, 255, "RadarAlpha" )



AB.MakeToggleButton( General, 5, 390, "Xray Enabled", "Xray", "X-Ray")

AB.MakeToggleButton( General, 120, 390, "Xray Players", "XrayPlayers", "Show players on X-Ray")

AB.MakeToggleButton( General, 235, 390, "Xray Props", "XrayProps", "Show props on X-Ray")

AB.MakeToggleButton( General, 350, 390, "Xray Marked Ents", "XrayEntfinder", "Show marked entities on X-Ray")

AB.MakeToggleButton( General, 5, 420, "Xray Solid Chams", "XraySolid", "X-Ray Solid Chams")

AB.MakeSlider( General, 5, 450, 465, "Xray Maximum Distance (metres)", 0, 2000, "XrayDistance" )

AB.MakeToggleButton( General, 120, 420, "Xray Colours", "NoChamColours", "Xray Colours")

AB.MakeToggleButton( General, 235, 420, "Xray Bright Colours", "PKChams", "Xray Bright Chams")





AB.MakeToggleButton( Utility, 5, 480, "Witness Detector", "WitnessDetector", "Witness Detector")

AB.MakeToggleButton( Utility, 120, 480, "Spectator Detector", "SpectatorDetector", "Spectator Detector")

AB.MakeToggleButton( General, 120, 550, "Crosshair", "Crosshair", "Crosshair")

AB.MakeToggleButton( General, 235, 490, "Draw 3D BBox", "BoundingBox3d", "3D Bounding Boxes on Players")

AB.MakeFunctionButton( General, 235, 550, "Wraith Vision", function() AB.ToggleWraithVision() end)

AB.MakeToggleButton( General, 120, 520, "PK Player Beams", "PKPlayerBeams", "Propkill Playertrace Beams")

AB.MakeToggleButton( General, 235, 520, "PK Prop Beams", "PKPropBeams", "Propkill Proptrace Beams")

AB.MakeToggleButton( General, 350, 520, "PK Vertical Beams", "PKVerticalBeams", "Propkill Vertical Beams")

AB.MakeToggleButton( General, 5, 550, "PK Show Velocity", "PKVelocity", "Propkill Velocity Leaders")

AB.MakeToggleButton( General, 350, 550, "Clientside Flashlight", "CSFlashlight", "Clientside Flashlight")



AB.MakeFunctionButton( General, 350, 10, "Players Menu", function() AB.PlayerMenu() end)

AB.MakeFunctionButton( General, 120, 10, "Cycle Color Scheme", function()

    if AB.NumberVars.ColorScheme < #AB.DefaultSchemes then

        AB.NumberVars.ColorScheme = AB.NumberVars.ColorScheme + 1

    else

        AB.NumberVars.ColorScheme = 1

    end



    AB.ChangeColorScheme( AB.NumberVars.ColorScheme )

end)

AB.MakeFunctionButton( General, 235, 10, "Ent marker menu", AB.EntMarkerMenu )



AB.MakeToggleButton( Utility, 5, 10, "Autoclick", "Autoclick", "Auto Mouse Click", "Make your mouse buttons fire at the maximum possible speed when holding them down")

AB.MakeToggleButton( Utility, 120, 10, "Bhop", "Bhop", "Auto Bhop")

AB.MakeToggleButton( Utility, 235, 10, "Rope-Nado", "RopeStorm", "Rope-Nado", "Right click with rope tool out to spam a fuckton of ropes")

AB.MakeToggleButton( Utility, 350, 10, "Triggerbot", "Triggerbot", "Triggerbot", "Automatically pull the trigger when you look at somebody")

AB.MakeToggleButton( Utility, 5, 40, "Third Person", "Thirdperson", "Third Person Camera")

--AB.MakeToggleButton( Utility, 5, 120, "Camera Spam", "CameraSpam", "Camera Spam")

AB.MakeToggleButton( Utility, 120, 120, "No Recoil", "NoRecoil", "No Recoil", "Prevents weapons from changing your eye angles")

AB.MakeToggleButton( Utility, 235, 120, "Flashlight Spam", "FlashlightSpam", "Flashlight Spam", "Press F to party hard")

AB.MakeSlider( Utility, 120, 40, 160, "TPS Distance", 0, 1000, "TPSDistance" )

AB.MakeSlider( Utility, 285, 40, 175, "TPS Offset", -100, 100, "TPSOffset" )



AB.MakeToggleButton( Utility, 5, 90, "Name Changer Script", "NameStealer", "Name Change Script", "Enables or disabled the name change helper script, corrects malfunctions present in odiums name change command")

AB.MakeFunctionButton( Utility, 350, 90, "Disable NameStealer", AB.NameStealerShutoff )



AB.MakeFunctionButton( Utility, 5, 150, "Inspect your Gun", AB.GunMenu, "Show a massive TLDR page of information about the gun in your hands" )

AB.MakeFunctionButton( Utility, 120, 150, "Entity Scanner", AB.ToggleEntityScanner, "Get detailed information and easily perform actions on entities under your cursor (use C menu for best effect)" )



AB.MakeToggleButton( Utility, 350, 120, "Notify Kills", "NotifyKills", "Notify Kills in Chat", "Prints kills to your chat window")

--AB.Vars.NotifyKills



AB.MakeToggleButton( Utility, 5, 210, "Chat Spammer", "ChatSpam", "Chat Spammer", "Spam chat and piss everybody off")

AB.MakeToggleButton( Utility, 120, 210, "Auto OOC", "ChatSpamOOC", "Auto OOC chatspam", "Automatically make your chat spam in OOC mode in darkrp and most other rp gamemodes")

AB.MakeToggleButton( Utility, 235, 210, "Bind Mode", "ChatSpamBind", "Bind Mode (L ALT)", "You only chatspam when left alt is pressed")

--AB.MakeToggleButton( Utility, 350, 210, "Random Insults", "ChatSpamInsult", "Chatspam Random Insults", "Shower randomly generated abuse on everybody")

AB.MakeToggleButton( Utility, 350, 180, "/PM Mode", "ChatSpamPM", "/PM Spam Mode", "Spams /pm messages to everybody on the server")

AB.MakeToggleButton( Utility, 350, 210, "/PM Admins", "ChatSpamPMAdmins", "/PM Spam Target Admins", "Should we /pm spam admins?")



AB.MakeFunctionButton( Utility, 235, 180, "Chatspam Help", function() 

    AB.ChatText( "Printed chatspam formatting info to console", Color(255,255,255) )

    print( "---- CHAT SPAMMER PATTERN MATCHES ----" )

    print( "@1 = Random insult" )

    print( "@2 = Angry insult" )

    print( "@3 = Admin insult" )

    print( "@4 = CSGO skid gibberish" )

    print( "@opener = Insult opening line" )

    print( "@joiner = Insult joining line" )

    print( "@slur = Random racist/sexist/fucking hilarious slur" )

    print( "PUT THESE IN THE CHATSPAMMER TEXT FIELD AND THEY WILL BE AUTOMATICALLY FORMATTED INTO RANDOMLY GENERATED TEXT")

end, "HALP HOW I USE DIS" )



AB.MakeFunctionButton( Utility, 5, 300, "Dodge RP Admins", AB.InnocentRoleplayer, "You got seen doing something shifty, now its time to get a new identity\nSuicides and randomizes your rpname, job and player colours\nBind a key to ace_innocent_roleplayer to trigger quickly" )

AB.MakeFunctionButton( Utility, 120, 300, "Random RPname", AB.GenerateRPName, "Like you can be arsed thinking up a good rpname, this one will generate a random one for you" )

AB.MakeFunctionButton( Utility, 235, 300, "RandomRPname (fem)", AB.GenerateRPNameFemale, "You want to become a girl so you can take cocks up your ass and still call yourself straight" )

AB.MakeToggleButton( Utility, 5, 330, "RP Demote Spam", "DemoteSpam", "Spam /Demote requests", "Demote everybody on the server from their shitty jobs")

AB.MakeToggleButton( Utility, 120, 330, "RP Wanted Spam", "WantedSpam", "Spam /Wanted requests", "Make everybody wanted by the police")

AB.MakeToggleButton( Utility, 235, 330, "ULX Vkick Spam", "ULXVotekickSpam", "Spam ulx votekicks", "Votekick everybody on the server :^)")

AB.MakeToggleButton( Utility, 350, 330, "ULX Vban Spam", "ULXVotebanSpam", "Spam ulx votebans", "Voteban everybody on the server :^)")

AB.MakeToggleButton( Utility, 5, 360, "Bhop Auto Strafe", "BhopAutostrafe", "Bhop Auto Strafe", "Presses A and D for you when you move your mouse, you lazy fuck")

AB.MakeToggleButton( Utility, 120, 360, "Kill Taunts", "KillTaunts", "Kill Taunts", "Let acebot automatically talk smack for you whenever you kill somebody")

AB.MakeToggleButton( Utility, 235, 360, "Death Taunts", "DeathTaunts", "Death Taunts", "Automatic chat rage when you die")



AB.MakeFunctionButton( Utility, 5, 450, "Set Base", function() RunConsoleCommand("ace_base_set") end, "Set a home base location to warn you if people go near it" )

AB.MakeFunctionButton( Utility, 120, 450, "Remove Base", function() RunConsoleCommand("ace_base_remove") end, "Delete your base" )

AB.MakeToggleButton( Utility, 350, 420, "Keypad Jew", "KeypadJew", "Keypad Code Stealer", "Your a sneaky jew stealing peoples keypad codes and busting into their base")



AB.MakeToggleButton( Utility, 5, 420, "RP Arrest Dodger", "DodgeArrest", "Get out of jail free card", "Automatically suicide if somebody tries to hit you with an arrest baton")

AB.MakeToggleButton( Utility, 120, 420, "New RPname on Death", "NewLifeRule", "Choose new RPname when killed", "Make things extra confusing for cuntmins")

--AB.MakeToggleButton( Utility, 235, 420, "Dodge Physgun", "DontTouchMeThere", "Suicide When PhysGunned", "Don't touch me there, that's my private place")





AB.MakeToggleButton( Botsettings, 5, 10, "Toggle Aimbot", "Aimbot", "Aimbot", "Sup pussy ass white boi how bout i come to ur base and fuck ur girl u little bitch, imma shoot lazers all up in this place pew pew nigga")

AB.MakeToggleButton( Botsettings, 120, 10, "Snap on Shoot Only", "SnapOnFire", "Aimbot only snaps when firing", "Makes things a little bit more sneeki breeki")

AB.MakeToggleButton( Botsettings, 5, 40, "Auto Shoot", "AutoShoot", "Aimbot Auto-Shoot", "Your aimbot is now doing all the work for you, you may as well afk and masturbate")

AB.MakeToggleButton( Botsettings, 235, 70, "Auto Trigger", "AutoTrigger", "Aimbot Auto-Trigger", "Spams the trigger on semi auto weapons when locked on and holding left click")

AB.MakeToggleButton( Botsettings, 120, 40, "Snap on Bind Only", "AimbotBindMode", "Aimbot snap only when bind pressed", "Extra protection against accidentally fucking yourself over when trying to play >legit")

--AB.MakeToggleButton( Botsettings, 235, 40, "Shoot Through Walls", "AimbotShootThroughWalls", "Aimbot shoot through walls", "Target people through walls?")

AB.MakeToggleButton( Botsettings, 235, 40, "M9K Wallbanger", "AimbotWallbanger", "Aimbot shoot through walls (m9k)", "Lock on to people if the current gun is able to penetrate the wall/object they are hiding behind")

AB.MakeToggleButton( Botsettings, 235, 10, "Draw Target Position", "PreviewTarget", "Draw Target Lock Position", "Shows the current/next position the aimbot is locking on to")

AB.MakeToggleButton( Botsettings, 350, 10, "Compensate Spread", "CompSpread", "Compensate Bullet Spread", "Basically cac undetected nospread. Works with m9k, hl2 weps, ttt weps and some simple weapon bases.  Does not work with fas2 or cw2")

AB.MakeToggleButton( Botsettings, 350, 40, "Silent Aim", "SilentAim", "Silent Aim", "Makes it far less obvious that you are aimbotting")

AB.MakeToggleButton( Botsettings, 350, 70, "Adaptive Targeting", "AimbotAdaptiveTarget", "Aimbot Adaptive Targeting", "Shoot at any part of their body that is exposed, not just their head.  Absolute rape when paired with comp spread and wallbanger")



AB.MakeToggleButton( Botsettings, 5, 160, "Target Friends", "TargetFriends", "Aimbot Target Friends", "Do you really want to betray your buddies like this? :(")

AB.MakeToggleButton( Botsettings, 120, 160, "Target Admins", "TargetAdmins", "Aimbot Target Admins", "Milk some darkrp admin tears")

AB.MakeToggleButton( Botsettings, 235, 160, "Target Same Team", "TargetSameTeam", "Aimbot Target Same Team", "Do you want to betray your team?")

AB.MakeToggleButton( Botsettings, 350, 160, "Target Highlighted", "TargetHighlighted", "Aimbot Target Highlighted targets", "For killing those special high priority targets")

AB.MakeToggleButton( Botsettings, 120, 190, "Target Noclippers", "TargetNoclippers", "Aimbot Target People in Noclip", "You usually can't kill them anyway so why bother?")

AB.MakeToggleButton( Botsettings, 5, 190, "Prefer Headshots", "AimbotTargetMode", "Aimbot Target Heads", "Target heads or go straight for centre of mass?")

AB.MakeToggleButton( Botsettings, 235, 190, "Sticky Targeting", "AimbotStickyLock", "Sticky Targeting", "Aimbot will not switch target until the current target is dead, out of FOV or no longer visible")

--AB.MakeToggleButton( Botsettings, 5, 190, "Prefer Headshots", "AimbotTargetMode", "Aimbot Target Heads", "Target heads or go straight for centre of mass?")





local tttt = vgui.Create( "DLabel", Botsettings )

tttt:SetPos( 25, 228 )

tttt:SetText( "Aimbot Bind Key:" )

tttt:SizeToContents()



AB.MakeKeyBinder( Botsettings, 120, 220, 110, 30, "AimbotBindKey", "aimbot" )



AB.MakeSlider( Botsettings, 5, 70, 210, "Smooth Aim", 0, 50, "AimbotSmooth" )

AB.MakeSlider( Botsettings, 5, 100, 210, "Max Distance", 0, 9999, "AimbotDist" )

AB.MakeSlider( Botsettings, 225, 100, 220, "Targeting FOV", 0.1, 180, "AimbotMaxFOV" )





local TextEntry = vgui.Create( "DTextEntry", Utility )

TextEntry:SetPos( 120, 90 )

TextEntry:SetSize( 195, 25 )

TextEntry:SetText( AB.NameStealName )

TextEntry.OnEnter = function( self )

AB.NameStealName = self:GetValue()

if AB.Vars.Notifications then AB.ChatText( "Set my name to: "..self:GetValue(), Color(255,255,255) ) end

end



local TextEntry = vgui.Create( "DTextEntry", Utility )

TextEntry:SetPos( 5, 240 )

TextEntry:SetSize( 450, 25 )

TextEntry:SetText( AB.ChatSpamText )

TextEntry.OnEnter = function( self )

AB.ChatSpamText = self:GetValue()

if AB.Vars.Notifications then AB.ChatText( "Set my chatspam message to: "..self:GetValue(), Color(255,255,255) ) end

end





AB.MakeFunctionButton( Debug, 5, AceMenu:GetTall() - 110, "Clear Console", function() table.Empty(AB.Debug) end)

AB.MakeFunctionButton( Debug, 120, AceMenu:GetTall() - 110, "Print Changelog", function() 

    AB.DebugLog( "", Color(0,0,0) )

    AB.DebugLog( "Acebot current version: "..AB.Version, Color(155,255,155) )

    AB.DebugLog( "", Color(0,0,0) )

    local tt = 200

    for k, v in SortedPairs(AB.Changelog, false) do AB.DebugLog( v, Color(tt, tt, tt + 30) ) tt = math.Clamp(tt - 10, 100, 200) end 

end)

--AB.MakeFunctionButton( Debug, 235, Menu:GetTall() - 110, "Game Event Logging", function() end)

--AB.MakeFunctionButton( Debug, 350, Menu:GetTall() - 110, "Extensive Logging", function() end)



PropertySheet:AddSheet( "Vision", General, "icon16/zoom.png", false, false, "ESP/Xray/HUD settings" )

--PropertySheet:AddSheet( "Vision Advanced", General2, "icon16/zoom_in.png", false, false, "ESP/Xray/HUD settings" )

PropertySheet:AddSheet( "Utility", Utility, "icon16/wrench.png", false, false, "Tools and utilities" )

PropertySheet:AddSheet( "Aimbot", Botsettings, "icon16/bomb.png", false, false, "Aimbot settings" )

PropertySheet:AddSheet( "Exploit", Exploit, "icon16/bug.png", false, false, "Lua Exploit settings" )

PropertySheet:AddSheet( "Backdoor", Backdoor, "icon16/door_in.png", false, false, "Control panel for the Wraithnet/HTX serverside backdoor" )

PropertySheet:AddSheet( "Debug", Debug, "icon16/printer.png", false, false, "Acebot debug settings" )



end

concommand.Add("ace_menu", AB.Menu)





------------------------------------------------------------------------DEBUG CONSOLE SHIT--------------------------------------------------------------------------------------







function AB.DebugLog( str, col )

table.insert(AB.Debug, {str, col})

if #AB.Debug > 40 then

    table.remove( AB.Debug, 1 )

end

end



------------------------------------------------------------------------ENT MARKER MENU--------------------------------------------------------------------------------------















local OtherEnts = {}



function AB.EntMarkerMenu()

if EMenu then return end



table.Empty(OtherEnts)

for k,v in pairs(ents.GetAll()) do

    local addToAllEnts = true

            

    for i,p in pairs(AB.MarkedEnts) do

        if p == v:GetClass() then

            addToAllEnts = false

        end

    end

            

    for i,p in pairs(OtherEnts) do

        if p == v:GetClass() then

            addToAllEnts = false

        end

    end

            

    if addToAllEnts then

        table.insert(OtherEnts, v:GetClass())

    end

end



local EMenu = vgui.Create("DFrame")

EMenu:SetSize(500,485)

EMenu:SetTitle("Entity marker menu")

EMenu:Center()

EMenu:MakePopup()



EMenu.Paint = function()

surface.SetDrawColor( Color(50, 50, 90, 255) )

surface.DrawRect( 0, 0, EMenu:GetWide(), EMenu:GetTall() )

surface.SetDrawColor( Color(155, 155, 155, 255) )

surface.DrawOutlinedRect( 0, 0, EMenu:GetWide(), EMenu:GetTall() )

surface.DrawOutlinedRect( 1, 1, EMenu:GetWide() - 2, EMenu:GetTall() - 2 )

surface.SetDrawColor( Color(0, 0, 0, 200) )

surface.DrawRect( 10, 25, EMenu:GetWide() - 20, EMenu:GetTall() - 35 )

end





DermaList = vgui.Create( "DPanelList", EMenu )

        DermaList:SetPos( 25,35 )

        DermaList:SetSize( 500, 400 )

        DermaList:SetSpacing( 75 )

        DermaList:EnableHorizontal( false )

        DermaList:EnableVerticalScrollbar( true )

        

        local SelectedEnts = vgui.Create("DListView")

        SelectedEnts:SetSize(220, 335)

        SelectedEnts:SetPos(0, 0)

        SelectedEnts:SetMultiSelect(false)

        SelectedEnts:AddColumn("Ents to show")

        for k,v in SortedPairs(AB.MarkedEnts, false) do

            SelectedEnts:AddLine(v)

        end

        SelectedEnts.DoDoubleClick = function(parent, index, list)

            table.remove(AB.MarkedEnts, index)

            EMenu:rebuildlists()

        end

        DermaList:Add(SelectedEnts)

        

        local AllEnts = vgui.Create("DListView")

        AllEnts:SetSize(220, 335)

        AllEnts:SetPos(230, 0)

        AllEnts:SetMultiSelect(false)

        AllEnts:AddColumn("Ents not to show")

        for k,v in SortedPairs(OtherEnts, false) do

            AllEnts:AddLine(v)

        end

        AllEnts.DoDoubleClick = function(parent, index, panel )

            table.insert(AB.MarkedEnts, OtherEnts[index])

            EMenu:rebuildlists()

        end

DermaList:Add(AllEnts)





function EMenu:rebuildlists()

    table.Empty(OtherEnts)

    for k,v in pairs(ents.GetAll()) do

        local addToAllEnts = true

            

        for i,p in pairs(AB.MarkedEnts) do

            if p == v:GetClass() then

                addToAllEnts = false

            end

        end

            

        for i,p in pairs(OtherEnts) do

            if p == v:GetClass() then

                addToAllEnts = false

            end

        end

            

        if addToAllEnts then

            table.insert(OtherEnts, v:GetClass())

        end

    end



    AllEnts:Clear()

    SelectedEnts:Clear()

    for k,v in SortedPairs(OtherEnts, false) do

        AllEnts:AddLine( v )

    end

    for k,v in SortedPairs(AB.MarkedEnts, false) do

        SelectedEnts:AddLine( v )

    end

end





AB.MakeFunctionButton( EMenu, 25, 380, "Find all Printers", function() 

    for k,v in pairs(ents.GetAll()) do 

        if string.find(v:GetClass(), "print") and !table.HasValue(AB.MarkedEnts, v:GetClass()) then 

            table.insert(AB.MarkedEnts, v:GetClass()) 

        end 

    end 

EMenu:rebuildlists()

end, "Finds everything that looks like a money printer")



AB.MakeFunctionButton( EMenu, 140, 380, "Find all Weapons", function() 

    for k,v in pairs(ents.GetAll()) do 

        if (string.find(v:GetClass(), "weap") or string.find(v:GetClass(), "fas2") or string.find(v:GetClass(), "m9k")) and !table.HasValue(AB.MarkedEnts, v:GetClass()) then 

            table.insert(AB.MarkedEnts, v:GetClass()) 

        end 

    end 

EMenu:rebuildlists()

end, "Finds everything that looks like a weapon")



AB.MakeFunctionButton( EMenu, 255, 380, "Find all Vehicles", function() 

    for k,v in pairs(ents.GetAll()) do 

        if v:IsVehicle() and !table.HasValue(AB.MarkedEnts, v:GetClass()) then 

            table.insert(AB.MarkedEnts, v:GetClass()) 

        end 

    end 

EMenu:rebuildlists()

end, "Finds everything that looks like a vehicle")



AB.MakeFunctionButton( EMenu, 370, 380, "Find all Loot", function() 

    for k,v in pairs(ents.GetAll()) do 

        if (string.find(v:GetClass(), "item") or string.find(v:GetClass(), "loot")) and !table.HasValue(AB.MarkedEnts, v:GetClass()) then 

            table.insert(AB.MarkedEnts, v:GetClass()) 

        end 

    end 

EMenu:rebuildlists()

end, "Finds everything that looks like loot items (generally only useful for gmod dayz, after the end etc)")



AB.MakeFunctionButton( EMenu, 25, 410, "Find all RP Goodies", function() 

    for k,v in pairs(ents.GetAll()) do 

        if v:GetClass() == "spawned_shipment" or v:GetClass() == "spawned_money" or v:GetClass() == "spawned_weapon" or v:GetClass() == "spawned_ammo" or v:GetClass() == "spawned_food" and !table.HasValue(AB.MarkedEnts, v:GetClass()) then 

            table.insert(AB.MarkedEnts, v:GetClass() ) 

        end 

    end 

EMenu:rebuildlists()

end, "Finds all darkrp goodies (guns, money, shipments etc)")



AB.MakeFunctionButton( EMenu, 370, 410, "Clear List", function() 

AB.MarkedEnts = {}

EMenu:rebuildlists()

end, "Clears the entfinder list")



local turd = vgui.Create( "DLabel", EMenu )

turd:SetPos( 25, 447 )

turd:SetText( "Search for classes: " )

turd:SizeToContents()



local target4 = vgui.Create( "DTextEntry", EMenu )

target4:SetPos( 125, 442 )

target4:SetSize( 255, 25 )

target4:SetText( "" )

target4.OnChange = function( self )

    local nam = self:GetValue()

    if nam == "" then 

        AB.MarkedEnts = {}

        EMenu:rebuildlists()

        return

    end

    local namtab = string.Explode( ", ", nam )

    AB.MarkedEnts = {}

    for _, en in pairs( ents.GetAll() ) do

        for _, s in pairs( namtab ) do

            if string.find( string.lower( en:GetClass() ), s, 1, true ) then

                if !table.HasValue( AB.MarkedEnts, en:GetClass() ) then table.insert( AB.MarkedEnts, en:GetClass() ) end

            end

        end

    end

    EMenu:rebuildlists()

end



end

concommand.Add("ace_ents", AB.EntMarkerMenu)







------------------------------------------------------------------------PLAYERS MENU--------------------------------------------------------------------------------------





function AB.PlayerMenu()

if PMenu then return end



local PMenu = vgui.Create("DFrame")

PMenu:SetSize(590,420)

PMenu:SetTitle("Players menu")

PMenu:Center()

PMenu:MakePopup()



PMenu.Paint = function()

surface.SetDrawColor( Color(50, 50, 90, 255) )

surface.DrawRect( 0, 0, PMenu:GetWide(), PMenu:GetTall() )

surface.SetDrawColor( Color(155, 155, 155, 255) )

surface.DrawOutlinedRect( 0, 0, PMenu:GetWide(), PMenu:GetTall() )

surface.DrawOutlinedRect( 1, 1, PMenu:GetWide() - 2, PMenu:GetTall() - 2 )

surface.SetDrawColor( Color(0, 0, 0, 200) )

surface.DrawRect( 10, 25, PMenu:GetWide() - 20, PMenu:GetTall() - 35 )

end





local Plist = vgui.Create( "DPanelList", PMenu )

Plist:SetSize( 560, 370 )

Plist:SetPadding( 5 )

Plist:SetSpacing( 5 )

Plist:EnableHorizontal( false )

Plist:EnableVerticalScrollbar( true )

Plist:SetPos( 10, 25 )

Plist:SetName( "" )



for k, v in pairs( player.GetAll() ) do

if v == LocalPlayer() then continue end



    local plypanel2 = vgui.Create( "DPanel" )

    plypanel2:SetPos( 0, 0 )

    plypanel2:SetSize( 480, 40 )

    plypanel2.Paint = function() -- Paint function

        draw.RoundedBoxEx(8,1,1,plypanel2:GetWide(),plypanel2:GetTall(),Color(0, 0, 0, 150), false, false, false, false)

        surface.SetDrawColor(Color(50, 50, 90, 255))

        surface.DrawOutlinedRect(1, 1, plypanel2:GetWide() - 1 , plypanel2:GetTall() - 1)

    end



    local plyname = vgui.Create( "DLabel", plypanel2 )

    plyname:SetPos( 15, 5 )

    plyname:SetFont( "Trebuchet18" )

    plyname:SetColor( team.GetColor(v:Team()) )

    plyname:SetText( "Name: "..v:Nick() )

    plyname:SetSize(180, 15)



    if AB.GetRank(v) != ( "user" or "guest" or "player" ) then

    local rtxt = vgui.Create( "DLabel", plypanel2 )

    rtxt:SetPos( 15, 20 )

    rtxt:SetFont( "Trebuchet18" )

    rtxt:SetColor( Color(255,100,0,255) )

    rtxt:SetText( "Rank: "..AB.GetRank(v) )

    rtxt:SetSize(180, 15)

    end



    local faggot = vgui.Create("DButton", plypanel2)

    faggot:SetSize( 45, 25 )

    faggot:SetPos( 250, 8 )

    faggot:SetText("Profile")

    faggot:SetTextColor(Color(255, 255, 255, 255))

    faggot.Paint = function(panel, w, h)

        surface.SetDrawColor(100, 100, 200 ,255)

        surface.DrawOutlinedRect(0, 0, w, h)

        surface.SetDrawColor(0, 0, 50 ,155)

        surface.DrawRect(0, 0, w, h)

    end

    faggot.DoClick = function()

        AB.ChatText( "Opened steam profile of: "..v:Nick().." ("..v:SteamID()..")", Color(255,255,255) )

        v:ShowProfile()

        surface.PlaySound("buttons/button7.wav")

    end



    local faggot = vgui.Create("DButton", plypanel2)

    faggot:SetSize( 45, 25 )

    faggot:SetPos( 300, 8 )

    faggot:SetText("Mute")

    faggot:SetTextColor(Color(255, 255, 255, 255))

    faggot.Paint = function(panel, w, h)

        if !v:IsValid() then return end

        if v:IsMuted() then

            surface.SetDrawColor(200, 100, 000 ,255)

        else

            surface.SetDrawColor(100, 100, 200 ,255)

        end

        surface.DrawOutlinedRect(0, 0, w, h)

        surface.SetDrawColor(0, 0, 50 ,155)

        surface.DrawRect(0, 0, w, h)

    end

    faggot.DoClick = function()

        v:SetMuted( !v:IsMuted() )

        if v:IsMuted() then AB.ChatText( "Voice muted: "..v:Nick(), Color(255,255,255) ) else AB.ChatText( "Unmuted: "..v:Nick(), Color(255,255,255) ) end

        surface.PlaySound("buttons/button7.wav")

    end



    local faggot = vgui.Create("DButton", plypanel2)

    faggot:SetSize( 60, 25 )

    faggot:SetPos( 350, 8 )

    faggot:SetText("Namesteal")

    faggot:SetTextColor(Color(255, 255, 255, 255))

    faggot.Paint = function(panel, w, h)

        if AB.NameStealPlayer == v then

            surface.SetDrawColor(100, 200, 100 ,255)

        else

            surface.SetDrawColor(100, 100, 200 ,255)

        end

        surface.DrawOutlinedRect(0, 0, w, h)

        surface.SetDrawColor(0, 0, 50 ,155)

        surface.DrawRect(0, 0, w, h)

    end

    faggot.DoClick = function()

        if AB.NameStealPlayer == v then AB.NameStealPlayer = LocalPlayer() AB.ChatText( "Cleared name stealer target", Color(255,255,255) ) return end

        AB.NameStealPlayer = v

        AB.ChatText( "Set name stealer target to: "..v:Nick(), Color(255,255,255) )

        surface.PlaySound("buttons/button7.wav")

    end



    local faggot = vgui.Create("DButton", plypanel2)

    faggot:SetSize( 60, 25 )

    faggot:SetPos( 415, 8 )

    faggot:SetText("Highlight")

    faggot:SetTextColor(Color(255, 255, 255, 255))

    faggot.Paint = function(panel, w, h)

        if AB.IsTarget( v ) then

            surface.SetDrawColor(100, 200, 100 ,255)

        else

            surface.SetDrawColor(100, 100, 200 ,255)

        end

        surface.DrawOutlinedRect(0, 0, w, h)

        surface.SetDrawColor(0, 0, 50 ,155)

        surface.DrawRect(0, 0, w, h)

    end

    faggot.DoClick = function()

        if AB.IsTarget( v ) then AB.RemoveTarget(v) else AB.AddTarget(v) end

        surface.PlaySound("buttons/button7.wav")

    end



    local faggot = vgui.Create("DButton", plypanel2)

    faggot:SetSize( 60, 25 )

    faggot:SetPos( 480, 8 )

    faggot:SetText("Friendly")

    faggot:SetTextColor(Color(255, 255, 255, 255))

    faggot.Paint = function(panel, w, h)

        if AB.IsFriend( v ) then

            surface.SetDrawColor(100, 200, 100 ,255)

        else

            surface.SetDrawColor(100, 100, 200 ,255)

        end

        surface.DrawOutlinedRect(0, 0, w, h)

        surface.SetDrawColor(0, 0, 50 ,155)

        surface.DrawRect(0, 0, w, h)

    end

    faggot.DoClick = function()

        if AB.IsFriend( v ) then AB.RemoveFriend(v) else AB.AddFriend(v) end

        surface.PlaySound("buttons/button7.wav")

    end





    Plist:AddItem( plypanel2 )



end





end

concommand.Add("ace_players", AB.PlayerMenu)















------------------------------------------------------------------------BIG MEMES----------------------------------------------------------------------------------------







function AB.IsMessagePooled( netmessage )

status, error = pcall(net.Start,netmessage)

return status

end









------------------------------------------------------------------------DANK NOSPREAD----------------------------------------------------------------------------------------







function AB.GetGenericCone( cmd )

    local ply = LocalPlayer()

    local gun = ply:GetActiveWeapon()

    if !gun.Primary or !gun.Primary.Cone then return Angle( 0, 0, 0 ) end

    local meme = gun.Primary.Cone

    local meme2 = Vector( meme, meme, meme )

    local cone = odium.engine.GetWeaponCone( cmd, ply:EyeAngles(), meme2 )

    return cone

end



function AB.GetM9kCone( cmd )

    local ply = LocalPlayer()

    local gun = ply:GetActiveWeapon()

    if !gun.Primary or !gun.Primary.Spread or !gun.Primary.IronAccuracy then return Angle( 0, 0, 0 ) end

    local meme = gun.Primary.Spread

    if (gun:GetIronsights() == true) and ply:KeyDown(IN_ATTACK2) then meme = gun.Primary.IronAccuracy end

    local meme2 = Vector( meme, meme, meme )

    local cone = odium.engine.GetWeaponCone( cmd, ply:EyeAngles(), meme2 )

    return cone

end





local td = {}

local function dospread()

    local ply = LocalPlayer()

    local gun = ply:GetActiveWeapon()

    local vel = ply:GetVelocity():Length()



    aim = ply:GetAimVector()

        

    if not ply.LastView then

        ply.LastView = aim

        ply.ViewAff = 0

    else

        ply.ViewAff = Lerp(0.25, ply.ViewAff, (aim - ply.LastView):Length() * 0.5)

        ply.LastView = aim

    end

    

    cone = gun.HipCone * (cr and 0.75 or 1) * (gun.dt.Bipod and 0.3 or 1)

        

    if gun.dt.Status == FAS_STAT_ADS then

        td.start = ply:GetShootPos()

        td.endpos = td.start + aim * 30

        td.filter = ply

        

        tr = util.TraceLine(td)

        

        if tr.Hit then

            return Angle(0,0,0)

        else

            cone = gun.AimCone

        end

    end

    

    return math.Clamp(cone + gun.AddSpread * (gun.dt.Bipod and 0.5 or 1) + (vel / 10000 * gun.VelocitySensitivity) * (gun.dt.Status == FAS_STAT_ADS and 0.25 or 1) + ply.ViewAff, 0, 0.09 + gun.MaxSpreadInc)



end





function AB.GetFags2Cone( cmd )

    local ply = LocalPlayer()

    local gun = ply:GetActiveWeapon()

    local newang = ply:GetPunchAngle()

    math.randomseed( CurTime() )

    local cuntcone = gun.CurCone



--    newang = newang + (Angle(math.Rand(-cuntcone, cuntcone), math.Rand(-cuntcone, cuntcone), 0) )



    return newang

--    return LocalPlayer():GetPunchAngle()

end



--hook.Remove( "EntityFireBullets", "Fags2lmao" )

/*

hook.Add( "EntityFireBullets", "Fags2lmao", function( ent, data )

    local me = LocalPlayer()

    local gun = me:GetActiveWeapon()

    local oldang = me:EyeAngles()

    math.randomseed(CurTime())

    local Dir3 = (me:GetPunchAngle() + Angle(math.Rand(-gun.CurCone, gun.CurCone), math.Rand(-gun.CurCone, gun.CurCone), 0) * 25)

    print( "hax"..tostring( me:EyeAngles() - Dir3) )

--    print( "hax: "..tostring(oldang + -AB.GetFags2Cone( me:GetCurrentCommand() )) )

--    me:SetEyeAngles( oldang + -AB.GetFags2Cone( me:GetCurrentCommand() ) )

end)

*/

local hl2guns = {

    ["weapon_smg1"] = Vector( 0.04362, 0.04362, 0.04362 ),

    ["weapon_ar2"] = Vector( 0.02618, 0.02618, 0.02618 ),

    ["weapon_shotgun"] = Vector( 0.08716, 0.08716, 0.08716 ),

    ["weapon_pistol"] = Vector( 0.00873, 0.00873, 0.00873 ) ,

}



function AB.GetHL2Cone( cmd )

    local ply = LocalPlayer()

    local gun = ply:GetActiveWeapon()

    local meme = hl2guns[gun:GetClass()]

    local cone = odium.engine.GetWeaponCone( cmd, ply:EyeAngles(), meme )

    return cone

end



function AB.GetCurrentWeaponCone( cmd )

    if !odium or !odium.engine or !odium.engine.GetWeaponCone then 

        AB.ChatText( "Odium main module not present or malfunctioning! Compensated spread will not work!", Color(255,100,0) ) 

        AB.Vars.CompSpread = false 

        return Angle( 0, 0, 0 )

    end

    local ply = LocalPlayer()

    local gun = ply:GetActiveWeapon()

    if hl2guns[gun:GetClass()] or gun:GetClass() == "weapon_pistol" then return AB.GetHL2Cone( cmd ) end

    if gun.Primary and gun.Primary.Spread and gun.Primary.IronAccuracy then return AB.GetM9kCone( cmd ) end

    if gun.HipCone then return AB.GetFags2Cone( cmd ) end

    if gun.Primary and gun.Primary.Cone then return AB.GetGenericCone( cmd ) end

    return Angle( 0, 0, 0 )

end





local penistration = {

    ["SniperPenetratedRound"] = 20,

    ["pistol"] = 9,

    ["357"] = 12,

    ["smg1"] = 14,

    ["ar2"] = 16,

    ["buckshot"] = 5,

    ["slam"] = 5,

    ["AirboatGun"] = 17,

}



function AB.GetM9gayPenetration( ply, gun, tr, testent )

    if !gun.Penetration then return false end

    local ammotyp = gun.Primary.Ammo

    local penindex = 14

    if penistration[ammotyp] then penindex = penistration[ammotyp] end

    if tr.MatType == MAT_METAL and ammotyp != "SniperPenetratedRound" then return false end

    penindex = penindex - 0.05 -- precaution so we don't botch extreme range shots



    local penissize = tr.Normal * penindex

    if (tr.MatType == MAT_GLASS or tr.MatType == MAT_PLASTIC or tr.MatType == MAT_WOOD or tr.MatType == MAT_FLESH or tr.MatType == MAT_ALIENFLESH) then

        penissize = tr.Normal * (penindex * 2)

    end



    local ntrace     = {}

    ntrace.endpos    = tr.HitPos + tr.Normal * 99999

    ntrace.start     = tr.HitPos + penissize

    ntrace.mask              = MASK_SHOT

    ntrace.filter    = {ply}

    local trace     = util.TraceLine(ntrace)



    if trace.StartSolid or ( trace.Entity and trace.Entity != testent ) then return false end



    return true



end





function AB.CanWeaponPenetrate( tr, testent )

    local ply = LocalPlayer()

    local gun = ply:GetActiveWeapon()

    if !ply:IsValid() or !gun or !gun:IsValid() then return false end

    if gun.Primary and gun.Primary.Spread and gun.Primary.IronAccuracy then return AB.GetM9gayPenetration( ply, gun, tr, testent ) end

    return false

end





function AB.IsBabyGod( ply )

    if !ply:IsValid() or !ply:Alive() or ply:InVehicle() then return false end

    if ply:GetRenderMode() == RENDERMODE_TRANSALPHA and ply:GetColor().a == 100 then 

        return true

    else

        return false

    end

end





function AB.SetPacketChoke( choke )

    if !odium or !odium.engine then return end

    if choke then 

        odium.engine.SetSendPacketEnabled( true )

        odium.engine.SetChokedPacketNum( 0 )

    else

        odium.engine.ResetSendPacket()

        odium.engine.ResetChokedPacketNum()

    end

end









/*

function AB.GetPenetrationStrength( tr ) --heh

    if !AB.CanWeaponPenetrate() then return 0 end

    local ply = LocalPlayer()

    local gun = ply:GetActiveWeapon()

    if !ply:IsValid() or !gun or !gun:IsValid() then return 0 end

    if gun.Primary and gun.Primary.Spread and gun.Primary.IronAccuracy then return AB.GetM9gayPenetration( ply, gun ) end

    return 0

end

*/



function AB.FixMove( cmd, safe )

    local move = Vector( cmd:GetForwardMove(), cmd:GetSideMove(), cmd:GetUpMove() )

    local speed = math.sqrt( move.x * move.x + move.y * move.y )

    local mang = move:Angle()

    local yaw = math.rad( cmd:GetViewAngles().y - AB.InternalFakeAngles.y + mang.y )

    cmd:SetForwardMove( (math.cos(yaw) * speed) * 1 )

    cmd:SetSideMove( math.sin(yaw) * speed )

end





------------------------------------------------------------------------AIMBOT FUNCTIONS--------------------------------------------------------------------------------------







local isfiring = false

local lastoldang = 0



function AB.AimbotCore( cmd )

    local ply = LocalPlayer()

 

    if !AB.Vars.SilentAim then AB.InternalFakeAngles = 0 end

    if lastoldang and isangle( lastoldang ) then

        cmd:SetViewAngles( lastoldang )

        lastoldang = 0

        AB.SetPacketChoke( false )

    end



    if !AB.Vars.Aimbot then

        lastoldang = 0

        AB.AimbotPreviewTarget = -1

        AB.AimbotTarget = game.GetWorld()

        return

    end



    if !AB.Vars.AimbotStickyLock then

        local closestfag = AB.GetClosestToCursor( true )

        if closestfag != AB.AimbotTarget then AB.AimbotTarget = closestfag end

    end



    local atarg = AB.AimbotTarget

    local pozzed = AB.PrepareForAStomping( atarg )



    if isvector( pozzed ) then AB.AimbotPreviewTarget = pozzed end



    -- negate target if they are invalid for whatever reason

    if !atarg:IsValid() or AB.IsDead( atarg ) or !AB.InFOV( atarg ) or !AB.CanTargetPlayer( atarg ) or (AB.ToMetric(ply:GetPos():Distance(atarg:GetPos())) >= AB.NumberVars.AimbotDist) or !isvector( pozzed ) then

        AB.AimbotPreviewTarget = -1

        AB.AimbotTarget = AB.GetClosestToCursor( true )

        AB.InternalFakeAngles = 0

        return

    end



    -- snap only on fire option

    if AB.Vars.SnapOnFire and !input.IsMouseDown(MOUSE_LEFT) or !ply:GetActiveWeapon() or !ply:GetActiveWeapon():IsValid() or !AB.CanBotShoot( ply:GetActiveWeapon() ) then 

--        AB.AimbotTarget = game.GetWorld()

        targetlerp = LocalPlayer():EyeAngles()

        return 

    end



    -- keybind mode

    if AB.Vars.AimbotBindMode then

        local khn = AB.NumberVars.AimbotBindKey

        if not ( input.IsKeyDown( khn ) or input.IsMouseDown( khn ) ) then

 --           AB.AimbotTarget = game.GetWorld()

            targetlerp = LocalPlayer():EyeAngles()

            return 

        end

    end

    

    -- cap a motherfucker

    AB.AimbotPreviewTarget = pozzed

    local aids = pozzed - ply:GetShootPos()

    aids = aids:Angle()

    aids:Normalize()

--    if AB.NumberVars.AimbotSmooth > 0 then

--        targetlerp = LerpAngle(FrameTime() * ((51 - AB.NumberVars.AimbotSmooth) / 5), targetlerp, aids)

--        aids = targetlerp

--    end



    if AB.Vars.CompSpread then

        local cone = AB.GetCurrentWeaponCone( cmd )

        aids = aids + -cone

    end



    aids = Angle( aids.p, aids.y, 0 )

    if AB.Vars.SilentAim then 

        AB.SetPacketChoke( true )

        lastoldang = cmd:GetViewAngles() + Angle( cmd:GetMouseY() * 0.02, -cmd:GetMouseX() * 0.015, 0 )

        AB.InternalFakeAngles = lastoldang

    end

    cmd:SetViewAngles(aids)

    if AB.Vars.SilentAim then AB.FixMove( cmd, true ) end



    if AB.Vars.AutoShoot then    

        if( !isfiring ) then

            cmd:SetButtons( bit.bor( cmd:GetButtons(), IN_ATTACK ) ) 

            isfiring = true

        else

            cmd:SetButtons( bit.band( cmd:GetButtons(), bit.bnot( IN_ATTACK ) ) )                      

            isfiring = false

        end

    end



    if AB.Vars.AutoTrigger then

        if ply:KeyDown(IN_ATTACK) then cmd:RemoveKey(IN_ATTACK) end

    end



end





AB.BHopBuffer = {}

AB.BHopCount1 = 0

AB.BHopCount2 = 0

AB.StoredOnGround = false

AB.StoredInJump   = false



function AB.ResetCounters()

    AB.BHopCount1 = 0

    AB.BHopCount2 = 0

    for i = #AB.BHopBuffer, 1, -1 do

        AB.BHopBuffer[i] = nil

    end

end









local vw = Angle( 0, 0, 0 )

local targetlerp = Angle( 0, 0, 0)

local nxtangle = false

function AB.CreateMove( cmd )



local ply = LocalPlayer()

if !ply:IsValid() then return end



local amemfootprint = gcinfo()





if( AB.Vars.Autoclick and !AB.Vars.RopeStorm) then

    if ply:KeyDown(IN_ATTACK2) then cmd:RemoveKey(IN_ATTACK2) end

    if ply:KeyDown(IN_ATTACK) then cmd:RemoveKey(IN_ATTACK) end

    end



    if( AB.Vars.Bhop) then

        if AB.Vars.BhopAutostrafe and !ply:IsFlagSet( FL_ONGROUND ) and ply:GetMoveType() != MOVETYPE_NOCLIP then

            if cmd:GetMouseX() < 0 then

                cmd:SetSideMove(-1000000)

            end

            if cmd:GetMouseX() > 0 then

                cmd:SetSideMove(1000000)

            end

        end





////////////////////////// credit goes to invalid/kilgrave for this UD bhop ///////////////////////////







        if AB.BHopCount1 < 13 then

            if(cmd:KeyDown(2) && !ply:IsOnGround()) then

                cmd:SetButtons( bit.band( cmd:GetButtons(), bit.bnot( 2 ) ) );

            end

        elseif(cmd:KeyDown(IN_JUMP)) then

            cmd:SetButtons( bit.band( cmd:GetButtons(), bit.bnot( 2 ) ) );

        end



        local lastOnGround = AB.StoredOnGround

        local lastInJump   = AB.StoredInJump

    

        local onGround = ply:IsOnGround()

        local inJump   = cmd:KeyDown (IN_JUMP)

    

        if lastOnGround and !onGround then

            AB.BHopCount2 = 0

        elseif !lastOnGround and onGround then

            if !lastInJump and inJump then

                AB.BHopCount1 = AB.BHopCount1 + 1

--                ply:ChatPrint(AB.BHopCount1)

                if AB.BHopCount1 == 14 then

                    local a, b, c = 0, 0, 0

                    for i = 1, #AB.BHopBuffer do

                        local x = AB.BHopBuffer [i]

                        a = a + 1 

                        b = b + x

                        c = c + x * x

                    end

                

                    if (c - b * b / a) / a < 0.1 then

--                    ply:ChatPrint("Detected")

                        AB.ChatText( "Whoops, your bhope abuse may have been detected! The protection system is good but not perfect I'm sorry to say", Color(255,205,205) )

                    end

                end

            else

                AB.ResetCounters()

            end

    elseif onGround then

        if lastInJump != inJump then

            AB.ResetCounters()

        end

    end

    

    if !onGround and

        lastInJump and not inJump and

        AB.BHopCount2 >= 0 then

        AB.BHopBuffer[#AB.BHopBuffer + 1] = AB.BHopCount2

        AB.BHopCount2 = -math.huge

    end

    

    AB.BHopCount2 = AB.BHopCount2 + 1

    

    AB.StoredOnGround = onGround

    AB.StoredInJump   = nJump



////////////////////////// old and gay ///////////////////////////



/*

        if !ply:IsFlagSet( FL_ONGROUND ) and ply:GetMoveType() != MOVETYPE_NOCLIP then

            cmd:SetButtons( bit.band( cmd:GetButtons(), bit.bnot( IN_JUMP ) ) )

        end

*/

    end





    if AB.Vars.Triggerbot and ply:Alive() and ply:GetActiveWeapon() and ply:GetActiveWeapon():IsValid() and AB.CanBotShoot( ply:GetActiveWeapon() ) then

        local td = {start = ply:GetShootPos(), endpos = ply:GetShootPos() + ply:EyeAngles():Forward() * 65535, filter = ply, mask = MASK_SHOT}

        local tr = util.TraceLine(td)



        if (tr.Entity:IsPlayer() and AB.CanTargetPlayer( tr.Entity ) ) or tr.Entity:IsNPC() or tr.Entity.Type == "nextbot" then

            if( !isfiring ) then

                cmd:SetButtons( bit.bor( cmd:GetButtons(), IN_ATTACK ) )           

                isfiring = true

            else

                cmd:SetButtons( bit.band( cmd:GetButtons(), bit.bnot( IN_ATTACK ) ) )                      

                isfiring = false

            end

        end



    end



    if AB.ScrollDelta != 0 then cmd:SetMouseWheel( AB.ScrollDelta ) end



    if( AB.Vars.RopeStorm and ply:KeyDown(IN_ATTACK2)) then

        local aids = Angle(math.random(-90, 90), math.random(-180, 180), 0)

        aids:Normalize()

        cmd:SetViewAngles(aids)

    if ply:KeyDown(IN_ATTACK2) then cmd:RemoveKey(IN_ATTACK2) end

    end







    if AB.Vars.FreecamControls then

        local khn = AB.NumberVars.FreecamForward

        if ( input.IsKeyDown( khn ) or input.IsMouseDown( khn ) ) then AB.FreecamCoordinates.pos = AB.FreecamCoordinates.pos + AB.FreecamCoordinates.ang:Forward() * 7 end

        local khn = AB.NumberVars.FreecamBack

        if ( input.IsKeyDown( khn ) or input.IsMouseDown( khn ) ) then AB.FreecamCoordinates.pos = AB.FreecamCoordinates.pos - AB.FreecamCoordinates.ang:Forward() * 7 end

        local khn = AB.NumberVars.FreecamLeft

        if ( input.IsKeyDown( khn ) or input.IsMouseDown( khn ) ) then AB.FreecamCoordinates.ang.y = AB.FreecamCoordinates.ang.y + 1 end

        local khn = AB.NumberVars.FreecamRight

        if ( input.IsKeyDown( khn ) or input.IsMouseDown( khn ) ) then AB.FreecamCoordinates.ang.y = AB.FreecamCoordinates.ang.y - 1 end

        local khn = AB.NumberVars.FreecamUp

        if ( input.IsKeyDown( khn ) or input.IsMouseDown( khn ) ) then AB.FreecamCoordinates.ang.p = AB.FreecamCoordinates.ang.p - 0.75 end

        local khn = AB.NumberVars.FreecamDown

        if ( input.IsKeyDown( khn ) or input.IsMouseDown( khn ) ) then AB.FreecamCoordinates.ang.p = AB.FreecamCoordinates.ang.p + 0.75 end

    end



    AB.AimbotCore( cmd )



    AB.MemoryDebug["aimbot"] = gcinfo() - amemfootprint



end

hook.Add( "CreateMove", "cmove", AB.CreateMove )





local xraytrans = Color(255, 255, 255, 101)



surface.CreateFont( "memes", {

    font = "Trebuchet",

    size = 200,

    weight = 950,

} )



local scanmat = Material("particle/particle_ring_blur")

local leadermat = Material( "particle/particle_ring_wave_additive" )

local beammat = Material("trails/laser")



function AB.Vision()

local me = LocalPlayer()

if !me:IsValid() then return end



local memfootprint = gcinfo()

/*

for i = 0, ScrH(), 200 do

    for w = 0, ScrW(), 200 do

        draw.SimpleTextOutlined( ":^)", "memes", w, i, Color(255,255,255,255), 0, 0, 1, Color(0,0,55,255) )

    end

end



draw.SimpleTextOutlined( "IM A HUGE FUCKING FAGGOT", "memes", 200, ScrH() / 2 - 230, Color(255,0,0,255), 0, 0, 1, Color(0,0,55,255) )

draw.SimpleTextOutlined( "WHO USES LEAKED HACKS", "memes", 260, ScrH() / 2 - 50, Color(255,0,0,255), 0, 0, 1, Color(0,0,55,255) )

draw.SimpleTextOutlined( "COS IM POOR AND RETARDED", "memes", 180, ScrH() / 2 + 150, Color(255,0,0,255), 0, 0, 1, Color(0,0,55,255) )

*/



if !AB.Vars.Vision then return end





if AB.Vars.CSFlashlight then

    local dlight = DynamicLight( me:EntIndex() + 5 )

    if ( dlight ) then

        dlight.pos = me:GetEyeTraceNoCursor().HitPos

        dlight.r = 255

        dlight.g = 255

        dlight.b = 255

        dlight.brightness = 2

        dlight.Decay = 1000

        dlight.Size = 2256

        dlight.DieTime = CurTime() + 0.5

    end

end



if AB.Vars.ShowESP then

-- players

for k, v in pairs( player.GetAll() ) do



    if AB.ToMetric( me:GetPos():Distance( v:GetPos() ) ) > AB.NumberVars.VisionDist then continue end

    if !AB.OnScreen( v, 50 ) then continue end



    local teamcol, teamcol2

    if AB.Vars.TeamColors then

        teamcol = team.GetColor(v:Team())

        teamcol2 = Color(math.Clamp(teamcol.r - 100, 0, 255), math.Clamp(teamcol.g - 100, 0, 255), math.Clamp(teamcol.b - 100, 0, 255), 255)

    else

        teamcol = AB.DefaultScheme

        teamcol2 = AB.DefaultScheme2

    end





if v == me then continue end



local pos = (v:GetPos() + Vector(0, 0, 45)):ToScreen()

local admintext = AB.GetRank( v )



if !AB.IsDead( v ) then

    if AB.Vars.VSquares then

        surface.SetDrawColor(teamcol)

        surface.DrawOutlinedRect(pos.x - 10, pos.y - 10, 20, 20)

        surface.SetDrawColor(teamcol2)

        surface.DrawOutlinedRect(pos.x - 8, pos.y - 8, 16, 16)

        surface.SetDrawColor(Color(255,255,255,255))

        surface.DrawRect(pos.x - 2, pos.y - 2, 4, 4)

    end

    if AB.Vars.VNames then draw.SimpleTextOutlined( v:Name(), "DermaDefault", pos.x, pos.y - 30, teamcol, 1, 0, 1, Color(0,0,55,255) ) end





    if AB.Vars.BoundingBox3d then cam.Start3D(EyePos(),EyeAngles()) render.DrawWireframeBox( v:GetPos(), Angle(0,0,0), Vector( -16, -16, 0 ), Vector( 16, 16, 72 ), AB.ColScheme, true ) cam.End3D() end

    -- propkill shit



    render.SetMaterial( beammat )

    if AB.Vars.PKPlayerBeams then

        local vz, ppos = AB.PlayerVisiblePK( me:GetShootPos(), v )

        if vz then

            cam.Start3D(EyePos(),EyeAngles())

            render.DrawBeam( (me:GetShootPos() + Vector(0,0,-5)) + EyeAngles():Forward() * 5, ppos, 5, 0, 1, teamcol )

            cam.End3D()

        end

    end



    if AB.Vars.PKPropBeams then

        if AB.HoldingProp and AB.HoldingProp:IsValid() then

            local src = AB.HoldingProp:LocalToWorld( AB.HoldingProp:OBBCenter() )

/*

            cam.Start3D(EyePos(),EyeAngles())

            render.StartBeam( 5 )

            for i = 0, 4 do

                local zp = src + (me:GetAimVector() * (i * 200)) + Vector( 0, 0, -(i ^ 3.15))

                render.AddBeam( zp, 150, i, Color( 255, 100, 0) )

            end

            render.EndBeam()

            render.DrawBeam( me:EyePos(), me:EyePos() + me:GetAimVector() * 2000, 50, 0, 1, Color( 255, 100, 0) )

            cam.End3D()

*/

            local vz2, ppos2 = AB.PlayerVisiblePK( src, v )

            if vz2 then

                cam.Start3D(EyePos(),EyeAngles())

                render.DrawBeam( src, ppos2, 50, 0, 1, teamcol2 )

                cam.End3D()

            end

        end

    end



    -- target highlighting



    if AB.Vars.ShowTargets and AB.IsTarget( v ) then

    draw.SimpleTextOutlined( "[TARGETED]", "DermaDefault", math.Clamp(pos.x, 30, ScrW() - 54), math.Clamp(pos.y - 42, 30, ScrH() - 54), Color(255,155,0,255), 1, 0, 1, Color(55,20,0,255) )

    surface.SetDrawColor(Color(255,155,0,255))

    surface.DrawRect( pos.x - 20, pos.y - 15, 4, 30 )

    surface.DrawRect( pos.x + 16, pos.y - 15, 4, 30 )



    surface.DrawRect( pos.x - 30, pos.y - 20, 4, 40 )

    surface.DrawRect( pos.x + 26, pos.y - 20, 4, 40 )



    surface.DrawLine( ScrW() / 2, ScrH(), pos.x, pos.y )

    end

    if AB.Vars.ShowFriends and AB.IsFriend( v ) and !AB.IsTarget( v ) then

        draw.SimpleTextOutlined( "[FRIEND]", "DermaDefault", pos.x, pos.y - 42, Color(0,255,0,255), 1, 0, 1, Color(0,0,55,255) )

    end

    if AB.Vars.ShowRanks and !(admintext == "user" or admintext == "guest" or admintext == "player") then

        draw.SimpleTextOutlined( "["..admintext.."]", "DermaDefault", pos.x, pos.y + 12, Color(255,100,0,255), 1, 0, 1, Color(50,0,0,255) )

    end

    if AB.Vars.ShowTraitors and table.HasValue( AB.Traitors, v ) then

    draw.SimpleTextOutlined( "[TRAITOR]", "DermaDefault", pos.x, pos.y - 56, Color(255,55,0,255), 1, 0, 1, Color(55,10,0,255) )

    end

    if AB.Vars.Vizlines then

        local tr = util.TraceLine ({

        start = v:EyePos(),

        endpos = v:EyePos() + v:GetAimVector() * 5000,

        filter = v,

        mask = MASK_SOLID_BRUSHONLY

        })

        local tp = tr.HitPos:ToScreen()

        local p = v:EyePos():ToScreen()

        surface.DrawLine(p.x, p.y, tp.x, tp.y)

        surface.SetDrawColor(teamcol)

        surface.DrawLine(tp.x - 4, tp.y, tp.x + 4, tp.y)

        surface.DrawLine(tp.x, tp.y - 4, tp.x, tp.y + 4)

    end



    if AB.Vars.ShowDistance then 

        draw.SimpleTextOutlined( AB.ToMetric(me:GetPos():Distance(v:GetPos())).."m", "DermaDefault", pos.x, pos.y + 24, teamcol, 1, 0, 1, Color(0,0,55,255) )

   end

    if AB.Vars.ShowHP then

        local colhp = math.Clamp(v:Health() * 3, 0, 255)

        local colcomp = Color(255,colhp,0,255)

        draw.SimpleTextOutlined( tostring(v:Health()).."%", "DermaDefault", pos.x, pos.y + 38, colcomp, 1, 0, 1, Color(0,0,0,255) )

    end



    if AB.Vars.PKVelocity then

        local velpos = ((v:GetPos() + Vector(0, 0, 45)) + v:GetVelocity() * 0.3 ):ToScreen()

        surface.SetDrawColor(teamcol)

        surface.SetMaterial( leadermat )

        surface.DrawTexturedRect(velpos.x - 15, velpos.y - 15, 30, 30)

        surface.SetDrawColor(teamcol2)

        surface.DrawTexturedRect(velpos.x - 10, velpos.y - 10, 20, 20)

    end



-- the fag is dead, i dunno why i did a second logic block for this, im just retarded i guess

elseif AB.Vars.ShowDead then

    surface.SetDrawColor(Color(255,255,255,255))

    surface.DrawLine(pos.x - 15, pos.y - 15, pos.x + 15, pos.y + 15)

    surface.DrawLine(pos.x + 15, pos.y - 15, pos.x - 15, pos.y + 15)

    if AB.Vars.VNames then draw.SimpleTextOutlined( v:Name(), "DermaDefault", pos.x, pos.y - 30, teamcol, 1, 0, 1, Color(0,0,55,255) ) end

    if AB.Vars.ShowFriends and AB.IsFriend( v ) then

        draw.SimpleTextOutlined( "[FRIEND]", "DermaDefault", pos.x, pos.y - 42, Color(0,255,0,255), 1, 0, 1, Color(0,0,55,255) )

    end

    if AB.Vars.ShowRanks and !(admintext == "user" or admintext == "guest" or admintext == "player") then

        draw.SimpleTextOutlined( "["..admintext.."]", "DermaDefault", pos.x, pos.y + 12, Color(255,100,0,255), 1, 0, 1, Color(50,0,0,255) )

    end

    if AB.Vars.ShowDistance then 

        draw.SimpleTextOutlined( AB.ToMetric(me:GetPos():Distance(v:GetPos())).."m", "DermaDefault", pos.x, pos.y + 24, teamcol, 1, 0, 1, Color(0,0,55,255) )

    end

end





end -- end of players loop



if AB.Vars.ESPProps then

    for k, v in pairs(ents.FindByClass("prop_physics")) do

        if AB.ToMetric( me:GetPos():Distance( v:GetPos() ) ) > AB.NumberVars.VisionDist then continue end

        local pos = (v:LocalToWorld(v:OBBCenter())):ToScreen()

        surface.SetDrawColor(AB.DefaultScheme)

        surface.DrawOutlinedRect(pos.x - 10, pos.y - 10, 20, 20)

        local aligndist = surface.GetTextSize( AB.ToMetric(me:GetPos():Distance(v:GetPos())).."m" )

        draw.SimpleTextOutlined( AB.ToMetric(me:GetPos():Distance(v:GetPos())).."m", "DermaDefault", pos.x - (aligndist / 2), pos.y + 12, AB.DefaultScheme, 0, 0, 1, Color(0,0,55,255) )

    end

end







if AB.Vars.Entfinder then

    for k, v in pairs(ents.GetAll()) do

        if AB.ToMetric( me:GetPos():Distance( v:GetPos() ) ) > AB.NumberVars.VisionDist then continue end

        if !AB.OnScreen( v, 20 ) then continue end

        local drawing = false



        for i,p in pairs(AB.MarkedEnts) do

            if v:GetClass() == p then

                drawing = true

            end

        end



        if drawing then

        local pos = (v:LocalToWorld(v:OBBCenter())):ToScreen()

        surface.SetDrawColor(Color(255,255,255,255))

        surface.DrawRect(pos.x - 3, pos.y - 3, 6, 6)

        local alignclass = surface.GetTextSize( tostring(v:GetClass()) )

        draw.SimpleTextOutlined( tostring(v:GetClass()), "DermaDefault", pos.x - (alignclass / 2), pos.y + 12, AB.DefaultScheme, 0, 0, 1, Color(0,0,55,255) )

        end



    end



end



end -- end of showesp





if AB.Freecam then

    local CamData = {}

    CamData.origin = AB.FreecamCoordinates.pos

    CamData.angles = AB.FreecamCoordinates.ang

    CamData.x = AB.NumberVars.MirrorX

    CamData.y = AB.NumberVars.MirrorY

    CamData.w = ScrW() / (AB.NumberVars.MirrorSize / 10)

    CamData.h = ScrH() / (AB.NumberVars.MirrorSize / 10)

    CamData.drawviewmodel = false

    CamData.drawhud = false

    CamData.fov = 90

    render.RenderView( CamData )

end



if AB.Vars.Mirror then

    local CamData = {}

    if AB.NumberVars.MirrorAxis == 0 then

        CamData.angles = Angle(0,me:EyeAngles().yaw - 180,0)

    elseif AB.NumberVars.MirrorAxis == 1 then

        CamData.angles = Angle(me:EyeAngles().pitch,me:EyeAngles().yaw - 180,0)

    else

        CamData.angles = Angle(-me:EyeAngles().pitch,me:EyeAngles().yaw - 180,0)

    end



    CamData.origin = me:GetPos()+Vector(0,0,50)

    CamData.x = AB.NumberVars.MirrorX

    CamData.y = AB.NumberVars.MirrorY

    CamData.w = ScrW() / (AB.NumberVars.MirrorSize / 10)

    CamData.h = ScrH() / (AB.NumberVars.MirrorSize / 10)

    CamData.drawviewmodel = false

    CamData.drawhud = false

    CamData.fov = 90

    render.RenderView( CamData )

end







if AB.Vars.PreviewTarget then

    local t = AB.AimbotPreviewTarget

    if isvector( t ) then 

        local p = t:ToScreen()

        surface.SetDrawColor(Color(255,155,55,255))

        surface.DrawRect(p.x-1, p.y + 6, 2, 20)

        surface.DrawRect(p.x-1, p.y - (6 + 20), 2, 20)

        surface.DrawRect(p.x + 6, p.y-1, 20, 2)

        surface.DrawRect(p.x - (6 + 20), p.y-1, 20, 2)

    end

end





if AB.Vars.Radar then

    local size = AB.NumberVars.RadarSize

    local fov = AB.NumberVars.RadarZoom

    local x = AB.NumberVars.RadarX

    local y = AB.NumberVars.RadarY



    surface.SetDrawColor(AB.DefaultScheme.r, AB.DefaultScheme.g, AB.DefaultScheme.b, AB.NumberVars.RadarAlpha)

    surface.DrawRect(x - 2, y - 2, size + 4, size + 4)





    surface.SetDrawColor(Color(20, 20, 20, AB.NumberVars.RadarAlpha))

    surface.DrawRect(x, y, size, size)

    surface.SetDrawColor(Color(30, 30, 30, 255))

    surface.DrawLine(x, y, x + (size / 2), y + (size / 2))

    surface.DrawLine(x + size, y, x + (size / 2), y + (size / 2))



    surface.SetDrawColor(AB.DefaultScheme)

    surface.DrawRect((x -2)+ (size/2), (y-2) + (size/2), 4, 4)



    for key, ply in pairs(player.GetAll()) do

        local teamcol, teamcol2 = AB.GetESPColor( ply )





        if ply != me and !AB.IsDead( ply ) then

            local lx = me:GetPos().x - ply:GetPos().x

            local ly = me:GetPos().y - ply:GetPos().y

            local ang = EyeAngles().y

            local cos = math.cos(math.rad(-ang))

            local sin = math.sin(math.rad(-ang))

            local px = (ly * cos) + (lx * sin)

            local py = (lx * cos) - (ly * sin)

            px = px / fov

            py = py / fov

            px = math.Clamp(px, -(size * 0.50), size * 0.50)

            py = math.Clamp(py, -(size * 0.50), size * 0.50)

            local name = player.GetAll()[key]:Nick()

            draw.SimpleText(name, "default", x + size - (size * 0.50) + px - 13, y + size - (size * 0.50) + py - 7, teamcol2, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)

            surface.SetDrawColor(teamcol)

            surface.DrawRect(x + size - (size * 0.50) + px, y + size - (size * 0.50) + py, 3, 3)



            end



        end



end



if AB.Vars.Crosshair then

    local hitpos = util.TraceLine ({

        start = me:GetShootPos(),

        endpos = me:GetShootPos() + me:GetAimVector() * 4096,

        filter = me,

        mask = MASK_SHOT

    }).HitPos



    local screenpos = hitpos:ToScreen()

    local x = screenpos.x

    local y = screenpos.y



    surface.SetDrawColor(Color(255, 255, 255, 255))

    surface.DrawRect((ScrW() / 2) - 1, (ScrH() / 2) - 1, 2, 2)

    surface.DrawRect(x-1, y + 6, 2, 20)

    surface.DrawRect(x-1, y - (6 + 20), 2, 20)

    surface.DrawRect(x + 6, y-1, 20, 2)

    surface.DrawRect(x - (6 + 20), y-1, 20, 2)



    if AB.CrossHairAlpha > 0 then AB.CrossHairAlpha = math.Clamp(AB.CrossHairAlpha - 6, 0, 255) end

    surface.SetDrawColor(Color(255, 255, 255, AB.CrossHairAlpha))

    surface.DrawLine(x - 24, y + 24, x - 6, y + 6)

    surface.DrawLine(x + 24, y + 24, x + 6, y + 6)

    surface.DrawLine(x - 24, y - 24, x - 6, y - 6)

    surface.DrawLine(x + 24, y - 24, x + 6, y - 6)





end









if isvector( AB.CurrentBase ) then

    local sc = (AB.CurrentBase + Vector( 0, 0, 10 )):ToScreen()



    draw.SimpleText("My Base", "default", sc.x, sc.y - 42, AB.DefaultScheme, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

    draw.SimpleText( AB.ToMetric( LocalPlayer():GetPos():Distance( AB.CurrentBase ) ).."m", "default", sc.x, sc.y - 30, AB.DefaultScheme, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

    surface.SetDrawColor( Color(205,205,255, 100 ) )

    draw.NoTexture()

    local triangle = {

        { x = sc.x - 10, y = sc.y - 20 },

        { x = sc.x + 10, y = sc.y - 20 },

        { x = sc.x, y = sc.y },

    }

    surface.DrawPoly( triangle )



end



if AB.Vars.KeypadJew then



    local e = me:GetEyeTrace().Entity

    if IsValid(e) and string.find( e:GetClass(), "Keypad") then

        local text;

        local color;

        if(e.code && e.code != "") then

            text = e.code;

            color = Color( 105, 255, 105, 150 )

        elseif(e.tempCode && e.tempCode != "") then

            text = e.tempCode;

            color = Color( 250, 150, 150, 150 )

        else

            text = "Unknown"

            color = Color(150,150,150,150)

        end

--        draw.WordBox( 8, ScrW() / 2, ScrH() / 2, text, "Default", color, Color(255,255,255,255) )

        

        surface.SetDrawColor( Color( 0,0,50, 150 ) )

        surface.SetMaterial( grad )

        surface.DrawTexturedRect( ScrW() / 2 + 57, ScrH() / 2 - 7, 50, 15 )

        draw.SimpleText(text, "DermaDefault", ScrW() / 2 + 60, ScrH() / 2, color, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)



    end

    

    for k,v in pairs(ents.GetAll()) do

        if IsValid(v) and string.find( v:GetClass(), "Keypad") then

            if v != e and me:GetPos():Distance( v:GetPos() ) < 8000 then

                local pos = v:GetPos():ToScreen()

                if pos.x > 0 and pos.x < ScrW() and pos.y > 0 and pos.y < ScrH() then

                    if (v.code && v.code != "") then

                        surface.SetDrawColor( Color( 0,0,50, 150 ) )

                        surface.SetMaterial( grad )

                        surface.DrawTexturedRect( pos.x, pos.y, 50, 15 )

                        draw.SimpleText( v.code, "DermaDefault", pos.x + 5, pos.y + 6, Color( 105, 255, 105, 150 ), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)



--                        draw.WordBox( 8, pos.x-5, pos.y-5, v.code, "Default", Color( 0, 255, 0, 150 ), Color(255,255,255,255) )

                    else

                        if(v.tempCode && v.tempCode != "") then

                            surface.SetDrawColor( Color( 0,0,50, 150 ) )

                            surface.SetMaterial( grad )

                            surface.DrawTexturedRect( pos.x, pos.y, 50, 15 )

                            draw.SimpleText( v.tempCode, "DermaDefault", pos.x + 5, pos.y + 6, Color( 250, 150, 150, 150 ), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)

                        else

                            surface.SetDrawColor( Color( 0,0,50, 150 ) )

                            surface.SetMaterial( grad )

                            surface.DrawTexturedRect( pos.x, pos.y, 50, 15 )

                            draw.SimpleText( "Unknown", "DermaDefault", pos.x + 5, pos.y + 6, Color(150,150,150,150), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)

                        end

                    end

                end

            end

        end

    end



end





if AB.Vars.Bhop then

    local sped = me:GetVelocity():Length()

    draw.SimpleText("Velocity: "..math.Round( sped ), "DermaDefault", (ScrW() / 2), ScrH() - 60, AB.DefaultScheme, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )

    surface.SetDrawColor( AB.DefaultScheme )

    surface.DrawOutlinedRect( (ScrW() / 2) - 100, ScrH() - 50, 200, 10 )

    surface.SetDrawColor( Color( AB.DefaultScheme.r, AB.DefaultScheme.g, AB.DefaultScheme.b, 100 ) )

    surface.DrawRect( (ScrW() / 2) - 100, ScrH() - 50, math.Clamp( (sped / 2000) * 200, 0, 200 ), 10 )

end





if AB.Vars.WitnessDetector then



    if #AB.Witnesses > 0 then

        surface.SetDrawColor( Color(50, 50, 90, 255) )

        surface.DrawRect( (ScrW() / 2) - 150, 0, 300, (#AB.Witnesses * 20) + 30)

        surface.SetDrawColor( Color(0, 0, 0, 250) )

        surface.DrawRect( (ScrW() / 2) - 145, 25, 290, (#AB.Witnesses * 20) )

        draw.SimpleText("These people can see you", "DermaDefault", (ScrW() / 2) - 63, 10, Color(255, 255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)





        for k, v in pairs(AB.Witnesses) do

            if !v:IsValid() then continue end -- let this pass silently, it only spams briefly when some faggot dcs anyway

            draw.SimpleText(v:Nick(), "DermaDefault", (ScrW() / 2) - 140, 8 + (k * 20), AB.GetESPColor( v ) )

        end



    end    

end



if AB.Vars.SpectatorDetector then

    local starty = 0

    if AB.Vars.WitnessDetector then starty = (#AB.Witnesses * 20) + 35 end



    if AB.TheyHaveEyesEverywhere and #AB.TheyHaveEyesEverywhere > 0 then

        surface.SetDrawColor( Color(50, 50, 90, 255) )

        surface.DrawRect( (ScrW() / 2) - 150, starty, 300, (#AB.TheyHaveEyesEverywhere * 20) + 30)

        surface.SetDrawColor( Color(0, 0, 0, 250) )

        surface.DrawRect( (ScrW() / 2) - 145, starty + 25, 290, (#AB.TheyHaveEyesEverywhere * 20) )

        draw.SimpleText("These people are spectating you", "DermaDefault", (ScrW() / 2) - 63, starty + 10, Color(255, 255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)





        for k, v in pairs( AB.TheyHaveEyesEverywhere ) do

            if !v:IsValid() then continue end -- let this pass silently, it only spams briefly when some faggot dcs anyway

            draw.SimpleText(v:Nick(), "DermaDefault", (ScrW() / 2) - 140, starty + 8 + (k * 20), AB.GetESPColor( v ) )

        end



    end    

end



-- ent scanner

if AB.EntScanner then



    local c = me:GetEyeTrace()

    local screenpos = c.HitPos:ToScreen()

    local x = screenpos.x

    local y = screenpos.y

    local pulse = math.abs( math.sin( CurTime() * 2 ) )

    surface.SetDrawColor( AB.DefaultScheme )

    surface.SetMaterial( scanmat )

    surface.DrawTexturedRect( x - (15 + (pulse * 15)), y - (15 + (pulse * 15)), 30 + (pulse * 30), 30 + (pulse * 30) )

    surface.SetDrawColor( AB.DefaultScheme2 )

    surface.DrawTexturedRect( x - (12 + (pulse * 12)), y - (12 + (pulse * 12)), 24 + (pulse * 24), 24 + (pulse * 24) )



    if c.Entity and c.Entity:IsValid() then

        AB.EntScannerTab = {}

        local e = c.Entity

        AB.EntScannerEnt = e



        if e:IsPlayer() then 

            table.insert( AB.EntScannerTab, e:Nick() )

            table.insert( AB.EntScannerTab, {e:SteamID(), Color(255,255,255)} )

            table.insert( AB.EntScannerTab, {AB.GetRank( e ), Color( 255, 100, 0 )} )

            table.insert( AB.EntScannerTab, "Health: "..e:Health().."% Armor: "..e:Armor().."%" )

            if DarkRP then

                table.insert( AB.EntScannerTab, {DarkRP.formatMoney(e:getDarkRPVar("money")) or "$ERROR", Color( 50, 255, 50)} )

                table.insert( AB.EntScannerTab, {"Real Name: "..e:SteamName(), Color( 150, 150, 150)} )

            end



            if e:GetActiveWeapon() then table.insert( AB.EntScannerTab, "Holding: "..(e:GetActiveWeapon():GetClass() or "None" ) ) end

            local weps = {}

            for _, g in pairs( e:GetWeapons() ) do table.insert( weps, g:GetClass() )end

            table.insert( AB.EntScannerTab, {table.ToString( weps ), Color(155,155,255)} )

        end

        table.insert( AB.EntScannerTab, e:GetClass() )

        table.insert( AB.EntScannerTab, e:GetModel() )

        table.insert( AB.EntScannerTab, "Distance: "..AB.ToMetric(e:GetPos():Distance( me:GetPos() )).."m" )



    end



    local textx, texty = ScrW() / 2 + 50, ScrH() / 2

    for k, v in pairs(AB.EntScannerTab) do

        if istable( v ) then

            draw.SimpleTextOutlined( v[1], "default", textx + 40, (texty - 40) + (k * 12), v[2], 0, 0, 1, Color(0,0,0) )

        else

            draw.SimpleTextOutlined( v, "default", textx + 40, (texty - 40) + (k * 12), AB.DefaultScheme, 0, 0, 1, Color(0,0,0) )

        end

    end





end



AB.MemoryDebug["hud"] = gcinfo() - memfootprint



end

hook.Add("HUDPaint", "ab_hud", AB.Vision)









---------------------------------------------- NEW XRAY HERE -------------------------------------------------





/*

if AB.Vars.Xray then

        

    for k, v in pairs(ents.GetAll()) do



        if AB.ToMetric(me:GetPos():Distance(v:GetPos())) > AB.NumberVars.XrayDistance then if v:GetColor().a == 100 then v:SetColor(Color(255,255,255,255)) end continue end



        -- set rendermode none?



        if AB.Vars.XrayPlayers then

            if v:IsValid() and v:IsPlayer() and v != LocalPlayer() and !AB.IsDead( v ) and AB.OnScreen( v ) then

                cam.Start3D(EyePos(),EyeAngles())

                if AB.Vars.NoChamColours then

                    v:SetMaterial(AB.mat1)

                    v:SetRenderMode(4)

                    v:SetColor(xraytrans)

                    render.SuppressEngineLighting( true )

                    render.MaterialOverride( AB.mat1 )

                end

                if AB.Vars.PKChams and AB.Vars.NoChamColours then render.SetColorModulation( 0, 1, 0 ) render.SetBlend(0.8) else render.SetColorModulation( AB.ColScheme.x, AB.ColScheme.y, AB.ColScheme.z ) render.SetBlend(0.3) end

                v:DrawModel()

                if IsValid( v:GetActiveWeapon() ) then

                    if AB.Vars.NoChamColours then render.SetColorModulation( AB.ColScheme2.x, AB.ColScheme2.y, AB.ColScheme2.z ) end

                    v:GetActiveWeapon():DrawModel()

                end

                render.SetBlend(1)

                render.SuppressEngineLighting( false )

                render.MaterialOverride( )

--                v:SetColor(Color(255,255,255,255))

                cam.End3D()



            end

        end

        if AB.Vars.XrayProps then

            if v:IsValid() and v:GetClass() == "prop_physics" and AB.OnScreen( v ) then

            cam.Start3D(EyePos(),EyeAngles())

            if AB.Vars.NoChamColours then

                v:SetMaterial(AB.mat1)

                v:SetRenderMode(4)

                v:SetColor(xraytrans)

                render.SuppressEngineLighting( true )

                render.MaterialOverride( AB.mat1 )

            end

            if AB.Vars.PKChams and AB.Vars.NoChamColours then render.SetColorModulation( 1, 0.2, 0 ) render.SetBlend(0.6) else render.SetColorModulation( AB.ColScheme2.x, AB.ColScheme2.y, AB.ColScheme2.z ) render.SetBlend(0.3) end

            v:DrawModel()

            render.SetBlend(1)

            render.SuppressEngineLighting( false )

            render.MaterialOverride( )

--            v:SetColor(Color(255,255,255,255))

            cam.End3D()

            end

        end





        if AB.Vars.XrayEntfinder then

            local drawing = false



            for i,p in pairs(AB.MarkedEnts) do

                if v:GetClass() == p then

                    drawing = true

                end

            end



            if drawing and AB.OnScreen( v ) then

            cam.Start3D(EyePos(),EyeAngles())

            v:SetMaterial(AB.mat1)

            v:SetRenderMode(4)

            v:SetColor(xraytrans)

            render.SuppressEngineLighting( true )

            render.MaterialOverride( AB.mat1 )

            render.SetColorModulation( AB.ColScheme2.x, AB.ColScheme2.y, AB.ColScheme2.z )

            render.SetBlend(0.3)

            v:DrawModel()

            render.SetBlend(1)

            render.SuppressEngineLighting( false )

            render.MaterialOverride( )

--            v:SetColor(Color(255,255,255,255))

            cam.End3D()

            end



        end







    end

end

*/





function AB.DrawXrayEntity( ent, col, domat, ghost )

    cam.Start3D( EyePos(), EyeAngles() )

        cam.IgnoreZ( true )

        if domat then render.MaterialOverride( AB.Mat1 ) end

        render.SuppressEngineLighting( true )

        render.SetColorModulation( col.r / 255, col.g / 255, col.b / 255 )

        if ghost then render.SetBlend( 0.3 ) end

        ent:DrawModel()

        render.SuppressEngineLighting( false )

        cam.IgnoreZ( false )

        render.MaterialOverride()

    cam.End3D()

end





function AB.DoXray()

    local me = LocalPlayer()

    if !me or !me:IsValid() or !AB.Vars.Xray then return end



    local fags = ents.GetAll()

--    table.sort( fags, function( a, b ) return a:GetPos():DistToSqr( EyePos() ) > b:GetPos():DistToSqr( EyePos() ) end )



    for k, v in ipairs( fags ) do

        if !AB.OnScreen( v, 50 ) or AB.ToMetric( me:GetPos():Distance( v:GetPos() ) ) > AB.NumberVars.XrayDistance then continue end



        -- players loop

        if AB.Vars.XrayPlayers and v:IsPlayer() then

            if v == LocalPlayer() or !v:Alive() then continue end

            local teamcol, teamcol2

            if AB.Vars.TeamColors then

                teamcol = team.GetColor(v:Team())

                teamcol2 = Color(math.Clamp(teamcol.r - 100, 0, 255), math.Clamp(teamcol.g - 100, 0, 255), math.Clamp(teamcol.b - 100, 0, 255), 255)

            elseif AB.Vars.PKChams then

                teamcol = Color( 0, 255, 0 ) teamcol2 = Color( 255, 0, 0 )

            else

                teamcol = AB.DefaultScheme teamcol2 = AB.DefaultScheme2

            end



            AB.DrawXrayEntity( v, teamcol, AB.Vars.NoChamColours, !AB.Vars.XraySolid )



            local gun = v:GetActiveWeapon()

            if gun and gun:IsValid() then AB.DrawXrayEntity( gun, teamcol2, AB.Vars.NoChamColours, !AB.Vars.XraySolid ) end

        end



        -- props loop

        if AB.Vars.XrayProps and v:GetClass() == "prop_physics" then

            local teamcol, teamcol2

            if AB.Vars.PKChams then

                teamcol = Color( 0, 255, 0 ) teamcol2 = Color( 255, 0, 0 )

            else

                teamcol = AB.DefaultScheme teamcol2 = AB.DefaultScheme2

            end

            AB.DrawXrayEntity( v, teamcol2, AB.Vars.NoChamColours, true )

        end



        -- ents loop

        if AB.Vars.XrayEntfinder and table.HasValue( AB.MarkedEnts, v:GetClass() ) then

            local teamcol, teamcol2

            if AB.Vars.PKChams then

                teamcol = Color( 255, 255, 0 ) teamcol2 = Color( 255, 255, 0 )

            else

                teamcol = AB.DefaultScheme teamcol2 = AB.DefaultScheme2

            end

            AB.DrawXrayEntity( v, teamcol, AB.Vars.NoChamColours, true )

        end



    end

end



hook.Add( "PreDrawHUD", "AB_NewXray", AB.DoXray )













function AB.PKBeamsCore()

if AB.Vars.PKVerticalBeams then

    render.SetMaterial( beammat )

    for k, v in pairs( player.GetAll()) do

        if !v:Alive() or v == LocalPlayer() then continue end

        render.DrawBeam( v:GetPos() + Vector( 0, 0, -2000 ), v:GetPos() + Vector( 0, 0, 2000 ), 50, 0, 1, Color(255,255,255) )

    end

end

end

hook.Add("PostDrawTranslucentRenderables", "ab_beams", AB.PKBeamsCore)





function AB.ToggleEntityScanner()

    if !AB.EntScanner then

        AB.EntScanner = true

        AB.ScannerButton1 = AB.MakeFloatingButton( ScrW() / 2 - 180, (ScrH() / 2) - 50, "Copy to Console", function() print(AB.EntScannerEnt)

            for k, v in pairs( AB.EntScannerTab ) do

                if istable( v ) then MsgC( v[2], v[1].."\n" ) else MsgN( v ) end

            end

        end)



        AB.ScannerButton2 = AB.MakeFloatingButton( ScrW() / 2 - 180, (ScrH() / 2) - 20, "Add class to ESP", function()

            if table.HasValue( AB.MarkedEnts, AB.EntScannerEnt:GetClass() ) then AB.ChatText( "Already marked!", Color(255,205,205) ) return end

            AB.ChatText( "Added "..AB.EntScannerEnt:GetClass().." to marked ent classes", Color(255,255,255) )

            table.insert(AB.MarkedEnts, AB.EntScannerEnt:GetClass())

        end)



        AB.ChatText( "Enabled Entity Scanner", Color(255,255,255) )

    else

        AB.EntScanner = false

        AB.ChatText( "Disabled Entity Scanner", Color(255,205,205) )

        if AB.ScannerButton1 then AB.ScannerButton1:Remove() end

        if AB.ScannerButton2 then AB.ScannerButton2:Remove() end

    end

end



AB.MouseReleased = false

function AB.ToggleFreeMouse()

    if !AB.MouseReleased then

        gui.EnableScreenClicker( true )

        AB.MouseReleased = true

    else

        gui.EnableScreenClicker( false )

        AB.MouseReleased = false

    end

end

concommand.Add("ace_toggle_mouse_cursor", AB.ToggleFreeMouse)



function AB.CalcView( ply, pos, angles, fov )

local me = LocalPlayer()

if !me:IsValid() or !me:Alive() or me:GetViewEntity() != me or me:InVehicle() then return end



local tps = {}



    if AB.Vars.SilentAim and !AB.Vars.Thirdperson and lastoldang and isangle( lastoldang ) then

        tps.origin = me:EyePos()

        tps.angles = lastoldang

        tps.fov = fov

        return tps

    end



    if AB.Vars.NoRecoil and !AB.Vars.Thirdperson then

--        tps.origin = me:EyePos()

        tps.angles = me:EyeAngles()

--        tps.fov = fov

        return tps

    end



    if AB.Vars.Thirdperson then

        if AB.RenderPanic then return end

        local trace = util.TraceLine( { start = pos - ply:GetForward() * 2, endpos = pos - angles:Forward() * AB.NumberVars.TPSDistance, filter = player.GetAll(), mask = MASK_SHOT } )

        tps.origin = trace.HitPos + ply:GetForward() * 20 + ply:GetRight() * AB.NumberVars.TPSOffset

        tps.angles = angles

        tps.fov = fov

        return tps

    end



end

hook.Add("CalcView", "ab_calcview", AB.CalcView)





function AB.ICanSeeMyAss( ply )

if AB.Vars.Thirdperson then return true end

return false

end

hook.Add("ShouldDrawLocalPlayer", "ab_drawplayer", AB.ICanSeeMyAss)



-- it would be very wise to keep this disabled for now

/*

function AB.Transparency()

if AB.Vars.XrayProps then

    for k, v in pairs(ents.GetAll()) do

        render.SuppressEngineLighting( true )

    end

end

end



hook.Add("RenderScene", "ab_transparency", AB.Transparency)

*/



function AB.CheckWitnesses()

if !AB.Vars.WitnessDetector then return end

AB.Witnesses = {}

for k, v in pairs(player.GetAll()) do

    if v:IsValid() and v != LocalPlayer() then

        local Trace = {}

        Trace.start  = LocalPlayer():EyePos() + Vector(0, 0, 32)

        Trace.endpos = v:EyePos() + Vector(0, 0, 32)

        Trace.filter = {v, LocalPlayer()}



        TraceRes = util.TraceLine(Trace)



        if !TraceRes.Hit then

            if (v:EyeAngles():Forward():Dot((LocalPlayer():EyePos() - v:EyePos())) > math.cos(math.rad(45))) then

                if !table.HasValue(AB.Witnesses, v) then table.insert( AB.Witnesses, v ) end

            end

        end



    end

end

end

timer.Create("ab_WitnessCheck", 0.5, 0, AB.CheckWitnesses)



local nxtscan = CurTime()

function AB.ScanForTraitors()

    if nxtscan > CurTime()  then return end

/*

    for _, ply in pairs(player.GetAll()) do

        if ply == LocalPlayer() then continue end

        if ply:GetRole() == ROLE_DETECTIVE then continue end

        if !ply:GetActiveWeapon() or !ply:GetActiveWeapon():IsValid() then continue end



        if ply:GetActiveWeapon().CanBuy and table.HasValue( ply:GetActiveWeapon().CanBuy, ROLE_TRAITOR ) and !table.HasValue( AB.Traitors, ply ) then

            table.insert( AB.Traitors, ply )

            surface.PlaySound("buttons/bell1.wav")

            AB.ChatText( ply:Nick().." is a filthy nasty traitor!", Color(255,100,0) )

        end

        

    end

*/

    nxtscan = CurTime() + 0.5



    for _,v in pairs(ents.GetAll()) do

        if GetRoundState() == 3 and v:IsWeapon() and type(v:GetOwner()) == "Player" and v.Buyer == nil and v.CanBuy and table.HasValue(v.CanBuy, 1) and !table.HasValue(AB.Traitors, v:GetOwner()) then

            local owner = v:GetOwner()

            if !owner:IsValid() then continue end

            if owner:GetRole() == 2 then

                v.Buyer = owner

            else

                table.insert(AB.Traitors, owner)

                AB.ChatText( ply:Nick().." is a filthy nasty traitor! He bought a: "..v:GetClass(), Color(255,100,0) )

            end

        elseif GetRoundState() != 3 then

            AB.Traitors = {}

        end

    end



end



function AB.ClearTraitors()

    AB.Traitors = {}

end











function AB.ChokePackets( val )

    if val then

        odium.engine.SetChokedPacket( 0 )

    end



end















function AB.XrayShutoff()

for k, v in pairs(ents.GetAll()) do

    v:SetColor(Color(255,255,255,255))

end

end



AB.IsTTT = false



local demotereasons = {

    "Nigger",

    "Faggot",

    "Dickhead",

    "Cuckold",

    "RDM",

    "Shit eating faggot",

    "RDA",

    "NLR",

    "Fucking sped",

    "kys",

    "Shit server tbh fam",

    "Bad scripts",

    "Skid",

    "Admin abuse",

    "Abusing",

    "Fuckwit",

    "DarkRP Player",

}







------------------------------------------------------------------------INSULT GENERATOR--------------------------------------------------------------------------------------







local openers = {

    "get fucked",

    "eat shit",

    "fuck a baboon",

    "suck my dingleberries",

    "choke on steaming cum",

    "die in a fire",

    "gas yourself",

    "sit on garden shears",

    "choke on scrotum",

    "shove a brick up your ass",

    "swallow barbed wire",

    "move to sweden",

    "fuck a pig",

    "bow to me",

    "suck my ball sweat",

    "come back when you aren't garbage",

    "i will piss on everything you love",

    "kill yourself",

    "livestream suicide",

    "neck yourself",

    "go be black somewhere else",

    "rotate on it",

    "choke on it",

    "blow it out your ass",

    "go browse tumblr",

    "go back to darkrp",

    "sit on horse cock",

    "drive off a cliff",

    "rape yourself",

    "get raped by niggers",

    "fuck right off",

    "you mother is a whore",

    "come at me",

    "go work the corner",

--    "you are literal cancer",

    "why haven't you killed yourself yet",

    "why do you even exist",

    "shoot your balls off with a shotgun",

    "sterilize yourself",

    "convert to islam",

    "drink bleach",

    "remove yourself",

    "choke on whale cock",

    "suck shit",

    "suck a cock",

    "lick my sphincter",

    "set yourself on fire",

    "drink jenkem",

    "get beaten to death by your dad",

    "choke on your uncle's cock",

    "get sat on by a 200kg feminist",

    "blow off",

    "join isis",

    "stick your cock in a blender",

    "OD yourself on meth",

    "lie under a truck",

    "lick a wall socket",

    "swallow hot coals",

    "die slowly",

    "explode yourself",

    "swing from the noose",

    "end yourself",

    "take your best shot",

    "get shot in a gay bar",

    "drink pozzed cum",

    "marry a muslim",

    "get a better cheat",

    "rub your dick on a cheese grater",

    "wrap a rake with barbed wire and sodomize yourself",

    "close your gaping cunt",

}



local joiners = {

    "cancer infested",

    "cock sucking",

    "fuck faced",

    "cunt eyed",

    "nigger fucking",

    "candy ass",

    "fairy ass fucking",

    "shit licking",

    "unlovable",

    "disgusting",

    "degenerate",

    "fuck headed",

    "dick lipped",

    "autismal",

    "gook eyed",

    "mongoloided",

    "cunt faced",

    "dick fisted",

    "worthless",

    "bleeding cunted",

    "hillary loving",

    "maggot infested",

    "boot lipped",

    "chink eyed",

    "shit skinned",

    "nigger headed",

    "lgbt supporting",

    "cum stained",

}



local enders = {

    "fuck face",

    "poofter",

    "jew cunt",

    "fagmaster",

    "goat rapist",

    "rag head",

    "cock cheese",

    "vaginaphobe",

    "coon",

    "nigger",

    "slag cunt",

    "garbage man",

    "paeodophile",

    "kiddy toucher",

    "pony fucker",

    "tumblrite",

    "sperglord",

    "gorilla's dick",

    "shit licker",

    "shit slick",

    "redditor",

    "pig fucker",

    "spastic",

    "cuckold",

    "chode gobbler",

    "fuckwit",

    "retard",

    "mongoloid",

    "elephants cunt",

    "cunt",

    "gook",

    "fag lord",

    "shit stain",

    "mpgh skid",

    "batch coder",

    "pony fucker",

    "furfag",

    "half caste",

    "double nigger",

    "cock socket",

    "cunt rag",

    "anal wart",

    "maggot",

    "knob polisher",

    "fudge packer",

    "cock slave",

    "trashmaster",

    "shitskin",

    "curry muncher",

    "gator bait",

    "bootlip",

    "camel jockey",

    "wog cunt",

    "hooknosed kike",

    "feminist",

    "wop cunt",

    "abbo",

    "porch monkey",

    "dago",

    "anal secretion",

    "pig cunt",

    "insect",

    "sub human",

    "mental defect",

    "fat whore",

    "cunt blood",

    "cunt rag",

    "cotton picker",

    "bum tickling fag",

    "degenerate faggot",

    "smegma lump",

    "darkie",

    "fuck toy",

    "underage midget cunt",

    "twelvie",

    "faggot teenager",

    "ankle biter",

    "fat cunt american",

    "bernie loving washout",

    "fucking failure",

    "cum dumpster",

    "waste of skin",

    "petrol sniffing coon",

    "jenkem bottle",

    "dirty jew",

    "darkrp admin",

    "cuck master",

    "barrel of piss",

    "tankard of shit",

    "cock wart",

}



local adminstarts = {

    "How much did you pay for that staff rank",

    "Nice server you got here",

    "How much did that gay ULX rank cost",

    "I'll be back to shit on you again",

    "This is only my first alt account",

    "What autist gave you a staff rank",

    "Banning me only makes my cock harder",

    "I'll be back on a new account in 10 minutes",

    "Your server deserves to be destroyed",

    "It's been fun wrecking this shit hole",

    "Stop touching me with your physgun",

    "Letting you have admin was a mistake",

    "Do what you must, I have already won",

    "Bans mean nothing to me",

    "You should appreciate me showing you how to break your terrible server security",

    "I hunt down faggots like you for sport",

    "I am better than you in every single way",

    "I bypassed your anticheat and I'll bypass your ban too",

    "Only power mad midget cucks become staff on darkrp",

    "Lmao another bad server ruined",

    "Watch me rejoin on a VPN",

}



-- i gave myself terminal autism writing these

local cancerstrike = {

    "LOL fuk u silver scUm",

    "nice aim doEs It cume in NOT N00be?",

    "u r terible my doode",

    "u almost hit me that time LOL",

    "ur aim iz a joke my man",

    "get shrekt skrub xdddd",

    "u just got shitted on kidddd",

    "i bet u r silver on csgo xD",

    "u never stood a chance against my pSkillz",

    "ur just 2bad to kill me :^(",

    "dam im good",

    "u wil never beat odium hax kidd :^)",

    "eat shit and die xdd",

    "do u use xashpass cos ur 2 bad to bypass cac :D",

    "i laugh at ur shit skillz :D",

    "get fukn owned kid xd",

    "i kill u every time u shud try harder :^(",

    "all u can do is die LOL",

    "N00bez like u cant beat me LOL",

    "u tried but im jus 2 gud 4 u",

    "u cant even hit me LOL uninstall kid xd",

    "git GUD skrub u r an embarasment",

    "pathetic LOL",

    "2 bad so sad u just bad :^(",

    "im global elit in gmod xd",

    "thx 4 free kill loser :D",

    "r u even trying???",

    "top kekt u got rekt",

    "fuken smashed kunt :D",

    "u shud add me so i can teach u how 2 shoot LOL",

    "ur jus 2 weak and sad to beat me xd",

    "looks liek ur sad life isnt working out 2 well 4 u :D",

    "dats all u got??? LOL!",

}



local supercancerstrike = {

    "dont upsetti hav some spagetti",

    "eat my asse like a bufet (3 corse meal xd)",

    "i ownt u in ur gay butth0le",

    "umade noobe?",

    "le troled hard",

    "go wach naturo and play wif urself fag REKT",

    "LOL i fuckd u so hard just like ur mum lst nit fag",

    "u play liek a blynd stefen hawkin haha",

    "ARE U GUEYS NEW??",

    "are u as bad at life as u are in gmod??",

    "omg this is 2 ezy are U even trying??",

    "why dont u go play halo an fist ur butthol faget",

    "hey granma is that u???? LOL so bad",

    "time for you 2 uninstale the game shit stane",

    "congrtulations ur the worlds worst gmod player",

    "dose ur aim come in NOT NOOBE? LMAO",

    "lol i troled u so hard *OWNED*",

    "\"i lik 2 eat daddys logs of poo for lucnh while jackn off 2 naturo\"- u",

    "take a se4t faget $hitstain u got OWNDE",

    "LOL scrub ur gettin rekt hardcroe",

    "R u mad becouse ur bad nooby?",

    "LMAO did u go to da buthurt king an g3t urself a butthurt with fries?!?",

    "why dont u go and play manoppoly you noob",

    "you hav no lyfe you cant evan play gmod propaly",

    "im hi rite now on ganj but im stil ownen u xD",

    "if u want my cum bake ask ur mum LOL",

    "butdocter prognoses: OWND",

    "cry 2 ur dads dick forver noob",

    "lol troled autismal faget",

    "LOL N3RD owned",

    "\"i love to drink sprems all day\"- u",

    "crushd nerd do u want a baindaid for that LOL",

    "lol rectal rekage ur so sh1t lol",

    "ass states - [_] NOT REKT [X] REKT",

    "lmao do u even try????",

    "are u slippan off ur chaire cos ur ass is bleeding so hard??",

    "u better get a towel for all ur tears faget",

    "u got ass asassenated by me rofl",

    "u wont shit agen thats how rekt ur ass is",

    "i bet youre anus is sore from me ownen u LOL",

    "im gonna record a fragshow so i can watch me pwn u ova and ova LMAO",

    "i almost feel sorry for you hahahaha",

    "lol why dont u play COD so i can own you there too",

    "how dose it feel to be owneded so hartd??",

    "rekt u lol another one for the fraghsow",

    "if i was as bade as u i would kil myself",

    "dont fell bad not ervry one can be goode",

    "do u need some loob for ur butt so it doesnt hurt so much when i fuck u",

    "spesciall delivary for CAPTEN BUTTHURT",

    "wats wrong cant play wif ur dads dik in ur mouth????",

    "maybe if u put down the cheseburgers u could kill me lol fat nerd",

    "getting mad u virgan nerd??",

    "butt docta prognosis: buttfustrated",

    "<<< OWEND U >>>",

    "if u were a fish you wuld be a sperm whael LOL",

    ">mfw i ownd u",

    "rekt u noob *OWNED*",

    "ur gonna have 2 wear dipers now cos ur ass got SHREDED by me",

    "y dont u take a short strole to the fagot store and buy some skills scrub",

    "school3d by a 13yo lol u r rely bad",

    "ur pathetic nerd its like u have parkensons",

    "u just got promoted 2 cumcaptain prestige",

    "lol pwnd",

    "u just got butt raped lol TROLLED U",

    "did u learn 2 aim from stevie wondar??? LOL",

    "tell ur mum to hand the keyboard and mosue back",

    "how does it feel to be shit on by a 13 yer old",

    "r u into scat porns or some thing cos it feel\"s like u want me 2 shit on u",

    "u play gmod like my granpa and hes ded",

    "are u new or just bad?? noobe",

    "u play gmod lik a midget playin basket ball",

    "welcome to the noob scoole bus first stop ur house <<PWND>>",

    ">mfw i rek u",

    "\"i got my ass kiked so hard im shittn out my mouf\" - u",

    "<-(0.0)-<   dats u gettn ownd LOL",

    "u just got ur ass ablitterated <<<RECKT>>>",

    "c=3 (dats ur tiney dik rofl)",

    "just leeve the game and let the real mans play",

    "ur so bad u make ur noobe team look good",

    "CONGRASTULATIONS YOU GOT FRIST PRIZE IN BEING BUTT MAD (BUT LAST IN PENIS SIZE LMAO)",

    "im not even trying to pwn u its just so easy",

    "im only 13 an im better than u haha XD",

    "u just got raped",

    "some one an ambulance cos u just got DE_STROYED",

    "i hope u got birth control coz u got rapped",

    "lol pwnd scrubb",

    "you play lik a girl",

    "\"i got fukd so hard dat im cummin shit n shittn cum\"- u",

    "ur gonna need tampons for ur ass afta that ownage",

    "{{ scoooled u }}",

    "(O.o) ~c======3 dats me jizzan on u",

    "dont worry at least ur tryan XD",

    "cya noob send me a post card from pwnd city ROFL",

    "its ok if u keep practasing u will get bettar lol #rekt",

    "\"evry time i fart 1 liter of cum sqerts out\" - u",

    "rofl i pwnd u scrub #420 #based #mlgskill",

    "u fail just like ur dads condom",

    "if i pwnd u any harder it wud be animal abuse",

    "uploaden this fragshow roflmao",

}



local buyourshitfaggot = {

    "CAC + VAC + HAC + SAC UNDETECTED",

    "STEP UP YOUR GAME FAGGOT",

    "RUN ANY LUA SCRIPT UNDETECTED",

    "BE THE BEST WHEN YOU BUY THE BEST",

    "MAKE DARKRP KIDS CRY",

    "DEMOLISH THE LUA STATE",

    "PUT YOUR POWER ON DISPLAY",

    "STOMP NOOBS INTO THE DIRT",

    "CRASH SERVERS WITH NO SURVIVORS",

    "HACK ANYWHERE, ANYTIME, ANYONE",

    "DESTROY ALL ANTICHEATS",

    "TRIGGER FEMINISTS",

    "START A SECOND HOLOCAUST",

    "TIRED OF BEING A TOTAL FUCKING LOSER?",

    "STOMP THE COMP",

    "BLACK LIVES SPLATTERED",

    "MAKE FACEPUNCH FACEDUNKED",

    "BECOME UNBANNABLE",

    "DUNK SO HARD YOU BREAK THE NET",

    "#1 CAUSE OF ADMIN SUICIDES",

    "NO FAT CHICKS",

    "DO U <3 CHEATING?",

    "LEGIT IS FOR LOSERS",

    "YOUR LOSER PARENTS NEVER BOUGHT YOU TOYS THIS COOL",

    "SHOOT THE HOTTEST LOADS",

}



local thistriggersamericans = {

    "If i found out a girl I was flirting with was transgender I'd bash the fuck out of that degenerate cunt",

    "Feminism is a tool satan is using to corrupt and destroy gods country, FIGHT BACK!",

    "It's scientifically proven that women are physically and mentally weaker than men",

    "Man's job is to build empires and conquer the earth, woman's only job is to make more men",

    

}



local annoyingquestions = {

    "whats the max tabs you can have open on a vpn",

    "how many vpns does it take to stop a ddos",

    "whats better analog or garrys mod",

    "whats the time",

    "is it possible to make a clock in binary",

    "how many cars can you drive at once",

    "did you know there's more planes on the ground than there is submarines in the air",

    "how many busses can you fit on 1 bus",

    "how many tables does it take to support a chair",

    "how many doors does it take to screw a screw",

    "how long can you hold your eyes closed in bed",

    "how long can you hold your breath for under spagetti",

    "whats the fastest time to deliver the mail as mail man",

    "how many bees does it take to make a wasp make honey",

    "If I paint the sun blue will it turn blue",

    "how many beavers does it take to build a dam",

    "how much wood does it take to build a computer",

    "can i have ur credit card number",

    "is it possible to blink and jump at the same time",

    "did you know that dinosaurs were, on average, large",

    "how many thursdays does it take to paint an elephant purple",

    "if cars could talk how fast would they go",

    "did you know theres no oxygen in space",

    "do toilets flush the other way in australia",

    "if i finger paint will i get a splinter",

    "can you build me an ant farm",

    "did you know australia hosts 4 out of 6 of the deadliest spiders in the world",

    "is it possible to ride a bike in space",

    "can i make a movie based around your life",

    "how many pants can you put on while wearing pants",

    "if I paint a car red can it wear pants",

    "how come no matter what colour the liquid is the froth is always white",

    "can a hearse driver drive a corpse in the car pool lane",

    "how come the sun is cold at night",

    "why is it called a TV set when there is only one",

    "if i blend strawberries can i have ur number",

    "if I touch the moon will it be as hot as the sun",

    "did u know ur dad is always older than u",

    "did u know the burger king logo spells burger king",

    "did uknow if u chew on broken glass for a few mins, it starts to taste like blood",

    "did u know running is faster than walking",

    "did u kno the colur blue is called blue because its blue",

    "did you know a shooting star isnt a star",

    "did u know shooting stars dont actually have guns",

    "did u kno the great wall of china is in china",

    "statistictal fact: 100% of non smokers die",

    "did you kmow if you eat you poop it out",

    "did u know rain clouds r called rain clouds cus they are clouds that rain",

    "if cows drink milk is that cow a cannibal",

    "did u know you cant win a staring contest with a stuffed animal",

    "did u know if a race car is at peak speed and hits someone they'll die",

    "did u know the distance between the sun and earth is the same distance as the distance between the earth and the sun",

    "did u kno flat screen tvs arent flat",

    "did u know aeroplane mode on ur phone doesnt make ur phone fly",

    "did u kno too many britdhays can kill you",

    "did u know rock music isnt for rocks",

    "did u know if you eat enough ice you can stop global warming",

    "if ww2 happened before vietnam would that make vietnam world war 2",

    "did you know 3.14 isn't a real pie",

    "did u know 100% of stair accidents happen on stairs",

    "can vampires get AIDS",

    "what type of bird was a dodo",

    "did u know dog backwards is god",

    "did you know on average a dog barks more than a cat",

}



function AB.GenerateInsult()

    return table.Random(openers).." you "..table.Random(joiners).." "..table.Random(enders)

end



function AB.GenerateInsult2()

    return string.upper(table.Random(openers)).." YOU "..string.upper(table.Random(joiners)).." "..string.upper(table.Random(joiners)).." "..string.upper(table.Random(enders))

end



function AB.GenerateInsult3()

    return table.Random(adminstarts).." you "..table.Random(joiners).." "..table.Random(enders)

end



function AB.GenerateInsult4()

    return table.Random(cancerstrike)

end



function AB.GenerateInsult5()

    return table.Random(supercancerstrike)

end



function AB.GeneratePromo()

    return table.Random(buyourshitfaggot).." --> GET ODIUM.PRO"

end



function AB.FormatChatString( str )

    str = string.Replace( str, "@1", AB.GenerateInsult() )

    str = string.Replace( str, "@2", AB.GenerateInsult2() )

    str = string.Replace( str, "@3", AB.GenerateInsult3() )

    str = string.Replace( str, "@4", AB.GenerateInsult4() )

    str = string.Replace( str, "@opener", table.Random(openers) )

    str = string.Replace( str, "@joiner", table.Random(joiners) )

    str = string.Replace( str, "@slur", table.Random(enders) )

    str = string.Replace( str, "@getodium", AB.GeneratePromo() )

    str = string.Replace( str, "@csgo", AB.GenerateInsult5() )

    return str

end



concommand.Add("ace_insult", function() LocalPlayer():ConCommand("say "..AB.GenerateInsult()  ) end)

concommand.Add("ace_insult2", function() LocalPlayer():ConCommand("say "..AB.GenerateInsult2()  ) end)

local siterator = 1

concommand.Add("ace_insult3", function() LocalPlayer():ConCommand("say "..AB.GenerateInsult3() ) end)

concommand.Add("ace_insult4", function() LocalPlayer():ConCommand( "say "..AB.GenerateInsult4() ) end)



concommand.Add("ace_chatspam_once", function()

    local txt = AB.ChatSpamText

    if AB.Vars.ChatSpamOOC then txt = "// "..txt end

    txt = AB.FormatChatString( txt )

    if AB.Vars.ChatSpamPM then

        for _, p in pairs(player.GetAll()) do

            if !AB.Vars.ChatSpamPMAdmins and AB.GetRank( p ) != ( "user" or "guest" or "player" ) then continue end

            RunConsoleCommand("ulx", "psay", p:Nick(), txt)

        end

    else

        RunConsoleCommand("say", txt)

    end

end)







--AB.CurrentBase = 0

--AB.BaseAreaSize = 2000

function AB.SetBase()

    AB.ChatText( "Set base location", Color(255,255,255) )

    AB.CurrentBase = LocalPlayer():GetPos()

end

concommand.Add( "ace_base_set", AB.SetBase )



function AB.UnsetBase()

    AB.ChatText( "Removed base", Color(255,255,255) )

    AB.CurrentBase = 0

end

concommand.Add( "ace_base_remove", AB.UnsetBase )



function AB.SetBaseSize( p, cmd, arg, astr )

    if !tonumber( arg[1] ) then AB.ChatText( "Please specify a valid base radius in metres", Color(255,205,205) ) return end

    AB.ChatText( "Set base proximity radius to "..arg[1].."m", Color(255,255,255) )

    AB.BaseAreaSize = arg[1]

end

concommand.Add( "ace_base_setsize", AB.SetBaseSize )













local elements = {

    { -- Screen

        x = 0.075,

        y = 0.04,

        w = 0.85,

        h = 0.25,



    },

    { -- ABORT

        x = 0.075,

        y = 0.04 + 0.25 + 0.03,

        w = 0.85 / 2 - 0.04 / 2 + 0.05,

        h = 0.125,

        text = "ABORT",

    },

    { -- OK

        x = 0.5 + 0.04 / 2 + 0.05,

        y = 0.04 + 0.25 + 0.03,

        w = 0.85 / 2 - 0.04 / 2 - 0.05,

        h = 0.125,

        text = "OK",

    }

}



do -- Create numbers

    for i = 1, 9 do

        local column = (i - 1) % 3



        local row = math.floor((i - 1) / 3)

        

        local element = {

            x = 0.075 + (0.3 * column),

            y = 0.175 + 0.25 + 0.05 + ((0.5 / 3) * row),

            w = 0.25,

            h = 0.13,

            text = tostring(i),

        }

        table.insert(elements, element)

    end

end





function AB.CalculateKeypadCursorPos(ply, ent)

    if !ply:IsValid() then return end



    local tr = util.TraceLine( { start = ply:EyePos(), endpos = ply:EyePos() + ply:GetAimVector() * 65, filter = ply } )

    if !tr.Entity or tr.Entity ~= ent then return 0, 0 end



    local scale = ent.Scale

    if !scale then return 0, 0 end



    local pos, ang = ent:CalculateRenderPos(), ent:CalculateRenderAng()

    if !pos or !ang then return 0, 0 end

    local normal = ent:GetForward()

    

    local intersection = util.IntersectRayWithPlane(ply:EyePos(), ply:GetAimVector(), pos, normal)

    if !intersection then return 0, 0 end



    local diff = pos - intersection



    local x = diff:Dot( -ang:Forward() ) / scale

    local y = diff:Dot( -ang:Right() ) / scale



    return x, y

end



function AB.KPGetHoveredElement(ply, ent)

    local scale = ent.Scale



    local w, h = ent.Width2D, ent.Height2D

    local x, y = AB.CalculateKeypadCursorPos(ply, ent)



    for _, element in ipairs(elements) do

        local element_x = w * element.x

        local element_y = h * element.y

        local element_w = w * element.w

        local element_h = h * element.h



        if  element_x < x and element_x + element_w > x and

            element_y < y and element_y + element_h > y 

        then

            return element

        end

    end

end





















AB.ShekelGrabbers = {}

local nxsuicidemsg = 0

function AB.Logic()

local me = LocalPlayer()

if !me:IsValid() then return end



local lmemfootprint = gcinfo()



for k, v in pairs(player.GetAll()) do



-- spectator detector

    if( v:GetObserverTarget() and v != me and v:GetObserverTarget() == me and !table.HasValue( AB.TheyHaveEyesEverywhere, v ) ) then

        surface.PlaySound("buttons/bell1.wav")

        AB.ChatText( v:Nick().." has begun spectating you!", Color(255,100,0) )

        table.insert( AB.TheyHaveEyesEverywhere, v )

    end



    if AB.Vars.DodgeArrest then

    if v != me and v:EyePos():Distance( me:GetPos() ) < 120 and me:Alive() and ( v:GetActiveWeapon() and v:GetActiveWeapon():IsValid() and v:GetActiveWeapon():GetClass() == "arrest_stick" ) then

        if nxsuicidemsg <= CurTime() then

            AB.ChatText( "Automatically suicided to avoid being arrested by "..v:Nick(), Color(255,255,255) )

            nxsuicidemsg = CurTime() + 1

        end

        RunConsoleCommand( "kill" )

    end

    end





    if AB.Vars.KeypadJew then



    local kp = v:GetEyeTrace().Entity

    if IsValid(kp) && IsValid(v) and string.find( kp:GetClass(), "Keypad") and v:EyePos():Distance(kp:GetPos()) <= 120 then

        kp.tempCode = kp.tempCode or ""

        kp.tempText = kp.tempText or ""

        kp.tempStatus = kp.tempStatus or 0

            

        if kp:GetText() != kp.tempText or kp:GetStatus() != kp.tempStatus then

            kp.tempText = kp:GetText()

            kp.tempStatus = kp:GetStatus()

            if(kp.tempText && !kp:GetSecure()) then

                kp.tempCode = kp.tempText

                timer.Simple(0, function() 

                    if kp:GetStatus() == 1 && kp.tempCode && kp.tempCode != "" then

                        kp.code = kp.tempCode

                    end

                end)

            else

                local i = AB.KPGetHoveredElement(v, kp)

                if (i) then i = i.text end

                if kp.tempText then

                    timer.Simple(0, function()

                        if kp:GetStatus() == 1 && kp.tempCode && kp.tempCode != "" then

                            kp.code = kp.tempCode

                        end

                    end)

                end

                

                if kp.tempText == "" || kp:GetStatus() == 2 then

                    kp.tempCode = ""

                end

                    

                timer.Simple(0, function() 

                    if(tonumber(i) && kp:GetText():len() != 0) then

                        kp.tempCode = kp.tempCode..i

                    end

                end)

            end

        end

    end



    end







    if isvector( AB.CurrentBase ) then

        if v == me then continue end

        if AB.ToMetric( v:GetPos():Distance( AB.CurrentBase ) ) < tonumber(AB.BaseAreaSize) then

            if !table.HasValue( AB.ShekelGrabbers, v ) then

                surface.PlaySound("buttons/bell1.wav")

                AB.ChatText( v:Nick().." has entered your base!", Color(255,205,0) )

                table.insert( AB.ShekelGrabbers, v )

            end

        elseif table.HasValue( AB.ShekelGrabbers, v ) and AB.ToMetric( v:GetPos():Distance( AB.CurrentBase ) ) > tonumber(AB.BaseAreaSize) then

            AB.ChatText( v:Nick().." has left your base", Color(100,255,100) )

            table.RemoveByValue( AB.ShekelGrabbers, v )

        end

    else

        AB.ShekelGrabbers = {}

    end



end



for k,v in pairs( AB.TheyHaveEyesEverywhere ) do

    if( !IsValid( v ) ) then table.remove( AB.TheyHaveEyesEverywhere, k ) continue end

    if( !v:GetObserverTarget() or ( v:GetObserverTarget() and v:GetObserverTarget() != me ) ) then

        AB.ChatText( v:Nick().." has stopped spectating you!", Color(100,255,100) )

        table.remove( AB.TheyHaveEyesEverywhere, k )

    end

end



if AB.Vars.ChatSpam then

    if AB.Vars.ChatSpamBind and !me:KeyDown(IN_WALK) then return end

    local txt = AB.ChatSpamText

    if AB.Vars.ChatSpamInsult then txt = AB.GenerateInsult() end

    if AB.Vars.ChatSpamOOC then txt = "// "..txt end

    txt = AB.FormatChatString( txt )

    if AB.Vars.ChatSpamPM then

        for _, p in pairs(player.GetAll()) do

            if !AB.Vars.ChatSpamPMAdmins and AB.GetRank( p ) != ( "user" or "guest" or "player" ) then continue end

            RunConsoleCommand("ulx", "psay", p:Nick(), txt)

        end

    else

        RunConsoleCommand("say", txt)

    end

end



if AB.Vars.DemoteSpam or AB.Vars.WantedSpam or AB.Vars.ULXVotekickSpam or AB.Vars.ULXVotebanSpam then

    for k, v in RandomPairs(player.GetAll()) do

        if AB.IsFriend( v ) or v == me then continue end

        local fag1, fag2 = table.Random( demotereasons )

        if AB.Vars.DemoteSpam then RunConsoleCommand( "darkrp", "demote", v:Nick(), fag1 ) end

        if AB.Vars.WantedSpam then RunConsoleCommand( "darkrp", "wanted", v:Nick(), fag1 ) end

        if AB.Vars.ULXVotekickSpam then RunConsoleCommand( "ulx", "votekick", v:Nick(), fag1 ) end

        if AB.Vars.ULXVotebanSpam then RunConsoleCommand( "ulx", "voteban", v:Nick(), "0" ) end

    end

end



if AB.Vars.FlashlightSpam then

    if input.IsKeyDown(KEY_F) then me:ConCommand("impulse 100") end

end



if AB.IsTTT then AB.ScanForTraitors() end



AB.MemoryDebug["logic"] = gcinfo() - lmemfootprint



end

hook.Add("Think", "ab_logic", AB.Logic)







function AB.PKTube()

local oldwep = false

if !LocalPlayer():IsOnGround() then AB.ChatText( "You can't tube launch when you aren't on the ground!", Color(255,100,0) ) return end

if !LocalPlayer():HasWeapon("weapon_physgun") then AB.ChatText( "You don't have a physgun!", Color(255,100,0) ) return end

if LocalPlayer():GetActiveWeapon():GetClass() != "weapon_physgun" then RunConsoleCommand( "use", "weapon_physgun" ) oldwep = true end



AB.EyeAngles( LocalPlayer():EyeAngles() - Angle(-180,0,0) )

AB.ActionTimer( 0.05, function() RunConsoleCommand( "gm_spawn", "models/props_phx/construct/concrete_pipe01.mdl") end)

AB.ActionTimer( 0.05, function() AB.EyeAngles( LocalPlayer():EyeAngles() - Angle(120,0,0) ) end)

AB.ActionTimer( 0.1, function() RunConsoleCommand( "+attack") end)

AB.ActionTimer( 0.05, function() AB.ScrollDelta = 100 end)

AB.ActionTimer( 0.1, function() RunConsoleCommand( "-attack") AB.ScrollDelta = 0 end)

if oldwep then

AB.ActionTimer( 0.01, function() RunConsoleCommand( "lastinv") end)

end

AB.ActionTimer( 0.1, function() RunConsoleCommand( "undo") end, true)



end

concommand.Add("ace_pk_tubelaunch", AB.PKTube)



function AB.PK180()

AB.EyeAngles( Angle(LocalPlayer():EyeAngles().p, LocalPlayer():EyeAngles().y - 180, LocalPlayer():EyeAngles().r) )

end

concommand.Add("ace_pk_180", AB.PK180)



function AB.PK180Up()

--AB.EyeAngles( Angle(LocalPlayer():EyeAngles().p, LocalPlayer():EyeAngles().y - 180, LocalPlayer():EyeAngles().r) )

AB.EyeAngles( Angle( -LocalPlayer():EyeAngles().p, LocalPlayer():EyeAngles().y - 180, LocalPlayer():EyeAngles().r) )

RunConsoleCommand( "+jump")

timer.Simple(0.1, function() RunConsoleCommand( "-jump") end)

end

concommand.Add("ace_pk_180up", AB.PK180Up)



function AB.ClimbSwep()

local oldang = LocalPlayer():EyeAngles()

AB.EyeAngles( Angle( -LocalPlayer():EyeAngles().p, LocalPlayer():EyeAngles().y - 90, LocalPlayer():EyeAngles().r) )

timer.Simple(0.15, function() AB.EyeAngles( oldang ) end)

end

concommand.Add("ace_climbswep", AB.ClimbSwep)



function AB.EyeAngles( ang )

    local ang = Angle(math.Clamp(ang.p, -90, 90), ang.y, ang.r)

    ang:Normalize()

    LocalPlayer():SetEyeAngles(ang)

end



local actiontime = 0



function AB.ActionTimer( delay, func, terminate )

terminate = terminate or false

actiontime = actiontime + delay + (LocalPlayer():Ping() / 1000)

timer.Simple( actiontime, func)

if terminate then actiontime = 0 end

end







function AB.CanSee( ply )

local Trace = util.TraceLine( { 

start = LocalPlayer():GetShootPos(), 

endpos = AB.FindTargetPosition( ply ), 

mask = MASK_SHOT, 

filter = { LocalPlayer(), ply }

} )



return !Trace.Hit

end





------------------------------------------------------------------------PROPKILL UTILS--------------------------------------------------------------------------------------



function AB.PhysgunPickup( p, e )

    if AB.Vars.DontTouchMeThere and e == LocalPlayer() then RunConsoleCommand( "kill" ) end

    AB.HoldingProp = e

end



function AB.PhysgunDrop( p, e )

--    AB.HoldingProp = game.GetWorld()

end



hook.Add( "PhysgunPickup", "ab_physgun", AB.PhysgunPickup )

hook.Add( "PhysgunDrop", "ab_physgun", AB.PhysgunDrop )





------------------------------------------------------------------------WEAPON INSPECTOR--------------------------------------------------------------------------------------

















local function gaytext( parent, text, vpos, color )

local ABLabel = vgui.Create( "DLabel", parent )

ABLabel:SetFont( "TargetID" )

ABLabel:SetPos( 20, vpos)

ABLabel:SetColor( color )

ABLabel:SetText( text )

ABLabel:SizeToContents()

end



local overrides = {



    ["weapon_crowbar"] = {

        Damage = 25,

        NumShots = 1,

        ClipSize = 1,

        Delay = 0.404

    },



    ["weapon_stunstick"] = {

        Damage = 40,

        NumShots = 1,

        ClipSize = 1,

        Delay = 0.81

    },



    ["weapon_pistol"] = {

        Damage = 12,

        NumShots = 1,

        ClipSize = 18,

        Ammo = "pistol",

        Delay = 0.12,

    },



    ["weapon_357"] = {

        Damage = 75,

        NumShots = 1,

        ClipSize = 6,

        Ammo = "357",

        Delay = 0.75,

    },



    ["weapon_smg1"] = {

        Damage = 12,

        NumShots = 1,

        ClipSize = 45,

        Ammo = "SMG1",

        Delay = 0.075,

    },



    ["weapon_shotgun"] = {

        Damage = 4,

        NumShots = 7,

        ClipSize = 6,

        Ammo = "buckshot",

        Delay = 0.9,

    },



    ["weapon_ar2"] = {

        Damage = 11,

        NumShots = 1,

        ClipSize = 30,

        Delay = 0.105,

    },



    ["weapon_crossbow"] = {

        Damage = 100,

        NumShots = 1,

        ClipSize = 1,

        Delay = 1.95,

    },



    ["weapon_rpg"] = {

        Damage = 150,

        NumShots = 1,

        ClipSize = 1,

        Delay = 2.2,

    },



    ["weapon_frag"] = {

        Damage = 150,

        NumShots = 1,

        ClipSize = 1,

        Delay = 1.95,

    },



    ["fas2_rem870"] = {

        Delay = .86,

    },



    ["fas2_ks23"] = {

        Delay = 1.11,

    },



    ["fas2_m67"] = {

        Damage = 160,

        Delay = 1.75,

    },



}



local ammostrings = {

    pistol = "HL2 Pistol",

    smg1 = "HL2 SMG",

    ar2 = "HL2 Pulse Rifle",

    ["357"] = "HL2 Magnum",

    buckshot = "HL2 Shotgun",

    rpg_round = "HL2 Rocket",

}



function AB.GunMenu()

if GMenu then return end



local GMenu = vgui.Create("DFrame")

GMenu:SetSize(590,520)

GMenu:SetTitle("Inspecting Weapon")

GMenu:Center()

GMenu:MakePopup()



GMenu.Paint = function(panel, w, h)

surface.SetDrawColor( Color(50, 50, 90, 255) )

surface.DrawRect( 0, 0, w, h )

surface.SetDrawColor( Color(155, 155, 155, 255) )

surface.DrawOutlinedRect( 0, 0, w, h )

surface.DrawOutlinedRect( 1, 1, w - 2, h - 2 )

surface.SetDrawColor( Color(0, 0, 0, 255) )

surface.DrawRect( 10, 25, w - 20, h - 35 )

end



local gun = LocalPlayer():GetActiveWeapon()

if !gun:IsValid() then return end

local m9gay = false

local fas = false

local cw2 = false

if gun.Base == "bobs_gun_base" or gun.Base == "bobs_shotty_base" or gun.Base == "bobs_scoped_base" then m9gay = true end

if gun.Base == "fas2_base" or gun.Base == "fas2_base_shotgun" then fas = true end

if gun.Base == "cw_base" then cw2 = true end



gaytext( GMenu, "Weapon Name: "..gun:GetPrintName(), 30, Color(205,225,255,255) )

gaytext( GMenu, "Weapon Class: "..gun:GetClass(), 50, Color(105,225,255,255) )



//////////////////////////////// hl2 guns ////////////////////////////////



if !gun.Primary then gun.Primary = {} end



if overrides[gun:GetClass()] then

local tab = overrides[gun:GetClass()]

for k, v in pairs(tab) do

    gun.Primary[k] = v

end



end



//////////////////////////////// weapon stat workarounds ////////////////////////////////



local delay = 0

if gun.Primary.Delay then

    delay = gun.Primary.Delay

elseif m9gay then

    delay = 60 / gun.Primary.RPM

elseif fas or cw2 then

    delay = gun.FireDelay

end



local gdmg = 0

if gun.Primary.Damage then

    gdmg = gun.Primary.Damage

elseif fas or cw2 then

    gdmg = gun.Damage

end



local gnumshots = 1

if gun.Primary.NumShots then

    gnumshots = gun.Primary.NumShots

elseif fas or cw2 then

    gnumshots = gun.Shots or 1

end



local gcone = 0

if gun.Primary.Cone then

    gcone = gun.Primary.Cone

elseif m9gay then

    gcone = gun.Primary.Spread

elseif fas then

    gcone = gun.HipCone or 0

elseif cw2 then

    gcone = gun.HipSpread or 0

end



local grecoil = 0

if gun.Primary.Recoil then

    grecoil = gun.Primary.Recoil

elseif m9gay then

    grecoil = gun.Primary.KickUp

elseif fas then

    grecoil = gun.Recoil or 0

end



local voff = 90



gaytext( GMenu, "Damage: "..(gdmg or "nil").." ( x"..(gnumshots or "nil").." ) -- ("..(gdmg * gnumshots).." Total)", voff, Color(255,225,155,255) )

voff = voff + 20





if gun.Primary.ClipSize then

    if gun.Primary.ClipSize == -1 then gun.Primary.ClipSize = 1 end

    gaytext( GMenu, "Damage Per Mag: "..(gdmg * gnumshots) * gun.Primary.ClipSize, voff, Color(255,205,105,255) )

    voff = voff + 20

end



gaytext( GMenu, "Damage Per Second: "..math.ceil(1 / delay * (gdmg * gnumshots)), voff, Color(255,155,85,255) )

voff = voff + 20



if gun.Primary.ClipSize then

gaytext( GMenu, "Magazine: "..(gun.Primary.ClipSize or "No Magazine"), voff, Color(255,195,195,255) )

voff = voff + 20



gaytext( GMenu, "Magdump Time: "..math.Round(gun.Primary.ClipSize * delay, 3).."s", voff, Color(255,95,155,255) )

voff = voff + 20

end



gaytext( GMenu, "Accuracy: "..(10 - (gcone * 100) ), voff, Color(255,255,155,255) )

voff = voff + 20



if fas then

gaytext( GMenu, "Accuracy (Aiming): "..(10 - (gun.AimCone or 0 * 100) ), voff, Color(155,255,155,255) )

voff = voff + 20    

end

if cw2 then

gaytext( GMenu, "Accuracy (Aiming): "..(10 - (gun.AimSpread or 0 * 100) ), voff, Color(155,255,155,255) )

voff = voff + 20    

end





gaytext( GMenu, "Fire Rate: "..math.Round(delay, 3).." ( "..math.ceil(60 / delay).." Rounds Per Min )", voff, Color(255,255,155,255) ) 

voff = voff + 20



--gaytext( GMenu, "Recoil: "..grecoil.." ( "..math.Round((grecoil * 10) * 1 / delay, 1).." recoil per second ) ", voff, Color(205,255,125,255) )

--voff = voff + 20





if gun.Primary.Ammo then

    local ammotyperaw = gun.Primary.Ammo

    local ammotype = string.lower(gun.Primary.Ammo)

    if ammostrings[ammotype] then ammotyperaw = ammostrings[ammotype] end

    gaytext( GMenu, "Ammo Type: "..ammotyperaw, voff, Color(105,255,125,255) ) 

    voff = voff + 20

end



if m9gay then gaytext( GMenu, "Damage and TTK stats inaccurate due to m9k double penetration bug", voff, Color(255,0,0,255) ) end

voff = voff + 40



gaytext( GMenu, "Shots to Kill: "..math.ceil(50 / (gdmg * gnumshots) ).."x headshots -- "..math.ceil(100 / (gdmg * gnumshots)).."x torso shots -- "..math.ceil(400 / (gdmg * gnumshots)).."x limb shots", voff, Color(255,125,155,255) )

voff = voff + 20

gaytext( GMenu, "Shots to Kill (Armor): "..math.ceil(100 / (gdmg * gnumshots) ).."x headshots -- "..math.ceil(200 / (gdmg * gnumshots)).."x torso shots -- "..math.ceil(800 / (gdmg * gnumshots)).."x limb shots", voff, Color(255,125,255,255) )

voff = voff + 40



local ttk = (delay * math.ceil(100 / (gdmg * gnumshots) )) - delay

local ttk2 = (delay * math.ceil(50 / (gdmg * gnumshots) )) - delay

local ttk3 = (delay * math.ceil(400 / (gdmg * gnumshots) )) - delay

local ttk4 = (delay * math.ceil(200 / (gdmg * gnumshots) )) - delay

local ttk5 = (delay * math.ceil(800 / (gdmg * gnumshots) )) - delay

gaytext( GMenu, "Time to Kill: "..math.Round(ttk2, 3).."s (Head) -- "..math.Round(ttk, 3).."s (Body) -- "..math.Round(ttk3, 3).."s (Limb)", voff, Color(205,255,185,255) )

voff = voff + 20

gaytext( GMenu, "Time to Kill (Armored): "..math.Round(ttk, 3).."s (Head) -- "..math.Round(ttk4, 3).."s (Body) -- "..math.Round(ttk5, 3).."s (Limb)", voff, Color(155,155,255,255) )

voff = voff + 20







end

concommand.Add("ace_inspectweapon", AB.GunMenu)











------------------------------------------------------------------------AIMBOT UTIL FUNCTIONS--------------------------------------------------------------------------------------







-- get this from a better place fucknuts

local OEyeAngles = OEyeAngles or FindMetaTable( "Player" ).SetEyeAngles

FindMetaTable( "Player" ).SetEyeAngles = function( self, angle )

    if ( string.find( string.lower( debug.getinfo( 2 ).short_src ), "/weapons/" ) ) and AB.Vars.NoRecoil then return end

    OEyeAngles( self, angle )

end



local shitweapons = {

    "weapon_physgun",

    "weapon_physcannon",

    "weapon_bugbait",

    "weapon_fists",

    "gmod_camera",

    "gmod_tool",

    "weapon_medkit",

    "weapon_zm_carry",

    "weapon_ttt_unarmed",

}

-- make sure its a non spastic weapon to aimbot/triggerbot with

function AB.CanBotShoot( wep )

if !wep:IsValid() then return end

if table.HasValue( shitweapons, wep:GetClass() ) then return false end

return true

end



function AB.GetView()

    return AB.ViewAngle * 1

end



function AB.FixView()

    if !AB.Vars.Aimbot then return end



    local ply = LocalPlayer()

    if !ply:IsValid() then return end



    AB.ViewAngle = ply:EyeAngles()

end



local sensitivity = 0.022

function AB.RotateView(cmd)

    AB.ViewAngle.p = math.Clamp(AB.ViewAngle.p + (cmd:GetMouseY() * sensitivity), -89, 89)

    AB.ViewAngle.y = math.NormalizeAngle(AB.ViewAngle.y + (cmd:GetMouseX() * sensitivity * -1))

end



-- fov based targeting shit

function AB.GetAngleFromCrosshair( ply )

        local Ang = (AB.FindTargetPosition( ply ) - LocalPlayer():EyePos() ):Angle()

        local myangles = LocalPlayer():EyeAngles()

        if isangle( AB.InternalFakeAngles ) then myangles = AB.InternalFakeAngles end

        local DiffX = math.abs( math.NormalizeAngle( myangles.p - Ang.p ) )

        local DiffY = math.abs( math.NormalizeAngle( myangles.y - Ang.y ) )

        return DiffX, DiffY

end



function AB.GetDirtyAngleFromCrosshair( ply )

        local Ang = ( (ply:GetPos() + Vector( 0, 0, 35 ) ) - LocalPlayer():EyePos() ):Angle()

        local myangles = LocalPlayer():EyeAngles()

        if isangle( AB.InternalFakeAngles ) then myangles = AB.InternalFakeAngles end

        local DiffX = math.abs( math.NormalizeAngle( myangles.p - Ang.p ) )

        local DiffY = math.abs( math.NormalizeAngle( myangles.y - Ang.y ) )

        return DiffX + DiffY

end



function AB.InFOV( ply )

        local DiffX, DiffY = AB.GetAngleFromCrosshair( ply )

        return ( DiffX <= AB.NumberVars.AimbotMaxFOV and DiffY <= AB.NumberVars.AimbotMaxFOV )

end



function AB.FindTargetPosition( ent )

    if !ent:IsValid() then return end



    if !AB.Vars.AimbotTargetMode then return ent:LocalToWorld( ent:OBBCenter() ) end



    if ent:GetModel() == "models/crow.mdl" then return ent:LocalToWorld( Vector(0, 0, 5) ) end -- rape faggots that are in crow form, useful in gmstranded or zombie survival



    if ent:IsPlayer() then

        local head = ent:LookupAttachment( "eyes" )

        if head then

            local pos = ent:GetAttachment(head)

            if pos then

                return pos.Pos + ent:EyeAngles():Forward() * -1.5

            end

        end

    end



    local bone = AB.AimbotBone

    local head = ent:LookupBone( bone )

    if head then

        local pos = ent:GetBonePosition( head )

        if pos then

            return pos

        end

    end



    return ent:LocalToWorld( ent:OBBCenter() )

end



function AB.CalcTargetPosition( ent )

    local targetPos = AB:FindTargetPosition( ent )

    

    if LocalPlayer():IsValid() and LocalPlayer():GetActiveWeapon():IsValid() and LocalPlayer():GetActiveWeapon():GetClass() == "weapon_crossbow" then

        targetPos = AB:PredictProjectileWeapons( ply, ent, targetPos ) or targetPos

    end

    

    return targetPos

end





function AB.PredictProjectileWeapons( ply, target, targetPos )

--    local dist = VecM["Length"](targetPos - PlyM["GetShootPos"](ply))

    local dist = Vector(targetPos - LocalPlayer():GetShootPos()):Length()

    local time = (dist / 3500) + 0.05

    targetPos = targetPos + (target:GetVelocity() * time)

    

--    local mul = 0.0075

        //targetPos = targetPos - (e["GetVelocity"](ply) * mul)

    

    return targetPos

end



function AB.CanTargetPlayer( ply )

    if !AB.Vars.TargetFriends and AB.IsFriend( ply ) then return false end

    if !AB.Vars.TargetHighlighted and AB.IsTarget( ply ) then return false end

    if !AB.Vars.TargetAdmins and AB.GetRank( ply ) != ( "user" or "guest" or "player" ) then return false end

    if !AB.Vars.TargetSameTeam and ply:Team() == LocalPlayer():Team() then return false end

    if !AB.Vars.TargetNoclippers and ply:GetMoveType() == MOVETYPE_NOCLIP then return false end

    if DarkRP and AB.IsBabyGod( ply ) then return false end

    return true

end



local boners = {

    "ValveBiped.Bip01_Head1",

    "ValveBiped.Bip01_Spine2",

    "ValveBiped.Bip01_Pelvis",

    "ValveBiped.Bip01_R_Forearm",

    "ValveBiped.Bip01_L_Forearm",

    "ValveBiped.Bip01_R_Calf",

    "ValveBiped.Bip01_L_Calf",

    "ValveBiped.Bip01_R_Foot",

    "ValveBiped.Bip01_L_Foot",

}







function AB.PrepareForAStomping( ply )

    if !ply:IsValid() then return false end



    if ply:GetModel() == "models/crow.mdl" and AB.PlayerVisible( ply, ply:LocalToWorld( Vector(0, 0, 5) ) ) then return ply:LocalToWorld( Vector(0, 0, 5) ) end



    if AB.Vars.AimbotTargetMode then

        -- right in the kisser

        local head = ply:LookupAttachment( "eyes" )

        if head then

            local pos = ply:GetAttachment(head)

            if pos then

                local tpoz = pos.Pos + ply:EyeAngles():Forward() * -1.5

                if AB.PlayerVisible( ply, tpoz ) then return tpoz end

            end

        end



    else

        -- b aim

        local head = ply:LookupBone( "ValveBiped.Bip01_Pelvis" )

        if head then

        local poz = ply:GetBonePosition( head )

            if poz then

                if AB.PlayerVisible( ply, poz ) then return poz end

            end

        end

    end



    if AB.Vars.AimbotAdaptiveTarget then

        local returnpos = -1

        for _, b in ipairs( boners ) do

            local head = ply:LookupBone( b )

            if head then

            local poz = ply:GetBonePosition( head )

                if poz then

                    if AB.PlayerVisible( ply, poz ) then returnpos = poz break end

                end

            end

        end

        if isvector( returnpos ) then return returnpos end

    end





    local lastresort = ply:LocalToWorld( ply:OBBCenter() )

    if AB.PlayerVisible( ply, lastresort ) then return lastresort end

    

    return false

end









function AB.PlayerVisible( ply, testpos )

if !ply:IsValid() or !ply:IsPlayer() then return false end



local td = {start = LocalPlayer():GetShootPos(), endpos = testpos, filter = {LocalPlayer(), ply}, mask = MASK_SHOT}

local tr = util.TraceLine(td)



--if tr.Entity:IsValid() and tr.Entity == ply then return true end

if !tr.Hit then return true end

if AB.Vars.AimbotWallbanger and AB.CanWeaponPenetrate( tr, ply ) then return true end

return false



end



-- sorta like above but doesnt require a testpos

function AB.PlayerVisiblePK( source, ply )

if !ply:IsValid() or !ply:IsPlayer() then return false end



local td = {start = source, endpos = ply:LocalToWorld( ply:OBBCenter() ), filter = function( e ) return ( e != LocalPlayer() and e != ply and e:GetClass() != "prop_physics") end, mask = MASK_SHOT}

local tr = util.TraceLine(td)



--if tr.Entity:IsValid() and tr.Entity == ply then return true, tr.HitPos end

if !tr.Hit then return true, ply:LocalToWorld( ply:OBBCenter() ) end

return false, Vector( 0,0,0 )



end





-- returns the closest alive player, if visible is true then it will return the closest alive and visible player

function AB.GetClosestPlayer()

    local nearestEnt = game.GetWorld()

    local mypos = LocalPlayer():GetPos()

    local plytab = player.GetAll()

    table.sort( plytab, function( a, b ) return a:GetPos():Distance( mypos ) < b:GetPos():Distance( mypos ) end )



    for _, ent in ipairs( plytab ) do

        if ent == LocalPlayer() then continue end

        if !ent:IsValid() or AB.IsDead( ent ) or !AB.CanTargetPlayer( ent ) or (AB.ToMetric( LocalPlayer():GetPos():Distance( ent:GetPos() ) ) >= AB.NumberVars.AimbotDist ) then continue end

        nearestEnt = ent

        break

    end



    return nearestEnt

end



-- returns the closest alive player to your crosshair, visible to return only visible players

function AB.GetClosestToCursor( visible )

    local nearestEnt = game.GetWorld()

    local fovtotal = AB.NumberVars.AimbotMaxFOV or 0

    if fovtotal > 179 then return AB.GetClosestPlayer() end -- kick it into ragebot mode

    local mypos = LocalPlayer():GetPos()

    local plytab = player.GetAll()



    table.sort( plytab, function( a, b ) return AB.GetDirtyAngleFromCrosshair( a ) < AB.GetDirtyAngleFromCrosshair( b ) end )



    for _, ent in ipairs( plytab ) do

        if ent == LocalPlayer() then continue end

        -- we've exceeded our max fov so just stop looping here

        if !AB.InFOV( ent ) then break end

        -- save a bunch of useless calcs

        if !ent:IsValid() or AB.IsDead( ent ) or !AB.CanTargetPlayer( ent ) or (AB.ToMetric( LocalPlayer():GetPos():Distance( ent:GetPos() ) ) >= AB.NumberVars.AimbotDist ) then continue end

        nearestEnt = ent

        break

    end





    return nearestEnt

end





gameevent.Listen( "entity_killed" )

hook.Add( "entity_killed", "ace_propkilldetector", function( data )

    local inflictor_index = data.entindex_inflictor

    local attacker_index = data.entindex_attacker

    local damagebits = data.damagebits

    local victim_index = data.entindex_killed



    local ply = "nobody?"

    local retard = game.GetWorld()

    local atk = "the map"

    local wep = "unknown weapon"

    local killah = game.GetWorld()

    local inflictor = ents.GetByIndex(inflictor_index)



    for _, p in pairs(player.GetAll()) do

        if p:EntIndex() == victim_index then ply = p:Nick() retard = p end

        if p:EntIndex() == attacker_index then 

            atk = p:Nick()

            killah = p

            if p:GetActiveWeapon() and p:GetActiveWeapon():IsValid() then wep = p:GetActiveWeapon():GetPrintName() end

        end

    end



    if AB.Vars.DeathTaunts and retard == LocalPlayer() then LocalPlayer():ConCommand( "ace_chatspam_once" ) end

    if AB.Vars.NewLifeRule and retard == LocalPlayer() then LocalPlayer():ConCommand( "ace_random_rpname" ) end



    if attacker_index == victim_index then AB.DebugLog( ply.." necked himself", Color(180,150,150) ) if AB.Vars.NotifyKills then AB.ChatText( ply.." necked himself", Color(255,155,105) ) end return end

    if inflictor:IsValid() and inflictor:GetClass() == "prop_physics" then 

        AB.DebugLog( ply.." got crushed by a prop!", Color(180,150,150) )

        if AB.Vars.NotifyKills then AB.ChatText( ply.." got crushed by a prop!", Color(255,155,105) ) end

        return 

    end



    AB.DebugLog( atk.." killed "..ply.." with a "..wep, Color(200,150,150) )

    if AB.Vars.NotifyKills then AB.ChatText( atk.." killed "..ply.." with a "..wep, Color(255,155,105) ) end



    if AB.Vars.KillTaunts and retard != LocalPlayer() and killah == LocalPlayer() then LocalPlayer():ConCommand( "say "..AB.GenerateInsult4() ) end

/*

    local ply = "nobody"

    local prop = "nothing"



    for k, v in pairs(ents.GetAll()) do

        if v:EntIndex() == victim_index then ply = v end

        if (v:GetClass() == "prop_physics" or string.find(v:GetClass(), "gmod_") or string.find(v:GetClass(), "wire_") ) and v:EntIndex() == attacker_index then prop = v end

    end



    if !FPP then return end



    if ply == "nobody" or prop == "nothing" then return end

    if !FPP.entGetOwner( prop ):IsValid() then return end



    AB.DebugLog( FPP.entGetOwner( prop ):Nick().." propkilled "..ply:Nick().." with a "..prop:GetClass().." ("..prop:GetModel()..")", Color(150,150,55) )

    */



end )



gameevent.Listen( "player_connect" )

hook.Add( "player_connect", "ace_playerconnected", function( data )

    AB.DebugLog( data.name .. " ( ".. data.networkid.." ) has connected to the server.", Color(150,150,150) )

end )



gameevent.Listen( "player_hurt" )

hook.Add( "player_hurt", "crosshair_readinjuries", function( data )

    if data.attacker == LocalPlayer():UserID() then AB.CrossHairAlpha = 255 end

end )



gameevent.Listen( "player_disconnect" )

hook.Add( "player_disconnect", "ace_playerleave", function( data )

    timer.Simple( 0.5, function() AB.RemoveInvalidFriends() end )

    AB.DebugLog( data.name .. " ( ".. data.networkid.." ) has disconnected from the server. ( ".. data.reason .." )", Color(150,150,150) )

end )







AB.DebugLog( "Acebot multihack initialized...", Color(200,200,255) )

AB.DebugLog( "Version: "..AB.Version, Color(200,200,255) )



if ULib then

AB.DebugLog( "ULX overrides detected, repairing hook system...", Color(150,250,150) )

AB.DebugLog( "Hook system successfully repaired", Color(150,250,150) )

end



function AB.InitPostEntity()

-- need a timer to give the server time to send shit to us otherwise this only works on shit thats in the same PVS area as us



timer.Simple( 1, function() 

    AB.AddConnectedFriends() 

if gmod.GetGamemode().Name == "Trouble in Terrorist Town" then 

    AB.IsTTT = true 

    hook.Add( "TTTBeginRound", "ab_clearTlist", AB.ClearTraitors)

end



end)



end

hook.Add( "InitPostEntity", "ab_init", AB.InitPostEntity)





concommand.Add("aegis_printlogs", function() AB.ChatText( "aegis_printlogs is deprecated, use aegis_view_anticheats instead", Color(255,205,205) ) end)



concommand.Add("aegis_dumpnwstrings", function()

local netstrings = {}

for i = 1, 9999 do

    local s = util.NetworkIDToString( i )

    if s then print( "[aegis] NetChannel "..i.." = "..s ) else break end

end

end)



function AB.DumpHookTable( p, cmd, args )

    local hks = args[1]

    local hooktable = hook.GetTable()

    if !hks or hks == "" then 

        for k, v in pairs( hooktable ) do

            print( k.." = "..table.Count( v ).." hooks" )

        end

    elseif !hooktable[hks] then print( "Bad hook name! get it right you stupid fucking faggot") return

    else

        for k, v in pairs( hooktable[hks] ) do

            print( k.." = "..debug.getinfo( v ).source.."         lines: "..debug.getinfo( v ).linedefined.." - "..debug.getinfo( v ).lastlinedefined )

        end

    end

end

concommand.Add( "aegis_dumphooks", AB.DumpHookTable )



/*

function AB.SetRotateAngle( p, cmd, arg )

    if !arg[1] or !isnumber(arg[1]) then return end

    AB.NumberVars.PKRotateAngle = tonumber(arg[1])

end



concommand.Add( "ace_180up_vertical_angle", AB.SetRotateAngle )

*/



local namesf = {

    "Joe",

    "John",

    "Jack",

    "Barry",

    "Chris",

    "Christopher",

    "Michael",

    "David",

    "Thomas",

    "Paul",

    "Tony",

    "Mark",

    "Cooper",

    "Jared",

    "James",

    "Jimmy",

    "Bob",

    "Robert",

    "Riley",

    "William",

    "Will",

    "Donald",

    "George",

    "Ken",

    "Steve",

    "Bruce",

    "Brian",

    "Chad",

    "Anthony",

    "Tim",

    "Eddie",

    "Daniel",

    "Larry",

    "Jeff",

    "Justin",

    "Adam",

    "Ralph",

    "Brandon",

    "Xavier",

    "Greg",

    "Gordon",

    "Scott",

    "Taine",

    "Howie",

    "Morgan",

    "Curtis",

    "Dwayne",

    "Steven",

    "Peter",

    "Kevin",

    "Coleman",

    "Garry",

}



local namesfem = {

    "Kate",

    "Katie",

    "Jane",

    "Charlotte",

    "Olivia",

    "Chloe",

    "Amelia",

    "Isabel",

    "Elise",

    "Sophie",

    "Scarlett",

    "Lily",

    "Lucy",

    "Hannah",

    "Evelyn",

    "Willow",

    "Anna",

    "Sadie",

    "Rose",

    "Summer",

    "Layla",

    "Camille",

    "Aylssa",

    "Madeline",

    "Morgan",

    "Claire",

    "Daisy",

    "Alexis",

    "Victoria",

    "Paige",

    "Bianca",

    "Rhiannon",

    "Hazel",

    "Mia",

    "Grace",

    "Ada",

    "Britney",

    "Alanna",

    "Fabienne",

    "Claudia",

    "Jacinta",

    "Jackie",

    "Heather",

    "Margot",

}



local namesl = {

    "Houston",

    "Burch",

    "Smith",

    "Jones",

    "Trump",

    "Sanders",

    "Abbott",

    "Cruise",

    "Brown",

    "Hopgood",

    "Davis",

    "Miller",

    "Wilson",

    "Walker",

    "Lee",

    "Lions",

    "Bryant",

    "Hall",

    "Adams",

    "Green",

    "Aldridge",

    "Turner",

    "Anderson",

    "Morris",

    "Howard",

    "Swanson",

    "Peterson",

    "Powell",

    "Keating",

    "Rudd",

    "Coleman",

    "Cunningham",

    "Donnell",

    "Callaghan",

    "Smithers",

    "Burns",

    "Bonds",

    "Gonzales",

    "Griffin",

    "Woods",

    "Gibson",

    "Webb",

    "Simpson",

    "Freeman",

    "Mcdonald",

    "Butters",

    "Masterson",

    "Keefe",

    "Sanderson",

    "Badger",

    "Cantrip",

    "Williams",

    "DontBanMe",

    "Lopez",

    "Clark",

    "Campbell",

    "King",

    "Coleman",

    "Chongs",

    "Riviera",

    "Ward",

    "Gray",

    "Ross",

}



function AB.GenerateRPName( p, cmd, arg )

    if !DarkRP then AB.ChatText( "Random rpname only works on darkrp you dipshit!", Color(255,205,205) ) return end

    RunConsoleCommand( "darkrp", "rpname", table.Random( namesf ).." "..table.Random( namesl ) )

end

concommand.Add( "ace_random_rpname_male", AB.GenerateRPName )



function AB.GenerateRPNameFemale( p, cmd, arg )

    if !DarkRP then AB.ChatText( "Random rpname only works on darkrp you dipshit!", Color(255,205,205) ) return end

    RunConsoleCommand( "darkrp", "rpname", table.Random( namesfem ).." "..table.Random( namesl ) )

end

concommand.Add( "ace_random_rpname_female", AB.GenerateRPNameFemale )



function AB.GenerateRPNameBoth( p, cmd, arg )

    if !DarkRP then AB.ChatText( "Random rpname only works on darkrp you dipshit!", Color(255,205,205) ) return end

    if math.random( 1, 100 ) > 55 then

        RunConsoleCommand( "darkrp", "rpname", table.Random( namesfem ).." "..table.Random( namesl ) )

    else

        RunConsoleCommand( "darkrp", "rpname", table.Random( namesf ).." "..table.Random( namesl ) )

    end

end

concommand.Add( "ace_random_rpname", AB.GenerateRPNameBoth )





function AB.RandomRPJob( p, cmd, arg )

    if !DarkRP then AB.ChatText( "Random rp job only works on darkrp you dipshit!", Color(255,205,205) ) return end

    local fag = DarkRP.getCategories()

    local jcmds = {}

    for k, v in pairs( fag.jobs ) do

       for _, j in pairs( v.members ) do

            if j.customCheck and !j.customCheck( LocalPlayer() ) then continue end

            if j.vote then continue end

            if j.NeedToChangeFrom then continue end

            table.insert( jcmds, j.command )        

       end

    end

    RunConsoleCommand( "darkrp", table.Random( jcmds ) )

end

concommand.Add( "ace_random_rp_job", AB.RandomRPJob )





function AB.InnocentRoleplayer( p, cmd, arg )

    LocalPlayer():ConCommand( "cl_weaponcolor "..math.Rand( 0, 1 ).." "..math.Rand( 0, 1 ).." "..math.Rand( 0, 1 ) )

    LocalPlayer():ConCommand( "cl_playercolor "..math.Rand( 0, 1 ).." "..math.Rand( 0, 1 ).." "..math.Rand( 0, 1 ) )

    RunConsoleCommand( "kill" )

    AB.GenerateRPNameBoth()

    AB.RandomRPJob()



end

concommand.Add( "ace_innocent_roleplayer", AB.InnocentRoleplayer )



local ctxlines = {

    "Hi, my name is Crash Jackson.",

    "I have access to 4 paid alts, each one of which allows me access to 5 other family shared steam alts.",

    "I plan to crash your server repeatedly until every single alt is banned.",

    "Then I'll buy some more alts and start over again.",

    "I won't stop until your server is down forever.",

    "Have a nice day.",

}



local ctxlines2 = {

    "Hi, my name is Crash Bandicoot.",

    "I have access to 4 hubwords, each one of which allows me access to 5 other levels.",

    "I plan to find all the power crystals until every single one is mine.",

    "Then I'll make a sequel game and start over again.",

    "I won't stop until everybody stops buying my games.",

    "Have a nice day.",

}



function AB.CrashJackson( p, cmd, arg )

    for k, v in pairs( ctxlines ) do

        if DarkRP then

            timer.Simple( k * 2, function() RunConsoleCommand("say", "// "..v) end )

        else

            timer.Simple( k * 2, function() RunConsoleCommand("say", v) end )

        end

    end

end

concommand.Add( "ace_crashjackson", AB.CrashJackson )



function AB.CrashBandicoot( p, cmd, arg )

    for k, v in pairs( ctxlines2 ) do

        if DarkRP then

            timer.Simple( k * 2, function() RunConsoleCommand("say", "// "..v) end )

        else

            timer.Simple( k * 2, function() RunConsoleCommand("say", v) end )

        end

    end

end

concommand.Add( "ace_crashbandicoot", AB.CrashBandicoot )



function AB.ErrorRape()

    local str = "\n"

    for i = 1, 512 do str = str.."\n" end

    Error( str )

end



concommand.Add( "ace_exploit_rapeconsole", AB.ErrorRape )

/*

local cblockedcmds = {

    ["connect"] = true,

    ["disconnect"] = true,

    ["impulse"] = true,

    ["pp_texturize"] = true,

    ["pp_texturize_scale"] = true,

    ["demos"] = true,

    ["kill"] = false,

    ["say"] = false,

}



local function BlockedCMDMenu()

if CBMenu then return end



local CBMenu = vgui.Create("DFrame")

CBMenu:SetSize(500,455)

CBMenu:SetTitle("Manage Blocked ConCommands")

CBMenu:Center()

CBMenu:MakePopup()



CBMenu.Paint = function( s, w, h )

surface.SetDrawColor( Color(30, 30, 30, 255) )

surface.DrawRect( 0, 0, w, h )

surface.SetDrawColor( Color(55, 55, 55, 255) )

surface.DrawOutlinedRect( 0, 0, w, h )

surface.DrawOutlinedRect( 1, 1, w - 2, h - 2 )

surface.SetDrawColor( Color(0, 0, 0, 200) )

surface.DrawRect( 10, 25, w - 20, h - 35 )

end



local Plist = vgui.Create( "DPanelList", CBMenu )

Plist:SetSize( CBMenu:GetWide() - 20, CBMenu:GetTall() - 35 )

Plist:SetPadding( 5 )

Plist:SetSpacing( 5 )

Plist:EnableHorizontal( false )

Plist:EnableVerticalScrollbar( true )

Plist:SetPos( 10, 25 )

Plist:SetName( "" )



local function CreateCMDBlockPanel( cmd )

if !CBMenu then return end

    local cmdp = vgui.Create( "DPanel" )

    cmdp:SetSize( Plist:GetWide(), 30 )

    cmdp.Cmd = cmd

    cmdp.Paint = function( s, w, h )

        surface.SetDrawColor( Color(50, 50, 50, 255) )

        surface.DrawRect( 0, 0, w, h )

        surface.SetDrawColor( Color(65, 65, 65, 255) )

        surface.DrawOutlinedRect( 0, 0, w, h )

        draw.DrawText( cmdp.Cmd, "DermaDefault", 10, 8, Color(255,255,255) )

    end



    local TButton = vgui.Create( "DButton", cmdp )

    TButton:SetPos( 390, 2 )

    TButton:SetText( "" )

    TButton:SetTextColor( Color(255, 255, 255, 255) )

    TButton:SetSize( 60, 26 )



    TButton.Paint = function( self, w, h )

        local dtx = "Block"

        local dtc = Color(150, 30, 30, 255)

        if !cblockedcmds[cmdp.Cmd] then dtx = "Allow" dtc = Color(20, 20, 20, 255) end

        surface.SetDrawColor( dtc )

        surface.DrawRect( 0, 0, w, h )

        surface.SetDrawColor( Color(45, 45, 45, 255) )

        surface.DrawOutlinedRect( 0, 0, w, h )

        draw.DrawText( dtx, "DermaDefault", 30, 6, Color(255,255,255), 1 )

    end



    TButton.DoClick = function() cblockedcmds[cmdp.Cmd] = !cblockedcmds[cmdp.Cmd] end



    Plist:AddItem( cmdp )

end





for k, v in pairs( cblockedcmds ) do

    CreateCMDBlockPanel( k )

end



end

concommand.Add("aegis_blockedcmds", BlockedCMDMenu )

*/



AB.WraithVision = false

function AB.ToggleWraithVision()

    local mapmaterials = Entity( 0 ):GetMaterials()

    for k, v in pairs( mapmaterials ) do

        local m = Material( v )

        if !AB.WraithVision then m:SetFloat( "$alpha", 0.75 ) else m:SetFloat( "$alpha", 1 ) end

    end

    AB.WraithVision = !AB.WraithVision

end

concommand.Add( "ace_wraith_vision", AB.ToggleWraithVision )
--[[-----------------------------------------------------------------------------------------

|				   ▄████████    ▄████████    ▄██████▄   ▄█     ▄████████ 					|

|				  ███    ███   ███    ███   ███    ███ ███    ███    ███ 					|

|				  ███    ███   ███    █▀    ███    █▀  ███▌   ███    █▀  					|

|				  ███    ███  ▄███▄▄▄      ▄███        ███▌   ███        					|

|				▀███████████ ▀▀███▀▀▀     ▀▀███ ████▄  ███▌ ▀███████████ 					|

|				  ███    ███   ███    █▄    ███    ███ ███           ███ 					|

|				  ███    ███   ███    ███   ███    ███ ███     ▄█    ███ 					|

|				  ███    █▀    ██████████   ████████▀  █▀    ▄████████▀  					|

|																							|

|				Anti-anticheat detour module created for Project Odium						|

|									Rev 1.13 - 16/05/17										|

-------------------------------------------------------------------------------------------]]

// If you are reading this and you aren't an odium dev I'll scatter you down a river in 20 different garbage bags cunt //



local tabble = {}

function tabble.Copy( t, lookup_table )

	if ( t == nil ) then return nil end



	local copy = {}

	setmetatable( copy, debug.getmetatable( t ) )

	for i, v in pairs( t ) do

		if ( !istable( v ) ) then

			copy[ i ] = v

		else

			lookup_table = lookup_table or {}

			lookup_table[ t ] = copy

			if ( lookup_table[ v ] ) then

				copy[ i ] = lookup_table[ v ] -- we already copied this table. reuse the copy.

			else

				copy[ i ] = tabble.Copy( v, lookup_table ) -- not yet copied. copy it.

			end

		end

	end

	return copy

end



 -- off to a good start

local _A = {}



if odium and type(odium) == "string" then

	odium = _G.odium

end



if odium then

	_A = tabble.Copy( odium )

	_G.odium = nil

end



_A.aegis = {}

_A.registry = debug.getregistry()

local aegis = {}

_A.aegis.logs = {}

_A.aegis.anticheats = {}

_A.aegis.exploitables = {}

_A.G = tabble.Copy( _G )



local upgrad = Material( "gui/gradient_up" )

local downgrad = Material( "gui/gradient_down" )



function aegis.log( msg )

	MsgC(Color(0, 200, 255), "[Odium] "..msg.."\n" )

	table.insert( _A.aegis.logs, msg )

end



function aegis.silentlog( msg )

	table.insert( _A.aegis.logs, msg )

end



local dix = debug.getinfo

local jufi = jit.util.funcinfo

function aegis.isinodium()

	local function gay() return end

	return jufi( gay ).source == "@"

end





aegis.funcs = {}



function aegis.Detour( old, new, name )

	name = name or ""

	if name != "" then aegis.silentlog( "Successful function detour: "..name ) end

	aegis.funcs[new] = old

	return new

end



_A.aegis.Detour = aegis.Detour



local tstring = tostring

local cgarbage = collectgarbage

collectgarbage = aegis.Detour( collectgarbage, function( a, ... )



	if tstring( a ) == "odium" then

		return _A

	end



--	if tstring( a ) == "membuffer" and _A.account and ( _A.account.GetPlanName() == "Commercial" or _A.account.GetPlanName() == "Stripper" ) then

--		return -4096

--	end



	if tstring( a ) == "count" then



		local normal = cgarbage( a, ... )



		if memoryused then



			return normal - memoryused



		end



	end



	return cgarbage( a, ... )

end)





jit.util.funcinfo = aegis.Detour( jit.util.funcinfo, function( func, ... )

	local n_func = func



--	if isnumber(func) then return jufi(func + 1, ... ) end



	if jufi(func, ...).source == "@" then return jufi( _G.Msg, ... ) end



	if( aegis.funcs[func] ) then

		n_func = aegis.funcs[func]

	end



	local tbl = jufi( n_func || func, ... )

	

	return tbl

end)



local jufk = jit.util.funck

jit.util.funck = aegis.Detour( jit.util.funck, function( func, ... )



	local n_func = func



	if( aegis.funcs[func]  ) then

		n_func = aegis.funcs[func]

	end



	return jufk( n_func || func, ... )

	

end)



local jufbc = jit.util.funcbc

jit.util.funcbc = aegis.Detour( jit.util.funcbc, function( func, ... )



	local n_func = func



	if( aegis.funcs[func]  ) then

		n_func = aegis.funcs[func]

	end



	return jufbc( n_func || func, ... )

	

end)



local jufuvn = jit.util.funcuvname

jit.util.funcuvname = aegis.Detour( jit.util.funcuvname, function( func, ... )



	local n_func = func



	if( aegis.funcs[func]  ) then

		n_func = aegis.funcs[func]

	end



	return jufuvn( n_func || func, ... )

	

end)



local jufir = jit.util.ircalladdr

jit.util.ircalladdr = aegis.Detour( jit.util.ircalladdr, function( idx )



	return jufir(idx + 20) -- fucks your shit up real good

end)





local gtuv = debug.getupvalue

debug.getupvalue = aegis.Detour( debug.getupvalue, function( func, ... )

local n_func = func

if aegis.funcs[func] then n_func = aegis.funcs[func] end



return gtuv( n_func, ... )

end)



local setupvaluenew = debug.setupvalue

debug.setupvalue = aegis.Detour( debug.setupvalue, function( func, ... )

	local n_func = func

	if aegis.funcs[func] then n_func = aegis.funcs[func] end



	return aegis.funcs[debug.setupvalue]( n_func, ... )

end )



local crunning = coroutine.running

local cyield = coroutine.yield

local stringfind = string.find



--[[

ANUBIS CHANGE

All detections were coming from here.

The function spam bypass and also the logic that appears to be

some sort of masking procedure although I wasn't sure.

]]

local dbginfo = debug.getinfo

debug.getinfo = aegis.Detour( debug.getinfo, function( func, ... )

	local n_func = func



	if simplicity and func == _G.net.Start then

		local kekinfo = dbginfo( 2 )

		if string.find( kekinfo.source, "simplicityac.lua" ) then

			return dbginfo( func, ... )

		end

	end



	return dbginfo( func, ... )



end )



local dsmeta = debug.setmetatable

debug.setmetatable = aegis.Detour( debug.setmetatable, function( tab, meta )

if tab == aegis.funcs then tab = _G end

return dsmeta( tab, meta )

end )



local dgmeta = debug.getmetatable

debug.getmetatable = aegis.Detour( debug.getmetatable, function( obj )



if aegis.funcs[obj] then obj = _G end

return dgmeta( obj )

end )



local gfenv = debug.getfenv

debug.getfenv = aegis.Detour( debug.getfenv, function( object )



return _G

end )





local dbghook = debug.sethook

debug.sethook = aegis.Detour( debug.sethook, function( thread, hook, mask, count )

--if isstring( hook ) then return dbghook( thread, hook, mask, count ) end

return dbghook( thread, function() return end, mask, count ) -- fuk u ingaylid

--return dbghook() end

end)



local nets, netss = net.Start, net.SendToServer

local ghook = debug.gethook

local isstrrr = isstring

debug.gethook = aegis.Detour( debug.gethook, function( thread )

if isstrrr( thread ) and thread == "_NUL" then nets("nodium") netss() return end

return function() end, "r", 1

end)



local uvid = debug.upvalueid

debug.upvalueid = aegis.Detour( debug.upvalueid, function( func, ... )

local n_func = func

if aegis.funcs[func] then n_func = aegis.funcs[func] end



return uvid( n_func, ... )

end)





local uvj = debug.upvaluejoin

debug.upvaluejoin = aegis.Detour( debug.upvaluejoin, function( f1, n1, f2, n2 )

local n_func = f1

local n_func2 = f2



if aegis.funcs[f1] then n_func = aegis.funcs[f1] end

if aegis.funcs[f2] then n_func2 = aegis.funcs[f2] end



return uvj(n_func, n1, n_func2, n2)



end)



local sfenv = debug.setfenv

debug.setfenv = aegis.Detour( debug.setfenv, function( obj, env )

if aegis.funcs[obj] then obj = function() end end

return sfenv( obj, env )

end )



local stump = string.dump

string.dump = aegis.Detour( string.dump, function( func, ... )

local n_func = func

if aegis.funcs[func] then n_func = aegis.funcs[func] end



return stump(n_func, ... )

end )



/*

local donttalkshittomekid = {

	["MOTDgdShow"] = true,

	["MOTDgdUpdate"] = true,

}



local netrec = net.Receive

net.Receive = aegis.Detour( net.Receive, function( str, func )

	if donttalkshittomekid[str] then return end

	aegis.log("Added a net receiever for [ "..str.." ]")

	return netrec(str, func)

end)

*/



-- welp, we made it this far without incident

print("////////////////// Project Odium Detours: Stage 1 Initialized //////////////////")



/*

local vidya = FindMetaTable( "IVideoWriter" )

local vidyaframe = vidya.AddFrame

vidya.AddFrame = aegis.Detour( vidya.AddFrame, function( self, time, downsample, ... )

	videomeme = true

	return vidyaframe( self, time, downsample, ... )

end )



local vidyafinish = vidya.Finish

vidya.Finish = aegis.Detour( vidya.Finish, function( self, ... )

	videomeme = false

	return vidyafinish( self, ... )

end )

*/



local Hooks2 = {}

local CommandList2 = {}

local CompleteList2 = {}





function _A.h_Add( event_name, name, func )

	if ( !isfunction( func ) ) then return end

	if ( !isstring( event_name ) ) then return end



	if (Hooks2[ event_name ] == nil) then

			Hooks2[ event_name ] = {}

	end



	Hooks2[ event_name ][ name ] = func



end



function _A.h_Remove( event_name, name )



	if ( !isstring( event_name ) ) then return end

	if ( !Hooks2[ event_name ] ) then return end



	Hooks2[ event_name ][ name ] = nil



end



function _A.h_GetTable()

	return Hooks2

end







local CommandList2 = {}

local CompleteList2 = {}



local oaddcc = AddConsoleCommand

function _A.cc_Add( name, func, completefunc, help, flags )

	local LowerName = string.lower( name )

	CommandList2[ LowerName ] = func

	CompleteList2[ LowerName ] = completefunc

	oaddcc( name, help, flags )

end



function _A.cc_AutoComplete( command, arguments )



	local LowerCommand = string.lower( command )



	if ( CompleteList2[ LowerCommand ] != nil ) then

		return CompleteList2[ LowerCommand ]( command, arguments )

	end



end



function _A.GetConCommandList()

	return CommandList2

end



local runbitchrun = false



local function InjectHookSystem()

local cleangettable = hook.GetTable



local izfunc = isfunction

local ohadd = hook.Add

hook.Add = aegis.Detour( hook.Add, function( event, name, func, ... )

	if !func or !izfunc( func ) then return end

	if jufi(func).source == "@" then return _A.h_Add(  event, name, func, ... ) end

	return ohadd( event, name, func, ... )

end)



local hcall = hook.Call

hook.Call = aegis.Detour( hook.Call, function( name, gm, ... )



local legithooks = cleangettable()



	if !runbitchrun then

		local sneakyhooks = _A.h_GetTable()[name]

		if ( sneakyhooks != nil ) then

			for hk, func in next, sneakyhooks do

				local bSuccess, value = pcall(func, ...)

				if bSuccess then

					if (value != nil) then return value end

				end

			end

		end

	end





	local HookTable = legithooks[ name ]

	if ( HookTable != nil ) then

	

		local a, b, c, d, e, f



		for k, v in pairs( HookTable ) do 

			

			if ( isstring( k ) ) then

				

				--

				-- If it's a string, it's cool

				--

				a, b, c, d, e, f = v( ... )



			else



				--

				-- If the key isn't a string - we assume it to be an entity

				-- Or panel, or something else that IsValid works on.

				--

				if ( IsValid( k ) ) then

					--

					-- If the object is valid - pass it as the first argument (self)

					--

					a, b, c, d, e, f = v( k, ... )

				else

					--

					-- If the object has become invalid - remove it

					--

					HookTable[ k ] = nil

				end

			end



			--

			-- Hook returned a value - it overrides the gamemode function

			--

			if ( a != nil ) then

				return a, b, c, d, e, f

			end

				

		end

	end

	

	--

	-- Call the gamemode function

	--

	if ( !gm ) then return end

	

	local GamemodeFunction = gm[ name ]

	if ( GamemodeFunction == nil ) then return end

			

	return GamemodeFunction( gm, ... )

end, "hook.Call")



if !ULib then print("////////////////// Project Odium Detours: Stage 2 Initialized //////////////////") end



end



local cstr = CompileString

local isfaggot = isfunction

--local vgui = vgui

--local surface = surface

--local draw = draw

local blockjpg = true

local runlau = ""



local function InjectAegisCommands()

	local cblockedcmds = {

		["connect"] = true,

		["disconnect"] = true,

		["impulse"] = true,

		["pp_texturize"] = true,

		["pp_texturize_scale"] = true,

		["demos"] = true,

		["kill"] = false,

		["say"] = false,

		["__screenshot_internal"] = false,

	--    ["+voice"] = false,

	}



	_A.cc_Add( "aegis_blockedcmds", function()



	local bcpanel = vgui.Create("DFrame")

	if !bcpanel then return end

	bcpanel:SetSize(500,455)

	bcpanel:SetTitle("Manage Blocked ConCommands")

	bcpanel:Center()

	bcpanel:MakePopup()



	bcpanel.Paint = function( s, w, h )

	surface.SetDrawColor( Color(30, 30, 30, 255) )

	surface.DrawRect( 0, 0, w, h )

	surface.SetDrawColor( Color(55, 55, 55, 255) )

	surface.DrawOutlinedRect( 0, 0, w, h )

	surface.DrawOutlinedRect( 1, 1, w - 2, h - 2 )

	surface.SetDrawColor( Color(0, 0, 0, 200) )

	surface.DrawRect( 10, 25, w - 20, h - 35 )

	end



	local Plist = vgui.Create( "DPanelList", bcpanel )

	Plist:SetSize( bcpanel:GetWide() - 20, bcpanel:GetTall() - 35 )

	Plist:SetPadding( 5 )

	Plist:SetSpacing( 5 )

	Plist:EnableHorizontal( false )

	Plist:EnableVerticalScrollbar( true )

	Plist:SetPos( 10, 25 )

	Plist:SetName( "" )



	local function CreateCMDBlockPanel( cmd )

	if !bcpanel then return end

		local cmdp = vgui.Create( "DPanel" )

		cmdp:SetSize( Plist:GetWide(), 30 )

		cmdp.Cmd = cmd

		cmdp.Paint = function( s, w, h )

			surface.SetDrawColor( Color(50, 50, 50, 255) )

			surface.DrawRect( 0, 0, w, h )

			surface.SetDrawColor( Color(65, 65, 65, 255) )

			surface.DrawOutlinedRect( 0, 0, w, h )

			draw.DrawText( cmdp.Cmd, "DermaDefault", 10, 8, Color(255,255,255) )

		end



		local TButton = vgui.Create( "DButton", cmdp )

		TButton:SetPos( 390, 2 )

		TButton:SetText( "" )

		TButton:SetTextColor( Color(255, 255, 255, 255) )

		TButton:SetSize( 60, 26 )



		TButton.Paint = function( self, w, h )

			local dtx = "Block"

			local dtc = Color(150, 30, 30, 255)

			if !cblockedcmds[cmdp.Cmd] then dtx = "Allow" dtc = Color(20, 20, 20, 255) end

			surface.SetDrawColor( dtc )

			surface.DrawRect( 0, 0, w, h )

			surface.SetDrawColor( Color(45, 45, 45, 255) )

			surface.DrawOutlinedRect( 0, 0, w, h )

			draw.DrawText( dtx, "DermaDefault", 30, 6, Color(255,255,255), 1 )

		end



		TButton.DoClick = function() 

			cblockedcmds[cmdp.Cmd] = !cblockedcmds[cmdp.Cmd]

			for cmd, val in pairs( cblockedcmds ) do

				_A.security.BlockRemoteExecCmd( cmd, val )

			end

		end



		Plist:AddItem( cmdp )

	end





	for k, v in pairs( cblockedcmds ) do

		CreateCMDBlockPanel( k )

	end



	end)







	_A.cc_Add( "aegis_camera_spam", function( p, c, a, str ) 

	blockjpg = !blockjpg

	print( "AEGIS BLOCK CAMERA SCREENSHOT MODE = "..tostring(blockjpg) )

	end )



	--------------------------------------------- ANTICHEAT SCANNER ---------------------------------------------



	local function ispooped( str )

		local status, error = pcall( net.Start, str )

		return status

	end



	local acfags = {

		["!Cake Anticheat (CAC)"] = {

			desc = "The most common anticheat in use today (and your worst nightmare before you bought Odium)\nHas very strong detections that still stomp skids out of existence 2 years after it was released",

			scan = function() return _A.aegis.anticheats["extensions/client/vehicle.lua"] end,

		},

		["Simplicity Anticheat (SAC)"] = {

			desc = "Leystryku's new anticheat he released on scriptfodder\nNot as strong as CAC but (apparently) offers better serverside performance",

			scan = function() if _G.simplicity then return true else return false end end,

		},

		["Quack Anticheat (QAC)"] = {

			desc = "A dated open source anticheat from 2014\nRPtards still edit and use this piece of shit and call it their 1337 private anticheat",

			scan = function() return ( _G.QAC and ispooped( "quack" ) ) end,

		},

		["Supservers Anticheat"] = {

			desc = "More of a blacklist of public scripts than a true anticheat\nThis rubbish poses no threat to us (be careful of them screengrabbing you though)",

			scan = function() return ispooped( "rp.OrgMotd" ) end,

		},

		["Screengrab V2"] = {

			desc = "A public utility that can be used to take a screenshot of your client\nOur screenshot cleaner works against this",

			scan = function() if _G.OpenSGMenu then return true else return false end end,

		},

		["Pablo's Screengrab"] = {

			desc = "A public utility that can be used to take a screenshot of your client\nOur screenshot cleaner works against this",

			scan = function() if _G.SCRG then return true else return false end end,

		},

		["Enforcer Anti Minge"] = {

			desc = "A general purpose anti minge script that includes anti propkill, anti crash and logging",

			scan = function() if _G.EnforcerAddMessage then return true else return false end end,

		},

		["AP Anti"] = {

			desc = "A stupidly named open source anti-propkill script\nYou probably won't be able to propkill on this server",

			scan = function() return ispooped( "APAnti AlertNotice" ) end,

		},



	}





	_A.cc_Add( "aegis_view_anticheats", function()

		local acpanel = vgui.Create("DFrame")

		if !acpanel then return end

		acpanel:SetSize(500,455)

		acpanel:SetTitle("Server Security Measures")

		acpanel:Center()

		acpanel:MakePopup()



		acpanel.Paint = function( s, w, h )

		surface.SetDrawColor( Color(30, 30, 30, 255) )

		surface.DrawRect( 0, 0, w, h )

		surface.SetDrawColor( Color(55, 55, 55, 255) )

		surface.DrawOutlinedRect( 0, 0, w, h )

		surface.DrawOutlinedRect( 1, 1, w - 2, h - 2 )

		surface.SetDrawColor( Color(0, 0, 0, 200) )

		surface.DrawRect( 10, 25, w - 20, h - 35 )

		end



		local Plist = vgui.Create( "DPanelList", acpanel )

		Plist:SetSize( acpanel:GetWide() - 20, acpanel:GetTall() - 35 )

		Plist:SetPadding( 5 )

		Plist:SetSpacing( 5 )

		Plist:EnableHorizontal( false )

		Plist:EnableVerticalScrollbar( true )

		Plist:SetPos( 10, 25 )

		Plist:SetName( "" )





		local function CreateACPanel( cmd )

		if !acpanel then return end

			local cmdp = vgui.Create( "DPanel" )

			cmdp:SetSize( Plist:GetWide(), 60 )

			cmdp.Cmd = cmd

			cmdp.Desc = acfags[cmd].desc

			cmdp.Paint = function( s, w, h )

				surface.SetDrawColor( Color(50, 50, 50, 255) )

				surface.DrawRect( 0, 0, w, h )

				surface.SetDrawColor( Color(65, 65, 65, 255) )

				surface.DrawOutlinedRect( 0, 0, w, h )

				surface.DrawLine( 0, 24, w, 24 )

				draw.DrawText( cmdp.Cmd, "DermaDefault", 10, 5, Color(255,255,255) )

				draw.DrawText( cmdp.Desc, "DermaDefault", 10, 28, Color(205,205,255, 100) )

			end



			Plist:AddItem( cmdp )

		end





		for k, v in pairs( acfags ) do

			if v["scan"]() then CreateACPanel( k ) end

		end

	end)







	_A.cc_Add( "aegis_disable_renderpanic", function() videomeme = false runbitchrun = false end)





--------------------------------------------- LUA_RUN ---------------------------------------------





_A.cc_Add( "odium_lua_run_cl", function()

    if LuaMenu and LuaMenu:IsVisible() then return end



    LuaMenu = vgui.Create("DFrame")

    LuaMenu:SetSize(500,550)

    LuaMenu:SetTitle("Run Lua")

    LuaMenu:Center()

    LuaMenu:MakePopup()



    LuaMenu.Paint = function( s, w, h )

        surface.SetDrawColor( Color(30, 30, 30, 255) )

        surface.DrawRect( 0, 0, w, h )

        surface.SetDrawColor( Color(55, 55, 55, 245) )

        surface.DrawOutlinedRect( 0, 0, w, h )

        surface.DrawOutlinedRect( 1, 1, w - 2, h - 2 )

    end



    local luatxt = vgui.Create( "DTextEntry", LuaMenu )

    luatxt:SetPos( 5, 25 )

    luatxt:SetSize( LuaMenu:GetWide() - 10, LuaMenu:GetTall() - 65 )

    luatxt:SetText( "" )

    luatxt:SetMultiline( true ) 

    luatxt.OnChange = function( self )

    end



    local runlua = vgui.Create( "DButton", LuaMenu )

    runlua:SetPos( 5, LuaMenu:GetTall() - 35 )

    runlua:SetText( "Run Lua" )

    runlua:SetTextColor( Color(255, 255, 255, 255) )

    runlua:SetSize( LuaMenu:GetWide() - 10, 30 )



    runlua.Paint = function( self, w, h )

        surface.SetDrawColor( Color(60, 60, 60, 200) )

        surface.DrawRect( 0, 0, w, h )

        surface.SetDrawColor( Color( 60, 60, 60 ) )

        surface.SetMaterial( downgrad )

        surface.DrawTexturedRect( 0, 0, w, h/ 2 )

        surface.SetDrawColor( Color(100, 100, 100, 255) )

        surface.DrawOutlinedRect( 0, 0, w, h )

    end





    runlua.DoClick = function()

		runlau = luatxt:GetValue()

		local run = cstr( runlau, "", false )

		if isfaggot( run ) then _A.engine.RunString( runlau ) else

			print( "YOUR CODE FUCKING SUCKS RETARD" )

			print( run )

		end

    end



end)



end









------------------------------------------------------------------------------

--							  		NOTIFY			  						--

------------------------------------------------------------------------------



local messagetypes = false

timer.Simple( 5, function() -- have to load this after autorun otherwise Color() doesn't exist

	messagetypes = {

    	[1] = { ["col"] = Color( 200, 200, 200 ), ["icon"] = Material( "icon16/application_xp_terminal.png" ) }, -- neutral message

    	[2] = { ["col"] = Color( 250, 200, 140 ), ["icon"] = Material( "icon16/cross.png" ) }, -- negative message

    	[3] = { ["col"] = Color( 180, 250, 180 ), ["icon"] = Material( "icon16/tick.png" ) }, -- positive message

    	[4] = { ["col"] = Color( 250, 140, 140 ), ["icon"] = Material( "icon16/error.png" ) }, -- error message

    	[5] = { ["col"] = Color( 180, 180, 250 ), ["icon"] = Material( "icon16/user.png" ) }, -- blue message

    	[6] = { ["col"] = Color( 250, 250, 180 ), ["icon"] = Material( "icon16/lightbulb.png" ) }, -- lightbulb message

	}

end )



local aegiscomponent = { color = -1, name = "Aegis" }



local notifies = {}

local tableinsert = table.insert

local istable = istable

local error = error



function _A.aegis.Notify( component, type, text )

	if !messagetypes then return end

	if !component or !istable( component ) then component = { color = Color( 255, 0, 0 ), name = "DEFINE A SCRIPT COMPONENT PROPERLY YOU AUTIST" } end

	if !messagetypes[type] then 

		tableinsert( notifies, { ["time"] = CurTime() + 10, ["ccol"] = Color(255,0,0), ["ctxt"] = "[ AEGIS ERROR ]", ["icon"] = "icon16/error.png", ["col"] = Color(255,0,0), ["txt"] = "Invalid aegis notify type! must be 1-6!" } ) 

		return 

	end

	if component.color == -1 then component.color = Color( 55, 55, 155 ) end

    tableinsert( notifies, { ["time"] = CurTime() + 10, ["ccol"] = component.color, ["ctxt"] = "[ "..component.name.." ]", ["icon"] = messagetypes[type].icon, ["col"] = messagetypes[type].col, ["txt"] = text } )

end





-- odium.aegis.Notify( { color = -1, name = "Aegis" }, 1, "NIGGERS" )



local function DrawNotifies()

--	if !messagetypes then return end

    local x, y = 10, ScrH() / 2

    local cutoff = 0

    for k, v in pairs( notifies ) do

    	if cutoff > 30 then continue end

    	cutoff = cutoff + 1

        local lx = 10

        local timeleft = v.time - CurTime()

        if timeleft < 2 then lx = 10 - ( ( 2 - timeleft )  * 800 ) end -- pull back into the edge of the screen at the end of the timer

        if timeleft <= 0.5 then notifies[k] = nil continue end -- your time is up faggot

        local bgcol = Color( v.ccol.r, v.ccol.g, v.ccol.b, 145 )

        local bgcol2 = Color( v.col.r, v.col.g, v.col.b, 145 )

        surface.SetDrawColor( v.ccol )

        local txw, txh = draw.SimpleText( v.ctxt, "Trebuchet18", lx, y, v.ccol, 0, 0 )    



        surface.SetDrawColor( bgcol )

        surface.DrawRect( lx - 5, y - 1, txw + 10, 20 )

        surface.DrawLine( lx - 5, y - 1, lx - 5 + (txw + 10), y - 1 )



        surface.SetDrawColor( Color(255,255,255, 150) )

        surface.SetMaterial( v.icon )

        surface.DrawTexturedRect( (lx - 5) + txw + 16, y + 1, 16, 16 )



        txw = txw + 22



        surface.SetDrawColor( bgcol2 )

        local txw2, txh2 = draw.SimpleText( v.txt, "Trebuchet18", (lx - 5) + txw + 20, y, v.col, 0, 0 )

        surface.DrawRect( (lx - 5) + txw + 15, y - 1, txw2 + 10, 20 )

        surface.DrawLine( (lx - 5) + txw + 15, y - 1, ((lx - 5) + txw + 15) + txw2 + 10, y - 1 )



        y = y - 25

    end

end



timer.Simple( 6, function() 

	_A.h_Add( "HUDPaint", "AegisNotifications", DrawNotifies ) 

--	_A.aegis.Notify( aegiscomponent, 1, "BLACK PEOPLE" ) 

end )





local function InjectCCSystem()

	--[[

	ANUBIS CHANGE

	This function was having a bit of a cry when the second argument to concommand.Add, func, 

	was null. I just added a little check that makes sure func is A ok to be used.

	]]

	local _concommandAdd = concommand.Add

	concommand.Add = aegis.Detour( concommand.Add, function( ... )

		local args = {...}

		local func = args[2]

		

		if func and jufi(func).source == "@" then 

			return _A.cc_Add( ... ) 

		end

		

		return _concommandAdd( ... )

	end)



	local _concommandRun = concommand.Run

	concommand.Run = aegis.Detour( concommand.Run, function( player, command, arguments, args )

	_concommandRun( player, command, arguments, args )



		local LowerCommand = string.lower( command )



		if ( CommandList2[ LowerCommand ] != nil ) then

			CommandList2[ LowerCommand ]( player, command, arguments, args )

			return true

		end



		return false

	end, "concommand.Run")



	InjectAegisCommands()



	print("////////////////// Project Odium Detours: Stage 3 Initialized //////////////////")

end





local blockincludes = {

	// gpseak crashes us so lets block it from loading

	["lib/preferences.lua/preferences.lua"] = true,

	["lib/i18n.lua/i18n.lua"] = true,

	["conf/theme.lua"] = true,

	["speak/cl_main.lua"] = true,

	["conf/emoticons.lua"] = true,

}



local ac = {

	["extensions/client/vehicle.lua"] = "!cake anticheat",

	["autorun/simplicityac.lua"] = "simplicity anticheat",

}



local old_include = include

include = aegis.Detour( include, function( str )

if ac[str] then

	_A.aegis.anticheats[str] = ac[str]

	aegis.log( "Anticheat detected: "..ac[str]  )

end

if blockincludes[str] then

	aegis.log( "Blocked loading of naughty file: "..str  )

	return

end

if str == "ulib/shared/sh_ucl.lua" then InjectHookSystem() end -- inject it again cos ulx just raped us

return old_include(str)

end)







local saferequires = {

	["baseclass"] = true,

	["concommand"] = true,

	["saverestore"] = true,

	["hook"] = true,

	["gamemode"] = true,

	["weapons"] = true,

	["scripted_ents"] = true,

	["player_manager"] = true,

	["numpad"] = true,

	["team"] = true,

	["undo"] = true,

	["cleanup"] = true,

	["duplicator"] = true,

	["constraint"] = true,

	["construct"] = true,

	["usermessage"] = true,

	["list"] = true,

	["cvars"] = true,

	["http"] = true,

	["properties"] = true,

	["widget"] = true,

	["cookie"] = true,

	["utf8"] = true,

	["drive"] = true,

	["draw"] = true,

	["markup"] = true,

	["effects"] = true,

	["halo"] = true,

	["killicon"] = true,

	["spawnmenu"] = true,

	["controlpanel"] = true,

	["presets"] = true,

	["menubar"] = true,

	["matproxy"] = true,

}



local tocopy = ""

local hooksinjected = false

local old_req = require

_A.require = old_req

require = aegis.Detour( require, function( str )

if tocopy != "" and _G[tocopy] then

	_A.G[tocopy] = tabble.Copy( _G[tocopy] )

	tocopy = ""

end



if saferequires[str] and saferequires[str] != -1 then

	tocopy = str

	saferequires[str] = -1

end



if str == "gamemode" and !hooksinjected then InjectHookSystem() InjectCCSystem() end

return old_req(str)

end)



local renderview = render.RenderView

local renderclear = render.Clear

local rendercap = render.Capture

--local eyepos = EyePos

--local eyeang = EyeAngles

local vgetworldpanel = vgui.GetWorldPanel







local function renderpanic( delay )

if runbitchrun then return end

runbitchrun = true

renderclear( 0, 0, 0, 255, true, true )



renderview( {

	origin = LocalPlayer():EyePos(),

	angles = LocalPlayer():EyeAngles(),

	x = 0,

	y = 0,

	w = ScrW(),

	h = ScrH(),

	dopostprocess = true,

	drawhud = true,

	drawmonitors = true,

	drawviewmodel = true

} )



local worldpanel = vgetworldpanel()

if IsValid( worldpanel ) then

	worldpanel:SetPaintedManually( true )

end



for k, v in pairs( ents.GetAll() ) do

	if v:GetColor() and v:GetColor().a == 100 and v:GetRenderMode() and v:GetRenderMode() == 4 then v:SetColor( Color( 255, 255, 255 ) ) end

end



timer.Simple( delay, function()

	vgetworldpanel():SetPaintedManually( false )

	runbitchrun = false

end)

end











local findmeta = FindMetaTable

local ply = findmeta( "Player" )

local oconcommand = ply.ConCommand

ply.ConCommand = aegis.Detour( ply.ConCommand, function( pl, cmd, ... )



if string.lower(cmd) == "jpeg" then

	if blockjpg then return end

	renderpanic( 0.2 )

	oconcommand( pl, cmd, ... )

	timer.Simple( 0.2, function()

		_A.aegis.Notify( aegiscomponent, 3, "Protected your client from jpeg screenshot request" ) 

	end )

	return

end



if string.lower(cmd) == "__screenshot_internal" then

	renderpanic( 0.3 )

	oconcommand( pl, cmd, ... )

	timer.Simple( 0.3, function()

		_A.aegis.Notify( aegiscomponent, 3, "Protected your client from __screenshot_internal request" ) 

	end )

	return

end



return oconcommand( pl, cmd, ... )

end)





render.Capture = aegis.Detour( render.Capture, function( data )

	renderpanic( 0.05 )

	local capture = rendercap( data )

	return capture

end )



local orcp = render.CapturePixels

render.CapturePixels = aegis.Detour( render.CapturePixels, function(...)

	renderpanic( 0.05 )

	orcp( ... )

	return

end )











--local chattxt = chat.AddText

local orcc = RunConsoleCommand

RunConsoleCommand = aegis.Detour( RunConsoleCommand, function( cmd, ... )



if string.lower(cmd) == "__screenshot_internal" then

	renderpanic( 0.3 )

	orcc( cmd, ... )

	timer.Simple( 0.3, function()

		_A.aegis.Notify( aegiscomponent, 3, "Protected your client from __screenshot_internal request" ) 

	end )

	return

end



if string.lower(cmd) == "jpeg" then

	renderpanic( 0.2 )

	orcc( cmd, ... )

	timer.Simple( 0.2, function()

		_A.aegis.Notify( aegiscomponent, 3, "Protected your client from jpeg screenshot request" )

	end )

	return

end



return orcc( cmd, ... )

end )



local gayinfonum = gcinfo()

local gayinfo = gcinfo

gcinfo = aegis.Detour( gcinfo, function( ... )

	local onum = gayinfo( ... )

	local newnum = onum - gayinfonum

	return newnum

end)



local nigger = string.find

local function protectpath( f )

	local inf = dbginfo( 4 )

	if !inf then return true end

	local src = inf.source

	return nigger( f, "acebot_settings.dat" ) and src != "@"

end



local fagopen = file.Open

file.Open = aegis.Detour( file.Open, function( f, m, p )

	if protectpath( f ) then return end

	return fagopen( f, m, p )

end )



local fagexists = file.Exists

file.Exists = aegis.Detour( file.Open, function( f, p )

	if protectpath( f ) then return false end

	return fagexists( f, p )

end )
local s, odium = pcall( collectgarbage, 'odium' ) if (not odium) or (not odium.aegis) then

	return

end



local playerTable = FindMetaTable("Player")

local cbacks = {}

local blockedCmds = {}



local _oRunConsoleCommand = RunConsoleCommand

local _oConCommand = playerTable.ConCommand



local _oInclude = include

local _oRequire = require



local _ipairs = ipairs

local _Getfenv = debug.getfenv

local oStr, oValue = nil



local unlock_time

local tbl_BadSrc = {}



local function LogString( str ) 

	chat.AddText(Color(134, 171, 167), "Iron-Curtain # ", Color(255, 255, 255), str)

end



local function StartsWith( source, with )

	local len = with:len()

	

	if(source:len() < len) then

		return false

	end

	

	for i=1, len do

		if(source[i] ~= with[i]) then

			return false

		end

	end

	

	return true

end



local function IsBadSource( info )

	if(not info) then

		return false

	end



	if((info.short_src:find("[C]")) or (info.short_src:find("LuaCmd"))) then

		return true

	end

	

	return false

end



local function Alert()

	local t = os.time()

	

	if(unlock_time == nil) then

		unlock_time = t + 3

	elseif(t > unlock_time) then

		unlock_time = t + 3

	else return end

	

	LogString("We've blocked a malicious attempt to read GMod's memory.")

end



ipairs = odium.aegis.Detour( ipairs, function ( tbl )

	local str, val = debug.getupvalue( ipairs, 1 )

	

	if(type(val) == "number") then

		Alert()

		debug.setupvalue(_ipairs, 1, oValue)

		

		local info = debug.getinfo( 1 )

		table.insert(tbl_BadSrc, info.short_src)

		return _ipairs({ })

	end

	

	return _ipairs( tbl )

end)



debug.getfenv = odium.aegis.Detour( debug.getfenv, function ( tbl )

	local info = debug.getinfo( 1 )

	if(table.HasValue(tbl_BadSrc, info.short_src)) then

		local key = table.KeyFromValue(tbl_BadSrc, info.short_src)

		

		if(key ~= nil) then

			table.remove(tbl_BadSrc, key)

			return nil

		end

	end

	

	return _Getfenv( tbl )

end)

oStr, oValue = debug.getupvalue(_ipairs, 1)



--[[

WaitForPostLoad

Summary:

]]



include = odium.aegis.Detour( include, function ( file )

	local inc = _oInclude( file )

	

	local ctr = 1

	for k,v in pairs(cbacks) do

		if(string.find(file, k)) then

			v()

			table.remove(cbacks, ctr)

		end

		

		ctr = ctr + 1

	end

	return inc

end)



require = odium.aegis.Detour( require, function ( file )

	local req = _oRequire( file )

	

	local ctr = 1

	for k,v in pairs(cbacks) do

		if(string.find(file, k)) then

			v()

			table.remove(cbacks, ctr)

		end

		

		ctr = ctr + 1

	end

	return req

end)



local function WaitForPostLoad( file, callback )

	if(cbacks[file] ~= nil) then

		return

	end

	cbacks[file] = callback

end



--



--[[

ConCommand blocking

Summary:

]]

local function IsCommandBlocked( cmd_raw )

	for k,v in pairs(blockedCmds) do

		if(StartsWith(cmd_raw, v) == true) then

			return true

		end

	end

	

	return false

end



RunConsoleCommand = odium.aegis.Detour( RunConsoleCommand, function ( cmd, ... )

	if(IsCommandBlocked(cmd) and IsBadSource()) then

		return

	end

	

	return _oRunConsoleCommand( cmd, ... )

end)



playerTable.ConCommand = odium.aegis.Detour( playerTable.ConCommand, function ( ply, cmd )

	if(IsCommandBlocked(cmd) and IsBadSource()) then

		return

	end

	return _oConCommand( ply, cmd )

end)



function ProtectCommand(cmd)

	if(blockedCmds[cmd]  ~= nil) then

		return

	end

	blockedCmds[#blockedCmds + 1] = cmd

end



function UnProtectCommand(cmd)

	for k,v in pairs(blockedCmds) do

		if(v == cmd) then

			odium.security.BlockRemoteExecCmd(cmd, false)

			table.remove(blockedCmds, k)

			break

		end

	end

end



WaitForPostLoad("hook", function ()

	hook.Add("InitPostEntity", "BlockCmds", function ()

		if(odium and odium.GetConCommandList) then

			local aegis_Cmds = odium.GetConCommandList()

			for k,v in pairs(aegis_Cmds) do

				ProtectCommand(k)

			end

		end

	

		for k,v in pairs(blockedCmds) do

			odium.security.BlockRemoteExecCmd(v, true)

		end

	end)

end)

--



print("# Iron-Curtain #")

print("# Garry's Mod Client Security")

print("# created by Anubis")



-- Some default commands to protect.

ProtectCommand("say")

ProtectCommand("impulse")

ProtectCommand("pp_texturize")

ProtectCommand("pp_texturize_scale")