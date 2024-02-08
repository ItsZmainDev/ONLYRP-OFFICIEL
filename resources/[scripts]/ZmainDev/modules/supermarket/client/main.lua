function openSupermarket()
    local main = RageUI.CreateMenu('', 'Supermarket')

    RageUI.Visible(main, not RageUI.Visible(main))
    FreezeEntityPosition(Player.playerPed, true)
    while main do Wait(1)
        RageUI.IsVisible(main, function()
            for k,v in pairs(Config.Supermarket) do
                RageUI.Button(v.label, nil, {RightLabel = ('~g~%s$~S~'):format(v.price)}, true, {
                    onSelected = function()
                        KeyboardUtils.use('Taper B pour payer en banque ou L en liquide', function(data)
                            TriggerServerEvent('zmain:supermarket:paidItem', data, v.item, v.price)
                        end)
                    end
                })
            end
        end)

        if not RageUI.Visible(main) and

        not RageUI.Visible(main) then
            main = RMenu:DeleteType('main')
            FreezeEntityPosition(Player.playerPed, false)
        end
    end
end

function openIphoneShop()
    Player.playerPed = PlayerPedId()
    local main = RageUI.CreateMenu('', 'Apple Store')

    RageUI.Visible(main, not RageUI.Visible(main))
    FreezeEntityPosition(Player.playerPed, true)
    while main do Wait(1)
        RageUI.IsVisible(main, function()
            RageUI.Button('Téléphone', nil, {RightLabel = ('~g~%s$~S~'):format(350)}, true, {
                onSelected = function()
                    KeyboardUtils.use('Taper B pour payer en banque ou L en liquide', function(data)
                        TriggerServerEvent('zmain:supermarket:paidItem', data, 'phone', 350)
                    end)
                end
            })
        end)

        if not RageUI.Visible(main) and

        not RageUI.Visible(main) then
            main = RMenu:DeleteType('main')
            FreezeEntityPosition(Player.playerPed, false)
        end
    end
end

function openArmorie()
    Player.playerPed = PlayerPedId()
    local main = RageUI.CreateMenu('', 'Armurerie')

    RageUI.Visible(main, not RageUI.Visible(main))
    FreezeEntityPosition(Player.playerPed, true)
    while main do Wait(1)
        RageUI.IsVisible(main, function()
            for k,v in pairs(Config.Armorie.weapons) do
                RageUI.Button(v.label, nil, {RightLabel = ('~g~%s$~S~'):format(v.price)}, true, {
                    onSelected = function()
                        KeyboardUtils.use('Taper B pour payer en banque ou L en liquide', function(data)
                            TriggerServerEvent('zmain:supermarket:paidWeapon', data, v.weapon, v.price)
                        end)
                    end
                })
            end
            RageUI.Line()
            RageUI.Button('Chargeur', nil, {RightLabel = ('~g~%s$~S~'):format(500)}, true, {
                onSelected = function()
                    KeyboardUtils.use('Quantité', function(count)
                        local count = tonumber(count)
                        if not count then return end

                        CreateThread(function()
                            KeyboardUtils.use('Taper B pour payer en banque ou L en liquide', function(data)
                                TriggerServerEvent('zmain:supermarket:paidWeapon', data, 'clip', 500*count, count)
                            end)
                        end)
                    end)
                end
            })
            RageUI.Button('Kevlar', nil, {RightLabel = ('~g~%s$~S~'):format(3500)}, true, {
                onSelected = function()
                    KeyboardUtils.use('Taper B pour payer en banque ou L en liquide', function(data)
                        TriggerServerEvent('zmain:supermarket:paidWeapon', data, 'kevlar', 3500)
                    end)
                end
            })
            RageUI.Separator('~y~VIP ZONE~s~')
            RageUI.Button('Pistolet (Beretta)', nil, {RightLabel = ('~g~%s$~S~'):format(1800000)}, true, {
                onSelected = function()
                    if not VIP.haveVip() then return ESX.ShowNotification('Vous devez possedez le ~b~VIP~s~') end
                    KeyboardUtils.use('Taper B pour payer en banque ou L en liquide', function(data)
                        TriggerServerEvent('zmain:supermarket:paidWeapon', data, 'weapon_pistol', 180000)
                    end)
                end
            })
        end)

        if not RageUI.Visible(main) and

        not RageUI.Visible(main) then
            main = RMenu:DeleteType('main')
            FreezeEntityPosition(Player.playerPed, false)
        end
    end
end

function openShop()
    Player.playerPed = PlayerPedId()
    local main = RageUI.CreateMenu('', 'Magazin')

    RageUI.Visible(main, not RageUI.Visible(main))
    FreezeEntityPosition(Player.playerPed, true)
    while main do Wait(1)
        RageUI.IsVisible(main, function()
            RageUI.Button('Eau', nil, {RightLabel = ('~g~%s$~S~'):format(50)}, true, {
                onSelected = function()
                    KeyboardUtils.use('Quantité', function(count)
                        local count = tonumber(count)
                        if not count then return end

                        CreateThread(function()
                            KeyboardUtils.use('Taper B pour payer en banque ou L en liquide', function(data)
                                TriggerServerEvent('zmain:supermarket:paidItem', data, 'water', 50*count, count)
                            end)
                        end)
                    end)
                end
            })
            RageUI.Button('Pain', nil, {RightLabel = ('~g~%s$~S~'):format(50)}, true, {
                KeyboardUtils.use('Quantité', function(count)
                    local count = tonumber(count)
                    if not count then return end

                    CreateThread(function()
                        KeyboardUtils.use('Taper B pour payer en banque ou L en liquide', function(data)
                            TriggerServerEvent('zmain:supermarket:paidItem', data, 'bread', 50*count, count)
                        end)
                    end)
                end)
            })
        end)

        if not RageUI.Visible(main) and

        not RageUI.Visible(main) then
            main = RMenu:DeleteType('main')
            FreezeEntityPosition(Player.playerPed, false)
        end
    end
end

function openLocation(type, h)
    Player.playerPed = PlayerPedId()
    local main = RageUI.CreateMenu('', 'Location')

    RageUI.Visible(main, not RageUI.Visible(main))
    FreezeEntityPosition(Player.playerPed, true)
    while main do Wait(1)
        RageUI.IsVisible(main, function()
            for k,v in pairs({
                'Faggio',
                'Bmx',
                'Panto',
            }) do
                RageUI.Button(v, nil, {RightLabel = '~g~50$~s~'}, true, {
                    onSelected = function()
                        KeyboardUtils.use('Taper Y pour valider', function(data)
                            if data == 'y' or data == 'Y' then
                                ESX.TriggerServerCallback('zmain:getMoney', function(data)
                                    if data then
                                        ESX.ShowNotification('💲 Vous avez payé ~g~50$~s~')
                                        ESX.Game.SpawnVehicle(v, type, h, function(vehicle)
                                            
                                        end)
                                    else
                                        ESX.ShowNotification('💲 ~r~Vous n\'avez pas assez d\'argent~s~')
                                    end
                                end)
                            end
                        end)
                    end
                })
            end
        end)

        if not RageUI.Visible(main) and

        not RageUI.Visible(main) then
            main = RMenu:DeleteType('main')
            FreezeEntityPosition(Player.playerPed, false)
        end
    end
end

CreateThread(function()
    while not ESXLoaded do Wait(1) end
    AddZones('supermarket', {
        Position = vector3(2747.9304199219, 3483.9868164063, 55.671253204346),
        Dist = 10,
        Public = true,
        Job = nil,
        Job2 = nil,
        GradesJob = {},
        InVehicleDisable = true,
        Blip = {
            Active = true,
            Position = vector3(2745.4719238281, 3477.0629882813, 55.671112060547),
            BlipId = 605,
            Color = 46,
            Scale = 0.6,
            Text = '[SERVICE] Supermarché/IKEA'
        },
        ActionText = 'Appuyez sur [ ~g~E~w~ ] pour intéragir',
        Action = function()
            exports['shop']:openUI('supermarket')
        end
    })

    _PEDS.addPed('supermarket', {
        model = 'csb_talcc',
        position = vector3(2749.48, 3483.425, 55.66621),
        heading = 74.422637939453,
        scenario = {
            active = false,
            name = 'WORLD_HUMAN_CLIPBOARD',
            count = 0,
        },
        weapon = {
            active = false,
            weaponName = 'weapon_musket',
        },
        floatingText = {
            active = true,
            text = 'Shokapik',
            color = 34,
        },
    })

    AddZones('apple_store', {
        Position = vector3(149.6046, -232.9334, 54.424),
        Dist = 10,
        Public = true,
        Job = nil,
        Job2 = nil,
        GradesJob = {},
        InVehicleDisable = true,
        Blip = {
            Active = true,
            Position = vector3(149.6046, -232.9334, 54.424),
            BlipId = 459,
            Color = 46,
            Scale = 0.8,
            Text = '[SERVICE] Apple Store'
        },
        ActionText = 'Appuyez sur [ ~g~E~w~ ] pour intéragir',
        Action = function()
            exports['shop']:openUI('applestore')
        end
    })

    _PEDS.addPed('apple_store', {
        model = 'csb_talcc',
        position = vector3(148.7701, -234.561, 54.424),
        heading = 341.12155151367,
        scenario = {
            active = true,
            name = 'WORLD_HUMAN_CLIPBOARD',
            count = 0,
        },
        weapon = {
            active = false,
            weaponName = 'weapon_musket',
        },
        floatingText = {
            active = true,
            text = 'Zeno',
            color = 34,
        },
    })

    for k,v in pairs(Config.Armorie.Pos) do
        AddZones(k, {
            Position = vector3(v.x, v.y, v.z),
            Dist = 10,
            Public = true,
            Job = nil,
            Job2 = nil,
            GradesJob = {},
            InVehicleDisable = true,
            Blip = {
                Active = true,
                Position = vector3(v.x, v.y, v.z),
                BlipId = 110,
                Color = 1,
                Scale = 0.6,
                Text = '[SERVICE] Armurerie'
            },
            ActionText = 'Appuyez sur [ ~g~E~w~ ] pour intéragir',
            Action = function()
                exports['shop']:openUI('armory')
            end
        })
    end

    for k,v in pairs(Config.Armorie.AmmuPed) do
        _PEDS.addPed(k, {
            model = 'csb_talcc',
            position = vector3(v.x, v.y, v.z+1),
            heading = v.a,
            scenario = {
                active = false,
                name = 'WORLD_HUMAN_CLIPBOARD',
                count = 0,
            },
            weapon = {
                active = true,
                weaponName = 'weapon_advancedrifle',
            },
            floatingText = {
                active = true,
                text = 'Pascale',
                color = 34,
            },
        })
    end

    for k,v in pairs(Config.Shop) do
        AddZones(k, {
            Position = vector3(v.x, v.y, v.z),
            Dist = 10,
            Public = true,
            Job = nil,
            Job2 = nil,
            GradesJob = {},
            InVehicleDisable = true,
            Blip = {
                Active = false,
                -- Position = vector3(v.x, v.y, v.z),
                -- BlipId = 110,
                -- Color = 1,
                -- Scale = 0.8,
                -- Text = '[SERVICE] 24/7'
            },
            ActionText = 'Appuyez sur [ ~g~E~w~ ] pour intéragir',
            Action = function()
                exports['shop']:openUI('market')
            end
        })
    end

    for k,v in pairs(Config.Location) do
        AddZones(k, {
            Position = vector3(v.x, v.y, v.z),
            Dist = 10,
            Public = true,
            Job = nil,
            Job2 = nil,
            GradesJob = {},
            InVehicleDisable = true,
            marker = false,
            Blip = {
                Active = true,
                Position = vector3(v.x, v.y, v.z),
                BlipId = 280,
                Color = 2,
                Scale = 0.6,
                Text = '[SERVICE] Location'
            },
            ActionText = 'Appuyez sur [ ~g~E~w~ ] pour intéragir',
            Action = function()
                openLocation(v.s, v.h)
            end
        })
    end

    for k,v in pairs(Config.LocationPed) do
        _PEDS.addPed(k, {
            model = 'csb_talcc',
            position = vector3(v.x, v.y, v.z),
            heading = v.heading,
            scenario = {
                active = true,
                name = 'WORLD_HUMAN_CLIPBOARD',
                count = 0,
            },
            weapon = {
                active = false,
                weaponName = 'weapon_advancedrifle',
            },
            floatingText = {
                active = true,
                text = 'Floyd',
                color = 34,
            },
        })
    end
end)