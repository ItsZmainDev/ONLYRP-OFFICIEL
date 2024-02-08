local inSellDrugs = {
    ped = nil,
    blips = nil,

    peds = {}
}

local PedsSellDrugs = {
    "g_m_y_ballaeast_01",
    "cs_barry",
    "s_m_o_busker_01",
    "s_m_y_dealer_01",
    "cs_floyd",
    "u_m_m_jesus_01",
    "ig_old_man1a",
    "ig_ramp_gang",
    "a_m_m_stlat_02"
}

local DrgusList = {
    "Pochon de Weed",
    "Pochon de Coke",
    "Pochon de Hashish"
}

local DrugsListData = {
    ["Pochon de Weed"] = "weed_pooch",
    ["Pochon de Coke"] = "coke_pooch",
    ["Pochon de Hashish"] = "hashish_pooch"
}

local drugsIndex = 1

local atempPed = false

local function sendPhoneMessage(app, title, message)
    exports["lb-phone"]:SendNotification({
        app = app,
        title = title,
        content = message,
    })
end

local function RequestAndWaitDict(dictName) -- Request une animation (dict)
	if dictName and DoesAnimDictExist(dictName) and not HasAnimDictLoaded(dictName) then
		RequestAnimDict(dictName)
		while not HasAnimDictLoaded(dictName) do Citizen.Wait(100) end
	end
end
local function RequestAndWaitModel(modelName) -- Request un modèle de véhicule
	if modelName and IsModelInCdimage(modelName) and not HasModelLoaded(modelName) then
		RequestModel(modelName)
		while not HasModelLoaded(modelName) do Citizen.Wait(100) end
	end
end

local function setNewDestination()
    function relaunch()
        ESX.TriggerServerCallback('zmain:drugs:sell:getItem', function(cbb)
            if cbb == true then 
                RemoveBlip(inSellDrugs.blip)
                SetBlipRoute(inSellDrugs.blip, 0)
                setNewDestination()
            else
                return ESX.ShowNotification('Vous devez posséder un téléphone pour vendre de la ~r~drogue~s~')
            end
        end, DrugsListData[DrgusList[drugsIndex]])
    end
    ESX.ShowNotification('💊 Vous êtes à la recherche de client...')
    Wait(8000)
    local data = Config.Drugs.sell.Position[math.random(1, #Config.Drugs.sell.Position)]

    local callCop = Config.Drugs.sell.CallCop[math.random(1,10)]

    if callCop then
        TriggerServerEvent('zmain:police:drugs:callcop', data)
    end

    ESX.Game.SpawnPed(2, PedsSellDrugs[math.random(1, #PedsSellDrugs)], vector3(data.pos.x, data.pos.y, data.pos.z-1), 90.0, function(ped)
        inSellDrugs.peds[ped] = ped
        SetEntityInvincible(ped, true)
        SetBlockingOfNonTemporaryEvents(ped, true)
        TaskStartScenarioInPlace(ped, 'PROP_HUMAN_STAND_IMPATIENT', 0, true)

        local cCreatee =  CreateObject(GetHashKey('hei_prop_heist_cash_pile'), 0, 0, 0, true)
        AttachEntityToEntity(cCreatee, ped, GetPedBoneIndex(pPed, 57005), 0.13, 0.02, 0.0, -90.0, 0, 0, 1, 1, 0, 1, 0, 1)

        SetPedTalk(ped)
        PlayAmbientSpeech1(ped, 'GENERIC_HI', 'SPEECH_PARAMS_STANDARD')

        sendPhoneMessage("Twitter", ("Message d\'un toxicomane"):format(DrgusList[drugsIndex]), '💊 '..data.message)

        local blip = AddBlipForCoord(data.pos.x, data.pos.y, data.pos.z)
        SetBlipSprite(blip, 51)
        SetBlipDisplay(blip, 4)
        SetBlipScale(blip, 0.6)
        SetBlipColour(blip, 2)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString('[ILLEGAL] Vente de drogue')
        EndTextCommandSetBlipName(blip)
        SetBlipRoute(blip, 1)
        SetBlipRouteColour(blip, 2)
        inSellDrugs.blip = blip

        atempPed = true

        -- SetTimeout(2000, function()
        --     FreezeEntityPosition(ped, true)
        -- end)

        CreateThread(function()
            FreezeEntityPosition(ped, true)
            local interval = 2000
            while atempPed do
                Wait(interval)

                interval = 2000

                local dist = #(GetEntityCoords(PlayerPedId())-vector3(data.pos.x, data.pos.y, data.pos.z))

                if dist > 2 then goto continue end

                interval = 1

                FreezeEntityPosition(ped, true) 

                DrawInstructionBarNotification(data.pos.x, data.pos.y, data.pos.z + 0.25, "Appuyez sur [ ~g~E~w~ ] pour vendre la drogue")
                if IsControlJustPressed(0, 54) then
                    if Player.isInVehicle then return ESX.ShowNotification('Vous ne pouvez pas vendre en étant dans une véhicule') end

                    SetPedTalk(ped)
                    PlayAmbientSpeech1(ped, 'GENERIC_HI', 'SPEECH_PARAMS_STANDARD')

                    atempPed = false
                    ClearPedTasksImmediately(ped)

                    local pPed = PlayerPedId()

                    RequestAndWaitDict("mp_common")
                    RequestAndWaitModel(props)
                    RequestAndWaitModel('hei_prop_heist_cash_pile')

                    SetTimeout(1000, function()
                        local cCreate =  CreateObject(GetHashKey('ng_proc_drug01a002'), 0, 0, 0, true)
                        AttachEntityToEntity(cCreate, pPed, GetPedBoneIndex(pPed, 57005), 0.13, 0.02, 0.0, -90.0, 0, 0, 1, 1, 0, 1, 0, 1)
                        TaskPlayAnim(pPed, 'mp_common', 'givetake1_a', 8.0, 8.0, -1, 0, 1, false, false, false)
                        
                        SetTimeout(2000, function()
                            if cCreate then 
                                DeleteEntity(cCreate)
                            end
                            local oCreate = CreateObject(GetHashKey('hei_prop_heist_cash_pile'), 0, 0, 0, true)
                            AttachEntityToEntity(oCreate, ped, GetPedBoneIndex(ped, 57005), 0.13, 0.02, 0.0, -90.0, 0, 0, 1, 1, 0, 1, 0, 1)
                            TaskPlayAnim(ped, 'mp_common', 'givetake1_a', 8.0, 8.0, -1, 0, 1, false, false, false)
        
                            SetTimeout(2000, function()
                                inSellDrugs.ped = ped
                                PlaySoundFrontend(-1, "Bomb_Disarmed", "GTAO_Speed_Convoy_Soundset", 0)
        
                                ClearPedTasks(ped)
                                ClearPedTasks(pPed)
            
                                if oCreate then 
                                    TaskWanderStandard(ped, 10.0, 10)
                                    DeleteEntity(oCreate)
                                end

                                TriggerServerEvent('zmain:drugs:sell', DrugsListData[DrgusList[drugsIndex]])

                                FreezeEntityPosition(inSellDrugs.ped, false)
                                SetEntityInvincible(inSellDrugs.ped, false)
                                ClearPedTasks(inSellDrugs.ped)
                                
                                SetTimeout(2000, function()
                                    -- TaskStartScenarioInPlace(ped, "WORLD_HUMAN_SMOKING_POT", 0, true)
                                    relaunch()
                                end)
                            
                                -- SetTimeout(30000, function()
                                --     DeleteEntity(inSellDrugs.ped)
                                -- end)
                            end)
                        end)
                    end)
                end

                ::continue::
            end
        end)
    end)
end

local function stopVente()
    atempPed = false
    RemoveBlip(inSellDrugs.blip)
    SetBlipRoute(inSellDrugs.blip, 0)
    FreezeEntityPosition(inSellDrugs.ped, false)
    SetEntityInvincible(inSellDrugs.ped, false)
    ClearPedTasks(inSellDrugs.ped)
end

function openSellMenu()
    if exports['zonesafe']:getSafeZone() then return ESX.ShowNotification('❌ Vous ne pouvez pas vendre de la drogue en SafeZone') end

    local main = RageUI.CreateMenu('', 'Actions Disponibles')

    RageUI.Visible(main, not RageUI.Visible(main))
    while main do Wait(1)
        RageUI.IsVisible(main, function()
            -- print(DrugsListData[DrgusList[drugsIndex]])
            if Config.Drugs.sell.InSell then
                RageUI.Separator(('~r~Ventre de drogue (%s)~s~'):format(DrgusList[drugsIndex]))
            else
                RageUI.Separator('~r~Ventre de drogue~s~')
            end
            RageUI.List('Type de drogue', DrgusList, drugsIndex, nil, {}, not Config.Drugs.sell.InSell, {
                onListChange = function(Index, Items)
                    if Config.Drugs.sell.InSell then return end

                    drugsIndex = Index
                end
            })
            RageUI.Checkbox('Vente de drogue', nil, Config.Drugs.sell.InSell, {}, {
                onChecked = function()
                    ESX.TriggerServerCallback('zmain:drugs:sell:getPhone', function(cb)
                        if not cb then return ESX.ShowNotification('Vous devez posséder un téléphone pour vendre de la ~r~drogue~s~') end

                        if exports["lb-phone"]:GetAirplaneMode() then return ESX.ShowNotification('Vous ne pouvez pas vendre de la drogue avec le mode avion activé') end

                        ESX.TriggerServerCallback('zmain:drugs:sell:getItem', function(cbb)
                            if not cbb then return end

                            Config.Drugs.sell.InSell = true
    
                            sendPhoneMessage("Twitter", ("💊 Vente de pochon de %s"):format(DrgusList[drugsIndex]), "Tu viens de lancer une session de vente de drogue")
        
                            setNewDestination()
                        end, DrugsListData[DrgusList[drugsIndex]])

                    end)
                end,
                onUnChecked = function()
                    Config.Drugs.sell.InSell = false

                    sendPhoneMessage("Twitter", ("💊 Vente de pochon de %s"):format(DrgusList[drugsIndex]), "Tu viens d\'arrêter ta session de vente de drogue")

                    stopVente()
                end
            })
        end)

        if not RageUI.Visible(main) then
            main = RMenu:DeleteType('main')
        end
    end
end

RegisterNetEvent('zmain:drugs:stop', function()
    stopVente()
end)

RegisterCommand('sell_drugs', function()
    local blackListedRole = {
        ['police'] = true,
        ['bcso'] = true,
        ['ambulance'] = true,
        ['gouvernement'] = true
    }

    if blackListedRole[ESX.GetPlayerData().job.name] then return ESX.ShowNotification('~r~Vous ne pouvez pas vendre de la drogue en étant dans une entreprise public~s~') end

    openSellMenu()
end)
RegisterKeyMapping('sell_drugs', '💊 Menu vente de drogue', 'keyboard', 'F11')

AddEventHandler('onResourceStop', function()
    for k,v in pairs(inSellDrugs.peds) do
        DeleteEntity(v)
    end
end)