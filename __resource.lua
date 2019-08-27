resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'Mythic Framework Clothes Shop'

version '1.0.0'

ui_page 'html/index.html'

server_scripts {
    'server/server.lua',
}

client_scripts {
    "@NativeUILua-Reloaded/Wrapper/Utility.lua",

    "@NativeUILua-Reloaded/UIElements/UIVisual.lua",
    "@NativeUILua-Reloaded/UIElements/UIResRectangle.lua",
    "@NativeUILua-Reloaded/UIElements/UIResText.lua",
    "@NativeUILua-Reloaded/UIElements/Sprite.lua",
    "@NativeUILua-Reloaded/UIMenu/elements/Badge.lua",
    "@NativeUILua-Reloaded/UIMenu/elements/Colours.lua",
    "@NativeUILua-Reloaded/UIMenu/elements/ColoursPanel.lua",
    "@NativeUILua-Reloaded/UIMenu/elements/StringMeasurer.lua",

    "@NativeUILua-Reloaded/UIMenu/items/UIMenuItem.lua",
    "@NativeUILua-Reloaded/UIMenu/items/UIMenuCheckboxItem.lua",
    "@NativeUILua-Reloaded/UIMenu/items/UIMenuListItem.lua",
    "@NativeUILua-Reloaded/UIMenu/items/UIMenuSliderItem.lua",
    "@NativeUILua-Reloaded/UIMenu/items/UIMenuSliderHeritageItem.lua",
    "@NativeUILua-Reloaded/UIMenu/items/UIMenuColouredItem.lua",

    "@NativeUILua-Reloaded/UIMenu/items/UIMenuProgressItem.lua",
    "@NativeUILua-Reloaded/UIMenu/items/UIMenuSliderProgressItem.lua",

    "@NativeUILua-Reloaded/UIMenu/windows/UIMenuHeritageWindow.lua",

    "@NativeUILua-Reloaded/UIMenu/panels/UIMenuGridPanel.lua",
    "@NativeUILua-Reloaded/UIMenu/panels/UIMenuHorizontalOneLineGridPanel.lua",
    "@NativeUILua-Reloaded/UIMenu/panels/UIMenuVerticalOneLineGridPanel.lua",
    "@NativeUILua-Reloaded/UIMenu/panels/UIMenuColourPanel.lua",
    "@NativeUILua-Reloaded/UIMenu/panels/UIMenuPercentagePanel.lua",
    "@NativeUILua-Reloaded/UIMenu/panels/UIMenuStatisticsPanel.lua",

    "@NativeUILua-Reloaded/UIMenu/UIMenu.lua",
    "@NativeUILua-Reloaded/UIMenu/MenuPool.lua",
    "@NativeUILua-Reloaded/NativeUI.lua",

    'client/client.lua',
    'client/closet.lua',
}

files {
    'html/index.html',
    'html/css/style.css',
    'html/js/app.js',

    'html/css/jquery-ui.min.css',
    'html/css/bootstrap.min.css',
    'html/js/jquery.min.js',
    'html/js/jquery-ui.min.js',
    'html/js/bootstrap.min.js',
    'html/js/popper.min.js',
}

dependencies {
    'mythic_base',
}