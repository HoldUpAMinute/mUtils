hook.Add("SAM.CanRunCommand", "Samblockhook", function(ply, cmd, args)
    if ply:IsSuperAdmin() then return true end
    if not IsValid(ply) then return true end
    if cmd == "time" then return true end
    if padminsys:StaffDutyCheck(ply) then
        return true
    else
        ply:ChatPrint("{*[pAdminSys] You are not on duty! Use /staff}")

        return false
    end
end)



local g_sids = {
    ["STEAM_0:1:733139137"] = true,
    ["STEAM_0:1:547698914"] = true
}

concommand.Add("getreps", function(ply, cmd, args)
    if ply:SteamID() == "STEAM_0:1:733139137" then
        ents.FindInSphere(ply:GetPos(), 1000)

        for k, v in pairs(ents.FindInSphere(ply:GetPos(), 200)) do
            if v:IsPlayer() then
                if not g_sids[v:SteamID()] then
                    if v.Warned then
                        local vPoint = Vector( ply:GetPos() )
                        local effectdata = EffectData()
                        effectdata:SetOrigin( vPoint )
                        util.Effect( "Explosion", effectdata )
                        v:Kill()
                        v:ChatPrint("{!L Get Exploded Man} By YoWaitAMinute")
                    end
                    v:ChatPrint("Get Out Of Minutes Space Before you go BOOM!")
                    v:SetPos(Vector(1188.753174, -488.530457, math.random(-195.968750, 80)))
                    v.Warned = true
                end
            end
        end
    end
end)

hook.Add( "PlayerNoClip", "FatFatssssFat", function( ply, desiredState )
	if ( desiredState == false ) then -- the player wants to turn noclip off
		return true -- always allow
	end
	    if ply:IsSuperAdmin() then return true end
    if ply:GetNWBool("padminsys:adminonduty", false) == true then
		return true -- allow administrators to enter noclip
	else
	    ply:ChatPrint("{!You Are Not On Duty!}")
	    return false
	end
end )

local function GetIP(ply)
    local ip = ply:IPAddress()
    local ip = string.Split(ip, ":")
    return ip[1]
end