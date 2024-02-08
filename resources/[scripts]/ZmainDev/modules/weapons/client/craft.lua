function Config.CraftWeapons:openMoltenSteel()
    local main = RageUI.CreateMenu('', 'Actions Disponibles')
    
    local count = false

    ESX.TriggerServerCallback('zmain:getIem', function(cb)
        if cb then
            count = true
        end
    end)

    RageUI.Visible(main, not RageUI.Visible(main))
    FreezeEntityPosition(Player.playerPed, true)
    while main do Wait(1)
        RageUI.IsVisible(main, function()
            RageUI.Separator('Acier à fondre')
            RageUI.Line()
            for k,v in pairs(ESX.GetPlayerData().inventory) do
                if v.name ~= 'treatedsteel' then goto continue end

                RageUI.Button(v.label, nil, {RightLabel = '~r~Quantité(s): '..v.count}, not Config.CraftWeapons.fond, {
                    onSelected = function()
                        KeyboardUtils.use('Quantité à fondre', function(data)
                            local data = tonumber(data)
                            if data == nil or data < 10 then return end
                            if data > v.count then return ESX.ShowNotification('Vous n\'en possedez pas assez') end
                            if data >= 50 then return ESX.ShowNotification('Il n\'y a pas asser de place dans le bac') end

                            Config.CraftWeapons.loadpercent = 0.0
                            Config.CraftWeapons.count = 0.00006

                            Config.CraftWeapons.count *= 50 / data

                            Config.CraftWeapons.fond = true

                            Config.CraftWeapons.fondCount = data
                        end)
                    end
                })

                if Config.CraftWeapons.fond then
                    RageUI.PercentagePanel(Config.CraftWeapons.loadpercent, "Fonte des métaux en cours (~y~" .. math.floor(Config.CraftWeapons.loadpercent * 100) .. "%~s~)", "", "", function(a, percent)end)
                    if Config.CraftWeapons.loadpercent < 1.0 then
                         Config.CraftWeapons.loadpercent +=  Config.CraftWeapons.count
                    else
                        Config.CraftWeapons.loadpercent = 0
                        Config.CraftWeapons.fond = false

                        TriggerServerEvent('zmain:craft:fond', Config.CraftWeapons.fondCount)
                    end
                end

                ::continue::
            end

            if not count then
                RageUI.Separator('~r~Vous ne possédez pas d\'acier traité')
            end
        end)

        if not RageUI.Visible(main) and

        not RageUI.Visible(main) then
            main = RMenu:DeleteType('main')
            FreezeEntityPosition(Player.playerPed, false)
        end
    end
end

function Config.CraftWeapons:getQuantityMoneyWithItemPrice(price)
    ESX.PlayerData = ESX.GetPlayerData()
    for k,v in pairs(ESX.PlayerData.accounts) do
        if v.name == 'black_money' then
            if v.money < tonumber(price) then return false end
        end
    end

    return true
end

function Config.CraftWeapons:setPlayerAnim()
    Player.playerPed = PlayerPedId()
end

function Config.CraftWeapons:getInvenotryItem(item)
    ESX.PlayerData = ESX.GetPlayerData()
    for k,v in pairs(ESX.PlayerData.inventory) do
        if v.name ~= item then
            return v
        end
    end
end

function Config.CraftWeapons:openCraftWeapons()
    local main = RageUI.CreateMenu('', 'Actions Disponibles')

    RageUI.Visible(main, not RageUI.Visible(main))
    FreezeEntityPosition(Player.playerPed, true)
    while main do Wait(1)
        RageUI.IsVisible(main, function()
            for k,v in pairs(Config.CraftWeapons.Weapons) do
                local buttonName = ('%s'):format(v.label)
                RageUI.Button(buttonName, nil, {RightLabel = ('~g~%s$~s~'):format(v.price)}, not Config.CraftWeapons.crafting, {
                    onActive = function()
                        RageUI.Info('Informations de la création', {
                            'Prix',
                            'Acier fondue nécessaire',
                            'Fil de fer nécessaire',
                            'Outil requis',
                            'Temps de la création'
                        },
                        {
                        v.price..' $',
                        v.acierFondue..' L',
                        v.filFer..' cm',
                        'Soudeuse',
                        v.time..' minutes'
                        })
                    end,
                    onSelected = function()
                        KeyboardUtils.use('Taper Y pour valider', function(data)
                            if data == 'y' or data == 'Y' then
                                local access = false
                                ESX.TriggerServerCallback('zmain:getItem2', function(cb)
                                    print(cb)
                                    if not cb then access = false return ESX.ShowNotification('Vous ne possezdez pas assez d\'acier fondue.') else access = true end

                                    access = true
                                end, 'melted_steel') 
                                ESX.TriggerServerCallback('zmain:getItem3', function(cb)
                                    print(cb)
                                    if not cb then access = false return ESX.ShowNotification('Vous ne possezdez pas assez de fil de fer.') else access = true end
                                    access = true
                                end, 'wire') 
                                Wait(1000)
                                if not access then return end
                                if not Config.CraftWeapons:getQuantityMoneyWithItemPrice(v.price) then return ESX.ShowNotification('Vous n\'avez pas l\'argent nécessaire') end
                                Config.CraftWeapons.crafting = true

                                TriggerServerEvent('zmain:weapons:paid', v.price, v.acierFondue, v.filFer)

                                exports['pogressBar']:drawBar(v.time * 60000, ('Création de l\'arme %s en cours'):format(v.label), function()
                                    Config.CraftWeapons.crafting = false

                                    FreezeEntityPosition(PlayerPedId(), false)

                                    TriggerServerEvent('zmain:weapons:give', v.name, v.label)
                                end)

                                CreateThread(function()
                                    RageUI.CloseAll()
                                    local ped = PlayerPedId()
                                    FreezeEntityPosition(ped, true)
                                    SetEntityCoords(ped, vector3(976.1522, 2903.97, 40.45931))
                                    SetEntityHeading(ped, 95.889930725098)
                                    TaskStartScenarioInPlace(ped, 'WORLD_HUMAN_WELDING', 0, true)
                                    while Config.CraftWeapons.crafting do

                                        Wait(10000)
                                        TaskStartScenarioInPlace(ped, 'WORLD_HUMAN_WELDING', 0, true)

                                        v.time -= 1

                                        if not Config.CraftWeapons.crafting then
                                            v.time = 5
                                            ClearPedTasks(PlayerPeddId())
                                            break
                                        end
                                    end
                                end)
                                
                                CreateThread(function()
                                    while Config.CraftWeapons.crafting do

                                        Wait(1)

                                        
                                        exports['ZmainUI']:drawInfo('Informations', {
                                            {title = 'Temps restant', subtitle = math.floor( v.time )..' Minutes(s)'},
                                        })

                                        if not Config.CraftWeapons.crafting then
                                            break
                                            exports['ZmainUI']:hide()
                                        end
                                    end
                                end)
                            end
                        end)

                        ::continue::
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

local loadede = false
local tt = {}

RegisterNetEvent('zmain:weapons:load', function(table)
    tt = table
    loadede = true
end)

CreateThread(function()
    local permi
    while not ESXLoaded do Wait(1) end
    while not loadede do Wait(1) end
    AddZones('fonderie', {
        Position = vector3(1084.9197998047, -2002.4211425781, 31.402545928955),
        Dist = 10,
        Public = false,
        Job = tt,
        Job2 = tt,
        GradesJob = {},
        InVehicleDisable = true,
        Blip = {
            Active = true,
            Position = vector3(1084.9197998047, -2002.4211425781, 31.402545928955),
            BlipId = 253,
            Color = 1,
            Scale = 0.6,
            Text = '[ILLEGAL] Fonderie'
        },
        ActionText = 'Appuyez sur [ ~g~E~w~ ] pour intéragir',
        Action = function()
            Config.CraftWeapons:openMoltenSteel()
        end
    })
    AddZones('craft_weapons', {
        Position = vector3(978.7681, 2909.357, 41.45187),
        Dist = 10,
        Public = false,
        Job = tt,
        Job2 = tt,
        GradesJob = {},
        InVehicleDisable = true,
        Blip = {
            Active = true,
            Position = vector3(1015.645, 2905.471, 41.36798),
            BlipId = 784,
            Color = 1,
            Scale = 0.6,
            Text = '[ILLEGAL] Craft D\'arme'
        },
        marker = false,
        ActionText = 'Appuyez sur [ ~g~E~w~ ] pour intéragir',
        Action = function()
            Config.CraftWeapons:openCraftWeapons()
        end
    })
    _PEDS.addPed('craft_weapons', {
        model = 'csb_talcc',
        position = vector3(978.7681, 2909.357, 41.45187),
        heading = 187.49645996094,
        scenario = {
            active = false,
            name = 'WORLD_HUMAN_CLIPBOARD',
            count = 0,
        },
        weapon = {
            active = true,
            weaponName = 'weapon_assaultrifle',
        },
        floatingText = {
            active = true,
            text = 'Nay',
            color = 34,
        },
    })
end)