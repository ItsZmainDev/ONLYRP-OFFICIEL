AddEventHandler('esx:playerLoaded', function(playerData)
    while not ESXLoaded do Wait(1) end

    TriggerEvent('zmain:drift:update', true)
end)