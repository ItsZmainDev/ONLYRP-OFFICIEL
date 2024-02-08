CreateThread(function()
    while not ESXLoaded do Wait(1) end

    TriggerServerEvent('zmain:weapons:load')
end)