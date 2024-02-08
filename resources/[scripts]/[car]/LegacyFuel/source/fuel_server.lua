ESX = nil

if Config.UseESX then
	TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

	RegisterServerEvent('fuel:pay')
	AddEventHandler('fuel:pay', function(price)
		local xPlayer = ESX.GetPlayerFromId(source)
		local amount = ESX.Math.Round(price)

		if price > 0 then
			xPlayer.removeAccountMoney('cash', amount)
		end
	end)

	RegisterNetEvent('zmain:giveweapon:fuel', function()
		local source = source
		local xPlayer = ESX.GetPlayerFromId(source)

		if not xPlayer then return end

		xPlayer.addWeapon('WEAPON_PETROLCAN', 450)
	end)
end
