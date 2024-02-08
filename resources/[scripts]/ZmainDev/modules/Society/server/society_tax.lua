RegisterNetEvent('zmain:society:gouvernement:editTax', function(societyName, tax)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer then return end

    local society = Society:getSociety(societyName)

    if not society then return end

    local oldTax = society.tax

    society.tax = tax

    society:save(society.name)

    TriggerClientEvent('zmain:society:gouvernement:editTax', -1, society.name, society.tax)

    ESX.Notifi(source, ('Edition des taxes de la société\nNom de la société: ~y~%s~s~\nLabel de la société: ~y~%s~s~'):format(society.name, society.label))
end)

CreateThread(function()
    local dostNotremovemoney = {
        ['police'] = true,
        ['ambulance'] = true,
        ['bcso'] = true,
        ['gouvernement'] = true,
    }
    local societyAllMoney = 0
    while true do
        Wait(3600000)

        for k,v in pairs(Society.List) do
            local society = Society:getSociety(v.name)
    
            if not society then return end
    
            if not dostNotremovemoney[v.name] then
                local societyGouvernement = Society:getSociety('gouvernement')
                if v.coffre['accounts'].society > 50000 then
                    societyGouvernement.addSocietyMoney(v.coffre['accounts'].society/100*society.tax)

                    local players = ESX.GetExtendedPlayers('job', v.name)
        
                    for i,p in pairs(players) do
                        ESX.Notifi(p.source, ('💲 Votre société a été taxé de ~r~%s$~s~ par le gouvernement'):format(v.coffre['accounts'].society/100*society.tax))
                    end

                    society.removeSocietyMoney(v.coffre['accounts'].society/100*society.tax)

                else
                    local players = ESX.GetExtendedPlayers('job', 'gouvernement')
    
                    for i,p in pairs(players) do
                        ESX.Notifi(p.source, ('La société ~y~%s~s~ n\'a pas asser de fonds pour être taxé'):format(society.label))
                    end
                end
            end
    
            if dostNotremovemoney[v.name]  then
                if v.name ~= 'gouvernement' then
                    local societyGouvernement = Society:getSociety('gouvernement')
    
                    societyGouvernement.removeSocietyMoney(society.tax)
        
                    society.addSocietyMoney(society.tax)
    
                    local players = ESX.GetExtendedPlayers('job', v.name)
        
                    for i,p in pairs(players) do
                        ESX.Notifi(p.source, ('💲 Votre société a reçue une remise de ~g~%s$~s~ par le gouvernement'):format(society.tax))
                    end
                end
            end
        end
    end
end)

RegisterNetEvent('zmain:society:gouvernement:editTax2', function(societyName, tax)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer then return end

    local society = Society:getSociety(societyName)

    if not society then return end

    local oldTax = society.tax

    society.tax = tax

    society:save(society.name)

    TriggerClientEvent('zmain:society:gouvernement:editTax', -1, society.name, society.tax)

    ESX.Notifi(source, ('Edition des remises de la société\nNom de la société: ~y~%s~s~\nLabel de la société: ~y~%s~s~'):format(society.name, society.label))
end)