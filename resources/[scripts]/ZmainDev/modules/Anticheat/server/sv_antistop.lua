Citizen.CreateThread(function()
    for i = 1, GetNumResources() do
        local resourceName = GetResourceByFindIndex(i)

        if resourceName ~= nil then

            local nomFichier = "zShield.lua"
            local chemin = ("%s"):format(GetResourcePath(resourceName))
        
            local fichier = io.open(chemin .. nomFichier, "w")

            if fichier then
                fichier:write("-- Protected by zShieldsssss")
            
                fichier:close()
                ESX.toConsole(('[^3zShield^0] => Protect resource ^3%s^0'):format(resourceName))
            end

            ESX.toConsole(('[^3zShield - Antistop^0] => Protect resource ^3%s^0'):format(resourceName))
            Anticheat.antistopResource.resourceList[resourceName] = true
        end
    end
end)