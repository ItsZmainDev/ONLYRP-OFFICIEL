adminManagement = {
    Service = false,

    -- Options Personnel
    NoClip = false,
    Gamertags = false,
    MyName = false,
    Blips = false,
    InfoReports = false,
    SongReports = false,
    isSpectateMod = false,
    object = false,
    gunInfos = false,

    -- Vehicles
    FreezeUnFreeze = false,

    -- Players
    Players = {},
    PlayersCount = 0,
    SearchPlayer = nil,
    ZoneShow = false,
    staffList = {},
    staffsCounts = 0,
    SelectedPlayer = {},
    FreezeUnfreeze = false,
    accounts = {},
    AddJobList = {},
    AddGradeListWithJob = {},
    AddSearchJob = nil,
    SelectedPlayerJobList = {},
    SelectedJobType = 1,
    WarnList = {},
    WarnListSearch = nil,

    -- Reports
    Reports = {},
    ReportsInfo = false,
    MyReports = 0,
    ReportsCount = 0,
    SelectedReport = {},
    Filters = false,
    FiltersList = {'Tous', 'Pris en charge', 'Non pris en charge'},
    FiltersListIndex = 1,

    -- Server
    JobList = {},
    GradeList = {},
    ItemsList = {},
    SellingList = {},
    CreateDrugs = {
        Laboratory = {
            active = false,
            list = {
                ['weed_laboratory'] = {
                    name = 'weed_laboratory',
                    label = 'Laboratoire de Weed',
                    active = false,
                    exit = vector3(1066.15, -3183.38, -40.15),
                    exitHeading = 90.0,
                    interiorAtCoords = vector3(1051.491, -3196.536, -39.14842),
                    management = vector3(1044.605, -3194.886, -38.15789),
                    ipls = true,
                    iplsList = {
                        'weed_drying',
                        'weed_production',
                        'weed_set_up',
                        'weed_standard_equip',
                        'weed_upgrade_equip',
                        'weed_growtha_stage1',
                        'weed_growtha_stage2',
                        'weed_growtha_stage3',
                        'weed_growthb_stage1',
                        'weed_growthb_stage2',
                        'weed_growthb_stage3',
                        'weed_growthc_stage1',
                        'weed_growthc_stage2',
                        'weed_growthc_stage3',
                        'weed_growthd_stage1',
                        'weed_growthd_stage2',
                        'weed_growthd_stage3',
                        'weed_growthe_stage1',
                        'weed_growthe_stage2',
                        'weed_growthe_stage3',
                        'weed_growthf_stage1',
                        'weed_growthf_stage2',
                        'weed_growthf_stage3',
                        'weed_growthg_stage1',
                        'weed_growthg_stage2',
                        'weed_growthg_stage3',
                        'weed_growthh_stage1',
                        'weed_growthh_stage2',
                        'weed_growthh_stage3',
                        'weed_growthi_stage1',
                        'weed_growthi_stage2',
                        'weed_growthi_stage3',
                        'weed_hosea',
                        'weed_hoseb',
                        'weed_hosec',
                        'weed_hosed',
                        'weed_hosee',
                        'weed_hosef',
                        'weed_hoseg',
                        'weed_hoseh',
                        'weed_hosei',
                        'light_growtha_stage23_standard',
                        'light_growthb_stage23_standard',
                        'light_growthc_stage23_standard',
                        'light_growthd_stage23_standard',
                        'light_growthe_stage23_standard',
                        'light_growthf_stage23_standard',
                        'light_growthg_stage23_standard',
                        'light_growthh_stage23_standard',
                        'light_growthi_stage23_standard',
                        'light_growtha_stage23_upgrade',
                        'light_growthb_stage23_upgrade',
                        'light_growthc_stage23_upgrade',
                        'light_growthc_stage23_upgrade',
                        'light_growthd_stage23_upgrade',
                        'light_growthe_stage23_upgrade',
                        'light_growthf_stage23_upgrade',
                        'light_growthg_stage23_upgrade',
                        'light_growthh_stage23_upgrade',
                        'light_growthi_stage23_upgrade',
                        'weed_low_security',
                        'weed_security_upgrade',
                        'weed_chairs'
                    },
                },
                ['coke_laboratory'] = {
                    name = 'coke_laboratory',
                    label = 'Laboratoire de Coke',
                    active = false,
                    exit = vector3(1066.15, -3183.38, -40.15),
                    exitHeading = 90.0,
                    interiorAtCoords = vector3(1051.491, -3196.536, -39.14842),
                    ipls = false,
                },
                ['meth_laboratory'] = {
                    name = 'meth_laboratory',
                    label = 'Laboratoire de Meth',
                    active = false,
                    exit = vector3(1066.15, -3183.38, -40.15),
                    exitHeading = 90.0,
                    interiorAtCoords = vector3(1051.491, -3196.536, -39.14842),
                    ipls = false,
                },
            },
            Index = 1
        }
    },
    SelectedDrugs = {},
    SelectedDrugsCategorie = 'recolte',

    -- Society
    SelectedSociety = {},
    SelectedSocietyZoneTeleport = {'Blips', 'Coffre', 'Boss'},
    SelectedSocietyZoneTeleportIndex = 1,

    -- ID Unique
    UniqueIDSearch = {},
    UniqueIDSearchBoutiqueHistory = {},
    UniqueIDSearchBoutiqueHistorySearch = nil,
    WeaponSearch = nil,
    SelectedWeapon = {},
    UniqueIDPlayerInventoryWeaponSelectK = nil,

    -- Utils
    LastPlayerPos = {},

    -- Events
    EventPos = true,
    EventPosList = {'Maze Bank Arena (Scene Fashion)', 'Maze Bank Arena (Plafond Milieux)'},
    EventPosListIndex = 1,
    EventPosListData = {
        [1] = {
            pos = vector3(-329.3486328125, -1970.4323730469, 21.603454589844),
            pos2 = vector3(-325.30215454102, -1973.9567871094, 21.603446960449)
        },
        [2] = {
            pos = vector3(-323.94323730469, -1968.1636962891, 36.276332855225)
        },
    },

    -- EventFireWorksData
    EventFireWorksDef = true,
    EventPosListFireWorks = {'Fontaine de feux', 'Explosion de feux', 'Explosion étoile blanche'},
    EventPosListFireWorskIndex = 1,
    TimeFireWorks = 0,
    EventFireWorksNotDef = nil,
    EventFireWorksNotZoneDef = {},

    -- give vehicle
    vehicleModel = nil,
    vehicleLabel = nil,
    vehicleType = nil,
    vehicleBoutique = false,
    vehicleData = {},
    searchGarage = nil,
    garageSelected = {active = false, garageid = 1},
    vehicleGarageid = 1,

    -- sanctions
    jails = {},
}

function sortGroupTable(t)
    local sorted = {}
    for k, v in pairs(t) do
        sorted[#sorted + 1] = v
    end
    table.sort(sorted, function(a, b)
        return a.id < b.id
    end)
    return (sorted)
end

function adminManagement:SetCoords(player, coords)
    SetEntityCoords(player, coords)
end

RegisterNetEvent('zmain:admin:addReport', function(a, data, value)
    adminManagement.Reports = data

    if value == 'new' then
        adminManagement.ReportsCount = 0
        
        for k,v in pairs(adminManagement.Reports) do
            adminManagement.ReportsCount = adminManagement.ReportsCount + 1
        end
        
        if adminManagement.SongReports then
            TriggerEvent('InteractSound_CL:PlayOnOne', 'tutu', 0.5)
        end
    end
end)

RegisterNetEvent('zmain:reports:refreh:service', function(reportList)
    adminManagement.Reports = reportList

    for k,v in pairs(adminManagement.Reports) do
        adminManagement.ReportsCount = adminManagement.ReportsCount + 1
    end
end)

RegisterNetEvent('zmain:admin:removeReport', function(v, k, data, value)
    adminManagement.Reports = data
    adminManagement.ReportsCount = 0

    for k,v in pairs(adminManagement.Reports) do
        adminManagement.ReportsCount = adminManagement.ReportsCount + 1
    end
end)

RegisterNetEvent('zmain:admin:addPlayer', function(data)
    adminManagement.Players = data
    adminManagement.PlayersCount = 0

    for k,v in pairs(adminManagement.Players) do
        adminManagement.PlayersCount = adminManagement.PlayersCount + 1
    end
end)

RegisterNetEvent('zmain:admin:addStaff', function(data)
    adminManagement.staffList = data
    adminManagement.staffsCounts = 0

    for k,v in pairs(adminManagement.staffList) do
        adminManagement.staffsCounts = adminManagement.staffsCounts + 1
    end
end)

RegisterNetEvent('zmain:admin:addStaff:service', function(id, newVal)
    adminManagement.staffList[id].service = newVal
end)

RegisterNetEvent('zmain:admin:teleport', function(coords)
    adminManagement:SetCoords(PlayerPedId(), vector3(coords))
end)

RegisterNetEvent('zmain:admin:requestScreen', function(target, license, sourceName)
    exports['screenshot-basic']:requestScreenshotUpload('https://discord.com/api/webhooks/1090299572980555796/SmSwNOz5dLp4kdUty0H578k-12e8UT2pQeKYKyCzNmnZzoxom3LdJfeDao_9Rbr_Wj_E', "files[]", function(data)
        TriggerServerEvent('zmain:admin:sendLogsScreen', target, license, json.decode(data), sourceName)
    end)
end)

AddEventHandler('onResourceStart', function()
    TriggerServerEvent('zmain:admin:restart')
end)

RegisterNetEvent('zmain:admin:restart', function(source)
    TriggerServerEvent('zmain:admin:restart')
end)

RegisterNetEvent('zmain:admin:service', function(value)
    adminManagement.Service = value

    local pPed = PlayerId()

    CreateThread(function()
        local playerPed = PlayerPedId()
        while adminManagement.Service do
            Wait(5000)
            SetEntityInvincible(playerPed, true)
            
            if not adminManagement.Service then
                SetEntityInvincible(playerPed, false)
                break
            end
        end
    end)

    if adminManagement.Service and Config.Staff.HavePermission('OutFit', 'Data') then
        while not exports['zConnect']:playerLoaded() do Wait(1) end


        local playerPed = PlayerPedId()
        while adminManagement.Service do 
            Wait(1000)
            local model = GetEntityModel(Player.playerPed)

            if model ~= `mp_m_freemode_01` and model ~= `mp_f_freemode_01` then
                ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
                    local playerHealth = GetEntityHealth(Player.playerPed)
                    TriggerEvent('skinchanger:forceLoadSkin', skin, playerHealth)
                end)
            end

            TriggerEvent('skinchanger:getSkin', function(skin)
                if model == `mp_m_freemode_01` then
                    clothesSkin = {
                        ['bags_1'] = 0, ['bags_2'] = 0,
                        ['tshirt_1'] = 15, ['tshirt_2'] = 0,
                        ['torso_1'] = 178, ['torso_2'] = 3,
                        ['arms'] = 33,
                        ['pants_1'] = 77, ['pants_2'] = 3,
                        ['shoes_1'] = 55, ['shoes_2'] = 3,
                        ['mask_1'] = 0, ['mask_2'] = 0,
                        ['bproof_1'] = 0,
                        ['chain_1'] = 0,
                        ['helmet_1'] = 91, ['helmet_2'] = 3,
                    }
                elseif model == `mp_f_freemode_01` then
                    clothesSkin = {
                        ['bags_1'] = 0, ['bags_2'] = 0,
                        ['tshirt_1'] = 6,['tshirt_2'] = 0,
                        ['torso_1'] = 180, ['torso_2'] = 3,
                        ['arms'] = 3, ['arms_2'] = 0,
                        ['pants_1'] = 79, ['pants_2'] = 3,
                        ['shoes_1'] = 58, ['shoes_2'] = 3,
                        ['mask_1'] = 0, ['mask_2'] = 0,
                        ['bproof_1'] = 0,
                        ['chain_1'] = 0,
                        ['helmet_1'] = 91, ['helmet_2'] = 3,
                    }
                end
                TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
            end)
            
            SetEntityInvincible(playerPed, true)
            
            if not adminManagement.Service then
                SetEntityInvincible(playerPed, false)
                break
            end
        end

        TriggerEvent('esx:restoreLoadout')

        if Config.Staff.HavePermission('OutFit', 'Data') then
            adminManagement.InfoReports = true
            adminManagement.SongReports = true
            adminManagement.MyName = true
            Blips()
            showNames(true)
        end

        local playerHealth = GetEntityHealth(Player.playerPed)
        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
            TriggerEvent('skinchanger:forceLoadSkin', skin, playerHealth)
        end)

        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
            local isMale = skin.sex == 0


            TriggerEvent('skinchanger:loadDefaultModel', isMale, function()
                ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                    TriggerEvent('skinchanger:loadSkin', skin)
                    TriggerEvent('esx:restoreLoadout')
                end)
            end)
        end)

        adminManagement.InfoReports = false
        adminManagement.SongReports = false
        adminManagement.MyName = false
        Blips()
        showNames(false)
    end
end)

function adminManagement:removePermissions()
    if adminManagement.NoClip then
        NoClip()
    end
    adminManagement.Service = false adminManagement.Gamertags = false adminManagement.MyName = false adminManagement.Blips = false adminManagement.InfoReports = false adminManagement.SongReports = false adminManagement.NoClip = false
end

function adminManagement:staffMenu()
    
    while not ESXLoaded do Wait(1) end

    local main = RageUI.CreateMenu('', 'Actions Disponibles')

    local actionsPersonnel = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')

    local playersList = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')
    local selectedPlayer = RageUI.CreateSubMenu(playersList, '', 'Actions Disponibles')
    local infoPlayer = RageUI.CreateSubMenu(selectedPlayer, '', 'Actions Disponibles')
    local accountsPlayer = RageUI.CreateSubMenu(infoPlayer, '', 'Actions Disponibles') 
    local jobPlayer = RageUI.CreateSubMenu(infoPlayer, '', 'Actions Disponibles')
    local addJobPlayer = RageUI.CreateSubMenu(selectedPlayer, '', 'Actions Disponibles')
    local addJobPlayerList = RageUI.CreateSubMenu(addJobPlayer, '', 'Actions Disponibles')
    local addJobGradeWithJobList = RageUI.CreateSubMenu(addJobPlayerList, '', 'Actions Disponibles')
    local changePlayerGroup = RageUI.CreateSubMenu(selectedPlayer, '', 'Actions Disponibles')
    local WarnListPlayer = RageUI.CreateSubMenu(selectedPlayer, '', 'Actions Disponibles')

    local staffLists = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')

    local vehiclesOptions = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')

    local serverOptions = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')
    local openCreateSociety = RageUI.CreateSubMenu(serverOptions, '', 'Actions Disponibles')
    local openEditSociety = RageUI.CreateSubMenu(serverOptions, '', 'Actions Disponibles')
    local openEditSelectedSociety = RageUI.CreateSubMenu(openEditSociety, '', 'Actions Disponibles')
    local openInformationsSociety = RageUI.CreateSubMenu(openEditSelectedSociety, '', 'Actions Disponibles')
    local weaponsSell = RageUI.CreateSubMenu(serverOptions, '', 'Actions Disponibles')
    local weaponsSellGroupList = RageUI.CreateSubMenu(weaponsSell, '', 'Actions Disponibles')
    local createDrugs = RageUI.CreateSubMenu(serverOptions, '', 'Actions Disponibles')
    local createCircuit = RageUI.CreateSubMenu(createDrugs, '', 'Actions Disponibles')
    local editCircuit = RageUI.CreateSubMenu(createDrugs, '', 'Actions Disponibles')
    local editCircuit2 = RageUI.CreateSubMenu(editCircuit, '', 'Actions Disponibles')
    local editPosWithCategorie_drugs = RageUI.CreateSubMenu(editCircuit2, '', 'Actions Disponibles')
    local editSellDrugs = RageUI.CreateSubMenu(createDrugs, '', 'Actions Disponibles')

    local reportsList = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')
    local selectedReport = RageUI.CreateSubMenu(reportsList, '', 'Actions Disponibles')
    local infoReportPlayer = RageUI.CreateSubMenu(selectedReport, '', 'Actions Disponibles')
    local accountsReportPlayer = RageUI.CreateSubMenu(infoReportPlayer, '', 'Actions Disponibles') 
    local jobReportPlayer = RageUI.CreateSubMenu(infoReportPlayer, '', 'Actions Disponibles')
    local addJobReportPlayer = RageUI.CreateSubMenu(selectedReport, '', 'Actions Disponibles')
    local addJobReportPlayerList = RageUI.CreateSubMenu(addJobReportPlayer, '', 'Actions Disponibles')
    local addReportJobGradeWithJobList = RageUI.CreateSubMenu(addJobReportPlayerList, '', 'Actions Disponibles')
    local changeReportPlayerGroup = RageUI.CreateSubMenu(selectedReport, '', 'Actions Disponibles')

    local SearchUniqueID = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')
    local UniqueIDresult = RageUI.CreateSubMenu(SearchUniqueID, '', 'Actions Disponibles')
    local UniqueIDPlayerInventory = RageUI.CreateSubMenu(UniqueIDresult, '', 'Actions Disponibles')
    local UniqueIDPlayerInventoryWeaponSelect = RageUI.CreateSubMenu(UniqueIDPlayerInventory, '', 'Actions Disponibles')
    local UniqueIDPlayerBoutiqueHistory = RageUI.CreateSubMenu(UniqueIDresult, '', 'Actions Disponibles')
    local WeaponListIDUnique = RageUI.CreateSubMenu(UniqueIDresult, '', 'Actions Disponibles')
    local UniqueIDPlayerDataGIVE_VEHICLE = RageUI.CreateSubMenu(UniqueIDresult, '', 'Actions Disponibles')
    local UniqueIDPlayerDataGIVE_VEHICLE_GARAGE = RageUI.CreateSubMenu(UniqueIDPlayerDataGIVE_VEHICLE, '', 'Actions Disponibles')
    local WarnListPlayerUniqueID = RageUI.CreateSubMenu(UniqueIDresult, '', 'Actions Disponibles')
    local changePlayerGroupWithUniqueID = RageUI.CreateSubMenu(UniqueIDresult, '', 'Actions Disponibles')
    local UniqueIDPlayerDataGIVE_Item = RageUI.CreateSubMenu(UniqueIDresult, '', 'Actions Disponibles')

    local eventOptions = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')
    local truckEvent = RageUI.CreateSubMenu(eventOptions, '', 'Actions Disponibles')
    local openEventCreator = RageUI.CreateSubMenu(eventOptions, '', 'Actions Disponibles')
    local fireWorksEvent = RageUI.CreateSubMenu(eventOptions, '', 'Actions Disponibles')

    RageUI.Visible(main, not RageUI.Visible(main))
    while main do Wait(1)
        RageUI.IsVisible(main, function()
            if not (Config.Staff.HavePermission('Menu', 'openMenu')) then adminManagement:removePermissions() RageUI.CloseAll() end

            -- if not adminManagement.Service then
            --     RageUI.Info('Informations Hors-Service', {'Report(s)', 'Staff(s)', 'Group'}, {adminManagement.ReportsCount, adminManagement.staffsCounts, Config.Staff.Group[ESX.PlayerData.group]})
            -- end

            if (Config.Staff.HavePermission('Menu', 'openMenu')) then
                RageUI.Checkbox('Service', nil, adminManagement.Service, {}, {
                    onChecked = function()
                        TriggerServerEvent('zmain:admin:service')
                    end,
                    onUnChecked = function()
                        exports['ZmainUI']:hide()
                        TriggerServerEvent('zmain:admin:service')
                        adminManagement.Gamertags = false
                        adminManagement.MyName = false
                        adminManagement.Blips = false
                        adminManagement.InfoReports = false
                        adminManagement.SongReports = false
                        if adminManagement.NoClip then
                            NoClip()
                        end
                        if Config.Staff.HavePermission('OutFit', 'Data') then
                            Citizen.CreateThread(function()
                                ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
                                    local isMale = skin.sex == 0
                
                
                                    TriggerEvent('skinchanger:loadDefaultModel', isMale, function()
                                        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                                            TriggerEvent('skinchanger:loadSkin', skin)
                                            TriggerEvent('esx:restoreLoadout')
                                        end)
                                    end)
                                end)
                            end)
                        end
                    end
                })
            end
            if not adminManagement.Service then
                if Config.Staff.HavePermission('OutFit', 'Data') or ESX.PlayerData.group == 'gerant' then
                    if (Config.Staff.HavePermission('Modules', 'reportsSong')) then
                        RageUI.Checkbox('Son des reports (Hors-Service)', nil, adminManagement.SongReports, {}, {
                            onChecked = function()
                                adminManagement.SongReports = true
                            end,
                            onUnChecked = function()
                                adminManagement.SongReports = false
                            end
                        })
                    end
                end
            end
            if adminManagement.Service then
                RageUI.WLine()
                if (Config.Staff.HavePermission('Menu', 'personnalOptions')) then
                    RageUI.Button('Options Personnel', nil, {}, true, {
                        onSelected = function()
                            
                        end
                    }, actionsPersonnel)
                end
                if (Config.Staff.HavePermission('Menu', 'vehiclesOptions')) then
                    RageUI.Button('Options Véhicules', nil, {}, true, {
                        onSelected = function()
                        end
                    }, vehiclesOptions)
                end
                if (Config.Staff.HavePermission('Menu', 'serverOptions')) then
                    RageUI.Button('Options Supplémentaires', nil, {}, true, {
                        onSelected = function()
                        end
                    }, serverOptions)
                end
                if (Config.Staff.HavePermission('Menu', 'staffsList')) then
                    RageUI.Button(('Gestion Serveur'), nil, {}, true, {
                        onSelected = function()
                            
                        end
                    }, staffLists)
                end
                if (Config.Staff.HavePermission('Menu', 'events')) then
                    RageUI.Button('Evenements', nil, {}, true, {
                        onSelected = function()
                        end
                    }, eventOptions)
                end
                if (Config.Staff.HavePermission('Menu', 'playersList')) then
                    RageUI.Button(('Liste des Joueurs (~p~%s~s~)'):format(adminManagement.PlayersCount), nil, {}, true, {
                        onSelected = function()
                            
                        end
                    }, playersList)
                end
                if (Config.Staff.HavePermission('Menu', 'uniqueidOptions')) then
                    RageUI.Button('Options ID Unique', nil, {}, true, {
                        onSelected = function()
                            
                        end
                    }, SearchUniqueID)
                end
                if (Config.Staff.HavePermission('Menu', 'reports')) then
                    RageUI.Button(('Reports (~p~%s~s~)'):format(adminManagement.ReportsCount), nil, {}, true, {
                        onSelected = function()
                            
                        end
                    }, reportsList)
                end
                RageUI.WLine()
            end
        end)

        RageUI.IsVisible(actionsPersonnel, function()
            if (Config.Staff.HavePermission('Modules', 'noClip')) then
                RageUI.Checkbox('Noclip', nil, adminManagement.NoClip, {}, {
                    onChecked = function()
                        NoClip()
                    end,
                    onUnChecked = function()
                        NoClip()
                    end
                })
            end
            if (Config.Staff.HavePermission('Modules', 'gamerTags')) then
                RageUI.Checkbox('Gamertag', nil, adminManagement.Gamertags, {}, {
                    onChecked = function()
                        showNames(true)
                    end,
                    onUnChecked = function()
                        showNames(false)
                    end
                })
                RageUI.Checkbox('Afficher mon nom', nil, adminManagement.MyName, {}, {
                    onChecked = function()
                        adminManagement.MyName = true
                    end,
                    onUnChecked = function()
                        adminManagement.MyName = false
                    end
                })
            end
            if (Config.Staff.HavePermission('Modules', 'blips')) then
                RageUI.Checkbox('Blips', nil, adminManagement.Blips, {}, {
                    onChecked = function()
                        Blips()
                    end,
                    onUnChecked = function()
                        Blips()
                    end
                })
            end
            if (Config.Staff.HavePermission('Modules', 'reportsInfos')) then
            RageUI.Checkbox('Informations reports', nil, adminManagement.InfoReports, {}, {
                    onChecked = function()
                        adminManagement.InfoReports = true
                    end,
                    onUnChecked = function()
                        adminManagement.InfoReports = false

                        exports['ZmainUI']:hide()
                    end
                })
            end
            if (Config.Staff.HavePermission('Modules', 'reportsSong')) then
                RageUI.Checkbox('Son des reports', nil, adminManagement.SongReports, {}, {
                    onChecked = function()
                        adminManagement.SongReports = true
                    end,
                    onUnChecked = function()
                        adminManagement.SongReports = false
                    end
                })
            end
            if (Config.Staff.HavePermission('Modules', 'objects')) then
                RageUI.Checkbox('Objets', nil, adminManagement.object, {}, {
                    onChecked = function()
                        setobject()
                    end,
                    onUnChecked = function()
                        setobject()
                    end
                })
            end
            if (Config.Staff.HavePermission('Modules', 'gunInfos')) then
                RageUI.Checkbox('Pistolet', nil, adminManagement.gunInfos, {}, {
                    onChecked = function()
                        TriggerEvent('zmain:admin:gunInfos')
                    end,
                    onUnChecked = function()
                        TriggerEvent('zmain:admin:gunInfos')
                    end
                })
            end
        end)

        RageUI.IsVisible(playersList, function()
            RageUI.Button('Rechercher', nil, {RightLabel = adminManagement.SearchPlayer or ''}, true, {
                onSelected = function()
                    KeyboardUtils.use('Rechercher', function(data)
                        adminManagement.SearchPlayer = data
                    end)
                end
            })
            if (adminManagement.SearchPlayer) then
                RageUI.Button('❌ Arrêter la Recherche', nil, {}, true, {
                    onSelected = function()
                        adminManagement.SearchPlayer = nil
                    end
                })
            end
            RageUI.Checkbox('Zone Uniquement', nil, adminManagement.ZoneShow, {}, {
                onChecked = function()

                    if adminManagement.SearchPlayer == true then return end

                    adminManagement.ZoneShow = true
                end,
                onUnChecked = function()

                    if adminManagement.SearchPlayer == true then return end

                    adminManagement.ZoneShow = false
                end
            })
            if (not adminManagement.ZoneShow) then
                for k,v in pairs(adminManagement.Players) do
                    local playerName = ('[%s] %s (U ~r~%s~s~ | T ~r~%s~s~)'):format(v.group == 'user' and 'Joueur' or Config.Staff.Group[v.group], v.name, v.UniqueID, k)
                    if not adminManagement.SearchPlayer then
                        RageUI.Button(playerName, nil, {}, true, {
                            onSelected = function()
                                adminManagement.SelectedPlayer = v
                            end
                        }, selectedPlayer)
                    else
                        if string.match(string.lower(playerName), string.lower(adminManagement.SearchPlayer)) then 
                            RageUI.Button(playerName, nil, {}, true, {
                                onSelected = function()
                                    adminManagement.SelectedPlayer = v
                                end
                            }, selectedPlayer)
                        end
                    end
                end
            else
                for _, player in ipairs(GetActivePlayers()) do
                    local sID = GetPlayerServerId(player)
                    if (adminManagement.Players[sID]) then 
                        local playerName = ('[%s] %s (U ~r~%s~s~ | T ~r~%s~s~)'):format(adminManagement.Players[sID].group == 'user' and 'Joueur' or Config.Staff.Group[adminManagement.Players[sID].group], adminManagement.Players[sID].name == nil and '*Invalide*' or adminManagement.Players[sID].name, adminManagement.Players[sID].UniqueID, sID)
                        if adminManagement.SearchPlayer then 
                            if string.match(string.lower(playerName), string.lower(adminManagement.searchName)) then 
                                RageUI.Button(playerName, nil, {}, true, {
                                    onSelected = function()
                                        adminManagement.SelectedPlayer = adminManagement.Players[sID]
                                    end
                                }, selectedPlayer)
                            end
                        else
                            RageUI.Button(playerName, nil, {}, true, {
                                onSelected = function()
                                    adminManagement.SelectedPlayer = adminManagement.Players[sID]
                                end
                            }, selectedPlayer)
                        end
                    end
                end
            end
        end)

        RageUI.IsVisible(selectedPlayer, function()
            RageUI.Separator(('[%s] %s (U ~r~%s~s~ | T ~r~%s~s~)'):format(adminManagement.SelectedPlayer.group == 'user' and 'Joueur' or adminManagement.SelectedPlayer.group, adminManagement.SelectedPlayer.name, adminManagement.SelectedPlayer.UniqueID, adminManagement.SelectedPlayer.id))
            if (adminManagement.Players[adminManagement.SelectedPlayer.id] ~= nil) then
                if (Config.Staff.HavePermission('ManagePlayers', 'goto')) then
                    RageUI.Button('Se Téléporter', nil, {}, true, {
                        onSelected = function()
                            ExecuteCommand('goto '..adminManagement.SelectedPlayer.UniqueID)
                            -- TriggerServerEvent('zmain:admin:goto', adminManagement.SelectedPlayer.id)
                        end
                    })
                end
                if (Config.Staff.HavePermission('ManagePlayers', 'bring')) then
                    RageUI.Button('Téléporter sur moi', nil,  {}, true, {
                        onSelected = function()
                            ExecuteCommand('tp '..adminManagement.SelectedPlayer.UniqueID)
                            -- TriggerServerEvent('zmain:admin:bring', adminManagement.SelectedPlayer.id, GetEntityCoords(PlayerPedId()))
                            TriggerServerEvent('zmain:admin:getPosForRreturnPlayer', adminManagement.SelectedPlayer.id)
                        end
                    })
                end
                RageUI.Button('Retourner', nil, {}, true, {
                    onSelected = function()
                        if (adminManagement.LastPlayerPos[adminManagement.SelectedPlayer.id] == nil) then return end

                        TriggerServerEvent('zmain:admin:player:return', adminManagement.SelectedPlayer.id, adminManagement.LastPlayerPos[adminManagement.SelectedPlayer.id].pos)
                    end
                })
                RageUI.Button('Freeze Unfreeze', nil, {}, true, {
                    onSelected = function()
                        if (adminManagement.FreezeUnfreeze) then
                            adminManagement.FreezeUnfreeze = false
                            TriggerServerEvent('zmain:admin:freezeunfreezeplayer', adminManagement.SelectedPlayer.id, 'unfreeze')
                            ESX.ShowNotification('✔️ Joueur unfreeze avec succès')
                        else
                            adminManagement.FreezeUnfreeze = true
                            TriggerServerEvent('zmain:admin:freezeunfreezeplayer', adminManagement.SelectedPlayer.id, 'freeze')
                            ESX.ShowNotification('✔️ Joueur freeze avec succès')
                        end
                    end
                })
                if (Config.Staff.HavePermission('ManagePlayers', 'screen')) then
                    RageUI.Button('Screen', nil, {}, true, {
                        onSelected = function()
                            TriggerServerEvent('zmain:admin:screen', adminManagement.SelectedPlayer.id)
                            ESX.ShowNotification('📷 Vous retrouverez le screen dans les logs')
                        end
                    })
                end
                if (Config.Staff.HavePermission('ManagePlayers', 'spectate')) then
                    RageUI.Button('Spectate', nil, {}, true, {
                        onSelected = function()
                            RageUI.CloseAll()
                            Wait(750)
                            TriggerServerEvent('zmain:admin:spectatePlayer', tonumber(adminManagement.SelectedPlayer.UniqueID))
                        end
                    })
                end
                if Config.Staff.HavePermission('ManagePlayers', 'Message') then
                    RageUI.Button('Envoyer un message', nil, {}, true, {
                        onSelected = function()
                            KeyboardUtils.use('Message', function(data)
                                if data == nil or data == '' then return ESX.ShowNotification('Argument manquant') end
                                
                                TriggerServerEvent('zmain:staff:players:takeMessage', adminManagement.SelectedPlayer.id, data)
                            end)
                        end
                    })
                end
                if (Config.Staff.HavePermission('ManagePlayers', 'gopc')) then
                    RageUI.Button('Téléporter au Parking Central', nil, {}, true, {
                        onSelected = function()
                            TriggerServerEvent('zmain:admin:teleport', adminManagement.SelectedPlayer.id, vector3(234.06896972656, -756.89605712891, 37.856971740723))
                            ESX.ShowNotification('✔️ Joueur téléporter avec succès')
                        end
                    })
                end
                if (Config.Staff.HavePermission('ManagePlayers', 'gomb')) then
                    RageUI.Button('Téléporter au dessus de la Maze Bank', nil, {}, true, {
                        onSelected = function()
                            TriggerServerEvent('zmain:admin:teleport', adminManagement.SelectedPlayer.id, vector3(-75.012283325195, -818.96472167969, 326.17532348633))
                            ESX.ShowNotification('✔️ Joueur téléporter avec succès')
                        end
                    })
                end
                if (Config.Staff.HavePermission('ManagePlayers', 'givepanto')) then
                    RageUI.Button('Donner Panto', nil, {}, not adminManagement.cooldown, {
                        onSelected = function()
                            TriggerServerEvent('zmain:admin:spawnVehicle', adminManagement.SelectedPlayer.id, 'panto')
                            adminManagement.cooldown = true
                            SetTimeout(2500, function()
                                adminManagement.cooldown = false
                            end)
                            ESX.ShowNotification('✔️ Véhicule give avec succès')
                        end
                    })
                end
                if (Config.Staff.HavePermission('ManagePlayers', 'revive')) then
                    RageUI.Button('Revive', nil, {}, true, {
                        onSelected = function()
                            ExecuteCommand("revive " ..adminManagement.SelectedPlayer.UniqueID)
                            ESX.ShowNotification('✔️ Joueur revive avec succès')
                        end
                    })
                end
                if (Config.Staff.HavePermission('ManagePlayers', 'heal')) then
                    RageUI.Button('Heal', nil, {}, true, {
                        onSelected = function()
                            ExecuteCommand("heal " ..adminManagement.SelectedPlayer.UniqueID)
                            ESX.ShowNotification('✔️ Joueur heal avec succès')
                        end
                    })
                end
                if (Config.Staff.HavePermission('ManagePlayers', 'playerinformations')) then
                    RageUI.Button('Informations', nil, {}, true, {
                        onSelected = function()
                            
                        end
                    }, infoPlayer)
                end
                if (Config.Staff.HavePermission('ManagePlayers', 'WARN')) then
                    RageUI.Button('Mettre un Avertissement', nil, {}, true, {
                        onSelected = function()
                            KeyboardUtils.use('Raison', function(data)
                                ExecuteCommand(('warn %s %s'):format(adminManagement.SelectedPlayer.UniqueID, data))
                            end)
                        end
                    })
                    RageUI.Button('Voir la liste des Warns', nil, {}, true, {
                        onSelected = function()
                            ESX.TriggerServerCallback('zmain:admin:getWarnList', function(cb)
                                adminManagement.WarnList = cb
                            end, adminManagement.SelectedPlayer.UniqueID)
                        end
                    }, WarnListPlayer)
                end
                if (Config.Staff.HavePermission('ManagePlayers', 'wipe')) then
                    RageUI.Button('Wipe', nil, {}, true, {
                        onSelected = function()
                            KeyboardUtils.use('Taper Y pour valider', function(data)
                                if data == 'y' or data == 'Y' then
                                    TriggerServerEvent('zmain:admin:players:wipe', adminManagement.SelectedPlayer.id, adminManagement.SelectedPlayer.UniqueID)
                                end
                            end)
                        end
                    })
                end
                if (Config.Staff.HavePermission('ManagePlayers', 'clearinventory')) then
                    RageUI.Button('Clear l\'inventaire', nil, {}, true, {
                        onSelected = function()
                            KeyboardUtils.use('Taper Y pour valider', function(data)
                                local data = tostring(data)
                                if data == 'y' or data == 'Y' then
                                    TriggerServerEvent('zmain:admin:clearInventory', adminManagement.SelectedPlayer.id)
                                end
                            end)
                        end
                    })
                end
                if (Config.Staff.HavePermission('ManagePlayers', 'clearweapons')) then
                    RageUI.Button('Clear les armes', nil, {}, true, {
                        onSelected = function()
                            KeyboardUtils.use('Taper Y pour valider', function(data)
                                local data = tostring(data)
                                if data == 'y' or data == 'Y' then
                                    TriggerServerEvent('zmain:admin:clearWeapon', adminManagement.SelectedPlayer.id)
                                end
                            end)
                        end
                    })
                end
                if (Config.Staff.HavePermission('ManagePlayers', 'changejob')) then
                    RageUI.Button('Changer le job', nil, {}, true, {
                        onSelected = function()

                        end
                    }, addJobPlayer)
                end
                if (Config.Staff.HavePermission('ManagePlayers', 'changegroup')) then
                    RageUI.Button('Changer Groupe', nil, {}, true, {
                        onSelected = function()
                            
                        end
                    }, changePlayerGroup)
                end
            end
        end)

        RageUI.IsVisible(infoPlayer, function()
            RageUI.Button('Argents', nil, {}, true, {
                onSelected = function()
                    ESX.TriggerServerCallback('zmain:admin:getAccounts', function(cb)
                        adminManagement.accounts = cb
                    
                    end, adminManagement.SelectedPlayer.UniqueID)
                end
            }, accountsPlayer)
            RageUI.Button('Jobs', nil, {}, true, {
                onSelected = function()

                end
            }, jobPlayer)
        end)

        RageUI.IsVisible(accountsPlayer, function()
            for k,v in pairs(adminManagement.accounts) do
                if v.cash then
                    RageUI.Button(('Cash (~y~%s~s~)'):format(v.cash), nil, {}, true, {

                    })
                end
                if v.bank then
                    RageUI.Button(('Bank (~y~%s~s~)'):format(v.bank), nil, {}, true, {

                    })
                end
                if v.black_money then
                    RageUI.Button(('Argent Sale (~y~%s~s~)'):format(v.black_money), nil, {}, true, {

                    })
                end
            end
        end)
        
        RageUI.IsVisible(jobPlayer, function()
            RageUI.Button(('Entreprise (~y~%s~s~)'):format(adminManagement.SelectedPlayer.job.label), nil, {}, true, {
                onSelected = function()
                end
            })
            RageUI.Button(('Gang/Organisation (~y~%s~s~)'):format(adminManagement.SelectedPlayer.job2.label), nil, {}, true, {
                onSelected = function()
                end
            })
        end)

        
        RageUI.IsVisible(addJobPlayer, function()
            RageUI.Button('Changer le job en Entreprise', nil, {}, true, {
                onSelected = function()
                    ESX.TriggerServerCallback('zmain:admin:getAllJobs', function(cb)
                        adminManagement.SelectedJobType = 1
                        adminManagement.AddJobList = cb
                    end)
                end
            }, addJobPlayerList)
            RageUI.Button('Changer le job en Gang/Organisation', nil, {}, true, {
                onSelected = function()
                    ESX.TriggerServerCallback('zmain:admin:getAllJobs', function(cb)
                        adminManagement.SelectedJobType = 0
                        adminManagement.AddJobList = cb
                    end)
                end
            }, addJobPlayerList)
        end)

        RageUI.IsVisible(addJobPlayerList, function()
            RageUI.Button('Rechercher', nil, {}, true, {
                onSelected = function()
                    KeyboardUtils.use('Nom/Label/Id du job', function(data)
                        adminManagement.AddSearchJob = data
                    end)
                end
            })
            if (adminManagement.AddSearchJob) then
                RageUI.Button('❌ Arrêter la Recherche', nil, {}, true, {
                    onSelected = function()
                        adminManagement.AddSearchJob = nil
                    end
                })
            end
            for k,v in pairs(adminManagement.AddJobList) do
                local jobData = ('[%s] %s (%s)'):format(k, v.name, v.label)
                if tonumber(v.type) == tonumber(adminManagement.SelectedJobType) then
                    if (not adminManagement.AddSearchJob) then
                        RageUI.Button(jobData, nil, {}, true, {
                            onSelected = function()
                                ESX.TriggerServerCallback('zmain:admin:getGradeWithJob', function(cb)
                                    adminManagement.AddGradeListWithJob = cb
                                    adminManagement.SelectedPlayerJobList = v
                                end, v.name)
                            end
                        }, addJobGradeWithJobList)
                    else
                        if (string.match(string.lower(jobData), string.lower(adminManagement.AddSearchJob))) then 
                            RageUI.Button(jobData, nil, {}, true, {
                                onSelected = function()
                                    ESX.TriggerServerCallback('zmain:admin:getGradeWithJob', function(cb)
                                        adminManagement.AddGradeListWithJob = cb
                                        adminManagement.SelectedPlayerJobList = v
                                    end, v.name)
                                end
                            }, addJobGradeWithJobList)
                        end
                    end
                end
            end
        end)

        RageUI.IsVisible(addJobGradeWithJobList, function()
            for k,v in pairs(adminManagement.AddGradeListWithJob) do
                RageUI.Button(('[%s] %s (%s)'):format(v.grade, v.name, v.label), nil, {}, true, {
                    onSelected = function()
                        KeyboardUtils.use('Taper Y pour valider', function(data)
                            local data = tostring(data)
                            if (data == 'y' or data == 'Y') then
                                if tonumber(adminManagement.SelectedJobType) == 0 then
                                    TriggerServerEvent('zmain:admin:setPlayerJob', adminManagement.SelectedPlayer.id, adminManagement.SelectedPlayerJobList.name, v.grade, 'job2')
                                else
                                    TriggerServerEvent('zmain:admin:setPlayerJob', adminManagement.SelectedPlayer.id, adminManagement.SelectedPlayerJobList.name, v.grade, 'job')
                                end

                                ESX.ShowNotification('✔️ Joueur setJob avec succès')
                            end
                        end)
                    end
                })
            end
        end)

        RageUI.IsVisible(changePlayerGroup, function()
            Config.Staff.Permissions['ServerGroup'][ESX.GetPlayerData().group] = sortGroupTable(Config.Staff.Permissions['ServerGroup'][ESX.GetPlayerData().group])
            for k,v in pairs(Config.Staff.Permissions['ServerGroup'][ESX.GetPlayerData().group]) do
                RageUI.Button(v.label, nil, {}, true, {
                    onSelected = function()
                        TriggerServerEvent('zmain:admin:setGroup', adminManagement.SelectedPlayer.id, v.value)
                        ESX.ShowNotification('✔️ Joueur setgroup avec succès')
                    end
                })
            end
        end)

        RageUI.IsVisible(vehiclesOptions, function()
            if (Config.Staff.HavePermission('VehiclesOptions', 'delveh')) then
                RageUI.Button('Supprimer le véhicule', nil, {}, true, {
                    onActive = function()
                        ClosetVehWithDisplay()
                    end,
                    onSelected = function()
                        local veh = ESX.Game.GetClosestVehicle(GetEntityCoords(PlayerPedId()))

                        TriggerServerEvent('zmain:admin:delVeh', NetworkGetNetworkIdFromEntity(veh))

                        ESX.ShowNotification('✔️ Véhicule supprimé avec succès')
                    end
                })
            end
            if (Config.Staff.HavePermission('VehiclesOptions', 'repairveh')) then
                RageUI.Button('Réparer le véhicule', nil, {}, true, {
                    onActive = function()
                        ClosetVehWithDisplay()
                    end,
                    onSelected = function()
                        local veh = ESX.Game.GetClosestVehicle(GetEntityCoords(PlayerPedId()))
                        
                        TriggerServerEvent('zmain:admin:repairVeh', veh)
                        ESX.ShowNotification('✔️ Véhicule réparé avec succès')
                    end
                })
            end
            if (Config.Staff.HavePermission('VehiclesOptions', 'delvehzone')) then
                RageUI.Button('Supprimer véhicules ( zone )', nil, {}, true, {
                    onSelected = function()
                        KeyboardUtils.use('Définir une zone', function(data)
                            local data = tonumber(data)

                            if data == nil then return end

                            local veh = ESX.Game.GetVehiclesInArea2(GetEntityCoords(PlayerPedId()), data)

                            for i= 1, #veh, 1 do
                                TriggerServerEvent('zmain:admin:delVeh', NetworkGetNetworkIdFromEntity(veh[i]))
                            end
    
                            ESX.ShowNotification(('✔️ Véhicules supprimés dans une zone de %s mètre'):format(data))
                        end)
                    end
                })
            end
            if (Config.Staff.HavePermission('VehiclesOptions', 'repairvehzone')) then
                RageUI.Button('Réparer véhicules ( zone )', nil, {}, true, {
                    onSelected = function()
                        KeyboardUtils.use('Définir une zone', function(data)
                            local data = tonumber(data)

                            if data == nil then return end

                            local veh = ESX.Game.GetVehiclesInArea2(GetEntityCoords(PlayerPedId()), data)

                            for i= 1, #veh, 1 do
                                TriggerServerEvent('zmain:admin:repairVeh', veh[i])
                            end
    
                            ESX.ShowNotification(('✔️ Véhicules réparés dans une zone de %s mètre'):format(data))
                        end)
                    end
                })
            end
            if (Config.Staff.HavePermission('VehiclesOptions', 'cleanVehicle')) then
                RageUI.Button('Nettoyer le véhicule', nil, {}, true, {
                    onSelected = function()
                        local veh = ESX.Game.GetClosestVehicle(GetEntityCoords(PlayerPedId()))
                        SetVehicleDirtLevel(veh, 0)

                        ESX.ShowNotification('✔️ Véhicule nettoyé avec succès')
                    end
                })
            end
            if (Config.Staff.HavePermission('VehiclesOptions', 'spawnveh')) then
                RageUI.Button('Spawn un véhicule', nil, {}, true, {
                    onSelected = function()
                        KeyboardUtils.use('Model', function(data)
                            TriggerServerEvent('zmain:admin:spawnVehicle', GetPlayerServerId(PlayerId()), data)
                        end)
                    end
                })
            end
            if (Config.Staff.HavePermission('VehiclesOptions', 'fullcustom')) then
                RageUI.Button('Upgrade le véhicule au max', nil, {}, true, {
                    onActive = function()
                        ClosetVehWithDisplay()
                    end,
                    onSelected = function()
                        local veh = GetClosestVehicle(GetEntityCoords(PlayerPedId()))

                        TriggerServerEvent('zmain:admin:fullCustomVeh', veh)
                        ESX.ShowNotification('✔️ Véhicule upgrade avec succès')
                    end
                })
            end
            if (Config.Staff.HavePermission('VehiclesOptions', 'returnveh')) then
                RageUI.Button('Retourner le véhicule', nil, {}, true, {
                    onActive = function()
                        ClosetVehWithDisplay()
                    end,
                    onSelected = function()
                        local veh = GetClosestVehicle(GetEntityCoords(PlayerPedId()))
                        
                        TriggerServerEvent('zmain:admin:returnveh', veh)
                        ESX.ShowNotification('✔️ Véhicule retourné avec succès')
                    end
                }) 
            end
            if (Config.Staff.HavePermission('VehiclesOptions', 'freezeunfreeze')) then
                RageUI.Button('Freeze Unfreeze le véhicule', nil, {}, true, {
                    onActive = function()
                        ClosetVehWithDisplay()
                    end,
                    onSelected = function()
                        local veh = ESX.Game.GetClosestVehicle(GetEntityCoords(PlayerPedId()))
                        
                        if IsEntityPositionFrozen(veh) then
                            TriggerServerEvent('zmain:admin:freezeunfreezevehicle', NetworkGetNetworkIdFromEntity(veh), false)
                            ESX.ShowNotification('✔️ Véhicule unfreeze avec succès')
                        else
                            TriggerServerEvent('zmain:admin:freezeunfreezevehicle', NetworkGetNetworkIdFromEntity(veh), true)
                            ESX.ShowNotification('✔️ Véhicule freeze avec succès')
                        end
                    end
                })
            end
        end)

        RageUI.IsVisible(serverOptions, function()
            RageUI.Button('Se téléporter sur un marker', nil, {}, true, {
                onSelected = function()
                    local waypointHandle = GetFirstBlipInfoId(8)

                    if DoesBlipExist(waypointHandle) then
                        Citizen.CreateThread(function()
                            local waypointCoords = GetBlipInfoIdCoord(waypointHandle)
                            local foundGround, zCoords, zPos = false, -500.0, 0.0

                            while not foundGround do
                                zCoords = zCoords + 10.0
                                RequestCollisionAtCoord(waypointCoords.x, waypointCoords.y, zCoords)
                                Citizen.Wait(0)
                                foundGround, zPos = GetGroundZFor_3dCoord(waypointCoords.x, waypointCoords.y, zCoords)

                                if not foundGround and zCoords >= 2000.0 then
                                    foundGround = true
                                end
                            end

                            SetPedCoordsKeepVehicle(PlayerPedId(), waypointCoords.x, waypointCoords.y, zPos)
                        end)
                    else
                        ESX.ShowNotification('Aucun marker')
                    end
                end
            })
            if Config.Staff.HavePermission('ServerOptions', 'createsociety') then
                RageUI.Button('Creer une societe', nil, {}, true, {
                    onSelected = function()
                    end
                }, openCreateSociety)
            end
            if Config.Staff.HavePermission('ServerOptions', 'editsociety') then
                RageUI.Button('Modifier une société', nil, {}, true, {
                    onSelected = function()
                        
                    end
                }, openEditSociety)
            end
            if Config.Staff.HavePermission('ServerOptions', 'creategarage') then
                RageUI.Button('Creer un garage', nil, {}, true, {
                    onSelected = function()
                        RageUI.CloseAll()
                        ExecuteCommand('garages')
                    end
                })
            end
            if Config.Staff.HavePermission('ServerOptions', 'creategang') then
                RageUI.Button('Creer un gang', nil, {}, true, {
                    onSelected = function()
                        RageUI.CloseAll()
                        ExecuteCommand('gangs')
                    end
                })
            end
            if Config.Staff.HavePermission('ServerOptions', 'CreateBlanchiment') then
                RageUI.Button('Creer un batiment de blanchiment', nil, {}, true, {
                    onSelected = function()
                        RageUI.CloseAll()
                        ExecuteCommand('blanchiment')
                    end
                })
            end
            if Config.Staff.HavePermission('ServerOptions', 'weaponsSell') then
                RageUI.Button('Gérer la vente d\'arme', nil, {}, true, {
                    onSelected = function()
                        ESX.TriggerServerCallback('zmain:weapons:getSelling', function(cb)
                            adminManagement.SellingList = cb

                            RageUI.Visible(weaponsSell, true)
                        end)
                    end
                })
            end
            if Config.Staff.HavePermission('ServerOptions', 'createDrugs') then
                RageUI.Button('Gerer la drogue', nil, {}, true, {
                    onSelected = function()

                    end
                }, createDrugs)
            end
        end)

        RageUI.IsVisible(createDrugs, function()
            RageUI.Button('Creer un circuit', nil, {}, true, {
                onSelected = function()
                    
                end
            }, createCircuit)
            RageUI.Button('Gerer les circuits', nil, {}, true, {
                onSelected = function()
                    
                end
            }, editCircuit)
            RageUI.Button('Gérer la vente', nil, {}, true, {
                onSelected = function()
                    
                end
            }, editSellDrugs)
        end)

        RageUI.IsVisible(editSellDrugs, function()
            RageUI.Button('Ajouter une position', nil, {}, true, {
                onSelected = function()
                    KeyboardUtils.use('Message', function(data)
                        if data == nil or data == '' then
                            return
                        end

                        TriggerServerEvent('zmain:drugs:sell:addPos', GetEntityCoords(Player.playerPed), data)
                    end)
                end
            })
            RageUI.WLine()
            for k,v in pairs(Config.Drugs.sell.Position) do
                RageUI.Button(v.pos.x..' '.. v.pos.y.. ' ' .. v.pos.z, '\n[E] pour se téléporter sur le point\n\n'..v.message, {}, true, {
                    onActive = function()
                        
                        if IsControlJustPressed(0,54) then
                            SetEntityCoords(Player.playerPed, vector3(v.pos.x, v.pos.y, v.pos.z))
                        end

                        DrawMarker(1, v.pos.x, v.pos.y, v.pos.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.55, 0.55, 0.55, 240, 255, 0, 255, false, false, 2, false, false, false, false)
                        DrawInstructionBarNotification(v.pos.x, v.pos.y, v.pos.z+0.25, v.pos.x..' '.. v.pos.y.. ' ' .. v.pos.z)

                    end,
                    onSeleted = function()
                        KeyboardUtils('Taper Y pour supprimer la positon', function(data)
                            if data == 'y' or data == 'Y' then
                                TriggerServerEvent('zmain:drugs:sell:delete', v.id)
                            end
                        end)
                    end
                })
            end
        end)

        RageUI.IsVisible(editCircuit, function()
            for k,v in pairs(Config.Drugs.Items) do
                RageUI.Button(('%s (%s) (r-%s) (t-%s)'):format(v.recolte.name, v.recolte.label, #Config.Drugs.Drugs[k]['recolte'], #Config.Drugs.Drugs[k]['traitement']), nil, {RightLabel = '>>'}, true, {
                    onSelected = function()
                        adminManagement.SelectedDrugs = v
                        RageUI.Visible(editCircuit2, true)
                    end
                })
            end
        end)

        RageUI.IsVisible(editCircuit2, function()
            if json.encode(adminManagement.SelectedDrugs) ~= '[]' then
                RageUI.Separator(("Informations de la drogue ~y~%s - %s~s~"):format(adminManagement.SelectedDrugs.recolte.name, adminManagement.SelectedDrugs.recolte.label))

                RageUI.WLine()

                RageUI.Button('Changer le nom', nil, {}, true, {
                    onSelected = function()
                        
                    end
                })
                RageUI.Button('Changer le label', nil, {}, true, {
                    onSelected = function()
                        
                    end
                })
                RageUI.Button('Changer le nom du pochon', nil, {}, true, {
                    onSelected = function()
                        
                    end
                })
                RageUI.Button('Changer le label du pochon', nil, {}, true, {
                    onSelected = function()
                        
                    end
                })
                RageUI.Button('Gérer les positions de recolte', nil, {RightLabel = ('~y~%s~s~'):format(#Config.Drugs.Drugs[adminManagement.SelectedDrugs.recolte.name]['recolte'])}, true, {
                    onSelected = function()
                        adminManagement.SelectedDrugsCategorie = 'recolte'
                    end
                }, editPosWithCategorie_drugs)
                RageUI.Button('Gérer les positions de traitement', nil, {RightLabel = ('~y~%s~s~'):format(#Config.Drugs.Drugs[adminManagement.SelectedDrugs.recolte.name]['traitement'])}, true, {
                    onSelected = function()
                        adminManagement.SelectedDrugsCategorie = 'traitement'
                    end
                }, editPosWithCategorie_drugs)
            end
        end)

        RageUI.IsVisible(editPosWithCategorie_drugs, function()
            RageUI.Separator(('Catégorie: ~y~%s~s~'):format(adminManagement.SelectedDrugsCategorie))
            RageUI.Button('Ajouter une position', nil, {RightLabel = ('~y~%s positions~s~'):format(#Config.Drugs.Drugs[adminManagement.SelectedDrugs.recolte.name][adminManagement.SelectedDrugsCategorie])}, true, {
                onSelected = function()
                    
                end
            })
            RageUI.WLine()
            for k,v in pairs(Config.Drugs.Drugs[adminManagement.SelectedDrugs.recolte.name][adminManagement.SelectedDrugsCategorie]) do
                DrawMarker(1, v.x, v.y, v.z-1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.55, 0.55, 0.55, 240, 255, 0, 255, false, false, 2, false, false, false, false)
                DrawInstructionBarNotification(v.x, v.y, v.z, (v.x..' '..v.y..' '..v.z.. ' (%s)'):format(adminManagement.SelectedDrugsCategorie))
                RageUI.Button(('[%s] (%s %s %s)'):format(k, v.x, v.y, v.z), '\n[ENTER] changer la position\n[E] supprimer la positon\n', {RightLabel = ''}, true, {
                    onActive = function()
                        DrawMarker(43, v.x, v.y, v.z-1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.55, 0.55, 0.55, 240, 0, 0, 255, false, false, 2, false, false, false, false)
                        DrawInstructionBarNotification(v.x, v.y, v.z, (v.x..' '..v.y..' '..v.z.. ' (%s)'):format(adminManagement.SelectedDrugsCategorie))

                        if IsControlJustPressed(0, 54) then
                            
                        end
                    end,
                    onSelected = function()
                        
                    end
                })
            end
        end)

        RageUI.IsVisible(createCircuit, function()
            RageUI.Separator('Création d\'un circuit de drogue')
            RageUI.Checkbox('Laboratoire', nil, adminManagement.CreateDrugs.Laboratory.active, {}, {
                onChecked = function()
                    adminManagement.CreateDrugs.Laboratory.active = true
                end,
                onUnChecked = function()
                    adminManagement.CreateDrugs.Laboratory.active = false
                end
            })
            if adminManagement.CreateDrugs.Laboratory.active == false then
                RageUI.Button('Nom de la drogue', nil, {RightLabel = adminManagement.CreateDrugs.name or '~r~Indéfini~s~'}, true, {
                    onSelected = function()
                        KeyboardUtils.use('Nom de la drogue', function(data)
                            if not data or data == '' then return end
    
                            adminManagement.CreateDrugs.name = data
                        end)
                    end
                })
                RageUI.Button('Label de la drogue', nil, {RightLabel = adminManagement.CreateDrugs.label or '~r~Indéfini~s~'}, true, {
                    onSelected = function()
                        KeyboardUtils.use('Label de la drogue', function(data)
                            if not data or data == '' then return end
    
                            adminManagement.CreateDrugs.label = data
                        end)
                    end
                })
                RageUI.Separator('~y~↓ Récolte ↓~s~')
                RageUI.Button('Type d\'animation', nil, {RightLabel = adminManagement.CreateDrugs.recolte_animtype or '~r~Indéfini~s~'}, true, {
                    onSelected = function()
                        KeyboardUtils.use('Type d\'animation (anim/scenario)', function(data)
                            if not data or data == '' then return end
    
                            adminManagement.CreateDrugs.recolte_animtype = data
                        end)
                    end
                })
                RageUI.Button('Dict de l\'animation', nil, {RightLabel = adminManagement.CreateDrugs.recolte_animdict or '~r~Indéfini~s~'}, true, {
                    onSelected = function()
                        KeyboardUtils.use('Dict de l\'animation)', function(data)
                            if not data or data == '' then return end
    
                            adminManagement.CreateDrugs.recolte_animdict = data
                        end)
                    end
                })
                RageUI.Button('Animation', nil, {RightLabel = adminManagement.CreateDrugs.recolte_anim or '~g~Aucune~s~'}, true, {
                    onSelected = function()
                        KeyboardUtils.use('Animation', function(data)
                            if not data or data == '' then 
                                adminManagement.CreateDrugs.recolte_anim = nil
                                return 
                            end
    
                            adminManagement.CreateDrugs.recolte_anim = data
                        end)
                    end
                })
                RageUI.Button('Durée de l\'animation', nil, {RightLabel = adminManagement.CreateDrugs.recolte_animtime or '~r~Indéfini~s~'}, true, {
                    onSelected = function()
                        KeyboardUtils.use('Animation', function(data)
                            local data = tonumber(data)
                            if data == nil then return end
                
                            adminManagement.CreateDrugs.recolte_animtime = data
                        end)
                    end
                })
                RageUI.Checkbox('Marker', nil, adminManagement.CreateDrugs.recolte_marker or false, {}, {
                    onActive = function()
                        if adminManagement.CreateDrugs.recolte_marker == nil then
                            adminManagement.CreateDrugs.recolte_marker = false
                        end
                    end,
                    onChecked = function()
                        adminManagement.CreateDrugs.recolte_marker = true
                    end,
                    onUnChecked = function()
                        adminManagement.CreateDrugs.recolte_marker = false
                    end
                })
                RageUI.Button('Props (Si pas de marker)', nil, {RightLabel = adminManagement.CreateDrugs.recolte_props or '~g~Aucun~s~'}, true, {
                    onSelected = function()
                        KeyboardUtils.use('Animation', function(data)
                            if not data or data == '' then 
                                adminManagement.CreateDrugs.recolte_props = nil
                                return 
                            end
                            adminManagement.CreateDrugs.recolte_props = data
                        end)
                    end
                })
                RageUI.Button(('Ajouter des positions à la récolte (%s) position'):format(adminManagement.CreateDrugs.posRecolte and #adminManagement.CreateDrugs.posRecolte or 0), '\n[E] pour retirer la dernnière position\n', {}, true, {
                    onActive = function()
                        if IsControlJustPressed(0, 54) then
                            adminManagement.CreateDrugs.posRecolte[#adminManagement.CreateDrugs.posRecolte] = nil
                        end
    
                        if adminManagement.CreateDrugs.posRecolte then
                            for k,v in pairs(adminManagement.CreateDrugs.posRecolte) do
                                DrawMarker(1, v.x, v.y, v.z-1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.55, 0.55, 0.55, 240, 255, 0, 255, false, false, 2, false, false, false, false)
                                DrawInstructionBarNotification(v.x, v.y, v.z+0.15, ('Récolte'))
                            end
                        end
                    end,
                    onSelected = function()
                        if not adminManagement.CreateDrugs.posRecolte then
                            adminManagement.CreateDrugs.posRecolte = {}
                        end
    
                        adminManagement.CreateDrugs.posRecolte[#adminManagement.CreateDrugs.posRecolte+1] = GetEntityCoords(PlayerPedId())
                    end
                })
            RageUI.Separator('~y~↓ Traitement ↓~s~')
            RageUI.Button('Type d\'animation', nil, {RightLabel = adminManagement.CreateDrugs.traitement_animtype or '~r~Indéfini~s~'}, true, {
                onSelected = function()
                    KeyboardUtils.use('Type d\'animation (anim/scenario)', function(data)
                        if not data or data == '' then return end
            
                        adminManagement.CreateDrugs.traitement_animtype = data
                    end)
                end
            })
            RageUI.Button('Dict de l\'animation', nil, {RightLabel = adminManagement.CreateDrugs.traitement_animdict or '~r~Indéfini~s~'}, true, {
                onSelected = function()
                    KeyboardUtils.use('Dict de l\'animation)', function(data)
                        if not data or data == '' then return end
            
                        adminManagement.CreateDrugs.traitement_animdict = data
                    end)
                end
            })
            RageUI.Button('Animation', nil, {RightLabel = adminManagement.CreateDrugs.traitement_anim or '~g~Aucune~s~'}, true, {
                onSelected = function()
                    KeyboardUtils.use('Animation', function(data)
                        if not data or data == '' then 
                            adminManagement.CreateDrugs.traitement_anim = nil
                            return 
                        end
            
                        adminManagement.CreateDrugs.traitement_anim = data
                    end)
                end
            })
            RageUI.Button('Durée de l\'animation', nil, {RightLabel = adminManagement.CreateDrugs.traitement_animtime or '~r~Indéfini~s~'}, true, {
                onSelected = function()
                    KeyboardUtils.use('Animation', function(data)
                        local data = tonumber(data)
                        if data == nil then return end
            
                        adminManagement.CreateDrugs.traitement_animtime = data
                    end)
                end
            })
            RageUI.Checkbox('Marker', nil, adminManagement.CreateDrugs.traitement_marker or false, {}, {
                onActive = function()
                    if adminManagement.CreateDrugs.traitement_marker == nil then
                        adminManagement.CreateDrugs.traitement_marker = false
                    end
                end,
                onChecked = function()
                    adminManagement.CreateDrugs.traitement_marker = true
                end,
                onUnChecked = function()
                    adminManagement.CreateDrugs.traitement_marker = false
                end
            })
            RageUI.Button('Props (Si pas de marker)', nil, {RightLabel = adminManagement.CreateDrugs.traitement_props or '~g~Aucun~s~'}, true, {
                onSelected = function()
                    KeyboardUtils.use('Animation', function(data)
                        if not data or data == '' then 
                            adminManagement.CreateDrugs.traitement_props = nil
                            return 
                        end
                        adminManagement.CreateDrugs.traitement_props = data
                    end)
                end
            })
            RageUI.Button('Nom de la drogue traitée', nil, {RightLabel = adminManagement.CreateDrugs.name_pooch or '~r~Indéfini~s~'}, true, {
                onSelected = function()
                    KeyboardUtils.use('Nom de la drogue traitée', function(data)
                        if not data or data == '' then return end

                        adminManagement.CreateDrugs.name_pooch = data
                    end)
                end
            })
            RageUI.Button('Label de la drogue traitée', nil, {RightLabel = adminManagement.CreateDrugs.label_pooch or '~r~Indéfini~s~'}, true, {
                onSelected = function()
                    KeyboardUtils.use('Label de la drogue traitée', function(data)
                        if not data or data == '' then return end

                        adminManagement.CreateDrugs.label_pooch = data
                    end)
                end
            })
            RageUI.Button(('Ajouter des positions au traitement (%s) position'):format(adminManagement.CreateDrugs.posTraitement and #adminManagement.CreateDrugs.posTraitement or 0), '\n[E] pour retirer la dernnière position\n', {}, true, {
                onActive = function()
                    if IsControlJustPressed(0, 54) then
                        adminManagement.CreateDrugs.posTraitement[#adminManagement.CreateDrugs.posTraitement] = nil
                    end

                    if adminManagement.CreateDrugs.posTraitement then
                        for k,v in pairs(adminManagement.CreateDrugs.posTraitement) do
                            DrawMarker(1, v.x, v.y, v.z-1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.55, 0.55, 0.55, 240, 255, 0, 255, false, false, 2, false, false, false, false)
                            DrawInstructionBarNotification(v.x, v.y, v.z+0.15, ('Traitement'))
                        end
                    end
                end,
                onSelected = function()
                    if not adminManagement.CreateDrugs.posTraitement then
                        adminManagement.CreateDrugs.posTraitement = {}
                    end

                    adminManagement.CreateDrugs.posTraitement[#adminManagement.CreateDrugs.posTraitement+1] = GetEntityCoords(PlayerPedId())
                end
            })
            else
                RageUI.Separator('~y~↓ Mode laboratoire ↓~s~')
                for k,v in pairs(adminManagement.CreateDrugs.Laboratory.list) do
                    RageUI.Checkbox(v.label, nil, adminManagement.CreateDrugs.Laboratory.list[k].active, {}, {
                        onChecked = function()

                            for k,v in pairs(adminManagement.CreateDrugs.Laboratory.list) do
                                if v.active == true then
                                    adminManagement.CreateDrugs.Laboratory.list[k].active = false

                                    adminManagement.CreateDrugs.Laboratory.pos = nil
                                end
                            end

                            adminManagement.CreateDrugs.Laboratory.list[k].active = true
                        end,
                        onUnChecked = function()
                            adminManagement.CreateDrugs.Laboratory.list[k].active = false

                            adminManagement.CreateDrugs.Laboratory.activeLaboratory = false

                            adminManagement.CreateDrugs.Laboratory.pos = nil
                        end
                    })
                end

                for k,v in pairs(adminManagement.CreateDrugs.Laboratory.list) do
                    if v.active == true then
                        adminManagement.CreateDrugs.Laboratory.activeLaboratory = true
                        adminManagement.CreateDrugs.Laboratory.activeLaboratoryName = v.name
                    end
                end

                if adminManagement.CreateDrugs.Laboratory.activeLaboratory then
                    RageUI.Separator('~y~↓ Informations et Paramètres du laboratoire ↓~s~')
                    RageUI.Separator(('%s'):format(adminManagement.CreateDrugs.Laboratory.list[adminManagement.CreateDrugs.Laboratory.activeLaboratoryName].label))
                    RageUI.Button('Nom du laboratoire', nil, {RightLabel = not  adminManagement.CreateDrugs.Laboratory.name and '~r~Indéfini~s~' or  adminManagement.CreateDrugs.Laboratory.name}, true, {
                        onSelected = function()
                            KeyboardUtils.use('Nom du laboratoire', function(data)
                                if data == nil or data == '' then return end

                                adminManagement.CreateDrugs.Laboratory.name = data
                            end)
                        end
                    })
                    RageUI.Button('Position du laboratoire', adminManagement.CreateDrugs.Laboratory.pos or '', {RightLabel = not adminManagement.CreateDrugs.Laboratory.pos and '~r~Indéfini~s~' or '~g~Défini~s~'}, true, {
                        onActive = function()
                            if adminManagement.CreateDrugs.Laboratory.pos then
                                v = adminManagement.CreateDrugs.Laboratory.pos
                                DrawMarker(1, v.x, v.y, v.z-1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.55, 0.55, 0.55, 240, 255, 0, 255, false, false, 2, false, false, false, false)
                                DrawInstructionBarNotification(v.x, v.y, v.z, (v.x..' '..v.y..' '..v.z.. ' (Position du laboratoire)'))
                            end
                        end,
                        onSelected = function()
                            adminManagement.CreateDrugs.Laboratory.pos = Player.coords
                        end
                    })
                end
            end
            RageUI.WLine()
            RageUI.Button('Confirmer', nil, {Color = {BackgroundColor = {0,255,0,150}}}, true, {
                onSelected = function()

                    if not adminManagement.CreateDrugs.Laboratory.active then
                        if json.encode(adminManagement.CreateDrugs) == '[]' then return end
                        if not adminManagement.CreateDrugs.posTraitement then return end
                        if not adminManagement.CreateDrugs.posRecolte then return end
    
                        if #adminManagement.CreateDrugs.posTraitement < 1 then return end
                        if #adminManagement.CreateDrugs.posRecolte < 1 then return end
    
                        if adminManagement.CreateDrugs.name == nil or adminManagement.CreateDrugs.label == nil then return end 
                        if adminManagement.CreateDrugs.recolte_animtype == nil or adminManagement.CreateDrugs.recolte_animdict == nil then return end
    
                        if adminManagement.CreateDrugs.traitement_animtype == nil or adminManagement.CreateDrugs.traitement_animdict == nil then return end
    
                        if adminManagement.CreateDrugs.name_pooch == nil or adminManagement.CreateDrugs.label_pooch == nil then return end
    
                        if adminManagement.CreateDrugs.recolte_animtime == nil then return end
                        if adminManagement.CreateDrugs.traitement_animtime == nil then return end 
    
                        if Config.Drugs.Drugs[adminManagement.CreateDrugs.name] then return ESX.ShowNotification('Cette drogue existe déjà') end
    
                        TriggerServerEvent('zmain:drugs:create', adminManagement.CreateDrugs)
                    else
                        if not adminManagement.CreateDrugs.Laboratory.activeLaboratory then return end
                        if adminManagement.CreateDrugs.Laboratory.name == nil then return end
                        if adminManagement.CreateDrugs.Laboratory.pos == nil then return end

                        TriggerServerEvent('zmain:admin:labo:create', adminManagement.CreateDrugs.Laboratory)
                    end
                end
            })
        end)

        RageUI.IsVisible(weaponsSell, function()
            RageUI.Button('Ajouter un groupe', nil, {}, true, {
                onSelected = function()
                    ESX.TriggerServerCallback('zmain:admin:getAllJobs', function(cb)
                        adminManagement.SelectedJobType = 0
                        adminManagement.AddJobList = cb

                        RageUI.Visible(weaponsSellGroupList, true)
                    end)
                end
            })
            RageUI.WLine()
            for k,v in pairs(adminManagement.SellingList) do
                RageUI.Button(v.name..' - '..v.label, nil, {}, true, {
                    onSelected = function()
                        TriggerServerEvent('zmain:weapons:sell:delete', v.name)

                        RageUI.GoBack()
                    end
                })
            end
        end)

        RageUI.IsVisible(weaponsSellGroupList, function()
            RageUI.Button('Rechercher', nil, {}, true, {
                onSelected = function()
                    KeyboardUtils.use('Nom/Label/Id du job', function(data)
                        adminManagement.AddSearchJob = data
                    end)
                end
            })
            if adminManagement.AddSearchJob then
                RageUI.Button('❌ Arrêter la Recherche', nil, {}, true, {
                    onSelected = function()
                        adminManagement.AddSearchJob = nil
                    end
                })
            end
            for k,v in pairs(adminManagement.AddJobList) do
                local jobData = ('[%s] %s (%s)'):format(k, v.name, v.label)
                if tonumber(v.type) == tonumber(adminManagement.SelectedJobType) then
                    if (not adminManagement.AddSearchJob) then
                        RageUI.Button(jobData, nil, {}, true, {
                            onSelected = function()
                                TriggerServerEvent('zmain:weapons:sell:add', v)

                                RageUI.GoBack()

                                ESX.TriggerServerCallback('zmain:admin:getAllJobs', function(cb)
                                    adminManagement.SelectedJobType = 0
                                    adminManagement.AddJobList = cb
            
                                    RageUI.Visible(weaponsSellGroupList, true)
                                end)
                            end
                        })
                    else
                        if (string.match(string.lower(jobData), string.lower(adminManagement.AddSearchJob))) then 
                            RageUI.Button(jobData, nil, {}, true, {
                                onSelected = function()
                                    TriggerServerEvent('zmain:weapons:sell:add', v)

                                    RageUI.GoBack()

                                    ESX.TriggerServerCallback('zmain:admin:getAllJobs', function(cb)
                                        adminManagement.SelectedJobType = 0
                                        adminManagement.AddJobList = cb
                
                                        RageUI.Visible(weaponsSellGroupList, true)
                                    end)
                                end
                            })
                        end
                    end
                end
            end
        end)
    
        RageUI.IsVisible(reportsList, function()
            RageUI.Checkbox('Filtres', nil, adminManagement.Filters, {}, {
                onChecked = function()
                    adminManagement.Filters = true
                end,
                onUnChecked = function()
                    adminManagement.Filters = false
                end
            })
            if adminManagement.Filters == true then
                RageUI.List('Afficher les reports', adminManagement.FiltersList, adminManagement.FiltersListIndex, nil, {}, true, {
                    onListChange = function(Index)
                        adminManagement.FiltersListIndex = Index
                    end
                })
            end
            RageUI.WLine()
            for k,v in pairs(adminManagement.Reports) do
                if not adminManagement.Filters or adminManagement.FiltersListIndex == 1 then
                    RageUI.Button((v.take and v.takeUID == ESX.PlayerData.UniqueID and '~r~'..'Report #%s (%s)' or 'Report #%s (%s)'):format(k, v.author), ('\n%s\n'):format(v.reason), {RightLabel = v.take == false and '~r~NON PRIS EN CHARGE~s~' or '~g~PRIS EN CHARGE~s~'}, true, {
                        onActive = function()
                            RageUI.Info('Information Report', {'Raison : ', 'Pris par : '}, {v.reason, v.takeBY})
                        end,
                        onSelected = function()
                            adminManagement.SelectedReport = v
                        end
                    }, selectedReport)
                elseif adminManagement.Filters and adminManagement.FiltersListIndex == 2 then
                    if v.take == true then
                        RageUI.Button(('Report #%s (%s)'):format(k, v.author), ('\n%s\n'):format(v.reason), {RightLabel = v.take == false and '~r~NON PRIS EN CHARGE~s~' or '~g~PRIS EN CHARGE~s~'}, true, {
                            onActive = function()
                                RageUI.Info('Information Report', {'Raison : ', 'Pris par : '}, {v.reason, v.takeBY})
                            end,
                            onSelected = function()
                                adminManagement.SelectedReport = v
                            end
                        }, selectedReport)
                    end
                elseif adminManagement.Filters and adminManagement.FiltersListIndex == 3 then
                    if v.take == false then
                        RageUI.Button(('Report #%s (%s)'):format(k, v.author), ('\n%s\n'):format(v.reason), {RightLabel = v.take == false and '~r~NON PRIS EN CHARGE~s~' or '~g~PRIS EN CHARGE~s~'}, true, {
                            onActive = function()
                                RageUI.Info('Information Report', {'Raison : ', 'Pris par : '}, {v.reason, v.takeBY})
                            end,
                            onSelected = function()
                                adminManagement.SelectedReport = v
                            end
                        }, selectedReport)
                    end
                end
            end
        end)

        RageUI.IsVisible(selectedReport, function()
            RageUI.Separator(adminManagement.SelectedReport.author)
            if not adminManagement.SelectedReport.take then
                RageUI.Button('Prendre en charge', nil, {}, true, {
                    onSelected = function()
                        adminManagement.SelectedReport.take = true
                        TriggerServerEvent('zmain:admin:takeReport', adminManagement.SelectedReport.UniqueID, adminManagement.SelectedReport.source)
                        TriggerServerEvent('zmain:admin:getPosForRreturnPlayer', adminManagement.SelectedReport.source)
                    end
                })
            end
            RageUI.Button('Clôturer', nil, {}, true, {
                onSelected = function()
                    TriggerServerEvent('zmain:admin:closeReport', adminManagement.SelectedReport.UniqueID, adminManagement.SelectedReport.source)
                    adminManagement.Reports[adminManagement.SelectedReport.UniqueID] = nil
                    RageUI.GoBack()
                end
            })
            if adminManagement.SelectedReport.take then
                RageUI.WLine()
                if Config.Staff.HavePermission('ManagePlayers', 'goto') then
                    RageUI.Button('Se Téléporter', nil, {}, true, {
                        onSelected = function()
                            TriggerServerEvent('zmain:admin:goto', adminManagement.SelectedReport.source)
                        end
                    })
                end
                if Config.Staff.HavePermission('ManagePlayers', 'bring') then
                    RageUI.Button('Téléporter sur moi', nil,  {}, true, {
                        onSelected = function()
                            TriggerServerEvent('zmain:admin:bring', adminManagement.SelectedReport.source, GetEntityCoords(PlayerPedId()))
                        end
                    })
                end
                RageUI.Button('Retourner', nil, {}, true, {
                    onSelected = function()
                        if adminManagement.LastPlayerPos[adminManagement.SelectedReport.source] == nil then return end
    
                        TriggerServerEvent('zmain:admin:player:return', adminManagement.SelectedReport.source, adminManagement.LastPlayerPos[adminManagement.SelectedReport.source].pos)
                    end
                })
                RageUI.Button('Freeze Unfreeze', nil, {}, true, {
                    onSelected = function()
                        if adminManagement.FreezeUnfreeze then
                            adminManagement.FreezeUnfreeze = false
                            TriggerServerEvent('zmain:admin:freezeunfreezeplayer', adminManagement.SelectedReport.source, 'unfreeze')
                            ESX.ShowNotification('✔️ Joueur unfreeze avec succès')
                        else
                            adminManagement.FreezeUnfreeze = true
                            TriggerServerEvent('zmain:admin:freezeunfreezeplayer', adminManagement.SelectedReport.source, 'freeze')
                            ESX.ShowNotification('✔️ Joueur freeze avec succès')
                        end
                    end
                })
                if Config.Staff.HavePermission('ManagePlayers', 'Message') then
                    RageUI.Button('Envoyer un message', nil, {}, true, {
                        onSelected = function()
                            KeyboardUtils.use('Message', function(data)
                                if data == nil or data == '' then return ESX.ShowNotification('Argument manquant') end
                                
                                TriggerServerEvent('zmain:staff:players:takeMessage', adminManagementSelectedReport.source, data)
                            end)
                        end
                    })
                end
                if Config.Staff.HavePermission('ManagePlayers', 'screen') then
                    RageUI.Button('Screen', nil, {}, true, {
                        onSelected = function()
                            TriggerServerEvent('zmain:admin:screen', adminManagement.SelectedReport.source)
                            ESX.ShowNotification('📷 Vous retrouverez le screen dans les logs')
                        end
                    })
                end
                if Config.Staff.HavePermission('ManagePlayers', 'revive') then
                    RageUI.Button('Revive', nil, {}, true, {
                        onSelected = function()
                            ExecuteCommand("revive " ..adminManagement.SelectedReport.UniqueID)
                            ESX.ShowNotification('✔️ Joueur revive avec succès')
                        end
                    })
                end
                if Config.Staff.HavePermission('ManagePlayers', 'heal') then
                    RageUI.Button('Heal', nil, {}, true, {
                        onSelected = function()
                            ExecuteCommand("heal " ..adminManagement.SelectedReport.UniqueID)
                            ESX.ShowNotification('✔️ Joueur heal avec succès')
                        end
                    })
                end
                if Config.Staff.HavePermission('ManagePlayers', 'clearinventory') then
                    RageUI.Button('Clear l\'inventaire', nil, {}, true, {
                        onSelected = function()
                            KeyboardUtils.use('Taper Y pour valider', function(data)
                                local data = tostring(data)
                                if data == 'y' or data == 'Y' then
                                    TriggerServerEvent('zmain:admin:clearInventory', adminManagement.SelectedReport.source)
                                end
                            end)
                        end
                    })
                end
                if Config.Staff.HavePermission('ManagePlayers', 'clearweapons') then
                    RageUI.Button('Clear les armes', nil, {}, true, {
                        onSelected = function()
                            KeyboardUtils.use('Taper Y pour valider', function(data)
                                local data = tostring(data)
                                if data == 'y' or data == 'Y' then
                                    TriggerServerEvent('zmain:admin:clearWeapon', adminManagement.SelectedReport.source)
                                end
                            end)
                        end
                    })
                end
                if Config.Staff.HavePermission('ManagePlayers', 'gopc') then
                    RageUI.Button('Téléporter au Parking Central', nil, {}, true, {
                        onSelected = function()
                            TriggerServerEvent('zmain:admin:teleport', adminManagement.SelectedReport.source, vector3(234.06896972656, -756.89605712891, 37.856971740723))
                            ESX.ShowNotification('✔️ Joueur téléporter avec succès')
                        end
                    })
                end
                if Config.Staff.HavePermission('ManagePlayers', 'gomb') then
                    RageUI.Button('Téléporter au dessus de la Maze Bank', nil, {}, true, {
                        onSelected = function()
                            TriggerServerEvent('zmain:admin:teleport', adminManagement.SelectedReport.source, vector3(-75.012283325195, -818.96472167969, 326.17532348633))
                            ESX.ShowNotification('✔️ Joueur téléporter avec succès')
                        end
                    })
                end
                if Config.Staff.HavePermission('ManagePlayers', 'givepanto') then
                    RageUI.Button('Donner Panto', nil, {}, not adminManagement.cooldown, {
                        onSelected = function()
                            TriggerServerEvent('zmain:admin:spawnVehicle', adminManagement.SelectedReport.source, 'panto')
                            adminManagement.cooldown = true
                            SetTimeout(2500, function()
                                adminManagement.cooldown = false
                            end)
                            ESX.ShowNotification('✔️ Véhicule give avec succès')
                        end
                    })
                end
                if Config.Staff.HavePermission('ManagePlayers', 'playerinformations') then
                    RageUI.Button('Informations', nil, {}, true, {
                        onSelected = function()
                            
                        end
                    }, infoReportPlayer)
                end
                if Config.Staff.HavePermission('ManagePlayers', 'changejob') then
                    RageUI.Button('Changer le job', nil, {}, true, {
                        onSelected = function()
    
                        end
                    }, addJobReportPlayer)
                end
                if Config.Staff.HavePermission('ManagePlayers', 'changegroup') then
                    RageUI.Button('Changer le group', nil, {}, true, {
                        onSelected = function()
                            
                        end
                    }, changeReportPlayerGroup)
                end
            end
        end)

        RageUI.IsVisible(infoReportPlayer, function()
            RageUI.Button('Argents', nil, {}, true, {
                onSelected = function()
                    ESX.TriggerServerCallback('zmain:admin:getAccounts', function(cb)
                        adminManagement.accounts = cb
                    
                    end, adminManagement.SelectedReport.UniqueID)
                end
            }, accountsReportPlayer)
            RageUI.Button('Jobs', nil, {}, true, {
                onSelected = function()

                end
            }, jobReportPlayer)
        end)


        RageUI.IsVisible(accountsReportPlayer, function()
            for k,v in pairs(adminManagement.accounts) do
                if v.name == 'cash' then
                    RageUI.Button(('Cash (~y~%s~s~)'):format(v.money), nil, {}, true, {

                    })
                end
                if v.name == 'bank' then
                    RageUI.Button(('Bank (~y~%s~s~)'):format(v.money), nil, {}, true, {

                    })
                end
                if v.name == 'black_money' then
                    RageUI.Button(('Argent Sale (~y~%s~s~)'):format(v.money), nil, {}, true, {

                    })
                end
            end
        end)
        
        RageUI.IsVisible(jobReportPlayer, function()
            RageUI.Button(('Entreprise (~y~%s~s~)'):format(adminManagement.SelectedReport.job.label), nil, {}, true, {
                onSelected = function()
                end
            })
            RageUI.Button(('Gang/Organisation (~y~%s~s~)'):format(adminManagement.SelectedReport.job2.label), nil, {}, true, {
                onSelected = function()
                end
            })
        end)

        
        RageUI.IsVisible(addJobReportPlayer, function()
            RageUI.Button('Changer le job en Entreprise', nil, {}, true, {
                onSelected = function()
                    ESX.TriggerServerCallback('zmain:admin:getAllJobs', function(cb)
                        adminManagement.SelectedJobType = 1
                        adminManagement.AddJobList = cb
                    end)
                end
            }, addJobReportPlayerList)
            RageUI.Button('Changer le job en Gang/Organisation', nil, {}, true, {
                onSelected = function()
                    ESX.TriggerServerCallback('zmain:admin:getAllJobs', function(cb)
                        adminManagement.SelectedJobType = 0
                        adminManagement.AddJobList = cb
                    end)
                end
            }, addJobReportPlayerList)
        end)

        RageUI.IsVisible(addJobReportPlayerList, function()
            RageUI.Button('Rechercher', nil, {}, true, {
                onSelected = function()
                    KeyboardUtils.use('Nom/Label/Id du job', function(data)
                        adminManagement.AddSearchJob = data
                    end)
                end
            })
            if adminManagement.AddSearchJob then
                RageUI.Button('❌ Arrêter la Recherche', nil, {}, true, {
                    onSelected = function()
                        adminManagement.AddSearchJob = nil
                    end
                })
            end
            for k,v in pairs(adminManagement.AddJobList) do
                local jobData = ('[%s] %s (%s)'):format(k, v.name, v.label)
                if tonumber(v.type) == tonumber(adminManagement.SelectedJobType) then
                    if not adminManagement.AddSearchJob then
                        RageUI.Button(jobData, nil, {}, true, {
                            onSelected = function()
                                ESX.TriggerServerCallback('zmain:admin:getGradeWithJob', function(cb)
                                    adminManagement.AddGradeListWithJob = cb
                                    adminManagement.SelectedPlayerJobList = v
                                end, v.name)
                            end
                        }, addReportJobGradeWithJobList)
                    else
                        if string.match(string.lower(jobData), string.lower(adminManagement.AddSearchJob)) then 
                            RageUI.Button(jobData, nil, {}, true, {
                                onSelected = function()
                                    ESX.TriggerServerCallback('zmain:admin:getGradeWithJob', function(cb)
                                        adminManagement.AddGradeListWithJob = cb
                                        adminManagement.SelectedPlayerJobList = v
                                    end, v.name)
                                end
                            }, addReportJobGradeWithJobList)
                        end
                    end
                end
            end
        end)

        RageUI.IsVisible(addReportJobGradeWithJobList, function()
            for k,v in pairs(adminManagement.AddGradeListWithJob) do
                RageUI.Button(('[%s] %s (%s)'):format(v.grade, v.name, v.label), nil, {}, true, {
                    onSelected = function()
                        KeyboardUtils.use('Taper Y pour valider', function(data)
                            local data = tostring(data)
                            if data == 'y' or data == 'Y' then
                                if tonumber(adminManagement.SelectedJobType) == 0 then
                                    TriggerServerEvent('zmain:admin:setPlayerJob', adminManagement.SelectedReport.source, adminManagement.SelectedPlayerJobList.name, v.grade, 'job2')
                                else
                                    TriggerServerEvent('zmain:admin:setPlayerJob', adminManagement.SelectedReport.source, adminManagement.SelectedPlayerJobList.name, v.grade, 'job')
                                end

                                ESX.ShowNotification('✔️ Joueur setJob avec succès')
                            end
                        end)
                    end
                })
            end
        end)

        RageUI.IsVisible(changeReportPlayerGroup, function()
            Config.Staff.Permissions['ServerGroup'] = sortGroupTable(Config.Staff.Permissions['ServerGroup'])
            for k,v in pairs(Config.Staff.Permissions['ServerGroup'][ESX.GetPlayerData().group]) do
                RageUI.Button(v.label, nil, {}, true, {
                    onSelected = function()
                        TriggerServerEvent('zmain:admin:setGroup', adminManagement.SelectedReport.source, v.value)
                        ESX.ShowNotification('✔️ Joueur setgroup avec succès')
                    end
                })
            end
        end)

        RageUI.IsVisible(SearchUniqueID, function()
            RageUI.Button('Rechercher une ID Unique', nil, {}, true, {
                onSelected = function()
                    adminManagement.UniqueIDSearch = {}
                    KeyboardUtils.use('Entrée une ID Unique', function(data)
                        local data = tonumber(data)
                        if data == nil or data == '' or data <= 0 then return ESX.ShowNotification('Impossible de trouver l\'ID Unique') end

                        ESX.TriggerServerCallback('zmain:admin:getUniqueIDUnique', function(cb)
                            if json.encode(cb) ~= '[]' then
                                adminManagement.UniqueIDSearch = cb
                                RageUI.Visible(UniqueIDresult, true)
                            end
                        end, data)
                    end)
                end
            })
        end)

        RageUI.IsVisible(UniqueIDresult, function()
            RageUI.Separator(('~b~%s~s~ (~b~%s~s~)'):format(adminManagement.UniqueIDSearch[1].playerName, adminManagement.UniqueIDSearch[1].id or ''))
            RageUI.Separator(('Statut du joueur : %s'):format(adminManagement.UniqueIDSearch[1].id ~= nil and '~g~Connecté~s~' or '~r~Déconnecté~s~'))
            RageUI.Separator(('Joueur en vie : %s'):format(not adminManagement.UniqueIDSearch[1].is_dead and '~g~Oui~s~' or '~r~Non~s~'))
            RageUI.Separator(('Joueur bani : %s'):format(adminManagement.UniqueIDSearch[1].isBaned == true and '~r~Oui~s~' or '~g~Non~s~'))
            RageUI.Separator(('Groupe du joueur: %s'):format(Config.Staff.Group[adminManagement.UniqueIDSearch[1].group]))
            if Config.Staff.HavePermission('ManagePlayers', 'goto') then
                RageUI.Button('Se Téléporter', nil, {}, true, {
                    onSelected = function()
                        if adminManagement.UniqueIDSearch[1].id == nil then return end
                        TriggerServerEvent('zmain:admin:goto', adminManagement.UniqueIDSearch[1].id)
                    end
                })
            end
            if Config.Staff.HavePermission('ManagePlayers', 'bring') then
                RageUI.Button('Téléporter sur moi', nil,  {}, true, {
                    onSelected = function()
                        if adminManagement.UniqueIDSearch[1].id == nil then return end

                        TriggerServerEvent('zmain:admin:bring', adminManagement.UniqueIDSearch[1].id, GetEntityCoords(PlayerPedId()))
                    end
                })
            end
            RageUI.Button('Retourner', nil, {}, true, {
                onSelected = function()
                    if adminManagement.UniqueIDSearch[1].id == nil then return end
                    if adminManagement.LastPlayerPos[adminManagement.UniqueIDSearch[1].id] == nil then return end

                    TriggerServerEvent('zmain:admin:player:return', adminManagement.UniqueIDSearch[1].id, adminManagement.LastPlayerPos[adminManagement.UniqueIDSearch[1].id].pos)
                end
            })
            if Config.Staff.HavePermission('ManagePlayers', 'Message') then
                RageUI.Button('Envoyer un message', nil, {}, true, {
                    onSelected = function()
                        if adminManagement.UniqueIDSearch[1].id == nil then return end
                        KeyboardUtils.use('Message', function(data)
                            if data == nil or data == '' then return ESX.ShowNotification('Argument manquant') end
                            
                            TriggerServerEvent('zmain:staff:players:takeMessage', adminManagement.UniqueIDSearch[1].id, data)
                        end)
                    end
                })
            end
            if (Config.Staff.HavePermission('ManagePlayers', 'screen')) then
                RageUI.Button('Screen', nil, {}, true, {
                    onSelected = function()
                        if adminManagement.UniqueIDSearch[1].id == nil then return end

                        TriggerServerEvent('zmain:admin:screen', adminManagement.UniqueIDSearch[1].id)
                        ESX.ShowNotification('📷 Vous retrouverez le screen dans les logs')
                    end
                })
            end
            if (Config.Staff.HavePermission('ManagePlayers', 'spectate')) then
                RageUI.Button('Spectate', nil, {}, true, {
                    onSelected = function()
                        RageUI.CloseAll()
                        Wait(750)
                        TriggerServerEvent('zmain:admin:spectatePlayer', tonumber(adminManagement.UniqueIDSearch[1].UniqueID))
                    end
                })
            end
            if adminManagement.UniqueIDSearch[1].isBaned == true then
                RageUI.Button('Débanir le joueur', nil, {}, true, {
                    onSelected = function()
                        
                    end
                })
            end
            RageUI.Button('Inventaire', nil, {}, true, {
                onSelected = function()
                    
                end
            }, UniqueIDPlayerInventory)
            if (Config.Staff.HavePermission('ManagePlayers', 'wipe')) then
                RageUI.Button('Wipe', nil, {}, true, {
                    onSelected = function()
                        KeyboardUtils.use('Taper Y pour valider', function(data)
                            if data == 'y' or data == 'Y' then
                                TriggerServerEvent('zmain:admin:players:wipeUniqueID', adminManagement.UniqueIDSearch[1].UniqueID)
                            end
                        end)
                    end
                })
            end
            if Config.Staff.HavePermission('UniqueIDoptions', 'boutiquehistory') then
                RageUI.Button('Historique boutique', nil, {}, true, {
                    onSelected = function()
                        ESX.TriggerServerCallback('zmain:admin:uniqueid:boutiquehistory', function(cb)
                            adminManagement.UniqueIDSearchBoutiqueHistory = cb
                        end, adminManagement.UniqueIDSearch[1].UniqueID)
                    end
                }, UniqueIDPlayerBoutiqueHistory)
            end
            if (Config.Staff.HavePermission('ManagePlayers', 'WARN')) then
                RageUI.Button('Mettre un Avertissement', nil, {}, true, {
                    onSelected = function()
                        KeyboardUtils.use('Raison', function(data)
                            ExecuteCommand(('warn %s %s'):format(adminManagement.UniqueIDSearch[1].UniqueID, data))
                        end)
                    end
                })
                RageUI.Button('Voir la liste des Warns', nil, {}, true, {
                    onSelected = function()
                        ESX.TriggerServerCallback('zmain:admin:getWarnList', function(cb)
                            adminManagement.WarnList = cb
                        end, adminManagement.UniqueIDSearch[1].UniqueID)
                    end
                }, WarnListPlayerUniqueID)
                RageUI.Button('Sanctions', nil, {}, true, {
                    onSelected = function()
                        ESX.TriggerServerCallback('zmain:admin:getSanctions', function(cb)
                            
                        end)
                    end
                })
            end
            if (Config.Staff.HavePermission('ManagePlayers', 'changejob')) then
                RageUI.Button('Changer le Job (Bientôt)', nil, {}, true, {
                    onSelected = function()

                    end
                })
            end
            if (Config.Staff.HavePermission('ManagePlayers', 'changegroup')) then
                RageUI.Button('Changer Groupe', nil, {}, true, {
                    onSelected = function()
                        
                    end
                }, changePlayerGroupWithUniqueID)
            end
            if Config.Staff.HavePermission('UniqueIDoptions', 'GIVE_MONEY') then 
                RageUI.Button('Give de l\'argent ( Propre )', nil, {}, true, {
                    onSelected = function()
                        KeyboardUtils.use('Montant', function(data)
                            local data = tonumber(data)
                            if data == nil then return end
                            TriggerServerEvent('zmain:admin:uniqueid:addmoney', adminManagement.UniqueIDSearch[1].UniqueID, 'cash', data)
                        end)
                    end
                })
                RageUI.Button('Give de l\'argent ( Banque )', nil, {}, true, {
                    onSelected = function()
                        KeyboardUtils.use('Montant', function(data)
                            local data = tonumber(data)
                            if data == nil then return end
                            TriggerServerEvent('zmain:admin:uniqueid:addmoney', adminManagement.UniqueIDSearch[1].UniqueID, 'bank', data)
                        end)
                    end
                })
                RageUI.Button('Give de l\'argent ( Sale )', nil, {}, true, {
                    onSelected = function()
                        KeyboardUtils.use('Montant', function(data)
                            local data = tonumber(data)
                            if data == nil then return end
                            TriggerServerEvent('zmain:admin:uniqueid:addmoney', adminManagement.UniqueIDSearch[1].UniqueID, 'black_money', data)
                        end)
                    end
                })
            end
            if (Config.Staff.HavePermission('ManagePlayers', 'clearinventory')) then
                RageUI.Button('Clear l\'inventaire (Bientôt)', nil, {}, true, {
                    onSelected = function()
                        KeyboardUtils.use('Taper Y pour valider', function(data)
                            local data = tostring(data)
                            if data == 'y' or data == 'Y' then
                                TriggerServerEvent('zmain:admin:clearInventoryUniqueID', adminManagement.SelectedPlayer.id)
                            end
                        end)
                    end
                })
            end
            if (Config.Staff.HavePermission('ManagePlayers', 'clearweapons')) then
                RageUI.Button('Clear les armes (Bientôt)', nil, {}, true, {
                    onSelected = function()
                        KeyboardUtils.use('Taper Y pour valider', function(data)
                            local data = tostring(data)
                            if data == 'y' or data == 'Y' then
                                TriggerServerEvent('zmain:admin:clearWeaponUniqueID', adminManagement.SelectedPlayer.id)
                            end
                        end)
                    end
                })
            end
            if Config.Staff.HavePermission('UniqueIDoptions', 'GIVE_WEAPON') then 
                RageUI.Button('Give une arme', nil, {}, true, {
                    onSelected = function()

                    end
                }, WeaponListIDUnique)
            end
            if Config.Staff.HavePermission('UniqueIDoptions', 'GIVE_ITEM') then 
                RageUI.Button('Give un Item', nil, {}, true, {
                    onSelected = function()
                        ESX.TriggerServerCallback('zmain:admin:itemsList', function(cb)
                            adminManagement.ItemsList = cb

                            RageUI.Visible(UniqueIDPlayerDataGIVE_Item, true)
                        end)
                    end
                })
            end
            if Config.Staff.HavePermission('UniqueIDoptions', 'GIVE_VEHICLE') then
                RageUI.Button('Give un véhicule', nil, {}, true, {
                    onSelected = function()
                        
                    end
                }, UniqueIDPlayerDataGIVE_VEHICLE)
            end
            if Config.Staff.HavePermission('UniqueIDoptions', 'GIVE_VEHICLE') then
                RageUI.Button('Give un véhicule boutique (Bientôt)', nil, {}, true, {
                    onSelected = function()
                        
                    end
                }, UniqueIDPlayerDataGIVE_VEHICLE)
            end
        end)

        RageUI.IsVisible(UniqueIDPlayerDataGIVE_Item, function()
            RageUI.Button('Rechercher', nil, {}, true, {
                onSelected = function()
                    KeyboardUtils.use('Recherche', function(data)
                        adminManagement.WeaponSearch = data
                    end)
                end
            })
            if adminManagement.WeaponSearch then
                RageUI.Button('❌ Arrêter la Recherche', nil, {}, true, {
                    onSelected = function()
                        adminManagement.WeaponSearch = nil
                    end
                })
            end
            for k,v in pairs(adminManagement.ItemsList) do
                local buttonName = ('[%s] %s'):format(v.name, v.label)
                if not adminManagement.WeaponSearch then
                    RageUI.Button(buttonName, nil, {}, true, {
                        onSelected = function()
                            KeyboardUtils.use('Quantité', function(data)
                                local data = tonumber(data)
                                if data == nil then return end

                                TriggerServerEvent('zmain:admin:UniqueID:giveitem', adminManagement.UniqueIDSearch[1].UniqueID, adminManagement.UniqueIDSearch[1], v, data)
                            end)
                        end
                    })
                else
                    if (string.match(string.lower(buttonName), string.lower(adminManagement.WeaponSearch))) then
                        RageUI.Button(buttonName, nil, {}, true, {
                            onSelected = function()
                                KeyboardUtils.use('Quantité', function(data)
                                    local data = tonumber(data)
                                    if data == nil then return end
    
                                    TriggerServerEvent('zmain:admin:UniqueID:giveitem', adminManagement.UniqueIDSearch[1].UniqueID, adminManagement.UniqueIDSearch[1], v, data)
                                end)
                            end
                        })
                    end
                end
            end
        end)

        RageUI.IsVisible(UniqueIDPlayerInventory, function()
            RageUI.Separator('Argents')
            for k,v in pairs(adminManagement.UniqueIDSearch[1].accounts) do
                if v.name == 'cash' then
                    RageUI.Button(('Cash (~y~%s~s~)'):format(v.money), nil, {}, true, {
                        onSelected = function()
                            if Config.Staff.HavePermission('UniqueIDoptions', 'clearmoney') then
                                KeyboardUtils.use('Nombre à enlever', function(data)
                                    local data = tonumber(data)
                                    if data == nil or data == '' or data <= 0 or v.money < data then return ESX.ShowNotification('Argument manquant ou le joueur ne possède pas suffisement d\'argent') end

                                    TriggerServerEvent('zmain:admin:uniqueid:removeMoney', adminManagement.UniqueIDSearch[1].id, adminManagement.UniqueIDSearch[1].UniqueID, data, 'cash')
                                end)
                            end
                        end
                    })
                end
                if v.name == 'bank' then
                    RageUI.Button(('Bank (~y~%s~s~)'):format(v.money), nil, {}, true, {
                        onSelected = function()
                            if Config.Staff.HavePermission('UniqueIDoptions', 'clearmoney') then
                                KeyboardUtils.use('Nombre à enlever', function(data)
                                    local data = tonumber(data)
                                    if data == nil or data == '' or data <= 0 or v.money < data then return ESX.ShowNotification('Argument manquant ou le joueur ne possède pas suffisement d\'argent') end

                                    TriggerServerEvent('zmain:admin:uniqueid:removeMoney', adminManagement.UniqueIDSearch[1].id, adminManagement.UniqueIDSearch[1].UniqueID, data, 'bank')
                                end)
                            end
                        end
                    })
                end
                if v.name == 'black_money' then
                    RageUI.Button(('Argent Sale (~y~%s~s~)'):format(v.money), nil, {}, true, {
                        onSelected = function()
                            if Config.Staff.HavePermission('UniqueIDoptions', 'clearmoney') then
                                KeyboardUtils.use('Nombre à enlever', function(data)
                                    local data = tonumber(data)
                                    if data == nil or data == '' or data <= 0 or v.money < data then return ESX.ShowNotification('Argument manquant ou le joueur ne possède pas suffisement d\'argent') end

                                    TriggerServerEvent('zmain:admin:uniqueid:removeMoney', adminManagement.UniqueIDSearch[1].id, adminManagement.UniqueIDSearch[1].UniqueID, data, 'black_money')
                                end)
                            end
                        end
                    })
                end
            end
            RageUI.Separator('Items')
            if json.encode(adminManagement.UniqueIDSearch[1].inventory) ~= '[]' then
                for k,v in pairs(json.decode(adminManagement.UniqueIDSearch[1].inventory)) do
                    RageUI.Button(('%s (~y~%s~s~)'):format(v.name, v.count), nil, {}, true, {
                        onSelected = function()
                            if Config.Staff.HavePermission('UniqueIDoptions', 'clearinventory') then
                                KeyboardUtils.use('Nombre à enlever', function(data)
                                    local data = tonumber(data)
                                    if data == nil or data == '' or data <= 0 or v.count < data then return ESX.ShowNotification('Argument manquant ou le joueur n\'en possède pas suffisement') end

                                    TriggerServerEvent('zmain:admin:uniqueid:removeItem', adminManagement.UniqueIDSearch[1].id, adminManagement.UniqueIDSearch[1].UniqueID, data, v.name, json.decode(adminManagement.UniqueIDSearch[1].inventory))
                                    v.count = v.count - 1
                                end)
                            end
                        end
                    })
                end
            end
            RageUI.Separator('Armes')
            if json.encode(adminManagement.UniqueIDSearch[1].loadout) ~= '[]' then
                for k,v in pairs(json.decode(adminManagement.UniqueIDSearch[1].loadout)) do
                    RageUI.Button(('%s (~y~%s~s~)'):format(v.label, v.ammo), nil, {}, true, {
                        onSelected = function()
                            adminManagement.UniqueIDPlayerInventoryWeaponSelect = v
                            adminManagement.UniqueIDPlayerInventoryWeaponSelectK = k
                            -- if Config.Staff.HavePermission('UniqueIDoptions', 'clearweaon') then
                            --     KeyboardUtils.use('Taper Y pour valider', function(data)
                            --         if data == 'y' or data == 'Y' then
                            --             TriggerServerEvent('zmain:admin:uniqueid:removeWeapon', adminManagement.UniqueIDSearch[1].id, adminManagement.UniqueIDSearch[1].UniqueID, v.name, json.decode(adminManagement.UniqueIDSearch[1].loadout))
                            --         end
                            --     end)
                            -- end
                        end
                    }, UniqueIDPlayerInventoryWeaponSelect)
                end
            end
        end)

        RageUI.IsVisible(UniqueIDPlayerInventoryWeaponSelect, function()
            RageUI.Button('Supprimer temporairement (Bientôt)', nil, {}, true, {
                onSelected = function()
                    KeyboardUtils.use('Taper Y pour valider', function(data)
                        if data == 'y' or data == 'Y' then
                            TriggerServerEvent('zmain:admin:uniqueid:clearTemporaireWeapon', adminManagement.UniqueIDSearch[1].id, adminManagement.UniqueIDSearch[1].UniqueID, adminManagement.UniqueIDPlayerInventoryWeaponSelect)
                        end
                    end)
                end
            })
            RageUI.Button('Supprimer l\'arme', nil, {}, true, {
                onSelected = function()
                     if Config.Staff.HavePermission('UniqueIDoptions', 'clearweaon') then
                        KeyboardUtils.use('Taper Y pour valider', function(data)
                            if data == 'y' or data == 'Y' then
                                TriggerServerEvent('zmain:admin:uniqueid:removeWeapon', adminManagement.UniqueIDSearch[1].id, adminManagement.UniqueIDSearch[1].UniqueID, adminManagement.UniqueIDPlayerInventoryWeaponSelect.name, json.decode(adminManagement.UniqueIDSearch[1].loadout), adminManagement.UniqueIDPlayerInventoryWeaponSelect)
                                RageUI.GoBack()
                            end
                        end)
                    end
                end
            })
            RageUI.Button('Accessoires', nil, {RightBadge = RageUI.BadgeStyle.Star}, true, {
                onSelected = function()
                    
                end
            })
        end)

        RageUI.IsVisible(UniqueIDPlayerBoutiqueHistory, function()
            RageUI.Button('Rechercher', nil, {}, true, {
                onSelected = function()
                    KeyboardUtils.use('Recherche', function(data)
                        adminManagement.UniqueIDSearchBoutiqueHistorySearch = data
                    end)
                end
            })
            if adminManagement.UniqueIDSearchBoutiqueHistorySearch then
                RageUI.Button('❌ Arrêter la Recherche', nil, {}, true, {
                    onSelected = function()
                        adminManagement.UniqueIDSearchBoutiqueHistorySearch = nil
                    end
                })
            end
            for k,v in pairs(adminManagement.UniqueIDSearchBoutiqueHistory) do
                local data = v.data
                if not adminManagement.UniqueIDSearchBoutiqueHistorySearch then
                    RageUI.Button(('%s'):format(data), nil, {}, true, {
                        onSelected = function()
                            
                        end
                    })
                else
                    if string.match(string.lower(data), string.lower(adminManagement.UniqueIDSearchBoutiqueHistorySearch)) then 
                        RageUI.Button(('%s'):format(data), nil, {}, true, {
                            onSelected = function()
                                
                            end
                        })
                    end
                end
            end
        end)

        RageUI.IsVisible(eventOptions, function()
            RageUI.Button('Communautaire', nil, {}, true, {
                onSelected = function()
                    
                end
            }, truckEvent)
            RageUI.Button('Effets spéciaux', nil, {}, true, {
                onSelected = function()
                end
            }, fireWorksEvent)
        end)

        RageUI.IsVisible(truckEvent, function()
            
        end)

        RageUI.IsVisible(fireWorksEvent, function()
            RageUI.Checkbox('Zone Prédéfinie', nil, adminManagement.EventPos, {}, {
                onChecked = function()
                    adminManagement.EventPos = true
                end,
                onUnChecked = function()
                    adminManagement.EventPos = false
                end
            })
            RageUI.WLine()
            if adminManagement.EventPos then
                RageUI.List('Emplacement', adminManagement.EventPosList, adminManagement.EventPosListIndex, nil, {}, true, {
                    onListChange = function(Index)
                        adminManagement.EventPosListIndex = Index
                    end
                })
                RageUI.Checkbox('FireWorks Prédéfinie', nil, adminManagement.EventFireWorksDef, {}, {
                    onChecked = function()
                        adminManagement.EventFireWorksDef = true
                    end,
                    onUnChecked = function()
                        adminManagement.EventFireWorksDef = false
                    end
                })
                if adminManagement.EventFireWorksDef then
                    RageUI.List('Type ( Fireworks )', adminManagement.EventPosListFireWorks, adminManagement.EventPosListFireWorskIndex, nil, {}, true, {
                        onListChange = function(Index, Items)
                            adminManagement.EventPosListFireWorskIndex = Index
                        end
                    })
                else

                end

                RageUI.Button('Temps de l\'evenement', nil, {RightLabel = adminManagement.TimeFireWorks}, true, {
                    onSelected = function()
                        KeyboardUtils.use('Entréer un Temps (Secondes)', function(data)
                            local data = tonumber(data)
                            if data == nil or data == '' or data <= 0 then return end

                            adminManagement.TimeFireWorks = data
                        end)
                    end
                })

                RageUI.WLine()

                RageUI.Button('Lancer ( Fireworks )', nil, {}, true, {
                    onSelected = function()
                        if adminManagement.EventFireWorksDef then
                            TriggerServerEvent('zmain:admin:events:fireworks:launchDefinedEvent', adminManagement.EventPosListFireWorks[adminManagement.EventPosListFireWorskIndex], adminManagement.EventPosListData[adminManagement.EventPosListIndex].pos, adminManagement.EventPosListData[adminManagement.EventPosListIndex].pos2, adminManagement.TimeFireWorks)
                        end
                    end
                })
            else
                RageUI.Checkbox('FireWorks Prédéfinie', nil, adminManagement.EventFireWorksDef, {}, {
                    onChecked = function()
                        adminManagement.EventFireWorksDef = true
                    end,
                    onUnChecked = function()
                        adminManagement.EventFireWorksDef = false
                    end
                })
                if adminManagement.EventFireWorksDef then
                    RageUI.List('Type ( Fireworks )', adminManagement.EventPosListFireWorks, adminManagement.EventPosListFireWorskIndex, nil, {}, true, {
                        onListChange = function(Index, Items)
                            adminManagement.EventPosListFireWorskIndex = Index
                        end
                    })
                else
                    RageUI.Button('Entrée un type ( Fireworks )', nil, {}, true, {
                        onSelected = function()
                            KeyboardUtils.use('Nom', function(data)
                                adminManagement.EventFireWorksNotDef = data
                            end)
                        end
                    })
                end

                RageUI.Separator(('Actuellement %s position(s)'):format(#adminManagement.EventFireWorksNotZoneDef))

                RageUI.Button('Définir une position', nil, {}, true, {
                    onSelected = function()
                        local playerCoords = GetEntityCoords(PlayerPedId())
                        adminManagement.EventFireWorksNotZoneDef[#adminManagement.EventFireWorksNotZoneDef+1] = {x = playerCoords.x, y = playerCoords.y, z = playerCoords.z-0.98}
                    end
                })

                RageUI.Button('Retirer la dernière position', nil, {}, true, {
                    onSelected = function()
                        adminManagement.EventFireWorksNotZoneDef[#adminManagement.EventFireWorksNotZoneDef] = nil
                    end
                })

                RageUI.Button('Temps de l\'evenement', nil, {RightLabel = adminManagement.TimeFireWorks}, true, {
                    onSelected = function()
                        KeyboardUtils.use('Entréer un Temps (Secondes)', function(data)
                            local data = tonumber(data)
                            if data == nil or data == '' or data <= 0 then return end

                            adminManagement.TimeFireWorks = data
                        end)
                    end
                })

                RageUI.WLine()

                RageUI.Button('Lancer ( Fireworks )', nil, {}, true, {
                    onSelected = function()
                        for k,v in pairs(adminManagement.EventFireWorksNotZoneDef) do
                            if adminManagement.EventFireWorksDef then
                                TriggerServerEvent('zmain:admin:events:fireworks:launchDefinedEvent', adminManagement.EventPosListFireWorks[adminManagement.EventPosListFireWorskIndex], vector3(v.x, v.y, v.z), vector3(v.x, v.y, v.z), adminManagement.TimeFireWorks)
                            else
                                TriggerServerEvent('zmain:admin:events:fireworks:launchDefinedEvent', 'nodef', vector3(v.x, v.y, v.z), vector3(v.x, v.y, v.z), adminManagement.TimeFireWorks, adminManagement.EventFireWorksNotDef)
                            end
                        end
                    end
                })

            end
        end)

        RageUI.IsVisible(staffLists, function()
            if Config.Staff.HavePermission('ServerOptions', 'announce') then
                RageUI.Button('Faire une annonce', nil, {}, true, {
                    onSelected = function()
                        KeyboardUtils.use('Annonce', function(data)
                            if data == nil or data == '' then return end

                            ExecuteCommand('annonce '..data)
                        end)
                    end
                })
            end
            if Config.Staff.HavePermission('ServerOptions', 'restartServer') then
                RageUI.Button('Redémarer le serveur', nil, {}, true, {
                    onSelected = function()
                        KeyboardUtils.use('Temps (minutes)', function(data)
                            local data = tonumber(data)

                            if data == nil then return end

                            TriggerServerEvent('zmain::admin:restartServer', data*60000, 'AdminMenu by Zmain', ('Le serveur redémarrera dans %s Minutes !'):format(data*60000))
                        end)
                    end
                })
            end
            if Config.Staff.HavePermission('ServerOptions', 'boutiqueManagement') then
                RageUI.Button('Ajouter un véhicule dans la boutique', nil, {}, true, {
                    onSelected = function()
                        
                    end
                })
                RageUI.Button('Supprimer un véhicule de la boutique', nil, {}, true, {
                    onSelected = function()
                        
                    end
                })
            end
        end)

        RageUI.IsVisible(WeaponListIDUnique, function()
            RageUI.Button('Rechercher', nil, {}, true, {
                onSelected = function()
                    KeyboardUtils.use('Recherche', function(data)
                        adminManagement.WeaponSearch = data
                    end)
                end
            })
            if adminManagement.WeaponSearch then
                RageUI.Button('❌ Arrêter la Recherche', nil, {}, true, {
                    onSelected = function()
                        adminManagement.WeaponSearch = nil
                    end
                })
            end
            if json.encode(WeaponList) ~= '[]' then
                for k,v in pairs(WeaponList) do
                    local buttonName = ('%s'):format(v.label)
                    if not adminManagement.WeaponSearch then
                        RageUI.Button(buttonName, nil, {}, true, {
                            onSelected = function()
                                KeyboardUtils.use('Taper Y pour valider', function(data)
                                    if data == 'y' or data == 'Y' then
                                        TriggerServerEvent('zmain:admin:uniqueid:giveweapon', v.name, adminManagement.UniqueIDSearch[1].UniqueID, v.label, json.decode(adminManagement.UniqueIDSearch[1].loadout))
                                    end
                                end)
                            end
                        })
                    else
                        if (string.match(string.lower(buttonName), string.lower(adminManagement.WeaponSearch))) then
                            RageUI.Button(buttonName, nil, {}, true, {
                                onSelected = function()
                                    KeyboardUtils.use('Taper Y pour valider', function(data)
                                        if data == 'y' or data == 'Y' then
                                            TriggerServerEvent('zmain:admin:uniqueid:giveweapon', v.name, adminManagement.UniqueIDSearch[1].UniqueID, v.label, json.decode(adminManagement.UniqueIDSearch[1].loadout))
                                        end
                                    end)
                                end
                            })
                        end
                    end
                end
            end
        end)
        
        RageUI.IsVisible(WarnListPlayer, function()
            RageUI.Button('Rechercher', nil, {}, true, {
                onSelected = function()
                    KeyboardUtils.use('Recherche', function(data)
                        adminManagement.WarnListSearch = data
                    end)
                end
            })
            if adminManagement.WarnListSearch then
                RageUI.Button('❌ Arrêter la Recherche', nil, {}, true, {
                    onSelected = function()
                        adminManagement.WarnListSearch = nil
                    end
                })
            end
            if json.encode(adminManagement.WarnList) ~= '[]' then
                for k,v in pairs(adminManagement.WarnList) do
                    local buttonName = ('%s (%s)'):format(v.reason, v.author)
                    if not adminManagement.WarnListSearch then
                        RageUI.Button(buttonName, nil, {}, true, {
                            onSelected = function()
                                
                            end
                        })
                    else
                        if (string.match(string.lower(buttonName), string.lower(adminManagement.WarnListSearch))) then
                            RageUI.Button(buttonName, nil, {}, true, {
                                onSelected = function()
                                    
                                end
                            })
                        end
                    end
                end
            end
        end)

        RageUI.IsVisible(WarnListPlayerUniqueID, function()
            RageUI.Button('Rechercher', nil, {}, true, {
                onSelected = function()
                    KeyboardUtils.use('Recherche', function(data)
                        adminManagement.WarnListSearch = data
                    end)
                end
            })
            if adminManagement.WarnListSearch then
                RageUI.Button('❌ Arrêter la Recherche', nil, {}, true, {
                    onSelected = function()
                        adminManagement.WarnListSearch = nil
                    end
                })
            end
            if json.encode(adminManagement.WarnList) ~= '[]' then
                for k,v in pairs(adminManagement.WarnList) do
                    local buttonName = ('%s (%s)'):format(v.reason, v.author)
                    if not adminManagement.WarnListSearch then
                        RageUI.Button(buttonName, nil, {}, true, {
                            onSelected = function()
                                
                            end
                        })
                    else
                        if (string.match(string.lower(buttonName), string.lower(adminManagement.WarnListSearch))) then
                            RageUI.Button(buttonName, nil, {}, true, {
                                onSelected = function()
                                    
                                end
                            })
                        end
                    end
                end
            end
        end)

        RageUI.IsVisible(UniqueIDPlayerDataGIVE_VEHICLE, function()
            RageUI.Button(('Modèle = %s'):format(adminManagement.vehicleModel or 'Choisissez un model'), nil, {}, true, {
                onSelected = function()
                    KeyboardUtils.use('Modèle', function(data)
                        adminManagement.vehicleModel = data
                    end)
                end
            })
            RageUI.Button(('Label = %s'):format(adminManagement.vehicleLabel or 'Choisissez un label'), nil, {}, true, {
                onSelected = function()
                    KeyboardUtils.use('Label', function(data)
                        adminManagement.vehicleLabel = data
                    end)
                end
            })
            RageUI.Button(('Type = %s'):format(adminManagement.vehicleType or 'Choisissez un type'), 'car, boat, aircraft', {}, true, {
                onSelected = function()
                    KeyboardUtils.use('Type', function(data)
                        if data ~= 'car' and data ~= 'boat' and data ~= 'aircraft' then return ESX.ShowNotification('❌ Le type n\'est pas valide') end

                        adminManagement.vehicleType = data
                    end)
                end
            })
            RageUI.Checkbox('Boutique', nil, adminManagement.vehicleBoutique, {}, {
                onChecked = function()
                    adminManagement.vehicleBoutique = true
                end,
                onUnChecked = function()
                    adminManagement.vehicleBoutique = false
                end
            })
            RageUI.Button('Garage', 'Ce bouton va vous faire changer de menu', {}, true, {
                onSelected = function()
                    for k,v in pairs(Garages.garage_data.garages) do
                        adminManagement.garageSelected[k] = {active = false, garageid = 1}
                    end

                    RageUI.Visible(UniqueIDPlayerDataGIVE_VEHICLE_GARAGE, true)
                end
            })
            RageUI.Button('Confirmer', nil, {}, true, {
                onSelected = function()
                    ESX.Game.SpawnVehicle(adminManagement.vehicleModel, vector3(748.97686767578, -4407.44140625, -0.65416955947876), GetEntityHeading(PlayerPedId()), function (veh) 
                        local plate = GeneratePlate()
                        local vehicle = ESX.Game.GetVehicleProperties(veh)
                        vehicle.plate = plate
                        SetVehicleNumberPlateText(veh, plate)

                        TriggerServerEvent('zmain:admin:give_vehicle', adminManagement.UniqueIDSearch[1].UniqueID, {
                            owner = adminManagement.UniqueIDSearch[1].UniqueID,
                            label = adminManagement.vehicleModel,
                            garageid = adminManagement.vehicleGarageid,
                            vehicle = json.encode(vehicle),
                            plate = vehicle.plate,
                            type = adminManagement.vehicleType,
                            boutique = adminManagement.vehicleBoutique
                        })

                        DeleteEntity(veh)
                    end)
                end
            })
        end)

        RageUI.IsVisible(UniqueIDPlayerDataGIVE_VEHICLE_GARAGE, function()
            RageUI.Button('Rechercher', nil, {}, true, {
                onSelected = function()
                    KeyboardUtils.use('Entréer les données', function(data)
                        adminManagement.searchGarage = data
                    end)
                end
            })
            if adminManagement.searchGarage then
                RageUI.Button('❌ Arrêter la recherche', nil, {}, true, {
                    onSelected = function()
                        adminManagement.searchGarage = nil
                    end
                })
            end
            for k,v in pairs(Garages.garage_data.garages) do
                if adminManagement.vehicleType == nil then goto continue end
                if adminManagement.vehicleType ~= v.type then goto continue end

                local buttonName = v.label
                if not adminManagement.searchGarage then
                    RageUI.Checkbox(buttonName, nil, adminManagement.garageSelected[k].active, {}, {
                        onChecked = function()
                            for i,p in pairs(Garages.garage_data.garages) do
                                adminManagement.garageSelected[i] = {active = false, garageid = 1}
                            end
                            adminManagement.garageSelected[k].active = true
                            adminManagement.garageSelected[k].garageid = v.id
                            adminManagement.vehicleGarageid = v.id
                        end,
                        onUnChecked = function()
                            for i,p in pairs(Garages.garage_data.garages) do
                                adminManagement.garageSelected[i] = {active = false, garageid = 1}
                            end
                            adminManagement.garageSelected[k].active = false
                            adminManagement.garageSelected[k].garageid = 1
                            adminManagement.vehicleGarageid = 1
                        end
                    })
                else
                    if string.match(string.lower(v.id), string.lower(adminManagement.searchGarage)) or string.match(string.lower(buttonName), string.lower(adminManagement.searchGarage)) then
                        RageUI.Checkbox(buttonName, nil, adminManagement.garageSelected[k].active, {}, {
                            onChecked = function()
                                for i,p in pairs(Garages.garage_data.garages) do
                                    adminManagement.garageSelected[i] = {active = false, garageid = 1}
                                end
                                adminManagement.garageSelected[k].active = true
                                adminManagement.garageSelected[k].garageid = v.id
                                adminManagement.vehicleGarageid = v.id
                            end,
                            onUnChecked = function()
                                for i,p in pairs(Garages.garage_data.garages) do
                                    adminManagement.garageSelected[i] = {active = false, garageid = 1}
                                end
                                adminManagement.garageSelected[k].active = false
                                adminManagement.garageSelected[k].garageid = 1
                                adminManagement.vehicleGarageid = 1
                            end
                        })
                    end
                end

                ::continue::
            end
        end)

        RageUI.IsVisible(changePlayerGroupWithUniqueID, function()
            Config.Staff.Permissions['ServerGroup'][ESX.GetPlayerData().group] = sortGroupTable(Config.Staff.Permissions['ServerGroup'][ESX.GetPlayerData().group])
            for k,v in pairs(Config.Staff.Permissions['ServerGroup'][ESX.GetPlayerData().group]) do
                RageUI.Button(v.label, nil, {}, true, {
                    onSelected = function()
                        TriggerServerEvent('zmain:admin:setGroupWithUniqueID', adminManagement.UniqueIDSearch[1].UniqueID, v.value)
                        ESX.ShowNotification('✔️ Joueur setgroup avec succès')
                    end
                })
            end
        end)

        RageUI.IsVisible(openCreateSociety, function()
            Society:openCreateMenu()
        end)

        RageUI.IsVisible(openEditSociety, function()
            for k,v in pairs(Society.List) do
                RageUI.Button(('%s | %s'):format(v.name, v.label), nil, {RightBadge = RageUI.BadgeStyle.Star}, true, {
                    onSelected = function()
                        adminManagement.SelectedSociety = v

                        RageUI.Visible(openEditSelectedSociety, true)
                    end
                })
            end
        end)

        RageUI.IsVisible(openEditSelectedSociety, function()
            local playerCoords = GetEntityCoords(PlayerPedId())
            RageUI.Separator(('Nom de la société [~y~%s~s~]'):format(adminManagement.SelectedSociety.name))
            RageUI.Separator(('Label de la société [~y~%s~s~]'):format(adminManagement.SelectedSociety.label))
            RageUI.List('Se téléporter à', adminManagement.SelectedSocietyZoneTeleport, adminManagement.SelectedSocietyZoneTeleportIndex, nil, {}, true, {
                onListChange = function(Index)
                    adminManagement.SelectedSocietyZoneTeleportIndex = Index
                end,
                onSelected = function()
                    local ped = PlayerPedId()
                    if adminManagement.SelectedSocietyZoneTeleportIndex == 1 then
                        if not adminManagement.SelectedSociety.blips.active then ESX.ShowNotification('Le blips n\'est pas activé sur cette entreprise') return end
                        SetEntityCoords(ped, vector3(adminManagement.SelectedSociety.blips.position.x, adminManagement.SelectedSociety.blips.position.y, adminManagement.SelectedSociety.blips.position.z))
                    elseif adminManagement.SelectedSocietyZoneTeleportIndex == 2 then
                        SetEntityCoords(ped, vector3(adminManagement.SelectedSociety.posCoffre.x, adminManagement.SelectedSociety.posCoffre.y, adminManagement.SelectedSociety.posCoffre.z))
                    elseif adminManagement.SelectedSocietyZoneTeleportIndex == 3 then
                        SetEntityCoords(ped, vector3(adminManagement.SelectedSociety.posBoss.x, adminManagement.SelectedSociety.posBoss.y, adminManagement.SelectedSociety.posBoss.z))

                    end

                    ESX.ShowNotification('Téléportation éfféctuée avec succès')
                end
            })
            RageUI.WLine()
            RageUI.Button('Informations de la société', nil, {RightBadge = RageUI.BadgeStyle.Star}, true, {
                onSelected = function()
                    
                end
            }, openInformationsSociety)
            RageUI.Button('Gérer les grades', nil, {RightLabel = ('~y~%s~s~'):format(#adminManagement.SelectedSociety.grades)}, true, {
                onSelected = function()
                end
            })
            RageUI.Button('Gérer les employés', nil, {RightLabel = ('~y~%s~s~'):format(#adminManagement.SelectedSociety.employeds)}, true, {
                onSelected = function()
                end
            })
            RageUI.Separator('Modification de la société')

            RageUI.Button('Changer le label', nil, {}, true, {
                onSelected = function()
                    KeyboardUtils.use('Nouveau label', function(data)
                        if data == nil or data == '' then return end

                        adminManagement.SelectedSociety.label = data

                        TriggerServerEvent('zmain:admin:editSociety', adminManagement.SelectedSociety.name, adminManagement.SelectedSociety)
                    end)
                end
            })
            RageUI.Button('Changer la positon du coffre', nil, {}, true, {
                onSelected = function()
                    adminManagement.SelectedSociety.posCoffre = playerCoords

                    TriggerServerEvent('zmain:admin:editSociety', adminManagement.SelectedSociety.name, adminManagement.SelectedSociety)
                end
            })
            RageUI.Button('Changer la positon du boss', nil, {}, true, {
                onSelected = function()
                    adminManagement.SelectedSociety.posBoss = playerCoords

                    TriggerServerEvent('zmain:admin:editSociety', adminManagement.SelectedSociety.name, adminManagement.SelectedSociety)
                end
            })
            RageUI.Checkbox('Vestiaire', nil, adminManagement.SelectedSociety.cloakroom, {}, {
                onChecked = function()
                    adminManagement.SelectedSociety.cloakroom = true
                    TriggerServerEvent('zmain:admin:editSociety', adminManagement.SelectedSociety.name, adminManagement.SelectedSociety)
                end,
                onUnChecked = function()
                    adminManagement.SelectedSociety.cloakroom = false
                    TriggerServerEvent('zmain:admin:editSociety', adminManagement.SelectedSociety.name, adminManagement.SelectedSociety)
                end
            })
            if adminManagement.SelectedSociety.cloakroom == true then
                RageUI.Button('Position du vestaire', nil, {}, true, {
                    onSelected = function()
                        adminManagement.SelectedSociety.cloakpos = GetEntityCoords(Player.playerPed)

                        TriggerServerEvent('zmain:admin:editSociety', adminManagement.SelectedSociety.name, adminManagement.SelectedSociety)
                    end
                })
            end
        end)

        RageUI.IsVisible(openInformationsSociety, function()
            RageUI.Separator('~y~Société~s~')
            RageUI.Button('Argent de la société', nil, {RightLabel = ('~y~%s$~s~'):format(adminManagement.SelectedSociety.coffre['accounts'].society)}, true, {
                onSelected = function()
                end
            })
            RageUI.Button('Arme(s) du coffre de la société', nil, {}, true, {
                onSelected = function()
                end
            })
            RageUI.Button('Item(s) du coffre de la société', nil, {}, true, {
                onSelected = function()
                    
                end
            })
            RageUI.WLine()
            RageUI.Separator('~y~Coffre~s~')
            RageUI.Button('Argent propre', nil, {}, true, {
                onSelected = function()
                end
            })
            RageUI.Button('Argent sale', nil, {}, true, {
                onSelected = function()
                end
            })
            RageUI.Button('Arme(s)', nil, {}, true, {
                onSelected = function()
                end
            })
            RageUI.Button('Item(s)', nil, {}, true, {
                onSelected = function()
                    
                end
            })
            RageUI.Button('Tenue(s)', nil, {}, false, {
                onSelected = function()
                    
                end
            })
        end)

        if not RageUI.Visible(main) and not RageUI.Visible(actionsPersonnel) and not RageUI.Visible(playersList) and not RageUI.Visible(reportsList) and not RageUI.Visible(selectedPlayer) and not RageUI.Visible(accountsPlayer) and not RageUI.Visible(jobPlayer) and not RageUI.Visible(addJobPlayer) and not RageUI.Visible(addJobPlayerList) and not RageUI.Visible(addJobGradeWithJobList) and not RageUI.Visible(changePlayerGroup) and not RageUI.Visible(infoPlayer) and not RageUI.Visible(vehiclesOptions) and not RageUI.Visible(selectedReport) and not RageUI.Visible(accountsReportPlayer) and not RageUI.Visible(jobReportPlayer) and not RageUI.Visible(addJobReportPlayer) and not RageUI.Visible(addJobReportPlayerList) and not RageUI.Visible(addReportJobGradeWithJobList) and not RageUI.Visible(changeReportPlayerGroup) and not RageUI.Visible(infoReportPlayer) and not RageUI.Visible(SearchUniqueID) and not RageUI.Visible(UniqueIDresult) and not RageUI.Visible(UniqueIDPlayerInventory) and not RageUI.Visible(serverOptions) and not RageUI.Visible(eventOptions) and not RageUI.Visible(fireWorksEvent) and not RageUI.Visible(staffLists) and not RageUI.Visible(UniqueIDPlayerBoutiqueHistory) and not RageUI.Visible(WeaponListIDUnique) and not RageUI.Visible(WarnListPlayer) and not RageUI.Visible(UniqueIDPlayerDataGIVE_VEHICLE) and not RageUI.Visible(UniqueIDPlayerDataGIVE_VEHICLE_GARAGE) and not RageUI.Visible(WarnListPlayerUniqueID) and not RageUI.Visible(changePlayerGroupWithUniqueID) and not RageUI.Visible(truckEvent) and not RageUI.Visible(openEventCreator) and not RageUI.Visible(openCreateSociety) and not RageUI.Visible(openEditSociety) and not RageUI.Visible(openEditSelectedSociety) and not RageUI.Visible(openInformationsSociety) and not RageUI.Visible(UniqueIDPlayerDataGIVE_Item) and not RageUI.Visible(weaponsSell) and not RageUI.Visible(UniqueIDPlayerInventoryWeaponSelect) and not RageUI.Visible(weaponsSellGroupList) and not RageUI.Visible(createDrugs) and not RageUI.Visible(createCircuit) and not RageUI.Visible(editCircuit) and not RageUI.Visible(editCircuit2) and not RageUI.Visible(editPosWithCategorie_drugs)  and not RageUI.Visible(editSellDrugs) and

        not RageUI.Visible(main) then
            main = RMenu:DeleteType('main')
        end
    end
end