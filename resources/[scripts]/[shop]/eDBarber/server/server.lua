ESX = nil

TriggerEvent(eDBarber.GetESX, function(obj) ESX = obj end)

RegisterNetEvent('</eDen:Achat')
AddEventHandler('</eDen:Achat', function(Price)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    if xPlayer.getAccount('cash').money >= Price then 
        xPlayer.removeAccountMoney('cash', Price)
        print(Price)
        TriggerClientEvent('esx:showAdvancedNotification', _src,  "Barber", "Barber Shop", "Vous avez payez ~g~"..Price.."$", "icon", 1)
        TriggerClientEvent('</eDen:EnregisteSkin', _src)
	else 
    	TriggerClientEvent('esx:showAdvancedNotification', _src, "Barber", "Barber Shop", 'Vous n\'avez pas suffisament d\'argent !', "icon", 1)
    end
end)

RegisterNetEvent('zmain:barber:sortInstance', function()
    local source = source
    SetPlayerRoutingBucket(source, 0)
end)