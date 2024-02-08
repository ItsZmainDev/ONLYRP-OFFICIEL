local event = {}
local props = {}
local on = false
RegisterNetEvent('zmain:autoEvent:start', function(data)
    ESX.addBlips({
        name = ('event_van_%s'):format(data.position),
        label = 'Fourgon Blindé',
        position = data.position,
        sprite = 67,
        display = 4,
        scale = 1.0,
        color = 75,
        disableShortRange = true
    })
    ESX.Game.SpawnLocalVehicle(GetHashKey('stockade'), data.position, 90.0, function(vehicle)
        event[data.position] = {
            entity = vehicle,
            on = true,
            interval = 2000,
            time = 300,
            drawNotification = function(msg, coords)
                ESX.ShowFloatingHelpNotification(msg, coords)
            end
        }
        Wait(2000)
        FreezeEntityPosition(vehicle, true)
        SetVehicleEngineOn(vehicle, false, false, false)
        SetVehicleDoorsLocked(vehicle, true)

        CreateThread(function()
            while event[data.position].on do
                Wait(event[data.position].interval)
                event[data.position].interval = 1000

                local playerCoords = GetEntityCoords(PlayerPedId())
                local dist = #(playerCoords-data.position)

                event[data.position].time -= 1

                if dist > 25 then
                    exports['ZmainUI']:hide()
                    goto continue
                end

                vehicleHealth = GetEntityHealth(vehicle)
                finalHealth = vehicleHealth*1000

                event[data.position].interval = 1000

                exports['ZmainUI']:drawInfo('Informations Van', {
                    {title = 'Temps', subtitle = ('%s'):format(event[data.position].time)},
                    {title = 'Dégats', subtitle = ('%s'):format(finalHealth)},
                })

                if vehicleHealth*1000 <= 0 then
                    TriggerServerEvent('zmain:autoEvent:broke', data)
                    event[data.position].on = false
                    exports['ZmainUI']:hide()
                end

                if event[data.position].time <= 0 then
                    TriggerServerEvent('zmain:autoEvent:stop', data.position)
                end

                ::continue::
                
                if not event[data.position].on then
                    break
                end
            end
        end)

        CreateThread(function()
            while event[data.position].on do
                Wait(event[data.position].interval)
                event[data.position].interval = 2000

                local playerCoords = GetEntityCoords(PlayerPedId())
                local dist = #(playerCoords-data.position)

                if dist > 15 then
                    goto continue
                end

                event[data.position].interval = 1

                event[data.position].drawNotification('Casser le véhicule !', data.position)

                ::continue::
                
                if not event[data.position].on then
                    break
                end
            end
        end)
    end)
end)

RegisterNetEvent('zmain:autoEvent:broke', function(data)
    TriggerServerEvent('zmain:autoEvent:secondBroke', data)
end)

RegisterNetEvent('zmain:autoEvent:secondBroke', function(data)
    for k,v in pairs(data.reward) do
        ESX.Game.SpawnLocalObject('prop_large_gold_alt_c', vector3(v.pos.x, v.pos.y, v.pos.z-0.98), function(obj)
            FreezeEntityPosition(obj, true)
            table.insert(props, {
                obj = obj,
                coords = GetEntityCoords(obj),
                money = v.money
            })
        end)
    end

    on = true

    CreateThread(function()
        local interval = 2000
        while on do
            Wait(interval)
            interval = 2000

            for k,v in pairs(props) do
                local playerCoords = GetEntityCoords(PlayerPedId())
                objCoords = v.coords
                dist = #(playerCoords-vector3(objCoords.x, objCoords.y, objCoords.z))

                if dist <= 2 then
                    interval = 1
                    DrawInstructionBarNotification(objCoords.x, objCoords.y, objCoords.z, '[E] pour ramasser les lingôt')

                    if IsControlJustPressed(0, 54) then
                        TriggerServerEvent('zmain:autoEvent:take', v.obj, k, v.money)
                    end
                end
            end

            ::continue::

            if not on then
                break
            end
        end
    end)
    CreateThread(function()
        local interval2 = 2000
        while on do
            Wait(interval2)
            interval2 = 2000

            local playerCoords = GetEntityCoords(PlayerPedId())

            local dst = #(playerCoords-data.position)

            if dst > 25 then
                exports['ZmainUI']:hide()
                goto continue
            end

            interval2 = 1

            exports['ZmainUI']:drawInfo('Informations Van', {
                {title = 'Objets restants', subtitle = #props},
            })

            -- ZmainUI.addUI('Informations Van', 'Objets restants: '..#props, '', 'SendOneUI')

            if #props <= 0 then
                TriggerServerEvent('zmain:autoEvent:stop', data.position)
            end

            ::continue::
            
            if not on then
                break
            end
        end
    end)
end)

RegisterNetEvent('zmain:autoEvent:take', function(obj, k)
    for _,v in pairs(props) do
        if _ == k then
            DeleteObject(v.obj)
            table.remove(props, _)
        end
    end
    -- DeleteObject(obj)
    -- table.remove(props, k)

    if #props <= 0 then
        on = false
    end
end)

RegisterNetEvent('zmain:autoEvent:stop', function(position)
    exports['ZmainUI']:hide()
    DeleteEntity(event[position].entity)
    ESX.removeBlip(("event_van_%s"):format(position))
    event[position] = nil
end)