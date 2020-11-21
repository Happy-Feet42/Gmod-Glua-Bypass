CreateClientConVar("sCheat", 1, true , false)
CreateClientConVar("sCheat_Visuals", 1, true, false)
CreateClientConVar("sCheat_showUsergroup", 1, true, false)
CreateClientConVar("sCheat_Box", 1, true, false)
CreateClientConVar("sCheat_Crosshair", 1, true, false)
CreateClientConVar("sCheat_Aimbot", 1, true, false)
CreateClientConVar("sCheat_Visuals_distance", 100, true, false)
CreateClientConVar("sCheat_ShowDistance", 1, true, false)
CreateClientConVar("sCheat_Skeleton", 1, true, false)
CreateClientConVar("sCheat_Aimbot_Speed", 15, true, false)
CreateClientConVar("sCheat_ShowName", 1, true, false)
CreateClientConVar("sCheat_ShowHP", 1, true, false)
CreateClientConVar("sCheat_ShowEyeLine", 1, true, false)
CreateClientConVar("sCheat_EyelineType", 1, true, false)
CreateClientConVar("sCheat_HeadDot", 1, true, false)
CreateClientConVar("sCheat_Glow", 1, true, false)
 
LocalPlayer():ChatPrint("--!! sCheat has been loaded! !!--\nType sCheat_menu in console.\nUse left click or left ALT to use aimbot!")
 
local SkeletonColor = Color(255,255,255)
 
hook.Add("HUDPaint" , "sCheat" , function()
    DrawRainbowText(10, "sCheat by skyr0.cc", "GModWorldtip", 884, 70)
    if GetConVar("sCheat"):GetInt() == 1 then
 
        if GetConVar("sCheat_Visuals"):GetInt() == 1 then	
 
        for k , v in pairs (player.GetAll()) do
 
        local FOV = LocalPlayer():GetFOV();
        local fovFix = (100/FOV) -- lol shit maffs
        local multiplier = 1000 * fovFix --workaround doe
        local width = 30
        local height = 52
        local dist = LocalPlayer():GetPos():Distance(v:GetPos())
		local distMeters = dist / 53
		local roundeddist = math.Round(distMeters)
		local topmost = 0
 
		if roundeddist < GetConVar("sCheat_Visuals_distance"):GetInt() then
        
        local Position = (v:GetPos() + Vector(0,0,80)) :ToScreen()
 
		if GetConVar("sCheat_ShowName"):GetInt() == 1 then
        	draw.SimpleTextOutlined(v:Name(), "Default", Position.x, Position.y - 30 +(width/dist)*150*fovFix, Color(255,255,255), 1, 1, 1, Color(0,0,0))
			topmost = 30
		end
 
		if GetConVar("sCheat_ShowDistance"):GetInt() == 1 then
		draw.SimpleTextOutlined(roundeddist, "Default", Position.x - 3, Position.y - 60 +(width/dist)*150*fovFix, Color(0, 181, 178), 2, 1, 1, Color(0,0,0))
		draw.SimpleTextOutlined("m", "Default", Position.x + 3, Position.y - 60 +(width/dist)*150*fovFix, Color(0, 181, 178), 1, 1, 1, Color(0,0,0))
		if topmost < 60 then
			topmost = 60
		end
		end
 
		if GetConVar("sCheat_ShowHP"):GetInt() == 1 then
        	local hp = v:Health()
            if hp<1 then
                draw.SimpleTextOutlined("*DEAD*", "Default", Position.x, Position.y - 15 +(width/dist)*150*fovFix, Color(255,0,0), 1, 1, 1, Color(0,0,0))
            else
                draw.SimpleTextOutlined(hp, "Default" , Position.x , Position.y - 15 +(width/dist)*150*fovFix, Color(0,255,0), 1, 1, 1, Color(0,0,0))
            end
		end
 
        if GetConVar("sCheat_showUsergroup"):GetInt() == 1 then
            local usergroup = v:GetUserGroup()
 
            if usergroup == "superadmin" || usergroup == "admin" then
                draw.SimpleTextOutlined(usergroup , "Default" , Position.x , Position.y - 45 +(width/dist)*150*fovFix, Color(255,0,0), 1, 1, 1, Color(0,0,0))
				if topmost < 45 then
				topmost = 45
				end
            else
                draw.SimpleTextOutlined(usergroup , "Default" , Position.x , Position.y - 45 +(width/dist)*150*fovFix, Color(200,200,200), 1, 1, 1, Color(0,0,0))
				if topmost < 45 then
				topmost = 45
				end
            end
        end
 
		if v:IsTyping() then
		local new_top_loc = topmost + 15
			draw.SimpleTextOutlined(usergroup , "Default" , Position.x , Position.y - new_top_loc +(width/dist)*150*fovFix, Color(200,200,200), 1, 1, 1, Color(0,0,0))
			topmost = new_top_loc
		end
        
		if GetConVar("sCheat_ShowEyeLine"):GetInt() == 1 and GetConVar("sCheat_EyelineType"):GetInt() == 1 and v:Alive() and v != LocalPlayer() then
			local tr = util.TraceLine ({
        	start = v:EyePos(),
        	endpos = v:EyePos() + v:GetAimVector() * 5000,
        	filter = v,
        	mask = MASK_SOLID_BRUSHONLY
        	})
 
			local tr2 = util.TraceLine ({
        	start = v:EyePos(),
        	endpos = v:EyePos() + v:GetAimVector() * 100,
        	filter = v,
        	mask = MASK_SOLID_BRUSHONLY
        	})
 
        	local tp = tr.HitPos:ToScreen()
			local tp2 = tr2.HitPos:ToScreen()
        	local p = v:EyePos():ToScreen()
			surface.SetDrawColor(255,255,255, 90)
        	surface.DrawLine(p.x, p.y, tp2.x, tp2.y)
        	surface.SetDrawColor(255,0,0)
        	surface.DrawLine(tp.x - 4, tp.y, tp.x + 4, tp.y)
        	surface.DrawLine(tp.x, tp.y - 4, tp.x, tp.y + 4)
		end
 
		if GetConVar("sCheat_ShowEyeLine"):GetInt() == 1 and GetConVar("sCheat_EyelineType"):GetInt() == 2 and v:Alive() and v != LocalPlayer() then
			local tr = util.TraceLine ({
        	start = v:EyePos(),
        	endpos = v:EyePos() + v:GetAimVector() * 5000,
        	filter = v,
        	mask = MASK_SOLID_BRUSHONLY
        	})
 
        	local tp = tr.HitPos:ToScreen()
        	local p = v:EyePos():ToScreen()
			surface.SetDrawColor(255,255,255, 50)
        	surface.DrawLine(p.x, p.y, tp.x, tp.y)
        	surface.SetDrawColor(255,0,0)
        	surface.DrawLine(tp.x - 4, tp.y, tp.x + 4, tp.y)
        	surface.DrawLine(tp.x, tp.y - 4, tp.x, tp.y + 4)
		end
 
		if GetConVar("sCheat_HeadDot"):GetInt() == 1 then
			if v != ply and v:Alive() then
				size = 1
				screenpos = v:GetBonePosition( v:LookupBone('ValveBiped.Bip01_Head1') ):ToScreen()
				if ply:GetPos():Distance(v:GetPos()) < 2000 then
					size = 15-(ply:GetPos():Distance(v:GetPos()))/150
				elseif ply:GetPos():Distance(v:GetPos()) < 2000 then
					size = 2
				end
			surface.DrawCircle(screenpos.x,screenpos.y,size or 0,255,0,0,255)
			end
		end
 
        end
		end     
 
        end
    end
end )
 
local function gethead(ent)
	if ent:LookupBone("ValveBiped.Bip01_Head1") then
	local pos = ent:GetBonePosition(ent:GetHitBoxBone(0, 0))
		return pos
	end
	return ent:LocalToWorld(ent:OBBCenter())
end
 
local function aimbot(ucmd)
	local myang = LocalPlayer():GetAngles()
 
	if input.IsMouseDown(MOUSE_LEFT) or LocalPlayer():KeyDown(262144) or aim == true then
		if GetConVar("sCheat_Aimbot"):GetInt() == 1 then
		if GetConVar("sCheat"):GetInt() == 1 then
		if LocalPlayer():GetActiveWeapon():GetClass() != "gmod_tool" and LocalPlayer():GetActiveWeapon():GetClass() != "gmod_camera" and LocalPlayer():GetActiveWeapon():GetClass() != "weapon_physgun" and LocalPlayer():GetActiveWeapon():GetClass() != "weapon_physcannon" then
		local ply = LocalPlayer()
		local target = nil;
 
		for k, ent in next, player.GetAll() do
 
		local tr = util.TraceLine( {
		start = LocalPlayer():EyePos(),
		endpos = ent:EyePos(),
		filter = {LocalPlayer(), ent}
		} )
 
		if tr.HitPos == ent:EyePos() then
 
			if (!IsValid(ent) || ent:InVehicle() || ent == LocalPlayer() || !ent:Alive() || ent:IsNPC() || ent:Team() == TEAM_SPECTATOR) then
				continue
			end
 
			local ang = (ent:GetPos() - LocalPlayer():GetPos()):Angle()
			local angdiffy = math.abs(math.NormalizeAngle(myang.y - ang.y ))
			local angdiffp = math.abs(math.NormalizeAngle(myang.p - ang.p ))
		
			if (angdiffy < 6 and angdiffp < 6) then
				target = ent	
			end
		end
		if (target != nil) then
			local angle = (gethead(target) - LocalPlayer():GetShootPos()):Angle()
			angle.p = math.NormalizeAngle(angle.p)
			angle.y = math.NormalizeAngle(angle.y)
			local incr = GetConVar("sCheat_Aimbot_Speed"):GetInt() / 100
			ucmd:SetViewAngles(Lerp(incr, ucmd:GetViewAngles(), angle))
		end
		end
		end
		end
		end
	end
end
 
hook.Add("CreateMove", "bot", aimbot)
 
local SW = {}
 
SW.Enabled = false
SW.ViewOrigin = Vector( 0, 0, 0 )
SW.ViewAngle = Angle( 0, 0, 0 )
SW.Velocity = Vector( 0, 0, 0 )
 
function SW.CalcView( ply, origin, angles, fov )
        if ( !SW.Enabled ) then return end
        if ( SW.SetView ) then
                SW.ViewOrigin = origin
                SW.ViewAngle = angles
               
                SW.SetView = false
        end
        return { origin = SW.ViewOrigin, angles = SW.ViewAngle }
end
hook.Add( "CalcView", "SpiritWalk", SW.CalcView )
 
function SW.CreateMove( cmd )
        if ( !SW.Enabled ) then return end
       
        local time = FrameTime()
        SW.ViewOrigin = SW.ViewOrigin + ( SW.Velocity * time )
        SW.Velocity = SW.Velocity * 0.95
       
        local sensitivity = 0.022
        SW.ViewAngle.p = math.Clamp( SW.ViewAngle.p + ( cmd:GetMouseY() * sensitivity ), -89, 89 )
        SW.ViewAngle.y = SW.ViewAngle.y + ( cmd:GetMouseX() * -1 * sensitivity )
       
        local add = Vector( 0, 0, 0 )
        local ang = SW.ViewAngle
        if ( cmd:KeyDown( IN_FORWARD ) ) then add = add + ang:Forward() end
        if ( cmd:KeyDown( IN_BACK ) ) then add = add - ang:Forward() end
        if ( cmd:KeyDown( IN_MOVERIGHT ) ) then add = add + ang:Right() end
        if ( cmd:KeyDown( IN_MOVELEFT ) ) then add = add - ang:Right() end
        if ( cmd:KeyDown( IN_JUMP ) ) then add = add + ang:Up() end
        if ( cmd:KeyDown( IN_DUCK ) ) then add = add - ang:Up() end
       
        add = add:GetNormal() * time * 500
        if ( cmd:KeyDown( IN_SPEED ) ) then add = add * 2 end
       
        SW.Velocity = SW.Velocity + add
       
        if ( SW.LockView == true ) then
                SW.LockView = cmd:GetViewAngles()
        end
        if ( SW.LockView ) then
                cmd:SetViewAngles( SW.LockView )
        end
       
        cmd:SetForwardMove( 0 )
        cmd:SetSideMove( 0 )
        cmd:SetUpMove( 0 )
end
hook.Add( "CreateMove", "SpiritWalk", SW.CreateMove )
 
function SW.Toggle()
if GetConVar("sCheat"):GetInt() == 1 then
        SW.Enabled = !SW.Enabled
        SW.LockView = SW.Enabled
        SW.SetView = true
       
        local status = { [ true ] = "ON", [ false ] = "OFF" }
        print( "Clientside noclip " .. status[ SW.Enabled ] )
end
end
concommand.Add( "sCheat_Noclip_toggle", SW.Toggle )
 
concommand.Add( "sw_pos", function() print( SW.ViewOrigin ) end )
 
 
function DrawRainbowText( frequency, str, font, x, y )
	
	surface.SetFont( font )
	
	for i = 1, #str do
		surface.SetTextColor( HSVToColor( i * frequency % 360, 1, 1 ) )
		local w = surface.GetTextSize( string.sub( str, 1, i - 1 ) )
		surface.SetTextPos( x + w, y )
		surface.DrawText( string.sub( str, i, i ) )
	end
	
end
 
-- bhop starts here lol
 
local bhop = { }
bhop.MetaPlayer = FindMetaTable( "Player") 
bhop.oldKeyDown = bhop.MetaPlayer['KeyDown']
bhop.On = true
bhop.SOn = true
bhop.Hooks = { hook = { }, name = { } }
bhop.jump = false
function bhop.AddHook(hookname, name, func)
	table.insert( bhop.Hooks.hook, hookname )
	table.insert( bhop.Hooks.name, name )
	hook.Add( hookname, name, func ) --Hopefully you have something better
end
bhop.MetaPlayer['KeyDown'] = function( self, key )
	if self ~= LocalPlayer() then return end
	
	if (key == IN_MOVELEFT) and bhop.left then
		return true
	elseif (key == IN_MOVERIGHT) and bhop.right then
		return true
	elseif (key == IN_JUMP) and bhop.jump then
		return true
	else
		return bhop.oldKeyDown( self, key )
	end
end
 
local oldEyePos = LocalPlayer():EyeAngles()--This is to see where player is looking
function bhop.CreateMove( cmd )
	bhop.jump = false
	if (cmd:KeyDown( IN_JUMP )) then
	
		if (not bhop.jump) then
			if (bhop.On and not LocalPlayer():OnGround()) then --Bhop here
				cmd:RemoveKey( IN_JUMP )
			end
		else
			bhop.jump = false
		end
 
		if(bhop.SOn ) then--auto strafer
			local traceRes = LocalPlayer():EyeAngles()
								   
			if( traceRes.y > oldEyePos.y ) then --If you move your mouse left, walk left, if you're jumping
				oldEyePos = traceRes
				cmd:SetSideMove( -1000000 )
				bhop.left = true
				bhop.right = false 
			elseif( oldEyePos.y > traceRes.y )  then --If you move your mouse right, move right,  while jumping
				oldEyePos = traceRes
				cmd:SetSideMove( 1000000 )
				bhop.right = true
				bhop.left = false
			end
		end
	elseif (not bhop.jump) then
		bhop.jump = true
	end		 
end
		   
bhop.AddHook( "CreateMove", tostring(math.random(0, 133712837)), bhop.CreateMove )--add the hook
 
concommand.Add( "sCheat_bhop", function () --Toggler
	bhop.On = not bhop.On	
	local state = "off"
	if bhop.On then state = "on" end
	LocalPlayer():ChatPrint("Bhop ".. state)
end)
	
concommand.Add( "sCheat_bhop_strafe",  function ()
	bhop.SOn = not bhop.SOn
	local state = "off"
	if bhop.SOn then state = "on" end
	LocalPlayer():ChatPrint("Strafe ".. state)
end)
		   
 
 
-- keypad bullshit  vv
 
CreateClientConVar("sCheat_keypad", 0)
CreateClientConVar("sCheat_keypad_radius", 500)
local keypadradius = GetConVarNumber("sCheat_keypad_radius")
local X = -50
local Y = -100
 
local KeyPos =	{	
	{X+5, Y+100, 25, 25, -2.2, 3.45, 1.3, -0},
	{X+37.5, Y+100, 25, 25, -0.6, 1.85, 1.3, -0},
	{X+70, Y+100, 25, 25, 1.0, 0.25, 1.3, -0},
 
	{X+5, Y+132.5, 25, 25, -2.2, 3.45, 2.9, -1.6},
	{X+37.5, Y+132.5, 25, 25, -0.6, 1.85, 2.9, -1.6},
	{X+70, Y+132.5, 25, 25, 1.0, 0.25, 2.9, -1.6},
 
	{X+5, Y+165, 25, 25, -2.2, 3.45, 4.55, -3.3},
	{X+37.5, Y+165, 25, 25, -0.6, 1.85, 4.55, -3.3},
	{X+70, Y+165, 25, 25, 1.0, 0.25, 4.55, -3.3},
 
	{X+5, Y+67.5, 50, 25, -2.2, 4.7, -0.3, 1.6},
	{X+60, Y+67.5, 35, 25, 0.3, 1.65, -0.3, 1.6}
}
 
local function calctextopacity(dis)
	if keypadradius != 0 then
		return (dis / keypadradius) * 255
	else
		return 0
	end
end
 
local function survey()
	for k,v in pairs(player.GetAll()) do
		local kp = v:GetEyeTrace().Entity
		if IsValid(kp) and string.find(kp:GetClass(), "keypad") and not string.find(kp:GetClass(), "check") and not string.find(kp:GetClass(), "crack") and v:EyePos():Distance(kp:GetPos()) <= 71 then
			kp.tempCode = kp.tempCode or ""
			kp.tempText = kp.tempText or ""
			kp.tempStatus = kp.tempStatus or 0
			
			if (kp:GetDisplayText() != kp.tempText or kp:GetStatus() != kp.tempStatus) and GetDisplayText != nil then
				kp.tempText = kp:GetDisplayText()
				kp.tempStatus = kp:GetStatus()
				
				local tr = util.TraceLine({
					start = v:EyePos(),
					endpos = v:GetAimVector() * 32 + v:EyePos(),
					filter = v
				})
				
				local pos = kp:WorldToLocal(tr.HitPos)
				
				for i,p in pairs(KeyPos) do
					local x = (pos.y - p[5]) / (p[5] + p[6])
					local y = 1 - (pos.z + p[7]) / (p[7] + p[8])
					
					if (x >= 0 and y >= 0 and x <= 1 and y <= 1) then
						if i == 11 then
							timer.Simple(0, function() 
								if kp:GetStatus() == 1 then
									kp.code = kp.tempCode
								end
								kp.tempCode = ""
							end)		
						elseif i == 10 then
							kp.tempCode = ""
						else
							kp.tempCode = kp.tempCode..i
						end
					end
				end
			end
		end
	end
end
 
local function realboxkeypad(min, max, diff, clr)
	cam.Start3D()
	
		--vertical lines
 
		render.DrawLine( min, min+Vector(0,0,diff.z), clr)
		render.DrawLine( min+Vector(diff.x,0,0), min+Vector(diff.x,0,diff.z), clr)
		render.DrawLine( min+Vector(0,diff.y,0), min+Vector(0,diff.y,diff.z), clr)
		render.DrawLine( min+Vector(diff.x,diff.y,0), min+Vector(diff.x,diff.y,diff.z), clr)
 
		--horizontal lines top
		render.DrawLine( max, max-Vector(diff.x,0,0) , clr )
		render.DrawLine( max, max-Vector(0,diff.y,0) , clr)
		render.DrawLine( max-Vector(diff.x, diff.y,0), max-Vector(diff.x,0,0) , clr)
		render.DrawLine( max-Vector(diff.x, diff.y,0), max-Vector(0,diff.y,0) , clr)
 
		--horizontal lines bottom
		render.DrawLine( min, min+Vector(diff.x,0,0) , clr )
		render.DrawLine( min, min+Vector(0,diff.y,0) ,clr)
		render.DrawLine( min+Vector(diff.x, diff.y,0), min+Vector(diff.x,0,0) , clr )
		render.DrawLine( min+Vector(diff.x, diff.y,0), min+Vector(0,diff.y,0) , clr)
 
		-- extra
		--if ply:IsNPC() then return end
		--render.DrawLine(ply:GetShootPos(), ply:GetEyeTrace().HitPos, Color(255,0,0))
		
		
	cam.End3D()
end
 
local function drawstuff()
	for k,v in pairs(ents.FindInSphere(LocalPlayer():GetPos(), keypadradius)) do
		if IsValid(v) then
			if string.find(v:GetClass(), "keypad") and not string.find(v:GetClass(), "check") and not string.find(v:GetClass(), "crack") then
				if v != e then
					local pos = v:GetPos():ToScreen()
					local min, max = v:WorldSpaceAABB()
					local diff = max - min
					local pos = (min+Vector(diff.x*.5, diff.y*.5,diff.z + 3)):ToScreen()
					if IsValid(v) and v.code then
						realboxkeypad(min, max, diff, Color(0, 255, 0, 255))
						draw.DrawText(v.code, "Default", pos.x, pos.y - 10, Color(0, 255, 0, 255 - calctextopacity(v:GetPos():Distance(LocalPlayer():GetPos()))), 1)
					else
						realboxkeypad(min, max, diff, Color(255, 0, 0, 255))
						draw.DrawText("No Code Available", "Default", pos.x, pos.y - 10, Color(255, 0, 0, 255 - calctextopacity(v:GetPos():Distance(LocalPlayer():GetPos()))), 1)
					end
				end
			end
		end
	end
end
 
 
--prep
hook.Remove("Think", "WatchingPlayers", survey)
hook.Remove( "HUDPaint", "KeypadPasswords", drawstuff)
 
if GetConVarNumber("sCheat_keypad") == 1 then
	hook.Add("Think", "WatchingPlayers", survey)
	hook.Add( "HUDPaint", "KeypadPasswords", drawstuff)
end
--end of prep
cvars.AddChangeCallback("sCheat_keypad", function()
	if GetConVarNumber("sCheat_keypad") == 1 then
		hook.Add("Think", "WatchingPlayers", survey)
		hook.Add( "HUDPaint", "KeypadPasswords", drawstuff)
	else
		hook.Remove("Think", "WatchingPlayers", survey)
		hook.Remove( "HUDPaint", "KeypadPasswords", drawstuff)
	end
end)
 
cvars.AddChangeCallback("sCheat_keypad_radius", function() 
	keypadradius = GetConVarNumber("sCheat_keypad_radius")
end)
 
MsgC(Color(0,255,0), "\nKeypad Tracker initialized!\n")
 
 
 
 
--- new esp
 
local function MESPCheck(v)
	if v:Alive() == true && v:Health() ~= 0 && v:Health() >= 0 && v ~= LocalPlayer() && LocalPlayer():Alive() then
		return true
	else
		return false
	end
end
 
 
hook.Add( "HUDPaint", "aimbot.Wallhack", function()
	for k,v in pairs ( player.GetAll() ) do
		if GetConVar("sCheat_Box"):GetInt() == 1 and GetConVar("sCheat_Visuals"):GetInt() == 1 then
 
        	local Position = ( v:GetPos() + Vector( 0,0,80 ) ):ToScreen()
        	local Name = ""
 
        	if v == LocalPlayer() then Name = "" else Name = v:Name() end
		end
	end
end )
 
local shouldDraw = true
 
local hzCross = CreateClientConVar("HZ_Crosshair","0",false)
 
function Crosshair1()
if GetConVar("sCheat_Crosshair"):GetInt() == 1 then
	local ply = LocalPlayer()
	local tr = util.TraceLine ({
    start = ply:EyePos(),
    endpos = ply:EyePos() + ply:GetAimVector() * 5000,
    filter = ply,
    mask = MASK_SOLID_BRUSHONLY
    })
 
    local tp = tr.HitPos:ToScreen()
    surface.SetDrawColor(0,255,255)
    surface.DrawLine(tp.x - 4, tp.y, tp.x + 4, tp.y)
    surface.DrawLine(tp.x, tp.y - 4, tp.x, tp.y + 4)
end
end
hook.Add("HUDPaint","CustomCross",Crosshair1)
 
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
 
return minX, minY, maxX, maxY
end
hook.Add("HUDPaint", "Example", function()
for k,v in pairs(player.GetAll()) do
local roundeddist = math.Round(LocalPlayer():GetPos():Distance(v:GetPos()) / 53)
if GetConVar("sCheat_Box"):GetInt() == 1 and GetConVar("sCheat_Visuals"):GetInt() == 1 and roundeddist < GetConVar("sCheat_Visuals_distance"):GetInt() and GetConVar("sCheat"):GetInt() == 1 and v:Alive() then
        local x1,y1,x2,y2 = coordinates(v)
 
         surface.SetDrawColor(color_white)
 
 
        surface.DrawLine( x1, y1, math.min( x1 + 5, x2 ), y1 )
        surface.DrawLine( x1, y1, x1, math.min( y1 + 5, y2 ) )
 
 
        surface.DrawLine( x2, y1, math.max( x2 - 5, x1 ), y1 )
        surface.DrawLine( x2, y1, x2, math.min( y1 + 5, y2 ) )
 
 
        surface.DrawLine( x1, y2, math.min( x1 + 5, x2 ), y2 )
        surface.DrawLine( x1, y2, x1, math.max( y2 - 5, y1 ) )
 
 
        surface.DrawLine( x2, y2, math.max( x2 - 5, x1 ), y2 )
        surface.DrawLine( x2, y2, x2, math.max( y2 - 5, y1 ) )
end
end
end)
 
local struc = {}
struc.pos = {}
struc.pos[1] = 100 -- x pos
struc.pos[2] = 200 -- y pos
struc.color = Color(255,0,0,255) -- Red
struc.text = "test" -- Text
struc.font = "DefaultFixed" -- Font
struc.xalign = TEXT_ALIGN_CENTER -- Horizontal Alignment
struc.yalign = TEXT_ALIGN_CENTER -- Vertical Alignment
 
 
 
 
-- atm bullshit
 
local breake = 0
local function realDeposit(num, amount, memo)
	net.Start("ATM_DepositMoney_C2S")
		net.WriteTable({Memo = memo,Num=tostring(num),Amount=amount})
	net.SendToServer()
end
local function realRegister(num, name, pass)
	net.Start("ATM_CreateAccount_C2S")
		net.WriteTable({Num=tostring(num),Name=name,Password=pass})
	net.SendToServer()
end
 
local function bruteforce()
 
	local pintable = {}
 
	for i=0, 9 do
		table.insert(pintable, "000"..i)
	end
 
	for i = 10, 99 do
		table.insert(pintable, "00"..i)
	end
 
	for i = 100, 999 do
		table.insert(pintable, "0"..i)
	end
 
	for i = 1000, 9999 do
		table.insert(pintable, i)	
	end
 
	local function bruteforceall( ply, cmd, args )
		MsgC(Color(0,255,0), "\nBruteforcing...\n")
		for k, v in pairs(player.GetAll()) do
			for _, pin in pairs(pintable) do
				timer.Simple(tonumber(pin)*.015, function() --thx meepdarkness, keep in mind that multiplication is faster than divison
				RunConsoleCommand("rp_atm_withdraw", util.CRC(pin), v:UniqueID(), args[1])
				if breake == 1 then
					breake = 0
					return
				end
				end)
			end
		end
	end
 
	local function bruteforceply( ply, cmd , args )
		MsgC(Color(0,255,0), "\nBruteforcing...\n")
		for k, v in pairs(player.GetAll()) do
			if string.find(string.lower(v:Name()), string.lower(args[1])) then
				for _, pin in pairs(pintable) do
					timer.Simple(tonumber(pin)*.01, function()
					MsgC(Color(0,255,0), "\nChecking: "..pin.."\n")
					RunConsoleCommand("rp_atm_withdraw", util.CRC(pin), v:UniqueID(), args[2])
					if breake == 1 then
						breake = 0
						return
					end
					end)
				end
			end
		end
	end
 
	concommand.Add("sCheat_atmbruteforce_all", bruteforceall) --put amount to withdraw as an argument
 
	concommand.Add("sCheat_atmbruteforce_ply", bruteforceply) -- put name, then amount to withdraw as arguments
 
 
	MsgC(Color(0,255,0), "\nInitialzed!!\n")
 
end
 
 
 
 
concommand.Add("sCheat_atmbruteforce", bruteforce) -- don't want you to lag when you load it 
concommand.Add("sCheat_realistic_atm_register", function(ply, cmd, args, fullstring)
	realRegister(unpack(args))
end)
concommand.Add("sCheat_realistic_atm_deposit", function(ply, cmd, args, fullstring)
	realDeposit(args[1], tonumber(args[2]), args[3] or "")
end)
concommand.Add("sCheat_realistic_atm_withdrawal", function(ply, cmd, args, fullstring)
	realDeposit(args[1], -tonumber(args[2]), args[3] or "")
end)
 
MsgC(Color(0,255,0), "\nsCheats atm bruteforce initialized!\n")
 
 
local sCheat_Bones = {
"ValveBiped.Bip01_Head1",
"ValveBiped.Bip01_Pelvis",
"ValveBiped.Bip01_R_UpperArm",
"ValveBiped.Bip01_R_Forearm",
"ValveBiped.Bip01_R_Hand",
"ValveBiped.Bip01_L_UpperArm",
"ValveBiped.Bip01_L_Forearm",
"ValveBiped.Bip01_L_Hand",
"ValveBiped.Bip01_R_Calf",
"ValveBiped.Bip01_R_Foot",
"ValveBiped.Bip01_L_Calf",
"ValveBiped.Bip01_L_Foot"
}
 
ply = LocalPlayer()
hook.Add('HUDPaint','SkeletonEsp', function()
	for i,v in pairs(player.GetAll()) do
	local success = true
	if v != ply and v:Alive() and GetConVar("sCheat"):GetInt() == 1 then
	local roundeddist = math.Round(LocalPlayer():GetPos():Distance(v:GetPos()) / 53)
		if roundeddist < GetConVar("sCheat_Visuals_distance"):GetInt() and GetConVar("sCheat_Skeleton"):GetInt() == 1 and GetConVar("sCheat_Visuals"):GetInt() == 1 then
		for k, bone in pairs(sCheat_Bones) do
			if v:LookupBone(bone) != nil && v:GetBonePosition(v:LookupBone(bone)) != nil then
				success = true
			else
				success = false
					return
			end
		end
 
		if success == true then
		surface.SetDrawColor( 255, 255, 255, 255 )
		rshoulder = v:GetBonePosition( v:LookupBone('ValveBiped.Bip01_R_UpperArm') ):ToScreen()
		lshoulder = v:GetBonePosition( v:LookupBone('ValveBiped.Bip01_L_UpperArm') ):ToScreen()
		relbow = v:GetBonePosition( v:LookupBone('ValveBiped.Bip01_R_Forearm') ):ToScreen()
		lelbow = v:GetBonePosition( v:LookupBone('ValveBiped.Bip01_L_Forearm') ):ToScreen()
		lwrist = v:GetBonePosition( v:LookupBone('ValveBiped.Bip01_L_Hand') ):ToScreen()
		rwrist = v:GetBonePosition( v:LookupBone('ValveBiped.Bip01_R_Hand') ):ToScreen()
		head = v:GetBonePosition( v:LookupBone('ValveBiped.Bip01_Head1') ):ToScreen()
		pelvis = v:GetBonePosition( v:LookupBone('ValveBiped.Bip01_Pelvis') ):ToScreen()
		rthigh = v:GetBonePosition( v:LookupBone('ValveBiped.Bip01_R_Calf') ):ToScreen()
		lthigh = v:GetBonePosition( v:LookupBone('ValveBiped.Bip01_L_Calf') ):ToScreen()
		rfoot = v:GetBonePosition( v:LookupBone('ValveBiped.Bip01_R_Foot') ):ToScreen()
		lfoot = v:GetBonePosition( v:LookupBone('ValveBiped.Bip01_L_Foot') ):ToScreen()
		surface.DrawLine(rshoulder.x,rshoulder.y,lshoulder.x,lshoulder.y)
		surface.DrawLine(rshoulder.x,rshoulder.y,relbow.x,relbow.y)
		surface.DrawLine(lshoulder.x,lshoulder.y,lelbow.x,lelbow.y)
		surface.DrawLine(relbow.x,relbow.y,rwrist.x,rwrist.y)
		surface.DrawLine(lelbow.x,lelbow.y,lwrist.x,lwrist.y)
		surface.DrawLine(head.x,head.y,pelvis.x,pelvis.y)
		surface.DrawLine(pelvis.x,pelvis.y,rthigh.x,rthigh.y)
		surface.DrawLine(pelvis.x,pelvis.y,lthigh.x,lthigh.y)
		surface.DrawLine(rthigh.x,rthigh.y,rfoot.x,rfoot.y)
		surface.DrawLine(lthigh.x,lthigh.y,lfoot.x,lfoot.y)
		end
		end
		end
	end
end)
 
local dis = 512
hook.Add( "PreDrawHalos", "AddHalos", function()
	local ply = LocalPlayer()
	for i,v in pairs(player.GetAll()) do
		local roundeddist = math.Round(LocalPlayer():GetPos():Distance(v:GetPos()) / 53)
		if v != ply and v:Alive() and GetConVar("sCheat_Glow"):GetInt() == 1 and GetConVar("sCheat_Visuals"):GetInt() == 1 and roundeddist < GetConVar("sCheat_Visuals_distance"):GetInt() then
        	halo.Add({v}, Color(18,219,199), 1, 1, 1, true, true)
		end
	end
end)
 
concommand.Add( "sCheat_menu", function ()
	if !frame then
		local frame = vgui.Create("DFrame")
		frame:SetSize(250, 460)
		frame:SetPos(ScrW() / 2, ScrH() / 2)
		frame:Center()
		frame:SetVisible(true)
		frame:SetTitle("sCheat by skyr0.cc")
		frame:MakePopup()
		frame.Paint = function(self, w, h)
			draw.RoundedBox(10,0,0, w, h, Color(84, 84, 84, 125))
		end
 
		local sheet = vgui.Create( "DPropertySheet", frame )
		sheet:Dock( FILL )
 
		local panel1 = vgui.Create( "DPanel", sheet )
		panel1.Paint = function( self, w, h ) draw.RoundedBox( 4, 0, 0, w, h, Color( 77, 77, 77, 62 ) ) end 
		sheet:AddSheet( "Aimbot", panel1 )
 
		local panel2 = vgui.Create( "DPanel", sheet )
		panel2.Paint = function( self, w, h ) draw.RoundedBox( 4, 0, 0, w, h, Color( 77, 77, 77, 62 ) ) end 
		sheet:AddSheet( "Visuals", panel2 )
 
		local panel3 = vgui.Create( "DPanel", sheet )
		panel3.Paint = function( self, w, h ) draw.RoundedBox( 4, 0, 0, w, h, Color( 77, 77, 77, 62 ) ) end 
		sheet:AddSheet( "Misc", panel3 )
 
		--  VISUALS  --
 
		local VisualsCheckbox = panel2:Add("DCheckBoxLabel")
		VisualsCheckbox:SetPos(25,25)
		VisualsCheckbox:SetText("Visuals")
		VisualsCheckbox:SetConVar("sCheat_Visuals")
 
		local BoxESPCheckbox = panel2:Add("DCheckBoxLabel")
		BoxESPCheckbox:SetPos(40,50)
		BoxESPCheckbox:SetText("Show player box")
		BoxESPCheckbox:SetConVar("sCheat_Box")
 
		local ShowNameBox = panel2:Add("DCheckBoxLabel")
		ShowNameBox:SetPos(40,75)
		ShowNameBox:SetText("Show player name")
		ShowNameBox:SetConVar("sCheat_ShowName")
 
		local ShowNameBox = panel2:Add("DCheckBoxLabel")
		ShowNameBox:SetPos(40,100)
		ShowNameBox:SetText("Show player health")
		ShowNameBox:SetConVar("sCheat_ShowHP")
 
		local ShowDistance = panel2:Add("DCheckBoxLabel")
		ShowDistance:SetPos(40,125)
		ShowDistance:SetText("Show player distance")
		ShowDistance:SetConVar("sCheat_ShowDistance")
 
		local ShowUsergroupCheckbox = panel2:Add("DCheckBoxLabel")
		ShowUsergroupCheckbox:SetPos(40,150)
		ShowUsergroupCheckbox:SetText("Show player usergroup")
		ShowUsergroupCheckbox:SetConVar("sCheat_showUsergroup")
 
		local ShowSkeleton = panel2:Add("DCheckBoxLabel")
		ShowSkeleton:SetPos(40,175)
		ShowSkeleton:SetText("Show player eye tracer")
		ShowSkeleton:SetConVar("sCheat_ShowEyeLine")
 
		local EyeTracerCombo = panel2:Add("DComboBox")
		EyeTracerCombo:SetPos(40,195)
		EyeTracerCombo:SetSize(100,20)
		EyeTracerCombo:SetValue( "Choose type" )
		EyeTracerCombo:AddChoice( "Short line" )
		EyeTracerCombo:AddChoice( "Long line" )
		EyeTracerCombo.OnSelect = function( self, index, value )
			if value == "Short line" then
				LocalPlayer():ConCommand("sCheat_EyelineType 1")
			elseif value == "Long line" then
				LocalPlayer():ConCommand("sCheat_EyelineType 2")
			end
		end
 
		local ShowSkeleton = panel2:Add("DCheckBoxLabel")
		ShowSkeleton:SetPos(40,225)
		ShowSkeleton:SetText("Show player skeleton")	
		ShowSkeleton:SetConVar("sCheat_Skeleton")
 
		local ShowCrosshair = panel2:Add("DCheckBoxLabel")
		ShowCrosshair:SetPos(40,250)
		ShowCrosshair:SetText("Show recoil crosshair")
		ShowCrosshair:SetConVar("sCheat_Crosshair")
 
		local visualsDistLabel = panel2:Add("DLabel")
		visualsDistLabel:SetPos(25,325)
		visualsDistLabel:SetText("Visuals distance")
		visualsDistLabel:SetSize(100, 25)
 
		local VisualDistanceSlider = panel2:Add("DNumSlider")
		VisualDistanceSlider:SetPos(-110,350)
		VisualDistanceSlider:SetSize(300, 20)
		VisualDistanceSlider:SetMin(1)
		VisualDistanceSlider:SetMax(150)
		VisualDistanceSlider:SetDecimals(0)
		VisualDistanceSlider:SetConVar("sCheat_Visuals_distance")
 
		local HeaddotBox = panel2:Add("DCheckBoxLabel")
		HeaddotBox:SetPos(40,275)
		HeaddotBox:SetText("Show head dot")
		HeaddotBox:SetConVar("sCheat_HeadDot")
 
		local GlowBox = panel2:Add("DCheckBoxLabel")
		GlowBox:SetPos(40,300)
		GlowBox:SetText("Show glow ESP")
		GlowBox:SetConVar("sCheat_Glow")
 
 
		--   AIMBOT  --
 
		local AimbotBox = panel1:Add("DCheckBoxLabel")
		AimbotBox:SetPos(25,25)
		AimbotBox:SetText("Enable aimbot")
		AimbotBox:SetConVar("sCheat_Aimbot")
 
		local AimbotSpeedSlider = panel1:Add("DNumSlider")
		AimbotSpeedSlider:SetPos(-100,60)
		AimbotSpeedSlider:SetSize(300, 20)
		AimbotSpeedSlider:SetMin(1)
		AimbotSpeedSlider:SetMax(50)
		AimbotSpeedSlider:SetDecimals(0)
		AimbotSpeedSlider:SetConVar("sCheat_Aimbot_Speed")
 
		local AimbotSpeedLabel = panel1:Add("DLabel")
		AimbotSpeedLabel:SetPos(30,40)
		AimbotSpeedLabel:SetText("Aimbot speed")
		AimbotSpeedLabel:SetSize(100, 25)
 
		--  MISC  --
 
		local BhopBox = panel3:Add("DButton")
		BhopBox:SetPos(25,25)
		BhopBox:SetSize(100, 20)
		BhopBox:SetText("Toggle bhop")
		BhopBox.DoClick = function()
			LocalPlayer():ConCommand("sCheat_bhop")
		end
 
		local BhopStafeBox = panel3:Add("DButton")
		BhopStafeBox:SetPos(40,50)
		BhopStafeBox:SetSize(150, 20)
		BhopStafeBox:SetText("Toggle bhop auto-strafe")
		BhopStafeBox.DoClick = function()
			LocalPlayer():ConCommand("sCheat_bhop_strafe")
		end
 
		local BhopStafeBox = panel3:Add("DButton")
		BhopStafeBox:SetPos(25,90)
		BhopStafeBox:SetSize(150, 20)
		BhopStafeBox:SetText("Toggle Clientside noclip")
		BhopStafeBox.DoClick = function()
			LocalPlayer():ConCommand("sCheat_Noclip_toggle")
			LocalPlayer():ChatPrint("Clientside noclip toggled!")
		end
 
		local binderLabel = panel3:Add("DLabel")
		binderLabel:SetPos(25,115)
		binderLabel:SetText("Use 'bind (key) sCheat_Noclip_toggle' to \nbind it to a key!")
		binderLabel:SetSize(200, 25)
 
		local KeypadsBox = panel3:Add("DCheckBoxLabel")
		KeypadsBox:SetPos(25,160)
		KeypadsBox:SetText("Enable keypad ESP/code reveal")
		KeypadsBox:SetConVar("sCheat_keypad")
 
		local BhopStafeBox = panel3:Add("DButton")
		BhopStafeBox:SetPos(25,185)
		BhopStafeBox:SetSize(150, 20)
		BhopStafeBox:SetText("ATM Brute force")
		BhopStafeBox.DoClick = function()
			LocalPlayer():ConCommand("sCheat_atmbruteforce")
			LocalPlayer():ChatPrint("Initializing...\nCheck console for more info.")
			print("Use sCheat_realistic_atm_register, sCheat_realistic_atm_deposit and sCheat_realistic_atm_withdrawal for more.")
		end
 
	end
end)