RegisterNuiCallback('reportEMS', function()
    KeyboardUtils.use('Raison du report', function(data)
        if data == nil or data == '' then return end

        TriggerServerEvent('zmain:admin:mort:report', data)
    end)
end)