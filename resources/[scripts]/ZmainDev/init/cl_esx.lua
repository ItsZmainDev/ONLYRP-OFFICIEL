ESXLoaded = false
ESX = nil
ZmainUI = nil
Player = {
    WeaponData = {}
}
WeaponList = {}

Citizen.CreateThread(function()
	while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		TriggerEvent('ZmainUI:sendShared', function(obj) ZmainUI = obj end)
        Citizen.Wait(0)
    end

	ESX.PlayerData = ESX.GetPlayerData()
	Player.WeaponData = ESX.GetWeaponList()
	WeaponList = ESX.GetWeaponList()

	while (not ESX.PlayerData.job) do
		ESX.PlayerData = ESX.GetPlayerData()
		ESX.PlayerData.job = ESX.GetPlayerData().job
		ESX.GetPlayerData()
		Citizen.Wait(20)
	end

	while (not ESX.PlayerData.job2) do
		ESX.PlayerData = ESX.GetPlayerData()
		ESX.PlayerData.job2 = ESX.GetPlayerData().job2
		ESX.GetPlayerData()
		Citizen.Wait(20)
	end

	while not (ESX.PlayerData.inventory) do
		ESX.PlayerData = ESX.GetPlayerData()
		ESX.PlayerData.inventory = ESX.GetPlayerData().inventory
		ESX.GetPlayerData()
		Citizen.Wait(20)
	end

	while ESX.PlayerData == nil do 
		Wait(1)
		ESX.PlayerData = ESX.GetPlayerData()
	end

	for i = 1, #Player.WeaponData, 1 do
		if Player.WeaponData[i].name == 'WEAPON_UNARMED' then
			Player.WeaponData[i] = nil
		else
			Player.WeaponData[i].hash = GetHashKey(Player.WeaponData[i].name)
		end
    end

	Wait(500)
    ESXLoaded = true
	-- ReplaceHudColourWithRgba(116, tonumber(UTILS.ServerColor.r), tonumber(UTILS.ServerColor.g), tonumber(UTILS.ServerColor.b), 255)
    print('ESX Loaded')
	exports["pma-voice"]:setRadioVolume(100)
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

RegisterNetEvent('esx:setJob2')
AddEventHandler('esx:setJob2', function(job2)
	ESX.PlayerData.job2 = job2
end)

RegisterNetEvent('esx:setGroup')
AddEventHandler('esx:setGroup', function(group, lastGroup)
	ESX.PlayerData.group = group
end)

RegisterNetEvent('esx:activateMoney')
AddEventHandler('esx:activateMoney', function(money)
    ESX.PlayerData.money = money
end)

RegisterNetEvent('esx:setAccountMoney')
AddEventHandler('esx:setAccountMoney', function(account)
	for i = 1, #ESX.PlayerData.accounts, 1 do
		if ESX.PlayerData.accounts[i].name == account.name then
			ESX.PlayerData.accounts[i] = account
			break
		end
	end
end)

RegisterNetEvent('esx_addonaccount:setMoney')
AddEventHandler('esx_addonaccount:setMoney', function(society, money)
	if ESX.PlayerData.job.grade_name == 'boss' and 'society_' .. ESX.PlayerData.job.name == society then
		UpdateSocietyMoney(money)
	end
end)

function RefrehEntrepriseMoney()
	if ESX.PlayerData.job.grade_name == 'boss' then
		ESX.TriggerServerCallback('esx_society:getSocietyMoney', function(money)
			print(money)
			UpdateSocietyMoney(money)
		end, ESX.PlayerData.job.name)
	end
end

-- RegisterNetEvent('esx:playerLoaded')
-- AddEventHandler('esx:playerLoaded', function(xPlayer)
-- 	Wait(1000)
--     LoadESX() -- @INIT ESX
-- end)

-- Citizen.CreateThread(function()
-- 	Wait(1000)
--     LoadESX()
-- end)

function DrawMissionText(msg, time)
    ClearPrints()
    SetTextEntry_2("STRING")
    AddTextComponentString(msg)
    DrawSubtitleTimed(time and math.ceil(time) or 0, true)
end

function UpdateSocietyMoney(money)
	Config.Personalmenu.soceityMoney = ESX.Math.GroupDigits(money)
end
