WorldProps.data = {
    propsSpawned = {
        
    },

    info = false,
}

previewPropMenu = nil

CreateThread(function()
    while not ESXLoaded do Wait(1) end
    local props = {}
    for k,v in pairs(WorldProps.list) do
        props[k] ={
            name = v.label,
            item = v.name,
            image = "carton.png",
            price = v.price,
            type = "props"
        }
    end
    exports['shop']:addItem('ikea', props)

    AddZones('ikea', {
        Position = vector3(2741.291, 3463.051, 55.67033),
        Dist = 10,
        Public = true,
        Job = nil,
        Job2 = nil,
        GradesJob = {},
        InVehicleDisable = true,
        Blip = {
            Active = false,
        },
        ActionText = 'Appuyez sur [ ~g~E~w~ ] pour intéragir',
        Action = function()
            exports['shop']:openUI('ikea')
        end
    })
end)

function activePreviewMode(hash, name, category, id, name2)
    local propName = name
    local propCategory = category

    Wait(200)

    Citizen.CreateThread(function()
        local coords, forward = Player.coords, GetEntityForwardVector(Player.playerPed)
        local objectCoords = (coords + forward * 3.0)

        ESX.Streaming.RequestModel(hash)
        previewProp = CreateObjectNoOffset(hash, objectCoords.x, objectCoords.y, objectCoords.z, false, false, false)
        SetModelAsNoLongerNeeded(hash)

        --PlaceObjectOnGroundProperly(previewProp)
        objectCoords = GetEntityCoords(previewProp) -- Update object coords when it is properly on the ground
        local objectRotation = GetEntityRotation(previewProp)

        SetEntityCollision(previewProp, false, false)
        SetCanClimbOnEntity(previewProp, false)
        FreezeEntityPosition(previewProp, true)

        local relativeCoords = GetOffsetFromEntityGivenWorldCoords(playerPed, objectCoords.x, objectCoords.y, objectCoords.z) -- Coords of object relative to ped
        relativeCoords = vector3(relativeCoords.x, relativeCoords.y, relativeCoords.z)

        RageUI.CloseAll()

        local placeEntityProperlyOnTheGround = true
        local inPreviewMode = true

        while inPreviewMode do
            ESX.ShowHelpNotification('Informations\n\n~INPUT_CONTEXT~ Placer\n~INPUT_CELLPHONE_UP~ Avant\n~INPUT_CELLPHONE_DOWN~ Arrière\n~INPUT_CELLPHONE_LEFT~ Gauche\n~INPUT_CELLPHONE_RIGHT~ Droite\n~INPUT_WEAPON_WHEEL_NEXT~ Pivoter\n~INPUT_REPLAY_FOVINCREASE~ Monter\n~INPUT_REPLAY_FOVDECREASE~ Descendre\n~INPUT_CELLPHONE_CANCEL~ Annuler')
            HideHudComponentThisFrame(19)
            HideHudComponentThisFrame(20)

            DrawScaleformMovieFullscreen(previewInstructions, 255, 255, 255, 255, 0)

            coords, forward = GetEntityCoords(Player.playerPed), GetEntityForwardVector(Player.playerPed)
            objectCoords = GetOffsetFromEntityInWorldCoords(Player.playerPed, relativeCoords.x, relativeCoords.y, relativeCoords.z)

            SetEntityCoords(previewProp, objectCoords)

            if placeEntityProperlyOnTheGround then
                PlaceObjectOnGroundProperly(previewProp)
            end

            if IsControlJustPressed(0, 22) then -- SPACE
                placeEntityProperlyOnTheGround = true
                PlaceObjectOnGroundProperly(previewProp)
                objectCoords = GetEntityCoords(previewProp) -- Update object coords when it is properly on the ground
                objectRotation = GetEntityRotation(previewProp)
                relativeCoords = GetOffsetFromEntityGivenWorldCoords(Player.playerPed, objectCoords.x, objectCoords.y, objectCoords.z) -- Coords of object relative to ped
            end

            if IsControlPressed(0, 314) then -- +
                placeEntityProperlyOnTheGround = false
                relativeCoords = vector3(relativeCoords.x, relativeCoords.y, relativeCoords.z + 0.01)
            end

            if IsControlPressed(0, 315) then -- -
                placeEntityProperlyOnTheGround = false
                relativeCoords = vector3(relativeCoords.x, relativeCoords.y, relativeCoords.z - 0.01)
            end

            if IsControlPressed(0, 172) then -- UPARROW
                objectCoords = objectCoords + 0.01 * forward
                relativeCoords = GetOffsetFromEntityGivenWorldCoords(Player.playerPed, objectCoords.x, objectCoords.y, objectCoords.z)
            end

            if IsControlPressed(0, 173) then -- DOWNARROW
                objectCoords = objectCoords - 0.01 * forward
                relativeCoords = GetOffsetFromEntityGivenWorldCoords(Player.playerPed, objectCoords.x, objectCoords.y, objectCoords.z)
            end

            if IsControlPressed(0, 174) then -- LEFT
                objectCoords = objectCoords + 0.01 * vector3(-1.0*forward.y, 1.0*forward.x, 0.0) -- Find counterclockwise 2d perpendicular vector
                relativeCoords = GetOffsetFromEntityGivenWorldCoords(Player.playerPed, objectCoords.x, objectCoords.y, objectCoords.z)
            end

            if IsControlPressed(0, 175) then -- RIGHT
                objectCoords = objectCoords + 0.01 * vector3(1.0*forward.y, -1.0*forward.x, 0.0) -- Find clockwise 2d perpendicular vector
                relativeCoords = GetOffsetFromEntityGivenWorldCoords(Player.playerPed, objectCoords.x, objectCoords.y, objectCoords.z)
            end

            -- rotation
            if IsControlPressed(0, 210) then
                if IsControlPressed(0, 14) then
                    objectRotation = vector3(objectRotation.x + 3.0, objectRotation.y, objectRotation.z)
                end
                if IsControlPressed(0, 15) then
                    objectRotation = vector3(objectRotation.x - 3.0, objectRotation.y, objectRotation.z)
                end
            elseif IsControlPressed(0, 209) then
                if IsControlPressed(0, 14) then
                    objectRotation = vector3(objectRotation.x, objectRotation.y + 3.0, objectRotation.z)
                end
                if IsControlPressed(0, 15) then
                    objectRotation = vector3(objectRotation.x, objectRotation.y - 3.0, objectRotation.z)
                end
            else
                if IsControlPressed(0, 14) then
                    objectRotation = vector3(objectRotation.x, objectRotation.y, objectRotation.z + 3.0)
                end
                if IsControlPressed(0, 15) then
                    objectRotation = vector3(objectRotation.x, objectRotation.y, objectRotation.z - 3.0)
                end
            end

            if IsControlJustPressed(0, 38) then -- E
                inPreviewMode = false


                objectCoords = GetEntityCoords(previewProp)
                objectRotation = GetEntityRotation(previewProp)
                
                TriggerServerEvent('zmain:props:place', name2, name, id, objectCoords, objectRotation)

                deletePreviewProp()
            end

            if IsControlJustPressed(0, 177) then -- BACKSPACE : Cancel
                deletePreviewProp()
                inPreviewMode = false
                return
            end

            SetEntityRotation(previewProp, objectRotation)
            Citizen.Wait(0)
        end
    end)
end

function deletePreviewProp()
    if not DoesEntityExist(previewProp) then return end
    DeleteEntity(previewProp)
    previewProp = nil
end

RegisterNetEvent('zmain:props:place', function(data)
    activePreviewMode(data.name, data.label, 'test', data.id, data.name)
end)

RegisterNetEvent('zmain:props:addTable', function(iid, table)
    WorldProps.data.propsSpawned[iid] = table
end)

RegisterNetEvent('zmain:props:removeTable', function(iid)
    local entity = WorldProps.data.propsSpawned[iid].entity
    WorldProps.data.propsSpawned[iid] = nil

    if DoesEntityExist(entity) then
        DeleteEntity(entity)
    end
end)

Citizen.CreateThread(function()
    local loopWait = 2000
    while ESX == nil do Citizen.Wait(100) end
    Wait(5000)
    TriggerServerEvent('zmain:props:server:loadProps')
    Wait(5000)

    while json.encode(worldProps) == '[]' do
        Wait(100)
    end

    while true do
        loopWait = 2000
        for k,v in pairs(WorldProps.data.propsSpawned) do
            Player.coords = GetEntityCoords(PlayerPedId())
            if v == nil then goto continue end
            if #(Player.coords - vector3(v.position.x, v.position.y, v.position.z)) > 50.0 then
                if v.entity ~= nil and DoesEntityExist(v.entity) then
                    DeleteEntity(v.entity)
                    v.entity = nil
                    v.target = nil
                end
                goto continue 
            end

            if v.entity == nil or v.entity == 0 or (not DoesEntityExist(v.entity) and v.entity ~= "in_spawning") then
                if DoesEntityExist(v.entity) then
                    DeleteEntity(v.entity)
                end

                v.entity = "in_spawning"

                ESX.Game.SpawnLocalObject(v.propsName, vector3(v.position.x, v.position.y, v.position.z), function(entity)
                    v.entity = entity
                    FreezeEntityPosition(v.entity, true)
                    SetEntityCoords(v.entity, v.position.x, v.position.y, v.position.z)
                    SetEntityRotation(v.entity, v.heading.x, v.heading.y, v.heading.z)
                end)
            end

            if #(Player.coords - vector3(v.position.x, v.position.y, v.position.z)) < 2.5 then
                loopWait = 0
                local permission = (Config.Staff.HavePermission('Modules', 'objects'))
                if permission and adminManagement.object then
                    ESX.ShowHelpNotification(('~h~Informations de l\'objet~h~\n\nNom: %s\nLabel: %s\nId: %s\n\n~h~Informations admin~h~\nJoueur: %s\nUniqueID: %s\nDate: %s/%s/%s %sh%s\nPropriétaire: %s %s\n\n~INPUT_CONTEXT~ pour l\'enlever [Admin Mode]'):format(v.propsName, v.label, v.propsId, v.owner.Name, v.owner.UniqueID, v.owner.day, v.owner.month, v.owner.years, v.owner.hours, v.owner.min, v.owner.firstName, v.owner.lastName))
                else
                    if WorldProps.data.info then
                        ESX.ShowHelpNotification(('~h~Informations de l\'objet~h~\n\nNom: %s\nLabel: %s\nId: %s\nDate: %s/%s/%s %sh%s\nPropriétaire: %s %s\n\n~INPUT_CONTEXT~ pour l\'enlever'):format(v.propsName, v.label, v.propsId, v.owner.day, v.owner.month, v.owner.years, v.owner.hours, v.owner.min, v.owner.firstName, v.owner.lastName))
                    end
                end

                if WorldProps.data.info then
                    if IsControlJustPressed(0, 54) then
                        if adminManagement.Service then
                            if adminManagement.object then
                                TriggerServerEvent('zmain:props:server:delete', v)
                            else
                                if v.owner.UniqueID ~= ESX.PlayerData.UniqueID then
                                    ESX.ShowNotification('Ce n\'est pas vous le propriétaire de l\'objet')
                                else 
                                    TriggerServerEvent('zmain:props:server:delete', v)
                                end
                            end
                        else
                            if v.owner.UniqueID ~= ESX.PlayerData.UniqueID then
                                ESX.ShowNotification('Ce n\'est pas vous le propriétaire de l\'objet')
                            else 
                                if WorldProps.data.info then
                                    TriggerServerEvent('zmain:props:server:delete', v)
                                end
                            end
                        end
                    end
                end
            end
            
            ::continue::
        end
        Citizen.Wait(loopWait)
    end
end)

AddEventHandler('onResourceStop', function()
    for k,v in pairs(WorldProps.data.propsSpawned) do
        if v.entity ~= nil then
            DeleteEntity(v.entity)
        end
    end
end)