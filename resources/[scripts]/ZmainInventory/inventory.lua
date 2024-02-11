CreateThread(function()
    ESX = nil
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    while ESX == nil do Wait(1) end

    TriggerServerEvent('zmain:inventory:getSlotsItems')

    local inventory = {
        open = false,
        itemsList = {},
        fastItems = {},

        weightMax = 50,

        bagsList = {
            [40] = true,[41] = true,[44] = true,[45] = true,[81] = true,[82] = true,[85] = true,[86] = true,[118] = true,[119] = true,[120] = true,[116] = true,[117] = true,[121] = true,[122] = true,[124] = true,[125] = true,[128] = true,[134] = true,[197] = true,[111] = true,[112] = true,[114] = true
        },
    }

    hunger = 100
    thirst = 100

    CreateThread(function()
        while true do 
            Wait(5000)

            local bagIndex = GetPedDrawableVariation(PlayerPedId(), 5)

            print(inventory.bagsList[bagIndex])

            if inventory.bagsList[bagIndex] then
                inventory.weightMax = 100
            else
                inventory.weightMax = 50
            end
        end
    end)

    AddEventHandler('esx_newui:updateBasics', function(status)
        if inventory.open then
            for k,v in pairs(status) do
                if v.name == "hunger" then
                    hunger = v.percent
                end
                if v.name == "thirst" then
                    thirst = v.percent
                end
            end
        end
    end)
    
    AddEventHandler("food:updateValue", function(h,t)
        if inventory.open then
            hunger = h
            thirst = t
        end
    end)
    
    function inventory:getCurrentWeight()
        while ESX.GetPlayerData().inventory == nil do Wait(1) end
        local currentWeight = 0
        for i = 1, #ESX.GetPlayerData().inventory, 1 do
            if ESX.GetPlayerData().inventory[i].count > 0 then
                currentWeight = currentWeight + (ESX.GetPlayerData().inventory[i].weight * ESX.GetPlayerData().inventory[i].count)
            end
        end
        return(currentWeight)
    end

    local PlayerPedPreview

    function CreatePedScreen(first)
        if not exports['ZmainDev']:activeCloneInterface() then return end
        if PlayerPedPreview == nil then
            CreateThread(function()
                local heading = GetEntityHeading(PlayerPedId())
                SetFrontendActive(false)
                ActivateFrontendMenu(GetHashKey("FE_MENU_VERSION_EMPTY_NO_BACKGROUND"), false, -1)
                ReplaceHudColourWithRgba(117, 0, 0, 0, 0)
                Wait(100)
                SetMouseCursorVisibleInMenus(false)
                PlayerPedPreview = ClonePed(PlayerPedId(), heading, true, true)
                local x, y, z = table.unpack(GetEntityCoords(PlayerPedPreview))
                SetEntityCoords(PlayerPedPreview, x, y, z - 10)
                FreezeEntityPosition(PlayerPedPreview, true)
                SetEntityVisible(PlayerPedPreview, false, false)
                NetworkSetEntityInvisibleToNetwork(PlayerPedPreview, false)
                GivePedToPauseMenu(PlayerPedPreview, 1)
                SetPauseMenuPedLighting(true)
                SetPauseMenuPedSleepState(false)
                Wait(1000)
                SetPauseMenuPedSleepState(true)
            end)
        end
    end

    RegisterNetEvent('zmain:inventory:sendSlots', function(data)
        inventory.fastItems = data 

        SendNUIMessage({
            action = 'setItems',
            itemList = inventory.itemsList,
            fastItems = inventory.fastItems,
            crMenu = 'item',
            itemTrunk = {}
        })
    end)
    
    function inventory:openInventory()
        TriggerServerEvent('zmain:inventory:getSlotsItems')
        ESX.PlayerData = ESX.GetPlayerData()
    
        local w = inventory:getCurrentWeight()

        inventory.itemsList = {}

        for k,v in pairs(ESX.PlayerData.accounts) do
            if Config.Account[v.name] then
                -- Config.Pictures[v.name] = ('/src/html/assets/items/%s.png'):format(v.name)
                if Config.Pictures[v.name] == nil then
                    Config.Pictures[v.name] = 'https://cdn.discordapp.com/attachments/1008837979894198413/1129138995301994606/togo_box.png'
                end
                table.insert(inventory.itemsList, {
                    name = v.name,
                    count = v.money,
                    label = Config.AccountName[v.name],
                    image =  Config.Pictures[v.name],
                    type = 'item_money',
                    usable = true,
                })
            end
        end
    
        for k,v in pairs(ESX.PlayerData.inventory) do
            -- Config.Pictures[v.name] = ('/src/html/assets/items/%s.png'):format(v.name)
            if Config.Pictures[v.name] == nil then
                Config.Pictures[v.name] = 'https://cdn.discordapp.com/attachments/1008837979894198413/1129138995301994606/togo_box.png'
            end
            table.insert(inventory.itemsList, {
                name = v.name,
                count = v.count,
                label = v.label,
                image =  Config.Pictures[v.name],
                type = 'item_standard',
                limit = v.weight,
                usable = true,
            })
        end
    
        for k,v in pairs(ESX.PlayerData.loadout) do
            -- Config.Pictures[v.name] = ('/src/html/assets/items/%s.png'):format(v.name)
            if Config.Pictures[v.name] == nil then
                Config.Pictures[v.name] = 'https://cdn.discordapp.com/attachments/1008837979894198413/1129138995301994606/togo_box.png'
            end
            table.insert(inventory.itemsList, {
                name = v.name,
                count = v.ammo,
                label = (v.label..' (%s)'):format(v.ammo),
                image =  Config.Pictures[v.name],
                type = 'item_weapon',
                usable = true,
            })
        end

        DisplayRadar(false)
        TriggerScreenblurFadeIn(1)
        SetNuiFocus(true, true)
        SendNUIMessage({
            action = 'open:Inv',
            type = 'normal'
        })
        SendNUIMessage({
            action = 'setItems',
            itemList = inventory.itemsList,
            fastItems = inventory.fastItems,
            crMenu = 'item',
            itemTrunk = {}
        })
        SendNUIMessage({
            action = 'setSecondInventoryItems',
            itemList = {},
        })
        SendNUIMessage({
            action = 'trunk:WeightBarText',
            weightTrunk =0,
            maxWeightTrunk = 0,
            textTrunk = '0'..'/0Kg',
            plate = ''
        })
        SendNUIMessage({
            action = 'Inv:WeightBarText',
            weight =w,
            maxWeight = inventory.weightMax,
            text = (w..'/%sKg'):format(inventory.weightMax)
        })
        local ped = PlayerPedId()
        local h = GetEntityHealth(ped) - 100
        local armour = GetPedArmour(ped)
        SendNUIMessage({
            action = 'InvHud',
            hp = h,
            armor = armour,
            hunger = hunger,
            thirst = thirst
        })
        TriggerEvent('tempui:toggleUi', false)

        CreatePedScreen()
    end
    
    function inventory:closeInventory()
        SendNUIMessage({
            action = 'close:Inv'
        })
        TriggerEvent('tempui:toggleUi', true)
    end

    RegisterNuiCallback('closeInventory', function()
        DisplayRadar(true)
        TriggerScreenblurFadeOut(1000)
        SetNuiFocus(false, false)
        inventory:closeInventory()
        if inventory.open == true then
            inventory.open = false
            ActivateFrontendMenu(GetHashKey("FE_MENU_VERSION_SP_PAUSE"), true, -1)
            Wait(500)
            ReplaceHudColourWithRgba(117, 137, 0, 206, 150)
            SetPauseMenuPedLighting(false)

            DeleteEntity(PlayerPedPreview)

            PlayerPedPreview = nil
        end
    end)

    RegisterNuiCallback('itemUsable', function(data)
        if data.item.usable and data.item.usable == true and data.item.type ~= 'item_money' then
            TriggerServerEvent('esx:useItem', data.item.name, data.item)

            SendNUIMessage({
                action = 'ItemNotify',
                icon = Config.Pictures[data.item.name],
                count = ('%s'):format(1),
                message = data.item.label
            })
            SendNUIMessage({
                action = 'InvNotify',
                message = ('Vous avez utilisé ~b~x%s %s~s~'):format(1, data.item.label),
                timeout = 3500
            })
        else
            return(
                SendNUIMessage({
                    action = 'InvNotify',
                    message = 'Cet ~r~item~s~ est inutilisable',
                    timeout = 3500
                })
            )
        end
    end)
    RegisterNuiCallback('renameItem', function(data)
        SendNUIMessage({
            action = 'InvNotify',
            message = 'Pas encore au point',
            timeout = 3500
        })
        -- SendNUIMessage({
        --     action = 'open:Input',
        --     title ='Nouveau non',
        --     value = 'number',
        --     data = {}
        -- })
    end)
    RegisterNuiCallback('category', function(type)
        inventory.itemsList = {}

        if type.type == 'all' then
            for k,v in pairs(ESX.PlayerData.accounts) do
                if Config.Account[v.name] then
                    table.insert(inventory.itemsList, {
                        name = v.name,
                        count = v.money,
                        label = Config.AccountName[v.name],
                        image =  Config.Pictures[v.name],
                        type = 'item_money',
                        usable = true,
                    })
                end
            end
        
            for k,v in pairs(ESX.PlayerData.inventory) do
                table.insert(inventory.itemsList, {
                    name = v.name,
                    count = v.count,
                    label = v.label,
                    image =  Config.Pictures[v.name],
                    type = 'item_standard',
                    limit = v.weight,
                    usable = true,
                })
            end
        
            for k,v in pairs(ESX.PlayerData.loadout) do
                table.insert(inventory.itemsList, {
                    name = v.name,
                    count = v.ammo,
                    label = (v.label..' (%s)'):format(v.ammo),
                    image =  Config.Pictures[v.name],
                    type = 'item_weapon',
                    usable = true,
                })
            end
        elseif type.type == 'item' then
            for k,v in pairs(ESX.PlayerData.inventory) do
                table.insert(inventory.itemsList, {
                    name = v.name,
                    count = v.count,
                    label = v.label,
                    image =  Config.Pictures[v.name],
                    type = 'item_standard',
                    limit = v.weight,
                    usable = true,
                })
            end
        elseif type.type == 'weapon' then
            for k,v in pairs(ESX.PlayerData.loadout) do
                table.insert(inventory.itemsList, {
                    name = v.name,
                    count = v.ammo,
                    label = v.label,
                    image =  Config.Pictures[v.name],
                    type = 'item_weapon',
                    usable = true,
                })
            end
        elseif type.type == 'clothes' then
        end
        SendNUIMessage({
            action = 'setItems',
            itemList = inventory.itemsList,
            fastItems = inventory.fastItems,
            crMenu = 'item',
            itemTrunk = {}
        })
    end)
    local function updateInventory()
        inventory.itemsList = {}

        Wait(100)

        for k,v in pairs(ESX.GetPlayerData().accounts) do
            if Config.Account[v.name] then
                table.insert(inventory.itemsList, {
                    name = v.name,
                    count = v.money,
                    label = Config.AccountName[v.name],
                    image =  Config.Pictures[v.name],
                    type = 'item_money',
                    usable = true,
                })
            end
        end
    
        for k,v in pairs(ESX.GetPlayerData().inventory) do
            table.insert(inventory.itemsList, {
                name = v.name,
                count = v.count,
                label = v.label,
                image =  Config.Pictures[v.name],
                type = 'item_standard',
                limit = v.weight,
                usable = true,
            })
        end
    
        for k,v in pairs(ESX.GetPlayerData().loadout) do
            table.insert(inventory.itemsList, {
                name = v.name,
                count = v.ammo,
                label = (v.label..' (%s)'):format(v.ammo),
                image =  Config.Pictures[v.name],
                type = 'item_weapon',
                usable = true,
            })
        end

        SendNUIMessage({
            action = 'setItems',
            itemList = inventory.itemsList,
            fastItems = inventory.fastItems,
            crMenu = 'item',
            itemTrunk = {}
        })
    end
    RegisterNuiCallback('giveItem', function(data)
        local player, distance = ESX.Game.GetClosestPlayer()
        if not player or distance == -1 or distance > 3.0 then 
            return(
                SendNUIMessage({
                    action = 'InvNotify',
                    message = 'Aucun ~r~joueur~s~ aux alentours',
                    timeout = 3500
                })
            )
        end

        if data.item.type == 'item_standard' or data.item.type == 'item_money' then
            SendNUIMessage({
                action = 'open:Input',
                title ='Quantité à donner',
                value = 'number',
                data = data
            })
        elseif data.item.type == 'item_weapon' then
            TriggerServerEvent('zmain:inventory:giveItem', data.text, data, GetPlayerServerId(player))

            SendNUIMessage({
                action = 'InvNotify',
                message = ('Vous avez donné ~y~x1~s~ %s'):format(data.item.label),
                timeout = 3500
            })
        end
    end)
    RegisterNuiCallback('removeClothes', function(data)
        print('ok', data, json.encode(data))
    end)
    RegisterNuiCallback('deleteItem', function(data)
        for index, objects in ipairs(Config.Objects) do
            local myCoords = GetEntityCoords(PlayerPedId())
            local getClosestObjects = GetClosestObjectOfType(myCoords.x, myCoords.y, myCoords.z, 0.7, GetHashKey(objects), true, true, true)

            if getClosestObjects ~= 0 then

                TriggerServerEvent('zmain:inventory:removeItem', data)

                updateInventory()
                
                return
            else
                return(
                    SendNUIMessage({
                        action = 'InvNotify',
                        message = 'Aucune ~r~poubelle~s~ aux alentours',
                        timeout = 3500
                    })
                )
            end
        end
    end)
    RegisterNuiCallback('send', function(data)
        if data.value == 'number' then
            if data.text == nil then return end
            if data.text == '' then return end

            local player, distance = ESX.Game.GetClosestPlayer()
            if not player or distance == -1 or distance > 3.0 then 
                return(
                    SendNUIMessage({
                        action = 'InvNotify',
                        message = 'Aucun ~r~joueur~s~ aux alentours',
                        timeout = 3500
                    })
                )
            end

            TriggerServerEvent('zmain:inventory:giveItem', data.text, data.data, GetPlayerServerId(player))

            SendNUIMessage({
                action = 'InvNotify',
                message = ('Vous avez donné ~y~x%s~s~ %s'):format(data.text, data.data.item.label),
                timeout = 3500
            })

            updateInventory()
        end
    end)

    RegisterNuiCallback('PutIntoFast', function(data)
        for k,v in pairs(inventory.fastItems) do
            if v.slot == data.slot then
                table.remove(inventory.fastItems, k)
            end
        end
        table.insert(inventory.fastItems, {
            label = data.item.label, slot = data.slot, image = Config.Pictures[data.item.name], name = data.item.name, item = data.item
        })
        SendNUIMessage({
            action = 'setItems',
            itemList = inventory.itemsList,
            fastItems = inventory.fastItems,
            crMenu = 'item',
            itemTrunk = {}
        })
        TriggerServerEvent('zmain:inventory:updateSlots', inventory.fastItems)
    end)

    RegisterNuiCallback('TakeFromFast', function(data)
        for k,v in pairs(inventory.fastItems) do
            if v.name == data.item.name then
                table.remove(inventory.fastItems, k)

                SendNUIMessage({
                    action = 'setItems',
                    itemList = inventory.itemsList,
                    fastItems = inventory.fastItems,
                    crMenu = 'item',
                    itemTrunk = {}
                })
                TriggerServerEvent('zmain:inventory:updateSlots', inventory.fastItems)
            end
        end
    end)

    RegisterCommand('open_inventory', function()
        if inventory.open == true then return end
        inventory.open = not inventory.open
        inventory:openInventory()
    end)
    RegisterKeyMapping('open_inventory', 'Inventaire', 'keyboard', 'TAB')

    AddEventHandler('onResourceStop', function(r)
        if GetCurrentResourceName() == r then
            
        end
    end)

    RegisterNetEvent('zmain:inventory:notifi', function(message)
        SendNUIMessage({
            action = 'InvNotify',
            message = message,
            timeout = 3500
        })
    end)

    CreateThread(function()
        while true do
            Wait(1000)
            HideHudComponentThisFrame(19)
            HideHudComponentThisFrame(20)
            BlockWeaponWheelThisFrame()
            SetPedCanSwitchWeapon(PlayerPedId(), false)
        end
    end)

    local slotsData = {
        {slot = 1, key = 157},
        {slot = 2, key = 158},
        {slot = 3, key = 160},
        {slot = 4, key = 164},
        {slot = 5, key = 165},
    }

    RegisterCommand("+slot-1", function() 
        if IsPedSittingInAnyVehicle(PlayerPedId()) then return end
        if (slotsData[1]) then
            for i, p in pairs(inventory.fastItems) do
                if p.slot == slotsData[1].slot then
                    TriggerServerEvent('esx:useItem', p.name, p.item)

                    SendNUIMessage({
                        action = 'ItemNotify',
                        icon = Config.Pictures[p.item.name],
                        count = ('%s'):format(1),
                        message = p.item.label
                    })
                end
            end
        end
    end)
    RegisterKeyMapping("+slot-1", "Use item slot 1", "keyboard", "1")

    RegisterCommand("+slot-2", function() 
        if IsPedSittingInAnyVehicle(PlayerPedId()) then return end
        if (slotsData[2]) then
            for i, p in pairs(inventory.fastItems) do
                if p.slot == slotsData[2].slot then
                    TriggerServerEvent('esx:useItem', p.name, p.item)

                    SendNUIMessage({
                        action = 'ItemNotify',
                        icon = Config.Pictures[p.item.name],
                        count = ('%s'):format(1),
                        message = p.item.label
                    })
                end
            end
        end
    end)
    RegisterKeyMapping("+slot-2", "Use item slot 2", "keyboard", "2")

    RegisterCommand("+slot-3", function()
        if IsPedSittingInAnyVehicle(PlayerPedId()) then return end 
        if (slotsData[3]) then
            for i, p in pairs(inventory.fastItems) do
                if p.slot == slotsData[3].slot then
                    TriggerServerEvent('esx:useItem', p.name, p.item)

                    SendNUIMessage({
                        action = 'ItemNotify',
                        icon = Config.Pictures[p.item.name],
                        count = ('%s'):format(1),
                        message = p.item.label
                    })
                end
            end
        end
    end)
    RegisterKeyMapping("+slot-3", "Use item slot 3", "keyboard", "3")

    RegisterCommand("+slot-4", function() 
        if IsPedSittingInAnyVehicle(PlayerPedId()) then return end
        if (slotsData[4]) then
            for i, p in pairs(inventory.fastItems) do
                if p.slot == slotsData[4].slot then
                    TriggerServerEvent('esx:useItem', p.name, p.item)

                    SendNUIMessage({
                        action = 'ItemNotify',
                        icon = Config.Pictures[p.item.name],
                        count = ('%s'):format(1),
                        message = p.item.label
                    })
                end
            end
        end
    end)
    RegisterKeyMapping("+slot-4", "Use item slot 4", "keyboard", "4")

    RegisterCommand("+slot-5", function() 
        if IsPedSittingInAnyVehicle(PlayerPedId()) then return end
        if (slotsData[5]) then
            for i, p in pairs(inventory.fastItems) do
                if p.slot == slotsData[5].slot then
                    TriggerServerEvent('esx:useItem', p.name, p.item)

                    SendNUIMessage({
                        action = 'ItemNotify',
                        icon = Config.Pictures[p.item.name],
                        count = ('%s'):format(1),
                        message = p.item.label
                    })
                end
            end
        end
    end)
    RegisterKeyMapping("+slot-5", "Use item slot 5", "keyboard", "5")

    CreateThread(function()
        while ESX == nil do Wait(1) end
        while true do
            Wait(100)
            if inventory:getCurrentWeight() > inventory.weightMax then

                local ped = PlayerPedId()
                if (IsPedRunning(ped) or IsPedSprinting(ped)) or IsPedClimbing(ped) or IsPedJumping(ped) and not IsPedRagdoll(ped) then
                    SetPedToRagdoll(PlayerPedId(), 1000, 0, 0, 0, 0, 0)

                    ESX.ShowNotification('~r~Attention !~s~ \nVous êtes trop lourd, vos actions sont limitées')
                end
            else

            end
        end 
    end)
end)

AddEventHandler('onResourceStart', function(r)
    if GetCurrentResourceName() == r then
        TriggerServerEvent('zmain:inventory:restart')
    end
end)