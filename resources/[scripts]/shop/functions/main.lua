function open_ui()
	TriggerEvent('zmain:openNuiShop', 'Ammu-Nation')
end

exports('openUI', function(type)
	TriggerEvent('zmain:openNuiShop', type)
end)

function close_ui()
  	TriggerScreenblurFadeOut(1000)
	SendNUIMessage({action = "close"})
	SetNuiFocus(false, false)

	InMenu = false
end

RegisterNetEvent('zmain:openNuiShop', function(typeShop)
	local getInformationsShop = Config.Products[typeShop]

	if not getInformationsShop then return end

	local products = {}

	for k,v in pairs(getInformationsShop) do 
		table.insert(products, {id= k, name = v.name, price = v.price, item = v.item, type = v.type, image = v.image})
	end

	TriggerScreenblurFadeIn(1)
	SendNUIMessage({action = 'open', content = { products = products }})
	SetNuiFocus(true, true)

	InMenu = true
end)

KeyboardUtils = {isActive = false}

AddEventHandler("kbi:cancel",function() 
    KeyboardUtils.isActive = false
end)

function KeyboardUtils.use(title,cb)
    if not KeyboardUtils.isActive then
        KeyboardUtils.isActive = true
        exports.lslife_ui:use(title,function(data)
            cb(data)
            KeyboardUtils.isActive = false
        end)
    end
end

RegisterCommand('keyq', function()
	KeyboardUtils.use('test', function(tyey)
		print(tyey)
	end)
end)