_CHASSE = {
    inChasse = false,

    fistChasse = false,

    levels = 0,

    myAnimals = {},
    myAnimalsSpawn = {},
    animals = {
        'a_c_deer',
        'a_c_rabbit_01',
        'a_c_mtlion' ,
        'a_c_rabbit_01',
        'a_c_boar',
        'a_c_coyote' ,
        'a_c_deer',
        'a_c_mtlion',
        'a_c_deer',
        'a_c_coyote' ,
        'a_c_boar',
    },
    animalsEntitys = {},
    vehicle = {}
}

function _CHASSE.stop()
    TriggerServerEvent('zmain:chasse:stop')
    _CHASSE.inChasse = false

    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
        TriggerEvent('skinchanger:loadSkin', skin)

        exports['ZmainUI']:hide()
    end)

    for k,v in pairs(_CHASSE.animalsEntitys) do
        RemoveBlip(v)
    end

    for k,v in pairs(_CHASSE.vehicle) do
        DeleteEntity(v)
    end
end

local positions = {
    {pos = vector3(-1501.114, 4974.235, 63.00695), heading = 184.49295043945},
    {pos = vector3(-1496.5, 4974.797, 63.41774), heading = 183.05493164063},
    {pos = vector3(-1498.232, 4967.449, 63.52018), heading = 180.11073303223},
}

local coords = vector3(-1501.114, 4974.235, 63.00695)

function _CHASSE.openChasseMenu()
    local main = RageUI.CreateMenu('', 'Actitivé de chasse')

    RageUI.Visible(main, not RageUI.Visible(main))
    FreezeEntityPosition(PlayerPedId(), true)
    while main do Wait(1)
        RageUI.IsVisible(main, function()
            RageUI.Button('Commencer l\'activitée de chasse', nil, {}, not _CHASSE.inChasse, {
                onSelected = function()
                    local attemps = 0
                    local notifs = false

        
                    local function r()
                        Wait(10)
                        attemps = attemps + 1
            
                        if not ESX.Game.IsSpawnPointClear(coords, 2) then coords = positions[math.random(1, #positions)].pos end
                        
                        if attemps > 10 then
                            if not notifs then
                                notifs = true
                                ESX.ShowNotification('~r~Vous devez attendre qu\'une place se libère pour que votre véhicule sorte~s~')
                            end
                        end
            
                        return ESX.Game.IsSpawnPointClear(coords, 2) == true or r();
                    end
            
                    r()

                    TriggerServerEvent('zmain:chasse:start')
                    ESX.Game.SpawnVehicle('dune', vector3(coords.x, coords.y, coords.z), 179.10784912109, function(vehicle)
                        _CHASSE.vehicle[ESX.PlayerData.UniqueID] = vehicle
                    end)

                    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                        local model = GetEntityModel(PlayerPedId())
                        if model == `mp_m_freemode_01` then -- homme
                            ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                                TriggerEvent('skinchanger:loadClothes', skin, {
                                    ['tshirt_1'] = 15, ['tshirt_2'] = 0,
                                    ['torso_1'] = 779, ['torso_2'] = 0,
                                    ['arms'] = 19,
                                    ['pants_1'] = 315, ['pants_2'] = 0,
                                    ['shoes_1'] = 111, ['shoes_2'] = 0,
                                    ['bags_1'] = 40, ['bags_2'] = 0,
                                    ['helmet_1'] = -1, ['helmet_2'] = 0,
                                })
                            end)
                        elseif model ~= `mp_f_freemode_01` then  -- femme
                            ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                                TriggerEvent('skinchanger:loadClothes', skin, {
                                    ['tshirt_1'] = 14, ['tshirt_2'] = 0,
                                    ['torso_1'] = 849, ['torso_2'] = 0,
                                    ['arms'] = 20,
                                    ['pants_1'] = 345, ['pants_2'] = 0,
                                    ['shoes_1'] = 25, ['shoes_2'] = 0,
                                    ['bags_1'] = 40, ['bags_2'] = 0,
                                    ['helmet_1'] = 0, ['helmet_2'] = 0,
                                })
                            end) 
                        end
                    end) 

                    ESX.ShowNotification('🐗 Vous avez commencé l\'activité de chasse. Du materiel de chasse vous a été fourni. ~r~N\'éssayez pas de vous enfuire sinon votre expérience sera diminuée !~s~')
                end
            })
            if _CHASSE.inChasse then
                RageUI.Button('Arrêter l\'activité de chasse', nil, {}, true, {
                    onSelected = function()
                        _CHASSE.stop()

                        ESX.ShowNotification('🍖 Vous avez arrêté l\'activité de chasse ! Rendez-vous à la vente pour vendre toutes vos viandes dépecer.')
                    end
                })
            end
        end)

        if not RageUI.Visible(main) and

        not RageUI.Visible(main) then
            main = RMenu:DeleteType('main')
            FreezeEntityPosition(PlayerPedId(), false)
        end
    end
end

function _CHASSE.Info(Title, RightText, LeftText)
    local LineCount = #RightText >= #LeftText and #RightText or #LeftText
    if Title ~= nil then
        RenderText("~h~" .. Title .. "~h~", 1350 + 20 + 100, 605, 0, 0.34, 255, 255, 255, 255, 0)
    end
    if RightText ~= nil then
        RenderText(table.concat(RightText, "\n"), 1350 + 20 + 100, 635, 0, 0.28, 255, 255, 255, 255, 0)
    end
    if LeftText ~= nil then
        RenderText(table.concat(LeftText, "\n"), 1350 + 432 + 100, 635, 0, 0.28, 255, 255, 255, 255, 2)
    end
    RenderRectangle(1350 + 10 + 100, 600, 432, Title ~= nil and 50 + (LineCount * 20) or ((LineCount + 1) * 20), 0, 0, 0, 160)
end

RegisterNetEvent('zmain:chasse:startChasse', function(value, levels, animals)
    _CHASSE.inChasse = value
    _CHASSE.levels = levels
    _CHASSE.myAnimals = animals
    _CHASSE.animalsEntitys = {}

    local _peds = GetGamePool("CPed")

    CreateThread(function()
        while _CHASSE.inChasse do
            Wait(0)
            
            _peds = GetGamePool("CPed")

            for _, peds in pairs(_peds) do
                if GetEntityModel(peds) == GetHashKey('a_c_deer') or GetEntityModel(peds) == GetHashKey('a_c_rabbit_01') or GetEntityModel(peds) == GetHashKey('a_c_mtlion') or GetEntityModel(peds) == GetHashKey('a_c_cow') or GetEntityModel(peds) == GetHashKey('a_c_coyote') or GetEntityModel(peds) == GetHashKey('a_c_boar') then
                    if not _CHASSE.animalsEntitys[peds] and not IsEntityDead(peds) then 
                        _CHASSE.animalsEntitys[peds] = AddBlipForEntity(peds)
                        SetBlipAsShortRange(_CHASSE.animalsEntitys[peds], false)
                        SetBlipScale(_CHASSE.animalsEntitys[peds], 0.50)
                        SetBlipSprite(_CHASSE.animalsEntitys[peds], 463)
                        SetBlipColour(_CHASSE.animalsEntitys[peds], 59)
                        BeginTextCommandSetBlipName("BLIP")
                        AddTextEntry("BLIP", "Animaux")
                        EndTextCommandSetBlipName(_CHASSE.animalsEntitys[peds])
                    elseif _CHASSE.animalsEntitys[peds] and IsEntityDead(peds) then
                        RemoveBlip(_CHASSE.animalsEntitys[peds])
                        _CHASSE.animalsEntitys[peds] = AddBlipForEntity(peds)
                        SetBlipAsShortRange(_CHASSE.animalsEntitys[peds], false)
                        SetBlipScale(_CHASSE.animalsEntitys[peds], 0.50)
                        SetBlipSprite(_CHASSE.animalsEntitys[peds], 303)
                        SetBlipColour(_CHASSE.animalsEntitys[peds], 59)
                        BeginTextCommandSetBlipName("BLIP")
                        AddTextEntry("BLIP", "Animaux Mort")
                        EndTextCommandSetBlipName(_CHASSE.animalsEntitys[peds])
                        if not _CHASSE.myAnimalsSpawn[peds] and #(GetEntityCoords(PlayerPedId())-GetEntityCoords(peds)) < 3 and not IsPedInAnyVehicle(ped, false) then 
                            ESX.ShowHelpNotification('Appuyer sur ~INPUT_CONTEXT~ pour dépecer le gibier')
                            if IsControlJustReleased(0, 38) then
                                if GetPedCauseOfDeath(peds) ~= GetHashKey('WEAPON_MUSKET') then
                                    ESX.ShowNotification('Vous n\'avez pas tué cette bête avec une arme de chasse')
                                else
                                    _CHASSE.myAnimalsSpawn[peds] = true
                                    ExecuteCommand('e mechanic3')
                                    Citizen.SetTimeout(2000, function()
                                        TriggerServerEvent('zmain:chasse:take', GetEntityModel(peds))
                                        RemoveBlip(_CHASSE.animalsEntitys[peds])
                                        _CHASSE.animalsEntitys[peds] = nil
                                        ClearPedTasks(PlayerPedId())
                                    end)
                                end
                            end
                        end
                    end
                end
            end

            exports['ZmainUI']:drawInfo('Informations Chasse', {
                    {title = 'Experience', subtitle = ('%s/1000'):format(_CHASSE.levels)},
                    {title = 'Animaux', subtitle = ('%s'):format('\n'..table.concat(_CHASSE.myAnimals, ", ") or 'Lapin')},
            })
            -- _CHASSE.Info('Informations Chasse', {'Level', 'Animaux autorisées', ''}, {_CHASSE.levels..'/1000','', table.concat(_CHASSE.myAnimals, ", ") or 'Lapin'})

            if not _CHASSE.inChasse then
                break
                _CHASSE.stop()
            end
        end
    end)

    CreateThread(function()
        while _CHASSE.inChasse do
            Wait(1000)
            if #(GetEntityCoords(PlayerPedId())-vector3(-1346.45, 4650.41, 109.64)) > 700 then
                ESX.ShowNotification('Tu t\'éloignes trop, dernière fois ! 50 points ont été retirés de ton expérience.')
                TriggerServerEvent('zmain:chasse:stop')
                TriggerServerEvent('zmain:chasse:forceStopChasse')
                _CHASSE.inChasse = false
                _CHASSE.stop()
            end

            if not _CHASSE.inChasse then
                break
                _CHASSE.stop()
            end
        end
    end)

    CreateThread(function()
        if not _CHASSE.fistChasse then
            _CHASSE.fistChasse = true
            if _CHASSE.levels >= 100 then
                for i=1,#Activity.Chasse.Animals do
                    local position = Activity.Chasse.Animals[math.random(1, #Activity.Chasse.Animals)]
                    ESX.Game.SpawnLocalPed(2, _CHASSE.animals[math.random( 1, #_CHASSE.animals )], vector3(Activity.Chasse.Animals[i].x + math.random( 1, 50 ), Activity.Chasse.Animals[i].y + math.random( 1, 50 ), Activity.Chasse.Animals[i].z), 90.0, function(ped)

                    end)
                end
            else
                for i=1,#Activity.Chasse.Animals do
                    local position = Activity.Chasse.Animals[math.random(1, #Activity.Chasse.Animals)]
                    ESX.Game.SpawnLocalPed(2, 'a_c_rabbit_01', vector3(Activity.Chasse.Animals[i].x + math.random( 1, 50 ), Activity.Chasse.Animals[i].y + math.random( 1, 50 ), Activity.Chasse.Animals[i].z), 90.0, function(ped)

                    end)
                end
            end
        end
        while _CHASSE.inChasse do
            Wait(480000)

            if _CHASSE.levels >= 100 then
                for i=1,#Activity.Chasse.Animals do
                    local position = Activity.Chasse.Animals[math.random(1, #Activity.Chasse.Animals)]
                    ESX.Game.SpawnLocalPed(2, _CHASSE.animals[math.random( 1, #_CHASSE.animals )], vector3(Activity.Chasse.Animals[i].x + math.random( 1, 50 ), Activity.Chasse.Animals[i].y + math.random( 1, 50 ), Activity.Chasse.Animals[i].z), 90.0, function(ped)

                    end)
                end
            else
                for i=1,#Activity.Chasse.Animals do
                    local position = Activity.Chasse.Animals[math.random(1, #Activity.Chasse.Animals)]
                    ESX.Game.SpawnLocalPed(2, 'a_c_rabbit_01', vector3(Activity.Chasse.Animals[i].x + math.random( 1, 50 ), Activity.Chasse.Animals[i].y + math.random( 1, 50 ), Activity.Chasse.Animals[i].z), 90.0, function(ped)

                    end)
                end
            end

            if not _CHASSE.inChasse then
                break
                _CHASSE.stop()
            end
        end
    end)
end)

RegisterNetEvent('zmain:chasse:updateLevel', function(level, animals, value)
    _CHASSE.levels = level
    _CHASSE.myAnimals = animals

    if value ~= 'newAnimal' then
        for i = 1, 1 do
            ESX.Game.SpawnLocalPed(2, _CHASSE.animals[math.random( 1, #_CHASSE.animals )], vector3(Activity.Chasse.Animals[i].x + math.random( 1, 50 ), Activity.Chasse.Animals[i].y + math.random( 1, 50 ), Activity.Chasse.Animals[i].z), 90.0, function(ped)

            end)
        end
    end

    if value == 'newAnimal' then
        for i=1,#Activity.Chasse.Animals do
            local position = Activity.Chasse.Animals[math.random(1, #Activity.Chasse.Animals)]
            ESX.Game.SpawnLocalPed(2, _CHASSE.animals[math.random( 1, #_CHASSE.animals )], vector3(Activity.Chasse.Animals[i].x + math.random( 1, 50 ), Activity.Chasse.Animals[i].y + math.random( 1, 50 ), Activity.Chasse.Animals[i].z), 90.0, function(ped)
                print(ped)
            end)
        end

        ESX.ShowNotification('🐵 Un nouvel animal t\'as été autorisé de chasser')
    end
end)

function _CHASSE.openSellMenu()
    local main = RageUI.CreateMenu('', 'Vente de viande')

    RageUI.Visible(main, not RageUI.Visible(main))
    FreezeEntityPosition(PlayerPedId(), true)
    while main do Wait(1)
        RageUI.IsVisible(main, function()
            RageUI.Separator('Vente de viande dépecer')
            RageUI.Line()
            ESX.PlayerData.inventory = ESX.GetPlayerData().inventory
            for k,v in pairs(ESX.PlayerData.inventory) do
                if Activity.Chasse.SellItems[v.name] then
                    RageUI.Button(('%s - %s$'):format(v.label, Activity.Chasse.SellItems[v.name].price), nil, {RightLabel = ('~r~Quantités: ~s~%s'):format(v.count)}, true, {
                        onSelected = function()
                            KeyboardUtils.use('Quantité à vendre', function(data)
                                local data = tonumber(data)
                                if data == nil or data <= 0 then return ESX.ShowNotification('Quantité invalide') end

                                TriggerServerEvent('zmain:chasse:sell', v.name, v.label, Activity.Chasse.SellItems[v.name].price, data)

                            end)
                        end
                    })
                end
            end
        end)

        if not RageUI.Visible(main) and
            not RageUI.Visible(main) then
            main = RMenu:DeleteType('main')
            FreezeEntityPosition(PlayerPedId(), false)
        end
    end
end