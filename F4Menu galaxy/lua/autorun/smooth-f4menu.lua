/*----------------------------------------------------------------------
Leak by Famouse

Play good games:↓
store.steampowered.com/curator/32364216

Subscribe to the channel:↓
https://www.youtube.com/c/Famouse

More leaks in the discord:↓ 
https://discord.gg/rFdQwzm
------------------------------------------------------------------------*/

if CLIENT then
	-- CLIENT MENU
	include("smooth-f4menu/client/cl_smooth-f4menu.lua")
	include("smooth-f4menu/client/cl_smooth-f4menu-commands.lua")
	include("smooth-f4menu/client/cl_smooth-f4menu-jobs.lua")
	include("smooth-f4menu/client/cl_smooth-f4menu-title.lua")
	include("smooth-f4menu/client/cl_smooth-f4menu-shop.lua")
	include("smooth-f4menu/client/cl_smooth-f4menu-site.lua")

	-- CFG
	include("smooth-f4menu/cfg_smooth-f4menu.lua")
end

if SERVER then
	-- SERVER MENU
	include("smooth-f4menu/server/sv_smooth-f4menu.lua")

	-- CLIENT MENU
	AddCSLuaFile("smooth-f4menu/client/cl_smooth-f4menu.lua")
	AddCSLuaFile("smooth-f4menu/client/cl_smooth-f4menu-commands.lua")
	AddCSLuaFile("smooth-f4menu/client/cl_smooth-f4menu-jobs.lua")
	AddCSLuaFile("smooth-f4menu/client/cl_smooth-f4menu-title.lua")
	AddCSLuaFile("smooth-f4menu/client/cl_smooth-f4menu-shop.lua")
	AddCSLuaFile("smooth-f4menu/client/cl_smooth-f4menu-site.lua")

	-- CFG
	include("smooth-f4menu/cfg_smooth-f4menu.lua")
	AddCSLuaFile("smooth-f4menu/cfg_smooth-f4menu.lua")
end

/*------------------------------------------------------------------------
Donation for leaks

Qiwi Wallet         4890494419811120 
YandexMoney         410013095053302
WebMoney(WMR)       R235985364414
WebMoney(WMZ)       Z309855690994
------------------------------------------------------------------------*/