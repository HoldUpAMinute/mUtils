function returnmatthatisntretardedasf(skin)
    for k, v in pairs(skins) do
        if skin == k then return v end
    end
end

hook.Add("PlayerDeath", "RipNotificaitons", function(victim, inflictor, attacker)
    if victim:GetSuit() then
        local suit = victim:GetSuit()

        if suit.LSkins then
            local y = suit.LSkins
            x = returnmatthatisntretardedasf(y)
        else
            x = "No Skin"
        end

        if victim:Nick() == inflictor:Nick() then
            inmfweapon = "Pussy Suicided."
        else
            inmfweapon = inflictor:GetActiveWeapon():GetNick()
        end
        local msg = "**Name:** " .. victim:Nick() .. "\n**Suit:** " .. suit.Name .. "\n **Suit Rarity: **" .. suit.Rarity.Name .. "  \n**Skin**: " .. x .. " \n**Attacker:** " .. inflictor:Nick() .. " \n**Weapon:** " .. inmfweapon
        ripnotif(msg)
    end
end)