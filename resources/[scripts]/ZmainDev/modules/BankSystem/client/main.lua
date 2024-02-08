local sold = 0

local function updateAccount()
    ESX.PlayerData = ESX.GetPlayerData()
    for i = 1, #ESX.PlayerData.accounts do
        if ESX.PlayerData.accounts[i].name == 'bank' then
            sold = ESX.PlayerData.accounts[i].money
        end
    end
end

RegisterNetEvent('zmain:bank:updateAccount', function()
    updateAccount()
end)

function openATM()
    updateAccount()
    local main = RageUI.CreateMenu('', 'Actions Disponibles')

    RageUI.Visible(main, not RageUI.Visible(main))
    FreezeEntityPosition(PlayerPedId(), true)
    while main do Wait(1)
        RageUI.IsVisible(main, function()
            RageUI.Info('Informations de votre compte', {'COMPTE', 'IBAN', 'Argent sur le compte'}, {GetPlayerName(PlayerId()), ESX.PlayerData.UniqueID, sold})
            RageUI.Button('Déposer de l\'argent', nil, {RightBadge = RageUI.BadgeStyle.Star}, true, {
                onSelected = function()
                    KeyboardUtils.use('Quantité à déposer', function(data)
                        local data = tonumber(data)
                        if data == nil then return end

                        TriggerServerEvent('zmain:bank:deposit', data)
                    end)
                end
            })
            RageUI.Button('Retirer de l\'argent', nil, {RightBadge = RageUI.BadgeStyle.Star}, true, {
                onSelected = function()
                    KeyboardUtils.use('Quantité à retirer', function(data)
                        local data = tonumber(data)
                        if data == nil then return end

                        TriggerServerEvent('zmain:bank:remove', data)
                    end)
                end
            })
            RageUI.Line()
            RageUI.Button('Faire un virement', nil, {RightLabel = '>>'}, true, {
                onSelected = function()
                    KeyboardUtils.use('IBAN de la personne', function(iban)
                        local iban = tonumber(iban)
                        if iban == nil then return end

                        CreateThread(function()
                            KeyboardUtils.use('Quantité à transferer', function(q)
                                local q = tonumber(q)
                                if q == nil then return end

                                TriggerServerEvent('zmain:bank:iban:send', iban, q)
                            end)
                        end)
                    end)
                end
            })
        end)

        if not RageUI.Visible(main) then
            main = RMenu:DeleteType('main')
            FreezeEntityPosition(PlayerPedId(), false)
        end
    end
end

local function playAnim(animDict, animName, duration)
    RequestAnimDict(animDict)
    while not HasAnimDictLoaded(animDict) do
        Citizen.Wait(0)
    end
    TaskPlayAnim(PlayerPedId(), animDict, animName, 1.0, -1.0, duration, 49, 1, false, false, false)
    RemoveAnimDict(animDict)
end

RegisterCommand('openATM', function()
    for index, objects in ipairs(cfg.Bank.ATMObjects) do
        local myCoords = GetEntityCoords(PlayerPedId())
        local getClosestObjects = GetClosestObjectOfType(myCoords.x, myCoords.y, myCoords.z, 0.7, GetHashKey(objects),
            true, true, true)
        if getClosestObjects ~= 0 then
            playAnim('mp_common', 'givetake2_a', 2500)
            Citizen.Wait(1000)
            openATM()
        end
    end
end)
RegisterKeyMapping('openATM', 'Ouvrir l\'atm', 'keyboard', 'E')

CreateThread(function()
    local interval = 2000
    while true do
        Wait(interval)

        interval = 2000

        for index, objects in ipairs(cfg.Bank.ATMObjects) do
            local myCoords = GetEntityCoords(PlayerPedId())
            local getClosestObjects = GetClosestObjectOfType(myCoords.x, myCoords.y, myCoords.z, 0.7, GetHashKey(objects),
                true, true, true)
            if getClosestObjects ~= 0 then
                interval = 1

                DrawInstructionBarNotification(myCoords.x, myCoords.y, myCoords.z, "Appuyez sur [ ~g~E~w~ ] pour intéragir")
            end
        end
    end
end)