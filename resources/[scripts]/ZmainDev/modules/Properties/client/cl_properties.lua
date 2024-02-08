Properties = {
    PropertiesList = {},
    Load = false,
    WaitNearby = 2000,
    Lastplayerpos = nil,
    Lastplayerpos2 = nil,
    garageSelected = nil,
    isIn = {},

    garage = {
        interior = {
            ["garage2"] = {
                label = "Garage 2 places",
                max = 2,
                interior = vector3(179.0916, -1002.121, -98.9999),
                position = {
                    {pos = vector3(171.0394, -1003.011, -99.42449), heading = 180.79985046387},
                    {pos = vector3(175.1755, -1002.846, -99.42455), heading = 178.6955871582},
                }
            },
            -- ["garage6"] = {
            --     label = "Garage 6 places",
            --     interior = vector3(206.6894, -999.0654, -98.99989),
            --     max = 6,
            --     position = {
            --         {pos = vector3(194.408, -1004.851, -99.42418), heading = 270.47576904297},
            --         {pos = vector3(194.5036, -1001.007, -99.42425), heading = 271.66897583008},
            --         {pos = vector3(194.4164, -997.3073, -99.42166), heading = 270.88955688477},
            --         {pos = vector3(202.9585, -1004.814, -99.42412), heading = 90.237487792969},
            --         {pos = vector3(202.7753, -1000.916, -99.4239), heading = 91.076049804688},
            --         {pos = vector3(202.8017, -996.7482, -99.42432), heading = 92.65860748291},
            --     }
            -- },
            ["garage12"] = {
                label = "Garage 12 places",
                interior = vector3(238.0304, -1004.904, -98.99994),
                max = 12,
                position = {
                    {pos = vector3(224.724, -1004.476, -99.5338), heading = 270.46740722656},
                    {pos = vector3(224.5646, -1000.681, -99.53409), heading = 269.66558837891},
                    {pos = vector3(224.6687, -996.7853, -99.53432), heading = 268.95376586914},
                    {pos = vector3(224.3766, -992.6675, -99.53409), heading = 269.87176513672},
                    {pos = vector3(224.3437, -988.6862, -99.53403), heading = 270.32437133789},
                    {pos = vector3(224.2545, -984.5372, -99.53416), heading = 270.06539916992},
                    {pos = vector3(224.0604, -980.564, -99.53407), heading = 271.43188476563},
                    {pos = vector3(233.1555, -1000.58, -99.53432), heading = 90.491760253906},
                    {pos = vector3(233.1068, -996.5477, -99.53429), heading = 89.491836547852},
                    {pos = vector3(233.0708, -992.5869, -99.53405), heading = 89.463066101074},
                    {pos = vector3(233.0854, -988.4893, -99.53351), heading = 91.00146484375},
                    {pos = vector3(232.8894, -984.677, -99.53422), heading = 91.101722717285},
                }
            },
            ["garage15"] = {
                label = "Garage 15 places",
                interior = vector3(-1065.465, -85.92764, -90.19995),
                max = 15,
                position = {
                    {pos = vector3(-1065.432, -66.25438, -99.53397), heading = 358.23248291016},
                    {pos = vector3(-1065.635, -74.29845, -99.53375), heading = 0.10303158313036},
                    {pos = vector3(-1065.615, -81.19693, -99.53407), heading = 90.554016113281},
                    {pos = vector3(-1079.253, -68.16116, -99.53402), heading = 270.97424316406},
                    {pos = vector3(-1079.7, -74.7636, -99.534), heading = 179.72177124023},
                    {pos = vector3(-1079.62, -83.37579, -99.534), heading = 181.39147949219},
                    {pos = vector3(-1065.409, -74.03681, -95.13412), heading = 0.93958550691605},
                    {pos = vector3(-1065.528, -66.28987, -95.134), heading = 0.87969946861267},
                    {pos = vector3(-1065.528, -81.30987, -95.13416), heading = 90.407981872559},
                    {pos = vector3(-1079.672, -74.27692, -95.13392), heading = 359.36486816406},
                    {pos = vector3(-1079.759, -82.12307, -95.13363), heading = 359.36520385742},
                    {pos = vector3(-1079.549, -68.02269, -95.13411), heading = 270.14105224609},
                    {pos = vector3(-1079.71, -68.176, -90.73426), heading = 270.18212890625},
                    {pos = vector3(-1079.785, -74.67483, -90.733), heading = 0.36404064297676},
                    {pos = vector3(-1079.736, -82.26862, -90.73345), heading = 0.37822380661964},
                }
            },
        },
        self_vehicle = {},
        self_garage = {},
        isIn = false,
    },

    admin = {
        visitmode = false,
        typeValue = false,
        typeData = 'achat',
        logementType = 'Motel',
        visitmodeGarage = {active = false, name = nil, interior = nil},
        Menu = {
            action = {
                'Motel',
                'Petit appartement',
                'Moyen appartement',
                'Appartement Moderne',
                'Appartement Moyen',
                'Appartement de luxe',
                'Entrepot (grand)',
                'Entrepot (moyen)',
                'Entrepot (petit)'
            },  
            list = 1,
            ListIndexTp = 1,
            ListIndexDataTp = {'Entrée', 'Sorti'},

            garage = false,
            garagepos = nil,
        },
        zones = {
            ['AIRP'] = 'Los Santos International Airport',
            ['ALAMO'] = 'Alamo Sea',
            ['ALTA'] = 'Alta street',
            ['ARMYB'] = 'Fort Zancudo',
            ['BANHAMC'] = 'Banham Canyon Dr',
            ['BANNING'] = 'Banning avenue',
            ['BEACH'] = 'Vespucci Beach',
            ['BHAMCA'] = 'Banham Canyon',
            ['BRADP'] = 'Braddock Pass',
            ['BRADT'] = 'Braddock Tunnel',
            ['BURTON'] = 'Burton avenue',
            ['CALAFB'] = 'Calafia Bridge',
            ['CANNY'] = 'Raton Canyon',
            ['CCREAK'] = 'Cassidy Creek',
            ['CHAMH'] = 'Chamberlain Hills',
            ['CHIL'] = 'Vinewood Hills',
            ['CHU'] = 'Chumash avenue',
            ['CMSW'] = 'Chiliad Mountain State Wilderness',
            ['CYPRE'] = 'Cypress Flats',
            ['DAVIS'] = 'Davis',
            ['DELBE'] = 'Del Perro Beach',
            ['DELPE'] = 'Del Perro',
            ['DELSOL'] = 'La Puerta',
            ['DESRT'] = 'Grand Senora Desert',
            ['DOWNT'] = 'Downtown avenue',
            ['DTVINE'] = 'Downtown Vinewood',
            ['EAST_V'] = 'East Vinewood',
            ['EBURO'] = 'El Burro Heights',
            ['ELGORL'] = 'El Gordo Lighthouse',
            ['ELYSIAN'] = 'Elysian Island',
            ['GALFISH'] = 'Galilee',
            ['GOLF'] = 'GWC and Golfing Society',
            ['GRAPES'] = 'Grapeseed',
            ['GREATC'] = 'Great Chaparral',
            ['HARMO'] = 'Harmony avenue',
            ['HAWICK'] = 'Hawick avenue',
            ['HORS'] = 'Vinewood Racetrack',
            ['HUMLAB'] = 'Humane Labs and Research',
            ['JAIL'] = 'Bolingbroke Penitentiary',
            ['KOREAT'] = 'Little Seoul',
            ['LACT'] = 'Land Act Reservoir',
            ['LAGO'] = 'Lago Zancudo',
            ['LDAM'] = 'Land Act Dam',
            ['LEGSQU'] = 'Legion Square',
            ['LMESA'] = 'La Mesa',
            ['LOSPUER'] = 'La Puerta',
            ['MIRR'] = 'Mirror Park',
            ['MORN'] = 'Morningwood',
            ['MOVIE'] = 'Richards Majestic',
            ['MTCHIL'] = 'Mount Chiliad',
            ['MTGORDO'] = 'Mount Gordo',
            ['MTJOSE'] = 'Mount Josiah',
            ['MURRI'] = 'Murrieta Heights',
            ['NCHU'] = 'North Chumash',
            ['NOOSE'] = 'N.O.O.S.E',
            ['OCEANA'] = 'Pacific Ocean',
            ['PALCOV'] = 'Paleto Cove',
            ['PALETO'] = 'Paleto Bay',
            ['PALFOR'] = 'Paleto Forest',
            ['PALHIGH'] = 'Palomino Highlands',
            ['PALMPOW'] = 'Palmer-Taylor Power Station',
            ['PBLUFF'] = 'Pacific Bluffs',
            ['PBOX'] = 'Pillbox Hill',
            ['PROCOB'] = 'Procopio Beach',
            ['RANCHO'] = 'Rancho',
            ['RGLEN'] = 'Richman Glen',
            ['RICHM'] = 'Richman',
            ['ROCKF'] = 'Rockford Hills',
            ['RTRAK'] = 'Redwood Lights Track',
            ['SANAND'] = 'San Andreas',
            ['SANCHIA'] = 'San Chianski Mountain Range',
            ['SANDY'] = 'Sandy Shores',
            ['SKID'] = 'Mission Row',
            ['SLAB'] = 'Stab City',
            ['STAD'] = 'Maze Bank Arena',
            ['STRAW'] = 'Strawberry',
            ['TATAMO'] = 'Tataviam Mountains',
            ['TERMINA'] = 'Terminal',
            ['TEXTI'] = 'Textile City',
            ['TONGVAH'] = 'Tongva Hills',
            ['TONGVAV'] = 'Tongva Valley',
            ['VCANA'] = 'Vespucci Canals',
            ['VESP'] = 'Vespucci avenue',
            ['VINE'] = 'Vinewood avenue',
            ['WINDF'] = 'Ron Alternates Wind Farm',
            ['WVINE'] = 'West Vinewood',
            ['ZANCUDO'] = 'Zancudo River',
            ['ZP_ORT'] = 'Port of South Los Santos',
            ['ZQ_UAR'] = 'Davis Quartz'
        },
        entrepot = false,
        pound = nil
    },

    Dynasty8 = {
        Service = false,
    },

    blips = {},

    belled = {},

    job = {
        Service = false,
        PropertiesListIndex = 1,
        PropertiesListIndexData = {'Gestion', 'Disoudre le logement', 'Supprimer la propriété', 'Modifier la propriété'},

        PropertiesListIndexPaid = 1,
        PropertiesListIndexDataPaid = {'Cash', 'Banque'},

        SelectedProperties = {}
    }
}


RegisterNetEvent('zmain:properties:load', function(data)
    Properties.PropertiesList = data

    Properties:updateBlips()

    Properties.Load = true
end)

RegisterNetEvent('zmain:properties:add', function(i,data)
    Properties.PropertiesList[i] = data

    Properties:updateBlips()
end)

RegisterNetEvent('zmain:properties:updatePlayers', function(i, data)
    Properties.PropertiesList[i].players = data

    if Properties.PropertiesList[i].players[tostring[ESX.GetPlayerData.UniqueID]] then
        Properties.isIn[i] = true
    else
        Properties.isIn[i] = false
    end
end)

RegisterNetEvent('zmain:properties:delete', function(k)
    Properties.PropertiesList[k] = nil
end)

function Properties:updateBlips()
    for k,v in pairs(Properties.blips) do
        RemoveBlip(v)
    end
    for k,v in pairs(Properties.PropertiesList) do
        local blip = AddBlipForCoord(v.enter.x, v.enter.y, v.enter.z)
        if tonumber(v.propertiesOWNER) == tonumber(ESX.GetPlayerData().UniqueID) then
            SetBlipSprite(blip, 40)
            SetBlipDisplay(blip, 4)
            SetBlipScale(blip, 0.3)
            SetBlipColour(blip, 4)
            SetBlipAsShortRange(blip, true)
            BeginTextCommandSetBlipName("STRING")
            if v.type == 'location' then
                AddTextComponentString('[LOCATAIRE] Propriété')
            else
                AddTextComponentString('[PROPRIETAIRE] Propriété')
            end
            EndTextCommandSetBlipName(blip)
        else
            SetBlipSprite(blip, 350)
            SetBlipDisplay(blip, 4)
            SetBlipScale(blip, 0.6)
            SetBlipColour(blip, 2)
            SetBlipAsShortRange(blip, true)
            BeginTextCommandSetBlipName("STRING")
            if v.type == 'location' then
                AddTextComponentString('[LOCATION] Propriété')
            else
                AddTextComponentString('[ACHAT] Propriété')
            end
            EndTextCommandSetBlipName(blip)
        end

        Properties.blips[blip] = blip
    end
end

RegisterNetEvent('zmain:properties:updateProperties', function(i, data)
    Properties:updateBlips()

    Properties.PropertiesList[i] = data
end)

RegisterNetEvent('zmain:properties:updateOwner', function(i, owner, ownerName)
    Properties.PropertiesList[i].owner = owner
    Properties.PropertiesList[i].ownerName = ownerName
end)

CreateThread(function()
    while not ESXLoaded do Wait(1) end
    while not Properties.Load do Wait(1) end

    while true do 
        Wait(Properties.WaitNearby)

        Properties.WaitNearby = 2000

        local coords = GetEntityCoords(PlayerPedId())

        for k,v in pairs(Properties.PropertiesList) do
            local enter = {};
            local exit = {};
            local trunkPos = {};
            local garage = {};
            
            enter[v.id] = #(coords-vector3(v.enter.x, v.enter.y, v.enter.z))
            exit[v.id] = #(coords-vector3(v.exit.x, v.exit.y, v.exit.z))
            trunkPos[v.id] = #(coords-vector3(v.trunkPos.x, v.trunkPos.y, v.trunkPos.z))

            if v.garage == true or v.garage == 1 then
                garage[v.id] = #(coords-vector3(v.garagePos.x, v.garagePos.y, v.garagePos.z))
            end

            if v.garage == true or v.garage == 1 then
                if enter[v.id] > 30 and exit[v.id] > 30 and trunkPos[v.id] > 30 and garage[v.id] > 30 then goto continue end
            else
                if enter[v.id] > 30 and exit[v.id] > 30 and trunkPos[v.id] > 30 then goto continue end
            end

            if not v.players[tostring(ESX.PlayerData.UniqueID)] then
                Properties.WaitNearby = 1

                DrawMarker(25, v.enter.x, v.enter.y, v.enter.z-0.98, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.55, 0.55, 0.55, tonumber(UTILS.ServerColor.r), tonumber(UTILS.ServerColor.g), tonumber(UTILS.ServerColor.b), 255, false, false, 2, false, false, false, false)
    
                if enter[v.id] <= 1 then
                    DrawInstructionBarNotification(v.enter.x, v.enter.y, v.enter.z, "Appuyez sur [ ~g~E~w~ ] pour intéragir (enter)")
                    if IsControlJustPressed(0, 54) then
                        Properties:openMenu(k)
                    end
                end
            end

            if v.garage == true or v.garage == 1 then
                if tostring(v.owner) ~= tostring(ESX.PlayerData.UniqueID) then goto exit end
                if Properties.garage.isIn then goto exit end
                
                Properties.WaitNearby = 1

                DrawMarker(25, v.garagePos.x, v.garagePos.y, v.garagePos.z-0.98, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.55, 0.55, 0.55, tonumber(UTILS.ServerColor.r), tonumber(UTILS.ServerColor.g), tonumber(UTILS.ServerColor.b), 255, false, false, 2, false, false, false, false)
    
                if garage[v.id] <= 1 then
                    DrawInstructionBarNotification(v.garagePos.x, v.garagePos.y, v.garagePos.z, "Appuyez sur [ ~g~E~w~ ] pour intéragir (garage)")
                    if IsControlJustPressed(0, 54) then
                        Properties:openGarageMenu(k)
                    end
                end
            end

            ::exit::

            if not Properties.isIn[v.id] then goto continue end

            Properties.WaitNearby = 1

            DrawMarker(25, v.exit.x, v.exit.y, v.exit.z-0.98, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.55, 0.55, 0.55, tonumber(UTILS.ServerColor.r), tonumber(UTILS.ServerColor.g), tonumber(UTILS.ServerColor.b), 255, false, false, 2, false, false, false, false)

            if exit[v.id] <= 1 then
                DrawInstructionBarNotification(v.exit.x, v.exit.y, v.exit.z, "Appuyez sur [ ~g~E~w~ ] pour intéragir (exit)")
                if IsControlJustPressed(0, 54) then
                    Properties:openExitMenu(k)
                end
            end

            DrawMarker(25, v.trunkPos.x, v.trunkPos.y, v.trunkPos.z-0.98, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.55, 0.55, 0.55, tonumber(UTILS.ServerColor.r), tonumber(UTILS.ServerColor.g), tonumber(UTILS.ServerColor.b), 255, false, false, 2, false, false, false, false)

            if trunkPos[v.id] <= 1 then
                DrawInstructionBarNotification(v.trunkPos.x, v.trunkPos.y, v.trunkPos.z, "Appuyez sur [ ~g~E~w~ ] pour intéragir (coffre)")
                if IsControlJustPressed(0, 54) then
                    Properties:openTrunkMenu(k)
                end
            end

            ::continue::
        end
    end
end)

CreateThread(function()
    Wait(1000)
    TriggerServerEvent('zmain:properties:load')
end)

function Properties:openBuilderMenu()
    local main = RageUI.CreateMenu('', 'Actions Disponibles')
    local PropertiesCreate = RageUI.CreateSubMenu(main, '')
    local Garage = RageUI.CreateSubMenu(PropertiesCreate, '')

    RageUI.Visible(main, not RageUI.Visible(main))
    while main do Wait(1)
        RageUI.IsVisible(main, function()
            RageUI.WLine()
            RageUI.Button('Créer une propriété', nil, {}, true, {}, PropertiesCreate)
            RageUI.WLine()
        end)

        RageUI.IsVisible(PropertiesCreate, function()
            local PlayerCoords = GetEntityCoords(PlayerPedId())

            RageUI.Button('Nom', nil, {RightLabel = Properties.admin.name and '~y~'..Properties.admin.name or '~r~Indéfini~s~'}, true, {
                onSelected = function()
                    KeyboardUtils.use('Nom d\'affichage', function(data)
                        if data == nil or data == '' then return end

                        Properties.admin.name = data
                    end)
                end
            })
        
            RageUI.Button('Nom d\'affichage', nil, {RightLabel = Properties.admin.label and '~y~'..Properties.admin.label or '~r~Indéfini~s~'}, true, {
                onSelected = function()
                    KeyboardUtils.use('Label de la propritété', function(data)
                        if data == nil or data == '' then return end

                        Properties.admin.label = data
                    end)
                end
            })

            RageUI.Button('Prix', 'Prix de la propriété/Prix quisera débité du coffre de la société\n', {RightLabel = Properties.admin.price and '~y~'..Properties.admin.price..'$' or '~r~Indéfini~s~'}, true, {
                onSelected = function()
                    KeyboardUtils.use('Label de la propritété', function(data)
                        local data = tonumber(data)
                        if data == nil then return end
                        if Properties.admin.typeData ~= 'location' or Properties.admin.typeData == nil then
                            if data == nil or data < 10000 then return end
                        end

                        Properties.admin.price = data
                    end)
                end
            })

            RageUI.WLine()
        
            RageUI.List('Intérieur', Properties.admin.Menu.action, Properties.admin.Menu.list, nil, {}, true, {
                onListChange = function(Index)
                    Properties.admin.Menu.list = Index

                    Properties.admin.logementType = Properties.admin.Menu.action[Properties.admin.Menu.list]
                end,
                onActive = function()
                    if Properties.admin.Menu.list == 1 then
                        RenderSprite('prop', 'Motel', 0, 550, 530, 250, 80)
                        ipl = '["hei_hw1_blimp_interior_v_motel_mp_milo_"]'
                        inside = '{"x":151.45,"y":-1007.57,"z":-98.9999}'
                        exit = '{"x":151.3258,"y":-1007.7642,"z":-100.0000}'
                        isSingle = 1
                        isRoom = 1
                        isGateway = current_zone
                    elseif Properties.admin.Menu.list == 2 then
                        RenderSprite('prop', 'Low', 0, 550, 530, 250, 80)
                        ipl = '[]'
                        inside = '{"x":265.307,"y":-1002.802,"z":-101.008}'
                        exit = '{"x":266.0773,"y":-1007.3900,"z":-101.008}'
                        isSingle = 1
                        isRoom = 1
                        isGateway = current_zone
                    elseif Properties.admin.Menu.list == 3 then
                        RenderSprite('prop', 'Middle', 0, 550, 530, 250, 80)
                        ipl = '[]'
                        inside = '{"x":-612.16,"y":59.06,"z":97.2}'
                        exit = '{"x":-603.4308,"y":58.9184,"z":97.2001}'
                        isSingle = 1
                        isRoom = 1
                        isGateway = current_zone
                    elseif Properties.admin.Menu.list == 4 then
                        RenderSprite('prop', 'Modern',0, 550, 530, 250, 80)
                        ipl = '["apa_v_mp_h_01_a"]'
                        inside = '{"x":-785.13,"y":315.79,"z":187.91}'
                        exit = '{"x":-786.87,"y":315.7497,"z":186.91}'
                        isSingle = 1
                        isRoom = 1
                        isGateway = current_zone
                    elseif Properties.admin.Menu.list == 5 then
                        RenderSprite('prop', 'High', 0, 550, 530, 250, 80)
                        ipl = '[]'
                        inside = '{"x":-1459.17,"y":-520.58,"z":54.929}'
                        exit = '{"x":-1451.6394,"y":-523.5562,"z":55.9290}'
                        isSingle = 1
                        isRoom = 1
                        isGateway = current_zone
                    elseif Properties.admin.Menu.list == 6 then
                        RenderSprite('prop', 'Luxe', 0, 550, 530, 250, 80)
                        ipl = '[]'
                        inside = '{"x":-680.6088,"y":590.5321,"z":145.39}'
                        exit = '{"x":-681.6273,"y":591.9663,"z":144.3930}'
                        isSingle = 1
                        isRoom = 1
                        isGateway = current_zone
                    elseif Properties.admin.Menu.list == 7 then
                        RenderSprite('prop', 'Entrepot_grand', 0, 550, 530, 250, 80)
                        ipl = '[]'
                        inside = '{"x":1026.5056,"y":-3099.8320,"z":-38.9998}'
                        exit   = '{"x":998.1795"y":-3091.9169,"z":-39.9999}'
                        isSingle = 1
                        isRoom = 1
                        isGateway = current_zone
                    elseif Properties.admin.Menu.list == 8 then
                        RenderSprite('prop', 'Entrepot_moyen', 0, 550, 530, 250, 80)
                        ipl = '[]'
                        inside = '{"x":1048.5067,"y":-3097.0817,"z":-38.9999}'
                        exit   = '{"x":1072.5505,"y":-3102.5522,"z":-39.9999}'
                        isSingle = 1
                        isRoom = 1
                        isGateway = current_zone
                    elseif Properties.admin.Menu.list == 9 then
                        RenderSprite('prop', 'Entrepot_petit', 0, 550, 530, 250, 80)
                        ipl = '[]'
                        inside = '{"x":1088.1834,"y":-3099.3547,"z":-38.9999}'
                        exit  = '{"x":1104.6102,"y":-3099.4333,"z":-39.9999}'
                        isSingle = 1
                        isRoom = 1
                        isGateway = current_zone
                    elseif Properties.admin.Menu.list == 0 or index == nil then
                        RenderSprite('prop', 'Motel', 0, 550, 530, 250, 80)
                        ipl = '["hei_hw1_blimp_interior_v_motel_mp_milo_"]'
                        inside = '{"x":151.45,"y":-1007.57,"z":-98.9999}'
                        exit = '{"x":151.3258,"y":-1007.7642,"z":-100.0000}'
                        isSingle = 1
                        isRoom = 1
                        isGateway = current_zone
                    end
                end
            })
        
            RageUI.Button('Entrée', nil, {RightLabel = Properties.admin.enter and '~g~Défini' or '~r~Indéfini~s~'}, true, {
                onSelected = function()
                    Properties.admin.enter = PlayerCoords
                    Properties.admin.current_zone = Properties.admin.zones[GetNameOfZone(PlayerCoords.x, PlayerCoords.y, PlayerCoords.z)]
                end,
                onActive = function()
                    DrawMarker(25, PlayerCoords.x, PlayerCoords.y, PlayerCoords.z-0.98, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.55, 0.55, 0.55, 240, 255, 0, 255, false, false, 2, false, false, false, false)
                    DrawInstructionBarNotification(PlayerCoords.x, PlayerCoords.y, PlayerCoords.z, ('Position de l\'entrée (%s)'):format(Properties.admin.zones[GetNameOfZone(PlayerCoords.x, PlayerCoords.y, PlayerCoords.z)]))
                end
            })
        
    
            RageUI.Button('Sortie', nil, {RightLabel = Properties.admin.exit and '~g~Défini' or '~r~Indéfini~s~'}, true, {
                onSelected = function()
                    Properties.admin.exit = GetEntityCoords(PlayerPedId())
                end,
                onActive = function()
                    DrawMarker(25, PlayerCoords.x, PlayerCoords.y, PlayerCoords.z-0.98, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.55, 0.55, 0.55, 240, 255, 0, 255, false, false, 2, false, false, false, false)
                    DrawInstructionBarNotification(PlayerCoords.x, PlayerCoords.y, PlayerCoords.z, 'Position de la sortie')
                end
            })

            RageUI.Button('Coffre', nil, {RightLabel = Properties.admin.trunk and '~g~Défini' or '~r~Indéfini~s~'}, true, {
                onSelected = function()
                    Properties.admin.trunk = GetEntityCoords(PlayerPedId())
                end,
                onActive = function()
                    DrawMarker(25, PlayerCoords.x, PlayerCoords.y, PlayerCoords.z-0.98, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.55, 0.55, 0.55, 240, 255, 0, 255, false, false, 2, false, false, false, false)
                    DrawInstructionBarNotification(PlayerCoords.x, PlayerCoords.y, PlayerCoords.z, 'Position du Coffre')
                end
            })

            RageUI.Checkbox('Mode Visite', nil, Properties.admin.visitmode, {}, {
                onChecked = function()
                    local ped = PlayerPedId()
                    Properties.admin.visitmode = true
                    Properties.Lastplayerpos = GetEntityCoords(ped)
                    SetEntityCoords(ped, inside)
                    if Properties.admin.Menu.list == 1 then
                        SetEntityCoords(ped, vector3(151.45,-1007.57,-98.9999))
                    elseif Properties.admin.Menu.list == 2 then
                        SetEntityCoords(ped, vector3(265.307,-1002.802,-101.008))
                    elseif Properties.admin.Menu.list == 3 then
                        SetEntityCoords(ped, vector3(-612.16,59.06,97.2))
                    elseif Properties.admin.Menu.list == 4 then
                        SetEntityCoords(ped, vector3(-785.13,315.79,187.91))
                    elseif Properties.admin.Menu.list == 5 then
                        SetEntityCoords(ped, vector3(-1459.17,-520.58,54.929))
                    elseif Properties.admin.Menu.list == 6 then
                        SetEntityCoords(ped, vector3(-680.6088,590.5321,145.39))
                    elseif Properties.admin.Menu.list == 7 then
                        SetEntityCoords(ped, vector3(1026.5056,-3099.8320,-38.9998))
                    elseif Properties.admin.Menu.list == 8 then
                        SetEntityCoords(ped, vector3(1048.5067,-3097.0817,-38.9999))
                    elseif Properties.admin.Menu.list == 9 then
                        SetEntityCoords(ped, vector3(1088.1834, -3099.3547, -38.9999))
                    elseif Properties.admin.Menu.list == 0 or index == nil then
                        SetEntityCoords(ped, vector3(151.45, 1007.57, 98.9999))
                    end
                end,
                onUnChecked = function()
                    Properties.admin.visitmode = false
                    SetEntityCoords(PlayerPedId(), Properties.Lastplayerpos)
                end
            })

            RageUI.Checkbox('Location', nil, Properties.admin.typeValue, {}, {
                onChecked = function()
                    Properties.admin.typeValue = true
                    Properties.admin.typeData = 'location'
                end,
                onUnChecked = function()
                    Properties.admin.typeValue = false
                    Properties.admin.typeData = 'achat'
                end
            })

            RageUI.Checkbox('Entrepot', nil, Properties.admin.entrepot, {}, {
                onChecked = function()
                    Properties.admin.entrepot = true
                end,
                onUnChecked = function()
                    Properties.admin.entrepot = false
                end
            })

            if (Properties.admin.entrepot == true) then
                RageUI.Button('Place dans l\'entrepôt (poid)', nil, {RightLabel = Properties.admin.pound ~= nil and ('%sKg'):format(Properties.admin.pound) or '~r~Indéfini~s~'}, true, {
                    onSelected = function()
                        KeyboardUtils.use('Définir un poid', function(data)
                            local data = tonumber(data)

                            if data == nil then return end

                            Properties.admin.pound = data
                        end)
                    end
                })
            end
        
            RageUI.Checkbox('Garage', nil, Properties.admin.Menu.action.garage, {}, {
                onChecked = function()
                    Properties.admin.Menu.action.garage = true
                    for k,v in pairs(Properties.garage.interior) do
                        Properties.admin.visitmodeGarage[k] = {active = false, name = nil, interior = nil}
                    end
                end,
                onUnChecked = function()
                    Properties.admin.Menu.action.garage = false
                end
            })
        
            if (Properties.admin.Menu.action.garage == true) then
                RageUI.Button('Paramètres du garage', nil, {}, true, {
                    onSelected = function()
                        
                    end
                }, Garage)
            end

            RageUI.Button('Confirmer', nil, {}, true, {
                onSelected = function()
                    if Properties.admin.name == nil or Properties.admin.trunk == nil or Properties.admin.label == nil or Properties.admin.price == nil or Properties.admin.enter == nil or Properties.admin.exit == nil then return ESX.ShowNotification('❌ Tout les champs ne sont pas correctement complétés') end 

                    if Properties.admin.Menu.action.garage then
                        if Properties.admin.posGarage == nil or Properties.admin.posGarageSpawn == nil or Properties.admin.rotGarageSpawn == nil or Properties.Lastplayerpos2 == nil then return ESX.ShowNotification('❌ Tout les champs ne sont pas correctement complétés') end 
                    end

                    if Properties.admin.entrepot == true then
                        if Properties.admin.pound == nil then return ESX.ShowNotification('❌ Tout les champs ne sont pas correctement complétés') end 
                    end

                    KeyboardUtils.use('Taper Y pour valider', function(data)
                        if data == 'y' or data == 'Y' then
                            if Properties.admin.visitmode then
                                SetEntityCoords(PlayerPedId(), Properties.Lastplayerpos)
                            end

                            if Properties.admin.Menu.action.garage then
                                SetEntityCoords(PlayerPedId(), Properties.Lastplayerpos2)
                            end

                            local data = {}

                            data = {
                                 name = Properties.garageSelected,
                            }
                            TriggerServerEvent('zmain:properties:createProperties', Properties.admin.name, Properties.admin.label, Properties.admin.price, Properties.admin.enter, Properties.admin.exit, Properties.admin.Menu.action.garage, Properties.admin.posGarage, Properties.admin.posGarageSpawn, Properties.admin.rotGarageSpawn, data.name, Properties.admin.typeData, Properties.admin.trunk, Properties.admin.logementType, Properties.admin.current_zone, Properties.admin.entrepot, Properties.admin.pound)
                        end
                    end)
                end
            })
        end)

        RageUI.IsVisible(Garage, function()
            local PlayerCoords = GetEntityCoords(PlayerPedId())

            RageUI.Button('Position', nil, {RightLabel = Properties.admin.posGarage or '~r~Indéfini'}, true, {
                onSelected = function()
                    Properties.admin.posGarage = GetEntityCoords(PlayerPedId())
                end,
                onActive = function()
                    DrawMarker(25, PlayerCoords.x, PlayerCoords.y, PlayerCoords.z-0.98, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.55, 0.55, 0.55, 240, 255, 0, 255, false, false, 2, false, false, false, false)
                    DrawInstructionBarNotification(PlayerCoords.x, PlayerCoords.y, PlayerCoords.z, 'Position du garage')
                end
            })

            RageUI.Button('Spawn', nil, {RightLabel = Properties.admin.posGarageSpawn or'~r~Indéfini'}, true, {
                onSelected = function()
                    Properties.admin.posGarageSpawn = GetEntityCoords(PlayerPedId())
                end,
                onActive = function()
                    DrawMarker(25, PlayerCoords.x, PlayerCoords.y, PlayerCoords.z-0.98, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.55, 0.55, 0.55, 240, 255, 0, 255, false, false, 2, false, false, false, false)
                    DrawInstructionBarNotification(PlayerCoords.x, PlayerCoords.y, PlayerCoords.z, 'Position du spawn')
                end
            })

            RageUI.Button('Rotation', nil, {RightLabel = Properties.admin.rotGarageSpawn or '~r~Indéfini'}, true, {
                onSelected = function()
                    Properties.admin.rotGarageSpawn = GetEntityHeading(PlayerPedId())
                end,
            })
            RageUI.WLine()
            for k,v in pairs(Properties.garage.interior) do
                RageUI.Checkbox(v.label, nil, Properties.admin.visitmodeGarage[k].active, {}, {
                    onChecked = function()
                        if Properties.admin.visitmode then return ESX.ShowNotification('❌ Vous êtes déjà en mode visite') end
                        for k,v in pairs(Properties.garage.interior) do
                            Properties.admin.visitmodeGarage[k] = {active = false, name = nil, interior = nil}
                        end
                        Properties.admin.visitmodeGarage[k] = {active = true, name = k, interior = v.interior}
                        Properties.garageSelected = k

                        local ped = PlayerPedId()

                        if Properties.Lastplayerpos2 == nil then
                            Properties.Lastplayerpos2 = GetEntityCoords(ped)
                        end
                        SetEntityCoords(ped, v.interior)
                    end,
                    onUnChecked = function()
                        if Properties.admin.visitmode then return ESX.ShowNotification('❌ Vous êtes déjà en mode visite') end
                        for k,v in pairs(Properties.garage.interior) do
                            Properties.admin.visitmodeGarage[k] = {active = false, name = nil, interior = nil}
                        end
                        Properties.admin.visitmodeGarage[k] = {active = false, name = nil, interior = nil}

                        SetEntityCoords(PlayerPedId(), Properties.Lastplayerpos2)
                    end
                })
            end
        end)

        if not RageUI.Visible(main) and not RageUI.Visible(PropertiesCreate) and not RageUI.Visible(Garage) then
            main = RMenu:DeleteType('main')
        end
    end
end

RegisterCommand('Properties', function()
    local permissionAccess = {['fondateur'] = true, ['responsable'] = true}
    if not permissionAccess[ESX.PlayerData.group] then return end

    Properties:openBuilderMenu()
end)

function Properties:openMenu(k)
    local main = RageUI.CreateMenu('', 'Actions Disponibles')

    local interphoneMenu = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')
    local interphoneMenuPlayerSelected = RageUI.CreateSubMenu(interphoneMenu, '', 'Actions Disponibles')

    local selectedPlayerInterphone = {}

    RageUI.Visible(main, not RageUI.Visible(main))
    FreezeEntityPosition(PlayerPedId(), true)
    while main do Wait(1)
        RageUI.IsVisible(main, function()
            if Properties.PropertiesList[k].owner == 'none' then
                RageUI.Separator(('Propriétée disponible à %s'):format(Properties.PropertiesList[k].type == 'location' and 'la location' or 'l\'achat'))
                if Properties.PropertiesList[k].owner == 'none' and ESX.PlayerData.job.name == 'realestateagent' then
                    RageUI.Checkbox(('Statut de la propriétée (%s)'):format(Properties.PropertiesList[k].open == true and '~g~Ouvert~s~' or '~r~Fermé~s~'), nil, Properties.PropertiesList[k].open, {}, {
                        onChecked = function()
                            Properties.PropertiesList[k].open = true
                            TriggerServerEvent('zmain:properties:locked', k, Properties.PropertiesList[k].open)
                        end,
                        onUnChecked = function()
                            Properties.PropertiesList[k].open = false
                            TriggerServerEvent('zmain:properties:locked', k, Properties.PropertiesList[k].open)
                        end
                    })
                end
                RageUI.WLine()
                RageUI.Button('Définir un ~y~GPS~s~ à l\'agence immobilière', nil, {}, true, {
                    onSelected = function()
                        SetNewWaypoint(-198.9065, -575.1469)
                        ESX.ShowNotification('🧭 GPS défini avec succès')
                    end
                })
            end
            if Properties.PropertiesList[k].owner ~= 'none' then
                RageUI.Separator(('%s %s'):format(k, Properties:ReturnPropertiesData(k).street_name))
                RageUI.WLine()
            end
            if Properties.PropertiesList[k].owner ~= 'none' and Properties.PropertiesList[k].owner ~= tostring(ESX.PlayerData.UniqueID) then
                RageUI.Button('Sonner à la propriété', nil, {}, not Properties.belled[k], {
                    onSelected = function()
                        TriggerEvent('InteractSound_CL:PlayOnOne', 'doorbell', 0.5)
                        Properties.belled[k] = true

                        TriggerServerEvent('zmain:properties:interphone:call', Properties.PropertiesList[k])
                    end
                })
            end
            if Properties.PropertiesList[k].owner == tostring(ESX.PlayerData.UniqueID) then
                RageUI.Checkbox('Propriété Ouverte', nil, Properties.PropertiesList[k].open, {}, {
                    onChecked = function()
                        Properties.PropertiesList[k].open = true
                        TriggerServerEvent('zmain:properties:locked', k, Properties.PropertiesList[k].open)
                    end,
                    onUnChecked = function()
                        Properties.PropertiesList[k].open = false
                        TriggerServerEvent('zmain:properties:locked', k, Properties.PropertiesList[k].open)
                    end
                })
            end
            if Properties:haveEnter(Properties.PropertiesList[k], tostring(ESX.PlayerData.UniqueID)) and Properties.PropertiesList[k].owner ~= 'none' or Properties.PropertiesList[k].open == true then
                RageUI.Button('Entrer dans la propriété', nil, {}, true, {
                    onSelected = function()
                        RageUI.CloseAll()
                        Properties.PropertiesList[k].players[tostring(ESX.PlayerData.UniqueID)] = true
                        TriggerServerEvent('zmain:properties:addPlayer', nil, 'me', k, Properties.PropertiesList[k].players)
                        ESX.ShowNotification('🏠 Vous venez d\'entrer dans la propriété')
                    end
                })
            end
            if Properties.PropertiesList[k].owner == tostring(ESX.PlayerData.UniqueID) then
                RageUI.Button('Interphone', nil, {}, true, {
                    onSelected = function()
                        
                    end
                }, interphoneMenu)
            end
        end)

        RageUI.IsVisible(interphoneMenu, function()
            RageUI.Separator('Interphone')
            RageUI.WLine()
            for k,v in pairs(Properties.PropertiesList[k].interphone) do
                RageUI.Button(('(%s) %s | %s %s'):format(v.UniqueID, v.name, v.firstname, v.lastname), nil, {RightLabel = v.at}, true, {
                    onSelected = function()
                        selectedPlayerInterphone = v
                    end
                }, interphoneMenuPlayerSelected)
            end
        end)

        if not RageUI.Visible(main) and not RageUI.Visible(interphoneMenu) and not RageUI.Visible(interphoneMenuPlayerSelected) then
            main = RMenu:DeleteType('main')
            FreezeEntityPosition(PlayerPedId(), false)
        end
    end
end

function Properties:openExitMenu(k)
    propertiesData = Properties.PropertiesList[k]
    local main = RageUI.CreateMenu('', 'Actions Disponibles')
    local interphoneMenu = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')
    local interphoneMenuPlayerSelected = RageUI.CreateSubMenu(interphoneMenu, '', 'Actions Disponibles')

    local selectedPlayerInterphone = {}

    RageUI.Visible(main, not RageUI.Visible(main))
    FreezeEntityPosition(PlayerPedId(), true)
    while main do Wait(1)
        RageUI.IsVisible(main, function()
            RageUI.WLine()
            RageUI.Separator(('Propriété %s'):format(k))

            if propertiesData.owner == tostring(ESX.PlayerData.UniqueID) then
                if propertiesData.type == 'location' then
                    RageUI.Separator(('Jours de loyer restant %s'):format(propertiesData.type))
                    RageUI.Separator(('Prix par jour %s$'):format(ESX.Math.GroupDigits(propertiesData.price)))
                    RageUI.Button('Payer des jours de loyer', nil, {}, true, {
                        onSelected = function()
                            
                        end
                    })
                    RageUI.Button('Rendre les clés', nil, {}, true, {
                        onSelected = function()
                            
                        end
                    })
                else
                    RageUI.Separator(('Prix de la propriété %s$'):format(ESX.Math.GroupDigits(propertiesData.price)))
                    RageUI.Button('Vendre la propriété', nil, {}, true, {
                        onSelected = function()
                            KeyboardUtils.use('Taper Y pour valider', function(data)
                                if data == 'Y' or data == 'y' then
                                    TriggerServerEvent('zmain:properties:sell', propertiesData.id)

                                    RageUI.GoBack()
                                end
                            end)
                        end
                    })
                end
            end
            if propertiesData.owner == tostring(ESX.PlayerData.UniqueID) then
                RageUI.Checkbox('Propriété Ouverte', nil, Properties.PropertiesList[k].open, {}, {
                    onChecked = function()
                        Properties.PropertiesList[k].open = true
                        TriggerServerEvent('zmain:properties:locked', k, Properties.PropertiesList[k].open)
                    end,
                    onUnChecked = function()
                        Properties.PropertiesList[k].open = false
                        TriggerServerEvent('zmain:properties:locked', k, Properties.PropertiesList[k].open)
                    end
                })
                RageUI.Checkbox('Accès au Coffre pour les invités', nil, Properties.PropertiesList[k].coffreOpen, {}, {
                    onChecked = function()
                        Properties.PropertiesList[k].coffreOpen = true
                        TriggerServerEvent('zmain:properties:lockedCoffre', k, Properties.PropertiesList[k].coffreOpen)
                    end,
                    onUnChecked = function()
                        Properties.PropertiesList[k].coffreOpen = false
                        TriggerServerEvent('zmain:properties:lockedCoffre', k, Properties.PropertiesList[k].coffreOpen)
                    end
                })
                RageUI.Button('Entrer dans le Garage', nil, {}, Properties.PropertiesList[k].open == true and Properties.PropertiesList[k].owner ~= 'none' or Properties:haveEnter(Properties.PropertiesList[k], tostring(ESX.PlayerData.UniqueID)) and Properties.PropertiesList[k].garage, {
                    onSelected = function()
                        TriggerServerEvent('zmain:properties:garage:enter', k, ESX.PlayerData.UniqueID)
                    end
                })
                RageUI.Button('Sortir de la propriété avec tous le monde', nil, {}, true, {
                    onSelected = function()
                        RageUI.CloseAll()
                        Properties.PropertiesList[k].players[tostring(ESX.PlayerData.UniqueID)] = false
                        TriggerServerEvent('zmain:properties:removePlayer', nil, 'all', k, Properties.PropertiesList[k].players)
                        ESX.ShowNotification('🏡 Vous venez de sortir de la proriéété')
                    end
                })
            end
            RageUI.Button('Sortir de la propriété', nil, {}, true, {
                onSelected = function()
                    RageUI.CloseAll()
                    Properties.PropertiesList[k].players[tostring(ESX.PlayerData.UniqueID)] = false
                    TriggerServerEvent('zmain:properties:removePlayer', nil, 'me', k, Properties.PropertiesList[k].players)
                    ESX.ShowNotification('🏡 Vous venez de sortir de la proriéété')
                end
            })
            RageUI.WLine()
            RageUI.Button('Interphone', nil, {}, true, {
                onSelected = function()
                    
                end
            }, interphoneMenu)
        end)

        RageUI.IsVisible(interphoneMenu, function()
            RageUI.Separator('Interphone')
            RageUI.WLine()
            for k,v in pairs(Properties.PropertiesList[k].interphone) do
                RageUI.Button(('(%s) %s | %s %s'):format(v.UniqueID, v.name, v.firstname, v.lastname), nil, {RightLabel = v.at}, true, {
                    onSelected = function()
                        selectedPlayerInterphone = v
                    end
                }, interphoneMenuPlayerSelected)
            end
        end)

        RageUI.IsVisible(interphoneMenuPlayerSelected, function()
            RageUI.Separator('Interphone')
            RageUI.WLine()
            RageUI.Button(('Faire entrer ~y~%s %s~s~'):format(selectedPlayerInterphone.firstname, selectedPlayerInterphone.lastname), nil, {}, true, {
                onSelected = function()
                    TriggerServerEvent('zmain:properties:interphone:call:validateEnter', Properties.PropertiesList[k], selectedPlayerInterphone)

                    RageUI.GoBack()
                end
            })
            RageUI.Button('Refuser l\'entrée', nil, {}, true, {
                onSelected = function()
                    TriggerServerEvent('zmain:properties:interphone:call:refuseEnter', Properties.PropertiesList[k], selectedPlayerInterphone)

                    RageUI.GoBack()
                end
            })
        end)

        if not RageUI.Visible(main) and not RageUI.Visible(interphoneMenu) and not RageUI.Visible(interphoneMenuPlayerSelected) then
            main = RMenu:DeleteType('main')
            FreezeEntityPosition(PlayerPedId(), false)
        end
    end
end

RegisterCommand('fakeCall', function()
    TriggerEvent('InteractSound_CL:PlayOnOne', 'doorbell', 0.5)

    TriggerServerEvent('zmain:properties:interphone:call', Properties.PropertiesList[12])
end)

RegisterNetEvent('zmain:properties:teleport', function(coords)
    DoScreenFadeOut(1300)
    Wait(2300)
    SetEntityCoords(PlayerPedId(), coords)
    DoScreenFadeIn(1300)
end)

RegisterNetEvent('zmain:properties:locked', function(k,statut)
    Properties.PropertiesList[k].open = statut
end)

RegisterNetEvent('zmain:properties:lockedCoffre', function(k,statut)
    Properties.PropertiesList[k].coffreOpen = statut
end)

function Properties:haveEnter(propertiesData, owner)
    local myPlayerData = ESX.GetPlayerData()

    if propertiesData.owner == owner then
        return true
    end

    -- if myPlayerData.job.name == 'realestateagent' then
    --     return true
    -- end

    return false
end

function Properties:ReturnPropertiesData(propertiesId)
    if Properties.PropertiesList[propertiesId] == nil then 
        return {}
    end

    return Properties.PropertiesList[propertiesId]
end

RegisterNetEvent('zmain:properties:interphone:call:requestCall', function(propertiesData)
    if not Properties.PropertiesList[propertiesData.id] then return end

    TriggerEvent('InteractSound_CL:PlayOnOne', 'doorbell', 0.5)

    Properties.PropertiesList[propertiesData.id].interphone = propertiesData.interphone

    if propertiesData.owner == tostring(ESX.PlayerData.UniqueID) then
        ESX.ShowNotification('📞 Une personne viens de sonner à votre propriété')
    end
end)

RegisterNetEvent('zmain:properties:interphone:update', function(propertiesData)
    if not Properties.PropertiesList[propertiesData.id] then return end

    Properties.PropertiesList[propertiesData.id].interphone = propertiesData.interphone
end)

RegisterNetEvent('zmain:properties:updateCallWithPlayerCall', function(propertiesData)
    Properties.belled[propertiesData.id] = false
end)

RegisterNetEvent('zmain:properties:changePlayerSate', function(pid, state)
    Properties.isIn[pid] = state
end)