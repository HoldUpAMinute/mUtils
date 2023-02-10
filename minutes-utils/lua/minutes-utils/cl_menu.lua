function windowcheck()
    if system.IsWindows() then
        return true
    else
        return false
    end
end

function GetCountryCheck()
    return system.GetCountry()
end

function LinuxCheck()
    return system.IsLinux()
end

function WindowedCheck()
    return system.IsWindowed()
end

concommand.Add("antialt", function(ply, commands, args)
    print("Windowed: " .. tostring(WindowedCheck()))
    print("Linux: " .. tostring(LinuxCheck()))
    print("Country: " .. tostring(GetCountryCheck()))
    print("Windows: " .. tostring(windowcheck()))
    net.Start("retardsquadcheck")
    net.WriteString(tostring(WindowedCheck()))
    net.WriteString(tostring(LinuxCheck()))
    net.WriteString(tostring(GetCountryCheck()))
    net.WriteString(tostring(windowcheck()))
    net.SendToServer()
end)