Elevator = {
    positions = {
        {label = 'Rez de chaussez', position = vector3(-442.1762, -343.3515, 35.00521), t = 'ems'},
        {label = 'Héliport', position = vector3(-443.9101, -331.9694, 78.16806), t = 'ems'},
        {label = 'Parking', position = vector3(-418.9642, -344.9644, 24.23131), t = 'ems'},
    },

    acceuil = {
        pos = {
            ['LSPD'] = {
                pos = vector3(834.8361, -1291.131, 28.24493),
                message = 'Un personnel de la LSPD est attendu à l\'accueil',
                job = 'police'
            },
            ['BCSO'] = {
                pos = vector3(-446.5594, 6012.762, 31.70),
                message = 'Un personnel de la BCSO est attendu à l\'accueil',
                job = 'bcso'
            },
            ['EMS'] = {
                pos = vector3(-435.9615, -325.9712, 34.91082),
                message = 'Un personnel des EMS est attendu à l\'accueil',
                job = 'ambulance'
            }
        },
        cooldown = false
    }
}

function Elevator:openMenu(table, t)
    local main = RageUI.CreateMenu('', 'ascenseur')

    RageUI.Visible(main, not RageUI.Visible(main))
    FreezeEntityPosition(PlayerPedId(), true)
    while main do Wait(1)
        RageUI.IsVisible(main, function()
            for k,v in ipairs(table) do
                if v.t == t then
                    RageUI.Button(v.label, nil, {}, true, {
                        onSelected = function()
                            DoScreenFadeOut(1300)
                            RageUI.CloseAll()
                            Wait(2300)
                            SetEntityCoords(Player.playerPed, v.position)
                            DoScreenFadeIn(1300)
                        end
                    })
                end
            end
        end)

        if not RageUI.Visible(main) then
            main = RMenu:DeleteType('main')
            FreezeEntityPosition(PlayerPedId(), false)
        end
    end
end

function Elevator:openAcceuilMenu(job, message)
   local main = RageUI.CreateMenu('', 'Acceuil')

    RageUI.Visible(main, not RageUI.Visible(main))

    while main do Wait(1)
        RageUI.IsVisible(main, function()
            RageUI.Button('Appeler le personnel', nil, {}, not Elevator.acceuil.cooldown, {
                onSelected = function()
                    TriggerServerEvent('zmain:acceuil:sendAnnounce', job, message)

                    Elevator.acceuil.cooldown = true
                    SetTimeout(120000, function()
                        Elevator.acceuil.cooldown = false
                    end)
                end
            })
        end)

        if not RageUI.Visible(main) then
            main = RMenu:DeleteType('main')
        end
    end
end

CreateThread(function()
    local interval = 2000
    while true do
        Wait(interval)

        interval = 2000

        for k,v in pairs(Elevator.positions) do
            
            local dist = #(GetEntityCoords(PlayerPedId())-vector3(v.position.x, v.position.y, v.position.z))

            if dist > 5 then goto continue end

            interval = 1

            DrawMarker(25, v.position.x, v.position.y, v.position.z-0.98, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.55, 0.55, 0.55, tonumber(UTILS.ServerColor.r), tonumber(UTILS.ServerColor.g), tonumber(UTILS.ServerColor.b), 255, false, false, 2, false, false, false, false)

            if dist < 1 then
                DrawInstructionBarNotification(v.position.x, v.position.y, v.position.z, "Appuyez sur [ ~g~E~w~ ] pour intéragir")
                if IsControlJustPressed(1,51) then
                    Elevator:openMenu(Elevator.positions, v.t)
                end
            end

            ::continue::
        end

        for k,v in pairs(Elevator.acceuil.pos) do 
            local dist = #(GetEntityCoords(PlayerPedId())-vector3(v.pos.x, v.pos.y, v.pos.z))

            if dist > 5 then goto con end

            interval = 1

            DrawMarker(25, v.pos.x, v.pos.y, v.pos.z-0.98, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.55, 0.55, 0.55, tonumber(UTILS.ServerColor.r), tonumber(UTILS.ServerColor.g), tonumber(UTILS.ServerColor.b), 255, false, false, 2, false, false, false, false)

            if dist < 1 then
                DrawInstructionBarNotification(v.pos.x, v.pos.y, v.pos.z, "Appuyez sur [ ~g~E~w~ ] pour intéragir")
                if IsControlJustPressed(1,51) then
                    Elevator:openAcceuilMenu(v.job, v.message)
                end
            end

            ::con::
        end
    end
end)