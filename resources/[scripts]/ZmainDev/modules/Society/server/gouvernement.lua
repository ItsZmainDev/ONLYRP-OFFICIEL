RegisterNetEvent('zmain:gouv:annonce', function(message)
    TriggerClientEvent('zmain:admin:announce', -1, message)
end)