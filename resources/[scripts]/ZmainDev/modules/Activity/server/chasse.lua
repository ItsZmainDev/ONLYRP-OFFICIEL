_CHASSE = {
    inChasse = false,

    levels = {},

    myAnimals = {},
    myAnimalsSpawn = {},
    animals = {},

    value = 'noanimal',
}

function _CHASSE.SaveLevel(UniqueID)
    MySQL.Async.execute('UPDATE chasse SET levels = @levels, animals = @animals WHERE uniqueid = @uniqueid', {
        ['@uniqueid'] = UniqueID,
        ['@levels'] = _CHASSE.levels[UniqueID],
        ['@animals'] = json.encode(_CHASSE.myAnimals[UniqueID])
    }, function()
        print('LEVEL UPDATE')
    end)
end

function _CHASSE.GetNewLevel(level, UniqueID)
    if level < 100 then _CHASSE.myAnimals[UniqueID] = {'Lapin'} elseif level < 200 then _CHASSE.myAnimals[UniqueID] = Activity.Chasse.Levels[100] elseif level < 300 then _CHASSE.myAnimals[UniqueID] = Activity.Chasse.Levels[200] elseif level < 400 then _CHASSE.myAnimals[UniqueID] = Activity.Chasse.Levels[300] elseif level < 700 then _CHASSE.myAnimals[UniqueID] = Activity.Chasse.Levels[400] end

    if Activity.Chasse.Levels[_CHASSE.levels[UniqueID]] ~= nil then
        _CHASSE.value = 'newAnimal'
    end

    return _CHASSE
end

RegisterNetEvent('zmain:chasse:start', function()
   local source = source
   local xPlayer = ESX.GetPlayerFromId(source)

   _CHASSE.inChasse = true

   
   MySQL.Async.fetchAll('SELECT * FROM chasse WHERE uniqueid = @uniqueid', {
    ['@uniqueid'] = xPlayer.UniqueID
   }, function(result)
        if result[1] == nil then 
            _CHASSE.levels[xPlayer.UniqueID] = 0
            _CHASSE.myAnimals[xPlayer.UniqueID] = {'Lapin'}
            MySQL.Async.execute('INSERT INTO chasse (uniqueid, levels, animals) VALUE (@uniqueid, @levels, @animals)', {
                ['@uniqueid'] = xPlayer.UniqueID,
                ['@levels'] = _CHASSE.levels[xPlayer.UniqueID],
                ['@animals'] = json.encode({'Lapin'})
            })
        else
            _CHASSE.levels[xPlayer.UniqueID] = tonumber(result[1].levels)
            _CHASSE.myAnimals[xPlayer.UniqueID] = json.decode(result[1].animals)
        end

        TriggerClientEvent('zmain:chasse:startChasse', source, _CHASSE.inChasse, _CHASSE.levels[xPlayer.UniqueID], _CHASSE.myAnimals[xPlayer.UniqueID])
    end)
   
    xPlayer.addWeapon('weapon_musket', 255)
end)

RegisterNetEvent('zmain:chasse:stop', function()
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeWeapon('weapon_musket')

    _CHASSE.SaveLevel(xPlayer.UniqueID, _CHASSE.myAnimals[xPlayer.UniqueID])
end)

RegisterNetEvent('zmain:chasse:forceStopChasse', function()
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    _CHASSE.levels[xPlayer.UniqueID] -= 50

    _CHASSE.SaveLevel(xPlayer.UniqueID, _CHASSE.myAnimals[xPlayer.UniqueID])
end)

RegisterNetEvent('zmain:chasse:take', function(model)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    for k,v in pairs(Activity.Chasse.AuthorizedAnimals) do
        if _CHASSE.levels[xPlayer.UniqueID] < 0 then
            if v.hash == model and v.requirededlevel < tonumber(_CHASSE.levels[xPlayer.UniqueID]) then
                _CHASSE.levels[xPlayer.UniqueID] -= 10
    
                _CHASSE.myAnimals[xPlayer.UniqueID] = _CHASSE.GetNewLevel(_CHASSE.levels[xPlayer.UniqueID], tonumber((xPlayer.UniqueID))).myAnimals[xPlayer.UniqueID]
    
                _CHASSE.myAnimals[xPlayer.UniqueID] = Activity.Chasse.Levels[_CHASSE.levels[xPlayer.UniqueID]] or _CHASSE.myAnimals[xPlayer.UniqueID]
                _CHASSE.SaveLevel(xPlayer.UniqueID, _CHASSE.myAnimals[xPlayer.UniqueID])
                TriggerClientEvent('zmain:chasse:updateLevel', source, _CHASSE.levels[xPlayer.UniqueID], _CHASSE.myAnimals[xPlayer.UniqueID], _CHASSE.GetNewLevel(_CHASSE.levels[xPlayer.UniqueID], tonumber((xPlayer.UniqueID))).value)
                _CHASSE.value = 'noanimal'
                TriggerClientEvent('esx:showNotification', source, 'Tu ne peux pas chasser de type d\'animal pour le moment, 10 point on été retirer de ton expérience')
                return
            end
        else
            if v.hash == model and v.requirededlevel > tonumber(_CHASSE.levels[xPlayer.UniqueID]) then
                _CHASSE.levels[xPlayer.UniqueID] -= 10
    
                _CHASSE.myAnimals[xPlayer.UniqueID] = _CHASSE.GetNewLevel(_CHASSE.levels[xPlayer.UniqueID], tonumber((xPlayer.UniqueID))).myAnimals[xPlayer.UniqueID]
    
                _CHASSE.myAnimals[xPlayer.UniqueID] = Activity.Chasse.Levels[_CHASSE.levels[xPlayer.UniqueID]] or _CHASSE.myAnimals[xPlayer.UniqueID]
                _CHASSE.SaveLevel(xPlayer.UniqueID, _CHASSE.myAnimals[xPlayer.UniqueID])
                TriggerClientEvent('zmain:chasse:updateLevel', source, _CHASSE.levels[xPlayer.UniqueID], _CHASSE.myAnimals[xPlayer.UniqueID], _CHASSE.GetNewLevel(_CHASSE.levels[xPlayer.UniqueID], tonumber((xPlayer.UniqueID))).value)
                _CHASSE.value = 'noanimal'
                TriggerClientEvent('esx:showNotification', source, 'Tu ne peux pas chasser de type d\'animal pour le moment, 10 point on été retirer de ton expérience')
                return
            end
        end
    end

    xPlayer.addInventoryItem(Activity.Chasse.Levels2[model], 1)
    _CHASSE.levels[xPlayer.UniqueID] += 10
    _CHASSE.myAnimals[xPlayer.UniqueID] = Activity.Chasse.Levels[_CHASSE.levels[xPlayer.UniqueID]] or _CHASSE.myAnimals[xPlayer.UniqueID]
    _CHASSE.SaveLevel(xPlayer.UniqueID, _CHASSE.myAnimals[xPlayer.UniqueID])
    TriggerClientEvent('zmain:chasse:updateLevel', source, _CHASSE.levels[xPlayer.UniqueID], _CHASSE.myAnimals[xPlayer.UniqueID], _CHASSE.GetNewLevel(_CHASSE.levels[xPlayer.UniqueID], tonumber((xPlayer.UniqueID))).value)
    _CHASSE.value = 'noanimal'
    TriggerClientEvent('esx:showNotification', source, '🥩 Vous avez dépecer ~y~x1~s~ gibier')

    SetTimeout(2000, function()
        if _CHASSE.levels[xPlayer.UniqueID] >= 1000 then
            _CHASSE.myAnimals[xPlayer.UniqueID] = {'Lapin'}
            xPlayer.addAccountMoney('cash', 10000)
            TriggerClientEvent('esx:showNotification', source, '🥇 Félicitations, vous avez atteint le level 1000/1000 une prime de ~y~10 000$~s~ vous a été déversé et votre level a été réinitialisé !')
            _CHASSE.levels[xPlayer.UniqueID] = 0
            TriggerClientEvent('zmain:chasse:updateLevel', source, _CHASSE.levels[xPlayer.UniqueID], _CHASSE.myAnimals[xPlayer.UniqueID], 'newAnimal')

            _CHASSE.SaveLevel(xPlayer.UniqueID, _CHASSE.myAnimals[xPlayer.UniqueID])
        end
    end)
end)

RegisterNetEvent('zmain:chasse:sell', function(item, label, price, quantity)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if (xPlayer) then
        if xPlayer.getInventoryItem(item).count < quantity then return TriggerClientEvent('esx:showNotification', source, 'Vous ne disposez assez de viande pour faire cela !') end

        xPlayer.removeInventoryItem(item, quantity)

        local total = 0
        
        for i=1, quantity do 
            if not VIP.haveVip(xPlayer.UniqueID) then
                xPlayer.addAccountMoney('cash', price)
            else
                xPlayer.addAccountMoney('cash', price/100*133)
            end

            total += price/100*133
        end

        TriggerClientEvent('esx:showNotification', source, ('Vous avez vendue ~y~x%s~s~ %s pour ~y~%s$~s~'):format(quantity, label, total))
    end
end)