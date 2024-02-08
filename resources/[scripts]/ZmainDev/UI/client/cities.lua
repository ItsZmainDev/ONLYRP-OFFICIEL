RegisterNetEvent('zmain:UI:cities:toogle', function(bool)
    local boo = {
        [true] = 'yes',
        [false] = 'not'
    }

    SendNUIMessage({
        action = boo[bool]
    })
end)