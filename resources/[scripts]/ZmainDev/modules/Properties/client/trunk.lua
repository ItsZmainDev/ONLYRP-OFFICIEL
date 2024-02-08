RegisterNetEvent('zmain:properties:trunk:refresh', function(propertiesID, k)
    Properties.PropertiesList[propertiesID].trunk = k
end)

local used = false

function Properties:openTrunkMenu(k)
    if Properties.PropertiesList[k].trunk['code'].active == true then
        Properties.PropertiesList[k].trunkUnLocked = false
    else
        Properties.PropertiesList[k].trunkUnLocked = true
    end
    Properties.PropertiesList[k].trunkUnLocked = false
    local main = RageUI.CreateMenu('', 'Actions Disponibles')
    local money = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')
    local items = RageUI.CreateSubMenu(main, '', 'Actions Disponibles') 
    local playerInventory = RageUI.CreateSubMenu(items, '', 'Actions Disponibles')
    local weapons = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')
    local playerWeapons = RageUI.CreateSubMenu(weapons, '', 'Actions Disponibles')
    local codeOptions = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')
    main.Closed = function()
        FreezeEntityPosition(PlayerPedId(), false)
    end
    RageUI.Visible(main, not RageUI.Visible(main))
    FreezeEntityPosition(PlayerPedId(), true)
    while main do Wait(1)
        RageUI.IsVisible(main, function()
            if Properties:ReturnPropertiesData(k).type == 'location' and Properties:ReturnPropertiesData(k).time <= 0 then 
                RageUI.Separator('Erreur\nCette location n\'éxiste plus !')
                goto continue
            end
            if Properties:ReturnPropertiesData(k).coffreOpen == false and Properties:ReturnPropertiesData(k).owner ~= tostring(ESX.PlayerData.UniqueID) then
                RageUI.Separator('Le coffre est vérouillé')
                goto continue
            end
            if Properties.PropertiesList[k].trunk['code'].active == false then
                RageUI.Button('Entrer un code', nil, {}, true, {
                    onSelected = function()
                        KeyboardUtils.use('Taper le CODE', function(data)
                            if data == nil then return end
                            Properties.PropertiesList[k].trunk['code'].active = true
                            Properties.PropertiesList[k].trunk['code'].code = data
                            TriggerServerEvent('zmain:properties:trunk:updateCode', k, Properties.PropertiesList[k].trunk['code'])
                        end)
                    end
                })
                RageUI.Button('Ne pas utiliser de code', nil, {}, true, {
                    onSelected = function()
                        KeyboardUtils.use('Taper Y pour valider', function(data)
                            if data == 'y' or data == 'Y' then
                                Properties.PropertiesList[k].trunk['code'].active = 'none'
                                TriggerServerEvent('zmain:properties:trunk:updateCode', k, Properties.PropertiesList[k].trunk['code'])
                            end
                        end)
                    end
                })
                goto continue
            end

            if Properties.PropertiesList[k].trunkUnLocked == false and Properties.PropertiesList[k].trunk['code'].active == true and Properties.PropertiesList[k].trunk['code'].blocked == false then
                RageUI.Button('Entrer le code du coffre', nil, {}, true, {
                    onSelected = function()
                        KeyboardUtils.use('Taper le code du coffre', function(data)
                            if Properties.PropertiesList[k].trunk['code'].code ~= data then
                                if not used then
                                    Properties.PropertiesList[k].trunkUnLockedCount = 3
                                end
                                used = true
                                Properties.PropertiesList[k].trunkUnLockedCount -= 1
                                ESX.ShowNotification(('Mauvais code il te reste %s essai(s)'):format(Properties.PropertiesList[k].trunkUnLockedCount))

                                if Properties.PropertiesList[k].trunkUnLockedCount <= 0 then
                                    Properties.PropertiesList[k].trunk['code'].blocked = true
                                    TriggerServerEvent('zmain:properties:trunk:updateCode', k, Properties.PropertiesList[k].trunk['code'])
                                end
                            else
                                Properties.PropertiesList[k].trunkUnLocked = true
                            end
                        end)
                    end
                })
                goto continue
            end

            if Properties.PropertiesList[k].trunk['code'].blocked then
                RageUI.Separator('~r~Le coffre est bloqué~s~')
                RageUI.Button('Contacter le service de maintenance', nil, {}, true, {
                    onSelected = function()
                    end
                })
                goto continue
            end

            if Properties.PropertiesList[k].entrepot == 1 or Properties.PropertiesList[k].entrepot == true then
                RageUI.Separator(('Poid du coffre ~y~%s/KG~s~'):format(Properties.PropertiesList[k].pound))
            end

            RageUI.Button('Argent(s)', nil, {}, true, {
                onSelected =  function()
                end
            }, money)
            RageUI.Button('Item(s)', nil, {}, true, {
                onSelected = function()
                end
            }, items)
            RageUI.Button('Arme(s)', nil, {}, true, {
                onSelected = function()
                end
            }, weapons)

            RageUI.WLine()
            RageUI.Button('Gestion du coffre', nil, {}, true, {
                onSelected = function()
                end
            }, codeOptions)

            ::continue::
        end)

        RageUI.IsVisible(money, function()
            RageUI.Button('Déposer de l\'argent', nil, {}, true, {
                onSelected = function()
                    KeyboardUtils.use('Montant à déposer', function(data)
                        local data = tonumber(data)
                        if data == nil then return end

                        TriggerServerEvent('zmain:properties:trunk:actionsMoney', k, 'cash', data, 'add')
                    end)
                end
            })
            RageUI.Button('Déposer de l\'argent sale', nil, {}, true, {
                onSelected = function()
                    KeyboardUtils.use('Montant à déposer', function(data)
                        local data = tonumber(data)
                        if data == nil then return end

                        TriggerServerEvent('zmain:properties:trunk:actionsMoney', k, 'black_money', data, 'add')
                    end)
                end
            })
            RageUI.WLine()
            RageUI.Button('Cash', nil, {RightLabel = '~r~'..Properties.PropertiesList[k].trunk['accounts'].cash..'$'}, true, {
                onSelected = function()
                    KeyboardUtils.use('Montant à déposer', function(data)
                        local data = tonumber(data)
                        if data == nil then return end

                        TriggerServerEvent('zmain:properties:trunk:actionsMoney', k, 'cash', data, 'remove')
                    end)
                end
            })
            RageUI.Button('Argent Sale', nil, {RightLabel = '~r~'..Properties.PropertiesList[k].trunk['accounts'].black_money..'$'}, true, {
                onSelected = function()
                    KeyboardUtils.use('Montant à déposer', function(data)
                        local data = tonumber(data)
                        if data == nil then return end

                        TriggerServerEvent('zmain:properties:trunk:actionsMoney', k, 'black_money', data, 'remove')
                    end)
                end
            })
        end)

        RageUI.IsVisible(items, function()
            RageUI.Button('Déposer un objet', nil, {}, true, {
                onSelected = function()
                    
                end
            }, playerInventory)
            RageUI.WLine()
            for _,v in pairs(Properties.PropertiesList[k].trunk['items']) do
                RageUI.Button(v.label, nil, {RightLabel = '~r~'..v.count}, true, {
                    onSelected = function()
                        KeyboardUtils.use('Quantité', function(data)
                            local data = tonumber(data)

                            if data == nil then return end

                            TriggerServerEvent('zmain:properties:trunk:actionsCoffre', k, v, data, 'remove', 'item', _)
                        end)
                    end
                })
            end
        end)

        RageUI.IsVisible(playerInventory, function()
            ESX.PlayerData = ESX.GetPlayerData()
            for _,v in pairs(ESX.PlayerData.inventory) do
                RageUI.Button(v.label, nil, {RightLabel = '~r~'..v.count}, true, {
                    onSelected = function()
                        KeyboardUtils.use('Quantité', function(data)
                            local data = tonumber(data)

                            if data == nil then return end

                            TriggerServerEvent('zmain:properties:trunk:actionsCoffre', k, v, data, 'add', 'item')
                        end)
                    end
                })
            end
        end)

        RageUI.IsVisible(weapons, function()
            RageUI.Button('Déposer une arme', nil, {}, true, {
                onSelected = function()

                end
            }, playerWeapons)
            RageUI.WLine()
            for _,v in pairs(Properties.PropertiesList[k].trunk['weapons']) do
                RageUI.Button(v.label, nil, {RightLabel = '~r~'..v.ammo}, true, {
                    onSelected = function()
                        KeyboardUtils.use('Taper Y pour valider', function(data)
                            if data == 'y' or data == 'Y' then
                                TriggerServerEvent('zmain:properties:trunk:actionsCoffre', k, v, v.ammo, 'remove', 'weapon', v.number, _)
                            end
                        end)
                    end
                })
            end
        end)

        RageUI.IsVisible(playerWeapons, function()
            ESX.PlayerData.loadout = ESX.GetPlayerData().loadout
            for _,v in pairs(ESX.PlayerData.loadout) do
                if HasPedGotWeapon(Player.playerPed, GetHashKey(v.name)) then
                    RageUI.Button(v.label, nil, {RightLabel = '~r~'..v.ammo}, true, {
                        onSelected = function()
                            KeyboardUtils.use('Taper Y pour valider', function(data)
                                if data == 'y' or data == 'Y' then
                                    TriggerServerEvent('zmain:properties:trunk:actionsCoffre', k, v, v.ammo, 'add', 'weapon', v.number, _)
                                end
                            end)
                        end
                    })
                end
            end
        end)

        RageUI.IsVisible(codeOptions, function()    
            if Properties:ReturnPropertiesData(k).trunk['code'].active == true then
                RageUI.Button('Changer de code', nil, {}, true, {
                    onSelected = function()
                        KeyboardUtils.use('Nouveau code', function(data)
                            Properties.PropertiesList[k].trunk['code'].code = data

                            TriggerServerEvent('zmain:properties:trunk:updateCode', k, Properties.PropertiesList[k].trunk['code'])
                        end)
                    end
                })
            end
            if Properties:ReturnPropertiesData(k).trunk['code'].active == true then
                RageUI.Button('Désactiver le code', nil, {}, true, {
                    onSelected = function()
                        KeyboardUtils.use('Taper Y pour valider', function(data)
                            if data == 'y' or data == 'Y' then
                                Properties.PropertiesList[k].trunk['code'].active = 'none'

                                TriggerServerEvent('zmain:properties:trunk:updateCode', k, Properties.PropertiesList[k].trunk['code'])
                            end
                        end)
                    end
                })
            end
            if Properties:ReturnPropertiesData(k).trunk['code'].active == 'none' then
                RageUI.Button('Activer le code', nil, {}, true, {
                    onSelected = function()
                        KeyboardUtils.use('Taper Y pour valider', function(data)
                            if data == 'y' or data == 'Y' then
                                CreateThread(function()
                                    KeyboardUtils.use('Taper un CODE', function(data2)
                                        Properties.PropertiesList[k].trunk['code'].active = true
                                        Properties.PropertiesList[k].trunk['code'].code = data2

                                        TriggerServerEvent('zmain:properties:trunk:updateCode', k, Properties.PropertiesList[k].trunk['code'])
                                    end)
                                end)
                            end
                        end)
                    end
                })
            end
        end)

        if not RageUI.Visible(main) and not RageUI.Visible(money) and not RageUI.Visible(items) and not RageUI.Visible(playerInventory) and not RageUI.Visible(weapons) and not RageUI.Visible(playerWeapons) and not RageUI.Visible(codeOptions) then
            main = RMenu:DeleteType('main')
            FreezeEntityPosition(PlayerPedId(), false)
        end
    end
end