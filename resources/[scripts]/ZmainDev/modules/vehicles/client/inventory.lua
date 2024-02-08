vehicleInventory = {
    RegisteredVehicle = {},

    open = false,

    List = {'Prendre', 'Déposer'},
    Index = 1,
}

function shouldSkipWeapon(weaponName)
    for index, value in ipairs(Config.VehicleInventory.BlackListWeaponLSPD) do
        if value == weaponName and ESX.GetPlayerData().job.name ~= 'police' then
            return true
        end
    end

    return false
end

function vehicleInventory:open(plate)
    local main = RageUI.CreateMenu('', 'Actions Disponibles')

    local inventoryItems = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')
    local inventoryWeapons = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')

    local playerInventory = RageUI.CreateSubMenu(inventoryItems, '', 'Actions Disponibles')
    local playerLoadout = RageUI.CreateSubMenu(inventoryWeapons, '', 'Actions Disponibles')

    RageUI.Visible(main, not RageUI.Visible(main))
    FreezeEntityPosition(Player.playerPed, true)

    while main do Wait(1)
        RageUI.IsVisible(main, function()
            inventoryData = vehicleInventory.RegisteredVehicle[plate]

            if inventoryData ~= nil then
                
                RageUI.Separator(('Plaque [%s]'):format(GetVehicleNumberPlateText(Player.closestVehicle)))
                RageUI.Separator(('Poids ~y~%s/%s KG~s~'):format(inventoryData.pound, inventoryData.vehiclePound))
                RageUI.List(('Argent propre ~g~%s$~s~'):format(inventoryData['accounts'].cash), vehicleInventory.List, vehicleInventory.Index, nil, {}, true, {
                    onListChange = function(Index)
                        vehicleInventory.Index = Index
                    end,
                    onSelected = function(Index)
                        if Index == 1 then
                            KeyboardUtils.use('Quantité à prendre', function(data)
                                local data = tonumber(data)
                                if data == nil then return end
                                
                                if inventoryData['accounts'].cash < data then return ESX.ShowNotification('Il n\'y en a pas asser') end

                                TriggerServerEvent('zmain:vehicles:inventory:actionsMoney', plate, 'remove', 'cash', inventoryData['accounts'].cash, data)
                            end)
                        elseif Index == 2 then
                            KeyboardUtils.use('Quantité à déposer', function(data)
                                local data = tonumber(data)
                                if data == nil then return end
                            
                                TriggerServerEvent('zmain:vehicles:inventory:actionsMoney', plate, 'deposit', 'cash', inventoryData['accounts'].cash, data)
                            end)
                        end
                    end
                })
                RageUI.List(('Argent sale ~r~%s$~s~'):format(inventoryData['accounts'].black_money), vehicleInventory.List, vehicleInventory.Index, nil, {}, true, {
                    onListChange = function(Index)
                        vehicleInventory.Index = Index
                    end,
                    onSelected = function(Index)
                        if Index == 1 then
                            KeyboardUtils.use('Quantité à prendre', function(data)
                                local data = tonumber(data)
                                if data == nil then return end
                                
                                if inventoryData['accounts'].black_money < data then return ESX.ShowNotification('Il n\'y en a pas asser') end

                                TriggerServerEvent('zmain:vehicles:inventory:actionsMoney', plate, 'remove', 'black_money', inventoryData['accounts'].black_money, data)
                            end)
                        elseif Index == 2 then
                            KeyboardUtils.use('Quantité à déposer', function(data)
                                local data = tonumber(data)
                                if data == nil then return end
                                
                                TriggerServerEvent('zmain:vehicles:inventory:actionsMoney', plate, 'deposit', 'black_money', inventoryData['accounts'].black_money, data)
                            end)
                        end
                    end
                })

                RageUI.WLine()

                RageUI.Button('Item(s)', nil, {}, true, {
                    onSelected = function()

                    end
                }, inventoryItems)
                RageUI.Button('Arme(s)', nil, {}, true, {
                    onSelected = function()
                        
                    end
                }, inventoryWeapons)

            end
        end)

        RageUI.IsVisible(inventoryItems, function()
            inventoryData = vehicleInventory.RegisteredVehicle[plate]
            RageUI.Button('Déposer un item', nil, {}, true, {
                onSelected = function()
                    
                end
            }, playerInventory)
            RageUI.WLine()
            for k,v in pairs(inventoryData['items']) do
                RageUI.Button(('%s [~y~x%s~s~]'):format(v.label, v.count), nil, {RightLabel = '>>'}, true, {
                    onSelected = function()
                        KeyboardUtils.use('Quantité', function(data)
                            local data = tonumber(data)
                            if data == nil then return end

                            if v.count < data then return ESX.ShowNotification('Il n\'y en a pas asser dans le coffre') end

                            TriggerServerEvent('zmain:vehicles:inventory:removeItem', plate, v, data)
                        end)
                    end
                })
            end
        end)

        RageUI.IsVisible(playerInventory, function()
            Player.inventory = ESX.GetPlayerData().inventory
            for k,v in pairs(Player.inventory) do
                RageUI.Button(('%s [~y~x%s~s~]'):format(v.label, v.count), nil, {RightLabel = '>>'}, true, {
                    onSelected = function()
                        KeyboardUtils.use('Quantité', function(data)
                            local data = tonumber(data)
                            if data == nil then return end

                            if v.count < data then return ESX.ShowNotification('Vous n\'en possedez pas asser') end

                            TriggerServerEvent('zmain:vehicles:inventory:depositItem', plate, v, data)
                        end)
                    end
                })
            end
        end)

        RageUI.IsVisible(inventoryWeapons, function()
            inventoryData = vehicleInventory.RegisteredVehicle[plate]
            RageUI.Button('Déposer une arme', nil, {}, true, {
                onSelected = function()
                    
                end
            }, playerLoadout)
            RageUI.WLine()
            for k,v in pairs(inventoryData['weapons']) do
                RageUI.Button(('%s [~r~%s~s~]'):format(v.label, v.ammo), nil, {RightLabel = '>>'}, true, {
                    onSelected = function()
                        if shouldSkipWeapon(v.name) then return end
                        KeyboardUtils.use('Taper Y pour valider', function(data)
                            if data == 'y' or data == 'Y' then
                               TriggerServerEvent('zmain:vehicles:inventory:removeWeapon', plate, v, k) 
                            end
                        end)
                    end
                })
            end
        end)

        RageUI.IsVisible(playerLoadout, function()
            Player.loadout = ESX.GetPlayerData().loadout
            for k,v in pairs(Player.loadout) do
                RageUI.Button(('%s [~r~%s~s~]'):format(v.label, v.ammo), nil, {RightLabel = '>>'}, true, {
                    onSelected = function()
                        if shouldSkipWeapon(v.name) then 
                            ESX.ShowNotification('Vous ne pouvez pas déposer ce type d\'arme')
                            return
                         end
                        KeyboardUtils.use('Taper Y pour valider', function(data)
                            if data == 'y' or data == ' Y' then
                                TriggerServerEvent('zmain:vehicles:inventory:addWeapon', plate, v)
                            end
                        end)
                    end
                })
            end
        end)

        if not RageUI.Visible(main) and not RageUI.Visible(inventoryItems) and not RageUI.Visible(inventoryWeapons) and not RageUI.Visible(playerInventory) and not RageUI.Visible(playerLoadout) then
            main = RMenu:DeleteType('main')
            FreezeEntityPosition(Player.playerPed, false)
        end
    end
end

RegisterNetEvent('recieveInformationVehicleInventory', function(plate, inventory)
    vehicleInventory.RegisteredVehicle[plate] = inventory
end)

RegisterNetEvent('zmain:vehicles:openIventory', function(plate, caca)
    if Player.isInVehicle then return ESX.ShowNotification('Vous devez être en dehors du véhicule') end
    if not vehicleInventory.RegisteredVehicle[plate] then
        ESX.TriggerServerCallback('zmain:vehicles:openInventory', function(cb)

        end, plate, GetVehicleClass(caca))
    end

    vehicleInventory:open(plate)
end)