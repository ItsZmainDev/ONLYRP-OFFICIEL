local buy = false
local zoomOffset     = 0.0
local camOffset      = 0.0
local heading        = 90.0
function OpenMenuBarberShop()
    local menu = RageUI.CreateMenu("Coiffeur", "Changez votre coupe de cheveux")
    RageUI.Visible(menu, not RageUI.Visible(menu))
	FreezeEntityPosition(Player.playerPed, true)
    local myHair = 1
    local myBeard = 1
    local myEyesbrow = 1
	local myBeard_opacity = 1
	local myBeard_color = 1
	local myHairColor = 1
	local myHairColor2 = 1
	local barber_eyesbrow = 1
	local barber_eyesbrow_opacity = 1
	local barber_eyebrow_color = 1
    TriggerEvent('skinchanger:getSkin', function(skin)
        myHair = skin.hair_1
		myHairColor = skin.hair_color_1 == 0 and 1 or skin.hair_color_1
		myHairColor2 = skin.hair_color_2 == 0 and 1 or skin.hair_color_2
        myBeard= skin.beard_1
        myEyesbrow = skin.eyebrows_1
		myBeard_opacity = skin.beard_2
		myBeard_color = skin.beard_3 == 0 and 1 or skin.beard_3
		barber_eyebrow = skin.eyebrows_1
		barber_eyesbrow_opacity = skin.eyebrows_2
		barber_eyebrow_color = skin.eyebrows_3
    end)
    local angle2 = 90
    CreateSkinCam()
    zoomOffset = 0.6
    camOffset = 0.65
	while menu do    
		Citizen.Wait(0)

        DisableControlAction(2, 30, true)
        DisableControlAction(2, 31, true)
        DisableControlAction(2, 32, true)
        DisableControlAction(2, 33, true)
        DisableControlAction(2, 34, true)
        DisableControlAction(2, 35, true)
        DisableControlAction(0, 25, true) -- Input Aim
        DisableControlAction(0, 24, true) -- Input Attack

        local playerPed = Player.playerPed
        local coords    = Player.coords

        local angle = heading * math.pi / 180.0
        local theta = {
            x = math.cos(angle),
            y = math.sin(angle)
        }

        local pos = {
            x = coords.x + (zoomOffset * theta.x),
            y = coords.y + (zoomOffset * theta.y)
        }

        local angleToLook = heading - 140.0
        if angleToLook > 360 then
            angleToLook = angleToLook - 360
        elseif angleToLook < 0 then
            angleToLook = angleToLook + 360
        end

        angleToLook = angleToLook * math.pi / 180.0
        local thetaToLook = {
            x = math.cos(angleToLook),
            y = math.sin(angleToLook)
        }

        local posToLook = {
            x = coords.x + (zoomOffset * thetaToLook.x),
            y = coords.y + (zoomOffset * thetaToLook.y)
        }

        SetCamCoord(cam, pos.x, pos.y, coords.z + camOffset)
        PointCamAtCoord(cam, posToLook.x, posToLook.y, coords.z + camOffset)
        DrawMissionText('appuyez sur ~b~[A]~s~ et ~b~[E]~s~ pour tourner la vue.', 500)

        if IsControlPressed(0, 52) then
            angle2 = angle2 - 1
        elseif IsControlPressed(0, 54) then
            angle2 = angle2 + 1
        end

        if angle2 > 360 then
            angle2 = angle2 - 360
        elseif angle2 < 0 then
            angle2 = angle2 + 360
        end

        heading = angle2 + 0.0

		RageUI.IsVisible(menu, function()
            barber_hair = {}
            for i = 1,GetNumberOfPedDrawableVariations(Player.playerPed, 2) - 1 do 
                table.insert(barber_hair, i)
            end
            RageUI.List("Cheveux", barber_hair, myHair, nil, {}, true, {
                onActive = function()

                end,
                onListChange = function (index)
                    myHair = index
                    TriggerEvent("skinchanger:change", "hair_1", myHair-1)
                end
            })
            barber_hair_color = {}
            for i = 1,GetNumHairColors()-1 do 
                table.insert(barber_hair_color, i)
            end
            RageUI.List("Couleur Cheveux", barber_hair_color, myHairColor, nil, {}, true, {
                onListChange = function (index)
                    myHairColor = index
                    TriggerEvent("skinchanger:change", "hair_color_1", myHairColor-1)
                end
            })
            RageUI.List("Couleur Cheveux 2", barber_hair_color, myHairColor2, nil, {}, true, {
                onListChange = function (index)
                    myHairColor2 = index
                    TriggerEvent("skinchanger:change", "hair_color_2", myHairColor2-1)
                end
            })
			beard_opacity_list = {}
            for i = 1,11 do 
                table.insert(beard_opacity_list, i)
            end
			RageUI.List("Opacité de la barbe", beard_opacity_list, myBeard_opacity, nil, {}, true, {
                onListChange = function(index)
                    myBeard_opacity = index 
                    TriggerEvent("skinchanger:change", "beard_2", myBeard_opacity-1)
                end
            })
            beard_list = {}
            for i = 1,GetNumberOfPedDrawableVariations(Player.playerPed, 1) - 1 do 
                table.insert(beard_list, i)
            end
            RageUI.List("Barbe", beard_list, myBeard, nil, {}, true, {
                onListChange = function(index)
                    myBeard = index 
                    TriggerEvent("skinchanger:change", "beard_1", myBeard-1)
                end
            })
            RageUI.List("Couleur de la barbe", barber_hair_color, myBeard_color, nil, {}, true, {
                onListChange = function(index)
                    myBeard_color = index 
                    TriggerEvent("skinchanger:change", "beard_3", myBeard_color-1)
                end
            })
            creator_eyesbrow = {}
            for i = 1,GetNumHeadOverlayValues(2)-1 do 
                table.insert(creator_eyesbrow, i)
            end
            creator_eyesbrow_opacity = {}
            for i = 1,11 do 
                table.insert(creator_eyesbrow_opacity, i)
            end
            RageUI.List("Opacité Sourcil", creator_eyesbrow_opacity, barber_eyesbrow_opacity, nil, {}, true, {
                onListChange = function(index) 
                    barber_eyesbrow_opacity = index 
                    TriggerEvent("skinchanger:change", "eyebrows_2", barber_eyesbrow_opacity-1)
                end,
            })
            RageUI.List("Sourcil", creator_eyesbrow, barber_eyebrow, nil, {}, true, {
                onActive = function()
                    zoomOffset = 0.6
                    camOffset = 0.65
                end,
                onListChange = function(index)
                    barber_eyebrow = index
                    TriggerEvent("skinchanger:change", "eyebrows_1", barber_eyebrow-1)
                end,
            })
            RageUI.List("Couleur Sourcil", barber_hair_color, barber_eyebrow_color, nil, {}, true, {
                onActive = function()
                    zoomOffset = 0.6
                    camOffset = 0.65
                end,
                onListChange = function(index)
                    barber_eyebrow_color = index
                    TriggerEvent("skinchanger:change", "eyebrows_3", barber_eyebrow_color-1)
                end,
            })
            RageUI.Button("Payer la coupe", nil, {RightLabel = "~g~80 $"}, true, {
                onSelected = function()
                    ESX.TriggerServerCallback("barber:getmoney", function(cb)
                        if cb == true then
                            buy = true
                            ESX.ShowAdvancedNotification('Only RP', "Barber Shop", "Vous avez payé votre coupe avec succès !\nA bientôt", 'icon', 8)
                            TriggerEvent('skinchanger:getSkin', function(skin)
                                TriggerServerEvent('esx_skin:save', skin)
                            end)
                            RageUI.CloseAll()
                        else
                            ESX.ShowAdvancedNotification('Only RP', "Barber Shop", "Vous ne disposez pas des fonds nécéssaires !", 'icon', 8)
                            ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                                TriggerEvent('skinchanger:loadSkin', skin)
                            end) 
                            RageUI.CloseAll()
                        end
                    end)
                end
            })
        end)

        if not RageUI.Visible(menu) then
            menu = RMenu:DeleteType('menu', true)
            if not buy then
                ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                    TriggerEvent('skinchanger:loadSkin', skin) 
                end)
            else
                buy = false
            end
			DeleteSkinCam()
			FreezeEntityPosition(Player.playerPed, false)
        end
    end
end

Citizen.CreateThread(function()
    while ESX == nil do Wait(1) end

    local positions = {
        {pos = vector3(-814.3, -183.8, 37.0)},
        {pos = vector3(136.8, -1708.4, 28.0)},
        {pos = vector3(-1282.6, -1116.8, 6.0)},
        {pos = vector3(1931.5, 3729.7, 32.0)},
        {pos = vector3(1212.8, -472.9, 65.0)},
        {pos = vector3(-32.9, -152.3, 56.0)},
        {pos = vector3(-278.1, 6228.5, 31.0)}
    }

    for k,v in pairs(positions) do
        AddZones(("barbershop_%s"):format(k), {
            Position = vector3(v.pos.x, v.pos.y, v.pos.z+0.60),
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
            marker = true,
            Action = function()
                OpenMenuBarberShop()
            end
        })

        ESX.addBlips({
            name = ("[SERVICE] Salon de Coiffure %s"):format(k),
            label = '[SERVICE] Salon de Coiffure',
            category = nil,
            position = vector3(v.pos.x, v.pos.y, v.pos.z),
            sprite = 71,
            display = 4,
            scale = 0.75,
            color = 21,
        })
    end
end)