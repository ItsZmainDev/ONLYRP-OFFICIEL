local gouvernement = {
    Position = {
        office = vector3(-528.1363, -187.5958, 43.36589)
    }
}

CreateThread(function()
    while not ESXLoaded do Wait(1) end
    local interval = 2000
    while true do
        Wait(interval)

        interval = 2000

        if ESX.PlayerData.job.name == 'gouvernement' then
            local playerPos = GetEntityCoords(PlayerPedId())
            local officePos = #(playerPos-gouvernement.Position.office)

            if officePos > 10 then goto continue end

            interval = 1

            DrawMarker(25, gouvernement.Position.office.x, gouvernement.Position.office.y, gouvernement.Position.office.z-0.98, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.55, 0.55, 0.55, tonumber(UTILS.ServerColor.r), tonumber(UTILS.ServerColor.g), tonumber(UTILS.ServerColor.b), 255, false, false, 2, false, false, false, false)

            if officePos < 1.5 then
                DrawInstructionBarNotification(gouvernement.Position.office.x, gouvernement.Position.office.y, gouvernement.Position.office.z, "Appuyez sur [ ~g~E~w~ ] pour intéragir")
                if IsControlJustPressed(1,51) then
                    gouvernement:openOfficeMenu()
                end
            end

            ::continue::
        end
    end
end)

function gouvernement:openOfficeMenu()
    local main = RageUI.CreateMenu('', 'Actions Disponibles')

    local taxesMenu = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')


    local te = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')

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
            RageUI.Button('Faire une annonce', nil, {}, true, {
                onSelected = function()
                    KeyboardUtils.use('Message', function(msg)
                        TriggerServerEvent('zmain:gouv:annonce', msg)
                    end)
                end
            })
            RageUI.Button('Gérer les taxes des sociétés', nil, {}, true, {
                onSelected = function()
                    
                end
            }, taxesMenu)
            RageUI.Button('Gérer les remises des sociétés publiques', nil, {}, true, {
                onSelected = function()
                    
                end
            }, te)
        end)

        RageUI.IsVisible(te, function()
            local jobs = {
                ['police'] = true,
                ['ambulance'] = true,
                ['bcso'] = true,
                ['gouvernement'] = false,
            }
        
            for k,v in pairs(Society.List) do
                if jobs[v.name] then
                    RageUI.Button(('%s | %s'):format(v.name, v.label), '\n~r~Remises effectuées toutes les heures~s~\n', {RightLabel = ('~y~%s%s~s~'):format(v.tax, '$')}, true, {
                        onActive = function()
                            RageUI.Info('Informations de la société', {'Argent de la société'}, {'~g~'..v.coffre['accounts'].society..'$~s~'})
                        end,
                        onSelected = function()
                            KeyboardUtils.use('Nouvelle taxe', function(data)
                                local data = tonumber(data)
    
                                if not data then return end
    
                                if data > 200000 then return ESX.ShowNotification('Vous ne pouvez pas mettre une taxe supérieur à ~r~200000$~s~') end
    
                                data = data
    
                                CreateThread(function()
                                    KeyboardUtils.use('Taper Y pour valider', function(dat)
                                        if dat == 'y' or dat == 'Y' then
                                            TriggerServerEvent('zmain:society:gouvernement:editTax2', v.name, data)
                                        end
                                    end)
                                end)
                            end)
                        end
                    })
                end
            end
        end)

        RageUI.IsVisible(taxesMenu, function()
            local jobs = {
                ['police'] = true,
                ['ambulance'] = true,
                ['bcso'] = true,
                ['gouvernement'] = false,
            }
            for k,v in pairs(Society.List) do
                if not jobs[v.name] then
                    RageUI.Button(('%s | %s'):format(v.name, v.label), '\n~r~Taxes prélevées toutes les heures~s~\n', {RightLabel = ('~y~%s%s~s~'):format(v.tax, '%')}, true, {
                        onActive = function()
                            RageUI.Info('Informations de la société', {'Argent de la société'}, {'~g~'..v.coffre['accounts'].society..'$~s~'})
                        end,
                        onSelected = function()
                            KeyboardUtils.use('Nouvelle taxe', function(data)
                                local data = tonumber(data)
    
                                if not data then return end
    
                                if data > 10 then return ESX.ShowNotification('Vous ne pouvez pas mettre une taxe supérieur à ~r~10%~s~') end
    
                                data = data
    
                                CreateThread(function()
                                    KeyboardUtils.use('Taper Y pour valider', function(dat)
                                        if dat == 'y' or dat == 'Y' then
                                            TriggerServerEvent('zmain:society:gouvernement:editTax', v.name, data)
                                        end
                                    end)
                                end)
                            end)
                        end
                    })
                end
            end
        end)

        if not RageUI.Visible(main) and not RageUI.Visible(taxesMenu) and not RageUI.Visible(te) then
            main = RMenu:DeleteType('main')
            FreezeEntityPosition(PlayerPedId(), false)
        end
    end
end

RegisterCommand('gouv', function()
    ESX.Scaleform.ShowBreakingNews('title', 'msg', false, 5)
end)