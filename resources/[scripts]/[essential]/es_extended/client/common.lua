
_print = print
_TriggerServerEvent = TriggerServerEvent
_NetworkExplodeVehicle = NetworkExplodeVehicle
_AddExplosion = AddExplosion

AddEventHandler('esx:getSharedObject', function(cb)
	cb(ESX)
end)

function getSharedObject()
	return ESX
end