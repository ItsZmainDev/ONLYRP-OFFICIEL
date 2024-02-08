function Properties:openArcadiusMenu(type)
    local main = RageUI.CreateMenu('', 'Actions Disponibles')
    local createProperties = RageUI.CreateSubMenu(main, '', 'Création de propriété')
    local Garage = RageUI.CreateSubMenu(createProperties, '')
    local propertiesAttribut = RageUI.CreateSubMenu(main, '', 'Attribution de propriété')
    local propertiesAttributGestion = RageUI.CreateSubMenu(propertiesAttribut, '', 'Gestion de propriété')

    local editProperty = RageUI.CreateSubMenu(propertiesAttribut, '', 'Actions Disponibles')

    RageUI.Visible(main, not RageUI.Visible(main))
    if type ~= 'f6' then
        FreezeEntityPosition(PlayerPedId(), true)
    end
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
            RageUI.Checkbox('Service', nil, Properties.job.Service, {}, {
                onChecked = function()
                    Properties.job.Service = true
                    TriggerEvent('zmain:properties:job:service')
                end,
                onUnChecked = function()
                    Properties.job.Service = false
                end
            })
            if Properties.job.Service then
                RageUI.Button('Cree une propriété', nil, {}, type == 'f6', {
                    onSelected = function() 
                    end
                }, createProperties)
                RageUI.Button('Gérer les propriétés', nil, {}, true, {
                    onSelected = function()
                    end
                }, propertiesAttribut)
            end
        end)

        RageUI.IsVisible(createProperties, function()
            local PlayerCoords = GetEntityCoords(PlayerPedId())

            RageUI.Button('Nom', nil, {RightLabel = Properties.admin.name and '~y~'..Properties.admin.name or '~r~Indéfini~s~'}, true, {
                onSelected = function()
                    KeyboardUtils.use('Nom d\'affichage', function(data)
                        if data == nil or data == '' then return end

                        Properties.admin.name = data
                    end)
                end
            })
        
            RageUI.Button('Nom d\'affichage', nil, {RightLabel = Properties.admin.label and '~y~'..Properties.admin.label or '~r~Indéfini~s~'}, true, {
                onSelected = function()
                    KeyboardUtils.use('Label de la propritété', function(data)
                        if data == nil or data == '' then return end

                        Properties.admin.label = data
                    end)
                end
            })

            RageUI.Button('Prix', nil, {RightLabel = Properties.admin.price and '~y~'..Properties.admin.price..'$' or '~r~Indéfini~s~'}, true, {
                onSelected = function()
                    KeyboardUtils.use('Label de la propritété', function(data)
                        local data = tonumber(data)
                        if data == nil then return end
                        if Properties.admin.typeData ~= 'location' or Properties.admin.typeData == nil then
                            if data == nil or data < 10000 then return end
                        end

                        Properties.admin.price = data
                    end)
                end
            })

            RageUI.WLine()
        
            RageUI.List('Intérieur', Properties.admin.Menu.action, Properties.admin.Menu.list, nil, {}, true, {
                onListChange = function(Index)
                    Properties.admin.Menu.list = Index

                    Properties.admin.logementType = Properties.admin.Menu.action[Properties.admin.Menu.list]
                end,
                onActive = function()
                    if Properties.admin.Menu.list == 1 then
                        RenderSprite('prop', 'Motel', 0, 550, 530, 250, 80)
                        ipl = '["hei_hw1_blimp_interior_v_motel_mp_milo_"]'
                        inside = '{"x":151.45,"y":-1007.57,"z":-98.9999}'
                        exit = '{"x":151.3258,"y":-1007.7642,"z":-100.0000}'
                        isSingle = 1
                        isRoom = 1
                        isGateway = current_zone
                    elseif Properties.admin.Menu.list == 2 then
                        RenderSprite('prop', 'Low', 0, 550, 530, 250, 80)
                        ipl = '[]'
                        inside = '{"x":265.307,"y":-1002.802,"z":-101.008}'
                        exit = '{"x":266.0773,"y":-1007.3900,"z":-101.008}'
                        isSingle = 1
                        isRoom = 1
                        isGateway = current_zone
                    elseif Properties.admin.Menu.list == 3 then
                        RenderSprite('prop', 'Middle', 0, 550, 530, 250, 80)
                        ipl = '[]'
                        inside = '{"x":-612.16,"y":59.06,"z":97.2}'
                        exit = '{"x":-603.4308,"y":58.9184,"z":97.2001}'
                        isSingle = 1
                        isRoom = 1
                        isGateway = current_zone
                    elseif Properties.admin.Menu.list == 4 then
                        RenderSprite('prop', 'Modern',0, 550, 530, 250, 80)
                        ipl = '["apa_v_mp_h_01_a"]'
                        inside = '{"x":-785.13,"y":315.79,"z":187.91}'
                        exit = '{"x":-786.87,"y":315.7497,"z":186.91}'
                        isSingle = 1
                        isRoom = 1
                        isGateway = current_zone
                    elseif Properties.admin.Menu.list == 5 then
                        RenderSprite('prop', 'High', 0, 550, 530, 250, 80)
                        ipl = '[]'
                        inside = '{"x":-1459.17,"y":-520.58,"z":54.929}'
                        exit = '{"x":-1451.6394,"y":-523.5562,"z":55.9290}'
                        isSingle = 1
                        isRoom = 1
                        isGateway = current_zone
                    elseif Properties.admin.Menu.list == 6 then
                        RenderSprite('prop', 'Luxe', 0, 550, 530, 250, 80)
                        ipl = '[]'
                        inside = '{"x":-680.6088,"y":590.5321,"z":145.39}'
                        exit = '{"x":-681.6273,"y":591.9663,"z":144.3930}'
                        isSingle = 1
                        isRoom = 1
                        isGateway = current_zone
                    elseif Properties.admin.Menu.list == 7 then
                        RenderSprite('prop', 'Entrepot_grand', 0, 550, 530, 250, 80)
                        ipl = '[]'
                        inside = '{"x":1026.5056,"y":-3099.8320,"z":-38.9998}'
                        exit   = '{"x":998.1795"y":-3091.9169,"z":-39.9999}'
                        isSingle = 1
                        isRoom = 1
                        isGateway = current_zone
                    elseif Properties.admin.Menu.list == 8 then
                        RenderSprite('prop', 'Entrepot_moyen', 0, 550, 530, 250, 80)
                        ipl = '[]'
                        inside = '{"x":1048.5067,"y":-3097.0817,"z":-38.9999}'
                        exit   = '{"x":1072.5505,"y":-3102.5522,"z":-39.9999}'
                        isSingle = 1
                        isRoom = 1
                        isGateway = current_zone
                    elseif Properties.admin.Menu.list == 9 then
                        RenderSprite('prop', 'Entrepot_petit', 0, 550, 530, 250, 80)
                        ipl = '[]'
                        inside = '{"x":1088.1834,"y":-3099.3547,"z":-38.9999}'
                        exit  = '{"x":1104.6102,"y":-3099.4333,"z":-39.9999}'
                        isSingle = 1
                        isRoom = 1
                        isGateway = current_zone
                    elseif Properties.admin.Menu.list == 0 or index == nil then
                        RenderSprite('prop', 'Motel', 0, 550, 530, 250, 80)
                        ipl = '["hei_hw1_blimp_interior_v_motel_mp_milo_"]'
                        inside = '{"x":151.45,"y":-1007.57,"z":-98.9999}'
                        exit = '{"x":151.3258,"y":-1007.7642,"z":-100.0000}'
                        isSingle = 1
                        isRoom = 1
                        isGateway = current_zone
                    end
                end
            })
        
            RageUI.Button('Entrée', nil, {RightLabel = Properties.admin.enter and '~g~Défini' or '~r~Indéfini~s~'}, true, {
                onSelected = function()
                    Properties.admin.enter = PlayerCoords
                    Properties.admin.current_zone = Properties.admin.zones[GetNameOfZone(PlayerCoords.x, PlayerCoords.y, PlayerCoords.z)]
                end,
                onActive = function()
                    DrawMarker(25, PlayerCoords.x, PlayerCoords.y, PlayerCoords.z-0.98, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.55, 0.55, 0.55, 240, 255, 0, 255, false, false, 2, false, false, false, false)
                    DrawInstructionBarNotification(PlayerCoords.x, PlayerCoords.y, PlayerCoords.z, ('Position de l\'entrée (%s)'):format(Properties.admin.zones[GetNameOfZone(PlayerCoords.x, PlayerCoords.y, PlayerCoords.z)]))
                end
            })
        
            RageUI.Button('Sortie', nil, {RightLabel = Properties.admin.exit and '~g~Défini' or '~r~Indéfini~s~'}, true, {
                onSelected = function()
                    Properties.admin.exit = GetEntityCoords(PlayerPedId())
                end,
                onActive = function()
                    DrawMarker(25, PlayerCoords.x, PlayerCoords.y, PlayerCoords.z-0.98, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.55, 0.55, 0.55, 240, 255, 0, 255, false, false, 2, false, false, false, false)
                    DrawInstructionBarNotification(PlayerCoords.x, PlayerCoords.y, PlayerCoords.z, 'Position de la sortie')
                end
            })

            RageUI.Button('Coffre', nil, {RightLabel = Properties.admin.trunk and '~g~Défini' or '~r~Indéfini~s~'}, true, {
                onSelected = function()
                    Properties.admin.trunk = GetEntityCoords(PlayerPedId())
                end,
                onActive = function()
                    DrawMarker(25, PlayerCoords.x, PlayerCoords.y, PlayerCoords.z-0.98, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.55, 0.55, 0.55, 240, 255, 0, 255, false, false, 2, false, false, false, false)
                    DrawInstructionBarNotification(PlayerCoords.x, PlayerCoords.y, PlayerCoords.z, 'Position du Coffre')
                end
            })

            RageUI.Checkbox('Mode Visite', nil, Properties.admin.visitmode, {}, {
                onChecked = function()
                    local ped = PlayerPedId()
                    Properties.admin.visitmode = true
                    Properties.Lastplayerpos = GetEntityCoords(ped)
                    SetEntityCoords(ped, inside)
                    if Properties.admin.Menu.list == 1 then
                        SetEntityCoords(ped, vector3(151.45,-1007.57,-98.9999))
                    elseif Properties.admin.Menu.list == 2 then
                        SetEntityCoords(ped, vector3(265.307,-1002.802,-101.008))
                    elseif Properties.admin.Menu.list == 3 then
                        SetEntityCoords(ped, vector3(-612.16,59.06,97.2))
                    elseif Properties.admin.Menu.list == 4 then
                        SetEntityCoords(ped, vector3(-785.13,315.79,187.91))
                    elseif Properties.admin.Menu.list == 5 then
                        SetEntityCoords(ped, vector3(-1459.17,-520.58,54.929))
                    elseif Properties.admin.Menu.list == 6 then
                        SetEntityCoords(ped, vector3(-680.6088,590.5321,145.39))
                    elseif Properties.admin.Menu.list == 7 then
                        SetEntityCoords(ped, vector3(1026.5056,-3099.8320,-38.9998))
                    elseif Properties.admin.Menu.list == 8 then
                        SetEntityCoords(ped, vector3(1048.5067,-3097.0817,-38.9999))
                    elseif Properties.admin.Menu.list == 9 then
                        SetEntityCoords(ped, vector3(1088.1834, -3099.3547, -38.9999))
                    elseif Properties.admin.Menu.list == 0 or index == nil then
                        SetEntityCoords(ped, vector3(151.45, 1007.57, 98.9999))
                    end
                end,
                onUnChecked = function()
                    Properties.admin.visitmode = false
                    SetEntityCoords(PlayerPedId(), Properties.Lastplayerpos)
                end
            })

            RageUI.Checkbox('Mode Visite (joueur le plus proche)', nil, Properties.admin.visitmode2, {}, {
                onChecked = function()
                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                    if closestDistance == -1 or closestDistance > 3 then Properties.admin.visitmode2 = false return ESX.ShowNotification('Personne aux alentours') end

                    Properties.admin.visitmode2 = true

                    TriggerServerEvent('zmain:properties:visitMod', GetPlayerServerId(closestPlayer), Properties.admin.Menu.list)
                end,
                onUnChecked = function()
                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                    if closestDistance == -1 or closestDistance > 3 then Properties.admin.visitmode2 = false return ESX.ShowNotification('Personne aux alentours') end

                    Properties.admin.visitmode2 = false
                    SetEntityCoords(PlayerPedId(), Properties.Lastplayerpos)

                    TriggerServerEvent('zmain:properties:stopVisit', GetPlayerServerId(closestPlayer))
                end
            })

            RageUI.Checkbox('Location', nil, Properties.admin.typeValue, {}, {
                onChecked = function()
                    Properties.admin.typeValue = true
                    Properties.admin.typeData = 'location'
                end,
                onUnChecked = function()
                    Properties.admin.typeValue = false
                    Properties.admin.typeData = 'achat'

                    Properties.admin.price = nil
                end
            })

            RageUI.Checkbox('Entrepot', nil, Properties.admin.entrepot, {}, {
                onChecked = function()
                    Properties.admin.entrepot = true
                end,
                onUnChecked = function()
                    Properties.admin.entrepot = false
                end
            })

            if (Properties.admin.entrepot == true) then
                RageUI.Button('Place dans l\'entrepôt (poid)', nil, {RightLabel = Properties.admin.pound ~= nil and ('%sKg'):format(Properties.admin.pound) or '~r~Indéfini~s~'}, true, {
                    onSelected = function()
                        KeyboardUtils.use('Définir un poid', function(data)
                            local data = tonumber(data)

                            if data == nil then return end

                            Properties.admin.pound = data
                        end)
                    end
                })
            end
        
            RageUI.Checkbox('Garage', nil, Properties.admin.Menu.action.garage, {}, {
                onChecked = function()
                    Properties.admin.Menu.action.garage = true
                    for k,v in pairs(Properties.garage.interior) do
                        Properties.admin.visitmodeGarage[k] = {active = false, name = nil, interior = nil}
                    end
                end,
                onUnChecked = function()
                    Properties.admin.Menu.action.garage = false
                end
            })
        
            if (Properties.admin.Menu.action.garage == true) then
                RageUI.Button('Paramètres du garage', nil, {}, true, {
                    onSelected = function()
                        
                    end
                }, Garage)
            end

            RageUI.Button('Confirmer', nil, {}, true, {
                onSelected = function()
                    if Properties.admin.name == nil or Properties.admin.trunk == nil or Properties.admin.label == nil or Properties.admin.price == nil or Properties.admin.enter == nil or Properties.admin.exit == nil then return ESX.ShowNotification('❌ Tout les champs ne sont pas correctement complétés') end 

                    if Properties.admin.Menu.action.garage then
                        if Properties.admin.posGarage == nil or Properties.admin.posGarageSpawn == nil or Properties.admin.rotGarageSpawn == nil or Properties.Lastplayerpos2 == nil then return ESX.ShowNotification('❌ Tout les champs ne sont pas correctement complétés') end 
                    end

                    if Properties.admin.entrepot == true then
                        if Properties.admin.pound == nil then return ESX.ShowNotification('❌ Tout les champs ne sont pas correctement complétés') end 
                    end

                    KeyboardUtils.use('Taper Y pour valider', function(data)
                        if data == 'y' or data == 'Y' then
                            if Properties.admin.visitmode then
                                SetEntityCoords(PlayerPedId(), Properties.Lastplayerpos)
                            end

                            if Properties.admin.Menu.action.garage then
                                SetEntityCoords(PlayerPedId(), Properties.Lastplayerpos2)
                            end

                            local data = {}

                            data = {
                                 name = Properties.garageSelected,
                            }
                            TriggerServerEvent('zmain:properties:createProperties', Properties.admin.name, Properties.admin.label, Properties.admin.price, Properties.admin.enter, Properties.admin.exit, Properties.admin.Menu.action.garage, Properties.admin.posGarage, Properties.admin.posGarageSpawn, Properties.admin.rotGarageSpawn, data.name, Properties.admin.typeData, Properties.admin.trunk, Properties.admin.logementType, Properties.admin.current_zone, Properties.admin.entrepot, Properties.admin.pound)
                        end
                    end)
                end
            })
        end)

        RageUI.IsVisible(Garage, function()
            local PlayerCoords = GetEntityCoords(PlayerPedId())

            RageUI.Button('Position', nil, {RightLabel = Properties.admin.posGarage or '~r~Indéfini'}, true, {
                onSelected = function()
                    Properties.admin.posGarage = GetEntityCoords(PlayerPedId())
                end,
                onActive = function()
                    DrawMarker(25, PlayerCoords.x, PlayerCoords.y, PlayerCoords.z-0.98, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.55, 0.55, 0.55, 240, 255, 0, 255, false, false, 2, false, false, false, false)
                    DrawInstructionBarNotification(PlayerCoords.x, PlayerCoords.y, PlayerCoords.z, 'Position du garage')
                end
            })

            RageUI.Button('Spawn', nil, {RightLabel = Properties.admin.posGarageSpawn or'~r~Indéfini'}, true, {
                onSelected = function()
                    Properties.admin.posGarageSpawn = GetEntityCoords(PlayerPedId())
                end,
                onActive = function()
                    DrawMarker(25, PlayerCoords.x, PlayerCoords.y, PlayerCoords.z-0.98, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.55, 0.55, 0.55, 240, 255, 0, 255, false, false, 2, false, false, false, false)
                    DrawInstructionBarNotification(PlayerCoords.x, PlayerCoords.y, PlayerCoords.z, 'Position du spawn')
                end
            })

            RageUI.Button('Rotation', nil, {RightLabel = Properties.admin.rotGarageSpawn or '~r~Indéfini'}, true, {
                onSelected = function()
                    Properties.admin.rotGarageSpawn = GetEntityHeading(PlayerPedId())
                end,
            })
            RageUI.WLine()
            for k,v in pairs(Properties.garage.interior) do
                RageUI.Checkbox(v.label, nil, Properties.admin.visitmodeGarage[k].active, {}, {
                    onChecked = function()
                        if Properties.admin.visitmode then return ESX.ShowNotification('❌ Vous êtes déjà en mode visite') end
                        for k,v in pairs(Properties.garage.interior) do
                            Properties.admin.visitmodeGarage[k] = {active = false, name = nil, interior = nil}
                        end
                        Properties.admin.visitmodeGarage[k] = {active = true, name = k, interior = v.interior}
                        Properties.garageSelected = k

                        local ped = PlayerPedId()

                        if Properties.Lastplayerpos2 == nil then
                            Properties.Lastplayerpos2 = GetEntityCoords(ped)
                        end
                        SetEntityCoords(ped, v.interior)
                    end,
                    onUnChecked = function()
                        if Properties.admin.visitmode then return ESX.ShowNotification('❌ Vous êtes déjà en mode visite') end
                        for k,v in pairs(Properties.garage.interior) do
                            Properties.admin.visitmodeGarage[k] = {active = false, name = nil, interior = nil}
                        end
                        Properties.admin.visitmodeGarage[k] = {active = false, name = nil, interior = nil}

                        SetEntityCoords(PlayerPedId(), Properties.Lastplayerpos2)
                    end
                })
            end
        end)

        RageUI.IsVisible(propertiesAttribut, function()
            for k,v in pairs(Properties.PropertiesList) do
                RageUI.List(('%s #%s %s'):format(v.label, v.id, v.owner == 'none' and '~g~Libre' or '~r~Occupé'), Properties.job.PropertiesListIndexData, Properties.job.PropertiesListIndex, nil, {}, true, {
                    onListChange = function(Index)
                        Properties.job.PropertiesListIndex = Index
                    end,
                    onSelected = function()
                        if Properties.job.PropertiesListIndex == 1 then
                            Properties.job.SelectedProperties = {
                                id = v.id,
                                name = v.name,
                                label = v.label,
                                owner = v.owner,
                                ownerName = v.ownerName,
                                price = v.price,
                                enter = v.enter,
                                exit = v.exit,
                                trunkPos = v.trunkPos,
                                garage = v.garage,
                                garagePos = v.garagePos,
                                garageSpawn = v.garageSpawn,
                                garageRotation = v.garageRotation,
                                garageType = v.garageType,
                                players = v.players,
                                type = v.type,
                                logementType = v.logementType
                            }
                            RageUI.Visible(propertiesAttributGestion, true)
                        elseif Properties.job.PropertiesListIndex == 2 then
                            if v.owner == 'none' then return ESX.ShowNotification('Vous ne pouvez pas dissourdre se logement') end

                            TriggerServerEvent('zmain:properties:disouLogement', v.id)
                        elseif Properties.job.PropertiesListIndex == 3 then
                            if v.owner ~= 'none' then return ESX.ShowNotification('Vous ne pouvez pas supprimer se logement') end

                            TriggerServerEvent('zmain:properties:delete', tonumber(v.id))
                        elseif Properties.job.PropertiesListIndex == 4 then
                            Properties.job.SelectedProperties = {
                                id = v.id,
                                name = v.name,
                                label = v.label,
                                owner = v.owner,
                                ownerName = v.ownerName,
                                price = v.price,
                                enter = v.enter,
                                exit = v.exit,
                                trunkPos = v.trunkPos,
                                garage = v.garage,
                                garagePos = v.garagePos,
                                garageSpawn = v.garageSpawn,
                                garageRotation = v.garageRotation,
                                garageType = v.garageType,
                                players = v.players,
                                type = v.type,
                                logementType = v.logementType
                            }

                            RageUI.Visible(editProperty, true)
                        end
                    end
                })
            end
        end)

        RageUI.IsVisible(editProperty, function()
            if json.encode(Properties.job.SelectedProperties) ~= '[]' then
                RageUI.Separator(('~y~Gestion de la Propriété~s~ [%s]'):format(Properties.job.SelectedProperties.label))
                RageUI.Button('Changer le nom', nil, {}, true, {
                    onSelected = function()
                        KeyboardUtils.use('Nouveau Nom', function(data)
                            if data == nil or data == '' then return end
    
                            Properties.job.SelectedProperties.name = data
                            Properties.PropertiesList[Properties.job.SelectedProperties.id].name = data
    
                            TriggerServerEvent('zmain:properties:edit', Properties.job.SelectedProperties)
                        end)
                    end
                })
                RageUI.Button('Changer le label', nil, {}, true, {
                    onSelected = function()
                        KeyboardUtils.use('Nouveau Label', function(data)
                            if data == nil or data == '' then return end
    
                            Properties.job.SelectedProperties.label = data
                            Properties.PropertiesList[Properties.job.SelectedProperties.id].label = data
    
                            TriggerServerEvent('zmain:properties:edit', Properties.job.SelectedProperties)
                        end)
                    end
                })
            end
        end)

        RageUI.IsVisible(propertiesAttributGestion, function()
            RageUI.Separator(('%s (~y~%s~s~)'):format(Properties.job.SelectedProperties.name, Properties.job.SelectedProperties.label))
            RageUI.Separator(('Status: ~y~%s~s~'):format(Properties.job.SelectedProperties.owner == 'none' and '~g~Libre' or '~r~Occupé'))
            RageUI.Separator(('Prix: ~y~%s$~s~'):format(Properties.job.SelectedProperties.price))
            RageUI.Separator(('Type: ~y~%s~s~'):format(Properties.job.SelectedProperties.type == 'location' and 'Location' or 'Achat'))
            RageUI.Separator(('Type de logement: ~y~%s~s~'):format(Properties.job.SelectedProperties.logementType))
            if Properties.job.SelectedProperties.owner ~= 'none' then
                RageUI.Separator(('Propriétaire: ~y~%s~s~'):format(Properties.job.SelectedProperties.ownerName))
            end
            if type ~= 'f6' then
                if type == 'location' then
                    RageUI.Button('Temps de location (heure)', nil, {}, true, {
                        onSelected = function()
                            KeyboardUtils.use('Temps de location (heure)', function(data)
                                local data = tonumber(data)
                                if data == nil or data <= 0 then return end

                                Properties.job.time = data
                            end)
                        end
                    })
                end
                RageUI.List('Type de paiement', Properties.job.PropertiesListIndexDataPaid,  Properties.job.PropertiesListIndexPaid, nil, {}, true, {
                    onListChange = function(Index)
                        Properties.job.PropertiesListIndexPaid = Index
                    end,
                })
                RageUI.Button(('Attribuer le logement'):format(type == 'location' and Properties.job.time..' heures(s)' or ''), nil, {}, true, {
                    onSelected = function()
                        if Properties.job.SelectedProperties.owner ~= 'none' then return ESX.ShowNotification('🏢 Le logement est déjà pris !') end
                        local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                        if closestDistance == -1 or closestDistance > 3 then
                            return ESX.ShowNotification('👩 Personne aux allentours !')
                        end

                        KeyboardUtils.use('Taper Y pour valider', function(data)
                            if data == 'Y' or data == 'y' then
                                local paid = {
                                    [1] = 'cash',
                                    [2] = 'bank'
                                }
                                TriggerServerEvent('zmain:properties:job:addPropertiesForPlayer', GetPlayerServerId(closestPlayer), Properties.job.SelectedProperties.price, Properties.job.SelectedProperties.id, paid[Properties.job.PropertiesListIndexPaid], Properties.job.time or 0)
                            end
                        end)
                    end
                })
            end
            if type == 'f6' then
                
            end
        end)
    
        if not RageUI.Visible(main) and not RageUI.Visible(createProperties) and not RageUI.Visible(propertiesAttribut) and not RageUI.Visible(propertiesAttributGestion) and not RageUI.Visible(Garage) and not RageUI.Visible(editProperty) then
            main = RMenu:DeleteType('main')
            if type ~= 'f6' then
                FreezeEntityPosition(PlayerPedId(), false)
            end
        end
    end
end

RegisterCommand('job_properties', function()
    if ESX.PlayerData.job.name ~= 'realestateagent' then return end

    Properties:openArcadiusMenu('f6')
end)
RegisterKeyMapping('job_properties', 'Menu arcadius', 'keyboard', 'F6')

RegisterNetEvent('zmain:properties:visitMod', function(pos)
    local ped = PlayerPedId()
    Properties.Lastplayerpos = GetEntityCoords(ped)
    SetEntityCoords(ped, pos)
end)

RegisterNetEvent('zmain:properties:stopvisit', function()
    SetEntityCoords(PlayerPedId(), Properties.Lastplayerpos)
end)

function Properties:openBossMenu()
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
            RageUI.WLine()
            RageUI.Button('Déposer de l\'argent', 'Argent en banque', {}, true, {
                onSelected = function()
                    KeyboardUtils.use('Montant à déposer', function(data)
                        local data = tonumber(data)
                        if data == nil then return end

                        TriggerServerEvent('zmain:properties:moneyBoss', ('society_%s'):format("realestateagent"), data, 'deposit')
                    end)
                end
            })
            RageUI.Button('Prendre de l\'argent', 'Argent du coffre', {}, true, {
                onSelected = function()
                    KeyboardUtils.use('Montant à prendre', function(data)
                        local data = tonumber(data)
                        if data == nil then return end

                        TriggerServerEvent('zmain:properties:moneyBoss', ('society_%s'):format("realestateagent"), data, 'remove')
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

AddEventHandler('zmain:properties:job:service', function()
    while not Properties.job.Service do Wait(1) end

    local interval = 1
    while Properties.job.Service do 
        Wait(interval)
        interval = 2000

        local playerCoords = GetEntityCoords(PlayerPedId())
        local coords = vector3(-125.8539, -640.8022, 168.8203)
        local coords2 = vector3(-130.1117, -633.6653, 168.8203)
        local dist = #(playerCoords-coords)
        local dist2 = #(playerCoords-coords2)

        if dist > 30 and dist2 > 30 then goto continue end

        interval = 1

        DrawMarker(25, coords.x, coords.y, coords.z-0.98, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.55, 0.55, 0.55, tonumber(UTILS.ServerColor.r), tonumber(UTILS.ServerColor.g), tonumber(UTILS.ServerColor.b), 255, false, false, 2, false, false, false, false)
        -- DrawMarker(25, coords2.x, coords2.y, coords2.z-0.98, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.55, 0.55, 0.55, tonumber(UTILS.ServerColor.r), tonumber(UTILS.ServerColor.g), tonumber(UTILS.ServerColor.b), 255, false, false, 2, false, false, false, false)
    
        if dist <= 1 then
            DrawInstructionBarNotification(coords.x, coords.y, coords.z, "Appuyez sur [ ~g~E~w~ ] pour intéragir")
            if IsControlJustPressed(0, 54) then
                Properties:openArcadiusMenu(nil)
            end
        end

        -- if dist2 <= 1 then
        --     DrawInstructionBarNotification(coords2.x, coords2.y, coords2.z, "Appuyez sur [ ~g~E~w~ ] pour intéragir")
        --     if IsControlJustPressed(0, 54) then
        --         Properties:openBossMenu()
        --     end
        -- end

        ::continue::

        if not Properties.job.Service then
            break
        end
    end
end)