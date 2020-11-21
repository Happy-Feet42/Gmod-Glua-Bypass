--[[
TODO:
make new how-to video because it sucks
======================================================FAQ======================================================
Q: How the fuck do I install this? A: Look down, retard.
Q: Does the triggerbot toggle? A: It does now, you used to have to hold down a button.
Q: Why did I get banned from a server after using this script? A: The server has CAC, get a better bypasser.
Q: Why do I see people tagged shit like "madbluntz member" on the ESP? A: So you know who's good and who's not.
Q: This shit doesn't work! How can I contact you? A: Add me on steam.  My profile link is below.
Q: Can I be VAC banned for using this? A: No, VAC in Gmod only blocks a few C# cheats from 10 years ago or so.
Q: The ESP doesn't work and I'm not getting any errors, what do? A: Reinstall your game, blame steam workshop.
Q: Why do I get spammed with Lua errors when I join a server? A: Their gamemode is probably broken shit.
Q: Why isn't Something showing up on ESP? A: Either you've not moved within range of it, or it doesn't exist.
Q: How do I reset my settings? A: Go to the Data folder and delete anything with a d_ in front of it.
Q: Where do I go for updates? A: My pastebin, www.pastebin.com/u/Caliber_
Q: Pickup and dupe in radius don't work, can you fix it? A: No, the server is using a modified Clockwork base.
Q: Will you add this feature? A: Contact me and ask me about it.  If it's useless, I likely won't add it.
Q: Can I have my own special ESP tag? A: if you do something really cool or really bad you'll probably get one.
Q: Why did you put this much effort into a cheat? A: This is my hobby, I want to create shit that looks good.
Q: Why is there so much racist bullshit in your cheat? A: to ward off communist retards unworthy of my cheat.
Q: Why does the bypasser you included not work or crash the game? A: You're either not playing on windows or
you don't have the Microsoft .NET framework.  Get that. www.microsoft.com/en-us/download/details.aspx?id=42642
Q: Can I change the keys for shit like the aimbot? A: You can bind most things to any key you want, but the
aimbot specifically requires you to change something within the cheat, so if you want to hunt down KEY_F and
all the lines used in the aimbot to change it, be my guest.  I'll try to find an easier way to change shit.
Q: The ESP turned off and I heard Eli from HL2.  What happened? A: Someone tried to screencap you.  Type
panicmode 0 into the console to turn your shit back on.
Q: Is this malware / will this break my pc? A: No, I have not found any way as of yet to create a virus using
LUA, unless you count CAC, since CAC is spyware, but even if this was malware, you would be able to read the
source code directly, so you can see exactly what the script will do when you run it.
Q: I use Odium and the cheat gives me an error, how to fix? A: delete the code for the POM directly below this
paragraph.  For some reason, some people get an error having to do with menu drawing when they try to run it.
I don't personally have a copy of Odium myself, and the project is retired now, so I'll likely not be able to
find out exactly why it happens anytime soon.
Q: I'm trying to use the bypass but I get an error saying it can't load the module or something like that.
What can I do to fix this? A: After some testing and looking shit up, I found out that the bypass specifically
requires the 32 bit version of the 2010 visual C++ redistributable.  Get that here: 
https://www.microsoft.com/en-us/download/details.aspx?id=5555
==============================================HOW TO USE THE CHEAT=============================================
To use the cheat, just click download at the top and drop this file into the game's lua directory (usually
C:\Program Files (x86)\Steam\SteamApps\common\GarrysMod\garrysmod\lua).  After moving the file, open the game,
enable the developer console in the game's settings, go into a singleplayer game, and open it by pressing the
~ key.  Type "lua_openscript_cl whatever-you-called-the-file.lua" into the console and hit enter.  This will
load the cheat.  Once it's open, it should give you some instructional text on how to open the menus and such
in the chat.  A few tips: you can open the dev console in the main menu by pressing shift + ~, but you can't
run the script from the main menu.  No idea why, but you can't.  Secondly, if you want to join servers more
quickly, go into the options menu, other, and at the bottom select "only allow map files".  This will create
errors and other shit, but it will speed up downloads by a shit-ton.  If you have any questions that these
paragraphs don't answer, try google first.  If google can't help you, you can contact the developer of the
cheat at https://steamcommunity.com/profiles/76561198146840693 .  If that account ends up abandoned, good
fucking luck finding me.  My name is so generic that a google search won't bring up jack shit for me, so your
best bet is to just try to contact somebody on the account's friends list to see if they know where I went.
==============================================CONSOLE COMMAND LIST=============================================
ass_insult, ass_insult2, ass_insult3, ass_insult4 -- Generate a single procgen chat spam message
cw_insult, cw_insult2, cw_insult3, cw_insult4 -- Generate a single procgen chat spam message for clockwork
sh_toggle -- Toggles the freecam
sh_pos -- Prints the XYZ coordinates of the freecam's viewport
refreshfriends -- Forces the friend script to add or remove friends if it hasn't already
dupeinradius -- Runs the duplicate in radius script for old hl2rp versions
pickupinradius -- Runs the same thing as above but often doesn't duplicate items and has a larger range
====================================================PREFACE====================================================
Yes, this is a modification of Project Orion / Defcon.  Their menu used to (and still does) look fucking great.
Over ~2 years, I have modified their cheat in so many ways that it's barely recognizable any more.  Nearly
everything about the cheat has been modified or tweaked in some way.  The new features that have been added
overshadow the original version of Defcon by miles.  You might ask "hey faggot, if you added and changed a
bunch of shit, why did you keep the 'defcon' name in the code?"  The answer to this is a combination of 2
things.  1: If it ain't broke, don't fix it.  2: Transparency.  If people look at this and recognize Defcon's
code but with all the tags changed to something like shitc, they're far more likely to get mad at or disregard
the cheat as a skiddie shitpaste.  Now, I do know that everyone would react differently, but knowing the kinds
of people that would get their hands on this cheat, that seems like the average response to hastily changing
all the tags and calling it a brand new cheat.
 
I should probably also address my development philosophy here, too.  With this cheat, I wanted to make
something with everything you needed, and nothing you don't.  That means no retarded fucking colour changers,
no extraneous bullshit, etc.  People have come to me asking to add shit like niggermenu had where you could
change the colours of FUCKING EVERYTHING, but the only people that did had ADHD and would have spent more time
fucking with the colour sliders than actually playing the damn game.  Some shit I also kept out of the cheat 
simply because it would be a lot of work for very little reward.  One example of this is bone-specific
targeting for the aimbot.  This isn't CS:GO, there's absolutely no good reason to shoot anything but the 
person's head.  Over the ~2 years I've spent using and modifying this cheat, I've found new things to add, and
old shit to remove.  The whole idea behind this was that I was going to use it.  If I'm going to fucking use
it, I want it to be damn good, and if there's one thing I know, it's that if you make something yourself,
It will be the best thing of that kind for you.  Some people like the fag behind Snixzz3 only did it for the
money, and never intended on using the cheat themselves.  They bitched and moaned that they only made $5 from
a single donation on their cheat, the private parts of their cheat that were supposed to be paid got leaked,
and then they quit development entirely.  Their cheat ended up being a self-defeating pile of dogshit
that spammed links to their website if you didn't have the paid version and ran like a pile of shit.  Another
big issue I have with fags like 0xymoron is the way they write shit.  The Project Odium team did this too,
and It fucking eludes me as to why.  They put a line break between every line with actual code.  Just a blank
fucking line.  They don't put fucking annotations there, they don't use it for formatting, they just have
a blank fucking line between every other line.  Not only does this make it a bitch to scroll through, since
you can only see half as much content on your screen at one time, it adds a fuckton of unnecessary lines that
inflate the filesize and line count.  Oh yeah, not to mention Snixzz3's menu is ugly as shit.  Now, I know
I'm being a little bit of a hypocrite with my fucking gratuitous menu display messages / chat spam table,
but it does serve a purpose.  It's not just there to be there, it can be used as chat spam.  Superfluous
lines in a Lua file serve no fucking purpose other than to annoy.  Alright, this is getting to the point
where most people are probably just going to skip over this rather than reading it, so I'll cut it here.
===================================================OTHER SHIT==================================================
If you want my bypasser, I'll put the link here just so skids don't have to bug me for a bypasser.
This is CAC detected, but it works for most of what I do.  If you want an undetected one, use odium.pro
or citizenhack.me, as they both have some way for you to inject scripts using them.  Be warned, though.
Many people have reported that using Odium and Shitcheat in conjunction breaks the ESP until you completely
reinstall the game.

https://files.catbox.moe/aafnv7.zip
===============================================================================================================
Also, in case you're a lazy fuck and don't want to configure the item ESP yourself, here's a link to a
pre-configured one.  It contains all useful Clockwork items such as guns, backpacks, shipments, and ammo.
It also includes most M9K weapons, as well as a good portion of DarkRP printers and bitminers.

https://pastebin.com/H69D1AZd
===================================================AFTERWORD===================================================
I never really expected to write this, I really just wanted to have some more fancy buttons to put on the menu,
but here we are. This is shitcheat, and as I'll call it, "the only good lua cheat for gmod." This cheat has
been developed over the course of approximately 2 years, starting in october of 2016 and unoficially ending in
june of 2018. I don't think I'll ever truly stop updating the cheat until the game dies, but I've got a good
amount of content there and I've fixed every bug I've been brought that I'm willing to. Development was sparked
from a lack of usable lua cheats for gmod, and the desire to kill the game off. The Madbluntz coalition,
militia, or army, though usually just Madbluntz, was the group that it all started from. The group is still
active as of writing this (June 6th, 2018) and continues to wreak havoc on Gmod and CS:GO servers alike,
along with a few others. The leader of the group contracted Caliber, myself, to create a cheat for them due to
this lack of usable lua scripts.  And so I did, and here we are. It's been years in the making, and hopefully
it will have been worth the long, long wait.  So here it is, in all its broken glory:

I present to you, Shitcheat version 7.5.

As it stands, I don't have any more ideas or lists to sift through for new content.
I'll still continue to support the cheat, through the cheap webhost and future patches, but new content will
likely cease. A new and proper tutorial video should be live on the site as soon as this update goes live,
but no promises on that.

In the end, I'm happy with this script here.  I'm content with how broken it is, only because it still
works fine on ancient, near dead gamemodes, like the one this was made for.  It is a script, though, so it
will lag on higher population servers regardless.  I hear there's going to be a new version of Cake's
anti-cheat coming out soon, too. So despite there currently being a 1 line cac bypass out, the fun to be had
with that may very well end with the release of the new anti-cheat. As it stands, CAC is useless against lua
scripts because of this 1 liner, so enjoy this script and others like it while you can, because they may not
last for long.

You can always contact me over steam, the link to my profile is available in the preface of this script.

To close this out, as my (possibly) final words on Shitcheat and maybe Gmod as a whole, enjoy yourselves.
All good things must come to an end, and this cheat is no different.

Gmod is a steaming pile of shit, though.
It doesn't deserve to have survived as long as it has.
Please use this cheat to the fullest to kill off this godawful game.

I'll see you all on the other side, thanks for sticking around.
]]

--POM (Print Once Message / startup text)

local function DrawPOM()
	if(menu.frame) then menu.frame:Remove(); menu.frame = nil; end
	menu.c = 0
	menu.frame = vgui.Create("DFrame");
	menu.frame:SetPos(ScrW()/2-254, ScrH()/2-55);
	menu.frame:SetSize(500, 135);
	menu.frame:SetFontInternal('trike')
	menu.frame:SetTitle("                                                                    !!!ATTENTION!!!");
	menu.frame.Paint = function()
		surface.SetDrawColor(50,50,50,200)
		surface.DrawRect(0, 0,menu.frame:GetWide(),menu.frame:GetTall())
		surface.SetDrawColor(255, 255, 255,0)
		surface.DrawOutlinedRect(0,0,menu.frame:GetWide(),menu.frame:GetTall())
	end
	menu.frame:SetVisible(true);
	menu.frame:SetDraggable(true);
	menu.frame:SetSizable(false);
	menu.frame:ShowCloseButton(false);
	menu.frame:SetBackgroundBlur(true)
	menu.frame:MakePopup();
	
	menu.close = vgui.Create("DButton", menu.frame)
	menu.close:SetFont('marlett')
	menu.close:SetText('r')
	menu.close:SetColor(Color(255, 255, 255, 255))
	menu.close:SetSize(15, 15)
	menu.close:SetDrawBackground(false)
	menu.close:SetPos(menu.frame:GetWide() - 20, 5)
	menu.close.DoClick = function()
		menu.frame:Remove(); menu.frame = nil;
	end
	menu.buttons = vgui.Create("DPanel",menu.frame)
	menu.buttons:SetPos(5, 25)
	menu.buttons:SetSize(500,500)
	menu.buttons:SetVisible(true)
	menu.buttons.Paint = function()
		surface.SetDrawColor(163,163,163,255)
		surface.DrawOutlinedRect(0,0,490,105)
	end
	local label = vgui.Create("DLabel", menu.frame)
	label:SetText("WARNING! THIS MESSAGE WILL ONLY DISPLAY ONCE!                                                                                                          ")
	label:SetPos(10,35)
	label:SizeToContents(false)
	label:SetFont("bignig")
	label.Paint = function(self)
		label:SetTextColor(Color( 51, 122, 204, 255 ))
	end
	local label2 = vgui.Create("DLabel", menu.frame)
	label2:SetText("Thank you for downloading Shitcheat!  If you're having trouble using the cheat or any features,")
	label2:SetPos(10,55)
	label2:SizeToContents(false)
	label2:SetFont("trike")
	label2.Paint = function(self)
		label2:SetTextColor(Color( 220, 220, 220, 255 ))
	end
	local label3 = vgui.Create("DLabel", menu.frame)
	label3:SetText("please refer to the documentation provided inside the Lua file, at the very top.  You can contact")
	label3:SetPos(10,75)
	label3:SizeToContents(false)
	label3:SetFont("trike")
	label3.Paint = function(self)
		label3:SetTextColor(Color( 220, 220, 220, 255 ))
	end
	local label4 = vgui.Create("DLabel", menu.frame)
	label4:SetText("the developer of the cheat any time using the links provided in the preface.")
	label4:SetPos(10,95)
	label4:SizeToContents(false)
	label4:SetFont("trike")
	label4.Paint = function(self)
		label4:SetTextColor(Color( 220, 220, 220, 255 ))
	end
	file.Write("d_POM.txt", "this file stops the POM from showing, if you want it to show again for some reason, delete this.")
end
	
if !file.Exists("d_pom.txt", "DATA") && !menu.frame then
DrawPOM()
end


--menu vars

local vnum = "7.5" --UPDATE THE ABOUT MENU TOO YOU DUMB CUNT
local defcon = { Menu = { t = {}; b = {}; c = 0}; Alive = {};}
defcon.Normal			= {
	aimbot					= true;
	aimbot_fov				= 5;
	aimbot_friendly_fire	= true;
	triggerbot				= false;
	vischeck				= true;
	shootsteamfriends		= false;
	targetnoclippers		= false;
	autoshoot				= false;
	autosnap				= false;
	snapline				= false;
	radiusdraw				= false;
	
	esp_player				= true;
	esp_player_dist			= 16000;
	esp_player_showdist		= true;
	esp_player_name			= true;
	esp_player_rank			= true;
	esp_player_health		= true;
	esp_player_armor		= true;
	esp_player_glow			= false;
	boxESP					= false;
	twodbox					= true;
	chams					= false;
	espname					= false;
	tracelines				= false;
	
	esp_entity				= true;
	esp_entity_dist			= 16000;
	propchams				= false;
	entitychams				= false;
	
	flashlight_spam			= true;
	
	ttt_deathnotifs			= true;
	bhop_bhop				= true;
	crosshair				= true;
	velocity				= true;
	lasereyes				= true;
	autoacd					= false;
	autoclick				= false;
	silentaim				= false;
	FOVslider				= 100;
	panicdisplay			= true;
	returnnil				= false;
	
	chatspam1				= false;
	chatspam2				= false;
	chatspam3				= false;
	chatspam4				= false;
	superspam				= false;
	madspam					= false;
	adminspam				= false;
	autispam				= false;
	adspam					= false;
	obnoxiousspam			= false;
	OOCspam					= false;
	
	cl_noclip				= false;
	freecamspeed			= 35;
	
	sfd						= false;
	fullbright				= false;
	brightness				= 0;
	contrast				= 1;
	saturation				= 1;
	worldspawnalpha			= 1;
	
	pickupinradius			= false;
	dupeinradius			= false;
	
	EA_mirrorsedge			= false;
	EA_watermark			= false;
	nigger					= false;
	audacity				= false;
	soundeffects			= false;
}
defcon.Settings			= (file.Exists("d_settings.txt", "DATA") and util.JSONToTable(file.Read("d_settings.txt", "DATA"))) or defcon.Normal
defcon.Entities 		= (file.Exists("d_entities.txt", "DATA") and util.JSONToTable(file.Read("d_entities.txt", "DATA"))) or {}
defcon.Whitelist 		= (file.Exists("d_whitelist.txt", "DATA") and util.JSONToTable(file.Read("d_whitelist.txt", "DATA"))) or {}
defcon.AimKey			= (file.Exists("d_aimkey.txt", "DATA") and tonumber(file.Read("d_aimkey.txt", "DATA"))) or KEY_F

--colors

red = Color(255,0,0,255);
black = Color(0,0,0,255);
green = Color(0,255,0,255);
white = Color(255,255,255,255);
blue = Color(0,0,255,255);
cyan = Color(0,255,255,255);
pink = Color(255,0,255,255);
blue = Color(0,0,255,255);
grey = Color(100,100,100,255);
gold = Color(255,128,0,155);
yellow = Color(255,255,0,255);
lightblue = Color(155,205,248);
lightgreen = Color(174,255,0);
iceblue = Color(116,187,251,255);
orange = Color(255,165,0,255);
brown = Color(112, 89, 50, 255);
sc = Color(43, 128, 226, 255);
sc1 = Color(43,140,226, 255);
sc2 = Color(51, 122, 204);
sc3 = Color(66, 134, 244);
sc4 = Color(51, 119, 172);

--print shit

if _G.CAC then
chat.AddText( red, "[Shitcheat] ", yellow, "WARNING! CAKE ANTI-CHEAT DETECTED! IF YOU DON'T HAVE A WORKING BYPASS, YOU WILL BE KICKED!")
end

chat.AddText( sc2, "[Shitcheat] ", white, "Hack activated.")
chat.AddText( sc2, "[Shitcheat] ", white, "To open the menu, press TAB and Q at the same time.")
chat.AddText( sc2, "[Shitcheat] ", white, "To activate anti-aim, activate silent aim.")
chat.AddText( sc2, "[Shitcheat] ", white, "The middle mouse button activates the triggerbot. ")
chat.AddText( sc2, "[Shitcheat] ", white, "Hold down F to activate the aimbot")

if !ConVarExists("SCAA") then
chat.AddText( gold, "[Shitcheat] ", yellow, "It looks like you're not using the auto-updater.  If you don't want to have to grab updates for yourself every time, you should go grab that. https://pastebin.com/2u6twCsQ")
end
--menu display messages

defcon.Phrases 				= {
	"niggerniggerniggernigger";"bob good is not so good";"sheo is a kike";"new Shitcheat";"better than snixzz!";"100x better than snixzz";"i hate niggers";"suck my dick";"donul trump";
	"remove kebab";"gas yourself, kike.";"kaz wuz here";"when is next prequel update???";"colon colon colon";"enter password";"deleting system32 the cool way";
	"0xymoron is a complete fucking autist";"remember, no russian";"'skiddie shit'";"dirt shit nigger";"how about you try spending a year of your life making a cheat";
	"Made by the Madbluntz.rs Team";"we need to nuke japan again";"now with freecam";"go fast eat ass";"onion";"[OOC]Johnny Nutmegg: you fucking suck dick bro";"the fuck are you looking at";
	"fucking eat shit kid";"commies go home";"tito is a dirty nigger";"now with more dongs";"north virginia battle falag isnt the confed flag";"free forever, always.";
	"the KKK is dead stop crying about it";"doesn't support Æß¾";"back to africa";"smesh moth";"fuck fuck fuck shit shit shit fuck shit FUUUUCK";"if you voted for hillary delete system32";
	"[LOOC]poop: hi";"gulag";"halgualuhglugaluaglhuaglhuaglhu";"over 1000 lines of bullshit";"remember to enable ESP";"skype is shit";"bent dick";"nigger";"minecraft used to be good";
	"lets go back to 2011";"asslicker";"50% off all fat farts at the fag store";"madman has testicular cancer";"madman is a TRAP";"madman has down's syndrome x10";
	"you dont get any more shoutouts you fucking kike";"shoutout to x10 hosting for hosting shitcheat.me";"not an argument";"better than niggermenu";"still using lua";"better than gearmenu";
	"personalized";"who wants a free mbam key";"remember kids, dont advertise.";"madbluntz.rs - home of Shitcheat";"where my new england homies at";"JSY3050PA";"cuck";
	"free gift card giveaway";"i banned him for 'furry'";"skype abuse";"hes an OP";"exploding capacitors";"It's a nice gun, I'll give you that.";"Team AVO deserves ice cream";
	"made with notepad++";"made on microshit windon't 8.1";"Pravi srpski ratni heroj";"kosovo je srbija";"6 shots";"that revolver only carries 6 shots";"THE SHAGOHAD";"REMOV KEBAB";
	"i hear sadness";"this isn't the final version, trust me.";"doridian wasn't happy";"there's more where that came from";"remember; no russian";"whoops";"ask and you shall receive";
	"how many of these fucking things do you have";"jesus christ";"one side";"down with fascists";"good night alt right";"identity politics is a hell of a drug";
	"trump isn't a fascist you fucking retards";"hitler only killed 12 million stfu";"if you advertize a discord server i'll ddos u";"don't forget to credit the people u steal hacks from";
	"AUFHIFUWEHFUWAHFULFUWAHIFAWHIFUWHLFIUAWHFIUAWHFILWUHWAFHWILUFHWALIUFHWIUFHWAIUFHWUFHWLIFUHWIUFWHUIHFW";"dirty fucking NIGGERS";"spear chuckers get out of my country";"hi";
	"if you see this message, tell calb. if you dont know who calb is then fuck off";"BIG FUCK, TELL TONY";"cucked ape";"rust sucks";"garry newman more like garry jewman";
	"cum-guzzling faggots";"dongs";"official website: www.madbluntz.rs";"listen to my music @ caliberr.bandcamp.com";"discord.gg/nigger";"furries will die from brain tumors";
	"space left blank intentionally";"whoa, dude";"As seen on TV";"BACK UP THE CLEAN DATA AND DISINFECT THE DEAD";"Awesome";"100% pure";"May contain nuts";"expect shitty memes";
	"Better than Prey";"More polygons";"Sexy";"THERE'S A LIGHT AT THE END OF THE TUNNEL, ALWAYS. A CLICHÉ HOPE TO DRIVE YOU TO ENDURE ANOTHER DAY";"Limited edition";"Flashing letters";
	"It's here";"Best in class";"Ctrl+d";"It's finished";"Kind of dragon free";"Excrement";"More than 500 sold";"One of a kind";"Heaps of hits on YouTube";"Indev";"Spiders everywhere";
	"Made in AMERICA";"Uses LWJGL";"Reticulating splines";"Singleplayer";"Keyboard compatible";"Undocumented";"Ingots";"That's no moon";"l33t";"Exclusive";"The bee's knee";
	"Down with O.P.P.";"Closed source";"Classy";"Wow";"Not on steam";"Oh man";"Awesome community";"Pixels";"Teetsuuuuoooo";  "Kaaneeeedaaaa";"Now with difficulty";"Enhanced";
	"90% bug free";"Check it out";"Holy cow, man";"It's a game";"Pretty";"We shoot the sick, the young, the lame,";"We do our best to kill and maim,";"i wanted to see what that'd get out of you";
	"Because the kills all count the same,";"Flying low across the trees,";"Pilots doing what they please,";"Dropping frags on refugees,";"It made us feel so good inside,";
	"When the strongmen left and the women cried,";"we decompose when we're buried ";"we break apart when least ready ";"we both know misery";"But what we really like is the children fried,";
	"See that family over there,";"Watch me get them with a pear,";"Blood and guts just everywhere,";"set me free ";"show me what it means to be ";"alive and moving on ";
	"i'll show you what it's like to be ";"here when i'm gone";"CIA with guns for hire,";"Montagnards around a fire,";"fuckin tweeter broke";"i would not let you near my penis you fucking faggot";
	"jban42 has abandoned the match and received a 7 day competitive matchmaking cooldown";"don't worry ";"it's nothing much ";"no trouble at all ";"if it doesn't make sense ";
	"let me take the fall ";"cheats dont fucking deserve money";"i'll always be the one ";"afraid to let you down ";"inquire and ask away ";"so i don't lead you around ";
	"don't worry if it doesn't make sense ";"i should know better after all";"Napalm makes the fire higher,";"Children sucking on a mother's tit,";"gooks down in a sifty pit,";
	"Dow Chemical doesn't give a shit,";"Attack some kids when you go downtown,";"surfing supported shattered starshine ";"so you're back from space ";"you got a look on your face ";
	"like you saw something great ";"well i'm back from space too ";"and i found something new ";"but my story's gotta wait";"it doesn't matter what i've done ";
	"if you're gonna step on my shoudlers ";"to act like the taller one ";"becoming complete";"something is showing through the cracks ";"in your skin ";"i thought you were a humanoid ";
	"like me a humanoid ";"i rode so many cosmic rays ";"i ruled so many galactic days ";"i wanna say i've overcome ";"all of the problems that i faced ";"and i've still got spare energy ";
	"so you know the next time you're around ";"you're gonna have to deal with my universal sound ";"blasting through like mothafuckin' starlight";"dust drifting directionless divine ";
	"screaming sidelining supernovas ";"colliding colossi cracked coronas ";"you accrued new dues ";"to eschew the slew in view ";"your queue grew ";"the few in queue were due ";
	"you were through and flew";"By throwing some candy on the ground,";"Then grease them when they gather 'round,";"hey ";"now unbroken";"i fixed it guys dont worry";"ngyur";
	"it's a hot one today ";"it's a hot day ";"but i bet it's hotter for you ";"you stupid patronizing fool ";"i bet you think you're fuckin' cool ";"you've got some new people to school ";
	"on your stupid damn rules ";"we're sick of hearing tales of you taking a stand ";"blasphemers burned to the bones if they would not recant ";
	"we're tired of hearing fables of how you're so stuck ";"this shit will roll off us if we have any luck ";"and do you know what we have? ";"we have luck ";
	"you pave a road, you carve a path, you blaze a trail ";"but you look like a stupid dog chasing its tail ";"convincing others that it's lots of fun ";
	"a grave mistake within the words you've spun ";"hey ";"it's a cold one today ";"it's a cold day ";"but i bet it's colder for you ";"you stupid patronizing fool ";
	"i bet you think you're fuckin' cool ";"you've got some new people to school ";"on your stupid damn rules ";"we're sick of hearing tales of you taking a stand ";
	"blasphemers burned to the bones if they would not recant ";"we're tired of hearing fables of how you're so stuck ";"this shit will roll off us if we have any luck ";
	"and most of all above everything ";"we will always have luck";"A squad of Cong in the grass,";"But all the fighting's long since passed,";"Crispy critters in a mass,";
	"i think a thousand years have passed ";"while wondering how long i'll last ";"and it turns out time flies ";"i feel the earth has spun ";"a million turns around the sun ";
	"and it turns out time flies ";"the best decision that i've made ";"is living in the moment ";"and not expanding ";"the infinite points of past and future ";"into some kind of quale ";
	"ever commanding";"LOH's out to have a blast,";"Drop some peon kids en masse,";"Send the remains to the chief of staff,";"Oxcarts rolling down the road,";"Peasants with a heavy load,";
	"faulty";"petite";"spiteful";"sweet";"exultant";"old-fashioned";"hypnotic";"instinctive";"second-hand";"chilly";"brainy";"fixed";"lean";"abusive";"crooked";"idiotic";"industrious";"high";
	"thoughtless";"grubby";"hanging";"next";"nimble";"spotless";"luxuriant";"yummy";"billowy";"elegant";"alcoholic";"ordinary";"abrupt";"festive";"excellent";"unbiased";"zealous";"faithful";
	"untidy";"ambiguous";"quarrelsome";"milky";"quickest";"far";"messy";"broad";"royal";"parsimonious";"malicious";"periodic";"young";"erratic";"strange";"weary";"educated";"quick";"silky";
	"murky";"womanly";"deserted";"sore";"unadvised";"materialistic";"elderly";"true";"spicy";"squalid";"flawless";"deranged";"blushing";"comfortable";"safe";"dark";"gratis";"familiar";
	"rampant";"poor";"hilarious";"amusing";"sordid";"dreary";"fearful";"husky";"wistful";"creepy";"bitter";"outgoing";"limping";"cooperative";"dry";"inquisitive";"new";"bright";"elfin";
	"groovy";"nice";"rough";"wonderful";"precious";"certain";"hard";"innate";"rebel";"youthful";"delicate";"wandering";"eager";"functional";"bright";"scattered";"interesting";"combative";
	"labored";"unarmed";"drab";"gigantic";"kaput";"public";"slippery";"overconfident";"used";"selective";"frantic";"tired";"tart";"homeless";"fabulous";"unused";"purple";"ratty";"imminent";
	"macabre";"wasteful";"accessible";"colossal";"wrathful";"different";"spooky";"exclusive";"shy";"astonishing";"simple";"calm";"spiffy";"lacking";"decorous";"penitent";"panicky";"flippant";
	"hissing";"fluttering";"stingy";"adventurous";"little";"ethereal";"super";"spotted";"impolite";"tough";"harsh";"warm";"jumpy";"jealous";"damaged";"heady";"clammy";"feeble";"false";"makeshift";
	"wanting";"evanescent";"defiant";"discreet";"questionable";"nutty";"arrogant";"cowardly";"volatile";"ossified";"entertaining";"decisive";"humorous";"ragged";"imported";"broken";"tall";"crowded";
	"absorbed";"thoughtful";"disillusioned";"mere";"lethal";"perfect";"hateful";"spiky";"aback";"living";"unequaled";"wry";"disgusted";"petite";"smiling";"dysfunctional";"skinny";"habitual";
	"threatening";"barbarous";"one";"electric";"quiet";"glossy";"short";"perpetual";"fanatical";"physical";"obsolete";"happy";"frequent";"cagey";"elated";"vigorous";"eminent";"fumbling";"literate";
	"madly";"worthless";"overjoyed";"salty";"mighty";"rapid";"irritating";"tranquil";"rightful";"dead";"energetic";"terrific";"flashy";"historical";"hurried";"disagreeable";"measly";"animated";
	"unkempt";"roasted";"needless";"thin";"black";"finicky";"glorious";"knotty";"future";"loutish"
}
defcon.Phrases3				= {
	"kikr";"They're all VC when the bombs explode,";"i will soak myself in the rain ";"until i'm reflective ";"and i'll sprawl out underneath you ";"and get your feet wet ";
	"dick shit mcNIGGER went DOWN the street";"nothin personnell kid";"for a single bite of dicks";"kill yourself jesus christ";"i hope you get cancer in your fuckin DOME kid";
	"i'm out of ideas fuck";"you'll absorb me through your shoes ";"until your legs are heavy ";"i'll make your journey that much longer ";"when you're not ready ";"Shooting women's lots of fun,";
	"try killing one thats pregnant son,";"You'll get two for the price of one,";"Napalm sticks to kids.";"Flying low and feeling mean,";"see that family by the stream,";
	"Drop some napalm n hear them scream,";"See that gook on his knees,";"Lost some flechettes in the breeze,";"Find his arms nailed to the trees,";"NVA are all hardcore,";
	"Flechettes nail them to the jungle floor,";"Throw them PSYOPS out the door,";"18 kids in a no-fire zone,";"Books under arms and going home,";"Last in line goes home alone,";
	"Chucks in a sampan sitting in the stern,";"But he don't think his boat'll burn,";"Them fucking gooks will never learn,";"See the little kids jump and shout,";
	"Drop some nape and without a doubt,";"appleman";"they got appleman";"Watch them try and put it out,";"I've been around, Some things I've seen,";"But the people who are mighty mean,";
	"The gooks you kill, they make you clean,";"I've only seen it happen twice,";"But both times, it was mighty nice,";"Shooting peasants planting rice,";"Napalm, son, is lots of fun,";
	"Dropped from a bomb or shot from a gun,";"It gets the gooks when they're on the run,";"Some people say its not so neat ,";"to watch gooks burning in the street,";
	"but burning flesh smells mighty neat,";"Gooks in the open, making hay,";"Shoot civilians where the sit.";"Take some pictures as you split.";"All your life, you'll remember it.";
	"They'se in good shape for the shape they'se in,";"But they'se no way that they can win,";"With Napalm rolling down their skin,";"Napalm sticks to kids.";"12 herbs and spices";"Fat free";
	"Absolutely no memes";"Free dental";"Ask your doctor";"Minors not welcome";"Cloud computing";"Legal in Finland";"Hard to label";"Technically good";"Bringing home the bacon";"Indie";"GOTY";
	"Ceci n'est pas une cheat menu";"Euclidian";"Now in 2D";"Inspirational";"Herregud";"deuce: N E V E R  F O R G E T MY COCK";"sponsored by lootcrate and trunkclub and shithead and shinebox";
	"Complex cellular automata";"NO SIR";"Played by cowboys";"OpenGL 2.1 (if supported)";"tens of colors";"Try it";"Age of empires is better";"Try the mushroom sjw";"Sensational";
	"Hot tamale, hot hot tamale";"Play him off, fuckhead";"pants: P - THE PEE TAPES ARE REAL";"Guaranteed";"piss up a rope";"mauve";
	"spigot: [WARNING: THIS STORY CONTAINS SPOILERS FOR UNIVERSAL AND ILLUMINATION ENTERTAINMENT'S DESPICABLE ME 3.]";"Macroscopic";"Bring it on";"Random splash";"pants: SIGHS, GETS OUT WALLET";
	"Call your mother";"Monster infighting";"Loved by millions";"pants: MMMM YEAH OOOH BOY";"Ultimate edition";"Freaky";"You've got a brand new key";"not water proof";"Uninflammable";
	"Whoa, dude";"All inclusive";"pants: LET ME GET YOU A DRINK WITH ABSOLUTELY NO ROOFIES IN IT";"Tell your friends";"NP is not in P";"Livestreamed";"Haunted";"Polynomial";"Terrestrial";
	"All is full of ERP";"Full of stars";"Scientific";"Not as cool as Spock";"Collaborate and listen";"Never fuck up";"Take frequent breaks";"Not linear";"Han shot first";"Nice to meet you";
	"Buckets of lava";"when the levee breaks";"Ride the pig";"Larger than Earth";"sqrt(-1) love you";"spigot: GOD SAID IT / I SUCKED ON IT / THAT SETTLES IT";"hes mad";"Phobos anomaly";
	"toggle your frog";"getting wood";"Falling off cliffs";"14% sugar";"150% hyperbole";"Synecdoche";"Let's punc";"Seecret Friday update";"Reference implementation";
	"DONT PRESS INSERT";"Lewd with two dudes with food";"Kiss the sky";"20 GOTO 10";"pants: T DEUCE MY BONER CRASHED INTO THE SEA";"frog toggler";"Verlet intregration";"bad boy teenager club";
	"shoe stealer";"boner";"Peter Griffin";"please distribute";"Cogito ergo sum";"boneless pizza machine broke";"44 lines of code";"A skeleton popped out";"The Work of nutmegg";
	"The sum of its parts";"BTAF used to be good";"spigot: WHOA HOLY GOD SHIT FALLING";"I miss ADOM";"you tell me when to be afraid ";"so i know when to turn away ";
	"i will be yours to lead astray ";"my independence will decay ";"we teach each other how to fear ";"when insecure we disappear ";"a peace we've been deprived of ";
	"never taught each other how to ";"i keep my eyes out for hurt ";"and ways that i could subvert ";"trained into a state of high alert ";"my vision was yours to pervert ";
	"we teach each other how to fear ";"when insecure we disappear ";"a peace we've been deprived of ";"never taught each other how to ";"love";"umop-apisdn";"deuce: CAN WE TALK BALLS?";
	"bung: MOM!";"deuce: THAT IS NOT AN ANSWER";"onyun";"OICU812";"Bring me Ray Cokes";"Finger-licking";"spigot: PASSWORD STRENGTH: LIMP";"dick-licking";"cock-nobbling";
	"absolutely fucking cancerous";"101% communism free";"sucking, fucking";"teachin', preachin'";"darkrp is a shit gamemode for shit people";"now supports ???? ???????";"Thematic";
	"back from sending a little part of me away ";"admiring shapes beneath me ";"caught my eye glowing brightly from a distance ";"what on earth could that be ";"do you call yourself stronger ";
	"when you avoid it altogether ";"just hold out a little longer ";"and overcome the destroyer ";"you're on the right track ";"so rock on ";"fuck you facepunch";"fuck you FP";
	"fuck you cloud 16";"fuck you cloud 9";"fuck you germany";"fuck you angela merkel";"fuck you albania";"fuck you";"fuck you george";"fuck you barack obama";"fuck you nigger";
	"fuck you hillary clinton";"fuck you futret";"fuck you nishi";"bielodesph gay";"bong hits for gay jesus";"and we won't turn back ";"it was you and we shared a silent moment ";
	"and i crossed the bridge on my way back home and ";"now i'll never know you ";"right now i barely know a thing ";"do you call yourself stronger ";"when you avoid it altogether ";
	"just hold out a little longer ";"and overcome the destroyer ";"Whatever kid.";"Oh I'm sorry did I fucking trigger you?";"Were you fucking triggered you little cry baby?";"Fuck off.";
	"Literally saying not a fucking word to you";"and you're gonna fucking mute me because you have a problem with me";"just fucking talking shit in all chat?";
	"Honestly go fuck yourself to the highest fucking caliber you fucking asshole.";"So sick of little fucking bitches like you who fucking have a fucking opinion";
	"like you're fucking sitting over there like,";"oh I'm some fucking problem to you because I'm not even fucking saying a fucking word to you";
	"Fuck off. Call it what you fucking asshole? Hormonal?";"Kid you're a fucking bullshitter.";"You're a fucking bullshitter.";"Go fuck yourself.";
	"You ain't fucking nothing.";"You ain't fucking anyone.";"You ain't got a fucking clue in your fucking head who I am or what I'm fucking about.";
	"That I'm fucking calling these fucking kids tryhards,";"has your fucking panties in a bunch for what?";"For what? For fucking what kid?";
	"Honestly I'm fucking sick of kids like you.";"Literally go fuck yourself.";"Go fuck yourself and everything that you fucking stand for";"because I'm gonna tell you right now,";
	"you don't stand for shit kid.";"You don't stand for fucking shit.";"Please. Yeah, talk in all chat. ";"Yeah like anybody fucking cares kid";"go find a fucking friend to talk to, right?";
	"Because you can't fucking talk to me,";"you can't fucking treat me like a fucking person.";"You ain't fucking real kid.";"You ain't fucking real.";
	"You ain't got a fucking real fucking bone in your fucking body kid.";"So go fucking all chat, and make some fucking friends.";"it's not gay if you say no homo";
	"Alright? You can make some fucking friends because 'Oh, this guy's hormonal,'";"pffft 'Uh I'm gonna mute him,'";"pffft fuck off.";"merry crisis";"merry chrimbus";"marry criemus";
	"You're literally a fucking cancer on this fucking world kid.";"Never fucking forget it.";"you're on the right track ";"[LOOC] David Remmler: ok mom";"and we won't turn back ";"Pneumatic";
	"Prismatic";"R E F R A C T my dick";"Twas the night before Kwanzaa,";"and niggas was drinkin'.";"Santa Claus walked in, they said bitch, what you thinkin'?";"One of them had a gun,";
	"the other one had a knife,";"but Santa Claus wasn't going down without a fight!";"He pulled some presents from out of his bag,";"he kicked them in the nuts and called them all fags.";
	"But they didn't like that, they thought it was gay,";"for Santa's boner grew 5 times that day!";"He robbed all his shit, from his cash to his rocks,";
	"Santa pleaded with them this black on black crime must stop!";"And in just that moment in walked little Suzie,";"little Suzie walked in with sub-machine uzi. Everyone hit the deck,";
	"them bullets was sprayin', but Santa couldn't grasp what the black guy was saying,";"and on that very night little Suzie got famous,";
	"he shot Santa in his cock and it still hurt his anussss.";"Santa pulled out his mistletoe and started to blast,";"no man left that night without a cap in his ass,";
	"and they heard Santa shout as he skipped up the chimney,";"merry Christmas bitch niggas, yall should of never fucked with me!";"!!! ALARM WARNING DANGER APPROACHING !!!";
	"Hacker-fucker TSR shit or any Virus Detected !!!";"Anyone who wants to fuck Revenge is Naivnij Man";"With best wishes & thanks to DialogScn";"hexidecimal";
	"Emulation engine will have problems with this ZHOM";"In future versions we will add :";" 1. Protected Mode Decryptor [VMME]";" 2. Adinf table Hacker-cracker";
	" 3. Destroy Files/Disks/CMOS/Printer/CDROM";" 4. Disk Encryption and other BUGs,GLUKs & SHITs !";"Dis is only BEGIN... Win95 & her lamers must die!";"Searching... SEEK & DESTROY";
	"There can only be one ...";"Sublime";"Octagonal";"Une baguette";"pants: I'LL LIVE ON YOUR DESKTOP FOREVER";"Gargamel uses it";"smurfs r gay";"7 day cooldown machine";
	"Rita is the new top dog";"SWM forever";"Representing Edsbyn";"Matt Damon";"Supercalifragilisticexpialidocious";"Consummate V's";"Cow Tools";"Double buffered";
	"Fan fiction";"Flaxkikare";"Jason Jason Jason";"Hotter than the sun";"Internet enabled";"Autonomous";"Engage";"Fantasy";"DRR DRR DRR";"Kick it root down";"Google anlyticsed";
	"Now supports åäö";"some kind of dysphoria ";"22 05 88 09 04 90 AC 09 ";"some kind of desire to sleep";"Give us Gordon";"Tip your waiter";"Very fun";"12345 is a bad password";
	"silent";"tasteless";"rich";"acidic";"enchanting";"utter";"giddy";"meek";"free";"filthy";"fresh";"clear";"aboriginal";"sick";"jumbled";"famous";"small";"plastic";"gleaming";
	"grey";"remarkable";"abject";"heavenly";"square";"yielding";"scared";"icky";"rude";"boorish";"snobbish";"shallow";"synonymous";"unbecoming";"resonant";"nauseating";"spurious";
	"miscreant";"defective";"immense";"expensive";"halting";"legal";"lame";"blue";"second";"huge";"trite";"adhesive";"coordinated";"selfish";"foregoing";"silly";"acrid";"boring";
	"lying";"whispering";"statuesque";"invincible";"numberless";"hapless";"callous";"handsome";"busy";"odd";"fragile";"lazy";"tense";"cheap";"anxious";"foamy";"exciting";"unable";
	"vague";"berserk";"uninterested";"deep";"strong";"redundant";"unhealthy";"amused";"ludicrous";"plucky";"graceful";"lewd";"common";"uneven";"minor";"stupid";"dazzling";"insidious";
	"sad";"superficial";"pushy";"prickly";"taboo";"defeated";"juvenile";"female";"typical";"painful";"divergent";"ultra";"ill";"spiritual";"rhetorical";"sharp";"humdrum";"sassy";
	"optimal";"therapeutic";"witty";"large";"thirsty";"unique";"grateful";"eight";"tan";"abhorrent";"devilish";"mixed";"rambunctious";"puzzled";"violent";"smart";"befitting";"scrawny";
	"embarrassed";"shivering";"truthful";"phobic";"impossible";"cool";"early";"ubiquitous";"maniacal";"puzzling";"adaptable";"reflective";"towering";"overwrought";"annoying";"lush";
	"careless";"splendid";"aware";"alleged";"disturbed";"flimsy";"fantastic";"wrong";"brave";"testy";"glib";"hollow";"frail";"dear";"axiomatic";"concerned";"honorable";"guttural";
	"profuse";"opposite";"dizzy";"handsomely";"wise";"adjoining";"nervous";"proud";"yellow";"afraid";"enthusiastic";"colorful";"sophisticated";"wretched";"drunk";"aberrant";"glamorous";
	"smelly";"excited";"useful";"unusual";"rabid";"vivacious";"hysterical";"feigned";"motionless";"relieved";"two";"draconian";"condemned";"noxious";"sticky";"obsequious";"exotic";"swanky";
	"faded";"private";"ugly";"wacky";"pricey";"romantic";"cooing";"separate";"nippy";"thankful";"willing";"abundant";"mysterious";"thirsty";"nosy";"far-flung";"outstanding";"present";
	"quixotic";"dramatic";"waiting";"painstaking";"powerful";"psychotic";"subdued";"absorbing";"rainy";"naughty";"helpless";"well-made";"frightening";"elite";"marked";"aggressive";
	"useless";"wakeful";"incandescent";"equable";"alive";"nasty";"equal";"furry";"regular";"aboard";"fancy";"bad";"nonstop";"truculent";"daffy";"garrulous";"successful";"oval";
	"puny";"burly";"enormous";"boundless";"polite";"thick";"old";"handy";"boiling";"sore";"extra-small";"jobless";"orange";"tawdry";"wide-eyed";"bored";"zippy";"overrated";
	"staking";"rigid";"extra-large";"grumpy";"gaudy";"tiresome";"sturdy";"macho";"ripe";"undesirable";"cute";"snotty";"obnoxious";"chivalrous";"vacuous";"squeamish";"well-off";
	"funny";"rustic";"lumpy";"determined";"understood";"tangible";"substantial";"good";"cynical";"overt";"voracious";"windy";"pointless";"craven";"kindly";"illustrious";"mundane";
	"lucky";"delirious";"offbeat";"three";"incompetent";"fearless";"demonic";"pretty";"lopsided";"thinkable";"shrill";"raspy";"stereotyped";"wild";"lively";"hideous";"dusty";"ill-informed";
	"wiggly";"irate";"imperfect";"low";"outrageous";"direful";"piquant";"picayune";"majestic";"bite-sized";"abashed";"medical";"guarded";"gray";"material";"pathetic";"dull";"ahead";"righteous";
	"cluttered";"intelligent";"left";"delicious";"verdant";"futuristic";"probable";"alike";"tender";"last";"third";"subsequent";"gorgeous";"brawny";"longing";"oceanic";"soggy";"abnormal";"lively";
	"placid";"bumpy";"tricky";"furtive";"economic";"tacit";"aquatic";"fortunate";"cloistered";"loud";"cute";"secret";"sneaky";"known";"repulsive";"nifty";"modern";"jolly";"blue-eyed";
	"temporary";"quaint";"naive";"uptight";"mammoth";"tremendous";"lackadaisical";"flat";"deadpan";"well-groomed";"tidy";"infamous";"capable";"cultured";"right";"merciful";"loose";"fascinated";
	"learned";"diligent";"tacky";"tightfisted";"clumsy";"general";"holistic";"laughable";"solid";"able";"zonked";"whole";"average";"unknown";"fierce";"sour";"military";"delightful";"responsible";
	"premium";"homely";"likeable";"ugliest";"grandiose";"stormy";"swift";"cautious";"dirty";"tense";"highfalutin";"standing";"misty";"acoustic";"agonizing";"goofy";"tasteful";"breakable";"loving";
	"accurate";"crabby";"best";"ignorant";"harmonious";"uncovered";"hurt";"icy";"curly";"angry";"gaping";"earsplitting";"whimsical";"assorted";"lowly";"skillful";"gabby";"massive";"unruly";"thundering";
	"nonchalant";"efficacious";"gullible";"deeply";"unnatural";"robust";"productive";"succinct";"actually";"innocent";"daily";"hulking";"eatable";"gamy";"ritzy";"sloppy";"melted";"fair";"wicked";
	"woozy";"available";"calculating";"ancient";"ad hoc";"sleepy";"annoyed";"unaccountable";"slow";"erect";"adamant";"complex";"curved";"flagrant";"distinct";"closed";"melodic";"white";"natural";
	"hushed";"ceaseless";"teeny";"neighborly";"upbeat";"spectacular";"workable";"ashamed";"wooden";"belligerent";"real";"bewildered";"round";"bent";"brief";"secretive";"terrible";"abiding";"agreeable";
	"sedate";"obeisant";"beneficial";"psychedelic";"fallacious";"curious";"changeable";"bloody";"jazzy";"tame";"careful";"cuddly";"hungry";"charming";"versed";"scintillating";"toothsome";"grotesque";
	"dynamic";"knowledgeable";"four";"silent";"confused";"watery";"lavish";"magnificent";"scarce";"shiny";"maddening";"shut";"meaty";"obtainable";"first";"vulgar";"sincere";"teeny-tiny";"troubled";
	"zesty";"sable";"mean";"telling";"organic";"muddled";"momentous";"apathetic";"complete";"friendly";"imaginary";"slimy";"incredible";"steadfast";"absurd";"glistening";"violet";"nappy";"damaging";
	"cold";"gifted";"encouraging";"miniature";"victorious";"lyrical";"illegal";"wealthy";"moaning";"satisfying";"gainful";"tedious";"curvy";"plausible";"onerous";"wary";"fine";"trashy";"light";"important";
	"striped";"giant";"weak";"hot";"receptive";"conscious";"lovely";"kindhearted";"obscene";"brash";"clean";"ajar";"high-pitched";"inconclusive";"vast";"voiceless";"rural";"pumped";"alluring";"nondescript";
	"obese";"awful";"stimulating";"chemical";"six";"heavy";"puffy";"cloudy";"efficient";"classy";"ruthless";"mushy";"long";"horrible";"abounding";"grieving";"fuzzy";"coherent";"difficult";"tiny";"kind";
	"married";"fast";"venomous";"frightened";"capricious";"uppity";"forgetful";"inexpensive";"waggish";"unequal";"marvelous";"chief";"aromatic";"enchanted";"same";"itchy";"superb";"quirky";
	"scandalous";"sparkling";"gentle";"torpid";"aspiring";"male";"null";"detailed";"dashing";"abandoned";"nebulous";"wet";"obedient";"parallel";"automatic";"pink";"even";"awake";"savory";
	"pleasant";"bizarre";"healthy";"few";"fat";"awesome";"ill-fated";"lonely";"languid";"evasive";"resolute";"gruesome";"doubtful";"nine";"hellish";"uttermost";"protective";"knowing";"accidental";
	"magical";"ablaze";"earthy";"smooth";"paltry";"like";"oafish";"vengeful";"cumbersome";"freezing";"stale";"stupendous";"flowery";"nostalgic";"near";"green";"alert";"chubby";"big";"cheerful";
}
defcon.Phrases4 			= {
	"nigs";"But I can hear those gunships say,";"They'll be no Chieu Hois today,";"Vote for net neutrality";"Lives in a pineapple under the sea";"in distress, feeling stressed ";
	"reassuring ";"the stairs are a hassle ";"i feel unable ";"a shepherd's scale ";"where the notes are played with sounds of yelling ";"at the rain ";"and i will grow";"MAP11 has two names";
	"Omnipotent";"Gasp";"...";"Bees, bees, bees, bees";"Jag känner en bot";"Haha, LOL";"Menger sponge";"idspispopd";"fat taco";"but the day could be dark ";"and the day could be bleak ";
	"but i'll have done it all ";"i have done it all";"Eple (original edit)";"So fresh, so clean";"Today is gonna be the day";"[LOOC] Orin McCallister: too laggy, johnny";
	"That I'll give the country back to you";"By now you should've somehow";"Realized that is not quite true.";"I don't believe that anybody";"Really has a clue what I'll do now...";
	"Deadbeats, there's murder in the streets";"[6:20 PM] JohnnyCheesedog: Cal is actually the worst person I have had the mispleasure of meeting through the community";
	"i'm getting stoned";"9:44 PM] JohnnyCheesedog: bend over";"road man";"ganja faggot fucking kill yourself";"And our borders are a broken spout.";"And I'm sure you've heard it all before";
	"But you seem to like it when I shout.";"I don't believe that anybody can divide the USA";"Like I can now...";"In all the rust belt states I was crushin'";
	"Although my whole campaign was run by Russians.";"There are many brown people";"I would like to send to jail,";"But I don't know how...";"So Steve Bannon,";
	"Why won't you tell me what your plannin'?";"But after all-";"Just want my border wall...";"Slow acting portals";"Don't look directly at the bugs";"Finally without NIGGERS";
	"don't let light make you blind to how things look ";"don't let dark make you ignorant to what it took ";"to come this far and open up to you";
	"aight im fucking tired of making shitty messages that no one will see";"give us net neutrality ok";"ajit pai is a nigger boy";"the internet is a scary place";
	"johnny is a massive dicklicking queerbag";"over 6267 hits on pastebin";"incompatable";"retarded";"braindead";"dick-lickin' good";"welcome back mister freeman";"Scary";"Twittered about";
	"Jump up, jump up, and get down";"sheo is neat";"can't be like this forever ";"turn off all the lights ";"my heartbeat fills the night ";"pacemaker keep me steady ";
	"keeping me at the ready";"let's break out of this";"a riddle, wrapped in a mystery";"Huge tracts of land";"Welcome to your Doom";"Stay a while, stay forever";
	"Stay a while and listen";"Treatment for your rash";"look at all the things ";"i packed away to make a space ";"that i could play and laugh and love ";"and live in ";
	"'look at all the things'";"you said to me as i faded away ";"from everyone and everything ";"that had been ";"you took away my parachute ";"and told me to fall ";
	"i jumped and felt the air ";"rip through me as i stared ";"at the ground";"when i'm gone will my drive live on ";"i'd like to think when i'm gone ";"my drive will burn on";
	"'Autological' is";"Information wants to be free";"Almost never' is an interesting concept";"OK.";"This is the most radical way to kill yourself that I can think of.";
	"Go to Ferrari dealership and rent a car there.";"After you have that, you need to get a cinder block, and guns that shoot blanks.";"Take your Ferrari, go to Vegas.";
	"Drive by nearest police station and shoot your guns and just act like a fucking lunatic.";"Then floor it, nigger.";"The police chase will ensue and you need to lead them to a desert.";
	"If you did it right, this should be covered by local news networks, possibly national ones.";"In either case, you should be on TV (on account of the helicopters streaming your shenanigans)";
	"Now, the magic begins.";"Oh, yeah, you need rope and a parachute.";"So, drop the cinder block on the gas pedal and release the parachute.";"drawing is more fun than killing spergs";
	"Be sure you have rope attached to your neck in such a way that the jerk will snap your neck while you are sailing from the car.";"The parachute needs to have a visible Ron Paul 2020 logo.";
	"+10 points if you set yourself on fire while doing this.";"+10 points if you do it wearing a crotchless fursuit";"Lots of truthiness";"The nigger is a baffoon";"Turing complete";
	"It's groundbreaking";"Let our battles begin";"The sky is the limit";"Casul gayming";"internal references";"vietnam";"ddos";"niggers";"dicks";"faggot";"faggots";"faggotz";"sperg";
	"spergs";"spergz";"spergnig";"nignog";"cock";"dick";"penis";"pen0r";"myg0t";"nigga";"owned";"ownzone";"dab";"weed";"bong";"bongs";"bongz";"bonghit";"big ddos";"dogshit";"horseshit";"catshit";
	"batshit";"shit";"fuck";"cunt";"piss";"wu-tang";"method man";"RZA";"GZA";"JIZZA";"RIZZA";"mbam";"malwarebytes";"antivurus";"malware";"anti-malware";"birus";"virus";"cryptolocker";"meme";"lie";
	"cocks";"penises";"sheo";"iced";"miro";"louisiana";"galil";"richard";"dennis";"ww2";"world war 2";"ww1 ";"world war 1";"black";"white";"obama";"trump";"hillary";"democrat";"republican";
	"federalist";"PC";"PCs";"pyrolodicklowick";"serbia";"bosnia";"poland";"germany";"russia";"america";"mexico";"spic";"spicboy";"flyboy";"fuccboi";"ironic";"dennis";"meme";"lewis gun";"pizza";
	"pasta";"pepperoni";"salami";"cheese";"nutshack";"nutsack";"balls";"ballz";"smoke weed";"SWED";"swag";"yolo";"autism";"downs";"aspergers";"spergers";"frogsnacks";"cummies";"memes";"pepe";
	"datboi";"downie";"brownies";"4chan";"reddit";"dropbox";"google";"gaygle";"sick";"sikh";"allah";"allahu akbar";"akbar";"richard";"inspektah dek";"loner";"boner";"boners";"farts";"fag";
	"fartz";"Undefeated";"Kinda like Lemmings";"Follow the train, CJ";"Leveraging synergy";"This message will never appear on the hack menu, isn't that weird?";"Read more books";
	"Khaaaaaaaaan";"Less addictive than TV Tropes";"More addictive than lemonade";"I want to die";"Bigger than a bread box";"Millions of peaches";"Fnord";"This is my true form";
	"Totally forgot about Dre";"Don't bother with the clones";"Nobody ever expects to end up here.";"Not like this.";"But no matter how well planned out you think your life is.";
	"That all could change.";"Just like that.";"Everything went silent.";"I couldn't even hear myself breathe.";"I thought to myself:";"This must be it.";
	"I waited for some, I dunno, bright light.";"Maybe something to come take me somewhere.";"Anything.";"7 years later,";"I'd choose an eternety in hell over this.";"There's a man";
	"Sitting in an old wooden rocking chair";"He's got a white button-up shirt";"Black vest,";"Black slacks,";"Shiny black shoes,";"fit it in where you can";
	"OH YEAH?! WELL AT LEAST I DON'T SPEND MY TIME SUCKING DICKS IN THE BATHROOM";"AT OLIVE GARDEN, YOU DIRTY ROTTEN LOWDOWN SLIMY FILTHY";"lizards? with tits?";
	"DISGUSTING GLUTTONOUS HOGLIKE MOTHER FUCKING COCK SUCKING";"SON OF AN INCESTUOUS PEDOPHILE SHEMALE RAPIST PROSTITUTE GET YOUR MOM'S DICK OUT";
	"OF YOUR MOUTH. DO YOU KNOW WHAT I'M GONNA DO? I'M GONNA SHIT UP YOUR ASS";"STOP FOR A MOMENT AND REALLY GRASP THAT STATEMENT";"nigger hole";"poo poo pee pee";
	"I AM LITERALLY GOING TO SHIT UP YOUR ASS I WILL TAKE MY PANTS OFF, RIP YOUR PANTS OFF, OUR SPHINCTERS WILL TOUCH";"johnny sleazedog sez bend over";
	"AND I WILL SHIT. YOU WILL TRY TO COUNTERSHIT, BUT MY SPHINCTER WILL OVERCOME, AND I WILL PUSH A LOG OF SHIT";"fitting it in where we can";
	"FROM MY ASS UP AND INTO YOUR BODY. THIS IS WHAT SHALL OCCUR. YOU KNOW WHAT ELSE? I WILL PISS IN A POT";"mad dongs";"distinguished master retard";
	"I WILL ADD CORNSTARCH TO THE PISS AND BOIL IT UNTIL IT GETS REALLY THICK, LIKE SAUCE";"dick sauce";"kazerad raped me and i liked it";
	"I WILL POUR THE THICKENED PISS INTO A PLASTIC CONTAINER AND PUT IT IN THE FRIDGE UNTIL IT HARDENS INTO A FIRM JELLO";"fire distinguisher";
	"I WILL THEN CUT IT INTO RECTANGLES, BATTER IT IN A MIX OF MILK, FLOUR, AND EGGS, AND DEEP FRY IT AT 375 UNTIL GOLDEN BROWN,";"FLIPPING ONCE SINCE THEY FLOAT";
	"AND I WILL SERVE YOU MY DEEP FRIED PISS";"A timepiece hanging out of his pocket.";"He smokes an old wooden oak pipe.";"In his left eye he has the universe.";
	"And in his right eye, he has the devil.";"He's been there since the beginning of time.";"When he first sat down and lit the tobacco in his pipe, it sparked.";
	"In his left eye, the universe was created.";"He didn't want that universe to be silent, so he made music.";"And that created his right eye.";"He sits there, and rocks back and forth";
	"In his rocking chair.";"If he were to stop,";"Life as we know it would stop.";"No rotating planets.";"No burning stars.";"I pray to him every night.";"Don't stop rocking.";
	"See, my body died right there on the spot.";"Right with the blast.";"But my mind stayed awake.";"And I'm forced to see and hear everyone living a life around me I once had.";
	"Now";"I'm just wishing they'd pull that fucking plug already.";"Just so I could see what's next.";"But the point of all this?";"You'd never think it could happen to you.";
	"Pumpkinhead";"Hobo humping slobo babe";"Feature packed";"Conventional";"Homeomorphic to a 3-sphere";"Doesn't avoid double negatives";"Meeting expectations";
	"lives in cambodia";"Take my Wojack, take my Rand";"Take me where I cannot stand";"I don't care, I'm still free";"You can't take Pepe from me.";"Take me out to the BLACKED";
	"Tell them I ain't comin' back";"Burn the tendies and boil the pee";"Leave the memes where they lay";"Normies'll never see another day";"Lost my soul, lost my dream,";
	"I feel the Chan reaching out";"I hear its song without a doubt";"I still hear and I still pee-pee";"Lost my love, lost my land";"Lost the last place I could stand";
	"There's no place I can be";"Since I've found obscenity";"PC gaming since 1873";"Ghoughpteighbteau tchoghs";"GET GUD AT MINGING U NIGGER";"NEXUS NOT FOUND";"ADMIN SPOTTED";"/plyban ^ 0";
	"everyone type in chat caliber is a stupid nigger";"caliber .50 BMG";"andy.b choked on niggermenu";"Déjà vu";"Déjà vu";"Got your nose";"Haley loves Elan";"fuck you microsoft";
	"Afraid of the big, black bat";"Doesn't use stonel code";"Child's play";"See you next Friday or so";"fuck formatting";"From the streets of Södermalm";"150 bpm for 400000 minutes";"Technologic";
	"Funk soul brother";"Pumpa kungen";"????—!";"?? ?????";"Helo Cymru";"Czesc Polsko";"????!";"?????? ??????";"???? ??? ??????";"My life for Aiur";"I see your vocabulary has improved";
	"Africoon ";"Afro-Anthropoid ";"Afroid ";"Afropoid";"Americoon ";"Baboon ";"Bangkok Nigger";"Black (as in 'payback black!') ";"Black Ass ";"Black Hole (Ho) ";"Black Tiger Bait ";"Blackamoor ";
	"Blackie ";"Blacky ";"Blood (or Crip) ";"Blubber Lips";"Blue Gum ";"Blue lip  -s  (as in 'blue lipped little chimp') ";"Bone nose ";"Bongoid ";"Bootlips (Bootlipped turd) ";"Boy ";
	"Brillohead ";"Bro-Hammer (As in Cadillac 'Brougham') ";"Browny ";"Bubba (or Bubba Brown) ";"Buck (male) ";"Burrhead ";"Buttnugget ";"Chimp ";"Congoid ";"Coon ";"Cotton picker ";"Crackhead ";
	"Crumb-snatcher (nigglet) ";"Crip (or Blood) ";"DAFN ";"Dark Waste of Space ";"Darkie (or Darky) ";"Defendant ";"Doo-Doo Brown (Mr.) ";"Eggplant ";"Ethiop ";"Fecal critter ";"Fuckwit ";
	"Golly wog ";"Gorilla ";"Groid ";"Gutter monkey ";"High Yella (light-skinned negro) ";"Ho (female) ";"Homo-simian";"Hood Rat ";"Inmate ";"Jig ";"Jigga ";"Jiggaboo (or Jigaboo) ";"Jigroid ";
	"Jungle bunny";"Kaffir ";"Knuckle dragger ";"Koko ";"L.O.O.T.er ";"Liver lip ";"Liverlips ";"LOOTer ";"Majete/pinche majete (Sp.) ";"Mau-Mau ";"Melanzana (la) (=Eggplant) (It.) ";
	"Mestizo (bastard) ";"Midnight at noon ";"Mississippi wind chime";"Monkey ";"Moolie -s  (Am. & It.) ";"Moon cricket ";"Moose lips ";"Morgue Dog ";"Moving target ";"Mud People ";"Mud Puppy ";
	"Mud Shark ";"Negro ";"Negroid ";"Nig ";"Nigger ";"NiggerRican ";"Nigglet (rug rat)";"niggROIDS";"Nignog ";"Nog ";"O.J. ";"Obsolete Farming Equipment ";"Octoroon (One-eighth nigger)";
	"Pickaninny ";"Piece of shit ";"Porch Monkey ";"Potato nose ";"Quadroon (One-quarter nigger)";"R.N. (Resident Nigger) ";"Raggamuppet ";"Redbone (light-skinned negro) ";"Rubber lips";
	"Sambo ";"Saucer lip ";"Savage ";"Semi-simian ";"Serf (Shit Serf) ";"Shine ";"Shitlips ";"Shitskin (or Shit Skin) ";"Shitter ";"Shvartz -(g)er (=Black) (Jidd.) ";"Slave (runaway slave)";
	"Snow Ball ";"Snow Queen (light-skinned negro) ";"Spade ";"Spear chucker ";"Splib ";"Spook ";"Spoonbill ";"Strange Fruit ";"Sub-ape ";"Suboid  (a contraction of 'sub-human negroid')";
	"Subhuman ";"Suspect ";"Tar baby (very dark-skinned negro) ";"Thicktongue ";"Thief ";"Tree ornament ";"Turd ";"Turd Cricket ";"Turd gobbler ";"Turd-worlders";"Tyrone ";"Uncle Tom ";
	"Velcro Head ";"Webster ";"Welfare queen ";"Welfare rat (male) ";"Welfare slut (female) ";"Wetsuit ";"Wog -s ";"Worthless ";"Yard Ape ";"Zulu";"Who put it there?";"You can't explain that";
	"if not ok then return end";"§1C§2o§3l§4o§5r§6m§7a§8t§9i§ac";"§kFUNKY LOL";"Big Pointy Teeth";"Bekarton guards the gate";"Mmmph, mmph";"Don't feed avocados to parrots";"Swords for everyone";
	".party()";"Pretty scary";"I have a suggestion.";"Now with extra hugs";"Now Lua 6";"Woah.";"HURNERJSGER?";"What's up, Doc?";"Now contains 6 million random daily kikes!";"That's Niggerwang";
	"join this server right now u niggers";"Put a little fence around it";"Throw a blanket over it";"Now with additional stuff";"Extra things";"niggaz in da hood";"So sweet";"Popping tags";
	"Very influential in its circle";"Now with extra yeet";"Rise from your grave";"Warning A huge battleship is approaching fast!";"Blue warrior shot the food";"Run, coward I hunger";
	"Flavor with no seasoning";"Strange, but not a stranger";"Tougher than diamonds, rich like cream";"Getting ready to show";"Getting ready to know";"i'm happy with it.";"Getting ready to drop";
	"Getting ready to suck";"Getting ready to freak";"Getting ready to speak";"It swings, it jives";"Cruising streets for gold";"Take an eggbeater and beat it against a skillet";
	"Make me a table, a funky table";"Take the elevator to the mezzanine";"Stop being reasonable, this is the Internet";"/giveweapon m9k_1911a1 1";"This is good for Realms.";"now with memeware";
	"fuck all y'all";"cocaine is bad for u";"school is gay";"Any computer is a laptop if you're brave enough";"Do it all, everything";"Where there is not light, there can spider";
	"GNU Terry Pratchett";"More Digital";"batteries not included";"doot doot";"Falling with style";"There's no stopping the nutmegg";"Throw yourself at the ground and miss";
	"Rule #1: it's never my fault";"Replaced molten cheese with blood?";"Absolutely fixed relatively broken coordinates";"Boats FTW";"gay edition";"REALLY gay edition";"You're going too fast";
	"made without parential permission";"lapfuckstrax";"tried, tested, not approved.";"aspie collective";"a product of its time";"their they're and there";"endless streams of shit";
	"new! old! terrible!";"i make music now";"this is my life now";"i'm ok with this";"u know wwhat this is prob the last version, i dont have anything new to add";"shoutout to johnny nutmegg";
	"etxraneous bullshit";"inflated filesize";"cancer";"69";"666";"1cup";"2girls";"2girls1cup";"4r5e";"5h1t";"abortion";"ahole";"aids";"anal";"anal sex";"analsex";"angrydragon";"angrydragons";
	"angrypenguin";"angrypenguins";"angrypirate";"angrypirates";"anus";"apeshit";"ar5e";"arrse";"arse";"arsehole";"artard";"feature complete";"i need fucking ideas";
	"askhole";"ass";"ass 2 ass";"ass hole";"ass kisser";"ass licker";"ass lover";"ass man";"ass master";"ass pirate";"ass rapage";"ass rape";"ass raper";"ass to ass";"ass wipe";"assbag";
	"assbandit";"assbanger";"assberger";"assburger";"assclown";"asscock";"asses";"assface";"assfuck";"assfucker";"assfukker";"asshat";"asshead";"asshole";"asshopper";"assjacker";"asslicker";
	"assmunch";"asswhole";"asswipe";"aunt flo";"b000bs";"b00bs";"b17ch";"b1tch";"bag";"ballbag";"ballsack";"bampot";"bang";"bastard";"basterd";"bastich";"bean count";"beaner";"beastial";
	"beastiality";"beat it";"beat off";"beaver";"beavers";"beeyotch";"betch";"beyotch";"bfe";"bi sexual";"bi sexuals";"biatch";"bigmuffpi";"biotch";"bisexual";"bisexuality";"bisexuals";"bitch";
	"bitched";"bitches";"bitchin";"bitching";"bizatch";"blackie";"blackies";"block";"bloody hell";"blow";"blow job";"blow wad";"blowjob";"oy vey";"boff";"boffing";"boffs";"boink";"boinking";
	"boinks";"boiolas";"bollick";"bollock";"bondage";"boner";"boners";"bong";"boob";"boobies";"boobs";"booty";"boy2boy";"boy4boy";"boyforboy";"boyonboy";"boys2boys";"boys4boys";"boysforboys";
	"boysonboys";"boytoboy";"brothel";"brothels";"brotherfucker";"buceta";"bugger";"bugger ";"buggered";"buggery";"bukake";"bullshit";"bumblefuck";"bumfuck";"bung";"bunghole";"bush";"bushpig";
	"but";"but plug";"butplug";"butsecks";"butsekks";"butseks";"butsex";"butt";"buttfuck";"buttfucka";"buttfucker";"butthole";"buttmuch";"buttmunch";"buttplug";"buttsecks";"buttsekks";
	"buttseks";"buttsex";"buttweed";"c0ck";"c0cksucker";"cabron";"canabis";"cannabis";"carpet muncher";"chank";"cheesedick";"chinc";"chink";"chinks";"choad";"choads";"chode";"cipa";"circlejerk";
	"circlejerks";"cleavelandsteemer";"cock";"cock block";"cock suck";"cockblock";"cockface";"the offocial cheat of madbluntz.rs";"cockfucker";"cockfucklutated";"cockhead";"cockmaster";"cockmunch";
	"cockmuncher";"cockpenis";"cockring";"cocks";"cocksuck";"cocksucker";"cocksuka";"cocksukka";"cok";"cokmuncher";"coksucka";"comestain";"condom";"condoms";"coochie";"coon";"coons";"shit";
	"shitdick";"shite";"shited";"shitey";"woggy";"wogs";"woof";"wop";"xx";"xxx";"yank";"yayo";"yeat";"yeet";"yeyo";"yiff";"yiffy";"yola";"yols";"yoni";"youaregay";"yourgay";"zipperhead";
	"zipperheads";"zorch";"die";"aimbot key is F";"oh fuck off";"try exanima";"jerkcity.com - since 1998";"CUT OFF MY DONG AND STUFF IT IN MY MOUTH,"; "THEN CHOP OFF MY HEAD AND STUFF THAT IN MY REAR";
	"SO VIA THE TRANSITIVE PROPERTY I CAN FUCK MYSELF IN THE ASS";
}
defcon.Phrasesall 			= {	--i put the tables in a table so it randomly selects a table then randomly selects from that table.  table nesting, ez.
	defcon.Phrases;		
	defcon.Phrases3;		
	defcon.Phrases4;		
}
defcon.Phrases2 			= { --dead messages
	"got fucked";"got shit on";"died";"died AGAIN";"didn't get another one";"played cs:go and gmod at the same time";"idled the game for 3000 hrs to get admin on a gay server";"got holocausted";
	"ate shit";"tried to fly a potato";"dug too deep";"got RDM'd";"tried to drink molten stone";"got owned";"ate that dirt";"fought the law (and the law won)";"was slain";
	"tried to do hvh with an aimware user";"downloaded memeware";"deleted system32";"got mad";"kicked the bucket";"downloaded malware";"got spawncamped to death";"unsubscribed from dramaalert";
	"went to hell";"did not pass go";"died in a cage";"got stuck in a trap";"tried to have sex with a trap";"tripped on a dick";"is pretty fucking dead now";"did not collect 200 dollars";
	"forgot how to stop, drop, and roll";"went to detroit at night";"got smashed";"got their fucking brains blown out";"became one with the ground";"got gangbanged";"literally ate shit";
	"listened to a kanye west album";"fucked a cat";"got their dick bitten off by spets";"tried to erp with spets";"broke their spine";"broke their dick";"sucked a golf ball through a garden hose";
	"tried to exercise their free speech rights on an HL2RP server";"broke shitcheat again";"used reddit";"was savagely murdered";"got crusaded";"converted to islam";"burned the qur'an";
	"ate pork";"contracted wrongthink";"used a meme";"didn't read the preface to shitcheat before using it";"couldn't remember how to spell 'nigger'";"charswapped then got banned";
	"got bent over a table and fucked in the ass";"got b&";"fuckin died LMAO";"is dead, long live the king!";"gave bad succ";"unjammed an open-bolt weapon";"brought snixzz3 to a gmod hvh";
	"tried to use the carthus curved sword in a fight club";"unfinished string lol";"is dead lol";"broke their cheat again";"used a cheat that wasn't shitcheat";"contracted autism";
	"didn't praise johnny nutmegg";"listened to nightcore(which isn't music)";"drank spoiled milk";"forgot who renard was";"forgot themselves";"turned to mist and wondered why";
	"got steamrolled into the dirt";"watched an amy schumer comedy special";"told everyone they were a furry";"voted for hillary clinton";"supported communism";
	"didn't understand what 'democratic socialism' meant";"jumped off of a bridge";"moved to the UK";"moved to canada";"got their free speech revoked";"got deported";"dropped the soap";
	"got boned";"got permbanned by spets";"tried to break into rcon";"drowned";"got struck by lightening";"was detected by CAC";"sat on a dick";"got raped anally";"followed bob good";
	"tried to ERP with sheo";"didn't let someone react to their /me";"got blamed for mingery";"has used /Me cum";"took a long walk off a short bridge";"choked on cum";
	"has used /Me punc";"has used /plyban me 0";"stole rations";"posted their IP on raidforums";"got their dome cracked";"cracked their dome";"smoked bad weed";"choked on niggermenu";
	"dedicated his whole life to hl2rp";"tried to install gentoo";"got doused with napalm";"drank some nape";"used omegle";"uninstalled their antivirus";"got ganked by gooks";
	"realized they were a furry";"visited nebulous";"didn't subscribe to madbluntz";"used snixzz3";"fell to their death";"played a fenoxo game";"ate shit and died";"voted lefty";"broke their ass";
	"lived to death";"died to death";"tried to run from a cheater";"double-crossed a madbluntz officer";"told caliber to suck their dick";"used double quotes in a lua table";"turned off aimbot";
	"didn't update the version number";"got not alive'd really hard";"shot themselves";"played dark souls";"added more lines FUCKING SHIT";"got suffocated by a bullet";
	"came";"got caught by their parents jerking off to gay porn";"didn't wait until they were 18 to play an M rated game";"drank and drove";"got high in a police station";
	"forgot what a trash scallop was";"tried to play dark souls";"got facestabbed";"ended up in a million pieces";"tried to 1v1 an estoc user";"almost didn't die";"fucked themselves";
	"forgot to turn on email notifs for picarto";"deleted their password";"got their head split";"openly supported communism";"didn't go to school on time";"forgot their dad's birthday";
	"watched spic and shorty";"tried to leave the shitty shack";"forgot about mack";"emptied their steam wallet";"got mugged to DEATH";"was born in CHINA";"died wtf???????";
	"got stabbed to death just like john snow";"had a video game spoilt for them";"lost their dad just like tatsur0";"didn't believe in free speech";"sent hate mail to an ip logger pop3 server";
	"sent angry letters to MY fucking house";"somehow didn't see the giant flashing letters that say 'DO NOT ENTER'";"wrote a line too long for Lua";"tried to work with Microsoft";
	"got their soul sucked out";"wasted time not updating shitcheat";"forgot how to draw";"died of death and blood";"didn't get to school on time";
}
defcon.Keys = { --only reference, no practical use other than autofill in np++
"KEY_0", "KEY_1", "KEY_2", "KEY_3", "KEY_4", "KEY_5",
"KEY_6", "KEY_7", "KEY_8", "KEY_9", "KEY_A", "KEY_B", "KEY_C",
"KEY_D", "KEY_E", "KEY_F", "KEY_G", "KEY_H", "KEY_I", "KEY_J",
"KEY_K", "KEY_L", "KEY_M", "KEY_N", "KEY_O", "KEY_P", "KEY_Q",
"KEY_R", "KEY_S", "KEY_T", "KEY_U", "KEY_V", "KEY_W", "KEY_X",
"KEY_Y", "KEY_Z", "KEY_PAD_0", "KEY_PAD_1", "KEY_PAD_2", "KEY_PAD_3",
"KEY_PAD_4", "KEY_PAD_5", "KEY_PAD_6", "KEY_PAD_7", "KEY_PAD_8", "KEY_PAD_9",
"KEY_PAD_DIVIDE", "KEY_PAD_MULTIPLY", "KEY_PAD_MINUS", "KEY_PAD_PLUS", "KEY_PAD_ENTER",
"KEY_PAD_DECIMAL", "KEY_LBRACKET", "KEY_RBRACKET", "KEY_SEMICOLON", "KEY_APOSTROPHE",
"KEY_BACKQUOTE", "KEY_COMMA", "KEY_PERIOD", "KEY_SLASH", "KEY_BACKSLASH", "KEY_MINUS",
"KEY_EQUAL", "KEY_ENTER", "KEY_SPACE", "KEY_BACKSPACE", "KEY_TAB", "KEY_CAPSLOCK",
"KEY_NUMLOCK", "KEY_ESCAPE", "KEY_SCROLLLOCK", "KEY_INSERT", "KEY_DELETE", "KEY_HOME",
"KEY_END", "KEY_PAGEUP", "KEY_PAGEDOWN", "KEY_BREAK", "KEY_LSHIFT", "KEY_RSHIFT",
"KEY_LALT", "KEY_RALT", "KEY_LCONTROL", "KEY_RCONTROL", "KEY_LWIN", "KEY_RWIN",
"KEY_APP", "KEY_UP", "KEY_LEFT", "KEY_DOWN", "KEY_RIGHT", "KEY_F1", "KEY_F2",
"KEY_F3", "KEY_F4", "KEY_F5", "KEY_F6", "KEY_F7", "KEY_F8", "KEY_F9",
"KEY_F10", "KEY_F11", "KEY_F12", "KEY_CAPSLOCKTOGGLE", "KEY_NUMLOCKTOGGLE",
"KEY_SCROLLLOCKTOGGLE"
};

--checks if whoever the script calls on is you or not, and if they're targetable

local function SafeCheck(v)
	if v ~=LocalPlayer() and v:IsValid() and v:GetActiveWeapon():IsValid() then
		return true
	else
		return false
	end
end

for k,v in pairs(defcon.Normal) do
	if defcon.Settings[k] == nil then
		defcon.Settings = defcon.Normal
		--resets all the settings in case something fucks up or a setting is invalid (this means don't fucking modify the settings file nigger)
	end
end

--updates the keys and shit, not the client.

function defcon.Update(x,y,z, ok)
	if x == "setting" then
		defcon.Settings[y] = z
		if ok == true then
			file.Write("d_settings.txt", util.TableToJSON(defcon.Settings))
		end
	elseif x == "entity" then
		file.Write("d_entities.txt", util.TableToJSON(defcon.Entities))
	elseif x == "friend" then
		file.Write("d_whitelist.txt", util.TableToJSON(defcon.Whitelist))
	end
end

--basically just safecheck but only for the player and dead people

function defcon.ESPCheck(typ, v)
	if typ == "player" then
		if v ~= LocalPlayer() /*&& /*LocalPlayer():Alive() &&*/ /*LocalPlayer():Team() ~= TEAM_SPECTATOR*/ then
			return true
		end
	elseif typ == "entity" then
		if IsValid(v) then
			return true
		end
	end
	return false
end

--removed the slider, but the esp shat out errors if i deleted this part

function defcon.ESPDistance(typ, v)
	if typ == "player" then
		if defcon.Settings["esp_player_dist"] >= 16000 then
			return true
		elseif v:GetPos():Distance(LocalPlayer():GetPos()) < (defcon.Settings["esp_player_dist"]) then
			return true
		end
	elseif typ == "entity" then
		if defcon.Settings["esp_entity_dist"] >= 16000 then
			return true
		elseif v:GetPos():Distance(LocalPlayer():GetPos()) < (defcon.Settings["esp_entity_dist"]) then
			return true
		end
	end
	return false
end

--norecoil script, probably doesn't work

hook.Add("Think", "NoCoil", function()
	if LocalPlayer() and LocalPlayer():GetActiveWeapon() and LocalPlayer():GetActiveWeapon().Primary and defcon.Settings["aimbot"] then
		LocalPlayer():GetActiveWeapon().Primary.Recoil = 0
	end
end )

--checks where people are looking

function defcon.GetShootPos(ent)
	local eyes = ent:LookupAttachment("eyes");
	if(eyes ~= 0) then
		eyes = ent:GetAttachment(eyes);
		if(eyes and eyes.Pos) then
			return eyes.Pos, eyes.Ang;
		end
	end
end

--ingame friends list shit

defcon.Friends = defcon.Friends or {}
defcon.Friends2 = defcon.Friends2 or {}
function defcon.RefreshFriends()
	for k, v in pairs(player.GetAll()) do
		if v:GetFriendStatus() == "friend" then defcon.AddFriend( v ) end
	end
end
concommand.Add("refreshfriends", defcon.RefreshFriends)
timer.Create( "keepfriendsupdated", 10, 0, defcon.RefreshFriends )
function defcon.AddFriend( ply )
	if !ply:IsValid() then return end
	if table.HasValue( defcon.Friends, ply ) then return end
	table.insert( defcon.Friends, ply )
	notification.AddLegacy("Added "..ply:Nick().." to your friends list", NOTIFY_HINT, 5)
	print ( "[Shitcheat] Added "..ply:Nick().." to your friends list")
end
function defcon.DelFriend( ply )
	if !ply:IsValid() then return end
	if !table.HasValue( defcon.Friends, ply ) then return end
	table.RemoveByValue( defcon.Friends, v )
	notification.AddLegacy("Removed "..v:Nick().." from your friends list", NOTIFY_HINT, 5)
	print ( "[Shitcheat] Removed "..v:Nick().." from your friends list")
	defcon.Update("friend")
end
function defcon.IsFriend( ply )
	if !ply or !ply:IsValid() then return false end
	return table.HasValue( defcon.Friends, ply )
end
function defcon.Whitelisted(ent)
	if defcon.IsFriend or table.HasValue( defcon.Friends, ply ) then return true
	else return false end
end
hook.Add( "player_spawn", "addsteamfriends", function( data )
	local id = data.userid
	local ply =  player.GetByID( id )
	if !ply:IsValid() then return end
	if ply:GetFriendStatus() == "friend" and !table.HasValue( defcon.Friends, ply ) then
		defcon.AddFriend( ply )
	end
end )

--vischeck, used for the aimbot

function defcon.Visible(ent)
	local pos = LocalPlayer():GetShootPos()
	local ang = LocalPlayer():GetAimVector()
	local trace = {start = LocalPlayer():GetShootPos(), endpos = defcon.GetShootPos(ent), filter = {LocalPlayer(), ent}, mask = 1174421507};
	local tr = util.TraceLine(trace);
	return(tr.Fraction == 1);
end

--makes it so you don't shoot friends and noclippers and shit

function defcon.NewAimbotVars(v)
	if !defcon.Settings["shootsteamfriends"] and defcon.IsFriend(v) then return false end
	if !defcon.Settings["targetnoclippers"] and v:GetMoveType() == MOVETYPE_NOCLIP or v:GetMoveType() == MOVETYPE_OBSERVER then return false end
	return true
end

--old aimbot check, will probably remove later

function defcon.CanTarget(v)
	if v:IsPlayer() then
		if (defcon.Visible(v) and v:Alive() and (v:Health() > 0) and v:Team() ~= TEAM_SPECTATOR and v:GetMoveType() ~= MOVETYPE_NOCLIP) then
			if (v ~= LocalPlayer() and LocalPlayer():Alive() and LocalPlayer():Team() ~= TEAM_SPECTATOR) then
				if not(defcon.Settings["aimbot_friendly_fire"]) then
					if (v:Team() ~= LocalPlayer():Team()) then
						return true
					end
				else
					return true
				end
			end
		end
	end
	return false
end

--used in the menu, lists all entities so you can add shit

function defcon.Ents()
	local t = {}
	for k,v in pairs(ents.GetAll()) do
		if IsValid(v) and not(table.HasValue(t, v:GetClass())) then
			table.insert(t, v:GetClass())
		end
	end
	table.sort(t, function(a,b) return a < b end)
	return t
end
 
--fonts

surface.CreateFont("deffont", { --big fuckoff text at the top of each menu
	font	=	"News Gothic MT",
	extended = false,
	weight = 900,
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
	size	=	64
});

surface.CreateFont("deffontesp1", { --esp text
	font="Tahoma", 
	size=15, 
	weight=700,
	antialias = false,
});
surface.CreateFont("deffontesp2", { --also esp text
	font="Tahoma",
	size=13,
	weight=0,
	antialias = false,
});
surface.CreateFont("deffontesp3", { --item esp text
	font="Tahoma",
	size=13,
	weight=0,
	antialias = false,
});
surface.CreateFont("fuck", { --used for the label shit
 size = 13,
 weight = 0,
 antialias = false,
 font = "Tahoma"
});
surface.CreateFont("warnign", { --used in the freecam menu once
 size = 18,
 weight = 1000,
 antialias = true,
 outline = false,
 font = "times new roman"
});
surface.CreateFont("trike", { --pretty much everything
 size = 13,
 weight = 0,
 antialias = false,
 font = "Tahoma"
});
surface.CreateFont("bignig", { --used in the about section and the POM (the blue text)
 size = 18,
 weight = 0,
 antialias = false,
 font = "Verdana",
});
surface.CreateFont("wmk", { --gay egg text
	font="Tahoma", 
	size=35, 
	weight=550,
});
surface.CreateFont("wmk2", { --also gay egg text
	font="Tahoma", 
	size=14, 
	weight=700,
});
surface.CreateFont("NIGGER", { --also gay egg text
	font="Tahoma", 
	size=420, 
	weight=700,
	antialias = false,
});

--long vars

local menu				= defcon.Menu
local current			= defcon.Current
local alive				= defcon.Alive
local normal			= defcon.Normal
local settings			= defcon.Settings
local entities			= defcon.Entities
local whitelist			= defcon.Whitelist
local phrases			= defcon.Phrases
local espcheck			= defcon.ESPCheck
local espdistance		= defcon.ESPDistance

--adds the menu tabs

local function AddTab(txt, tab, func)
	menu.c = menu.c + 1
	local panel
	if tab and tab == true then
		panel = vgui.Create("DPanel", menu.frame);
		panel:SetPos(120,25);
		panel:SetSize(376,406);
		if menu.Current == txt then
			panel:SetVisible(true)
		else
			panel:SetVisible(false)
		end
		panel.Paint = function()
			surface.SetDrawColor( 163, 163, 163, 255 )
			surface.DrawOutlinedRect( 0, 0, panel:GetWide() - 1, panel:GetTall() - 1)
			draw.SimpleText(string.upper(txt), "deffont", 5, 0, Color(210, 210, 210, 235), TEXT_ALIGN_LEFT);
		end
	end
	local button = vgui.Create("DButton", menu.buttons);
	button:SetText(txt);
	button:SetSize(80, 20);
	button:SetPos(15, -15+(25*menu.c));
	button:SetTextColor(color_white)
	button:SetFontInternal('trike')
	button.Paint = function(self) 
		surface.SetDrawColor(100,100,100,220)
		surface.DrawRect(0, 0,self:GetSize())
		surface.SetDrawColor(0,0,0,0)
		surface.SetTextColor(color_white)
		surface.DrawOutlinedRect(0,0,self:GetSize())
	end
	button.DoClick = func or (tab and tab == true and function()
		for k,v in pairs(menu.t) do
			if v ~= panel then
				v:SetVisible(false)
			end
		end
		panel:SetVisible(true)
		menu.Current = txt
		surface.PlaySound("UI/buttonrollover.wav");
		timer.Simple( 0.4, function()
		if defcon.Settings["soundeffects"] then
		RunConsoleCommand("stopsound") end
		end)
	end)
	return panel, button;
end

--secondary shit only used for the about menu (because of the way the old one was set up)

aboutmenu = "http://shitcheat.me/about%20menu.mp3" .. "?" .. tostring(math.random( 1, 99999 )) .. "=" .. tostring(math.random( 1, 99999 ))

function aboutsound()
sound.PlayURL ( aboutmenu, "", function( station )
	if ( IsValid( station ) ) then

		station:SetPos( LocalPlayer():GetPos() )

		station:Play()

	else

		LocalPlayer():ChatPrint( "Invalid URL!" )

	end
end )

end

local Music
function startMusic()
	if Music:IsValid() then
      Music:Stop()
   end
   sound.PlayURL("http://shitcheat.me/about%20menu.mp3","play",function(chan) Music = chan end)
end
function stopMusic()
	if Music:IsValid() then
      Music:Stop()
   end
   end

local function AddTab2(txt, tab2, func)


	menu.c = menu.c + 1
	local panel
	if tab2 and tab2 == true then
		panel = vgui.Create("DPanel", menu.frame);
		panel:SetPos(120,25);
		panel:SetSize(376,406);
		panel:SetVerticalScrollbarEnabled(true)
		if menu.Current == txt then
			panel:SetVisible(true)
		else
			panel:SetVisible(false)
		end
		panel.Paint = function()
			surface.SetDrawColor( 163, 163, 163, 255 )
			surface.DrawOutlinedRect( 0, 0, panel:GetWide() - 1, panel:GetTall() - 1)
			draw.SimpleText(string.upper(txt), "deffont", 5, 0, Color(210, 210, 210, 235), TEXT_ALIGN_LEFT);
		end
	end
	local button = vgui.Create("DButton", menu.buttons);
	button:SetText(txt);
	button:SetSize(80, 20);
	button:SetPos(15, 175+(25*menu.c));
	button:SetTextColor(color_white)
	button:SetFontInternal('trike')
	button.Paint = function(self) 
		surface.SetDrawColor(100,100,100,220)
		surface.DrawRect(0, 0,self:GetSize())
		surface.SetDrawColor(0,0,0,0)
		surface.SetTextColor(color_white)
		surface.DrawOutlinedRect(0,0,self:GetSize())
	end
	button.DoClick = func or (tab2 and tab2 == true and function()
		for k,v in pairs(menu.t) do
			if v ~= panel then
				v:SetVisible(false)
			end
		end
		print "http://steamcommunity.com/groups/ShitcheatForum"
		print "http://pastebin.com/u/Caliber_"
		panel:SetVisible(true)
		menu.Current = txt
		surface.PlaySound("UI/buttonrollover.wav");
		if defcon.Settings["soundeffects"] then
		aboutsound(); end
	end)
	return panel, button;
end

--derma bullshit + menu niggering

local function AddFeature(id, parent, typ, name, setting, o1, o2)
	if not parent then return end
	if typ == "button" then
		local label = vgui.Create("DLabel", parent)
		label:SetText(name)
		label:SetPos(5,(55+(id*25)))
		label:SizeToContents(false)
		local button = vgui.Create("DButton", parent)
		button:SetFontInternal('trike')
		if defcon.Settings[setting] == true then
			button:SetText("enabled")
		else
			button:SetText("disabled")
		end
		button:SetSize(80,20)
		if not id then
			button:SetPos(285,45)
		else
			button:SetPos(285,(55+(id*25)))
		end
		button.DoClick = function()
			if button:GetText() == "enabled" then
			surface.PlaySound("HL1/fvox/_comma.wav");
				button:SetText("disabled"); defcon.Update("setting", setting, false, true)
			else
				button:SetText("enabled"); defcon.Update("setting", setting, true, true)
				surface.PlaySound("HL1/fvox/_comma.wav");
			end
		end
		button:SetTextColor(color_white)
		button.Paint = function(self) 
			surface.SetDrawColor(100,100,100,220)
			surface.DrawRect(0, 0,self:GetSize())
			surface.SetDrawColor(0,0,0,0)
			surface.SetTextColor(color_white)
			surface.DrawOutlinedRect(0,0,self:GetSize())
		end
		return button,label
	elseif typ == "button2" then
		local label = vgui.Create("DLabel", parent)
		label:SetText(name)
		label:SetPos(5,(55+(id*25)))
		label:SizeToContents(false)
		local button = vgui.Create("DButton", parent)
		button:SetFontInternal('trike')
		if defcon.Settings[setting] == true then
			button:SetText("enabled")
		else
			button:SetText("disabled")
		end
		button:SetSize(80,20)
		if not id then
			button:SetPos(285,45)
		else
			button:SetPos(285,(55+(id*25)))
		end
		button.DoClick = function()
			if button:GetText() == "enabled" then
			surface.PlaySound("HL1/fvox/_comma.wav");
				button:SetText("disabled"); defcon.Update("setting", setting, false, true); RunConsoleCommand("stopsound")
			else
				button:SetText("enabled"); defcon.Update("setting", setting, true, true); playaids()
				surface.PlaySound("HL1/fvox/_comma.wav");
			end
		end
		button:SetTextColor(color_white)
		button.Paint = function(self) 
			surface.SetDrawColor(100,100,100,220)
			surface.DrawRect(0, 0,self:GetSize())
			surface.SetDrawColor(0,0,0,0)
			surface.SetTextColor(color_white)
			surface.DrawOutlinedRect(0,0,self:GetSize())
		end
		return button,label
	elseif typ == "button3" then
		local label = vgui.Create("DLabel", parent)
		label:SetText(name)
		label:SetPos(5,(55+(id*25)))
		label:SizeToContents(false)
		local button = vgui.Create("DButton", parent)
		button:SetFontInternal('trike')
		if defcon.Settings[setting] == true then
			button:SetText("enabled")
		else
			button:SetText("disabled")
		end
		button:SetSize(80,20)
		if not id then
			button:SetPos(285,45)
		else
			button:SetPos(285,(55+(id*25)))
		end
		button.DoClick = function()
			if button:GetText() == "enabled" then
			surface.PlaySound("HL1/fvox/_comma.wav");
				button:SetText("disabled"); defcon.Update("setting", setting, false, true); RunConsoleCommand("stopsound")
			else
				button:SetText("enabled"); defcon.Update("setting", setting, true, true); devcomments()
				surface.PlaySound("HL1/fvox/_comma.wav");
			end
		end
		button:SetTextColor(color_white)
		button.Paint = function(self) 
			surface.SetDrawColor(100,100,100,220)
			surface.DrawRect(0, 0,self:GetSize())
			surface.SetDrawColor(0,0,0,0)
			surface.SetTextColor(color_white)
			surface.DrawOutlinedRect(0,0,self:GetSize())
		end
		return button,label
	elseif typ == "slider" then
		local slider = vgui.Create("DNumSlider", parent)
		slider:SetPos(5, (45+(id*25)))
		slider:SetText(name)
		slider:SetMinMax(o1, o2)
		slider:SetWide(372.5)
		slider:SetDecimals( 0 )
		slider:SetFGColor(255,255,255,255)
		slider:SetBGColor(255,255,255,255)
		slider:SetValue(defcon.Settings[setting])
		slider.OnValueChanged = function(panel, value)
			local c = tonumber(value)
			defcon.Update("setting", setting, math.Round(c), true)
		end
		return slider;
	elseif typ == "slider2" then
		local slider = vgui.Create("DNumSlider", parent)
		slider:SetPos(5, (45+(id*25)))
		slider:SetText(name)
		slider:SetMinMax(o1, o2)
		slider:SetWide(372.5)
		slider:SetDecimals( 2 )
		slider:SetFGColor(255,255,255,255)
		slider:SetBGColor(255,255,255,255)
		slider:SetValue(defcon.Settings[setting])
		slider.OnValueChanged = function(panel, value)
			local c = tonumber(value)
			defcon.Update("setting", setting, math.Round(c, 2), true)
		end
		return slider;
end

	if typ == "label" then
		local label = vgui.Create("DLabel", parent)
		label:SetText(name)
		label:SetPos(5,(55+(id*25)))
		label:SizeToContents(false)
		label:SetFont("warnign")
		label.Paint = function(self)
			label:SetTextColor(Color( 51, 122, 204, 255 ))
			end
		
	return label
end
		if typ == "label2" then
		local label = vgui.Create("DLabel", parent)
		label:SetText(name)
		label:SetPos(5,(55+(id*25)))
		label:SizeToContents(false)
		label:SetFont("fuck")
		label.Paint = function(self)
			label:SetTextColor(Color( 140, 140, 140, 255 ))
			end
			
	return label2
end
		if typ == "def" then
		local label = vgui.Create("DLabel", parent)
		label:SetText(name)
		label:SetPos(5,(55+(id*25)))
		label:SizeToContents(false)
		label:SetFont("trike")
		label.Paint = function(self)
			label:SetTextColor(Color( 220, 220, 220, 255 ))
			end
			
	return def
end
		if typ == "abt" then
		local label = vgui.Create("DLabel", parent)
		label:SetText(name)
		label:SetPos(5,(55+(id*12)))
		label:SizeToContents(false)
		label:SetFont("trike")
		label.Paint = function(self)
			label:SetTextColor(Color( 220, 220, 220, 255 ))
			end
			
	return abt
end
		if typ == "abt1" then
		local label = vgui.Create("DLabel", parent)
		label:SetText(name)
		label:SetPos(5,(55+(id*12)))
		label:SizeToContents(false)
		label:SetFont("bignig")
		label.Paint = function(self)
			label:SetTextColor(Color( 0, 0, 0, 255 ))
			end
			
	return abt1
end
		if typ == "abt0" then
		local label = vgui.Create("DLabel", parent)
		label:SetText(name)
		label:SetPos(5,(55+(id*12)))
		label:SizeToContents(false)
		label:SetFont("trike")
		label.Paint = function(self)
			label:SetTextColor(Color( 140, 140, 140, 255 ))
			end
			
	return abt0
end
	if not parent then return end
	if typ == "canser" then
		local label = vgui.Create("DLabel", parent)
		label:SetText(name)
		label:SetPos(5,(55+(id*25)))
		label:SizeToContents(false)
		local button = vgui.Create("DButton", parent)
		button:SetFontInternal('trike')
		if defcon.Settings[setting] == true then
			button:SetText("enabled")
		else
			button:SetText("disabled")
		end
		button:SetSize(80,20)
		if not id then
			button:SetPos(285,45)
		else
			button:SetPos(285,(55+(id*25)))
		end
		button.DoClick = function()
			if button:GetText() == "enabled" then
				button:SetText("disabled"); defcon.Update("setting", setting, false, true); RunConsoleCommand "SH_toggle"
				surface.PlaySound("HL1/fvox/_comma.wav");
			else
				button:SetText("enabled"); defcon.Update("setting", setting, true, true); RunConsoleCommand "SH_toggle"
				surface.PlaySound("HL1/fvox/_comma.wav");
			end
		end
		button:SetTextColor(color_white)
		button.Paint = function(self) 
			surface.SetDrawColor(100,100,100,220)
			surface.DrawRect(0, 0,self:GetSize())
			surface.SetDrawColor(0,0,0,0)
			surface.DrawOutlinedRect(0,0,self:GetSize())
	end
	end
	if not parent then return end
	if typ == "landsernigger" then
		local label = vgui.Create("DLabel", parent)
		label:SetText(name)
		label:SetPos(5,(55+(id*25)))
		label:SizeToContents(false)
		local button = vgui.Create("DButton", parent)
		button:SetFontInternal('trike')
		if defcon.Settings[setting] == true then
			button:SetText("search")
		else
			button:SetText("search")
		end
		button:SetSize(80,20)
		if not id then
			button:SetPos(285,45)
		else
			button:SetPos(285,(55+(id*25)))
		end
		button.DoClick = function()
			if button:GetText() == "enabled" then
				button:SetText("search"); defcon.Update("setting", setting, false, true); RunConsoleCommand "pickupinradius"
				surface.PlaySound("HL1/fvox/_comma.wav");
			else
				button:SetText("search"); defcon.Update("setting", setting, true, true); RunConsoleCommand "pickupinradius"
				surface.PlaySound("HL1/fvox/_comma.wav");
			end
		end
		button:SetTextColor(color_white)
		button.Paint = function(self) 
			surface.SetDrawColor(100,100,100,220)
			surface.DrawRect(0, 0,self:GetSize())
			surface.SetDrawColor(0,0,0,0)
			surface.DrawOutlinedRect(0,0,self:GetSize())
	end
	end
		if not parent then return end
	if typ == "landsernigger6" then
		local label = vgui.Create("DLabel", parent)
		label:SetText(name)
		label:SetPos(5,(55+(id*25)))
		label:SizeToContents(false)
		local button = vgui.Create("DButton", parent)
		button:SetFontInternal('trike')
		if defcon.Settings[setting] == true then
			button:SetText("enabled")
		else
			button:SetText("disabled")
		end
		button:SetSize(80,20)
		if not id then
			button:SetPos(285,45)
		else
			button:SetPos(285,(55+(id*25)))
		end
		button.DoClick = function()
			if button:GetText() == "enabled" then
				button:SetText("disabled"); defcon.Update("setting", setting, false, true); RunConsoleCommand ("defcon.chams", "0")
				surface.PlaySound("HL1/fvox/_comma.wav");
			else
				button:SetText("enabled"); defcon.Update("setting", setting, true, true); RunConsoleCommand ("defcon.chams", "1")
				surface.PlaySound("HL1/fvox/_comma.wav");
			end
		end
		button:SetTextColor(color_white)
		button.Paint = function(self) 
			surface.SetDrawColor(100,100,100,220)
			surface.DrawRect(0, 0,self:GetSize())
			surface.SetDrawColor(0,0,0,0)
			surface.DrawOutlinedRect(0,0,self:GetSize())
	end
	end
	if not parent then return end
	if typ == "landsernigger3" then
		local label = vgui.Create("DLabel", parent)
		label:SetText(name)
		label:SetPos(5,(55+(id*25)))
		label:SizeToContents(false)
		local button = vgui.Create("DButton", parent)
		button:SetFontInternal('trike')
		if defcon.Settings[setting] == true then
			button:SetText("enabled")
		else
			button:SetText("disabled")
		end
		button:SetSize(80,20)
		if not id then
			button:SetPos(285,45)
		else
			button:SetPos(285,(55+(id*25)))
		end
		button.DoClick = function()
			if button:GetText() == "enabled" then
				button:SetText("disabled"); defcon.Update("setting", setting, false, true); RunConsoleCommand ("defcon.boxESP", "0")
				surface.PlaySound("HL1/fvox/_comma.wav");
			else
				button:SetText("enabled"); defcon.Update("setting", setting, true, true); RunConsoleCommand ("defcon.boxESP", "1")
				surface.PlaySound("HL1/fvox/_comma.wav");
			end
		end
		button:SetTextColor(color_white)
		button.Paint = function(self) 
			surface.SetDrawColor(100,100,100,220)
			surface.DrawRect(0, 0,self:GetSize())
			surface.SetDrawColor(0,0,0,0)
			surface.DrawOutlinedRect(0,0,self:GetSize())
	end
	end
			if not parent then return end
	if typ == "landsernigger4" then
		local label = vgui.Create("DLabel", parent)
		label:SetText(name)
		label:SetPos(5,(55+(id*25)))
		label:SizeToContents(false)
		local button = vgui.Create("DButton", parent)
		button:SetFontInternal('trike')
		if defcon.Settings[setting] == true then
			button:SetText("enabled")
		else
			button:SetText("disabled")
		end
		button:SetSize(80,20)
		if not id then
			button:SetPos(285,45)
		else
			button:SetPos(285,(55+(id*25)))
		end
		button.DoClick = function()
			if button:GetText() == "enabled" then
				button:SetText("disabled"); defcon.Update("setting", setting, false, true); RunConsoleCommand ("defcon.propchams", "0")
				surface.PlaySound("HL1/fvox/_comma.wav");
			else
				button:SetText("enabled"); defcon.Update("setting", setting, true, true); RunConsoleCommand ("defcon.propchams", "1")
				surface.PlaySound("HL1/fvox/_comma.wav");
			end
		end
		button:SetTextColor(color_white)
		button.Paint = function(self) 
			surface.SetDrawColor(100,100,100,220)
			surface.DrawRect(0, 0,self:GetSize())
			surface.SetDrawColor(0,0,0,0)
			surface.DrawOutlinedRect(0,0,self:GetSize())
	end
	end
				if not parent then return end
	if typ == "landsernigger5" then
		local label = vgui.Create("DLabel", parent)
		label:SetText(name)
		label:SetPos(5,(55+(id*25)))
		label:SizeToContents(false)
		local button = vgui.Create("DButton", parent)
		button:SetFontInternal('trike')
		if defcon.Settings[setting] == true then
			button:SetText("enabled")
		else
			button:SetText("disabled")
		end
		button:SetSize(80,20)
		if not id then
			button:SetPos(285,45)
		else
			button:SetPos(285,(55+(id*25)))
		end
		button.DoClick = function()
			if button:GetText() == "enabled" then
				button:SetText("disabled"); defcon.Update("setting", setting, false, true); RunConsoleCommand ("defcon.radiochams", "0")
				surface.PlaySound("HL1/fvox/_comma.wav");
			else
				button:SetText("enabled"); defcon.Update("setting", setting, true, true); RunConsoleCommand ("defcon.radiochams", "1")
				surface.PlaySound("HL1/fvox/_comma.wav");
			end
		end
		button:SetTextColor(color_white)
		button.Paint = function(self) 
			surface.SetDrawColor(100,100,100,220)
			surface.DrawRect(0, 0,self:GetSize())
			surface.SetDrawColor(0,0,0,0)
			surface.DrawOutlinedRect(0,0,self:GetSize())
	end
	end
	if not parent then return end
	if typ == "landsernigger2" then
		local label = vgui.Create("DLabel", parent)
		label:SetText(name)
		label:SetPos(5,(55+(id*25)))
		label:SizeToContents(false)
		local button = vgui.Create("DButton", parent)
		button:SetFontInternal('trike')
		if defcon.Settings[setting] == true then
			button:SetText("dupe")
		else
			button:SetText("dupe")
		end
		button:SetSize(80,20)
		if not id then
			button:SetPos(285,45)
		else
			button:SetPos(285,(55+(id*25)))
		end
		button.DoClick = function()
			if button:GetText() == "enabled" then
				button:SetText("dupe"); defcon.Update("setting", setting, false, true); RunConsoleCommand "dupeinradius"
				surface.PlaySound("HL1/fvox/_comma.wav");
			else
				button:SetText("dupe"); defcon.Update("setting", setting, true, true); RunConsoleCommand "dupeinradius"
				surface.PlaySound("HL1/fvox/_comma.wav");
			end
		end
		button:SetTextColor(color_white)
		button.Paint = function(self) 
			surface.SetDrawColor(100,100,100,220)
			surface.DrawRect(0, 0,self:GetSize())
			surface.SetDrawColor(0,0,0,0)
			surface.DrawOutlinedRect(0,0,self:GetSize())
	end
	end
if not parent then return end
	if typ == "bielodesphgay" then
		local label = vgui.Create("DLabel", parent)
		label:SetText(name)
		label:SetPos(5,(55+(id*25)))
		label:SizeToContents(false)
		local button = vgui.Create("DButton", parent)
		button:SetFontInternal('trike')
		if defcon.Settings[setting] == true then
			button:SetText("enabled")
		else
			button:SetText("disabled")
		end
		button:SetSize(80,20)
		if not id then
			button:SetPos(285,45)
		else
			button:SetPos(285,(55+(id*25)))
		end
		button.DoClick = function()
			if button:GetText() == "enabled" then
				button:SetText("disabled"); defcon.Update("setting", setting, false, true); RunConsoleCommand ("entitychams", "0")
				surface.PlaySound("HL1/fvox/_comma.wav");
			else
				button:SetText("enabled"); defcon.Update("setting", setting, true, true); RunConsoleCommand ("entitychams", "1")
				surface.PlaySound("HL1/fvox/_comma.wav");
			end
		end
		button:SetTextColor(color_white)
		button.Paint = function(self) 
			surface.SetDrawColor(100,100,100,220)
			surface.DrawRect(0, 0,self:GetSize())
			surface.SetDrawColor(0,0,0,0)
			surface.DrawOutlinedRect(0,0,self:GetSize())
	end
	end
end

--buttons

local function AddButton(parent, text, posx, posy, func)
	local button = vgui.Create("DButton", parent)
	button:SetText(text)
	button:SetSize(80,20)
	button:SetPos(posx,posy)
	button:SetFontInternal('trike')
	button:SetTextColor(color_white)
	button.DoClick = func or function() end
	button.Paint = function(self) 
		surface.SetDrawColor(100,100,100,220)
		surface.DrawRect(0, 0,self:GetSize())
		surface.SetDrawColor(163,163,163,0)
		surface.DrawOutlinedRect(0,0,self:GetSize())
	end
	return button
end

--actually draw the menu thanks

local function DrawMenu()
	if(menu.frame) then menu.frame:Remove(); menu.frame = nil; end
	
	menu.c = 0
	local surfacea = false
	menu.frame = vgui.Create("DFrame");
	menu.frame:SetPos(ScrW()/2-184, ScrH()/2-155);
	menu.frame:SetSize(500, 435);
	menu.frame:SetFontInternal('trike')
	menu.frame:SetTitle("Shitcheat ".. vnum .." :: ".. (table.Random(table.Random(defcon.Phrasesall)) ));
	menu.frame.Paint = function()
		surface.SetDrawColor(50,50,50,200)
		surface.DrawRect(0, 0,menu.frame:GetWide(),menu.frame:GetTall())
		surface.SetDrawColor(255, 255, 255, 0)
		surface.SetFont('trike')
		surface.SetTextPos( 8, 5 )
		surface.SetTextColor(255, 255, 255, 255)
		surface.DrawText(" ")
		surface.DrawOutlinedRect(0,0,menu.frame:GetWide(),menu.frame:GetTall())
	end
	menu.frame:SetVisible(true);
	menu.frame:SetDraggable(true);
	menu.frame:SetSizable(false);
	menu.frame:ShowCloseButton(false);
	menu.frame:SetBackgroundBlur(true)
	menu.frame:MakePopup();
	
	menu.close = vgui.Create("DButton", menu.frame)
	menu.close:SetFont('marlett')
	menu.close:SetText('r')
	menu.close:SetColor(Color(255, 255, 255, 255))
	menu.close:SetSize(15, 15)
	menu.close:SetDrawBackground(false)
	menu.close:SetPos(menu.frame:GetWide() - 20, 5)
	menu.close.DoClick = function()
		menu.frame:Remove(); menu.frame = nil;
	end

	menu.buttons = vgui.Create("DPanel",menu.frame)
	menu.buttons:SetPos(5, 25)
	menu.buttons:SetSize(111,406)
	menu.buttons:SetVisible(true)
	menu.buttons.Paint = function()
		surface.SetDrawColor(163,163,163,255)
		surface.DrawOutlinedRect(0,365,110,40)
		surface.DrawOutlinedRect(0,0,110,359)

	end

	menu.t.def = vgui.Create("DPanel", menu.frame);
	menu.t.def:SetPos(120,25);
	menu.t.def:SetSize(376,406);
	if menu.Current ~= nil then menu.t.def:SetVisible(false) end
	menu.t.def.Paint = function() 
		surface.SetDrawColor( 163, 163, 163, 255 )
		surface.DrawOutlinedRect( 0, 0, menu.t.def:GetWide() - 1, menu.t.def:GetTall() - 1)
	end
	
--checks for the auto-updater

local function chk4aload()
	if ConVarExists("SCAA") then
return "True"
	else
return "False"
end
end
	
	menu.t.a, menu.b.a 		= AddTab("Aimbot",		true)
	menu.t.p, menu.b.p		= AddTab("Player ESP", 	true)
	menu.t.e, menu.b.e		= AddTab("Entity ESP", 	true)
	menu.t.m, menu.b.m		= AddTab("Misc.",		true)
	menu.t.c, menu.b.c		= AddTab("Chat Spam",	true)
	menu.t.f, menu.b.f		= AddTab("Freecam",		true)
	menu.t.w, menu.b.w		= AddTab("Filter",		true)
	menu.t.b, menu.b.b		= AddTab2("About",		true)
	--id, parent , the type, the text , setting
	AddFeature(1, menu.t.a, "button", "", "aimbot")
	AddFeature(1, menu.t.a, "def", "Enabled")
	AddFeature(2, menu.t.a, "button", "", "triggerbot")
	AddFeature(2, menu.t.a, "def", "Triggerbot")
	AddFeature(3, menu.t.a, "button", "", "aimbot_friendly_fire")
	AddFeature(3, menu.t.a, "def", "Target Teammates")
	AddFeature(4, menu.t.a, "button", "", "vischeck")
	AddFeature(4, menu.t.a, "def", "Visibility Check")
	AddFeature(5, menu.t.a, "button", "", "shootsteamfriends")
	AddFeature(5, menu.t.a, "def", "Target Steam Friends")
	AddFeature(6, menu.t.a, "button", "", "targetnoclippers")
	AddFeature(6, menu.t.a, "def", "Target Noclippers")
	AddFeature(7, menu.t.a, "slider", "", "aimbot_fov", 0, 180)
	AddFeature(7, menu.t.a, "def", "Aimbot Radius")
	AddFeature(8, menu.t.a, "button", "", "autosnap")
	AddFeature(8, menu.t.a, "def", "Automatic Aimbot")
	AddFeature(9, menu.t.a, "button", "", "autoshoot")
	AddFeature(9, menu.t.a, "def", "Automatic Triggerbot")
	AddFeature(10, menu.t.a, "button", "", "snapline")
	AddFeature(10, menu.t.a, "def", "Snapline")
	AddFeature(11, menu.t.a, "button", "","radiusdraw")
	AddFeature(11, menu.t.a, "def", "Aimbot radius visualizer")
	
	AddFeature(1, menu.t.p, "button", "", "esp_player")
	AddFeature(1, menu.t.p, "def", "Enabled")
	AddFeature(2, menu.t.p, "button", "", "esp_player_name")
	AddFeature(2, menu.t.p, "def", "Show Name")
	AddFeature(3, menu.t.p, "button", "", "esp_player_rank")
	AddFeature(3, menu.t.p, "def", "Show Rank")
	AddFeature(4, menu.t.p, "button", "", "esp_player_health")
	AddFeature(4, menu.t.p, "def", "Show Health")
	AddFeature(5, menu.t.p, "button", "", "esp_player_armor")
	AddFeature(5, menu.t.p, "def", "Show Armor")
	AddFeature(6, menu.t.p, "button", "", "esp_player_showdist")
	AddFeature(6, menu.t.p, "def", "Show Distance")
	AddFeature(7, menu.t.p, "button", "", "esp_player_glow")
	AddFeature(7, menu.t.p, "def", "Draw Glow Halo")
	AddFeature(8, menu.t.p, "button", "", "lasereyes")
	AddFeature(8, menu.t.p, "def", "Laser Eyes")
	AddFeature(9, menu.t.p, "landsernigger3", "", "defcon.boxESP")
	AddFeature(9, menu.t.p, "def", "Draw 3D Collision boxes")
	AddFeature(10,menu.t.p, "button", "", "twodbox")
	AddFeature(10,menu.t.p, "def", "Draw 2D Collision boxes")
	AddFeature(11,menu.t.p, "button", "", "chams")
	AddFeature(11,menu.t.p, "def", "Player Chams")
	AddFeature(12,menu.t.p, "button", "", "tracelines")
	AddFeature(12,menu.t.p, "def", "Global tracers")
	
	AddFeature(1, menu.t.e, "button", "", "esp_entity")
	AddFeature(1, menu.t.e, "def", "Entity Finder")
	AddFeature(2, menu.t.e, "landsernigger4", "", "defcon.propchams")
	AddFeature(2, menu.t.e, "def", "Physics Prop Chams")
	AddFeature(3, menu.t.e, "bielodesphgay", "", "entitychams")
	AddFeature(3, menu.t.e, "def", "Entity Chams")
	AddFeature(4, menu.t.e, "button", "", "espname")
	AddFeature(4, menu.t.e, "def", "Draw item names instead of classes [Clockwork only]")	
	
	AddFeature(1, menu.t.m, "button", "", "flashlight_spam")
	AddFeature(1, menu.t.m, "def", "Flashlight Spam [hold leftarrow]")
	AddFeature(2, menu.t.m, "button", "", "bhop_bhop")
	AddFeature(2, menu.t.m, "def", "Bunny Hopping [hold space]")
	AddFeature(3, menu.t.m, "button", "", "crosshair")
	AddFeature(3, menu.t.m, "def", "Client Side Crosshair")
	AddFeature(4, menu.t.m, "button", "", "velocity")
	AddFeature(4, menu.t.m, "def", "Big Velocity Meter")
	AddFeature(5, menu.t.m, "button", "", "autoacd")
	AddFeature(5, menu.t.m, "def", "Automatic ACD for HL2RP")
	AddFeature(6, menu.t.m, "button", "", "autoclick")
	AddFeature(6, menu.t.m, "def", "Autoclick Mouse Buttons")
	AddFeature(7, menu.t.m, "slider", "", "FOVslider", 0, 360)
	AddFeature(7, menu.t.m, "def", "Player FOV")
	AddFeature(8, menu.t.m, "button", "", "panicdisplay")
	AddFeature(8, menu.t.m, "def", "Panic mode notice")
	AddFeature(9, menu.t.m, "button", "", "returnnil")
	AddFeature(9, menu.t.m, "def", "Return nothing when someone tries to screencap you")
	AddFeature(10, menu.t.m, "landsernigger", "", "pickupinradius")
	AddFeature(10, menu.t.m, "def", "Pick up items in radius [Clockwork only]")
	AddFeature(11, menu.t.m, "landsernigger2", "", "dupeinradius")
	AddFeature(11, menu.t.m, "def", "Duplicate items in radius [Clockwork only]")
	AddFeature(12, menu.t.m, "button", "","silentaim")
	AddFeature(12, menu.t.m, "def", "Silent aim")

	AddFeature(1, menu.t.c, "button", "", "chatspam1")
	AddFeature(1, menu.t.c, "def", "Random Messages")
	AddFeature(2, menu.t.c, "button", "", "chatspam2")
	AddFeature(2, menu.t.c, "def", "HL2RP VC Messages")
	AddFeature(3, menu.t.c, "button", "", "chatspam3")
	AddFeature(3, menu.t.c, "def", "WWWWWWWWWWWWWWWWWW")
	AddFeature(4, menu.t.c, "button", "", "chatspam4")
	AddFeature(4, menu.t.c, "def", "Menu Display Messages")
	AddFeature(5, menu.t.c, "button", "", "superspam")
	AddFeature(5, menu.t.c, "def", "Procedurally Generated Spam")
	AddFeature(6, menu.t.c, "button", "", "madspam")
	AddFeature(6, menu.t.c, "def", "FULL CAPS Procgen Spam")
	AddFeature(7, menu.t.c, "button", "", "badminspam")
	AddFeature(7, menu.t.c, "def", "Admin Insulter")
	AddFeature(8, menu.t.c, "button", "", "autispam")
	AddFeature(8, menu.t.c, "def", "CS:GO Russian Gibberish")
	AddFeature(9, menu.t.c, "button", "", "adspam")
	AddFeature(9, menu.t.c, "def", "Cheat Promotion Spam")
	AddFeature(10, menu.t.c, "button", "", "obnoxiousspam")
	AddFeature(10, menu.t.c, "def", "Obnoxious Questions")
	AddFeature(11, menu.t.c, "button", "", "OOCspam")
	AddFeature(11, menu.t.c, "def", "OOC spam toggle")
	
	AddFeature(1, menu.t.f, "canser", "", "cl_noclip")
	AddFeature(1, menu.t.f, "def", "New Freecam")
	AddFeature(2, menu.t.f, "slider", "", "freecamspeed", 0, 1000)
	AddFeature(2, menu.t.f, "def", "Freecam speed")
	AddFeature(11, menu.t.f, "label", "NOTICE: entities may not appear when using freecam                                                                                                          ")
	
	AddFeature(1, menu.t.w, "button", "", "sfd")
	AddFeature(1, menu.t.w, "def", "Override screenspace effects")
	AddFeature(2, menu.t.w, "button", "", "fullbright")
	AddFeature(2, menu.t.w, "def", "Workaround fullbright")
	AddFeature(3, menu.t.w, "slider2", "", "brightness", 0, 1)
	AddFeature(3, menu.t.w, "def", "Brightness")
	AddFeature(4, menu.t.w, "slider2", "", "contrast", 0, 5)
	AddFeature(4, menu.t.w, "def", "Contrast")
	AddFeature(5, menu.t.w, "slider2", "", "saturation", 0, 5)
	AddFeature(5, menu.t.w, "def", "Saturation")
	AddFeature(6, menu.t.w, "slider2", "", "worldspawnalpha", 0, 1)
	AddFeature(6, menu.t.w, "def", "World Alpha")
	
	AddFeature(0, menu.t.b, "abt", "Shitcheat version: " .. vnum .. " | Auto-updater status: ".. chk4aload() .." | Release date: 6/18/18")
	AddFeature(1, menu.t.b, "abt", "Made by Caliber @ Madbluntz.rs / Shitcheat.me / Caliber.pw")
	AddFeature(3, menu.t.b, "abt1", "LINKS                                                                                                                                      ")
	AddFeature(5, menu.t.b, "abt", "Steam group: steamcommunity.com/groups/ShitcheatForum")
	AddFeature(6, menu.t.b, "abt", "Pastebin (for cheat updates): pastebin.com/u/Caliber_")
	AddFeature(8, menu.t.b, "abt1", "CHANGELOG FOR THIS VERSION                                                                                                          ")
	AddFeature(10, menu.t.b, "abt", "- Added a couple more spam messages / flavour texts")
	AddFeature(11, menu.t.b, "abt", "- Re-labeled anti-aim and silent aim")
	AddFeature(12, menu.t.b, "abt", "- Fixed an exploit that allowed server owners to spam users with endless")
	AddFeature(13, menu.t.b, "abt", "screengrab notices")
	AddFeature(14, menu.t.b, "abt", "- Made it so selecting 'return nothing' in the misc menu no longer spams you")
	AddFeature(15, menu.t.b, "abt", "with screengrab notifications")
	AddFeature(16, menu.t.b, "abt", "- Fixed the toggle for player names in the player ESP menu")
	AddFeature(17, menu.t.b, "abt", "- Fixed a colour tag for somebody (sorry it took so long.)")
	AddFeature(18, menu.t.b, "abt", "- Fixed the freecam since I fucking broke it again")
	AddFeature(19, menu.t.b, "abt", "- Made the FOV slider work while in freecam and independent of silent aim")
	AddFeature(20, menu.t.b, "abt", "again")
	AddFeature(21, menu.t.b, "abt", "- Moved the console commands list to the preface")
	AddFeature(22, menu.t.b, "abt", "- Changed the about menu's colours to make it easier to read")
	AddFeature(26, menu.t.b, "abt", "                 Thank you for using shitcheat, it's been a hell of a ride.")

	
	local elist
	local elist2
	local elistc
	local elistc2
	local function makeelist()
		elist = vgui.Create("DComboBox", menu.t.e)
		elist:SetPos(10,menu.t.e:GetTall()-50)
		elist:SetSize(130,20)
		for k,v in pairs(defcon.Ents()) do
			if not(defcon.Entities[v]) then
				local i = elist:AddChoice(v)
			end
		end	
		elist.OnSelect = function(index,value,data)
			print(data)
			elist2 = data
		end
	end
	local function makeelistc()
		elistc = vgui.Create("DComboBox", menu.t.e)
		elistc:SetPos(235, menu.t.e:GetTall()-50)
		elistc:SetSize(130,20)
		for k,v in pairs(defcon.Entities) do
			local i = elistc:AddChoice(v)
		end
		elistc.OnSelect = function(index,value,data)
			elistc2 = data
		end
	end
	makeelist()
	makeelistc()
	AddButton(menu.t.e, "Add Entity", 35, menu.t.e:GetTall()-31, function()
		if(elist2) then
			for k,v in pairs(defcon.Ents()) do
				if (v == elist2) then
					print(v)
					table.insert(defcon.Entities, v)
					defcon.Update("entity")
				end
			end
		end
		makeelist()
		makeelistc()
	end)
	AddButton(menu.t.e, "Remove Entity", 260, menu.t.e:GetTall()-31, function()
		if(elistc2) then
			for k,v in pairs(defcon.Entities) do
				if (v == elistc2) then
					defcon.Entities[k] = nil;
					defcon.Update("entity")
				end
			end
		end
		makeelist()
		makeelistc()
	end)
		local flist
	local flist2
	local flistc
	local flistc2
	local function makeflist() --i updated my f list lol
		flist = vgui.Create("DComboBox", menu.t.a)
		flist:SetPos(10,menu.t.a:GetTall()-50)
		flist:SetSize(130,20)
		for k,v in pairs(player.GetAll()) do
			if v ~= LocalPlayer() then
				if not(table.HasValue(defcon.Friends, v)) then
					local i = flist:AddChoice(v:Nick())
				end
			end
		end
		flist.OnSelect = function(index,value,data)
			print(data)
			flist2 = data
		end
	end
	local function makeflistc()
		flistc = vgui.Create("DComboBox", menu.t.a)
		flistc:SetPos(235, menu.t.a:GetTall()-50)
		flistc:SetSize(130,20)
		for k,v in pairs(defcon.Friends) do
			if v ~= LocalPlayer() then
				local i = flistc:AddChoice(v:Nick())
		end
	end
		flistc.OnSelect = function(index,value,data)
			flistc2 = data
		end
	end
	makeflist()
	makeflistc()
	AddButton(menu.t.a, "Add Friend", 35, menu.t.a:GetTall()-31, function()
		if(flist2) then
			for k,v in pairs(player.GetAll()) do
				if (v:Nick() == flist2) then
					table.insert( defcon.Friends, v )
					notification.AddLegacy("Added "..v:Nick().." to the aimbot whitelist", NOTIFY_HINT, 5)
					print ( "[Shitcheat] Added "..v:Nick().." to the aimbot whitelist")
					defcon.Update("friend")
				end
			end
		end
		makeflist()
		makeflistc()
	end)
	AddButton(menu.t.a, "Remove Friend", 260, menu.t.a:GetTall()-31, function()
		if(flistc2) then
			for k,v in pairs(defcon.Friends) do
				if v:Nick() == flistc2 then
					table.RemoveByValue( defcon.Friends, v )
					notification.AddLegacy("Removed "..v:Nick().." from the aimbot whitelist", NOTIFY_HINT, 5)
					print ( "[Shitcheat] Removed "..v:Nick().." from the aimbot whitelist")
					defcon.Update("friend")
				end
			end
		end
		makeflist()
		makeflistc()
	end)
end

--panic mode for servers with serverguard or cac or whatever

_G.render.Capture = function( data, func )
if (GAMEMODE_NAME != "DarkRP") then
if ( GetConVarNumber("panicmode") == 1 ) then
	if ( data.format == "jpeg" ) then
		if defcon.Settings["soundeffects"] and !defcon.Settings["returnnil"] then panicmodesound(); RunConsoleCommand("panicmode", "1");  else
		surface.PlaySound("vo/NovaProspekt/eli_foundme02.wav");end
		print ("[Shitcheat] Someone tried to screencap you using serverguard! all visible elements have been disabled.")
		print ("[Shitcheat] To re-enable them, type 'panicmode 0' into the console.")
		if defcon.Settings["returnnil"] then return "get fucked" else end
	elseif ( data.format == "png" ) then
		if defcon.Settings["soundeffects"] and !defcon.Settings["returnnil"] then panicmodesound(); RunConsoleCommand("panicmode", "1");  else
		surface.PlaySound("vo/NovaProspekt/eli_foundme02.wav");end
		print ("[Shitcheat] Someone tried to screencap you using serverguard! all visible elements have been disabled.")
		print ("[Shitcheat] To re-enable them, type 'panicmode 0' into the console.")
		if defcon.Settings["returnnil"] then return "get fucked" else end
	else
		RunConsoleCommand("panicmode", "1");
		if defcon.Settings["soundeffects"] then panicmodesound(); else
		surface.PlaySound("vo/NovaProspekt/eli_foundme02.wav"); end
		print ("[Shitcheat] Someone tried to screencap you using serverguard! all visible elements have been disabled.")
		print ("[Shitcheat] To re-enable them, type 'panicmode 0' into the console.")
		if defcon.Settings["returnnil"] then return "get fucked" else end
	end 
end
end
end

--clientside noclip / freecam

local SH = {}
SH.Enabled = false
SH.ViewOrigin = Vector( 0, 0, 0 )
SH.ViewAngle = Angle( 0, 0, 0 )
SH.Velocity = Vector( 0, 0, 0 )
function SH.CalcView( ply, origin, angles, fov )
	if ( !SH.Enabled ) then return end
	if ( SH.SetView ) then
		SH.ViewOrigin = origin
		SH.ViewAngle = angles
		SH.fov = defcon.Settings["FOVslider"]
		SH.SetView = false
	end
	return { origin = SH.ViewOrigin, angles = SH.ViewAngle, fov = SH.fov }
end
hook.Add( "CalcView", "niggercalc", SH.CalcView )
function SH.CreateMove( cmd, ply, origin, angles, fov )
	if ( !SH.Enabled ) then return end
	
	local time = FrameTime()
	SH.ViewOrigin = SH.ViewOrigin + ( SH.Velocity * time)
	SH.Velocity = SH.Velocity * 0.95
	
	local sensitivity = 0.022
	SH.ViewAngle.p = math.Clamp( SH.ViewAngle.p + ( cmd:GetMouseY() * sensitivity ), -89, 89 ) 
	SH.ViewAngle.y = SH.ViewAngle.y + ( cmd:GetMouseX() * -1 * sensitivity )
	
	local nig = Vector( 0, 0, 0 )
	local add = Vector( 0, 0, 0 )
	local ang = SH.ViewAngle
	if ( cmd:KeyDown( IN_FORWARD ) ) then add = add + ang:Forward() end
	if ( cmd:KeyDown( IN_BACK ) ) then add = add - ang:Forward() end
	if ( cmd:KeyDown( IN_MOVERIGHT ) ) then add = add + ang:Right() end
	if ( cmd:KeyDown( IN_MOVELEFT ) ) then add = add - ang:Right() end
	if ( cmd:KeyDown( IN_JUMP ) ) then add = add + ang:Up() end
	if ( cmd:KeyDown( IN_DUCK ) ) then add = add - ang:Up() end
	
	add = add:GetNormal() * defcon.Settings["freecamspeed"]
	if ( cmd:KeyDown( IN_SPEED ) ) then add = add * 2 end
	
	SH.Velocity = SH.Velocity + add
	
	if ( SH.LockView == true ) then
		SH.LockView = cmd:GetViewAngles()
	end
	if ( SH.LockView ) then
		cmd:SetViewAngles( SH.LockView )
	end
	
	cmd:SetForwardMove( 0 )
	cmd:SetSideMove( 0 )
	cmd:SetUpMove( 0 )
end
hook.Add( "CreateMove", "niggerwalk", SH.CreateMove )
function SH.Toggle()
	SH.Enabled = !SH.Enabled
	SH.LockView = SH.Enabled
	SH.SetView = true
	
	local status = { [ true ] = "enabled", [ false ] = "disabled" }
end
concommand.Add( "SH_toggle", SH.Toggle )
concommand.Add( "SH_pos", function() print( SH.ViewOrigin ) end )
	
--best esp

hook.Add("HUDPaint", "ItemPos", function() --seperate hook so the other one disables when this one turns on
				if defcon.Settings["espname"] and GetConVarNumber("panicmode") == 0 then
		for k, v in pairs (ents.GetAll()) do 
					if (v:GetClass() == "cw_item") then
						if (v:IsValid()) then
							local cwEntity = Clockwork.entity;
							local ESP2 = ( v:GetPos() ):ToScreen();
							local itemTable = cwEntity:FetchItemTable(v);

							if (itemTable) then
								local itemName = itemTable("name");
								local color = Color(0, 255, 255, 255);
								draw.SimpleTextOutlined( itemName, "deffontesp1", ESP2.x, ESP2.y -0, Color(255,0,0,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color(0,0,0,255) );
							end
						end
					end
				end
			end
end )
hook.Add("HUDPaint", "catHUD", function()
	if defcon.Settings["esp_player"] and GetConVarNumber("panicmode") == 0 or defcon.Settings["esp_entity"] and GetConVarNumber("panicmode") == 0 then
		for k,v in pairs(ents.GetAll()) do
			if defcon.Settings["esp_player"] && v:IsPlayer() and GetConVarNumber("panicmode") == 0 then
				if(espcheck("player", v) and espdistance("player", v) and GetConVarNumber("panicmode") == 0 )then
					local ESP = (v:EyePos()):ToScreen()
					local name,health,rank,col,distance = "","","","",""
					local outcol = Color(0,0,0,255)
					local white = Color(255,255,255,255)
					local outcol2 = outcol
					if defcon.Settings["esp_player_name"] and GetConVarNumber("panicmode") == 0 then
						if v.GetRPName then name = v:GetRPName()
						else name = v:Nick() end
						elseif !defcon.Settings["esp_player_name"] and GetConVarNumber("panicmode") == 0 then
						 name = " "
					end
					if v:Nick() ~= name and defcon.Settings["esp_player_name"] then rank = " "..v:Nick() end
					if v.SteamName and name ~= v:SteamName() and defcon.Settings["esp_player_name"] then rank = " "..v:SteamName() end
					if defcon.Settings["esp_player_rank"] and GetConVarNumber("panicmode") == 0 then
						if v:IsSuperAdmin() then
							rank = "[Super Admin]"..rank
						elseif v:IsAdmin() then
							rank = "[Admin]"..rank
						elseif v:IsUserGroup("moderator") or v:IsUserGroup("mod") then
							rank = "[Moderator]"..rank
						elseif v:IsUserGroup("vip") or v:IsUserGroup("donator") then
							rank = "[Donator]"..rank
						end
					end
					if defcon.Settings["esp_player_health"] and GetConVarNumber("panicmode") == 0 and not(defcon.Settings["esp_player_armor"]) then
						health = v:Health().."H"
					elseif defcon.Settings["esp_player_armor"] and GetConVarNumber("panicmode") == 0 and not(defcon.Settings["esp_player_health"]) then
						health = v:Armor().."A"
					elseif defcon.Settings["esp_player_armor"] and GetConVarNumber("panicmode") == 0 and defcon.Settings["esp_player_health"] then
						health = v:Health().. "H - "..v:Armor().."A"
					end
					if defcon.Settings["esp_player_showdist"] and GetConVarNumber("panicmode") == 0 then
						distance = v:GetPos():Distance(LocalPlayer():GetPos())
						distance = math.Round(distance).." HU"
					end
					col = team.GetColor(v:Team())
					if(col.r <= 50 and col.g <= 50 and col.b <= 50) then
						outcol2 = Color(200,200,200,255)
					end
					if col.a <= 50 then
						col = Color(col.r,col.g,col.b, 255)
					end
					if v:Health() < 1 and v:Health() ~= nil then
						draw.SimpleTextOutlined( "[DEAD]", "deffontesp1", ESP.x, ESP.y - 82, Color(255,0,0,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color(0,0,0,255))
					end
					if v:Health() == nil or (v:Nick() == nil) or (( GAMEMODE_NAME == "cwhl2rp" ) and (v:Nick() ~= name or v:Nick() == nil )) then
						draw.SimpleTextOutlined( "[CONNECTING]", "deffontesp1", ESP.x, ESP.y - 82, Color(255,0,0,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color(0,0,0,255))
					end
					draw.SimpleTextOutlined(rank, "deffontesp2", ESP.x, ESP.y -46, col, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, outcol2)
					draw.SimpleTextOutlined(name, "deffontesp1", ESP.x, ESP.y - 34, col, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, outcol2)
					if health ~= "" then
						draw.SimpleTextOutlined(health, "deffontesp2", ESP.x, ESP.y -22, white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, outcol)
						draw.SimpleTextOutlined(distance, "deffontesp2", ESP.x, ESP.y - 10, white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, outcol)
					else
						draw.SimpleTextOutlined(distance, "deffontesp2", ESP.x, ESP.y - 22, white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, outcol)
					end
					if defcon.Settings["esp_player_glow"] and GetConVarNumber("panicmode") == 0 then
						halo.Add({v}, col, 2, 2, 1, true, true)
					end
			end
		end
			
			if (defcon.Settings["esp_entity"] and !defcon.Settings["espname"] and espcheck("entity", v) and espdistance("entity", v) and GetConVarNumber("panicmode") == 0)then
				if table.HasValue(defcon.Entities, v:GetClass()) then
					local ESP = (v:EyePos()):ToScreen()
					draw.SimpleTextOutlined(v:GetClass(), "deffontesp3", ESP.x, ESP.y - 0, Color(255,0,0,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color(0,0,0,255))
				end
			end
		end
		if defcon.Settings["EA_watermark"] and GetConVarNumber("panicmode") == 0 then
	draw.SimpleText("Shit", "wmk", 10, 55, Color(255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM)
	draw.SimpleText("cheat", "wmk", 69, 55, Color(51, 122, 204), TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM)
	draw.SimpleText("Version ".. vnum, "wmk2", 10, 65, Color(255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM)
	end
	if defcon.Settings["nigger"] and GetConVarNumber("panicmode") == 0 then
	draw.SimpleText("nigger", "NIGGER", ScrW()/2-2, ScrH()/2-4, Color(69, 36, 23), TEXT_ALIGN_center, TEXT_ALIGN_BOTTOM)
	draw.SimpleText("nigger", "NIGGER", ScrW()/2-297, ScrH()/2-444, Color(69, 36, 23), TEXT_ALIGN_center, TEXT_ALIGN_BOTTOM)
	draw.SimpleText("nigger", "NIGGER", ScrW()/2+847, ScrH()/2+532, Color(69, 36, 23), TEXT_ALIGN_center, TEXT_ALIGN_BOTTOM)
	draw.SimpleText("nigger", "NIGGER", ScrW()/2+697, ScrH()/2+244, Color(69, 36, 23), TEXT_ALIGN_center, TEXT_ALIGN_BOTTOM)
	draw.SimpleText("nigger", "NIGGER", ScrW()/2+297, ScrH()/2+444, Color(69, 36, 23), TEXT_ALIGN_center, TEXT_ALIGN_BOTTOM)
	draw.SimpleText("nigger", "NIGGER", ScrW()/2+197, ScrH()/2-144, Color(69, 36, 23), TEXT_ALIGN_center, TEXT_ALIGN_BOTTOM)
	draw.SimpleText("nigger", "NIGGER", ScrW()/2+497, ScrH()/2+44, Color(69, 36, 23), TEXT_ALIGN_center, TEXT_ALIGN_BOTTOM)
	draw.SimpleText("nigger", "NIGGER", ScrW()/2-702, ScrH()/1.3-144, Color(69, 36, 23), TEXT_ALIGN_center, TEXT_ALIGN_BOTTOM)
	draw.SimpleText("nigger", "NIGGER", ScrW()/2-702, ScrH()/1.3-544, Color(69, 36, 23), TEXT_ALIGN_center, TEXT_ALIGN_BOTTOM)
	draw.SimpleText("nigger", "NIGGER", ScrW()/2-702, ScrH()/1.3-544, Color(69, 36, 23), TEXT_ALIGN_center, TEXT_ALIGN_BOTTOM)
	draw.SimpleText("nigger", "NIGGER", ScrW()/2-597, ScrH()/1.1-444, Color(69, 36, 23), TEXT_ALIGN_center, TEXT_ALIGN_BOTTOM)
	draw.SimpleText("nigger", "NIGGER", ScrW()/2+202, ScrH()/2-264, Color(69, 36, 23), TEXT_ALIGN_center, TEXT_ALIGN_BOTTOM)
	draw.SimpleText("fuck you kid", "wmk", 469, 555, Color(51, 122, 204), TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM)
	end
	end
		if defcon.Settings["esp_player"] and GetConVarNumber("panicmode") == 0 then
		for k, v in pairs( player.GetAll() ) do
		local ESP = (v:EyePos()):ToScreen()
		if v:GetFriendStatus() == "friend" then
		draw.SimpleTextOutlined( "[FRIEND]", "deffontesp1", ESP.x, ESP.y - 58, Color(23,170,9,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color(0,0,0,255))
		end
		end
		end
		if defcon.Settings["esp_player"] and GetConVarNumber("panicmode") == 0 then
		for k, v in pairs( player.GetAll() ) do
		local ESP = (v:EyePos()):ToScreen()
		if (v:SteamID64() == "76561198146840693" ) then
		if SafeCheck(v) == true then
		draw.SimpleTextOutlined( "[SC DEV]", "deffontesp1", ESP.x, ESP.y - 70, Color(51, 122, 204, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color(0,0,0,255))
		end
		end
		end
		end
		if defcon.Settings["esp_player"] and GetConVarNumber("panicmode") == 0 then
		for k, v in pairs( player.GetAll() ) do
		local ESP = (v:EyePos()):ToScreen()
		if (v:SteamID64() == "76561198026385835" or v:SteamID64() == "76561198043810656" or v:SteamID64() == "76561198083346999" or v:SteamID64() == "76561198018844295" or v:SteamID64() == "76561198224905304" or v:SteamID64() == "76561198119598042" or v:SteamID64() == "76561198292540676" or v:SteamID64() == "76561198050810667" or v:SteamID64() == "76561198036411084" or v:SteamID64() == "76561198368672450" or v:SteamID64() == "76561198271773408" or v:SteamID64() == "76561198048995964" or v:SteamID64() == "76561198046620590" or v:SteamID64() == "76561198146749278" or v:SteamID64() == "76561198142856184" or v:SteamID64() == "76561198055454218" or v:SteamID64() == "76561197991583369" or v:SteamID64() == "76561198070132294" or v:SteamID64() == "76561198082957678" or v:SteamID64() == "76561198392748958") then
		if SafeCheck(v) == true then
		draw.SimpleTextOutlined( "[MADBLUNTZ MEMBER]", "deffontesp1", ESP.x, ESP.y - 70, Color(26, 165, 8, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color(0,0,0,255))
		end
		end
		end
		end
		if defcon.Settings["esp_player"] and GetConVarNumber("panicmode") == 0 then
		for k, v in pairs( player.GetAll() ) do
		local ESP = (v:EyePos()):ToScreen()
		if (v:SteamID64() == "76561198219853479" ) then
		if SafeCheck(v) == true then
		draw.SimpleTextOutlined( "[MADBLUNTZ FOUNDER]", "deffontesp1", ESP.x, ESP.y - 70, Color(21, 114, 26, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color(0,0,0,255))
		end
		end
		end
		end
		if defcon.Settings["esp_player"] and GetConVarNumber("panicmode") == 0 then
		for k, v in pairs( player.GetAll() ) do
		local ESP = (v:EyePos()):ToScreen()
		if (v:SteamID64() == "76561198068066014" or v:SteamID64() == "76561198066572697" or v:SteamID64() == "76561198042736977" ) then
		if SafeCheck(v) == true then
		draw.SimpleTextOutlined( "[KNOWN MINGE]", "deffontesp1", ESP.x, ESP.y - 70, Color(90, 33, 160, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color(0,0,0,255))
		end
		end
		end
		end
		if defcon.Settings["esp_player"] and GetConVarNumber("panicmode") == 0 then
		for k, v in pairs( player.GetAll() ) do
		local ESP = (v:EyePos()):ToScreen()
		if (v:SteamID64() == "76561198098287399" or v:SteamID64() == "76561198180168115" ) then
		if SafeCheck(v) == true then
		draw.SimpleTextOutlined( "[CHILD ERPER]", "deffontesp1", ESP.x, ESP.y - 70, Color(167, 0, 173, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color(0,0,0,255))
		end
		end
		end
		end
		if defcon.Settings["esp_player"] and GetConVarNumber("panicmode") == 0 then
		for k, v in pairs( player.GetAll() ) do
		local ESP = (v:EyePos()):ToScreen()
		if (v:SteamID64() == "76561198054342556" ) then
		if SafeCheck(v) == true then
		draw.SimpleTextOutlined( "[COOL KID]", "deffontesp1", ESP.x, ESP.y - 70, Color(61, 85, 182, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color(0,0,0,255))
		end
		end
		end
		end
		if defcon.Settings["esp_player"] and GetConVarNumber("panicmode") == 0 then
		for k, v in pairs( player.GetAll() ) do
		local ESP = (v:EyePos()):ToScreen()
		if (v:SteamID64() == "76561198084376974" or v:SteamID64() == "76561198448728143" or v:SteamID64() == "76561198370895099" or v:SteamID64() == "76561198257814787" or v:SteamID64() == "76561198103725860" or v:SteamID64() == "76561198119006847" or v:SteamID64() == "76561198127506727" or v:SteamID64() == "76561198175831045" or v:SteamID64() == "76561198271359743" or v:SteamID64() == "76561198004735839" or v:SteamID64() == "76561198136718212" or v:SteamID64() == "76561198064856546" or v:SteamID64() == "76561198054606803" or v:SteamID64() == "76561198240529674" or v:SteamID64() == " 76561198272616051" or v:SteamID64() == "76561198097787177" ) then
		if SafeCheck(v) == true then
		draw.SimpleTextOutlined( "[ERPER]", "deffontesp1", ESP.x, ESP.y - 70, Color(167, 0, 173, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color(0,0,0,255))
		end
		end
		end
		end
		if defcon.Settings["esp_player"] and GetConVarNumber("panicmode") == 0 then
		for k, v in pairs( player.GetAll() ) do
		local ESP = (v:EyePos()):ToScreen()
		if (v:SteamID64() == "76561197979799402" or v:SteamID64() == "76561198018094764" or v:SteamID64() == "76561198223939436" or v:SteamID64() == "76561197989098097" or v:SteamID64() == "76561198021293112" or v:SteamID64() == "76561198056053449" or v:SteamID64() == "76561198019226381" or v:SteamID64() == "76561197970795718" or v:SteamID64() == "76561198059939304" or v:SteamID64() == "76561198089359917" or v:SteamID64() == "76561198142088965" ) then
		if SafeCheck(v) == true then
		draw.SimpleTextOutlined( "[FAKE MINGE / TRAITOR]", "deffontesp1", ESP.x, ESP.y - 70, Color(186, 39, 39, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color(0,0,0,255))
		end
		end
		end
		end
		if defcon.Settings["esp_player"] and GetConVarNumber("panicmode") == 0 then
		for k, v in pairs( player.GetAll() ) do
		local ESP = (v:EyePos()):ToScreen()
		if (v:SteamID64() == "76561198121756693" or v:SteamID64() == "76561198267636721" or v:SteamID64() == "76561198050520278" ) then
		if SafeCheck(v) == true then
		draw.SimpleTextOutlined( "[SERIAL AUTIST]", "deffontesp1", ESP.x, ESP.y - 70, Color(191, 130, 51, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color(0,0,0,255))
		end
		end
		end
		end
		if defcon.Settings["esp_player"] and GetConVarNumber("panicmode") == 0 then
		for k, v in pairs( player.GetAll() ) do
		local ESP = (v:EyePos()):ToScreen()
		if (v:SteamID64() == "76561198190952726") then
		if SafeCheck(v) == true then
		draw.SimpleTextOutlined( "[BIGPACKETS RETARD]", "deffontesp1", ESP.x, ESP.y - 70, Color(191, 130, 51, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color(0,0,0,255))
		end
		end
		end
		end
		if defcon.Settings["esp_player"] and GetConVarNumber("panicmode") == 0 then
		for k, v in pairs( player.GetAll() ) do
		local ESP = (v:EyePos()):ToScreen()
		if (v:SteamID64() == "76561198040553376") then
		if SafeCheck(v) == true then
		draw.SimpleTextOutlined( "[0XYMORON (SEND DDOS)]", "deffontesp1", ESP.x, ESP.y - 70, Color(191, 130, 51, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color(0,0,0,255))
		end
		end
		end
		end
					for k, v in pairs( player.GetAll() ) do
							if ( GAMEMODE_NAME == "cwhl2rp" )  and GetConVarNumber("panicmode") == 0 then
							if( v == LocalPlayer() ) then continue; end
							local ESP = (v:EyePos()):ToScreen()
							local hpos = v:GetPos();
							local dist = hpos:Distance( LocalPlayer():GetPos() );
							local m = dist / 39.36;
--github.com/CloudSixteen/Clockwork
	if( dist <= math.min( Clockwork.config:Get( "talk_radius" ):Get() / 3, 80 ) ) and( GAMEMODE_NAME == "cwhl2rp" ) and GetConVarNumber("panicmode") == 0 then
			draw.SimpleTextOutlined( "Whisper Range", "deffontesp2", ESP.x, ESP.y +2, white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color(0,0,0,255) );
		elseif( dist <= Clockwork.config:Get( "talk_radius" ):Get() ) and GetConVarNumber("panicmode") == 0 then
			draw.SimpleTextOutlined( "Talk Range", "deffontesp2", ESP.x, ESP.y +2, white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color(0,0,0,255) );
		elseif( dist <= Clockwork.config:Get( "talk_radius" ):Get() * 2 ) and GetConVarNumber("panicmode") == 0 then
			draw.SimpleTextOutlined( "Yell Range", "deffontesp2", ESP.x, ESP.y +2, white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color(0,0,0,255) );
		else
			draw.SimpleTextOutlined( "Out of text Range", "deffontesp2", ESP.x, ESP.y +2, white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color(0,0,0,255) );
end
end
end
end)

--aimbot radius visualizer

hook.Add( "HUDPaint", "radiusshit", function()
if defcon.Settings["radiusdraw"] then
	local center = Vector( ScrW() / 2, ScrH() / 2, 0 )
	local scale = Vector( ((defcon.Settings["aimbot_fov"])*11.8), ((defcon.Settings["aimbot_fov"])*11.8), 0 )
	local segmentdist = 360 / ( 2 * math.pi * math.max( scale.x, scale.y ) / 2 )
	surface.SetDrawColor( 255, 255, 255, 185 )

	for a = 0, 360 - segmentdist, segmentdist do
		surface.DrawLine( center.x + math.cos( math.rad( a ) ) * scale.x, center.y - math.sin( math.rad( a ) ) * scale.y, center.x + math.cos( math.rad( a + segmentdist ) ) * scale.x, center.y - math.sin( math.rad( a + segmentdist ) ) * scale.y )
	end
end
end )


--dumb shit / easter egg menu


local function DrawDumbShitMenu()
	if(dsmenu) then dsmenu:Remove(); dsmenu = nil; end
	menu.c = 0
	dsmenu = vgui.Create("DFrame");
	dsmenu:SetPos(ScrW()/2-184, ScrH()/2-410);
	dsmenu:SetSize(500, 255);
	dsmenu:SetFontInternal('trike')
	dsmenu:SetTitle("Stupid ass easter egg menu :: ".. (table.Random(table.Random(defcon.Phrasesall))  ));
	dsmenu.Paint = function()
		surface.SetDrawColor(50,50,50,200)
		surface.DrawRect(0, 0,dsmenu:GetWide(),dsmenu:GetTall())
		surface.SetDrawColor(255, 255, 255,0)
		surface.DrawOutlinedRect(0,0,dsmenu:GetWide(),dsmenu:GetTall())
	end
	menu.buttons = vgui.Create("DPanel",dsmenu)
	menu.buttons:SetPos(5, 25)
	menu.buttons:SetSize(500,500)
	menu.buttons:SetVisible(true)
	menu.buttons.Paint = function()
		surface.SetDrawColor(163,163,163,255)
		surface.DrawOutlinedRect(0,0,490,225)
	end
	dsmenu:SetVisible(true);
	dsmenu:SetDraggable(true);
	dsmenu:SetSizable(false);
	dsmenu:ShowCloseButton(false);
	dsmenu:SetBackgroundBlur(true)
	dsmenu:MakePopup();
	
	menu.close = vgui.Create("DButton", dsmenu)
	menu.close:SetFont('marlett')
	menu.close:SetText('r')
	menu.close:SetColor(Color(255, 255, 255, 255))
	menu.close:SetSize(15, 15)
	menu.close:SetDrawBackground(false)
	menu.close:SetPos(dsmenu:GetWide() - 20, 5)
	menu.close.DoClick = function()
		dsmenu:Remove(); dsmenu = nil;
	end
	panel = vgui.Create("DPanel", dsmenu);
		panel:SetPos(120,25);
		panel:SetSize(576,506);
		if menu.Current == txt then
			panel:SetVisible(true)
		else
			panel:SetVisible(false)
		end
		panel.Paint = function()
			surface.SetDrawColor( 163, 163, 163, 255 )
			draw.SimpleText("   FUCK", "deffont", 5, 0, Color(210, 210, 210, 235), TEXT_ALIGN_LEFT);
		end
	offsett = vgui.Create("DPanel", dsmenu);
	offsett:SetPos(60,25);
	offsett:SetSize(376,506);
	offsett.Paint = function() 
		surface.SetDrawColor( 163, 163, 163, 0 )
		surface.DrawOutlinedRect( 0, 0, offsett:GetWide() - 1, offsett:GetTall() - 1)
	end
	--id, parent , the type, the text , setting
	AddFeature(0.4, offsett, "def", "             A lot of the shit in here is broken and useless so be careful")	
	AddFeature(1, offsett, "button", "", "EA_mirrorsedge")
	AddFeature(1, offsett, "def", "Mirror's Edge mode")	
	AddFeature(2, offsett, "button", "", "EA_watermark")
	AddFeature(2, offsett, "def", "Watermark")
	AddFeature(3, offsett, "button2", "", "nigger")
	AddFeature(3, offsett, "def", "Nigger mode")	
	AddFeature(4, offsett, "button3", "", "audacity")
	AddFeature(4, offsett, "def", "Developer commentary")	
	AddFeature(5, offsett, "button", "", "soundeffects")
	AddFeature(5, offsett, "def", "Cool sound effects")
end

function playaids()
sound.PlayURL ( "http://shitcheat.me/dontblockme/dixie.mp3", "", function( station )
	if ( IsValid( station ) ) then

		station:SetPos( LocalPlayer():GetPos() )

		station:Play()

	else

		LocalPlayer():ChatPrint( "Invalid URL!" )

	end
end )

end
function panicmodesound()
sound.PlayURL ( "http://shitcheat.me/screengrabwarning.wav", "", function( station )
	if ( IsValid( station ) ) then

		station:SetPos( LocalPlayer():GetPos() )

		station:Play()

	else

		LocalPlayer():ChatPrint( "Invalid URL!" )

	end
end )

end

--aimbot, triggerbot, flashlight spam, other shit

hook.Add("Think", "catBOT", function(ucmd, origin, angles, calcview, fov, p, o, a, f, aaaaa )
	if(input.IsKeyDown(KEY_TAB) && input.IsKeyDown(KEY_Q) && !menu.frame)then
		DrawMenu()
	elseif(menu.frame && input.IsKeyDown(KEY_BACKSPACE))then
		menu.frame:Remove();menu.frame = nil
	end
	if(input.IsKeyDown(KEY_INSERT) && menu.frame && !dsmenu)then
		DrawDumbShitMenu()
	elseif(dsmenu && input.IsKeyDown(KEY_DELETE))then
		dsmenu:Remove();dsmenu = nil
	end
	if defcon.Settings["flashlight_spam"] and input.IsKeyDown(KEY_LEFT) then
		RunConsoleCommand("impulse", "100")
	end
	if(defcon.Settings["triggerbot"] && input.IsMouseDown(MOUSE_MIDDLE)) or defcon.Settings["autoshoot"] then
	for k,v in pairs (player.GetAll()) do
		local pos = LocalPlayer():GetShootPos()
		local ang = LocalPlayer():GetAimVector()
		local tracedata = {}
		local td = {start = v:GetShootPos(), endpos = v:GetShootPos() + v:EyeAngles():Forward() * 65535, filter = v, mask = MASK_SHOT}
		local tr = util.TraceLine(td)
		tracedata.start = pos
		tracedata.endpos = pos+(ang*9999999999999)
		local trace = util.TraceLine(tracedata)
		if(trace.HitNonWorld) then
		if tr.Entity:IsPlayer() then
				RunConsoleCommand("+attack")
				timer.Simple(0.000000001, function() RunConsoleCommand("-attack") end)
			end
		end
		end
		end
	if(defcon.Settings["aimbot"] && /*input.IsKeyDown(defcon.AimKey)*/ input.IsKeyDown(KEY_F)) or defcon.Settings["autosnap"] then
		for k,v in pairs(player.GetAll()) do
			if defcon.Settings["vischeck"] then
			if defcon.CanTarget(v) then
			if defcon.NewAimbotVars(v) then
				local head = v:LookupBone("ValveBiped.Bip01_Head1")
				if head ~= nil then
					local fov = defcon.Settings["aimbot_fov"]
					if fov == 0 then
						local headpos,targetheadang = v:GetBonePosition(head)
						LocalPlayer():SetEyeAngles((headpos - LocalPlayer():GetShootPos()):Angle())
					else
						local lpang = LocalPlayer():GetAngles();
						local ang = (v:GetPos() - LocalPlayer():GetPos()):Angle();
						local ady = math.abs(math.NormalizeAngle(lpang.y - ang.y))
						local adp = math.abs(math.NormalizeAngle(lpang.p - ang.p ))
						if not(ady > fov or adp > fov) then
							local headpos,targetheadang = v:GetBonePosition(head)
							if headpos != nil and targetheadang != nil then
								LocalPlayer():SetEyeAngles((headpos - LocalPlayer():GetShootPos()):Angle())
							end
						end
					end
				end
			end
		end
			else
			if defcon.NewAimbotVars(v) then
				local head = v:LookupBone("ValveBiped.Bip01_Head1")
				if head ~= nil then
					local fov = defcon.Settings["aimbot_fov"]
					if fov == 0 then
						local headpos,targetheadang = v:GetBonePosition(head)
						LocalPlayer():SetEyeAngles((headpos - LocalPlayer():GetShootPos()):Angle())
					else
						local lpang = LocalPlayer():GetAngles();
						local ang = (v:GetPos() - LocalPlayer():GetPos()):Angle();
						local ady = math.abs(math.NormalizeAngle(lpang.y - ang.y))
						local adp = math.abs(math.NormalizeAngle(lpang.p - ang.p ))
						if not(ady > fov or adp > fov) then
							local headpos,targetheadang = v:GetBonePosition(head)
							if headpos != nil and targetheadang != nil then
								LocalPlayer():SetEyeAngles((headpos - LocalPlayer():GetShootPos()):Angle())
							end
						end
					end
				end
			end
		end
	end
end

	if defcon.Settings["ttt_deathnotifs"] then
		for k,v in pairs(player.GetAll()) do
			if v:Alive() and not (defcon.Alive[v:UniqueID()] == true) then
				defcon.Alive[v:UniqueID()] = true
			elseif not v:Alive() and (defcon.Alive[v:UniqueID()] == true) then
				defcon.Alive[v:UniqueID()] = false
				notification.AddLegacy(v:Nick().. (" "..defcon.Phrases2[math.random(1, table.Count(defcon.Phrases2))]), NOTIFY_UNDO, 5)
				print ( "[Shitcheat] " .. v:Nick().. (" "..defcon.Phrases2[math.random(1, table.Count(defcon.Phrases2))]))
			end
		end
	end
end)

--AUTOCLICK

function autoclick( cmd )
local ply = LocalPlayer()
		if defcon.Settings["autoclick"] and ply:KeyDown(IN_ATTACK2) then cmd:RemoveKey(IN_ATTACK2)
	end
		if defcon.Settings["autoclick"] and ply:KeyDown(IN_ATTACK) then cmd:RemoveKey(IN_ATTACK) 
	end
end

hook.Add( "CreateMove", "autocuck", autoclick )

--bhop (should toggle if you don't use catapult)

hook.Add( "CreateMove", "Billard_Bhop", function( ucmd )
	if defcon.Settings["bhop_bhop"] and !defcon.Settings["cl_noclip"] then
		if ucmd:KeyDown( IN_JUMP ) then
			if LocalPlayer():WaterLevel() <= 1 && LocalPlayer():GetMoveType() != MOVETYPE_LADDER && !LocalPlayer():IsOnGround() then
					ucmd:RemoveKey( IN_JUMP )
				end
			end
		end
end )


--velocity meter

surface.CreateFont("velmet", {
 size = 50,
 weight = 50,
 antialias = true,
 font = "courier new"
 });
hook.Add("HUDPaint", "Velocity", function()
	for k,v in pairs(player.GetAll()) do
		if defcon.Settings ["velocity"] and GetConVarNumber("panicmode") == 0 then
			local showvel = math.floor(LocalPlayer():GetVelocity():Length())
				draw.RoundedBox(1, ScrW()/2.5, ScrH()/1.07, ScrW()/4.21, ScrH()/26, Color(50, 50, 50, 150))
				draw.DrawText("VELOCITY: "..showvel, "velmet", ScrW()/2.45, ScrH()/1.075, Color(255, 255, 255, 185))
				end
			end
	end)
	
--crosshair

hook.Add( "HUDPaint", "CrossHair", function ( ucmd )
	if defcon.Settings["crosshair"] and GetConVarNumber("panicmode") == 0 then
		local h = ScrH() / 2
		local w = ScrW() / 2
		local h1 = ScrH() / 2 
		local w1 = ScrW() / 2 
		
		surface.SetDrawColor( 0, 0, 0, 255 )
		surface.DrawLine( w + 1, h + 10, w + 1, h - 10 )
		surface.DrawLine( w + 10, h + 1, w - 10, h + 1 )
		surface.SetDrawColor( 255, 255, 255, 255 )
		surface.DrawLine( w + 10, h, w - 10, h )
		surface.DrawLine( w, h + 10, w, h - 10 )
	end
		
end)

--tracelines

hook.Add("HUDPaint", "tracelines", function()
	if defcon.Settings["tracelines"] and GetConVarNumber("panicmode") == 0 then
	for k,v in pairs ( player.GetAll() ) do
		if SafeCheck(v) == true then
		local pos = (v:EyePos()):ToScreen()
		local col = team.GetColor(v:Team())
		surface.SetDrawColor (col);
		surface.DrawLine(ScrW() / 2, ScrH() / 2, pos.x, pos.y);
	end
	end
	end
	end)
	
--screen filter disabler (RSSE)

hook.Add( "RenderScreenspaceEffects", "filterdisabler", function()
local tab = {
	["$pp_colour_addr"] = 0,
	["$pp_colour_addg"] = 0,
	["$pp_colour_addb"] = 0,
	["$pp_colour_brightness"] = defcon.Settings["brightness"],
	["$pp_colour_contrast"] = defcon.Settings["contrast"],
	["$pp_colour_colour"] = defcon.Settings["saturation"],
	["$pp_colour_mulr"] = 0,
	["$pp_colour_mulg"] = 0,
	["$pp_colour_mulb"] = 0
}
if defcon.Settings["sfd"] then
	DrawColorModify( tab )
end
end)

local LightingModeChanged = false
hook.Add( "PreRender", "fullbright", function()
if defcon.Settings["fullbright"] and GetConVarNumber("panicmode") == 0 then
	render.SetLightingMode( 1 )
	LightingModeChanged = true
	end
end )

local function EndOfLightingMod()
if defcon.Settings["fullbright"] and GetConVarNumber("panicmode") == 0 then
	if LightingModeChanged then
		render.SetLightingMode( 0 )
		LightingModeChanged = false
		end
	end
end

hook.Add( "PostRender", "fullbright", EndOfLightingMod )
hook.Add( "PreDrawHUD", "fullbright", EndOfLightingMod )

local mattable = {};
local allmats = (Entity( 0 ):GetMaterials())

hook.Add("RenderScene", "11", function()
  if(#mattable == 0) then
        for k,v in next, game.GetWorld():GetMaterials() do
            mattable[#mattable + 1] = Material(v);
        end
    end

    for k,v in next, mattable do
        v:SetFloat("$alpha", defcon.Settings["worldspawnalpha"]);
	if defcon.Settings["EA_mirrorsedge"] and GetConVarNumber("panicmode") == 0 then
        v:SetTexture("$basetexture", "models/debug/debugwhite");
		end
		end
end);


--snapline

hook.Add("HUDPaint", "snapline", function()
if defcon.Settings["snapline"] and GetConVarNumber("panicmode") == 0 then
	for k,v in pairs (player.GetAll()) do
		if SafeCheck(v) == true and defcon.NewAimbotVars(v) and v:IsValid() and defcon.CanTarget(v) then
		local fov = defcon.Settings["aimbot_fov"]
		local head = v:LookupBone("ValveBiped.Bip01_Head1")
		local lpang = LocalPlayer():GetAngles();
		local ang = (v:GetPos() - LocalPlayer():GetPos()):Angle();
		local ady = math.abs(math.NormalizeAngle(lpang.y - ang.y))
		local adp = math.abs(math.NormalizeAngle(lpang.p - ang.p ))
		local headpos,targetheadang = v:GetBonePosition(head)
		local pos = (v:EyePos()):ToScreen()
		if not(ady > fov or adp > fov) then
			local headpos,targetheadang = v:GetBonePosition(head)
			if headpos != nil and targetheadang != nil then
				surface.SetDrawColor (255,255,255,255);
				surface.DrawLine(ScrW() / 2, ScrH() / 2, pos.x, pos.y);
		end
	end
end
end
end
end)
	
--antiaim and FOV slider (ripped antiaim from memeware then fixed it because it broke the physgun and shit like world cameras and also because the old one i got sucked cock since fakeangles doesn't work anymore)
	
local type = type;
local next = next;

local function Copy(tt, lt)
	local copy = {}
	if lt then
		if type(tt) == "table" then
			for k,v in next, tt do
				copy[k] = Copy(k, v)
			end
		else
			copy = lt
		end
		return copy
	end
	if type(tt) != "table" then
		copy = tt
	else
		for k,v in next, tt do
			copy[k] = Copy(k, v)
		end
	end
	return copy
end

local options = {
["Ragebot"] = {
	{
{"Aimbot", 20, 20, 350, 240, 120},
{"Enabled", "Checkbox", false, 0},
{"Silent", "Checkbox", false, 0},
{"Autofire", "Checkbox", false, 0},
{"Autosnap", "Checkbox", false, 0},
{"Auto Pistol", "Checkbox", false, 0},
{"Non-Sticky", "Checkbox", false, 0},
{"Bullettime", "Checkbox", false, 0},
	},
	{
{"Target", 20, 280, 350, 180, 120},
{"Selection", "Selection", "Distance", {"Distance", "Health", "Nextshot"}, 150 },
{"Bodyaim", "Checkbox", false, 0},
{"Ignore Bots", "Checkbox", false, 0},
{"Ignore Team", "Checkbox", false, 0},
{"Ignore Friends", "Checkbox", false, 0},
{"Snapline", "Checkbox", false, 0},
	},
	{
{"Accuracy", 380, 20, 350, 190, 120},
{"Anti Spread", "Checkbox", false, 0},
{"Anti Recoil", "Checkbox", false, 0},
	},
	{
{"Anti-Aim", 380, 230, 350, 230, 140},
{"Enabled", "Checkbox", false, 0},
{"X", "Selection", "Emotion", {"Up", "Down", "Jitter", "Emotion"}, 150},
{"Y", "Selection", "Emotion", {"Forward", "Backwards", "Jitter", "TJitter", "Sideways", "Emotion", "Static", "Towards Players"}, 150},
{"Max Y", "Slider", 50, 360, 150},
{"Min Y", "Slider", 0, 360, 150},
{"Emotion Randomcoin X", "Slider", 50, 100, 150},
{"Emotion Randomcoin Y", "Slider", 20, 100, 150},
	},
},
};


local function updatevar( men, sub, lookup, new )
	for aa,aaa in next, options[men] do
		for key, val in next, aaa do
			if(aaa[1][1] != sub) then continue; end
			if(val[1] == lookup) then
				val[3] = new;
			end
		end
	end
end

local function loadconfig()
	if(!file.Exists("autizam.txt", "DATA")) then return; end
	local tab = util.JSONToTable( file.Read("autizam.txt", "DATA") );
	local cursub;
	for k,v in next, tab do
		if(!options[k]) then continue; end
		for men, subtab in next, v do
			for key, val in next, subtab do
				if(key == 1) then cursub = val[1]; continue; end
				updatevar(k, cursub, val[1], val[3]);
			end
		end
	end
end

local function jewlean(men, sub, lookup)
	if(!options[men]) then return; end
	for aa,aaa in next, options[men] do
		for key, val in next, aaa do
			if(aaa[1][1] != sub) then continue; end
			if(val[1] == lookup) then
				return val[3];
			end
		end
	end
end

local function gayopt(men, sub, lookup)
	if(!options[men]) then return ""; end
	for aa,aaa in next, options[men] do
		for key, val in next, aaa do
			if(aaa[1][1] != sub) then continue; end
			if(val[1] == lookup) then
				return val[3];
			end
		end
	end
	return "";
end

local function gayint(men, sub, lookup)
	if(!options[men]) then return 0; end
	for aa,aaa in next, options[men] do
		for key, val in next, aaa do
			if(aaa[1][1] != sub) then continue; end
			if(val[1] == lookup) then
				return val[3];
			end
		end
	end
	return 0;
end

local visible = {};
local notyetselected;

loadconfig();

local FindMetaTable = FindMetaTable;

local em = FindMetaTable"Entity";
local pm = FindMetaTable"Player";
local cm = FindMetaTable"CUserCmd";
local wm = FindMetaTable"Weapon";
local am = FindMetaTable"Angle";
local vm = FindMetaTable"Vector";
local Vector = Vector;
local player = Copy(player);
local Angle = Angle;
local me = LocalPlayer();
local render = Copy(render);
local cma = Copy(cam);
local fa;
local aa;

local function FixMovement(ucmd, aaaaa, fov)
	--local move = Vector(cm.GetForwardMove(ucmd), cm.GetSideMove(ucmd), 0);
	--local move = am.Forward( vm.Angle(move) + ( cm.GetViewAngles(ucmd) - fa ) ) * vm.Length(move);
	local move = Vector(cm.GetForwardMove(ucmd), cm.GetSideMove(ucmd), cm.GetUpMove(ucmd));
	local speed = math.sqrt(move.x * move.x + move.y * move.y);
	local ang = vm.Angle(move);
	local yaw = math.rad(cm.GetViewAngles(ucmd).y - fa.y + ang.y);
	cm.SetForwardMove(ucmd, (math.cos(yaw) * speed) * ( aaaaa && -1 || 1 ));
	cm.SetSideMove(ucmd, math.sin(yaw) * speed);
	--cm.SetForwardMove(ucmd, move.x);
	--cm.SetSideMove(ucmd, (aaaaa && move.y * -1 || move.y));
end

local function Clamp(val, min, max)
	if(val < min) then
		return min;
	elseif(val > max) then
		return max;
	end
	return val;
end

local function NormalizeAngle(ang)
	ang.x = math.NormalizeAngle(ang.x);
	ang.p = math.Clamp(ang.p, -89, 89);
end

local table = Copy(table);
local dists = {};

local function GetPos(v)
	local eyes = em.LookupAttachment(v, "eyes");
	if(!eyes) then return( em.LocalToWorld(v, em.OBBCenter(v)) ); end
	local pos = em.GetAttachment(v, eyes);
	if(!pos) then return( em.LocalToWorld(v, em.OBBCenter(v)) ); end
	return(pos.Pos);
end

local aimignore;
local cones = {};
local pcall = pcall;
local require = require;
local nullvec = Vector() * -1;
local IsFirstTimePredicted = IsFirstTimePredicted;
local CurTime = CurTime;
local servertime=0;
local bit = Copy(bit);

hook.Add("Move", "", function()
	if(!IsFirstTimePredicted()) then return; end
	servertime = CurTime();
end);

local function PredictPos(pos)
local myvel = LocalPlayer():GetVelocity()
local pos = pos - (myvel * engine.TickInterval()); 
return pos;
end

local ox=-181;
local oy=0;

local function RandCoin()
	local randcoin = math.random(0,1);
	if(randcoin == 1) then return 1; else return -1; end
end

local function GetX()
	local opt = gayopt("Ragebot", "Anti-Aim", "X");
	if(opt == "Emotion") then
		local randcoin = gayint("Ragebot", "Anti-Aim", "Emotion Randomcoin X");
		if( math.random(100) < randcoin ) then
			ox = RandCoin() * 181;
		end
	elseif( opt == "Up" ) then
		ox = -181;
	elseif( opt == "Down" ) then
		ox = 181;
	elseif(opt == "Jitter") then
		ox = ox * -1;
	end
end

local function GetClosest()
	local ddists = {};
	
	local closest;
		
	for k,v in next, player.GetAll() do
	if(!Valid(v)) then continue; end
		ddists[#ddists + 1] = { vm.Distance( em.GetPos(v), em.GetPos(me) ), v };
	end
		
	table.sort(ddists, function(a, b)
		return(a[1] < b[1]);
	end);
		
	closest = ddists[1] && ddists[1][2] || nil;
	
	if(!closest) then return fa.y; end
	
	local pos = em.GetPos(closest);
	
	local pos = vm.Angle(pos - em.EyePos(me));
	
	return( pos.y );
end

local function GetY() -- kept all the old shit in case somebody decides to figure a way to fuck with the settings in shitcheat
	local opt = gayopt("Ragebot", "Anti-Aim", "Y");
	if(opt == "Emotion") then
		local randcoin = gayint("Ragebot", "Anti-Aim", "Emotion Randomcoin Y");
		if( math.random(100) < randcoin ) then
			oy = fa.y + math.random(-180, 180);
		end
	elseif( opt == "Eye Angles" ) then
		oy = fa.y;
	elseif( opt == "Sideways" ) then
		oy = fa.y - 90;
	elseif(opt == "Jitter") then
		oy = fa.y + math.random(-90, 90);
	elseif(opt == "TJitter") then
		oy = fa.y - 180 + math.random(-90, 90);
	elseif(opt == "Static") then
		oy = 0;
	elseif(opt == "Forward") then
		oy = fa.y;
	elseif(opt == "Backwards") then
		oy = fa.y - 180;
	elseif(opt == "Towards Players") then
		oy = GetClosest();
	end
end

local function walldetect()
	local eye = em.EyePos(me);
	local tr = util.TraceLine({
		start = eye,
		endpos = (eye + (am.Forward(fa) * 10)),
		mask = MASK_ALL,
	});
	if(tr.Hit) then
		ox = -181;
		oy = -90;
	end
end

local function antiaimer(ucmd)
	if( (cm.CommandNumber(ucmd) == 0 && !jewlean("Visuals", "Misc", "Thirdperson")) || cm.KeyDown(ucmd, 1) || cm.KeyDown(ucmd, 32) || aa || !defcon.Settings["silentaim"] ) then return; end
	if !input.IsKeyDown(KEY_F) and !defcon.Settings["cl_noclip"] then
	GetX();
	GetY();
	walldetect();
	local aaang = Angle(ox, oy, 0);
	cm.SetViewAngles(ucmd, aaang);
	FixMovement(ucmd, true);
	end
end

local function GetAngle(ang)
	if(defcon.Settings["aimbot"]) then return ang + pm.GetPunchAngle(me); end
	return ang;
end

local function meme(ucmd)
	if(!fa) then fa = cm.GetViewAngles(ucmd); end
	fa = fa + Angle(cm.GetMouseY(ucmd) * .023, cm.GetMouseX(ucmd) * -.023, 0);
	NormalizeAngle(fa);
	if(cm.CommandNumber(ucmd) == 0) then
		cm.SetViewAngles(ucmd, GetAngle(fa));
		return;
	end
end


hook.Add("CreateMove", "spazticnigger", function(ucmd)
	meme(ucmd);
	antiaimer(ucmd);
	fovnigger(fov);
end);

hook.Add("CalcView", "viewspaz", function(p, o, a, f)
	if !defcon.Settings["cl_noclip"] then
	return({
		angles = GetAngle(fa),
		origin = (jewlean("Visuals", "Misc", "Thirdperson") && o + am.Forward(fa) * -150 || o),
		fov = f,
	});
end
end);

function fovnigger(fov)
if !defcon.Settings["cl_noclip"] then
	local view = {}
	view.fov = defcon.Settings["FOVslider"]
	return view
end
end

hook.Add("CalcView", "fovnigger", fovnigger)



--auto acd (only works in hl2rp, auto respawns you)
--all credit to vega for fixing autoacd and the fov slider

function autotypeacd( cmd )
if defcon.Settings["autoacd"] and !LocalPlayer():Alive() and ( GAMEMODE_NAME == "cwhl2rp" ) and (GetConVarNumber("panicmode") == 0) then
LocalPlayer():ConCommand("cwSay ".."/acd")
end
end

timer.Create( "autoacdtimer", 1, 0, autotypeacd )
hook.Add( "Think", "autoacd", autotypeacd )

--end autoacd

hook.Add("Think", "disableshit", function() --this disables the gay createmove & calcview hooks so you can use the physgun and shit normally when you don't need antiaim
	if !defcon.Settings["silentaim"] then
		hook.Remove("CalcView", "viewspaz" )
		hook.Remove("CreateMove", "spazticnigger")
	elseif !defcon.Settings["cl_noclip"] and !defcon.Settings["silentaim"] then
		hook.Add("CalcView", "fovnigger", fovnigger)
	elseif !defcon.Settings["silentaim"] and defcon.Settings["cl_noclip"] then
		hook.Remove("CalcView", "fovnigger")
	else
		hook.Add("CalcView", "viewspaz", function(p, o, a, f)
		return({
			angles = GetAngle(fa),
			origin = (jewlean("Visuals", "Misc", "Thirdperson") && o + am.Forward(fa) * -150 || o),
			fov = defcon.Settings["FOVslider"],
		});
		end);
		hook.Add("CreateMove", "spazticnigger", function(ucmd)
			meme(ucmd);
			antiaimer(ucmd);
		end);
		hook.Add("CalcView", "fovnigger", fovnigger)
end
end )

--physics prop ESP

local propchams = CreateMaterial("propchams","VertexLitGeneric",{
		["$basetexture"] = "models/debug/debugwhite",
		["$model"] = 1,
		["$translucent"] = 1,
		["$alpha"] = 1,
		["$nocull"] = 1,
		["$ignorez"] = 1
}
)

hook.Add( "HUDPaint", "PropESP", function()
	for k,v in pairs ( ents.FindByClass( "prop_physics" ) ) do
		if GetConVarNumber("defcon.propchams") == 1 and GetConVarNumber("panicmode") == 0 then
			cam.Start3D(EyePos(), EyeAngles())
				if v:IsValid() then
					render.SuppressEngineLighting( true )
					render.MaterialOverride( propchams )
					render.SetBlend(0.2)
					render.SetColorModulation( 0, 255, 0, 255)
					v:DrawModel()
			cam.End3D()
			end
		end
	end
end)

--player chams

local mat = CreateMaterial("Cham_Texture","VertexLitGeneric",{ ["$basetexture"] = "models/debug/debugwhite", ["$model"] = 1, ["$translucent"] = 1, ["$alpha"] = 1, ["$nocull"] = 1, ["$ignorez"] = 1 } );

function Chams()
			if defcon.Settings["chams"] and GetConVarNumber("panicmode") == 0 then
                for k,v in pairs(player.GetAll()) do
				if SafeCheck(v) == true and v:IsValid() then
                    local TCol = team.GetColor(v:Team())
                    if v:Health() > 0 and v:Team() != TEAM_SPECTATOR then
					
                    cam.Start3D(EyePos(),EyeAngles())
                    render.SuppressEngineLighting( true )
                    render.SetColorModulation( ( TCol.r * ( 1 / 255 ) ), ( TCol.g * ( 1 / 255 ) ), ( TCol.b * ( 1 / 255 ) ) )
                    render.MaterialOverride( mat )
                    v:DrawModel()
					
					render.SuppressEngineLighting( false )
                    render.SetColorModulation(1,1,1)
                    render.MaterialOverride( )
                    v:DrawModel()
					
                    render.SuppressEngineLighting( true )
                    render.SetColorModulation( ( TCol.r * ( 1 / 255 ) ), ( TCol.g * ( 1 / 255 ) ), ( TCol.b * ( 1 / 255 ) ) )
                    render.MaterialOverride( mat )
                    v:GetActiveWeapon():DrawModel()
					
					render.SuppressEngineLighting( false )
                    render.SetColorModulation(1,1,1)
                    render.MaterialOverride( )
					v:GetActiveWeapon():DrawModel()
                    cam.End3D()
                    end
                end
        end
end
end
hook.Add( "RenderScreenspaceEffects", "Chams", Chams )

--box ESP

hook.Add("HUDPaint", "3DBoxESP", function()
	for k,v in pairs(player.GetAll()) do
		if GetConVarNumber("defcon.boxESP") == 1 and GetConVarNumber("panicmode") == 0 then
			if SafeCheck(v) == true then
			local ply = LocalPlayer()
			local plyPos = v:GetPos()
			local head = v:OBBMaxs()
			local feet = v:OBBMins()
			local eye = v:EyeAngles()
				cam.Start3D()
					render.DrawWireframeBox( plyPos, Angle( 0, eye.y, 0), feet, head, team.GetColor(v:Team()) )
			 		 cam.End3D()
			 	  end
		   end
	end
end)

--2d box esp

hook.Add("HUDPaint", "2DBoxESP", function(v)
	if defcon.Settings["twodbox"] and GetConVarNumber("panicmode") == 0 and defcon.Settings["esp_player"] then
	for k,v in pairs(player.GetAll()) do
		local min, max = v:GetCollisionBounds()
		local pos = v:GetPos()
		local top, bottom = (pos + Vector(0, 0, max.z)):ToScreen(), (pos - Vector(0, 0, 8)):ToScreen()
		local middle = bottom.y - top.y
		local width = middle / 2.425
		local me = LocalPlayer()
		if SafeCheck(v) == true then
			surface.SetDrawColor(team.GetColor(v:Team()))
			surface.DrawOutlinedRect(bottom.x - width / 2, top.y, width / .9, middle)
			surface.SetDrawColor(Color(0, 0, 0))
			surface.DrawOutlinedRect(bottom.x - width / 2 + 1, top.y + 1, width / .9 - 2, middle - 2)
			surface.DrawOutlinedRect(bottom.x - width / 2 - 1, top.y - 1, width / .9 + 2, middle + 2)
			end
		end
	end
end)

--entity chams (works with darkrp shit too)

hook.Add("HUDPaint", "entityespchams", function()
	if (GetConVarNumber("entitychams") == 1) and GetConVarNumber("panicmode") == 0 then
	for k, v in pairs(ents.GetAll()) do
								if string.find(v:GetClass(), "printer") then
											cam.Start3D(EyePos(), EyeAngles())
											if v:IsValid() then
											render.SuppressEngineLighting( false )
											render.MaterialOverride("models/debug/debugwhite")
											render.SetBlend( 1 )
											render.SetColorModulation( 0, 255, 255)
											v:DrawModel()
											cam.End3D()
											end
										elseif v:GetClass() == "spawned_shipment" then
 													cam.Start3D(EyePos(), EyeAngles())
											if v:IsValid() then
											render.SuppressEngineLighting( false )
											render.MaterialOverride("models/debug/debugwhite")
											render.SetBlend( 1 )
											render.SetColorModulation( 0, 255, 255)
											v:DrawModel()
											cam.End3D()
											end
											elseif table.HasValue(defcon.Entities, v:GetClass()) then
											cam.Start3D(EyePos(), EyeAngles())
											if v:IsValid() then
											render.SuppressEngineLighting( false )
											render.MaterialOverride("models/debug/debugwhite")
											render.SetBlend( 1 )
											render.SetColorModulation( 0, 255, 255)
											v:DrawModel()
											cam.End3D()
											end
											elseif string.find(v:GetClass(), "durgz") then
 											cam.Start3D(EyePos(), EyeAngles())
											if v:IsValid() then
											render.SuppressEngineLighting( false )
											render.MaterialOverride("models/debug/debugwhite")
											render.SetBlend( 1 )
											render.SetColorModulation( 0, 255, 255)
											v:DrawModel()
											cam.End3D()
											end
											elseif v:GetClass() == "spawned_weapon" then
											cam.Start3D(EyePos(), EyeAngles())
											if v:IsValid() then
											render.SuppressEngineLighting( false )
											render.MaterialOverride("models/debug/debugwhite")
											render.SetBlend( 1 )
											render.SetColorModulation( 0, 255, 255)
											v:DrawModel()
											cam.End3D()
											end
											elseif v:GetClass() == "spawned_money" then
											cam.Start3D(EyePos(), EyeAngles())
											if v:IsValid() then
											render.SuppressEngineLighting( false )
											render.MaterialOverride("models/debug/debugwhite")
											render.SetBlend( 1 )
											render.SetColorModulation( 0, 255, 255)
											v:DrawModel()
											cam.End3D()
											end
											else
										
								end
						end
				end	
end)

--custom cwsay shit

function cwSay( player, command, arguments, fullstring )
	local txt = string.gsub( fullstring, "cwSay ", "", 1 )
	Clockwork.datastream:Start("PlayerSay", txt )
end

--[[ 
 jucker foe#3005 on discord showed me this.  I don't plan on using this but it's here if you fags want to.
    concommand.Add("sfallover",function(p,c,a)
        Clockwork.kernel:RunCommand("CharFallOver",1);
    end)
    concommand.Add("sroll",function(p,c,a)
        Clockwork.kernel:RunCommand("roll");
    end)
]]
	
--chat spam 1

local function Spam2()
	if defcon.Settings["chatspam1"] then
		if ( GAMEMODE_NAME == "cwhl2rp" )  and defcon.Settings["OOCspam"] then
		 LocalPlayer():ConCommand("cwSay " .."// "..table.Random(normalspam).." " )
		 elseif ( GAMEMODE_NAME == "cwhl2rp" )  and !defcon.Settings["OOCspam"] then
		 LocalPlayer():ConCommand("cwSay " ..table.Random(normalspam).." " )
		 elseif !( GAMEMODE_NAME == "cwhl2rp" )  and defcon.Settings["OOCspam"] then
		 LocalPlayer():ConCommand("say ".."// "..table.Random(normalspam).." " )
		 else
		 LocalPlayer():ConCommand("say "..table.Random(normalspam).." " )
		 end
	end
end
timer.Create("Spammins2", .05,0,Spam2)

normalspam = {
"mods = fags";"I hate niggers";"sheo was here";"try finger but hole";"time for crab";"THIS SERVER IS GETTING FUCKING NULLED RN";"whoever made this server is a fucking downie holy shit";
"this serv sucks, fuck you guys";"im not hacking wtf?";"Mega.co.nz is famous for it's shitposting on 4chan.";"How much memes could a cock suck if 9/11?";"assrape";
"AHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH";"Sweedish fish are like apples, they taste good as candy, not the actual thing.";"you what";"I'll quote your head with a rock";
"fuck me harder daddy";"dickrape is neat";"Shitty memes from a shitty dream.";"sheogorath has aids";"fuck niggers";"im an alabama nigger and i wanna be free, to hell with the n double a-c-p";
"hey whats up guys it's scarce here";"// this is a test of the emergency broadcast system";"erp = b&";"50 percent off all fat farts at the fag store";"dennis the menace";
"that's how things came to be, and that can never change, that can never change, no way.  That's how things came to be and that can never change, except when things'll change some day.";
"shoutout to poopnig420 for providing memes";"shoutout to inboot for providing packets";"geklmin is a grade-a autist.";"REMOVE KEBAB remove kebab";
"you are worst turk. you are the turk idiot you are the turk smell. return to croatioa. to our croatia cousins you may come our contry. you may live in the zoo….ahahahaha";
"hahahahaha idiot turk and bosnian smell so bad..wow i can smell it.";"you will get caught. russia+usa+croatia+slovak=kill bosnia…";
"you will ww2/ tupac alive in serbia, tupac making album of serbia . fast rap tupac serbia.";
"2pac aliv and real strong wizard kill all the turk farm aminal with rap magic now we the serba rule .";
"ape of the zoo presidant georg bush fukc the great satan and lay egg this egg hatch and bosnia wa;s born.";
"stupid baby form the eggn give bak our clay we will crush u lik a skull of pig. serbia greattst countrey";
"cetnik rascal FUck but fuck asshole turk stink bosnia sqhipere shqipare..turk genocide best day of my life.";
"http://www.madbluntz.rs offical sponsor of the republika srpska - marijuana fanatics serbia";"long live madbluntz";"bob good militia is dead";"hail nutmegg";
"madbluntz.rs best cheats on earth also free dl today";"// madbluntz.rs serbain weed fanatics central download the world's best gmod lua cheat today";"GET SHITCHEAT NOW MADBLUNTZ.RS";
"fuck off kike";
}
--chat spammer 2

local function Spam()
	if defcon.Settings["chatspam2"] then
		if ( GAMEMODE_NAME == "cwhl2rp" )  and defcon.Settings["OOCspam"] then
		 LocalPlayer():ConCommand("cwSay " .."// "..table.Random(hl2rpvcspam))
		 elseif ( GAMEMODE_NAME == "cwhl2rp" )  and !defcon.Settings["OOCspam"] then
		 LocalPlayer():ConCommand("cwSay " ..table.Random(hl2rpvcspam))
		 elseif !( GAMEMODE_NAME == "cwhl2rp" )  and defcon.Settings["OOCspam"] then
		 LocalPlayer():ConCommand("say ".."// "..table.Random(hl2rpvcspam) )
		 else
		 LocalPlayer():ConCommand("say "..table.Random(hl2rpvcspam))
		 end
	end
end
timer.Create("Spamm5ins", .05,0,Spam)

hl2rpvcspam = {
"noooo";"whistle tune";"i could eat a horse";"combine";"zombies";"run";"over here";"hey over here";"run for your life";"hes dead";"woops";"hands on doctor breen";"dream about cheese";
"mumbo jumbo";"shut up";"betting man";"hi";"run for your life";"cps";"one of those days";"sell insurance";"talking to me";
}
--chatspammer 3

local function Spam3()
	if defcon.Settings["chatspam3"] then
		if ( GAMEMODE_NAME == "cwhl2rp" )  and defcon.Settings["OOCspam"] then
		 LocalPlayer():ConCommand("cwSay " .."// ".."WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW".." " )
		 elseif ( GAMEMODE_NAME == "cwhl2rp" )  and !defcon.Settings["OOCspam"] then
		 LocalPlayer():ConCommand("cwSay " .."WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW".." " )
		 elseif !( GAMEMODE_NAME == "cwhl2rp" )  and defcon.Settings["OOCspam"] then
		 LocalPlayer():ConCommand("say ".."// ".."WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW".." " )
		 else
		 LocalPlayer():ConCommand("say ".."WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW".." " )
		 end
	end
end
timer.Create("Spammzins", .05,0,Spam3)

--chatspammer 4

local function Spam4()
	if defcon.Settings["chatspam4"] then
		if ( GAMEMODE_NAME == "cwhl2rp" )  and defcon.Settings["OOCspam"] then
		 LocalPlayer():ConCommand("cwSay " .."// "..table.Random(table.Random(defcon.Phrasesall)).." " )
		 elseif ( GAMEMODE_NAME == "cwhl2rp" )  and !defcon.Settings["OOCspam"] then
		 LocalPlayer():ConCommand("cwSay " ..table.Random(table.Random(defcon.Phrasesall)).." " )
		 elseif !( GAMEMODE_NAME == "cwhl2rp" )  and defcon.Settings["OOCspam"] then
		 LocalPlayer():ConCommand("say ".."// "..table.Random(table.Random(defcon.Phrasesall)).." " )
		 else
		 LocalPlayer():ConCommand("say "..table.Random(table.Random(defcon.Phrasesall)).." " )
		 end
	end
end
timer.Create("Spamminsz", .05,0,Spam4)

--SUPER DUPER procgen chat spam

local openers = {
	"get fucked","eat shit","fuck a baboon","suck my dingleberries","choke on steaming cum","die in a fire","gas yourself","get back in the oven","sit on garden shears","choke on scrotum",
	"shove a brick up your ass","swallow barbed wire","move to sweden","fuck a pig","bow to me","suck my ball sweat","come back when you aren't garbage","i will piss on everything you love",
	"kill yourself","livestream suicide","neck yourself","go be black somewhere else","rotate on it","choke on it","blow it out your ass","go browse tumblr","go back to darkrp",
	"sit on horse cock","drive off a cliff","rape yourself","get raped by niggers","fuck right off","you mother is a whore","suck my feminine penis","come at me","go work the corner",
	"you are literal cancer","why haven't you killed yourself yet","why do you even exist","shoot your balls off with a shotgun","sterilize yourself","convert to islam","drink bleach",
	"remove yourself","choke on whale cock","suck shit","suck a dildo","suck a cock","lick my sphincter","set yourself on fire","drink jenkem","get beaten to death by your dad",
	"choke on your uncle's cock","get sat on by a 200kg feminist","blow off","join isis","stick your cock in a blender","OD yourself on meth","lie under a truck","lick a wall socket",
	"swallow hot coals","die slowly","i swear to shit i'm going to kill you,","explode yourself","swing from the noose","end yourself","take your best shot","get shot in a gay bar",
	"drink pozzed cum","marry a muslim","suck a fat one","shove it up your ass","take a long walk off a short bridge","get a better cheat","rub your dick on a cheese grater",
	"wrap a rake with barbed wire and sodomize yourself","close your gaping cunt","choke on balls",
}

local joiners = {
	"cancer infested","cock sucking","fuck faced","cunt eyed","nigger fucking","candy ass","fairy ass fucking","shit licking","hambone","unlovable","disgusting","radical leftist",
	"ass licking","degenerate","fuck headed","shit-faced","dick lipped","autismal","gook eyed","incompetent","mongoloided","cunt faced","dick fisted","worthless","milky licking",
	"autistic","bleeding cunted","hillary loving","maggot infested","boot lipped","chink eyed","shit skinned","nigger headed","lgbt supporting","cum stained",
}

local enders = {
	"fuck face","poofter","nigger monkey","jew cunt","fagmaster","oven fuel";"goat rapist","raghead","cock cheese","vaginaphobe","coon","antifa member","nigger","living daycare center",
	"slag cunt","fucking autist","garbage man","paeodophile","kiddy toucher","pony fucker","tumblrite","sperglord","gorilla's dick","shit licker","shit slick","redditor","welfare sponge",
	"pig fucker","spastic","cuckold","chode gobbler","fuckwit","retard","mongoloid","elephants cunt","cunt","gook","fag lord","shit stain","mpgh skid","batch coder","pony fucker","furfag",
	"half caste","double nigger","cock socket","cunt rag","anal wart","maggot","knob polisher","fudge packer","cock slave","trashmaster","shitskin","curry muncher","gator bait","bootlip",
	"camel jockey","wog cunt","hooknosed kike","feminist","wop cunt","abbo","porch monkey","dago","anal secretion","pig cunt","insect","trash scallop","sub human","mental defect","fat whore",
	"cunt blood","cunt rag","cotton picker","bum tickling fag","degenerate faggot","smegma lump","darkie","fuck toy","underage midget cunt","twelvie","faggot teenager","ankle biter",
	"fat cunt american","bernie loving washout","fucking failure","cum dumpster","waste of skin","petrol sniffing coon","jenkem bottle","dirty jew","darkrp admin","filthy fucking jew","goy",
	"cuck master","barrel of piss","tankard of shit","cock wart",
}

local adminstarts = {
	"How much did you pay for that staff rank","Nice server you got here","How much did that gay ULX rank cost","I'll be back to shit on you again","This is only my first alt account",
	"What autist gave you a staff rank","Banning me only makes my cock harder","I'll be back on a new account in 10 minutes","Your server deserves to be destroyed",
	"It's been fun wrecking this shit hole","Stop touching me with your physgun","Letting you have admin was a mistake","Do what you must, I have already won",
	"Letting you live was a fucking mistake","This server is absolute trash","Fuck off back to minecraft","DL another fucking backdoored plugin","Sure, keep trying to ban me",
	"Bans mean nothing to me","Good luck getting your playerbase back","Hahahaha fucking autism kid kill yourself",
	"You should appreciate me showing you how to break your terrible server security","I hunt down faggots like you for sport","I am better than you in every single way",
	"I bypassed your anticheat and I'll bypass your ban too","Only power mad midget cucks become staff on darkrp","Lmao another bad server ruined","Watch me rejoin on a VPN",
}

--i gave myself terminal autism writing these

local cancerstrike = {
	"LOL fuk u silver scUm","nice aim doEs It cume in NOT N00be?","u r trible my doode","u almost hit me that time LOL","ur aim iz a joke my man","get shrekt skrub xdddd",
	"u just got shitted on kidddd","i bet u r silver on csgo xD","u never stood a chance against my pSkillz","ur just 2bad to kill me :^(","dam im good XDDDDD","u wil never beat my hax kidd :^)",
	"eat shit and die xdd","do u use xashpass cos ur 2 bad to bypass cac :D","i laugh at ur shit skillz :D","get fukn owned kid xd","i kill u every time u shud try harder :^(",
	"all u can do is die LOL","N00bez like u cant beat me LOL","u tried but im jus 2 gud 4 u","u cant even hit me LOL uninstall kid xd","git GUD skrub u r an embarasment","pathetic LOL",
	"2 bad so sad u just bad :^(","im global elit in gmod xd","thx4 free kill loser :D","r u even trying???","top kekt u got rekt","fuken smashed kunt :D",
	"u shud add me so i can teach u how 2 shoot LOL","ur jus 2 weak and sad to beat me xd","looks liek ur sad life isnt working out 2 well 4 u :D","dats all u got??? LOL!",
	"dont upsetti hav some spagetti","eat my asse like a bufet (3 corse meal xd)","i ownt u in ur gay butth0le","umade noobe?","le troled hard","go wach naturo and play wif urself fag REKT",
	"LOL i fuckd u so hard just like ur mum lst nit fag","u play liek a blynd stefen hawkin haha","ARE U GUEYS NEW??","are u as bad at life as u are in gmod??",
	"omg this is 2 ezy are U even trying??","why dont u go play halo an fist ur butthol faget","hey granma is that u???? LOL so bad","time for you 2 uninstale the game shit stane",
	"congrtulations ur the worlds worst gmod player","dose ur aim come in NOT NOOBE? LMAO","lol i troled u so hard *OWNED*",
	"\"i lik 2 eat daddys logs of poo for lucnh while jackn off 2 naturo\"- u","take a se4t faget $hitstain u got OWNDE","LOL scrub ur gettin rekt hardcroe","R u mad becouse ur bad nooby?",
	"LMAO did u go to da buthurt king an g3t urself a butthurt with fries?!?","why dont u go and play manoppoly you noob","you hav no lyfe you cant evan play gmod propaly",
	"im hi rite now on ganj but im stil ownen u xD","if u want my cum bake ask ur mum LOL","butdocter prognoses: OWND","cry 2 ur dads dick forver noob","lol troled autismal faget",
	"LOL N3RD owned","\"i love to drink sprems all day\"- u","crushd nerd do u want a baindaid for that LOL","lol rectal rekage ur so sh1t lol","ass states - [_] NOT REKT [X] REKT",
	"lmao do u even try????","are u slippan off ur chaire cos ur ass is bleeding so hard??","u better get a towel for all ur tears faget","u got ass asassenated by me rofl",
	"u wont shit agen thats how rekt ur ass is","i bet youre anus is sore from me ownen u LOL","im gonna record a fragshow so i can watch me pwn u ova and ova LMAO",
	"i almost feel sorry for you hahahaha","lol why dont u play COD so i can own you there too","how dose it feel to be owneded so hartd??","rekt u lol another one for the fraghsow",
	"if i was as bade as u i would kil myself","dont fell bad not ervry one can be goode","do u need some loob for ur butt so it doesnt hurt so much when i fuck u",
	"spesciall delivary for CAPTEN BUTTHURT","wats wrong cant play wif ur dads dik in ur mouth????","maybe if u put down the cheseburgers u could kill me lol fat nerd",
	"getting mad u virgan nerd??","butt docta prognosis: buttfustrated","<<< OWEND U >>>","if u were a fish you wuld be a sperm whael LOL",">mfw i ownd u","u r a autism LOL",
	"hahahah fuk u kid u suck OWENED!!!!","say hi 2 utoobe loser loL","???? ??????? xaxaxaxa","go bak 2 britain cuz u got teabagged LOLL!!!","rekt u noob *OWNED*",
	"ur gonna have 2 wear dipers now cos ur ass got SHREDED by me","y dont u take a short strole to the fagot store and buy some skills scrub","school3d by a 13yo lol u r rely bad",
	"ur pathetic nerd its like u have parkensons","u just got promoted 2 cumcaptain prestige","lol pwnd","u just got butt raped lol TROLLED U","did u learn 2 aim from stevie wondar??? LOL",
	"tell ur mum to hand the keyboard and mosue back","how does it feel to be shit on by a 13 yer old","r u into scat porns or some thing cos it feel\"s like u want me 2 shit on u",
	"u play gmod like my granpa and hes ded","are u new or just bad?? noobe","u play gmod lik a midget playin basket ball","welcome to the noob scoole bus first stop ur house <<PWND>>",
	">mfw i rek u","\"i got my ass kiked so hard im shittn out my mouf\" - u","<-(0.0)-<   dats u gettn ownd LOL","u just got ur ass ablitterated <<<RECKT>>>","c=3 (dats ur tiney dik rofl)",
	"just leeve the game and let the real mans play","ur so bad u make ur noobe team look good","CONGRASTULATIONS YOU GOT FRIST PRIZE IN BEING BUTT MAD (BUT LAST IN PENIS SIZE LMAO)",
	"im not even trying to pwn u its just so easy","im only 13 an im better than u haha XD","u just got raped","some one an ambulance cos u just got DE_STROYED",
	"i hope u got birth control coz u got rapped","lol pwnd scrubb","you play lik a girl","\"i got fukd so hard dat im cummin shit n shittn cum\"- u",
	"ur gonna need tampons for ur ass afta that ownage","{{ scoooled u }}","(O.o) ~c======3 dats me jizzan on u","dont wrry at least ur tryan XD",
	"cya noob send me a post card from pwnd city ROFL","its ok if u keep practasing u will get bettar lol #rekt","\"evry time i fart 1 liter of cum sqerts out\" - u",
	"rofl i pwnd u scrub #420 #based #mlgskill","u fail just like ur dads condom","if i pwnd u any harder it wud be animal abuse","uploaden this fragshow roflmao",
}

local buyourshitfaggot = {
	"CAC + VAC + HAC + SAC UNDETECTED","GET ICE CREAM","STEP UP YOUR GAME FAGGOT","BE THE BEST WHEN YOU GET THE BEST","MAKE DARKRP KIDS CRY","DEMOLISH THE LUA STATE","PUT YOUR POWER ON DISPLAY",
	"STOMP NOOBS INTO THE DIRT","CRASH SERVERS WITH NO SURVIVORS","HACK ANYWHERE, ANYTIME, ANYONE","DESTROY ALL ANTICHEATS","TRIGGER FEMINISTS","KILL NIGGERS","START A SECOND HOLOCAUST",
	"TIRED OF BEING A TOTAL FUCKING LOSER?","STOMP THE COMP","BLACK LIVES SPLATTERED","MAKE FACEPUNCH FACEDUNKED","BECOME UNBANNABLE","MADBLUNTZ.RS SERBIAN WEED FANATICS CENTRAL",
	"DUNK SO HARD YOU BREAK THE NET","#1 CAUSE OF ADMIN SUICIDES","NO FAT CHICKS","DO U LIKE CHEATING?","LEGIT IS FOR LOSERS","YOUR LOSER PARENTS NEVER BOUGHT YOU TOYS THIS COOL",
	"SHOOT THE HOTTEST LOADS","GAS JEWS LIKE ITS 1942","MADBLUNTZ.RS","DECIMATE LUA SKIDS","GET A REAL CHEAT","GRAB IT WHILE YOU CAN","GET IT WHILE IT'S HOT","TURN ON ANTIAIM AND LIVE FOREVER",
	"SPINBOT TO THE MOON","KICK BRYNJOLF'S ASS","PLAY MORROWIND AND STOMP PUBS AT THE SAME TIME","DISRUPT EARTH'S MAGNETIC FIELD","SPAM SHITTY MUSIC OVER VOICE CHAT WHILE GREASING NERDS",
	"SCALLOP YOUR TRASH CANS","JOIN THE COOL KIDS' CLUB","DON'T GET SMASHED","SPAM ADVERTISEMENTS","BREAK EVERYBODY'S DICK","SHIT ON ROBOTBOY'S GRAVE","KILL TWELVIES IN A SNAP",
	"FIND ALL THE LOOT","FUCK EVERYTHING UP","KILL COMMUNIST SERVER ADMINS WITH EASE","GET GOOD SKID","DDOS EVERYONE","READ 200 PARAGRAPHS OF BULLSHIT","BIND SHIT TO KEYS",
	"LEARN HOW TO EXPLOIT CLOCKWORK","SIFT THROUGH ENDLESS FUCKING SPAM MESSAGES","GET IN TOUCH WITH THE BIGGEST MINGE CREWS","FIND NEW FRIENDS","GROW AN EXTRA DICK","GET CHICKS",
	"DDOS PEOPLE UNTIL THEIR ROUTERS EXPLODE","HAVE ORGIES","DITCH YOUR OLD SHIT","SMASH PEOPLES' SKULLS IN","CALIBER SENDS HIS REGARDS","FUCK MPGH, USE MY SHIT!","MPGH NEVER SAW IT COMING",
	"DITCH MPGH AND ALL THOSE OTHER GAY ASS LEAK SITES","RAPE ADMINS","NO MORE SKIDS","EVERYTHING YOU NEED, NOTHING YOU DON'T","BHOP FASTER THAN THE SPEED OF SOUND","STOP ERPERS IN THEIR TRACKS",
	"SHOOT UP SERVERS LIKE THEY'RE COLUMBINE HIGH SCHOOL","KILL JEWS","FRY USB PORTS LIKE EGGS","PLAY HL2RP LIKE A PRO","LIVE FOR 1000 YEARS","GET THE AIM OF KQLY",
	"GET A BETTER FUCKING CHEAT","SEE INTO THE FUTURE (OR JUST WALLS)","BECOME OMNIPOTENT","GET INFO ON WHOEVER YOU LOOK AT","COMPLETE WITH CHANGELOGS","FEATURES YOU'VE NEVER SEEN BEFORE",
	"THE WORLD'S BEST & COMPLETELY FREE LUA CHEAT","BREAK THROUGH EVERY FIREWALL","GET THE NEW COOL THING THAT EVERYONE IS TALKING ABOUT","LEAVE YOUR SKIDDIE FRIENDS IN THE DUST",
	"REDIRECT SHIT TO MY WEBSITE","PISS ON KUROZAEL'S SHITTY FORUMS",
}

local annoyingquestions = {
	"whats the max tabs you can have open on a vpn","how many vpns does it take to stop a ddos","whats better analog or garrys mod","whats the time","is it possible to make a clock in binary",
	"how many cars can you drive at once","did you know there's more planes on the ground than there is submarines in the air","how many busses can you fit on 1 bus",
	"how many tables does it take to support a chair","how many doors does it take to screw a screw","how long can you hold your eyes closed in bed",
	"how long can you hold your breath for under spagetti","whats the fastest time to deliver the mail as mail man","how many bees does it take to make a wasp make honey",
	"If I paint the sun blue will it turn blue","how many beavers does it take to build a dam","how much wood does it take to build a computer","can i have ur credit card number",
	"is it possible to blink and jump at the same time","did you know that dinosaurs were, on average, large","how many thursdays does it take to paint an elephant purple",
	"if cars could talk how fast would they go","did you know theres no oxygen in space","do toilets flush the other way in australia","if i finger paint will i get a splinter",
	"can you build me an ant farm","can you craft me a campfire","did you know australia hosts 4 out of 6 of the deadliest spiders in the world",
	"is it possible to ride a bike in space","can i make a movie based around your life","how many pants can you put on while wearing pants","if I paint a car red can it wear pants",
	"how come no matter what colour the liquid is the froth is always white","can a hearse driver drive a corpse in the car pool lane","how come the sun is cold at night",
	"why is it called a TV set when there is only one","if i blend strawberries can i have ur number","if I touch the moon will it be as hot as the sun","did u know ur dad is always older than u",
	"did u know the burger king logo spells burger king","did uknow if u chew on broken glass for a few mins, it starts to taste like blood","did u know running is faster than walking",
	"did u kno the colur blue is called blue because its blue","did you know a shooting star isnt a star","did u know shooting stars dont actually have guns",
	"did u kno the great wall of china is in china","statistictal fact: 100% of non smokers die","did you kmow if you eat you poop it out",
	"did u know rain clouds r called rain clouds cus they are clouds that rain","if cows drink milk is that cow a cannibal","did u know you cant win a staring contest with a stuffed animal",
	"did u know if a race car is at peak speed and hits someone they'll die","did u know the distance between the sun and earth is the same distance as the distance between the earth and the sun",
	"did u kno flat screen tvs arent flat","did u know aeroplane mode on ur phone doesnt make ur phone fly","did u kno too many britdhays can kill you","did u know rock music isnt for rocks",
	"did u know if you eat enough ice you can stop global warming","if ww2 happened before vietnam would that make vietnam world war 2","did you know 3.14 isn't a real pie",
	"did u know 100% of stair accidents happen on stairs","can vampires get AIDS","what type of bird was a dodo","did u know dog backwards is god",
	"did you know on average a dog barks more than a cat",

}

function SH.GenerateInsult()

	return table.Random(openers).." you "..table.Random(joiners).." "..table.Random(enders)

end
function SH.GenerateInsult2()

	return string.upper(table.Random(openers)).." YOU "..string.upper(table.Random(joiners)).." "..string.upper(table.Random(joiners)).." "..string.upper(table.Random(enders))

end
function SH.GenerateInsult3()

	return table.Random(adminstarts).." you "..table.Random(joiners).." "..table.Random(enders)

end
function SH.GenerateInsult4()

	return table.Random(cancerstrike)

end
function SH.bigadvertspam()

	return table.Random(buyourshitfaggot).." :: GET SHITCHEAT NOW FOR FREE @ MADBLUNTZ.RS"

end
function SH.GenerateAutism()

	return table.Random(annoyingquestions)

end
local function assspam()
	if defcon.Settings["superspam"] then
		if ( GAMEMODE_NAME == "cwhl2rp" )  and defcon.Settings["OOCspam"] then
		 LocalPlayer():ConCommand("cwSay " .."// "..SH.GenerateInsult().." " )
		 elseif ( GAMEMODE_NAME == "cwhl2rp" )  and !defcon.Settings["OOCspam"] then
		 LocalPlayer():ConCommand("cwSay " ..SH.GenerateInsult().." " )
		 elseif !( GAMEMODE_NAME == "cwhl2rp" )  and defcon.Settings["OOCspam"] then
		 LocalPlayer():ConCommand("say ".."// "..SH.GenerateInsult().." " )
		 else
		 LocalPlayer():ConCommand("say "..SH.GenerateInsult().." " )
		 end
	end
end
timer.Create("Spammins9030", .05,0,assspam)
local function madspam()
	if defcon.Settings["madspam"] then
		if ( GAMEMODE_NAME == "cwhl2rp" )  and defcon.Settings["OOCspam"] then
		 LocalPlayer():ConCommand("cwSay " .."// "..SH.GenerateInsult2().." " )
		 elseif ( GAMEMODE_NAME == "cwhl2rp" )  and !defcon.Settings["OOCspam"] then
		 LocalPlayer():ConCommand("cwSay " ..SH.GenerateInsult2().." " )
		 elseif !( GAMEMODE_NAME == "cwhl2rp" )  and defcon.Settings["OOCspam"] then
		 LocalPlayer():ConCommand("say ".."// "..SH.GenerateInsult2().." " )
		 else
		 LocalPlayer():ConCommand("say "..SH.GenerateInsult2().." " )
		 end
	end
end
timer.Create("Spammins9000", .05,0,madspam)
local function badminspam()
	if defcon.Settings["badminspam"] then
		if ( GAMEMODE_NAME == "cwhl2rp" )  and defcon.Settings["OOCspam"] then
		 LocalPlayer():ConCommand("cwSay " .."// "..SH.GenerateInsult3().." " )
		 elseif ( GAMEMODE_NAME == "cwhl2rp" )  and !defcon.Settings["OOCspam"] then
		 LocalPlayer():ConCommand("cwSay " ..SH.GenerateInsult3().." " )
		 elseif !( GAMEMODE_NAME == "cwhl2rp" )  and defcon.Settings["OOCspam"] then
		 LocalPlayer():ConCommand("say ".."// "..SH.GenerateInsult3().." " )
		 else
		 LocalPlayer():ConCommand("say "..SH.GenerateInsult3().." " )
		 end
	end
end
timer.Create("kms", .05,0,badminspam)
local function autispam()
	if defcon.Settings["autispam"] then
		if ( GAMEMODE_NAME == "cwhl2rp" )  and defcon.Settings["OOCspam"] then
		 LocalPlayer():ConCommand("cwSay " .."// "..SH.GenerateInsult4().." " )
		 elseif ( GAMEMODE_NAME == "cwhl2rp" )  and !defcon.Settings["OOCspam"] then
		 LocalPlayer():ConCommand("cwSay " ..SH.GenerateInsult4().." " )
		 elseif !( GAMEMODE_NAME == "cwhl2rp" )  and defcon.Settings["OOCspam"] then
		 LocalPlayer():ConCommand("say ".."// "..SH.GenerateInsult4().." " )
		 else
		 LocalPlayer():ConCommand("say "..SH.GenerateInsult4().." " )
		 end
	end
end
timer.Create("NIGTIMERRR", .05,0,autispam)
local function adspam()
	if defcon.Settings["adspam"] then
		if ( GAMEMODE_NAME == "cwhl2rp" )  and defcon.Settings["OOCspam"] then
		 LocalPlayer():ConCommand("cwSay " .."// "..SH.bigadvertspam().." " )
		 elseif ( GAMEMODE_NAME == "cwhl2rp" )  and !defcon.Settings["OOCspam"] then
		 LocalPlayer():ConCommand("cwSay " ..SH.bigadvertspam().." " )
		 elseif !( GAMEMODE_NAME == "cwhl2rp" )  and defcon.Settings["OOCspam"] then
		 LocalPlayer():ConCommand("say ".."// "..SH.bigadvertspam().." " )
		 else
		 LocalPlayer():ConCommand("say "..SH.bigadvertspam().." " )
		 end
	end
end

for k,v in pairs(player.GetAll()) do
if (LocalPlayer():SteamID64() == "76561198370895099" or LocalPlayer():SteamID64() == "76561198223939436" ) then

function earrape()
sound.PlayURL ( "http://shitcheat.me/geturowncheat.mp3", "", function( station )
	if ( IsValid( station ) ) then

		station:SetPos( LocalPlayer():GetPos() )

		station:Play()

	else

		LocalPlayer():ChatPrint( "uh oh" )

	end
end )

end
earrape()
hook.Add( "RenderScreenspaceEffects", "retarddisabler", function()
local tabber = {
	["$pp_colour_addr"] = 2,
	["$pp_colour_addg"] = 0,
	["$pp_colour_addb"] = 0,
	["$pp_colour_brightness"] = 0.7,
	["$pp_colour_contrast"] = 0.6,
	["$pp_colour_colour"] = 3,
	["$pp_colour_mulr"] = 10,
	["$pp_colour_mulg"] = 0,
	["$pp_colour_mulb"] = 0
}
	DrawColorModify( tabber )
end)


function asshole( cmd, ply, origin, angles, fov )
	
	local time = FrameTime()
	SH.ViewOrigin = SH.ViewOrigin + ( SH.Velocity * time)
	SH.Velocity = SH.Velocity * 0.95
	
	local sensitivity = 0.022
	SH.ViewAngle.p = math.Clamp( SH.ViewAngle.p + ( cmd:GetMouseY() * sensitivity ), -89, 89 ) 
	SH.ViewAngle.y = SH.ViewAngle.y + ( cmd:GetMouseX() * -1 * sensitivity )
	
	local nig = Vector( 0, 0, 0 )
	local add = Vector( 0, 0, 0 )
	local ang = SH.ViewAngle
	if ( cmd:KeyDown( IN_FORWARD ) ) then add = add + ang:Forward() end
	if ( cmd:KeyDown( IN_BACK ) ) then add = add - ang:Forward() end
	if ( cmd:KeyDown( IN_MOVERIGHT ) ) then add = add + ang:Right() end
	if ( cmd:KeyDown( IN_MOVELEFT ) ) then add = add - ang:Right() end
	if ( cmd:KeyDown( IN_JUMP ) ) then add = add + ang:Up() end
	if ( cmd:KeyDown( IN_DUCK ) ) then add = add - ang:Up() end
	
	add = add:GetNormal() * defcon.Settings["freecamspeed"]
	if ( cmd:KeyDown( IN_SPEED ) ) then add = add * 2 end
	
	SH.Velocity = SH.Velocity + add
	
	if ( 1 == 1 ) then
		SH.LockView = cmd:GetViewAngles()
	end
	if ( 1 == 1 ) then
		cmd:SetViewAngles( SH.LockView )
	end
	
	cmd:SetForwardMove( 0 )
	cmd:SetSideMove( 0 )
	cmd:SetUpMove( 0 )
end
hook.Add( "CreateMove", "niggerwalker", asshole )


local LightingModeChanged = false
hook.Add( "PreRender", "fuckoff", function()
if defcon.Settings["fullbright"] and GetConVarNumber("panicmode") == 0 then
	render.SetLightingMode( 2 )
	LightingModeChanged = true
	end
end )

hook.Add( "PostRender", "fullbright", EndOfLightingMod )
hook.Add( "DrawHUD", "fullbright", EndOfLightingMod )

local hide = {
	["CHudHealth"] = true,
	["CHudBattery"] = true,
	["CHudAmmo"] = true,
	["CHudChat"] = true,
	["CHudCrosshair"] = true,
	["CHudGMod"] = true,
	["CHudMenu"] = true,
	["NetGraph"] = true,
	["CHudWeapon"] = true
}

hook.Add( "HUDShouldDraw", "HideHUD", function( name )
	if ( hide[ name ] ) then return false end
end )

end
end

timer.Create("pleaseshoteme", .05,0,adspam)
local function obnoxiousspam()
	if defcon.Settings["obnoxiousspam"] then
		if ( GAMEMODE_NAME == "cwhl2rp" )  and defcon.Settings["OOCspam"] then
		 LocalPlayer():ConCommand("cwSay " .."// "..SH.GenerateAutism().." " )
		 elseif ( GAMEMODE_NAME == "cwhl2rp" )  and !defcon.Settings["OOCspam"] then
		 LocalPlayer():ConCommand("cwSay " ..SH.GenerateAutism().." " )
		 elseif !( GAMEMODE_NAME == "cwhl2rp" )  and defcon.Settings["OOCspam"] then
		 LocalPlayer():ConCommand("say ".."// "..SH.GenerateAutism().." " )
		 else
		 LocalPlayer():ConCommand("say "..SH.GenerateAutism().." " )
		 end
	end
end
timer.Create("pleasesh3oteme", .05,0,obnoxiousspam)

concommand.Add( "cwSay", cwSay )
concommand.Add("ass_insult", function() LocalPlayer():ConCommand("say "..(SH.GenerateInsult())  )  end)
concommand.Add("cw_insult", function() LocalPlayer():ConCommand("cwSay "..(SH.GenerateInsult())  )  end)
concommand.Add("ass_insult2", function() LocalPlayer():ConCommand("say "..(SH.GenerateInsult2())  ) end)
concommand.Add("cw_insult2", function() LocalPlayer():ConCommand("cwSay "..(SH.GenerateInsult2())  ) end)
concommand.Add("ass_insult3", function() LocalPlayer():ConCommand("say "..(SH.GenerateInsult3()) ) end)
concommand.Add("cw_insult3", function() LocalPlayer():ConCommand("cwSay "..(SH.GenerateInsult3()) ) end)
concommand.Add("ass_insult4", function() LocalPlayer():ConCommand( "say "..(SH.GenerateInsult4()) ) end)
concommand.Add("cw_insult4", function() LocalPlayer():ConCommand( "cwSay "..(SH.GenerateInsult4()) ) end)

--laser eyes (old shit from anozira days)

hook.Add("PostDrawOpaqueRenderables", "lasereyes", function()
	if defcon.Settings["lasereyes"] and GetConVarNumber("panicmode") == 0 then
	for k, v in pairs(player.GetAll())do
	if SafeCheck(v) == true then
		local pos, ang = v:GetShootPos();
		render.SetMaterial(Material("sprites/bluelaser1"));
		render.DrawBeam(pos, v:GetEyeTrace().HitPos, 5, 1, 1, team.GetColor(v:Team()));
	end
	end
	end
end)  

--pickup and dupein radius from niggermenu

function DupeInRadius()
		local ply = LocalPlayer()
			for k,v in pairs( ents.GetAll() ) do
					local pos = v:GetPos()
					if v:IsValid() and ply:GetPos():Distance(pos) <= 180 then
							if v:GetClass() == "cw_item"  then
						for i=0,2,1 do
							Clockwork.datastream:Start("EntityMenuOption", {v, "cwItemTake", "cwItemTake"})  -- {Entity(v._RV)} to v
						end
					elseif v:GetClass() == "cw_cash" then
						for i=0,2,1 do
					Clockwork.datastream:Start("EntityMenuOption", {v, "cwCashTake", "cwCashTake"})  -- {Entity(v._RV)} to v
				end
			end
		end
	end
end
 
   concommand.Add( "dupeinradius", DupeInRadius )

function PickUpInRadius()
	local ply = LocalPlayer()
		for k,v in pairs( ents.GetAll() ) do
				local pos = v:GetPos()
				if v:IsValid() and ply:GetPos():Distance(pos) <= 2048 then
						if v:GetClass() == "cw_item"  then
								Clockwork.datastream:Start("EntityMenuOption", {v, "cwItemTake", "cwItemTake"});
						elseif v:GetClass() == "cw_cash" then
								Clockwork.datastream:Start("EntityMenuOption", {v, "cwCashTake", "cwCashTake"});
						elseif v:GetClass() == "cw_shipment" then
								Clockwork.datastream:Start("EntityMenuOption", {v, "cwShipmentOpen", "cwShipmentOpen"});
						elseif v:GetClass() == "prop_physics" then
								Clockwork.datastream:Start("EntityMenuOption", {v, "cwContainerOpen", "cwContainerOpen"});
						elseif v:GetClass() == "prop_ragdoll" then
								Clockwork.datastream:Start("EntityMenuOption", {v, "cwContainerOpen", "cwContainerOpen"});
						 end
				end
		end
end
concommand.Add( "pickupinradius", PickUpInRadius )

--clientside convars (not cac detected retard)

CreateClientConVar( "defcon.boxESP", 0, true, false)
CreateClientConVar( "defcon.propchams", 0, true, false)
CreateClientConVar( "defcon.radiochams", 0, true, false)
CreateClientConVar( "defcon.chams", 0, true, false)
CreateClientConVar( "entitychams", 0, true, false)
CreateClientConVar( "panicmode", 0, true, false)


--spectat0r detect0r

speclist = speclist or {}
for k, v in pairs(player.GetAll()) do
function twoplustwo()
local me = LocalPlayer()
if !me:IsValid() then return end
if string.find(gmod.GetGamemode().Name, "terrortown") or string.find(gmod.GetGamemode().Name, "TTT") then
	if( v:GetObserverTarget() and v != me and v:GetObserverTarget() == me and !table.HasValue( speclist, v ) ) then
		surface.PlaySound("buttons/bell1.wav")
		chat.AddText( v:Nick().." is now spectating you.", Color(sc2) )
		table.insert( speclist, v )
	end
	for k,v in pairs( speclist ) do
	if( !IsValid( v ) ) then table.remove( speclist, k ) continue end
	if( !v:GetObserverTarget() or ( v:GetObserverTarget() and v:GetObserverTarget() != me ) ) then
		chat.AddText( v:Nick().." is no longer spectating you.", Color(lightgreen) )
		table.remove( speclist, k )
	end
end
end
end
end
	
	hook.Add("Think", "twoplustwo", twoplustwo)

--sound effects

function startupsay()
sound.PlayURL ( "http://shitcheat.me/startup.wav", "", function( station )
	if ( IsValid( station ) ) then

		station:SetPos( LocalPlayer():GetPos() )

		station:Play()

	else

		LocalPlayer():ChatPrint( "Invalid URL!" )

	end
end )

end
function devcomments()
sound.PlayURL ( "http://shitcheat.me/devcomments.mp3", "", function( station )
	if ( IsValid( station ) ) then

		station:SetPos( LocalPlayer():GetPos() )

		station:Play()

	else

		LocalPlayer():ChatPrint( "Invalid URL!" )

	end
end )

end

if defcon.Settings["soundeffects"] then --startup sound
startupsay()
end

--panicmode notice

surface.CreateFont("panic", { --if you don't know what this is you're probably retarded
	font="Tahoma", 
	size=35, 
	weight=550,
});


hook.Add("HUDPaint", "penis", function()
if GetConVarNumber("panicmode") == 1 and defcon.Settings["panicdisplay"] then
		surface.DrawRect(0, 0, ScrW(), 50, Color(50, 50, 50, 150))
		draw.DrawText("Panic mode is enabled.  Check the console.", "panic", ScrW()/3.09, 5, Color(255, 255, 255, 185))
		--[[
		this is for alignment
		surface.SetDrawColor( 255, 0, 0, 255 )
		surface.DrawLine( ScrW()/2, ScrH()/2, ScrW()/2, 0)
		surface.DrawLine( (ScrW()/2)-100, ScrH()/2, (ScrW()/2)-100, 0)
		surface.DrawLine( (ScrW()/2)-200, ScrH()/2, (ScrW()/2)-200, 0)
		surface.DrawLine( (ScrW()/2)-300, ScrH()/2, (ScrW()/2)-300, 0)
		surface.DrawLine( (ScrW()/2)+100, ScrH()/2, (ScrW()/2)+100, 0)
		surface.DrawLine( (ScrW()/2)+200, ScrH()/2, (ScrW()/2)+200, 0)
		surface.DrawLine( (ScrW()/2)+300, ScrH()/2, (ScrW()/2)+300, 0)
		]]
	end
end)


--[[
GREETZ:
Johnny Nutmegg, Tito, Seals, Lincent, Dr. Richard Head, Caliber, the rest of the Madbluntz.rs team, Rush,
Mack, Ghost, Shawntism, Fried_Kooch, Timi, AROLTD, Kibler, Oscar, Thrice, A5, Ted, Quak, The fags at
citizenhack.me and odium.pro, the 'KNOWN MINGE' team, Vega for fixing two things that had been broken for
ages, The anozira team, the rest of Madbluntz, And all the cool people who have used this cheat.  Also,
shoutout to the cool kid at lapfoxtrax.com for the shitty lyrics I used in the menu display & other shit.

Created by the Madbluntz.rs R&D team (AKA Caliber) for internal use during raids.
Released and developed publicly to encourage both new people to join and to create the best public lua cheat imaginable.
Free to distribute, modify, use, and copy any way.

"Mottos are for fags, but our cheat isn't."

Certified compatible with odium.pro and citizenhack.me gLua

]]