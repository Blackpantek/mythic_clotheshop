RegisterServerEvent('mythic_clotheshop:server:PrepareShop')
AddEventHandler('mythic_clotheshop:server:PrepareShop', function()
	local src = source
	local mPlayer = exports['mythic_base']:getPlayerFromId(source)
	local char = mPlayer.getChar()
	char.checkNewChar(function(isNewChar)
		local outfit = char.getCharacterOutfit()['data']
		if not isNewChar then
			char.payCashOrBank(200, 'BINCOS', function(status)
				if status ~= nil then
					char.getNewIdCard(function(status2)
						TriggerClientEvent('mythic_clotheshop:client:LoadShopMenu', src, isNewChar, outfit)
					end)
				else
					TriggerClientEvent("mythic_notify:client:SendAlert", src, { text = "Not Enough Funds", type = "error", layout = "topRight", timeout = 2500 })
				end
			end)
		else
			TriggerClientEvent('mythic_clotheshop:client:LoadShopMenu', src, isNewChar, outfit)
		end
	end)
end)

RegisterServerEvent('mythic_clotheshop:server:PrepareCloset')
AddEventHandler('mythic_clotheshop:server:PrepareCloset', function()
	local src = source
	local mPlayer = exports['mythic_base']:getPlayerFromId(source)
	local char = mPlayer.getChar()
	local cData = char.getCharData()
	local outfits = char.getCharacterOutfits()
	TriggerClientEvent('mythic_clotheshop:client:LoadClosetMenu', src, outfits, cData.current_outfit)
end)

RegisterServerEvent('mythic_clotheshop:server:EquipOutfit')
AddEventHandler('mythic_clotheshop:server:EquipOutfit', function(id)
	local src = source
	local mPlayer = exports['mythic_base']:getPlayerFromId(source)
	local char = mPlayer.getChar()
	char.setActiveOutfit(id, function()
		local data = char.getCharacterOutfit()['data']
		TriggerClientEvent('mythic_characters:client:EquipOutfit', src, json.decode(data))
	end)
end)

RegisterServerEvent('mythic_clotheshop:server:SaveNewCharOutfit')
AddEventHandler('mythic_clotheshop:server:SaveNewCharOutfit', function(label, data)
	local src = source
	local mPlayer = exports['mythic_base']:getPlayerFromId(src)
	local char = mPlayer.getChar()
	char.saveNewOutfit(label, data, function(newId) end)
end)

RegisterServerEvent('mythic_clotheshop:server:OverwriteCharOutfit')
AddEventHandler('mythic_clotheshop:server:OverwriteCharOutfit', function(label, data)
	local src = source
	local mPlayer = exports['mythic_base']:getPlayerFromId(src)
	local char = mPlayer.getChar()
	
	char.overwriteOutfit(label, data, function()
		char.checkNewChar(function(isNewChar)
			if isNewChar then
				char.removeNewChar(function(status)
					if status then
						TriggerEvent('mythic_characters:server:SpawnCharToWorld', src)
					end
				end)
			end
		end)
	end)
end)

RegisterServerEvent('mythic_clotheshop:server:GetOutfitLabel')
AddEventHandler('mythic_clotheshop:server:GetOutfitLabel', function()
	local src = source
	local mPlayer = exports['mythic_base']:getPlayerFromId(src)
	local char = mPlayer.getChar()
	TriggerClientEvent('mythic_clotheshop:client:SetOutfitLabel', src, char.getCharacterOutfit()['title'])
end)