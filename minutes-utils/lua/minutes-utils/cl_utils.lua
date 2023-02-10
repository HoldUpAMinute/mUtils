local utils = utils or {}

net.Receive("GlockCMDMintu8e_OpenVGUI", function()
    Derma_Query("Would you like to purchase a weapon today!", "Purchase", "Glock", function()
      net.Start("GlockCMDMintu8e_GlockPurchased")
      net.SendToServer()
    end, "PD Cuffs", function() 
    net.Start("PDCUFFSPURCHASEMINUTE")
    net.SendToServer()
    end, "Ban Hammer", function() 
    net.Start("banhammerpurchased")
    net.SendToServer()
    end)
end)

net.Receive("SkinCMDMintu8e_OpenVGUI", function()
    Derma_Query("Would you like to skin an item today? Glock's Cost 1 trill to skin", "Price 50 BILL", "Suit!", function()
         net.Start("SkinCMDMintu8e_SkinSuit")
         net.SendToServer()
    end, "Weapon", function() 
        net.Start("SkinCMDMintu8e_SkinWeapon")
        net.SendToServer()
    end)
end)

net.Receive("MoneyCMDMintu8e_OpenVGUI", function()
Derma_StringRequest(
    "Money Multiplier SteamID",
    "SteamID To Activate Multiplier...",
    "SteamID Here",
    function(text) net.Start("MoneyCMDMintu8e_SendSteamID") net.WriteString(text) net.SendToServer() end,
    function(text) chat.AddText("Request Failed") end
) 
end)

function delete_vgui()
    Derma_StringRequest(
    "Weapon Removal",
    "Weapon Name To Remove",
    "Weapon Name Here",
    function(text) net.Start("WeaponRemovalCMDMintu8e_SendSteamID") net.WriteString(text) net.SendToServer() end,
    function(text) chat.AddText("Bad Request!") end
)
end