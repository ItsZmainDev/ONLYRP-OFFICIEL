CreateThread(function()
    while not ESXLoaded do Wait(1) end
    
    local injail = false

    RegisterNetEvent('zmain:admin:jail:setPlayerInJail', function(UniqueID, data)
        injail = true
        adminManagement.jails[UniqueID] = data

        SetEntityCoords(Player.playerPed, vector3(1725.819, 2537.949, 43.58538))
        SetEntityInvincible(Player.playerPed, true)

        CreateThread(function()

            exports['ZmainUI']:drawInfo('Informations Jail', {
                {title = 'Temps', subtitle = ('%s'):format(adminManagement.jails[UniqueID].time)},
                {title = 'Raison', subtitle = ('%s'):format(adminManagement.jails[UniqueID].reason)},
            })

            while injail == true do

                Wait(60000)

                adminManagement.jails[UniqueID].time -= 1

                exports['ZmainUI']:drawInfo('Informations Jail', {
                    {titlebar = 'Temps', subtitle = ('%s %s'):format(adminManagement.jails[UniqueID].time, 'Mins')},
                    {titlebar2 = 'Raison', subtitle2 = ('%s'):format(adminManagement.jails[UniqueID].reason)},
                })

                if adminManagement.jails[UniqueID].time < 1 then
                    TriggerServerEvent('zmain:admin:jail:remove', UniqueID, adminManagement.jails[UniqueID])
                end

                if injail then
                    break
                end
            end
        end)
    end)

    CreateThread(function()
        while injail == true do
            Wait(1)

            local dist = #(GetEntityCoords(Player.playerPed)-vector3(1725.819, 2537.949, 43.58538))

            if dist > 15 then
                SetEntityCoords(Player.playerPed, vector3(1725.819, 2537.949, 43.58538))
            end

            if not adminManagement.jails[UniqueID] then
                break
            end
        end
    end)

    RegisterNetEvent('zmain:admin:jail:remove', function(UniqueID)
        injail = false
        adminManagement.jails[UniqueID] = nil
        SetEntityCoords(Player.playerPed, vector3(1846.345, 2585.924, 45.67266))
        SetEntityInvincible(Player.playerPed, false)


        Wait(2000)

        exports['ZmainUI']:hide()
    end)
end)