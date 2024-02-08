Society = {
    List = {},

    object = {},

    DefaultPermissions = {
        ['open_coffre'] = {
            ['boss'] = true
        },
        ['open_boss'] = {
            ['boss'] = true
        },
        ['deposit_cash_coffre'] = {
            ['boss'] = true
        },
        ['withdraw_cash_coffre'] = {
            ['boss'] = true
        },
        ['withdraw_black_money_coffre'] = {
            ['boss'] = true
        },
        ['deposit_black_money_coffre'] = {
            ['boss'] = true
        },
        ['weapons_chest'] = {
            ['boss'] = true
        },
        ['items_chest'] = {
            ['boss'] = true
        },
        ['deposit_weapon_chest'] = {
            ['boss'] = true
        },
        ['remove_weapon_chest'] = {
            ['boss'] = true
        },
        ['deposit_item_chest'] = {
            ['boss'] = true
        },
        ['remove_item_chest'] = {
            ['boss'] = true
        },
        ['deposit_money_society'] = {
            ['boss'] = true
        },
        ['withdraw_money_society'] = {
            ['boss'] = true
        },
        ['chest'] = {
            ['boss'] = true
        },
        ['weapons_chest_society'] = {
            ['boss'] = true
        },
        ['items_chest:society'] = {
            ['boss'] = true
        },
        ['deposit_weapon_chest_society'] = {
            ['boss'] = true
        },
        ['remove_weapon_chest_society'] = {
            ['boss'] = true
        },
        ['dposit_item_chest_society'] = {
            ['boss'] = true
        },
        ['remove_item_chest_society'] = {
            ['boss'] = true
        },
        ['manage_grades'] = {
            ['boss'] = true
        },
        ['manage_employeds'] = {
            ['boss'] = true
        },
        ['create_grade'] = {
            ['boss'] = true
        },
        ['delete_grade'] = {
            ['boss'] = true
        },
        ['rename_grade'] = {
            ['boss'] = true
        },
        ['rename_label_grade'] = {
            ['boss'] = true
        },
        ['change_number_grade'] = {
            ['boss'] = true
        },
        ['change_permissions_grade'] = {
            ['boss'] = true
        },
        ['change_salary_grade'] = {
            ['boss'] = true
        },
        ['recruit_player'] = {
            ['boss'] = true
        },
        ['promote_player'] = {
            ['boss'] = true
        },
        ['unmote_player'] = {
            ['boss'] = true
        },
        ['demote_player'] = {
            ['boss'] = true
        },
        ['editClothes'] = {
            ['boss'] = true
        }
    }
}

local __instance = {__index, Society.object}

function Society:getSociety(name)
    if name == nil then return end
    if not Society.List[name] then return false end

    return Society.List[name]
end

setmetatable(Society.object, {
    __call = function(_, name, data)
        local society = setmetatable({}, __instance)

        society.name = name
        society.label = data.label
        society.coffre = data.coffre
        society.permissions = data.permissions
        society.coffre = data.coffre
        society.posCoffre = data.posCoffre
        society.posBoss = data.posBoss
        society.grades = data.grades
        society.employeds = {}
        society.state = false
        society.blips = data.blips
        society.tax = data.tax
        society.cloakroom = data.cloakroom
        society.clothes = data.clothes
        society.cloakpos = data.cloakpos

        function society:save(name)
            MySQL.Sync.execute('UPDATE society_data SET name = @name, label = @label, permissions = @permissions, coffre = @coffre, blips = @blips, posCoffre = @posCoffre, posBoss = @posBoss, tax = @tax, cloakromm = @cloakromm, cloakpos = @cloakpos WHERE name = @name', {
                ['@name'] = name,
                ['@label'] = society.label,
                ['@permissions'] = json.encode(society.permissions),
                ['@coffre'] = json.encode(society.coffre),
                ['@blips'] = json.encode(society.blips),
                ['@posCoffre'] = json.encode(society.posCoffre),
                ['@posBoss'] = json.encode(society.posBoss),
                ['@tax'] = society.tax,
                ['@cloakromm'] = society.cloakroom,
                ['@cloakpos'] = json.encode(society.cloakpos)
            }) 

            ESX.toConsole(('^3Save^0 ^3Society^0 %s (%s)'):format(society.name, society.label))
        end
        
        function society:havePermission(permissionName, playerGrade)
            if not permissionName then return end
            if not playerGrade then return end
            if not society.permissions[permissionName] then
                    society.permissionName[permissionName] = {}
                return
            end
            if not society.permissionName[permissionName][playerGrade] then return end

            return true
        end

        function society:updateCoffre()
            local players = ESX.GetExtendedPlayers('job', society.name)
        
            for k,v in pairs(players) do
                TriggerClientEvent('zmain:society:updateCoffre', v.source, society)
            end

            society:save(society.name)
        end

        society.addSocietyMoney = function(amount)
            local amount = tonumber(amount)
            society.coffre['accounts'].society += amount
            society:save(society.name)
        end

        society.getSocietyMoney = function(amount)
            return society.coffre['accounts'].society
        end

        society.addMoney = function(account, amount)
            society.coffre['accounts'][account] += amount
            society:save(society.name)

            society:updateCoffre()
        end

        society.removeMoney  = function(account, amount)
            society.coffre['accounts'][account] -= amount
            society:save(society.name)

            society:updateCoffre()
        end

        society.addWeapon = function(name, label, ammo)
            local weaponNumber = 0
            for k,v in pairs(society.coffre['weapons']) do
                weaponNumber += 1
            end
            society.coffre['weapons'][name..weaponNumber] = {
                name = name,
                label = label,
                ammo = ammo,
                number = weaponNumber,
            }

            society:updateCoffre()
        end

        society.addWeaponBoss = function(name, label, ammo)
            local weaponNumber = 0
            for k,v in pairs(society.coffre['weapons_boss']) do
                weaponNumber += 1
            end
            society.coffre['weapons_boss'][name..weaponNumber] = {
                name = name,
                label = label,
                ammo = ammo,
                number = weaponNumber,
            }

            society:updateCoffre()
        end

        society.removeWeaponBoss = function(name)
            if not society.coffre['weapons_boss'][name] then return end

            society.coffre['weapons_boss'][name] = nil

            society:updateCoffre()
        end

        society.removeWeapon = function(name)
            if not society.coffre['weapons'][name] then return end

            society.coffre['weapons'][name] = nil

            society:updateCoffre()
        end

        society.addItem = function(name, label, count)
            if society.coffre['items'][name] == nil then
                society.coffre['items'][name] = {
                    name = name,
                    label = label,
                    count = count
                }
            else
                society.coffre['items'][name].count += count
            end

            society:updateCoffre()
        end


        society.removeItem = function(name, count)
            if not society.coffre['items'][name] then return end

            society.coffre['items'][name].count -= count

            if society.coffre['items'][name].count <= 0 then
                society.coffre['items'][name] = nil
            end

            society:updateCoffre()
        end

        society.addItemBoss = function(name, label, count)
            if society.coffre['items_boss'][name] == nil then
                society.coffre['items_boss'][name] = {
                    name = name,
                    label = label,
                    count = count
                }
            else
                society.coffre['items_boss'][name].count += count
            end

            society:updateCoffre()
        end

        society.removeItemBoss = function(name, count)
            if not society.coffre['items_boss'][name] then return end

            society.coffre['items_boss'][name].count -= count

            if society.coffre['items_boss'][name].count <= 0 then
                society.coffre['items_boss'][name] = nil
            end

            society:updateCoffre()
        end

        society.haveSocietyMoney = function(money)
            if society.coffre['accounts'].society < money then return false end

            return true
        end

        society.removeSocietyMoney = function(money)
            if not money then return end
            if money == nil then return end
            local money = tonumber(money)
            if society.coffre == nil then return end
            if society.coffre['accounts'] == nil then return end
            if society.coffre['accounts'].society < money then return end
            society.coffre['accounts'].society -= money

            society:updateCoffre()
        end

        society.addSocietyMoney = function(money)
            society.coffre['accounts'].society += tonumber(money)

            society:updateCoffre()
        end

        society.editPermissions = function(data)
            society.permissions = data

            society:save(name)
        end

        society.saveGrade = function(oldName, name, label, salary, grade)
            MySQL.Async.execute('UPDATE job_grades SET name = @name, label = @label, salary = @salary, grade = @grade WHERE job_name = @job_name and name = @oldName', {
                ['@job_name'] = society.name,
                ['@oldName'] = oldName,
                ['@name'] = name,
                ['@label'] = label,
                ['@salary'] = salary,
                ['@grade'] = grade
            })
        end

        society.deleteGrade = function(gradeId, gradeName)
            table.remove(society.grades, gradeId)
            MySQL.Async.execute('DELETE FROM job_grades WHERE name = @name AND job_name = @job_name', {
                ['@job_name'] = society.name,
                ['@name'] = gradeName
            }) 
        end

        function society:employedList()
            society.employeds = {}
            local send = false

            local players = ESX.GetExtendedPlayers('job', society.name)

            for k,v in pairs(players) do
                society.employeds[v.UniqueID] = {
                    UniqueID = v.UniqueID,
                    id = v.source,
                    name = v.name,
                    firstName = v.firstname,
                    lastName = v.lastname,
                    job = v.job,
                }
            end

            MySQL.Async.fetchAll('SELECT * FROM users WHERE job = @job', {
                ['@job'] = society.name
            }, function(result)
                for k,v in pairs(result) do
                    if not society.employeds[v.UniqueID] then
                        society.employeds[v.UniqueID] = {
                            UniqueID = v.UniqueID,
                            id = nil,
                            name = v.playerName,
                            firstName = v.firstname,
                            lastName = v.lastname,
                            job = v.job
                        } 
                    end
                end

                send = true
            end)

            while send == false do Wait(20) end

            return society.employeds
        end

        function society:promotePlayer(xPlayer, player)
            if xPlayer then
                xPlayer.setJob(society.name, player.job.grade + 1)
            else
                MySQL.Async.execute('UPDATE users SET job_grade = @job_grade WHERE UniqueID = @UniqueID', {
                    ['@UniqueID'] = player.UniqueID,
                    ['@job_grade'] = player.job.grade + 1
                }, function()
                    
                end)
            end
        end

        function society:unomotePlayer(xPlayer, player)
            if xPlayer then
                xPlayer.setJob(society.name, player.job.grade - 1)
            else
                MySQL.Async.execute('UPDATE users SET job_grade = @job_grade WHERE UniqueID = @UniqueID', {
                    ['@UniqueID'] = player.UniqueID,
                    ['@job_grade'] = player.job.grade - 1
                }, function()
                    
                end)
            end
        end

        function society:demotePlayer(xPlayer, player)
            if xPlayer then
                xPlayer.setJob('unemployed', 0)
            else
                MySQL.Async.execute('UPDATE users SET job = @job, job_grade = @job_grade WHERE UniqueID = @UniqueID', {
                    ['@UniqueID'] = player.UniqueID,
                    ['@job'] = 'unemployed',
                    ['@job_grade'] = 0
                }, function()
                    
                end)
            end
        end

        function society:recruitPlayer(player, grade)
            if not player then return end
            
            player.setJob(society.name, grade)
        end

        function society:setState(state)
            if data == nil then return end

            society.state = state

            if state then
                TriggerClientEvent('esx:showNotification', -1, ('L\'entreprise ~y~%s~s~ est désormais ~g~Ouvert~s~'):format(society.label))
            else
                TriggerClientEvent('esx:showNotification', -1, ('L\'entreprise ~y~%s~s~ est désormais ~r~Fermé~s~'):format(society.label))
            end

            TriggerClientEvent('zmain:society:setSocietyState', -1, society.name, state)
        end

        function society:addClothes()
            MySQL.Async.execute('UPDATE society_data SET clothes = @clothes WHERE name = @name', {
                ['@name'] = society.name,
                ['@clothes'] = json.encode(society.clothes)
            }, function()
                society:save(society.name)
            end)
        end

        function society:editClothesName(oldName, newName)
            if newName == nil or newName == '' then return end

            local attemp = 0

            for k,v in pairs(society.clothes) do
                if v.name == oldName then
                    if attemp > 1 then return end
                    attemp += 1

                    society.clothes[k].name = newName

                    MySQL.Async.execute('UPDATE society_data SET clothes = @clothes WHERE name = @name', {
                        ['@name'] = society.name,
                        ['@clothes'] = json.encode(society.clothes)
                    }, function()
                        society:save(society.name)
                    end)
                end
            end
        end

        function society:deleteClothes(clothesName)
            if clothesName == nil or clothesName == '' then return end

            local attemp = 0

            for k,v in pairs(society.clothes) do
                if v.name == clothesName then
                    if attemp > 1 then return end
                    attemp+= 1

                    table.remove(society.clothes, k)

                    MySQL.Async.execute('UPDATE society_data SET clothes = @clothes WHERE name = @name', {
                        ['@name'] = society.name,
                        ['@clothes'] = json.encode(society.clothes)
                    }, function()
                        society:save(society.name)
                    end)
                end
            end
        end

        Society.List[society.name] = society

        return society
    end
})

exports('getSociety', function(societyName)
    return Society:getSociety(societyName)
end)

CreateThread(function()
    MySQL.Async.fetchAll('SELECT * FROM society_data', {}, function(result)
        for k,v in pairs(result) do
            Society.List[v.name] = {
                name = v.name,
                label = v.label,
                posCoffre = json.decode(v.posCoffre),
                posBoss = json.decode(v.posBoss),
                grades = {},
                tax = tonumber(v.tax),
                cloakroom = v.cloakromm,
                clothes = json.decode(v.clothes),
                cloakpos = json.decode(v.cloakpos),
            }

            if v.blips == nil or json.encode(v.blips) == '[]' then
                Society.List[v.name].blips = {}
                Society.List[v.name].active = false
            else
                blips = json.decode(v.blips)
                Society.List[v.name].blips = {
                    sprite = blips.sprite,
                    color = blips.color,
                    position = blips.position,
                    active = blips.active
                }
            end
            if v.coffre == nil or json.encode(v.coffre) == '[]' then
                Society.List[v.name].coffre = {
                    ['items'] = {},
                    ['weapons'] = {},
                    ['items_boss'] = {},
                    ['weapons_boss'] = {},
                    ['accounts'] = {
                        society = 0,
                        cash = 0,
                        black_money = 0
                    }
                }
            else
                Society.List[v.name].coffre = json.decode(v.coffre)
            end
            if v.permissions == nil or v.permissions == "NULL" then
                Society.List[v.name].permissions = {
                    ['open_coffre'] = {
                        ['boss'] = true
                    },
                    ['open_boss'] = {
                        ['boss'] = true
                    },
                    ['deposit_cash_coffre'] = {
                        ['boss'] = true
                    },
                    ['withdraw_black_money_coffre'] = {
                        ['boss'] = true
                    },
                }
            else
                local permissions = json.decode(v.permissions)
                for i,p in pairs(permissions) do
                    if not permissions[i] then
                        permissions[i] = {
                            ['boss'] = true
                        }
                    end
                end

                Society.List[v.name].permissions = permissions
            end
        end

        for k,v in pairs(Society.List) do
            MySQL.Async.fetchAll('SELECT * FROM job_grades WHERE job_name = @a', {['@a'] = v.name}, function(rs)
                for i,p in ipairs(rs) do
                    table.insert(Society.List[v.name].grades, p)
                end

                Society.object(k, v)

                local society = Society:getSociety(v.name)

                society:employedList()

                ESX.toConsole(('Society ^3%s - %s^0 loaded [^3%s^0] grades | [^3%s^0] employeds'):format(v.name, v.label, #society.grades, #society.employeds))
            end)
        end
    end)
end)

RegisterNetEvent('zmain:society:create', function(data)
    local source = source
    for k,v in pairs(Society.List) do
        if v.name == data.name then
            return TriggerClientEvent('esx:showNotification', source, 'La société éxiste déjà')
        end
    end

    if data.vestiaire == false then
        data.vestiairePos = 'none'
    end

    MySQL.Async.execute('INSERT INTO society_data (name, label, posCoffre, posBoss, permissions, blips, cloakromm, clothes, cloakpos) VALUES (@name, @label, @posCoffre, @posBoss, @permissions, @blips, @cloakromm, @clothes, @cloakpos)', {
        ['@name'] = data.name,
        ['@label'] = data.label,
        ['@posCoffre'] = json.encode(data.posCoffre),
        ['@posBoss'] = json.encode(data.posBoss),
        ['@permissions'] = json.encode(Society.DefaultPermissions),
        ['@blips'] = json.encode(data.blips),
        ['@cloakromm'] = data.vestiaire,
        ['@clothes'] = json.encode({}),
        ['@cloakpos'] = json.encode(data.vestiairePos)
    }, function()
        Society.List[data.name] = {
            name = data.name,
            label = data.label,
            permissions = Society.DefaultPermissions,
            posCoffre = data.posCoffre,
            posBoss = data.posBoss,
            cloakroom = data.vestaire,
            clothes = {},
            cloakpos = data.vestiairePos,
            coffre = {
                ['items'] = {},
                ['weapons'] = {},
                ['items_boss'] = {},
                ['weapons_boss'] = {},
                ['accounts'] = {
                    society = 0,
                    cash = 0,
                    black_money = 0
                },
                blips = {
                    sprite = data.blips.sprite,
                    color = data.blips.color,
                    position = data.blips.position,
                    active = data.blips.active
                }
            }
        }
        Society.object(data.name, Society.List[data.name])

        TriggerClientEvent('zmain:society:add', -1, data.name, Society.List[data.name])
    end)
end)

-- RegisterCommand('getSocietyData', function(source, args)
--     local society = Society:getSociety('police')

--     print(society.name, society.label, society.permissions, society.coffre, society.posCoffre, society.posBoss)

--     society.addSocietyMoney(500)

--     print(society.coffre['accounts'].society)

--     society.coffre['weapons']['weapon_pistol'] = {
--         name = 'weapon_pistol',
--         label = 'Pistolet',
--         ammo = 250
--     }

--     society:save('police')
-- end)

AddEventHandler('esx:playerLoaded', function(source, xPlayer)
    local source = source

    TriggerClientEvent('zmain:society:sendList', source, Society.List)

    local xPlayer = ESX.GetPlayerFromId(source)

    local society = Society:getSociety(xPlayer.job.name)

    TriggerClientEvent('zmain:society:request', source, society)
end)

AddEventHandler('zmain:admin:restart', function()
    local source = source

    TriggerClientEvent('zmain:society:sendList', source, Society.List)

    local xPlayer = ESX.GetPlayerFromId(source)

    local society = Society:getSociety(xPlayer.job.name)

    TriggerClientEvent('zmain:society:request', source, society)
end)

RegisterNetEvent('zmain:society:request', function()
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    local society = Society:getSociety(xPlayer.job.name)

    if not society then return end

    TriggerClientEvent('zmain:society:request', source, society)
end)

RegisterCommand('updateCoffre', function(source, args)
    local society = Society:getSociety('police')

    if not society then return end

    local players = ESX.GetExtendedPlayers('job', 'police')

    society.coffre['accounts'].cash += 5

    for k,v in pairs(players) do
        TriggerClientEvent('zmain:society:updateCoffre', v.source, society)
    end
end)

RegisterNetEvent('zmain:society:depositMoney', function(societyName, amount, type)
    local society = Society:getSociety(societyName)

    if not society then return end

    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer then return end

    if type ~= 'society' then
        xPlayerMoney = xPlayer.getAccount(type).money
    else
        xPlayerMoney = xPlayer.getAccount('bank').money
    end

    if xPlayerMoney < amount then
        TriggerClientEvent('esx:showNotification', source, '💲 Vous ne possézdez pas l\'argent nécessaire')
        return
    end

    if type ~= 'society' then
        xPlayer.removeAccountMoney(type, amount)
    else
        xPlayer.removeAccountMoney('bank', amount)
    end
    society.addMoney(type, amount)

    sendLog(('Dépot D\'argent société (%s - %s) Data (%s- %s) Type (%s) (Coffre)'):format(xPlayer.name, xPlayer.UniqueID, society.name, society.label, type), {
        author = xPlayer.name,
        fields = {
            {title = 'Joueur', subtitle = xPlayer.name},
            {title = 'ID Unique', subtitle = xPlayer.UniqueID},
            {title = 'Identifier', subtitle = xPlayer.identifier},
            {title = 'Argent Déposé', subtitle = ('%s$'):format(amount)},
            {title = 'Nouvelle somme dans le coffre', subtitle = ('%s$'):format(society.coffre['accounts'][type])},
            {title = 'Type', subtitle = type}
        },
        channel = 'society_deposit_money'
    })

    TriggerClientEvent('esx:showNotification', source, ('💲 Vous avez désposé ~y~%s$~s~ dans le coffre'):format(amount))
end)

RegisterNetEvent('zmain:society:withDrawMoney', function(societyName, amount, type)
    local society = Society:getSociety(societyName)

    if not society then return end

    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer then return end

    if type ~= 'society' then
        xPlayerMoney = xPlayer.getAccount(type).money
    else
        xPlayerMoney = xPlayer.getAccount('bank').money
    end

    if society.coffre['accounts'][type] < amount then
        TriggerClientEvent('esx:showNotification', source, '💲 Il n\'y a pas asser d\'argent dans le coffre')
        return
    end

    if type ~= 'society' then
        xPlayer.addAccountMoney(type, amount)
    else
        xPlayer.addAccountMoney('bank', amount)
    end
    society.removeMoney(type, amount)

    sendLog(('Retrait D\'argent société (%s - %s) Data (%s- %s) Type (%s) (Coffre)'):format(xPlayer.name, xPlayer.UniqueID, society.name, society.label, type), {
        author = xPlayer.name,
        fields = {
            {title = 'Joueur', subtitle = xPlayer.name},
            {title = 'ID Unique', subtitle = xPlayer.UniqueID},
            {title = 'Identifier', subtitle = xPlayer.identifier},
            {title = 'Argent Déposé', subtitle = ('%s$'):format(amount)},
            {title = 'Nouvelle somme dans le coffre', subtitle = ('%s$'):format(society.coffre['accounts'][type])},
            {title = 'Type', subtitle = type}
        },
        channel = 'society_withdraw_money'
    })

    TriggerClientEvent('esx:showNotification', source, ('💲 Vous avez pris ~y~%s$~s~ dans le coffre'):format(amount))
end)

RegisterNetEvent('zmain:society:addWeapon', function(societyName, weaponData)
    local society = Society:getSociety(societyName)

    if not society then return end

    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer then return end

    xPlayer.removeWeapon(weaponData.name)
    society.addWeapon(weaponData.name, weaponData.label, weaponData.ammo) 

    sendLog(('Ajout Arme société (%s - %s) Data (%s - %s) Weapon (%s - %s - %s) (Coffre)'):format(xPlayer.name, xPlayer.UniqueID, society.name, society.label, weaponData.name, weaponData.label, weaponData.ammo), {
        author = xPlayer.name,
        fields = {
            {title = 'Joueur', subtitle = xPlayer.name},
            {title = 'ID Unique', subtitle = xPlayer.UniqueID},
            {title = 'Identifier', subtitle = xPlayer.identifier},
            {title = 'Arme Déposé', subtitle = ('%s - %s ammo: %s'):format(weaponData.name, weaponData.label, weaponData.ammo)},
        },
        channel = 'society_add_weapon'
    }, function()
        ESX.Notifi(source, ('Vous avez déposé ~y~x1~s~ %s'):format(weaponData.label))
    end)    
end)

RegisterNetEvent('zmain:society:addWeaponBoss', function(societyName, weaponData)
    local society = Society:getSociety(societyName)

    if not society then return end

    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer then return end

    if society.coffre['weapons_boss'][weaponData.name] ~= nil then return ESX.Notifi(source, 'Cette arme est déjà dans le coffre') end

    xPlayer.removeWeapon(weaponData.name)
    society.addWeaponBoss(weaponData.name, weaponData.label, weaponData.ammo) 

    sendLog(('Ajout Arme société (%s - %s) Data (%s - %s) Weapon (%s - %s - %s) (Coffre boss)'):format(xPlayer.name, xPlayer.UniqueID, society.name, society.label, weaponData.name, weaponData.label, weaponData.ammo), {
        author = xPlayer.name,
        fields = {
            {title = 'Joueur', subtitle = xPlayer.name},
            {title = 'ID Unique', subtitle = xPlayer.UniqueID},
            {title = 'Identifier', subtitle = xPlayer.identifier},
            {title = 'Arme Déposé', subtitle = ('%s - %s ammo: %s'):format(weaponData.name, weaponData.label, weaponData.ammo)},
        },
        channel = 'society_add_weapon'
    }, function()
        ESX.Notifi(source, ('Vous avez déposé ~y~x1~s~ %s'):format(weaponData.label))
    end)    
end)

RegisterNetEvent('zmain:society:removeWeaponBoss', function(societyName, weaponData)
    local society = Society:getSociety(societyName)

    if not society then return end

    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer then return end

    local weaponName_ID = nil

    for k,v in pairs(society.coffre.weapons_boss) do
        if v.name == weaponData.name then
            weaponName_ID = v.name..v.number
            if society.coffre['weapons_boss'][weaponData.name..v.number] == nil then return ESX.Notifi(source, 'Cette arme n\'est plus dans le coffre') end
        end
    end

    xPlayer.addWeapon(weaponData.name, weaponData.ammo)
    society.removeWeaponBoss(weaponName_ID)

    sendLog(('Retrait Arme société (%s - %s) Data (%s - %s) Weapon (%s - %s - %s) (Coffre boss)'):format(xPlayer.name, xPlayer.UniqueID, society.name, society.label, weaponData.name, weaponData.label, weaponData.ammo), {
        author = xPlayer.name,
        fields = {
            {title = 'Joueur', subtitle = xPlayer.name},
            {title = 'ID Unique', subtitle = xPlayer.UniqueID},
            {title = 'Identifier', subtitle = xPlayer.identifier},
            {title = 'Arme Retiré', subtitle = ('%s - %s ammo: %s'):format(weaponData.name, weaponData.label, weaponData.ammo)},
        },
        channel = 'society_remove_weapon'
    }, function()
        ESX.Notifi(source, ('Vous avez pris ~y~x1~s~ %s'):format(weaponData.label))
    end)  
end)

RegisterNetEvent('zmain:society:removeWeapon', function(societyName, weaponData)
    local society = Society:getSociety(societyName)

    if not society then return end

    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer then return end

    local weaponName_ID = nil

    for k,v in pairs(society.coffre.weapons) do
        if v.name == weaponData.name then
            weaponName_ID = v.name..v.number
            if society.coffre['weapons'][weaponData.name..v.number] == nil then return ESX.Notifi(source, 'Cette arme n\'est plus dans le coffre') end
        end
    end

    xPlayer.addWeapon(weaponData.name, weaponData.ammo)
    society.removeWeapon(weaponName_ID)

    sendLog(('Retrait Arme société (%s - %s) Data (%s - %s) Weapon (%s - %s - %s) (Coffre)'):format(xPlayer.name, xPlayer.UniqueID, society.name, society.label, weaponData.name, weaponData.label, weaponData.ammo), {
        author = xPlayer.name,
        fields = {
            {title = 'Joueur', subtitle = xPlayer.name},
            {title = 'ID Unique', subtitle = xPlayer.UniqueID},
            {title = 'Identifier', subtitle = xPlayer.identifier},
            {title = 'Arme Retiré', subtitle = ('%s - %s ammo: %s'):format(weaponData.name, weaponData.label, weaponData.ammo)},
        },
        channel = 'society_remove_weapon'
    }, function()
        ESX.Notifi(source, ('Vous avez pris ~y~x1~s~ %s'):format(weaponData.label))
    end)  
end)

RegisterNetEvent('zmain:society:addItem', function(societyName, itemData, count)
    local society = Society:getSociety(societyName)

    if not society then return end

    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer then return end

    if xPlayer.getInventoryItem(itemData.name).count < count then return ESX.Notifi(source, 'Vous n\'en possédez pas assez') end

    xPlayer.removeInventoryItem(itemData.name, count)
    society.addItem(itemData.name, itemData.label, count) 

    sendLog(('Ajout Item société (%s - %s) Data (%s - %s) Item (%s - %s - %s) (Coffre)'):format(xPlayer.name, xPlayer.UniqueID, society.name, society.label, itemData.name, itemData.label, count), {
        author = xPlayer.name,
        fields = {
            {title = 'Joueur', subtitle = xPlayer.name},
            {title = 'ID Unique', subtitle = xPlayer.UniqueID},
            {title = 'Identifier', subtitle = xPlayer.identifier},
            {title = 'Item Déposé', subtitle = ('%s - %s count: %s'):format(itemData.name, itemData.label, count)},
        },
        channel = 'society_add_item'
    }, function()
        ESX.Notifi(source, ('Vous avez déposé ~y~x%s~s~ %s au coffre'):format(count, itemData.label))
    end)    
end)

RegisterNetEvent('zmain:society:addItemBoss', function(societyName, itemData, count)
    local society = Society:getSociety(societyName)

    if not society then return end

    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer then return end

    if xPlayer.getInventoryItem(itemData.name).count < count then return ESX.Notifi(source, 'Vous n\'en possédez pas assez') end

    xPlayer.removeInventoryItem(itemData.name, count)
    society.addItemBoss(itemData.name, itemData.label, count) 

    sendLog(('Ajout Item société (%s - %s) Data (%s - %s) Item (%s - %s - %s) (Coffre boss)'):format(xPlayer.name, xPlayer.UniqueID, society.name, society.label, itemData.name, itemData.label, count), {
        author = xPlayer.name,
        fields = {
            {title = 'Joueur', subtitle = xPlayer.name},
            {title = 'ID Unique', subtitle = xPlayer.UniqueID},
            {title = 'Identifier', subtitle = xPlayer.identifier},
            {title = 'Item Déposé', subtitle = ('%s - %s count: %s'):format(itemData.name, itemData.label, count)},
        },
        channel = 'society_add_item'
    }, function()
        ESX.Notifi(source, ('Vous avez déposé ~y~x%s~s~ %s au coffre'):format(count, itemData.label))
    end)    
end)

RegisterNetEvent('zmain:society:removeItem', function(societyName, itemData, count)
    local society = Society:getSociety(societyName)

    if not society then return end

    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer then return end

    if society.coffre['items'][itemData.name] == nil then return ESX.Notifi(source, '~r~Cet item n\'est plus dans le coffre~s~') end

    if society.coffre['items'][itemData.name].count < count then return ESX.Notifi(source, '~r~Il n\'y en a pas asser dans le coffre~s~') end

    xPlayer.addInventoryItem(itemData.name, itemData.count)
    society.removeItem(itemData.name, count)

    sendLog(('Retrait Item société (%s - %s) Data (%s - %s) item (%s - %s - %s) (Coffre)'):format(xPlayer.name, xPlayer.UniqueID, society.name, society.label, itemData.name, itemData.label, itemData.count), {
        author = xPlayer.name,
        fields = {
            {title = 'Joueur', subtitle = xPlayer.name},
            {title = 'ID Unique', subtitle = xPlayer.UniqueID},
            {title = 'Identifier', subtitle = xPlayer.identifier},
            {title = 'Item Retiré', subtitle = ('%s - %s count: %s'):format(itemData.name, itemData.label, itemData.count)},
        },
        channel = 'society_remove_item'
    }, function()
        ESX.Notifi(source, ('Vous avez retiré ~y~x%s~s~ %s du coffre'):format(count, itemData.label))
    end)  
end)

RegisterNetEvent('zmain:society:removeItemBoss', function(societyName, itemData, count)
    local society = Society:getSociety(societyName)

    if not society then return end

    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer then return end

    if society.coffre['items_boss'][itemData.name] == nil then return ESX.Notifi(source, '~r~Cet item n\'est plus dans le coffre~s~') end

    if society.coffre['items_boss'][itemData.name].count < count then return ESX.Notifi(source, '~r~Il n\'y en a pas asser dans le coffre~s~') end

    xPlayer.addInventoryItem(itemData.name, itemData.count)
    society.removeItemBoss(itemData.name, count)

    sendLog(('Retrait Item société (%s - %s) Data (%s - %s) item (%s - %s - %s) (Coffre boss)'):format(xPlayer.name, xPlayer.UniqueID, society.name, society.label, itemData.name, itemData.label, itemData.count), {
        author = xPlayer.name,
        fields = {
            {title = 'Joueur', subtitle = xPlayer.name},
            {title = 'ID Unique', subtitle = xPlayer.UniqueID},
            {title = 'Identifier', subtitle = xPlayer.identifier},
            {title = 'Item Retiré', subtitle = ('%s - %s count: %s'):format(itemData.name, itemData.label, itemData.count)},
        },
        channel = 'society_remove_item'
    }, function()
        ESX.Notifi(source, ('Vous avez retiré ~y~x%s~s~ %s du coffre'):format(count, itemData.label))
    end)  
end)

RegisterNetEvent('zmain:society:permissions:edit', function(societyName, data, grade)
    local society = Society:getSociety(societyName)

    if not society then return end

    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    society.editPermissions(data)

    local players = ESX.GetExtendedPlayers('job', societyName)

    for k,v in pairs(players) do
        TriggerClientEvent('zmain:society:permissions:edit', v.source, societyName, data)
    end

    sendLog(('Modification Permissions société (%s - %s) Data (%s - %s) Grade (%s - %s)'):format(xPlayer.name, xPlayer.UniqueID, society.name, society.label, grade.name, grade.label), {
        author = xPlayer.name,
        fields = {
            {title = 'Joueur', subtitle = xPlayer.name},
            {title = 'ID Unique', subtitle = xPlayer.UniqueID},
            {title = 'Identifier', subtitle = xPlayer.identifier},
            {title = 'Société', subtitle = ('%s - %s'):format(society.name, society.label)},
        },
        channel = 'society_edit_permissions'
    }, function()

        ESX.Notifi(source, '📝 Permissions modifiés avec succès')
    end)
end)

RegisterNetEvent('zmain:society:grade:create', function(societyName, grade)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    MySQL.Async.execute('INSERT INTO job_grades (job_name, name, label, grade, salary, skin_male, skin_female) VALUES (@job_name, @name, @label, @grade, @salary, @skin_male, @skin_female)', {
        ['@job_name'] = societyName,
        ['@name'] = grade.name,
        ['@label'] = grade.label,
        ['@grade'] = grade.Index,
        ['@salary'] = grade.salary,
        ['@skin_male'] = '[]',
        ['@skin_female'] = '[]'
    }, function()
        local society = Society:getSociety(societyName)

        if not society then return end

        MySQL.Async.fetchAll('SELECT * FROM job_grades WHERE job_name = @a', {['@a'] = societyName}, function(result)
            society.grades = {}

            for k,v in pairs(result) do
                table.insert(society.grades, v)
            end

            for k,v in pairs(grade.permissions) do
                for i,p in pairs(grade.permissions[k]) do
                    society.permissions[k][i] = p
                end
            end

            TriggerEvent('esx:getAllJobs')

            society:save(society.name)

            MySQL.Async.fetchAll('SELECT * FROM society_data WHERE name = @name', {
                ['@name'] = society.name
            }, function(result)
                for k,v in pairs(result) do
                    local permissions = json.decode(v.permissions)
                    for i,p in pairs(permissions) do
                        if not permissions[i] then
                            permissions[i] = {
                                ['boss'] = true
                            }
                        end
                    end
        
                    society.permissions = permissions
                end

                local players = ESX.GetExtendedPlayers('job', societyName)

                for k,v in pairs(players) do
                    TriggerClientEvent('zmain:society:grades:refresh', v.source, societyName, society.grades)
    
                    TriggerClientEvent('zmain:society:permissions:edit', v.source, societyName, society.permissions)
                end
            end)

            sendLog(('Création Grade société (%s - %s) Data (%s - %s) Grade (%s - %s)'):format(xPlayer.name, xPlayer.UniqueID, society.name, society.label, grade.name, grade.label), {
                author = xPlayer.name,
                fields = {
                    {title = 'Joueur', subtitle = xPlayer.name},
                    {title = 'ID Unique', subtitle = xPlayer.UniqueID},
                    {title = 'Identifier', subtitle = xPlayer.identifier},
                    {title = 'Société', subtitle = ('%s - %s'):format(society.name, society.label)},
                    {title = 'Nom du grade', subtitle = grade.name},
                    {title = 'Nom d\'affichage', subtitle = grade.label},
                    {title = 'Numéro', subtitle = grade.Index},
                    {title = 'Salaire', subtitle = grade.salary},
                },
                channel = 'society_create_grade'
            }, function(data)
                
            end)

            ESX.Notifi(source, 'Grade créé avec succès')
        end)
    end)
end)

RegisterNetEvent('zmain:society:grades:edit', function(societyName, gradeId, gradeData, oldName, value, oldGradeId)
    local society = Society:getSociety(societyName)

    if not society then return end

    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    society.grades[gradeId] = gradeData

    society:save(society.name)
    society.saveGrade(oldName, gradeData.name, gradeData.label, gradeData.salary, gradeData.grade)

    if value == 'num' then
        local players = ESX.GetExtendedPlayers('job', society.name)

        for k,v in pairs(players) do
            if v.job.grade_name == gradeData.name then
                players[k].setSalaryJob(gradeData.salary)
            end
        end
        TriggerEvent('esx:getAllJobs')

        MySQL.Async.execute('UPDATE users SET job_grade = @job_grade WHERE job = @job and job_grade = @oldJob_grade', {
            ['@oldJob_grade'] = oldGradeId,
            ['@job'] = society.name,
            ['@job_grade'] = gradeId
        })
    end

    sendLog(('Edition Grade société (%s - %s) Data (%s - %s) Grade (%s - %s)'):format(xPlayer.name, xPlayer.UniqueID, society.name, society.label, gradeData.name, gradeData.label), {
        author = xPlayer.name,
        fields = {
            {title = 'Joueur', subtitle = xPlayer.name},
            {title = 'ID Unique', subtitle = xPlayer.UniqueID},
            {title = 'Identifier', subtitle = xPlayer.identifier},
            {title = 'Société', subtitle = ('%s - %s'):format(society.name, society.label)},
            {title = 'Nom du grade', subtitle = gradeData.name},
            {title = 'Nom d\'affichage', subtitle = gradeData.label},
            {title = 'Numéro', subtitle = gradeData.grade},
            {title = 'Salaire', subtitle = gradeData.salary},
        },
        channel = 'society_edit_grade'
    }, function(data)
        ESX.Notifi(source, 'Grade modifié avec succès')
    end)
end)

RegisterNetEvent('zmain:society:grades:delete', function(societyName, gradeId, gradeName)
    local society = Society:getSociety(societyName)

    if not society then return end

    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    local gradeData = society.grades[gradeId]

    society.deleteGrade(gradeId, gradeName)

    sendLog(('Suppression Grade société (%s - %s) Data (%s - %s) Grade (%s - %s)'):format(xPlayer.name, xPlayer.UniqueID, society.name, society.label, gradeData.name, gradeData.label), {
        author = xPlayer.name,
        fields = {
            {title = 'Joueur', subtitle = xPlayer.name},
            {title = 'ID Unique', subtitle = xPlayer.UniqueID},
            {title = 'Identifier', subtitle = xPlayer.identifier},
            {title = 'Société', subtitle = ('%s - %s'):format(society.name, society.label)},
            {title = 'Nom du grade', subtitle = gradeData.name},
            {title = 'Nom d\'affichage', subtitle = gradeData.label},
            {title = 'Numéro', subtitle = gradeData.grade},
            {title = 'Salaire', subtitle = gradeData.salary},
        },
        channel = 'society_delete_grade'
    }, function(data)
        local players = ESX.GetExtendedPlayers('job', society.name)

        for k,v in pairs(players) do
            TriggerClientEvent('zmain:society:grades:refresh', v.source, societyName, society.grades)
        end

        ESX.Notifi(source, 'Grade supprimé avec succès')
    end)
end)

ESX.RegisterServerCallback('zmain:society:employedList', function(source, cb, societyName)
    local society = Society:getSociety(societyName)

    if not society then return end

    local societyEmployeds = society:employedList()

    cb(societyEmployeds)
end)

RegisterNetEvent('zmain:society:promote', function(societyName, player)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local targetPlayer = ESX.GetPlayerFromId(player.id)

    local society = Society:getSociety(societyName)

    if not society then return end

    society:promotePlayer(targetPlayer, player)

    sendLog(('Promote joueur société (%s - %s) Joueur (%s - %s) Employé (%s - %s)'):format(society.name, society.label, xPlayer.name, xPlayer.UniqueID, player.name, player.UniqueID), {
        author = xPlayer.name,
        fields = {
            {title = 'Joueur', subtitle = xPlayer.name},
            {title = 'ID Unique', subtitle = xPlayer.UniqueID},
            {title = 'Identifier', subtitle = xPlayer.identifier},
            {title = 'Société', subtitle = ('%s - %s'):format(society.name, society.label)},
            {title = 'Ancien grade de l\'employé', subtitle = player.job.grade_name}
        },
        channel = 'society_promote_player'
    }, function(data)
        ESX.Notifi(source, 'Joueur promote avec succès')
    end)
end)

RegisterNetEvent('zmain:society:unmote', function(societyName, player)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local targetPlayer = ESX.GetPlayerFromId(player.id)

    local society = Society:getSociety(societyName)

    if not society then return end

    society:unomotePlayer(targetPlayer, player)

    sendLog(('Unmote joueur société (%s - %s) Joueur (%s - %s) Employé (%s - %s)'):format(society.name, society.label, xPlayer.name, xPlayer.UniqueID, player.name, player.UniqueID), {
        author = xPlayer.name,
        fields = {
            {title = 'Joueur', subtitle = xPlayer.name},
            {title = 'ID Unique', subtitle = xPlayer.UniqueID},
            {title = 'Identifier', subtitle = xPlayer.identifier},
            {title = 'Société', subtitle = ('%s - %s'):format(society.name, society.label)},
            {title = 'Ancien grade de l\'employé', subtitle = player.job.grade_name}
        },
        channel = 'society_unmote_player'
    }, function(data)
        ESX.Notifi(source, 'Joueur unmote avec succès')
    end)
end)

RegisterNetEvent('zmain:society:demote', function(societyName, player)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local targetPlayer = ESX.GetPlayerFromId(player.id)

    local society = Society:getSociety(societyName)

    if not society then return end

    society:demotePlayer(targetPlayer, player)

    sendLog(('Demote joueur société (%s - %s) Joueur (%s - %s) Employé (%s - %s)'):format(society.name, society.label, xPlayer.name, xPlayer.UniqueID, player.name, player.UniqueID), {
        author = xPlayer.name,
        fields = {
            {title = 'Joueur', subtitle = xPlayer.name},
            {title = 'ID Unique', subtitle = xPlayer.UniqueID},
            {title = 'Identifier', subtitle = xPlayer.identifier},
            {title = 'Société', subtitle = ('%s - %s'):format(society.name, society.label)},
            {title = 'Ancien grade de l\'employé', subtitle = player.job.grade_name}
        },
        channel = 'society_demote_player'
    }, function(data)
        ESX.Notifi(source, 'Joueur viré avec succès')
    end)
end)

RegisterNetEvent('zmain:society:recruit', function(societyName, player, grade)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local targetPlayer = ESX.GetPlayerFromId(player)

    local society = Society:getSociety(societyName)

    if not society then return end

    if targetPlayer.job.name ~= 'unemployed' then return ESX.Notifi(source, 'Le joueur est déjà dans une entreprise') end

    society:recruitPlayer(targetPlayer, grade)

    sendLog(('Recrute joueur société (%s - %s) Joueur (%s - %s) Employé (%s - %s)'):format(society.name, society.label, xPlayer.name, xPlayer.UniqueID, targetPlayer.name, targetPlayer.UniqueID), {
        author = xPlayer.name,
        fields = {
            {title = 'Joueur', subtitle = xPlayer.name},
            {title = 'ID Unique', subtitle = xPlayer.UniqueID},
            {title = 'Identifier', subtitle = xPlayer.identifier},
            {title = 'Société', subtitle = ('%s - %s'):format(society.name, society.label)},
        },
        channel = 'society_recruit_player'
    }, function(data)
        ESX.Notifi(source, 'Joueur recruté avec succès')
    end)
end)

RegisterNetEvent('zmain:jobs:updateSocietyStatus', function(state)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer then return end

    local society = Society:getSociety(xPlayer.job.name)

    if not society then return end

    society:setState(state)
end)

RegisterNetEvent('zmain:society:addClothes', function(societyData, data)
    local society = Society:getSociety(societyData.name)

    if not society then return end

    table.insert(society.clothes, data)

    society:addClothes()

    TriggerClientEvent('zmain:society:updateWithSocietyName', -1, society.name, society)

    local source = source

    ESX.Notifi(source, ('Tenue ~y~%s~s~ ajoutée avec succès'):format(data.name))
end)

RegisterNetEvent('zmain:society:clothes:editName', function(societyName, clothesName, newName)
    local society = Society:getSociety(societyName)

    if not society then return end

    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer then return end

    society:editClothesName(clothesName, newName)

    TriggerClientEvent('zmain:society:updateWithSocietyName', -1, society.name, society)
end)

RegisterNetEvent('zmain:society:clothes:delete', function(societyName, clothesName)
    local society = Society:getSociety(societyName)

    if not society then return end

    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer then return end

    society:deleteClothes(clothesName)

    TriggerClientEvent('zmain:society:updateWithSocietyName', -1, society.name, society)
end)

RegisterNetEvent('zmain:society:clothes:edit', function(societyName, societyClothes)
    local society = Society:getSociety(societyName)

    if not society then return end

    society.clothes = societyClothes

    society:addClothes()

    TriggerClientEvent('zmain:society:updateWithSocietyName', -1, society.name, society)
end)

ESX.RegisterServerCallback('zmain:society:getSocietyState', function(source, cb)
    cb(Society.List)
end)