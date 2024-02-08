function Blips()
    adminManagement.Blips = not adminManagement.Blips
    Citizen.CreateThread(function()
        while adminManagement.Blips do
            Wait(1)

            if not adminManagement.Blips then
                break
            end

            for _, player in pairs(GetActivePlayers()) do
                local found = false
                if player ~= PlayerId() then
                    local ped = GetPlayerPed(player)
                    local blip = GetBlipFromEntity( ped )
                    if not DoesBlipExist( blip ) then
                        blip = AddBlipForEntity(ped)
                        SetBlipCategory(blip, 7)
                        SetBlipScale( blip,  0.85 )
                        ShowHeadingIndicatorOnBlip(blip, true)
                        SetBlipSprite(blip, 1)
                        SetBlipColour(blip, 0)
                    end

                    SetBlipNameToPlayerName(blip, player)

                    local veh = GetVehiclePedIsIn(ped, false)
                    local blipSprite = GetBlipSprite(blip)

                    if IsEntityDead(ped) then
                        if blipSprite ~= 303 then
                            SetBlipSprite( blip, 303 )
                            SetBlipColour(blip, 1)
                            ShowHeadingIndicatorOnBlip( blip, false )
                        end
                    elseif veh ~= nil then
                        if IsPedInAnyBoat( ped ) then
                            if blipSprite ~= 427 then
                                SetBlipSprite( blip, 427 )
                                SetBlipColour(blip, 0)
                                ShowHeadingIndicatorOnBlip( blip, false )
                            end
                        elseif IsPedInAnyHeli( ped ) then
                            if blipSprite ~= 43 then
                                SetBlipSprite( blip, 43 )
                                SetBlipColour(blip, 0)
                                ShowHeadingIndicatorOnBlip( blip, false )
                            end
                        elseif IsPedInAnyPlane( ped ) then
                            if blipSprite ~= 423 then
                                SetBlipSprite( blip, 423 )
                                SetBlipColour(blip, 0)
                                ShowHeadingIndicatorOnBlip( blip, false )
                            end
                        elseif IsPedInAnyPoliceVehicle( ped ) then
                            if blipSprite ~= 137 then
                                SetBlipSprite( blip, 137 )
                                SetBlipColour(blip, 0)
                                ShowHeadingIndicatorOnBlip( blip, false )
                            end
                        elseif IsPedInAnySub( ped ) then
                            if blipSprite ~= 308 then
                                SetBlipSprite( blip, 308 )
                                SetBlipColour(blip, 0)
                                ShowHeadingIndicatorOnBlip( blip, false )
                            end
                        elseif IsPedInAnyVehicle( ped ) then
                            if blipSprite ~= 225 then
                                SetBlipSprite( blip, 225 )
                                SetBlipColour(blip, 0)
                                ShowHeadingIndicatorOnBlip( blip, false )
                            end
                        else
                            if blipSprite ~= 1 then
                                SetBlipSprite(blip, 1)
                                SetBlipColour(blip, 0)
                                ShowHeadingIndicatorOnBlip( blip, true )
                            end
                        end
                    else
                        if blipSprite ~= 1 then
                            SetBlipSprite( blip, 1 )
                            SetBlipColour(blip, 0)
                            ShowHeadingIndicatorOnBlip( blip, true )
                        end
                    end
                    if veh then
                        SetBlipRotation( blip, math.ceil( GetEntityHeading( veh ) ) )
                    else
                        SetBlipRotation( blip, math.ceil( GetEntityHeading( ped ) ) )
                    end
                end
            end
        end

        for _, player in pairs(GetActivePlayers()) do
            local blip = GetBlipFromEntity(GetPlayerPed(player))
            if blip ~= nil then
                RemoveBlip(blip)
            end
        end
    end)
end


AddTextEntry('BLIP_PROPCAT', 'Objets ')
function setobject()
    adminManagement.object = not adminManagement.object

    Citizen.CreateThread(function()
        while adminManagement.object do
            Wait(500)
            for _,v in pairs(WorldProps.data.propsSpawned) do
                if not DoesBlipExist(v.blip) then
                    v.blip = AddBlipForCoord(v.position.x, v.position.y, v.position.z)
                    
                    SetBlipScale(v.blip,  0.5)
                    ShowHeadingIndicatorOnBlip(v.blip, true)
                    SetBlipSprite(v.blip, 1)
                    SetBlipColour(v.blip, 57)

                    BeginTextCommandSetBlipName('STRING')
                    AddTextComponentString(("%s [%s]"):format(v.propsName, v.propsId))
                    EndTextCommandSetBlipName(v.blip)
                    SetBlipCategory(v.blip, 10)

                    WorldProps.data.propsSpawned[v.propsId].blip = v.blip
                end
            end
        end

        for _,v in pairs(WorldProps.data.propsSpawned) do
            local exist = DoesBlipExist(v.blip)
            if exist == nil then goto continue end

            RemoveBlip(v.blip)

            ::continue::
        end
    end)
end