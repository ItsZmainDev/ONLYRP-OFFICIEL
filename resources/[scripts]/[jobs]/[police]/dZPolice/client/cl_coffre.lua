
----OUVRIR LE MENU------------
local position = {
	{x = -1088.38, y = -821.255, z = 11.03}
}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local mainMenu = RageUI.CreateMenu("~b~Stockage", "Quel actions voulez vous faire")
local PutMenu = RageUI.CreateSubMenu(mainMenu,"~b~Inventory", "Choisissez l'objet à déposer")
local GetMenu = RageUI.CreateSubMenu(mainMenu,"~b~Coffre", "Choisissez l'objet à prendre")
local PutMenuArme = RageUI.CreateSubMenu(mainMenu,"~b~Inventory", "Choisissez l'objet à déposer")
local GetMenuArme = RageUI.CreateSubMenu(mainMenu,"~b~Coffre", "Choisissez l'objet à prendre")

local open = false

mainMenu:DisplayGlare(false)
mainMenu.Closed = function()
    open = false
end

all_items = {}
all_weapons = {}

function KeyboardInput(TextEntry, ExampleText, MaxStringLenght)

    AddTextEntry('FMMC_KEY_TIP1', TextEntry) 
    
    blockinput = true 
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "Somme", ExampleText, "", "", "", MaxStringLenght) 
    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do 
        Citizen.Wait(0)
    end 
         
    if UpdateOnscreenKeyboard() ~= 2 then
        local result = GetOnscreenKeyboardResult()
        Citizen.Wait(500) 
        blockinput = false
        return result 
    else
        Citizen.Wait(500) 
        blockinput = false 
        return nil 
    end
end

    
function Coffrelspd() 
    if open then 
		open = false
		RageUI.Visible(mainMenu, false)
		return
	else
		open = true 
		RageUI.Visible(mainMenu, true)
		CreateThread(function()
		while open do 
        RageUI.IsVisible(mainMenu, function()
            RageUI.Button("Prendre un objet", " ", {RightLabel = "→"}, true, {onSelected = function()
                getStock()
            end},GetMenu);

            RageUI.Button("Déposer un objet", " ", {RightLabel = "→"}, true, {onSelected = function()
                getInventory()
            end},PutMenu);

            RageUI.Button("Prendre une Arme", " ", {RightLabel = "→"}, true, {onSelected = function()
                OpenGetWeaponMenu()
                RageUI.CloseAll()
            end});

            RageUI.Button("Déposer une Arme", " ", {RightLabel = "→"}, true, {onSelected = function()
                OpenPutWeaponMenu()
                RageUI.CloseAll()
            end});
            

        end)

        RageUI.IsVisible(GetMenu, function()
            
            for k,v in pairs(all_items) do
                RageUI.Button(v.label, " ", {RightLabel = "~g~x"..v.nb}, true, {onSelected = function()
                    local count = KeyboardInput("Combien voulez vous en déposer",nil,4)
                    count = tonumber(count)
                    if count <= v.nb then
                        TriggerServerEvent("police:takeStockItems",v.item, count)
                    else
                        ESX.ShowNotification("~r~Vous n'en avez pas assez sur vous")
                    end
                    getStock()
                end});
            end

        end)

        RageUI.IsVisible(PutMenu, function()
            
            for k,v in pairs(all_items) do
                RageUI.Button(v.label, " ", {RightLabel = "~g~x"..v.nb}, true, {onSelected = function()
                    local count = KeyboardInput("Combien voulez vous en déposer",nil,4)
                    count = tonumber(count)
                    TriggerServerEvent("police:putStockItems",v.item, count)
                    getInventory()
                end});
            end
            

       end)


        Wait(0)
    end
 end)
 end
 end



function getInventory()
    ESX.TriggerServerCallback('police:playerinventory', function(inventory)               
                
        all_items = inventory
        
    end)
end

function getStock()
    ESX.TriggerServerCallback('police:getStockItems', function(inventory)               
                
        all_items = inventory
        
    end)
end

function OpenGetWeaponMenu()

	ESX.TriggerServerCallback('police:getArmoryWeapons', function(weapons)
		local elements = {}

		for i=1, #weapons, 1 do
			if weapons[i].count > 0 then
				table.insert(elements, {
					label = 'x' .. weapons[i].count .. ' ' .. ESX.GetWeaponLabel(weapons[i].name),
					value = weapons[i].name
				})
			end
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'armory_get_weapon',
		{
			title    = ('Armurerie'),
			align    = 'top-left',
			elements = elements
		}, function(data, menu)

			menu.close()

			ESX.TriggerServerCallback('police:removeArmoryWeapon', function()
			OpenGetWeaponMenu()
			end, data.current.value)

		end, function(data, menu)
			menu.close()
		end)
	end)

end

function OpenPutWeaponMenu()
	local elements   = {}
	local playerPed  = PlayerPedId()
	local weaponList = ESX.GetWeaponList()

	for i=1, #weaponList, 1 do
		local weaponHash = GetHashKey(weaponList[i].name)

		if HasPedGotWeapon(playerPed, weaponHash, false) and weaponList[i].name ~= 'WEAPON_UNARMED' then
			table.insert(elements, {
				label = weaponList[i].label,
				value = weaponList[i].name
			})
		end
	end

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'armory_put_weapon',
	{
		title    = ('Armurerie'),
		align    = 'top-left',
		elements = elements
	}, function(data, menu)

		menu.close()

		ESX.TriggerServerCallback('police:addArmoryWeapon', function()
			OpenPutWeaponMenu()
		end, data.current.value, true)

	end, function(data, menu)
		menu.close()
	end)
end

Citizen.CreateThread(function()
    while true do
		local wait = 750
			if ESX.PlayerData.job and ESX.PlayerData.job.name == 'police' then
				for k in pairs(position) do
				local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
				local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, position[k].x, position[k].y, position[k].z)

				if dist <= 5.0 then
					wait = 0
					DrawMarker(22, -1088.38, -821.255, 11.03, 0.0, 0.0, 0.0, 0.0,0.0,0.0, 0.3, 0.3, 0.3, 183, 28, 28, 255, true, true, p19, true)  
				end

				if dist <= 2.0 then
					wait = 0
					Visual.Subtitle("Appuyer sur ~b~[E]~s~ pour le ~r~Coffre", 1) 
					if IsControlJustPressed(1,51) then
						Coffrelspd()
					end
				end
			end
		end
    Citizen.Wait(wait)
    end
end)