---@class Gangs
Gangs = {
    admin = {
        command_create = {['fondateur'] = true, ['responsable'] = true, ['superadmin'] = true},
        data_create = {
            list = {
                TypeIndex = 1,
                TypeData = {'Gang', 'Orga'},

                BlipIndex = 1,
                BlipData = {'Bleu', 'Rouge', 'Vert', 'Jaune', 'Orange', 'Violet', 'Blanc', 'Noir'}
            },
            data_grades = {},
            LIST_GRADES = {
                nameCreate = nil,
                labelCreate = nil,
                Number = 0,
            },
            selctedGangGradeModifie = {
                selct = '',
                label = '',
                number = ''
            },
        },
        SelectedGang = {},
        SelectedGangId = 0
    },
    gangs = {
        gangs = {},
        Loaded = false,
        CoffreLoad = false,
        Money = {
            Index = 1,
            Data = {'Déposer', 'Retirer'}
        },
        Black_money = {
            Index = 1,
            Data = {'Déposer', 'Retirer'}
        },
        Chest = {
            chest = {},
        },
        Fouille = {},
        Members = {},
        wait = 2000
    }
}

RegisterNetEvent('zmain:gangs:refresh', function(Table)
    print(json.encode(Table))
    Gangs.gangs.gangs = Table
    Gangs.gangs.Loaded = true
end)

CreateThread(function()
    while not ESXLoaded do Wait(1) end
    while not Gangs.gangs.Loaded do Wait(1) end
    
    for k,v in pairs(Gangs.gangs.gangs) do
        if v.activeblip == 0 or v.activeblip == false then goto continue end

        v.colorblip = tonumber(v.colorblip)
        local blip = AddBlipForCoord(vector3(v.posblip.x, v.posblip.y, v.posblip.z))
        SetBlipSprite(blip, 310)
        SetBlipDisplay(blip, 4)
        SetBlipScale(blip, 0.6)
        SetBlipColour(blip, v.colorblip == 1 and 3 or v.colorblip == 2 and 1 or v.colorblip == 3 and 25 or v.colorblip == 4 and 46 or v.colorblip == 5 and 47 or v.colorblip == 6 and 83 or v.colorblip == 7 and 45 or v.colorblip == 8 and 40)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(('[GANG] %s'):format(v.label))
        EndTextCommandSetBlipName(blip)

        ::continue::
    end

    while true do

        Wait(Gangs.gangs.wait)

        Gangs.gangs.wait = 2000

        for k,v in pairs(Gangs.gangs.gangs) do
            if v.poscoffre == nil and v.posboss == nil then goto continue end

            local ppos = GetEntityCoords(PlayerPedId())
            local distance = #(ppos-vector3(v.poscoffre.x, v.poscoffre.y, v.poscoffre.z))
            local distance2 = #(ppos-vector3(v.posboss.x, v.posboss.y, v.posboss.z))

            if distance > 15 and distance2 > 15 then goto continue end
            if ESX.PlayerData.job2.name ~= v.name then goto continue end

            Gangs.gangs.wait = 1

            DrawMarker(25, v.poscoffre.x, v.poscoffre.y, v.poscoffre.z-0.98, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.55, 0.55, 0.55, tonumber(UTILS.ServerColor.r), tonumber(UTILS.ServerColor.g), tonumber(UTILS.ServerColor.b), 255, false, false, 2, false, false, false, false)


            if distance < 1.5 then
                DrawInstructionBarNotification(v.poscoffre.x, v.poscoffre.y, v.poscoffre.z, "Appuyez sur [ ~g~E~w~ ] pour intéragir")
                if IsControlJustPressed(1,51) then
                    Gangs:openCoffreMenu(k)
                end
            end

            if ESX.PlayerData.job2.grade_name ~= 'boss' then goto continue end

            DrawMarker(25, v.posboss.x, v.posboss.y, v.posboss.z-0.98, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.55, 0.55, 0.55, tonumber(UTILS.ServerColor.r), tonumber(UTILS.ServerColor.g), tonumber(UTILS.ServerColor.b), 255, false, false, 2, false, false, false, false)

            if distance2 < 1.5 then
                DrawInstructionBarNotification(v.posboss.x, v.posboss.y, v.posboss.z, "Appuyez sur [ ~g~E~w~ ] pour intéragir")
                if IsControlJustPressed(1,51) then
                    Gangs:openBossMenu(k)
                end
            end

            ::continue::
        end
    end
end)

local CliquedGrade = false

function Gangs:createMenu()
    local main = RageUI.CreateMenu('', 'Actions Disponibles')
    local createGang = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')
    local createGrades = RageUI.CreateSubMenu(createGang, '', 'Actions Disponibles')
    local createGradesEdit = RageUI.CreateSubMenu(createGrades, '', 'Actions Disponibles')

    local edit = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')
    local selectedEditGang = RageUI.CreateSubMenu(edit, '', 'Actions Disponibles')

    RageUI.Visible(main, not RageUI.Visible(main))
    while main do Wait(1)
        RageUI.IsVisible(main, function()
            RageUI.Button('Crée un gang', nil, {}, true, {
                onSelected = function()
                    
                end
            }, createGang)
            RageUI.Button('Modifier un gang', nil, {}, true, {
                onSelected = function()
                    
                end
            }, edit)
        end)

        RageUI.IsVisible(createGang, function()
            RageUI.List('Type', Gangs.admin.data_create.list.TypeData, Gangs.admin.data_create.list.TypeIndex, nil, {}, true, {
                onListChange = function(Index)
                    Gangs.admin.data_create.list.TypeIndex = Index
                end
            })
            if Gangs.admin.data_create.list.TypeIndex == 1 then
                RageUI.Button('Nom du gang', nil, {RightLabel = Gangs.admin.data_create.name or '~r~Indéfini~s~'}, true, {
                    onSelected = function()
                        KeyboardUtils.use('Nom du gang', function(name)
                            if name == nil or name == '' then Gangs.admin.data_create.name = nil return end
    
                            Gangs.admin.data_create.name = name
                        end)
                    end
                })
                RageUI.Button('Label du gang', nil, {RightLabel = Gangs.admin.data_create.label or '~r~Indéfini~s~'}, true, {
                    onSelected = function()
                        KeyboardUtils.use('Label du gang', function(label)
                            if label == nil or label == '' then Gangs.admin.data_create.label = nil return end
    
                            Gangs.admin.data_create.label = label
                        end)
                    end
                })
                RageUI.Button('Position du blips', '\n⚠️ Une fois la position défini, vous pouvez re-séléctioné le bouton pour la changer\n', {RightLabel = Gangs.admin.data_create.posblip == nil and '~r~Indéfini~s~' or '~g~Défini~s~'}, true, {
                    onSelected = function()
                        Gangs.admin.data_create.posblip = GetEntityCoords(PlayerPedId())
                    end
                })
                RageUI.List('Couleur du blip', Gangs.admin.data_create.list.BlipData, Gangs.admin.data_create.list.BlipIndex, nil, {}, true, {
                    onListChange = function(Index)
                        Gangs.admin.data_create.list.BlipIndex = Index
                    end
                })
                RageUI.Button('Position du coffre', '\n⚠️ Une fois la position défini, vous pouvez re-séléctioné le bouton pour la changer\n', {RightLabel = Gangs.admin.data_create.poscoffre == nil and '~r~Indéfini~s~' or '~g~Défini~s~'}, true, {
                    onSelected = function()
                        Gangs.admin.data_create.poscoffre = GetEntityCoords(PlayerPedId())
                    end
                })
                -- RageUI.Button('Position du garage ( sortie )', '\n⚠️ Une fois la position défini, vous pouvez re-séléctioné le bouton pour la changer\n', {RightLabel = Gangs.admin.data_create.posgarage == nil and '~r~Indéfini~s~' or '~g~Défini~s~'}, true, {
                --     onSelected = function()
                --         Gangs.admin.data_create.posgarage = GetEntityCoords(PlayerPedId())
                --     end
                -- })
                -- RageUI.Button('Position du garage ( delete )', '\n⚠️ Une fois la position défini, vous pouvez re-séléctioné le bouton pour la changer\n', {RightLabel = Gangs.admin.data_create.posgaragesortie == nil and '~r~Indéfini~s~' or '~g~Défini~s~'}, true, {
                --     onSelected = function()
                --         Gangs.admin.data_create.posgaragesortie = GetEntityCoords(PlayerPedId())
                --     end
                -- })
                -- RageUI.Button('Position du garage ( spawn )', '\n⚠️ Une fois la position défini, vous pouvez re-séléctioné le bouton pour la changer\n', {RightLabel = Gangs.admin.data_create.posgaragespawn == nil and '~r~Indéfini~s~' or '~g~Défini~s~'}, true, {
                --     onSelected = function()
                --         Gangs.admin.data_create.posgaragespawn = GetEntityCoords(PlayerPedId())
                --     end
                -- })
                -- RageUI.Button('Rotation du garage ( spawn )', '\n⚠️ Une fois la rotation défini, vous pouvez re-séléctioné le bouton pour la changer\n', {RightLabel = Gangs.admin.data_create.rotationgaragespawn == nil and '~r~Indéfini~s~' or '~g~Défini~s~'}, true, {
                --     onSelected = function()
                --         Gangs.admin.data_create.rotationgaragespawn = GetEntityHeading(PlayerPedId())
                --     end
                -- })
                RageUI.Button('Position du menu ( boss )', '\n⚠️ Une fois la position défini, vous pouvez re-séléctioné le bouton pour la changer\n', {RightLabel = Gangs.admin.data_create.posboss == nil and '~r~Indéfini~s~' or '~g~Défini~s~'}, true, {
                    onSelected = function()
                        Gangs.admin.data_create.posboss = GetEntityCoords(PlayerPedId())
                    end
                })
                RageUI.WLine()
                RageUI.Button('Grades', nil, {}, true, {
                    onSelected = function()
                        if not CliquedGrade then
                            Gangs.admin.data_create.data_grades = {
                                ['boss'] = {
                                    name = 'boss',
                                    label = 'A MODIFIER',
                                    Number = 1,
                                }
                            }
                            CliquedGrade =true
                        end
                    end
                }, createGrades)
                RageUI.WLine()
                RageUI.Button('Confirmer', nil, {}, true, {
                    onSelected = function()
                        if Gangs.admin.data_create.name == nil and Gangs.admin.data_create.label == nil and Gangs.admin.data_create.posblip == nil and Gangs.admin.data_create.poscoffre == nil and Gangs.admin.data_create.posgarage == nil and Gangs.admin.data_create.posgaragesortie == nil and Gangs.admin.data_create.posgaragespawn == nil and Gangs.admin.data_create.rotationgaragespawn == nil and Gangs.admin.data_create.posboss == nil then
                            return ESX.ShowNotification('Toutes les informations ne sont pas correctement compléter')
                        end
                        Gangs:create(Gangs.admin.data_create.name, Gangs.admin.data_create.label, Gangs.admin.data_create.poscoffre, Gangs.admin.data_create.posgarage, Gangs.admin.data_create.posgaragesortie, Gangs.admin.data_create.posgaragespawn, Gangs.admin.data_create.rotationgaragespawn, Gangs.admin.data_create.posboss, true, Gangs.admin.data_create.list.BlipIndex, Gangs.admin.data_create.posblip, Gangs.admin.data_create.data_grades)
                    end
                })
            elseif Gangs.admin.data_create.list.TypeIndex == 2 then
                RageUI.Button('Nom de l\'orga', nil, {RightLabel = Gangs.admin.data_create.name or '~r~Indéfini~s~'}, true, {
                    onSelected = function()
                        KeyboardUtils.use('Nom de l\'orga', function(name)
                            if name == nil or name == '' then Gangs.admin.data_create.name = nil return end
    
                            Gangs.admin.data_create.name = name
                        end)
                    end
                })
                RageUI.Button('Label de l\'orga', nil, {RightLabel = Gangs.admin.data_create.label or '~r~Indéfini~s~'}, true, {
                    onSelected = function()
                        KeyboardUtils.use('Label du gang', function(label)
                            if label == nil or label == '' then Gangs.admin.data_create.label = nil return end
    
                            Gangs.admin.data_create.label = label
                        end)
                    end
                })
                RageUI.Button('Position du coffre', '\n⚠️ Une fois la position défini, vous pouvez re-séléctioné le bouton pour la changer\n', {RightLabel = Gangs.admin.data_create.poscoffre == nil and '~r~Indéfini~s~' or '~g~Défini~s~'}, true, {
                    onSelected = function()
                        Gangs.admin.data_create.poscoffre = GetEntityCoords(PlayerPedId())
                    end
                })
                -- RageUI.Button('Position du garage ( sortie )', '\n⚠️ Une fois la position défini, vous pouvez re-séléctioné le bouton pour la changer\n', {RightLabel = Gangs.admin.data_create.posgarage == nil and '~r~Indéfini~s~' or '~g~Défini~s~'}, true, {
                --     onSelected = function()
                --         Gangs.admin.data_create.posgarage = GetEntityCoords(PlayerPedId())
                --     end
                -- })
                -- RageUI.Button('Position du garage ( delete )', '\n⚠️ Une fois la position défini, vous pouvez re-séléctioné le bouton pour la changer\n', {RightLabel = Gangs.admin.data_create.posgaragesortie == nil and '~r~Indéfini~s~' or '~g~Défini~s~'}, true, {
                --     onSelected = function()
                --         Gangs.admin.data_create.posgaragesortie = GetEntityCoords(PlayerPedId())
                --     end
                -- })
                -- RageUI.Button('Position du garage ( spawn )', '\n⚠️ Une fois la position défini, vous pouvez re-séléctioné le bouton pour la changer\n', {RightLabel = Gangs.admin.data_create.posgaragespawn == nil and '~r~Indéfini~s~' or '~g~Défini~s~'}, true, {
                --     onSelected = function()
                --         Gangs.admin.data_create.posgaragespawn = GetEntityCoords(PlayerPedId())
                --     end
                -- })
                -- RageUI.Button('Rotation du garage ( spawn )', '\n⚠️ Une fois la rotation défini, vous pouvez re-séléctioné le bouton pour la changer\n', {RightLabel = Gangs.admin.data_create.rotationgaragespawn == nil and '~r~Indéfini~s~' or '~g~Défini~s~'}, true, {
                --     onSelected = function()
                --         Gangs.admin.data_create.rotationgaragespawn = GetEntityCoords(PlayerPedId())
                --     end
                -- })
                RageUI.Button('Position du menu ( boss )', '\n⚠️ Une fois la position défini, vous pouvez re-séléctioné le bouton pour la changer\n', {RightLabel = Gangs.admin.data_create.posboss == nil and '~r~Indéfini~s~' or '~g~Défini~s~'}, true, {
                    onSelected = function()
                        Gangs.admin.data_create.posboss = GetEntityCoords(PlayerPedId())
                    end
                })
                RageUI.WLine()
                RageUI.Button('Grades', nil, {}, true, {
                    onSelected = function()
                        if not CliquedGrade then
                            Gangs.admin.data_create.data_grades = {
                                ['boss'] = {
                                    name = 'boss',
                                    label = 'A MODIFIER',
                                    Number = 1,
                                }
                            }
                            CliquedGrade =true
                        end
                    end
                }, createGrades)
                RageUI.WLine()
                RageUI.Button('Confirmer', nil, {}, true, {
                    onSelected = function()
                        if Gangs.admin.data_create.name == nil and Gangs.admin.data_create.label == nil and Gangs.admin.data_create.poscoffre == nil and Gangs.admin.data_create.posgarage == nil and Gangs.admin.data_create.posgaragesortie == nil and Gangs.admin.data_create.posgaragespawn == nil and Gangs.admin.data_create.rotationgaragespawn == nil and Gangs.admin.data_create.posboss == nil then
                            return ESX.ShowNotification('Toutes les informations ne sont pas correctement compléter')
                        end

                        Gangs:create(Gangs.admin.data_create.name, Gangs.admin.data_create.label, Gangs.admin.data_create.poscoffre, Gangs.admin.data_create.posgarage, Gangs.admin.data_create.posgaragesortie, Gangs.admin.data_create.posgaragespawn, Gangs.admin.data_create.rotationgaragespawn, Gangs.admin.data_create.posboss, false, Gangs.admin.data_create.list.BlipIndex, Gangs.admin.data_create.posblip, Gangs.admin.data_create.data_grades)
                    end
                })
            end
        end)

        RageUI.IsVisible(createGrades, function()
            RageUI.Info('~r~Informations Importantes~s~', {'Ils est important à la création de chaque grades d\'ajouter 1 à l\'ancien numéro de position du grade.', 'De base un grade contenant comme nom "boss" et label "A MODIFIER", il vous suffit de renommer le\nlabel avec le label du grade boss du gangs que vous crée. Le numéro que ce grade doit avoir est le\nnuméro du dernier grade que vous avez crée + 1.'} , {'','','',''})
            RageUI.Button('Aprouver les règles', nil ,{}, not reglegradeapprouved, {
                onSelected = function()
                    reglegradeapprouved = true
                end
            })
            RageUI.Separator('~p~Création de grades')
            RageUI.Button('Nom du grade', nil, {RightLabel = Gangs.admin.data_create.LIST_GRADES.nameCreate or '~r~Indéfini'}, reglegradeapprouved, {
                onSelected = function()
                    KeyboardUtils.use('Nom du grade', function(data)
                        if data == nil or data == '' then return end
                        Gangs.admin.data_create.LIST_GRADES.nameCreate = data
                    end)
                end
            })
            RageUI.Button('Label du grade', nil, {RightLabel = Gangs.admin.data_create.LIST_GRADES.labelCreate or '~r~Indéfini'}, reglegradeapprouved, {
                onSelected = function()
                    KeyboardUtils.use('Label du grade', function(data)
                        if data == nil or data == '' then return end
                        Gangs.admin.data_create.LIST_GRADES.labelCreate = data
                    end)
                end
            })
            RageUI.Button('Position du grade (number)', nil, {RightLabel = Gangs.admin.data_create.LIST_GRADES.Number ~= 0 and Gangs.admin.data_create.LIST_GRADES.Number or '~r~Inéfinie'}, reglegradeapprouved, {
                onSelected = function()
                    KeyboardUtils.use('Position du grade (number)', function(data)
                        if tonumber(data) == nil or tonumber(data) == '' then return end
                        Gangs.admin.data_create.LIST_GRADES.Number = data
                    end)
                end
            })
            RageUI.Button('Confirmer le grade', nil, {}, reglegradeapprouved, {
                onSelected = function()
                    if Gangs.admin.data_create.LIST_GRADES.nameCreate == nil or  Gangs.admin.data_create.LIST_GRADES.nameCreate == '' or Gangs.admin.data_create.LIST_GRADES.labelCreate == nil or Gangs.admin.data_create.LIST_GRADES.labelCreate == '' or tonumber(Gangs.admin.data_create.LIST_GRADES.Number == nil) or tonumber(Gangs.admin.data_create.LIST_GRADES.Number) == '' or tonumber(Gangs.admin.data_create.LIST_GRADES.Number) == 0 then return ESX.ShowNotification('Champ non complet') end
                    Gangs.admin.data_create.data_grades[Gangs.admin.data_create.LIST_GRADES.nameCreate] = {
                        name = Gangs.admin.data_create.LIST_GRADES.nameCreate,
                        label = Gangs.admin.data_create.LIST_GRADES.labelCreate,
                        Number = Gangs.admin.data_create.LIST_GRADES.Number,
                    }
                    Gangs.admin.data_create.LIST_GRADES.nameCreate = nil
                    Gangs.admin.data_create.LIST_GRADES.labelCreate = nil
                    Gangs.admin.data_create.LIST_GRADES.Number = 0
                end
            })
            RageUI.Line(255, 139, 0)
            for k,v in pairs(Gangs.admin.data_create.data_grades) do
                RageUI.Button(v.label..' '..v.name, nil, {RightLabel = v.Number}, reglegradeapprouved, {
                    onSelected = function()
                        Gangs.admin.data_create.selctedGangGradeModifie.selct = v.name
                        Gangs.admin.data_create.selctedGangGradeModifie.label = v.label
                        Gangs.admin.data_create.selctedGangGradeModifie.number = v.Number
                    end
                }, createGradesEdit)
            end
        end)

        RageUI.IsVisible(createGradesEdit, function()
            RageUI.Separator('~p~Gestion du grade : ~s~'..Gangs.admin.data_create.selctedGangGradeModifie.selct)
            RageUI.Separator('~p~Label du grade : ~s~'..Gangs.admin.data_create.selctedGangGradeModifie.label)
            RageUI.Separator('~p~Position du grade (number) : ~s~'..Gangs.admin.data_create.selctedGangGradeModifie.number)
            RageUI.Button('Changer le nom du grade', nil, {}, Gangs.admin.data_create.selctedGangGradeModifie.selct ~= 'boss', {
                onSelected = function()
                    KeyboardUtils.use('Nouveau nom', function(data)
                        if data == nil or data == '' then return end
                        Gangs.admin.data_create.data_grades[Gangs.admin.data_create.selctedGangGradeModifie.selct].name = data
                        Gangs.admin.data_create.selctedGangGradeModifie.selct = data
                    end)
                end
            })
            RageUI.Button('Changer le label du grade', nil, {}, true, {
                onSelected = function()
                    KeyboardUtils.use('Nouveau label', function(data)
                        if data == nil or data == '' then return end
                        Gangs.admin.data_create.data_grades[Gangs.admin.data_create.selctedGangGradeModifie.selct].label = data
                        Gangs.admin.data_create.selctedGangGradeModifie.label = data
                    end)
                end
            })
            RageUI.Button('Changer la position du grade (numéro)', nil, {}, true, {
                onSelected = function()
                    KeyboardUtils.use('Nouveau label', function(data)
                        if tonumber(data) == nil or tonumber(data) == '' then return end
                        Gangs.admin.data_create.data_grades[Gangs.admin.data_create.selctedGangGradeModifie.selct].Number = data
                        Gangs.admin.data_create.selctedGangGradeModifie.Number = data
                        Gangs.admin.data_create.selctedGangGradeModifie.number = data
                    end)
                end
            })
            RageUI.Button('Supprimer le grade', nil, {Color = {BackgroundColor = {255, 0, 0,100}}}, Gangs.admin.data_create.selctedGangGradeModifie.selct ~= 'boss', {
                onSelected = function()
                    Gangs.admin.data_create.data_grades[Gangs.admin.data_create.selctedGangGradeModifie.selct] = nil
                    RageUI.GoBack()
                end
            })
        end)

        RageUI.IsVisible(edit, function()
            for k,v in pairs(Gangs.gangs.gangs) do 
                RageUI.Button(('(%s) %s - %s'):format(k, v.name, v.label), nil, {}, true, {
                    onSelected = function()
                        Gangs.admin.SelectedGang = v
                        Gangs.admin.SelectedGangId = k
                    end
                }, selectedEditGang)
            end
        end)

        RageUI.IsVisible(selectedEditGang, function()
            RageUI.Button('Supprimer le gang', nil, {}, true, {
                onSelected = function()
                    KeyboardUtils.use('Taper Y pour valider', function(data)
                        if data == 'y' or data == 'Y' then
                            Gangs.gangs.gangs[Gangs.admin.SelectedGang] = nil

                            TriggerServerEvent('zmain:gangs:delete', Gangs.admin.SelectedGangId)

                            RageUI.GoBack()
                        end
                    end)
                end
            })
        end)

        if not RageUI.Visible(main) and not RageUI.Visible(createGang) and not RageUI.Visible(createGrades) and not RageUI.Visible(createGradesEdit) and not RageUI.Visible(edit) and not RageUI.Visible(selectedEditGang) and

        not RageUI.Visible(main) then
            main = RMenu:DeleteType('main')
        end
    end
end

function Gangs:create(name, label, poscoffre, posgarage, posgaragedelete, posgaragespawn, rotaspawn, posboss, activeblip, colorblip, posblip, grades)
    TriggerServerEvent('zmain:gangs:create', name, label, poscoffre, posgarage, posgaragedelete, posgaragespawn, rotaspawn, posboss, activeblip, colorblip, posblip, grades)
end

function Gangs:openCoffreMenu(gangid)
    TriggerServerEvent('zmain:gangs:openCoffreMenu', gangid)
    local main = RageUI.CreateMenu('', 'Actions Disponibles')
    local openMyInventoryMenu = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')

    RageUI.Visible(main, not RageUI.Visible(main))
    FreezeEntityPosition(PlayerPedId(), true)
    while main do Wait(1)
        RageUI.IsVisible(main, function()
            RageUI.Separator('Gang: ~p~'..Gangs.gangs.gangs[gangid].label)
            if Gangs.gangs.CoffreLoad then
                RageUI.Separator('Argent Liquide: '..Gangs.gangs.Chest.chest['accounts'].cash..'$')
                RageUI.Separator('Argent Sale: '..Gangs.gangs.Chest.chest['accounts'].black_money..'$')
                RageUI.List("Actions sur L'argent Liquide", Gangs.gangs.Money.Data, Gangs.gangs.Money.Index, nil, {}, true, {
                    onListChange = function(Index)
                        Gangs.gangs.Money.Index = Index;
                    end,
                    onSelected = function()
                        if Gangs.gangs.Money.Index == 1 then
                            KeyboardUtils.use('Quantité', function(q)
                                local q = tonumber(q)
                                if q == nil then return end
                                TriggerServerEvent('zmain:gangs:money:deposit', gangid, 'cash', q)
                            end)
                        elseif Gangs.gangs.Money.Index == 2 then
                            KeyboardUtils.use('Quantité', function(q)
                                local q = tonumber(q)
                                if q == nil then return end
                                TriggerServerEvent('zmain:gangs:money:withdraw', gangid, 'cash', q)
                            end)
                        end
                    end
                })
                RageUI.List("Actions sur L'argent Sale", Gangs.gangs.Black_money.Data, Gangs.gangs.Black_money.Index, nil, {}, true, {
                    onListChange = function(Index)
                        Gangs.gangs.Black_money.Index = Index;
                    end,
                    onSelected = function()
                        if Gangs.gangs.Black_money.Index == 1 then
                            KeyboardUtils.use('Quantité', function(q)
                                local q = tonumber(q)
                                if q == nil then return end
                                TriggerServerEvent('zmain:gangs:money:deposit', gangid, 'black_money', q)
                            end)
                        elseif Gangs.gangs.Black_money.Index == 2 then
                            KeyboardUtils.use('Quantité', function(q)
                                local q = tonumber(q)
                                if q == nil then return end
                                TriggerServerEvent('zmain:gangs:money:withdraw', gangid, 'black_money', q)
                            end)
                        end
                    end
                })
                RageUI.WLine()
                RageUI.Button('Déposer des objets dans le coffre', nil, {}, true, {
                    onSelected = function()
    
                    end
                }, openMyInventoryMenu)
                if (Gangs.gangs.Chest.chest['items']) then
                    for k,v in pairs(Gangs.gangs.Chest.chest['items']) do
                        RageUI.Button(('%s'):format(v.label), nil, {RightLabel = "Quantité : ~r~x"..v.count}, true, {
                            onSelected = function()
                                KeyboardUtils.use('Quantité', function(q)
                                    local q = tonumber(q)
                                    if q == nil then return end

                                    TriggerServerEvent('zmain:gangs:removeCoffreItem', gangid, v.name, q)
                                end);
                            end
                        })
                    end
                end
                if (Gangs.gangs.Chest.chest['weapons']) then
                    for k,v in pairs(Gangs.gangs.Chest.chest['weapons']) do
                        RageUI.Button(('%s'):format(v.label), nil, {RightLabel = "Munition(s) : ~r~x"..v.ammo}, true, {
                            onSelected = function()
                                KeyboardUtils.use('Taper Y pour valider', function(q)
                                    if q == 'Y' or q == 'y' then
                                        TriggerServerEvent('zmain:gangs:removeCoffreWeapon', gangid, k, v.ammo)
                                    end
                                end);
                            end
                        })
                    end
                end
            end
        end)

        RageUI.IsVisible(openMyInventoryMenu, function()
            ESX.PlayerData.inventory = ESX.GetPlayerData().inventory
            ESX.PlayerData.loadout = ESX.GetPlayerData().loadout
            RageUI.Separator("↓ Items ↓")
            if #ESX.PlayerData.inventory > 0 then 
                for k, v in pairs(ESX.PlayerData.inventory) do 
                    if v.count > 0 then 
                        RageUI.Button(""..v.label.."", nil,  {RightLabel = "Quantité : ~r~x"..v.count..""}, true, {
                            onSelected = function()
                                KeyboardUtils.use('Quantité', function(q)
                                    local q = tonumber(q)
                                    if q == nil then return end

                                    TriggerServerEvent('zmain:gangs:addCoffreItem', gangid, v.name, q)
                                end);
                            end
                        })
                    end
                end
            end
            RageUI.Separator("↓ Armes ↓")
            for k,v in pairs(ESX.PlayerData.loadout) do
                if HasPedGotWeapon(PlayerPedId(), v.hash, false) then
                    local ammo = GetAmmoInPedWeapon(PlayerPedId(), v.hash)
                    RageUI.Button(v.label, nil, { RightLabel = "Munition(s) : ~r~x"..ammo }, true, {
                        onSelected = function()
                            KeyboardUtils.use('Taper Y pour valider', function(q)
                                if q == 'Y' or q == 'y' then
                                
                                TriggerServerEvent('zmain:gangs:addCoffreWeapon', gangid, v.name, v.label, ammo)
                                end
                            end);
                        end
                    })
                end
            end
        end)

        if not RageUI.Visible(main) and not RageUI.Visible(openMyInventoryMenu) and

        not RageUI.Visible(main) then
            main = RMenu:DeleteType('main')
            FreezeEntityPosition(PlayerPedId(), false)
        end
    end
end

function Gangs:openF7()
    local main = RageUI.CreateMenu('', 'Actions Disponibles')
    local playerFouille = RageUI.CreateSubMenu(main, '', 'Menu Fouille')

    RageUI.Visible(main, not RageUI.Visible(main))
    while main do Wait(1)
        RageUI.IsVisible(main, function()
            RageUI.WLine()
            RageUI.Button('Fouiller', nil, {}, true, {
                onSelected = function()
                    local player, distance = ESX.Game.GetClosestPlayer()

                    if distance ~= -1 and distance <= 3.0 then 
                        if ESX.isHandsUp(GetPlayerPed(player)) then
                            ESX.TriggerServerCallback('zmain:gangs:fouiller', function(cb)
                                Gangs.gangs.Fouille = cb
                                RageUI.Visible(playerFouille, true)
                            end, GetPlayerServerId(player))
                        else
                            return ESX.ShowNotification('🤚✋La personne doit ~r~lever les mains~s~ pour être fouiller')
                        end
                    else
                        return ESX.ShowNotification('Personne aux alentours !')
                    end
                end
            })
            RageUI.Button('Cagouler/Décagouler', nil, {}, true, {
                onSelected = function()
                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                    if closestDistance ~= -1 and closestDistance <= 3.0 then
                        TriggerServerEvent("zmain:gangs:cagoule", GetPlayerServerId(closestPlayer))
                    else
                        return ESX.ShowNotification('Personne aux alentours !')
                    end
                end
            })
            RageUI.WLine()
            -- if ESX.PlayerData.job2.grade_name == 'boss' then
            --     RageUI.WLine()
            --     RageUI.Button('Recruter', nil, {}, true, {
            --         onSelected = function()
            --             KeyboardUtils.use('Taper Y pour valider', function(data)
            --                 if data == 'y' or data == 'Y' then
            --                     local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
            --                     if closestPlayer == -1 or closestDistance > 3.0 then
            --                         return ESX.ShowNotification('Personne aux alentours !')
            --                     else
            --                         TriggerServerEvent('zmain:gangs:recrute', GetPlayerServerId(closestPlayer), ESX.PlayerData.job2.name, 1)
            --                     end
            --                 end
            --             end)
            --         end
            --     })
        
            --     RageUI.Button('Virer', nil, {}, true,{
            --         onSelected = function()
            --             KeyboardUtils.use('Taper Y pour valider', function(data)
            --                 if data == 'y' or data == 'Y' then
            --                     local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
    
            --                     if closestPlayer == -1 or closestDistance > 3.0 then
            --                         return ESX.ShowNotification('Personne aux alentours !')
            --                     else
            --                         TriggerServerEvent('zmain:gangs:virer', GetPlayerServerId(closestPlayer))
            --                     end
            --                 end
            --             end)
            --         end
            --     })
        
            --     RageUI.Button('Augmenter', nil, {}, true, {
            --         onSelected = function()
            --             KeyboardUtils.use('Taper Y pour valider', function(data)
            --                 if data == 'y' or data == 'Y' then
            --                     local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
    
            --                     if closestPlayer == -1 or closestDistance > 3.0 then
            --                         return ESX.ShowNotification('Personne aux alentours !')
            --                     else
            --                         TriggerServerEvent('zmain:gangs:prmu', GetPlayerServerId(closestPlayer))
            --                     end
            --                 end
            --             end)
            --         end
            --     })
        
            --     RageUI.Button('Destituer', nil, {}, true,{
            --         onSelected = function()
            --             KeyboardUtils.use('Taper Y pour valider', function(data)
            --                 if data == 'y' or data == 'Y' then
            --                     local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
    
            --                     if closestPlayer == -1 or closestDistance > 3.0 then
            --                         return ESX.ShowNotification('Personne aux alentours !')
            --                     else
            --                         TriggerServerEvent('zmain:gangs:dest', GetPlayerServerId(closestPlayer))
            --                     end
            --                 end
            --             end)
            --         end
            --     })
            -- end
        end)

        RageUI.IsVisible(playerFouille, function()
            RageUI.Separator(('Argent Liquide: %s$'):format(Gangs.gangs.Fouille.cash))
            RageUI.Separator(('Argent Sale: %s$'):format(Gangs.gangs.Fouille.black_money))
            RageUI.WLine()
            for k,v in pairs(Gangs.gangs.Fouille.inventory) do
                RageUI.Button(""..v.label.."", nil,  {RightLabel = "Quantité : ~r~x"..v.count..""}, true, {
                    onSelected = function()
                        
                    end
                })
            end
            for k,v in pairs(Gangs.gangs.Fouille.loadout) do
                RageUI.Button(""..v.label.."", nil,  {}, true, {
                    onSelected = function()
                        
                    end
                })
            end
        end)

        if not RageUI.Visible(main) and not RageUI.Visible(playerFouille) and

        not RageUI.Visible(main) then
            main = RMenu:DeleteType('main')
            FreezeEntityPosition(PlayerPedId(), false)
        end
    end
end

function Gangs:openBossMenu(id)
    local main = RageUI.CreateMenu('', 'Actions Disponibles')

    local members = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')

    local selectMember = {}
    local selectMemberWithName = RageUI.CreateSubMenu(members, '', 'Actions Disponibles')

    RageUI.Visible(main, not RageUI.Visible(main))
    FreezeEntityPosition(PlayerPedId(), true)
    while main do
        Wait(1)
        RageUI.IsVisible(main, function()
            RageUI.Button('Gérer les membres', nil, {}, true, {
                onSelected = function()
                    Gangs.gangs.Members = {}
                    ESX.TriggerServerCallback('zmain:gangs:boss:getallmembers', function(cb)
                        Gangs.gangs.Members = cb
                        RageUI.Visible(members, true)
                    end, ESX.PlayerData.job2.name)
                end
            },members)
        end)

        RageUI.IsVisible(members, function()
            for k,v in pairs(Gangs.gangs.Members) do
                RageUI.Button(('%s %s (%s)'):format(v.firstname, v.lastname, v.UniqueID), nil, {RightLabel = '>>'}, true, {
                    onSelected = function()
                        selectMember = v
                    end
                }, selectMemberWithName)
            end
        end)

        RageUI.IsVisible(selectMemberWithName, function()
            RageUI.Button('Virer', nil, {RightLabel = '>>'}, selectMember.playerName ~= GetPlayerName(PlayerId()), {
                onSelected = function()
                    KeyboardUtils.use('Taper Y pour valider', function(data)
                        if data == 'y' or data == 'Y' then
                            TriggerServerEvent('zmain:gangs:boss:tege', selectMember.identifier)
                        end
                    end)
                end
            })
            RageUI.Button('Promouvoir', nil, {RightLabel = '>>'}, selectMember.playerName ~= GetPlayerName(PlayerId()), {
                onSelected = function()
                    KeyboardUtils.use('Taper Y pour valider', function(data)
                        if data == 'y' or data == 'Y' then
                            TriggerServerEvent('zmain:gangs:boss:promu', selectMember.identifier, selectMember.job2_grade)
                        end
                    end)
                end
            })
            RageUI.Button('Destituer', nil, {RightLabel = '>>'}, selectMember.playerName ~= GetPlayerName(PlayerId()), {
                onSelected = function()
                    KeyboardUtils.use('Taper Y pour valider', function(data)
                        if data == 'y' or data == 'Y' then
                            TriggerServerEvent('zmain:gangs:boss:destitu', selectMember.identifier, selectMember.job2_grade)
                        end
                    end)
                end
            })
        end)

        if not RageUI.Visible(main) and not RageUI.Visible(members) and not RageUI.Visible(selectMemberWithName) and

        not RageUI.Visible(main) then
            main = RMenu:DeleteType('main')
            FreezeEntityPosition(PlayerPedId(), false)
        end
    end
end

RegisterCommand('gangs', function(_)
    if not Gangs.admin.command_create[ESX.GetPlayerData()['group']] then goto continue end

    Gangs:createMenu()

    ::continue::
end)

RegisterCommand('F7_GROUP', function()
    if ESX.PlayerData.job2.name == 'unemployed2' then return end

    Gangs:openF7()
end)

RegisterKeyMapping('F7_GROUP', 'Menu intéraction illégale', 'keyboard', 'F7')

CreateThread(function()
    Wait(1000)
    TriggerServerEvent('zmain:gangs:init')
end)

RegisterNetEvent('zmain:gangs:recieveCoffre', function(Table)
    Gangs.gangs.Chest = Table
    Gangs.gangs.CoffreLoad = true
end)

RegisterNetEvent('zmain:gangs:cagoule', function()
    needDisplayBag = not needDisplayBag

    while needDisplayBag do
        if not HasStreamedTextureDictLoaded('cagoule') then
            RequestStreamedTextureDict('cagoule')
            while not HasStreamedTextureDictLoaded('cagoule') do
                Citizen.Wait(50)
            end
        end

        DrawSprite('cagoule', 'headbag', 0.5, 0.5, 1.0, 1.0, 0.0, 255, 255, 255, 255)
        Citizen.Wait(1)
        DisableControlAction(2, 289, true) -- F2
        DisableControlAction(2, 322, true) -- ECHAP CARTE
        DisableControlAction(2, 199, true) -- ECHAP CARTE
        DisableControlAction(2, 200, true) -- ECHAP CARTE
        DisableControlAction(0, 288, true) --TELEPHONE
    end
    SetStreamedTextureDictAsNoLongerNeeded('cagoule')
end)