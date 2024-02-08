local VehicleContextMenu = ContextUI:CreateMenu(2, "", nil, "commonmenu", "interaction_bgd")
local inTrunk = false

ContextUI:IsVisible(VehicleContextMenu, function(Entity)
    local dist = Vdist2(GetEntityCoords(PlayerPedId(), false), GetEntityCoords(Entity.ID))
    if dist < 15 then
        local lockStatus = GetVehicleDoorLockStatus(Entity.ID) 
        local status = lockStatus == 1 and '~g~Ouvert~s~' or '~r~Fermé~s~'
        ContextUI:Separator(('Status: %s'):format(status))
        ContextUI:Button("Se cacher dans le coffre", nil, {}, function(onSelected)
            if (onSelected) then
                if inTrunk then return end
                if lockStatus ~= 1 then return ESX.ShowNotification('Le coffre est fermé') end
                Citizen.CreateThread(function()
                    local playerPed = PlayerPedId()
                    local vehicle = GetClosestVehicle(GetEntityCoords(PlayerPedId()), 50.0, 0, 70)

                    if DoesEntityExist(playerPed) then
                        if not IsEntityAttached(playerPed) or GetDistanceBetweenCoords(GetEntityCoords(playerPed), GetEntityCoords(playerPed ), true) >= 5.0 then
                            SetCarBootOpen(vehicle)
                            Wait(350)
                            AttachEntityToEntity(PlayerPedId(), vehicle, -1, 0.0, -2.2, 0.5, 0.0, 0.0, 0.0, false, false, false, false, 20, true)	
                            loadDict('timetable@floyd@cryingonbed@base')
                            TaskPlayAnim(PlayerPedId(), 'timetable@floyd@cryingonbed@base', 'base', 8.0, -8.0, -1, 1, 0, false, false, false)
                            Wait(50)
                            inTrunk = true

                            Wait(1500)
                            SetVehicleDoorShut(vehicle, 5)
                        else
                            ESX.ShowNotification('Il y a déjà une personne dans le coffre')
                        end
                    end
                    
                    inTrunk = true
                    while inTrunk do
                        Wait(0)
                        if inTrunk then
                            local vehicle = GetEntityAttachedTo(PlayerPedId())
                            if DoesEntityExist(vehicle) or not IsPedDeadOrDying(PlayerPedId()) or not IsPedFatallyInjured(PlayerPedId()) then
                                SetEntityCollision(PlayerPedId(), false, false)
                                ESX.ShowHelpNotification('[E] sortir du coffre')
                
                                if GetVehicleDoorAngleRatio(vehicle, 5) < 0.9 then
                                    SetEntityVisible(PlayerPedId(), false, false)
                                else
                                    if not IsEntityPlayingAnim(PlayerPedId(), 'timetable@floyd@cryingonbed@base', 3) then
                                        loadDict('timetable@floyd@cryingonbed@base')
                                        TaskPlayAnim(PlayerPedId(), 'timetable@floyd@cryingonbed@base', 'base', 8.0, -8.0, -1, 1, 0, false, false, false)
                
                                        SetEntityVisible(PlayerPedId(), true, false)
                                    end
                                end
                                if IsControlJustReleased(0, 38) and inTrunk then
                                    SetCarBootOpen(vehicle)
                                    SetEntityCollision(PlayerPedId(), true, true)
                                    Wait(750)
                                    inTrunk = false
                                    DetachEntity(PlayerPedId(), true, true)
                                    SetEntityVisible(PlayerPedId(), true, false)
                                    ClearPedTasks(PlayerPedId())
                                    SetEntityCoords(PlayerPedId(), GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, -0.5, -0.75))
                                    Wait(250)
                                    SetVehicleDoorShut(vehicle, 5)
                                end
                            else
                                SetEntityCollision(PlayerPedId(), true, true)
                                DetachEntity(PlayerPedId(), true, true)
                                SetEntityVisible(PlayerPedId(), true, false)
                                ClearPedTasks(PlayerPedId())
                                SetEntityCoords(PlayerPedId(), GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, -0.5, -0.75))
                            end
                        end
                    end
                end)  
            end
        end)
        if lockStatus == 1 then
            ContextUI:Button("Ouvrir le coffre", nil, {}, function(onSelected)
                if (onSelected) then
                    TriggerEvent('zmain:vehicles:openIventory', GetVehicleNumberPlateText(Entity.ID), Entity.ID)
                end
            end)
        end
    end
    if ESX.GetPlayerData()['group'] ~= 'user' then 
        ContextUI:Button("Supprimer le véhicule", nil, {}, function(onSelected)
            if (onSelected) then
                TriggerServerEvent('zmain:admin:delVeh', NetworkGetNetworkIdFromEntity(Entity.ID))
            end
        end)
        ContextUI:Button("Freeze/Unfreeze le véhicule", nil, {}, function(onSelected)
            if (onSelected) then
                if IsEntityPositionFrozen(Entity.ID) then
                    TriggerServerEvent('zmain:admin:freezeunfreezevehicle', NetworkGetNetworkIdFromEntity(Entity.ID), false)
                else
                    TriggerServerEvent('zmain:admin:freezeunfreezevehicle', NetworkGetNetworkIdFromEntity(Entity.ID), true)
                end
            end
        end)
    end
end)

loadDict = function(dict)
    while not HasAnimDictLoaded(dict) do Wait(0) RequestAnimDict(dict) end
end