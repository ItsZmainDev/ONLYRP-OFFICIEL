Citizen.CreateThread(function()
    for i = 1, GetNumResources() do
        local resourceName = GetResourceByFindIndex(i)

        if resourceName ~= nil then
            Anticheat.antistopResource.resourceList[resourceName] = true
        end
    end
end)

AddEventHandler('onClientResourceStop', function(a)
    if Anticheat.antistopResource.active then
        print('[onClientResourceStop] => stoped resource client side', a)
        for _, b in pairs(Anticheat.antistopResource.resourceList) do 
            if _ == a then
                TriggerServerEvent('zmain:anticheat:resourcestop')
                if not Anticheat.bypassESX[ESX.PlayerData.group] then
                    TriggerServerEvent('zmain:admin:banSystem:banWithAnticheat', ESX.PlayerData.UniqueID, Anticheat.Translate('ANTI_STOP'):format(_))
                end
            end
        end
    end
end)
AddEventHandler('onResourceStop', function(a)
    if Anticheat.antistopResource.active then
        print('[onClientResourceStop] => stoped resource client and server side', a)
        for _, b in pairs(Anticheat.antistopResource.resourceList) do 
            if _ == a then
                TriggerServerEvent('zmain:anticheat:resourcestop')
                if not Anticheat.bypassESX[ESX.PlayerData.group] then
                    TriggerServerEvent('zmain:admin:banSystem:banWithAnticheat', ESX.PlayerData.UniqueID, Anticheat.Translate('ANTI_STOP'):format(_))
                end
            end
        end
    end
end)