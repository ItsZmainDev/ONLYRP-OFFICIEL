Citizen.CreateThread(function()
    MySQL.Async.execute([[
        CREATE TABLE IF NOT EXISTS `selling_weapons` (
            name LONGTEXT DEFAULT NULL,
            label LONGTEXT DEFAULT NULL
        );
    ]])

    RegisterNetEvent('zmain:weapons:load', function()
        local source = source
        
        MySQL.Async.fetchAll('SELECT * FROM selling_weapons', {}, function(result)
            local table = {}
            for k,v in pairs(result) do
                table[v.name] = true
            end

            TriggerClientEvent('zmain:weapons:load', source, table)
        end)
    end)

    ESX.RegisterServerCallback('zmain:weapons:getSelling', function(source, cb)
        MySQL.Async.fetchAll('SELECT * FROM selling_weapons', {}, function(result)
            local tb = {}
            for k,v in pairs(result) do
                table.insert(tb, {
                    name = v.name,
                    label = v.label
                })
            end

            cb(tb)
        end)
    end)

    RegisterNetEvent('zmain:weapons:sell:add', function(data)
        MySQL.Async.execute('INSERT INTO selling_weapons (name, label) VALUES (@name, @label)', {
            ['@name'] = data.name,
            ['@label'] = data.label
        }, function()
            
        end)
    end)

    RegisterNetEvent('zmain:weapons:sell:delete', function(name)
        MySQL.Async.execute('DELETE FROM selling_weapons WHERE name = @name', {
            ['@name'] = name,
        }, function()
            
        end)
    end)
end)