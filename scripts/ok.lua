//require("bsendpacket")
require("dickwrap")
require("mega")

surface.CreateFont("wireless gamer", {font = "Open Sans MS", size = 45})
surface.CreateFont("visual gamer", {font = "Open Sans MS", size = 15, weight = 600, outline = true})
local _R = debug.getregistry()
_R["__rbackup"] = _R["__rbackup"] and _R["__rbackup"] or table.Copy(_R)
local r = _R["__rbackup"]
local me = LocalPlayer()
ok = {}
ok.cvars = {}
ok.aaa = {}
ok.ys = GetConVarNumber("m_yaw")
ok.aat = nil
ok.aas = false
ok.atk = false
ok.ld = false
ok.gd = false
ok.hm = 0
ok.dc = 0
ok.ct = 0
ok.flt = 0
ok.fltm = 0
ok.er = 0
ok.eg = 0
ok.eb = 0
ok.fa = nil
ok.sp = nil
ok.ep = nil

function ok.Log(...)
	MsgC(Color(5, 130, 255), "[MemeSmasher] ", Color(255, 190, 5), ...)
	MsgN("")
end

ok.Log("Loading...")

function ok.CreateConsoleVar(name, default)
	local ret = CreateClientConVar(name, default)
	ok.cvars[name] = tostring(default)
	ok.Log("Created convar: ", Color(255, 120, 5), name, Color(255, 0, 0), " (default: " .. tostring(default) .. ", value: ", ret:GetString(), ")")
	return ret
end

ok.vars = {
	aimbot = {
		enabled = ok.CreateConsoleVar("ok_aimbot", 1),
		pointscale = ok.CreateConsoleVar("ok_aimbot_point", 0.5),
		autowall = ok.CreateConsoleVar("ok_aimbot_autowall", 0),
		silent = ok.CreateConsoleVar("ok_aimbot_silent", 1),
		nospread = ok.CreateConsoleVar("ok_aimbot_nospread", 1),
		bodyaim = ok.CreateConsoleVar("ok_aimbot_body", 0),
		static = ok.CreateConsoleVar("ok_aimbot_staticaa", 1),
		nextshot = ok.CreateConsoleVar("ok_aimbot_nextshot", 1),
		autoshoot = ok.CreateConsoleVar("ok_aimbot_autoshoot", 1),
		team = ok.CreateConsoleVar("ok_aimbot_ignoreteam", 1),
		friends = ok.CreateConsoleVar("ok_aimbot_ignorefriends", 0)
	},

	visuals = {
		enabled = ok.CreateConsoleVar("ok_esp", 1),
		name = ok.CreateConsoleVar("ok_esp_name", 1),
		box = ok.CreateConsoleVar("ok_esp_box", 1),
		health = ok.CreateConsoleVar("ok_esp_health", 1),
		rank = ok.CreateConsoleVar("ok_esp_rank", 1),
		team = ok.CreateConsoleVar("ok_esp_team", 1),
		chams = ok.CreateConsoleVar("ok_esp_chams", 1),
		aimpos = ok.CreateConsoleVar("ok_esp_aimpos", 1),
	},

	hvh = {
		antiaim = ok.CreateConsoleVar("ok_hvh_antiaim", 1),
		edge = ok.CreateConsoleVar("ok_hvh_aa_edge", 1),
		edgemet = ok.CreateConsoleVar("ok_hvh_aa_edge_met", "forward"),
		jitter = ok.CreateConsoleVar("ok_hvh_aa_jitter", 0),
		adaptive = ok.CreateConsoleVar("ok_hvh_aa_adaptive", 1),
		adapyaw = ok.CreateConsoleVar("ok_hvh_adap_yaw", 450),
		adapmax = ok.CreateConsoleVar("ok_hvh_adap_max", 15),
		adapspeed = ok.CreateConsoleVar("ok_hvh_adap_speed", 1),
		fakeangles = ok.CreateConsoleVar("ok_hvh_aa_fakeangles", 0),
		pitch = ok.CreateConsoleVar("ok_hvh_aa_pitch", -192),
		yaw = ok.CreateConsoleVar("ok_hvh_aa_yaw", -541),
		roll = ok.CreateConsoleVar("ok_hvh_aa_roll", 0),
		yawbase = ok.CreateConsoleVar("ok_hvh_aa_yawbase", 360),
		yawadd = ok.CreateConsoleVar("ok_hvh_aa_yawadd", 45),
		fakelag = ok.CreateConsoleVar("ok_hvh_fakelag", 0),
		flchoke = ok.CreateConsoleVar("ok_hvh_fl_choke", 9),
		flsend = ok.CreateConsoleVar("ok_hvh_fl_send", 4)
	},

	highjump = ok.CreateConsoleVar("ok_highjump", 0),
	thirdperson = ok.CreateConsoleVar("ok_thirdperson", 1),
	killspam = ok.CreateConsoleVar("ok_killspam", 1),
	autostrafe = ok.CreateConsoleVar("ok_autostrafe", 1)
}

ok.pitches = {
	["-89"] = {
		-1.05,
	},

	["89"] = {
		-5.00,
		1.05,
	}
}

ok.cones = {}

function _R.Entity.FireBullets(ent, bul)
	if bul.Spread then
		ok.cones[me:GetActiveWeapon():GetClass()] = bul.Spread * -1
	end

	r.Entity.FireBullets(ent, bul)
end

function ok.GetCone(wep)
	local cone = 0
	if !wep then return nil end
	if wep.Cone then cone = wep.Cone end
	if wep.Primary and wep.Primary.Cone then cone = wep.Primary.Cone end
	if wep.Secondary and wep.Secondary.Cone then cone = wep.Secondary.Cone end
	if cone != 0 then return Vector(-cone, -cone, -cone) end
	return nil
end

function ok.Compensate(cmd, ang)
	local wep = me:GetActiveWeapon()
	if !IsValid(wep) then return ang end
	local cone = ok.cones[wep:GetClass()] or ok.GetCone(wep)
	if !cone then return ang end
	return ok.vars["aimbot"]["nospread"]:GetBool() and dickwrap.Predict(cmd, ang:Forward(), cone):Angle() or ang
end

function ok.CheckVis(ent)
	local sp = me:GetShootPos()
	local ep = !ok.vars["aimbot"]["bodyaim"]:GetBool() and (ent:GetAttachment(ent:LookupAttachment("eyes") or ent:LookupAttachment("forward")).Pos) or ent:GetPos() + ent:OBBCenter()

	local tdata = {
		start = sp,
		endpos = ep,
		filter = {ent, me},
		mask = MASK_SHOT
	}

	local trace = util.TraceLine(tdata)
	return trace.Fraction == 1, sp, ep + ((ent:GetVelocity() * engine.TickInterval()) - (me:GetVelocity() * engine.TickInterval()))
end


function ok.CanWallbang(sp, ep, ent)
    local tdata = {
    	start = sp,
    	endpos = ep,
    	filter = {ent, me},
    	mask = 1577075107
    }

    local wall = util.TraceLine(tdata)
    tdata.start = ep 
    tdata.endpos = sp
    local wall2 = util.TraceLine(tdata)
    if 17.5 > (wall2.HitPos - wall.HitPos):Length2D() then
    	return true
    else
    	return false
    end
end


function ok.GetTarget()
	local vis
	ok.sp, ok.ep, ok.aat = nil, nil, nil

	for k,v in next, player.GetAll() do
		if !ok.vars["aimbot"]["enabled"]:GetBool() or !v or !v:IsPlayer() or 0 >= v:Health() or v:IsDormant() or v == me then continue end
		if ok.vars["aimbot"]["team"]:GetBool() and v:Team() == me:Team() then continue end
		if ok.vars["aimbot"]["friends"]:GetBool() and v:GetFriendStatus() == "friend" then continue end
		local sp, ep
		vis, sp, ep = ok.CheckVis(v)
		ok.aat = v
		if vis or (ok.vars["aimbot"]["autowall"]:GetBool() and ok.CanWallbang(sp, ep, v)) then ok.sp = sp ok.ep = ep break else continue end
	end
end

function ok.DoSilent(cmd)
	if !ok.fa then ok.fa = cmd:GetViewAngles() end
	ok.fa = ok.fa + Angle(cmd:GetMouseY() * ok.ys, cmd:GetMouseX() * -ok.ys, 0)
	ok.fa.p = math.Clamp(ok.fa.p, -89, 89)
	ok.fa.y = math.NormalizeAngle(ok.fa.y)
end

function ok.FixMove(cmd) // credits to im friendly
	local viewang = Angle(0, cmd:GetViewAngles().y, 0)
	local fix = Vector(cmd:GetForwardMove(), cmd:GetSideMove(), 0)
	fix = (fix:Angle() + (viewang - ok.fa)):Forward() * fix:Length()
	
	if cmd:GetViewAngles().p > 90 or cmd:GetViewAngles().p < -90 then
		fix.x = -fix.x
	end
	
	cmd:SetForwardMove(fix.x)
	cmd:SetSideMove(fix.y)
end


function ok.GetCurTime()
	if IsFirstTimePredicted() then
		ok.ct = CurTime() + engine.TickInterval()
	end
end

function ok.CanFire()
	if !ok.ct or ok.ct == 0 then return false end
	local wep = me:GetActiveWeapon() or NULL
	if !IsValid(wep) then return false end
	return wep:GetActivity() != ACT_RELOAD and ok.ct > wep:GetNextPrimaryFire()
end

function ok.AutoHop(cmd)
	if me:IsOnGround() and cmd:KeyDown(IN_JUMP) then
		cmd:SetButtons(bit.bor(cmd:GetButtons(), IN_JUMP))
	else
		cmd:RemoveKey(IN_JUMP)
	end

	if ok.vars["autostrafe"]:GetBool() and !me:IsOnGround() then
		if cmd:GetMouseX() > 0 then
			cmd:SetSideMove(10^4)
		elseif 0 > cmd:GetMouseX() then
			cmd:SetSideMove(-10^4)
		end
	end
end

function ok.Aimbot(cmd)
	local autoshoot = ok.vars["aimbot"]["autoshoot"]:GetBool()
	local nextshot = ok.vars["aimbot"]["nextshot"]:GetBool()
	local silent = ok.vars["aimbot"]["silent"]:GetBool()
	local fakelag = ok.vars["hvh"]["fakelag"]:GetBool()
	local antiaim = ok.vars["hvh"]["antiaim"]:GetBool()

	ok.DoSilent(cmd)
	if cmd:CommandNumber() == 0 and !ok.vars["thirdperson"]:GetBool() and (silent or antiaim) then cmd:SetViewAngles(ok.fa) return end

	if !fakelag then
		bSendPacket = true
	end

	if ok.sp and ok.ep then
		local aafix = false
		local ap = ok.Compensate(cmd, (ok.ep - ok.sp):Angle())
		ap.p, ap.y = math.NormalizeAngle(ap.p), math.NormalizeAngle(ap.y)

		if ok.CanFire() and (autoshoot or cmd:KeyDown(IN_ATTACK)) then
			if ok.vars["aimbot"]["static"]:GetBool() then
				aafix = true
				ap.p = -ap.p - 180
				ap.y = ap.y + 180
			end
			
			cmd:SetViewAngles(ap)
			if autoshoot then
				if nextshot then
					cmd:SetButtons(bit.bor(cmd:GetButtons(), IN_ATTACK))
				else
					if ok.atk then
						cmd:SetButtons(bit.bor(cmd:GetButtons(), IN_ATTACK))
					else
						cmd:RemoveKey(IN_ATTACK)
					end

					ok.atk = !ok.atk
				end
			end

			if silent then
				ok.FixMove(cmd, aafix)
			end

			if !fakelag then
				bSendPacket = false
			end
		else
			if autoshoot and nextshoot then
				cmd:RemoveKey(IN_ATTACK)
			end

			if antiaim then
				ok.AntiAim(cmd, true)
			elseif silent then
				cmd:SetViewAngles(ok.fa)
			end

			if !fakelag then
				bSendPacket = true
			end
		end

		return
	end

	if antiaim or silent then
		cmd:SetViewAngles(ok.fa)
	end
end

ok.fat = 0
ok.aa_as = false
ok.aa_a = 0
ok.aayaws = {}

function ok.AntiAim(cmd, force)
	if cmd:CommandNumber() == 0 and !ok.vars["thirdperson"]:GetBool() then return end
	if me:GetActiveWeapon() != NULL and me:GetActiveWeapon():GetClass():lower():find("knife") then return end
	if !force and (ok.sp != nil or ok.ep != nil) then return end
	if !force and cmd:KeyDown(IN_ATTACK) then
		if ok.vars["aimbot"]["static"]:GetBool() then
			cmd:SetViewAngles(Angle(-ok.fa.p - 180, ok.fa.y + 180, 0))
			ok.FixMove(cmd, true)
		end

		return
	end

	for i = 1, 5 do
		ok.aayaws[i] = (ok.vars["hvh"]["yawbase"]:GetInt() * i) + ok.vars["hvh"]["yawadd"]:GetInt()
	end

	if ok.vars["hvh"]["antiaim"]:GetBool() then
		local fakeangles = ok.vars["hvh"]["fakeangles"]:GetBool()
		local pitch = ok.vars["hvh"]["pitch"]:GetFloat() or 262
		local yaw = ok.vars["hvh"]["yaw"]:GetFloat() or 450
		local roll = ok.vars["hvh"]["roll"]:GetFloat() or 0

		if ok.vars["hvh"]["fakeangles"]:GetBool() and !ok.vars["hvh"]["fakelag"]:GetBool() then
			if ok.fat >= 3 then
				bSendPacket = !bSendPacket
				ok.fat = 0
			end
		end

		ok.fat = ok.fat + 1

		if ok.vars["hvh"]["adaptive"]:GetBool() then
			local adapmax = ok.vars["hvh"]["adapmax"]:GetInt()
			local adapspeed = ok.vars["hvh"]["adapspeed"]:GetInt()
			if ok.aa_a >= adapmax then
				ok.aa_a = adapmax
				ok.aa_as = false
			elseif -adapmax >= ok.aa_a then
				ok.aa_a = -adapmax
				ok.aa_as = true
			end

			if ok.aa_as then
				ok.aa_a = ok.aa_a + adapspeed
			else
				ok.aa_a = ok.aa_a - adapspeed
			end

			local adapyaw = ok.vars["hvh"]["adapyaw"]:GetFloat()
			local aay = (ok.aat and ok.aat != NULL) and (ok.aat:GetAttachment(ok.aat:LookupAttachment("forward") or ok.aat:LookupAttachment("eyes")).Pos - me:GetShootPos()):Angle().y + 180 or 0
			if !fakeangles then
				cmd:SetViewAngles(Angle(pitch, aay + adapyaw + ok.aa_a, roll))
			else
				if bSendPacket then
					cmd:SetViewAngles(Angle(pitch, aay + adapyaw, roll))
				else
					cmd:SetViewAngles(Angle(pitch, aay + adapyaw + 262, roll))
				end
			end
		elseif ok.vars["hvh"]["jitter"]:GetBool() then
			if !fakeangles then
				cmd:SetViewAngles(Angle(pitch, table.Random(ok.aayaws) + math.random(-2, 2), roll))
			else
				if bSendPacket then
					cmd:SetViewAngles(Angle(pitch, table.Random(ok.aayaws) + math.random(-2, 2), roll))
				else
					cmd:SetViewAngles(Angle(pitch, table.Random(ok.aayaws) - 125 + math.random(-10, 10), roll))
				end
			end
		else
			if !fakeangles then
				cmd:SetViewAngles(Angle(pitch, yaw, roll))
			else
				if bSendPacket then
					cmd:SetViewAngles(Angle(pitch, yaw, roll))
				else
					cmd:SetViewAngles(Angle(pitch, yaw + 125, roll))
				end
			end
		end

		if ok.vars["hvh"]["edge"]:GetBool() then
			local setp = false
			local edge = false
			local ang = Angle(0, 0, 0)
			local eyepos = me:GetShootPos() - Vector(0, 0, 5)

			for y = 1, 8 do
				local tmp = Angle(0, y * 45, 0)
				local forward = tmp:Forward()
				forward = forward * 35

				local tdata
				tdata = {start = eyepos, endpos = eyepos + forward, filter = me, mask = MASK_SOLID}
				local trace = util.TraceLine(tdata)
			
				if trace.Fraction != 1 then
					local negate = trace.HitNormal * -1
					tmp.y = negate:Angle().y
					
					local left = (tmp + Angle(0, 11.25, 0)):Forward() * 35
					local right = (tmp - Angle(0, 11.25, 0)):Forward() * 35
					tdata = {start = eyepos, endpos = eyepos + left, filter = me, mask = MASK_SOLID}
					local lt = util.TraceLine(tdata)
					tdata = {start = eyepos, endpos = eyepos + right, filter = me, mask = MASK_SOLID}
					local rt = util.TraceLine(tdata)
					local ltw = lt.Fraction == 1
					local rtw = rt.Fraction == 1

					local edgem = ok.vars["hvh"]["edgemet"]:GetString()
					if edgem == "regular" then
						if ltw or rtw then
							tmp.y = tmp.y + 180
						end

						ang.y = 270 - tmp.y + 360
					elseif edgem == "backward" or edgem == "forward" then
						ang.y = tmp.y + (edgem == "backward" and 180 or 360)
					elseif edgem == "jitter" then
						if ltw or rtw then
							tmp.y = tmp.y + 180
						end

						ang.y = 270 - tmp.y + math.random(-15, 15)
					end

					edge = true
					break
				end
			end

			if edge then
				if !fakeangles then
					cmd:SetViewAngles(Angle(ang.p != 0 and ang.p or pitch, ang.y, roll))
				else
					if bSendPacket then
						cmd:SetViewAngles(Angle(ang.p != 0 and ang.p or pitch, ang.y, roll))
					else
						cmd:SetViewAngles(Angle(pitch, ang.y + 25, roll))
					end
				end
			end
		end

		pitch = cmd:GetViewAngles().p
		ok.aas = !ok.aas
		ok.FixMove(cmd, (pitch > 90 or -90 > pitch) and true or false)
	end
end

function ok.FakeLag(cmd)
	if cmd:CommandNumber() == 0 then return end
	local choke = ok.vars["hvh"]["flchoke"]:GetInt()
	local send = ok.vars["hvh"]["flsend"]:GetInt()
	ok.fltm = choke + send

	if ok.vars["hvh"]["fakelag"]:GetBool() then
		ok.flt = ok.flt + 1
		
		if ok.flt > ok.fltm then
			ok.flt = 1
		end

		if send >= ok.flt then
			bSendPacket = true
		else
			bSendPacket = false
		end
	end
end

function ok.CheckAAA(ply)
	for f,t in next, ok.pitches do
		for i,p in next, t do
			if tonumber(string.sub(tostring(ply:EyeAngles().x), 1, 5)) == p then
				ply:SetRenderAngles(Angle(0, ply:EyeAngles().y + 180, 0))
				ply:SetPoseParameter("aim_pitch", tonumber(f))
				ply:InvalidateBoneCache()
			end
		end
	end
end

function ok.HighJump(cmd)
	if !ok.vars["highjump"]:GetBool() then return end
	local pos = me:GetPos()
	local tdata = {start = pos, endpos = pos - Vector(0, 0, 1337), mask = MASK_SOLID}
	local trace = util.TraceLine(tdata)
	local len = (pos - trace.HitPos).z
	if len > 25 and 50 > len then
		cmd:SetButtons(bit.bor(cmd:GetButtons(), IN_DUCK))
	else
		cmd:RemoveKey(IN_DUCK)
	end
end

function ok.NoSpread(cmd)
	if !ok.vars["aimbot"]["nospread"]:GetBool() or cmd:CommandNumber() == 0 then return end
  	if cmd:KeyDown(IN_ATTACK) then
 		cmd:SetViewAngles(ok.Compensate(cmd, ok.fa))
  	end
end

function ok.Visuals()
	ok.er = math.sin(CurTime() * 4) * 127 + 128
	ok.eg = math.sin(CurTime() * 4 + 2) * 127 + 128
	ok.eb = math.sin(CurTime() * 4 + 4) * 127 + 128
	draw.SimpleText("MemeSmasher", "wireless gamer", 4, 40, Color(ok.er, ok.eg, ok.eb), TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM)

	for k,v in next, player.GetAll() do
		if !ok.vars["visuals"]["enabled"]:GetBool() or !v:IsValid() or !v:IsPlayer() or !v:Alive() or 0 >= v:Health() or v == me then continue end
		local min, max, pos = v:OBBMins(), v:OBBMaxs(), v:GetPos()
		local top, bottom = (pos + Vector(0, 0, max.z)):ToScreen(), (pos - Vector(0, 0, 15)):ToScreen()
		local middle = bottom.y - top.y
		local width = middle / 2.5

		if ok.vars["visuals"]["name"]:GetBool() then
			draw.SimpleText(v:Nick(), "visual gamer", bottom.x, top.y - 12, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		end

		if ok.vars["visuals"]["box"]:GetBool() then
			surface.SetDrawColor(me:Team() == v:Team() and Color(0, 0, 255) or Color(255, 255, 0))
			surface.DrawOutlinedRect(bottom.x - width, top.y, width * 2, middle)
			surface.SetDrawColor(Color(0, 0, 0))
			surface.DrawOutlinedRect(bottom.x - width - 1, top.y - 1, width * 2 + 2, middle + 2)
			surface.DrawOutlinedRect(bottom.x - width + 1, top.y + 1, width * 2 - 2, middle - 2)
		end

		if ok.vars["visuals"]["health"]:GetBool() then
			local health = v:Health()
			local col = health >= 101 and Color(0, 200, 0) or Color(0, 255, 0)
			draw.SimpleText(tostring(health), "visual gamer", bottom.x, bottom.y + 12, col, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		end

		if ok.vars["visuals"]["rank"]:GetBool() then
			local rank = v:GetUserGroup()
			draw.SimpleText(rank, "visual gamer", bottom.x, bottom.y + 24, (rank == "guest" or rank == "user") and Color(255, 255, 0) or Color(255, 0, 0), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		end

		if ok.vars["visuals"]["team"]:GetBool() then
			local tm = v:Team()
			draw.SimpleText(team.GetName(tm), "visual gamer", bottom.x, bottom.y + 36, team.GetColor(tm), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		end
	end
end

ok.chams1 = CreateMaterial("wireless_gamer_material", "UnlitGeneric", {
	["$ignorez"] = 1,
	["$model"] = 1,
	["$basetexture"] = "models/debug/debugwhite"
})

ok.chams2 = CreateMaterial("wired_gamer_loser_material", "UnlitGeneric", {
	["$ignorez"] = 0,
	["$model"] = 1,
	["$basetexture"] = "models/debug/debugwhite"
})

function ok.GetChamsColor(t, v)
	if t then
		if v then
			return 0, 0, 255 / 255
		else
			return 0, 255 / 255, 0
		end	
	else
		if v then
			return 255 / 255, 255 / 255, 0
		else
			return 255 / 255, 185 / 255, 0
		end
	end
end

function ok.Chams()
	for k,v in next, player.GetAll() do
		if !ok.vars["visuals"]["enabled"]:GetBool() or !ok.vars["visuals"]["chams"]:GetBool() or !v:IsValid() or !v:IsPlayer() or !v:Alive() or 0 >= v:Health() or v == me then continue end
		cam.Start3D()
		render.MaterialOverride(ok.chams1)
		render.SetColorModulation(ok.GetChamsColor(me:Team() == v:Team(), true))
		v:DrawModel()

		render.SetColorModulation(ok.GetChamsColor(me:Team() == v:Team(), false))
		render.MaterialOverride(ok.chams2)
		v:DrawModel()
		cam.End3D()
	end
end

function ok.CalcView(ply, pos, angle, fov, nearZ, farZ)
	local view = {}
	view.angles = (ok.vars["hvh"]["antiaim"]:GetBool() or ok.vars["aimbot"]["silent"]:GetBool()) and ok.fa or angle
	view.origin = ok.vars["thirdperson"]:GetBool() and (pos - ok.fa:Forward() * 100) or pos

	return view
end

function ok.ShouldDrawLocalPlayer()
	return ok.vars["thirdperson"]:GetBool()
end

function ok.PreDrawOpaqueRenderables()
	for k,v in next, player.GetAll() do
		ok.CheckAAA(v)
	end

	for e,a in next, ok.aaa do
		if !e or !IsValid(e) or !e:IsPlayer() then ok.aaa[e] = nil continue end
		e:SetRenderAngles(Angle(0, a.y, 0))
		e:SetPoseParameter("aim_pitch", a.p)
		e:InvalidateBoneCache()
	end
end

function ok.AAAMenu()
	local last = 0

	local frame = vgui.Create("DFrame")
	frame:SetSize(350, 300)
	frame:SetPos(0, 0)
	frame:SetTitle("AAA Menu")
	frame:Center()
	frame:MakePopup()

	local lista = vgui.Create("DListView", frame)
	lista:SetPos(0, 24)
	lista:SetSize(250, 276)
	lista:SetMultiSelect(false)
	lista:AddColumn("Players")
	lista:AddColumn("Pitch")
	lista:AddColumn("Yaw")

	local ply = 0

	lista.OnRowSelected = function(panel, line)
		ply = line
	end

	local plabel = vgui.Create("DLabel", frame)
	plabel:SetPos(255, 26)
	plabel:SetText("Pitch:")

	local ylabel = vgui.Create("DLabel", frame)
	ylabel:SetPos(255, 40)
	ylabel:SetText("Yaw:")

	local ptext = vgui.Create("DTextEntry", frame)
	ptext:SetPos(285, 30)
	ptext:SetSize(30, 14)
	ptext:SetText("89")
	ptext.OnEnter = function() end

	local ytext = vgui.Create("DTextEntry", frame)
	ytext:SetPos(285, 44)
	ytext:SetSize(30, 14)
	ytext:SetText("180")
	ytext.OnEnter = function() end

	local but = vgui.Create("DButton", frame)
	but:SetPos(255, 66)
	but:SetSize(65, 24)
	but:SetText("Set")
	
	function but.DoClick()
		if player.GetAll()[ply] then
			ok.aaa[player.GetAll()[ply]] = Angle(tonumber(ptext:GetText()), tonumber(ytext:GetText()), 0)
		end
	end

	for i = 1, #player.GetAll() do
		local e = player.GetAll()[i]
		lista:AddLine(e:Nick(), e:EyeAngles().p, e:EyeAngles().y)
	end
end

function ok.ResetConsoleVars()
	for k,v in next, ok.cvars do
		me:ConCommand(k .. " " .. v)
		ok.Log("Reset convar: ", Color(255, 120, 5), k, Color(255, 0, 0), " (value: ", v, ")")
	end
end

function ok.FindPlayerWithID(userid)
	for k,v in next, player.GetAll() do
		if v:UserID() == userid then
			return v
		end
	end

	return false
end

function ok.PlayerHurt(data)
	if !ok.vars["killspam"]:GetBool() then return end
	local health = data.health
	local id = data.userid
	local attackerid = data.attacker
	local target = ok.FindPlayerWithID(id)
	local attacker = ok.FindPlayerWithID(attackerid)
	if !target or !attacker then return end
	if attacker != NULL and target != NULL then
		if attacker == me then
			target.hits = target.hits and target.hits + 1 or 1
			if health == 0 then
				MEGA.TextToSpeech("laff easy " .. tostring(target.hits) .. " tap")
				me:ConCommand("say " .. target:Nick() .. " ez " .. tostring(target.hits) .. "tap")
				target.hits = 0
			end
		elseif target == me then
			attacker.hitsme = attacker.hitsme and attacker.hitsme + 1 or 1
			if health == 0 then
				local pingadvantage = target:Ping() - attacker:Ping()
				if pingadvantage > 50 then
					me:ConCommand("say ping advantage i have " .. tostring(pingadvantage) .. " more ping than you")
				elseif attacker.hitsme > 1 then
					me:ConCommand("say it literally took u " .. tostring(attacker.hitsme) .. " shots rofl bad cheat")
					attacker.hitsme = 0
				else
					me:ConCommand("say ouch")
				end
			end
		end
	end
end

function ok.CreateMove(cmd)
	ok.AutoHop(cmd)
	ok.Aimbot(cmd)
	ok.AntiAim(cmd)
	ok.FakeLag(cmd)
	ok.HighJump(cmd)
end

function ok.AddHook(htype, name, func)
	hook.Add(htype, name, func)
	ok.Log("Created ", Color(255, 120, 5), htype, Color(255, 190, 5), " hook: ", Color(255, 120, 5), name, Color(255, 0, 0), " (" .. tostring(func) .. ")")
end

ok.AddHook("Think", "ok.GetTarget", ok.GetTarget)
ok.AddHook("Move", "ok.GetCurTime", ok.GetCurTime)
ok.AddHook("DrawOverlay", "ok.Visuals", ok.Visuals)
ok.AddHook("RenderScreenspaceEffects", "ok.Chams", ok.Chams)
ok.AddHook("CreateMove", "ok.CreateMove", ok.CreateMove)
ok.AddHook("CalcView", "ok.CalcView", ok.CalcView)
ok.AddHook("ShouldDrawLocalPlayer", "ok.ShouldDrawLocalPlayer", ok.ShouldDrawLocalPlayer)
ok.AddHook("PreDrawOpaqueRenderables", "ok.PreDrawOpaqueRenderables", ok.PreDrawOpaqueRenderables)
gameevent.Listen("player_hurt")
ok.AddHook("player_hurt", "ok.PlayerHurt", ok.PlayerHurt)
concommand.Add("ok_aaa", ok.AAAMenu)
ok.Log("Created concommand: ", Color(255, 120, 5), "ok_aaa", Color(255, 0, 0), " (" .. tostring(ok.AAAMenu) .. ")")
concommand.Add("ok_resetcv", ok.ResetConsoleVars)
ok.Log("Created concommand: ", Color(255, 120, 5), "ok_resetcv", Color(255, 0, 0), " (" .. tostring(ok.ResetConsoleVars) .. ")")
ok.Log("Loaded!")