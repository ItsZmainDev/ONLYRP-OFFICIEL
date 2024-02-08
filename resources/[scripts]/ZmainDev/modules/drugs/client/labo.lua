CreateThread(function()
    while not ESXLoaded do Wait(1) end

    local _LabsSystem = {}
    _LabsSystem.labsList = adminManagement.CreateDrugs.Laboratory.list
    _LabsSystem.list = {}
    _LabsSystem.init = false
    _LabsSystem.isInLab = false


    CreateThread(function()
        Wait(1000)
        TriggerServerEvent('zmain:labs:fetchAll')
        TriggerServerEvent('zmain:labs:requireLabsInteriors', _LabsSystem.labsList)
    end)

    RegisterNetEvent('zmain:labs:recieve', function(labs)
        _LabsSystem.list = labs
        _LabsSystem.init = true
    end)

    CreateThread(function()
        while not _LabsSystem.init do Wait(1) end

        _LabsSystem.interval = 2000

        while _LabsSystem.init == true do 

            Wait(_LabsSystem.interval)

            _LabsSystem.interval = 2000

            if not _LabsSystem.isInLab then
                for k,v in pairs(_LabsSystem.list) do
                    local dist = #(Player.coords-vector3(v.pos.x, v.pos.y, v.pos.z))
    
                    if dist > 8 then goto continue end
    
                    _LabsSystem.interval = 1
    
                    DrawMarker(25, v.pos.x, v.pos.y, v.pos.z-0.98, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.55, 0.55, 0.55, tonumber(UTILS.ServerColor.r), tonumber(UTILS.ServerColor.g), tonumber(UTILS.ServerColor.b), 255, false, false, 2, false, false, false, false)
    
                    if dist < 2 then
                        DrawInstructionBarNotification(v.pos.x, v.pos.y, v.pos.z, '[~p~E~s~] Entrer dans le laboratoire')
    
                        if IsControlJustPressed(0, 54) then
                            TriggerServerEvent('zmain:labs:enter', v.id)
                        end
                    end
    
                    ::continue::
                end
            end
         end
    end)

    function _LabsSystem:openManagementMenu(id)
        local main = RageUI.CreateMenu('', 'Actions Disponibles sur le laboratoire')

        RequestAnimDict("anim@amb@warehouse@laptop@")
        repeat Wait(0) until HasAnimDictLoaded("anim@amb@warehouse@laptop@")
        TaskPlayAnim(Player.playerPed, "anim@amb@warehouse@laptop@", "idle_a", 1.0, 1.0, -1, 1, 1.0, 0, 0, 0)

        RageUI.Visible(main, not RageUI.Visible(main))
        while main do Wait(1)
            RageUI.IsVisible(main, function()
                
            end)

            if not RageUI.Visible(main) then
                main = RMenu:DeleteType('main')
                ClearPedTasks(Player.playerPed)
            end
        end
    end

    RegisterNetEvent('zmain:labs:enter', function(type, exitCoords, id)
        local laboratory = _LabsSystem.labsList[type]

        if laboratory.ipls then
            local interiorID = GetInteriorAtCoords(laboratory.interiorAtCoords.x, laboratory.interiorAtCoords.y, laboratory.interiorAtCoords.z)

            if IsValidInterior(interiorID) then
                PinInteriorInMemory(interiorID)
    
                for index,propName in pairs(laboratory.iplsList) do
                    DeactivateInteriorEntitySet(interiorID, propName)
                end
    
                RefreshInterior(interiorID)
            end
        end

        _LabsSystem.isInLab = true

        DoScreenFadeOut(1500)
        Wait(2000)
        SetEntityCoords(Player.playerPed, exitCoords)
        SetEntityHeading(Player.playerPed, laboratory.exitHeading)
        DoScreenFadeIn(1500)

        CreateThread(function()
            _LabsSystem.inLabInterval = 2000
            while _LabsSystem.isInLab == true do
                Wait(_LabsSystem.inLabInterval)
                _LabsSystem.inLabInterval = 2000

                for k,v in pairs(_LabsSystem.list) do
                    if v.id == id then
                        local dist = #(Player.coords-vector3(laboratory.exit.x, laboratory.exit.y, laboratory.exit.z))

                        local distpc = #(Player.coords-vector3(laboratory.management.x, laboratory.management.y, laboratory.management.z))

                        if distpc < 2 then
                            _LabsSystem.inLabInterval = 1
                            DrawInstructionBarNotification(laboratory.management.x, laboratory.management.y, laboratory.management.z+0.50, '[~p~E~s~] Ouvrir le pc')

                            if IsControlJustPressed(0,54) then
                                _LabsSystem:openManagementMenu(id)
                            end
                        end

                        if dist > 15 then goto continue end

                        _LabsSystem.inLabInterval = 1

                        DrawMarker(25, laboratory.exit.x, laboratory.exit.y, laboratory.exit.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.55, 0.55, 0.55, tonumber(UTILS.ServerColor.r), tonumber(UTILS.ServerColor.g), tonumber(UTILS.ServerColor.b), 255, false, false, 2, false, false, false, false)

                        if dist < 2 then
                            DrawInstructionBarNotification(laboratory.exit.x, laboratory.exit.y, laboratory.exit.z+1, '[~p~E~s~] Sortir du laboratoire')
        
                            if IsControlJustPressed(0, 54) then
                                TriggerServerEvent('zmain:labs:exit', v.id)
                            end
                        end
                    end
                end

                ::continue::
            end
        end)
    end)

    RegisterNetEvent('zmain:labs:exit', function(type, exitCoords, id)
        _LabsSystem.isInLab = false

        local laboratory = _LabsSystem.labsList[type]

        DoScreenFadeOut(1500)
        Wait(2000)
        SetEntityCoords(Player.playerPed, vector3(exitCoords.x, exitCoords.y, exitCoords.z))
        SetEntityHeading(Player.playerPed, 90.0)
        DoScreenFadeIn(1500)

    end)

    RegisterCommand('labs', function()
        TriggerServerEvent('zmain:labs:enter', 2)
    end)
end)