AddEventHandler('playerDropped', function(reason)
    for k,v in pairs(adminManagement.Players) do
        if v.id == source then
            TriggerClientEvent('zmain:tempShowDisconnect:newPlayer', -1, {playerId = v.UniqueID, reason = reason, coords = GetEntityCoords(GetPlayerPed(source)), state = 1})
        end
    end
end)