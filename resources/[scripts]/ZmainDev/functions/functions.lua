Zmain = {}

KeyboardUtils = {isActive = false}

AddEventHandler("kbi:cancel",function() 
    KeyboardUtils.isActive = false
end)

function KeyboardUtils.use(title,cb)
    if not KeyboardUtils.isActive then
        KeyboardUtils.isActive = true
        exports.lslife_ui:use(title,function(data)
            cb(data)
            KeyboardUtils.isActive = false
        end)
    end
end

function Draw3DText(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local p = GetGameplayCamCoords()
    local distance = GetDistanceBetweenCoords(p.x, p.y, p.z, x, y, z, 1)
    local scale = (1 / distance) * 2
    local fov = (1 / GetGameplayCamFov()) * 100
    local scale = scale * fov
    if onScreen then
        SetTextScale(0.0, 0.35)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
    end
end

function DrawTexteDansTaMere(x,y,z,textInput,fontId,scaleX,scaleY, Color)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)    
    local scale = (1/dist)*20
    local fov = (1/GetGameplayCamFov())*10.5
    local scale = scale*fov   
    SetTextScale(0.0 * scale, 0.55 * scale)
    SetTextFont(fontId)
    SetTextProportional(1)
    SetTextColour(Color.r, Color.g, Color.b, 255)
    SetTextDropshadow(1, 1, 1, 1, 255)
    SetTextEdge(2, 0, 0, 0, 150)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(textInput)
    SetDrawOrigin(x,y,z+2, 0)
    DrawText(0.0, 0.0)
    ClearDrawOrigin()
end

local NumberCharset = {}
local Charset = {}

for i = 48,  57 do table.insert(NumberCharset, string.char(i)) end

for i = 65,  90 do table.insert(Charset, string.char(i)) end
for i = 97, 122 do table.insert(Charset, string.char(i)) end

function GeneratePlate()
	local generatedPlate
	local doBreak = false

	while not doBreak do
		Citizen.Wait(2)
		math.randomseed(GetGameTimer())

			generatedPlate = string.upper(GetRandomLetter(4) .. GetRandomNumber(4))

		ESX.TriggerServerCallback('fellow_concess:verifierplaquedispo', function (isPlateTaken)
			if not isPlateTaken then
				doBreak = true
			end
		end, generatedPlate)

		if doBreak then
			break
		end
	end

	return generatedPlate
end

-- mixing async with sync tasks
function IsPlateTaken(plate)
	local callback = 'waiting'

	ESX.TriggerServerCallback('fellow_concess:verifierplaquedispo', function(isPlateTaken)
		callback = isPlateTaken
	end, plate)

	while type(callback) == 'string' do
		Citizen.Wait(0)
	end

	return callback
end

function GetRandomNumber(length)
	Citizen.Wait(1)
	math.randomseed(GetGameTimer())
	if length > 0 then
		return GetRandomNumber(length - 1) .. NumberCharset[math.random(1, #NumberCharset)]
	else
		return ''
	end
end

function GetRandomLetter(length)
	Citizen.Wait(1)
	math.randomseed(GetGameTimer())
	if length > 0 then
		return GetRandomLetter(length - 1) .. Charset[math.random(1, #Charset)]
	else
		return ''
	end
end

entityEnumerator = {
    __gc = function(enum)
        if enum.destructor and enum.handle then
            enum.destructor(enum.handle)
        end

        enum.destructor = nil
        enum.handle = nil
    end
}

function EnumerateEntities(initFunc, moveFunc, disposeFunc)
    return coroutine.wrap(function()
        local iter, id = initFunc()
        if not id or id == 0 then
            disposeFunc(iter)
            return
        end

        local enum = { handle = iter, destructor = disposeFunc }
        setmetatable(enum, entityEnumerator)

        local next = true
        repeat
            coroutine.yield(id)
            next, id = moveFunc(iter)
        until not next

        enum.destructor, enum.handle = nil, nil
        disposeFunc(iter)
    end)
end

function EnumerateVehicles()
    return EnumerateEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
end

function GetVehicles()
    local vehicles = {}

    for vehicle in EnumerateVehicles() do
        table.insert(vehicles, vehicle)
    end

    return vehicles
end

function GetClosestVehicle(coords)
    local vehicles = GetVehicles()
    local closestDistance = -1
    local closestVehicle = -1
    local coords = coords

    if coords == nil then
        local playerPed = PlayerPedId()
        coords = GetEntityCoords(playerPed)
    end

    for i = 1, #vehicles, 1 do
        local vehicleCoords = GetEntityCoords(vehicles[i])
        local distance = GetDistanceBetweenCoords(vehicleCoords, coords.x, coords.y, coords.z, true)

        if closestDistance == -1 or closestDistance > distance then
            closestVehicle = vehicles[i]
            closestDistance = distance
        end
    end

    return closestVehicle, closestDistance
end

function DrawInstructionBarNotification(x, y, z, text)
	local px, py, pz = table.unpack(GetEntityCoords(PlayerPedId()))

	local distance = GetDistanceBetweenCoords(x, y, z, px, py, pz, false)

	if distance <= 6 then
		SetTextScale(0.35, 0.35)
		SetTextFont(4)
		SetTextProportional(1)
		SetTextColour(255, 255, 255, 215)
		SetTextEntry("STRING")
		SetTextCentre(true)
		AddTextComponentString(text)
		SetDrawOrigin(x,y,z, 0)
		DrawText(0.0, 0.0)
		local factor = (string.len(text)) / 370
		DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
		ClearDrawOrigin()
	end
end

function stopprevue()
    RenderScriptCams(0, 0, 500, 0, 0)
    TriggerEvent("InitCamModulePause", false)
    DeleteEntity(tempVeh)
    tempVeh = nil
    tempModel = nil
    DestroyAllCams(true)
end

function RespawnPed(ped, spawn)
	SetEntityCoordsNoOffset(ped, spawn.coords, false, false, false, true)
	NetworkResurrectLocalPlayer(spawn.coords, spawn.heading, true, false)
	LSLIFE_UTILS:SetPlayerInvincible(false)
	SetPlayerInvincible(ped, false)
	TriggerEvent('playerSpawned', spawn)
	ClearPedBloodDamage(ped)
end

-- local isPreviewEnabled = false
-- local sin = math.sin
-- local cos = math.cos
-- local torad = math.pi / 180

-- function GetCoordsFromGamePlayCameraPointAtSynced(ingoredEntity)
--     local action = 0
--     local distance = 1000
--     local coordsVector =  GetFinalRenderedCamCoord() ;
--     local rotationVectorUnrad = GetFinalRenderedCamRot(2);
--     local rotationVector = rotationVectorUnrad * torad
--     local directionVector =  vector3(-sin(rotationVector.z) * cos(rotationVector.x), (cos(rotationVector.z) * cos(rotationVector.x)), sin(rotationVector.x));
--     local destination =  coordsVector + directionVector * distance ;
--     local destination_temp = coordsVector + directionVector * 1 ;
--     local getentitytype = function(entity)
--        local type = GetEntityType(entity)
--        local result = "solid"
--      result = "object"
--        return result
--     end

--     if StartExpensiveSynchronousShapeTestLosProbe then 
--         local shapeTestId = StartExpensiveSynchronousShapeTestLosProbe(destination_temp, destination, 511, ingoredEntity or Player.playerPed, 4)
--         local shapeTestResult , hit , endCoords , surfaceNormal , entityHit = GetShapeTestResult(shapeTestId)
--         ground, newZ = GetGroundZFor_3dCoord(endCoords.x, endCoords.y, endCoords.z + 0.5)

--         return hit and vector3(endCoords.x, endCoords.y, newZ or endCoords.z)
--     end
-- end

-- function handlePreviewEventEntity(model, entity_type)
--     local entity = nil

--     entity_type = 'vehicle'

--     if entity_type == 'vehicle' then
--         ESX.Game.SpawnLocalObject(model, GetEntityCoords(PlayerPedId()), function(vehicle)
--             entity = vehicle
--             SetEntityCollision(vehicle, false)
--         end)
--     end

--     while not DoesEntityExist(entity) do
--         Wait(10)
--     end

--     return entity
-- end

function KeyboardInput(title)
    KeyboardUtils.use(title, function(data)
        return data
    end)
end