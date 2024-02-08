function Farm_Farm(item, type)
    Player.playerPed = PlayerPedId()
    local ped = Player.playerPed

    ClearPedTasksImmediately(Player.playerPed)
    FreezeEntityPosition(ped, true)

    if Config_Farm.Items[item][type].animtype == 'anim' then
        local dict, anim = Config_Farm.Items[item][type].animdict, Config_Farm.Items[item][type].anim

        ESX.Streaming.RequestAnimDict(dict)
        TaskPlayAnim(ped, dict, anim, -1.0, -1.0, 3000, 0, 0, true, true, true)
    else
        TaskStartScenarioInPlace(ped, 'PROP_HUMAN_BUM_BIN', 0, true)
    end

    Citizen.Wait(Config_Farm.Items[item][type].animtime)

    ClearPedTasks(ped)
    FreezeEntityPosition(ped, false)

    TriggerServerEvent('zmain:farm:farm', item, type)
end

function DeletePropsFarm()

    if not Config_Farm.Job[ESX.PlayerData.job.name] then
        goto go
    end

    for k,v in pairs(Config_Farm.objSpawn) do
        DeleteObject(v)
    end

    for _,z in pairs(Config_Farm.Farm) do
        for k,v in pairs(Config_Farm.Farm[_]) do
            if not Config_Farm.Items[_][k].marker then
                ESX.Game.SpawnLocalObject(Config_Farm.Items[_][k].props, vector3(Config_Farm.RandomZone[k.._].x, Config_Farm.RandomZone[k.._].y, Config_Farm.RandomZone[k.._].z-0.98), function(obj)
                    FreezeEntityPosition(obj, true)
                    Config_Farm.objSpawn[obj] = obj
    
    
                end)
            end

            ::continue::
        end
    end

    ::go::
end

CreateThread(function()
    while not ESXLoaded do Wait(1) end

    if not Config_Farm.Job[ESX.PlayerData.job.name] then
        goto go
    end

    for k,v in pairs(Config_Farm.Farm) do
        for i,p in pairs(Config_Farm.Farm[k]) do
            for _,z in pairs(Config_Farm.Farm[k][i]) do
                Config_Farm.RandomZone[i..k] = Config_Farm.Farm[k][i][math.random(1, #Config_Farm.Farm[k][i])]
            end
        end
    end

    for _,z in pairs(Config_Farm.Farm) do
        for k,v in pairs(Config_Farm.Farm[_]) do
            if not Config_Farm.Items[_][k].marker then
                ESX.Game.SpawnLocalObject(Config_Farm.Items[_][k].props, vector3(Config_Farm.RandomZone[k.._].x, Config_Farm.RandomZone[k.._].y, Config_Farm.RandomZone[k.._].z-0.98), function(obj)
                    FreezeEntityPosition(obj, true)
                    Config_Farm.objSpawn[obj] = obj
    
    
                end)
            end
        end
    end

    ::go::

    for k,v in pairs(Config_Farm.Sell) do
        if ESX.PlayerData.job.name == k then
        for _,z in pairs(Config_Farm.Farm[k]) do
                local blip = AddBlipForCoord(Config_Farm.Blips[k][_].position.x, Config_Farm.Blips[k][_].position.y, Config_Farm.Blips[k][_].position.z)
                SetBlipSprite(blip, Config_Farm.Blips[k][_].blipId)
                SetBlipDisplay(blip, 4)
                SetBlipScale(blip, 0.6)
                SetBlipColour(blip, Config_Farm.Blips[k][_].color)
                SetBlipAsShortRange(blip, true)
                BeginTextCommandSetBlipName("STRING")
                AddTextComponentString(Config_Farm.Blips[k][_].text)
                EndTextCommandSetBlipName(blip)
            end

            local blip_vente = AddBlipForCoord(Config_Farm.Blips[k]['vente'].position.x, Config_Farm.Blips[k]['vente'].position.y, Config_Farm.Blips[k]['vente'].position.z)
            SetBlipSprite(blip_vente, Config_Farm.Blips[k]['vente'].blipId)
            SetBlipDisplay(blip_vente, 4)
            SetBlipScale(blip_vente, 0.6)
            SetBlipColour(blip_vente, Config_Farm.Blips[k]['vente'].color)
            SetBlipAsShortRange(blip_vente, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(Config_Farm.Blips[k]['vente'].text)
            EndTextCommandSetBlipName(blip_vente)
        end
        AddZones(('sell_%s'):format(v.job), {
            Position = v.Position,
            Dist = 10,
            Public = false,
            Job = {[v.job] = true},
            Job2 = {[v.job] = true},
            GradesJob = {},
            InVehicleDisable = true,
            Blip = {
                Active = false,
                Position = v.Position,
                BlipId = 504,
                Color = 1,
                Scale = 0.6,
                Text = '[FARMMING] Vente'
            },
            marker = true,
            ActionText = 'Appuyez sur [ ~g~E~w~ ] pour intéragir',
            Action = function()
                Config_Farm:openSellMenu(v.job)
            end
        })
    end
    
    while true do 
        Wait(Config_Farm.Wait)
        Config_Farm.Wait = 2000

        if not Config_Farm.Job[ESX.PlayerData.job.name] then
            return
        end
        
        for _,z in pairs(Config_Farm.Farm) do
            for k,v in pairs(Config_Farm.Farm[_]) do
                local distance = #(GetEntityCoords(PlayerPedId())-vector3(Config_Farm.RandomZone[k.._].x, Config_Farm.RandomZone[k.._].y, Config_Farm.RandomZone[k.._].z))

                if distance > 20 then goto continue end

                Config_Farm.Wait = 1

                if Config_Farm.Items[_][k].marker then
                    DrawMarker(22, Config_Farm.RandomZone[k.._].x, Config_Farm.RandomZone[k.._].y, Config_Farm.RandomZone[k.._].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, tonumber(UTILS.ServerColor.r), tonumber(UTILS.ServerColor.g), tonumber(UTILS.ServerColor.b), 255, false, false, 2, false, false, false, false)
                end

                if distance < 1.5 then
                    DrawInstructionBarNotification(Config_Farm.RandomZone[k.._].x, Config_Farm.RandomZone[k.._].y, Config_Farm.RandomZone[k.._].z, "Appuyez sur [ ~g~E~w~ ] pour intéragir")
                    if IsControlJustPressed(1,51) then
                        Farm_Farm(_, k)
                        Config_Farm.RandomZone[k.._] = Config_Farm.Farm[_][k][math.random(1, #Config_Farm.Farm[_][k])]

                        if not Config_Farm.Items[_][k].marker then
                            DeletePropsFarm()
                        end
                    end
                end

                ::continue::
            end
        end
    end
end)

AddEventHandler('esx:setJob', function(job)
    for k,v in pairs(Config_Farm.Sell) do
        if job.name == k then
        for _,z in pairs(Config_Farm.Farm[k]) do
                local blip = AddBlipForCoord(Config_Farm.Blips[k][_].position.x, Config_Farm.Blips[k][_].position.y, Config_Farm.Blips[k][_].position.z)
                SetBlipSprite(blip, Config_Farm.Blips[k][_].blipId)
                SetBlipDisplay(blip, 4)
                SetBlipScale(blip, 0.6)
                SetBlipColour(blip, Config_Farm.Blips[k][_].color)
                SetBlipAsShortRange(blip, true)
                BeginTextCommandSetBlipName("STRING")
                AddTextComponentString(Config_Farm.Blips[k][_].text)
                EndTextCommandSetBlipName(blip)
            end

            local blip_vente = AddBlipForCoord(Config_Farm.Blips[k]['vente'].position.x, Config_Farm.Blips[k]['vente'].position.y, Config_Farm.Blips[k]['vente'].position.z)
            SetBlipSprite(blip_vente, Config_Farm.Blips[k]['vente'].blipId)
            SetBlipDisplay(blip_vente, 4)
            SetBlipScale(blip_vente, 0.6)
            SetBlipColour(blip_vente, Config_Farm.Blips[k]['vente'].color)
            SetBlipAsShortRange(blip_vente, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(Config_Farm.Blips[k]['vente'].text)
            EndTextCommandSetBlipName(blip_vente)
        end
    end
end)

AddEventHandler('onResourceStop', function()
    for k,v in pairs(Config_Farm.objSpawn) do
        DeleteObject(v)
        Config_Farm.objSpawn[k] = nil
    end
end)

function Config_Farm:openSellMenu(job)
    local main = RageUI.CreateMenu('', 'Actions Disponibles')

    RageUI.Visible(main, not RageUI.Visible(main))
    FreezeEntityPosition(PlayerPedId(), true)
    while main do Wait(1)
        RageUI.IsVisible(main, function()
            RageUI.Separator(('Vente [%s]'):format(Config_Farm.Sell_Items[job].label))
            RageUI.Line()
            
            ESX.PlayerData.inventory = ESX.GetPlayerData().inventory

            for k,v in pairs(ESX.PlayerData.inventory) do
                if v.name == Config_Farm.Sell_Items[job].name then
                    RageUI.Button(v.label, nil, {RightLabel = ('~y~x%s~s~'):format(v.count)}, true, {
                        onSelected = function()
                            KeyboardUtils.use('Quantité', function(data)
                                local data = tonumber(data)
                                if data == nil then return end

                                if v.count < data then return ESX.ShowNotification('Vous n\'en possédez pas asser') end

                                TriggerServerEvent('zmain:farm:sell', data, v.name, Config_Farm.Sell_Items[job].price, v.label)
                            end)
                        end
                    })
                end
            end
        end)

        if not RageUI.Visible(main) then
            main = RMenu:DeleteType('main')
            FreezeEntityPosition(PlayerPedId(), false)
        end
    end
end