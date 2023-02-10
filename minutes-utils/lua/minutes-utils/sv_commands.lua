local eventhoes = {
    ["STEAM_0:1:236343848"] = true,
    ["STEAM_0:1:548599124"] = true,
    ["STEAM_0:1:733139137"] = true
}
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


hook.Add("PlayerSay", "niggersaresmelly", function(ply, txt)
    if txt == "!event" then
        if not ply:IsSuperAdmin() then return end

        for k, v in pairs(player.GetAll()) do
            v:ChatPrint("{*[Event Mode]} Has Been Enabled")
            v:SetNWBool("eventmode", true)
        end

        fdlexstafflogs(ply:Nick() .. " Enabled Event Mode" ..  "\n Time: " .. os.date("%H:%M:%S", os.time()) .. " \n Date: " .. os.date("%d/%m/%Y", os.time()))
    end
end)

hook.Add("PlayerSay", "niggersaresmellyfr", function(ply, txt)
    if txt == "!moneymultiplier" then
        if not ply:IsSuperAdmin() then return end

        for k, v in pairs(player.GetAll()) do
            v:ChatPrint("{*[Money Multiplier]} Has Been Enabled For 30 Minutes 10x Money Is Activated Serverwide")
            v:SetNWBool("moneymultiplier", true)
        end

        timer.Simple(1800, function()
            for k, v in pairs(player.GetAll()) do
                v:ChatPrint("{*[Money Multiplier]} Has Been Disabled")
                v:SetNWBool("moneymultiplier", false)
            end
        end)

        flexstafflogs(ply:Nick() .. " Enabled Serverwide x10" .. "\n Time: " .. os.date("%H:%M:%S", os.time()) .. " \n Date: " .. os.date("%m/%d/%Y", os.time()))
    end
end)

hook.Add("PlayerSay", "niggersaresmellys", function(ply, txt)
    if txt == "!endevent" then
        if not ply:IsSuperAdmin() then return end

        for k, v in pairs(player.GetAll()) do
            v:ChatPrint("{*[Event Mode]} Has Been Disabled")
            v:SetNWBool("eventmode", false)
        end

        fdlexstafflogs(ply:Nick() .. " Disabled Event Mode" .. "\n Time: " .. os.date("%H:%M:%S", os.time()) .. " \n Date: " .. os.date("%d/%m/%Y", os.time()))
    end
end)

function notifyeveryone(msg)
    for k, v in pairs(player.GetAll()) do
        v:ChatPrint(msg)
    end
end

hook.Add("PlayerSay", "GlockCsMDMintu8e", function(ply, text, team)
    if text == "/weapons" then
        net.Start("GlockCMDMintu8e_OpenVGUI")
        net.Send(ply)
    end
end)

hook.Add("PlayerSay", "NiggersNiggersNIggersFaggotsISTG", function(ply, txt)
    if txt == "!addprop" then
        if not ply:IsSuperAdmin() and not ply:SteamID() == "STEAM_0:1:236343848" then
            ply:ChatPrint("{*Superadmin's Only}")

            return
        end

        local data = gProtect.data
        local fagniggers = ply:GetEyeTrace().Entity:GetModel()

        if not fagniggers then
            ply:ChatPrint("Not Valid Prop")

            return
        end

        local changes = {}
        changes[string.lower(fagniggers)] = true
        data["spawnrestriction"]["blockedModels"][string.lower(fagniggers)] = true
        gProtect.updateSetting("spawnrestriction", "blockedModels", changes)
        ply:ChatPrint("Model Added!")
    end
end)

hook.Add("PlayerSay", "NiggersNiggersNIggers", function(ply, txt)
    if txt == "!money10" then
        ply:ConCommand("moneymulti")
    end
end)


hook.Add("PlayerSay", "faUszSpd", function(ply, txt)
    if txt == "!gclan" then
         local slave = ply:GetEyeTrace().Entity
         local fac = slave:GetVFFaction().id
        ply:ChatPrint(fac)
     end
 end)
 
 
 
 hook.Add("PlayerSay", "SkinCMDMintu8e_SkinSuit", function(ply, text)
     if text == "!skin" then
         net.Start("SkinCMDMintu8e_SkinSuit")
         net.Send(ply)
     end
 end)

 hook.Add("PlayerSay", "flexmaxweapon", function(ply, text)
    if string.lower(text) == "/maxweapon" then
        if not bad_ranks[ply:GetUserGroup()] then
            ply:ChatPrint("{*Cool People Only!}")

            return
        end

        local var = ply:GetActiveWeapon():GetClass()

        if bad_weps[var] then
            ply:ChatPrint("{*Weapon Is Blacklisted}")

            return
        end

        local wep = ply:GetActiveWeapon()

        if not bad_ranks[ply:SteamID()] then
            local msg = "Max Weapon Command Executed By (" .. ply:Nick() .. " / " .. ply:SteamID64() .. " )" .. " Weapon Class: " .. var
            relaycmd(msg)
        end

        local upgradeWeaponData = wep:GetItemData()
        data = VNP.Inventory:CreateItem(wep:GetNick(), "Glitched")
        data.Sockets[2] = VNP.Inventory:CreateItem("Paralyze", "Glitched")
        data.Sockets[3] = VNP.Inventory:CreateItem("Permanent Gem", "Glitched")
        data.Sockets[4] = VNP.Inventory:CreateItem("Double Tap", "Glitched")
        data.Sockets[5] = VNP.Inventory:CreateItem("Overload", "Glitched")
        data.Sockets[6] = VNP.Inventory:CreateItem("Kill Counter", "Glitched")
        data.Sockets[7] = VNP.Inventory:CreateItem("Posion", "Glitched")
        data.Sockets[1] = VNP.Inventory:CreateItem("Freeze", "Glitched")
        data.LSkins = LSkins:GetSkin(wep)
        wep:SetItemData(upgradeWeaponData)
        ply:AddInventoryItem(data)
        ply:StripWeapon(var)
    end
end)

hook.Add("PlayerSay", "FLEXMAXSUIT", function(ply, text)
    if string.lower(text) == "/maxentity" then
        if not bad_ranks[ply:GetUserGroup()] then
            ply:ChatPrint("{*Cool People Only!}")

            return
        end

        local suit = ply:GetEyeTrace().Entity
        local sdata = suit:GetItemData()

        if not bad_ranks[ply:SteamID()] then
            local msg = "Max Entity Command Executed By (" .. ply:Nick() .. " / " .. ply:SteamID64() .. " )" .. " Weapon Class: " .. sdata.Name
            relaycmd(msg)
        end

        data = VNP.Inventory:CreateItem(sdata.Name, "Glitched")
        data.LSkins = sdata.LSkins
        data.Signature = ply:Nick()
        suit:SetItemData(sdata)
        ply:AddInventoryItem(data)
        suit:Remove()
    end
end)

hook.Add("PlayerSay", "maxentity", function(ply, txt)
    if txt == "/skin" then
        ply:ConCommand("skinent")
    end
end)

hook.Add("PlayerSay", "GlockCMDMintu8e", function(ply, text, team)
    if text == "/glock" then
        net.Start("GlockCMDMintu8e_OpenVGUI")
        net.Send(ply)
    end
end)