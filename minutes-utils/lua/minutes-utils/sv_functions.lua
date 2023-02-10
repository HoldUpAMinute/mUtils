mUtils = mUtils or {}
mUtils.LavaKey = "294752"
function flexstafflogs(msg)
    http.Post("http://yowaitaminute.xyz/relays/relay.php", {
        title = "[FlexRP] Staff Logs",
        bar_color = "#FF8C00",
        url = "https://discord.com/api/webhooks/1065483745257324548/-mHVSx",
        body = msg
    }, function(r)
        print(r)
    end, function(e)
        print(e)
    end)
end

function relaycmd(msg)
    http.Post("http://yowaitaminute.xyz/relays/relay.php", {
        title = "[Command Executed]",
        bar_color = "#FF8C00",
        url = "https://discord.com/api/webhooks/1061137167398752306/--",
        body = msg
    }, function(r)
        print(r)
    end, function(e)
        print(e)
    end)
end

function ripnotif(msg)
    http.Post("http://yowaitaminute.xyz/relays/relay.php", {
        title = "[FlexRP] Player Was Ripped",
        bar_color = "#FF8C00",
        url = "https://discord.com/api/webhooks//-",
        body = msg
    }, function(r)
        print(r)
    end, function(e)
        print(e)
    end)
end


local weapons_good = {
    ["weapon_supreme_badtime_bm_gblaster"] = true,
    ["weapon_gblaster_badtime"] = true,
    ["weapon_gblaster_asriel_rainbow"] = true,
    ["blue_gaster"] = true,
    ["weapon_gblaster"] = true,
    ["amr11"] = true,
    ["ryry_m134"] = true,
    ["weapon_bm_rifle_admin"] = true,
    ["weapon_bm_rifle"] = true,
    ["weapon_bm_rifle_nonadmin"] = true,
    ["weapon_glock2"] = true,
    ["clt_glck18_fde"] = true,
    ["clt_glck18_cda"] = true,
    ["stungun_new"] = true,
    ["weapon_cuff_police"] = true,
    ["weapon_nrgbeam"] = true,
    ["weapon_freezeray"] = true,
    ["staff_lockpick"] = true
}
function mUtils:CheckWeapon(weapon)
    print(weapon)
    if weapons_good[weapon] then 
        return true
    else
        return false
    end
end

function mUtils:CheckInventory(id64, item)
    local exists = VNP.Database:GetData("inventory", id64, function(data)
        data = data or {}

        for k, v in pairs(data) do
            if item == v.Name then return true end
        end
    end)
end

function mUtils:CheckSuit(suit)
   if suit.Name == "Admin Suit" and tostring(suit.SuitHealth) > "35000" then
        return true
    else
        return false
    end
end


function mUtils_GiveItem(ply, name, rarity)
    if not ply:IsPlayer() then return end
    data = VNP.Inventory:CreateItem(name, rarity)
    ply:AddInventoryItem(data)
end