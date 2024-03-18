RayUI.Configuration.AddConfig( "RayBoardWidth", {
	Title = "rayboard_width",
	TypeEnum = RAYUI_CONFIG_NUMBER,
	Default = "RayBoard",
	Default = 1200,
	minNum = 400,
	maxNum = 1600,
	SettingsOf = 2,
} )

RayUI.Configuration.AddConfig( "RayBoardHeight", {
	Title = "rayboard_height",
	TypeEnum = RAYUI_CONFIG_NUMBER,
	Default = 724,
	minNum = 400,
	maxNum = 900,
	SettingsOf = 2,
} )

if RayHUD then
	RayUI.Configuration.AddConfig( "HideHUD", {
		Title = "rayboard_hide_hud",
		TypeEnum = RAYUI_CONFIG_BOOL,
		Default = false,
		SettingsOf = 2,
	} )
end

RayUI.Configuration.AddConfig( "RayBoardTitle", {
	Title = "rayboard_title",
	TypeEnum = RAYUI_CONFIG_STRING,
	Default = "RayBoard",
	SettingsOf = 2,
} )

RayUI.Configuration.AddConfig( "RayBoardMode", {
	Title = "rayboard_mode",
	TypeEnum = RAYUI_CONFIG_TABLE,
	Default = "Separate players by team",
	Values = {"All players in the same list", "Separate players by team", "Separate players by alive/dead status", "[DarkRP ONLY!] Separate players by job categories"},
	SettingsOf = 2,
} )

RayUI.Configuration.AddConfig( "RayBoardCanHide", {
	Title = "rayboard_can_hide",
	TypeEnum = RAYUI_CONFIG_STRING,
	Default = "superadmin,admin",
	SettingsOf = 2,
} )

RayUI.Configuration.AddConfig( "RayBoardCanUseIncognito", {
	Title = "rayboard_can_use_incognito",
	TypeEnum = RAYUI_CONFIG_STRING,
	Default = "superadmin,admin",
	SettingsOf = 2,
} )

RayUI.Configuration.AddConfig( "RayBoardCanSeeIncognito", {
	Title = "rayboard_can_see_incognito",
	TypeEnum = RAYUI_CONFIG_STRING,
	Default = "superadmin,admin",
	SettingsOf = 2,
} )

if SERVER then
	RayUI.Configuration.LoadConfig()
	include("raylibs/cl_settings.lua")
end