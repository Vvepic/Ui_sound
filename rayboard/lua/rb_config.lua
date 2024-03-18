if SERVER then return end	-- don't touch this


// This is an advanced RayBoard configuration, you will find the following settings here:

	-- SideBar - Shortcuts in the left sidebar, you can put links to websites or even shortcuts to other addons on your server, just use the appropriate functions.

	-- Custom Columns - You are not limited only to the default columns (nickname, rank, points, deaths, ping), you can also add your own columns with custom information, for example things like: player's gang (mGangs 2), player hours on the server (GTAwards / UTime) etc.

	-- Usergroups Tags - If you have aTags (https://steamcommunity.com/sharedfiles/filedetails/?id=1314177388) or SCB | Chatbox (https://www.gmodstore.com/market/view/6950), you can just use tags from these addons, they will be visible on RayBoard in the rank column. 
		// However, if you don't have any of these addons, you can also use the native RayBoard tag function, at the very end of this file you will find a table where you need to put the ranks and their corresponding colors.
		// SCB Chatbox tags are the most advanced because they are the only ones that support emojis.









///////////////
/// SIDEBAR ///
///////////////

// Enable or disable left sidebar
RayBoard.Cfg.EnableSidebar = true

RayBoard.Cfg.Website = "https://google.com/"					-- link for first default button
RayBoard.Cfg.Discord = "https://www.gmodstore.com/discord"		-- link for second default button
RayBoard.Cfg.SteamGroup = "https://steamcommunity.com"			-- link for third default button

// Here are the buttons that will be visible in the sidebar
RayBoard.Cfg.Buttons = {

//	 EXAMPLE:
//
//	{text = "Example Text" -- this text will be shown next to icon, icon = RayUI.Icons.Internet -- well, just an icon,
//		callback = function()	-- this function determines what happens when the button is pressed
//			gui.OpenURL("https://google.com/")	-- open Google on click
//		end,
//		display = function()	-- this function determines when the button is to be displayed
//			return DarkRP	-- this column will be visible only when your active gamemode is DarkRP
//		end,
//	},

	{text = "Website", icon = RayUI.Icons.Internet,
		callback = function()
			gui.OpenURL(RayBoard.Cfg.Website)
		end,
		display = function()
			return RayBoard.Cfg.Website and RayBoard.Cfg.Website != ""
		end,
	},

	{text = "Discord", icon = RayUI.Icons.Discord,
		callback = function()
			gui.OpenURL(RayBoard.Cfg.Discord)
		end,
		display = function()
			return RayBoard.Cfg.Discord and RayBoard.Cfg.Discord != ""
		end,
	},

	{text = "Steam Group", icon = RayUI.Icons.Steam,
		callback = function()
			gui.OpenURL(RayBoard.Cfg.SteamGroup)
		end,
		display = function()
			return RayBoard.Cfg.SteamGroup and RayBoard.Cfg.SteamGroup != ""
		end,
	},

	{text = "UI Settings", icon = RayUI.Icons.Cog, dock = BOTTOM,
		callback = function()
			RunConsoleCommand("rayui")
		end,
	},
}









//////////////////////
/// ADMIN COMMANDS ///
//////////////////////

// Usergroups that have access to admin commands on RayBoard
RayBoard.Cfg.AdminPanel = {"superadmin", "admin"}

// These are the buttons that you will see after clicking on the player's line, don't touch it if you don't know what you are doing, but if you understand the script, you can add custom commands here
RayBoard.Cfg.AdminMenu = {
	{title = "Ban",	command = function()  RayBoard:OpenBanWindow( target:Nick() ) end, icon = RayUI.Icons.BanUser, color = Color(255, 40, 40), admin = true},
	{title = "Kick", command = function()  RayBoard:OpenKickWindow( target:Nick() ) end, icon = RayUI.Icons.Close, color = Color(255, 120, 0), admin = true},

	{title = "Spectate", command = function() RunConsoleCommand(RayUI:GetAdminMod(), "spectate", target:Nick()) end, icon = RayUI.Icons.Eye, color = Color(0, 255, 120), admin = true},

	{title = "GoTo", command = function() RunConsoleCommand(RayUI:GetAdminMod(), "goto", target:Nick()) end, icon = RayUI.Icons.GoTo, color = Color(114, 0, 255), admin = true},
	{title = "Bring", command = function() RunConsoleCommand(RayUI:GetAdminMod(), "bring", target:Nick()) end, icon = RayUI.Icons.Bring, color = Color(0, 198, 255), admin = true},

	{title = "Slay", command = function() RunConsoleCommand(RayUI:GetAdminMod(), "slay", target:Nick()) end, icon = RayUI.Icons.Slay, color = Color(255, 0, 0), admin = true},

	{title = "Show Profile", command = function() target:ShowProfile() end, icon = RayUI.Icons.User, color = Color(0, 162, 255)},
}









///////////////////////
/// CUSTOM COLUMNS	///
///////////////////////

// Additional columns for custom informations
RayBoard.Cfg.PlayerColumns = {

	// DarkRP Jobs example:

	{text = "Job", -- What's the name of the column? (leave blank if there is no column name under the value)
		width = 140,	--
		func = function(ply)	-- A function that determines the contents of a column

			local custom_job = true -- Set this to true to show the custom job
			local job_color = true -- Set this to true to show the team color

			local n = team.GetName(ply:Team())
			if (custom_job and ply.getDarkRPVar) then
				n = ply:getDarkRPVar("job") or n
			end

			if (job_color) then
				return n, team.GetColor(ply:Team())
			else
				return n
			end
		end,

		candisplay = function()	-- A function that determines when a column should be visible
			return DarkRP	-- "return DarkRP" means, that this column will be visible only when your active gamemode is DarkRP
		end
	},



	// mGangs 2 Column:

--	{text = "Gang", width = 140,
--		func = function(ply)
--			local gangTable = (BRICKS_SERVER_GANGS or {})[ply:GetGangID()]
--			return gangTable and gangTable.Name or "None"
--		end,
--
--		candisplay = function()
--			return BRICKS_SERVER_GANGS
--		end
--	},



	// UTime Column (Total Time):

--	{text = "Total Time", width = 160,
--		func = function(ply)
--			local function timeToStr( time )
--				local tmp = time
--				local s = tmp % 60
--				tmp = math.floor( tmp / 60 )
--				local m = tmp % 60
--				tmp = math.floor( tmp / 60 )
--				local h = tmp % 24
--				tmp = math.floor( tmp / 24 )
--				local d = tmp % 7
--				local w = math.floor( tmp / 7 )
--
--				return string.format( "%02iw %id %02ih %02im", w, d, h, m )
--			end
--
--			return timeToStr(ply:GetUTime() + CurTime() - ply:GetUTimeStart())
--		end,
--	},



	// UTime Column (Current Session):

--	{text = "Session", width = 160,
--		func = function(ply)
--			local function timeToStr( time )
--				local tmp = time
--				local s = tmp % 60
--				tmp = math.floor( tmp / 60 )
--				local m = tmp % 60
--				tmp = math.floor( tmp / 60 )
--				local h = tmp % 24
--				tmp = math.floor( tmp / 24 )
--				local d = tmp % 7
--				local w = math.floor( tmp / 7 )
--
--				return string.format( "%02ih %02im", h, m )
--			end
--
--			return timeToStr(CurTime() - ply:GetUTimeStart())
--		end,
--	},
}









///////////////////////
/// USERGROUPS TAGS ///
///////////////////////

// Avaliable Tag Handlers:
-- "scb" - if you are using tags from this scoreboard: https://www.gmodstore.com/market/view/6950
-- "atags" - if you are using this addon: https://steamcommunity.com/sharedfiles/filedetails/?id=1314177388
-- true - enable native RayBoard tags,
-- false - completely disable tags column,
RayBoard.Cfg.TagsHandler = true

// Should the player's nickname be in the color of his usergroup?
RayBoard.Cfg.ColorForNickname = true

// Only in you are using native tags:
RayBoard.Cfg.UsergroupsStyle = {
	["superadmin"] = {"Owner", Color(0, 180, 255)},
	["admin"] = {"Admin", Color(255, 0, 0)},
}