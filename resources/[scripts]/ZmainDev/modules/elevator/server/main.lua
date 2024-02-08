RegisterNetEvent('zmain:acceuil:sendAnnounce', function(job, message)
    local players = ESX.GetExtendedPlayers('job', job)

    for k,v in pairs(players) do
        ESX.Notifi(v.source, message)
    end
end)