CreateThread(function()
    local _LabsSystem = {}
    _LabsSystem.labsList = {}

    RegisterNetEvent('zmain:labs:requireLabsInteriors', function(e)
        _LabsSystem.labsList = e
    end)

    MySQL.Async.execute([[
        CREATE TABLE IF NOT EXISTS `illegal_laboratory` (
            `id` INT AUTO_INCREMENT PRIMARY KEY,
            name LONGTEXT DEFAULT NULL,
            type LONGTEXT DEFAULT NULL,
            interior LONGTEXT DEFAULT NULL,
            owner LONGTEXT DEFAULT NULL,
            pos VARCHAR(255) DEFAULT NULL
        );
    ]])

    function _LabsSystem:setPlayerInstance(src,id)
        SetPlayerRoutingBucket(src, id)
    end

    RegisterNetEvent('zmain:labs:enter', function(id)
        local source = source

        _LabsSystem:setPlayerInstance(source,id)
        TriggerClientEvent('zmain:labs:enter', source, drugs_laboratories[id].type, _LabsSystem.labsList[drugs_laboratories[id].type].exit, id)
    end)

    RegisterNetEvent('zmain:labs:exit', function(id)
        local source = source

        _LabsSystem:setPlayerInstance(source, 0)

        TriggerClientEvent('zmain:labs:exit', source, drugs_laboratories[id].type, drugs_laboratories[id].pos, id)
    end)
end)