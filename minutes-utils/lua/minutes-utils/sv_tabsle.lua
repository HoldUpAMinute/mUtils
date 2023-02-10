skins = {
    ["Aquarium3"] = "models/skins/aquarium3",
    ["Artsy"] = "models/skins/artsy",
    ["Bass"] = "models/skins/bass",
    ["Collisions"] = "models/skins/collisions",
    ["Cracked"] = "models/skins/cracked",
    ["Dance"] = "models/skins/dance",
    ["Disco"] = "models/skins/disco",
    ["Doughnut"] = "models/skins/doughnut",
    ["Glitched"] = "models/skins/glitched",
    ["Lightshow"] = "models/skins/lightshow",
    ["Liquid"] = "models/skins/liquid",
    ["Pulse"] = "models/skins/pulse",
    ["Rainbowdrops"] = "models/skins/rainbowdrops",
    ["Rearranged"] = "models/skins/rearranged",
    ["Shaped"] = "models/skins/shaped",
    ["Sketchy"] = "models/skins/sketchy",
    ["Smallone2"] = "models/skins/smallone2",
    ["Splotches"] = "models/skins/splotches",
    ["Trippy"] = "models/skins/trippy",
    ["Warped"] = "models/skins/warped",
    ["Waves"] = "models/skins/waves",
    ["Wobble"] = "models/skins/wobble",
    ["Elite"] = "models/skins/elite5",
    ["Lethal"] = "models/skins/lethal5",
    ["Nosharp"] = "models/skins/nosharp3",
    ["Simper"] = "models/skins/simpking2",
    ["Boomer"] = "models/skins/bomer5"
}
function viprankcheck(ply)
    if ply:GetUserGroup() == "user" then return false end
    for k,v in pairs(sam.ranks.get_ranks()) do
        if ply:GetUserGroup() == v.name then
            return true
        end
    end
end

function checkprinters(ply)
    if not ply.printers then
        ply.printers = ply.printers or {}
        return false
    end
    for k,v in pairs(ply.printers) do
        if not v:IsValid() then
            print("detected")
            table.remove(ply.printers, k)
        end
    end
    for k,v in pairs(ply.printers) do
        if k == tonumber("5") then
           return true
        end
    end
end

hook.Add("PlayerSay", "VIPPRINTER", function(ply, text)
    if text == "!vipprinter" then
        if checkprinters(ply) then ply:ChatPrint("{!You Have Too Many Printers!}") return end
        if not viprankcheck(ply) then ply:ChatPrint("{!You Are Not VIP}") return end
        local ent = ents.Create("printers_rack")
        local pos = ply:GetEyeTrace().HitPos
        ent:SetPos(pos)
        ent:Spawn()
        table.insert(ply.printers, ent)
    end
end)

hook.Add( "PlayerDisconnected", "Playerlssseave", function(ply)
    if not ply.printers then
        ply.printers = ply.printers or {}
        return false
    end
    for k, v in pairs(ply.printers) do 
        if v:IsValid() then
            v:Remove()
        end
    end
end )

hook.Add("PlayerSay", "RetardReturn", function(ply, txt)
    if txt == "!getretards" then
        ply:ChatPrint("{*Current Retards!}")
        ply:ChatPrint("{*Kaiser Takes The Cake His Github Is Pasted!}")
        ply:ChatPrint("{*Then We Got His Dick Riding Friend Randock! He doesn't know lua at all} :skull:")
        ply:ChatPrint("{*Then We Got Nuky! He Is Friends With The Same People That Fucked His Server Over!}")
    end
end)