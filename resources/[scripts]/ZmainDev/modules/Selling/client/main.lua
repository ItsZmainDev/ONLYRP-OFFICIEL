CreateThread(function()
    for k,v in pairs(Config_Selling.Selling) do
        AddZones(('sellin_%s'):format(v.job), {
            Position = v.position,
            Dist = 10,
            Public = false,
            Job = {[v.job] = true},
            Job2 = {[v.job] = true},
            GradesJob = {},
            InVehicleDisable = true,
            Blip = {
                Active = false,
                Position = v.Position,
                BlipId = 57,
                Color = 1,
                Scale = 0.6,
                Text = '[FARMMING] Vente'
            },
            marker = true,
            ActionText = 'Appuyez sur [ ~g~E~w~ ] pour intéragir',
            Action = function()
                Config_Selling:openSellMenu(v.job)
            end
        })
    end
end)

function Config_Selling:openSellMenu(job)
    local main = RageUI.CreateMenu('', 'Actions Disponibles')

    RageUI.Visible(main, not RageUI.Visible(main))
    FreezeEntityPosition(PlayerPedId(), true)
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
            RageUI.Separator('Vente de produits')

            RageUI.Line()

            for k,v in pairs(Config_Selling.Selling[job].items_sell) do
                RageUI.Button(v.label, nil, {}, true, {
                    onSelected = function()
                        local player, distance = ESX.Game.GetClosestPlayer()

                        if distance == -1 or distance > 3 then return ESX.ShowNotification('~r~Personne aux alentours~s~') end

                        KeyboardUtils.use('Prix', function(data)
                            local data = tonumber(data)

                            if data == nil then return end

                            if data < 15 then
                                return ESX.ShowNotification('~r~Vous ne pouvez pas vendre ce produit en dessous de 15$~s~')
                            end

                            CreateThread(function()
                                
                                KeyboardUtils.use('Quantité', function(countttt)
                                    local data2 = tonumber(countttt)
                                    if countttt == nil then return end

                                    TriggerServerEvent('zmain:selling:sellItem', data*data2, k, countttt, GetPlayerServerId(player))
                                end)
                            end)
                        end)
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

RegisterNetEvent('zmain:selling:bill', function(price, itemName, count, vendeur)
    print(price, itemName, count, vendeur)
    ESX.ShowNotification(('Vous avez recus une facture (~y~%s$~s~)\n\n~g~E~s~ pour accepter\n~r~N~s~ pour refuser'):format(ESX.Math.GroupDigits(price)))

    CreateThread(function()
        local time = 20000
        while time > 0 do 
            Wait(1)

            if IsControlJustPressed(0, 54) then
                time = 0
                TriggerServerEvent('zmain:selling:payBill', price, itemName, count, vendeur)
                break
            end

            if IsControlJustPressed(0, 306) then
                time = 0
                TriggerServerEvent('zmain:selling:notPayBill', vendeur)
                break
            end

            time -= 1

            if time <= 0 then
                break
            end
        end
    end)
end)