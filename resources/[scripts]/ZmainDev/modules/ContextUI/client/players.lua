local PlayersContext = ContextUI:CreateMenu(1, "", nil, "commonmenu", "interaction_bgd")
local PlayersContextAnim = ContextUI:CreateSubMenu(PlayersContext, "", nil, "commonmenu", "interaction_bgd")
local PlayersContextPatron = ContextUI:CreateSubMenu(PlayersContext, "", nil, "commonmenu", "interaction_bgd")
local PlayersContextRecrutLegal = ContextUI:CreateSubMenu(PlayersContextPatron, "", nil, "commonmenu", "interaction_bgd")
local PlayersContextPromouvoirLegal = ContextUI:CreateSubMenu(PlayersContextPatron, "", nil, "commonmenu", "interaction_bgd")
local PlayersContextIllegal = ContextUI:CreateSubMenu(PlayersContext, "", nil, "commonmenu", "interaction_bgd")
local PlayersContextRecrutIlLegal = ContextUI:CreateSubMenu(PlayersContextIllegal, "", nil, "commonmenu", "interaction_bgd")
local PlayersContextPromouvoirIlLegal = ContextUI:CreateSubMenu(PlayersContextPatron, "", nil, "commonmenu", "interaction_bgd")
local PlayerContextRecruit = ContextUI:CreateSubMenu(PlayersContextPatron, "", nil, "commonmenu", "interaction_bgd")

local _GRADES = {}

ContextUI:IsVisible(PlayersContext, function(Entity)
    if Entity.ServerID ~= GetPlayerServerId(PlayerId()) and Entity.ServerID ~= 0 then 
        local dist = Vdist2(GetEntityCoords(PlayerPedId(), false), GetEntityCoords(Entity.ID))
        if dist < 5 then
            if Society:havePermission(ESX.PlayerData.job.name, 'recruit_player') then 
                ContextUI:Button("Gestion Entreprise", nil, {}, function(onSelected)
                    if (onSelected) then
            
                    end
                end, PlayersContextPatron)
            end
            if ESX.PlayerData.job2 ~= nil and ESX.PlayerData.job2.grade_name == "boss" then 
                ContextUI:Button("Gestion Illégal", nil, {}, function(onSelected)
                    if (onSelected) then
            
                    end
                end, PlayersContextIllegal)
            end
            ContextUI:Button("Porter", nil, {}, function(onSelected)
                if (onSelected) then
                    ExecuteCommand('porter')
                end
            end)
            ContextUI:Button("Otage", nil, {}, function(onSelected)
                if (onSelected) then
                    ExecuteCommand('takehostage')
                end
            end)
        end
    elseif Entity.ServerID == GetPlayerServerId(PlayerId()) and Entity.ServerID ~= 0 then
        ContextUI:Button("Animations rapide", nil, {}, function(onSelected)
            if (onSelected) then

            end
        end, PlayersContextAnim)
        ContextUI:Button("Pile ou Face", nil, {}, function(onSelected)
            if (onSelected) then
                ExecuteCommand('pileouface')
            end
        end)
        ContextUI:Button('Retirer mon kevlar', nil, {}, function(onSelected)
            if (onSelected) then
                TriggerServerEvent('zmain:RemoveKevlar')
            end
        end)
    elseif Entity.ServerID == 0 then 
        -- OUVERTURE DU MENU SUR LES PNJ
    end
end)

ContextUI:IsVisible(PlayersContextPatron, function(Entity)
    local dist = Vdist2(GetEntityCoords(PlayerPedId(), false), GetEntityCoords(Entity.ID))
    if dist < 5 then
        ContextUI:Button('Recruter', nil, {}, function(onSelected)
            if onSelected then

            end
        end, PlayerContextRecruit)
        ContextUI:Button('Virer', nil, {}, function(onSelected)
            if onSelected then
                local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
    
                if closestPlayer == -1 or closestDistance > 3.0 then
                    return ESX.ShowNotification('Personne aux alentours !')
                else
                    TriggerServerEvent('zmain:society:demote', ESX.PlayerData.job.name, {id = Entity.ServerID, job = {grade_name = 'player'}})
                end
            end
        end)
    end
end)

ContextUI:IsVisible(PlayerContextRecruit, function(Entity)
    local dist = Vdist2(GetEntityCoords(PlayerPedId(), false), GetEntityCoords(Entity.ID))
    if dist < 5 then
        local society = Society.List[ESX.GetPlayerData().job.name]

        if not society then return end

        for k,v in pairs(society.grades) do
            ContextUI:Button(v.label, nil, {}, function(onSelected)
                if onSelected then
                    TriggerServerEvent('zmain:society:recruit', society.name, Entity.ServerID, v.grade)
                end
            end)
        end
    end
end)

ContextUI:IsVisible(PlayersContextPromouvoirLegal, function(Entity)
    local dist = Vdist2(GetEntityCoords(PlayerPedId(), false), GetEntityCoords(Entity.ID))
    if dist < 5 then
        if json.encode(_GRADES) ~= '[]' then 
            for k,v in pairs(_GRADES) do 
                ContextUI:Button(v.label, nil, {}, function(onSelected)
                    if onSelected then
                        --TriggerServerEvent('zmain:updateJobPlayer', v.grade, Entity.ServerID)
                    end
                end)
            end
        end
    end
end)

ContextUI:IsVisible(PlayersContextIllegal, function(Entity)
    local dist = Vdist2(GetEntityCoords(PlayerPedId(), false), GetEntityCoords(Entity.ID))
    if dist < 5 then
        ContextUI:Button('Recruter', nil, {}, function(onSelected)
            if onSelected then
                TriggerServerEvent('zmain:gangs:recrute', Entity.ServerID, ESX.PlayerData.job2.name, 1)
            end
        end)
        ContextUI:Button('Virer', nil, {}, function(onSelected)
            if onSelected then
                TriggerServerEvent('zmain:gangs:virer', Entity.ServerID)
            end
        end)
    end
end)

ContextUI:IsVisible(PlayersContextPromouvoirIlLegal, function(Entity)
    local dist = Vdist2(GetEntityCoords(PlayerPedId(), false), GetEntityCoords(Entity.ID))
    if dist < 5 then
        if json.encode(_GRADES) ~= '[]' then 
            for k,v in pairs(_GRADES) do 
                ContextUI:Button(v.label, nil, {}, function(onSelected)
                    if onSelected then
                        --TriggerServerEvent('zmain:updateJobPlayer2', v.grade, Entity.ServerID)
                    end
                end)
            end
        end
    end
end)

ContextUI:IsVisible(PlayersContextAnim, function(Entity)
    ContextUI:Button('Stop Animation', nil, {}, function(onSelected)
        if onSelected then
            --DestroyAllProps()
            ClearPedTasks(PlayerPedId())
            ClearPedSecondaryTask(PlayerPedId())
        end
    end)
    ContextUI:Button('Custom', nil, {}, function(onSelected)
        if onSelected then
            KeyboardUtils.use('Nom', function(animation)
                if (animation) then 
                    ExecuteCommand('e '..animation)
                end
            end)
        end
    end)
    ContextUI:Button('Doigt d\'honneur', nil, {}, function(onSelected)
        if onSelected then
            ExecuteCommand('e finger')
        end
    end)
    ContextUI:Button('S\'asseoir ( Sol )', nil, {}, function(onSelected)
        if onSelected then
            ExecuteCommand('e sit')
        end
    end)
    ContextUI:Button('S\'asseoir ( Chaise )', nil, {}, function(onSelected)
        if onSelected then
            ExecuteCommand('e sitchair')
        end
    end)
    ContextUI:Button('Tarte', nil, {}, function(onSelected)
        if onSelected then
            ExecuteCommand('e slap')
        end
    end)
end)

--Citizen.CreateThread(function()
--    while true do
--        Citizen.Wait(500)
--        if IsControlJustPressed(0, 19) then
--            ContextUI.Focus = true
--        end
--
--        if IsDisabledControlReleased(0, 19) then
--            ContextUI.Focus = false
--        end
--    end
--end)