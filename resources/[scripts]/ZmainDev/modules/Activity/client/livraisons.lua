_LIVRAISONS = {
    inLivraisons = false,

    myLivraisons = {},
    levels = 0,
    gains = 0,
    totalLivraisons = 0,
    time = 600,
    vehicle = {},

    vehicleEntity = {},
    blipsEntity = {},
    interval = 0,

    RandomZone,x,y,z = nil, nil, nil, nil,

    Action = function()
        TriggerServerEvent('zmain:livraisons:dest')
        TriggerServerEvent('zmain:livraisons:setNewLiv')
    end
}

function _LIVRAISONS.Info(Title, RightText, LeftText)
    local LineCount = #RightText >= #LeftText and #RightText or #LeftText
    if Title ~= nil then
        RenderText("~h~" .. Title .. "~h~", 1350 + 20 + 100, 605, 0, 0.34, 255, 255, 255, 255, 0)
    end
    if RightText ~= nil then
        RenderText(table.concat(RightText, "\n"), 1350 + 20 + 100, 635, 0, 0.28, 255, 255, 255, 255, 0)
    end
    if LeftText ~= nil then
        RenderText(table.concat(LeftText, "\n"), 1350 + 432 + 100, 635, 0, 0.28, 255, 255, 255, 255, 2)
    end
    RenderRectangle(1350 + 10 + 100, 600, 432, Title ~= nil and 50 + (LineCount * 20) or ((LineCount + 1) * 20), 0, 0, 0, 160)
end

function _LIVRAISONS.stop()
    _LIVRAISONS.inLivraisons = false
    _LIVRAISONS.time = 600

    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
        TriggerEvent('skinchanger:loadSkin', skin)

        for k,v in pairs(_LIVRAISONS.blipsEntity) do
            RemoveBlip(v)
            SetBlipRoute(v, 0)
        end
    
        for k,v in pairs(vehicleEntity) do
            DeleteEntity(v)
        end
    end)
end

local positions = {
    {pos = vector3(959.2705078125, -1696.7489013672, 29.47169303894), heading = 167.05740356445},
    {pos = vector3(963.889, -1696.733, 29.59146), heading = 167.05740356445},
    {pos = vector3(967.539, -1696.896, 29.50144), heading = 167.70121765137},
}

local coords = vector3(959.2705078125, -1696.7489013672, 29.47169303894)

function _LIVRAISONS.openLivraisonsMenu()

    ESX.TriggerServerCallback('zmain:livraisons:getLivraisons', function(cb)
        _LIVRAISONS.levels = cb.levels[ESX.PlayerData.UniqueID]
        _LIVRAISONS.gains = cb.gains[ESX.PlayerData.UniqueID]
        _LIVRAISONS.totalLivraisons = cb.totalLivraisons[ESX.PlayerData.UniqueID]
        _LIVRAISONS.vehicle = cb.vehicle[ESX.PlayerData.UniqueID]
    end)

    local main = RageUI.CreateMenu('', 'Livraisons Disponibles')

    RageUI.Visible(main, not RageUI.Visible(main))
    FreezeEntityPosition(PlayerPedId(), true)
    while main do Wait(1)
        RageUI.IsVisible(main, function()
            RageUI.Separator(('Votre expérience: %s/500'):format(_LIVRAISONS.levels))
            RageUI.Separator(('Vos gains de livraisons: %s/3000$'):format(_LIVRAISONS.gains))
            RageUI.Separator(('Vos livraisons effectuées: %s'):format(_LIVRAISONS.totalLivraisons))
            RageUI.Separator(('Véhicule de service: %s'):format(table.concat(_LIVRAISONS.vehicle, ", ") or 'Lapin'))
            RageUI.Line()
            RageUI.Button('Commencer l\'activité livraison de nourriture', nil, {}, not _LIVRAISONS.inLivraisons, {
                onSelected = function()
                    KeyboardUtils.use('Taper Y pour valider', function(data)
                        if data == 'y' or data == 'Y' then


                            local attemps = 0
                            local notifs = false

                
                            local function r()
                                Wait(10)
                                attemps = attemps + 1
                    
                                if not ESX.Game.IsSpawnPointClear(coords, 2) then coords = positions[math.random(1, #positions)].pos end
                                
                                if attemps > 10 then
                                    if not notifs then
                                        notifs = true
                                        ESX.ShowNotification('~r~Vous devez attendre qu\'une place se libère pour que votre véhicule sorte~s~')
                                    end
                                end
                    
                                return ESX.Game.IsSpawnPointClear(coords, 2) == true or r();
                            end
                    
                            r()

                            TriggerServerEvent('zmain:livraisons:startFoodUber')

                            local model = GetEntityModel(PlayerPedId())
                            if model == `mp_m_freemode_01` then -- homme
                                ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                                    TriggerEvent('skinchanger:loadClothes', skin, {
                                        ['tshirt_1'] = 15, ['tshirt_2'] = 0,
                                        ['torso_1'] = 772, ['torso_2'] = 0,
                                        ['arms'] = 19,
                                        ['pants_1'] = 43, ['pants_2'] = 0,
                                        ['shoes_1'] = 111, ['shoes_2'] = 0,
                                        ['bags_1'] = 44, ['bags_2'] = 0,
                                        ['helmet_1'] = -1, ['helmet_2'] = 0,
                                    })
                                end)
                            elseif model ~= `mp_f_freemode_01` then  -- femme
                                ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                                    TriggerEvent('skinchanger:loadClothes', skin, {
                                        ['tshirt_1'] = 26, ['tshirt_2'] = 0,
                                        ['torso_1'] = 166, ['torso_2'] = 1,
                                        ['arms'] = 19,
                                        ['pants_1'] = 1, ['pants_2'] = 1,
                                        ['shoes_1'] = 25, ['shoes_2'] = 0,
                                        ['bags_1'] = 44, ['bags_2'] = 0,
                                        ['helmet_1'] = -1, ['helmet_2'] = 0,
                                    })
                                end) 
                            end
                        end
                    end)
                end
            })

            if _LIVRAISONS.inLivraisons then
                RageUI.Button('Arrêter l\'activité de livraison', nil, {}, true, {
                    onSelected = function()
                        _LIVRAISONS.inLivraisons = false
                        _LIVRAISONS.stop()

                        ESX.ShowNotification('🚨 Tu a arrêter l\'activité de livraison, ton expérience a bien été enregistré dans nos fichiers !')
                    end
                })
            end
        end)

        if not RageUI.Visible(main) and

        not RageUI.Visible(main) then
            main = RMenu:DeleteType('main')
            FreezeEntityPosition(PlayerPedId(), false)
        end
    end
end 

RegisterNetEvent('zmain:livraisons:startFoodUber', function(levels, gains, totalLivraisons, vehicle)
    _LIVRAISONS.levels = levels
    _LIVRAISONS.gains = gains
    _LIVRAISONS.totalLivraisons = totalLivraisons
    _LIVRAISONS.vehicle = vehicle
    _LIVRAISONS.inLivraisons = true

    print(json.encode(coords))

    ESX.Game.SpawnVehicle(table.concat(_LIVRAISONS.vehicle), vector3(coords.x, coords.y, coords.z), 175.13415527344, function(vehicle)
        _LIVRAISONS.vehicleEntity[ESX.PlayerData.UniqueID] = vehicle
    end)

    CreateThread(function()
        while _LIVRAISONS.inLivraisons do
            Wait(1)

            -- _LIVRAISONS.Info('Informations Activité Livraisons', {'Expérience', 'Gains', 'Livraisons effectuées', 'Véhicule de service', 'Temps restant'}, {_LIVRAISONS.levels..'/500', _LIVRAISONS.gains..'$',  _LIVRAISONS.totalLivraisons, table.concat( _LIVRAISONS.vehicle, ", "), _LIVRAISONS.time..' secondes'})

            exports['ZmainUI']:drawInfo('Informations Livraisons', {
                {title = 'Expérience', subtitle = _LIVRAISONS.levels..'/500'},
                {title = 'Gains', subtitle = _LIVRAISONS.gains..'$'},
                {title = 'Livraisons effectuées', subtitle =  _LIVRAISONS.totalLivraisons},
                {title = 'Véhicule de service', subtitle = table.concat( _LIVRAISONS.vehicle, ", ")},
                {title = 'Temps restant', subtitle = _LIVRAISONS.time..' secondes'},
            })

            if not _LIVRAISONS.inLivraisons then
                for k,v in pairs(_LIVRAISONS.vehicleEntity) do
                    DeleteEntity(v)
                end
                exports['ZmainUI']:hide()
                break
            end
        end
    end)
end)

RegisterNetEvent('zmain:livraisons:update', function(levels, gains, totalLivraisons, vehicle)
    _LIVRAISONS.levels = levels
    _LIVRAISONS.gains = gains
    _LIVRAISONS.totalLivraisons = totalLivraisons
    _LIVRAISONS.vehicle = vehicle
end)

RegisterNetEvent('zmain:livraisons:newVehicle', function()
    for k,v in pairs(_LIVRAISONS.blipsEntity) do
        RemoveBlip(v)
        SetBlipRoute(v, 0)
    end

    _LIVRAISONS.RandomZone = vector3(967.05023193359, -1709.2103271484, 30.069849014282)
    _LIVRAISONS.x,_LIVRAISONS.y,_LIVRAISONS.z = _LIVRAISONS.RandomZone.x, _LIVRAISONS.RandomZone.y, _LIVRAISONS.RandomZone.z

    local blip = AddBlipForCoord(_LIVRAISONS.x,_LIVRAISONS.y,_LIVRAISONS.z)
    SetBlipSprite(blip, 8)
    SetBlipColour(blip, 70)
    SetBlipScale(blip, 0.6)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString('Livraison')
    EndTextCommandSetBlipName(blip)
    SetBlipRoute(blip, 1)
    _LIVRAISONS.blipsEntity[blip] = blip

    _LIVRAISONS.Action = function()
        TriggerServerEvent('zmain:livraisons:dest')
    end

    SetTimeout(1000, function()
        _LIVRAISONS.Action = function()
            TriggerServerEvent('zmain:livraisons:dest')
            TriggerServerEvent('zmain:livraisons:setNewLiv')
        end
    end)
end)

function _LIVRAISONS.openActions()
    local main = RageUI.CreateMenu('', 'Actions Disponibles')

    RageUI.Visible(main, not RageUI.Visible(main))
    while main do Wait(1)
        RageUI.IsVisible(main, function()
            RageUI.Button('')
        end)

        if not RageUI.Visible(main) then
            main = RMenu:DeleteType('main')
        end
    end
end

RegisterNetEvent('zmain:livraisons:setDestination', function(value)
    for k,v in pairs(_LIVRAISONS.blipsEntity) do
        RemoveBlip(v)
        SetBlipRoute(v, 0)
    end

    _LIVRAISONS.RandomZone = Activity.Livraisons.Market[math.random(1, #Activity.Livraisons.Market)]
    _LIVRAISONS.x,_LIVRAISONS.y,_LIVRAISONS.z = _LIVRAISONS.RandomZone.x, _LIVRAISONS.RandomZone.y, _LIVRAISONS.RandomZone.z

    local blip = AddBlipForCoord(_LIVRAISONS.x,_LIVRAISONS.y,_LIVRAISONS.z)
    SetBlipSprite(blip, 8)
    SetBlipColour(blip, 70)
    SetBlipScale(blip, 0.6)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString('Livraison')
    EndTextCommandSetBlipName(blip)
    SetBlipRoute(blip, 1)
    _LIVRAISONS.blipsEntity[blip] = blip

    if value ~= 'start' then
        _LIVRAISONS.time = 600
        ESX.ShowNotification(('🧭 Votre livraison vient de vous rapporter ~g~%s$~s~\nUne nouvelle position a été définie sur ton GPS ! Tu as 10 minutes pour livrer la marchandise'):format(_LIVRAISONS.gains))
    end

    if value == 'start' then
        ESX.ShowNotification('🧭 Un véhicule de service t\'a été fournie, une position a été ajouter sur ton GPS ! Prends le véhicule et rends toi là-bas pour livrer la marchandise. Tu as ~y~10 minutes~s~')
        CreateThread(function()
            while _LIVRAISONS.inLivraisons do

                _LIVRAISONS.interval = 2000
                
                local ped = PlayerPedId()
                local dist = #(GetEntityCoords(ped)-vector3(_LIVRAISONS.x,_LIVRAISONS.y,_LIVRAISONS.z))
                local vehicle = GetVehiclePedIsIn(ped, false)
                local vehicleName = GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(vehicle)))

                print(vehicleName)

                if vehicleName ~= 'Packer' and vehicleName ~= 'Rumpo' and vehicleName ~= 'Mule' then goto continue end

                if dist > 30 then goto continue end

                _LIVRAISONS.interval = 1

                DrawMarker(25, _LIVRAISONS.x,_LIVRAISONS.y,_LIVRAISONS.z-0.98, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.55, 0.55, 0.55, tonumber(UTILS.ServerColor.r), tonumber(UTILS.ServerColor.g), tonumber(UTILS.ServerColor.b), 255, false, false, 2, false, false, false, false)

                if dist < 1.5 then
                    DrawInstructionBarNotification(_LIVRAISONS.x,_LIVRAISONS.y,_LIVRAISONS.z, "Appuyez sur [ ~g~E~w~ ] pour livrer")
                    if IsControlJustPressed(1,51) then
                        _LIVRAISONS.Action()
                    end
                end

                ::continue::

                if not _LIVRAISONS.inLivraisons then
                    break
                    _LIVRAISONS.stop()
                end

                Wait(_LIVRAISONS.interval)
            end
        end)

        CreateThread(function()
            while _LIVRAISONS.inLivraisons do
                Wait(1000)
                _LIVRAISONS.time -= 1
    
                if _LIVRAISONS.time <= 0 then
                    ESX.ShowNotification('🤬 Tu fais quoi ? ~y~30~s~ points ont été enlevés de ton expérience !')
                    _LIVRAISONS.stop()
                    break
                end
            end
        end)
    end
end)