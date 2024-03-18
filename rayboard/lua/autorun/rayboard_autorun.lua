-- RayBoard Owner: 76561198111476713
-- RayBoard Version: 3.1.2.5

RayBoard = RayBoard or {}
RayBoard.Cfg = RayBoard.Cfg or {}

local function LoadClient(path)
	if SERVER then
		AddCSLuaFile( path )
	else
		include( path )
	end
end

local function LoadServer(path)
	if SERVER then
		include( path )
		AddCSLuaFile( path )
	end
end

local function LoadShared(path)
	LoadClient(path)
	LoadServer(path)
end




local function Load()
	// RayBoard
	LoadShared("rayboard/shared/sh_setup.lua")

	include( "rb_config.lua" )
	AddCSLuaFile( "rb_config.lua" )

	LoadServer("rayboard/server/sv_misc.lua")

	LoadClient("rayboard/client/cl_main.lua")
	LoadClient("rayboard/client/compatibility/terrortown.lua")
end

hook.Add("RayUIReady", "RayBoard:Load", function()
	Load()
end)

if GAMEMODE then
	Load()
end

hook.Add( "OnScreenSizeChanged", "RayBoard:Reload", function()
	Load()
end)






// A few people have reported to me a problem with addon not loading, this problem only affects a few people, and the fix below for other people causes this problem instead of fixing it.
//Uncomment the script below ONLY if RayBoard is not loading on your server.

//	if CLIENT then
//		hook.Add("ScoreboardShow", "RayBoard:ScoreboardShow", function() print("") end)
//		hook.Add("ScoreboardHide", "RayBoard:ScoreboardHide", function() print("") end)
//	end