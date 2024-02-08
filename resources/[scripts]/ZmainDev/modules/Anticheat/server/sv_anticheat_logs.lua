Anticheat.sv_logs = {

}

function Anticheat.sv_logs:sendLogs(title, data, cb)
    sendLog(title, data, cb)
end

RegisterNetEvent('zmain:anticheat:sendLogs', function(title, data, cb)
    sendLog(title, data, cb)
end)