Ambulance = {
    Service = false,
    Appelles = {},
    AppellesCount = 0,

    LockedButton = false,
    Time = 8,

    sAppele = nil,
    TakedAppele = false,

    MyBlip = {},

    Employeds = {},
    EmployedsCount = 0,

    Items = {
        {name = 'bandage', label = 'Bandage'},
        {name = 'medikit', label = 'Médikit'}
    }
}

SetEntityRagdoll = false

RegisterNetEvent('zmain:ambulance:service', function(newVal)
    Ambulance.Service = newVal
end)

RegisterNetEvent('zmain:ambulance:addCall', function(k,v)
    Ambulance.Appelles[k] = v
    Ambulance.AppellesCount = 0

    for k,v in pairs(Ambulance.Appelles) do
        Ambulance.AppellesCount += 1
    end
end)

RegisterNetEvent('zmain:ambulance:removeCall', function(k)
    Ambulance.Appelles[k] = nil

    Ambulance.AppellesCount -= 1
end)

RegisterNetEvent('zmain:ambulance:updateCall', function(k, v)
    Ambulance.Appelles[k] = v
end)

RegisterNetEvent('zmain:ambulance:addEmployed', function(k,v)
    Ambulance.Employeds[k] = v
    Ambulance.EmployedsCount = 0

    for k,v in pairs(Ambulance.Employeds) do
        Ambulance.EmployedsCount += 1
    end
end)

RegisterNetEvent('zmain:ambulance:removeEmployed', function(k)
    Ambulance.Employeds[k] = nil
    Ambulance.EmployedsCount = 0

    Ambulance.EmployedsCount -= 1
end)


RegisterNetEvent('zmain:ambulance:takeMyCall', function(k)
    Ambulance:AddBlip(Ambulance.Appelles[k].position)
end)

function Ambulance:openMenu()

    local weapon = 	GetPedCauseOfDeath(PlayerPedId())

    -- if weapon == GetHashKey('WEAPON_UNARMED') then return end

    local main = RageUI.CreateMenu('', 'Actions Disponibles')

    local appeles = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')
    local sAppeles = RageUI.CreateSubMenu(appeles, '', 'Actions Disponibles')

    local interactions = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')

    local employed = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')

    RageUI.Visible(main, not RageUI.Visible(main))
    while main do Wait(1)
        RageUI.IsVisible(main, function()
            RageUI.Checkbox('Statut de l\'entreprise', 'Quand cette case est cochée votre ENTREPRISE est notée comme ouverte', Society.List[ESX.PlayerData.job.name].state, {}, {
                onChecked = function()
                    TriggerServerEvent('zmain:jobs:updateSocietyStatus', true)
                end,
                onUnChecked = function()
                    TriggerServerEvent('zmain:jobs:updateSocietyStatus', false)
                end
            })
            RageUI.Checkbox('Service', nil, Ambulance.Service, {}, {
                onChecked = function()
                    TriggerServerEvent('zmain:ambulance:service')
                end,
                onUnChecked = function()
                    TriggerServerEvent('zmain:ambulance:service')
                end
            })
            if Ambulance.Service then
                RageUI.Button(('Appel(s) en attente (%s)'):format(Ambulance.AppellesCount), nil, {}, true, {
                    onSelected = function()
                        
                    end
                }, appeles)
                RageUI.Button('Intéractions Joueur', nil, {}, true, {
                    onSelected = function()
                        
                    end
                }, interactions)
                RageUI.WLine()
                RageUI.Button(('Liste des employés en service (~y~%s~s~)'):format(Ambulance.EmployedsCount), nil, {}, true, {
                    onSelected = function()
                        
                    end
                }, employed)
            end
        end)

        RageUI.IsVisible(appeles, function()
            for k,v in pairs(Ambulance.Appelles) do
                RageUI.Button(v.name, nil, {RightLabel = v.take and '~g~Pris~s~' or '~r~Attente~s~'}, true, {
                    onSelected = function()
                        Ambulance.sAppele = k
                    end
                }, sAppeles) 
            end
        end)

        RageUI.IsVisible(sAppeles, function()
            if Ambulance.Appelles[Ambulance.sAppele] ~= nil then
                RageUI.Button('Prendre en charge l\'appel', nil, {}, Ambulance.Appelles[Ambulance.sAppele].take ~= true, {
                    onSelected = function()
                        Ambulance:RemoveBlip()
                        TriggerServerEvent('zmain:ambulance:takeAppel', Ambulance.sAppele)
                    end
                })
                RageUI.Button('Finir l\'appel', nil, {}, true, {
                    onSelected = function()
                        TriggerServerEvent('zmain:ambulance:closeAppel', Ambulance.sAppele)
                        Ambulance:RemoveBlip()
                    end
                })
            else
                RageUI.Button('Revenir en arrière', nil, {}, true, {
                    onSelected = function()
                        RageUI.GoBack()
                    end
                })
            end
        end)

        RageUI.IsVisible(interactions, function()
            local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
            RageUI.Button('Faire une facture', nil, {}, true, {
                onSelected = function()
                    if closestDistance ~= -1 and closestDistance <= 3 then
                        KeyboardUtils.use('Montant', function(data)
                            local data = tonumber(data)
                            if data == nil or data <= 0 then return end

                            TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(closestPlayer), 'society_ambulance', ('Ambulance'), data)
                        end)
                    else
                        ESX.ShowNotification("Aucun joueur à proximité")
                    end
                end
            })
            RageUI.Button('Réanimer', nil, {}, true, {
                onSelected = function()
                    if closestDistance ~= -1 and closestDistance <= 3 then
                        local playerPed = PlayerPedId()
                        TaskStartScenarioInPlace(playerPed, 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
                        exports['pogressBar']:drawBar(10000, 'Réanimation de la personne en cours', function()
                            TriggerServerEvent('zmain:ambulance:revive', GetPlayerServerId(closestPlayer))
                            ClearPedTasks(playerPed)

                            Ambulance:RemoveBlip()
                        end)
                    else
                        ESX.ShowNotification("Aucun joueur à proximité")
                    end
                end
            })
            RageUI.Button('Soigner une petite blessure', nil, {}, true, {
                onSelected = function()
                    if closestDistance ~= -1 and closestDistance <= 3 then
                        TaskStartScenarioInPlace(playerPed, 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
                        exports['pogressBar']:drawBar(10000, 'Réanimation de la personne en cours', function()
                            TriggerServerEvent('zmain:ambulance:heal', GetPlayerServerId(closestPlayer), 'p')
                            ClearPedTasks(playerPed)

                            Ambulance:RemoveBlip()
                        end)
                    else
                        ESX.ShowNotification("Aucun joueur à proximité")
                    end
                end
            })
            RageUI.Button('Soigner une grande blessure', nil, {}, true, {
                onSelected = function()
                    if closestDistance ~= -1 and closestDistance <= 3 then
                        exports['pogressBar']:drawBar(10000, 'Réanimation de la personne en cours', function()
                            TriggerServerEvent('zmain:ambulance:heal', GetPlayerServerId(closestPlayer), 'g')
                            ClearPedTasks(playerPed)

                            Ambulance:RemoveBlip()
                        end)
                    else
                        ESX.ShowNotification("Aucun joueur à proximité")
                    end
                end
            })
        end)

        RageUI.IsVisible(employed, function()
            for k,v in pairs(Ambulance.Employeds) do
                RageUI.Button(v.name, nil, {RightLabel = '~g~En Service~s~'}, true, {}) 
            end
        end)

        if not RageUI.Visible(main) and not RageUI.Visible(appeles) and not RageUI.Visible(sAppeles) and not RageUI.Visible(interactions) and not RageUI.Visible(employed) then
            main = RMenu:DeleteType('main')
        end
    end
end

RegisterCommand('ambulance_menu', function()
    if ESX.PlayerData.job.name ~= 'ambulance' then return end

    Ambulance:openMenu()
end)

RegisterKeyMapping('ambulance_menu', 'Menu Ambulance', 'keyboard', 'F6')

AddEventHandler('esx:onPlayerDeath', function()
    local weapon = 	GetPedCauseOfDeath(PlayerPedId())

    -- if weapon == GetHashKey('WEAPON_UNARMED') then return end

    rea = false
    time = 8
    TriggerEvent('zmain:ambulance:onPlayerDeath')
    Ambulance:launchTimer()
end)

local rea = false

RegisterNuiCallback("contactEMS", function()
    if Ambulance.LockedButton == true then return(
        ESX.ShowNotification('Vous avez déjà contacté les secours')
    ) end

    Ambulance.LockedButton = true

    TriggerServerEvent('zmain:ambulance:call', GetEntityCoords(Player.playerPed))

    ESX.ShowNotification('Vous avez contacté les EMS')
end)

RegisterNuiCallback("returnHopital", function()
    if time > 0 then return(
        ESX.ShowNotification(('Vous êtes dans le coma pour encore ~y~%s~s~ Minutes, vous pourrez retourner à l\'hôpital une fois que le temps sera écoulé'):format(time))
    ) end

    SetEntityRagdoll = false
    TriggerServerEvent('zmain:ambulance:respawn')
    Ambulance.Appelles[ESX.PlayerData.UniqueID] = nil
    FreezeEntityPosition(PlayerPedId(), false)

    Config.Personalmenu.HudActive = true

    rea = true
end)

RegisterNetEvent('zmain:ambulance:death', function()
    local weapon = 	GetPedCauseOfDeath(PlayerPedId())

    -- if weapon == GetHashKey('WEAPON_UNARMED') then return end
    
    rea = false
    DisplayRadar(false)
    TriggerEvent('tempui:toggleUi', false)
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = "emsYes"
    })

    SetEntityRagdoll = true

    while not rea do Wait(0)
        TriggerEvent('zmain:anticheat:bypassGodMod', true)
        local ped = PlayerPedId()
        SetEntityInvincible(ped, true)
        SetEntityRagdoll = true

        if SetEntityRagdoll then
            SetPedToRagdoll(ped, 1000, 0, 0, 0, 0, 0)
        end
    end

    SetNuiFocus(false, false)
    SendNUIMessage({
        action = "emsNone"
    })
    SendNUIMessage({
        action = "not"
    })
    SetEntityRagdoll = false
    Ambulance.LockedButton = false
    SetEntityInvincible(PlayerPedId(), false)
    TriggerEvent('zmain:anticheat:bypassGodMod', false)
    DisplayRadar(true)
    TriggerEvent('tempui:toggleUi', true)
end)

function getIsDead()
    return SetEntityRagdoll
end

function Ambulance:launchTimer()
    Config.Personalmenu.HudActive = false
    SendNUIMessage({
        action = 'time',
        time = time
    })
    SetTimeout(1500, function()
        SetEntityRagdoll = true
        CreateThread(function()
            while SetEntityRagdoll do 
                Wait(60000)

                time = time - 1

                SendNUIMessage({
                    action = 'time',
                    time = time
                })
                
                if time <= 0 then
                    SetEntityRagdoll = false
                    Ambulance.LockedButton = false
                    break
                end
            end
        end)
    end)
end

exports('playerDead', function()
    return getIsDead()
end)

function Ambulance:AddBlip(coords)
    local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
    SetBlipSprite(blip, 1)
    SetBlipDisplay(blip, 4)
    SetBlipScale(blip, 0.6)
    SetBlipColour(blip, 42)
    SetBlipAsShortRange(blip, true)
    EndTextCommandSetBlipName(blip)
    SetBlipRoute(blip, 1)
    Ambulance.MyBlip[blip] = blip
end

function Ambulance:RemoveBlip()
    for k,v in pairs(Ambulance.MyBlip) do
        RemoveBlip(v)
        SetBlipRoute(v, 0)
    end
end

local time = 8

RegisterNetEvent('zmain:ambulance:revive', function()
    rea = true
    RageUI.CloseAll()
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)
    DoScreenFadeOut(800)
    Wait(1000)
    SetEntityRagdoll = false
    time = 8
    ESX.ShowNotification('Vous avez été réanimé')
    TriggerServerEvent('zmain:ambulance:sql:removedead')
    DoScreenFadeIn(800)
    Citizen.CreateThread(function()
		RespawnPed(playerPed, {coords = coords, heading = 0.0})
		AnimpostfxStop('DeathFailOut')
	end)

    SendNUIMessage({
        action = "emsNone"
    })
    SendNUIMessage({
        action = "not"
    })
    Config.Personalmenu.HudActive = true
end)

RegisterNetEvent('zmain:ambulance:heal', function(type)
    local ped = PlayerPedID5
    if type == 'p' then
        SetEntityHealth(ped, GetEntityHealth(ped) + 50)
    else
        SetEntityHealth(ped, 200)
    end
end)

RegisterNetEvent('zmain:ambulance:onPlayerDeath', function()
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)
    Citizen.CreateThread(function()
		RespawnPed(playerPed, {coords = coords, heading = 0.0})
		AnimpostfxStop('DeathFailOut')
		DoScreenFadeIn(800)
	end)
    TriggerServerEvent('zmain:ambulance:death')
end)

function Ambulance:openPharmacieMenu()
    local main = RageUI.CreateMenu('', 'Actions Disponibles')

    RageUI.Visible(main, not RageUI.Visible(main))
    FreezeEntityPosition(PlayerPedId(), true)
    while main do Wait(1)
        RageUI.IsVisible(main, function()
            for k,v in pairs(Ambulance.Items) do
                RageUI.Button(v.label, nil, {RightLabel = '~g~GRATUIT~s~'}, true, {
                    onSelected = function()
                        TriggerServerEvent('zmain:ambulance:buyitem', v.name)
                    end
                })
            end
        end)

        if not RageUI.Visible(main) then
            main = RMenu:DeleteType('main')
            FreezeEntityPosition(PlayerPedId(), false)
        end
    end
end

function Ambulance:openBossMenu(job)
    local main = RageUI.CreateMenu('', 'Actions Disponibles')
    local accountGestion = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')

    RageUI.Visible(main, not RageUI.Visible(main))
    FreezeEntityPosition(PlayerPedId(), true)
    while main do Wait(1)
        RageUI.IsVisible(main, function()
            RageUI.Button('Gestion des comptes', nil, {}, true, {
                onSelected = function()
                    RefrehEntrepriseMoney()
                end
            }, accountGestion)
        end)

        RageUI.IsVisible(accountGestion, function()
            RageUI.Separator('Compte de la société')
            RageUI.Button('Argent de la société: '..Config.Personalmenu.soceityMoney, nil, {}, true, {
                onSelected = function()
                end
            })
            RageUI.Line()
            RageUI.Button('Déposer de l\'argent', 'Argent en banque', {}, true, {
                onSelected = function()
                    KeyboardUtils.use('Montant à déposer', function(data)
                        local data = tonumber(data)
                        if data == nil then return end

                        TriggerServerEvent('zmain:ambulance:moneyBoss', ('society_%s'):format("ambulance"), data, 'deposit')
                    end)
                end
            })
            RageUI.Button('Prendre de l\'argent', 'Argent du coffre', {}, true, {
                onSelected = function()
                    KeyboardUtils.use('Montant à prendre', function(data)
                        local data = tonumber(data)
                        if data == nil then return end

                        TriggerServerEvent('zmain:ambulance:moneyBoss', ('society_%s'):format("ambulance"), data, 'remove')
                    end)
                end
            })
        end)

        if not RageUI.Visible(main) and not RageUI.Visible(accountGestion) then 
            main = RMenu:DeleteType('main')
            FreezeEntityPosition(PlayerPedId(), false)
        end
    end
end

CreateThread(function()
    AddZones('pharmacie_ems', {
        Position = vector3(-457.0301, -309.9206, 34.91079),
        Dist = 10,
        Public = false,
        Job = {['ambulance'] = true},
        Job2 = nil,
        GradesJobRequire = false,
        GradesJob = {},
        InVehicleDisable = true,
        Blip = {
            Active = false,
            -- Position = vector3(2745.4719238281, 3477.0629882813, 55.671112060547),
            -- BlipId = 605,
            -- Color = 46,
            -- Scale = 0.6,
            -- Text = '[SERVICE] Supermarché'
        },
        ActionText = 'Appuyez sur [ ~g~E~w~ ] pour intéragir',
        Action = function()
            Ambulance:openPharmacieMenu()
        end
    })
    -- AddZones('boss_ems', {
    --     Position = vector3(-458.6014, -297.2721, 34.91079),
    --     Dist = 10,
    --     Public = false,
    --     Job = {['ambulance'] = true},
    --     Job2 = nil,
    --     GradesJobRequire = true,
    --     GradesJob = {['boss'] = true},
    --     InVehicleDisable = true,
    --     Blip = {
    --         Active = false,
    --         -- Position = vector3(2745.4719238281, 3477.0629882813, 55.671112060547),
    --         -- BlipId = 605,
    --         -- Color = 46,
    --         -- Scale = 0.6,
    --         -- Text = '[SERVICE] Supermarché'
    --     },
    --     ActionText = 'Appuyez sur [ ~g~E~w~ ] pour intéragir',
    --     Action = function()
    --         Ambulance:openBossMenu()
    --     end
    -- })
end)