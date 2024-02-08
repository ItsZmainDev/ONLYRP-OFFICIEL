Society = {
    WaitNearby = 2000,
    Thread = false,
    SocietyLoaded = false,
    List = {},

    Create = {
        name = nil,
        label = nil,
        posCoffre = nil,
        posBoss = nil,
        blipsActive = false,

        vestiaire = false,
        vestiairePos = nil,

        blips = {

        }
    },

    AccountSelected = 'cash',
    SelectedEmployed = {},

    Grades = {
        Selected = {},
        PermissionsSearch = nil,
        Permissions = {
            ['open_coffre'] = {
                label = 'Ouvrir le coffre',
                grades = {
                    ['boss'] = true
                }
            },
            ['open_boss'] = {
                label = 'Ouvrir le menu boss',
                grades = {
                    ['boss'] = true
                }
            },
            ['deposit_cash_coffre'] = {
                label = 'Déposer de l\'argent dans le coffre',
                grades = {
                    ['boss'] = true
                }
            },
            ['withdraw_cash_coffre'] = {
                label = 'Retirer de l\'argent dans le coffre',
                grades = {
                    ['boss'] = true
                }
            },
            ['withdraw_black_money_coffre'] = {
                label = 'Retirer de l\'argent sale dans le coffre',
                grades = {
                    ['boss'] = true
                }
            },
            ['deposit_black_money_coffre'] = {
                label = 'Déposer de l\'argent sale dans le coffre',
                grades = {
                    ['boss'] = true
                }
            },
            ['weapons_chest'] = {
                label = 'Armes du coffre',
                grades = {
                    ['boss'] = true
                }
            },
            ['items_chest'] = {
                label = 'Items du coffre',
                grades = {
                    ['boss'] = true
                }
            },
            ['deposit_weapon_chest'] = {
                label = 'Déposer une arme dans le coffre',
                grades = {
                    ['boss'] = true
                }
            },
            ['remove_weapon_chest'] = {
                label = 'Retirer une arme dans le coffre',
                grades = {
                    ['boss'] = true
                }
            },
            ['deposit_item_chest'] = {
                label = 'Déposer un item dans le coffre',
                grades = {
                    ['boss'] = true
                }
            },
            ['remove_item_chest'] = {
                label = 'Retirer un item dans le coffre',
                grades = {
                    ['boss'] = true
                }
            },
            ['deposit_money_society'] = {
                label = 'Déposer de l\'argent dans le coffre de la société',
                grades = {
                    ['boss'] = true
                }
            },
            ['withdraw_money_society'] = {
                label = 'Retirer de l\'argent dans le coffre de la société',
                grades = {
                    ['boss'] = true
                }
            },
            ['chest'] = {
                label = 'Accéder au coffre de la société',
                grades = {
                    ['boss'] = true
                }
            },
            ['weapons_chest_society'] = {
                label = 'Arme(s) du coffre de la société',
                grades = {
                    ['boss'] = true
                }
            },
            ['items_chest:society'] = {
                label = 'Item(s) du coffre de la société',
                grades = {
                    ['boss'] = true
                }
            },
            ['deposit_weapon_chest_society'] = {
                label = 'Déposer une arme dans le coffre de la société',
                grades = {
                    ['boss'] = true
                }
            },
            ['remove_weapon_chest_society'] = {
                label = 'Retirer une arme dans la coffre de la société',
                grades = {
                    ['boss'] = true
                }
            },
            ['dposit_item_chest_society'] = {
                label = 'Déposer un item dans le coffre de la société',
                grades = {
                    ['boss'] = true
                }
            },
            ['remove_item_chest_society'] = {
                label = 'Retirer un item dans le coffre de la société',
                grades = {
                    ['boss'] = true
                }
            },
            ['manage_grades'] = {
                label = 'Gérer les grades de la société',
                grades = {
                    ['boss'] = true
                }
            },
            ['manage_employeds'] = {
                label = 'Gérer les employés de la société',
                grades = {
                    ['boss'] = true
                }
            },
            ['create_grade'] = {
                label = 'Créer un grade',
                grades = {
                    ['boss'] = true
                }
            },
            ['delete_grade'] = {
                label = 'Supprimer un grade',
                grades = {
                    ['boss'] = true
                }
            },
            ['rename_grade'] = {
                label = 'Changer le nom d\'un grade',
                grades = {
                    ['boss'] = true
                }
            },
            ['rename_label_grade'] = {
                label = 'Changer le label d\'un grade',
                grades = {
                    ['boss'] = true
                }
            },
            ['change_number_grade'] = {
                label = 'Changer le numéro d\'un grade',
                grades = {
                    ['boss'] = true
                }
            },
            ['change_permissions_grade'] = {
                label = 'Changer les permissions d\'un grade',
                grades = {
                    ['boss'] = true
                }
            },
            ['change_salary_grade'] = {
                label = 'Changer le salaire d\'un grade',
                grades = {
                    ['boss'] = true
                }
            },
            ['recruit_player'] = {
                label = 'Recruté un joueur',
                grades = {
                    ['boss'] = true
                }
            },
            ['promote_player'] = {
                label = 'Augmenter un employé',
                grades = {
                    ['boss'] = true
                }
            },
            ['unmote_player'] = {
                label = 'Descendre un employé',
                grades = {
                    ['boss'] = true
                }
            },
            ['demote_player'] = {
                label = 'Virer un employé',
                grades = {
                    ['boss'] = true
                }
            },
            ['editClothes'] = {
                label = 'Gérer les tenues dans le vestiaire',
                grades = {
                    ['boss'] = true
                }
            }
        },
        Create = {
            List = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15},
            Index = 1,

            GradeId = nil,
            OldName = nil,

            name = nil,
            label = nil,
            salary = nil,

            permissions = {
                ['open_coffre'] = {
                    label = 'Ouvrir le coffre',
                    grades = {
                        ['boss'] = true
                    }
                },
                ['open_boss'] = {
                    label = 'Ouvrir le menu boss',
                    grades = {
                        ['boss'] = true
                    }
                },
                ['deposit_cash_coffre'] = {
                    label = 'Déposer de l\'argent dans le coffre',
                    grades = {
                        ['boss'] = true
                    }
                },
                ['withdraw_cash_coffre'] = {
                    label = 'Retirer de l\'argent dans le coffre',
                    grades = {
                        ['boss'] = true
                    }
                },
                ['withdraw_black_money_coffre'] = {
                    label = 'Retirer de l\'argent sale dans le coffre',
                    grades = {
                        ['boss'] = true
                    }
                },
                ['deposit_black_money_coffre'] = {
                    label = 'Déposer de l\'argent sale dans le coffre',
                    grades = {
                        ['boss'] = true
                    }
                },
                ['weapons_chest'] = {
                    label = 'Armes du coffre',
                    grades = {
                        ['boss'] = true
                    }
                },
                ['items_chest'] = {
                    label = 'Items du coffre',
                    grades = {
                        ['boss'] = true
                    }
                },
                ['deposit_weapon_chest'] = {
                    label = 'Déposer une arme dans le coffre',
                    grades = {
                        ['boss'] = true
                    }
                },
                ['remove_weapon_chest'] = {
                    label = 'Retirer une arme dans le coffre',
                    grades = {
                        ['boss'] = true
                    }
                },
                ['deposit_item_chest'] = {
                    label = 'Déposer un item dans le coffre',
                    grades = {
                        ['boss'] = true
                    }
                },
                ['remove_item_chest'] = {
                    label = 'Retirer un item dans le coffre',
                    grades = {
                        ['boss'] = true
                    }
                },
                ['deposit_money_society'] = {
                    label = 'Déposer de l\'argent dans le coffre de la société',
                    grades = {
                        ['boss'] = true
                    }
                },
                ['withdraw_money_society'] = {
                    label = 'Retirer de l\'argent dans le coffre de la société',
                    grades = {
                        ['boss'] = true
                    }
                },
                ['chest'] = {
                    label = 'Accéder au coffre de la société',
                    grades = {
                        ['boss'] = true
                    }
                },
                ['weapons_chest_society'] = {
                    label = 'Arme(s) du coffre de la société',
                    grades = {
                        ['boss'] = true
                    }
                },
                ['items_chest:society'] = {
                    label = 'Item(s) du coffre de la société',
                    grades = {
                        ['boss'] = true
                    }
                },
                ['deposit_weapon_chest_society'] = {
                    label = 'Déposer une arme dans le coffre de la société',
                    grades = {
                        ['boss'] = true
                    }
                },
                ['remove_weapon_chest_society'] = {
                    label = 'Retirer une arme dans la coffre de la société',
                    grades = {
                        ['boss'] = true
                    }
                },
                ['dposit_item_chest_society'] = {
                    label = 'Déposer un item dans le coffre de la société',
                    grades = {
                        ['boss'] = true
                    }
                },
                ['remove_item_chest_society'] = {
                    label = 'Retirer un item dans le coffre de la société',
                    grades = {
                        ['boss'] = true
                    }
                },
                ['manage_grades'] = {
                    label = 'Gérer les grades de la société',
                    grades = {
                        ['boss'] = true
                    }
                },
                ['manage_employeds'] = {
                    label = 'Gérer les employés de la société',
                    grades = {
                        ['boss'] = true
                    }
                },
                ['create_grade'] = {
                    label = 'Créer un grade',
                    grades = {
                        ['boss'] = true
                    }
                },
                ['delete_grade'] = {
                    label = 'Supprimer un grade',
                    grades = {
                        ['boss'] = true
                    }
                },
                ['rename_grade'] = {
                    label = 'Changer le nom d\'un grade',
                    grades = {
                        ['boss'] = true
                    }
                },
                ['rename_label_grade'] = {
                    label = 'Changer le label d\'un grade',
                    grades = {
                        ['boss'] = true
                    }
                },
                ['change_number_grade'] = {
                    label = 'Changer le numéro d\'un grade',
                    grades = {
                        ['boss'] = true
                    }
                },
                ['change_permissions_grade'] = {
                    label = 'Changer les permissions d\'un grade',
                    grades = {
                        ['boss'] = true
                    }
                },
                ['change_salary_grade'] = {
                    label = 'Changer le salaire d\'un grade',
                    grades = {
                        ['boss'] = true
                    }
                },
                ['recruit_player'] = {
                    label = 'Recruté un joueur',
                    grades = {
                        ['boss'] = true
                    }
                },
                ['promote_player'] = {
                    label = 'Augmenter un employé',
                    grades = {
                        ['boss'] = true
                    }
                },
                ['unmote_player'] = {
                    label = 'Descendre un employé',
                    grades = {
                        ['boss'] = true
                    }
                },
                ['demote_player'] = {
                    label = 'Virer un employé',
                    grades = {
                        ['boss'] = true
                    }
                },
                ['editClothes'] = {
                    label = 'Gérer les tenues dans le vestiaire',
                    grades = {
                        ['boss'] = true
                    }
                }
            }
        }
    }
}

function Society:havePermission(societyName, permissionName)
    if not societyName then return end
    if not permissionName then return end
    if not Society.List[societyName] then return end
    if not Society.List[societyName].permissions[permissionName] then
        Society.List[societyName].permissions[permissionName] = {}
        return 
    end

    local playerGrade = ESX.PlayerData.job.grade_name

    if not playerGrade then return end

    if not Society.List[societyName].permissions[permissionName][playerGrade] then
        return false
    end

    return true
end

RegisterNetEvent('zmain:society:sendList', function(data)
    Society.List = data
    Society.SocietyLoaded = true
end)

function Society:openCreateMenu()
    local playerPos = GetEntityCoords(PlayerPedId())
    RageUI.Button('Nom du SetJob', nil, {RightLabel = Society.Create.name or '~r~Indéfini~s~'}, true, {
        onSelected = function()
            KeyboardUtils.use('Nom du SetJob', function(data)
                if data == nil or data == '' then return end

                Society.Create.name = data
            end)
        end
    })
    RageUI.Button('Nom de la société', nil, {RightLabel = Society.Create.label or '~r~Indéfini~s~'}, true, {
        onSelected = function()
            KeyboardUtils.use('Nom de la societée', function(data)
                if data == nil or data == '' then return end

                Society.Create.label = data
            end)
        end
    })
    RageUI.Button('Position du coffre', Society.Create.posCoffre, {}, true, {
        onSelected = function()
            Society.Create.posCoffre = playerPos
        end
    })
    RageUI.Button('Position du boss', Society.Create.posBoss, {}, true, {
        onSelected = function()
            Society.Create.posBoss = playerPos
        end
    })
    RageUI.Checkbox('Blips', nil, Society.Create.blipsActive, {}, {
        onChecked = function()
            Society.Create.blipsActive = true
            Society.Create.blips.active = true
        end,
        onUnChecked = function()
            Society.Create.blipsActive = false
            Society.Create.blips.active = false
        end
    })
    if Society.Create.blipsActive then
        RageUI.Button('Positon du blips', nil, {RightLabel = Society.Create.blips.position ~= nil and '~g~Défini~s~' or '~r~Indéfini~s~'}, true, {
            onSelected = function()
                Society.Create.blips.position = GetEntityCoords(PlayerPedId())
            end
        })
        RageUI.Button('Sprite du blips', nil, {RightLabel = Society.Create.blips.sprite or '~r~Indéifni~s~'}, true, {
            onSelected = function()
                KeyboardUtils.use('Sprite', function(data)
                    local data = tonumber(data)

                    if data == nil then return end

                    Society.Create.blips.sprite = data
                end)
            end
        })
        RageUI.Button('Couleur du blips', nil, {RightLabel = Society.Create.blips.color or '~r~Indéifni~s~'}, true, {
            onSelected = function()
                KeyboardUtils.use('Couleur', function(data)
                    local data = tonumber(data)
                    if data == nil then return end
                    
                    Society.Create.blips.color = data
                end)
            end
        })
    end
    RageUI.Checkbox('Vestiaire', nil, Society.Create.vestiaire, {}, {
        onChecked = function()
            Society.Create.vestiaire = true
        end,
        onUnChecked = function()
            Society.Create.vestiaire = false
        end
    })
    if Society.Create.vestiaire == true then
        RageUI.Button('Position du vestiaire', nil, {RightLabel = Society.Create.vestiairePos == nil and '~r~Indéfini~s~' or '~g~Défini~s~'}, true, {
            onSelected = function()
                Society.Create.vestiairePos = GetEntityCoords(PlayerPedId())
            end
        })
    end
    RageUI.Button('Confirmer', nil, {Color = {BackgroundColor = {0,255,0,100}}}, true, {
        onSelected = function()
            if Society.Create.name == nil or Society.Create.label == nil or Society.Create.posCoffre == nil or Society.Create.posBoss == nil then return ESX.ShowNotification('Toutes les informations ne sont pas correctement remplies') end
                
            if Society.Create.blipsActive then
                if Society.Create.blips.sprite == nil or Society.Create.blips.color == nil then
                    return ESX.ShowNotification('Toutes les informations ne sont pas correctement remplies')
                end
            end

            if Society.Create.vestiaire == true then
                if Society.Create.vestiairePos == nil then
                    return ESX.ShowNotification('Toutes les informations ne sont pas correctement remplies')
                end
            end

            TriggerServerEvent('zmain:society:create', Society.Create)
        end
    })
end

function Society:openCoffreMenu(societyData)
    local societyData = Society.List[societyData.name]
    local main = RageUI.CreateMenu('', 'Actions Disponibles')

    local accountsManager = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')

    local weaponsMenu = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')
    local weaponsMenuDeposit = RageUI.CreateSubMenu(weaponsMenu, '', 'Actions Disponibles')

    local itemsMenu = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')
    local itemsMenuDeposit = RageUI.CreateSubMenu(itemsMenu, '', 'Actions Disponibles')

    local clothesMenu = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')
    local clothesMenuDeposit = RageUI.CreateSubMenu(clothesMenu, '', 'Actions Disponibles')

    RageUI.Visible(main, not RageUI.Visible(main))
    FreezeEntityPosition(PlayerPedId(), true)
    while main do Wait(1)
        RageUI.IsVisible(main, function()
            RageUI.Button('Argent Propre', nil, {RightLabel = ('~g~%s$~s~'):format(societyData.coffre['accounts'].cash)}, true, {
                onSelected = function()
                    Society.AccountSelected = 'cash'
                end
            }, accountsManager)
            RageUI.Button('Argent Sale', nil, {RightLabel = ('~r~%s$~s~'):format(societyData.coffre['accounts'].black_money)}, true, {
                onSelected = function()
                    Society.AccountSelected = 'black_money'
                end
            }, accountsManager)
            RageUI.Button('Arme(s)', nil, {}, Society:havePermission(societyData.name, 'weapons_chest'), {
                onSeleceted = function()
                end
            }, weaponsMenu)
            RageUI.Button('Item(s)', nil, {}, Society:havePermission(societyData.name, 'items_chest'), {
                onSeleceted = function()
                end
            }, itemsMenu)
            RageUI.Button('Tenue(s)', nil, {}, false, {
                onSelected = function()
                    
                end
            }, clothesMenu)
        end)

        RageUI.IsVisible(accountsManager, function()
            RageUI.Separator(('%s$'):format(societyData.coffre['accounts'][Society.AccountSelected]))
            RageUI.Button('Déposer de l\'argent', nil, {}, Society:havePermission(societyData.name, ('deposit_%s_coffre'):format(Society.AccountSelected)), {
                onSelected = function()
                    KeyboardUtils.use('Déposer de l\'argent', function(data)
                        local data = tonumber(data)

                        if data == nil then return end

                        TriggerServerEvent('zmain:society:depositMoney', societyData.name, data, Society.AccountSelected)
                    end)
                end
            })
            RageUI.Button('Retirer de l\'argent', nil, {}, Society:havePermission(societyData.name, ('withdraw_%s_coffre'):format(Society.AccountSelected)), {
                onSelected = function()
                    KeyboardUtils.use('Retirer de l\'argent', function(data)
                        local data = tonumber(data)

                        if data == nil then return end

                        TriggerServerEvent('zmain:society:withDrawMoney', societyData.name, data, Society.AccountSelected)
                    end)
                end
            })
        end)

        RageUI.IsVisible(weaponsMenu, function()
            RageUI.Button('Déposer une arme', nil, {}, Society:havePermission(societyData.name, 'deposit_weapon_chest'), {
                onSelected = function()
                    
                end
            }, weaponsMenuDeposit)
            RageUI.Line()
            for k,v in pairs(societyData.coffre['weapons']) do
                RageUI.Button(('%s'):format(v.label), nil, {RightLabel = ('~r~x%s~s~'):format(v.ammo)},  Society:havePermission(societyData.name, 'remove_weapon_chest'), {
                    onSelected = function()
                        KeyboardUtils.use('Taper Y pour valider', function(data)
                            if data == 'y' or data == 'Y' then
                                TriggerServerEvent('zmain:society:removeWeapon', societyData.name, v)
                            end
                        end)
                    end
                })
            end
        end)

        RageUI.IsVisible(weaponsMenuDeposit, function()
            ESX.PlayerData.loadout = ESX.GetPlayerData().loadout

            for k,v in pairs(ESX.PlayerData.loadout) do
                if HasPedGotWeapon(PlayerPedId(), GetHashKey(v.name), false) then
                    RageUI.Button(('%s'):format(v.label), nil, {RightLabel = ('~r~x%s~s~'):format(v.ammo)}, true, {
                        onSelected = function()
                            KeyboardUtils.use('Taper Y pour valider', function(data)
                                if data == 'y' or data == 'Y' then
                                    TriggerServerEvent('zmain:society:addWeapon', societyData.name, v)
                                end
                            end)
                        end
                    })
                end
            end
        end)

        RageUI.IsVisible(itemsMenu, function()
            RageUI.Button('Déposer un item', nil, {}, Society:havePermission(societyData.name, 'deposit_item_chest'), {
                onSelected = function()
                    
                end
            }, itemsMenuDeposit)
            RageUI.Line()
            for k,v in pairs(societyData.coffre['items']) do
                RageUI.Button(('%s'):format(v.label), nil, {RightLabel = ('~r~x%s~s~'):format(v.count)}, Society:havePermission(societyData.name, 'remove_item_chest'), {
                    onSelected = function()
                        KeyboardUtils.use('Quantité', function(data)
                            local data = tonumber(data)
                            if data == nil then return end

                            TriggerServerEvent('zmain:society:removeItem', societyData.name, v, data)
                        end)
                    end
                })
            end
        end)

        RageUI.IsVisible(itemsMenuDeposit, function()
            ESX.PlayerData.inventory = ESX.GetPlayerData().inventory

            for k,v in pairs(ESX.PlayerData.inventory) do
                RageUI.Button(('%s'):format(v.label), nil, {RightLabel = ('~r~x%s~s~'):format(v.count)}, true, {
                    onSelected = function()
                        KeyboardUtils.use('Quantité', function(data)
                            local data = tonumber(data)
                            if data == nil then return end

                            TriggerServerEvent('zmain:society:addItem', societyData.name, v, data)

                        end)
                    end
                })
            end
        end)

        RageUI.IsVisible(clothesMenu, function()
            RageUI.Button('Déposer une tenue', nil, {}, true, {
                onSelected = function()
                    
                end
            }, clothesMenuDeposit)
            RageUI.Line()
        end)

        RageUI.IsVisible(clothesMenuDeposit, function()
            
        end)

        if not RageUI.Visible(main) and not RageUI.Visible(accountsManager) and not RageUI.Visible(weaponsMenu) and not RageUI.Visible(weaponsMenuDeposit) and not RageUI.Visible(itemsMenu) and not RageUI.Visible(itemsMenuDeposit) and not RageUI.Visible(clothesMenu) and not RageUI.Visible(clothesMenuDeposit) then
            main = RMenu:DeleteType('main')
            FreezeEntityPosition(PlayerPedId(), false)
        end
    end
end

RegisterNetEvent('zmain:society:updateCoffre', function(society)
    Society.List[society.name].coffre = society.coffre
end)

function Society:openBoss(societyData)
    local societyData = Society.List[societyData.name]
    local main = RageUI.CreateMenu('', 'Actions Disponibles')

    local societyMoney = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')

    local gradesManager = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')
    local selectedGradesManager = RageUI.CreateSubMenu(gradesManager, '', 'Actions Disponibles')

    local addPermissionsFromGrade = RageUI.CreateSubMenu(selectedGradesManager, '', 'Actions Disponibles')

    local createGrade = RageUI.CreateSubMenu(gradesManager, '', 'Actions Disponibles')
    local addPermissionsCreateGrad = RageUI.CreateSubMenu(createGrade, '', 'Actions Disponibles')

    local employedList = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')
    local employedSelected = RageUI.CreateSubMenu(employedList, '', 'Actions Disponibles')

    local openInventoryMenu = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')
    local openInventoryWeaponsMenu = RageUI.CreateSubMenu(openInventoryMenu, '', 'Actions Disponibles')
    local weaponsMenuDeposit = RageUI.CreateSubMenu(openInventoryWeaponsMenu, '', 'Actions Disponibles')
    local openInventoryItemsMenu = RageUI.CreateSubMenu(openInventoryMenu, '', 'Actions Disponibles')
    local itemsMenuDeposit = RageUI.CreateSubMenu(openInventoryItemsMenu, '', 'Actions Disponibles')

    local recruitPlayer = RageUI.CreateSubMenu(employedList, '', 'Actions Disponibles')

    RageUI.Visible(main, not RageUI.Visible(main))
    FreezeEntityPosition(PlayerPedId(), true)
    while main do Wait(1)
        RageUI.IsVisible(main, function()
            RageUI.Line()
            RageUI.Separator(('Société [~y~%s - %s~s~]'):format(societyData.name, societyData.label))
            RageUI.Button('Argent de la société', nil, {RightLabel = ('~y~%s$~s~'):format(societyData.coffre['accounts'].society)}, true, {
                onSelected = function()
                end
            }, societyMoney)
            RageUI.Button('Coffre', nil, {RightBadge = RageUI.BadgeStyle.Star}, Society:havePermission(societyData.name, 'chest'), {
                onSelected = function()
                end
            }, openInventoryMenu)
            RageUI.Button('Gérer les grades', nil, {RightBadge = RageUI.BadgeStyle.Star}, Society:havePermission(societyData.name, 'manage_grades'), {
                onSelected = function()
                    
                end
            }, gradesManager)
            RageUI.Button('Gérer les employés', nil, {RightBadge = RageUI.BadgeStyle.Star}, Society:havePermission(societyData.name, 'manage_employeds'), {
                onSelected = function()
                    ESX.TriggerServerCallback('zmain:society:employedList', function(cb)
                        if not cb then return end
                        Society.List[societyData.name].employeds = cb
                        societyData.employeds = cb

                        RageUI.Visible(employedList, true)
                    end, societyData.name)
                end
            })
            RageUI.Line()
        end)

        RageUI.IsVisible(societyMoney, function()
            RageUI.Button('Déposer de l\'argent', nil, {}, Society:havePermission(societyData.name, 'deposit_money_society'), {
                onSelected = function()
                    KeyboardUtils.use('Déposer de l\'argent', function(data)
                        local data = tonumber(data)

                        if data == nil then return end

                        TriggerServerEvent('zmain:society:depositMoney', societyData.name, data, 'society')
                    end)
                end
            })
            RageUI.Button('Retirer de l\'argent', nil, {}, Society:havePermission(societyData.name, 'withdraw_money_society'), {
                onSelected = function()
                    KeyboardUtils.use('Retirer de l\'argent', function(data)
                        local data = tonumber(data)

                         if data == nil then return end

                        TriggerServerEvent('zmain:society:withDrawMoney', societyData.name, data, 'society')
                    end)
                end
            })
        end)

        RageUI.IsVisible(gradesManager, function()
            RageUI.Button('Créer un nouveau Grade', nil, {RightBadge = RageUI.BadgeStyle.Star}, Society:havePermission(societyData.name, 'create_grade') and societyData.name ~= 'police' and societyData.name ~= 'bcso', {
                onSelected = function()
                    if #societyData.grades >= 15 then
                        return ESX.ShowNotification('Il y a trop de grade enregistré')
                    end

                    RageUI.Visible(createGrade, true)
                end
            })
            RageUI.Line()
            for k,v in ipairs(societyData.grades) do
                RageUI.Button(('[%s] %s - (%s)'):format(v.grade, v.name, v.label), nil, {}, Society:havePermission(societyData.name, 'manage_grades'), {
                    onSelected = function()
                        Society.Grades.Create.GradeId = k
                        Society.Grades.Selected = v
                        Society.Grades.Create.Index = tonumber(v.grade)
                        Society.Grades.Create.OldName = v.name
                    end
                }, selectedGradesManager)
            end
        end)

        RageUI.IsVisible(selectedGradesManager, function()
            if Society.Grades.Create.GradeId ~= nil then
                RageUI.Button('Changer le nom', nil, {RightLabel = societyData.grades[Society.Grades.Create.GradeId].name}, Society:havePermission(societyData.name, 'rename_grade') and societyData.name ~= 'police' and societyData.name ~= 'bcso', {
                    onSelected = function()
                        if Society.Grades.Selected.name == 'boss' then
                            return ESX.ShowNotification('Vous ne pouvez changer le nom de ce grade')
                        end
                        KeyboardUtils.use('Nouveau nom', function(data)
                            if data == nil then return end
    
                            societyData.grades[Society.Grades.Create.GradeId].name = data
    
                            TriggerServerEvent('zmain:society:grades:edit', societyData.name, Society.Grades.Create.GradeId, societyData.grades[Society.Grades.Create.GradeId], Society.Grades.Create.OldName)
                        end)
                    end
                })
                RageUI.Button('Changer le nom d\'affichage', nil, {RightLabel = societyData.grades[Society.Grades.Create.GradeId].label}, Society:havePermission(societyData.name, 'rename_label_grade'), {
                    onSelected = function()
                        KeyboardUtils.use('Nouveau label', function(data)
                            if data == nil then return end
    
                            societyData.grades[Society.Grades.Create.GradeId].label = data
    
                            TriggerServerEvent('zmain:society:grades:edit', societyData.name, Society.Grades.Create.GradeId, societyData.grades[Society.Grades.Create.GradeId], Society.Grades.Create.OldName)
                        end)
                    end
                })
                RageUI.Button('Changer le salaire', nil, {RightLabel = societyData.grades[Society.Grades.Create.GradeId].salary}, Society:havePermission(societyData.name, 'change_salary_grade'), {
                    onSelected = function()
                        KeyboardUtils.use('Nouveau salaire', function(data)
                            local data = tonumber(data)
                            if data == nil then return end
    
                            societyData.grades[Society.Grades.Create.GradeId].salary = data
    
                            TriggerServerEvent('zmain:society:grades:edit', societyData.name, Society.Grades.Create.GradeId, societyData.grades[Society.Grades.Create.GradeId], Society.Grades.Create.OldName, 'num')
                        end)
                    end
                })
                RageUI.List('Changer le numéro', Society.Grades.Create.List, Society.Grades.Create.Index, '[ENTER] pour valider', {}, Society:havePermission(societyData.name, 'change_number_grade'), {
                    onListChange = function(Index)
                        Society.Grades.Create.Index = Index
                    end,
                    onSelected = function(Index)
                        for k,v in pairs(societyData.grades) do
                            if tonumber(v.grade) == tonumber(Index) then
                                return ESX.ShowNotification('Ce numéro de grade est déjà utilisé')
                            end
                        end

                        societyData.grades[Society.Grades.Create.GradeId].grade = Index

                        TriggerServerEvent('zmain:society:grades:edit', societyData.name, Society.Grades.Create.GradeId, societyData.grades[Society.Grades.Create.GradeId], Society.Grades.Create.OldName, 'num', Society.Grades.Create.GradeId)
                    end
                })
                RageUI.Button('Modifier les permissions', nil, {}, Society:havePermission(societyData.name, 'change_permissions_grade'), {
                    onSelected = function()
                        for k,v in pairs(Society.Grades.Permissions) do
                            if societyData.permissions[k] == nil then societyData.permissions[k] = {} end
                            for i,p in pairs(societyData.permissions[k]) do
                                if Society.Grades.Permissions[k] == nil then Society.Grades.Permissions[k] = {
                                    ['boss'] = true,
                                } end
                                if societyData.permissions[k][Society.Grades.Selected.name] == nil then Society.Grades.Permissions[k][Society.Grades.Selected.name] = false end
                            end
                        end

                        RageUI.Visible(addPermissionsFromGrade, true)
                    end
                })
                RageUI.Line()
                RageUI.Button('Supprimer le grade', nil, {Color = {BackgroundColor = {255,0,0,100}}}, Society:havePermission(societyData.name, 'delete_grade') and societyData.name ~= 'police' and societyData.name ~= 'bcso', {
                    onSelected = function()
                        if Society.Grades.Selected.name == 'boss' then return ESX.ShowNotification('Vous ne pouvez pas supprimer ce grade') end
    
                        KeyboardUtils.use('Taper Y pour valider', function(data)
                            if data == 'y' or data =='Y' then
                                TriggerServerEvent('zmain:society:grades:delete', societyData.name, Society.Grades.Create.GradeId, Society.Grades.Selected.name)

                                RageUI.GoBack()
                            end
                        end)
                    end
                })
            end
        end)

        RageUI.IsVisible(addPermissionsFromGrade, function()
            RageUI.Button('Rechercher', nil, {RightBadge = RageUI.BadgeStyle.Star}, true, {
                onSelected = function()
                    KeyboardUtils.use('Recherche', function(data)
                        Society.Grades.PermissionsSearch = data
                    end)
                end
            })
            if Society.Grades.PermissionsSearch then
                RageUI.Button('Stopper la recherche', nil, {RightLabel = '>'}, true, {
                    onSelected = function()
                        Society.Grades.PermissionsSearch = nil
                    end
                })
            end
            RageUI.Button('Confirmer les modifications', nil, {RightBadge = RageUI.BadgeStyle.Star}, Society.Grades.Selected.name ~= 'boss', {
                onSelected = function()
                    RageUI.CloseAll()

                    TriggerServerEvent('zmain:society:permissions:edit', societyData.name, societyData.permissions, Society.Grades.Selected)
                end
            })
            RageUI.Line()
            for k,v in pairs(Society.Grades.Permissions) do
                if societyData.permissions[k][Society.Grades.Selected.name] == nil then societyData.permissions[k][Society.Grades.Selected.name] = {} end
                local buttonName = v.label
                if not Society.Grades.PermissionsSearch then
                    RageUI.Checkbox(buttonName, nil, societyData.permissions[k][Society.Grades.Selected.name], {}, {
                        onChecked = function()
                            societyData.permissions[k][Society.Grades.Selected.name] = true
                        end,
                        onUnChecked = function()
                            if Society.Grades.Selected.name == 'boss' then return ESX.ShowNotification('Vous ne pouvez pas modifier les permissions de ce grade') end
                            societyData.permissions[k][Society.Grades.Selected.name] = false
                        end
                    })
                else
                    if string.match(string.lower(buttonName), string.lower(Society.Grades.PermissionsSearch)) then 
                        RageUI.Checkbox(buttonName, nil, societyData.permissions[k][Society.Grades.Selected.name], {}, {
                            onChecked = function()
                                societyData.permissions[k][Society.Grades.Selected.name] = true
                            end,
                            onUnChecked = function()
                                if Society.Grades.Selected.name == 'boss' then return ESX.ShowNotification('Vous ne pouvez pas modifier les permissions de ce grade') end
                                societyData.permissions[k][Society.Grades.Selected.name] = false
                            end
                        })
                    end
                end
            end
        end)

        RageUI.IsVisible(createGrade, function()
            RageUI.Button('Nom', nil, {RightLabel = Society.Grades.Create.name or '~r~Indéfini~s~'}, Society:havePermission(societyData.name, 'rename_grade'), {
                onSelected = function()
                    KeyboardUtils.use('Nom (minuscule)', function(data)
                        if data == nil then return end

                        Society.Grades.Create.name = data
                    end)
                end
            })
            RageUI.Button('Nom D\'affichage', nil, {RightLabel = Society.Grades.Create.label or '~r~Indéfini~s~'}, Society:havePermission(societyData.name, 'rename_label_grade'), {
                onSelected = function()
                    KeyboardUtils.use('Nom D\'affichage', function(data)
                        if data == nil then return end

                        Society.Grades.Create.label = data
                    end)
                end
            })
            RageUI.List('Numéro du grade', Society.Grades.Create.List, Society.Grades.Create.Index, nil, {}, Society:havePermission(societyData.name, 'change_number_grade'), {
                onListChange = function(Index)
                    Society.Grades.Create.Index = Index

                    for k,v in pairs(societyData.grades) do
                        if tonumber(v.grade) == tonumber(Index) then
                            return ESX.ShowNotification('Ce numéro de grade est déjà utilisé')
                        end
                    end
                end
            })
            RageUI.Button('Salaire', nil, {RightLabel = Society.Grades.Create.salary or '~r~Indéfini~s~'}, Society:havePermission(societyData.name, 'change_salary_grade'), {
                onSelected = function()
                    KeyboardUtils.use('Salaire', function(data)
                        local data = tonumber(data)
                        if data == nil then return end

                        Society.Grades.Create.salary = data
                    end)
                end
            })
            RageUI.Button('Permissions', nil, {}, Society:havePermission(societyData.name, 'change_permissions_grade'), {
                onSelected = function()
                    if Society.Grades.Create.name == nil then return end
                    for k,v in pairs(Society.Grades.Permissions) do
                        for i,p in pairs(Society.Grades.Create.permissions[k]) do
                            if Society.Grades.Create.permissions[k][Society.Grades.Create.name] == nil then Society.Grades.Create.permissions[k][Society.Grades.Create.name] = false end
                        end
                    end
                end
            }, addPermissionsCreateGrad)
            RageUI.Button('Confirmer', nil, {Color = {BackgroundColor = {0,255,0,155}}}, Society:havePermission(societyData.name, 'create_grade'), {
                onSelected = function()
                    for k,v in pairs(societyData.grades) do
                        if v.grade == Society.Grades.Create.Index then
                            return ESX.ShowNotification('Ce numéro de grade est déjà utilisé')
                        end
                    end

                    if Society.Grades.Create.name == nil or Society.Grades.Create.label == nil or Society.Grades.Create.salary == nil then return ESX.ShowNotification('Toutes les informations ne sont pas complétement replies') end

                    TriggerServerEvent('zmain:society:grade:create', societyData.name, Society.Grades.Create)
                end
            })
        end)

        RageUI.IsVisible(addPermissionsCreateGrad, function()
            RageUI.Button('Rechercher', nil, {RightBadge = RageUI.BadgeStyle.Star}, true, {
                onSelected = function()
                    KeyboardUtils.use('Recherche', function(data)
                        Society.Grades.PermissionsSearch = data
                    end)
                end
            })
            if Society.Grades.PermissionsSearch then
                RageUI.Button('Stopper la recherche', nil, {RightLabel = '>'}, true, {
                    onSelected = function()
                        Society.Grades.PermissionsSearch = nil
                    end
                })
            end
            for k,v in pairs(Society.Grades.Permissions) do
                local buttonName = v.label
                if not Society.Grades.PermissionsSearch then
                    RageUI.Checkbox(buttonName, nil, Society.Grades.Create.permissions[k][Society.Grades.Create.name], {}, {
                        onChecked = function()
                            Society.Grades.Create.permissions[k][Society.Grades.Create.name] = true
                        end,
                        onUnChecked = function()
                            Society.Grades.Create.permissions[k][Society.Grades.Create.name] = false
                        end
                    })
                else
                    if string.match(string.lower(buttonName), string.lower(Society.Grades.PermissionsSearch)) then 
                        RageUI.Checkbox(buttonName, nil, Society.Grades.Create.permissions[k][Society.Grades.Create.name], {}, {
                            onChecked = function()
                                Society.Grades.Create.permissions[k][Society.Grades.Create.name] = true
                            end,
                            onUnChecked = function()
                                Society.Grades.Create.permissions[k][Society.Grades.Create.name] = false
                            end
                        })
                    end
                end
            end
        end)

        RageUI.IsVisible(employedList, function()
            RageUI.Button('Recruter joueur le plus proche', nil, {Color = {BackgroundColor = {0,255,0,100}}}, Society:havePermission(societyData.name, 'recruit_player'), {
                onSelected = function()

                end
            }, recruitPlayer)
            RageUI.Line()
            for k,v in pairs(societyData.employeds) do
                RageUI.Button(('(%s) (%s) [%s] %s %s'):format(v.UniqueID, v.job.grade_label, v.name, v.firstName, v.lastName), nil, {RightBadge = RageUI.BadgeStyle.Star}, true, {
                    onSelected = function()
                        Society.SelectedEmployed = v

                        RageUI.Visible(employedSelected, true)
                    end
                })
            end
        end)

        RageUI.IsVisible(recruitPlayer, function()
            for k,v in pairs(societyData.grades) do
                RageUI.Button(v.label, nil, {}, true, {
                    onSelected = function()
                        local player, distance = ESX.Game.GetClosestPlayer()

                        if distance == -1 or distance > 3 then return(
                            ESX.ShowNotification('Personne aux alentours !')
                        )end

                        TriggerServerEvent('zmain:society:recruit', societyData.name, GetPlayerServerId(player), v.grade)

                        RageUI.GoBack()
                    end
                })
            end
        end)

        RageUI.IsVisible(employedSelected, function()
            RageUI.Separator(('(%s) [%s] %s %s'):format(Society.SelectedEmployed.UniqueID, Society.SelectedEmployed.name, Society.SelectedEmployed.firstName, Society.SelectedEmployed.lastName))
            RageUI.Line()
            RageUI.Button('Augmenter', nil, {}, Society:havePermission(societyData.name, 'promote_player'), {
                onSelected = function()
                    KeyboardUtils.use('Taper Y pour valider', function(data)
                        if data == 'y' or data == 'Y' then
                            TriggerServerEvent('zmain:society:promote', societyData.name, Society.SelectedEmployed)
                        end
                    end)
                end
            })
            RageUI.Button('Descendre', nil, {}, Society:havePermission(societyData.name, 'unmote_player'), {
                onSelected = function()
                    KeyboardUtils.use('Taper Y pour valider', function(data)
                        if data == 'y' or data == 'Y' then
                            TriggerServerEvent('zmain:society:unmote', societyData.name, Society.SelectedEmployed)
                        end
                    end)
                end
            })
            RageUI.Button('Virer', nil, {Color = {BackgroundColor = {255,0,0,100}}}, Society:havePermission(societyData.name, 'demote_player'), {
                onSelected = function()
                    KeyboardUtils.use('Taper Y pour valider', function(data)
                        if data == 'y' or data == 'Y' then
                            TriggerServerEvent('zmain:society:demote', societyData.name, Society.SelectedEmployed)

                            SetTimeout(300, function()
                                ESX.TriggerServerCallback('zmain:society:employedList', function(cb)
                                    if not cb then return end
                                    Society.List[societyData.name].employeds = cb
                                    societyData.employeds = cb
                                    RageUI.GoBack()
                                end, societyData.name)
                            end)
                        end
                    end)
                end
            })
        end)

        RageUI.IsVisible(openInventoryMenu, function()
            RageUI.Button('Arme(s)', nil, {}, Society:havePermission(societyData.name, 'weapons_chest_society'), {
                onSelected = function()
                end
            }, openInventoryWeaponsMenu)
            RageUI.Button('Item(s)', nil, {}, Society:havePermission(societyData.name, 'items_chest:society'), {
                onSelected = function()
                end
            }, openInventoryItemsMenu)
        end)

        RageUI.IsVisible(openInventoryWeaponsMenu, function()
            if societyData.coffre['weapons_boss'] == nil then societyData.coffre['weapons_boss'] = {} end
            RageUI.Button('Déposer une arme', nil, {}, Society:havePermission(societyData.name, 'deposit_weapon_chest_society'), {
                onSelected = function()
                    
                end
            }, weaponsMenuDeposit)
            RageUI.Line()
            for k,v in pairs(societyData.coffre['weapons_boss']) do
                RageUI.Button(('%s'):format(v.label), nil, {RightLabel = ('~r~x%s~s~'):format(v.ammo)}, Society:havePermission(societyData.name, 'remove_weapon_chest_society'), {
                    onSelected = function()
                        KeyboardUtils.use('Taper Y pour valider', function(data)
                            if data == 'y' or data == 'Y' then
                                TriggerServerEvent('zmain:society:removeWeaponBoss', societyData.name, v)
                            end
                        end)
                    end
                })
            end
        end)

        RageUI.IsVisible(weaponsMenuDeposit, function()
            ESX.PlayerData.loadout = ESX.GetPlayerData().loadout

            for k,v in pairs(ESX.PlayerData.loadout) do
                if HasPedGotWeapon(PlayerPedId(), GetHashKey(v.name), false) then
                    RageUI.Button(('%s'):format(v.label), nil, {RightLabel = ('~r~x%s~s~'):format(v.ammo)}, true, {
                        onSelected = function()
                            KeyboardUtils.use('Taper Y pour valider', function(data)
                                if data == 'y' or data == 'Y' then
                                    TriggerServerEvent('zmain:society:addWeaponBoss', societyData.name, v)
                                end
                            end)
                        end
                    })
                end
            end
        end)

        RageUI.IsVisible(openInventoryItemsMenu, function()
            if societyData.coffre['items_boss'] == nil then societyData.coffre['items_boss'] = {} end
            RageUI.Button('Déposer un item', nil, {}, Society:havePermission(societyData.name, 'dposit_item_chest_society'), {
                onSelected = function()
                    
                end
            }, itemsMenuDeposit)
            RageUI.Line()
            for k,v in pairs(societyData.coffre['items_boss']) do
                RageUI.Button(('%s'):format(v.label), nil, {RightLabel = ('~r~x%s~s~'):format(v.count)}, Society:havePermission(societyData.name, 'remove_item_chest_society'), {
                    onSelected = function()
                        KeyboardUtils.use('Quantité', function(data)
                            local data = tonumber(data)
                            if data == nil then return end

                            TriggerServerEvent('zmain:society:removeItemBoss', societyData.name, v, data)
                        end)
                    end
                })
            end
        end)

        RageUI.IsVisible(itemsMenuDeposit, function()
            ESX.PlayerData.inventory = ESX.GetPlayerData().inventory

            for k,v in pairs(ESX.PlayerData.inventory) do
                RageUI.Button(('%s'):format(v.label), nil, {RightLabel = ('~r~x%s~s~'):format(v.count)}, true, {
                    onSelected = function()
                        KeyboardUtils.use('Quantité', function(data)
                            local data = tonumber(data)
                            if data == nil then return end

                            TriggerServerEvent('zmain:society:addItemBoss', societyData.name, v, data)

                        end)
                    end
                })
            end
        end)

        if not RageUI.Visible(main) and not RageUI.Visible(societyMoney) and not RageUI.Visible(gradesManager) and not RageUI.Visible(selectedGradesManager) and not RageUI.Visible(addPermissionsFromGrade) and not RageUI.Visible(createGrade) and not RageUI.Visible(addPermissionsCreateGrad) and not RageUI.Visible(employedList) and not RageUI.Visible(employedSelected) and not RageUI.Visible(openInventoryMenu) and not RageUI.Visible(openInventoryWeaponsMenu) and not RageUI.Visible(weaponsMenuDeposit) and not RageUI.Visible(openInventoryItemsMenu) and not RageUI.Visible(itemsMenuDeposit) and not RageUI.Visible(recruitPlayer) then
            main = RMenu:DeleteType('main')
            FreezeEntityPosition(PlayerPedId(), false)
        end
    end
end

function Society:openCloakRoom(societyData)
    local main = RageUI.CreateMenu('', 'Actions Disponibles')
    local cloakroom = RageUI.CreateSubMenu(main, '', 'Bienvenue dans le vestaire')
    local addTenue = RageUI.CreateSubMenu(cloakroom, '', 'Actions Disponibles')
    local addSubTenue = RageUI.CreateSubMenu(addTenue, '', 'Actions Disponibles')
    local addGradeTenue = RageUI.CreateSubMenu(addSubTenue, '', 'Actions Disponibles')
    local editClothes = RageUI.CreateSubMenu(main, '', 'Editions des tenues')
    local editGrades = RageUI.CreateSubMenu(editClothes, '', 'Actions Disponibles')
    local addGradesClothes = RageUI.CreateSubMenu(editGrades, '', 'Actions Disponibles')

    local list = {
        index = 1,
        table = {'Renommer', 'Supprimer', 'Modifier les grades'}
    }

    RageUI.Visible(main, not RageUI.Visible(main))
    FreezeEntityPosition(Player.playerPed, true)
    while main do Wait(1)
        local societyData = Society.List[societyData.name]
        RageUI.IsVisible(main, function()
            RageUI.Button('Reprendre votre tenue de civil', nil, {}, true, {
                onSelected = function()
                    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                        TriggerEvent('skinchanger:loadSkin', skin)
                    end)
                end
            })
            RageUI.Button('Vestiaire', nil, {RightLabel = '>>'}, true, {
                onSelected = function()
                    
                end
            }, cloakroom)
            if Society:havePermission(societyData.name, 'editClothes') then
                RageUI.WLine()
                RageUI.Button('Ajouter une tenue', nil, {}, true, {
                    onSelected = function()
    
                    end
                }, addTenue)
                RageUI.Button('Gérer les tenues', nil, {RightBadge = RageUI.BadgeStyle.Alert}, true, {
                    onSelected = function()
                        
                    end
                }, editClothes)
            end
        end)

        RageUI.IsVisible(editClothes, function()
            for k,v in pairs(societyData.clothes) do
                RageUI.List(v.name, list.table, list.index, nil, {}, true, {
                    onListChange = function(Index)
                        list.index = Index
                    end,
                    onSelected = function()
                        if list.index == 1 then
                            KeyboardUtils.use('Nouveau nom', function(data)
                                if data == nil or date == '' then return end

                                TriggerServerEvent('zmain:society:clothes:editName', societyData.name, v.name, data)
                            end)
                        elseif list.index == 2 then
                            KeyboardUtils.use('Taper Y pour valider', function(data)
                                if data == 'Y' or data == 'y' then
                                    TriggerServerEvent('zmain:society:clothes:delete', societyData.name, v.name)
                                end
                            end)
                        elseif list.index == 3 then
                            editClothesName = v.name
                            RageUI.Visible(editGrades, true)
                        end
                    end
                })
            end
        end)

        RageUI.IsVisible(editGrades, function()
            RageUI.Button('Ajouter un grade', nil, {RightLabel = '>>'}, true, {
                onSelected = function()
                    
                end
            }, addGradesClothes)
            RageUI.WLine()
            for k,v in pairs(societyData.clothes) do
                if v.name == editClothesName then
                    for i,p in pairs(v.grades) do
                        RageUI.Button(p.name, 'Supprimer ce grade ?', {RighBadge = RageUI.BadgeStyle.Star}, true, {
                            onSelected = function()
                                table.remove(societyData.clothes.grades, k)

                                TriggerServerEvent('zmain:society:clothes:edit', societyData.name, societyData.clothes)
                            end
                        })
                    end
                end
            end
        end)

        RageUI.IsVisible(addGradesClothes, function()
            for k,v in pairs(societyData.grades) do
                if v.name == editClothesName then
                    for i,p in pairs(v.grades) do
                        if p.name ~= v.name then
                            RageUI.Button(v.label, nil, {}, true, {
                                onSelected = function()
                                    societyData.clothes.grades[v.name] = v.name

                                    TriggerServerEvent('zmain:society:clothes:edit', societyData.name, societyData.clothes)
                                end
                            })
                        end
                    end
                end
            end
        end)

        RageUI.IsVisible(addTenue, function()
            RageUI.Button('Ajouter votre tenue actuelle', nil, {}, true, {
                onSelected = function()
                    clothesparams = {
                        grade = false,
                        grades = {},
                        data = {},
                        name = 'unefined'
                    }
                    gradescount = 0
                    RageUI.Visible(addSubTenue, true)
                end
            })
        end)

        RageUI.IsVisible(addSubTenue, function()
            RageUI.Button('Nom de la tenue', nil, {}, true, {
                onSelected = function()
                    KeyboardUtils.use('Nom de la tenue', function(data)
                        if data == nil or data == '' then return end

                        clothesparams.name = data
                    end)
                end
            })
            RageUI.Checkbox('Grade spécifique', nil, clothesparams.grade, {}, {
                onChecked = function()
                    clothesparams.grade = true
                end,
                onUnChecked = function()
                    clothesparams.grade = false
                end
            })
            if clothesparams.grade == true then
                RageUI.Button('Choisir un grade', nil, {RightLabel = ('Actuellement %s grade(s)'):format(gradescount)}, true, {
                    onSelected = function()
                        
                    end
                }, addGradeTenue)
            end
            RageUI.WLine()
            RageUI.Button('Confirmer', nil, {}, true, {
                onSelected = function()
                    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                        clothesparams.data = skin

                        TriggerServerEvent('zmain:society:addClothes', societyData, clothesparams)
                    end)
                end
            })
        end)

        RageUI.IsVisible(cloakroom, function()
            for k,v in ipairs(societyData.clothes) do
                if v.grade == true then
                    RageUI.Button(v.name, nil, {RightLabel = '>>'}, v.grades[ESX.PlayerData.job.grade_name], {
                        onSelected = function()
                            ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                                TriggerEvent('skinchanger:loadClothes', skin, {
                                    ['bproof_1'] = v.data.bproof_1, ['bproof_2'] =  v.data.bproof_2,
                                    ['bags_1'] = v.data.bags_1, ['bags_2'] = v.data.bags_2,
                                    ['mask_1'] = v.data.mask_1, ['mask_2'] = v.data.mask_2,
                                    ['tshirt_1'] = v.data.tshirt_1,  ['tshirt_2'] = v.data.tshirt_2,
                                    ['torso_1'] = v.data.torso_1,   ['torso_2'] = v.data.torso_2,
                                    ['decals_1'] = v.data.decals_1,   ['decals_2'] = v.data.decals_2,
                                    ['glass_1'] = v.data.glass_1,   ['glass_2'] = v.data.glass_2,
                                    ['arms'] = v.data.arms,
                                    ['pants_1'] = v.data.pants_1,   ['pants_2'] = v.data.pants_2,
                                    ['shoes_1'] = v.data.shoes_1,   ['shoes_2'] = v.data.shoes_2,
                                    ['helmet_1'] = v.data.helmet_1,  ['helmet_2'] = v.data.helmet_2,
                                    ['chain_1'] = v.data.chain_1,    ['chain_2'] = v.data.chain_2,
                                    ['ears_1'] = v.data.ears_1,     ['ears_2'] = v.data.ears_2
                                })
                            end)
                        end
                    })
                else
                    RageUI.Button(v.name, nil, {RightLabel = '>>'}, true, {
                        onSelected = function()
                            ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                                TriggerEvent('skinchanger:loadClothes', skin, {
                                    ['bproof_1'] = v.data.bproof_1, ['bproof_2'] =  v.data.bproof_2,
                                    ['bags_1'] = v.data.bags_1, ['bags_2'] = v.data.bags_2,
                                    ['mask_1'] = v.data.mask_1, ['mask_2'] = v.data.mask_2,
                                    ['tshirt_1'] = v.data.tshirt_1,  ['tshirt_2'] = v.data.tshirt_2,
                                    ['torso_1'] = v.data.torso_1,   ['torso_2'] = v.data.torso_2,
                                    ['decals_1'] = v.data.decals_1,   ['decals_2'] = v.data.decals_2,
                                    ['glass_1'] = v.data.glass_1,   ['glass_2'] = v.data.glass_2,
                                    ['arms'] = v.data.arms,
                                    ['pants_1'] = v.data.pants_1,   ['pants_2'] = v.data.pants_2,
                                    ['shoes_1'] = v.data.shoes_1,   ['shoes_2'] = v.data.shoes_2,
                                    ['helmet_1'] = v.data.helmet_1,  ['helmet_2'] = v.data.helmet_2,
                                    ['chain_1'] = v.data.chain_1,    ['chain_2'] = v.data.chain_2,
                                    ['ears_1'] = v.data.ears_1,     ['ears_2'] = v.data.ears_2
                                })
                            end)
                        end
                    })
                end
            end
        end)

        RageUI.IsVisible(addGradeTenue, function()
            for k,v in pairs(societyData.grades) do
                if clothesparams.grades[v.name] then
                    RageUI.Button(v.label, 'Supprimer ce grade ?', {RightBadge = RageUI.BadgeStyle.Star}, true, {
                        onSelected = function()
                            clothesparams.grades[v.name] = nil
                            gradescount -= 1
                            RageUI.GoBack()
                        end
                    })
                else
                    RageUI.Button(v.label, nil, {RightLabel == '>>'}, true, {
                        onSelected = function()
                            clothesparams.grades[v.name] = v.name
                            gradescount += 1
                            RageUI.GoBack()
                        end
                    })
                end
            end
        end)

        if not RageUI.Visible(main) and not RageUI.Visible(cloakroom) and not RageUI.Visible(addTenue) and not RageUI.Visible(addSubTenue) and not RageUI.Visible(addGradeTenue) and not RageUI.Visible(editClothes) and not RageUI.Visible(editGrades) and not RageUI.Visible(addGradesClothes) then
            main = RMenu:DeleteType('main')
            FreezeEntityPosition(Player.playerPed, false)
        end
    end
end

RegisterNetEvent('zmain:society:request', function(society)
    Society.Thread = false
    while not ESXLoaded do Wait(1) end
    while not Society.SocietyLoaded do Wait(1) end
    Society.WaitNearby = 2000
    Society.Thread = true

    CreateThread(function()
        for k,v in pairs(Society.List) do
            if v.blips.active then
                local blip = AddBlipForCoord(v.blips.position.x, v.blips.position.y, v.blips.position.z)
                SetBlipSprite(blip, v.blips.sprite)
                SetBlipDisplay(blip, 4)
                SetBlipScale(blip, 0.6)
                SetBlipColour(blip, v.blips.color)
                SetBlipAsShortRange(blip, true)
                BeginTextCommandSetBlipName("STRING")
                AddTextComponentString('[SOCIETE] '..v.label)
                EndTextCommandSetBlipName(blip)
            end
        end

        if not society then return end

        local society = Society.List[society.name]

        while Society.Thread do
            Wait(Society.WaitNearby)
            Society.WaitNearby = 2000
    
            local playerPos = GetEntityCoords(PlayerPedId())
            local distCoffre = #(playerPos-vector3(society.posCoffre.x, society.posCoffre.y, society.posCoffre.z))
            local distBoss = #(playerPos-vector3(society.posBoss.x, society.posBoss.y, society.posBoss.z))
            if society.cloakroom == true or society.cloakroom == 1 then
                distCloak = #(playerPos-vector3(society.cloakpos.x, society.cloakpos.y, society.cloakpos.z))
            end
    
            if society.cloakroom == true or society.cloakroom == 1 then
                if distCoffre > 30 and distBoss > 30 and distCloak > 30 then goto continue end
            else
                if distCoffre > 30 and distBoss > 30 then goto continue end
            end

            Society.WaitNearby = 1

            if Society:havePermission(society.name, 'open_coffre') then
                DrawMarker(25, society.posCoffre.x, society.posCoffre.y,society.posCoffre.z-0.98, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.55, 0.55, 0.55, tonumber(UTILS.ServerColor.r), tonumber(UTILS.ServerColor.g), tonumber(UTILS.ServerColor.b), 255,false, false, 2, false, false, false, false)
            
                if distCoffre <= 1 then
                    DrawInstructionBarNotification(society.posCoffre.x, society.posCoffre.y,society.posCoffre.z, 'Appuyez sur [ ~g~E~w~ ] pour intéragir')
                    if IsControlJustPressed(0,54) then
                        Society:openCoffreMenu(Society.List[society.name])
                    end
                end
            end

            if Society:havePermission(society.name, 'open_boss') then
                DrawMarker(25, society.posBoss.x, society.posBoss.y,society.posBoss.z-0.98, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.55, 0.55, 0.55, tonumber(UTILS.ServerColor.r), tonumber(UTILS.ServerColor.g), tonumber(UTILS.ServerColor.b), 255,false, false, 2, false, false, false, false)
            
                if distBoss <= 1 then
                    DrawInstructionBarNotification(society.posBoss.x, society.posBoss.y,society.posBoss.z, 'Appuyez sur [ ~g~E~w~ ] pour intéragir')
                    if IsControlJustPressed(0,54) then
                        Society:openBoss(Society.List[society.name])
                    end
                end
            end

            if society.cloakroom == true or society.cloakroom == 1 then
                DrawMarker(25, society.cloakpos.x, society.cloakpos.y,society.cloakpos.z-0.98, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.55, 0.55, 0.55, tonumber(UTILS.ServerColor.r), tonumber(UTILS.ServerColor.g), tonumber(UTILS.ServerColor.b), 255,false, false, 2, false, false, false, false)
            
                if distCloak <= 1 then
                    DrawInstructionBarNotification(society.cloakpos.x, society.cloakpos.y,society.cloakpos.z, 'Appuyez sur [ ~g~E~w~ ] pour intéragir')
                    if IsControlJustPressed(0,54) then
                        Society:openCloakRoom(Society.List[society.name])
                    end
                end
            end

            ::continue::

            if not Society.List[society.name] or not Society.List[ESX.PlayerData.job.name] then
                Society.Thread = false
                break
                return
            end
        end
    end)
end)

AddEventHandler('esx:setJob', function(job)
    Wait(2500)
    Society.Thread = false
    if Society.Thread == true then return end

    if Society.List[job.name] then
        TriggerServerEvent('zmain:society:request')
    end
end)

RegisterNetEvent('zmain:society:add', function(k,data)
    Society.Thread = false

    Society.List[k] = data
    TriggerServerEvent('zmain:society:request')
end)

RegisterNetEvent('zmain:society:permissions:edit', function(societyName, data)
    Society.Thread = false

    Society.List[societyName].permissions = data

    TriggerServerEvent('zmain:society:request')
end)

RegisterNetEvent('zmain:society:grades:refresh', function(societyName, data)
    Society.List[societyName].grades = data
end)

RegisterNetEvent('zmain:society:updateWithSocietyName', function(societyName, v)
    Society.List[societyName] = v
end)