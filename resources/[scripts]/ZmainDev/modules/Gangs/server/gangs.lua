---@class Gangs
Gangs = {
    gangs = {},

    Members = {}
}

function Gangs:Load()
    MySQL.Async.fetchAll('SELECT * FROM gangs', {}, function(ElGangs)

        Gangs.gangs = {}

        if json.encode(ElGangs) == '[]' then goto continue end

        for i = 1, #ElGangs do
            Gangs.gangs[ElGangs[i].id] = {
                name = ElGangs[i].name, 
                label = ElGangs[i].label, 
                poscoffre = json.decode(ElGangs[i].poscoffre), 
                posboss = json.decode(ElGangs[i].posboss), 
                activeblip = ElGangs[i].activeblip, 
                colorblip = ElGangs[i].colorblip, 
                posblip = json.decode(ElGangs[i].posblip),
            }

            print(('^3Load^0 du group ^3%s^0 id ^3%i^0'):format(ElGangs[i].name, ElGangs[i].id))
        end
        for k,v in pairs(ElGangs) do
            if json.decode(v.chest) ~= nil then
                Gangs.gangs[v.id].chest = json.decode(v.chest)
            else
                Gangs.gangs[v.id].chest = {
                    ["items"] = {},
                    ["weapons"] = {},
                    ["accounts"] = {
                        cash = 0,
                        black_money = 0
                    }
                }
            end
        end

        ::continue::
    end)
end

function Gangs:Refresh()
    TriggerClientEvent('zmain:gangs:refresh', -1, Gangs.gangs)
end

function Gangs:Save()
    for k,v in pairs(Gangs.gangs) do
        MySQL.Async.execute('UPDATE gangs SET chest = @chest WHERE id = @id', {
            ['@id'] = k,
            ['@chest'] = json.encode(v.chest)
        }, function()
            
        end)
    end
end

function Gangs:SaveWithID(id)
    for k,v in pairs(Gangs.gangs) do
        if k == id then
            MySQL.Async.execute('UPDATE gangs SET chest = @chest WHERE id = @id', {
                ['@id'] = k,
                ['@chest'] = json.encode(v.chest)
            }, function()
                
            end)
        end
    end
end

-- CreateThread(function()
--     while true do 
--         Wait(1800000)
--         Gangs:Save()
--     end
-- end)

CreateThread(function()
    Gangs:Load()
end)

RegisterNetEvent('zmain:gangs:init', function()
    Gangs:Refresh()
end)

RegisterNetEvent('zmain:gangs:create', function(name, label, poscoffre, posgarage, posgaragedelete, posgaragespawn, rotaspawn, posboss, activeblip, colorblip, posblip, grades)
    local source = source
    print(name, label, poscoffre, posgarage, posgaragedelete, posgaragespawn, rotaspawn, posboss, activeblip, colorblip, posblip)

    MySQL.Async.execute('INSERT INTO gangs (name, label, poscoffre, posgarage, posgaragedelete, posgaragespawn, rotaspawn, posboss, activeblip, colorblip, posblip) VALUES (@name, @label, @poscoffre, @posgarage, @posgaragedelete, @posgaragespawn, @rotaspawn, @posboss, @activeblip, @colorblip, @posblip)', {
        ['@name'] = name,
        ['@label'] = label,
        ['@poscoffre'] = json.encode(poscoffre),
        ['@posboss'] = json.encode(posboss),
        ['@activeblip'] = activeblip,
        ['@colorblip'] = colorblip,
        ['@posblip'] = json.encode(posblip),
    }, function()
        Gangs:Load()
        Wait(1000)
        Gangs:Refresh()

        TriggerClientEvent('esx:showNotification', source, 'Gang crée avec succès')
    end)

    for k,v in pairs(grades) do
        MySQL.Async.execute('INSERT INTO job_grades (job_name, grade, name, label) VALUES (@job_name, @grade, @name, @label)', {
            ['@job_name'] = name,
            ['@grade'] = v.Number,
            ['@name'] = v.name,
            ['@label'] = v.label,
        }, function()
        end)
    end

    MySQL.Async.execute('INSERT INTO jobs (name, label, type) VALUES (@name, @label, @type)', {
        ['@name'] = name,
        ['@label'] = label,
        ['@type'] = 0
    }, function()
        TriggerEvent('esx:getAllJobs')
    end)
end)

RegisterNetEvent('zmain:gangs:openCoffreMenu', function(gid)
    local source = source
    TriggerClientEvent('zmain:gangs:recieveCoffre', source, Gangs.gangs[gid])
end)

RegisterNetEvent('zmain:gangs:removeCoffreItem', function(id, itemname, count)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if Gangs.gangs[id].chest['items'][itemname].count < count then return TriggerClientEvent('esx:showNotification', source, 'Il n\'y en a pas asser') end
    if Gangs.gangs[id].chest['items'][itemname] == nil then return TriggerClientEvent('esx:showNotification', source, 'Cet item n\'est plus dans le coffre') end
    
    Gangs.gangs[id].chest['items'][itemname].count -= count

    xPlayer.addInventoryItem(Gangs.gangs[id].chest['items'][itemname].name, count)

    if Gangs.gangs[id].chest['items'][itemname].count <= 0 then Gangs.gangs[id].chest['items'][itemname] = nil end

    TriggerClientEvent('zmain:gangs:recieveCoffre', source, Gangs.gangs[id])

    Gangs:SaveWithID(id)
end)

RegisterNetEvent('zmain:gangs:addCoffreItem', function(id, itemname, count)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if count > xPlayer.getInventoryItem(itemname).count then return TriggerClientEvent('esx:showNotification', source, 'Vous n\'en possedez en a pas asser') end
    
    if Gangs.gangs[id].chest['items'][itemname] == nil then
        Gangs.gangs[id].chest['items'][itemname] = {}
        Gangs.gangs[id].chest['items'][itemname].name = itemname
        Gangs.gangs[id].chest['items'][itemname].label = xPlayer.getInventoryItem(itemname).label
        Gangs.gangs[id].chest['items'][itemname].count = count
    else
        Gangs.gangs[id].chest['items'][itemname].count += count
    end

    xPlayer.removeInventoryItem(itemname, count)

    TriggerClientEvent('zmain:gangs:recieveCoffre', source, Gangs.gangs[id])

    Gangs:SaveWithID(id)
end)

RegisterNetEvent('zmain:gangs:removeCoffreWeapon', function(id, itemname, count)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if Gangs.gangs[id].chest['weapons'][itemname] == nil then return TriggerClientEvent('esx:showNotification', source, 'Cet item n\'est plus dans le coffre') end
    
    xPlayer.addWeapon(Gangs.gangs[id].chest['weapons'][itemname].name, ammo)

    Gangs.gangs[id].chest['weapons'][itemname] = nil

    TriggerClientEvent('zmain:gangs:recieveCoffre', source, Gangs.gangs[id])

    Gangs:SaveWithID(id)
end)

RegisterNetEvent('zmain:gangs:addCoffreWeapon', function(id, itemname, itemlabel, count)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    local weaponsNumber = 0
    for k,v in pairs(Gangs.gangs[id].chest['weapons']) do
        weaponsNumber += 1
    end

    Gangs.gangs[id].chest['weapons'][itemname..weaponsNumber] = {}
    Gangs.gangs[id].chest['weapons'][itemname..weaponsNumber].name = itemname
    Gangs.gangs[id].chest['weapons'][itemname..weaponsNumber].label = itemlabel
    Gangs.gangs[id].chest['weapons'][itemname..weaponsNumber].ammo = count

    xPlayer.removeWeapon(itemname, count)

    TriggerClientEvent('zmain:gangs:recieveCoffre', source, Gangs.gangs[id])

    Gangs:SaveWithID(id)
end)

RegisterNetEvent('zmain:gangs:money:deposit', function(id, type, amount)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.getAccount(type).money < amount then goto continue end

    xPlayer.removeAccountMoney(type, amount)

    if type == 'cash' then
        Gangs.gangs[id].chest['accounts'].cash += amount
        TriggerClientEvent('esx:showNotification', source, ('Vous avez déposer ~g~x%s~s~ d\'argent liquide'):format(amount))
    elseif type =='black_money' then
        Gangs.gangs[id].chest['accounts'].black_money += amount
        TriggerClientEvent('esx:showNotification', source, ('Vous avez déposer ~g~x%s~s~ d\'argent sale'):format(amount))
    end

    TriggerClientEvent('zmain:gangs:recieveCoffre', source, Gangs.gangs[id])

    Gangs:SaveWithID(id)

    ::continue::
end)

RegisterNetEvent('zmain:gangs:money:withdraw', function(id, type, amount)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if Gangs.gangs[id].chest['accounts'][type] < amount then goto continue end

    xPlayer.addAccountMoney(type, amount)

    if type == 'cash' then
        Gangs.gangs[id].chest['accounts'].cash -= amount
        TriggerClientEvent('esx:showNotification', source, ('Vous avez retirer ~g~x%s~s~ d\'argent liquide'):format(amount))
    elseif type =='black_money' then
        Gangs.gangs[id].chest['accounts'].black_money -= amount
        TriggerClientEvent('esx:showNotification', source, ('Vous avez retirer ~g~x%s~s~ d\'argent sale'):format(amount))
    end

    TriggerClientEvent('zmain:gangs:recieveCoffre', source, Gangs.gangs[id])

    Gangs:SaveWithID(id)

    ::continue::
end)

ESX.RegisterServerCallback('zmain:gangs:fouiller', function(source, cb, target)
    local source = source
    local targetPlayer = ESX.GetPlayerFromId(target)

    if targetPlayer then
        local data = {
            cash = targetPlayer.getAccount('cash').money,
            black_money = targetPlayer.getAccount('black_money').money,
            inventory = targetPlayer.getInventory(),
            loadout = targetPlayer.getLoadout()
        }
        cb(data)
        TriggerClientEvent('esx:showNotification', targetPlayer.source, 'Une personne vous fouille !')
    else
        return TriggerClientEvent('esx:showNotification', source, 'Une erreur est survenue !')
    end
end)

RegisterNetEvent('zmain:gangs:cagoule', function(target)
    TriggerClientEvent('zmain:gangs:cagoule', target)
end)

ESX.RegisterServerCallback('zmain:gangs:boss:getallmembers', function(source, cb, gname)
    local source = source
    Gangs.Members[gname] = {}

    MySQL.Async.fetchAll('SELECT * FROM users WHERE job2 = @job2', {
        ['@job2'] = gname
    }, function(result)
        for k,v in pairs(result) do
            table.insert(Gangs.Members[gname], v)
        end

        local players = ESX.GetExtendedPlayers('job2', gname)
        for k,v in pairs(players) do
            table.insert(Gangs.Members[gname], v)
        end

        TriggerClientEvent('esx:showNotification', source, 'Récupération des membres en cours...')

        Wait(100)
        
        cb(Gangs.Members[gname])
    end)
end)

RegisterNetEvent('zmain:gangs:boss:tege', function(license)
    local source = source

    local target = ESX.GetPlayerFromIdentifier(license)

    if target then
        target.setJob2('unemployed2', 0)
    else
        MySQL.Async.execute('UPDATE users SET job2 = @job2, job2_grade = @job2_grade WHERE identifier = @identifier', {
            ['@job2'] = 'unemployed2',
            ['@job2_grade'] = 0,
            ['@identifier'] = license
        })
    end

    TriggerClientEvent('esx:showNotification', source, '✔️ Le membre a bien été viré')
end)

RegisterNetEvent('zmain:gangs:boss:promu', function(license, g)
    local source = source

    local xPlayer = ESX.GetPlayerFromId(source)

    local target = ESX.GetPlayerFromIdentifier(license)

    if target then
        target.setJob2(xPlayer.getJob2().name, target.getJob2().grade + 1)
    else
        MySQL.Async.execute('UPDATE users SET job2 = @job2, job2_grade = @job2_grade WHERE identifier = @identifier', {
            ['@job2'] = xPlayer.getJob2().name,
            ['@job2_grade'] = tonumber(g) + 1,
            ['@identifier'] = license
        })
    end

    TriggerClientEvent('esx:showNotification', source, '✔️ Le membre a bien été viré')
end)

RegisterNetEvent('zmain:gangs:boss:destitu', function(license, g)
    local source = source

    local xPlayer = ESX.GetPlayerFromId(source)

    local target = ESX.GetPlayerFromIdentifier(license)

    if target then
        target.setJob2(xPlayer.getJob2().name, target.getJob2().grade - 1)
    else
        MySQL.Async.execute('UPDATE users SET job2 = @job2, job2_grade = @job2_grade WHERE identifier = @identifier', {
            ['@job2'] = xPlayer.getJob2().name,
            ['@job2_grade'] = tonumber(g) - 1,
            ['@identifier'] = license
        })
    end

    TriggerClientEvent('esx:showNotification', source, '✔️ Le membre a bien été viré')
end)

RegisterNetEvent('zmain:gangs:delete', function(id)
    local source = source

    MySQL.Async.execute('DELETE FROM jobs WHERE name = @name', {['@name'] = Gangs.gangs[id].name}, function()
        MySQL.Async.execute('DELETE FROM job_grades WHERE job_name = @job_name', {
            ['@job_name'] =  Gangs.gangs[id].name
        }, function()
            MySQL.Async.execute('DELETE FROM gangs WHERE id = @id', {['@id'] = id}, function()
                Gangs.gangs[id] = nil
                Gangs:Refresh()
            end)
        end)
    end)
end)

RegisterServerEvent('zmain:gangs:prmu')
AddEventHandler('zmain:gangs:prmu', function(target)
	local sourceXPlayer = ESX.GetPlayerFromId(source)
	local targetXPlayer = ESX.GetPlayerFromId(target)

    if sourceXPlayer.job2.grade_name == 'boss' and sourceXPlayer.job2.name == targetXPlayer.job2.name then
        targetXPlayer.setJob2(targetXPlayer.job2.name, tonumber(targetXPlayer.job2.grade) + 1)

        TriggerClientEvent('esx:showNotification', sourceXPlayer.source, 'Vous avez ~g~promu ' .. targetXPlayer.name .. '~w~.')
        TriggerClientEvent('esx:showNotification', target, 'Vous avez été ~g~promu par ' .. sourceXPlayer.name .. '~w~.')
    else
        TriggerClientEvent('esx:showNotification', sourceXPlayer.source, 'Vous n\'avez pas ~r~l\'autorisation~w~.')
    end
    
end)

RegisterServerEvent('zmain:gangs:dest')
AddEventHandler('zmain:gangs:dest', function(target)
	local sourceXPlayer = ESX.GetPlayerFromId(source)
	local targetXPlayer = ESX.GetPlayerFromId(target)

	if (targetXPlayer.job2.grade == 0) then
		TriggerClientEvent('esx:showNotification', _source, 'Vous ne pouvez pas ~r~rétrograder~w~ davantage.')
	else
		if sourceXPlayer.job2.grade_name == 'boss' and sourceXPlayer.job2.name == targetXPlayer.job2.name then
			targetXPlayer.setJob2(targetXPlayer.job2.name, tonumber(targetXPlayer.job2.grade) - 1)

			TriggerClientEvent('esx:showNotification', sourceXPlayer.source, 'Vous avez ~r~rétrogradé ' .. targetXPlayer.name .. '~w~.')
			TriggerClientEvent('esx:showNotification', target, 'Vous avez été ~r~rétrogradé par ' .. sourceXPlayer.name .. '~w~.')
		else
			TriggerClientEvent('esx:showNotification', sourceXPlayer.source, 'Vous n\'avez pas ~r~l\'autorisation~w~.')
		end
	end
end)

RegisterServerEvent('zmain:gangs:recrute')
AddEventHandler('zmain:gangs:recrute', function(target, job2, grade2)
	local sourceXPlayer = ESX.GetPlayerFromId(source)
	local targetXPlayer = ESX.GetPlayerFromId(target)

	if sourceXPlayer.job2.grade_name == 'boss' then
		targetXPlayer.setJob2(job2, grade2)
		TriggerClientEvent('esx:showNotification', sourceXPlayer.source, 'Vous avez ~g~recruté ' .. targetXPlayer.name .. '~w~.')
		TriggerClientEvent('esx:showNotification', target, 'Vous avez été ~g~embauché par ' .. sourceXPlayer.name .. '~w~.')
	end
end)

RegisterServerEvent('zmain:gangs:virer', function(target)
	local sourceXPlayer = ESX.GetPlayerFromId(source)
	local targetXPlayer = ESX.GetPlayerFromId(target)

	if sourceXPlayer.job2.grade_name == 'boss' and sourceXPlayer.job2.name == targetXPlayer.job2.name then
		targetXPlayer.setJob2('unemployed2', 0)
		TriggerClientEvent('esx:showNotification', sourceXPlayer.source, 'Vous avez ~r~viré ' .. targetXPlayer.name .. '~w~.')
		TriggerClientEvent('esx:showNotification', target, 'Vous avez été ~g~viré par ' .. sourceXPlayer.name .. '~w~.')
	else
		TriggerClientEvent('esx:showNotification', sourceXPlayer.source, 'Vous n\'avez pas ~r~l\'autorisation~w~.')
	end
end)