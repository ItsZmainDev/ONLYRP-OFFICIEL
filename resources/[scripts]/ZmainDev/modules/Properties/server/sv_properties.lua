function Properties:Load()
    MySQL.Async.fetchAll('SELECT * FROM properties', {}, function(p)
        for k,v in pairs(p) do
            Properties.PropertiesList[v.propertiesID] = {
                id = v.propertiesID,
                owner = v.propertiesOWNER,
                ownerName = v.ownerName,
                name = v.name,
                label = v.label,
                price = v.price,
                enter = json.decode(v.enter),
                exit = json.decode(v.exit),
                street_name = v.street,
                trunkPos = json.decode(v.trunkPos),
                garage = v.garage,
                garagePos = json.decode(v.garagePos),
                garageSpawn = json.decode(v.garageSpawn),
                garageRotation = v.garageRotation,
                garageType = v.garageType,
                players = json.decode(v.players),
                type = v.type,
                logementType = v.logementType,
                open = false,
                playersIG = {},
                coffreOpen = false,
                interphone = {},
                entrepot = v.entrepot,
                pound = v.pound
            }

            if json.encode(v.trunk) == '[]' or json.encode(v.trunk) == 'null' then
                Properties.PropertiesList[v.propertiesID].trunk = {
                    ['items'] = {},
                    ['weapons'] = {},
                    ['accounts'] = {
                        cash = 0,
                        black_money = 0
                    },
                    ['code'] = {
                        active = false,
                        blocked = false,
                        code = nil
                    }
                }
            else
                Properties.PropertiesList[v.propertiesID].trunk = json.decode(v.trunk)
            end

            ESX.toConsole(('PropertiesID %s loaded'):format(v.propertiesID))
        end
    end)
end

function Properties:addPlayer(i,p)
    SetPlayerRoutingBucket(i,p)
end

function Properties:updatePlayers(u,p,v)
    Properties.PropertiesList[p].players[tostring(u)] = v

    local player = ReturnPlayerId(p)

    if player then
        TriggerClientEvent('zmain:properties:updatePlayers', -1, p, Properties.PropertiesList[p].players)
    end
end

function Properties:DbPlayerSync(p)
    MySQL.Async.execute('UPDATE properties SET players = @players WHERE propertiesID = @propertiesID', {
        ['@propertiesID'] = p,
        ['@players'] = json.encode(Properties.PropertiesList[p].players)
    })
end

CreateThread(function()
    Wait(1000)
    Properties:Load()

    Properties.Loaded = true
end)

RegisterNetEvent('zmain:properties:load', function()
    local source = source
    TriggerClientEvent('zmain:properties:load', source, Properties.PropertiesList)
end)

RegisterNetEvent('zmain:properties:createProperties', function(name, label, price, enter, exit, garage, posGarage, posGarageSpawn, rotGarageSpawn, garageType, type, trunkPos, logementType, current_zone, entrepot, pound)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    local society = Society:getSociety(xPlayer.job.name)

    if not society then return end

    if garage == false or garage == nil then
        garage = 0 posGarage = 'none' posGarageSpawn = 'none' rotGarageSpawn = 'none' garageType = 'none'
    else
        garage = 1
    end

    if entrepot == false or entrepot == nil then
        entrepot = 0 pound = 0
    else
        entrepot = 1 pound = pound
    end

    MySQL.Async.execute('INSERT INTO properties (propertiesOWNER, name, label, price, enter, `exit`, garage, garagePos, garageSpawn, garageRotation, garageType, players, type, `trunkPos`, logementType, street, entrepot, pound) VALUES (@propertiesOWNER, @name, @label, @price, @enter, @exit, @garage, @garagePos, @garageSpawn, @garageRotation, @garageType, @players, @type, @trunkPos, @logementType, @street, @entrepot, @pound)', {
        ['@propertiesOWNER'] = 'none', 
        ['@name'] = name, 
        ['@label'] = label, 
        ['@price'] = price, 
        ['@enter'] = json.encode(enter), 
        ['@exit'] = json.encode(exit), 
        ['@garage'] = garage, 
        ['@garagePos'] = json.encode(posGarage), 
        ['@garageSpawn'] = json.encode(posGarageSpawn), 
        ['@garageRotation'] = rotGarageSpawn, 
        ['@garageType'] = garageType,
        ['@players'] = json.encode({}),
        ['@type'] = type,
        ['@trunkPos'] = json.encode(trunkPos),
        ['@logementType'] = logementType,
        ['@street'] = current_zone,
        ['@entrepot'] = entrepot,
        ['@pound'] = pound
    }, function()

        society.removeSocietyMoney(price/100*75)

        ESX.toConsole('New propertie loaded')

        MySQL.Async.fetchAll('SELECT * FROM properties WHERE name = @name', {
            ['@name'] = name
        }, function(result)
            for k,v in pairs(result) do
                Properties.PropertiesList[v.propertiesID] = {
                    id = v.propertiesID,
                    owner = 'none',
                    ownerName = 'none',
                    name = v.name,
                    label = v.label,
                    price = v.price,
                    enter = json.decode(v.enter),
                    exit = json.decode(v.exit),
                    street_name = current_zone,
                    trunkPos = json.decode(v.trunkPos),
                    garage = v.garage,
                    garagePos = json.decode(v.garagePos),
                    garageSpawn = json.decode(v.garageSpawn),
                    garageRotation = v.garageRotation,
                    garageType = v.garageType,
                    players = json.decode(v.players),
                    type = v.type,
                    logementType = v.logementType,
                    trunk = {
                        ['items'] = {},
                        ['weapons'] = {},
                        ['accounts'] = {
                            cash = 0,
                            black_money = 0
                        },
                        ['code'] = {
                            active = false,
                            blocked = false,
                            code = nil
                        }
                    },
                    entrepot = v.entrepot,
                    pound = v.pound,
                    open = false,
                }
            end

            TriggerClientEvent('esx:showNotification', source, ('La propriétée %s a été cree avec succès'):format(name))
            Wait(1000)

            TriggerClientEvent('zmain:properties:add', -1, result[1].propertiesID, Properties.PropertiesList[result[1].propertiesID])
        end)
    end)
end)

RegisterNetEvent('zmain:properties:addPlayer', function(target, value, pId, players)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if value == 'me' then
        Properties:addPlayer(source, pId)
        TriggerClientEvent('zmain:properties:teleport', source, vector3(Properties.PropertiesList[pId].exit.x, Properties.PropertiesList[pId].exit.y, Properties.PropertiesList[pId].exit.z))

        TriggerClientEvent('zmain:properties:changePlayerSate', source, pId, true)
    end

    Properties.PropertiesList[pId].playersIG[source] = {
        source = source,
        UniqueID = xPlayer.UniqueID
    }

    Properties.PropertiesList[pId].players = players

    Properties:DbPlayerSync(pId)
end)

RegisterNetEvent('zmain:properties:removePlayer', function(target, value, pId, players)
    local source = source

    if value == 'me' then
        Properties:addPlayer(source, 0)
        TriggerClientEvent('zmain:properties:teleport', source, vector3(Properties.PropertiesList[pId].enter.x, Properties.PropertiesList[pId].enter.y, Properties.PropertiesList[pId].enter.z))

        TriggerClientEvent('zmain:properties:changePlayerSate', source, pId, false)
    elseif value == 'all' then
        for k,v in pairs(Properties.PropertiesList[pId].playersIG) do
            print(v.UniqueID)
            Properties:addPlayer(v.source, 0)
            TriggerClientEvent('zmain:properties:teleport', v.source, vector3(Properties.PropertiesList[pId].enter.x, Properties.PropertiesList[pId].enter.y, Properties.PropertiesList[pId].enter.z))

            Properties:updatePlayers(v.UniqueID,pId,false)
        end
    end

    Properties.PropertiesList[pId].players = players

    Properties:DbPlayerSync(pId)
end)

AddEventHandler('esx:playerLoaded', function(source)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    -- Properties.garage.count2[xPlayer.UniqueID] = 0

    Wait(5000)

    for k,v in pairs(Properties.PropertiesList) do
        if v.owner ~= 'none' then
            if v.players[tostring(xPlayer.UniqueID)] ~= nil then
                if v.players[tostring(xPlayer.UniqueID)] == true then
                    Properties:addPlayer(source, k)
                    TriggerClientEvent('zmain:properties:teleport', source, vector3(Properties.PropertiesList[k].exit.x, Properties.PropertiesList[k].exit.y, Properties.PropertiesList[k].exit.z))
                    TriggerClientEvent('esx:showNotification', source, '🏠 Vous avez été déconnecté en étant dans une propriété')
                    TriggerClientEvent('zmain:properties:changePlayerSate', source, k, true)
                end
            end
        else
            if v.players[tostring(xPlayer.UniqueID)] ~= nil then
                if v.players[tostring(xPlayer.UniqueID)] == true then
                    Properties:addPlayer(source, k)
                    TriggerClientEvent('zmain:properties:teleport', source, vector3(Properties.PropertiesList[k].exit.x, Properties.PropertiesList[k].exit.y, Properties.PropertiesList[k].exit.z))
                    TriggerClientEvent('esx:showNotification', source, '🏠 Vous avez été déconnecté en étant dans une propriété')
                    TriggerClientEvent('zmain:properties:changePlayerSate', source, k, true)
                end
            end
        end
    end
end)

AddEventHandler('zmain:admin:restart', function()
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    -- Properties.garage.count2[xPlayer.UniqueID] = 0

    Wait(5000)

    for k,v in pairs(Properties.PropertiesList) do
        if v.owner ~= 'none' then
            if v.players[tostring(xPlayer.UniqueID)] ~= nil then
                if v.players[tostring(xPlayer.UniqueID)] == true then
                    Properties:addPlayer(source, k)
                    TriggerClientEvent('zmain:properties:teleport', source, vector3(Properties.PropertiesList[k].exit.x, Properties.PropertiesList[k].exit.y, Properties.PropertiesList[k].exit.z))
                    TriggerClientEvent('esx:showNotification', source, '🏠 Vous avez été déconnecté en étant dans une propriété')
                end
            end
        else
            if v.players[tostring(xPlayer.UniqueID)] ~= nil then
                if v.players[tostring(xPlayer.UniqueID)] == true then
                    Properties:addPlayer(source, k)
                    TriggerClientEvent('zmain:properties:teleport', source, vector3(Properties.PropertiesList[k].exit.x, Properties.PropertiesList[k].exit.y, Properties.PropertiesList[k].exit.z))
                    TriggerClientEvent('esx:showNotification', source, '🏠 Vous avez été déconnecté en étant dans une propriété')
                end
            end
        end
    end
end)

RegisterNetEvent('zmain:properties:locked', function(k, statut)
    Properties.PropertiesList[k].open = statut

    TriggerClientEvent('zmain:properties:locked', -1, k, statut)
end)

RegisterNetEvent('zmain:properties:lockedCoffre', function(k, statut)
    Properties.PropertiesList[k].coffreOpen = statut

    TriggerClientEvent('zmain:properties:lockedCoffre', -1, k, statut)
end)

RegisterNetEvent('zmain:properties:sell', function(propertiesID)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer then return end

    MySQL.Async.execute('UPDATE properties SET propertiesOWNER = @owner, players = @players WHERE propertiesID = @propertiesID', {
        ['@propertiesID'] = propertiesID,
        ['@owner'] = 'none',
        ['@players'] = {}
    }, function()
        for k,v in pairs(Properties.PropertiesList[propertiesID].playersIG) do
            Properties:addPlayer(v.source, 0)
            TriggerClientEvent('zmain:properties:teleport', v.source, vector3(Properties.PropertiesList[pId].enter.x, Properties.PropertiesList[pId].enter.y, Properties.PropertiesList[pId].enter.z))
        end

        TriggerClientEvent('esx:showNotification', source, '🏠 Propriété vendue avec succès')

        xPlayer.addAccountMoney('bank', Properties.PropertiesList[propertiesID].price/100*50)
    end)
end)

RegisterNetEvent('zmain:properties:interphone:call', function(propertiesData, time)
    if not propertiesData then return end
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer then return end

    if not Properties.PropertiesList[propertiesData.id] then return end

    propertiesData = Properties.PropertiesList[propertiesData.id]

    if not propertiesData then return end

    propertiesData.interphone[xPlayer.UniqueID] = {
        UniqueID = xPlayer.UniqueID,
        name = xPlayer.name,
        firstname = xPlayer.firstname,
        lastname = xPlayer.lastname,
        playerCoords = GetEntityCoords(GetPlayerPed(source)),
        at =os.date(('%sh%s'):format('%H', '%M')),
    }

    for k,v in pairs(propertiesData.players) do
        local player = ReturnPlayerId(k)

        if player then
            TriggerClientEvent('zmain:properties:interphone:call:requestCall', player.id, propertiesData)
        end
    end
end)

RegisterNetEvent('zmain:properties:interphone:call:validateEnter', function(propertiesData, playerData)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer then return end
    
    local player = ReturnPlayerId(playerData.UniqueID)

    if not player then return end

    for k,v in pairs(propertiesData.interphone) do
        if v.UniqueID == playerData.UniqueID then
            Properties.PropertiesList[propertiesData.id].interphone[k] = nil
            TriggerClientEvent('zmain:properties:updateCallWithPlayerCall', player.id, propertiesData)
        end
    end

    TriggerClientEvent('zmain:properties:interphone:update', -1, Properties.PropertiesList[propertiesData.id])

    if #(GetEntityCoords(GetPlayerPed(player.id))-vector3(propertiesData.enter.x, propertiesData.enter.y, propertiesData.enter.z)) > 5 then return TriggerClientEvent('esx:showNotification', source, 'La personne est trop éloignée de la portre d\'entrée') end

    Properties:addPlayer(player.UniqueID, propertiesData.id)
    TriggerClientEvent('zmain:properties:teleport', player.id, vector3(Properties.PropertiesList[propertiesData.id].exit.x, Properties.PropertiesList[propertiesData.id].exit.y, Properties.PropertiesList[propertiesData.id].exit.z))

    Properties.PropertiesList[propertiesData.id].playersIG[player.id] = {
        source = player.id
    }

    Properties.PropertiesList[propertiesData.id].playersIG[player.id] = {
        source = player.id,
        UniqueID = player.UniqueID
    }

    Properties.PropertiesList[propertiesData.id].players = Properties.PropertiesList[propertiesData.id].players

    Properties:DbPlayerSync(propertiesData.id)

    TriggerClientEvent('zmain:properties:interphone:update', -1, Properties.PropertiesList[propertiesData.id])
    Properties:updatePlayers(player.UniqueID,propertiesData.id,true)
end)

RegisterNetEvent('zmain:properties:interphone:call:refuseEnter', function(propertiesData, playerData)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer then return end

    local player = ReturnPlayerId(playerData.UniqueID)

    if not player then return end

    for k,v in pairs(propertiesData.interphone) do
        if v.UniqueID == playerData.UniqueID then
            Properties.PropertiesList[propertiesData.id].interphone[k] = nil
            TriggerClientEvent('zmain:properties:updateCallWithPlayerCall', player.id, propertiesData)
        end
    end

    Properties.PropertiesList[propertiesData.id].players = Properties.PropertiesList[propertiesData.id].players

    TriggerClientEvent('zmain:properties:interphone:update', -1, Properties.PropertiesList[propertiesData.id])
    TriggerClientEvent('zmain:propeties:updatePlayers', -1, Properties.PropertiesList[propertiesData.id])
end)

CreateThread(function()
    while true do 
        Wait(3600000)
        MySQL.Async.fetchAll('SELECT * FROM properties', {}, function(result)
            for k,v in pairs(result) do 
                if v.type == 'location' then
                    if v.propertiesOWNER == 'none' then goto continue end
                    if tonumber(v.time) <= 0 then goto continue end

                    Properties.PropertiesList[v.propertiesID].time -= 1

                    if tonumber(Properties.Properties[v.propertiesID].time) > 0 then
                        MySQL.Async.execute('UPDATE properties SET time = @time WHRE propertiesID = @p', {
                            ['@p'] = v.propertiesID,
                            ['@time'] = Properties.PropertiesList[v.propertiesID].time
                        }, function()
                            TriggerClientEvent('zmain:properties:updateProperties', -1, v.propertiesID, Properties.PropertiesList[v.propertiesID])
                        end)
                    else
                        MySQL.Async.execute('UPDATE properties SET time = @time, @propertiesOWNER = @o, @ownerName = @on WHRE propertiesID = @p', {
                            ['@p'] = v.propertiesID,
                            ['@time'] = Properties.PropertiesList[v.propertiesID].time,
                            ['@o'] = 'none',
                            ['@on'] = 'none'
                        }, function()
                            TriggerClientEvent('zmain:properties:updateProperties', -1, v.propertiesID, Properties.PropertiesList[v.propertiesID])
                        end)
                    end

                    -- if v.propertiesOWNER ~= 'none' then
                    --     local player = ReturnPlayerId(v.propertiesOWNER)

                    --     if player then
                    --         local xPlayer = ESX.GetPlayerFromId(player.id)
                    --         xPlayer.removeAccountMoney('bank', v.price)
                    --         TriggerClientEvent('esx:showNotification', player.id, ('Vous avez payé votre loyer pour un montant de ~y~%s$~s~'):format(v.price))   
                    --     else
                    --         MySQL.Async.fetchAll('SELECT * FROM users WHERE UniqueID = @UniqueID', {
                    --             ['@UniqueID'] = Properties.PropertiesList[v.propertiesID].owner
                    --         }, function(result)
                    --             local accounts;
                    --             for k,v in pairs(result) do
                    --                 accounts = json.decode(v.accounts)
    
                    --                 for i,p in pairs(accounts) do
                    --                     if p.name == 'bank' then
                    --                         accounts[i].money -= tonumber(v.price)
                    --                     end
                    --                 end
                    --             end
    
                    --             MySQL.Async.execute('UPDATE users SET accounts = @accounts WHERE UniqueID = @UniqueID', {
                    --                 ['@UniqueID'] = v.propertiesOWNER,
                    --                 ['@accounts'] = json.encode(accounts)
                    --             }, function()
                                    
                    --             end)
                    --         end)      
                    --     end
                    -- end

                    if Properties.Properties[v.propertiesID].time <= 0 then
                        Properties.Properties[v.propertiesID].owner = 'none'
                        Properties.Properties[v.propertiesID].ownerName = 'none'

                        MySQL.Async.execute('UPDATE properties SET propertiesOWNER = @propertiesOWNER, ownerName = @ownerName WHERE propertiesID = @propertiesID', {
                            ['@propertiesID'] = v.propertiesID,
                            ['@propertiesOWNER'] = Properties.Properties[v.propertiesID].owner,
                            ['@ownerName'] = Properties.Properties[v.propertiesID].ownerName
                        }, function()
                            
                        end)
                    end
                end
            end

            ::continue::
        end)
    end
end)