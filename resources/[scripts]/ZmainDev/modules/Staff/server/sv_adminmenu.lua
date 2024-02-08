adminManagement = {
    Service = {},
    Players = {},
    staffList = {},
    Reports = {},
    UniqueIDSearch = {},
    UniqueIDSearchBoutiqueHistory = {},
    ItemsList = {},
    WarnList = {},
    sanctionsList = {},

    jails = {},
}

AddEventHandler('esx:playerLoaded', function(source, xPlayer)
    local source = source

    adminManagement.Players[source] = {
        name = GetPlayerName(source),
        id = source,
        UniqueID = xPlayer.UniqueID,
        group = xPlayer.getGroup(),
        job = xPlayer.getJob(),
        job2 = xPlayer.getJob2(),
        player = xPlayer,
        identifier = xPlayer.identifier
    }

    if xPlayer.getGroup() ~= 'user' then
        adminManagement.staffList[source] = {
            name = GetPlayerName(source),
            id = source,
            UniqueID = xPlayer.UniqueID,
            group = xPlayer.getGroup(),
            job = xPlayer.getJob(),
            job2 = xPlayer.getJob2(),
            service = false
        }

        TriggerClientEvent("zmain:admin:addReport", source, nil, adminManagement.Reports)

        TriggerClientEvent('zmain:reports:refreh:service', source, adminManagement.Reports)
    end

    adminManagement:AddPlayer()
    adminManagement:UpdateStaffs()

    MySQL.Async.execute("UPDATE users SET connected = @connected WHERE UniqueID = @UniqueID", {['@UniqueID'] = xPlayer.UniqueID, ['@connected'] = 1}, function()
        
    end)
end)

AddEventHandler('playerDropped', function(reason)
    local source = source

    if not adminManagement.Players[source] then return end

    local playerId = ReturnPlayerId(adminManagement.Players[source].UniqueID)

    if not playerId then return end

    MySQL.Async.fetchAll('SELECT * FROM users WHERE UniqueID = @UniqueID', {
        ['@UniqueID'] = playerId.UniqueID
    }, function(result)
        local loadout = json.decode(result[1].loadout)
        for k,v in pairs(loadout) do
            if v.name == 'weapon_musket' or v.name == 'WEAPON_MUSKET' then
                table.remove(loadout, k)
            end
        end

        MySQL.Async.execute('UPDATE users SET loadout = @loadout WHERE UniqueID = @UniqueID', {
            ['@UniqueID'] = playerId.UniqueID,
            ['@loadout'] = json.encode(loadout)
        }, function()
            
        end)
    end)

    if playerId then
        adminManagement.Reports[playerId.id] = nil
        adminManagement:RemoveReport(playerId.UniqueID, source)
    end

    adminManagement.Players[source] = nil
    adminManagement.staffList[source] = nil

    Wait(100)

    adminManagement:AddPlayer()
    adminManagement:UpdateStaffs()
end)

RegisterNetEvent('zmain:admin:restart', function()
    local source = source

    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer then return end

    adminManagement.Players[source] = {
        name = GetPlayerName(source),
        id = source,
        UniqueID = xPlayer.UniqueID or 'none',
        group = xPlayer.getGroup(),
        job = xPlayer.getJob(),
        job2 = xPlayer.getJob2(),
        player = xPlayer,
        identifier = xPlayer.identifier
    }

    if xPlayer.getGroup() ~= 'user' then
        adminManagement.staffList[source] = {
            name = GetPlayerName(source),
            id = source,
            UniqueID = xPlayer.UniqueID,
            group = xPlayer.getGroup(),
            job = xPlayer.getJob(),
            job2 = xPlayer.getJob2(),
            service = false
        }
    end

    adminManagement:AddPlayer()
    adminManagement:UpdateStaffs()
end)

RegisterNetEvent('zmain:admin:service', function()
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    adminManagement.Service[xPlayer.UniqueID] = not adminManagement.Service[xPlayer.UniqueID]

    TriggerClientEvent('zmain:admin:service', source, adminManagement.Service[xPlayer.UniqueID])

    adminManagement.staffList[source].service = adminManagement.Service[xPlayer.UniqueID]

    if adminManagement.Service[xPlayer.UniqueID] == false then

        adminManagement:NotifyActiveStaff(('Le staff ~y~%s~s~ a finit son service'):format(GetPlayerName(source)))
        adminManagement:setLogsType('logs', ('Fin de service (%s)'):format(GetPlayerName(source)), ('Fin de service du staff: **%s**\nID: **%s**\nUniqueID: **%s**\nLicence: **%s**\nGroup: **%s**'):format(GetPlayerName(source), source, xPlayer.UniqueID, xPlayer.identifier, xPlayer.group), 'adminMenu', 'https://discord.com/api/webhooks//-', false)
    
    elseif adminManagement.Service[xPlayer.UniqueID] == true then

        adminManagement:NotifyActiveStaff(('Le staff ~y~%s~s~ a prit son service'):format(GetPlayerName(source)))
        adminManagement:setLogsType('logs', ('Prise de service (%s)'):format(GetPlayerName(source)), ('Prise de service du staff: **%s**\nID: **%s**\nUniqueID: **%s**\nLicence: **%s**\nGroup: **%s**'):format(GetPlayerName(source), source, xPlayer.UniqueID, xPlayer.identifier, xPlayer.group), 'adminMenu', 'https://discord.com/api/webhooks/QCTKuG', false)
    
    end

    for k,v in pairs(adminManagement.Players) do
        if v.group == 'user' then goto continue end

        TriggerClientEvent('zmain:admin:addStaff:service', k, source, adminManagement.Service[xPlayer.UniqueID])

        ::continue::
    end
end)

RegisterCommand('report', function(source, args)
    local source = source
    if source == 0 then goto continue end

    if #args == 0 then TriggerClientEvent('esx:showNotification', source, '⛔ Raison invalide') goto continue end

    local xPlayer = ESX.GetPlayerFromId(source)

    if adminManagement.Reports[xPlayer.UniqueID] ~= nil then TriggerClientEvent('esx:showNotification', source, '⛔ Vous avez déjà un report en cours') goto continue end 

    adminManagement.Reports[xPlayer.UniqueID] = {
        author = GetPlayerName(source),
        source = source,
        UniqueID = xPlayer.UniqueID,
        reason = table.concat( args, " " ),
        take = false,
        takeBY = 'Personne',
        job = xPlayer.getJob(),
        job2 = xPlayer.getJob2()
    }

    adminManagement:AddReport(source)

    ::continue::
end)

RegisterNetEvent('zmain:admin:mort:report', function(message)
    local source = source
    if source == 0 then goto continue end

    local xPlayer = ESX.GetPlayerFromId(source)

    if adminManagement.Reports[xPlayer.UniqueID] ~= nil then TriggerClientEvent('esx:showNotification', source, '⛔ Vous avez déjà un report en cours') goto continue end 

    adminManagement.Reports[xPlayer.UniqueID] = {
        author = GetPlayerName(source),
        source = source,
        UniqueID = xPlayer.UniqueID,
        reason = message,
        take = false,
        takeBY = 'Personne',
        job = xPlayer.getJob(),
        job2 = xPlayer.getJob2()
    }

    adminManagement:AddReport(source)

    ::continue::
end)

RegisterCommand('closeReport', function(source)
    local source = source
    if source == 0 then goto continue end

    adminManagement:RemoveMyReport(source)

    ::continue::
end)

RegisterNetEvent('zmain:admin:takeReport', function(reportID, src)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if not reportID then return end

    adminManagement.Reports[reportID].take = true
    adminManagement.Reports[reportID].takeBY = GetPlayerName(source)
    adminManagement.Reports[reportID].takeUID = xPlayer.UniqueID

    adminManagement:takeReport(src, reportID, GetPlayerName(source))

    TriggerClientEvent('zmain:admin:teleport', source, GetEntityCoords(GetPlayerPed(src)))
    -- TriggerClientEvent('esx:showNotification', src, '😀 Votre report a été pris en charge')
end)

RegisterNetEvent('zmain:admin:closeReport', function(reportID, src)
    local source = source

    adminManagement:RemoveReport(GetPlayerName(source), reportID)
    -- TriggerClientEvent('esx:showNotification', src, '💯 Votre report a été clôturé ! N\'hésitez pas à recontacter l\'équipe d\'assistance si vous avez de nouveau un problème ou une question.')
end)

function adminManagement:AddReport(src)
    for k,v in pairs(adminManagement.Players) do
        if v.group == 'user' then goto continue end

        TriggerClientEvent("zmain:admin:addReport", k, src, adminManagement.Reports, 'new')

        ::continue::
    end

    adminManagement:NotifyActiveStaff(('⭐ Un nouveau report à été recus ~b~#%s~s~'):format(src))
end

function adminManagement:takeReport(src, reportID, takeBY)
    for k,v in pairs(adminManagement.Players) do
        if v.group == 'user' then goto continue end

        TriggerClientEvent("zmain:admin:addReport", k, src, adminManagement.Reports)

        ::continue::
    end

    adminManagement:NotifyActiveStaff(('⭐ Le staff %s a pris en charge le report #%s'):format(takeBY, reportID))
end

function adminManagement:RemoveReport(takeBY, reportID)

    if adminManagement.Reports[reportID] == nil then return end

    for k,v in pairs(adminManagement.Players) do
        if v.group == 'user' then goto continue end

        adminManagement.Reports[reportID] = nil

        TriggerClientEvent("zmain:admin:removeReport", k, nil, reportID, adminManagement.Reports)

        ::continue::
    end

    adminManagement:NotifyActiveStaff(('⭐ Le staff %s a clôturé le report #%s'):format(takeBY, reportID))
end

function adminManagement:RemoveMyReport(src)
    for k,v in pairs(adminManagement.Players) do
        if v.group == 'user' then goto continue end

        adminManagement.Reports[k] = nil

        TriggerClientEvent("zmain:admin:removeReport", k, nil, src, adminManagement.Reports)

        ::continue::
    end
end

function adminManagement:NotifyActiveStaff(msg)
    for k,v in pairs(adminManagement.Players) do

        if v.group == 'user' then goto continue end 

        if not adminManagement.Service[v.UniqueID] then goto continue end

        TriggerClientEvent('esx:showNotification', k, msg)

        ::continue::
    end
end

function adminManagement:AddPlayer(id)
    for k,v in pairs(adminManagement.Players) do
        if v.group == 'user' then goto continue end 

        TriggerClientEvent("zmain:admin:addPlayer", k, adminManagement.Players)
        
        ::continue::
    end
end

function adminManagement:UpdateStaffs()
    for k,v in pairs(adminManagement.Players) do
        if v.group == 'user' then goto continue end 

        TriggerClientEvent("zmain:admin:addStaff", k, adminManagement.staffList)
        
        ::continue::
    end
end

RegisterNetEvent('zmain:admin:goto', function(target)
    local source = source

    TriggerClientEvent('zmain:admin:teleport', source, GetEntityCoords(GetPlayerPed(target)))
end)

RegisterNetEvent('zmain:admin:bring', function(target, coords)
    local source = source

    TriggerClientEvent('zmain:admin:teleport', target, coords)
end)

RegisterNetEvent('zmain:admin:teleport', function(target, coords)
    local source = source

    TriggerClientEvent('zmain:admin:teleport', target, coords)
end)

RegisterNetEvent('zmain:admin:screen', function(target)
    local source = source

    TriggerClientEvent('zmain:admin:requestScreen', target, target, nil, GetPlayerName(source))
end)

RegisterNetEvent('zmain:admin:spawnVehicle', function(target, model)
    local source = source

    TriggerClientEvent('esx:spawnVehicle', target, model)
end)

ESX.RegisterServerCallback('zmain:admin:getAccounts', function(source, cb, UniqueID)
    local source = source
    local accounts = {}
    local cash, bank, black_money = 0

    MySQL.Async.fetchAll('SELECT * FROM users WHERE UniqueID = @UniqueID', {['@UniqueID'] = UniqueID}, function(result)
        if json.encode(result) == '[]' then return end
        for k,v in pairs(json.decode(result[1].accounts)) do
            if v.name == 'cash' then
                cash = v.money
            end
            if v.name == 'bank' then
                bank = v.money
            end
            if v.name == 'black_money' then
                black_money = v.money
            end
            accounts = {
                {cash = cash},  
                {bank = bank},
                {black_money = black_money}
            }
        end

        cb(accounts)
    end)
end)

ESX.RegisterServerCallback('zmain:admin:getAllJobs', function(source, cb)
    local source = source
    adminManagement.JobList = {}

    MySQL.Async.fetchAll('SELECT * FROM jobs', {}, function(result)
        for k,v in pairs(result) do
            table.insert(adminManagement.JobList, v)
        end

        cb(adminManagement.JobList)
    end)
end)

ESX.RegisterServerCallback('zmain:admin:getGradeWithJob', function(source, cb, job)
    local source = source
    adminManagement.getGradeWithJob = {}

    MySQL.Async.fetchAll('SELECT * FROM job_grades WHERE job_name = @job_name', {['@job_name'] = job}, function(result)
        for k,v in pairs(result) do
            table.insert(adminManagement.getGradeWithJob, v)
        end

        cb(adminManagement.getGradeWithJob)
    end)
end)

ESX.RegisterServerCallback('zmain:admin:getAllJobs', function(source, cb)
    local source = source
    adminManagement.JobList = {}

    MySQL.Async.fetchAll('SELECT * FROM jobs', {}, function(result)
        for k,v in pairs(result) do
            table.insert(adminManagement.JobList, v)
        end

        cb(adminManagement.JobList)
    end)
end)

ESX.RegisterServerCallback('zmain:admin:getGradeWithJob', function(source, cb, job)
    local source = source
    adminManagement.getGradeWithJob = {}

    MySQL.Async.fetchAll('SELECT * FROM job_grades WHERE job_name = @job_name', {['@job_name'] = job}, function(result)
        for k,v in pairs(result) do
            table.insert(adminManagement.getGradeWithJob, v)
        end

        cb(adminManagement.getGradeWithJob)
    end)
end)

RegisterNetEvent('zmain:admin:setPlayerJob', function(target, job, grade, value)
    local source = source
    local targetPlayer = ESX.GetPlayerFromId(target)

    print(target, job, grade, value)

    if value == 'job' then
        targetPlayer.setJob(job, tonumber(grade))
    elseif value == 'job2' then
        targetPlayer.setJob2(job, tonumber(grade))
    end
end)

RegisterNetEvent('zmain:admin:setGroup', function(target, group)
    local source = source
    local targetPlayer = ESX.GetPlayerFromId(target)

    targetPlayer.setGroup(group)

    adminManagement.staffList[targetPlayer.source] = {
        name = GetPlayerName(targetPlayer.source),
        id = targetPlayer.source,
        UniqueID = targetPlayer.UniqueID,
        group = targetPlayer.getGroup(),
        job = targetPlayer.getJob(),
        job2 = targetPlayer.getJob2(),
        service = false
    }

	Wait(1000)
    
	TriggerClientEvent('zmain:admin:restart', -1)
    TriggerClientEvent('zmain:admin:checkGroupOnChangePlayerGroup', targetPlayer.source, group)
    adminManagement:UpdateStaffs()
end)

RegisterNetEvent('zmain:admin:setGroupWithUniqueID', function(target, group)
    local source = source
    local targetPlayer = ReturnPlayerIdUseESXfunctions(target)

    if targetPlayer then
        local targetPlayer = ESX.GetPlayerFromId(targetPlayer.source)

        targetPlayer.setGroup(group)

        if group == 'user' then
            adminManagement.staffList[targetPlayer.source] = nil
        else
            
        adminManagement.staffList[targetPlayer.source] = {
            name = GetPlayerName(targetPlayer.source),
            id = targetPlayer.source,
            UniqueID = targetPlayer.UniqueID,
            group = group,
            job = targetPlayer.getJob(),
            job2 = targetPlayer.getJob2(),
            service = false
        }
        end

        Wait(1000)
    
        TriggerClientEvent('zmain:admin:restart', -1)
        TriggerClientEvent('zmain:admin:checkGroupOnChangePlayerGroup', targetPlayer.source, group)
        adminManagement:UpdateStaffs()
    else
        MySQL.Async.execute('UPDATE users SET permission_group= @p WHERE UniqueID = @U', {
            ['@p'] = group,
            ['@U'] = target
        }, function()
            
        end)
    end
end)

RegisterNetEvent('zmain:admin:delVeh', function(veh)
    DeleteEntity(NetworkGetEntityFromNetworkId(veh))
end)

RegisterNetEvent('zmain:admin:repairVeh', function(veh)
    TriggerClientEvent('zmain:admin:repairVeh', -1, veh)
end)

RegisterNetEvent('zmain:admin:freezeunfreezeplayer', function(target, value)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(target)

    TriggerClientEvent('zmain:admin:freezeUnfreezePlayer', xPlayer.source, value)
end)

RegisterNetEvent('zmain:admin:fullCustomVeh', function(veh)
    TriggerClientEvent('zmain:admin:fullCustomVeh', -1, veh)
end)

RegisterNetEvent('zmain:admin:freezeunfreezevehicle', function(veh, value)
    FreezeEntityPosition(NetworkGetEntityFromNetworkId(veh), value)
end)

RegisterNetEvent('zmain:admin:clearInventory', function(target)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(target)

    for k,v in pairs(xPlayer.getInventory()) do
        xPlayer.removeInventoryItem(v.name, v.count)
    end

    TriggerClientEvent('esx:showNotification', source, ('✔️ inventaire du joueur ~p~%s~s~ clear avec succès'):format(xPlayer.getName()))
end)

RegisterNetEvent('zmain:admin:clearWeapon', function(target)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(target)

    for k,v in pairs(xPlayer.getLoadout()) do
        xPlayer.removeWeapon(v.name, v.ammo)
    end

    TriggerClientEvent('esx:showNotification', source, ('✔️ arme(s) du joueur ~p~%s~s~ clear avec succès'):format(xPlayer.getName()))
end)

RegisterNetEvent('zmain:admin:clearInventoryUniqueID', function(UniqueID)

end)

RegisterNetEvent('zmain:admin:clearWeaponUniqueID', function(UniqueID)

end)

RegisterNetEvent('zmain:admin:returnveh', function(veh)
    TriggerClientEvent('zmain:admin:returnveh', -1, veh)
end)

RegisterNetEvent('zmain:admin:getPosForRreturnPlayer', function(target)
    for k,v in pairs(adminManagement.Players) do
        if v.group == 'user' then goto continue end 

        TriggerClientEvent('zmain:admin:returnlasposplayer', k, target, GetEntityCoords(GetPlayerPed(target)))
        
        ::continue::
    end
end)

RegisterNetEvent('zmain:admin:player:return', function(target, pos)
    TriggerClientEvent('zmain:admin:teleport', target, vector3(pos))
end)

ESX.RegisterServerCallback('zmain:admin:getUniqueIDUnique', function(source, cb, UniqueID)
    local source = source
    adminManagement.UniqueIDSearch[UniqueID] = {}

    MySQL.Async.fetchAll('SELECT * FROM users WHERE UniqueID = @UniqueID', {['@UniqueID'] = UniqueID}, function(result)
        if result[1] == nil then return TriggerClientEvent('esx:showNotification', source, '⛔ Impossible de trouver l\'ID Unique') end

        for k,v in pairs(result) do
            local target = ESX.GetPlayerFromIdentifier(v.identifier)

            if target then v.id = target.source v.inventory = json.encode(target.inventory) v.loadout = json.encode(target.loadout) else v.id = nil v.inventory = v.inventory v.loadout = v.loadout end

            if target then v.group = target.group else v.group = v.permission_group end

            if not target then
                if v.accounts == '[]' then v.accounts = { {name = 'cash', money = 0 },  {name = 'bank', money = 0}, {name = 'black_money', money = 0} } else for p,i in pairs(json.decode(v.accounts)) do if i.name == 'cash' then cash = i.money end if i.name == 'bank' then bank = i.money end if i.name == 'black_money' then black_money = i.money end v.accounts = { {name = 'cash', money = cash },   {name = 'bank', money = bank}, {name = 'black_money', money = black_money} } end end
            else
                v.accounts = { {name = 'cash', money = target.getAccount('cash').money}, {name = 'bank', money = target.getAccount('bank').money}, {name = 'black_money', money = target.getAccount('black_money').money} }
            end
            v.isBaned = false
            if banList[v.identifier] == nil then
                v.isBaned = false
            else
                v.isBaned = true
            end
            table.insert(adminManagement.UniqueIDSearch[UniqueID], v)
        end

        cb(adminManagement.UniqueIDSearch[UniqueID])
    end)
end)

RegisterNetEvent('zmain:admin:announce', function(message)
    local source = source
    TriggerClientEvent('txcl:showAnnouncement', -1, message, GetPlayerName(source))
end)

RegisterNetEvent('zmain::admin:restartServer', function(time, auth, message)
    TriggerClientEvent('txAdmin:events:serverShuttingDown', -1, time, auth, message)
end)

RegisterNetEvent('zmain:admin:uniqueid:removeMoney', function(target, targetUID, number, type)
    local source = source    
    local targetPlayer = ESX.GetPlayerFromId(target)

    for k,v in pairs(adminManagement.UniqueIDSearch[targetUID][1].accounts) do

        if v.name == type then
            v.money = v.money - number
        end

        adminManagement.UniqueIDSearch[targetUID][1].accounts[k] = v
    end

    if targetPlayer then
        targetPlayer.removeAccountMoney(type, number)
    else
        MySQL.Async.execute('UPDATE users SET accounts = @accounts WHERE UniqueID = @UniqueID', {
            ['@UniqueID'] = targetUID,
            ['@accounts'] = json.encode(adminManagement.UniqueIDSearch[targetUID][1].accounts)
            }, function()
            
        end)
    end

    for k,v in pairs(adminManagement.Players) do
        if v.group == 'user' then goto continue end 

        TriggerClientEvent('zmain:admin:uniqueid:updateAccounts', k,  json.encode(adminManagement.UniqueIDSearch[targetUID][1].accounts))

        ::continue::
    end

    TriggerClientEvent('esx:showNotification', source, ('%s on était enlever au joueur avec succès (%s)'):format(number, type))
end)

RegisterNetEvent('zmain:admin:uniqueid:removeItem', function(target, targetUID, number, itemName, inv)
    local source = source    
    local targetPlayer = ESX.GetPlayerFromId(target)

    adminManagement.UniqueIDSearch[targetUID].inventory = inv

    for k,v in pairs(adminManagement.UniqueIDSearch[targetUID].inventory) do
        if v.name == itemName then
            v.count = v.count - number
            if tonumber(v.count) <= 0 then
                table.remove(adminManagement.UniqueIDSearch[targetUID].inventory, k)
            end
        end
    end

    if targetPlayer then
        targetPlayer.removeInventoryItem(itemName, number)
    else
        MySQL.Async.execute('UPDATE users SET inventory = @inventory WHERE UniqueID = @UniqueID', {
            ['@UniqueID'] = targetUID,
            ['@inventory'] = json.encode(adminManagement.UniqueIDSearch[targetUID].inventory)
            }, function()
            
        end)
    end

    for k,v in pairs(adminManagement.Players) do
        if v.group == 'user' then goto continue end 

        TriggerClientEvent('zmain:admin:uniqueid:updateInventory', k,  json.encode(adminManagement.UniqueIDSearch[targetUID].inventory))

        ::continue::
    end

    TriggerClientEvent('esx:showNotification', source, ('%s on était enlever au joueur avec succès (%s)'):format(number, itemName))
end)

RegisterNetEvent('zmain:admin:uniqueid:removeWeapon', function(target, targetUID, weapon, loadout, data)
    local source = source
    local targetPlayer = ESX.GetPlayerFromId(target)

    adminManagement.UniqueIDSearch[targetUID].loadout = loadout

    for k,v in pairs(adminManagement.UniqueIDSearch[targetUID].loadout) do
        if v.name == weapon then
            table.remove(adminManagement.UniqueIDSearch[targetUID].loadout, k)
        end
    end

    if target then
        targetPlayer.removeWeapon(weapon)
    else
        MySQL.Async.execute('UPDATE users SET loadout = @loadout WHERE UniqueID = @UniqueID', {
            ['@UniqueID'] = targetUID,
            ['@loadout'] = json.encode(adminManagement.UniqueIDSearch[targetUID].loadout)
            }, function()
            
        end)
    end

    for k,v in pairs(adminManagement.Players) do
        if v.group == 'user' then goto continue end 

        TriggerClientEvent('zmain:admin:uniqueid:updateLoadout', k,  json.encode(adminManagement.UniqueIDSearch[targetUID].loadout))

        ::continue::
    end

    TriggerClientEvent('esx:showNotification', source, ('Arme enlevée avec succès\nLabel de l\'arme: %s\nNom de l\'arme: %s\nMunition: %s'):format(data.label, data.name, data.ammo))
end)

RegisterNetEvent('zmain:admin:events:fireworks:launchDefinedEvent', function(type, pos, pos2, time, tnodef)
    print(time)
    local source = source

    if type == 'Fontaine de feux' then
        TriggerClientEvent('zmain:admin:events:fireworks:startFireworks', -1, 'scr_indep_firework_trail_spawn', pos, pos2, time)
    elseif type == 'Explosion de feux' then
        TriggerClientEvent('zmain:admin:events:fireworks:startFireworks', -1, 'scr_indep_firework_shotburst', pos, pos2, time)
    elseif type == 'Explosion étoile blanche' then
        TriggerClientEvent('zmain:admin:events:fireworks:startFireworks', -1, 'scr_indep_firework_burst_spawn', pos, pos2, time)
    elseif type == 'nodef' then
        TriggerClientEvent('zmain:admin:events:fireworks:startFireworks', -1, tnodef, pos, pos2, time)
    end
end)

RegisterNetEvent('zmain:admin:players:wipe', function(target, targetUID)
    local source = source

    DropPlayer(target, 'Vous avez été wipe ! Relancez votre client avant de vous reconnecter !')

    Wait(100)

    MySQL.Async.execute('UPDATE users SET permission_group = @permission_group, position = @position, skin = @skin, accounts = @accounts, inventory = @inventory, loadout = @loadout, job = @job, job_grade = @job_grade, job2 = @job2, job2_grade = @job2_grade, firstname = @firstname, lastname = @lastname, dateofbirth = @dateofbirth, sex = @sex, height = @height, clothes = @clothes WHERE UniqueID = @UniqueID', {
        ['@UniqueID'] = targetUID,
        ['@permission_group'] = 'user',
        ['@position'] = json.encode(vector3(-1044.7137451172, -2749.8737792969, 21.363418579102)),
        ['@skin'] = nil,
        ['@accounts'] = '[]',
        ['@inventory'] = '[]',
        ['@loadout'] = '[]',
        ['@job'] = 'unemployed',
        ['@job_grade'] = 0,
        ['@job2'] = 'unemployed2',
        ['@job2_grade'] = 0,
        ['@firstname'] = 'nil',
        ['@lastname'] = 'nil',
        ['@dateofbirth'] = 'nil',
        ['@sex'] = 'nil',
        ['@height'] = 0,
        ['@clothes'] = '[]'
    }, function()
        MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE owner = @owner', {
            ['@owner'] = targetUID
        }, function(result)
            for k,v in pairs(result) do
                if v.boutique == true or v.boutique == 1 then goto continue end

                MySQL.Async.execute('DELETE FROM owned_vehicles WHERE plate = @plate', {['@plate'] = v.plate}, function()
                    
                end)

                ::continue::
            end
        end)
    end)
end)

RegisterNetEvent('zmain:admin:players:wipeUniqueID', function(targetUID)
    local source = source

    local player = ReturnPlayerId(targetUID)

    if player then
        DropPlayer(player.id, 'Vous avez été wipe ! Relancez votre client avant de vous reconnecter !')
    end

    Wait(100)

    MySQL.Async.execute('UPDATE users SET permission_group = @permission_group, position = @position, skin = @skin, accounts = @accounts, inventory = @inventory, loadout = @loadout, job = @job, job_grade = @job_grade, job2 = @job2, job2_grade = @job2_grade, firstname = @firstname, lastname = @lastname, dateofbirth = @dateofbirth, sex = @sex, height = @height, clothes = @clothes WHERE UniqueID = @UniqueID', {
        ['@UniqueID'] = targetUID,
        ['@permission_group'] = 'user',
        ['@position'] = json.encode(vector3(-1044.7137451172, -2749.8737792969, 21.363418579102)),
        ['@skin'] = nil,
        ['@accounts'] = '[]',
        ['@inventory'] = '[]',
        ['@loadout'] = '[]',
        ['@job'] = 'unemployed',
        ['@job_grade'] = 0,
        ['@job2'] = 'unemployed2',
        ['@job2_grade'] = 0,
        ['@firstname'] = 'nil',
        ['@lastname'] = 'nil',
        ['@dateofbirth'] = 'nil',
        ['@sex'] = 'nil',
        ['@height'] = 0,
        ['@clothes'] = '[]'
    }, function()
        MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE owner = @owner', {
            ['@owner'] = targetUID
        }, function(result)
            for k,v in pairs(result) do
                if v.boutique == true or v.boutique == 1 then goto continue end

                MySQL.Async.execute('DELETE FROM owned_vehicles WHERE plate = @plate', {['@plate'] = v.plate}, function()
                    
                end)

                ::continue::
            end
        end)
    end)
end)

RegisterNetEvent('zmain:admin:command:heal', function(target)
    local source = source
    local targetPlayer = ESX.GetPlayerFromId(target)

    if targetPlayer then
        TriggerClientEvent('zmain:admin:command:heal', targetPlayer.source)
    else
        TriggerClientEvent('zmain:admin:command:heal', source)
    end
end)

RegisterNetEvent('zmain:staff:players:takeMessage', function(target, message)
    local source = source

    TriggerClientEvent('txcl:showDirectMessage', target, message, GetPlayerName(source))

    -- TriggerClientEvent('esx:showNotification', target, ('💬 Message du staff (~y~%s~s~) : %s'):format(GetPlayerName(source), message))
end)

function GetService(src)
    local xPlayer = ESX.GetPlayerFromId(src)

    return adminManagement.Service[xPlayer.UniqueID] or false
end

exports('getService', function(src)
    return GetService(src)
end)

exports('getPlayerWithUniqueID', function(UniqueID)
    return ReturnPlayerId(UniqueID)
end)

ESX.RegisterServerCallback('zmain:admin:uniqueid:boutiquehistory', function(source, cb, UniqueID)
    local source = source
    adminManagement.UniqueIDSearchBoutiqueHistory[UniqueID] = {}

    MySQL.Async.fetchAll('SELECT * FROM boutique_history WHERE uniqueid = @uniqueid', {
        ['@uniqueid'] = UniqueID,
    }, function(result)
        for k,v in pairs(result) do
            table.insert(adminManagement.UniqueIDSearchBoutiqueHistory[UniqueID], v)
        end

        cb(adminManagement.UniqueIDSearchBoutiqueHistory[UniqueID])
    end)
end)

RegisterNetEvent('zmain:admin:spectatePlayer', function(target)
    local source = source
    local player = ReturnPlayerId(target)

    if player then
        TriggerClientEvent('zmain:admin:specPlayerResp', source, player.id, GetEntityCoords(GetPlayerPed(player.id)))
    end
end)

RegisterNetEvent('zmain:admin:UniqueID:giveitem', function(UniqueID, data, itemData, quantity, inventory)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    local targetPlayer = ReturnPlayerId(UniqueID)

    if targetPlayer == false then
        data.inventory = json.decode(data.inventory)
        for k,v in pairs(data.inventory) do
            if v.name == itemData.name then
                data.inventory[k].count += quantity
            else
                table.insert(data.inventory, {
                    name = itemData.name,
                    label = itemData.label,
                    count = quantity
                })
            end
        end

        MySQL.Async.execute('UPDATE users SET inventory = @inventory WHERE UniqueID = @UniqueID', {
            ['@UniqueID'] = UniqueID,
            ['@inventory'] = json.encode(data.inventory)
        })
    else
        local player = ESX.GetPlayerFromId(targetPlayer.id)

        player.addInventoryItem(itemData.name, quantity)
    end
end)

RegisterNetEvent('zmain:admin:uniqueid:giveweapon', function(weapon, UniqueID, label, loadout)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local player = ReturnPlayerId(UniqueID)
    adminManagement.UniqueIDSearch[UniqueID].loadout = loadout
    table.insert(adminManagement.UniqueIDSearch[UniqueID].loadout, {
        components = {},
        name = weapon,
        label = label,
        ammo = 255
    })
    if not player then
        MySQL.Async.execute('UPDATE users SET loadout = @loadout WHERE UniqueID = @UniqueID', {
            ['@UniqueID'] = UniqueID,
            ['@loadout'] = json.encode(adminManagement.UniqueIDSearch[UniqueID].loadout)
        }, function()

        end)
    else
        local targetPlayer = ESX.GetPlayerFromId(player.id)
        targetPlayer.addWeapon(weapon, 255)
    end

    for k,v in pairs(adminManagement.Players) do
        if v.group == 'user' then goto continue end 

        TriggerClientEvent('zmain:admin:uniqueid:updateLoadout', k,  json.encode(adminManagement.UniqueIDSearch[UniqueID].loadout))

        ::continue::
    end

    adminManagement:setLogsType('logs', ('Give d\'arme (%s) (%s)'):format(GetPlayerName(source), label), ('__Give d\'arme du staff__\n**%s**\nID: **%s**\nUniqueID: **%s**\nLicence: **%s**\nGroup: **%s**\n\n__Joueur__\n**%s\n**ID: **%s**\nUniqueID: **%s**\nLicence: **%s**\nGroup: **%s**'):format(GetPlayerName(source), source, xPlayer.UniqueID, xPlayer.identifier, xPlayer.group, adminManagement.UniqueIDSearch[UniqueID][1].playerName, player and player.id or 'none', UniqueID, adminManagement.UniqueIDSearch[UniqueID][1].identifier, player and player.group or adminManagement.UniqueIDSearch[UniqueID][1].permission_group), 'adminMenu', 'https://discord.com/api/webhooks/1100163349301', false)
end)

RegisterNetEvent('zmain:admin:uniqueid:addmoney', function(UniqueID, type, amount)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local player = ReturnPlayerId(UniqueID)

    for k,v in pairs(adminManagement.UniqueIDSearch[UniqueID][1].accounts) do
        if adminManagement.UniqueIDSearch[UniqueID][1].accounts[k].name == type then
            adminManagement.UniqueIDSearch[UniqueID][1].accounts[k].money += amount
        end
    end

    if not player then
        MySQL.Async.execute('UPDATE users SET accounts = @accounts WHERE UniqueID = @UniqueID', {
            ['@UniqueID'] = UniqueID,
            ['@accounts'] = json.encode(adminManagement.UniqueIDSearch[UniqueID][1].accounts)
        }, function()

        end)
    else
        local targetPlayer = ESX.GetPlayerFromId(player.id)
        targetPlayer.addAccountMoney(type, amount)
    end

    for k,v in pairs(adminManagement.Players) do
        if v.group == 'user' then goto continue end 

        TriggerClientEvent('zmain:admin:uniqueid:updateAccounts', k,  json.encode(adminManagement.UniqueIDSearch[UniqueID][1].accounts))

        ::continue::
    end

    adminManagement:setLogsType('logs', ('Give d\'argent (%s) (%s) %s$'):format(GetPlayerName(source), type, amount), ('__Give d\'argent du staff__\n**%s**\nID: **%s**\nUniqueID: **%s**\nLicence: **%s**\nGroup: **%s**\n\n__Joueur__\n**%s\n**ID: **%s**\nUniqueID: **%s**\nLicence: **%s**\nGroup: **%s**'):format(GetPlayerName(source), source, xPlayer.UniqueID, xPlayer.identifier, xPlayer.group, adminManagement.UniqueIDSearch[UniqueID][1].playerName, player and player.id or 'none', UniqueID, adminManagement.UniqueIDSearch[UniqueID][1].identifier, player and player.group or adminManagement.UniqueIDSearch[UniqueID][1].permission_group), 'adminMenu', 'https://discord.com/api/webhooks/110', false)

end)

RegisterNetEvent('zmain:admin:warn', function(UniqueID, reason)
    local source = source
    local player = ReturnPlayerId(UniqueID)
    adminManagement.WarnList[UniqueID] = {}

    if player then
        TriggerClientEvent('zmain:admin:drawwarn', player.id, reason)
    end

    MySQL.Async.fetchAll('SELECT warns FROM users WHERE UniqueID = @UniqueID', {
        ['@UniqueID'] = UniqueID
    }, function(result)
        for k,v in pairs(json.decode(result[1].warns)) do
            table.insert(adminManagement.WarnList[UniqueID], v)
        end
        table.insert(adminManagement.WarnList[UniqueID], {
            reason = reason,
            author = GetPlayerName(source)
        })

        MySQL.Async.execute('UPDATE users SET warns = @warns WHERE UniqueID = @UniqueID', {
            ['@UniqueID'] = UniqueID,
            ['@warns'] = json.encode(adminManagement.WarnList[UniqueID])
        }, function()

        end)
    end)
end)

ESX.RegisterServerCallback('zmain:admin:getWarnList', function(source, cb, UniqueID)
    local source = source
    adminManagement.WarnList[UniqueID] = {}

    MySQL.Async.fetchAll('SELECT warns FROM users WHERE UniqueID = @UniqueID', {
        ['@UniqueID'] = UniqueID
    }, function(result)
        for k,v in pairs(json.decode(result[1].warns)) do
            table.insert(adminManagement.WarnList[UniqueID], v)
        end

        cb(adminManagement.WarnList[UniqueID])
    end)
end)

RegisterNetEvent('zmain:admin:removeWarn', function(UniqueID, k)
    local source = source
    local player = ReturnPlayerId(UniqueID)
    adminManagement.WarnList[UniqueID] = {}
end)

RegisterNetEvent('zmain:admin:revive', function(UniqueID)
    local player = ReturnPlayerId(UniqueID)

    if (player) then
        TriggerClientEvent('zmain:ambulance:revive', player.id)
    end
end)

RegisterNetEvent('zmain:admin:give_vehicle', function(UniqueID, data)
    local source = source

    print(data.label, data.vehicle, data.plate, data.type, data.boutique, data.garageid)

    MySQL.Async.execute('INSERT INTO owned_vehicles (owner, label, vehicle, plate, type, boutique, garageid) VALUE (@owner, @label, @vehicle, @plate, @type, @boutique, @garageid)', {
        ['@owner'] = UniqueID,
        ['@label'] = data.label,
        ['@vehicle'] = data.vehicle,
        ['@plate'] = data.plate,
        ['@type'] = data.type,
        ['@boutique'] = data.boutique,
        ['@garageid'] = data.garageid
    })
end)

RegisterNetEvent('zmain:admin:editSociety', function(societyName, newSocietyData)
    local society = Society:getSociety(societyName)

    if not society then return end

    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer then return end

    society.name = newSocietyData.name
    society.label = newSocietyData.label
    society.permissions = newSocietyData.permissions
    society.coffre = newSocietyData.coffre
    society.posCoffre = newSocietyData.posCoffre
    society.posBoss = newSocietyData.posBoss
    society.grades = newSocietyData.grades
    society.employeds = newSocietyData.employeds
    society.state = newSocietyData.state
    society.blips = newSocietyData.blips
    society.cloakroom = newSocietyData.cloakroom
    society.cloakpos = newSocietyData.cloakpos

    society:save(society.name)

    TriggerClientEvent('zmain:society:updateWithSocietyName', societyName, newSocietyData)

    TriggerClientEvent('esx:showNotification', source, 'Société modifié ave succès')
end)

ESX.RegisterServerCallback('zmain:admin:itemsList', function(source, cb)
    local itemsList = {}

    MySQL.Async.fetchAll('SELECT * FROM items', {}, function(result)
        for k,v in pairs(result) do
            table.insert(itemsList, v)
        end

        cb(itemsList)
    end)
end)

ESX.RegisterServerCallback('zmain:admin:getSanctions', function(source, cb)
    local source = source 
    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer then return end

    adminManagement.sanctionsList[xPlayer.UniqueID] = {}

    --@todo GET SANCTIONS LIST
end)