---@author !.LGD and Zmain

local count = 0

AddEventHandler('playerSpawned', function()
    while not ESXLoaded do Wait(1) end 
    Citizen.Wait(10000)
    Anticheat.interval = 2000
    CreateThread(function()
        while true do 
            Anticheat.interval = 2000

            if Anticheat.bypassESX[ESX.PlayerData.group] then goto continue end

            Anticheat.interval = 1000

            Anticheat.playerPed = PlayerId()
            Anticheat.isInVincible = GetPlayerInvincible(Anticheat.playerPed)

            if Anticheat.antiGodMod.active then
                if not Anticheat.byPass then
                    local retval, bulletProof, fireProof, explosionProof, collisionProof, meleeProof, steamProof, p7, drownProof =
                    GetEntityProofs(PlayerPedId())
                    if GetPlayerInvincible(PlayerId()) or GetPlayerInvincible_2(PlayerId()) then
                        TriggerServerEvent('zmain:admin:banSystem:banWithAnticheat', ESX.PlayerData.UniqueID, Anticheat.Translate('GOD_MOD'))
                    end

                    if retval == 1 and bulletProof == 1 and fireProof == 1 and explosionProof == 1 and collisionProof == 1 and steamProof == 1 and p7 == 1 and drownProof == 1 then
                        TriggerServerEvent('zmain:admin:banSystem:banWithAnticheat', ESX.PlayerData.UniqueID, Anticheat.Translate('GOD_MOD'))
                    end
                    if not GetEntityCanBeDamaged(PlayerPedId()) then
                        TriggerServerEvent('zmain:admin:banSystem:banWithAnticheat', ESX.PlayerData.UniqueID, Anticheat.Translate('GOD_MOD'))
                    end
                end
            end

            if Anticheat.ANTI_FREECAM.active then
                if GetEntityCoords(GetPlayerPed(-1)).z - GetFinalRenderedCamCoord().z == 0 then
                    count = count + 1
                    if count > 5 then
                        TriggerServerEvent('zmain:admin:banSystem:banWithAnticheat', ESX.PlayerData.UniqueID, Anticheat.Translate('ANTI_FREECAM'))

                        if not setLogs then
                            exports['screenshot-basic']:requestScreenshotUpload('https://discord.com/api/webhooks/1090299572980555796/SmSwNOz5dLp4kdUty0H578k-12e8UT2pQeKYKyCzNmnZzoxom3LdJfeDao_9Rbr_Wj_E', "files[]", function(data)
                                local d = json.decode(data)
                                Anticheat.cl_logs:sendLogs(
                                    ('Informations Joueur : %s [%s]\n**Detection Freecam**\n(**ONLYRP**) Detectoin Freecam\n'):format(GetPlayerName(PlayerId()), ESX.PlayerData.UniqueID), {
                                        author = GetPlayerName(PlayerId()),
                                        fields = {
                                            {title = 'Position Joueur', subtitle = GetEntityCoords(PlayerPedId())},
                                            {title = 'Position Caméra', subtitle = GetEntityCoords(PlayerPedId()).z - GetFinalRenderedCamCoord().z},
                                        },
                                        channel = 'ANTI_FREECAM',
                                        img = d.attachments[1].url
                                    }
                                )

                                setLogs = true
                            end)
                        end
                    end
                end

                local playerCoords = GetEntityCoords(PlayerPedId())
                local camCoords = GetFinalRenderedCamCoord()
                local distance = #(playerCoords - camCoords)
                if distance > 50 or distance == 0.0 then
                    exports['screenshot-basic']:requestScreenshotUpload('https://discord.com/api/webhooks/1090299572980555796/SmSwNOz5dLp4kdUty0H578k-12e8UT2pQeKYKyCzNmnZzoxom3LdJfeDao_9Rbr_Wj_E', "files[]", function(data)
                        local d = json.decode(data)
                        Anticheat.cl_logs:sendLogs(
                            ('Informations Joueur : %s [%s]\n**Detection Freecam**\n(**ONLYRP**) Detectoin Freecam\n'):format(GetPlayerName(PlayerId()), ESX.PlayerData.UniqueID), {
                                author = GetPlayerName(PlayerId()),
                                fields = {
                                    {title = 'Position Joueur', subtitle = GetEntityCoords(PlayerPedId())},
                                    {title = 'Position Caméra', subtitle = distance},
                                },
                                channel = 'ANTI_FREECAM',
                                img = d.attachments[1].url
                            }
                        )
                    end)
                end
            end

            if not IsPedInAnyVehicle(PlayerPedId(), false) then
                local coords = GetEntityCoords(PlayerPedId())
                if isFirstAttempt then
                    lastCoords = coords
                    isFirstAttempt = false
                end

                if #(coords - lastCoords) > 10.0 and GetEntityHeightAboveGround(PlayerPedId()) > 4.0 and not IsPedFalling(PlayerPedId()) then
                    TriggerServerEvent('zmain:admin:banSystem:banWithAnticheat', ESX.PlayerData.UniqueID, Anticheat.Translate('ANTI_FREECAM'))
                end
                lastCoords = coords
            end

            if GetEntityHealth(Anticheat.playerPed) > 200 then
                TriggerServerEvent('zmain:admin:banSystem:banWithAnticheat', ESX.PlayerData.UniqueID, Anticheat.Translate('GOD_MOD'))
            end

            if Anticheat.antiSpectate.active then
                if NetworkIsInSpectatorMode() then
                    TriggerServerEvent('zmain:admin:banSystem:banWithAnticheat', ESX.PlayerData.UniqueID, Anticheat.Translate('ANTI_SPECTATE'))
                end
            end

            if Anticheat.antiTextureStream.active then
                for fd, fe in pairs(seaShield.AntiTextureStream.TextureName) do
                    if HasStreamedTextureDictLoaded(fe) then
                        TriggerServerEvent('zmain:admin:banSystem:banWithAnticheat', ESX.PlayerData.UniqueID, Anticheat.Translate('ANTI_TEXTURESTREAM'))
                    end
                end
            end

            if Anticheat.AntiThermalVision.active then
                if GetUsingseethrough() then
                    TriggerServerEvent('zmain:admin:banSystem:banWithAnticheat', ESX.PlayerData.UniqueID, Anticheat.Translate('ANTI_THERMALVISION'))
                end
            end

            if Anticheat.AntiNightVision.active then
                if GetUsingnightvision() then
                    TriggerServerEvent('zmain:admin:banSystem:banWithAnticheat', ESX.PlayerData.UniqueID, Anticheat.Translate('ANTI_NIGHTVISION'))
                end
            end

            ::continue::

            Wait(Anticheat.interval)
        end
    end)
end)

AddEventHandler('zmain:anticheat:bypassGodMod', function(value)
    Anticheat.byPass = value
end)

AddEventHandler("gameEventTriggered", function(eventName, eventArguments)
    if eventName == 'CEventNetworkPlayerEnteredVehicle' then
        local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
        local vehicleModel = GetEntityModel(vehicle)

        local vehicleName = GetDisplayNameFromVehicleModel(vehicleModel)
        
        if Anticheat.BlacklistVehicle.active then
            for k,v in pairs(Anticheat.BlacklistVehicle.list) do
                if GetHashKey(v) == vehicleModel then
                    DeleteEntity(vehicle)

                    if not Anticheat.bypassESX[ESX.PlayerData.group] then
                        TriggerServerEvent('zmain:admin:banSystem:banWithAnticheat', ESX.PlayerData.UniqueID, Anticheat.Translate('BLACKLIST_VEHICLE'):format(vehicleName))
                    end
                end
            end
        end
    end
end)

AddEventHandler("entityCreating", function(vehicle)
    local vehicleModel = GetEntityModel(vehicle)

    local vehicleName = GetDisplayNameFromVehicleModel(vehicleModel)
    
    if Anticheat.BlacklistVehicle.active then
        for k,v in pairs(Anticheat.BlacklistVehicle.list) do
            if GetHashKey(v) == vehicleModel then
                DeleteEntity(vehicle)

                if not Anticheat.bypassESX[ESX.PlayerData.group] then
                    TriggerServerEvent('zmain:admin:banSystem:banWithAnticheat', ESX.PlayerData.UniqueID, Anticheat.Translate('BLACKLIST_VEHICLE'):format(vehicleName))
                end
            end
        end
    end
end)