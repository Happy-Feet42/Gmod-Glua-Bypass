-- if u r reading this u r gey :3
-- any code down below contains serious technical debt and AIDS


local pacdump = {}
local _G = _G
local vgui = _G.vgui
local timer = _G.timer
local debug = _G.debug
local pcall = _G.pcall


-- Tables

pacdump.dumpergui = {}
pacdump.dobjCache = {}
pacdump.filename = {
	norep = "backup_noreplace.txt",
	rep = "dump.txt",
	llinks = "lookup_links.dat"
}

-- change this to rename the dumper opener command
pacdump.ccmd = "opengui"
pacdump.playerlist = {}

-- Consts

pacdump.bgc = Color(115, 115, 115)
pacdump.fgc = Color(211, 211, 211)

-- Functions
local NERROR = 0
local function ERROR_NONAME()
	NERROR = NERROR + 1
	return "ERR_NONAME_"..tostring(NERROR)
end

local function traverse(tTarget, fCallback, bRecursive)
	if not tTarget or not fCallback then return end
	
	for k,v in pairs(tTarget) do
		if bRecursive and type(v) == "table" then traverse(v, fCallback, true) end
		fCallback(v,k,tTarget)
	end
end

function pacdump:Log(nIcon, sText)
	if not pacdump.dumpergui.cb_showstatus:GetChecked() then return end
	
	pacdump.dumpergui.sbar.text = sText
	pacdump.dumpergui.sbar.icon = nIcon
end

function pacdump:StripColortags(sNickname)
	sNickname = string.gsub(sNickname, "(%^%d%d*)", "") -- ^xx colorcodes
	sNickname = string.gsub(sNickname, "(<.->)", "") -- HTML markup
	
	return sNickname
end

function pacdump:UndecorateNickname(sNickname)
	sNickname = pacdump:StripColortags(sNickname)
	sNickname = string.gsub(sNickname, "([^%w%s]*)","")
	sNickname = string.gsub(sNickname, "(^%s)", "")
	sNickname = string.gsub(sNickname, "(%s)", "_") -- spacers. fuck gmod. 'unsafe'
	
	return string.len(sNickname) > 0 and sNickname or "INVALIDNAME"
end

function pacdump:NormalisePartName(sName)
	local sPartname = sName
	
	sPartname = string.gsub(sPartname,"(%d%d%d%d%d+[ ]*)","")
	--sPartname = string.gsub(sPartname,"(%%%%%d+)","")
	sPartname = string.gsub(sPartname,"[^%w]","_")
	
	return string.len(sPartname) > 0 and sPartname or "NAMETOOSHORT"
end

function pacdump:TrimTrailingJunk(sTarget)
	if sTarget == nil then return "NILLSTRING" end
	local sTarget = string.match(sTarget,"^[%s_]*(.-)[%s_]*$")
	
	return sTarget or "NAMETOOSHORT"
end

function pacdump:FixDLink(sTarget)
	local sTarget = string.gsub(sTarget, "(%s*).-(%s*)", "")
	
	sTarget = string.gsub(sTarget, "", "")
	
	sTarget = string.gsub(sTarget, "^(mdl)", "")
	
	if string.find(sTarget, "dropbox") then
		sTarget = sTarget:gsub([[^http%://dl%.dropboxusercontent%.com/]], [[https://dl.dropboxusercontent.com/]])
		sTarget = sTarget:gsub([[^https?://dl.dropbox.com/]], [[https://www.dropbox.com/]])
		sTarget = sTarget:gsub([[^https?://www.dropbox.com/s/(.+)%?dl%=[01]$]], [[https://dl.dropboxusercontent.com/s/%1]])
		sTarget = sTarget:gsub([[^https?://www.dropbox.com/s/(.+)$]], [[https://dl.dropboxusercontent.com/s/%1]])
	end

	sTarget = sTarget:gsub([[^http%://onedrive%.live%.com/redir?]],[[https://onedrive.live.com/download?]])
	sTarget = sTarget:gsub( "pastebin.com/([a-zA-Z0-9]*)$", "pastebin.com/raw.php?i=%1")
	sTarget = sTarget:gsub( "github.com/([a-zA-Z0-9_]+)/([a-zA-Z0-9_]+)/blob/", "github.com/%1/%2/raw/")
		
	return sTarget
end

local getupvalues=function(f)
	local i,t=0,{}
	while true do
		i=i+1
		local key,val=debug.getupvalue(f,i)
		if not key then break end
		t[key]=val
	end
	return t
end

local function PartToTable(self, make_copy_name)
		local tbl = {self = {ClassName = self.ClassName}, children = {}}

		for _, key in pairs(self:GetStorableVars()) do
			local var = self[key] and self["Get" .. key](self) or self[key]
			var = pac.class.Copy(var) or var

			if make_copy_name and var ~= "" and (key == "UniqueID" or key:sub(-3) == "UID") then
				var = util.CRC(var .. var)
			end

			if key == "Name" and self[key] == "" then
				var = ""
			end

			-- these arent needed because parent system uses the tree structure
			if
				key ~= "ParentUID" and
				key ~= "ParentName" and
				var ~= self.DefaultVars[key]
			then
				tbl.self[key] = var
			end
		end

		for _, part in ipairs(self:GetChildren()) do
			table.insert(tbl.children, PartToTable(part, make_copy_name))
		end

		return tbl
end

function pacdump:ProcessDL()
	local mutex = -1
	
	traverse(pacdump.dobjCache, function(dlobj)
		if dlobj.status == 0 then
			http.Fetch(dlobj.url, function(body)
				if !file.Exists(dlobj.refpath, "DATA") then file.Open(dlobj.refpath, "wb", "DATA"):Close() end
				file.Append(dlobj.refpath, dlobj.id.."\t"..dlobj.url.."\t"..dlobj.name.."\n")
				
				local df = file.Open(dlobj.path,"wb","DATA")
				df:Write(body)
				df:Close()
					
				dlobj.status = 2
				pacdump:ProcessDL()
				
				pacdump:Log(2,"Object ripped: "..dlobj.name)
				
				timer.Stop("pacdump_awaiting")
				timer.Start("pacdump_awaiting")
			end)
			
			dlobj.status = 1
		end
		
		-- If i saved everything then i gtg remove table (mutex untouched)
		mutex = (dlobj.status == 0 or dlobj.status == 1) and 1 or 0
	end)
	
	if mutex == 0 then table.Empty(pacdump.dobjCache) end
end

function pacdump:DumpPlayer(ePlayer)
	if !IsValid(ePlayer) or !ePlayer.IsPlayer or !ePlayer:IsPlayer() then return end
	
	local sFilename = pacdump.filename.rep
	local sNickname = pacdump:UndecorateNickname(ePlayer:Nick())
	local ptOutfitData = {}
	
	local bDumpEmpty = pacdump.dumpergui.cb_dumpempty:GetChecked()
	local bNullifyCRC = pacdump.dumpergui.cb_stripcrc:GetChecked()
	local bRipLinks = pacdump.dumpergui.cb_riplinks:GetChecked()
	local bDoBackup = pacdump.dumpergui.cb_ripbackup:GetChecked()
	local bGroupByPlayer = pacdump.dumpergui.cb_groupuser:GetChecked()
	local tPlayerParts = {}
	
	-- This wasnt neccessary before, kudos to CapsAdmin for fucking up his own working code!
	
	if rawget(pac,"ActiveParts") then
		tPlayerParts = pac.ActiveParts
	else
		tPlayerParts = getupvalues(pac.HookEntityRender).ent_parts[ePlayer]
	end
	
	if not tPlayerParts then pacdump:Log(3,"No table data found on the choosen player"); return end
	
	
	traverse(tPlayerParts,function(pTarget)
		if pTarget.ClassName == "group" and pTarget.PlayerOwner == ePlayer and pTarget.Parent.ClassName == "NULL" then
			local pPiece = PartToTable(pTarget)
			
			if bDumpEmpty or pPiece and table.Count(pPiece.children) > 0 then
				table.insert(ptOutfitData, 0, pPiece)
			end
		end
	end, false)

	if !ptOutfitData or table.Count(ptOutfitData) < 1 then 
		pacdump:Log(3,"No table data found or player invalid")
		return
	end
	
	pacdump:Log(2,"Got outfit of player \""..sNickname)
	
	local sSaveDir = pacdump.dumpergui.eb_dumpdir:GetText()..(bGroupByPlayer and sNickname.."/" or "")
	local files, directories = file.Find(sSaveDir.."*", "DATA")
	local fileN = #directories
	local savePath = sSaveDir..fileN.."/"..sFilename
	local backupPath = sSaveDir..fileN.."/"..pacdump.filename.norep
	
	file.CreateDir(sSaveDir)
	file.CreateDir(sSaveDir..fileN.."/")
	if bRipLinks then file.CreateDir(sSaveDir..fileN.."/objects/") end
	
	if bDoBackup then
		pace.luadata.WriteFile(backupPath,ptOutfitData)
	end
	
	if bNullifyCRC then
		traverse(ptOutfitData, function(sTarget, sName, tReference)
			if type(sTarget) == "string" and string.find(sTarget, "(%d%d%d%d%d+)") and !string.find(sTarget, "(%a)(://)") and !string.find(sName, "ID") and !string.find(sName, "Data") then
				tReference[sName] = pacdump:NormalisePartName(sTarget)
			end
		end, true)
	end
	
	if bRipLinks then
		local nFileName = 0
		local tLinks = {}
		
		traverse(ptOutfitData, function(sTarget)
			if type(sTarget) == "string" and string.find(sTarget, "(%a)(://)") then
			
				local tFilesList = string.Split(sTarget, ";")
				
				for k,sFileTarget in pairs(tFilesList) do
					local sFileTarget = pacdump:TrimTrailingJunk(sFileTarget)
					local sDLink = pacdump:FixDLink(sFileTarget)
					
					local CRC_HASH = util.CRC(sFileTarget)
				
					if not tLinks[CRC_HASH] then
						local fileName = tostring(nFileName)
						local fileDir = sSaveDir..fileN.."/objects/"
						local filePath = fileDir..fileName..".dat"
						local refFilePath = sSaveDir..fileN.."/"..pacdump.filename.llinks
				
						fileName = string.gsub(sFileTarget,"([?&][%w%%_]-[=][%w%%_]*)","")
						fileName = string.gsub(fileName,"^(.*[/])","")
						fileName = string.gsub(fileName,"(%%20)","_")
						
						table.insert(pacdump.dobjCache, 0,{url = sDLink, name = fileName, path = filePath, refpath = refFilePath, id = tostring(nFileName), status = 0})
					
						nFileName = nFileName + 1
						
						pacdump:ProcessDL()
						
						tLinks[CRC_HASH] = 1
					end
				end
			end
		end, true)
	end
	
	pace.luadata.WriteFile(savePath, ptOutfitData)
end


function pacdump:DumpSelected()
	pacdump:DumpPlayer(player.GetByID(pacdump.playerlist[pacdump.dumpergui.plist:GetSelectedLine()]))
end

function pacdump:DumpAll()
	traverse(player.GetAll(), function(ePlayer)
		pacdump:DumpPlayer(ePlayer)
	end)
end

function pacdump:RebuildList()
	pacdump.dumpergui.plist:Clear()
	pacdump.playerlist = {}
	
	traverse(player.GetAll(), function(pTarget)
		if IsValid(pTarget) and !pTarget:IsBot() then
			pacdump.dumpergui.plist:AddLine(tostring(pTarget:EntIndex()), pacdump:StripColortags(pTarget:Nick()))
			pacdump.playerlist[#pacdump.playerlist+1] = pTarget:EntIndex()
		end
	end)
end


-- Derma

pacdump.dumpergui.base = vgui.Create("DPanel")
local pnBase = pacdump.dumpergui.base

pnBase:SetRenderInScreenshots(false)
pnBase:SetSize(500,320)
pnBase:SetPos(ScrW()/2-250,ScrH()/2-160)

function pnBase:Paint(w,h)
	surface.SetDrawColor(pacdump.bgc)
	surface.DrawRect(0,0,w,h)
	surface.SetDrawColor(pacdump.fgc)
	surface.DrawOutlinedRect(1,1,w-2,h-2)
end


pacdump.dumpergui.sbar = vgui.Create("DPanel")
local pnSBar = pacdump.dumpergui.sbar

pnSBar:SetRenderInScreenshots(false)
pnSBar:SetSize(512,27)
pnSBar:SetPos(ScrW()/2-256,ScrH()-27)
local pnSBarIconList = {Material("icon16/information.png"),Material("icon16/accept.png"),Material("icon16/stop.png")}
pnSBar.icon = 1
pnSBar.text = "Awaiting user commands..."

timer.Create("pacdump_awaiting",5,0,function()
	pnSBar.icon = 1
	pnSBar.text = "Awaiting user commands..."
end)

function pnSBar:Paint(w,h)
	surface.SetDrawColor(pacdump.bgc)
	surface.DrawRect(0,0,w,h)
	surface.SetDrawColor(pacdump.fgc)
	surface.DrawOutlinedRect(1,1,w-2,h-2)
	draw.DrawText(pnSBar.text,"DermaDefault",30,6,pacdump.fgc)
	surface.SetMaterial(pnSBarIconList[pnSBar.icon])
	surface.SetDrawColor(Color(255,255,255))
	surface.DrawTexturedRect(6,6,16,16)
end


pacdump.dumpergui.plist = vgui.Create("DListView",pacdump.dumpergui.base)
local dlvP = pacdump.dumpergui.plist

dlvP:SetSize(360,300)
dlvP:SetPos(10,10)

dlvP:AddColumn("PID"):SetFixedWidth(32)
dlvP:AddColumn("Nick")


local function CreateLabel(text, x, y)
	local label = vgui.Create("DLabel", pacdump.dumpergui.base)
	
	label:SetText(text)
	label:SizeToContents()
	label:SetPos(x,y)
	
	return label
end

local function CreateLabeledCheckbox(name, label, initial, x, y)
	pacdump.dumpergui["cb_"..name] = vgui.Create("DCheckBox",pacdump.dumpergui.base)
	local cb = pacdump.dumpergui["cb_"..name]

	cb:SetPos(x, y)
	cb:SetValue(initial)

	pacdump.dumpergui["cb_"..name.."_lb"] = CreateLabel(label, x+20, y-2)
end

local function CreateLabeledEditbox(name, label, initial, x, y)
	pacdump.dumpergui["eb_"..name.."_lb"] = CreateLabel(label, x+2, y)
	
	pacdump.dumpergui["eb_"..name] = vgui.Create("DTextEntry",pacdump.dumpergui.base)
	local eb = pacdump.dumpergui["eb_"..name]
	
	eb:SetPos(x, y+15)
	eb:SetSize(96,24)
	eb:SetText(initial)
end

local function CreateButton(name, text, x, y, callback)
	pacdump.dumpergui["btn_"..name] = vgui.Create("DButton",pacdump.dumpergui.base)
	local btn = pacdump.dumpergui["btn_"..name]
	
	btn:SetText(text)
	btn:SizeToContents()
	btn:SetPos(x,y)
	btn.DoClick = callback
end

CreateLabeledCheckbox("dumpempty", "Dump empty", 0, 385, 20)
CreateLabeledCheckbox("stripcrc", "Strip CRCID", 1, 385, 40)
CreateLabeledCheckbox("riplinks", "Rip links", 1, 385, 60)
CreateLabeledCheckbox("ripbackup", "Backup noDL", 1, 385, 80)
CreateLabeledCheckbox("showstatus", "Show statusbar", 1, 385, 100)
CreateLabeledCheckbox("groupuser", "Group by user", 1, 385, 120)

function pacdump.dumpergui.cb_showstatus:OnChange(bValue)
	pacdump.dumpergui.sbar:SetVisible(bValue)
	pacdump.dumpergui.sbar:SetEnabled(bValue)
end

CreateLabeledEditbox("dumpdir", "Dumps folder name", "pac3/garbage/", 385, 150)

CreateButton("refreshlist", "Refresh list", 385, 210, pacdump.RebuildList)
CreateButton("dumpsingle", "Dump selected", 385, 230, pacdump.DumpSelected)
CreateButton("dumpall", "Dump all", 385, 250, pacdump.DumpAll)
CreateButton("hidewindow", "Hide window", 385, 290, function()
	gui.EnableScreenClicker(false)
	pacdump.dumpergui.base:SetVisible(false)
	pacdump.dumpergui.base:SetEnabled(false)
end)

pacdump.dumpergui.base:SetVisible(false)
pacdump.dumpergui.base:SetEnabled(false)

concommand.Add(pacdump.ccmd, function()
	pacdump.dumpergui.base:SetVisible(true)
	pacdump.dumpergui.base:SetEnabled(true)
	gui.EnableScreenClicker(1)
	
	pacdump:RebuildList()
end)