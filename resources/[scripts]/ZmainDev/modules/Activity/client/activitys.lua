function Activity:setPickUpPlayerAnimation(item)
    local ped = PlayerPedId()

    DisableControlAction(2, 73, true)

    ClearPedTasksImmediately(ped)
    FreezeEntityPosition(PlayerPedId(), true)


    local dict, anim = 'random@domestic', 'pickup_low'

    ESX.Streaming.RequestAnimDict(dict)
	TaskPlayAnim(ped, dict, anim, -1.0, -1.0, 3000, 0, 0, true, true, true)

    Citizen.Wait(2000)

    ClearPedTasks(ped)
    FreezeEntityPosition(ped, false)

    TriggerServerEvent('zmain:activitys:pickUpItem', item)
end

function Activity:setPickUpTraitementPlayerAnimation(item, itemt)
    local ped = PlayerPedId()

    DisableControlAction(2, 73, true)

    ClearPedTasksImmediately(ped)
    FreezeEntityPosition(PlayerPedId(), true)


    local dict, anim = 'random@domestic', 'pickup_low'

    ESX.Streaming.RequestAnimDict(dict)
	TaskPlayAnim(ped, dict, anim, -1.0, -1.0, 3000, 0, 0, true, true, true)

    Citizen.Wait(2000)

    ClearPedTasks(ped)
    FreezeEntityPosition(ped, false)

    TriggerServerEvent('zmain:activitys:traitementItem', item, itemt)
end

function Activity:setPickUpVentePlayerAnimation(item)
    local ped = PlayerPedId()

    DisableControlAction(2, 73, true)

    ClearPedTasksImmediately(ped)
    FreezeEntityPosition(PlayerPedId(), true)


    local dict, anim = 'random@domestic', 'pickup_low'

    ESX.Streaming.RequestAnimDict(dict)
	TaskPlayAnim(ped, dict, anim, -1.0, -1.0, 3000, 0, 0, true, true, true)

    Citizen.Wait(2000)

    ClearPedTasks(ped)
    FreezeEntityPosition(ped, false)

    TriggerServerEvent('zmain:activitys:venteItem', item)
end

CreateThread(function()

    for k,v in pairs(Activity.Blips) do
        local blip = AddBlipForCoord(v.pos.x, v.pos.y, v.pos.z)
        SetBlipSprite(blip, v.blipid)
        SetBlipColour(blip, v.blipcolor)
        SetBlipScale(blip, 0.6)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(('%s'):format(v.text))
        EndTextCommandSetBlipName(blip)
    end

    for k,v in pairs(Activity.ZoneBlips) do
        local zoneblip = AddBlipForRadius(v.pos, 3000.0)
        SetBlipSprite(zoneblip,1)
        SetBlipColour(zoneblip, v.blipcolor)
        SetBlipAlpha(zoneblip,100)
    end

    for k,v in pairs(Activity.Peds) do
        _PEDS.addPed(k, {
            model = v.model,
            position = vector3(v.pos.x, v.pos.y, v.pos.z),
            heading = v.heading,
            scenario = {
                active = v.scenarioActive,
                name = v.scenarioName,
                count = 0,
            },
            weapon = {
                active = v.weaponActive,
                weaponName = v.weapon,
            },
            floatingText = {
                active = v.gamerTag,
                text = v.tag,
                color = 34,
            },
        })
    end

    _PEDS.addPed('chasse_start', {
        model = 'cs_hunter',
        position = vector3(-1492.38, 4973.54, 63.82),
        heading = 93.82,
        scenario = {
            active = false,
            name = "WORLD_HUMAN_CLIPBOARD",
            count = 0,
        },
        weapon = {
            active = true,
            weaponName = 'weapon_musket',
        },
        floatingText = {
            active = true,
            text = 'Chasseur | Bachir',
            color = 4,
        },
    })

    _PEDS.addPed('chasse_start2', {
        model = 'cs_josef',
        position = vector3(-1492.29, 4974.42, 63.77),
        heading = 124.8,
        scenario = {
            active = false,
            name = "WORLD_HUMAN_CLIPBOARD",
            count = 0,
        },
        weapon = {
            active = false,
            weaponName = 'weapon_heavysniper',
        },
        floatingText = {
            active = false,
            text = 'Gilbert',
            color = 34,
        },
    })
    _VEHICLES.addVehicles('chasse_star', {
        model = 'rebel',
        position = vector3(-1490.3, 4975.24, 63.71),
        heading = 37.94,
    })

    _PROPS.addProps('chasse_star', {
        model = 'prop_tool_box_05',
        position = vector3(-1492.69, 4975.49, 63.73),
        heading = 179.38,
    })
    _PROPS.addProps('chasse_star2', {
        model = 'prop_tool_box_05',
        position = vector3(-1493.0, 4975.60, 64.24),
        heading = 179.38,
    })
    _PROPS.addProps('chasse_star3', {
        model = 'prop_tool_box_05',
        position = vector3(-1493.50, 4975.60, 63.7),
        heading = 179.38,
    })

    AddZones("chasse_start", {
        Position = vector3(-1493.36, 4974.03, 63.83),
        Dist = 10,
        Public = true,
        Job = nil,
        Job2 = nil,
        GradesJobRequire = false,
        GradesJob = {},
        InVehicleDisable = true,
        Blip = {
            Active = false,
        },
        ActionText = 'Appuyez sur [ ~g~E~w~ ] pour intéragir',
        marker = false,
        Action = function()
            _CHASSE.openChasseMenu()
        end
    })

    local RandomZoneAcier = Activity.Acier[math.random(1, #Activity.Acier)]
    local AcierX,AcierY,AcierZ = RandomZoneAcier.x + math.random( 1, #Activity.Acier ), RandomZoneAcier.y + math.random( 1, #Activity.Acier ), RandomZoneAcier.z

    local RandomZoneTAcier = Activity.TAcier[math.random(1, #Activity.TAcier)]
    local TAcierX,TAcierY,TAcierZ = RandomZoneTAcier.x + math.random( 1, #Activity.TAcier ), RandomZoneTAcier.y + math.random( 1, #Activity.TAcier ), RandomZoneTAcier.z

    local RandomZoneVAcier = Activity.VAcier[math.random(1, #Activity.VAcier)]
    local VAcierX,VAcierY,VAcierZ = RandomZoneVAcier.x + math.random( 1, #Activity.VAcier ), RandomZoneVAcier.y + math.random( 1, #Activity.VAcier ), RandomZoneVAcier.z

    while true do

        Wait(intervall)

        intervall = 2000
        
        local ped = PlayerPedId()
        local playerCoords = GetEntityCoords(ped)

        -- for k,v in pairs(Activity.Acier) do
            local distAcier = #(playerCoords-vector3(AcierX,AcierY,AcierZ))
            local distTAcier = #(playerCoords-vector3(TAcierX,TAcierY,TAcierZ))
            local distVacier = #(playerCoords-vector3(VAcierX,VAcierY,VAcierZ))

            if IsPedInAnyVehicle(ped, false) then goto cn end

            if distAcier > 20 and distTAcier > 20 and distVacier > 20 then goto cn end

            intervall = 1

            DrawMarker(21, AcierX,AcierY,AcierZ, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, tonumber(UTILS.ServerColor.r), tonumber(UTILS.ServerColor.g), tonumber(UTILS.ServerColor.b), 255, false, false, 2, false, false, false, false)
            DrawMarker(21, TAcierX,TAcierY,TAcierZ, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, tonumber(UTILS.ServerColor.r), tonumber(UTILS.ServerColor.g), tonumber(UTILS.ServerColor.b), 255, false, false, 2, false, false, false, false)
            DrawMarker(21, VAcierX,VAcierY,VAcierZ, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, tonumber(UTILS.ServerColor.r), tonumber(UTILS.ServerColor.g), tonumber(UTILS.ServerColor.b), 255, false, false, 2, false, false, false, false)

            if distAcier < 1.5 then
                DrawInstructionBarNotification(AcierX,AcierY,AcierZ, "Appuyez sur [ ~g~E~w~ ] pour récupérer la féraille")
                if IsControlJustPressed(1,51) then
                    RandomZoneAcier = Activity.Acier[math.random(1, #Activity.Acier)]
                    AcierX,AcierY,AcierZ = RandomZoneAcier.x + math.random( 1, #Activity.Acier ), RandomZoneAcier.y + math.random( 1, #Activity.Acier), RandomZoneAcier.z
                    Activity:setPickUpPlayerAnimation('steellingo')
                end
            end

            if distTAcier < 1.5 then
                DrawInstructionBarNotification(TAcierX,TAcierY,TAcierZ, "Appuyez sur [ ~g~E~w~ ] pour traiter")
                if IsControlJustPressed(1,51) then
                    RandomZoneTAcier = Activity.TAcier[math.random(1, #Activity.TAcier)]
                    TAcierX,TAcierY,TAcierZ = RandomZoneTAcier.x + math.random( 1, #Activity.TAcier ), RandomZoneTAcier.y + math.random( 1, #Activity.TAcier), RandomZoneTAcier.z
                    Activity:setPickUpTraitementPlayerAnimation('steellingo', 'treatedsteel')
                end
            end
            

            if distVacier < 1.5 then
                DrawInstructionBarNotification(VAcierX,VAcierY,VAcierZ, "Appuyez sur [ ~g~E~w~ ] pour vendre")
                if IsControlJustPressed(1,51) then
                    RandomZoneVAcier = Activity.VAcier[math.random(1, #Activity.VAcier)]
                    VAcierX,VAcierY,VAcierZ = RandomZoneVAcier.x + math.random( 1, #Activity.VAcier ), RandomZoneVAcier.y + math.random( 1, #Activity.VAcier), RandomZoneVAcier.z
                    Activity:setPickUpVentePlayerAnimation('treatedsteel')
                end
            end

            ::cn::
        -- end

        for k,v in pairs(Activity.Peds) do
            local startDist = #(playerCoords-vector3(v.pos.x, v.pos.y, v.pos.z))

            if startDist > 10 then goto continue end

            intervall = 1

            if startDist < 1.5 then
                DrawInstructionBarNotification(v.pos.x, v.pos.y, v.pos.z, v.text)
                if IsControlJustPressed(1,51) then
                    v.Action()
                end
            end
            
            ::continue::
        end
    end
end)