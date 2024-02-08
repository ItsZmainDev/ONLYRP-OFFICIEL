VIP = {
    data = {
        have = false,
        time = 0,
    },
    haveVip = function()
        return VIP.data.have
    end,

    entity = {
        sorted = false,
        entityid = nil,
        sitting = false,
        nameActive = false,
        name = {},
        followMe = false,
    },

    animals = {
        {label = 'Husky | chien loup', entityName = 'a_c_husky'}
    }
}

RegisterNetEvent('zmain:vip:refreshData', function(v)
    VIP.data = {}
    VIP.data = v

    ESX.ShowNotification(('Information VIP~s~\n\nVotre ~b~VIP~s~ prendra fin dans ~b~%s~s~ heure(s)'):format(VIP.data.time))
end)

RegisterNetEvent('zmain:vip:animals:sort', function(coords, entityName)
    if VIP.entity.sorted == true then return ESX.ShowNotification('🐕 Vous avez déjà un animal de sorti') end

    local ee = GetHashKey(entityName)
    ESX.Game.SpawnPed(1, entityName, vector3(coords.x, coords.y, coords.z), 90.0, function(ped)
            
        Entity(ped).state.entityId = ped

        VIP.entity.entityid = ped

        VIP.entity.sorted = true

        ESX.ShowNotification('🐕 Animal sorti avec succès')
    end)
end)

RegisterNetEvent('zmain:vip:animals:remove', function()
    CreateThread(function()
        if DoesEntityExist(VIP.entity.entityid) then
            DeleteEntity(VIP.entity.entityid)
        end

        VIP.entity.name[VIP.entity.entityid] = nil
        VIP.entity.sorted = false
        VIP.entity.entityId = nil
    end)

    ESX.ShowNotification('🐕 Animal rentré avec succès')
end)

local aTag = {}

RegisterNetEvent('zmain:animals:setName', function(entityId, name)
    CreateThread(function()
        VIP.entity.name[entityId] = {
            entityId = entityId,
            name = name,
            coords = GetEntityCoords(entityId)
        }
    end)
end)

Citizen.CreateThread(function()
    local interval = 2000
    while true do
        Wait(interval)
        interval = 2000

        for k,v in pairs(VIP.entity.name) do
            if DoesEntityExist(v.entityId) then
                dist = #(GetEntityCoords(PlayerPedId())-GetEntityCoords(v.entityId))
                if dist > 2 then goto continue end
            else
                break
            end
        
            interval = 1
    
            aTag[v.entityId] = CreateFakeMpGamerTag(v.entityId, ('%s | %s'):format('Animal', v.name), true, false, 'NPC', 1)
            SetMpGamerTagName(aTag[v.entityId], ('%s | %s'):format('Animal', v.name))
            SetMpGamerTagColour(aTag[v.entityId], 0, 34)
            SetMpGamerTagVisibility(aTag[v.entityId], 14, true)
            SetMpGamerTagColour(aTag[v.entityId], 14, 34)
            SetMpGamerTagAlpha(aTag[v.entityId], 14, 255)
            SetMpGamerTagHealthBarColor(aTag[v.entityId], 34)

            if dist > 2 then
                RemoveMpGamerTag(aTag[v.entityId])
            end
    
            if not DoesEntityExist(v.entityId) then
                RemoveMpGamerTag(aTag[v.entityId])
            end
    
            if not VIP.entity.name[k] then
                RemoveMpGamerTag(aTag[v.entityId])
            end
        end

        ::continue::
    end
end)

RegisterNetEvent('zmain:vip:animals:editName', function(entityId, newName)
    VIP.entity.name[entityId].name = newName
end)

RegisterNetEvent('zmain:vip:animals:removeName', function(entityID)
    VIP.entity.name[entityID] = nil
    RemoveMpGamerTag(aTag[entityID])
end)

RegisterNetEvent('zmain:vip:animals:followMe', function()
    VIP.entity.followMe = true

    local entityToFollow = Entity(VIP.entity.entityid).state.entityId
    local speed = 10.0
    
    while VIP.entity.followMe and DoesEntityExist(VIP.entity.entityid) do
        Wait(0)

        local playerPed = PlayerPedId()
        local playerPos = GetEntityCoords(playerPed)

        local entityPos = GetEntityCoords(entityToFollow)
        local distance = GetDistanceBetweenCoords(playerPos, entityPos, true)
        
        if distance > 3.0 then
            local direction = (playerPos - entityPos)
            local targetPos = entityPos + (direction * speed * 0.01)
            
            TaskGoStraightToCoord(entityToFollow, targetPos.x, targetPos.y, targetPos.z, speed, -1, GetEntityHeading(entityToFollow), 0.0)
        end

        if not VIP.entity.followMe then
            break
        end

        if not DoesEntityExist(VIP.entity.entityid) then
            break
        end
    end
end)

AddEventHandler('onResourceStop', function(rName)
    if GetCurrentResourceName() ~= rName then return end

    if VIP.entity.entityid ~= nil then
        if DoesEntityExist(Entity(VIP.entity.entityid).state.entityId) then
            DeleteEntity(Entity(VIP.entity.entityid).state.entityId)
        end
    end
end)

RegisterNetEvent('zmain:en:sertcoords', function(ped, coords)
    SetEntityCoords(ped, coords)
end)