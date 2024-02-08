local VehicleDealer = {
    data = {
        ['motodealer'] = {label = '[ENTREPRISE] Concessionnaire Moto', value = 'motorcycles', type = 'car'},
        ['cardealer'] = {label = '[ENTREPRISE] Concessionnaire Automobile', value = 'car', type = 'car'},
        ['boatdealer'] = {label = '[ENTREPRISE] Concessionnaire Bateau', value = 'boat', type = 'boat'},
        ['airdealer'] = {label = '[ENTREPRISE] Concessionnaire Aérien', value = 'aircraft', type = 'aircraft'}
    },

    position = {
        ['motodealer'] = {management = vector3(954.1971, -114.9671, 75.01183), actions = vector3(962.2963, -111.4393, 74.36366), spawn = vector3(959.999, -113.3829, 74.36362), heading = 224.58012390137, blips = {
            category = nil,
            position = vector3(971.4814, -123.0409, 74.35313),
            sprite = 348,
            display = 4,
            scale = 0.6,
            color = 0,
        }},
        ['cardealer'] = {
            management = vector3(-788.9478, -215.9948, 37.07968), actions = vector3(-794.4836, -218.7551, 37.07964), spawn = vector3(-793.2391, -230.207, 37.07964), heading = 209.76875305176, blips = {
                category = nil,
                position = vector3(-793.2391, -230.207, 37.07964),
                sprite = 523,
                display = 4,
                scale = 0.6,
                color = 0,
            }
        },
        ['boatdealer'] = {
            management = vector3(-787.6028, -1350.234, 5.178339), actions = vector3(-848.4458, -1367.998, 1.60517), spawn = vector3(-860.4667, -1373.091, 2.600895), heading = 196.77575683594, blips = {
                category = nil,
                position = vector3(-811.447, -1349.703, 5.178345),
                sprite = 410,
                display = 4,
                scale = 0.6,
                color = 0,
            }
        },
        ['airdealer'] = {
            management = vector3(-900.6086, -2979.218, 19.8454), actions = vector3(-941.1509, -2954.363, 13.94509), spawn = vector3(-1017.146, -2973.552, 13.94877), heading = 58.533008575439, blips = {
                category = nil,
                position = vector3(-962.8713, -2989.817, 13.94509),
                sprite = 423,
                display = 4,
                scale = 0.6,
                color = 0,
            }
        },
        
    },

    CategorieList = {},
    VehicleListCategorieList = {},

    VehicleIndex = 1,
    VehicleIndexData = {'Sortir', 'Vendre le véhicule'},
    LastVehicle = nil,
    LastVehicle2 = nil,
    Price = 0,
    label = nil,
}

function VehicleDealer:openConcessMenu(job)
    local main = RageUI.CreateMenu('', 'Actions Disponibles')
    local categorieList = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')
    local vehicleListWithCategorie = RageUI.CreateSubMenu(categorieList, '', 'Actions Disponibles')

    vehicleListWithCategorie.Closed = function()
        DeleteEntity(VehicleDealer.LastVehicle)
    end

    RageUI.Visible(main, not RageUI.Visible(main))
    FreezeEntityPosition(PlayerPedId(), true)
    while main do Wait(1)
        RageUI.IsVisible(main, function()
            RageUI.Button('Liste des catégories', nil, {}, true, {
                onSelected = function()
                    ESX.TriggerServerCallback('zmain:vehicle_dealer:sendCategorieList', function(cb)
                        if cb then
                            VehicleDealer.CategorieList = cb

                            RageUI.Visible(categorieList, true)
                        end
                    end, VehicleDealer.data[job].value)
                end
            })
        end)

        RageUI.IsVisible(categorieList, function()
            for k,v in pairs(VehicleDealer.CategorieList) do
                RageUI.Button(('%s %s'):format('Catégorie', v.label), nil, {RightLabel = '>'}, true, {
                    onSelected = function()
                        ESX.TriggerServerCallback('zmain:vehicle_dealer:sendVehicleWithCategorie', function(cb)
                            if cb then
                                VehicleDealer.VehicleListCategorieList = cb
                                RageUI.Visible(vehicleListWithCategorie, true)
                            end
                        end, v.name)
                    end
                })
            end
        end)

        RageUI.IsVisible(vehicleListWithCategorie, function()
            for k,v in pairs(VehicleDealer.VehicleListCategorieList) do
                RageUI.List(('%s'):format(v.name), VehicleDealer.VehicleIndexData, VehicleDealer.VehicleIndex, nil, {}, true, {
                    onActive = function()
                        RageUI.Info('Informations Véhicule', {'Prix d\'usine', 'Prix à la vente'}, {('~y~%s$~s~'):format(ESX.Math.GroupDigits(v.price/100*100)), ('~y~%s$~s~'):format(ESX.Math.GroupDigits(v.price/100*135))})
                    end, 
                    onListChange = function(Index)
                        VehicleDealer.VehicleIndex = Index
                    end,
                    onSelected = function()
                        if VehicleDealer.VehicleIndex == 1 then
                            DeleteEntity(VehicleDealer.LastVehicle)

                            Wait(500)

                            if not ESX.Game.IsSpawnPointClear(VehicleDealer.position[job].spawn, 2) then
                                CreateThread(function()
                                    ESX.Game.DeleteVehicle(VehicleDealer.LastVehicle)
                                end)

                                return
                            end 

                            Wait(500)

                            ESX.Game.SpawnVehicle(v.model, VehicleDealer.position[job].spawn, VehicleDealer.position[job].heading, function(vehicle)
                                FreezeEntityPosition(vehicle, true)
                                SetVehicleColours(vehice, 255, 255)
                                VehicleDealer.LastVehicle = vehicle
                                VehicleDealer.LastVehicle2 = v.model
                                VehicleDealer.Price = tonumber(v.price)
                                VehicleDealer.label = v.name
                            end)
                        elseif VehicleDealer.VehicleIndex == 2 then
                            if VehicleDealer.LastVehicle == nil then return ESX.ShowNotification('Aucun véhicule de sortie') end
                            local player, distance = ESX.Game.GetClosestPlayer()
                            if distance == -1 or distance > 3 then return ESX.ShowNotification('Aucun joueur proche') end

                            ESX.ShowNotification('~g~Facture envoyée avec succès~s~')
                            
                                
                            ESX.TriggerServerCallback('zmain:vehicle_dealer:sendBill', function(cb)

                            end, v.price, v.price, GetPlayerServerId(player))
                        end
                    end
                })
            end
        end)

        if not RageUI.Visible(main) and not RageUI.Visible(categorieList) and not RageUI.Visible(vehicleListWithCategorie) then
            main = RMenu:DeleteType('main')
            FreezeEntityPosition(PlayerPedId(), false)
            DeleteEntity(VehicleDealer.LastVehicle)
        end
    end
end

RegisterNetEvent('zmain:vehicle_dealer:spawnVehicle', function(player)
    CreateThread(function()
        ESX.Game.DeleteVehicle(VehicleDealer.LastVehicle)

        TriggerServerEvent('zmain:admin:delVeh', VehicleDealer.LastVehicle)

        Wait(1000)

        VehicleDealer.LastVehicle = nil
        ESX.Game.SpawnVehicle(VehicleDealer.LastVehicle2, VehicleDealer.position[ESX.PlayerData.job.name].spawn, VehicleDealer.position[ESX.PlayerData.job.name].heading, function(vehicle)
            VehicleDealer.LastVehicle2 = nil

            local plate = GeneratePlate()
            local veh = ESX.Game.GetVehicleProperties(vehicle)
            veh.plate = plate
            SetVehicleNumberPlateText(vehicle, plate)

            local vehicleData = { 
                vehicle = veh,
                plate = veh.plate,
                label = VehicleDealer.label,
                price = VehicleDealer.Price,
                type = VehicleDealer.data[ESX.PlayerData.job.name].type
            }

            TriggerServerEvent('zmain:vehicle_dealer:sendVehicleKey', player, vehicleData)
        end)

        ESX.ShowNotification('💲 La personne a bien payé la ~g~facture~s~')
    end)
end)

function VehicleDealer:openBossMenu(job)
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

                        TriggerServerEvent('zmain:vehicle_dealer:moneyBoss', ('society_%s'):format(job), data, 'deposit')
                    end)
                end
            })
            RageUI.Button('Prendre de l\'argent', 'Argent du coffre', {}, true, {
                onSelected = function()
                    KeyboardUtils.use('Montant à prendre', function(data)
                        local data = tonumber(data)
                        if data == nil then return end

                        TriggerServerEvent('zmain:vehicle_dealer:moneyBoss', ('society_%s'):format(job), data, 'remove')
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

function VehicleDealer:openIntercationMenu(job)
    local main = RageUI.CreateMenu('', 'Actions Disponibles')

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
            RageUI.Button('Faire une facture', nil, {}, true, {
                onSelected = function()
                    local player, distance = ESX.Game.GetClosestPlayer()
                    if distance == -1 or distance > 3 then return ESX.ShowNotification('Personne aux alentours') end
                    KeyboardUtils.use('Montant', function(data)
                        local data = tonumber(data)

                        if data == nil then return end

                        TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(plater), ('scoeity_%s'):format(job), VehicleDealer.data[job].label, data)
                    end)
                end
            })
        end)

        if not RageUI.Visible(main) then
            main = RMenu:DeleteType('main')
        end
    end
end

CreateThread(function()
    while not ESXLoaded do Wait(1) end

    for k,v in pairs(VehicleDealer.data) do
        RegisterCommand(k, function()
            if ESX.PlayerData.job.name == k then
                VehicleDealer:openIntercationMenu(k)
            end
        end)

        RegisterKeyMapping(k, ('Menu Coness (%s)'):format(v.label),'keyboard', 'F6')

        AddZones(k, {
            Position = VehicleDealer.position[k].actions,
            Dist = 10,
            Public = false,
            Job = {[k] = true},
            Job2 = {},
            GradesJob = {},
            InVehicleDisable = true,
            Blip = {},
            ActionText = 'Appuyez sur [ ~g~E~w~ ] pour intéragir',
            Action = function()
                VehicleDealer:openConcessMenu(k)
            end
        })
        -- AddZones(k..'_boss', {
        --     Position = VehicleDealer.position[k].management,
        --     Dist = 10,
        --     Public = false,
        --     Job = {[k] = true},
        --     Job2 = {},
        --     GradesJob = {['boss'] = true},
        --     GradesJobRequire = true,
        --     InVehicleDisable = true,
        --     Blip = {},
        --     ActionText = 'Appuyez sur [ ~g~E~w~ ] pour intéragir',
        --     Action = function()
        --         VehicleDealer:openBossMenu(k)
        --     end
        -- })
    end

    for k,v in pairs(VehicleDealer.data) do
        if VehicleDealer.position[k] == nil then goto continue end

        ESX.addBlips({
            name = ("%s"):format(k),
            label = v.label,
            category = nil,
            position = VehicleDealer.position[k].blips.position,
            sprite = VehicleDealer.position[k].blips.sprite,
            display = VehicleDealer.position[k].blips.display,
            scale = VehicleDealer.position[k].blips.scale,
            color = VehicleDealer.position[k].blips.color,
        })

        ::continue::
    end
end)

RegisterNetEvent('zmain:vehicle_dealer:sendBill', function(vendeur, price2, price)
    ESX.ShowNotification(('Vous avez recus une facture (~y~%s$~s~)\n\n~g~E~s~ pour accepter\n~r~N~s~ pour refuser'):format(ESX.Math.GroupDigits(price/100*135)))

    CreateThread(function()
        local time = 20000
        while time > 0 do 
            Wait(1)

            if IsControlJustPressed(0, 54) then
                time = 0
                TriggerServerEvent('zmain:vehicle_dealer_paybill', vendeur, price, price2)
                break
            end

            if IsControlJustPressed(0, 306) then
                time = 0
                TriggerServerEvent('zmain:vehicle_dealer_refuseBill', vendeur)
                break
            end

            time -= 1

            if time <= 0 then
                break
            end
        end
    end)
end)