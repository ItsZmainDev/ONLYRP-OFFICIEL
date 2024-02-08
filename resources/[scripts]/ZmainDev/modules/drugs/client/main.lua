CreateThread(function()
    local loaded = false

    RegisterNetEvent('zmain:drugs:load', function(table)
        for k,v in pairs(table) do
            Config.Drugs.Drugs[v.name] = {
                ["recolte"] = v.position.recolte,
                ["traitement"] = v.position.traitement
            }
            Config.Drugs.Items[v.name] = {
                ["recolte"] = {
                    name = v.data.recolte.name,
                    label = v.data.recolte.label,
                    animtype = v.data.recolte.animtype,
                    animdict = v.data.recolte.animdict,
                    anim = v.data.recolte.anim,
                    animtime = v.data.recolte.animtime,
                    marker = v.data.recolte.marker,
                    props = v.data.recolte.props
                },
                ["traitement"] = {
                    name = v.data.traitement.name,
                    label = v.data.traitement.label,
                    animtype = v.data.traitement.animtype,
                    animdict = v.data.traitement.animdict,
                    anim = v.data.traitement.anim,
                    animtime = v.data.traitement.animtime,
                    marker = v.data.traitement.marker,
                    props = v.data.traitement.props
                }
            }

            TriggerServerEvent('zmain:drugs:addTable', Config.Drugs.Items)
        end
    
        loaded = true
    end)

    RegisterNetEvent('zmain:drugs:refresh', function(d)
        for k,v in pairs(Config.Drugs.Drugs) do
            if k ~= d then return end
            for i,p in pairs(Config.Drugs.Drugs[k]) do
                for _,z in pairs(Config.Drugs.Drugs[k][i]) do
                    Config.Drugs.RandomZone[i..k] = Config.Drugs.Drugs[k][i][math.random(1, #Config.Drugs.Drugs[k][i])]
                end
            end
        end
    
        for _,z in pairs(Config.Drugs.Drugs) do
            if _ ~= d then return end
            for k,v in pairs(Config.Drugs.Drugs[_]) do
                if not Config.Drugs.Items[_][k].marker then
                    ESX.Game.SpawnLocalObject(Config.Drugs.Items[_][k].props, vector3(Config.Drugs.RandomZone[k.._].x, Config.Drugs.RandomZone[k.._].y, Config.Drugs.RandomZone[k.._].z-0.98), function(obj)
                        FreezeEntityPosition(obj, true)
                        Config.Drugs.objSpawn[obj] = obj
        
        
                    end)
                end
            end
        end
    end)
    
    Wait(1000)

    TriggerServerEvent('zmain:drugs:load')

    while not loaded do Wait(1) end

    function Config.Drugs:drugs(item, type)
        Player.playerPed = PlayerPedId()
        local ped = Player.playerPed
    
        ClearPedTasksImmediately(Player.playerPed)
        FreezeEntityPosition(ped, true)
    
        if Config.Drugs.Items[item][type].animtype == 'anim' then
            local dict, anim = Config.Drugs.Items[item][type].animdict, Config.Drugs.Items[item][type].anim
    
            ESX.Streaming.RequestAnimDict(dict)
            TaskPlayAnim(ped, dict, anim, -1.0, -1.0, 3000, 0, 0, true, true, true)
        else
            TaskStartScenarioInPlace(ped, 'PROP_HUMAN_BUM_BIN', 0, true)
        end
    
        Citizen.Wait(Config.Drugs.Items[item][type].animtime)
    
        ClearPedTasks(ped)
        FreezeEntityPosition(ped, false)
    
        TriggerServerEvent('zmain:drugs:drugs', item, type)
    end
    
    function DeleteProps()
        for k,v in pairs(Config.Drugs.objSpawn) do
            DeleteObject(v)
        end
    
        for _,z in pairs(Config.Drugs.Drugs) do
            for k,v in pairs(Config.Drugs.Drugs[_]) do
                if not Config.Drugs.Items[_][k].marker then
                    ESX.Game.SpawnLocalObject(Config.Drugs.Items[_][k].props, vector3(Config.Drugs.RandomZone[k.._].x, Config.Drugs.RandomZone[k.._].y, Config.Drugs.RandomZone[k.._].z-0.98), function(obj)
                        FreezeEntityPosition(obj, true)
                        Config.Drugs.objSpawn[obj] = obj
        
        
                    end)
                end
    
                ::continue::
            end
        end
    end
    
    CreateThread(function()
    
        for k,v in pairs(Config.Drugs.Drugs) do
            for i,p in pairs(Config.Drugs.Drugs[k]) do
                for _,z in pairs(Config.Drugs.Drugs[k][i]) do
                    Config.Drugs.RandomZone[i..k] = Config.Drugs.Drugs[k][i][math.random(1, #Config.Drugs.Drugs[k][i])]
                end
            end
        end
    
        for _,z in pairs(Config.Drugs.Drugs) do
            for k,v in pairs(Config.Drugs.Drugs[_]) do
                if not Config.Drugs.Items[_][k].marker then
                    ESX.Game.SpawnLocalObject(Config.Drugs.Items[_][k].props, vector3(Config.Drugs.RandomZone[k.._].x, Config.Drugs.RandomZone[k.._].y, Config.Drugs.RandomZone[k.._].z-0.98), function(obj)
                        FreezeEntityPosition(obj, true)
                        Config.Drugs.objSpawn[obj] = obj
        
        
                    end)
                end
            end
        end
        
        while true do 
            Wait(Config.Drugs.Wait)
            Config.Drugs.Wait = 2000
            
            for _,z in pairs(Config.Drugs.Drugs) do
                for k,v in pairs(Config.Drugs.Drugs[_]) do
                    local distance = #(GetEntityCoords(PlayerPedId())-vector3(Config.Drugs.RandomZone[k.._].x, Config.Drugs.RandomZone[k.._].y, Config.Drugs.RandomZone[k.._].z))
    
                    if distance > 20 then goto continue end
    
                    Config.Drugs.Wait = 1
    
                    if Config.Drugs.Items[_][k].marker then
                        DrawMarker(21, Config.Drugs.RandomZone[k.._].x, Config.Drugs.RandomZone[k.._].y, Config.Drugs.RandomZone[k.._].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, tonumber(UTILS.ServerColor.r), tonumber(UTILS.ServerColor.g), tonumber(UTILS.ServerColor.b), 255, false, false, 2, false, false, false, false)
                    end
    
                    if distance < 1.5 then
                        DrawInstructionBarNotification(Config.Drugs.RandomZone[k.._].x, Config.Drugs.RandomZone[k.._].y, Config.Drugs.RandomZone[k.._].z, "Appuyez sur [ ~g~E~w~ ] pour intéragir")
                        if IsControlJustPressed(1,51) then
                            Config.Drugs:drugs(_, k)
                            Config.Drugs.RandomZone[k.._] = Config.Drugs.Drugs[_][k][math.random(1, #Config.Drugs.Drugs[_][k])]
    
                            if not Config.Drugs.Items[_][k].marker then
                                DeleteProps()
                            end
                        end
                    end
    
                    ::continue::
                end
            end
        end
    end)
    
    AddEventHandler('onResourceStop', function()
        for k,v in pairs(Config.Drugs.objSpawn) do
            DeleteObject(v)
            Config.Drugs.objSpawn[k] = nil
        end
    end)
end)