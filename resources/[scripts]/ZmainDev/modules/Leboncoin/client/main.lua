local Leboncoin = {
    Vehicles = {},
    Items = {},
    Weapons = {},
    
    SellProduct = {
        Type = nil,

        VehiclesList = {},
        VehiclesListSelected = {},

        Annonce = {
            Title = nil,
            Description = nil,
            Prix = nil,

            Data = {}
        }
    }
}

function Leboncoin:openMenu()
    local main = RageUI.CreateMenu('', 'Leboncoin')

    local sellProduct = RageUI.CreateSubMenu(main, '', 'Vendre un produit')

    local sellProductWithCategorie = RageUI.CreateSubMenu(sellProduct, '', 'Vendre un produit')
    local sellProductWithCategorieSelect = RageUI.CreateSubMenu(sellProductWithCategorie, '', 'Vendre un produit')


    local getVehicleList = RageUI.CreateSubMenu(main, '', 'Véhicules mis en vente')
    local getItemsList = RageUI.CreateSubMenu(main, '', 'Items mis en vente')

    RageUI.Visible(main, not RageUI.Visible(main))
    FreezeEntityPosition(PlayerPedId(), true)
    while main do Wait(1)
        RageUI.IsVisible(main, function()
            RageUI.Button('Vendre un produit', nil, {}, true, {
                onSelected = function()
                end
            }, sellProduct)
            RageUI.Line()
            RageUI.Button('Véhicule(s)', nil, {}, true, {
                onSelected = function()
                    ESX.TriggerServerCallback('zmain:leboncoin:getSellVehicleList', function(cb)
                        Leboncoin.Vehicles = cb
                    end)
                end
            }, getVehicleList)
            RageUI.Button('Item(s)', nil, {}, true, {
                onSelected = function()
                    ESX.TriggerServerCallback('zmain:leboncoin:getItemsList', function(cb)
                        Leboncoin.Items = cb
                    end)
                end
            }, getItemsList)
        end)

        RageUI.IsVisible(sellProduct, function()
            RageUI.Line()
            RageUI.Button('Véhicule(s)', nil, {}, true, {
                onSelected = function()
                    ESX.TriggerServerCallback('zmain:leboncoin:getVehicleList', function(cb)
                        Leboncoin.SellProduct.VehiclesList = cb
                        Leboncoin.SellProduct.Type = 'vehicle'

                        RageUI.Visible(sellProductWithCategorie, true)
                    end)
                end
            })
            RageUI.Button('Item(s)', nil, {}, true, {
                onSelected = function()
                    Leboncoin.SellProduct.Type = 'item'
                end
            }, sellProductWithCategorie)
            RageUI.Line()
        end)

        RageUI.IsVisible(sellProductWithCategorie, function()
            if Leboncoin.SellProduct.Type == 'vehicle' then
                for k,v in pairs(Leboncoin.SellProduct.VehiclesList) do
                    if v.boutique == 1 or v.boutique == true then return end

                    RageUI.Button(('%s [%s]'):format(v.label, v.plate), nil, {}, true, {
                        onSelected = function()
                            Leboncoin.SellProduct.VehiclesListSelected = v
                        end
                    }, sellProductWithCategorieSelect)

                    ::continue::
                end
            elseif Leboncoin.SellProduct.Type == 'item' then
                ESX.PlayerData.inventory = ESX.GetPlayerData().inventory

                for k,v in pairs(ESX.PlayerData.inventory) do
                    RageUI.Button(v.label, nil, {RightLabel = ('~y~x%s~s~'):format(v.count)}, true, {
                        onSelected = function()
                            Leboncoin.SellProduct.VehiclesListSelected = v
                        end
                    }, sellProductWithCategorieSelect)
                end
            end
        end)

        RageUI.IsVisible(sellProductWithCategorieSelect, function()
            if Leboncoin.SellProduct.Type == 'vehicle' then
                RageUI.Separator(('Plaque [%s]'):format(Leboncoin.SellProduct.VehiclesListSelected.plate))
                RageUI.Separator(('Label [%s]'):format(Leboncoin.SellProduct.VehiclesListSelected.label))
                RageUI.Line()
                RageUI.Button('Titre de l\'annonce', nil, {}, true, {
                    onSelected = function()
                        KeyboardUtils.use('Titre', function(data)
                            if data == nil or data == '' then return end
    
                            Leboncoin.SellProduct.Annonce.Title = data
                        end)
                    end
                })
                RageUI.Button('Descriptif de l\'annonce', nil, {}, true, {
                    onSelected = function()
                        KeyboardUtils.use('Descriptif', function(data)
                            if data == nil or data == '' then return end
    
                            Leboncoin.SellProduct.Annonce.Description = data
                        end)
                    end
                })
                RageUI.Button('Prix du véhicule', nil, {}, true, {
                    onSelected = function()
                        KeyboardUtils.use('Prix', function(data)
                            local data = tonumber(data)
                            if data == nil then return end
    
                            Leboncoin.SellProduct.Annonce.Prix = data
                        end)
                    end
                })
                RageUI.Button('Confirmer', nil, {Color = {BackgroundColor = {0,255,0, 100}}}, true, {
                    onSelected = function()
                        if Leboncoin.SellProduct.Annonce.Title == nil or Leboncoin.SellProduct.Annonce.Description == nil or Leboncoin.SellProduct.Annonce.Prix == nil then return ESX.ShowNotification('Toutes les informations ne sont pas correctement remplies') end

                        TriggerServerEvent('zmain:leboncoin:sendAnnonce:vehicle', Leboncoin.SellProduct.Annonce.Title, Leboncoin.SellProduct.Annonce.Description, Leboncoin.SellProduct.Annonce.Prix, Leboncoin.SellProduct.VehiclesListSelected)
                    end
                })
            elseif Leboncoin.SellProduct.Type == 'item' then
                RageUI.Separator(('Nom [%s]'):format(Leboncoin.SellProduct.VehiclesListSelected.name))
                RageUI.Separator(('Label [%s]'):format(Leboncoin.SellProduct.VehiclesListSelected.label))
                RageUI.Line()
                RageUI.Button('Titre de l\'annonce', nil, {}, true, {
                    onSelected = function()
                        KeyboardUtils.use('Titre', function(data)
                            if data == nil or data == '' then return end
    
                            Leboncoin.SellProduct.Annonce.Title = data
                        end)
                    end
                })
                RageUI.Button('Descriptif de l\'annonce', nil, {}, true, {
                    onSelected = function()
                        KeyboardUtils.use('Descriptif', function(data)
                            if data == nil or data == '' then return end
    
                            Leboncoin.SellProduct.Annonce.Description = data
                        end)
                    end
                })
                RageUI.Button('Prix de l\'item', nil, {}, true, {
                    onSelected = function()
                        KeyboardUtils.use('Prix', function(data)
                            local data = tonumber(data)
                            if data == nil then return end
    
                            Leboncoin.SellProduct.Annonce.Prix = data
                        end)
                    end
                })
                RageUI.Button('Quantité', nil, {}, true, {
                    onSelected = function()
                        KeyboardUtils.use('Quantité', function(data)
                            local data = tonumber(data)
                            if data == nil then return end
        
                            if Leboncoin.SellProduct.VehiclesListSelected.count < data then return ESX.ShowNotification('Vous n\'en possédez pas asser') end

                            Leboncoin.SellProduct.Annonce.Quantity = data
                        end)
                    end
                })
                RageUI.Button('Confirmer', nil, {Color = {BackgroundColor = {0,255,0, 100}}}, true, {
                    onSelected = function()
                        if Leboncoin.SellProduct.Annonce.Title == nil or Leboncoin.SellProduct.Annonce.Description == nil or Leboncoin.SellProduct.Annonce.Prix == nil then return ESX.ShowNotification('Toutes les informations ne sont pas correctement remplies') end

                        TriggerServerEvent('zmain:leboncoin:sendAnnonce:item', Leboncoin.SellProduct.Annonce.Title, Leboncoin.SellProduct.Annonce.Description, Leboncoin.SellProduct.Annonce.Prix, Leboncoin.SellProduct.VehiclesListSelected, Leboncoin.SellProduct.Annonce)
                    end
                })
            end
        end)

        RageUI.IsVisible(getVehicleList, function()
            for k,v in pairs(Leboncoin.Vehicles) do
                local vehicle = json.decode(v.properties)
                RageUI.Button(('%s - %s [%s]'):format(v.title, vehicle.model, vehicle.plate), nil, {RightLabel = ('~g~%s$~s~'):format(v.price)}, true, {
                    onSelected = function()
                        local vehPlate = json.decode(v.properties)
                        if v.owner == ESX.PlayerData.UniqueID then
                            KeyboardUtils.use('')
                        else
                            KeyboardUtils.use('Taper Y pour valider', function(data)
                                if data == 'y' or data == 'Y' then
                                    TriggerServerEvent('zmain:leboncoin:paid', 'vehicle', v, vehPlate.plate)
                                end
                            end) 
                        end
                    end
                })
            end
        end)

        RageUI.IsVisible(getItemsList, function()
            for k,v in pairs(Leboncoin.Items) do
                RageUI.Button(('%s - [%s] x%s'):format(v.title, v.properties, v.data), nil, {RightLabel = ('~g~%s$~s~'):format(v.price)}, true, {
                    onSelected = function()
                        KeyboardUtils.use('Taper Y pour valider', function(data)
                            if data == 'y' or data == 'Y' then
                                TriggerServerEvent('zmain:leboncoin:paidItem', v)

                                RageUI.GoBack()
                            end
                        end)                    
                    end
                })
            end
        end)

        if not RageUI.Visible(main) and not RageUI.Visible(sellProduct) and not RageUI.Visible(sellProductWithCategorie) and not RageUI.Visible(sellProductWithCategorieSelect) and not RageUI.Visible(getVehicleList) and not RageUI.Visible(getItemsList) then
            main = RMenu:DeleteType('main')
            FreezeEntityPosition(PlayerPedId(), false)
        end
    end
end

RegisterNetEvent('zmain:leboncoin:addAnnonce', function(type, v)
    if type == 'vehicle' then
        table.insert(Leboncoin.vehicles, v)
    elseif type == 'item' then
        table.insert(Leboncoin.items, v)
    end
end)

RegisterNetEvent('zmain:leboncoin:removeAnnonce', function(type, v)
    if type == 'vehicle' then
        for k,v in pairs(Leboncoin.Vehicles) do
            if v.id == v.id then
                table.remove(Leboncoin.Vehicles, k)
            end
        end
    end
end)

CreateThread(function()
    AddZones('leboncoin', {
        Position = vector3(68.82393, 126.9466, 79.2029),
        Dist = 10,
        Public = true,
        Job = nil,
        Job2 = nil,
        GradesJob = {},
        InVehicleDisable = true,
        marker = true,
        Blip = {
            Active = true,
            Position = vector3(68.82393, 126.9466, 79.2029),
            BlipId = 268,
            Color = 81,
            Scale = 0.6,
            Text = '[SERVICE] Leboncoin'
        },
        ActionText = 'Appuyez sur [ ~g~E~w~ ] pour intéragir',
        Action = function()
            Leboncoin:openMenu()
        end
    })
end)