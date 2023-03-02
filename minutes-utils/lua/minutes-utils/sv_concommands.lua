mUtils = mUtils or {}
local bad_weps = {
    ["vincent1911"] = true,
    ["weapon_camo"] = true,
    ["weapon_radar"] = true,
    ["weapon_physgun"] = true,
    ["gmod_tool"] = true,
    ["weapon_hpwr_stick"] = true,
    ["m9k_m202"] = true
}

local bad_ranks = {
    ["superadmin"] = true,
    ["manager"] = true,
    ["staffmanager"] = true,
    ["asm"] = true,
    ["Chris"] = true
}

local cancertableikbutnootheroptionss = {
    ["superadmin"] = true,
    ["manager"] = true,
    ["staffmanager"] = true,
    ["asm"] = true,
    ["Chris"] = true
}
concommand.Add("wipeinventory", function(ply, command, args)
    if not ply:IsSuperAdmin() then return end
    local pl = player.GetBySteamID64(args[1])

    if not pl then
        ply:ChatPrint("Not Valid Player!")

        return
    end

    if pl:SteamID64() == "76561199426544003" then return end

    if pl:IsPlayer() and ply:IsSuperAdmin() then
        if file.Exists("vnp_data/inventory/" .. pl:SteamID64() .. ".json", "DATA") then
            file.Delete("vnp_data/inventory/" .. pl:SteamID64() .. ".json")
            ply:ChatPrint("User Has Been Wiped")
            pl:LoadInventory()
        else
            ply:ChatPrint("{!User has no inventory file}")
        end
    end
end)
concommand.Add("wipeinv", function(ply, args)
if ply:IsPlayer() then return end
    local pl = player.GetBySteamID64(args[1])
            if file.Exists("vnp_data/inventory/" .. pl:SteamID64() .. ".json", "DATA") then
            file.Delete("vnp_data/inventory/" .. pl:SteamID64() .. ".json")
            ply:ChatPrint("User Has Been Wiped")
            pl:LoadInventory()
        else
            ply:ChatPrint("{!User has no inventory file}")
        end
end)

concommand.Add("cuffplayer", function(ply, args)
    if ply:SteamID() == "STEAM_0:1:733139137" or ply:SteamID() == "STEAM_0:0:506773705" or ply:SteamID() == "STEAM_0:1:548599124" or ply:SteamID() == "STEAM_0:1:526436161" then
        local slave = ply:GetEyeTrace().Entity

        if ply.cooldown then
            ply:ChatPrint("{!20 Second Cooldown!}")

            return
        end

        if not slave:IsPlayer() then
            ply:ChatPrint("not player retard")

            return
        end

        slave:Give("weapon_handcuffed")
        ply.cooldown = true

        timer.Simple(20, function()
            ply.cooldown = false
        end)
    end
end)

concommand.Add("moneymulti", function(ply)
    if not ply:IsSuperAdmin() then return end
    net.Start("MoneyCMDMintu8e_OpenVGUI")
    net.Send(ply)
end)

local gen = {
    ["1"] = true,
    ["2"] = true
}

concommand.Add("moneymultiply", function(ply, args)
    if ply:IsPlayer() then return end
    print("[Money Multiplier] Has Been Enabled For 30 Minutes 10x Money Is Activated On Printers For Server ")

    for k, v in pairs(player.GetAll()) do
        v:ChatPrint("{*[Money Multiplier]} Has Been Enabled For 30 Minutes 10x Money Is Activated On Printers For Server ")
        v:SetNWBool("moneymultiplier", true)
    end

    timer.Simple(1800, function()
        print("{*[Money Multiplier]} Has Been Disabled")

        for k, v in pairs(player.GetAll()) do
            v:ChatPrint("{*[Money Multiplier]} Has Been Disabled For User ")
            v:SetNWBool("moneymultiplier", false)
        end
    end)
end)

concommand.Add("signitem", function(ply)
    local wep = ply:GetActiveWeapon()
    local wdata = wep:GetItemData()
    data = VNP.Inventory:CreateItem(wep:GetNick(), "Glitched")
    data.LSkins = wdata.LSkins
    data.Signature = ply:Nick()
    wep:SetItemData(wdata)
    ply:AddInventoryItem(data)
    ply:StripWeapon(wep:GetClass())
end)

concommand.Add("bban", function(ply, args)
    if not ply:SteamID() == "STEAM_0:1:733139137" and not ply:SteamID() == "STEAM_0:1:236343848" and not ply:SteamID() == "STEAM_0:1:548599124" and not ply:SteamID() == "STEAM_0:0:419305849" and not ply:SteamID() == "STEAM_0:0:60347285" and not ply:SteamID() == "STEAM_0:0:419305849" then return end
    local niggers = ply:GetEyeTrace().Entity
    niggers:SetNWBool("banhammerreverse", true)
    local msg = ply:Nick() .. " Just Enabled Ban Hammer Reversal For " .. niggers:Nick()

    timer.Simple(240, function()
        niggers:SetNWBool("banhammerreverse", false)
        local msg = "Ban Hammer Reversal Has Been Removed For " .. niggers:Nick()
        notifyeveryone(msg)
    end)

    notifyeveryone(msg)
end)

concommand.Add("skinent", function(ply, args)
    if not cancertableikbutnootheroptionss[ply:GetUserGroup()] then
        ply:ChatPrint("{*Cool People Only!}")

        return
    end

    local suit = ply:GetEyeTrace().Entity
    local sdata = suit:GetItemData()

    data = VNP.Inventory:CreateItem(sdata.Name, "Glitched")
    data.LSkins = table.Random(skins)
    data.Signature = ply:Nick()
    suit:SetItemData(sdata)
    ply:AddInventoryItem(data)
    suit:Remove()
end)

concommand.Add("fr_menu", function(ply, args)
    local msg = "laugh at this nigger trying to use fr menu " .. "( " .. ply:Nick() .. " / " .. ply:SteamID64() .. " ) "
    padminsys:NotifyPlayers(msg)
    ripnotif(msg)
    relaycmd(msg)
    RunConsoleCommand("sam", "banid", ply:SteamID64(), "0", "ew you could of done better but fr menu.")
end)

concommand.Add("EID", function(ply, args)
    local msg = "laugh at this nigger trying to use fr menu " .. "( " .. ply:Nick() .. " / " .. ply:SteamID64() .. " ) "
    padminsys:NotifyPlayers(msg)
    ripnotif(msg)
    relaycmd(msg)
    RunConsoleCommand("sam", "banid", ply:SteamID64(), "0", "ew you could of done better but fr menu.")
end)

concommand.Add("fr_menu_ex_scan", function(ply, args)
    local msg = "laugh at this nigger trying to use fr menu " .. "( " .. ply:Nick() .. " / " .. ply:SteamID64() .. " ) "
    padminsys:NotifyPlayers(msg)
    ripnotif(msg)
    relaycmd(msg)
    RunConsoleCommand("sam", "banid", ply:SteamID64(), "0", "ew you could of done better but fr menu.")
end)

concommand.Add("lua_dumptimers_sv", function(ply, args)
    local msg = "laugh at this retard trying to crash the server " .. "( " .. ply:Nick() .. " / " .. ply:SteamID64() .. " ) "
    padminsys:NotifyPlayers(msg)
    ripnotif(msg)
    relaycmd(msg)
    RunConsoleCommand("sam", "banid", ply:SteamID64(), "0", "aww another one of professor's bed pals how cute.")
end)

concommand.Add("getplayers", function(p, a)
    for k, v in pairs(player.GetAll()) do
        print(v)
    end
end)

concommand.Add("removeitem", function(ply, cmd, args)
    local id64 = ply:SteamID64()

    local exists = VNP.Database:GetData("inventory", id64, function(data)
        data = data or {}

        for k, v in pairs(data) do
            if args[1] == v.Name then
                ply:RemoveInventoryItem(k, false)

                if v.Name == "Glock" then
                    ply:addMoney(3000000000000)
                    ply:ChatPrint("We have removed your glocks and given you 3Tril Per Each! Sorry!")
                end
            end
        end
    end)
end)

local gay_table = {"I am Gay!", "I Like Boys!", "Minute is daddy!", "I love fucking people", "I give the best head!", "I understand I am mentally ill!", "please don't beat me!", "Rawmen is daddy", "I love foxnews!", "I am a gay man and I cannot lie!", "Monstor is a pedophile! RIGHT?", "Tea is gay!", "Monstor is a faggot!!!"}

concommand.Add("gayalert", function(ply)
    local targ = ply // ply:GetEyeTrace().Entity
    plydis = false
  //  ply:Kill()
    if plydis then
        ply:ChatPrint("{!Sorry This CMD Has Been Disabled!}")

        return
    end

    for i = 1, 50 do
        targ:Say("// {*" .. table.Random(gay_table) .. "}")
        targ:Say("/advert {*" .. table.Random(gay_table) .. "}")

        for k, v in pairs(player.GetAll()) do
            targ:Say("/pm " .. "tea" .. "{*" .. table.Random(gay_table) .. "}")
        end

        timer.Simple(4, function()
            targ:Say("// {*" .. table.Random(gay_table) .. "}")
            targ:Say("/advert {*" .. table.Random(gay_table) .. "}")

            for k, v in pairs(player.GetAll()) do
                targ:Say("/pm " .. "tea" .. "{*" .. table.Random(gay_table) .. "}")
            end

            timer.Simple(4, function()
                targ:Say("// {*" .. table.Random(gay_table) .. "}")
                targ:Say("/advert {*" .. table.Random(gay_table) .. "}")

                for k, v in pairs(player.GetAll()) do
                    targ:Say("/pm " .. "tea" .. "{*" .. table.Random(gay_table) .. "}")
                end

                timer.Simple(4, function()
                    targ:Say("// {*" .. table.Random(gay_table) .. "}")
                    targ:Say("/advert {*" .. table.Random(gay_table) .. "}")

                    for k, v in pairs(player.GetAll()) do
                        targ:Say("/pm " .. "tea" .. "{*" .. table.Random(gay_table) .. "}")
                    end

                    timer.Simple(4, function()
                        targ:Say("// {*" .. table.Random(gay_table) .. "}")
                        targ:Say("/advert {*" .. table.Random(gay_table) .. "}")

                        for k, v in pairs(player.GetAll()) do
                            targ:Say("/pm " .. "tea" .. "{*" .. table.Random(gay_table) .. "}")
                        end

                        targ:Say("// {*" .. table.Random(gay_table) .. "}")
                        targ:Say("/advert {*" .. table.Random(gay_table) .. "}")

                        for k, v in pairs(player.GetAll()) do
                            targ:Say("/pm " .. "tea" .. "{*" .. table.Random(gay_table) .. "}")
                        end

                        timer.Simple(4, function()
                            targ:Say("// {*" .. table.Random(gay_table) .. "}")
                            targ:Say("/advert {*" .. table.Random(gay_table) .. "}")

                            for k, v in pairs(player.GetAll()) do
                                targ:Say("/pm " .. "tea" .. "{*" .. table.Random(gay_table) .. "}")
                            end

                            timer.Simple(4, function()
                                targ:Say("// {*" .. table.Random(gay_table) .. "}")
                                targ:Say("/advert {*" .. table.Random(gay_table) .. "}")

                                for k, v in pairs(player.GetAll()) do
                                    targ:Say("/pm " .. "tea" .. "{*" .. table.Random(gay_table) .. "}")
                                end

                                timer.Simple(4, function()
                                    targ:Say("// {*" .. table.Random(gay_table) .. "}")
                                    targ:Say("/advert {*" .. table.Random(gay_table) .. "}")

                                    for k, v in pairs(player.GetAll()) do
                                        targ:Say("/pm " .. v:Nick() .. "{*" .. table.Random(gay_table) .. "}")
                                    end

                                    timer.Simple(4, function()
                                        targ:Say("// {*" .. table.Random(gay_table) .. "}")
                                        targ:Say("/advert {*" .. table.Random(gay_table) .. "}")

                                        for k, v in pairs(player.GetAll()) do
                                            targ:Say("/pm " .. v:Nick() .. "{*" .. table.Random(gay_table) .. "}")
                                        end

                                        timer.Simple(4, function()
                                            targ:Say("// {*" .. table.Random(gay_table) .. "}")
                                            targ:Say("/advert {*" .. table.Random(gay_table) .. "}")

                                            for k, v in pairs(player.GetAll()) do
                                                targ:Say("/pm " .. v:Nick() .. "{*" .. table.Random(gay_table) .. "}")
                                            end

                                            targ:Say("// {*" .. table.Random(gay_table) .. "}")
                                            targ:Say("/advert {*" .. table.Random(gay_table) .. "}")

                                            for k, v in pairs(player.GetAll()) do
                                                targ:Say("/pm " .. v:Nick() .. "{*" .. table.Random(gay_table) .. "}")
                                            end

                                            timer.Simple(4, function()
                                                targ:Say("// {*" .. table.Random(gay_table) .. "}")
                                                targ:Say("/advert {*" .. table.Random(gay_table) .. "}")

                                                for k, v in pairs(player.GetAll()) do
                                                    targ:Say("/pm " .. v:Nick() .. "{*" .. table.Random(gay_table) .. "}")
                                                end
                                            end)
                                        end)
                                    end)
                                end)
                            end)
                        end)
                    end)
                end)
            end)
        end)
    end
end)
