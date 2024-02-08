ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_basicneeds:removeItem')
AddEventHandler('esx_basicneeds:removeItem', function(item)

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    xPlayer.removeInventoryItem(item, 1)

end)

RegisterServerEvent('esx_basicneeds:updateStatus')
AddEventHandler('esx_basicneeds:updateStatus', function(type, count)
	
	TriggerClientEvent('esx_status:add', source, type, count)

end)

ESX.RegisterUsableItem('sw', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('sw', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 140000) 
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', "Vous avez consommé ~y~x1 Sandwich")
end)

ESX.RegisterUsableItem('bread', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('bread', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 200000) 
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', "Vous avez consommé ~y~x1 Pain")
end)
-----------------------------------Tacos-----------------------------------
ESX.RegisterUsableItem('tacosxll', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('tacosxll', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 180000) 
    TriggerClientEvent('esx_basicneeds:onEat', source)
    TriggerClientEvent('esx:showNotification', source, "Vous avez consommé ~y~x1 Tacos xxl")
end)

ESX.RegisterUsableItem('tacos3', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('tacos3', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 170000) 
    TriggerClientEvent('esx_basicneeds:onEat', source)
    TriggerClientEvent('esx:showNotification', source, "Vous avez consommé ~y~x1 Tacos 3 viandes")
end)

ESX.RegisterUsableItem('tacos2', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('tacos2', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 160000) 
    TriggerClientEvent('esx_basicneeds:onEat', source)
    TriggerClientEvent('esx:showNotification', source, "Vous avez consommé ~y~x1 Tacos 2 viandes")
end)

ESX.RegisterUsableItem('sundaynature', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('sundaynature', 1)

    TriggerClientEvent('esx_status:add', source, 'thirst', 200000) 
    TriggerClientEvent('esx_basicneeds:onDrink', source)
    TriggerClientEvent('esx:showNotification', source, "Vous avez consommé ~y~x1 Sunday Nature")
end)

ESX.RegisterUsableItem('sundayfraise', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('sundayfraise', 1)

    TriggerClientEvent('esx_status:add', source, 'thirst', 200000) 
    TriggerClientEvent('esx_basicneeds:onDrink', source)
    TriggerClientEvent('esx:showNotification', source, "Vous avez consommé ~y~x1 Sunday Fraise")
end)

ESX.RegisterUsableItem('petitefrite', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('petitefrite', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 140000) 
    TriggerClientEvent('esx_basicneeds:onEat', source)
    TriggerClientEvent('esx:showNotification', source, "Vous avez consommé ~y~x1 Petite frite")
end)

ESX.RegisterUsableItem('petitefrite', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('moyennefrite', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 140000) 
    TriggerClientEvent('esx_basicneeds:onEat', source)
    TriggerClientEvent('esx:showNotification', source, "Vous avez consommé ~y~x1 Moyenne Frite")
end)

ESX.RegisterUsableItem('grandefrite', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('grandefrite', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 150000) 
    TriggerClientEvent('esx_basicneeds:onEat', source)
    TriggerClientEvent('esx:showNotification', source, "Vous avez consommé ~y~x1 Grande frite")
end)

-----------------------------------Vigneron-----------------------------------
ESX.RegisterUsableItem('grand_cru', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('grand_cru', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 200000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
    TriggerClientEvent('esx:showNotification', source, "Vous avez consommé ~y~x1 Grand Cru")
end)

ESX.RegisterUsableItem('vinrouge', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('vinrouge', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 170000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
    TriggerClientEvent('esx:showNotification', source, "Vous avez consommé ~y~x1 Vin Rouge")
end)

ESX.RegisterUsableItem('vinblanc', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('vinblanc', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 150000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
    TriggerClientEvent('esx:showNotification', source, "Vous avez consommé ~y~x1 Vin Blanc")
end)

ESX.RegisterUsableItem('vinrose', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('vinrose', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 150000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
    TriggerClientEvent('esx:showNotification', source, "Vous avez consommé ~y~x1 Rose")
end)

ESX.RegisterUsableItem('elixirblanco', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('elixirblanco', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 150000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
    TriggerClientEvent('esx:showNotification', source, "Vous avez consommé ~y~x1 Élixir blanco")
end)

ESX.RegisterUsableItem('cocktailmaison', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('cocktailmaison', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 150000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
    TriggerClientEvent('esx:showNotification', source, "Vous avez consommé ~y~x1 Cocktail maison")
end)

ESX.RegisterUsableItem('elixir', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('elixir', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 150000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
    TriggerClientEvent('esx:showNotification', source, "Vous avez consommé ~y~x1 Élixir")
end)
-----------------------------------bahamas-----------------------------------
ESX.RegisterUsableItem('mangoloco', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('mangoloco', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 180000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
    TriggerClientEvent('esx:showNotification', source, "Vous avez consommé ~y~x1 Mangoloco")
end)

ESX.RegisterUsableItem('heineken', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('heineken', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 180000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
    TriggerClientEvent('esx:showNotification', source, "Vous avez consommé ~y~x1 Heineken")
end)

ESX.RegisterUsableItem('caprisun', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('caprisun', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 180000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
    TriggerClientEvent('esx:showNotification', source, "Vous avez consommé ~y~x1 Caprisun")
end)

-----------------------------------tabac-----------------------------------
ESX.RegisterUsableItem('gitanes', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('gitanes', 1)

	TriggerClientEvent('esx_status:remove', source, 'hunger', 1000)
	TriggerClientEvent('esx_basicneeds:oncigarette', source)
    TriggerClientEvent('esx:showNotification', source, "Vous avez consommé ~y~x1 Cigarette")
end)

ESX.RegisterUsableItem('malboro', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('malboro', 1)

	TriggerClientEvent('esx_status:remove', source, 'hunger', 1000)
	TriggerClientEvent('esx_basicneeds:oncigarette', source)
    TriggerClientEvent('esx:showNotification', source, "Vous avez consommé ~y~x1 Malboro")
end)

-----------------------------------salieris-----------------------------------
ESX.RegisterUsableItem('pepsi', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('pepsi', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 150000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', "Vous avez consommé ~y~x1 Pepsi")
end)

ESX.RegisterUsableItem('sprite', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('sprite', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 150000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', "Vous avez consommé ~y~x1 Sprite")
end)

ESX.RegisterUsableItem('ricard', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('ricard', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 150000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', "Vous avez consommé ~y~x1 Ricard")
end)

ESX.RegisterUsableItem('morgane', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('morgane', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 150000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', "Vous avez consommé ~y~x1 Capitiane Morgane")
end)

ESX.RegisterUsableItem('cappuccino', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('cappuccino', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 120000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', "Vous avez consommé ~y~x1 Cappuccino")
end)

ESX.RegisterUsableItem('nioki', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('nioki', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 200000) 
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', "Vous avez consommé des ~b~Nioki")
end)

ESX.RegisterUsableItem('glacealitalienne', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('glacealitalienne', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 200000) 
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', "Vous avez consommé ~y~x1 Glace à l'Italienne")
end)
-----------------------------------unicorn-----------------------------------
ESX.RegisterUsableItem('rhum', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('rhum', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 120000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', "Vous avez consommé ~y~x1 Rhum")
end)

ESX.RegisterUsableItem('rhumcoca', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('rhumcoca', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 120000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', "Vous avez consommé ~y~x1 Rhum-Coca")
end)

ESX.RegisterUsableItem('vodka', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('vodka', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 120000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', "Vous avez consommé ~y~x1 Vodka")
end)

ESX.RegisterUsableItem('vodkafruit', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('vodkafruit', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 120000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', "Vous avez consommé ~y~x1 Vodka Jus de fruit")
end)

ESX.RegisterUsableItem('vodkaenergy', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('vodkaenergy', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 120000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', "Vous avez consommé ~y~x1 Vodka Energy")
end)

ESX.RegisterUsableItem('whisky', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('whisky', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 120000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', "Vous avez consommé ~y~x1 Whisky")
end)

ESX.RegisterUsableItem('whiskycoca', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('whiskycoca', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 120000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', "Vous avez consommé ~y~x1 Whisky Coca")
end)

ESX.RegisterUsableItem('tequila', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('tequila', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 120000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', "Vous avez consommé ~y~x1 Tequila")
end)
-----------------------------------tequilala-----------------------------------
ESX.RegisterUsableItem('pibwasser', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('pibwasser', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 150000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', "Vous avez consommé ~y~x1 Pibwasser")
end)

ESX.RegisterUsableItem('pastis', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('pastis', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 150000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', "Vous avez consommé ~y~x1 Pastis")
end)

ESX.RegisterUsableItem('siredward', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('siredward', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 150000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', "Vous avez consommé ~y~x1 Sir Edward")
end)

ESX.RegisterUsableItem('belini', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('belini', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 150000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', "Vous avez consommé ~y~x1 Belini")
end)

ESX.RegisterUsableItem('saucisson', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('saucisson', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 140000) 
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', "Vous avez consommé ~y~x1 Saucisson")
end)

ESX.RegisterUsableItem('bolcacahuetes', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('bolcacahuetes', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 180000) 
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', "Vous avez consommé ~y~x1 Bol de Cacahuètes")
end)

ESX.RegisterUsableItem('caviar', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('caviar', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 180000) 
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', "Vous avez consommé ~y~x1 Caviar")
end)

ESX.RegisterUsableItem('salami', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('salami', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 180000) 
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', "Vous avez consommé ~y~x1 Salami")
end)
-------------------------------------------------------------------------------
ESX.RegisterUsableItem('coffe', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('coffe', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 300000)
	TriggerClientEvent('esx_basicneeds:oncoffee', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_coffe')) 
end)

ESX.RegisterUsableItem('bolnoixcajou', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('bolnoixcajou', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 300000)
	TriggerClientEvent('esx_basicneeds:oncoffee', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_bolnoixcajou')) 
end)

ESX.RegisterUsableItem('bolpistache', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('bolpistache', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 350000)
	TriggerClientEvent('esx_basicneeds:oncoffee', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_bolpistache')) 
end)

ESX.RegisterUsableItem('water', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('water', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 200000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', "Vous avez consommé ~y~x1 Eau")
end)

ESX.RegisterUsableItem('jager', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('jager', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 120000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', "Vous avez consommé ~y~x1 Jägermeister")
end)


ESX.RegisterUsableItem('chocolat', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('chocolat', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 150000)
	TriggerClientEvent('esx_basicneeds:onchocolat', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_chocolate'))
end)

ESX.RegisterUsableItem('applepie', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('applepie', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 350000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_applepie'))
end)

ESX.RegisterUsableItem('bolchips', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('bolchips', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 300000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', "Vous avez consommé ~y~x1 Bol de Chips")
end)

ESX.RegisterUsableItem('banana', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('banana', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 200000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_banana'))
end)

ESX.RegisterUsableItem('beef', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('beef', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 350000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_beef'))
end)

ESX.RegisterUsableItem('hamburger', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('hamburger', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 350000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_hamburger'))
end)

ESX.RegisterUsableItem('cupcake', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('cupcake', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 250000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_cupcake'))
end)

ESX.RegisterUsableItem('donut', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('donut', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 250000)
	TriggerClientEvent('esx_basicneeds:ondonut', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_donut'))
end)

ESX.RegisterUsableItem('soda', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('soda', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 250000)
	TriggerClientEvent('esx_basicneeds:onsoda', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_soda'))
end)

ESX.RegisterUsableItem('jusfruit', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('jusfruit', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 290000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_jusfruit'))
end)


ESX.RegisterUsableItem('mixapero', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('mixapero', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 300000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_mixapero'))
end)

ESX.RegisterUsableItem('mojito', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('mojito', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 340000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_mojito'))
end)


ESX.RegisterUsableItem('limonade', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('limonade', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 290000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_limonade'))
end)

ESX.RegisterUsableItem('cocacola', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('cocacola', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 290000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_cocacola'))
end)

ESX.RegisterUsableItem('cola', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('cola', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 290000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_cola'))
 
end)

ESX.RegisterUsableItem('loka', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('loka', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 300000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_loka'))

end)

ESX.RegisterUsableItem('pizza', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('pizza', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 400000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_pizza'))

end)

ESX.RegisterUsableItem('ice', function(source)

	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.removeInventoryItem('ice', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 200000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_ice'))

end)

ESX.RegisterUsableItem('coca', function(source)

	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.removeInventoryItem('coca', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 120000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', "Vous avez consommé ~y~x1 Coca-Cola")

end)

ESX.RegisterUsableItem('fanta', function(source)

	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.removeInventoryItem('fanta', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 120000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', "Vous avez consommé ~y~x1 Fanta")

end)

ESX.RegisterUsableItem('icetea', function(source)

	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.removeInventoryItem('icetea', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 120000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', "Vous avez consommé ~y~x1 IceTea")

end)

ESX.RegisterUsableItem('fish', function(source)

	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.removeInventoryItem('fish', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 250000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_fish'))

end)

ESX.RegisterUsableItem('energy', function(source)

	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.removeInventoryItem('energy', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 300000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_energy'))

end)

ESX.RegisterUsableItem('chips', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('chips', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 200000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_chips'))

end)