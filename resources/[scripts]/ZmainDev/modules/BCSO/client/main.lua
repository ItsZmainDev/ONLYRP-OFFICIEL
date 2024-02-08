function BCSO_openVestiaire()
    local main = RageUI.CreateMenu('', 'Actions Disponibles')

    RageUI.Visible(main, not RageUI.Visible(main))
    FreezeEntityPosition(PlayerPedId(), true)
    while main do Wait(1)
        RageUI.IsVisible(main, function()
            RageUI.Button('Reprendre sa tenue', nil, {}, true, {
                onSelected = function()
                    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                        TriggerEvent('skinchanger:loadSkin', skin)
                    end)
                end
            })
            RageUI.Line()
            for k,v in pairs(Config_BCSO.cloakroom) do
                RageUI.Button(v.label, nil, {RightLabel = '>>'}, ESX.PlayerData.job.grade >= v.required_grade, {
                    onSelected = function()
                        local model = GetEntityModel(PlayerPedId())
    
                        if model == `mp_m_freemode_01` then
                            ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                                print(v.homme)
                                TriggerEvent('skinchanger:loadClothes', skin, v.Data.homme)
                            end) 
                        elseif model ~= `mp_f_freemode_01` then
                            ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                                TriggerEvent('skinchanger:loadClothes', skin, v.Data.femme)
                            end) 
                        end
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

function BCSO_openF6()
    local main = RageUI.CreateMenu('', 'Menu Intéractions')
    local interactMenu = RageUI.CreateSubMenu(main, '', 'Menu Intéractions')
    local billMenu = RageUI.CreateSubMenu(interactMenu, '', 'Menu Amendes')
    local fouilleMenu = RageUI.CreateSubMenu(interactMenu, '', 'Menu Fouille')

    local vehicleMenu = RageUI.CreateSubMenu(main, '', 'Menu Intéractions Véhicule')
    local vehicleInfoWithPlate = RageUI.CreateSubMenu(vehicleMenu, '', 'Menu Intéractions Véhicule')

    local dogMenu  = RageUI.CreateSubMenu(main, '', 'Menu K9')

    local code = RageUI.CreateSubMenu(main, '', 'Menu Codes Radio')

    vehicleInfoWithPlate.Closed = function()
        ClearPedTasks(PlayerPedId())
    end

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
            RageUI.Checkbox('Service BCSO', nil, Config_BCSO.Service, {}, {
                onChecked = function()
                    Config_BCSO.Service = true
                    TriggerServerEvent('zmain:bcso:service', Config_BCSO.Service)
                end,
                onUnChecked = function()
                    Config_BCSO.Service = false
                    TriggerServerEvent('zmain:bcso:service', Config_BCSO.Service)
                end
            })

            if Config_BCSO.Service then
                RageUI.Button('Intéractions Citoyen', nil, {}, true, {
                    onSelected = function()
                    end
                }, interactMenu)
                RageUI.Button('Intéractions Véhicule', nil, {}, true, {
                    onSelected = function()
                    end
                }, vehicleMenu)
                RageUI.Button('Intéractions K9', nil, {}, true, {
                    onSelected = function()
                        
                    end
                }, dogMenu)
                RageUI.Button('Codes Radio', nil, {}, true, {
                    onSelected = function()
                        
                    end
                }, code)
            end
        end)

        RageUI.IsVisible(interactMenu, function()
            local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
            RageUI.Button('Mettre une amende', nil, {}, true, {
                onSelected = function()
                end
            }, billMenu)
            RageUI.Button('Fouiller', nil, {}, true, {
                onSelected = function()
                    if closestDistance == -1 or closestDistance > 3 then return ESX.ShowNotification('Personne aux alentours') end
                    if ESX.isHandsUp(GetPlayerPed(closestPlayer)) then
                        ESX.TriggerServerCallback('zmain:bcso:search', function(cb)
                            if not cb then return ESX.ShowNotification('Une erreur est survenue') end
                            if cb then
                                Config_BCSO.fouille = cb
    
                                RageUI.Visible(fouilleMenu, true)
                            end
                        end, GetPlayerServerId(closestPlayer))
                    else
                        return ESX.ShowNotification('🤚✋La personne doit ~r~lever les mains~s~ pour être fouiller')
                    end
                end
            })
            RageUI.Button('Menotter/Demenotter', nil, {}, true, {
                onSelected = function()
                    if closestDistance == -1 or closestDistance > 3 then return ESX.ShowNotification('Personne aux alentours') end
                    TriggerServerEvent('zmain:bcso:menotter', GetPlayerServerId(closestPlayer))
                end
            })
            RageUI.Button('Escorter', nil, {}, true, {
                onSelected = function()
                    if closestDistance == -1 or closestDistance > 3 then return ESX.ShowNotification('Personne aux alentours') end
                    TriggerServerEvent('zmain:bcso:escoter', GetPlayerServerId(closestPlayer))
                end
            })
            RageUI.Button('Mettre dans le véhicule', nil, {}, true, {
                onSelected = function()
                    if closestDistance == -1 or closestDistance > 3 then return ESX.ShowNotification('Personne aux alentours') end

                    local playerCoords = GetEntityCoords(PlayerPedId())
                    local vehicle = ESX.Game.GetClosestVehicle(playerCoords)

                    local vehCoords = #(playerCoords-GetEntityCoords(vehicle))

                    if vehCoords > 5 then return ESX.ShowNotification('Aucun véhicule aux alentours') end

                    TriggerServerEvent('zmain:bcso:playerVehicle', GetPlayerServerId(closestPlayer), vehicle, 'put')
                end
            })
            RageUI.Button('Sortir du véhicule', nil, {}, true, {
                onSelected = function()
                    if closestDistance == -1 or closestDistance > 3 then return ESX.ShowNotification('Personne aux alentours') end

                    local playerCoords = GetEntityCoords(PlayerPedId())
                    local vehicle = ESX.Game.GetClosestVehicle(playerCoords)

                    local vehCoords = #(playerCoords-GetEntityCoords(vehicle))

                    if vehCoords > 5 then return ESX.ShowNotification('Aucun véhicule aux alentours') end

                    TriggerServerEvent('zmain:bcso:playerVehicle', GetPlayerServerId(closestPlayer), vehicle, 'exit')
                end
            })
            RageUI.Button('Donner le PPA', nil, {}, true, {
                onSelected = function()
                    if closestDistance == -1 or closestDistance > 3 then return ESX.ShowNotification('Personne aux alentours') end

                    KeyboardUtils.use('Taper Y pour valider', function(data)
                        if data == 'y' or data == 'Y' then
                            TriggerServerEvent('zmain:bcso:ppa', GetPlayerServerId(closestPlayer))
                        end
                    end)
                end
            })
        end)

        RageUI.IsVisible(billMenu, function()
            RageUI.Button('Amende Personnalisé', nil, {}, true, {
                onSelected = function()
                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                    if closestDistance == -1 or closestDistance > 3 then return ESX.ShowNotification('Personne aux alentours') end
                    KeyboardUtils.use('Montant de l\'amande', function(data)
                        local data = tonumber(data)
                        if data == nil then return end

                        TaskStartScenarioInPlace(PlayerPedId(), 'CODE_HUMAN_MEDIC_TIME_OF_DEATH', 0, true)

                        SetTimeout(10000, function()
                            ClearPedTasks(PlayerPedId())
                            TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(closestPlayer), 'society_bcso', ('Sheriff (BCSO)'), data)
                        end)
                    end)
                end
            })
            RageUI.Button('Rechercher', nil, {RightLabel = Config_BCSO.bill.Search or ''}, true, {
                onSelected = function()
                    KeyboardUtils.use('Rechercher', function(data)
                        Config_BCSO.bill.Search = data
                    end)
                end
            })
            if Config_BCSO.bill.Search then
                RageUI.Button('❌ Arrêter la rechercher', nil, {}, true, {
                    onSelected = function()
                        Config_BCSO.bill.Search = nil
                    end
                })
            end
            RageUI.Line()
            for k,v in pairs(Config_BCSO.bill.Data) do
                local buttonName = v.reason
                if Config_BCSO.bill.Search then
                    if (string.match(string.lower(buttonName), string.lower(Config_BCSO.bill.Search))) then
                        RageUI.Button(buttonName, nil, {RightLabel = ('~y~%s$~s~'):format(v.price)}, true, {
                            onSelected = function()
                                local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                                if closestDistance == -1 or closestDistance > 3 then return ESX.ShowNotification('Personne aux alentours') end
                                KeyboardUtils.use('Taper Y pour valider', function(data)
                                    if data == 'y' or data == 'Y' then
                                        TaskStartScenarioInPlace(PlayerPedId(), 'CODE_HUMAN_MEDIC_TIME_OF_DEATH', 0, true)

                                        SetTimeout(10000, function()
                                            ClearPedTasks(PlayerPedId())
                                            TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(closestPlayer), 'society_bcso', ('Sheriff (BCSO)'), v.price)
                                        end)
                                    end
                                end)
                            end
                        })
                    end 
                else
                    RageUI.Button(buttonName, nil, {RightLabel = ('~y~%s$~s~'):format(v.price)}, true, {
                        onSelected = function()
                            local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                            if closestDistance == -1 or closestDistance > 3 then return ESX.ShowNotification('Personne aux alentours') end
                            KeyboardUtils.use('Taper Y pour valider', function(data)
                                if data == 'y' or data == 'Y' then
                                    TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(closestPlayer), 'society_bcso', ('Sheriff (BCSO)'), v.price)
                                end
                            end)
                        end
                    })
                end
            end
        end)

        RageUI.IsVisible(vehicleMenu, function()
            RageUI.Button('Rechercher une plaque', nil, {}, true, {
                onSelected = function()
                    KeyboardUtils.use('Entrer la plaque', function(data)
                        cbVehicle = {}
                        ESX.TriggerServerCallback('zmain:bcso:vehicle:searchPlate', function(cb)
                            cbVehicle = cb
                            ExecuteCommand('e tablet2')
                            RageUI.Visible(vehicleInfoWithPlate, true)
                        end, data)
                    end)
                end
            })
            RageUI.Button('Placer le véhicule en fourrière', nil, {}, true, {
                onSelected = function()
                    local playerPed = PlayerPedId()
                    local playerCoords = GetEntityCoords(playerPed)
                    local vehicle = ESX.Game.GetClosestVehicle(playerCoords)

                    local vehCoords = #(playerCoords-GetEntityCoords(vehicle))

                    if vehCoords > 5 then return ESX.ShowNotification('Aucun véhicule aux alentours') end

                    ExecuteCommand('e mechanic3')

                    SetTimeout(10000, function()
                        ClearPedTasks(playerPed)
                        TriggerServerEvent('zmain:admin:delVeh', NetworkGetNetworkIdFromEntity(vehicle))
                    end)
                end
            })
            RageUI.Button('Crocheter le véhicule', nil, {}, true, {
                onSelected = function()
                    local playerPed = PlayerPedId()
                    local playerCoords = GetEntityCoords(playerPed)
                    local vehicle = ESX.Game.GetClosestVehicle(playerCoords)

                    local vehCoords = #(playerCoords-GetEntityCoords(vehicle))

                    if vehCoords > 5 then return ESX.ShowNotification('Aucun véhicule aux alentours') end

                    TaskStartScenarioInPlace(playerPed, 'WORLD_HUMAN_WELDING', 0, true)

                    SetTimeout(10000, function()
                        SetVehicleDoorsLocked(vehicle, 1)
                    end)
                end
            })
        end)
        
        RageUI.IsVisible(vehicleInfoWithPlate, function()
            RageUI.Separator(('Plaque du véhicule [%s]'):format(cbVehicle.plate))
            RageUI.Separator(('Propriétaire du véhicule (%s)'):format(cbVehicle.owner))
        end)

        RageUI.IsVisible(fouilleMenu, function()
            local permissionsFouille = {['officier3'] = true, ['officierprincipal'] = true, ['sergent1'] = true, ['sergent2'] = true, ['lieutenant'] = true, ['capitaine'] = true, ['boss'] = true}
            RageUI.Button('Argent Propre', nil, {RightLabel = ('~y~%s$~s~'):format(Config_BCSO.fouille.cash)}, true, {
                onSelected = function()
                    
                end
            })
            RageUI.Button('Argent Sale', nil, {RightLabel = ('~r~%s$~s~'):format(Config_BCSO.fouille.black_money)}, true, {
                onSelected = function()
                    KeyboardUtils.use('Quantité', function(data)
                        local data = tonumber(data)

                        if data == nil then return end

                        if Config_BCSO.fouille.black_money < data then
                            return ESX.ShowNotification('La personne n\'en possède pas assez')
                        end

                        Config_BCSO.fouille.black_money -= data

                        TriggerServerEvent('zmain:bcso:removeMoney', data, Config_BCSO.fouille.id)
                    end)
                end
            })
            RageUI.Line()
            RageUI.Separator('Inventaire')
            for k,v in pairs(Config_BCSO.fouille.inventory) do
                RageUI.Button(v.label, nil, {RightLabel = ('~y~x%s~s~'):format(v.count)}, true, {
                    onSelected = function()
                        if not permissionsFouille[ESX.PlayerData.job.grade_name] then return ESX.ShowNotification('~r~Vous n\'avez pas les permissions nécessaires~s~') end

                        KeyboardUtils.use('Quantité', function(data)
                            local data = tonumber(data)

                           Config_BCSO.fouille.inventory[k].count -= data

                            if Config_BCSO.fouille.inventory[k].count <= 0 then
                                Config_BCSO.fouille.inventory[k] = nil
                            end

                            TriggerServerEvent('zmain:bcso:removeItem', data, v.name, Config_BCSO.fouille.id, v.label)
                        end)
                    end
                })
            end
            RageUI.Separator('Arme(s)')
            for k,v in pairs(Config_BCSO.fouille.loadout) do
                RageUI.Button(v.label, nil, {RightLabel = ('Munitions: ~y~x%s~s~'):format(v.ammo)}, true, {
                    onSelected = function()
                        if not permissionsFouille[ESX.PlayerData.job.grade_name] then return ESX.ShowNotification('~r~Vous n\'avez pas les permissions nécessaires~s~') end

                        KeyboardUtils.use('Taper Y pour valider', function(data)
                            if data == 'y' or data == 'Y' then
                                TriggerServerEvent('zmain:bcso:removeWeapon', v.name, Config_BCSO.fouille.id, v.label)

                                Config_BCSO.fouille.loadout[k] = nil
                            end
                        end)
                    end
                })
            end
        end)

        RageUI.IsVisible(dogMenu, function()
            RageUI.Button("Sortir/Rentrer le chien", nil, {RightLabel = "→"}, true , {
                onSelected = function()
                    if not DoesEntityExist(bcsoDog) then
                        RequestModel(351016938)
                        while not HasModelLoaded(351016938) do Wait(0) end
                        bcsoDog = CreatePed(4, 351016938, GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 1.0, -0.98), 0.0, true, false)
                        SetEntityAsMissionEntity(bcsoDog, true, true)
                        ESX.ShowNotification('~g~Chien Spawn')
                    else
                        ESX.ShowNotification('~r~Chien Rentrer')
                        DeleteEntity(bcsoDog)
                    end
                end
            })

            RageUI.Button("Demander de s\assoire", nil, {RightLabel = "→"}, true , {
                onSelected = function()
                    if DoesEntityExist(bcsoDog) then
                        if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), GetEntityCoords(bcsoDog), true) <= 5.0 then
                            if IsEntityPlayingAnim(bcsoDog, "creatures@rottweiler@amb@world_dog_sitting@base", "base", 3) then
                                ClearPedTasks(bcsoDog)
                            else
                                loadDict('rcmnigel1c')
                                TaskPlayAnim(PlayerPedId(), 'rcmnigel1c', 'hailing_whistle_waive_a', 8.0, -8, -1, 120, 0, false, false, false)
                                Wait(2000)
                                loadDict("creatures@rottweiler@amb@world_dog_sitting@base")
                                TaskPlayAnim(bcsoDog, "creatures@rottweiler@amb@world_dog_sitting@base", "base", 8.0, -8, -1, 1, 0, false, false, false)
                            end
                        else
                            ESX.ShowNotification('dog_too_far')
                        end
                    else
                        ESX.ShowNotification('no_dog')
                    end
                end
            })
        end)

        RageUI.IsVisible(code, function()
            RageUI.Separator('Demande de renforts')
            local playerPed = PlayerPedId()
            local playerCoords = GetEntityCoords(playerPed)
            RageUI.Button('Petite demande de renforts', nil, {}, true, {
                onSelected = function()
                    TriggerServerEvent('zmain:bcso:renforts', playerCoords, 'petite')
                end
            })
            RageUI.Button('Moyenne demande de renforts', nil, {}, true, {
                onSelected = function()
                    TriggerServerEvent('zmain:bcso:renforts', playerCoords, 'importante')
                end
            })
            RageUI.Button('Grande demande de renforts', nil, {}, true, {
                onSelected = function()
                    TriggerServerEvent('zmain:bcso:renforts', playerCoords, 'omgad')
                end
            })
            RageUI.Separator('Codes')
            for k,v in pairs(Config_BCSO.codes) do
                RageUI.Button(v.buttonName, nil, {}, true, {
                    onSelected = function()
                        TriggerServerEvent('zmain:bcso:sendCode', v.message)
                    end
                })
            end
        end)

        if not RageUI.Visible(main) and not RageUI.Visible(interactMenu) and not RageUI.Visible(billMenu) and not RageUI.Visible(fouilleMenu) and not RageUI.Visible(vehicleMenu) and not RageUI.Visible(vehicleInfoWithPlate) and not RageUI.Visible(dogMenu) and not RageUI.Visible(code) then
            main = RMenu:DeleteType('main')
        end
    end
end

function BCSO_OpenAccueilMenu()
    local main = RageUI.CreateMenu('', 'Actions Disponibles')
    local registerPlaint = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')
    local archives = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')
    local archivesSelected = RageUI.CreateSubMenu(archives, '', 'Actions Disponibles')

    RageUI.Visible(main, not RageUI.Visible(main))
    FreezeEntityPosition(PlayerPedId(), true)
    while main do Wait(1)
        RageUI.IsVisible(main, function()
            RageUI.Button('Enregistrer une plainte', nil, {}, true, {
                onSelected = function()
                    
                end
            }, registerPlaint)
            RageUI.Button('Acceder aux archives', nil, {}, true, {
                onSelected = function()
                    ESX.TriggerServerCallback('zmain:bcso:plainte:get', function(cb)
                        Config_BCSO.complaint.archives = cb

                        RageUI.Visible(archives, true)
                    end)
                end
            })
        end)

        RageUI.IsVisible(registerPlaint, function()
            RageUI.Button('Date', nil, {RightLabel = Config_BCSO.complaint.date or ''},  true, {
                onSelected = function()
                    KeyboardUtils.use('Entrer une date', function(data)
                        if data == nil or data == '' then return end
                        Config_BCSO.complaint.date = data
                    end)
                end
            })
            RageUI.Button('Nom/Prénom de la personne', nil, {RightLabel = Config_BCSO.complaint.name or ''}, true, {
                onSelected = function()
                    KeyboardUtils.use('Nom/Prénom de la personne', function(data)
                        if data == nil or data == '' then return end
                        Config_BCSO.complaint.name = data
                    end)
                end
            })
            RageUI.Button('Numéro de téléphone de la personne', nil, {RightLabel = Config_BCSO.complaint.numberphone or ''}, true , {
                onSelected = function()
                    KeyboardUtils.use('Numéro de téléphonem de la personne', function(data)
                        if data == nil or data == '' then return end
                        Config_BCSO.complaint.numberphone = data
                    end)
                end
            })
            RageUI.Button('Raison/Description de la plainte', nil, {RightLabel = Config_BCSO.complaint.reason or ''}, true, {
                onSelected = function()
                    KeyboardUtils.use('Raison/Description de la plainte', function(data)
                        if data == nil or data == '' then return end
                        Config_BCSO.complaint.reason = data
                    end)
                end
            })
            RageUI.Line()
            RageUI.Button('Confirmer', nil, {}, true, {
                onSelected = function()
                    if Config_BCSO.complaint.date == nil or Config_BCSO.complaint.name == nil or Config_BCSO.complaint.numberphone == nil or Config_BCSO.complaint.reason == nil then return ESX.ShowNotification('Toutes les informations ne sont pas correctement complétés') end

                    TriggerServerEvent('zmain:bcso:plainte:register', Config_BCSO.complaint)
                end
            })
        end)

        RageUI.IsVisible(archives, function()
            for k,v in pairs(Config_BCSO.complaint.archives) do
                RageUI.Button(('%s - %s'):format(v.id, v.name), v.reason, {}, true, {
                    onSelected = function()
                        Config_BCSO.complaint.archivesSelected = v
                        RageUI.Visible(archivesSelected, true)
                    end
                })
            end
        end)

        RageUI.IsVisible(archivesSelected, function()
            RageUI.Separator(('Archive %s - %s'):format(Config_BCSO.complaint.archivesSelected.id, Config_BCSO.complaint.archivesSelected.name))
            RageUI.Separator(('Nom/Prenom %s'):format(Config_BCSO.complaint.archivesSelected.name))
            RageUI.Button('Raison de la plainte', Config_BCSO.complaint.archivesSelected.reason, {}, true, {
                onActive = function()
                    RageUI.Info('Informations', {Config_BCSO.complaint.archivesSelected.reason}, {})
                end,
                onSelected = function()
                    
                end
            })
            RageUI.Line()
            RageUI.Button('Changer la raison', nil, {}, true, {
                onSelected = function()
                    KeyboardUtils.use('Nouvelle raison', function(data)
                        if data == nil then return end

                        TriggerServerEvent('zmain:bcso:plainte:editReason', Config_BCSO.complaint.archivesSelected.id, data)

                        Config_BCSO.complaint.archivesSelected.reason = data
                    end)
                end
            })
            RageUI.Button('Supprimer l\'archive', nil, {Color = {BackgroundColor = {255,0,0,100}}}, true, {
                onSelected = function()
                    KeyboardUtils.use('Taper Y pour valider', function(data)
                        if data == 'y' or data == 'Y' then
                            TriggerServerEvent('zmain:bcso:plainte:delete', Config_BCSO.complaint.archivesSelected.id)

                            RageUI.Visible(archivesSelected, false)
                            RageUI.Visible(archives, false)
                            RageUI.Visible(main, true)
                        end
                    end)
                end
            })
        end)

        if not RageUI.Visible(main) and not RageUI.Visible(registerPlaint) and not RageUI.Visible(archives) and not RageUI.Visible(archivesSelected) then
            main = RMenu:DeleteType('main')
            FreezeEntityPosition(PlayerPedId(), false)
        end
    end
end

RegisterNetEvent('zmain:bcso:renforts', function(coords, raison)
    if raison == 'petite' then
        PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
        PlaySoundFrontend(-1, "OOB_Start", "GTAO_FM_Events_Soundset", 1)
        ESX.ShowAdvancedNotification('Centrale BCSO', '~b~Demande de renfort', 'Demande de renfort demandé.\nRéponse : ~g~CODE-2\n~w~Importance : ~g~Légère.', 'CHAR_CALL911', 0)
        Wait(1000)
        PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
        color = 2
    elseif raison == 'importante' then
        PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
        PlaySoundFrontend(-1, "OOB_Start", "GTAO_FM_Events_Soundset", 1)
        ESX.ShowAdvancedNotification('Centrale BCSO', '~b~Demande de renfort', 'Demande de renfort demandé.\nRéponse : ~g~CODE-3\n~w~Importance : ~b~Importante.', 'CHAR_CALL911', 0)
        Wait(1000)
        PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
        color = 47
    elseif raison == 'omgad' then
        PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
        PlaySoundFrontend(-1, "OOB_Start", "GTAO_FM_Events_Soundset", 1)
        PlaySoundFrontend(-1, "FocusIn", "HintCamSounds", 1)
        ESX.ShowAdvancedNotification('Centrale BCSO', '~b~Demande de renfort', 'Demande de renfort demandé.\nRéponse : ~g~CODE-99\n~w~Importance : ~r~URGENTE !\nDANGER IMPORTANT', 'CHAR_CALL911', 0)
        Wait(1000)
        PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
        PlaySoundFrontend(-1, "FocusOut", "HintCamSounds", 1)
        color = 1
    end
    local blipId = AddBlipForCoord(coords)
    SetBlipSprite(blipId, 161)
    SetBlipScale(blipId, 1.2)
    SetBlipColour(blipId, color)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString('Demande renfort')
    EndTextCommandSetBlipName(blipId)
    Wait(80 * 1000)
    RemoveBlip(blipId)
end)

function BCSO_OpenWeaponMenu()
    local main = RageUI.CreateMenu('', 'Actions Disponibles')

    RageUI.Visible(main, not RageUI.Visible(main))
    while main do Wait(1)
        RageUI.IsVisible(main, function()
            for k,v in pairs(Config_BCSO.weapons) do
                RageUI.Button(v.label, nil, {RightLabel = '>>'}, ESX.PlayerData.job.grade >= v.required_grade, {
                    onSelected = function()
                        TriggerServerEvent('zmain:bcso:giveweapon', v.name)
                    end
                })
            end
        end)

        if not RageUI.Visible(main) then
            main = RMenu:DeleteType('main')
        end
    end
end

RegisterCommand('F6_BCSO', function()
    if ESX.PlayerData.job.name ~= 'bcso' then return end

    BCSO_openF6()
end)
RegisterKeyMapping('F6_BCSO', 'Menu Intéractions BCSO', 'keyboard', 'F6')

RegisterNetEvent('zmain:bcso:menotter', function()

    Config_BCSO.HandCuffed = not Config_BCSO.HandCuffed
    local playerPed = GetPlayerPed(-1)

    Citizen.CreateThread(function()

        
        if Config_BCSO.HandCuffed then

            RequestAnimDict('mp_arresting')
            while not HasAnimDictLoaded('mp_arresting') do
                Citizen.Wait(100)
            end

            TaskPlayAnim(playerPed, 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0, 0, 0, 0)

            while Config_BCSO.HandCuffed == true do
                Wait(0)
                SetPedCanBeDraggedOut(GetPlayerPed(-1), false)
                DisableControlAction(27, 75, true) -- Désactive le bouton de sortie (INPUT_VEH_EXIT)
                DisableControlAction(0, 23, true) -- Désactive le bouton de sortie (INPUT_ENTER)
                DisableControlAction(2, 37, true)
                SetEnableHandcuffs(playerPed, true)
                SetPedCanPlayGestureAnims(playerPed, false)
                FreezeEntityPosition(playerPed,  true)
                DisableControlAction(0, 75, true)
                DisableControlAction(1, 75, true)
                DisableControlAction(0, 24, true) -- Attack
                DisableControlAction(0, 257, true) -- Attack 2
                DisableControlAction(0, 25, true) -- Aim
                DisableControlAction(0, 263, true) -- Melee Attack 1
                DisableControlAction(0, 37, true) -- Select Weapon
                DisableControlAction(0, 47, true)  -- Disable weapon
            end

        else
            ClearPedSecondaryTask(playerPed)
            SetEnableHandcuffs(playerPed, false)
            SetPedCanPlayGestureAnims(playerPed,  true)
            FreezeEntityPosition(playerPed, false)
        end
    end)
end)

local isEscort = false
local playerSRCEscorte = nil
RegisterNetEvent("zmain:bcso:escoter", function(player)
    isEscort = not isEscort
    print(isEscort)
    playerSRCEscorte = tonumber(player)
    if isEscort then
        Citizen.CreateThread(function()
            local pPed = GetPlayerPed(-1)
            while isEscort do
                Wait(1)
                pPed = GetPlayerPed(-1)
                local targetPed = GetPlayerPed(GetPlayerFromServerId(playerSRCEscorte))
    
                if not IsPedSittingInAnyVehicle(targetPed) then
                    AttachEntityToEntity(pPed, targetPed, 11816, 0.54, 0.54, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
                else
                    isEscort = false
                    DetachEntity(pPed, true, false)
                end
    
                if IsPedDeadOrDying(targetPed, true) then
                    isEscort = false
                    DetachEntity(pPed, true, false)
                end
            end
            DetachEntity(pPed, true, false)
        end)
    end
end)

RegisterNetEvent('zmain:bcso:playerVehicle', function(veh, value)
    local playerPed = PlayerPedId()
    if value == 'put' then
        CreateThread(function()
            local coords = GetEntityCoords(playerPed)

            if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 5.0) then

                local vehicle = ESX.Game.GetClosestVehicle(coords)

                if DoesEntityExist(vehicle) then

                    local maxSeats = GetVehicleMaxNumberOfPassengers(vehicle)
                    local freeSeat = nil

                    for i=maxSeats - 1, 0, -1 do
                        if IsVehicleSeatFree(vehicle,  i) then
                            freeSeat = i
                            break
                        end
                    end

                    if freeSeat ~= nil then
                        TaskWarpPedIntoVehicle(playerPed,  vehicle,  freeSeat)
                    end

                end
            end
        end)
    elseif value == 'exit' then
        CreateThread(function()
            TaskLeaveAnyVehicle(PlayerPedId(), 0.0, 0.0)
        end)
    end
end)

CreateThread(function()
    while not ESXLoaded do Wait(1) end
    -- AddZones('cloakroom_bcso', {
    --     Position = Config_BCSO.Position.cloakroom,
    --     Dist = 10,
    --     Public = false,
    --     Job = {['bcso'] = true},
    --     Job2 = {['bcso'] = true},
    --     GradesJob = {},
    --     InVehicleDisable = true,
    --     Blip = {
    --         Active = false,
    --     },
    --     marker = true,
    --     ActionText = 'Appuyez sur [ ~g~E~w~ ] pour intéragir',
    --     Action = function()
    --         BCSO_openVestiaire()
    --     end
    -- })
    AddZones('accueil_bcso', {
        Position = Config_BCSO.Position.accueil,
        Dist = 10,
        Public = false,
        Job = {['bcso'] = true},
        Job2 = {['bcso'] = true},
        GradesJob = {},
        InVehicleDisable = true,
        Blip = {
            Active = false,
        },
        marker = true,
        ActionText = 'Appuyez sur [ ~g~E~w~ ] pour intéragir',
        Action = function()
            BCSO_OpenAccueilMenu()
        end
    })
    AddZones('weapons_menu_bcso', {
        Position = Config_BCSO.Position.armory,
        Dist = 10,
        Public = false,
        Job = {['bcso'] = true},
        Job2 = {['bcso'] = true},
        GradesJob = {},
        InVehicleDisable = true,
        Blip = {
            Active = false,
        },
        marker = true,
        ActionText = 'Appuyez sur [ ~g~E~w~ ] pour intéragir',
        Action = function()
            BCSO_OpenWeaponMenu()
        end
    })
end)

RegisterNetEvent('zmain:bcso:sendCode', function()
    PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
    PlaySoundFrontend(-1, "OOB_Start", "GTAO_FM_Events_Soundset", 1)
    PlaySoundFrontend(-1, "FocusIn", "HintCamSounds", 1)
end)