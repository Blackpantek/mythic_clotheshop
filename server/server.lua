RegisterServerEvent('mythic_clotheshop:server:PrepareShop')
AddEventHandler('mythic_clotheshop:server:PrepareShop', function()
	local src = source
	local mPlayer = exports['mythic_base']:FetchComponent('Fetch'):Source(source)
	local char = mPlayer:GetData('character')
	char:checkNewChar(function(isNewChar)
		local outfit = char:getCharacterOutfit()['data']
		if not isNewChar then
			char:payCashOrBank(200, 'BINCOS', function(status)
				if status ~= nil then
					TriggerClientEvent('mythic_clotheshop:client:ProcessMenus', src)
					TriggerClientEvent('mythic_clotheshop:client:LoadShopMenu', src, isNewChar, outfit)
				else
					TriggerClientEvent("mythic_notify:client:SendAlert", src, { text = "Not Enough Funds", type = "error", layout = "topRight", timeout = 2500 })
				end
			end)
		else
			TriggerClientEvent('mythic_clotheshop:client:ProcessMenus', src)
			TriggerClientEvent('mythic_clotheshop:client:LoadShopMenu', src, isNewChar, outfit)
		end
	end)
end)

RegisterServerEvent('mythic_clotheshop:server:PrepareCloset')
AddEventHandler('mythic_clotheshop:server:PrepareCloset', function()
	local src = source
	local mPlayer = exports['mythic_base']:FetchComponent('Fetch'):Source(source)
	local char = mPlayer:GetData('character')
	local cData = char:GetData()
	local outfits = char:getCharacterOutfits()
	TriggerClientEvent('mythic_clotheshop:client:LoadClosetMenu', src, outfits, cData.current_outfit)
end)

RegisterServerEvent('mythic_clotheshop:server:EquipOutfit')
AddEventHandler('mythic_clotheshop:server:EquipOutfit', function(id)
	local src = source
	local mPlayer = exports['mythic_base']:FetchComponent('Fetch'):Source(source)
	local char = mPlayer:GetData('character')
	char:setActiveOutfit(id, function()
		local data = char:getCharacterOutfit()['data']
		TriggerClientEvent('mythic_base:client:EquipOutfit', src, json.decode(data))
	end)
end)

RegisterServerEvent('mythic_clotheshop:server:SaveNewCharOutfit')
AddEventHandler('mythic_clotheshop:server:SaveNewCharOutfit', function(label, data)
	local src = source
	local mPlayer = exports['mythic_base']:FetchComponent('Fetch'):Source(src)
	local char = mPlayer:GetData('character')
	char:saveNewOutfit(label, data, function(newId) end)
end)

RegisterServerEvent('mythic_clotheshop:server:OverwriteCharOutfit')
AddEventHandler('mythic_clotheshop:server:OverwriteCharOutfit', function(label, data)
	local src = source
	local mPlayer = exports['mythic_base']:FetchComponent('Fetch'):Source(src)
	local char = mPlayer:GetData('character')
	
	char:overwriteOutfit(label, data, function()
		char:checkNewChar(function(isNewChar)
			if isNewChar then
				char:removeNewChar(function(status)
					if status then
						TriggerEvent('mythic_base:server:SpawnCharToWorld', src)
					end
				end)
			end
		end)
	end)
end)

RegisterServerEvent('mythic_clotheshop:server:GetOutfitLabel')
AddEventHandler('mythic_clotheshop:server:GetOutfitLabel', function()
	local src = source
	local mPlayer = exports['mythic_base']:FetchComponent('Fetch'):Source(src)
	local char = mPlayer:GetData('character')
	TriggerClientEvent('mythic_clotheshop:client:SetOutfitLabel', src, char:getCharacterOutfit()['title'])
end)