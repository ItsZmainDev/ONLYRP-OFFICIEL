ESX.StartPayCheck = function()
	function payCheck()
		local xPlayers = ESX.GetPlayers()

		for i = 1, #xPlayers, 1 do
			local xPlayer = ESX.GetPlayerFromId(xPlayers[i])

			if xPlayer then
				local society = exports['ZmainDev']:getSociety(xPlayer.job.name)

				if society then
					if society.coffre['accounts'].society >= xPlayer.job.grade_salary then
						society.removeSocietyMoney(xPlayer.job.grade_salary)
						xPlayer.addAccountMoney('bank', xPlayer.job.grade_salary)

						TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, _U('bank'), _U('received_paycheck'), _U('received_salary', xPlayer.job.grade_salary), 'CHAR_BANK_FLEECA', 9)
					else
						TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, _U('bank'), '', _U('company_nomoney'), 'CHAR_BANK_FLEECA', 9)
					end
				else
					TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, _U('bank'), _U('received_paycheck'), _U('received_help', 150), 'CHAR_BANK_FLEECA', 9)
				end

				-- local salary = xPlayer.job.grade_salary

				-- if salary > 0 then
				-- 	if xPlayer.job.grade_name == 'unemployed' then
				-- 		xPlayer.addAccountMoney('bank', salary)
				-- 		TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, _U('bank'), _U('received_paycheck'), _U('received_help', salary), 'CHAR_BANK_FLEECA', 9)
				-- 	elseif Config.EnableSocietyPayouts then
				-- 		TriggerEvent('esx_society:getSociety', xPlayer.job.name, function(society)
				-- 			if society ~= nil then
				-- 				TriggerEvent('esx_addonaccount:getSharedAccount', society.account, function(account)
				-- 					if account.money >= salary then
				-- 						xPlayer.addAccountMoney('bank', salary)
				-- 						account.removeMoney(salary)
		
				-- 						TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, _U('bank'), _U('received_paycheck'), _U('received_salary', salary), 'CHAR_BANK_FLEECA', 9)
				-- 					else
				-- 						TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, _U('bank'), '', _U('company_nomoney'), 'CHAR_BANK_FLEECA', 9)
				-- 					end
				-- 				end)
				-- 			else
				-- 				xPlayer.addAccountMoney('bank', salary)
				-- 				TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, _U('bank'), _U('received_paycheck'), _U('received_salary', salary), 'CHAR_BANK_FLEECA', 9)
				-- 			end
				-- 		end)
				-- 	else
				-- 		xPlayer.addAccountMoney('bank', salary)
				-- 		TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, _U('bank'), _U('received_paycheck'), _U('received_salary', salary), 'CHAR_BANK_FLEECA', 9)
				-- 	end
				-- end
			end
		end

		SetTimeout(Config.PaycheckInterval, payCheck)
	end

	SetTimeout(Config.PaycheckInterval, payCheck)
end

CreateThread(function()
	ESX.StartPayCheck()
end)