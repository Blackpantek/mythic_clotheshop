local _menuPool = NativeUI.CreatePool()
local closetMenu = NativeUI.CreateMenu("Closet", "Put On A Saved Outfit")
_menuPool:Add(closetMenu)

skinFunctions = {}

closetMenu.GenerateMenu = function(outfits, active_outfit)
    closetMenu:Clear() -- Clearing Menu Items
    if outfits ~= nil then
        closetMenu.Settings.MouseControlsEnabled = false
        closetMenu.Settings.MouseEdgeEnabled = false
        closetMenu.Settings.EnabledControls.Controller  = { { 0, 2 }, { 0, 1 } }
        closetMenu.Settings.EnabledControls.Keyboard = { { 0, 2 }, { 0, 1 }, { 0, 201 }, { 0, 195 }, { 0, 196 }, { 0, 187 }, { 0, 188 }, { 0, 189 }, { 0, 190 }, { 0, 202 }, { 0, 217 }, { 0, 242 }, { 0, 241 }, { 0, 239 }, { 0, 240 } }
        for _, v in pairs(outfits) do
            local item = NativeUI.CreateItem(v["title"], "")
            closetMenu:AddItem(item)

            if active_outfit == v['id'] then
                item:SetRightBadge(BadgeStyle.Tick)
            end

            item.Activated = function(ParentMenu, SelectedItem)
                if active_outfit ~= v['id'] then
                    for i = 1, #ParentMenu.Items, 1 do
                        ParentMenu.Items[i]:SetRightBadge(BadgeStyle.None)
                    end

                    item:SetRightBadge(BadgeStyle.Tick)
                    active_outfit = v['id']
                    TriggerServerEvent('mythic_clotheshop:server:EquipOutfit', v['id'])
                end
                exports['mythic_notify']:SendAlert('success', v["title"] .. ' Equipped')
            end
        end
    end
end

RegisterNetEvent('mythic_clotheshop:client:LoadClosetMenu')
AddEventHandler('mythic_clotheshop:client:LoadClosetMenu', function(outfits, current_outfit)
    closetMenu.GenerateMenu(outfits, current_outfit)
    closetMenu:Visible(not closetMenu:Visible())
end)

--[[Citizen]]--
Citizen.CreateThread(function()
    while (true) do
        _menuPool:ProcessMenus()
        Citizen.Wait(0)
    end
end)