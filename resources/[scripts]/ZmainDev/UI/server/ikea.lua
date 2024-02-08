WorldProps.data = {
    propsSpawned = {

    }
}

RegisterNetEvent('zmain:props:place', function(name, label, id, coords, heading)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer then return end

    MySQL.Async.execute('DELETE FROM players_props WHERE id = @id AND UniqueID = @UniqueID', {
        ['@id'] = id,
        ['@UniqueID'] = xPlayer.UniqueID,
    }, function()
        MySQL.Async.execute('INSERT INTO world_props (name, label, owner, position, heading, iid) VALUES (@name, @label, @owner, @position, @heading, @iid)', {
            ['@name'] = name,
            ['@label'] = label,
            ['@owner'] = json.encode({UniqueID = xPlayer.UniqueID, Name = xPlayer.name, day = os.date("*t").day, hours = os.date("*t").hour, min = os.date("*t").min, month = os.date("*t").month, years = os.date("*t").year, firstName = xPlayer.firstname, lastName = xPlayer.lastname}),
            ['@position'] = json.encode(coords),
            ['@heading'] = json.encode(heading),
            ['@iid'] = id
        }, function()
            MySQL.Async.fetchAll('SELECT * FROM world_props WHERE iid = @iid', {
                ['@iid'] = id
            }, function(result)
                for k,v in pairs(result) do
                    WorldProps.data.propsSpawned[v.id] ={
                        propsName = v.name,
                        propsId = v.id,
                        position = json.decode(v.position),
                        heading = json.decode(v.heading),
                        owner = json.decode(v.owner),
                        label = v.label
                    }
                    TriggerClientEvent('zmain:props:addTable', -1, v.id,  WorldProps.data.propsSpawned[v.id])
                end
            end)
        end)
    end)
end)

RegisterNetEvent('zmain:props:server:loadProps', function()
    local source = source

    MySQL.Async.fetchAll('SELECT * FROM world_props', {}, function(result)
        for k,v in pairs(result) do
            WorldProps.data.propsSpawned[v.id] ={
                propsName = v.name,
                propsId = v.id,
                position = json.decode(v.position),
                heading = json.decode(v.heading),
                owner = json.decode(v.owner),
                label = v.label
            }
            TriggerClientEvent('zmain:props:addTable', source, v.id,  WorldProps.data.propsSpawned[v.id])
        end
    end)
end)

RegisterNetEvent('zmain:props:server:delete', function(data)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    MySQL.Async.execute('DELETE FROM world_props WHERE id = @id', {
        ['@id'] = data.propsId
    }, function()
        MySQL.Async.execute('INSERT INTO players_props (UniqueID, data, name) VALUES (@UniqueID, @data, @name)', {
            ['@UniqueID'] = xPlayer.UniqueID,
            ['@data'] = json.encode({label = data.label, name = data.propsName, owner = xPlayer.UniqueID, count = 1}),
            ['@name'] = data.propsName
        }, function()
            TriggerClientEvent('zmain:props:removeTable', -1, data.propsId)
            WorldProps.data.propsSpawned[data.propsId] = nil
        end)
    end)
end)