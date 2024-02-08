local gamerTags = {}

function showNames(bool)
    adminManagement.Gamertags = bool
    if adminManagement.Gamertags then
        Citizen.CreateThread(function()
            while adminManagement.Gamertags do
                for _, player in pairs(GetActivePlayers()) do
                    local ped = GetPlayerPed(player)
                    if #(GetEntityCoords(PlayerPedId()) - GetEntityCoords(ped, false)) < 10000.0  then
                        local playerId = GetPlayerServerId(player)
                        local uniqueId = adminManagement.Players[playerId] == nil and 'none' or adminManagement.Players[playerId].UniqueID
                        local nameTag = ('[U %s | T %d] %s'):format(uniqueId, playerId, GetPlayerName(player))
                        gamerTags[player] = CreateFakeMpGamerTag(ped, nameTag, false, false, '', 0, 0, 0, 0)
                        SetMpGamerTagVisibility(gamerTags[player], 2, 1)  --set the visibility of component 2(healthArmour) to true
                        SetMpGamerTagAlpha(gamerTags[player], 2, 255) --set the alpha of component 2(healthArmour) to 255
                        SetMpGamerTagHealthBarColor(gamerTags[player], 129) --set component 2(healthArmour) color to 129(HUD_COLOUR_YOGA)
                        SetMpGamerTagVisibility(gamerTags[player], 4, NetworkIsPlayerTalking(player))
                        -- if adminManagement.staffList[playerId] then 
                            -- if adminManagement.Players[playerId].group == 'fondateur' then
                            --     SetMpGamerTagColour(gamerTags[player], 0, 208)
                            -- else
                            --     SetMpGamerTagColour(gamerTags[player], 0, 64)
                            -- end
                            if playerId ~= nil then
                                if adminManagement.Players[playerId] ~= nil then
                                    if adminManagement.Players[playerId].group ~= nil then
                                        SetMpGamerTagColour(gamerTags[player], 0, Config.Staff.GamertagsGroup[adminManagement.Players[playerId].group])
                                    end
                                end
                            end
                        -- else
                        --     SetMpGamerTagColour(gamerTags[player], 0, 0)
                        -- end
                        if NetworkIsPlayerTalking(player) then
                            SetMpGamerTagColour(gamerTags[player], 4, 211)
                            SetMpGamerTagColour(gamerTags[player], 0, 211)
                        elseif not adminManagement.staffList[playerId] then
                            SetMpGamerTagColour(gamerTags[player], 4, 0)
                            SetMpGamerTagColour(gamerTags[player], 0, 0)
                        end
                    else
                        RemoveMpGamerTag(gamerTags[player])
                        gamerTags[player] = nil
                    end

                    if not adminManagement.MyName then 
                        if ped == PlayerPedId() then 
                            RemoveMpGamerTag(gamerTags[player])
                        end
                    end
                end
                Citizen.Wait(100)
                if not adminManagement.Gamertags then
                    break
                end
            end
            for k,v in pairs(gamerTags) do
                RemoveMpGamerTag(v)
            end
            gamerTags = {}
        end)
    end
end