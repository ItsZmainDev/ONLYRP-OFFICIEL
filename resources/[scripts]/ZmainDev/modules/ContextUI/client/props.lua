local PropsContextMenu = ContextUI:CreateMenu(3, "", nil, "commonmenu", "interaction_bgd")

ContextUI:IsVisible(PropsContextMenu, function(Entity)
    local dist = Vdist2(GetEntityCoords(PlayerPedId(), false), GetEntityCoords(Entity.ID))
    if dist < 5 then
        if Entity.Model == -870868698 or Entity.Model == -1126237515 or Entity.Model == -1364697528 then -- DISTRIBUTEUR
            ContextUI:Button("Retirer", nil, {}, function(onSelected)
                if (onSelected) then
                    KeyBoardUtils.use('Q', function(Argent)
                        if (Argent) then 
                            if tonumber(Argent) > 0 and tonumber(Argent) ~= nil then 

                            end
                        end
                    end)
                end
            end)
            ContextUI:Button("Déposer", nil, {}, function(onSelected)
                if (onSelected) then
                    KeyBoardUtils.use('Q', function(Argent)
                        if (Argent) then 
                            if tonumber(Argent) > 0 and tonumber(Argent) ~= nil then 

                            end
                        end
                    end)
                end
            end)
        end

        if Entity.Model == 690372739 then  --> Machine à café
            ContextUI:Button("Utiliser la machine ( 75$ )", nil, {}, function(onSelected)
                if (onSelected) then
                   
                end
            end)
            ContextUI:Button("Taper dans la machine", nil, {}, function(onSelected)
                if (onSelected) then
                   
                end
            end)
        end
    end
    if ESX.GetPlayerData()['group'] ~= 'user' then 
        ContextUI:Button("Print l\'id du props", nil, {}, function(onSelected)
            if (onSelected) then
                print(Entity.Model)
            end
        end)
    end
end)