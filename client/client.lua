local _menuPool = NativeUI.CreatePool()
local clothesMenu = NativeUI.CreateMenu("Clothing", "Edit Your Look")
_menuPool:Add(clothesMenu)
local headMenu = _menuPool:AddSubMenu(clothesMenu, "Head", "", true)
local bodyMenu = _menuPool:AddSubMenu(clothesMenu, "Body", "", true)
local lowerbodyMenu = _menuPool:AddSubMenu(clothesMenu, "Lower Body", "", true)
local miscMenu = _menuPool:AddSubMenu(clothesMenu, "Miscellaneous", "", true)
local saveMenu = _menuPool:AddSubMenu(clothesMenu, "Save Outfit", "", true)

skinFunctions = {}

local data = json.decode('{ "outfit":{"head":{"hat":0,"hat_texture":0,"mask":0,"mask_texture":0,"glasses":0,"glasses_texutre":0,"ears":0,"ears_texture":0},"body":{"undershirt":0,"undershirt_texture":0,"shirt":0,"shirt_texture":0,"decals":0,"decals_texture":0,"vest":0,"vest_texture":0,"arms":0,"arms_texture":0},"lowerbody":{"pants":0,"pants_texture":0,"shoes":0,"shoes_texture":0},"misc":{"bag":0,"bag_texture":0}}}')

function GenerateMenu(isNewChar, outfit)
    clothesMenu:Clear() -- Clearing Menu Items


    if outfit ~= nil then
        data = json.decode(outfit)
    end
    
    headMenu = _menuPool:AddSubMenu(clothesMenu, "Head", "", true)
        local hatSelect = NativeUI.CreateListItem("Hat", getPropList(0), data.outfit.head.hat, "Press ENTER To Cycle Through Textures")
        local hatTextures = NativeUI.CreateStatisticsPanel()
        local glassesSelect = NativeUI.CreateListItem("Glasses", getPropList(1), data.outfit.head.glasses, "Press ENTER To Cycle Through Textures")
        local glassesTextures = NativeUI.CreateStatisticsPanel()
        local masksSelect = NativeUI.CreateListItem("Masks", getMasks(1), data.outfit.head.mask, "Press ENTER To Cycle Through Textures")
        local masksTextures = NativeUI.CreateStatisticsPanel()
        local earsSelect = NativeUI.CreateListItem("Piercings", getPropList(2), data.outfit.head.ears, "Press ENTER To Cycle Through Textures")
        local earTextures = NativeUI.CreateStatisticsPanel()
    bodyMenu = _menuPool:AddSubMenu(clothesMenu, "Body", "", true)
        local undershirtSelect = NativeUI.CreateListItem("Undershirt", getDrawableList(8), data.outfit.body.undershirt, "Press ENTER To Cycle Through Textures")
        local undershirtTextures = NativeUI.CreateStatisticsPanel()
        local shirtSelect = NativeUI.CreateListItem("Shirt", getDrawableList(11), data.outfit.body.shirt, "Press ENTER To Cycle Through Textures")
        local shirtTextures = NativeUI.CreateStatisticsPanel()
        local decalsSelect = NativeUI.CreateListItem("Decals", getMasks(10), data.outfit.body.decals, "Press ENTER To Cycle Through Textures")
        local decalsTextures = NativeUI.CreateStatisticsPanel()
        local vestSelect = NativeUI.CreateListItem("Vests / Accessory 1", getMasks(9), data.outfit.body.vest, "Press ENTER To Cycle Through Textures")
        local vestTextures = NativeUI.CreateStatisticsPanel()
        local armsSelect = NativeUI.CreateListItem("Arms / Gloves", getDrawableList(3), data.outfit.body.arms, "Press ENTER To Cycle Through Textures")
        local armsTextures = NativeUI.CreateStatisticsPanel()
    lowerbodyMenu = _menuPool:AddSubMenu(clothesMenu, "Lower Body", "", true)
        local pantsSelect = NativeUI.CreateListItem("Pants", getDrawableList(4), data.outfit.lowerbody.pants, "Press ENTER To Cycle Through Textures")
        local pantsTextures = NativeUI.CreateStatisticsPanel()
        local shoesSelect = NativeUI.CreateListItem("Shoes", getDrawableList(6), data.outfit.lowerbody.shoes, "Press ENTER To Cycle Through Textures")
        local shoesTextures = NativeUI.CreateStatisticsPanel()
    miscMenu = _menuPool:AddSubMenu(clothesMenu, "Miscellaneous", "", true)
        local bagSelect = NativeUI.CreateListItem("Bags / Accessory 2", getMasks(5), data.outfit.misc.bag, "Press ENTER To Cycle Through Textures")
        local bagTextures = NativeUI.CreateStatisticsPanel()
    saveMenu = _menuPool:AddSubMenu(clothesMenu, "Save Outfit", "", true)
        local cancelSave = NativeUI.CreateItem("Cancel", "Do you want to finish and save this outfit?")
        local newSave = NativeUI.CreateItem("Save New Outfit", "Do you want to finish and save this outfit?")
        local overwriteSave = NativeUI.CreateItem("Overwrite Current Outfit", "Do you want to finish and save this outfit?")

    clothesMenu.Settings.MouseControlsEnabled = false
    clothesMenu.Settings.MouseEdgeEnabled = false
    clothesMenu.Settings.EnabledControls.Controller  = { { 0, 2 }, { 0, 1 } }
    clothesMenu.Settings.EnabledControls.Keyboard = { { 0, 2 }, { 0, 1 }, { 0, 201 }, { 0, 195 }, { 0, 196 }, { 0, 187 }, { 0, 188 }, { 0, 189 }, { 0, 190 }, { 0, 202 }, { 0, 217 }, { 0, 242 }, { 0, 241 }, { 0, 239 }, { 0, 240 } }

    if isNewChar then
        clothesMenu.Controls.Back.Enabled = false
    else
        clothesMenu.Controls.Back.Enabled = true
    end

    headMenu.SubMenu.Settings.MouseControlsEnabled = false
    headMenu.SubMenu.Settings.MouseEdgeEnabled = false
    headMenu.SubMenu.Settings.EnabledControls.Controller  = { { 0, 2 }, { 0, 1 } }
    headMenu.SubMenu.Settings.EnabledControls.Keyboard = { { 0, 2 }, { 0, 1 }, { 0, 201 }, { 0, 195 }, { 0, 196 }, { 0, 187 }, { 0, 188 }, { 0, 189 }, { 0, 190 }, { 0, 202 }, { 0, 217 }, { 0, 242 }, { 0, 241 }, { 0, 239 }, { 0, 240 } }

    bodyMenu.SubMenu.Settings.MouseControlsEnabled = false
    bodyMenu.SubMenu.Settings.MouseEdgeEnabled = false
    bodyMenu.SubMenu.Settings.EnabledControls.Controller  = { { 0, 2 }, { 0, 1 } }
    bodyMenu.SubMenu.Settings.EnabledControls.Keyboard = { { 0, 2 }, { 0, 1 }, { 0, 201 }, { 0, 195 }, { 0, 196 }, { 0, 187 }, { 0, 188 }, { 0, 189 }, { 0, 190 }, { 0, 202 }, { 0, 217 }, { 0, 242 }, { 0, 241 }, { 0, 239 }, { 0, 240 } }

    lowerbodyMenu.SubMenu.Settings.MouseControlsEnabled = false
    lowerbodyMenu.SubMenu.Settings.MouseEdgeEnabled = false
    lowerbodyMenu.SubMenu.Settings.EnabledControls.Controller  = { { 0, 2 }, { 0, 1 } }
    lowerbodyMenu.SubMenu.Settings.EnabledControls.Keyboard = { { 0, 2 }, { 0, 1 }, { 0, 201 }, { 0, 195 }, { 0, 196 }, { 0, 187 }, { 0, 188 }, { 0, 189 }, { 0, 190 }, { 0, 202 }, { 0, 217 }, { 0, 242 }, { 0, 241 }, { 0, 239 }, { 0, 240 } }

    miscMenu.SubMenu.Settings.MouseControlsEnabled = false
    miscMenu.SubMenu.Settings.MouseEdgeEnabled = false
    miscMenu.SubMenu.Settings.EnabledControls.Controller  = { { 0, 2 }, { 0, 1 } }
    miscMenu.SubMenu.Settings.EnabledControls.Keyboard = { { 0, 2 }, { 0, 1 }, { 0, 201 }, { 0, 195 }, { 0, 196 }, { 0, 187 }, { 0, 188 }, { 0, 189 }, { 0, 190 }, { 0, 202 }, { 0, 217 }, { 0, 242 }, { 0, 241 }, { 0, 239 }, { 0, 240 } }

    saveMenu.SubMenu.Settings.MouseControlsEnabled = false
    saveMenu.SubMenu.Settings.MouseEdgeEnabled = false
    saveMenu.SubMenu.Settings.EnabledControls.Controller  = { { 0, 2 }, { 0, 1 } }
    saveMenu.SubMenu.Settings.EnabledControls.Keyboard = { { 0, 2 }, { 0, 1 }, { 0, 201 }, { 0, 195 }, { 0, 196 }, { 0, 187 }, { 0, 188 }, { 0, 189 }, { 0, 190 }, { 0, 202 }, { 0, 217 }, { 0, 242 }, { 0, 241 }, { 0, 239 }, { 0, 240 } }
    
    --[[ HEAD SECTION ]]--
    hatTextures:AddStatistics("Textures")
    hatTextures:SetPercentage(1, 0)
    headMenu.SubMenu:AddItem(hatSelect)
    hatSelect:AddPanel(hatTextures)
    hatSelect.OnListChanged = function(ParentMenu, SelectedItem, Index)
        local item = SelectedItem:IndexToItem(Index)
        data.outfit.head.hat         = item.Value
        data.outfit.head.hat_texture    = item.Texture
        hatTextures:SetPercentage(1, 0)

        if item.Value == 0 then
            ClearPedProp(PlayerPedId(), 0)
        else
            SetPedPropIndex(PlayerPedId(), 0, item.Value, item.Texture, 0)
        end
    end
    hatSelect.OnListSelected = function(ParentMenu, SelectedItem, Index)
        local item = SelectedItem:IndexToItem(Index)
        if item.Texture + 1 <= item.Max then
            item.Texture            = item.Texture + 1
        else
            item.Texture            = 0
        end
        local perTexWeight = 100 / item.Max
        hatTextures:SetPercentage(1, perTexWeight * item.Texture)
        data.outfit.head.hat_texture    = item.Texture

        if item.Value == 0 then
            ClearPedProp(PlayerPedId(), 0)
        else
            SetPedPropIndex(PlayerPedId(), 0, item.Value, item.Texture, 0)
        end
    end

    glassesTextures:AddStatistics("Textures")
    glassesTextures:SetPercentage(1, 0)
    headMenu.SubMenu:AddItem(glassesSelect)
    glassesSelect:AddPanel(glassesTextures)
    glassesSelect.OnListChanged = function(ParentMenu, SelectedItem, Index)
        local item = SelectedItem:IndexToItem(Index)
        data.outfit.head.glasses         = item.Value
        data.outfit.head.glasses_texture    = item.Texture
        hatTextures:SetPercentage(1, 0)

        if item.Value == 0 then
            ClearPedProp(PlayerPedId(), 1)
        else
            SetPedPropIndex(PlayerPedId(), 1, item.Value, item.Texture, 0)
        end
    end
    glassesSelect.OnListSelected = function(ParentMenu, SelectedItem, Index)
        local item = SelectedItem:IndexToItem(Index)
        if item.Texture + 1 <= item.Max then
            item.Texture            = item.Texture + 1
        else
            item.Texture            = 0
        end
        local perTexWeight = 100 / item.Max
        glassesTextures:SetPercentage(1, perTexWeight * item.Texture)
        data.outfit.head.glasses_texture    = item.Texture

        if item.Value == 0 then
            ClearPedProp(PlayerPedId(), 1)
        else
            SetPedPropIndex(PlayerPedId(), 1, item.Value, item.Texture, 0)
        end
    end

    masksTextures:AddStatistics("Textures")
    masksTextures:SetPercentage(1, 0)
    headMenu.SubMenu:AddItem(masksSelect)
    masksSelect:AddPanel(masksTextures)
    masksSelect.OnListChanged = function(ParentMenu, SelectedItem, Index)
        local item = SelectedItem:IndexToItem(Index)
        data.outfit.head.mask           = item.Value
        data.outfit.head.mask_texture   = item.Texture
        hatTextures:SetPercentage(1, 0)
        SetPedComponentVariation(PlayerPedId(), 1, item.Value, item.Texture, 2)
    end
    masksSelect.OnListSelected = function(ParentMenu, SelectedItem, Index)
        local item = SelectedItem:IndexToItem(Index)
        if item.Texture + 1 <= item.Max then
            item.Texture            = item.Texture + 1
        else
            item.Texture            = 0
        end
        local perTexWeight = 100 / item.Max
        masksTextures:SetPercentage(1, perTexWeight * item.Texture)
        data.outfit.head.mask_texture    = item.Texture
        SetPedComponentVariation(PlayerPedId(), 1, item.Value, item.Texture, 2)
    end

    earTextures:AddStatistics("Textures")
    earTextures:SetPercentage(1, 0)
    headMenu.SubMenu:AddItem(earsSelect)
    earsSelect:AddPanel(earTextures)
    earsSelect.OnListChanged = function(ParentMenu, SelectedItem, Index)
        local item = SelectedItem:IndexToItem(Index)
        data.outfit.head.ears            = item.Value
        data.outfit.head.ears_texture    = item.Texture
        hatTextures:SetPercentage(1, 0)

        if item.Value == 0 then
            ClearPedProp(PlayerPedId(), 2)
        else
            SetPedPropIndex(PlayerPedId(), 2, item.Value, item.Texture, 0)
        end

    end
    earsSelect.OnListSelected = function(ParentMenu, SelectedItem, Index)
        local item = SelectedItem:IndexToItem(Index)
        if item.Texture + 1 <= item.Max then
            item.Texture            = item.Texture + 1
        else
            item.Texture            = 0
        end
        local perTexWeight          = 100 / item.Max
        earTextures:SetPercentage(1, perTexWeight * item.Texture)
        data.outfit.head.ears_texture    = item.Texture

        if item.Value == 0 then
            ClearPedProp(PlayerPedId(), 2)
        else
            SetPedPropIndex(PlayerPedId(), 2, item.Value, item.Texture, 0)
        end
    end

    --[[ BODY ]]--
    undershirtTextures:AddStatistics("Textures")
    undershirtTextures:SetPercentage(1, 0)
    bodyMenu.SubMenu:AddItem(undershirtSelect)
    undershirtSelect:AddPanel(undershirtTextures)
    undershirtSelect.OnListChanged = function(ParentMenu, SelectedItem, Index)
        local item = SelectedItem:IndexToItem(Index)
        data.outfit.body.undershirt         = item.Value
        data.outfit.body.undershirt_texture    = item.Texture
        undershirtTextures:SetPercentage(1, 0)
        SetPedComponentVariation(PlayerPedId(), 8, item.Value, item.Texture, 2)
    end
    undershirtSelect.OnListSelected = function(ParentMenu, SelectedItem, Index)
        local item = SelectedItem:IndexToItem(Index)
        if item.Texture + 1 <= item.Max then
            item.Texture            = item.Texture + 1
        else
            item.Texture            = 0
        end
        local perTexWeight = 100 / item.Max
        undershirtTextures:SetPercentage(1, perTexWeight * item.Texture)
        data.outfit.body.undershirt_texture    = item.Texture
        SetPedComponentVariation(PlayerPedId(), 8, item.Value, item.Texture, 2)
    end
    
    shirtTextures:AddStatistics("Textures")
    shirtTextures:SetPercentage(1, 0)
    bodyMenu.SubMenu:AddItem(shirtSelect)
    shirtSelect:AddPanel(shirtTextures)
    shirtSelect.OnListChanged = function(ParentMenu, SelectedItem, Index)
        local item = SelectedItem:IndexToItem(Index)
        data.outfit.body.shirt         = item.Value
        data.outfit.body.shirt_texture    = item.Texture
        shirtTextures:SetPercentage(1, 0)
        SetPedComponentVariation(PlayerPedId(), 11, item.Value, item.Texture, 2)
    end
    shirtSelect.OnListSelected = function(ParentMenu, SelectedItem, Index)
        local item = SelectedItem:IndexToItem(Index)
        if item.Texture + 1 <= item.Max then
            item.Texture            = item.Texture + 1
        else
            item.Texture            = 0
        end
        local perTexWeight = 100 / item.Max
        shirtTextures:SetPercentage(1, perTexWeight * item.Texture)
        data.outfit.body.shirt_texture    = item.Texture
        SetPedComponentVariation(PlayerPedId(), 11, item.Value, item.Texture, 2)
    end
    
    decalsTextures:AddStatistics("Textures")
    decalsTextures:SetPercentage(1, 0)
    bodyMenu.SubMenu:AddItem(decalsSelect)
    decalsSelect:AddPanel(decalsTextures)
    decalsSelect.OnListChanged = function(ParentMenu, SelectedItem, Index)
        local item = SelectedItem:IndexToItem(Index)
        data.outfit.body.decals         = item.Value
        data.outfit.body.decals_texture    = item.Texture
        decalsTextures:SetPercentage(1, 0)
        SetPedComponentVariation(PlayerPedId(), 10, item.Value, item.Texture, 2)
    end
    decalsSelect.OnListSelected = function(ParentMenu, SelectedItem, Index)
        local item = SelectedItem:IndexToItem(Index)
        if item.Texture + 1 <= item.Max then
            item.Texture            = item.Texture + 1
        else
            item.Texture            = 0
        end
        local perTexWeight = 100 / item.Max
        decalsTextures:SetPercentage(1, perTexWeight * item.Texture)
        data.outfit.body.decals_texture    = item.Texture
        SetPedComponentVariation(PlayerPedId(), 10, item.Value, item.Texture, 2)
    end
    
    vestTextures:AddStatistics("Textures")
    vestTextures:SetPercentage(1, 0)
    bodyMenu.SubMenu:AddItem(vestSelect)
    vestSelect:AddPanel(vestTextures)
    vestSelect.OnListChanged = function(ParentMenu, SelectedItem, Index)
        local item = SelectedItem:IndexToItem(Index)
        data.outfit.body.vest         = item.Value
        data.outfit.body.vest_texture    = item.Texture
        vestTextures:SetPercentage(1, 0)
        SetPedComponentVariation(PlayerPedId(), 9, item.Value, item.Texture, 2)
    end
    vestSelect.OnListSelected = function(ParentMenu, SelectedItem, Index)
        local item = SelectedItem:IndexToItem(Index)
        if item.Texture + 1 <= item.Max then
            item.Texture            = item.Texture + 1
        else
            item.Texture            = 0
        end
        local perTexWeight = 100 / item.Max
        vestTextures:SetPercentage(1, perTexWeight * item.Texture)
        data.outfit.body.vest_texture    = item.Texture
        SetPedComponentVariation(PlayerPedId(), 9, item.Value, item.Texture, 2)
    end
    
    armsTextures:AddStatistics("Textures")
    armsTextures:SetPercentage(1, 0)
    bodyMenu.SubMenu:AddItem(armsSelect)
    armsSelect:AddPanel(armsTextures)
    armsSelect.OnListChanged = function(ParentMenu, SelectedItem, Index)
        local item = SelectedItem:IndexToItem(Index)
        data.outfit.body.arms         = item.Value
        data.outfit.body.arms_texture    = item.Texture
        armsTextures:SetPercentage(1, 0)
        SetPedComponentVariation(PlayerPedId(), 3, item.Value, item.Texture, 2)
    end
    armsSelect.OnListSelected = function(ParentMenu, SelectedItem, Index)
        local item = SelectedItem:IndexToItem(Index)
        if item.Texture + 1 <= item.Max then
            item.Texture            = item.Texture + 1
        else
            item.Texture            = 0
        end
        local perTexWeight = 100 / item.Max
        armsTextures:SetPercentage(1, perTexWeight * item.Texture)
        data.outfit.body.arms_texture    = item.Texture
        SetPedComponentVariation(PlayerPedId(), 3, item.Value, item.Texture, 2)
    end

    --[[ LOWER BODY ]]--
    pantsTextures:AddStatistics("Textures")
    pantsTextures:SetPercentage(1, 0)
    lowerbodyMenu.SubMenu:AddItem(pantsSelect)
    pantsSelect:AddPanel(pantsTextures)
    pantsSelect.OnListChanged = function(ParentMenu, SelectedItem, Index)
        local item = SelectedItem:IndexToItem(Index)
        data.outfit.lowerbody.pants         = item.Value
        data.outfit.lowerbody.pants_texture    = item.Texture
        pantsTextures:SetPercentage(1, 0)
        SetPedComponentVariation(PlayerPedId(), 4, item.Value, item.Texture, 2)
    end
    pantsSelect.OnListSelected = function(ParentMenu, SelectedItem, Index)
        local item = SelectedItem:IndexToItem(Index)
        if item.Texture + 1 <= item.Max then
            item.Texture            = item.Texture + 1
        else
            item.Texture            = 0
        end
        local perTexWeight = 100 / item.Max
        pantsTextures:SetPercentage(1, perTexWeight * item.Texture)
        data.outfit.lowerbody.pants_texture    = item.Texture
        SetPedComponentVariation(PlayerPedId(), 4, item.Value, item.Texture, 2)
    end

    shoesTextures:AddStatistics("Textures")
    shoesTextures:SetPercentage(1, 0)
    lowerbodyMenu.SubMenu:AddItem(shoesSelect)
    shoesSelect:AddPanel(shoesTextures)
    shoesSelect.OnListChanged = function(ParentMenu, SelectedItem, Index)
        local item = SelectedItem:IndexToItem(Index)
        data.outfit.lowerbody.shoes         = item.Value
        data.outfit.lowerbody.shoes_texture    = item.Texture
        shoesTextures:SetPercentage(1, 0)
        SetPedComponentVariation(PlayerPedId(), 6, item.Value, item.Texture, 2)
    end
    shoesSelect.OnListSelected = function(ParentMenu, SelectedItem, Index)
        local item = SelectedItem:IndexToItem(Index)
        if item.Texture + 1 <= item.Max then
            item.Texture            = item.Texture + 1
        else
            item.Texture            = 0
        end
        local perTexWeight = 100 / item.Max
        shoesTextures:SetPercentage(1, perTexWeight * item.Texture)
        data.outfit.lowerbody.shoes_texture    = item.Texture
        SetPedComponentVariation(PlayerPedId(), 6, item.Value, item.Texture, 2)
    end

    --[[ MISC ]]--
    bagTextures:AddStatistics("Textures")
    bagTextures:SetPercentage(1, 0)
    miscMenu.SubMenu:AddItem(bagSelect)
    bagSelect:AddPanel(bagTextures)
    bagSelect.OnListChanged = function(ParentMenu, SelectedItem, Index)
        local item = SelectedItem:IndexToItem(Index)
        data.outfit.misc.bag            = item.Value
        data.outfit.misc.bag_texture    = item.Texture
        bagTextures:SetPercentage(1, 0)
        SetPedComponentVariation(PlayerPedId(), 5, item.Value, item.Texture, 2)
    end
    bagSelect.OnListSelected = function(ParentMenu, SelectedItem, Index)
        local item = SelectedItem:IndexToItem(Index)
        if item.Texture + 1 <= item.Max then
            item.Texture            = item.Texture + 1
        else
            item.Texture            = 0
        end
        local perTexWeight = 100 / item.Max
        bagTextures:SetPercentage(1, perTexWeight * item.Texture)
        data.outfit.misc.bag_texture    = item.Texture
        SetPedComponentVariation(PlayerPedId(), 5, item.Value, item.Texture, 2)
    end

    --[[ SAVE OUTFIT ]]--
    if isNewChar then
        saveMenu.SubMenu:AddItem(cancelSave)
        saveMenu.SubMenu:AddItem(overwriteSave)
        overwriteSave.Activated = function(ParentMenu, SelectedItem)
            SetNuiFocus(true, true)
            SendNUIMessage({
                action = 'overwrite',
                outfit = data,
                type = isNewChar,
            })
        end

        exports['mythic_notify']:SendAlert('inform', 'Choose Carefully! This is the only time you\'ll be able to change your outfit for free!', 5000)
    else
        saveMenu.SubMenu:AddItem(cancelSave)
        saveMenu.SubMenu:AddItem(newSave)
        newSave.Activated = function(ParentMenu, SelectedItem)
            SetNuiFocus(true, true)
            SendNUIMessage({
                action = "new",
                outfit = data,
                type = isNewChar,
            })
        end
        saveMenu.SubMenu:AddItem(overwriteSave)
        overwriteSave.Activated = function(ParentMenu, SelectedItem)
            TriggerServerEvent('mythic_clotheshop:server:GetOutfitLabel')
        end
    end
end

--[[Local/Global]]--
local clothingShops = {
    { x = 72.2545394897461,  y = -1399.10229492188, z = 29.3761386871338 },
    { x = -703.77685546875,  y = -152.258544921875, z = 37.4151458740234 },
    { x = -167.863754272461, y = -298.969482421875, z = 39.7332878112793 },
    { x = 428.694885253906,  y = -800.1064453125,   z = 29.4911422729492 },
    { x = -829.413269042969, y = -1073.71032714844, z = 11.3281078338623 },
    { x = -1447.7978515625,  y = -242.461242675781, z = 49.8207931518555 },
    { x = 11.6323690414429,  y = 6514.224609375,    z = 31.8778476715088 },
    { x = 123.64656829834,   y = -219.440338134766, z = 54.5578384399414 },
    { x = 1696.29187011719,  y = 4829.3125,         z = 42.0631141662598 },
    { x = 618.093444824219,  y = 2759.62939453125,  z = 42.0881042480469 },
    { x = 1190.55017089844,  y = 2713.44189453125,  z = 38.2226257324219 },
    { x = -1193.42956542969, y = -772.262329101563, z = 17.3244285583496 },
    { x = -3172.49682617188, y = 1048.13330078125,  z = 20.8632030487061 },
    { x = -1108.44177246094, y = 2708.92358398438,  z = 19.1078643798828 },
}

function PrintHelpText(message)
    SetTextComponentFormat("STRING")
    AddTextComponentString(message)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

function IsNearShop()
    local shortest = 100000
    for _, shop in pairs(clothingShops) do
        local ply = PlayerPedId()
        local plyCoords = GetEntityCoords(ply, 0)
        local distance = #(vector3(shop.x, shop.y, shop.z) - plyCoords)
        if distance < 11.0 then
            if not clothesMenu:Visible() and not headMenu.SubMenu:Visible() and not bodyMenu.SubMenu:Visible() and not lowerbodyMenu.SubMenu:Visible() and not miscMenu.SubMenu:Visible() and not saveMenu.SubMenu:Visible() then
                PrintHelpText('Press ~INPUT_CONTEXT~ to ~g~shop for clothes')
                return true
            end
        end

        if distance < shortest then
            shortest = distance
        end
    end

    Citizen.Wait(shortest * 30)
    return false
end

Citizen.CreateThread(function()
    while true do
        if IsNearShop() then
            if IsControlJustPressed(1,51) then
                if not IsPedSittingInAnyVehicle(PlayerPedId()) then
                    TriggerServerEvent('mythic_clotheshop:server:PrepareShop')
                else
                  exports['mythic_notify']:SendAlert('error', 'Cannot Access Barber Shop While In A Vehicle')
                end
            end
        end
        Citizen.Wait(0)
    end
end)

function getPropList(prop)
    local list = {}

    list[1]                 = {}
    list[1].Name            = "None"
    list[1].Value           = 0
    list[1].Texture         = 0
    list[1].Max             = 0

    for i = 2, GetNumberOfPedPropDrawableVariations(PlayerPedId(), prop) do
        local cmp               = prop
        list[i]                 = {}
        list[i].Name            = i - 1
        list[i].Value           = i - 1
        list[i].Texture         = 0
        if GetNumberOfPedPropTextureVariations(PlayerPedId(), cmp, i) ~= nil then
            list[i].Max         = GetNumberOfPedPropTextureVariations(PlayerPedId(), cmp, i) - 1
        else
            list[i].Max         = 0
        end
    end
    return list
end

function getMasks(component)
    local list = {}

    list[1]                 = {}
    list[1].Name            = "None"
    list[1].Value           = 0
    list[1].Texture         = 0
    list[1].Max             = 0

    for i = 2, GetNumberOfPedDrawableVariations(PlayerPedId(), component) do
        local cmp               = component
        list[i]                 = {}
        list[i].Name            = i - 1
        list[i].Value           = i - 1
        list[i].Texture         = i - 1
        list[i].Max             = false
        if GetNumberOfPedTextureVariations(PlayerPedId(), cmp, i) - 1 ~= nil or GetNumberOfPedTextureVariations(PlayerPedId(), cmp, i) - 1 > 0 then
            list[i].Max         = GetNumberOfPedTextureVariations(PlayerPedId(), cmp, i) - 1
        end
    end
    return list
end

function getDrawableList(component)
    local list = {}

    for i = 1, GetNumberOfPedDrawableVariations(PlayerPedId(), component) do
        local cmp               = component
        list[i]                 = {}
        list[i].Name            = i
        list[i].Value           = i
        list[i].Texture         = 0
        list[i].Max             = false
        if GetNumberOfPedTextureVariations(PlayerPedId(), cmp, i) - 1 ~= nil or GetNumberOfPedTextureVariations(PlayerPedId(), cmp, i) - 1 > 0 then
            list[i].Max         = GetNumberOfPedTextureVariations(PlayerPedId(), cmp, i) - 1
        end
    end
    return list
end

RegisterNetEvent('mythic_clotheshop:client:ProcessMenus')
AddEventHandler('mythic_clotheshop:client:ProcessMenus', function()
    --[[Citizen]]--
    Citizen.CreateThread(function()
        while clothesMenu:Visible() or headMenu.SubMenu:Visible() or bodyMenu.SubMenu:Visible() or lowerbodyMenu.SubMenu:Visible() or miscMenu.SubMenu:Visible() or saveMenu.SubMenu:Visible() do
            _menuPool:ProcessMenus()
            Citizen.Wait(0)
        end
    end)
end)

RegisterNetEvent('mythic_clotheshop:client:SetOutfitLabel')
AddEventHandler('mythic_clotheshop:client:SetOutfitLabel', function(label)
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = "overwrite",
        label = label,
        outfit = data,
        type = isNewChar,
    })
end)

RegisterNetEvent('mythic_clotheshop:client:LoadShopMenu')
AddEventHandler('mythic_clotheshop:client:LoadShopMenu', function(isNewChar, outfit)
    GenerateMenu(isNewChar, outfit)
    clothesMenu:Visible(not clothesMenu:Visible())
end)

RegisterNUICallback("SaveOutfit",function(nui, cb)
    SetNuiFocus(false, false)
    _menuPool:CloseAllMenus()
    TriggerServerEvent('mythic_clotheshop:server:SaveNewCharOutfit', nui.label, json.encode(nui.outfit))
    cb('ok')
end)

RegisterNUICallback("OverwriteOutfit",function(nui, cb)
    SetNuiFocus(false, false)
    _menuPool:CloseAllMenus()
    TriggerServerEvent('mythic_clotheshop:server:OverwriteCharOutfit', nui.label, json.encode(nui.outfit))
    cb('ok')
end)