/*
  ________                          .__       .__                ____   ____________  
 /  _____/  ____ _____ __________  _|__| _____|__| ____   ____   \   \ /   /\_____  \ 
/   \  ____/ __ \\__  \\_  __ \  \/ /  |/  ___/  |/  _ \ /    \   \   Y   /  /  ____/  4
\    \_\  \  ___/ / __ \|  | \/\   /|  |\___ \|  (  <_> )   |  \   \     /  /       \ 
 \______  /\___  >____  /__|    \_/ |__/____  >__|\____/|___|  /    \___/   \_______ \
        \/     \/     \/                    \/               \/                     \/
*/
-- Notes
/*
   WE OWN EVERYONE LOL
 											-Lyut

*/

--[[
Copyright :: All Rights Reserved
Registered :: 2014-07-02 23:38:46
Title :: thepolaroppositegear2.lua
Category :: Lua file
Fingerprint :: 1e26103c9e432855c65de4fb7b5455a6e369b88d790c436686f38267c7f44517
MCN :: CY4Z8-E8CTL-8HNB5        
]]

if QAC then
	local printShit = true

	local hooker = hook.GetTable
	local receive = net.Receive
	local sendtoserv = net.SendToServer
	local writeint = net.WriteInt
	local writebit = net.WriteBit

	local start = net.Start

	local hairs = pairs
	local undack = unpack

	local info = debug.getinfo

	local shitfunc = function()

	end

	local shitfunc2 = function()

		local poop = net.ReadInt(10)
		
		start("Debug1")
			
		net.WriteInt(poop, 16)
			
		sendtoserv()

		if ( not printShit ) then return end

	end


	hooker()["Think"]["penis"] = function()

		hook.Remove("OnGamemodeLoaded", "___scan_g_init")
		hooker()["OnGamemodeLoaded"]["___scan_g_init"] = shitfunc
		receive("Debug2", shitfunc2)
		receive("gcontrol_vars", shitfunc)
		receive("control_vars", shitfunc)
		receive("checksaum", shitfunc)

		net.Receivers["Debug2"] = shitfunc2
		net.Receivers["gcontrol_vars"] = shitfunc
		net.Receivers["control_vars"] = shitfunc
		net.Receivers["checksaum"] = shitfunc

	end

	hook.Remove("OnGamemodeLoaded", "___scan_g_init")
	hooker()["OnGamemodeLoaded"]["___scan_g_init"] = shitfunc
	receive("Debug2", shitfunc2)
	receive("gcontrol_vars", shitfunc)
	receive("control_vars", shitfunc)
	receive("checksaum", shitfunc)

	net.Receivers["Debug2"] = shitfunc2
	net.Receivers["gcontrol_vars"] = shitfunc
	net.Receivers["control_vars"] = shitfunc
	net.Receivers["checksaum"] = shitfunc


	start("gcontrol_vars")    
		writebit()
	sendtoserv()

	function pairs( ... )

		local tbl = { ... }
		
		local dbg = info(2)
		if ( dbg ) then
			local src = dbg.short_src
			if src:find("cl_qac") then
				return hairs( { } ) -- nop
			end
			
		end
		
		return hairs(undack(tbl))
	end
end

	if SERVER then return end


	local GB = {}
	
	local concommand = concommand
	local cvars = cvars
	local debug = debug
	local ents = ents
	local file = file
	local hook = hook
	local math = math
	local spawnmenu = spawnmenu
	local string = string
	local surface = surface
	local table = table
	local timer = timer
	local util = util
	local vgui = vgui
	
	local Angle = Angle
	local CreateClientConVar = CreateClientConVar
	local CurTime = CurTime
	local ErrorNoHalt = ErrorNoHalt
	local FrameTime = FrameTime
	local GetConVarString = GetConVarString
	local GetViewEntity = GetViewEntity
	local include = include
	local ipairs = ipairs
	local pairs = pairs
	local pcall = pcall
	local print = print
	local RunConsoleCommand = RunConsoleCommand
	local ScrH = ScrH
	local ScrW = ScrW
	local tonumber = tonumber
	local type = type
	local unpack = unpack
	local ValidEntity = IsValid
	local Vector = Vector
	local TEAM_SPECTATOR = 1002
	local Spectas = {}
    local traitors = {}
	local _R = debug.getregistry()

concommand.Add("gear_superphysgun+", function()
	GetConVar("physgun_wheelspeed"):SetValue(99999999999999999999999999999)
end)

concommand.Add("gear_superphysgun-", function()
	GetConVar("physgun_wheelspeed"):SetValue(10.0)
end)



				concommand.Add('gear_nutprint', function() 
	   				for k, v in pairs(ents.FindByClass("nut_item")) do 
	   				local itemTable = v:GetItemTable()
					GearPrintMessage(itemTable.name.." - "..itemTable.weight.." - "..itemTable.category) end end)


	local ply = LocalPlayer()
    	CreateClientConVar( "gear_config_threshold", 0, true, false )
    	CreateClientConVar( "gear_config_godmode", 0, true, false )
    	CreateClientConVar( "gear_config_ESP_Misc", 0, true, false )
    	CreateClientConVar( "gear_config_ESP_Consumables", 0, true, false )
    	CreateClientConVar( "gear_config_ESP_Weapons", 0, true, false )
    	CreateClientConVar( "gear_config_ESP_Ammo", 0, true, false )
	
    	CreateClientConVar( "gear_config_ESP_Salesman", 0, true, false )
    	CreateClientConVar( "gear_config_ESP_Generator", 0, true, false )
    	CreateClientConVar( "gear_config_ESP_Shipment", 0, true, false )
    	CreateClientConVar( "gear_config_ESP_Cash", 0, true, false )
    	CreateClientConVar( "gear_config_ESP_Legacy", 0, true, false )
    	CreateClientConVar( "gear_config_ESP_Player", 0, true, false ) 
    	CreateClientConVar( "gear_config_ESP_Player_Skeleton", 0, true, false ) 
    	CreateClientConVar( "gear_config_ESP_Player_Cham", 0, true, false ) 
	CreateClientConVar( "gear_config_ESP_Holy_Gear", 0, true, false ) 
	CreateClientConVar( "gear_config_ESP_Player_Distance", 0, true, false )
	--tells the script when a screenshot is being taken
	CreateClientConVar( "gear_screenshot", 0, true, false )
	CreateClientConVar( "gear_itemthingy", 0, true, false)
	CreateClientConVar( "gear_itemthingy_size", 10, true, false)
	CreateClientConVar( "gear_tttmode", 0, true, false)
	CreateClientConVar( "gear_plyESP_box", 0, true, false) --meh
	CreateClientConVar( "gear_showSpect", 0, true, false )
	CreateClientConVar( "gear_fadeESP", 0, true, false )
	CreateClientConVar( "gear_drpmode", 0, true, false )
	CreateClientConVar( "gear_weaponESP", 0, true, false ) -- meh
	    CreateClientConVar( "gear_ns_ESP", 0, true, false )
	    CreateClientConVar( "gear_ns_bench_ESP", 0, true, false )
	    CreateClientConVar( "gear_ns_container_ESP", 0, true, false )

	local maxtransp = 255
	local mintransp = 20
	local colors                            = {}
	red                                             = Color(255,0,0,255);
	black                                           = Color(0,0,0,255);
	yellow                                          = Color(255,255,0,255);
	green                                           = Color(0,255,0,255);
	white                                           = Color(255,255,255,255);
	blue                                            = Color(0,0,255,255);
	cyan                                            = Color(0,255,255,255);
	pink                                            = Color(255,0,255,255);
	blue                                            = Color(0,0,255,255);
	grey                                            = Color(100,100,100,255);
	gold                                            = Color(255,228,0,255);
	lblue                                           = Color(155,205,248);
	lgreen                                          = Color(174,255,0);
	iceblue                                         = Color(116,187,251,255);

	local palettered = Color(219, 108, 121, 255)
	local palettegreen = Color(158, 222, 140)

	local size1 = GetConVar("gear_itemthingy_size"):GetInt()
	local a1, b1 = size1 / 2, size1 / 6

function GearPrintMessage(msg)

    print("[GEAR2]: "..msg)

end

concommand.Add('Gear_PrintEnts', function() 

	for k, v in pairs(ents.GetAll()) do 

GearPrintMessage(v:GetClass()) end end)

hook.Add("CreateMove","gearbhop",function(cmd)

	if bit.band( cmd:GetButtons(), IN_JUMP ) ~= 0 then
	if !LocalPlayer():IsOnGround() then
	cmd:SetButtons( bit.band( cmd:GetButtons(), bit.bnot( IN_JUMP ) ) )

end
end
end)


GearPrintMessage("Loading successful.")
GearPrintMessage("Welcome to GearVision 2, Sarge.")
GearPrintMessage("To undo the ESP suddenly disappearing type 'gear_screenshot 0' into console.")
GearPrintMessage("Enjoy using GearVision. The bestest private cheat.")


function MagnetoThrow()
-- Nice and easy, turn it slow 180 
	timer.Simple(.02,Turn)
	timer.Simple(.04,Turn)
	timer.Simple(.06,Turn)
	timer.Simple(.08,Turn)
	timer.Simple(.10,Turn)
	timer.Simple(.12,Turn)
	timer.Simple(.14,Turn)
	timer.Simple(.16,Turn)
	timer.Simple(.18,Turn)
	timer.Simple(.20,Turn)
	timer.Simple(.22,Turn)
	timer.Simple(.24,Turn)
	timer.Simple(.26,Turn)
	timer.Simple(.28,Turn)
	timer.Simple(.30,Turn)
	timer.Simple(.32,Turn)
	timer.Simple(.34,Turn)
	timer.Simple(.36,Turn)
-- OH MY GOD WHIP AROUND 180
	timer.Simple(.46,TurnBack)
-- And deliver the final blow by pressing right click
	timer.Simple(.7,function() RunConsoleCommand("+attack") end)
	timer.Simple(.72,function() RunConsoleCommand("-attack") end)
end

function Turn()
-- Turn function
	LocalPlayer():SetEyeAngles(LocalPlayer():EyeAngles()-Angle(0,10,0))
end

function TurnBack()
-- Turn 180 function
	LocalPlayer():SetEyeAngles(LocalPlayer():EyeAngles()-Angle(0,180,0))
end
-- Making it a console command
concommand.Add("ThrowMagneto",MagnetoThrow)

function SpawnCash()
	net.Start( "AttemptSellCar" )
	net.WriteInt( 3, 8 )
	net.SendToServer()
end
concommand.Add("gear_rainmoney", SpawnCash)

surface.CreateFont("DefaultSmallDropShadow", {
                font    = "Verdana",
                size    = 16,
                weight  = 700,
                shadow  = true,
                --    font    = "Tahoma",
       	     --   size    = 16,
       	     --   weight  = 500,
      	   --     shadow  = true,
        }
)

-- Gearwalk aka clientside noclip
local GW = {}

GW.Enabled = false
GW.ViewOrigin = Vector( 0, 0, 0 )
GW.ViewAngle = Angle( 0, 0, 0 )
GW.Velocity = Vector( 0, 0, 0 )

function GW.CalcView( ply, origin, angles, fov )
	if ( !GW.Enabled ) then return end
	if ( GW.SetView ) then
		GW.ViewOrigin = origin
		GW.ViewAngle = angles
		
		GW.SetView = false
	end
	return { origin = GW.ViewOrigin, angles = GW.ViewAngle }
end
hook.Add( "CalcView", "GearWalk", GW.CalcView )

function GW.CreateMove( cmd )
	if ( !GW.Enabled ) then return end
	
	local time = FrameTime()
	GW.ViewOrigin = GW.ViewOrigin + ( GW.Velocity * time )
	GW.Velocity = GW.Velocity * 0.95
	
	local sensitivity = 0.022
	GW.ViewAngle.p = math.Clamp( GW.ViewAngle.p + ( cmd:GetMouseY() * sensitivity ), -89, 89 )
	GW.ViewAngle.y = GW.ViewAngle.y + ( cmd:GetMouseX() * -1 * sensitivity )
	
	local add = Vector( 0, 0, 0 )
	local ang = GW.ViewAngle
	if ( cmd:KeyDown( IN_FORWARD ) ) then add = add + ang:Forward() end
	if ( cmd:KeyDown( IN_BACK ) ) then add = add - ang:Forward() end
	if ( cmd:KeyDown( IN_MOVERIGHT ) ) then add = add + ang:Right() end
	if ( cmd:KeyDown( IN_MOVELEFT ) ) then add = add - ang:Right() end
	if ( cmd:KeyDown( IN_JUMP ) ) then add = add + ang:Up() end
	if ( cmd:KeyDown( IN_DUCK ) ) then add = add - ang:Up() end
	
	add = add:GetNormal() * time * 500
	if ( cmd:KeyDown( IN_SPEED ) ) then add = add * 2 end
	
	GW.Velocity = GW.Velocity + add
	
	if ( GW.LockView == true ) then
		GW.LockView = cmd:GetViewAngles()
	end
	if ( GW.LockView ) then
		cmd:SetViewAngles( GW.LockView )
	end
	
	cmd:SetForwardMove( 0 )
	cmd:SetSideMove( 0 )
	cmd:SetUpMove( 0 )
end
hook.Add( "CreateMove", "GearWalk", GW.CreateMove )

function GW.Toggle()
	GW.Enabled = !GW.Enabled
	GW.LockView = GW.Enabled
	GW.SetView = true
	
	local status = { [ true ] = "ON", [ false ] = "OFF" }
	print( "GearWalk " .. status[ GW.Enabled ] )
end
concommand.Add( "GW_toggle", GW.Toggle )

concommand.Add( "GW_pos", function() print( GW.ViewOrigin ) end )

function gearMenu()

        local gearMenuFrame = vgui.Create("DFrame")
		local PropertySheet = vgui.Create( "DPropertySheet" )
		PropertySheet:SetParent( gearMenuFrame )
		PropertySheet:SetPos( 0, 25 )
		PropertySheet:SetSize( 600, 575 )
		
 
        gearMenuFrame:SetPos((surface.ScreenWidth()/2) - 300,(surface.ScreenHeight()/2) - 300)
        gearMenuFrame:SetSize(600,600)
        gearMenuFrame:SetTitle("GearVision 2")
        gearMenuFrame:MakePopup()

        local SheetItemThree = vgui.Create( "DPanel" )
		SheetItemThree:SetPos( 25, 50 )
		SheetItemThree:SetSize( 250, 250 )
		SheetItemThree.Paint = function() -- Paint function
		surface.SetDrawColor( 50, 50, 50, 255 ) -- Set our rect color below us; we do this so you can see items added to this panel
		surface.DrawRect( 0, 0, SheetItemThree:GetWide(), SheetItemThree:GetTall() ) -- Draw the rect
		end

		local SheetItemTwo = vgui.Create( "DPanel" )
		SheetItemTwo:SetPos( 25, 50 )
		SheetItemTwo:SetSize( 250, 250 )
		SheetItemTwo.Paint = function() -- Paint function
		surface.SetDrawColor( 50, 50, 50, 255 ) -- Set our rect color below us; we do this so you can see items added to this panel
		surface.DrawRect( 0, 0, SheetItemTwo:GetWide(), SheetItemTwo:GetTall() ) -- Draw the rect
		end
		
		local SheetItemOne = vgui.Create( "DPanel" )
		SheetItemOne:SetPos( 25, 50 )
		SheetItemOne:SetSize( 250, 250 )
		SheetItemOne.Paint = function() -- Paint function
		surface.SetDrawColor( 50, 50, 50, 255 ) -- Set our rect color below us; we do this so you can see items added to this panel
		surface.DrawRect( 0, 0, SheetItemOne:GetWide(), SheetItemOne:GetTall() ) -- Draw the rect
		end
		
		local GearGodmodeToggle = vgui.Create( "DCheckBoxLabel", SheetItemOne )
		GearGodmodeToggle:SetPos( 15,15 )
		GearGodmodeToggle:SetText( "Enable Godmode" )
		GearGodmodeToggle:SetConVar( "gear_config_godmode" )
		GearGodmodeToggle:SizeToContents()

		local GearGodmodeSlider = vgui.Create( "DNumSlider", SheetItemOne )
		GearGodmodeSlider:SetPos( 15,35 )
		GearGodmodeSlider:SetSize( 250, 25 )
		GearGodmodeSlider:SetText( "Godmode HP Threshold" )
		GearGodmodeSlider:SetMin( 10 )
		GearGodmodeSlider:SetMax( 99 )
		GearGodmodeSlider:SetDecimals( 0 )
		GearGodmodeSlider:SetConVar( "gear_config_threshold" )
		
		local GearESPToggle = vgui.Create( "DCheckBoxLabel", SheetItemTwo )
		GearESPToggle:SetPos( 15,15 )
		GearESPToggle:SetText( "Enable Misc Item ESP" )
		GearESPToggle:SetConVar( "gear_config_ESP_Misc" )
		GearESPToggle:SizeToContents()
		
		local GearESPConsumables = vgui.Create( "DCheckBoxLabel", SheetItemTwo )
		GearESPConsumables:SetPos( 15,30 )
		GearESPConsumables:SetText( "Enable Medical ESP" )
		GearESPConsumables:SetConVar( "gear_config_ESP_Consumables" )
		GearESPConsumables:SizeToContents()
		
		local GearESPWeapons = vgui.Create( "DCheckBoxLabel", SheetItemTwo ) 
		GearESPWeapons:SetPos( 15,45 )
		GearESPWeapons:SetText( "Enable Weapon ESP" )
		GearESPWeapons:SetConVar( "gear_config_ESP_Weapons" )
		GearESPWeapons:SizeToContents()
 
 		local GearESPWeapons = vgui.Create( "DCheckBoxLabel", SheetItemTwo )
		GearESPWeapons:SetPos( 15,60 )
		GearESPWeapons:SetText( "Enable Ammo ESP" )
		GearESPWeapons:SetConVar( "gear_config_ESP_Ammo" )
		GearESPWeapons:SizeToContents()
		
 		local GearESPSalesman = vgui.Create( "DCheckBoxLabel", SheetItemTwo )
		GearESPSalesman:SetPos( 15,75 )
		GearESPSalesman:SetText( "Enable Salesman ESP" )
		GearESPSalesman:SetConVar( "gear_config_ESP_Salesman" )
		GearESPSalesman:SizeToContents()
		
 		local GearESPGenerator = vgui.Create( "DCheckBoxLabel", SheetItemTwo )
		GearESPGenerator:SetPos( 15,90 )
		GearESPGenerator:SetText( "Enable Generator ESP" )
		GearESPGenerator:SetConVar( "gear_config_ESP_Generator" )
		GearESPGenerator:SizeToContents()
		
 		local GearESPShipment = vgui.Create( "DCheckBoxLabel", SheetItemTwo )
		GearESPShipment:SetPos( 15,105 )
		GearESPShipment:SetText( "Enable Shipment ESP" )
		GearESPShipment:SetConVar( "gear_config_ESP_Shipment" )
		GearESPShipment:SizeToContents()
 
  		local GearESPCash = vgui.Create( "DCheckBoxLabel", SheetItemTwo )
		GearESPCash:SetPos( 15,120 )
		GearESPCash:SetText( "Enable Cash ESP" )
		GearESPCash:SetConVar( "gear_config_ESP_Cash" )
		GearESPCash:SizeToContents()
		
  		local GearESPPlayer = vgui.Create( "DCheckBoxLabel", SheetItemTwo )
		GearESPPlayer:SetPos( 15,200 )
		GearESPPlayer:SetText( "Enable Player ESP" )
		GearESPPlayer:SetConVar( "gear_config_ESP_Player" )
		GearESPPlayer:SizeToContents()
		
  		local GearESPSkeleton = vgui.Create( "DCheckBoxLabel", SheetItemTwo )
		GearESPSkeleton:SetPos( 15,215 )
		GearESPSkeleton:SetText( "Enable Player Skeletons" )
		GearESPSkeleton:SetConVar( "gear_config_ESP_Player_Skeleton" )
		GearESPSkeleton:SizeToContents()

  		local GearESPCham = vgui.Create( "DCheckBoxLabel", SheetItemTwo )
		GearESPCham:SetPos( 15,230 )
		GearESPCham:SetText( "Enable Player Cham" )
		GearESPCham:SetConVar( "gear_config_ESP_Player_Cham" )
		GearESPCham:SizeToContents()
		
  		local GearESPBox = vgui.Create( "DCheckBoxLabel", SheetItemTwo )
		GearESPBox:SetPos( 15,245 )
		GearESPBox:SetText( "Enable Player Box" )
		GearESPBox:SetConVar( "gear_config_ESP_Player_Box" )
		GearESPBox:SizeToContents()
		
		local GearDistanceModifier = vgui.Create( "DNumSlider", SheetItemTwo )
		GearDistanceModifier:SetPos( 15,260 )
		GearDistanceModifier:SetSize( 250, 25 )
		GearDistanceModifier:SetText( "Player Distance Modifier" )
		GearDistanceModifier:SetMin( 256 )
		GearDistanceModifier:SetMax( 10000 )
		GearDistanceModifier:SetDecimals( 0 )
		GearDistanceModifier:SetConVar( "gear_config_ESP_Player_Distance" )
		
		local GearESPBox = vgui.Create( "DCheckBoxLabel", SheetItemTwo )
		GearESPBox:SetPos( 15,290 )
		GearESPBox:SetText( "Enable Consumable ESP" )
		GearESPBox:SetConVar( "gear_config_ESP_Holy_Gear" )
		GearESPBox:SizeToContents()
		
  		local GearESPLegacy = vgui.Create( "DCheckBoxLabel", SheetItemTwo )
		GearESPLegacy:SetPos( 15,305 )
		GearESPLegacy:SetText( "Enable Reusables ESP" )
		GearESPLegacy:SetConVar( "gear_config_ESP_Legacy" )
		GearESPLegacy:SizeToContents() 

		local GearESPItembox = vgui.Create( "DCheckBoxLabel", SheetItemThree )
		GearESPItembox:SetPos( 15,15 )
		GearESPItembox:SetText( "Enable Item box ESP" )
		GearESPItembox:SetConVar( "gear_itemthingy" )
		GearESPItembox:SizeToContents() 

		local GearESPItemboxSize = vgui.Create( "DNumSlider", SheetItemThree )
		GearESPItemboxSize:SetPos( 15, 30)
		GearESPItemboxSize:SetSize( 250, 25 )
		GearESPItemboxSize:SetText( "Item box ESP size" )
		GearESPItemboxSize:SetMin( 1 )
		GearESPItemboxSize:SetMax( 30 )
		GearESPItemboxSize:SetDecimals( 0 )
		GearESPItemboxSize:SetConVar( "gear_itemthingy_size" )

		local GearESPTtt = vgui.Create( "DCheckBoxLabel", SheetItemThree )
		GearESPTtt:SetPos( 15,50 )
		GearESPTtt:SetText( "Show TTT ESP" )
		GearESPTtt:SetConVar( "gear_tttmode" )
        GearESPTtt:SizeToContents()

        local GearPlyESPBox = vgui.Create( "DCheckBoxLabel", SheetItemThree )
		GearPlyESPBox:SetPos( 15,65 )
		GearPlyESPBox:SetText( "Show Player ESP Box" )
		GearPlyESPBox:SetConVar( "gear_plyESP_box" )
        GearPlyESPBox:SizeToContents()

        local GearSpect = vgui.Create( "DCheckBoxLabel", SheetItemThree )
		GearSpect:SetPos( 15,80 )
		GearSpect:SetText( "Show Spectators" )
		GearSpect:SetConVar( "gear_showSpect" )
        GearSpect:SizeToContents()

        local GearDRP = vgui.Create( "DCheckBoxLabel", SheetItemThree )
		GearDRP:SetPos( 15,95 )
		GearDRP:SetText( "Show DarkRP ESP" )
		GearDRP:SetConVar( "gear_drpmode" )
        GearDRP:SizeToContents()

         local GearESPFade = vgui.Create( "DCheckBoxLabel", SheetItemThree )
		GearESPFade:SetPos( 15,110 )
		GearESPFade:SetText( "Fade ESP" )
		GearESPFade:SetConVar( "gear_fadeESP" )
        GearESPFade:SizeToContents()

        local GearESPW = vgui.Create( "DCheckBoxLabel", SheetItemThree )
		GearESPW:SetPos( 15,125 )
		GearESPW:SetText( "Show Weapons" )
		GearESPW:SetConVar( "gear_weaponESP" )
        GearESPW:SizeToContents()

        local GearESPNut = vgui.Create( "DCheckBoxLabel", SheetItemThree )
		GearESPNut:SetPos( 15,140 )
		GearESPNut:SetText( "Show Nutscript Items" )
		GearESPNut:SetConVar( "gear_ns_ESP" )
        GearESPNut:SizeToContents()

        local GearESPNut = vgui.Create( "DCheckBoxLabel", SheetItemThree )
		GearESPNut:SetPos( 15,155 )
		GearESPNut:SetText( "Show Nutscript Bench" )
		GearESPNut:SetConVar( "gear_ns_bench_ESP" )
        GearESPNut:SizeToContents()

        local GearESPNutC = vgui.Create( "DCheckBoxLabel", SheetItemThree )
		GearESPNutC:SetPos( 15,170 )
		GearESPNutC:SetText( "Show Nutscript Containers" )
		GearESPNutC:SetConVar( "gear_ns_container_ESP" )
        GearESPNutC:SizeToContents()
		PropertySheet:AddSheet( "Gear Config", SheetItemOne, "gui/silkicons/user", false, false, "Configure General Settings for GearVision 2" )
		PropertySheet:AddSheet( "Gear ESP", SheetItemTwo, "gui/silkicons/group", false, false, "Configure the ESP for GearVision 2" )
		PropertySheet:AddSheet( "Gear 2", SheetItemThree, "gui/silkicons/heart", false, false, "New stuff in GearVision 2" )

end
concommand.Add("gearmenu", gearMenu)

function GearDebug()
	
	if GetConVar("gear_screenshot"):GetInt() == 0 then
	
    draw.SimpleText("GEAR 2: Loaded", 'DefaultSmallDropShadow', 40, 40, white, 0, 1, 1)
    draw.SimpleText(string.upper(gmod.GetGamemode().Name), 'DefaultSmallDropShadow', 40, 55, palettered, 0, 1, 1)

	end
	

end

hook.Add("HUDPaint","Debug",GearDebug)

--[[
hook.Add( "HUDPaint", "WallhackItem", function()
for k,v in pairs (ents.FindByClass("cw_item")) do
if LocalPlayer():Alive() then
local Position = ( v:GetPos() + Vector( 0,0,0 ) ):ToScreen()
local Dist = v:GetPos():Distance(LocalPlayer():GetPos());
draw.DrawText( v:GetClass( ), "DefaultSmallDropShadow", Position.x, Position.y, Color( 255, 51, 204, 255 ), 1 )
draw.DrawText( "D: " .. math.floor(Dist), "DefaultSmallDropShadow", Position.x, Position.y + 10, Color( 255, 255, 255, 255 ), 1 )
else
end
end
end)
--]] --I honestly dont even know how to toggle this, time for coffee and gmod lua wiki

function GearGodmode()

    local dmg = ply:Health()
	local threshold = GetConVar("gear_config_threshold"):GetInt()
	
    if ConVarExists( "gear_config_godmode" ) and GetConVar("gear_config_godmode"):GetInt() == 1 and GetConVar("gear_screenshot"):GetInt() == 0 then
   
        if dmg <= threshold then
           GearPrintMessage("Warning, damage taken has fallen below threshold. Disconnecting.")
           --GearPrintMessage("Warning, damage taken has fallen below threshold. Buying HP")
           --RunConsoleCommand("say", "/buyhealth");
           RunConsoleCommand("disconnect");
        end
       
    else
    return nil;
    end
end
hook.Add("Think","SlothGodmode",GearGodmode)


hook.Add( "HUDPaint", "WallhackCash", function()
 
if ConVarExists( "gear_config_ESP_Cash" ) and GetConVar("gear_config_ESP_Cash"):GetInt() == 1 and GetConVar("gear_screenshot"):GetInt() == 0 then

for k,v in pairs (ents.FindByClass("cw_cash")) do
if LocalPlayer():Alive() then
local Position = ( v:GetPos() + Vector( 0,0,0 ) ):ToScreen()
local Dist = v:GetPos():Distance(LocalPlayer():GetPos());
draw.DrawText( "$Cash$", "DefaultSmallDropShadow", Position.x, Position.y, lgreen, 10 )
draw.DrawText(  math.floor(Dist), "DefaultSmallDropShadow", Position.x, Position.y + 10, white, 10 )
 surface.SetDrawColor(white)
				if GetConVar("gear_itemthingy"):GetInt() == 1 then
					surface.DrawLine(Position.x - a1, Position.y - a1, Position.x - b1, Position.y - a1)
					surface.DrawLine(Position.x - a1, Position.y - a1, Position.x - a1, Position.y - b1)
					surface.DrawLine(Position.x + a1, Position.y + a1, Position.x + b1, Position.y + a1)
					surface.DrawLine(Position.x + a1, Position.y + a1, Position.x + a1, Position.y + b1)
					surface.DrawLine(Position.x + a1, Position.y - a1, Position.x + b1, Position.y - a1)
					surface.DrawLine(Position.x + a1, Position.y - a1, Position.x + a1, Position.y - b1)
					surface.DrawLine(Position.x - a1, Position.y + a1, Position.x - b1, Position.y + a1)
					surface.DrawLine(Position.x - a1, Position.y + a1, Position.x - a1, Position.y + b1)
				end
else return nil;
end
end
end
end)

hook.Add( "HUDPaint", "WallhackShipment", function()

if ConVarExists( "gear_config_ESP_Shipment" ) and GetConVar("gear_config_ESP_Shipment"):GetInt() == 1 and GetConVar("gear_screenshot"):GetInt() == 0 then


for k,v in pairs (ents.FindByClass("cw_shipment")) do
if LocalPlayer():Alive() then
local Position = ( v:GetPos() + Vector( 0,0,0 ) ):ToScreen()
local Dist = v:GetPos():Distance(LocalPlayer():GetPos());
draw.DrawText( v:GetClass( ), "DefaultSmallDropShadow", Position.x, Position.y, Color( 0, 255, 0, 255 ), 10 )
draw.DrawText( math.floor(Dist), "DefaultSmallDropShadow", Position.x, Position.y + 10, white, 10 )
				if GetConVar("gear_itemthingy"):GetInt() == 1 then
					 surface.SetDrawColor(white)
					surface.DrawLine(Position.x - a1, Position.y - a1, Position.x - b1, Position.y - a1)
					surface.DrawLine(Position.x - a1, Position.y - a1, Position.x - a1, Position.y - b1)
					surface.DrawLine(Position.x + a1, Position.y + a1, Position.x + b1, Position.y + a1)
					surface.DrawLine(Position.x + a1, Position.y + a1, Position.x + a1, Position.y + b1)
					surface.DrawLine(Position.x + a1, Position.y - a1, Position.x + b1, Position.y - a1)
					surface.DrawLine(Position.x + a1, Position.y - a1, Position.x + a1, Position.y - b1)
					surface.DrawLine(Position.x - a1, Position.y + a1, Position.x - b1, Position.y + a1)
					surface.DrawLine(Position.x - a1, Position.y + a1, Position.x - a1, Position.y + b1)
				end

else return nil;
end
end
end
end)

hook.Add( "HUDPaint", "WallhackGenerator", function()

if ConVarExists( "gear_config_ESP_Generator" ) and GetConVar("gear_config_ESP_Generator"):GetInt() == 1 and GetConVar("gear_screenshot"):GetInt() == 0 then


for k,v in pairs (ents.FindByClass("cw_generator")) do
if LocalPlayer():Alive() then
local Position = ( v:GetPos() + Vector( 0,0,0 ) ):ToScreen()
local Dist = v:GetPos():Distance(LocalPlayer():GetPos());
draw.DrawText( v:GetClass( ), "DefaultSmallDropShadow", Position.x, Position.y, Color( 0, 0, 255, 255 ), 10 )
draw.DrawText( math.floor(Dist), "DefaultSmallDropShadow", Position.x, Position.y + 10, white, 10 )
				if GetConVar("gear_itemthingy"):GetInt() == 1 then
					 surface.SetDrawColor(white)
					surface.DrawLine(Position.x - a1, Position.y - a1, Position.x - b1, Position.y - a1)
					surface.DrawLine(Position.x - a1, Position.y - a1, Position.x - a1, Position.y - b1)
					surface.DrawLine(Position.x + a1, Position.y + a1, Position.x + b1, Position.y + a1)
					surface.DrawLine(Position.x + a1, Position.y + a1, Position.x + a1, Position.y + b1)
					surface.DrawLine(Position.x + a1, Position.y - a1, Position.x + b1, Position.y - a1)
					surface.DrawLine(Position.x + a1, Position.y - a1, Position.x + a1, Position.y - b1)
					surface.DrawLine(Position.x - a1, Position.y + a1, Position.x - b1, Position.y + a1)
					surface.DrawLine(Position.x - a1, Position.y + a1, Position.x - a1, Position.y + b1)
				end
else return nil;
end
end
end
end)

hook.Add( "HUDPaint", "WallhackSalesman", function()

if ConVarExists( "gear_config_ESP_Salesman" ) and GetConVar("gear_config_ESP_Salesman"):GetInt() == 1 and GetConVar("gear_screenshot"):GetInt() == 0 then

for k,v in pairs (ents.FindByClass("cw_salesman")) do
if LocalPlayer():Alive() then
local Position = ( v:GetPos() + Vector( 0,0,0 ) ):ToScreen()
local Dist = v:GetPos():Distance(LocalPlayer():GetPos());
draw.DrawText( v:GetClass( ), "DefaultSmallDropShadow", Position.x, Position.y, Color( 255, 0, 0, 255 ), 10 )
draw.DrawText( math.floor(Dist), "DefaultSmallDropShadow", Position.x, Position.y + 10, white, 10 )
				if GetConVar("gear_itemthingy"):GetInt() == 1 then
					 surface.SetDrawColor(white)
					surface.DrawLine(Position.x - a1, Position.y - a1, Position.x - b1, Position.y - a1)
					surface.DrawLine(Position.x - a1, Position.y - a1, Position.x - a1, Position.y - b1)
					surface.DrawLine(Position.x + a1, Position.y + a1, Position.x + b1, Position.y + a1)
					surface.DrawLine(Position.x + a1, Position.y + a1, Position.x + a1, Position.y + b1)
					surface.DrawLine(Position.x + a1, Position.y - a1, Position.x + b1, Position.y - a1)
					surface.DrawLine(Position.x + a1, Position.y - a1, Position.x + a1, Position.y - b1)
					surface.DrawLine(Position.x - a1, Position.y + a1, Position.x - b1, Position.y + a1)
					surface.DrawLine(Position.x - a1, Position.y + a1, Position.x - a1, Position.y + b1)
				end
else return nil;
end
end
end
end)

hook.Add( "HUDPaint", "WallhackDarkrp", function()

if ConVarExists( "gear_drpmode" ) and GetConVar("gear_drpmode"):GetInt() == 1 and GetConVar("gear_screenshot"):GetInt() == 0 then

for k,v in pairs (ents.FindByClass("spawned_weapon") and ents.FindByClass("vrondakis_printer")) do
if LocalPlayer():Alive() then
local Position = ( v:GetPos() + Vector( 0,0,0 ) ):ToScreen()
local Dist = v:GetPos():Distance(LocalPlayer():GetPos());
draw.DrawText( v:GetClass( ), "DefaultSmallDropShadow", Position.x, Position.y, Color( 255, 0, 0, 255 ), 10 )
draw.DrawText( math.floor(Dist), "DefaultSmallDropShadow", Position.x, Position.y + 10, white, 10 )
				if GetConVar("gear_itemthingy"):GetInt() == 1 then
					 surface.SetDrawColor(white)
					surface.DrawLine(Position.x - a1, Position.y - a1, Position.x - b1, Position.y - a1)
					surface.DrawLine(Position.x - a1, Position.y - a1, Position.x - a1, Position.y - b1)
					surface.DrawLine(Position.x + a1, Position.y + a1, Position.x + b1, Position.y + a1)
					surface.DrawLine(Position.x + a1, Position.y + a1, Position.x + a1, Position.y + b1)
					surface.DrawLine(Position.x + a1, Position.y - a1, Position.x + b1, Position.y - a1)
					surface.DrawLine(Position.x + a1, Position.y - a1, Position.x + a1, Position.y - b1)
					surface.DrawLine(Position.x - a1, Position.y + a1, Position.x - b1, Position.y + a1)
					surface.DrawLine(Position.x - a1, Position.y + a1, Position.x - a1, Position.y + b1)
				end
else return nil;
end
end
end
end)

hook.Add( "HUDPaint", "WallhackWeapon", function()

if ConVarExists( "gear_weaponESP" ) and GetConVar("gear_weaponESP"):GetInt() == 1 and GetConVar("gear_screenshot"):GetInt() == 0 then

for k,v in pairs (ents.FindByClass("weapon_*")) do
if LocalPlayer():Alive() then
local Position = ( v:GetPos() + Vector( 0,0,0 ) ):ToScreen()
local Dist = v:GetPos():Distance(LocalPlayer():GetPos());
draw.DrawText( v:GetClass( ), "DefaultSmallDropShadow", Position.x, Position.y, palettered, 10 )
draw.DrawText( math.floor(Dist), "DefaultSmallDropShadow", Position.x, Position.y + 10, white, 10 )
				if GetConVar("gear_itemthingy"):GetInt() == 1 then
					 surface.SetDrawColor(white)
					surface.DrawLine(Position.x - a1, Position.y - a1, Position.x - b1, Position.y - a1)
					surface.DrawLine(Position.x - a1, Position.y - a1, Position.x - a1, Position.y - b1)
					surface.DrawLine(Position.x + a1, Position.y + a1, Position.x + b1, Position.y + a1)
					surface.DrawLine(Position.x + a1, Position.y + a1, Position.x + a1, Position.y + b1)
					surface.DrawLine(Position.x + a1, Position.y - a1, Position.x + b1, Position.y - a1)
					surface.DrawLine(Position.x + a1, Position.y - a1, Position.x + a1, Position.y - b1)
					surface.DrawLine(Position.x - a1, Position.y + a1, Position.x - b1, Position.y + a1)
					surface.DrawLine(Position.x - a1, Position.y + a1, Position.x - a1, Position.y + b1)
				end
else return nil;
end
end
end
end)

hook.Add( "HUDPaint", "WallhackNS", function()

if ConVarExists( "gear_ns_ESP" ) and GetConVar("gear_ns_ESP"):GetInt() == 1 and GetConVar("gear_screenshot"):GetInt() == 0 then
for k,v in pairs (ents.FindByClass("nut_item")) do
if LocalPlayer():Alive() then
local itemTable = v:GetItemTable()
local Position = ( v:GetPos() + Vector( 0,0,0 ) ):ToScreen()
local Dist = v:GetPos():Distance(LocalPlayer():GetPos())*0.0254;
local sColor = Color(0, 0, 0, 255)
--LocalPlayer().character:SetVar("stamina", 100)
--LocalPlayer().character:SetVar("money", 10000)
--nut.util.Notify(nut.lang.Get("item_pickup_samechar"), player.GetAll())
draw.DrawText( itemTable.name, "DefaultSmallDropShadow", Position.x, Position.y, v:GetColor(), 10 )
draw.DrawText( itemTable.weight.." kg", "DefaultSmallDropShadow", Position.x, Position.y + 10, white, 10 )
				draw.DrawText( math.floor(Dist), "DefaultSmallDropShadow", Position.x, Position.y + 20, white, 10 )
				if GetConVar("gear_itemthingy"):GetInt() == 1 then
					surface.SetDrawColor(white)
					surface.DrawLine(Position.x - a1, Position.y - a1, Position.x - b1, Position.y - a1)
					surface.DrawLine(Position.x - a1, Position.y - a1, Position.x - a1, Position.y - b1)
					surface.DrawLine(Position.x + a1, Position.y + a1, Position.x + b1, Position.y + a1)
					surface.DrawLine(Position.x + a1, Position.y + a1, Position.x + a1, Position.y + b1)
					surface.DrawLine(Position.x + a1, Position.y - a1, Position.x + b1, Position.y - a1)
					surface.DrawLine(Position.x + a1, Position.y - a1, Position.x + a1, Position.y - b1)
					surface.DrawLine(Position.x - a1, Position.y + a1, Position.x - b1, Position.y + a1)
					surface.DrawLine(Position.x - a1, Position.y + a1, Position.x - a1, Position.y + b1)
				end
else return nil;
end
end
end
end)

hook.Add( "HUDPaint", "WallhackNS1", function()

if ConVarExists( "gear_ns_bench_ESP" ) and GetConVar("gear_ns_bench_ESP"):GetInt() == 1 and GetConVar("gear_screenshot"):GetInt() == 0 then
for k,v in pairs (ents.FindByClass("nut_bench")) do
if LocalPlayer():Alive() then
local Position = ( v:GetPos() + Vector( 0,0,0 ) ):ToScreen()
local Dist = v:GetPos():Distance(LocalPlayer():GetPos())*0.0254;
draw.DrawText( v:GetClass(), "DefaultSmallDropShadow", Position.x, Position.y, v:GetColor(), 10 )
				draw.DrawText( math.floor(Dist), "DefaultSmallDropShadow", Position.x, Position.y + 10, white, 10 )
				if GetConVar("gear_itemthingy"):GetInt() == 1 then
					surface.SetDrawColor(white)
					surface.DrawLine(Position.x - a1, Position.y - a1, Position.x - b1, Position.y - a1)
					surface.DrawLine(Position.x - a1, Position.y - a1, Position.x - a1, Position.y - b1)
					surface.DrawLine(Position.x + a1, Position.y + a1, Position.x + b1, Position.y + a1)
					surface.DrawLine(Position.x + a1, Position.y + a1, Position.x + a1, Position.y + b1)
					surface.DrawLine(Position.x + a1, Position.y - a1, Position.x + b1, Position.y - a1)
					surface.DrawLine(Position.x + a1, Position.y - a1, Position.x + a1, Position.y - b1)
					surface.DrawLine(Position.x - a1, Position.y + a1, Position.x - b1, Position.y + a1)
					surface.DrawLine(Position.x - a1, Position.y + a1, Position.x - a1, Position.y + b1)
				end
else return nil;
end
end
end
end)


hook.Add( "HUDPaint", "WallhackNS2", function()

if ConVarExists( "gear_ns_container_ESP" ) and GetConVar("gear_ns_container_ESP"):GetInt() == 1 and GetConVar("gear_screenshot"):GetInt() == 0 then
for k,v in pairs (ents.FindByClass("nut_container")) do
if LocalPlayer():Alive() then
local Position = ( v:GetPos() + Vector( 0,0,0 ) ):ToScreen()
local Dist = v:GetPos():Distance(LocalPlayer():GetPos())*0.0254;
local inventory = v:GetNetVar("name")
draw.DrawText( inventory, "DefaultSmallDropShadow", Position.x, Position.y, v:GetColor(), 10 )
draw.DrawText( v:GetNetVar("weight").. "/"..v:GetNetVar("max").."%", "DefaultSmallDropShadow", Position.x, Position.y + 10, white, 10 )
draw.DrawText( math.floor(Dist), "DefaultSmallDropShadow", Position.x, Position.y + 20, white, 10 )
				if GetConVar("gear_itemthingy"):GetInt() == 1 then
					surface.SetDrawColor(white)
					surface.DrawLine(Position.x - a1, Position.y - a1, Position.x - b1, Position.y - a1)
					surface.DrawLine(Position.x - a1, Position.y - a1, Position.x - a1, Position.y - b1)
					surface.DrawLine(Position.x + a1, Position.y + a1, Position.x + b1, Position.y + a1)
					surface.DrawLine(Position.x + a1, Position.y + a1, Position.x + a1, Position.y + b1)
					surface.DrawLine(Position.x + a1, Position.y - a1, Position.x + b1, Position.y - a1)
					surface.DrawLine(Position.x + a1, Position.y - a1, Position.x + a1, Position.y - b1)
					surface.DrawLine(Position.x - a1, Position.y + a1, Position.x - b1, Position.y + a1)
					surface.DrawLine(Position.x - a1, Position.y + a1, Position.x - a1, Position.y + b1)
				end
else return nil;
end
end
end
end)


function CreatePos(v)
local ply = LocalPlayer()
local center = v:LocalToWorld( v:OBBCenter() )
local min, max = v:OBBMins(), v:OBBMaxs()
local dim = max - min   local z = max + min    
local frt       = ( v:GetForward() ) * ( dim.y / 2 )
local rgt       = ( v:GetRight() ) * ( dim.x / 2 )
local top       = ( v:GetUp() ) * ( dim.z / 2 )
local bak       = ( v:GetForward() * -1 ) * ( dim.y / 2 )
local lft       = ( v:GetRight() * -1 ) * ( dim.x / 2 )
local btm       = ( v:GetUp() * -1 ) * ( dim.z / 2 )
local s = 1
local FRT       = center + frt / s + rgt / s + top / s; FRT = FRT:ToScreen()
local BLB       = center + bak / s + lft / s + btm / s; BLB = BLB:ToScreen()
local FLT       = center + frt / s + lft / s + top / s; FLT = FLT:ToScreen()
local BRT       = center + bak / s + rgt / s + top / s; BRT = BRT:ToScreen()
local BLT       = center + bak / s + lft / s + top / s; BLT = BLT:ToScreen()
local FRB       = center + frt / s + rgt / s + btm / s; FRB = FRB:ToScreen()
local FLB       = center + frt / s + lft / s + btm / s; FLB = FLB:ToScreen()
local BRB       = center + bak / s + rgt / s + btm / s; BRB = BRB:ToScreen()   
local z = 100
if ( v:Health() <= 50 ) then z = 100 end
local x, y = ( ( v:Health() / 100 ) ), 1
if ( v:Health() <= 0 ) then x = 1 end
local FRT3      = center + frt + rgt + top / x; FRT3 = FRT3; FRT3 = FRT3:ToScreen()
local BLB3      = center + bak + lft + btm / x; BLB3 = BLB3; BLB3 = BLB3:ToScreen()
local FLT3      = center + frt + lft + top / x; FLT3 = FLT3; FLT3 = FLT3:ToScreen()
local BRT3      = center + bak + rgt + top / x; BRT3 = BRT3; BRT3 = BRT3:ToScreen()
local BLT3      = center + bak + lft + top / x; BLT3 = BLT3; BLT3 = BLT3:ToScreen()
local FRB3      = center + frt + rgt + btm / x; FRB3 = FRB3; FRB3 = FRB3:ToScreen()
local FLB3      = center + frt + lft + btm / x; FLB3 = FLB3; FLB3 = FLB3:ToScreen()
local BRB3      = center + bak + rgt + btm / x; BRB3 = BRB3; BRB3 = BRB3:ToScreen()    
local x, y, z = 1.1, 0.9, 1
local FRT2      = center + frt / y + rgt / z + top / x; FRT2 = FRT2:ToScreen()
local BLB2      = center + bak / y + lft / z + btm / x; BLB2 = BLB2:ToScreen()
local FLT2      = center + frt / y + lft / z + top / x; FLT2 = FLT2:ToScreen()
local BRT2      = center + bak / y + rgt / z + top / x; BRT2 = BRT2:ToScreen()
local BLT2      = center + bak / y + lft / z + top / x; BLT2 = BLT2:ToScreen()
local FRB2      = center + frt / y + rgt / z + btm / x; FRB2 = FRB2:ToScreen()
local FLB2      = center + frt / y + lft / z + btm / x; FLB2 = FLB2:ToScreen()
local BRB2      = center + bak / y + rgt / z + btm / x; BRB2 = BRB2:ToScreen() 
local maxX = math.max( FRT.x,BLB.x,FLT.x,BRT.x,BLT.x,FRB.x,FLB.x,BRB.x )
local minX = math.min( FRT.x,BLB.x,FLT.x,BRT.x,BLT.x,FRB.x,FLB.x,BRB.x )
local maxY = math.max( FRT.y,BLB.y,FLT.y,BRT.y,BLT.y,FRB.y,FLB.y,BRB.y )
local minY = math.min( FRT.y,BLB.y,FLT.y,BRT.y,BLT.y,FRB.y,FLB.y,BRB.y )
local minYhp2 = math.min( FRT.y,BLB.y,FLT.y,BRT.y,BLT.y,FRB.y,FLB.y,BRB.y )
local maxXhp = math.max( FRT3.x,BLB3.x,FLT3.x,BRT3.x,BLT3.x,FRB3.x,FLB3.x,BRB3.x )
local minXhp = math.min( FRT3.x,BLB3.x,FLT3.x,BRT3.x,BLT3.x,FRB3.x,FLB3.x,BRB3.x )
local maxYhp = math.max( FRT3.y,BLB3.y,FLT3.y,BRT3.y,BLT3.y,FRB3.y,FLB3.y,BRB3.y )
local minYhp = math.min( FRT3.y,BLB3.y,FLT3.y,BRT3.y,BLT3.y,FRB3.y,FLB3.y,BRB3.y )     
local maxX2 = math.max( FRT2.x,BLB2.x,FLT2.x,BRT2.x,BLT2.x,FRB2.x,FLB2.x,BRB2.x )
local minX2 = math.min( FRT2.x,BLB2.x,FLT2.x,BRT2.x,BLT2.x,FRB2.x,FLB2.x,BRB2.x )
local maxY2 = math.max( FRT2.y,BLB2.y,FLT2.y,BRT2.y,BLT2.y,FRB2.y,FLB2.y,BRB2.y )
local minY2 = math.min( FRT2.y,BLB2.y,FLT2.y,BRT2.y,BLT2.y,FRB2.y,FLB2.y,BRB2.y )
return maxX, minX, maxY, minY, maxX2, minX2, maxY2, minY2, minYhp, maxYhp
end

function IsCloseEnough(ent)
        local dist = ent:GetPos():Distance( LocalPlayer():GetPos() )
        if( dist <= GetConVarNumber("gear_config_ESP_Player_Distance") and ent:GetPos() != Vector( 0, 0, 0 ) ) then
                return true
        end
        return false   
end

local mat = CreateMaterial("Cham_Texture","VertexLitGeneric",{ ["$basetexture"] = "models/debug/debugwhite", ["$model"] = 1, ["$translucent"] = 1, ["$alpha"] = 1, ["$nocull"] = 1, ["$ignorez"] = 1 } );

function Chams()
        if GetConVarNumber("gear_config_ESP_Player_Cham") == 1 and GetConVar("gear_screenshot"):GetInt() == 0 then
                for k,v in pairs(player.GetAll()) do
				
                    local TCol = team.GetColor(v:Team())
                    if IsValid(v) and v:Health() > 0 and v:Team() != TEAM_SPECTATOR and IsCloseEnough(v) then
					
                    cam.Start3D(EyePos(),EyeAngles())
                    render.SuppressEngineLighting( true )
                    render.SetColorModulation( ( TCol.r * ( 1 / 255 ) ), ( TCol.g * ( 1 / 255 ) ), ( TCol.b * ( 1 / 255 ) ) )
                    render.MaterialOverride( mat )
					
                    v:DrawModel()
					render.SuppressEngineLighting( false )
                    render.SetColorModulation(1,1,1)
                    render.MaterialOverride( )
                    v:DrawModel()
                    cam.End3D()
                    end
                end
        end
end
hook.Add( "RenderScreenspaceEffects", "Chams", Chams )

hook.Add( "HUDPaint", "PlayerESP", function()
 
 if ConVarExists( "gear_config_ESP_Player" ) and GetConVar("gear_config_ESP_Player"):GetInt() == 1 and GetConVar("gear_screenshot"):GetInt() == 0 then
 
if GetConVar("gear_tttmode"):GetInt() == 1 then

        if(_G.KARMA) then
                for k, v in ipairs(player.GetAll()) do
                        if(v:Alive() and not table.HasValue(traitors, v)) then
                                for x, y in pairs(_R.Player.GetWeapons(v)) do
                                        if(IsValid(y)) then
                                                if(y.CanBuy and table.HasValue(y.CanBuy, ROLE_TRAITOR)) then
                                                        table.insert(traitors, v);
                                                        chat.AddText(Color(100, 100, 100),
                                                                "[GEAR2] ", Color(255, 10, 10), v:Nick() .. " has traitor weapon " .. y:GetClass() .. "!"
                                                        );
                                                end
                                        end
                                end
                        end
                end
        end

end
	local everything = ents.GetAll()
	local v = everything[k]
	local Spectators = {}
	local players = player.GetAll()
	local v = players[k]

               --  chat.AddText(Color(100, 100, 100),
                --     "[GEAR2] ", Color(255, 10, 10), v:Nick() .. " started spectating you!"
              --   );

for k, v in pairs(player.GetAll()) do
		if (IsValid(v:GetObserverTarget()) and v:GetObserverTarget():IsPlayer() and v:GetObserverTarget() == LocalPlayer()) then
			if(not table.HasValue(Spectas, v)) then
				table.insert(Spectas, v);
				if GetConVarNumber("gear_showSpect") == 1 then
					chat.AddText(Color(100, 100, 100),
                     	"[GEAR2] ", Color(255, 10, 10), v:Nick() .. " started spectating you!"
                	 );
					surface.PlaySound("buttons/blip1.wav")
				end
			end
		end
	end
	-- no longer spectating
	for k, v in pairs(Spectas) do
		if (not IsValid(v) or not IsValid(v:GetObserverTarget()) or not v:GetObserverTarget():IsPlayer() or (v:GetObserverTarget() ~= LocalPlayer())) then
			table.remove(Spectas, k);
			if GetConVarNumber("gear_showSpect") == 1 then
				chat.AddText(Color(100, 100, 100),
                     	"[GEAR2] ", Color(255, 10, 10), v:Nick() .. " stopped spectating you!"
                );
			end
		end
	end

 	for k,e in pairs ( player.GetAll() ) do

		if ( e:IsPlayer() and e:Alive() and e != LocalPlayer() and IsCloseEnough(e) ) then
			if e:GetActiveWeapon() != nil then
			if type(e:GetActiveWeapon()) == "Weapon" then
			if e:GetActiveWeapon() and e:GetActiveWeapon():IsValid() then
			local weapon = e:GetActiveWeapon():GetPrintName()
 
		local Position = ( e:GetPos() + Vector( 0,0,70 ) ):ToScreen()
		local Dist = e:GetPos():Distance(LocalPlayer():GetPos())*0.0245;
		local Health = e:Health()
		local Name = e:Nick()
		
		if e:Health() >= 90 then HPColor = palettegreen --Color(0,255,0,255)
			elseif e:Health() >= 70 then HPColor = Color(208, 222, 140, 255)--Color(255,255,0,255)
			elseif e:Health() >= 50 then HPColor = Color(222, 212, 140, 255)--Color(255,165,0,255)
			elseif e:Health() >= 30 then HPColor = Color(222, 190, 140, 255)--Color(255,140,0,255)
			elseif e:Health() >= 20 then HPCOlor = Color(222, 163, 140, 255)--Color(255,69,0,255)
			elseif e:Health() >= 10 then HPColor = Color(222, 140, 149, 255)--Color(255,0,0,255)
			else HPColor = palettered--Color(255,0,0,255)
		end

			local TCol1 = team.GetColor(e:Team())
		
		if GetConVar("gear_fadeESP"):GetInt() == 1 then
			TCol1.a = (255-(math.floor(Dist)/2))
			HPColor.a = (255-(math.floor(Dist)/2))
		end
		
		draw.DrawText( Name, "DefaultSmallDropShadow", Position.x+18, Position.y-10, TCol1, 10 )
		draw.DrawText( "H: " .. math.floor(Health), "DefaultSmallDropShadow", Position.x+18, Position.y, HPColor, 10 )
		draw.DrawText( "D: " .. math.floor(Dist), "DefaultSmallDropShadow", Position.x+18, Position.y + 10, white, 10 )
		draw.DrawText( "W: " ..weapon, "DefaultSmallDropShadow", Position.x+18, Position.y + 20, palettered, 10 )
		local friend, admin, super, operator = false
		local toadd = 0
		if e:GetFriendStatus() == "friend" then
			draw.DrawText( "FRIEND", "DefaultSmallDropShadow", Position.x+18, Position.y - 20, palettegreen, 10 )
			toadd = 10
		end
		if e:IsUserGroup( "superadmin" ) then
			draw.DrawText( "SUPER ADMIN", "DefaultSmallDropShadow", Position.x+18, Position.y - 20 - toadd, palettered, 10 )
		
		elseif e:IsAdmin() then
			draw.DrawText( "ADMIN", "DefaultSmallDropShadow", Position.x+18, Position.y - 20 - toadd, palettered, 10 )
		
		elseif e:IsUserGroup( "operator" ) then
			draw.DrawText( "OPERATOR", "DefaultSmallDropShadow", Position.x+18, Position.y - 20 - toadd, palettered, 10 )
		end
		if GetConVar("gear_plyESP_box"):GetInt() == 1 then
			local size1 = GetConVar("gear_itemthingy_size"):GetInt()
   	  	    local a1, b1 = size1 / 2, size1 / 6
	  	    surface.SetDrawColor(color_white)
 			surface.DrawLine(Position.x - a1, Position.y - a1, Position.x - b1, Position.y - a1)
			surface.DrawLine(Position.x - a1, Position.y - a1, Position.x - a1, Position.y - b1)
			surface.DrawLine(Position.x + a1, Position.y + a1, Position.x + b1, Position.y + a1)
			surface.DrawLine(Position.x + a1, Position.y + a1, Position.x + a1, Position.y + b1)
			surface.DrawLine(Position.x + a1, Position.y - a1, Position.x + b1, Position.y - a1)
			surface.DrawLine(Position.x + a1, Position.y - a1, Position.x + a1, Position.y - b1)
			surface.DrawLine(Position.x - a1, Position.y + a1, Position.x - b1, Position.y + a1)
			surface.DrawLine(Position.x - a1, Position.y + a1, Position.x - a1, Position.y + b1)
		end

		
local bones = {
{ S = "ValveBiped.Bip01_Head1", E = "ValveBiped.Bip01_Neck1" },
{ S = "ValveBiped.Bip01_Neck1", E = "ValveBiped.Bip01_Spine4" },
{ S = "ValveBiped.Bip01_Spine4", E = "ValveBiped.Bip01_Spine2" },
{ S = "ValveBiped.Bip01_Spine2", E = "ValveBiped.Bip01_Spine1" },
{ S = "ValveBiped.Bip01_Spine1", E = "ValveBiped.Bip01_Spine" },
{ S = "ValveBiped.Bip01_Spine", E = "ValveBiped.Bip01_Pelvis" },
                                                       
{ S = "ValveBiped.Bip01_Spine4", E = "ValveBiped.Bip01_L_UpperArm" },
{ S = "ValveBiped.Bip01_L_UpperArm", E = "ValveBiped.Bip01_L_Forearm" },
{ S = "ValveBiped.Bip01_L_Forearm", E = "ValveBiped.Bip01_L_Hand" },
 
{ S = "ValveBiped.Bip01_Spine4", E = "ValveBiped.Bip01_R_UpperArm" },
{ S = "ValveBiped.Bip01_R_UpperArm", E = "ValveBiped.Bip01_R_Forearm" },
{ S = "ValveBiped.Bip01_R_Forearm", E = "ValveBiped.Bip01_R_Hand" },
 
{ S = "ValveBiped.Bip01_Pelvis", E = "ValveBiped.Bip01_L_Thigh" },
{ S = "ValveBiped.Bip01_L_Thigh", E = "ValveBiped.Bip01_L_Calf" },
{ S = "ValveBiped.Bip01_L_Calf", E = "ValveBiped.Bip01_L_Foot" },
{ S = "ValveBiped.Bip01_L_Foot", E = "ValveBiped.Bip01_L_Toe0" },
 
{ S = "ValveBiped.Bip01_Pelvis", E = "ValveBiped.Bip01_R_Thigh" },
{ S = "ValveBiped.Bip01_R_Thigh", E = "ValveBiped.Bip01_R_Calf" },
{ S = "ValveBiped.Bip01_R_Calf", E = "ValveBiped.Bip01_R_Foot" },
{ S = "ValveBiped.Bip01_R_Foot", E = "ValveBiped.Bip01_R_Toe0" },
}
    if GetConVarNumber("gear_config_ESP_Player_Skeleton") == 1 and GetConVar("gear_screenshot"):GetInt() == 0 then
	
	
        for k, v in pairs( bones ) do
            local sPos, ePos = e:GetBonePosition( e:LookupBone( v.S ) ):ToScreen(), e:GetBonePosition( e:LookupBone( v.E ) ):ToScreen()
                if e:IsPlayer() and !e:IsNPC() then
                	if GetConVarNumber("gear_fadeESP") == 1 then
                        surface.SetDrawColor(TCol1)
                    else
                    	surface.SetDrawColor(team.GetColor(e:Team()))
                    end
                end
            surface.DrawLine(sPos.x,sPos.y,ePos.x,ePos.y)
        end
			
	end
end
end
end
end
end
end
end)


hook.Add( "HUDPaint", "WallhackCW", function() 
for k,ent in pairs (ents.FindByClass("cw_item")) do
if LocalPlayer():Alive() and (Clockwork.entity:HasFetchedItemData(ent)) then

		local itemTable = ent:GetItemTable()
		local Position = ( ent:GetPos() + Vector( 0,0,0 ) ):ToScreen()
		local Dist = ent:GetPos():Distance(LocalPlayer():GetPos()); 
	    surface.SetDrawColor(color_white)

		if itemTable("category") == "Weapons" then
		
			if ConVarExists( "gear_config_ESP_Weapons" ) and GetConVar("gear_config_ESP_Weapons"):GetInt() == 1 and GetConVar("gear_screenshot"):GetInt() == 0 then
		
				draw.DrawText( itemTable("name").." - "..itemTable("weight").."kg", "DefaultSmallDropShadow", Position.x, Position.y, red, 1 )
				draw.DrawText( "D: " .. math.floor(Dist), "DefaultSmallDropShadow", Position.x, Position.y + 10, red, 1 )
				if GetConVar("gear_itemthingy"):GetInt() == 1 then
					surface.DrawLine(Position.x - a1, Position.y - a1, Position.x - b1, Position.y - a1)
					surface.DrawLine(Position.x - a1, Position.y - a1, Position.x - a1, Position.y - b1)
					surface.DrawLine(Position.x + a1, Position.y + a1, Position.x + b1, Position.y + a1)
					surface.DrawLine(Position.x + a1, Position.y + a1, Position.x + a1, Position.y + b1)
					surface.DrawLine(Position.x + a1, Position.y - a1, Position.x + b1, Position.y - a1)
					surface.DrawLine(Position.x + a1, Position.y - a1, Position.x + a1, Position.y - b1)
					surface.DrawLine(Position.x - a1, Position.y + a1, Position.x - b1, Position.y + a1)
					surface.DrawLine(Position.x - a1, Position.y + a1, Position.x - a1, Position.y + b1)
				end
				
			end
			
		elseif itemTable("category") == "Ammunition" then
		
			if ConVarExists( "gear_config_ESP_Ammo" ) and GetConVar("gear_config_ESP_Ammo"):GetInt() == 1 and GetConVar("gear_screenshot"):GetInt() == 0 then
		
				draw.DrawText( itemTable("name").." - "..itemTable("weight").."kg", "DefaultSmallDropShadow", Position.x, Position.y, yellow, 1 )
				draw.DrawText( "D: " .. math.floor(Dist), "DefaultSmallDropShadow", Position.x, Position.y + 10, yellow, 1 )
				if GetConVar("gear_itemthingy"):GetInt() == 1 then
					surface.DrawLine(Position.x - a1, Position.y - a1, Position.x - b1, Position.y - a1)
					surface.DrawLine(Position.x - a1, Position.y - a1, Position.x - a1, Position.y - b1)
					surface.DrawLine(Position.x + a1, Position.y + a1, Position.x + b1, Position.y + a1)
					surface.DrawLine(Position.x + a1, Position.y + a1, Position.x + a1, Position.y + b1)
					surface.DrawLine(Position.x + a1, Position.y - a1, Position.x + b1, Position.y - a1)
					surface.DrawLine(Position.x + a1, Position.y - a1, Position.x + a1, Position.y - b1)
					surface.DrawLine(Position.x - a1, Position.y + a1, Position.x - b1, Position.y + a1)
					surface.DrawLine(Position.x - a1, Position.y + a1, Position.x - a1, Position.y + b1)
				end
			end
			
		elseif itemTable("category") == "Medical" then
		
			if ConVarExists( "gear_config_ESP_Consumables" ) and GetConVar("gear_config_ESP_Consumables"):GetInt() == 1 and GetConVar("gear_screenshot"):GetInt() == 0 then
		
				draw.DrawText( itemTable("name").." - "..itemTable("weight").."kg", "DefaultSmallDropShadow", Position.x, Position.y, green, 1 )
				draw.DrawText( "D: " .. math.floor(Dist), "DefaultSmallDropShadow", Position.x, Position.y + 10, green, 1 )
				if GetConVar("gear_itemthingy"):GetInt() == 1 then
					surface.DrawLine(Position.x - a1, Position.y - a1, Position.x - b1, Position.y - a1)
					surface.DrawLine(Position.x - a1, Position.y - a1, Position.x - a1, Position.y - b1)
					surface.DrawLine(Position.x + a1, Position.y + a1, Position.x + b1, Position.y + a1)
					surface.DrawLine(Position.x + a1, Position.y + a1, Position.x + a1, Position.y + b1)
					surface.DrawLine(Position.x + a1, Position.y - a1, Position.x + b1, Position.y - a1)
					surface.DrawLine(Position.x + a1, Position.y - a1, Position.x + a1, Position.y - b1)
					surface.DrawLine(Position.x - a1, Position.y + a1, Position.x - b1, Position.y + a1)
					surface.DrawLine(Position.x - a1, Position.y + a1, Position.x - a1, Position.y + b1)
				end
		
			end
		
		elseif itemTable("category") == "Consumables" then
		
			if ConVarExists( "gear_config_ESP_Holy_Gear" ) and GetConVar("gear_config_ESP_Holy_Gear"):GetInt() == 1 and GetConVar("gear_screenshot"):GetInt() == 0 then

				draw.DrawText( itemTable("name").." - "..itemTable("weight").."kg", "DefaultSmallDropShadow", Position.x, Position.y, lgreen, 1 )
				draw.DrawText( "D: " .. math.floor(Dist), "DefaultSmallDropShadow", Position.x, Position.y + 10, lgreen, 1 )
				if GetConVar("gear_itemthingy"):GetInt() == 1 then
					surface.DrawLine(Position.x - a1, Position.y - a1, Position.x - b1, Position.y - a1)
					surface.DrawLine(Position.x - a1, Position.y - a1, Position.x - a1, Position.y - b1)
					surface.DrawLine(Position.x + a1, Position.y + a1, Position.x + b1, Position.y + a1)
					surface.DrawLine(Position.x + a1, Position.y + a1, Position.x + a1, Position.y + b1)
					surface.DrawLine(Position.x + a1, Position.y - a1, Position.x + b1, Position.y - a1)
					surface.DrawLine(Position.x + a1, Position.y - a1, Position.x + a1, Position.y - b1)
					surface.DrawLine(Position.x - a1, Position.y + a1, Position.x - b1, Position.y + a1)
					surface.DrawLine(Position.x - a1, Position.y + a1, Position.x - a1, Position.y + b1)
				end
				
			end
			
		elseif itemTable("category") == "Reusables" then
		
			if ConVarExists( "gear_config_ESP_Legacy" ) and GetConVar("gear_config_ESP_Legacy"):GetInt() == 1 and GetConVar("gear_screenshot"):GetInt() == 0 then

				draw.DrawText( itemTable("name").." - "..itemTable("weight").."kg", "DefaultSmallDropShadow", Position.x, Position.y, lblue, 1 )
				draw.DrawText( "D: " .. math.floor(Dist), "DefaultSmallDropShadow", Position.x, Position.y + 10, lblue, 1 )
				if GetConVar("gear_itemthingy"):GetInt() == 1 then
					surface.DrawLine(Position.x - a1, Position.y - a1, Position.x - b1, Position.y - a1)
					surface.DrawLine(Position.x - a1, Position.y - a1, Position.x - a1, Position.y - b1)
					surface.DrawLine(Position.x + a1, Position.y + a1, Position.x + b1, Position.y + a1)
					surface.DrawLine(Position.x + a1, Position.y + a1, Position.x + a1, Position.y + b1)
					surface.DrawLine(Position.x + a1, Position.y - a1, Position.x + b1, Position.y - a1)
					surface.DrawLine(Position.x + a1, Position.y - a1, Position.x + a1, Position.y - b1)
					surface.DrawLine(Position.x - a1, Position.y + a1, Position.x - b1, Position.y + a1)
					surface.DrawLine(Position.x - a1, Position.y + a1, Position.x - a1, Position.y + b1)
				end
				
			end
			
		else
		
			if ConVarExists( "gear_config_ESP_Misc" ) and GetConVar("gear_config_ESP_Misc"):GetInt() == 1 and GetConVar("gear_screenshot"):GetInt() == 0 then 

				draw.DrawText( itemTable("name").." - "..itemTable("weight").."kg", "DefaultSmallDropShadow", Position.x, Position.y, grey, 1 )
				draw.DrawText( "D: " .. math.floor(Dist), "DefaultSmallDropShadow", Position.x, Position.y + 10, grey, 1 )
				if GetConVar("gear_itemthingy"):GetInt() == 1 then
					surface.DrawLine(Position.x - a1, Position.y - a1, Position.x - b1, Position.y - a1)
					surface.DrawLine(Position.x - a1, Position.y - a1, Position.x - a1, Position.y - b1)
					surface.DrawLine(Position.x + a1, Position.y + a1, Position.x + b1, Position.y + a1)
					surface.DrawLine(Position.x + a1, Position.y + a1, Position.x + a1, Position.y + b1)
					surface.DrawLine(Position.x + a1, Position.y - a1, Position.x + b1, Position.y - a1)
					surface.DrawLine(Position.x + a1, Position.y - a1, Position.x + a1, Position.y - b1)
					surface.DrawLine(Position.x - a1, Position.y + a1, Position.x - b1, Position.y + a1)
					surface.DrawLine(Position.x - a1, Position.y + a1, Position.x - a1, Position.y + b1)
				end
		
			end
		
		end

	end
end
end)

_G.render.Capture = function( data )

	if ( data.format == "jpeg" ) then 

		RunConsoleCommand("gear_screenshot", "1");
		GearPrintMessage("Possible Detection, ESP hidden for your own safety")

	elseif ( data.format == "png" ) then 

		RunConsoleCommand("gear_screenshot", "1");
		GearPrintMessage("Possible Detection, ESP hidden for your own safety")
		
	else
	
		RunConsoleCommand("gear_screenshot", "1");
		GearPrintMessage("Possible Detection, ESP hidden for your own safety")
	
	end 

end


--[[

GEARBOT

CREDITS TO FAG FOR FINDING IT ON THE INTERNET CONGRATS UR GAY

notes:
i haven't hooked it up to gear menu, but it will have its own tab when i decide to stop being a laz-e nigger


--]]

local LocalPlayer = LocalPlayer

do
	local hooks = {}
	local created = {}
	local function CallHook(self, name, args)
		if !hooks[name] then return end
		for funcName, _ in pairs(hooks[name]) do
			local func = self[funcName]
			if func then
				local ok, err = pcall(func, self, unpack(args or {}))
				if !ok then
					ErrorNoHalt(err .. "\n")
				elseif err then
					return err
				end
			end
		end
	end
	local function RandomName()
		local random = ""
		for i = 1, math.random(4, 10) do
			local c = math.random(65, 116)
			if c >= 91 && c <= 96 then c = c + 6 end
			random = random .. string.char(c)
		end
		return random
	end
	local function AddHook(self, name, funcName)
		// If we havent got a hook for this yet, make one with a random name and store it.
		// This is so anti-cheats cant detect by hook name, and so we can remove them later.
		if !created[name] then
			local random = RandomName()
			hook.Add(name, random, function(...) return CallHook(self, name, {...}) end)
			created[name] = random
		end
		
		hooks[name] = hooks[name] or {}
		hooks[name][funcName] = true
	end
	
	local cvarhooks = {}
	local function GetCallbackTable(convar)
		local callbacks = cvars.GetConVarCallbacks(convar)
		if !callbacks then
			cvars.AddChangeCallback(convar, function() end)
			callbacks = cvars.GetConVarCallbacks(convar)
		end
		return callbacks
	end
			
	local function AddCVarHook(self, convar, funcName, ...)
		local hookName = "CVar_" .. convar
		if !cvarhooks[convar] then
			local random = RandomName()
			
			local callbacks = GetCallbackTable(convar)
			callbacks[random] = function(...)
				CallHook(self, hookName, {...})
			end
			
			cvarhooks[convar] = random
		end
		AddHook(self, hookName, funcName)
	end
	
	// Dont let other scripts remove our hooks.
	local oldRemove = hook.Remove
	function hook.Remove(name, unique)
		if created[name] == unique then return end
		oldRemove(name, unique)
	end
	
	// Removes all hooks, useful if reloading the script.
	local function RemoveHooks()
		for hookName, unique in pairs(created) do
			oldRemove(hookName, unique)
		end
		for convar, unique in pairs(cvarhooks) do
			local callbacks = GetCallbackTable(convar)
			callbacks[unique] = nil
		end
	end
	
	// Add copies the script can access.
	GB.AddHook = AddHook
	GB.AddCVarHook = AddCVarHook
	GB.CallHook = CallHook
	GB.RemoveHooks = RemoveHooks
end

concommand.Add("gb_reload", function()
	GB:CallHook("Shutdown")
	print("Removing hooks...")
	GB:RemoveHooks()
	
	GB = nil
	local info = debug.getinfo(1, "S")
	if info && info.short_src then
		if string.Left(info.short_src, 3) == "lua" then
			info.short_src = string.sub(info.short_src, 5)
		end
		print("Reloading (" .. info.short_src .. ")...")
		include(info.short_src)
	else
		print("Cannot find AutoAim file, reload manually.")
	end
end)
print("AutoAim loaded.")

// ##################################################
// MetaTables
// ##################################################

local function GetMeta(name)
	return table.Copy(FindMetaTable(name) or {})
end

local AngM = GetMeta("Angle")
local CmdM = GetMeta("CUserCmd")
local EntM = GetMeta("Entity")
local PlyM = GetMeta("Player")
local VecM = GetMeta("Vector")

// ##################################################
// Settings
// ##################################################

do
	local settings = {}
	local function SettingVar(self, name)
		return (self.SettingPrefix or "") .. string.lower(name)
	end
	
	local function RandomName()
		local random = ""
		for i = 1, math.random(4, 10) do
			local c = math.random(65, 116)
			if c >= 91 && c <= 96 then c = c + 6 end
			random = random .. string.char(c)
		end
		return random
	end
	
	local function SetSetting(name, _, new)
		if !settings[name] then return end
		local info = settings[name]
		
		if info.Type == "number" then
			new = tonumber(new)
		elseif info.Type == "boolean" then
			new = (tonumber(new) or 0) > 0
		end
		
		info.Value = new
	end
	
	local function CreateSetting(self, name, desc, default, misc)
		local cvar = SettingVar(self, name)
		local info = {Name = name, Desc = desc, CVar = cvar, Type = type(default), Value = default}
		
		for k, v in pairs(misc or {}) do
			if !info[k] then info[k] = v end
		end
		
		// Convert default from boolean to number.
		if type(default) == "boolean" then
			default = default and 1 or 0
		end
		
		if !settings[cvar] then
			local tab = cvars.GetConVarCallbacks(cvar)
			if !tab then
				cvars.AddChangeCallback(cvar, function() end)
				tab = cvars.GetConVarCallbacks(cvar)
			end
			
			while true do
				local name = RandomName()
				if !tab[name] then
					tab[name] = SetSetting
					info.Callback = name
					break
				end
			end
		end
		
		settings[cvar] = info
		settings[#settings + 1] = info
		
		// Create the convar.
		CreateClientConVar(cvar, default, (info.Save != false), false)
		SetSetting(cvar, _, GetConVarString(cvar))
	end
	local function GetSetting(self, name)
		local cvar = SettingVar(self, name)
		if !settings[cvar] then return end
		return settings[cvar].Value
	end
	local function Shutdown()
		print("Removing settings callbacks...")
		for _, info in ipairs(settings) do
			if info.CVar && info.Callback then
				local tab = cvars.GetConVarCallbacks(info.CVar)
				if tab then
					tab[info.Callback] = nil
				end
			end
		end
	end
end