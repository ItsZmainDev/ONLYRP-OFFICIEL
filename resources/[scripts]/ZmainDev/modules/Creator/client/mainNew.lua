local zoomOffset     = 0.0
local camOffset      = 0.0
local heading        = 90.0

RegisterNetEvent('zmain:createPlayer')
AddEventHandler('zmain:createPlayer', function()
    SetEntityCoords(PlayerPedId(), vector3(-2067.581, -1023.693, 10.90958))
    SetEntityHeading(PlayerPedId(), 252.43782043457)
    TriggerServerEvent('zmain:caca:setInstance')
    local mainMenu = RageUI.CreateMenu("", "Bienvenue sur Only'RP")

    local openInfoMenu = RageUI.CreateSubMenu(mainMenu, '', 'Bienvenue sur Only\'RP')

    local openSimpleSkin = RageUI.CreateSubMenu(mainMenu, "", "Bienvenue sur Only'RP")

    mainMenu.Closable = false

    local validateee = false

    RageUI.Visible(mainMenu, not RageUI.Visible(mainMenu))

    SetEntityRagdoll = true

    local CREATOR_DATA = {
        firstname = nil,
        lastname = nil,
        age = nil,
        sex = nil,
        height = nil,
    }
    
    local creator_head = {}
    local creator_head_index = 1
    local creator_skin = {}
    local creator_skin_index = 1
    local creator_hair = {}
    local creator_hair_index = 1
    local creator_hair_color1 = {}
    local creator_hair_color_index = 1
    local creator_hair_color2_index = 1
    local creator_eyes_color_index = 1
    local creator_eyes = {}
    local creator_eyesbrow_index = 1
    local creator_percent_eyesbrow = 0
    local creator_eyesbrow_opacity_index = 1
    local creator_eyesbrow_color_index = 1
    local creator_chest_opacity_index = 1
    local creator_chest_index = 1
    local creator_chest_color_index = 1
    local creator_beard_opacity = 1
    local creator_beard = 1
    local creator_beard_color = 1
    local angle2 = 90
    CreateSkinCam()
    zoomOffset = 0.6
    camOffset = 0.65
    local inEyesBrow = false
    while mainMenu do 
        Wait(0)
        FreezeEntityPosition(PlayerPedId(), true)

        DisableControlAction(2, 30, true)
        DisableControlAction(2, 31, true)
        DisableControlAction(2, 32, true)
        DisableControlAction(2, 33, true)
        DisableControlAction(2, 34, true)
        DisableControlAction(2, 35, true)
        DisableControlAction(0, 25, true) -- Input Aim
        DisableControlAction(0, 24, true) -- Input Attack

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
        DrawMissionText('Appuyez sur ~y~[A]~s~ et ~y~[E]~s~ pour tourner la vue.', 500)

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

        RageUI.IsVisible(mainMenu, function()
            RageUI.Button('Mes informations', nil, {}, not validateee, {
                onSelected = function()
                    
                end
            }, openInfoMenu)
            RageUI.Button('Mon apparence', nil, {}, validateee, {
                onSelected = function()
                    
                end
            }, openSimpleSkin)
            RageUI.WLine()
            RageUI.Button('Commencer mon aventure', nil, {}, validateee, {
                onSelected = function()
                    IsInPersoMenu = false
                    TriggerEvent('skinchanger:getSkin', function(skin)
                        TriggerServerEvent('esx_skin:save', skin)
                    end)
                    DeleteSkinCam()
                    RageUI.CloseAll()
                    local model = GetEntityModel(PlayerPedId())
                    if (CREATOR_DATA.sex == 'm') then 
                        TriggerEvent('skinchanger:getSkin', function(skin)
                            local clothesSkin = {
                                ['tshirt_1'] = 15, ['tshirt_2'] = 0,
                                ['torso_1'] = 665, ['torso_2'] = 0,
                                ['arms'] = 0,
                                ['pants_1'] = 220, ['pants_2'] = 0,
                                ['shoes_1'] = 141, ['shoes_2'] = 3,
                                ['bags_1'] = 0, ['bags_2'] = 0,
                                ['helmet_1'] = -1, ['helmet_2'] = 0,
                                ['mask_1'] = 0, ['mask_2'] = 0,
                            }
                            TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)

                            TriggerServerEvent('esx_skin:save', skin)

                            TriggerServerEvent('esx_skin:save', skin)

                            TriggerServerEvent('creator:finishPersonnage', skin)
                        end)
                        TriggerEvent('skinchanger:getSkin', function(skin)
                            TriggerServerEvent("cClothes:saveClothes", "tenue", skin, 1, 'Tenue de spawn', false, 'spawn')
                        end)
                    else
                        TriggerEvent('skinchanger:getSkin', function(skin)
                            local clothesSkin = {
                                ['tshirt_1'] = 57, ['tshirt_2'] = 0,
                                ['torso_1'] = 7, ['torso_2'] = 0,
                                ['arms'] = 3,
                                ['pants_1'] = 112, ['pants_2'] = 2,
                                ['shoes_1'] = 132, ['shoes_2'] = 0,
                                ['bags_1'] = 0, ['bags_2'] = 0,
                                ['helmet_1'] = -1, ['helmet_2'] = 0,
                                ['mask_1'] = 0, ['mask_2'] = 0,
                            }
                            TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)

                            TriggerServerEvent('esx_skin:save', skin)

                            TriggerServerEvent('esx_skin:save', skin)

                            TriggerServerEvent('creator:finishPersonnage', skin)
                        end)
                        TriggerEvent('skinchanger:getSkin', function(skin)
                            TriggerServerEvent("cClothes:saveClothes", "tenue", skin, 1, 'Tenue de spawn', false, 'spawn')
                        end)
                    end

                    bateau()
                end
            })
        end)

        RageUI.IsVisible(openInfoMenu, function()
            RageUI.Button('Prénom', nil, {RightLabel = CREATOR_DATA.firstname == nil and '' or CREATOR_DATA.firstname}, true, {
                onSelected = function()
                    KeyboardUtils.use("Indiquer votre prénom",function(data) 
                        CREATOR_DATA.firstname = data
                    end);
                end
            })
            RageUI.Button('Nom', nil, {RightLabel = CREATOR_DATA.lastname == nil and '' or CREATOR_DATA.lastname}, true, {
                onSelected = function()
                    KeyboardUtils.use("Indiquer votre Nom",function(data) 
                        CREATOR_DATA.lastname = data
                    end);
                end
            }) 
            RageUI.Button('Age', nil, {RightLabel = CREATOR_DATA.age == nil and '' or CREATOR_DATA.age}, true, {
                onSelected = function()
                    KeyboardUtils.use("Indiquer votre âge",function(data) 
                        CREATOR_DATA.age = data
                    end);
                end
            })
            RageUI.Button('Taille (130-200)', nil, {RightLabel = CREATOR_DATA.height == nil and '' or CREATOR_DATA.height}, true, {
                onSelected = function()
                    KeyboardUtils.use("Indiquer votre Taille",function(data) 
                        CREATOR_DATA.height = data
                    end);
                end
            })
            RageUI.Button('Sexe (m/f)', nil, {RightLabel = CREATOR_DATA.sex == nil and '' or CREATOR_DATA.sex}, true, {
                onSelected = function()
                    KeyboardUtils.use("Indiquer votre Sexe",function(data) 
                        CREATOR_DATA.sex = data
                    end);
                end
            })
            local colorCode = false
            if (CREATOR_DATA.firstname and CREATOR_DATA.lastname and CREATOR_DATA.age and CREATOR_DATA.height and CREATOR_DATA.sex) then 
                colorCode = true
            else
                colorCode = false
            end
            local backgroundColorButton = colorCode == true and {0,229,31,150} or {252,0,0,150}
            RageUI.Button('Confirmer', nil, {Color = {BackgroundColor = backgroundColorButton}}, colorCode, {
                onSelected = function()
                    validateee = true
                    if type(CREATOR_DATA.firstname) ~= 'string' then 
                        ESX.ShowNotification('Votre Prénom n\'est pas valide')
                        validateee = false
                    else
                        if string.match(CREATOR_DATA.firstname, '%d') then
                            ESX.ShowNotification('Votre Prénom n\'est pas valide')
                            validateee = false
                        end
                    end
                    if type(CREATOR_DATA.lastname) ~= 'string' then 
                        ESX.ShowNotification('Votre Nom n\'est pas valide')
                        validateee = false
                    else
                        if string.match(CREATOR_DATA.lastname, '%d') then
                            ESX.ShowNotification('Votre Nom n\'est pas valide')
                            validateee = false
                        end
                    end
                    CREATOR_DATA.age = tonumber(CREATOR_DATA.age)
                    if type(CREATOR_DATA.age) ~= 'number' then 
                        ESX.ShowNotification('Votre âge n\'est pas valide')
                        validateee = false
                    else
                        if CREATOR_DATA.age >= 100 then 
                            ESX.ShowNotification('Votre âge n\'est pas valide')
                            validateee = false
                        end
                    end
                    CREATOR_DATA.height = tonumber(CREATOR_DATA.height)
                    if type(CREATOR_DATA.height) ~= 'number' then 
                        ESX.ShowNotification('Votre taille n\'est pas valide')
                        validateee = false
                    else
                        if CREATOR_DATA.height < 130 and CREATOR_DATA.height > 200 then 
                            ESX.ShowNotification('Votre taille n\'est pas valide')
                            validateee = false
                        end
                    end
                    if CREATOR_DATA.sex ~= 'm' and CREATOR_DATA.sex ~= 'f' then 
                        ESX.ShowNotification('Votre Sexe n\'est pas valide')
                        validateee = false
                    end
                    if (validateee) then 
                        local playerModel = nil
                        if (CREATOR_DATA.sex) == 'm' then 
                            print('HOMME')
                            TriggerEvent('skinchanger:loadSkin', {sex = 0})
                        elseif (CREATOR_DATA.sex) == 'f' then
                            print('FEMME')
                            TriggerEvent('skinchanger:loadSkin', {sex = 1})
                        end
                    end
                end
            }, function()
                Wait(250)
                creator_head = {}
                creator_skin = {}
                for i = 1, 46 do 
                    table.insert(creator_head, i)
                    table.insert(creator_skin, i)
                end
                if (CREATOR_DATA.sex == 'm') then 
                    TriggerEvent('skinchanger:getSkin', function(skin)
                        local clothesSkin = {
                            ['tshirt_1'] = 15, ['tshirt_2'] = 0,
                            ['torso_1'] = 91, ['torso_2'] = 0,
                            ['arms'] = 15,
                            ['pants_1'] = 21, ['pants_2'] = 0,
                            ['shoes_1'] = 34, ['shoes_2'] = 0,
                            ['bags_1'] = 0, ['bags_2'] = 0,
                            ['helmet_1'] = -1, ['helmet_2'] = 0,
                            ['mask_1'] = 0, ['mask_2'] = 0,
                            ['glasses_1'] = 0, ['glasses_2'] = 0,
                            ['chains_1'] = 0, ['chains_2'] = 0,
                            ['bproof_1'] = 0, ['bproof_2'] = 0,
                            ['bracelets_1'] = -1, ['bracelets_2'] = 0
                        }
                        TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
                    end)
                else
                    local clothesSkin = {
                        ['glasses_1'] = 0, ['glasses_2'] = 0,
                    }
                    TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
                end
                RageUI.GoBack()
            end)
        end)

        RageUI.IsVisible(openSimpleSkin, function()
            DisableControlAction(2, 30, true)
            DisableControlAction(2, 31, true)
            DisableControlAction(2, 32, true)
            DisableControlAction(2, 33, true)
            DisableControlAction(2, 34, true)
            DisableControlAction(2, 35, true)
            DisableControlAction(0, 25, true) -- Input Aim
            DisableControlAction(0, 24, true) -- Input Attack
    
            openSimpleSkin.EnableMouse = false
            inEyesBrow = false
            RageUI.List("Visage", creator_head, creator_head_index, nil, {}, true, {
                onActive = function()
                    zoomOffset = 0.6
                    camOffset = 0.65
                end,
                onListChange = function (index)
                    creator_head_index = index
                    TriggerEvent("skinchanger:change", "mom", creator_head_index-1)
                end
            })
            RageUI.List("Peau", creator_skin, creator_skin_index, nil, {}, true, {
                onActive = function()
                    zoomOffset = 0.6
                    camOffset = 0.65
                end,
                onListChange = function (index)
                    creator_skin_index = index
                    TriggerEvent("skinchanger:change", "dad", creator_skin_index-1)
                end
            })
            creator_hair = {}
            for i = 1,GetNumberOfPedDrawableVariations(PlayerPedId(), 2) - 1 do
                table.insert(creator_hair, i)
            end
            RageUI.List("Cheveux", creator_hair, creator_hair_index, nil, {}, true, {
                onActive = function()
                    zoomOffset = 0.6
                    camOffset = 0.65
                end,
                onListChange = function (index)
                    creator_hair_index = index
                    TriggerEvent("skinchanger:change", "hair_1", creator_hair_index-1)
                end
            })
            creator_hair_color1 = {}
            for i = 1,GetNumHairColors()-1 do 
                table.insert(creator_hair_color1, i)
            end
            RageUI.List("Couleur Cheveux", creator_hair_color1, creator_hair_color_index, nil, {}, true, {
                onActive = function()
                    zoomOffset = 0.6
                    camOffset = 0.65
                end,
                onListChange = function (index)
                    creator_hair_color_index = index
                    TriggerEvent("skinchanger:change", "hair_color_1", creator_hair_color_index-1)
                end
            })
            RageUI.List("Couleur Cheveux 2", creator_hair_color1, creator_hair_color2_index, nil, {}, true, {
                onActive = function()
                    zoomOffset = 0.6
                    camOffset = 0.65
                end,
                onListChange = function (index)
                    creator_hair_color2_index = index
                    TriggerEvent("skinchanger:change", "hair_color_2", creator_hair_color2_index-1)
                end
            })
            creator_beard_list = {}
            for i = 1,11 do 
                table.insert(creator_beard_list, i)
            end
			RageUI.List("Opacité de la barbe", creator_beard_list, creator_beard_opacity, nil, {}, true, {
                onListChange = function(index)
                    creator_beard_opacity = index 
                    TriggerEvent("skinchanger:change", "beard_2", creator_beard_opacity-1)
                end
            })
            beard_list = {}
            for i = 1,GetNumberOfPedDrawableVariations(PlayerPedId(), 1) - 1 do 
                table.insert(beard_list, i)
            end
            RageUI.List("Barbe", beard_list, creator_beard, nil, {}, true, {
                onListChange = function(index)
                    creator_beard = index 
                    TriggerEvent("skinchanger:change", "beard_1", creator_beard-1)
                end
            })
            RageUI.List("Couleur de la barbe", creator_hair_color1, creator_beard_color, nil, {}, true, {
                onListChange = function(index)
                    creator_beard_color = index 
                    TriggerEvent("skinchanger:change", "beard_3", creator_beard_color-1)
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
            RageUI.List("Opacité Sourcil", creator_eyesbrow_opacity, creator_eyesbrow_opacity_index, nil, {}, true, {
                onActive = function()
                    zoomOffset = 0.6
                    camOffset = 0.65
                end,
                onListChange = function(index)
                    creator_eyesbrow_opacity_index = index
                    TriggerEvent("skinchanger:change", "eyebrows_2", creator_eyesbrow_opacity_index-1)
                end,
            })
            RageUI.List("Sourcil", creator_eyesbrow, creator_eyesbrow_index, nil, {}, true, {
                onActive = function()
                    zoomOffset = 0.6
                    camOffset = 0.65
                end,
                onListChange = function(index)
                    creator_eyesbrow_index = index
                    TriggerEvent("skinchanger:change", "eyebrows_1", creator_eyesbrow_index-1)
                end,
            })
            RageUI.List("Couleur Sourcil", creator_hair_color1, creator_eyesbrow_color_index, nil, {}, true, {
                onActive = function()
                    zoomOffset = 0.6
                    camOffset = 0.65
                end,
                onListChange = function(index)
                    creator_eyesbrow_color_index = index
                    TriggerEvent("skinchanger:change", "eyebrows_3", creator_eyesbrow_color_index-1)
                end,
            })
            creator_chest_hair_opacity = {}
            for i = 1,11 do 
                table.insert(creator_chest_hair_opacity, i)
            end
            RageUI.List("Opacité Pillosité torse", creator_chest_hair_opacity, creator_chest_opacity_index, nil, {}, true, {
                onActive = function()
                    zoomOffset = 0.75
                    camOffset = 0.15
                end,
                onListChange = function(index)
                    creator_chest_opacity_index = index
                    TriggerEvent("skinchanger:change", "chest_2", creator_chest_opacity_index-1)
                end,
            })
            creator_chest_hair_opacity = {}
            for i = 1,GetNumHeadOverlayValues(10)-1 do 
                table.insert(creator_chest_hair_opacity, i)
            end
            RageUI.List("Pillosité torse", creator_chest_hair_opacity, creator_chest_index, nil, {}, true, {
                onActive = function()
                    zoomOffset = 0.75
                    camOffset = 0.15
                end,
                onListChange = function(index)
                    creator_chest_index = index
                    TriggerEvent("skinchanger:change", "chest_1", creator_chest_index-1)
                end,
            })
            RageUI.List("Couleur Pillosité torse", creator_hair, creator_chest_color_index, nil, {}, true, {
                onActive = function()
                    zoomOffset = 0.75
                    camOffset = 0.15
                end,
                onListChange = function(index)
                    creator_chest_color_index = index
                    TriggerEvent("skinchanger:change", "chest_3", creator_chest_color_index-1)
                end,
            })
            RageUI.List("Couleur des yeux", creator_eyes, creator_eyes_color_index, nil, {}, true, {
                onActive = function()
                    zoomOffset = 0.75
                    camOffset = 0.15
                end,
                onListChange = function(index)
                    creator_eyes_color_index = index
                    TriggerEvent("skinchanger:change", "eye_color", creator_eyes_color_index-1)
                end,
            })
        end)
        
        if not RageUI.Visible(mainMenu) and not RageUI.Visible(optionFaceMenu) and not RageUI.Visible(openSimpleSkin) and not RageUI.Visible(openInfoMenu) then 
            mainMenu = RMenu:DeleteType("mainMenu")
            IsInPersoMenu = false

            FreezeEntityPosition(PlayerPedId(), false)

            SetEntityRagdoll = false

            TriggerServerEvent('zmain:creator:save:identity', CREATOR_DATA)
        end
    end
end)

function CreateSkinCam()
	if not DoesCamExist(cam) then
		cam = CreateCam('DEFAULT_SCRIPTED_CAMERA', true)
	end

	SetCamActive(cam, true)
	RenderScriptCams(true, true, 500, true, true)

	isCameraActive = true
	SetCamRot(cam, 0.0, 0.0, 270.0, true)
	SetEntityHeading(PlayerPedId(), 360.0)
end

function DeleteSkinCam()
	isCameraActive = false
	SetCamActive(cam, false)
	RenderScriptCams(false, true, 500, true, true)
	cam = nil
end

AddEventHandler('playerSpawned', function()
    ExecuteCommand('profile_fpsFieldOfView 100')
	Citizen.CreateThread(function()
        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
            if skin == nil or json.encode(skin) == '[]' then
                TriggerEvent('zmain:createPlayer')
            end
        end)
	end)
end)