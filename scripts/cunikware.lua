/*
$$$$$$\  $$\   $$\ $$\   $$\ $$$$$$\ $$\   $$\ $$\      $$\  $$$$$$\  $$$$$$$\  $$$$$$$$\ 
$$  __$$\ $$ |  $$ |$$$\  $$ |\_$$  _|$$ | $$  |$$ | $\  $$ |$$  __$$\ $$  __$$\ $$  _____|
$$ /  \__|$$ |  $$ |$$$$\ $$ |  $$ |  $$ |$$  / $$ |$$$\ $$ |$$ /  $$ |$$ |  $$ |$$ |      
$$ |      $$ |  $$ |$$ $$\$$ |  $$ |  $$$$$  /  $$ $$ $$\$$ |$$$$$$$$ |$$$$$$$  |$$$$$\    
$$ |      $$ |  $$ |$$ \$$$$ |  $$ |  $$  $$<   $$$$  _$$$$ |$$  __$$ |$$  __$$< $$  __|   
$$ |  $$\ $$ |  $$ |$$ |\$$$ |  $$ |  $$ |\$$\  $$$  / \$$$ |$$ |  $$ |$$ |  $$ |$$ |      
\$$$$$$  |\$$$$$$  |$$ | \$$ |$$$$$$\ $$ | \$$\ $$  /   \$$ |$$ |  $$ |$$ |  $$ |$$$$$$$$\ 
 \______/  \______/ \__|  \__|\______|\__|  \__|\__/     \__|\__|  \__|\__|  \__|\________|
                                                                                           
                                                                                           
                                                                                           
		CUNIKWARE GMOD Cheat By cunik		
		
*/

/*
	CUNIKWARE
		Variables
*/
	local me = LocalPlayer();
	local CUNIKWARE = {};
		local servertime = 0;
		local eTickInt = engine.TickInterval();
		CUNIKWARE.Config = {};
		CUNIKWARE.Colors = {};
			CUNIKWARE.Colors.white = Color(255,255,255);
			CUNIKWARE.Colors.green = Color(0,255,0);
			CUNIKWARE.Colors.red   = Color(255,0,0);
			CUNIKWARE.Colors.blue  = Color(0,0,255);
		CUNIKWARE.F = {};
		CUNIKWARE.SpreadTables = {};
		CUNIKWARE.F["aimbot"] = {};
		CUNIKWARE.F["draw"] = {};
		CUNIKWARE.F["draw"].color = Color(253, 31, 31,250);
		CUNIKWARE.F["draw"].menuHandle = {};
		CUNIKWARE.F["aimbot"].DownOffset = Vector(0,0,-eTickInt);
		CUNIKWARE.T = {}; // Trash variable ( temp variable storage )
		CUNIKWARE.T["menu"] = {};
		CUNIKWARE.T["menu"].open = false;

/*
	CUNIKWARE
		Fresh Global Variables & Detours
*/
	local hook = hook or {};
	local player = player or {};
	local team = team or {}; 
	local surface = surface or {};
	local debug = debug or {};
	local util = util or {};
	local file = file or {};
	local render = render or {};
	local cam = cam or {};
	local http = http or {};
	local package = package or {};
	local chat = chat or {};
	local timer = timer or {};
	local string = string or {};
	local vgui = vgui or {};
	local table = table or {};
	local ents = ents or {};
	local gui = gui or {};
	local debug = debug or {};
	local math = math or {};
	local util = util or {};
	local input = input or {};
	local net = net;
	local jit = jit;
	local MsgC = MsgC;
	local engine = engine;
	local gameevent = gameevent;
	local bit = bit;
	local GAMEMODE = GAMEMODE;
	local jit = jit;
	local tostring = tostring;
	local SortedPairs = SortedPairs;
	local tonumber = tonumber;
	local IsValid = IsValid;
	local LocalPlayer = LocalPlayer;
	local rawset = rawset;
	local Lerp = Lerp;
	local RunConsoleCommand = RunConsoleCommand;
	local pairs = pairs;
	local ipairs = ipairs;
	local Angle = Angle;
	local print = print;
	local next = next; 
	local type = type;
	local MsgN = MsgN;
	local IsFirstTimePredicted = IsFirstTimePredicted;
	local Material = Material;
	local CreateMaterial = CreateMaterial;
	local Msg = Msg; 
	local GetConVar = GetConVar;
	local RunString = RunString;
	local ScrW = ScrW;
	local CurTime = CurTime;
	local ScrH = ScrH;
	local Entity = Entity;
	local pcall = pcall;
	local Format = Format;
	local Color = Color;
	local _G = _G;
	local Vector = Vector;
	local tobool = tobool;
	local FindMetaTable = FindMetaTable;
	local require = require;
	local __eq = __eq;
	local __tostring = __tostring;
	local __gc = __mul;
	local __index = __index;
	local __concat = __concat;
	local __newindex = __newindex;
	local __add = __add;
	local __sub = __sub;
	local __div  = __div;
	local __call = __call;
	local __pow = __pow;
	local __unm = __unm;
	local __lt = __lt;
	local __le = __le;
	local __mode = __mode;
	local __metatable = __metatable;
	local MOVETYPE_OBSERVER = MOVETYPE_OBSERVER;
	local TEAM_SPECTATOR = TEAM_SPECTATOR;
	local KEY_UP, KEY_DOWN, KEY_RIGHT, KEY_LEFT, KEY_INSERT, KEY_F = KEY_UP, KEY_DOWN, KEY_RIGHT, KEY_LEFT, KEY_INSERT, KEY_F;
	local MASK_SHOT, CONTENTS_WINDOW = MASK_SHOT, CONTENTS_WINDOW; 

	debug.getinfo = function()
		return { 
			what = "C",
			source = "[C]",
			source_src = "[C]",
			linedefined = -1,
			currentline = -1,
			lastlinedefined = -1,
			short_src = "[C]"
		};
	end
	local leltable = {"What u doing snooping around in here!"};
	hook.GetTable = function() return leltable; end	
	debug.traceback = function() return nil; end	
	_G.system.IsOSX = function() return false; end
	_G.system.IsWindows = function() return false; end
	_G.system.IsLinux = function() return false; end
	
	CUNIKWARE.R       = debug.getregistry();
	CUNIKWARE.CR       = table.Copy(CUNIKWARE.R);
	vAngle                    = CUNIKWARE.R.Vector.Angle
	vLength                   = CUNIKWARE.R.Vector.Length
	vLengthSqr                   = CUNIKWARE.R.Vector.LengthSqr
	vDistance                 = CUNIKWARE.R.Vector.Distance
	vToScreen                 = CUNIKWARE.R.Vector.ToScreen
	aForward                  = CUNIKWARE.R.Angle.Forward
	pShootPos              = CUNIKWARE.R.Player.GetShootPos
	pGetFriendStatus  = CUNIKWARE.R.Player.GetFriendStatus
	pGetActiveWeapon  = CUNIKWARE.R.Player.GetActiveWeapon
	pNick                     = CUNIKWARE.R.Player.Nick
	pEyePos                   = CUNIKWARE.R.Entity.EyePos
	pTeam                     = CUNIKWARE.R.Player.Team
	pInVehicle        = CUNIKWARE.R.Player.InVehicle
	pIsBot                    = CUNIKWARE.R.Player.IsBot
	pAlive                    = CUNIKWARE.R.Player.Alive
	eIsOnGround               = CUNIKWARE.R.Entity.IsOnGround
	eHealth                   = CUNIKWARE.R.Entity.Health
	eIsPlayer                 = CUNIKWARE.R.Entity.IsPlayer
	eLocalToWorld     = CUNIKWARE.R.Entity.LocalToWorld
	eGetPos                   = CUNIKWARE.R.Entity.GetPos
	eGetFriendStatus          = CUNIKWARE.R.Entity.GetFriendStatus
	eOnGround                 = CUNIKWARE.R.Entity.OnGround
	eOBBCenter                = CUNIKWARE.R.Entity.OBBCenter
	eDrawModel                = CUNIKWARE.R.Entity.DrawModel
	eWaterLevel               = CUNIKWARE.R.Entity.WaterLevel
	eGetMoveType              = CUNIKWARE.R.Entity.GetMoveType
	eGetClass                 = CUNIKWARE.R.Entity.GetClass
	eIsValid                  = CUNIKWARE.R.Entity.IsValid
	eIsDormant                  = CUNIKWARE.R.Entity.IsDormant
	eGetColor                  = CUNIKWARE.R.Entity.GetColor
	eLookupBone               = CUNIKWARE.R.Entity.LookupBone
	eGetVelocity              = CUNIKWARE.R.Entity.GetVelocity
	eGetVelocity              = CUNIKWARE.R.Entity.GetVelocity
	eGetMaxHealth     = CUNIKWARE.R.Entity.GetMaxHealth
	eSetPoseParameter = CUNIKWARE.R.Entity.SetPoseParameter
	eEyeAngles                = CUNIKWARE.R.Entity.EyeAngles
	eGetAttachment    = CUNIKWARE.R.Entity.GetAttachment
	eLookupAttachment = CUNIKWARE.R.Entity.LookupAttachment
	eGetHitBoxBone = CUNIKWARE.R.Entity.GetHitBoxBone
	eGetHitBoxBounds = CUNIKWARE.R.Entity.GetHitBoxBounds
	eGetHitBoxGroupCount = CUNIKWARE.R.Entity.GetHitBoxGroupCount
	eGetHitBoxCount = CUNIKWARE.R.Entity.GetHitBoxCount
	eGetBoneParent = CUNIKWARE.R.Entity.GetBoneParent
	eGetBoneCount = CUNIKWARE.R.Entity.GetBoneCount;
	eOBBMins                  = CUNIKWARE.R.Entity.OBBMins
	eOBBMaxs                  = CUNIKWARE.R.Entity.OBBMaxs
	eGetBonePosition          = CUNIKWARE.R.Entity.GetBonePosition
	eLookupBone          = CUNIKWARE.R.Entity.LookupBone
	eInvalidateBoneCache          = CUNIKWARE.R.Entity.InvalidateBoneCache
	wClip1                    = CUNIKWARE.R.Weapon.Clip1
	wGetNextPrimaryFire = CUNIKWARE.R.Weapon.GetNextPrimaryFire
	cGetForwardMove   = CUNIKWARE.R.CUserCmd.GetForwardMove
	cGetSideMove              = CUNIKWARE.R.CUserCmd.GetSideMove
	cGetViewAngles    = CUNIKWARE.R.CUserCmd.GetViewAngles
	cSetViewAngles    = CUNIKWARE.R.CUserCmd.SetViewAngles
	cSetForwardMove   = CUNIKWARE.R.CUserCmd.SetForwardMove
	cSetSideMove              = CUNIKWARE.R.CUserCmd.SetSideMove
	cGetMouseX                = CUNIKWARE.R.CUserCmd.GetMouseX
	cGetMouseY                = CUNIKWARE.R.CUserCmd.GetMouseY
	cGetButtons               = CUNIKWARE.R.CUserCmd.GetButtons
	cSetButtons               = CUNIKWARE.R.CUserCmd.SetButtons
	cRemoveKey                = CUNIKWARE.R.CUserCmd.RemoveKey
	cKeyDown                  = CUNIKWARE.R.CUserCmd.KeyDown
	cCommandNumber    = CUNIKWARE.R.CUserCmd.CommandNumber
	cvGetBool                 = CUNIKWARE.R.ConVar.GetBool
		
/*
	CUNIKWARE
		Configuration
*/	

	RunConsoleCommand("hud_draw_fixed_reticle","1");

	surface.CreateFont( "MenuTitle", {
	font = "Trebuchet24",
	size = 13,
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
	} )


	CUNIKWARE.Config.version = "1.0";
	CUNIKWARE.Config["Aimbot"] = {}; 
	CUNIKWARE.Config["Misc"] = {}; 
	CUNIKWARE.Config["hvh"] = {}; 
	CUNIKWARE.Config["Misc"]["ThirdPerson"] = false;
	CUNIKWARE.Config["Misc"]["Bhop"] = false;
	CUNIKWARE.Config["Misc"]["StealNames"] = false;
	CUNIKWARE.Config["Misc"]["SpeedHack"] = false;
	CUNIKWARE.Config["Misc"]["FOV"] = false;
	CUNIKWARE.Config["Misc"]["WireFrame"] = false;
	CUNIKWARE.Config["Misc"]["SpamChat"] = false;
	CUNIKWARE.Config["hvh"]["AAA"] = true;
	CUNIKWARE.Config["hvh"]["AA"] = false;
	CUNIKWARE.Config["hvh"]["AA_CHEW"] = 3;
	CUNIKWARE.Config["hvh"]["AA_TYPE"] = 2;
	CUNIKWARE.Config["hvh"]["FakeLag"] = false;
	CUNIKWARE.Config["hvh"]["FakeLagPred"] = false;
	// 180,580,1266,562,900,1657
	//CUNIKWARE.Config["hvh"]["AA_TEST_P"] = 1266;
	CUNIKWARE.Config["esp"] = {}; 
	CUNIKWARE.Config["esp"]["chams"] = false;
	CUNIKWARE.Config["esp"]["on"] = false;
	CUNIKWARE.Config["esp"]["rainbow"] = false;
	CUNIKWARE.Config["esp"]["headbox"] = false;
	CUNIKWARE.Config["esp"]["type"] = 0;
	CUNIKWARE.Config["esp"]["names"] = false;
	CUNIKWARE.Config["esp"]["Radar"] = false;
	CUNIKWARE.Config["Aimbot"]["on"] = false;
	CUNIKWARE.Config["Aimbot"]["SilentAim"] = true;
	CUNIKWARE.Config["Aimbot"]["AutoWall"] = false;
	CUNIKWARE.Config["Aimbot"]["GhostCheck"] = false;
	CUNIKWARE.Config["Aimbot"]["pSilentAim"] = false;
	CUNIKWARE.Config["Aimbot"]["useHitboxes"] = false;
	CUNIKWARE.Config["Aimbot"]["No-Spread"] = false;
	CUNIKWARE.Config["Aimbot"]["No-Recoil"] = false;
	CUNIKWARE.Config["Aimbot"]["ragemode"] = false;
	CUNIKWARE.Config["Aimbot"]["targetfriends"] = false;
	CUNIKWARE.Config["Aimbot"]["targetteam"] = false;
	CUNIKWARE.Config["Aimbot"]["onlytargetteam"] = false;
	
	me:ConCommand([[cl_interp 0.066;cl_interp_ratio 2;cl_updaterate 120]])

/*
	CUNIKWARE
		Initial Hooked/Main Functions
*/
	CUNIKWARE.R.Entity.FireBullets = function( entity, bulletInfo )
		local curWep = eGetClass(pGetActiveWeapon(me));
		local spread = bulletInfo.Spread;
		if(spread == Vector() ) then return; end
		CUNIKWARE.SpreadTables[curWep] = spread;
		CUNIKWARE.CR.Entity.FireBullets(entity,bulletInfo);
	end
	
	
	local NoSprd_CenterBullet = function(cmd,AngleToCenter)
		local curWep = eGetClass(pGetActiveWeapon(me));
		local pAngs = CUNIKWARE.SpreadTables[curWep];
		if( pAngs == nil ) then return AngleToCenter; end
		
		local ang = vAngle(DS_manipulateShot( DS_md5PseudoRandom( cCommandNumber(cmd) ), aForward(AngleToCenter), Vector(-pAngs.x,-pAngs.y,0)));
		ang.y, ang.x = math.NormalizeAngle(ang.y), math.NormalizeAngle(ang.x);
		return ang ;
		
	end
	
	local NoRcl_CenterGun = function(vec)
		if(!CUNIKWARE.Config["Aimbot"]["No-Recoil"]) then return vec; end
			return vec - me:GetPunchAngle();
	end
	

/*
	CUNIKWARE
		Initial Functions
*/
	local ifCOND = function(cond,y,n) if(cond) then return y; else return n; end end
	local wepAutomatic = function() local wep = pGetActiveWeapon(me); return wep != NULL && wep.Primary && wep.Primary.Automatic; end
	local DrawMSG = function(tf, msg) local MsgMethod = ifCOND(tf,MsgC, chat.AddText) MsgMethod(CUNIKWARE.Colors.white, "[", CUNIKWARE.Colors.green, "CUNIKWARE", CUNIKWARE.Colors.white, "]: ", msg, ifCOND(tf,"\n","")); end 
	local RequireO = function(strName) RunConsoleCommand("require", "dlls/" .. strName); end
	local ExtRequire = function(includeFile) DrawMSG(true, "Including Module \"" .. includeFile .. "\""); require(includeFile); DrawMSG(true, "Loaded Module \"" .. includeFile .. "\""); end
	local SortClosestEntity = function(k,v) return vLengthSqr(eGetPos(k) - eGetPos(me)) < vLengthSqr(eGetPos(v) - eGetPos(me)); end
	local NumberInRange = function(num,min,max)  return num <= max && num >= min; end
	local VectorConversion = function(rgb) local tbl = rgb; for k,v in next, tbl do tbl[k] = v / 255; end return tbl; end
	local RecoilFix = function() local curWep = pGetActiveWeapon(me);
        if(curWep.Primary != nil or false)then
			if curWep.Primary.Recoil then
                curWep.Primary.Recoil = 0
            end
             if curWep.Primary.KickUp then
                curWep.Primary.KickUp = 0
                curWep.Primary.KickDown = 0
               curWep.Primary.KickHorizontal = 0
            end
            end 
	end
	
	local StealNames = function()
	if(!CUNIKWARE.Config["Misc"]["StealNames"]) then return; end
		local hacker = player.GetAll()
		for k,v in next,hacker do
			if(v == me || string.find(pNick(v), pNick(me))) then table.remove(hacker,k); end
		end
		GetConVar("name"):SetValue(table.Random(hacker):Nick() .. "⁢");
	end
	
	// Closest thing u will ever see to engine pred
	local VelocityPrediction = function(ent,aimPos)
		local self_Velocity,target_Velocity = eGetVelocity(me), eGetVelocity(ent);
		self_Velocity.z,target_Velocity.z = 0; // We cant trust horizonal Prediction, its not reliable
		return aimPos - (self_Velocity * engine.TickInterval() + target_Velocity * engine.TickInterval() );
	end
	
	local fakelagBucket = {};
	local FakeLagPrediction = function(v)
		if(v == nil || !CUNIKWARE.Config["hvh"]["FakeLagPred"]) then return Vector(0,0,0); end
		if(!fakelagBucket[v]) then
			fakelagBucket[v] = {
				eGetVelocity(v),
				eGetPos(v),
				0,
			};
		end

		local oldVel = fakelagBucket[v][1];
		local oldPos = fakelagBucket[v][2];
	
		fakelagBucket[v][1] = eGetVelocity(v);
		fakelagBucket[v][2] = eGetPos(v);
	
		if(oldVel == Vector()) then 
			fakelagBucket[v][3] = 0;
			return Vector(0,0,0);
		end
	
		if(fakelagBucket[v][1] == oldVel && oldPos == fakelagBucket[v][2]) then
			fakelagBucket[v][3] = fakelagBucket[v][3] + 1;
	
			return ((oldVel * (eTickInt * fakelagBucket[v][3])));
		else
			fakelagBucket[v][3] = 0;
		end
		return Vector(0,0,0);
	end


	local aIsVisible = function(v, vec)
		local trace = util.TraceLine( {
			start = VelocityPrediction(me,pEyePos(me)),
			endpos = (VelocityPrediction(me,vec) + FakeLagPrediction(v)),
			filter = {v,me},
			mask = ifCOND(!CUNIKWARE.Config["Aimbot"]["AutoWall"], MASK_SHOT,MASK_VISIBLE)
		} );
		return trace.Entity == v || !trace.Hit || trace.Fraction == 1;
	end
	
	local GetCurTime = function()
		if(!IsFirstTimePredicted()) then return; end
		servertime = CurTime() + eTickInt;
	end

	local CanFire = function()
		local wep = pGetActiveWeapon(me)
		if(!eIsValid(wep)) then return; end
		return( servertime >= wGetNextPrimaryFire(wep) );
	end
	
	CUNIKWARE.F.ForceVar = function(Var,Val)
		GetConVar(Var):SetValue(Val);
	end
	
	local SpeedHack = function()
		if(input.IsKeyDown(KEY_B) && CUNIKWARE.Config["Misc"]["SpeedHack"]) then
				GetConVar("sv_cheats"):SetValue(1)
				GetConVar("host_timescale"):SetValue(4)
			else
				GetConVar("sv_cheats"):SetValue(0)
				GetConVar("host_timescale"):SetValue(1)			
		end
	end
	
/*
	CUNIKWARE
		JSON Save Management
*/	
	
	local JSONFileStructCheck = function()
		if(!file.Exists("CUNIKWARE_config","DATA")) then
			file.CreateDir("CUNIKWARE_config");
		end
	end
	
	local JSONLoad = function(filename)
		if(!file.Exists("CUNIKWARE_config/" .. filename .. ".txt", "DATA")) then print("Config " .. filename .. " Does not exist!"); return; end
		local JSONTbl = util.JSONToTable(file.Read("CUNIKWARE_config/" .. filename .. ".txt", "DATA"));
		
			for tblTypeN,tblType in next, JSONTbl do
				if(tblPTypeN == "version" || tblPType == "version" || tblTypeN == "version" || tblType == "version") then continue; end 
				for tblPTypeN,tblPType in next, tblType do
					print("Loading Config " .. filename .. ": " .. tblTypeN,tblPTypeN,tblPType);
					CUNIKWARE.Config[tblTypeN][tblPTypeN] = tblPType;
				end
			end	
			CUNIKWARE.F["draw"].notfication("Configuration File " .. filename .. " Loaded!",Color(44, 62, 80,180),2);
		
	end
	
	local JSONSave = function(tbl,filename)
		JSONFileStructCheck(); // Check if director exists
		print("Making...");
		local tblJSON = util.TableToJSON(tbl,true);
		file.Write("CUNIKWARE_config/" .. filename .. ".txt", tblJSON);
		CUNIKWARE.F["draw"].notfication("Configuration File " .. filename .. " Saved!",Color(44, 62, 80,180),2);
	end

/*
	CUNIKWARE
		Required Modules Include
*/
	
	ExtRequire("spreadthebutter");
	ExtRequire("cvar3");
	ExtRequire("name_enabler");
	if(PA4 == nil) then RequireO("1/gmcl_aaa_win32.dll"); end

		//	timer.Simple(0.5, function() PA4.AAAX(CUNIKWARE.Config["hvh"]["AAA"]);PA4.AAAY(CUNIKWARE.Config["hvh"]["AAA"]); end); // cancer cancer cancer
	
	
/*
	CUNIKWARE
		Mouse Correction
*/
	local SilentMouse = function(cmd,aa)
		if(!CUNIKWARE.Config["Aimbot"]["SilentAim"]) then return ms; end 
		if (!ms) then ms = cGetViewAngles(cmd) end
		ms = ms + Angle(cGetMouseY(cmd) * .023, cGetMouseX(cmd) * -.023, 0);
		ms.x = math.NormalizeAngle(ms.x);
		ms.p = math.Clamp(ms.p, -89, 89);
	end
	
	local FixMovement = function(cmd,aa)
		if(!CUNIKWARE.Config["Aimbot"]["SilentAim"]) then return; end 
		local move = Vector( cGetForwardMove(cmd), cGetSideMove(cmd), 0 );
		local angle = cGetViewAngles(cmd);
		angle.x = 0
		move = aForward(( vAngle(move) + (angle - ms) )) * move:Length();
	
		if( aa && cGetViewAngles(cmd).x > 90 || aa && cGetViewAngles(cmd).x < -90 ) then
			move.x = -move.x
		end
	
		cSetForwardMove(cmd, move.x );
		cSetSideMove(cmd, move.y );
	end	
	
/*
	CUNIKWARE
		Anti-Aims
*/	
local aaJam = 0;
local AATbl = {1,4,7,10};
local aaLoop = 1;
local aaUpFake = false;

local pPitch_y = {360,270};
	local antiAimHandle = function(cmd)
	
		local startAngle = Angle();
		
		/*
			Anti Aim Research Notes:
			
			After testing for days with different angles, I came across this angle that fakes in range angles.
			
			The angle 631 fakes the 80 range, im pretty sure it fakes 87 or 85
			
			You can mess with this angle too make it manipulate angles Such as 633 that fakes 87
			
		*/ 
		chokeAngle = false;
		aaFixAngle = true;

		
		if(CUNIKWARE.Config["hvh"]["AA_TYPE"] == 1) then
			// FAKES 85
			if(aaJam < 1) then
				startAngle.p = -180;
				startAngle.y = 0;
				startAngle.r = 0;
				aaJam = aaJam + 1;
				chokeAngle = true;
			else
				startAngle.p = 180;
				startAngle.y = 0;
				startAngle.r = 0;
				aaJam = 0;
				chokeAngle = false;
			end
		else if(CUNIKWARE.Config["hvh"]["AA_TYPE"] == 2) then
			// UN-CORRECTABLE AA
				local daYaw = math.random(-1,1);
				local syncmp =  table.Random({1,4,7,10});
			if(aaJam < CUNIKWARE.Config["hvh"]["AA_CHEW"]) then	
				startAngle.p = syncmp;			
				startAngle.y = syncmp;			
				startAngle.r = 0;
				aaJam = aaJam +1;

				if(aaJam == CUNIKWARE.Config["hvh"]["AA_CHEW"]) then
					chokeAngle = false;
				else
					chokeAngle = true;
				end
			else
				startAngle.p =	table.Random({-632,-635,-633});
				startAngle.y = daYaw + syncmp + 180;
				startAngle.r = 0;
				aaJam = 0;
				chokeAngle = true;
				aaFixAngle = false;
			end
			aaLoop = aaLoop + 1;	
		else if(CUNIKWARE.Config["hvh"]["AA_TYPE"] == 3) then
			// ANTI SPINE AA
			if(aaLoop > #AATbl) then aaLoop = 1; end			
			startAngle.p = -181;			
			startAngle.y = 360 + AATbl[aaLoop];			
			startAngle.r = 0;
			aaLoop = aaLoop + 1;	
		else if(CUNIKWARE.Config["hvh"]["AA_TYPE"] == 4) then
			// Jitter AA
			startAngle.p = -181;
			startAngle.y = ms.y + math.random(-90,90);
			startAngle.r = 0;
		else if(CUNIKWARE.Config["hvh"]["AA_TYPE"] == 5) then
			// T-JITTER AA
			startAngle.p = -181;
			startAngle.y = ms.y - -900 + math.random(-90,90);
			startAngle.r = 0;
		else if(CUNIKWARE.Config["hvh"]["AA_TYPE"] == 6) then
			startAngle.p = 180.087929;
			startAngle.y = 0;
			startAngle.r = 0;
			aaJam = 0;
 		end
		end
		end
		end
		end
		end
          
		
		//aaUpFake = !aaUpFake;
		//startAngle.p = 90.1;
		//startAngle.y = RealTime()*160%360;
		//startAngle.r = 0;
		
			
		//PA4.CHOKE_PACKETS(chokeAngle);
		cSetViewAngles(cmd,startAngle);
		FixMovement(cmd,aaFixAngle);
	end
	
/*
	CUNIKWARE
		Aimbot Functions
*/	

	local returnHitBoxedBone = function(ent,h1,h2)
		local bone = eGetBonePosition(ent, eGetHitBoxBone(ent, h1,h2));
		local mins,maxs = eGetHitBoxBounds(ent, h1,h2);
		if(bone) then return bone + (( mins + maxs ) *.5); end
	end
	
	local aimbotGetBone = function(ent)
		if(CUNIKWARE.Config["Aimbot"]["useHitboxes"]) then
			local bone = returnHitBoxedBone(ent, 0,0);
			if(bone && aIsVisible(ent, bone)) then return bone; end
		else
			 if(eLookupAttachment(ent,"eyes") != 0) then
				local bone = eGetAttachment(ent,eLookupAttachment(ent,"eyes")).Pos;
				if(aIsVisible(ent,bone)) then return bone; end
			else if(eLookupAttachment(ent,"forward") != 0) then
				local bone = eGetAttachment(ent,eLookupAttachment(ent,"forward")).Pos;
				if(aIsVisible(ent,bone)) then return bone; end
			else
				local bone = (eGetPos(ent) + eOBBCenter(ent));
				if(aIsVisible(ent,bone)) then return  bone; end
			end
			end
		end
		
		
	end
	
	local aimbotClosestPlayer = function(tf)
		if(!CUNIKWARE.Config["Aimbot"]["on"]) then return; end 
		local players = player.GetAll();
		table.sort(players,SortClosestEntity);
		
		for k,v in next,players do
			if(v == me ||  eHealth(v) < 1 || eIsDormant(v)) then continue; end
			if(pTeam(v) == TEAM_SPECTATOR) then continue; end
			if(pTeam(v) == TEAM_CONNECTING) then continue; end
			if(!CUNIKWARE.Config["Aimbot"]["targetfriends"] && pGetFriendStatus(v) == "friend") then continue; end
			if(CUNIKWARE.Config["Aimbot"]["GhostCheck"] && eGetColor(v).a != 255) then continue; end
			if (CUNIKWARE.Config["Aimbot"]["onlytargetteam"] && pTeam(v) != pTeam(me)) then continue; end
			if(!CUNIKWARE.Config["Aimbot"]["targetteam"] && !CUNIKWARE.Config["Aimbot"]["onlytargetteam"] && pTeam(me) == pTeam(v)) then continue; end
			if(aimbotGetBone(v) != nil) then return v; end; 
		end
			
		return nil;
	end
	
	local aimbotMainHook = function(cmd)
		SilentMouse(cmd);
			local ClosestPlayer = aimbotClosestPlayer(true);
			local ValidTarget = ClosestPlayer != nil;
			local cFire = CanFire();
			//PA4.CHOKE_PACKETS(false);
		if( CUNIKWARE.Config["Aimbot"]["on"] && CUNIKWARE.Config["Aimbot"]["ragemode"] && ValidTarget && cFire || CUNIKWARE.Config["Aimbot"]["on"] && !CUNIKWARE.Config["Aimbot"]["ragemode"] && ValidTarget && cFire && cKeyDown(cmd, IN_ATTACK )  ) then
				local posAim = ( VelocityPrediction(ClosestPlayer,aimbotGetBone(ClosestPlayer)) - pShootPos(me) + (FakeLagPrediction(ClosestPlayer))):Angle();
				posAim.r = 0;
				posAim = NoRcl_CenterGun(posAim);
				posAim = NoSprd_CenterBullet(cmd,posAim);
				if(CUNIKWARE.Config["Aimbot"]["ragemode"]) then
					if(input.IsKeyDown(KEY_B) && CUNIKWARE.Config["Misc"]["SpeedHack"]) then	GetConVar("sv_cheats"):SetValue(1); GetConVar("host_framerate"):SetValue(0) end
						cSetButtons(cmd, bit.bor(cGetButtons(cmd), IN_ATTACK));
				end

//if(CUNIKWARE.Config["Aimbot"]["pSilentAim"]) then PA4.CHOKE_PACKETS(true); end
				cSetViewAngles(cmd, posAim);
			else
			if(CUNIKWARE.Config["hvh"]["AA"]) then antiAimHandle(cmd); return; elseif(CUNIKWARE.Config["Aimbot"]["SilentAim"]) then cSetViewAngles(cmd,ms) end
		end
		FixMovement(cmd,false);
	end

/*
	CUNIKWARE
		Misc Functions
*/
	local says = {"Shino je MGE cheater", "Tommysaul je pasterska mrdka", "1tapped by cunik", "cunik.xyz", "tyler je skid"}
	local ChatSpam = function()
		if(!CUNIKWARE.Config["Misc"]["SpamChat"]) then return; end
		LocalPlayer():ConCommand("say CUNIKWARE " .. CUNIKWARE.Config.version .. " || " .. table.Random(says) );
	end
	
	
	local chamsmat = CreateMaterial("a", "VertexLitGeneric", {["$ignorez"] = 1,["$model"] = 1,["$basetexture"] = "models/debug/debugwhite",});
	local chamsmat2 = CreateMaterial("@", "vertexLitgeneric", {["$ignorez"] = 0, ["$model"] = 1, ["$basetexture"] = "models/debug/debugwhite",});
	local VisiblePlayers = {}
	
	local ChamsDud = function()
		if(!CUNIKWARE.Config["esp"]["chams"]) then return; end 
		for k,v in next, player.GetAll() do	
			if(eHealth(v) < 1 || v == LocalPlayer() || !eIsValid(v) || v:IsDormant()) then continue; end 
			local pColorVis = VectorConversion(Color(46, 204, 113));
			local pColor = VectorConversion(Color(243, 156, 18));
			local pColorGun = VectorConversion(Color(255,20,147));
			cam.Start3D();
				render.MaterialOverride(chamsmat);
				render.SetColorModulation(pColorVis.r,pColorVis.g,pColorVis.b);
				render.SetBlend(1);
				eDrawModel(v);
				
				if (eIsValid(pGetActiveWeapon(v))) then
					render.SetColorModulation(pColorGun.r,pColorGun.g,pColorGun.b);
					eDrawModel(pGetActiveWeapon(v));
				end
				
								
				render.SetColorModulation(pColor.r,pColor.g,pColor.b);
				render.MaterialOverride(chamsmat2);
				render.SetBlend(1);
								
				eDrawModel(v);
				
				if (eIsValid(pGetActiveWeapon(v))) then
					render.SetColorModulation(pColorGun.r,pColorGun.g,pColorGun.b);
					eDrawModel(pGetActiveWeapon(v));
				end
				render.SetColorModulation(1, 1, 1);
	
			cam.End3D();
		end
	end
	
	
	local BHOP = function(userCmd)
		if ( !me:IsTyping() && !eIsOnGround(me) && !me:IsFlagSet(FL_PARTIALGROUND) ) then
			userCmd:RemoveKey( 2 );
			if(CUNIKWARE.Config["Misc"]["Bhop"]) then
				local mouseX = cGetMouseX(userCmd);
				if ( mouseX < 0 ) then
					cSetSideMove(userCmd, -10^4 );
				elseif ( mouseX > 0 ) then
					cSetSideMove(userCmd, 10^4 );
				end
			end
		end
	end
	
	
/*
	CUNIKWARE
		Menu / Drawing
*/
	
	function DrawFilledCircle(x, y, radius, quality)
		local circle = {}
		local tmp = 0
		for i = 1, quality do
			tmp = math.rad(i * 360) / quality 
			circle[i] = {x = x + math.cos(tmp) * radius, y = y + math.sin(tmp) * radius}
		end
		surface.DrawPoly(circle)
	end

	local radarX, radarY, radarWidth, radarHeight = 50, ScrH() - 963 + 25, 215, 180 - 25
	CUNIKWARE.F["draw"].DrawBigShit = function()
		draw.WordBox(1, 15,15," CUNIKWARE v" .. CUNIKWARE.Config.version .. " ", "BudgetLabel", Color(245, 237, 15, 180), Color(255,255,255))
		// Ahack Paste inbound
		if(CUNIKWARE.Config["esp"]["Radar"]) then
			draw.RoundedBox(1,15,34,300,180,Color(52, 73, 94, 120)) // Background
			draw.RoundedBox(1,15,34,300,25,Color(52, 73, 94, 120)) // Tab Background
			draw.DrawText("Radar", "BudgetLabel", 25,40,Color(255,255,255))
			
			draw.RoundedBox(1,300 / 2 + 15   / 2, 180 / 2 + 34 / 2 + 25 ,5,5,Color(255,255,255))
		
			for k,v in next, player.GetAll() do
				if (eHealth(v) > 0) then
					local myPos = me:GetPos()
					local theirPos = v:GetPos()
					local myAngles = ifCOND(CUNIKWARE.Config["Aimbot"]["SilentAim"],ms,me:EyeAngles())
					local theirX = (radarX + (radarWidth / 2)) + ((theirPos.x - myPos.x) / 40)
					local theirY = (radarY + (radarHeight / 2)) + ((myPos.y - theirPos.y) / 40)
					
					local myRotation = myAngles.y - 90
					myRotation = math.rad(myRotation)
					theirX = theirX - (radarX + (radarWidth / 2))
					theirY = theirY - (radarY + (radarHeight / 2))
					local newX = theirX * math.cos(myRotation) - theirY * math.sin(myRotation)
					local newY = theirX * math.sin(myRotation) + theirY * math.cos(myRotation)
					newX = newX + (radarX + (radarWidth / 2))
					newY = newY + (radarY + (radarHeight / 2))
					if newX < (radarX + radarWidth) and newX > radarX and newY < (radarY + radarHeight) and newY > radarY then
						draw.RoundedBox(1,newX, newY,5,5,(pTeam(v) == pTeam(me) and Color(0,255,0) or Color(255,0,0)))
					end
				end
			end
		end
		
	end
	
	local SkeletonESP = function(v,h1,h2,colorsa)
		local origin = eGetPos(v);
				local parent = eGetBoneParent(v,eGetHitBoxBone(v,h1, h2));
				local bonepos, parentpos = eGetBonePosition(v,eGetHitBoxBone(v,h1, h2)), eGetBonePosition(v,parent);
				if(!parent || !bonepos || !parentpos || bonepos == origin) then return; end
				local bs, ps = vToScreen(bonepos), vToScreen(parentpos)
				surface.SetDrawColor(colorsa.r,colorsa.g,colorsa.b);
				local obbmin,obbmax = eGetHitBoxBounds(v,h1, h2); 	
				surface.DrawOutlinedRect(bs.x, bs.y, 10, 10);
	end
	
	local Get2DBounds = function(v)
		local eye = v:EyeAngles();
		local min,max = v:OBBMins(),v:OBBMaxs()
		local corners =
		{
			Vector(min.x,min.y,min.z),
			Vector(min.x,min.y,max.z),
			Vector(min.x,max.y,min.z),
			Vector(min.x,max.y,max.z),
			Vector(max.x,min.y,min.z),
			Vector(max.x,min.y,max.z),
			Vector(max.x,max.y,min.z),
			Vector(max.x,max.y,max.z)
		};
	
		local minx,miny,maxx,maxy = math.huge, math.huge, -math.huge, -math.huge;
	
		for _, corner in next, corners do
			local screen = v:LocalToWorld(corner):ToScreen();
			minx,miny = math.min(minx,screen.x),math.min(miny,screen.y);
			maxx,maxy = math.max(maxx,screen.x),math.max(maxy,screen.y);
		end
		return minx,miny,maxx,maxy;
	end

	// Did not make alot of this, kng.rektor helped make it
	local drawPlayer = function(v,Col)
		if (v == me || eIsDormant(v) || eHealth(v) < 1 || !CUNIKWARE.Config["esp"]["on"] ) then return; end
	
		local min, max = v:OBBMins(), v:OBBMaxs();
        local eye = v:EyeAngles();
        local textespy = -2;
        local hax = -6;
        local hay = 4;
        local wmin, wmax = v:LocalToWorld(min), v:LocalToWorld(max);
        local origin = v:GetPos();
        local x1,y1,x2,y2 = Get2DBounds(v);
        local diff = math.abs(x2 - x1);
        local diff2 = math.abs(y2 - y1);
        local color = (CUNIKWARE.Config["esp"]["rainbow"] and HSVToColor(RealTime()*160%360,1,1) or Col);
		local boxang = v:GetAngles();
		if(CUNIKWARE.Config["esp"]["type"] == 0) then
		// 2D
		  if(CUNIKWARE.Config["esp"]["names"]) then
			draw.DrawText( pNick(v) .. "\nRank: " .. v:GetUserGroup() .. "\nPing: " .. v:Ping() .. "ms\n", "BudgetLabel",
			x2 + 5,y1,
			Color(255,255,255), TEXT_ALIGN_LEFT )
		  end
		  surface.SetDrawColor(color)
          surface.DrawLine(x1,y1,x1+(diff*0.225),y1)
          surface.DrawLine(x1,y1,x1,y1+(diff2*0.225))
          surface.DrawLine(x1,y2,x1+(diff*0.225),y2)
          surface.DrawLine(x1,y2,x1,y2-(diff2*0.225))
          surface.DrawLine(x2,y1,x2-(diff*0.225),y1)
          surface.DrawLine(x2,y1,x2,y1+(diff2*0.225))
          surface.DrawLine(x2,y2,x2-(diff*0.225),y2)
          surface.DrawLine(x2,y2,x2,y2-(diff2*0.225))
		  surface.SetDrawColor(color)
          surface.DrawLine(x1+1,y1+1,x1+(diff*0.225),y1+1)
          surface.DrawLine(x1+1,y1+1,x1+1,y1+(diff2*0.225))
          surface.DrawLine(x1+1,y2-1,x1+(diff*0.225),y2-1)
          surface.DrawLine(x1+1,y2-1,x1+1,y2-(diff2*0.225))
          surface.DrawLine(x2-1,y1+1,x2-(diff*0.225),y1+1)
          surface.DrawLine(x2-1,y1+1,x2-1,y1+(diff2*0.225))
          surface.DrawLine(x2-1,y2-1,x2-(diff*0.225),y2-1)
		else if(CUNIKWARE.Config["esp"]["type"] == 1) then
		// 3D
			cam.Start3D()
			local corners =
			{
					Vector(min.x,min.y,min.z),
					Vector(min.x,min.y,max.z),
					Vector(min.x,max.y,min.z),
					Vector(min.x,max.y,max.z),
					Vector(max.x,min.y,min.z),
					Vector(max.x,min.y,max.z),
					Vector(max.x,max.y,min.z),
					Vector(max.x,max.y,max.z)
			};
			
			for __, _corner in next, corners do
					local swag = Vector(0,0,0);
					local magic = Vector(max.x*0.45, max.y*0.45, max.z*0.45);
				
					if (_corner.x == min.x) then
							swag.x = magic.x;
					else
							swag.x = -magic.x;
					end
				
					if (_corner.y == min.y) then
							swag.y = magic.y;
					else
							swag.y = -magic.y;
					end
				
					if (_corner.z == min.z) then
							swag.z = magic.z;
					else
							swag.z = -magic.z;
					end
				
					if (v:IsPlayer() || v:IsNPC()) then
							cornerx = _corner + Vector(swag.x,0,0);
							cornery = _corner + Vector(0,swag.y,0);
							cornerz = _corner + Vector(0,0,swag.z);
							_corner:Rotate(boxang);
							cornerx:Rotate(boxang);
							cornery:Rotate(boxang);
							cornerz:Rotate(boxang);
					else
							cornerx = Vector(swag.x,0,0);
							cornery = Vector(0,swag.y,0);
							cornerz = Vector(0,0,swag.z);
							cornerx = cornerx + _corner;
							cornery = cornery + _corner;
							cornerz = cornerz + _corner;
					end
					

				
					render.DrawLine(v:LocalToWorld(_corner), v:LocalToWorld(cornerx), color)
					render.DrawLine(v:LocalToWorld(_corner), v:LocalToWorld(cornery), color)
					render.DrawLine(v:LocalToWorld(_corner), v:LocalToWorld(cornerz), color)
			end
			cam.End3D()
		end
		end
end
	
	CUNIKWARE.F["draw"].drawESP = function()
		if(!CUNIKWARE.Config["esp"]["on"]) then return; end
		
		for k,v in pairs(player.GetAll()) do
			if(v == me || eHealth(v) < 1 || eIsDormant(v)) then continue; end		
			CUNIKWARE.T.PlayerTPos = eGetPos(v);
			CUNIKWARE.T.PlayerTPosEText = (CUNIKWARE.T.PlayerTPos):ToScreen();
			CUNIKWARE.T.PlayerTAngles = v:GetAngles();
			CUNIKWARE.T.PlayerTOBBMins = eOBBMins(v);
			CUNIKWARE.T.PlayerTOBBMaxs = eOBBMaxs(v);
			
		//	render.DrawBox(CUNIKWARE.T.PlayerTPos, Angle(0,CUNIKWARE.T.PlayerTAngles.y,0), CUNIKWARE.T.PlayerTOBBMins, Vector(20,CUNIKWARE.T.PlayerTOBBMaxs.y,CUNIKWARE.T.PlayerTOBBMaxs.z), ifCOND(pTeam(v) != pTeam(me), Color(255,0,0), Color(0,255,0)), false)
			//render.DrawWireframeBox(CUNIKWARE.T.PlayerTPos, Angle(0,CUNIKWARE.T.PlayerTAngles.y,0), CUNIKWARE.T.PlayerTOBBMins, Vector(20,CUNIKWARE.T.PlayerTOBBMaxs.y,CUNIKWARE.T.PlayerTOBBMaxs.z), ifCOND(pTeam(v) != pTeam(me), Color(255,0,0), Color(0,255,0)), false)
		
		end 
	
	end
	
	
	CUNIKWARE.F["draw"].notfication = function(Text, NotifType,timetodest)
		local notID = math.Round(RealTime()*120%360);
		CUNIKWARE.F["draw"].menuHandle["not" .. notID] = vgui.Create("DFrame");
		CUNIKWARE.F["draw"].menuHandle["not" .. notID]:SetPos(ScrW() / 2 - 250 ,ScrH() / 2 - 228);
		CUNIKWARE.F["draw"].menuHandle["not" .. notID]:SetSize(500,25);
		CUNIKWARE.F["draw"].menuHandle["not" .. notID]:SlideDown(0.3);
		CUNIKWARE.F["draw"].menuHandle["not" .. notID]:SetTitle("");
		CUNIKWARE.F["draw"].menuHandle["not" .. notID]:ShowCloseButton(false);
		CUNIKWARE.F["draw"].menuHandle["not" .. notID]:SetDraggable(false);
		CUNIKWARE.F["draw"].menuHandle["not" .. notID].Paint = function(s, w, h) 
		
			//draw.RoundedBox(2,0,0,w,h,NotifType)
			
			draw.RoundedBox(1,0,0,w,25,Color(40,40,40,255))
			draw.DrawText(Text, "MenuTitle", 5, 12 / 2, Color(255,255,255), TEXT_ALIGN_LEFT)
			surface.SetDrawColor( CUNIKWARE.F["draw"].color )
			surface.DrawOutlinedRect( 0, 0, w,h )
		end
		
		timer.Simple(timetodest, function()
			if(CUNIKWARE.F["draw"].menuHandle["not" .. notID]) then
				CUNIKWARE.F["draw"].menuHandle["not" .. notID]:SlideUp(0.3);
				timer.Simple(0.3, function()
					CUNIKWARE.F["draw"].menuHandle["not" .. notID]:Close();
				end)
			end
		end )
	end
	
	// Welcome Shit
	CUNIKWARE.F["draw"].notfication("CUNIKWARE " .. CUNIKWARE.Config.version .. " Successfully Loaded","!",2 )

	
	CUNIKWARE.F["draw"].CurCatMenu = "Aimbot"; 
	CUNIKWARE.F["draw"].MenuOpen = function()
			CUNIKWARE.T["menu"].open = true;
			
			
		CUNIKWARE.F["draw"].options = 
		{
		
			["Configs"] = 
			{
				{name = "Here, you can manage your configuration settings for CUNIKWARE", cType = "text"},
				{name = "Create A New Config", cType = "button", returnFunc = function() 
				
				// Configuration Shit
					Derma_StringRequest(
					"Enter Save Name",
					"Enter the Save name",
					"default",
					function( text ) 
					JSONSave(CUNIKWARE.Config,text); 
					
					if(CUNIKWARE.F["draw"].menuHandle.main) then 
						CUNIKWARE.F["draw"].menuHandle.main:Close();
					end
					CUNIKWARE.F["draw"].MenuOpen();
					
					end,
					function( text ) end)
					//JSONLoad("test");
				
				end},
				{name = "Your Saved Configuration Files:", cType = "text"},
			},
			
			["Aimbot"] = 
			{
				{name = "Aimbot Configuration Menu", cType = "text"},
				{name = "Aimbot", cType = "toggle", checked = CUNIKWARE.Config["Aimbot"]["on"], returnFunc = function(ID) CUNIKWARE.Config["Aimbot"]["on"] = ID; end},
				{name = "Rage-Mode", cType = "toggle", checked = CUNIKWARE.Config["Aimbot"]["ragemode"], returnFunc = function(ID) CUNIKWARE.Config["Aimbot"]["ragemode"] = ID; end},
				{name = "No-Spread", cType = "toggle", checked = CUNIKWARE.Config["Aimbot"]["No-Spread"], returnFunc = function(ID) CUNIKWARE.Config["Aimbot"]["No-Spread"] = ID; end},
				{name = "No-Recoil (buggy)", cType = "toggle", checked = CUNIKWARE.Config["Aimbot"]["No-Recoil"], returnFunc = function(ID) CUNIKWARE.Config["Aimbot"]["No-Recoil"] = ID; end},
				{name = "Hitbox-Based", cType = "toggle", checked = CUNIKWARE.Config["Aimbot"]["useHitboxes"], returnFunc = function(ID) CUNIKWARE.Config["Aimbot"]["useHitboxes"] = ID; end},
				{name = "Silent-Aim", cType = "toggle", checked = CUNIKWARE.Config["Aimbot"]["SilentAim"], returnFunc = function(ID) CUNIKWARE.Config["Aimbot"]["SilentAim"] = ID; end},
				{name = "pSilent-Aim", cType = "toggle", checked = CUNIKWARE.Config["Aimbot"]["pSilentAim"], returnFunc = function(ID) CUNIKWARE.Config["Aimbot"]["pSilentAim"] = ID; end},
				{name = "Target-Friends", cType = "toggle", checked = CUNIKWARE.Config["Aimbot"]["targetfriends"], returnFunc = function(ID) CUNIKWARE.Config["Aimbot"]["targetfriends"] = ID; end},
				{name = "Target-Team", cType = "toggle", checked = CUNIKWARE.Config["Aimbot"]["targetteam"], returnFunc = function(ID) CUNIKWARE.Config["Aimbot"]["targetteam"] = ID; end},
				{name = "Ghost-Check", cType = "toggle", checked = CUNIKWARE.Config["Aimbot"]["GhostCheck"], returnFunc = function(ID) CUNIKWARE.Config["Aimbot"]["GhostCheck"] = ID; end},
				{name = "Auto-Wall", cType = "toggle", checked = CUNIKWARE.Config["Aimbot"]["AutoWall"], returnFunc = function(ID) CUNIKWARE.Config["Aimbot"]["AutoWall"] = ID; end},
				{name = "Only Target-Team", cType = "toggle", checked = CUNIKWARE.Config["Aimbot"]["onlytargetteam"], returnFunc = function(ID) CUNIKWARE.Config["Aimbot"]["onlytargetteam"] = ID; end},
			},
			
			["HVH"] =
			{
				{name = "Hack VS Hack Configuration Menu", cType = "text"},
				{name = "Anti-Anti-Aim", cType = "toggle", checked = CUNIKWARE.Config["hvh"]["AAA"], returnFunc = function(ID) CUNIKWARE.Config["hvh"]["AAA"] = ID; PA4.AAAX(CUNIKWARE.Config["hvh"]["AAA"]);PA4.AAAY(CUNIKWARE.Config["hvh"]["AAA"]); end},
				{name = "Fake-Lag", cType = "toggle", checked = CUNIKWARE.Config["hvh"]["FakeLag"], returnFunc = function(ID) CUNIKWARE.Config["hvh"]["FakeLag"] = ID; PA4.FAKELAG(CUNIKWARE.Config["hvh"]["FakeLag"]); end},
				{name = "Fake-Lag Prediction", cType = "toggle", checked = CUNIKWARE.Config["hvh"]["FakeLagPred"], returnFunc = function(ID) CUNIKWARE.Config["hvh"]["FakeLagPred"] = ID; PA4.FAKELAG(CUNIKWARE.Config["hvh"]["FakeLag"]); end},
				{name = "Anti-Aim", cType = "toggle", checked = CUNIKWARE.Config["hvh"]["AA"], returnFunc = function(ID) CUNIKWARE.Config["hvh"]["AA"] = ID; end},
				{name = "Anti-Aim Type", cType = "text"},
				{name = "Anti-Aim Type", cType = "slider", dvalue = CUNIKWARE.Config["hvh"]["AA_TYPE"], min = 1, max = 6, returnFunc = function(ID) CUNIKWARE.Config["hvh"]["AA_TYPE"] = ID end},
				{name = "", cType = "text"},
				{name = "Used too fake angles", cType = "text"},
				{name = "Anti-Aim Chew", cType = "slider", dvalue = CUNIKWARE.Config["hvh"]["AA_CHEW"], min = 1, max = 3, returnFunc = function(ID) CUNIKWARE.Config["hvh"]["AA_CHEW"] = ID end},
				{name = "", cType = "text"},
				//{name = "Anti-Aim Pitch", cType = "slider", dvalue = CUNIKWARE.Config["hvh"]["AA_TEST_P"], min = 1, max = 1800, returnFunc = function(ID) CUNIKWARE.Config["hvh"]["AA_TEST_P"] = ID end},
			},
			
			["Visuals"] = 
			{
				{name = "Visual Configuration Menu", cType = "text"},
				{name = "Radar", cType = "toggle", checked = CUNIKWARE.Config["esp"]["Radar"], returnFunc = function(ID) CUNIKWARE.Config["esp"]["Radar"] = ID; end},
				{name = "Player Chams", cType = "toggle", checked = CUNIKWARE.Config["esp"]["chams"], returnFunc = function(ID) CUNIKWARE.Config["esp"]["chams"] = ID; end},
				{name = "Player ESP", cType = "toggle", checked = CUNIKWARE.Config["esp"]["on"], returnFunc = function(ID) CUNIKWARE.Config["esp"]["on"] = ID; end},
				{name = "Player ESP Rainbow", cType = "toggle", checked = CUNIKWARE.Config["esp"]["rainbow"], returnFunc = function(ID) CUNIKWARE.Config["esp"]["rainbow"] = ID; end},
				{name = "Player ESP Type", cType = "text"},
				{name = "Player ESP Type", cType = "slider", dvalue = CUNIKWARE.Config["esp"]["type"], min = 0, max = 1, returnFunc = function(ID) CUNIKWARE.Config["esp"]["type"] = ID end},
				{name = "", cType = "text"},
				{name = "Player Head Box", cType = "toggle", checked = CUNIKWARE.Config["esp"]["headbox"], returnFunc = function(ID) CUNIKWARE.Config["esp"]["headbox"] = ID; end},
				{name = "Player ESP Names", cType = "toggle", checked = CUNIKWARE.Config["esp"]["names"], returnFunc = function(ID) CUNIKWARE.Config["esp"]["names"] = ID; end},
				{name = "Wire-Frame guns", cType = "toggle", checked = CUNIKWARE.Config["Misc"]["WireFrame"], returnFunc = function(ID) CUNIKWARE.Config["Misc"]["WireFrame"] = ID; end},
				{name = "Custom FOV", cType = "toggle", checked = CUNIKWARE.Config["Misc"]["FOV"], returnFunc = function(ID) CUNIKWARE.Config["Misc"]["FOV"] = ID; end},
				{name = "Third Person", cType = "toggle", checked = CUNIKWARE.Config["Misc"]["ThirdPerson"], returnFunc = function(ID) CUNIKWARE.Config["Misc"]["ThirdPerson"] = ID; end},
			},
			
			["Misc"] = 
			{
				{name = "Misc Configuration Menu", cType = "text"},
				{name = "Auto Strafe", cType = "toggle", checked = CUNIKWARE.Config["Misc"]["Bhop"], returnFunc = function(ID) CUNIKWARE.Config["Misc"]["Bhop"] = ID; end},
				{name = "Cocaine", cType = "toggle", checked = CUNIKWARE.Config["Misc"]["SpeedHack"], returnFunc = function(ID) CUNIKWARE.Config["Misc"]["SpeedHack"] = ID; end},
				{name = "Steal Names", cType = "toggle", checked = CUNIKWARE.Config["Misc"]["StealNames"], returnFunc = function(ID) CUNIKWARE.Config["Misc"]["StealNames"] = ID; end},
				{name = "ChatSpam", cType = "toggle", checked = CUNIKWARE.Config["Misc"]["SpamChat"], returnFunc = function(ID) CUNIKWARE.Config["Misc"]["SpamChat"] = ID; end},
			},
			
		}
		
		
		local saveFiles,thisvalueisbad = file.Find( "CUNIKWARE_config/*", "DATA" );
		for optN,GetCurConfig in next, saveFiles do
			local stringFileName = string.Replace(saveFiles[optN], ".txt","");
			CUNIKWARE.F["draw"].options["Configs"][#CUNIKWARE.F["draw"].options["Configs"] + 1] = {
			name = stringFileName,
			cType = "button",
			returnFunc = function() 
				JSONLoad(stringFileName);
				
				if(CUNIKWARE.F["draw"].menuHandle.main) then 
					CUNIKWARE.F["draw"].menuHandle.main:Close();
				end
				CUNIKWARE.F["draw"].MenuOpen();
			end}
			
			//table.Add(CUNIKWARE.F["draw"].options["Config Settings"], tblToInsert);
		end
			
			CUNIKWARE.F["draw"].menuHandle.main = vgui.Create("DFrame");
			CUNIKWARE.F["draw"].menuHandle.main:SetPos(ScrW() / 2 - 250 ,ScrH() / 2 - 200);
			CUNIKWARE.F["draw"].menuHandle.main:SetSize(500,400);
			CUNIKWARE.F["draw"].menuHandle.main:SlideDown(0.3);
			CUNIKWARE.F["draw"].menuHandle.main:SetTitle("");
			CUNIKWARE.F["draw"].menuHandle.main:ShowCloseButton(false);
			CUNIKWARE.F["draw"].menuHandle.main:SetDraggable(false);
			CUNIKWARE.F["draw"].menuHandle.main:MakePopup();
			CUNIKWARE.F["draw"].menuHandle.main.Paint = function(s, w, h) 
				draw.RoundedBox(2,0,0,w,h,Color(44, 62, 80,180))
				draw.DrawText("CUNIKWARE VERSION " .. CUNIKWARE.Config.version .. ", Tommysaul je pasterská mrdka" , "MenuTitle", 
				w - RealTime()*125%1200, h - 20, Color(255,255,255), TEXT_ALIGN_LEFT)
				draw.RoundedBox(2,0,0,w,25,CUNIKWARE.F["draw"].color)
				draw.DrawText("CUNIKWARE VERSION " .. CUNIKWARE.Config.version, "MenuTitle", 5, 12 / 2, Color(255,255,255), TEXT_ALIGN_LEFT)
				surface.SetDrawColor( CUNIKWARE.F["draw"].color )
				surface.DrawOutlinedRect( 0, 0, w,h )
			end
			
			timer.Simple(0.31, function()
			
			CUNIKWARE.F["draw"].menuHandle.closeButton = vgui.Create("DButton",CUNIKWARE.F["draw"].menuHandle.main);
			CUNIKWARE.F["draw"].menuHandle.closeButton:SetPos(CUNIKWARE.F["draw"].menuHandle.main:GetWide() - 45,0);
			CUNIKWARE.F["draw"].menuHandle.closeButton:SetSize(45,25);
			CUNIKWARE.F["draw"].menuHandle.closeButton:SlideDown(0.3);
			CUNIKWARE.F["draw"].menuHandle.closeButton:SetText("X");
			CUNIKWARE.F["draw"].menuHandle.closeButton.DoClick = function() CUNIKWARE.F["draw"].menuHandle.main:SizeTo(CUNIKWARE.F["draw"].menuHandle.main:GetWide(),0,.3,0,.3); timer.Simple(0.3,function() CUNIKWARE.F["draw"].menuHandle.main:Close(); CUNIKWARE.T["menu"].open = false; end) end
			CUNIKWARE.F["draw"].menuHandle.closeButton.Paint = function(s, w, h) 
				if(CUNIKWARE.F["draw"].menuHandle.closeButton:IsHovered()) then
					draw.RoundedBox(1,0,0,w -1 ,h,Color(231, 76, 60,255))
				else
					draw.RoundedBox(1,0,0,w - 1 ,h,Color(255, 76, 60,220))
				end
			end
			
				CUNIKWARE.T.CatPos = {5,30}
				CUNIKWARE.T.Pos = {90,30}
				for k,l in pairs(CUNIKWARE.F["draw"].options) do
						CUNIKWARE.F["draw"].menuHandle[k .. "cat"] = vgui.Create("DButton",CUNIKWARE.F["draw"].menuHandle.main);
						CUNIKWARE.F["draw"].menuHandle[k .. "cat"]:SetPos(CUNIKWARE.T.CatPos[1],CUNIKWARE.T.CatPos[2]);
						CUNIKWARE.F["draw"].menuHandle[k .. "cat"]:SetSize(75,30);
						CUNIKWARE.F["draw"].menuHandle[k .. "cat"]:SlideDown(0.3);
						CUNIKWARE.F["draw"].menuHandle[k .. "cat"]:SetColor(Color(255,255,255));
						CUNIKWARE.F["draw"].menuHandle[k .. "cat"]:SetText(k);
						CUNIKWARE.F["draw"].menuHandle[k .. "cat"].DoClick = function()
							CUNIKWARE.F["draw"].CurCatMenu = k;
							if(CUNIKWARE.F["draw"].menuHandle.main) then 
								CUNIKWARE.F["draw"].menuHandle.main:Close();
							end
							CUNIKWARE.F["draw"].MenuOpen();
							
						end
						CUNIKWARE.F["draw"].menuHandle[k .. "cat"].Paint = function(s, w, h) 
							draw.RoundedBox(1,0,0,w,h,CUNIKWARE.F["draw"].color)
							if(k == CUNIKWARE.F["draw"].CurCatMenu) then
								draw.RoundedBox(1,0,0,w,h *.15,Color(CUNIKWARE.F["draw"].color.r + 10, CUNIKWARE.F["draw"].color.g + 10, CUNIKWARE.F["draw"].color.b + 10));
							end
						end
						CUNIKWARE.T.CatPos[2] = CUNIKWARE.T.CatPos[2] + 35;
				end
				
					for m,v in pairs(CUNIKWARE.F["draw"].options[CUNIKWARE.F["draw"].CurCatMenu]) do
						if(v.cType == "toggle") then
							CUNIKWARE.F["draw"].menuHandle[v.name .. "c"] = vgui.Create("DButton",CUNIKWARE.F["draw"].menuHandle.main);
							CUNIKWARE.F["draw"].menuHandle[v.name .. "c"]:SetPos(CUNIKWARE.T.Pos[1],CUNIKWARE.T.Pos[2]);
							CUNIKWARE.F["draw"].menuHandle[v.name .. "c"]:SetSize(20,20);
							CUNIKWARE.F["draw"].menuHandle[v.name .. "c"]:SlideDown(0.3);
							CUNIKWARE.F["draw"].menuHandle[v.name .. "c"]:SetText("");
							CUNIKWARE.F["draw"].menuHandle[v.name .. "c"].DoClick = function() 
								CUNIKWARE.F["draw"].options[CUNIKWARE.F["draw"].CurCatMenu][m].checked = !CUNIKWARE.F["draw"].options[CUNIKWARE.F["draw"].CurCatMenu][m].checked;
								CUNIKWARE.F["draw"].options[CUNIKWARE.F["draw"].CurCatMenu][m].returnFunc(CUNIKWARE.F["draw"].options[CUNIKWARE.F["draw"].CurCatMenu][m].checked);
								CUNIKWARE.F["draw"].notfication(v.name .. " Toggled: " .. tostring(CUNIKWARE.F["draw"].options[CUNIKWARE.F["draw"].CurCatMenu][m].checked) ,Color(44, 62, 80,180),2);
								CUNIKWARE.F["draw"].menuHandle[v.name .. "c"]:SetAlpha(0);
								CUNIKWARE.F["draw"].menuHandle[v.name .. "c"]:AlphaTo(255,.3);
							end
							CUNIKWARE.F["draw"].menuHandle[v.name .. "c"].Paint = function(s, w, h) 
								if(!v.checked) then 
									draw.RoundedBox(1,0,0,w,h,Color(40,40,40,255))
								else
									draw.RoundedBox(1,0,0,w,h,CUNIKWARE.F["draw"].color)
									draw.RoundedBox(1,0,0,w,h *.25,Color(CUNIKWARE.F["draw"].color.r + 10, CUNIKWARE.F["draw"].color.g + 10, CUNIKWARE.F["draw"].color.b + 10));
								end
								
								surface.SetDrawColor( ifCOND(!v.checked, CUNIKWARE.F["draw"].color, Color(40,40,40)) )
								surface.DrawOutlinedRect( 0, 0, w,h )
								
								//draw.DrawText("Test", "BudgetLabel", CUNIKWARE.T.Pos[1] + 30,CUNIKWARE.T.Pos[2])
							end
							
							CUNIKWARE.F["draw"].menuHandle[v.name] = vgui.Create("DLabel",CUNIKWARE.F["draw"].menuHandle.main);
							CUNIKWARE.F["draw"].menuHandle[v.name]:SetPos(CUNIKWARE.T.Pos[1] + 25,CUNIKWARE.T.Pos[2] + 2.5);
							CUNIKWARE.F["draw"].menuHandle[v.name]:SetText(v.name);
							CUNIKWARE.F["draw"].menuHandle[v.name]:SetAlpha(0);
							CUNIKWARE.F["draw"].menuHandle[v.name]:AlphaTo(255,.3);
							CUNIKWARE.F["draw"].menuHandle[v.name]:SizeToContents();
							CUNIKWARE.F["draw"].menuHandle[v.name]:SlideDown(0.3);
							
						if(CUNIKWARE.T.Pos[2] > 350) then
							CUNIKWARE.T.Pos[1] = CUNIKWARE.T.Pos[1] + 140;
							CUNIKWARE.T.Pos[2] = 30;
						else
							CUNIKWARE.T.Pos[2] = CUNIKWARE.T.Pos[2] + 25;
						end
							
						else if(v.cType == "text") then
						
							CUNIKWARE.F["draw"].menuHandle[v.name .. "_text"] = vgui.Create("DLabel",CUNIKWARE.F["draw"].menuHandle.main);
							CUNIKWARE.F["draw"].menuHandle[v.name .. "_text"]:SetPos(CUNIKWARE.T.Pos[1],CUNIKWARE.T.Pos[2]);
							CUNIKWARE.F["draw"].menuHandle[v.name .. "_text"]:SetText(v.name);
							CUNIKWARE.F["draw"].menuHandle[v.name .. "_text"]:SetAlpha(0);
							CUNIKWARE.F["draw"].menuHandle[v.name .. "_text"]:AlphaTo(255,.3);
							CUNIKWARE.F["draw"].menuHandle[v.name .. "_text"]:SizeToContents();
							CUNIKWARE.F["draw"].menuHandle[v.name .. "_text"]:SlideDown(0.3);
						
						if(CUNIKWARE.T.Pos[2] > 350) then
							CUNIKWARE.T.Pos[1] = CUNIKWARE.T.Pos[1] + 140;
							CUNIKWARE.T.Pos[2] = 30;
						else
							CUNIKWARE.T.Pos[2] = CUNIKWARE.T.Pos[2] + 20; 
						end
						
						else if(v.cType == "slider") then
						
						CUNIKWARE.F["draw"].menuHandle[v.name .. "_slider"] = vgui.Create( "DNumSlider",CUNIKWARE.F["draw"].menuHandle.main )
						CUNIKWARE.F["draw"].menuHandle[v.name .. "_slider"]:SetPos( CUNIKWARE.T.Pos[1] - 52,CUNIKWARE.T.Pos[2] - 5 )
						CUNIKWARE.F["draw"].menuHandle[v.name .. "_slider"]:SetWide( 150 )
						CUNIKWARE.F["draw"].menuHandle[v.name .. "_slider"]:SetMin( v.min )
						CUNIKWARE.F["draw"].menuHandle[v.name .. "_slider"]:SetMax( v.max )
						CUNIKWARE.F["draw"].menuHandle[v.name .. "_slider"]:SetValue( v.dvalue )
						CUNIKWARE.F["draw"].menuHandle[v.name .. "_slider"]:SetDecimals( 0 )
						CUNIKWARE.F["draw"].menuHandle[v.name .. "_slider"].OnValueChanged = function(p,va)
							v.returnFunc(math.Round(va));
						end
	
						
						if(CUNIKWARE.T.Pos[2] > 350) then
							CUNIKWARE.T.Pos[1] = CUNIKWARE.T.Pos[1] + 140;
							CUNIKWARE.T.Pos[2] = 30;
						else
							CUNIKWARE.T.Pos[2] = CUNIKWARE.T.Pos[2] + 15; 
						end					
						else if(v.cType == "button") then
						
						CUNIKWARE.F["draw"].menuHandle[v.name .. "_button"] = vgui.Create( "DButton",CUNIKWARE.F["draw"].menuHandle.main )
						CUNIKWARE.F["draw"].menuHandle[v.name .. "_button"]:SetText(v.name);
						CUNIKWARE.F["draw"].menuHandle[v.name .. "_button"]:SetPos( CUNIKWARE.T.Pos[1],CUNIKWARE.T.Pos[2] )
						CUNIKWARE.F["draw"].menuHandle[v.name .. "_button"]:SetSize( 125,25 )
						CUNIKWARE.F["draw"].menuHandle[v.name .. "_button"].DoClick = function()
							CUNIKWARE.F["draw"].menuHandle[v.name .. "_button"]:SetAlpha(0);
							CUNIKWARE.F["draw"].menuHandle[v.name .. "_button"]:AlphaTo(255,.3);
							v.returnFunc();
						end
						
						CUNIKWARE.F["draw"].menuHandle[v.name .. "_button"].Paint = function(s, w, h) 
								if(!v.checked) then 
									draw.RoundedBox(1,0,0,w,h,Color(40,40,40,255))
								else
									draw.RoundedBox(1,0,0,w,h,CUNIKWARE.F["draw"].color)
									draw.RoundedBox(1,0,0,w,h *.25,Color(CUNIKWARE.F["draw"].color.r + 10, CUNIKWARE.F["draw"].color.g + 10, CUNIKWARE.F["draw"].color.b + 10));
								end
								
								surface.SetDrawColor( ifCOND(!v.checked, CUNIKWARE.F["draw"].color, Color(40,40,40)) )
								surface.DrawOutlinedRect( 0, 0, w,h )
								
								//draw.DrawText("Test", "BudgetLabel", CUNIKWARE.T.Pos[1] + 30,CUNIKWARE.T.Pos[2])
							end
	
						
						if(CUNIKWARE.T.Pos[2] > 325) then
							CUNIKWARE.T.Pos[1] = CUNIKWARE.T.Pos[1] + 140;
							CUNIKWARE.T.Pos[2] = 50;
						else
							CUNIKWARE.T.Pos[2] = CUNIKWARE.T.Pos[2] + 30; 
						end					
						
						end
						end
						end
						end
					
						
						
					end
			
			end)
			
		end

/*
	CUNIKWARE
		Hijack Hooks
*/	
	oCreateMove = oCreateMove or GAMEMODE.CreateMove;
	function GAMEMODE:CreateMove(cmd)
		//eTickInt = engine.TickInterval() * (math.max(GetConVar("cl_interp"):GetFloat(), GetConVar("cl_interp_ratio"):GetFloat() / GetConVar("cl_interp_ratio"):GetFloat()));
		BHOP(cmd);
		aimbotMainHook(cmd);
		SpeedHack();
		RecoilFix();
		StealNames();
		ChatSpam();
		oCreateMove(cmd);
	end
	
	oThink = oThink or GAMEMODE.Think;
	GAMEMODE["Think"] = function()
		if(input.IsKeyDown(KEY_INSERT) && !CUNIKWARE.T["menu"].open) then
			CUNIKWARE.F["draw"].MenuOpen();
		end
		oThink();
	end
	
	hook.Add("CalcView", "Calc_CUNIKWAREView", function(me,origin,angles)
		glob_origin = origin;
        local view = {}
		view.angles = ifCOND(CUNIKWARE.Config["Aimbot"]["SilentAim"],ms,angles);
        view.vm_angles = ifCOND(CUNIKWARE.Config["Aimbot"]["SilentAim"],ms,angles);
		view.origin = ifCOND(CUNIKWARE.Config["Misc"]["ThirdPerson"],origin-( aForward(ms)*125 ),origin);
		view.fov = 100;
        return view;
	end)
	local wireframeMat = Material("models/wireframe");
	GAMEMODE["PreDrawViewModel"] = function() if(!CUNIKWARE.Config["Misc"]["WireFrame"]) then return; end render.MaterialOverride(wireframeMat); render.SetColorModulation(0, 0, 0); end
	GAMEMODE["Move"] =	GetCurTime;
	GAMEMODE["RenderScreenspaceEffects"] = ChamsDud;
	GAMEMODE["ShouldDrawLocalPlayer"] = function() return CUNIKWARE.Config["Misc"]["ThirdPerson"]; end
	GAMEMODE["GetViewModelPosition"] = function(pos,ang) return glob_origin, ifCOND(CUNIKWARE.Config["Aimbot"]["SilentAim"],ms,angles); end	
	GAMEMODE["CalcViewModelView"] = function(wep, vm, oldPos, oldAng, pos, ang) return glob_origin, ifCOND(CUNIKWARE.Config["Aimbot"]["SilentAim"],ms,angles); end	
	
	
	oHudPaint = oHudPaint or GAMEMODE.HUDPaint;
	GAMEMODE["HUDPaint"] = function(self)
		CUNIKWARE.F["draw"].DrawBigShit();
		for k,v in next, player.GetAll() do
			drawPlayer(v,(pTeam(v) == pTeam(me) and Color(0,255,0) or Color(255,0,0)));
		end
		//if(eHealth(me) < 1) then PA4.CHOKE_PACKETS(false); end
		//ChamsGun();
		oHudPaint(self);
	end