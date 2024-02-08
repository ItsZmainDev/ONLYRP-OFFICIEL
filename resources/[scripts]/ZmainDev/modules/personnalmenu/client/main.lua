local propsPropsList = {}

local cloneInterface = true

exports('activeCloneInterface', function()
    return cloneInterface
end)

local cross = true

function openPersonnalMenu()
    if getIsDead() then return end

    local main = RageUI.CreateMenu('', 'Actions Disponibles')

    local Portefeuille = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')

    local radioMenu = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')

    local VehicleOption = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')

    local EntrepriseOption = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')

    local OptionsVisuels = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')

    local societyAnnonce = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')

    local propsMenu = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')

    local clothesMenu = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')

    local clothesMenu2 = RageUI.CreateSubMenu(clothesMenu, '', 'Actions Disponibles')

    local factures = RageUI.CreateSubMenu(Portefeuille, '', 'Actions Disponibles')

    propsMenu.Closed = function()
        if DoesEntityExist(previewPropMenu) then
            DeleteEntity(previewPropMenu)
        end
    end

    RageUI.Visible(main, not RageUI.Visible(main))
    while main do Wait(1)
        RageUI.IsVisible(main, function()
            if GetCurrentServerEndpoint() == '193.38.250.32:30125' then
                RageUI.Separator('ID Unique: '..ESX.PlayerData.UniqueID)
                RageUI.Button('Mes Papiers', nil, {}, true, {
                    onSelected = function()
                        
                    end
                }, Portefeuille)
                RageUI.Button('Radio', nil, {}, true, {
                    onSelected = function()
                        
                    end
                }, radioMenu)
                if Society.List[ESX.PlayerData.job.name] then
                    RageUI.Button('Annonce Entreprise', nil, {}, true, {
                        onSelected = function()
                            
                        end
                    }, societyAnnonce)
                end
                if IsPedSittingInAnyVehicle(PlayerPedId()) then
                    RageUI.Button('Gestion Véhicule', nil, {}, true, {
                        onSelected = function()
                        end
                    }, VehicleOption)
                end
                -- if ESX.PlayerData.job.grade_name == 'boss' then
                    -- RageUI.Button('Gestion Entreprise', nil, {}, true, {
                    --     onSelected = function()
                    --         -- RefrehEntrepriseMoney()
                    --     end
                    -- }, EntrepriseOption)
                -- end
                RageUI.Button('Gestion des objets', nil, {}, true, {
                    onSelected = function()
                        TriggerServerEvent('zmain:personalmenu:getpropspropss')

                        RageUI.Visible(propsMenu, true)
                    end
                })
                RageUI.Button('Préférences', nil, {}, true, {
                    onSelected = function()
                        
                    end
                }, OptionsVisuels)
                RageUI.WLine()
                RageUI.Button('Retirer le Kevlar', nil, {RightLabel = '>>'}, true, {
                    onSelected = function()
                        TriggerServerEvent('zmain:RemoveKevlar')
                    end
                })
            else
                RageUI.Separator('ID Unique: '..ESX.PlayerData.UniqueID)
                RageUI.Button('Vêtements', nil, {RightLabel = '>'}, true, {
                    onSelected = function()
                        RageUI.CloseAll()
                        ExecuteCommand('zmainleplusbg')
                        -- ESX.TriggerServerCallback("cClothes:getPlayerClothes", function(clothes)
                        --     if json.encode(clothes) ~= "[]" and clothes ~= nil then 
                        --         RageUI.Visible(clothesMenu, true)
                        --     else
                        --         ESX.ShowNotification("~r~Vous n'avez aucun vêtements.")
                        --     end
                        -- end)
                    end
                })
                RageUI.Button('Portefeuille', nil, {RightLabel = '>'}, true, {
                    onSelected = function()
                        
                    end
                }, Portefeuille)
                RageUI.Button('Radio', nil, {RightLabel = '>'}, true, {
                    onSelected = function()
                        
                    end
                }, radioMenu)
                RageUI.Button('Statut des entreprises', nil, {RightLabel = '>'}, true, {
                    onSelected = function()
                        
                    end
                }, societyAnnonce)
                if IsPedSittingInAnyVehicle(PlayerPedId()) then
                    RageUI.Button('Gestion Véhicule', nil, {RightLabel = '>'}, true, {
                        onSelected = function()
                        end
                    }, VehicleOption)
                end
                RageUI.Button('Gestion Objets ', nil, {RightLabel = '>'}, true, {
                    onSelected = function()
                        TriggerServerEvent('zmain:personalmenu:getpropspropss')

                        RageUI.Visible(propsMenu, true)
                    end
                })
                RageUI.Button('Préférences', nil, {RightLabel = '>'}, true, {
                    onSelected = function()
                        
                    end
                }, OptionsVisuels)
            end
        end)

        RageUI.IsVisible(clothesMenu, function()
            for k,v in pairs(
                {{ name = "Tenue", ask = ">" },
                { name = "Torse", ask = ">"},
                { name = "T-Shirt", ask = ">"},
                { name = "Bras", ask = ">"},
                { name = "Pantalons", ask = ">"},
                { name = "Chaussures", ask = ">"},
                { name = "Masque", ask = ">"},
                { name = "Gillet par balles", ask = ">"},
                { name = "Chaine", ask = ">"},
                { name = "Chapeau", ask = ">"},
                { name = "Lunettes", ask = ">"},
                { name = "Montres", ask = ">"},
                { name = "Bracelets", ask = ">"},
                { name = "Sacs", ask = ">"},}
            ) do
                RageUI.Button(v.name, nil, {RightLabel = v.ask}, true, {
                    onSelected = function()
                        RageUI.Visible(clothesMenu2, true)
                    end
                })
            end
        end)

        RageUI.IsVisible(clothesMenu2, function()
            
        end)

        RageUI.IsVisible(propsMenu, function()
            for k,v in pairs(propsPropsList) do
                RageUI.Button(v.label, nil, {RightLabel = 'x'..v.count}, true, {
                    onActive = function()
                        -- if DoesEntityExist(previewPropMenu) and GetHashKey(GetEntityModel(previewPropMenu)) ~= v.name or not DoesEntityExist(previewPropMenu) then
                        --     DeleteEntity(previewPropMenu)
                            
                        --     local coords, forward = Player.coords, GetEntityForwardVector(Player.playerPed)
                        --     local objectCoords = (coords + forward * 3.0)
        
                        --     ESX.Streaming.RequestModel(v.name)
                        --     previewPropMenu = CreateObjectNoOffset(v.name, objectCoords.x, objectCoords.y, objectCoords.z, false, false, false)
                        --     SetModelAsNoLongerNeeded(v.nale)
                        --     SetEntityCollision(previewPropMenu, false, false)
                        --     SetCanClimbOnEntity(previewPropMenu, false)
                        --     FreezeEntityPosition(previewPropMenu, true)
                        -- else

                        -- end
                    end,
                    onSelected = function()
                        TriggerEvent('zmain:props:place', v)
                    end
                })
            end
        end)

        RageUI.IsVisible(Portefeuille, function()
            local player, distance = ESX.Game.GetClosestPlayer()
            RageUI.Button(('Entreprise: %s (%s)'):format(ESX.PlayerData.job.label, ESX.PlayerData.job.grade_label), nil, {}, true, {})
            RageUI.Button(('Gang/Organisation: %s (%s)'):format(ESX.PlayerData.job2.label, ESX.PlayerData.job2.grade_label), nil, {}, true, {})
            RageUI.Button('Factures', nil, {RightLabel = '>>'}, true, {
                onSelected = function()
                    ESX.TriggerServerCallback('esx_billing:getBills', function(cb)
                        facturessss = cb
                        RageUI.Visible(factures, true)
                    end)
                end
            })
            RageUI.WLine()
            RageUI.Button('Regarder sa carte d\'identitié', nil, {}, true, {
                onSelected = function()
                    TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()))
                end
            })
            RageUI.Button('Montrer sa carte d\'identitié', nil, {}, true, {
                onSelected = function()
                    if distance == -1 or distance > 3  then return ESX.ShowNotification('Personne aux alentours') end

                    TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(player))
                end
            })
            RageUI.Button('Regarder son permis de conduire', nil, {}, true, {
                onSelected = function()
                    TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()), 'driver')
                end
            })
            RageUI.Button('Montrer son permis de conduire', nil, {}, true, {
                onSelected = function()
                    if distance == -1 or distance > 3  then return ESX.ShowNotification('Personne aux alentours') end

                    TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(player), 'driver')
                end
            })
            RageUI.Button('Regarder son permis de port d\'arme', nil, {}, true, {
                onSelected = function()
                    TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()), 'weapon')
                end
            })
            RageUI.Button('Montrer son permis de port d\'arme', nil, {}, true, {
                onSelected = function()
                    if distance == -1 or distance > 3  then return ESX.ShowNotification('Personne aux alentours') end

                    TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(player), 'weapon')
                end
            })
        end)

        RageUI.IsVisible(factures, function()
            for k,v in pairs(facturessss) do
                RageUI.Button(v.label, nil, {RightLabel = v.amount}, true, {
                    onSelected = function()
                        v.target = string.gsub(v.target, 'society_', '')
                        print('target', v.target)
                        TriggerServerEvent('zmain:bill:pay', v)

                        RageUI.GoBack()
                    end
                })
            end
        end)

        RageUI.IsVisible(VehicleOption, function()
            local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
            RageUI.Separator(('Plaque: %s'):format(GetVehicleNumberPlateText(vehicle)))
            RageUI.Separator(('Model: %s'):format(GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(vehicle)))))

            RageUI.Button("Allumer / Eteindre le moteur", nil, {RightLabel = Config.Personalmenu.Statut}, true, {
                onSelected = function()
                    if GetIsVehicleEngineRunning(vehicle) then
                        Config.Personalmenu.Statut = "~r~Eteint"

                        SetVehicleEngineOn(vehicle, false, false, true)
                        SetVehicleUndriveable(vehicle, true)
                    elseif not GetIsVehicleEngineRunning(vehicle) then
                        Config.Personalmenu.Statut = "~g~Allumé"

                        SetVehicleEngineOn(vehicle, true, false, true)
                        SetVehicleUndriveable(vehicle, false)
                    end
                end
            })

            RageUI.List("Ouvrir / Fermer porte", {"Avant gauche", "Avant Droite", "Arrière Gauche", "Arrière Droite", "Capot", "Coffre"}, Config.Personalmenu.Indexdoor, nil, {}, true, {
                onListChange = function(index)
                    Config.Personalmenu.Indexdoor = index 
                end,
                onSelected = function(index)
                    
                    if index == 1 then
                        if not Config.Personalmenu.DoorState.FrontLeft then
                            Config.Personalmenu.DoorState.FrontLeft = true
                            SetVehicleDoorOpen(vehicle, 0, false, false)
                        elseif Config.Personalmenu.DoorState.FrontLeft then
                            Config.Personalmenu.DoorState.FrontLeft = false
                            SetVehicleDoorShut(vehicle, 0, false, false)
                        end
                    elseif index == 2 then
                        if not Config.Personalmenu.DoorState.FrontRight then
                            Config.Personalmenu.DoorState.FrontRight = true
                            SetVehicleDoorOpen(vehicle, 1, false, false)
                        elseif Config.Personalmenu.DoorState.FrontRight then
                            Config.Personalmenu.DoorState.FrontRight = false
                            SetVehicleDoorShut(vehicle, 1, false, false)
                        end
                    elseif index == 3 then
                        if not Config.Personalmenu.DoorState.BackLeft then
                            Config.Personalmenu.DoorState.BackLeft = true
                            SetVehicleDoorOpen(vehicle, 2, false, false)
                        elseif Config.Personalmenu.DoorState.BackLeft then
                            Config.Personalmenu.DoorState.BackLeft = false
                            SetVehicleDoorShut(vehicle, 2, false, false)
                        end
                    elseif index == 4 then
                        if not Config.Personalmenu.DoorState.BackRight then
                            Config.Personalmenu.DoorState.BackRight = true
                            SetVehicleDoorOpen(vehicle, 3, false, false)
                        elseif Config.Personalmenu.DoorState.BackRight then
                            Config.Personalmenu.DoorState.BackRight = false
                            SetVehicleDoorShut(vehicle, 3, false, false)
                        end
                    elseif index == 5 then 
                        if not Config.Personalmenu.DoorState.Hood then
                            Config.Personalmenu.DoorState.Hood = true
                            SetVehicleDoorOpen(vehicle, 4, false, false)
                        elseif Config.Personalmenu.DoorState.Hood then
                            Config.Personalmenu.DoorState.Hood = false
                            SetVehicleDoorShut(vehicle, 4, false, false)
                        end
                    elseif index == 6 then 
                        if not Config.Personalmenu.DoorState.Trunk then
                            Config.Personalmenu.DoorState.Trunk = true
                            SetVehicleDoorOpen(vehicle, 5, false, false)
                        elseif Config.Personalmenu.DoorState.Trunk then
                            Config.Personalmenu.DoorState.Trunk = false
                            SetVehicleDoorShut(vehicle, 5, false, false)
                        end
                    end
                end
            })

            RageUI.Button("Fermer toutes les portes", nil, {RightLabel =  "→→→"}, true, {
                onSelected = function ()
                    for door = 0, 7 do
                        SetVehicleDoorShut(vehicle, door, false)
                    end
                end
            })

            -- RageUI.List("Limitateur", Config.Personalmenu.voiture_limite, Config.Personalmenu.LimitateurIndex, nil, {}, true, {
            --     onListChange = function(i, item)
            --         Config.Personalmenu.LimitateurIndex = i
            --     end,

            --     onSelected = function(i, item)
            --         if i == 1 then
            --             SetEntityMaxSpeed(GetVehiclePedIsIn(Player.playerPed, false), 50.0/3.6)
            --             ESX.ShowNotification("Limitateur de vitesse défini sur ~b~50 km/h")
            --         elseif i == 2 then  
            --             SetEntityMaxSpeed(GetVehiclePedIsIn(Player.playerPed, false), 80.0/3.6)
            --             ESX.ShowNotification("Limitateur de vitesse défini sur ~b~80 km/h")
            --         elseif i == 3  then
            --             SetEntityMaxSpeed(GetVehiclePedIsIn(Player.playerPed, false), 130.0/3.6)
            --             ESX.ShowNotification("Limitateur de vitesse défini sur ~b~130 km/h")
            --         elseif i == 4 then
            --             KeyboardUtils.use('Indiquer la viteese', function(speed)
            --                 if speed ~= nil or speed ~= tostring("") then 
            --                     SetEntityMaxSpeed(GetVehiclePedIsIn(Player.playerPed, false), ESX.Math.Round(speed, 1)/3.6)
            --                     ESX.ShowNotification("Limitateur de vitesse défini sur ~b~"..speed..'km/h')
            --                 else
            --                     return
            --                 end
            --             end)
            --         elseif i == 5 then 
            --             SetEntityMaxSpeed(GetVehiclePedIsIn(Player.playerPed, false), 10000.0/3.6)    
            --             ESX.ShowNotification("Limitateur de vitesse désactivé")
            --         end
            --     end
            -- })
        end)

        RageUI.IsVisible(EntrepriseOption, function()
            RageUI.Button('Argent de la société: '..Society.List[ESX.PlayerData.job.name].coffre['accounts'].society, nil, {}, true, {
                onSelected = function()
                end
            })
            RageUI.Button("Recruter un employé", nil, {RightLabel = "→→→"}, true, {
                onSelected = function()
                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                    if closestDistance ~= -1 and closestDistance <= 3 then
                        TriggerServerEvent("zmain:entreprise:Boss_recruterplayer", GetPlayerServerId(closestPlayer), ESX.PlayerData.job.name)
                    else
                        ESX.ShowNotification("Aucun joueur à proximité")
                    end
                end
            })

            RageUI.Button("Virer un employé", nil, {RightLabel = "→→→"}, true, {
                onSelected = function()
                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                    if closestDistance ~= -1 and closestDistance <= 3 then
                        TriggerServerEvent("zmain:entreprise:Boss_virerplayer", GetPlayerServerId(closestPlayer))
                    else
                        ESX.ShowNotification("Aucun joueur à proximité")
                    end
                end
            })

            RageUI.Button("Promouvroir un employé", nil, {RightLabel = "→→→"}, true, {
                onSelected = function()
                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                    if closestDistance ~= -1 and closestDistance <= 3 then
                        TriggerServerEvent("zmain:entreprise:Boss_promouvoirplayer", GetPlayerServerId(closestPlayer))
                    else
                        ESX.ShowNotification("Aucun joueur à proximité")
                    end
                end
            })

            RageUI.Button("Rétrograder un employé", nil, {RightLabel = "→→→"}, true, {
                onSelected = function()
                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                    if closestDistance ~= -1 and closestDistance <= 3 then
                        TriggerServerEvent("zmain:entreprise:Boss_destituerplayer", GetPlayerServerId(closestPlayer))
                    else
                        ESX.ShowNotification("Aucun joueur à proximité")
                    end
                end
            })
        end)

        RageUI.IsVisible(OptionsVisuels, function()
            RageUI.Checkbox('Afficher le radar', nil, Config.Personalmenu.CarteActive, {}, {
                onChecked = function()
                    Config.Personalmenu.CarteActive = true
                    DisplayRadar(true)
                end,
                onUnChecked = function()
                    Config.Personalmenu.CarteActive = false
                    DisplayRadar(false)
                end
            })
            RageUI.Checkbox('Afficher les rues', nil, Config.Personalmenu.HudActive, {}, {
                onChecked = function()
                    Config.Personalmenu.HudActive = true
                    TriggerEvent('zmain:cacaca', true)
                end,
                onUnChecked = function()
                    Config.Personalmenu.HudActive = false
                    TriggerEvent('zmain:cacaca', false)
                end
            })
            RageUI.Checkbox('Afficher l\'HUD', nil, Config.Personalmenu.Hud2Active, {}, {
                onChecked = function()
                    Config.Personalmenu.Hud2Active = true
                    TriggerEvent('tempui:toggleUi', true)
                end,
                onUnChecked = function()
                    Config.Personalmenu.Hud2Active = false
                    TriggerEvent('tempui:toggleUi', false)
                end
            })
            RageUI.Checkbox('Mode Cinématique', nil, Config.Personalmenu.CineMod, {}, {
                onChecked = function()
                    Config.Personalmenu.CineMod = true
                    ExecuteCommand('noir')
                end,
                onUnChecked = function()
                    Config.Personalmenu.CineMod = false
                    ExecuteCommand('noir')
                end
            })
            RageUI.Checkbox('Informations objets', nil, WorldProps.data.info, {}, {
                onChecked = function()
                    WorldProps.data.info = true
                end,
                onUnChecked = function()
                    WorldProps.data.info = false
                end
            })
            RageUI.Checkbox('Coup de Crosse', nil, cross, {}, {
                onChecked = function()
                    cross = true
                end,
                onUnChecked = function()
                    cross = false

                    Citizen.CreateThread(function()
                        while not cross do  
                            local isArmed = IsPedArmed(Player.playerPed, 6)
                            if isArmed then
                                Wait(0)
                                DisableControlAction(1, 140, true)
                                DisableControlAction(1, 141, true)
                                DisableControlAction(1, 142, true)
                            else
                                Wait(2500)
                            end
                        end
                    end)
                end
            })
            RageUI.Checkbox('Clone dans l\'inventaire', nil, cloneInterface, {}, {
                onChecked = function()
                    cloneInterface = true
                end,
                onUnChecked = function()
                    cloneInterface = false
                end
            })
        end)

        RageUI.IsVisible(radioMenu, function()
            radio.EnableMouse = false
            RageUI.Checkbox('Statut de la radio', nil, Config.Personalmenu.Radio.Active, {}, {
                onChecked = function()
                    Config.Personalmenu.Radio.Active = true
                    Config.Personalmenu.Radio.pma:setVoiceProperty("radioEnabled", true)
                    Config.Personalmenu.Radio.Frequence = 0
                    Config.Personalmenu.Radio.pma:setRadioChannel(Config.Personalmenu.Radio.Frequence)
                end,
                onUnChecked = function()
                    Config.Personalmenu.Radio.Active = false
                    Config.Personalmenu.Radio.pma:setVoiceProperty("radioEnabled", false)
                    Config.Personalmenu.Radio.Frequence = 0
                    Config.Personalmenu.Radio.pma:setRadioChannel(Config.Personalmenu.Radio.Frequence)
                end
            })
            if Config.Personalmenu.Radio.Active then
                RageUI.Button(('Fréquence (%s)'):format(Config.Personalmenu.Radio.Frequence), nil, {}, true, {
                    onSelected = function()
                        KeyboardUtils.use('Fréquence', function(data)
                            local data = tonumber(data)
                            if data == nil then return end

                            if data < 0 then return end

                            Config.Personalmenu.Radio.Frequence = data
                            Config.Personalmenu.Radio.pma:setRadioChannel(Config.Personalmenu.Radio.Frequence)
                        end)
                    end
                })
                RageUI.Checkbox('Bruitages', nil, Config.Personalmenu.Radio.Tick, {}, {
                    onChecked = function()
                        Config.Personalmenu.Radio.Tick = true
                        Config.Personalmenu.Radio.pma:setVoiceProperty("micClicks", true)
                    end,
                    onUnChecked = function()
                        Config.Personalmenu.Radio.Tick = false
                        Config.Personalmenu.Radio.pma:setVoiceProperty("micClicks", false)
                    end,
                })
                RageUI.Button(('Volume (%s)'):format(math.floor(Config.Personalmenu.Radio.Sound*100)..'%'), nil, {}, true, {
                    onActive = function()
                        radio.EnableMouse = true
                    end,
                })
            end
        end, function()
            RageUI.PercentagePanel(Config.Personalmenu.Radio.Sound, 'Volume', '0%', '100%', {
                onProgressChange = function(Percentage)
                    Config.Personalmenu.Radio.Sound = Percentage
                    Config.Personalmenu.Radio.pma:setRadioVolume(Percentage)
                end
            }, 4)
        end)

        RageUI.IsVisible(societyAnnonce, function()
            local blacklist = {
                ['vigne'] = true
            }
            for k,v in pairs(Society.List) do
                if blacklist[v.name] then goto continue end

                RageUI.Button(v.label, v.name, {RightLabel = v.state == false and '~r~Fermé~s~' or '~g~Ouvert~s~'}, true, {
                    onSelected = function()
                        
                    end
                })

                ::continue::
            end
        end)

        if not RageUI.Visible(main) and not RageUI.Visible(Portefeuille) and not RageUI.Visible(VehicleOption) and not RageUI.Visible(EntrepriseOption) and not RageUI.Visible(OptionsVisuels) and not RageUI.Visible(radioMenu) and not RageUI.Visible(societyAnnonce) and not RageUI.Visible(propsMenu) and not RageUI.Visible(clothesMenu) and not RageUI.Visible(clothesMenu2) and not RageUI.Visible(factures) and
            
            not RageUI.Visible(main) then
            main = RMenu:DeleteType('main')
        end
    end
end

if GetCurrentServerEndpoint() == '193.38.250.32:30125' then
    RegisterCommand('F5', function()
        openPersonnalMenu()
    end)
    
    RegisterKeyMapping('F5', 'Menu Personnel', 'keyboard', 'F5')
else
    RegisterCommand('personnalmenu', function()
        openPersonnalMenu()
    end)
    
    RegisterKeyMapping('personnalmenu', 'Menu Personnel', 'keyboard', 'F5')
end

RegisterNetEvent('zmain:recieveProps', function(table)
    propsPropsList = table
end)