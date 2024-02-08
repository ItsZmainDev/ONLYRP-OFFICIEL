local ZonesListe = {
    -- ['exemple'] = {
    --     Position = vector3(761.59454345703, -967.09130859375, 25.60489654541),
    --     Dist = 15,
    --     Public = true,
    --     Job = nil,
    --     Job2 = nil,
    --     InVehicleDisable = false,
    --     Blip = {
    --         Active = false,
    --         Position = vector3(),
    --         BlipId = 0,
    --         Color = 0,
    --         Sacle = 0.6,
    --         Text = ''
    --     },
    --     ActionText = 'Appuyez sur [ ~g~E~w~ ] pour intéragir',
    --     Action = function()
    --         print('test')
    --     end
    -- }
}

local BlipsListe = {
    -- ['exemple'] = {
    --     Public = true,
    --     Jobs = {}
    --     Position = vector3(1084.9197998047, -2002.4211425781, 31.402545928955),
    --     BlipId = 253,
    --     Color = 1,
    --     Scale = 0.6,
    --     Text = '[ILLEGAL] Fonderie'
    -- }
}

local waitNearby = 2000

CreateThread(function()
    while not ESXLoaded do Wait(1) end
    while not ESX.PlayerData.job do Wait(1) end 
    while not ESX.PlayerData.job2 do Wait(1) end

    while true do
        Wait(waitNearby)
        waitNearby = 2000

        for k,v in pairs(ZonesListe) do
            if v.Position == nil then goto continue end
            if v.Dist == nil then v.Dist = 15 end

            local ped = PlayerPedId()
            local distance = #(GetEntityCoords(ped)-v.Position)

            if distance > v.Dist then goto continue end

            if not v.Public then 
                if type(v.Job) ~= "table" then v.Job = {} end
                if type(v.Job2) ~= "table" then v.Job2 = {} end
                if type(v.GradesJob) ~= "table" then v.GradesJobs = {} end

                if not v.Job[ESX.PlayerData.job.name] and not v.Job2[ESX.PlayerData.job2.name] then
                    goto continue 
                end 

                if v.GradesJobRequire then
                    if not v.GradesJob[ESX.PlayerData.job.grade_name] then
                        goto continue
                    end
                end
            end
            
            if v.InVehicleDisable then
                if IsPedSittingInAnyVehicle(ped) then
                    goto continue
                end
            end

            waitNearby = 1

            local positon = v.Position

            if v.marker ~= nil and not v.marker then
                goto go
            end
            
            DrawMarker(25, positon.x, positon.y, positon.z-0.98, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.55, 0.55, 0.55, tonumber(UTILS.ServerColor.r), tonumber(UTILS.ServerColor.g), tonumber(UTILS.ServerColor.b), 255, false, false, 2, false, false, false, false)

            ::go::

            if distance <= 1.5 then
                DrawInstructionBarNotification(positon.x, positon.y, positon.z, v.ActionText)
                if IsControlJustPressed(1,51) then
                    v.Action()
                end
            end

            ::continue::
        end
    end
end)

function AddZones(ZoneName, data)
    while not ESXLoaded do Wait(1) end
    if ZoneName == nil then return end
    
    if ZonesListe[ZoneName] ~= nil then
        ZonesListe[#ZonesListe..ZoneName] = data
    else
        ZonesListe[ZoneName] = data
    end

    if data.Blip.Active then
        if ZonesListe[ZoneName].Job == nil and ZonesListe[ZoneName].Job2 == nil then
            local blip = AddBlipForCoord(data.Blip.Position.x, data.Blip.Position.y, data.Blip.Position.z)
            SetBlipSprite(blip, data.Blip.BlipId)
            SetBlipDisplay(blip, 4)
            SetBlipScale(blip, data.Blip.Scale)
            SetBlipColour(blip, data.Blip.Color)
            SetBlipAsShortRange(blip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(data.Blip.Text)
            EndTextCommandSetBlipName(blip)
        else
            if not ZonesListe[ZoneName].Job[ESX.PlayerData.job.name] and not ZonesListe[ZoneName].Job2[ESX.PlayerData.job2.name] then
                return
            end 
            local blip = AddBlipForCoord(data.Blip.Position.x, data.Blip.Position.y, data.Blip.Position.z)
            SetBlipSprite(blip, data.Blip.BlipId)
            SetBlipDisplay(blip, 4)
            SetBlipScale(blip, data.Blip.Scale)
            SetBlipColour(blip, data.Blip.Color)
            SetBlipAsShortRange(blip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(data.Blip.Text)
            EndTextCommandSetBlipName(blip)
        end
    end
end

function RemoveZones(ZoneName)
    if ZonesListe[ZoneName] == nil then return end

    ZonesListe[ZoneName] = nil
end

function AddBlips(BlipsName, data)
    while not ESXLoaded do Wait(1) end

    if BlipsListe == nil then return end
    
    if BlipsListe[BlipsName] ~= nil then
        BlipsListe[#BlipsName..ZoneName] = data
    else
        BlipsListe[BlipsName] = data
    end

    local blip = AddBlipForCoords(data.Position.x, data.Position.y, data.Position.z)
    if data.Public == true then
        SetBlipSprite(blip, data.BlipId)
        SetBlipDisplay(blip, 4)
        SetBlipScale(blip, data.Scale)
        SetBlipColour(blip, data.Color)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(data.Text)
        EndTextCommandSetBlipName(blip)
    else
        if not data.Jobs[ESX.PlayerData.job.name] then return end

        SetBlipSprite(blip, data.BlipId)
        SetBlipDisplay(blip, 4)
        SetBlipScale(blip, data.Scale)
        SetBlipColour(blip, data.Color)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(data.Text)
        EndTextCommandSetBlipName(blip)
    end
end

_G._VEHICLES = {
    existVehicles = {},
    myVehicles = {},
}

_VEHICLES.List = {
   --['exemple'] = {
   --    model = 'rebel',
   --    position = vector3(-1490.3, 4975.24, 63.71),
   --    heading = 37.94,
   --}
}

_VEHICLES.addVehicles = function(name,data)
    if _VEHICLES.List[name] then return end
    if not data then return end

    _VEHICLES.List[name] = data
end

_VEHICLES.removeVehicles = function(name)
    if not _VEHICLES.List[name] then return end

    _VEHICLES.List[name] = nil
end

Citizen.CreateThread(function()
    while not ESXLoaded do Wait(1) end
    while true do 
        Wait(5000)
        for k,v in pairs(_VEHICLES.List) do 
            if #(Player.coords-v.position) < 50 then
                if _VEHICLES.myVehicles[k] == nil or not DoesEntityExist(_VEHICLES.myVehicles[k]) then 
                    ESX.Game.SpawnLocalVehicle(v.model, vector3(v.position.x, v.position.y, v.position.z-0.98), v.heading, function(vehicle)
                        _VEHICLES.myVehicles[k] = vehicle
                        FreezeEntityPosition(vehicle, true)
                        SetEntityInvincible(vehicle, true)
                        SetVehicleUndriveable(vehicle, true)
                        SetVehicleDoorsLocked(vehicle, 2)
                    end)
                end
            else
                if _VEHICLES.myVehicles[k] then 
                    if DoesEntityExist(_VEHICLES.myVehicles[k]) then 
                        DeleteEntity(_VEHICLES.myVehicles[k])
                        _VEHICLES.myVehicles[k] = nil
                    end
                end
            end
        end
    end
end)

AddEventHandler('onResourceStop', function(resource)
	if resource ~= GetCurrentResourceName() then return end

    for k,v in pairs(_VEHICLES.myVehicles) do 
        if DoesEntityExist(v) then 
            DeleteEntity(v)
            _VEHICLES.myVehicles[k] = nil
        end
    end
end)

_G._PROPS = {
    existVehicles = {},
    myProps = {},
}

_PROPS.List = {
   --['exemple'] = {
   --    model = 'prop_tool_box_05',
   --    position = vector3(-1492.69, 4975.49, 63.73),
   --    heading = 179.38,
   --},
   --['exemple2'] = {
   --     model = 'prop_tool_box_05',
   --     position = vector3(-1493.50, 4975.60, 63.7),
   --     heading = 179.38,
   -- },
   -- ['exemple3'] = {
   --     model = 'prop_tool_box_05',
   --     position = vector3(-1493.0, 4975.60, 64.24),
   --     heading = 179.38,
   -- }
    ['cayo_pump'] = {
        model = 1339433404,
        position = vector3(4475.03, -4462.78, 4.25),
        heading = 291.4,
    }
}

_PROPS.addProps = function(name,data)
    if _PROPS.List[name] then return end
    if not data then return end

    _PROPS.List[name] = data
end

_PROPS.removeProps = function(name)
    if not _PROPS.List[name] then return end

    _PROPS.List[name] = nil
end

Citizen.CreateThread(function()
    while not ESXLoaded do Wait(1) end
    while true do 
        Wait(5000)
        for k,v in pairs(_PROPS.List) do 
            if #(Player.coords-v.position) < 50 then
                if _PROPS.myProps[k] == nil or not DoesEntityExist(_PROPS.myProps[k]) then 
                    ESX.Game.SpawnLocalObject(v.model, vector3(v.position.x, v.position.y, v.position.z-0.98), function(obj)
                        _PROPS.myProps[k] = obj
                        FreezeEntityPosition(obj, true)
                    end)
                end
            else
                if _PROPS.myProps[k] then 
                    if DoesEntityExist(_PROPS.myProps[k]) then 
                        DeleteEntity(_PROPS.myProps[k])
                        _PROPS.myProps[k] = nil
                    end
                end
            end
        end
    end
end)

AddEventHandler('onResourceStop', function(resource)
	if resource ~= GetCurrentResourceName() then return end

    for k,v in pairs(_PROPS.myProps) do 
        if DoesEntityExist(v) then 
            DeleteEntity(v)
            _PROPS.myProps[k] = nil
        end
    end
end)