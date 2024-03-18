-- RayBoard Owner: 76561198111476713
-- RayBoard Version: 3.1.2.5

CreateClientConVar( "rayboard_enable", "1", true, false )
CreateClientConVar("rayboard_mouse", "1", true, false)

RayBoard.AnimSpeed = 0.12

local FakeID = FakeID or {}

local CanHide
local CanUseIncognito
local CanSeeIncognito
local CanHideAccess
local CanUseIncognitoAccess
local CanSeeIncognitoAccess

local charset = {}
for i = 48,  57 do table.insert(charset, string.char(i)) end
for i = 65,  90 do table.insert(charset, string.char(i)) end
for i = 97, 122 do table.insert(charset, string.char(i)) end

function string.random(length)
	math.randomseed(os.clock()^5)

	if length > 0 then
		return string.random(length - 1) .. charset[math.random(1, #charset)]
	else
		return ""
	end
end

local function DownloadImage(url, ply)
	local type

	if string.sub(url, #url - 2) == "jpg" or string.sub(url, #url - 2) == "png" then
		type = string.sub(url, #url - 2)
	else
		if ply == LocalPlayer() then
			chat.AddText( Color(108, 37, 252), "[RayBoard]" , Color(255, 255, 255), "This URL is not an image!" )
		end

		return
	end

	if !file.IsDir( "rayboard/avatars", "DATA" ) then
		file.CreateDir( "rayboard/avatars" )
	end

	local id = string.random(10)

	http.Fetch(url, function(body)
		local str = "rayboard/avatars/" .. id .. "." .. type
		file.Write(str, body)

		ply.FakeAvatar = Material("../data/" .. str, "smooth")	
		file.Delete( str )
	end)
end

net.Receive( "RayBoard:FakeIdentityToClient", function( len, ply )
	local FakeTable = net.ReadTable()
	local FakePlayer = net.ReadEntity()

	if !FakeTable or !FakePlayer then return end

	table.Merge( FakeID, FakeTable )

	if !FakeID[FakePlayer] then return end


	if FakeID[FakePlayer][3] and FakeID[FakePlayer][3] != "" then
		DownloadImage(FakeID[FakePlayer][3], FakePlayer)
	end
end )

net.Receive( "RayBoard:RemoveFakeIdentityToClient", function( len, ply )
	local UserToRemove = net.ReadEntity()

	FakeID[UserToRemove] = nil
	UserToRemove.FakeAvatar = nil
end )

net.Receive( "RayBoard.HideID:Client", function( len, ply )
    local UserToHide = net.ReadEntity()
    local Hide = net.ReadBool()

	UserToHide:SetNWBool("RayBoard:HideID", Hide)
end )

function RayBoard:GetUserGroup(ply)
	if FakeID and FakeID[ply] and FakeID[ply][2] and FakeID[ply][2] != "" then
		return FakeID[ply][2]
	else
		return ply:GetUserGroup()
	end
end

function RayBoard:GetNick(ply)
	if (FakeID and FakeID[ply] and FakeID[ply][1] and FakeID[ply][1] != "") or (FakeID and FakeID[ply] and FakeID[ply][2] and FakeID[ply][2] != "") then
		return FakeID[ply][1] == "" and ply:Nick() .. " (Fake)" or table.HasValue(CanSeeIncognitoAccess, LocalPlayer():GetUserGroup()) and FakeID[ply][1] .. " (Fake)"  or FakeID[ply][1]
	else
		return ply:Nick()
	end
end

RayBoard.DefaultColumns = {
	{text = "Nick", func = function(ply)
		return ply:Nick()
	end,
	candisplay = function()
		return false
	end
	},
	{text = RayUI.GetPhrase("rayboard", "deaths"), func = function(ply)
		return ply:Deaths()
	end},
	{text = RayUI.GetPhrase("rayboard", "score"), func = function(ply)
		return ply:Frags()
	end},
	{text = RayUI.GetPhrase("rayboard", "karma"),
		func = function(ply)
			local KarmaCol = Color(90, 255, 90)
			if math.Round(ply:GetBaseKarma()) > 999 then
				KarmaCol = Color(90, 255, 90)
			elseif	math.Round(ply:GetBaseKarma()) > 799 then
				KarmaCol = Color(255, 120, 0)
			elseif	math.Round(ply:GetBaseKarma()) < 800 then
				KarmaCol = Color(255, 90, 90)
			end
			return math.Round(ply:GetBaseKarma()), KarmaCol
		end,
		candisplay = function()
			return KARMA and KARMA.IsEnabled()
		end
	},
	{text = "", width = 220, func = "scb_custom", candisplay = function() return scb and RayBoard.Cfg.TagsHandler == "scb" end},
	{text = "", width = 200,
		func = function(ply)
			local text, col
			text, col = ply:getScoreboardTag()

			return text or "", col or color_white
		end,
		candisplay = function()
			return ATAG and RayBoard.Cfg.TagsHandler == "atags"
		end
	},
	{text = "", width = 200,
		func = function(ply)
			local text, col			
			if RayBoard.Cfg.UsergroupsStyle[RayBoard:GetUserGroup(ply)] then
				text, col = RayBoard.Cfg.UsergroupsStyle[RayBoard:GetUserGroup(ply)][1], RayBoard.Cfg.UsergroupsStyle[RayBoard:GetUserGroup(ply)][2]
			else
				text, col = RayBoard:GetUserGroup(ply), color_white
			end
			return text, col
		end,
		candisplay = function()
			return RayBoard.Cfg.TagsHandler == true
		end
	},

	{text = "", width = 300, dock = LEFT,
		func = function(ply)
			local txt = ""
			local color = color_white
			if ply.sb_tag and ply.sb_tag.txt != nil and ScoreGroup(ply) == GROUP_TERROR then
				txt = LANG.GetTranslation(ply.sb_tag.txt)
				color = ply.sb_tag.color
			end
			return txt, color
		end,
		candisplay = function()
			return engine.ActiveGamemode() == "terrortown"
		end
	}
}
table.Add( RayBoard.DefaultColumns, RayBoard.Cfg.PlayerColumns )

local function TimeLeft()
	local time_left = math.floor(math.max(0, ((GetGlobalInt("ttt_time_limit_minutes") or 60) * 60) - CurTime()))

	local h = math.floor(time_left / 3600)
	time_left = time_left - math.floor(h * 3600)
		m = math.floor(time_left / 60)
	time_left = time_left - math.floor(m * 60)
	local s = math.floor(time_left)

	return string.format("%02i:%02i:%02i", h, m, s)
end

function RayBoard:OpenKickWindow( target )
	local KickWindow = vgui.Create("RayUI:MainPanel")
	KickWindow:SetSize(300 * RayUI.Scale, 170 * RayUI.Scale)
	KickWindow:SetTitle( "Kick " .. target .. "...")
	KickWindow:Center()
	KickWindow:MakePopup()

	local ReasonText = RayUI:MakeLabel("Reason:", "RayUI:Large2", Color(255, 255, 255), KickWindow)
	ReasonText:Dock(TOP)
	ReasonText:DockMargin(10 * RayUI.Scale, 6 * RayUI.Scale, 0, 0)

	local Reason = vgui.Create("DTextEntry", KickWindow)
	Reason:Dock(TOP)
	Reason:DockMargin(10 * RayUI.Scale, 6 * RayUI.Scale, 10 * RayUI.Scale, 0)
	Reason:SetTall(30 * RayUI.Scale)
	Reason:SetFont("RayUI:Large")
	Reason.OnEnter = function()
		RunConsoleCommand(RayUI:GetAdminMod(), "kick", target, Reason:GetValue())
		KickWindow:GetParent():Remove()
	end
	Reason.Paint = function(self, w, h)
		draw.RoundedBox(4, 0, 0, w, h, Color(80, 80, 80))
		self:DrawTextEntryText(Color(255, 255, 255), Color(60, 60, 60), Color(255, 255, 255))
	end

	local KickButton = vgui.Create("DButton", KickWindow)
	KickButton:Dock(TOP)
	KickButton:DockMargin(10 * RayUI.Scale, 12 * RayUI.Scale, 10 * RayUI.Scale, 0)
	KickButton:SetTall(34 * RayUI.Scale)
	KickButton.DoClick = function()
		RunConsoleCommand(RayUI:GetAdminMod(), "kick", target, Reason:GetValue())
		KickWindow:Close()
	end
	KickButton:FormatRayButton( "Kick!", RayUI.Colors.DarkGray3, RayUI.Colors.HP )
	KickButton:SetFont("RayUI:Large2")
end

function RayBoard:OpenBanWindow( target )
	local BanWindow = vgui.Create("RayUI:MainPanel")
	BanWindow:SetSize(340 * RayUI.Scale, 290 * RayUI.Scale)
	BanWindow:SetTitle( "Ban " .. target .. "...")
	BanWindow:Center()
	BanWindow:MakePopup()

	local ReasonText = RayUI:MakeLabel("Reason:", "RayUI:Large2", Color(255, 255, 255), BanWindow)
	ReasonText:Dock(TOP)
	ReasonText:DockMargin(10 * RayUI.Scale, 6 * RayUI.Scale, 0, 0)

	local Reason = vgui.Create("DTextEntry", BanWindow)
	Reason:Dock(TOP)
	Reason:DockMargin(10 * RayUI.Scale, 6 * RayUI.Scale, 10 * RayUI.Scale, 0)
	Reason:SetTall(30 * RayUI.Scale)
	Reason:SetFont("RayUI:Large")
	Reason.OnEnter = function()
		local time = TimeBox:GetValue()
		if time != 0 then
			if int == "hour(s)" then
				time = time .. "h"
			elseif int == "day(s)" then
				time = time .. "d"
			elseif int == "week(s)" then
				time = time .. "w"
			elseif int == "year(s)" then
				time = time .. "y"
			end
		end
		RunConsoleCommand(RayUI:GetAdminMod(), "ban", target, time, Reason:GetValue())
		BanWindow:Remove()
	end
	Reason.Paint = function(self, w, h)
		draw.RoundedBox(4, 0, 0, w, h, Color(80, 80, 80))
		self:DrawTextEntryText(Color(255, 255, 255), Color(60, 60, 60), Color(255, 255, 255))
	end

	local TimeText = RayUI:MakeLabel("Time:", "RayUI:Large2", Color(255, 255, 255), BanWindow)
	TimeText:Dock(TOP)
	TimeText:DockMargin(10 * RayUI.Scale, 6 * RayUI.Scale, 0, 0)

	local TimeBox = vgui.Create("DTextEntry", BanWindow)
	TimeBox:Dock(TOP)
	TimeBox:DockMargin(10, 6 * RayUI.Scale, 10, 6 * RayUI.Scale)
	TimeBox:SetTall(30 * RayUI.Scale)
	TimeBox:SetFont("RayUI:Large")
	TimeBox.OnEnter = function() end
	TimeBox:SetNumeric(true)
	TimeBox.Paint = function(self, w, h)
		draw.RoundedBox(4, 0, 0, w, h, Color(80, 80, 80))
		self:DrawTextEntryText(Color(255, 255, 255), Color(60, 60, 60), Color(255, 255, 255))
	end

	local int = "minute(s)"
	local TimeDropdown = RayUI:MakeComboBox(BanWindow, "Time type:")
	TimeDropdown:AddChoice("minute(s)")
	TimeDropdown:AddChoice("hour(s)")
	TimeDropdown:AddChoice("day(s)")
	TimeDropdown:AddChoice("week(s)")
	TimeDropdown:AddChoice("year(s)")
	TimeDropdown.DoClick = function(self, w, h)
		if ( self:IsMenuOpen() ) then
			return self:CloseMenu()
		end
		self:OpenMenu()

		if !self.Menu then return end
		for k, v in pairs( self.Menu:GetCanvas():GetChildren() ) do
			v:SetTextColor(color_white)
			v:SetFont("RayUI:Small")
			v.Paint = function(self, w, h)
				draw.RoundedBox( 0, 0, 0, w, h, Color(75, 75, 75) )

				if v:IsHovered() then
					draw.RoundedBox( 0, 0, 0, w, h, Color(255, 255, 255, 10) )
				end
			end
		end
	end
	TimeDropdown.OnSelect = function(ind, value, data)
		int = data
	end

	local BanButton = vgui.Create("DButton", BanWindow)
	BanButton:Dock(TOP)
	BanButton:DockMargin(10 * RayUI.Scale, 6 * RayUI.Scale, 10 * RayUI.Scale, 0)
	BanButton:SetTall(34 * RayUI.Scale)
	BanButton.DoClick = function()
		RunConsoleCommand(RayUI:GetAdminMod(), "ban", target, time, Reason:GetValue())
		BanWindow:Remove()
	end
	BanButton:FormatRayButton( "Ban!", RayUI.Colors.DarkGray3, RayUI.Colors.HP )
	BanButton:SetFont("RayUI:Large2")
end

function RayBoard:Show()
	local ply = LocalPlayer()
	local width = RayUI.Configuration.GetConfig( "RayBoardWidth" ) * RayUI.Scale
	local height = RayUI.Configuration.GetConfig( "RayBoardHeight" ) * RayUI.Scale

	// Incognito Mode things //
	CanHide = RayUI.Configuration.GetConfig( "RayBoardCanHide" )
	if string.Right(CanHide, 1) == "," then
		CanHide = string.Left(CanHide, #CanHide - 1)
	end
	CanHideAccess = string.Explode(",", CanHide)

	CanUseIncognito = RayUI.Configuration.GetConfig( "RayBoardCanUseIncognito" )
	if string.Right(CanUseIncognito, 1) == "," then
		CanUseIncognito = string.Left(CanUseIncognito, #CanUseIncognito - 1)
	end
	CanUseIncognitoAccess = string.Explode(",", CanUseIncognito)

	CanSeeIncognito = RayUI.Configuration.GetConfig( "RayBoardCanSeeIncognito" )
	if string.Right(CanSeeIncognito, 1) == "," then
		CanSeeIncognito = string.Left(CanSeeIncognito, #CanSeeIncognito - 1)
	end
	CanSeeIncognitoAccess = string.Explode(",", CanSeeIncognito)
	// Incognito Mode things //

	local th = 50 * RayUI.Scale
	local Margin = 12 * RayUI.Scale
	local Margin2 = Margin * 0.5

	local MainFrame = vgui.Create("EditablePanel")
	MainFrame:SetSize(width, height)
	MainFrame:SetPos((ScrW() - width) / 2, (ScrH() - height) / 2 - 50)
	MainFrame:MakePopup()
	MainFrame.Paint = function() end
	MainFrame.Close = function(self)
		if (IsValid(_RayBoard_MENU)) then _RayBoard_MENU:Remove() end
	
		self:Hide()
	end
	MainFrame.Open = function(self)
		self:Show()
		self:MakePopup()
		self:KillFocus()
		if !GetConVar( "rayboard_mouse" ):GetBool() then self:SetMouseInputEnabled(false) end
	end

	_RayBoard = MainFrame
	-- 76561198111476720
	local header = vgui.Create("DPanel", MainFrame)
	header:SetTall(th)
	header:Dock(TOP)
	header.Paint = function(self, w, h)
		draw.RoundedBoxEx(RayUI.Rounding, 0, 0, w, h, RayUI:GetPlayerCol(), true, true, false, false)
	end

	header.NextUpdate = CurTime() + 3
	header.Think = function(self)
		if (CurTime() >= self.NextUpdate) then
			self:Update()
			self.NextUpdate = CurTime() + 3
		end
	end
	header.Update = function(self)
		header.Paint = function(self, w, h)
			draw.RoundedBoxEx(RayUI.Rounding, 0, 0, w, h, RayUI:GetPlayerCol(), true, true, false, false)
		end
	end

	local LeftPanelBut = vgui.Create("DButton", header)
	LeftPanelBut:SetText("")
	LeftPanelBut:SetWide(th + 4)
	LeftPanelBut:Dock(LEFT)
	LeftPanelBut.Paint = function(self, w, h)
		surface.SetMaterial( RayUI.Icons.Menu )
		surface.SetDrawColor( color_white )
		surface.DrawTexturedRect(8 * RayUI.Scale, 5 * RayUI.Scale, 42 * RayUI.Scale, 42 * RayUI.Scale)
	end
	LeftPanelBut.DoClick = function(self)
		RayUI:ShowSettings()
	end

	local titlelbl = RayUI:MakeLabel(RayUI.Configuration.GetConfig( "RayBoardTitle" ) != "" and RayUI.Configuration.GetConfig( "RayBoardTitle" ) or GetHostName(), "RayUI:Largest", Color(255, 255, 255), header)
	titlelbl:Dock(LEFT)
	titlelbl:DockMargin(4, 0, 0, 0)

	local PlyCount = 0

	for k,v in pairs(player.GetAll()) do
		if !v:GetNWBool("RayBoard:HideID") then
			PlyCount = PlyCount + 1
		end
	end

	local PlyNum = vgui.Create("DPanel", header)
	PlyNum:Dock(RIGHT)
	PlyNum:SetText("")
	PlyNum:DockMargin(0, 0, 0, 0)
	PlyNum:DockPadding(0, 0, 10, 0)
	PlyNum.Paint = function(self, w, h)
		draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 0) )

		surface.SetDrawColor(PlyCount >= game.MaxPlayers() and Color(239, 83, 80) or Color(255, 255, 255))
		surface.SetMaterial(RayUI.Icons.User)
		surface.DrawTexturedRect(0, 4 * RayUI.Scale, 42 * RayUI.Scale, 42 * RayUI.Scale)
	end

	local PlyCountText = RayUI:MakeLabel(PlyCount .. "/" .. game.MaxPlayers(), "RayUI:Largest", Color(255, 255, 255), PlyNum)
	PlyCountText:Dock(RIGHT)
	PlyCountText:SizeToContents()
	PlyCountText.Think = function(self)
		if !IsValid(_RayBoard) or !_RayBoard:IsVisible() then return end

		PlyCountText:SetText(PlyCount .. "/" .. game.MaxPlayers())
		PlyCountText:SetTextColor(PlyCount >= game.MaxPlayers() and Color(240, 84, 80) or Color(255, 255, 255))
		PlyCountText:SetWide(select(1, PlyCountText:GetTextSize()))
		
		PlyNum:SetWide(50 * RayUI.Scale + PlyCountText:GetTextSize() + Margin2)
	end

	local SortButton = vgui.Create("DButton", header)
	SortButton:Dock(RIGHT)
	SortButton:SetText("")
	SortButton:DockMargin(0, 0, 0, 0)
	SortButton:DockPadding(0, 0, 10, 0)
	SortButton:FormatRayButton( "", Color(0, 0, 0, 0), Color(RayUI:GetPlayerCol().r - 30, RayUI:GetPlayerCol().g - 30, RayUI:GetPlayerCol().b - 30) )
	SortButton.OldPaint = SortButton.Paint
	SortButton.Paint = function(self, w, h)
		SortButton.OldPaint(self, w, h)

		surface.SetDrawColor(Color(255, 255, 255))
		surface.SetMaterial(RayUI.Icons.Transfer)
		surface.DrawTexturedRect(4 * RayUI.Scale, 4 * RayUI.Scale, 42 * RayUI.Scale, 42 * RayUI.Scale)
	end
	

	local SortLabel = RayUI:MakeLabel(RayUI.GetPhrase("rayboard", "sort"), "RayUI:Largest", Color(255, 255, 255), SortButton)
	SortLabel:Dock(RIGHT)
	SortLabel:SizeToContents()

	SortButton:SetWide(58 * RayUI.Scale + SortLabel:GetTextSize() + Margin2)

	local Incognito = vgui.Create("DButton", header)
	Incognito:Dock(RIGHT)
	Incognito:SetText("")
	Incognito:DockMargin(0, 0, 0, 0)
	Incognito:DockPadding(0, 0, 10 * RayUI.Scale, 0)
	Incognito:FormatRayButton( "", Color(0, 0, 0, 0),  Color(RayUI:GetPlayerCol().r - 30, RayUI:GetPlayerCol().g - 30, RayUI:GetPlayerCol().b - 30) )
	Incognito.OldPaint = Incognito.Paint
	Incognito.Paint = function(self, w, h)
		Incognito.OldPaint(self, w, h)

		surface.SetDrawColor(Color(255, 255, 255))
		surface.SetMaterial(RayUI.Icons.Gesture)
		surface.DrawTexturedRect(0 * RayUI.Scale, 4 * RayUI.Scale, 42 * RayUI.Scale, 42 * RayUI.Scale)
	end

	local IncognitoLabel = RayUI:MakeLabel(RayUI.GetPhrase("rayboard", "incognito_mode"), "RayUI:Largest", Color(255, 255, 255), Incognito)
	IncognitoLabel:Dock(RIGHT)
	IncognitoLabel:SizeToContents()

	Incognito:SetWide(52 * RayUI.Scale + IncognitoLabel:GetTextSize() + Margin2)

	if !(table.HasValue(CanHideAccess, LocalPlayer():GetUserGroup()) or table.HasValue(CanUseIncognitoAccess, LocalPlayer():GetUserGroup())) then
		Incognito:SetWide(0)
	end

	if engine.ActiveGamemode() == "terrortown" then
		local Rounds = vgui.Create("DPanel", header)
		Rounds:Dock(RIGHT)
		Rounds:DockMargin(0, 0, 10, 0)
		Rounds.Paint = function(self, w, h)
			surface.SetDrawColor(color_white)
			surface.SetMaterial(RayUI.Icons.Map)
			surface.DrawTexturedRect(0, 4 * RayUI.Scale, 42 * RayUI.Scale, 42 * RayUI.Scale)
		end

		local RoundsText = RayUI:MakeLabel("0", "RayUI:Largest", Color(255, 255, 255), Rounds)
		RoundsText:Dock(RIGHT)
		RoundsText.Update = function(self)
			self:SetText(math.max(0, GetGlobalInt("ttt_rounds_left", 6)))

			self:SetTextColor(color_white)
			self:SizeToContents()

			Rounds:SetWide(42 * RayUI.Scale + RoundsText:GetWide() + Margin2)
		end
		RoundsText:Update()
		hook.Add( "TTTEndRound", "SetRoundsText", function()
			if IsValid(_RayBoard) then
				RoundsText:Update()
			end
		end)

		local Timer = vgui.Create("DPanel", header)
		Timer:Dock(RIGHT)
		Timer:DockMargin(0, 0, 10, 0)
		Timer.Paint = function(self, w, h)
			surface.SetDrawColor(color_white)
			surface.SetMaterial(RayUI.Icons.Clock)
			surface.DrawTexturedRect(0, 4 * RayUI.Scale, 42 * RayUI.Scale, 42 * RayUI.Scale)
		end

		local TimerText = RayUI:MakeLabel("0", "RayUI:Largest", Color(255, 255, 255), Timer)	
		TimerText:Dock(RIGHT)
		TimerText:SetText(TimeLeft())
		TimerText:SetTextColor(color_white)
		TimerText:SizeToContents()
		TimerText:SetSize(86 * RayUI.Scale, 40 * RayUI.Scale)
		Timer:SetWide(42 * RayUI.Scale + TimerText:GetWide() + Margin2)

		TimerText.Update = function(self)
			self:SetText(TimeLeft())
		end

		TimerText.NextUpdate = CurTime() + 1
		TimerText.Think = function(self)
			if (CurTime() >= self.NextUpdate) then
				self:Update()
				self.NextUpdate = CurTime() + 1
			end
		end
	end

	local closed_panel = cookie.GetNumber("RayBoard:Closed", 1) == 1
	local th_left = th + 4
	local th_left_open = 140 * RayUI.Scale

	if RayBoard.Cfg.EnableSidebar then
		local LeftPanel = vgui.Create("DPanel", MainFrame)
		LeftPanel:SetWide(closed_panel and th_left or th_left_open)
		LeftPanel:Dock(LEFT)
		LeftPanel:DockMargin(0, 0, 0, 0)
		LeftPanel:DockPadding(0, 0, 0, 0)
		LeftPanel.Paint = function(self, w, h)
			draw.RoundedBoxEx(RayUI.Rounding, 0, 0, w, h, RayUI.Colors.DarkGray6, false, false, true, false)
		end

		LeftPanelBut.DoClick = function(self)
			closed_panel = !closed_panel
			cookie.Set("RayBoard:Closed", closed_panel and 1 or 0)

			LeftPanel:Stop()
			LeftPanel:SizeTo(closed_panel and th_left or th_left_open, LeftPanel:GetTall(), RayBoard.AnimSpeed)
		end

		for _, page in ipairs (RayBoard.Cfg.Buttons) do
			if (page.display and !page.display()) then continue end

			local Button = vgui.Create("DButton", LeftPanel)
			Button:SetTall(th_left)
			Button:Dock(page.dock or TOP)
			Button:DockMargin(0, 5, 0, 0)
			Button:FormatRayButton( "", RayUI.Colors.DarkGray6, Color(80, 80, 80) )
			local ButOldPaint = Button.Paint
			Button.Paint = function(self, w, h)
				ButOldPaint( self, w, h )

				surface.SetDrawColor( color_white )
				surface.SetMaterial(page.icon)
				surface.DrawTexturedRect(9 * RayUI.Scale, 9 * RayUI.Scale, 36 * RayUI.Scale, 34 * RayUI.Scale)
			end
			Button.DoClick = function(self)
				page.callback()
			end

			local lbl = RayUI:MakeLabel(page.text, "RayUI:Small", Color(255, 255, 255), Button)
			lbl:Dock(LEFT)
			lbl:DockMargin(th_left, 0, 0, 0)
		end
	end

	local Content = vgui.Create("DScrollPanel", MainFrame)
	Content:Dock(FILL)
	Content:GetCanvas():DockPadding(Margin2, Margin2, Margin2, 13)
	Content.Paint = function(self, w, h)
		if RayUI.Blur then RayUI:DrawBlur(self) end
		draw.RoundedBoxEx(RayUI.Rounding, 0, 0, w, h, Color(66, 66, 66, RayUI.Opacity), false, false, false, true)
	end
	Content:CustomScrollBar()

	local sorting = cookie.GetString("RayBoard:Sorting")
	-- 76561198111476720
	local function Sorting(a, b)
		if sorting then
			sorting = cookie.GetString("RayBoard:Sorting")

			for _, col in pairs(RayBoard.DefaultColumns) do
				if (col.candisplay and col.candisplay() or !col.candisplay) then
					if sorting == col.text then
						return col.func(a) < col.func(b)
					elseif sorting == col.text .. "_asc" then
						return col.func(a) > col.func(b)
					end
				end
			end
		else
			return a:Frags() > b:Frags()
		end
	end

	local function AddGroup(text, func, color, tags, sorting)
		local label = vgui.Create("DButton", Content)
		local GroupPanel = vgui.Create("DScrollPanel", Content)
		local ClosedGroup = cookie.GetNumber("RayBoard:Group_" .. text, 0) == 1
		local tall = math.Round( 36 * RayUI.Scale + Margin )

		local players = {}
		for _, v in ipairs (player.GetAll()) do
			if (func and !func(v)) or !table.HasValue(CanSeeIncognitoAccess, LocalPlayer():GetUserGroup()) and v:GetNWBool("RayBoard:HideID") then continue end
			table.insert(players, v)
		end

		table.sort( players, function(a, b)
			return Sorting(a, b)
		end)

		for _, v in ipairs (players) do
			if !v:IsValid() then continue end

			local MainLine = vgui.Create("DPanel", GroupPanel)
			MainLine:SetText("")
			MainLine:SetTall(tall)
			MainLine:Dock(TOP)
			MainLine:DockMargin(10, 4, 10, 4)
			MainLine.Paint = function(self, w, h)
				if !RayUI.Blur then
					draw.RoundedBox(RayUI.Rounding, 0, 0, w, h, RayUI.Colors.DarkGray6)
				end
			end

			local line = vgui.Create("DButton", MainLine)
			line:SetText("")
			line:SetTall(tall)
			line:Dock(TOP)
			line:DockPadding(Margin2, Margin2, Margin2, Margin2)
			line.Paint = function(self, w, h)
				if (v != nil and !IsValid(v)) then
					self:Close()

					GroupPanel:GetCanvas():InvalidateLayout(true)
					GroupPanel:SetTall(GroupPanel:GetCanvas():GetTall())
				end

				local LineCol = Color(54, 54, 54, RayUI.Opacity)

				if engine.ActiveGamemode() == "terrortown" then
					if v:IsDetective() then
						LineCol = Color(25, 118, 200, 150)
					elseif v:IsTraitor() then
						LineCol = Color(200, 40, 40, 80)
					end
				end

				draw.RoundedBox(RayUI.Rounding, 0, 0, w, h, LineCol)
		--		if self.Hovered then draw.RoundedBox(RayUI.Rounding, 0, 0, w, h, Color(255, 255, 255, 5)) end
			end

			line.Close = function(self)
				MainLine:AlphaTo(0, RayBoard.AnimSpeed, 0, function()
					MainLine:SizeTo(-1, 0, RayBoard.AnimSpeed, nil, nil, function()
						MainLine:InvalidateParent(true)
						MainLine:Remove()
					end)
				end)
			end

			local white = RayUI.Colors.White2
			local white2 = Color(255, 255, 255)

			local red = Color(255, 40, 40)

			local red2 = Color(255, 100, 100)

 			local MuteColor = color_white
 			local MuteIcon = RayUI.Icons.Sound

			 
 			local Mute = vgui.Create("DButton", line)
 			Mute:SetWide(32 * RayUI.Scale)
 			Mute:SetText("")
 			Mute:Dock(RIGHT)
 			Mute:DockMargin(6, 0, 6, 0)
 			Mute:SetWide(38 * RayUI.Scale)

 			Mute.Paint = function(self, w, h)
			 	surface.SetDrawColor( MuteColor )
 				surface.SetMaterial(MuteIcon)
 				surface.DrawTexturedRect(0, 3 * RayUI.Scale, 32 * RayUI.Scale, 32 * RayUI.Scale)

				if v:IsValid() then
					if v:IsMuted() then
						if self.Hovered then
							MuteColor = red2

							draw.RoundedBox( 4, 0, h - (h / 100) * math.ceil( v:GetVoiceVolumeScale() * 100 ), w, h, Color( 120, 120, 120, 100 ) )
						else
							MuteColor = red
						end

						MuteIcon = RayUI.Icons.Mute
					else
						if self.Hovered then
							MuteColor = white2

							draw.RoundedBox( 4, 0, h - (h / 100) * math.ceil( v:GetVoiceVolumeScale() * 100 ), w, h, Color( 120, 120, 120, 100 ) )
						else
							MuteColor = white
						end

						MuteIcon = RayUI.Icons.Sound
					end
				end
 			end

 			Mute.DoClick = function(self, w, h)
 				if v == LocalPlayer() then return end
 				if v:IsMuted() then
 					v:SetMuted( false )
 				else
 					v:SetMuted( true )
 				end
 			end

			Mute.OnMouseWheeled = function( s, delta )
				v:SetVoiceVolumeScale( v:GetVoiceVolumeScale() + ( delta / 100 * 5 ) )
				s.LastTick = CurTime()
			end

 			local Ping = vgui.Create("DPanel", line)
 			Ping:SetWide(32 * RayUI.Scale)
 			Ping:SetText("")
 			Ping:Dock(RIGHT)
 			Ping:DockMargin(10 * RayUI.Scale, 0, 4 * RayUI.Scale, 0)
 			Ping:SetWide(68 * RayUI.Scale)
			 
 			Ping.Paint = function(self, w, h)
			 	if v:IsValid() then
					if v:Ping() < 100 then
						draw.RoundedBox(10, 0, h - math.Round(10 * RayUI.Scale) - 7 * RayUI.Scale, math.Round(6 * RayUI.Scale), math.Round(10 * RayUI.Scale), Color(0, 255, 0))
						draw.RoundedBox(10, math.Round(9 * RayUI.Scale), h - math.Round(16 * RayUI.Scale) - 7 * RayUI.Scale, math.Round(6 * RayUI.Scale), math.Round(16 * RayUI.Scale), Color(0, 255, 0))
						draw.RoundedBox(10, math.Round(18 * RayUI.Scale), h - math.Round(22 * RayUI.Scale) - 7 * RayUI.Scale , math.Round(6 * RayUI.Scale), math.Round(22 * RayUI.Scale), Color(0, 255, 0))	
					elseif v:Ping() < 150 then
						draw.RoundedBox(10, 0, h - math.Round(10 * RayUI.Scale) - 7 * RayUI.Scale, math.Round(6 * RayUI.Scale), math.Round(10 * RayUI.Scale), Color(255, 120, 0))
						draw.RoundedBox(10, math.Round(9 * RayUI.Scale), h - math.Round(16 * RayUI.Scale) - 7 * RayUI.Scale, math.Round(6 * RayUI.Scale), math.Round(16 * RayUI.Scale), Color(255, 120, 0))
						draw.RoundedBox(10, math.Round(18 * RayUI.Scale), h - math.Round(22 * RayUI.Scale) - 7 * RayUI.Scale , math.Round(6 * RayUI.Scale), math.Round(22 * RayUI.Scale), Color(120, 120, 120))	
					elseif v:Ping() >= 150 then
						draw.RoundedBox(10, 0, h - math.Round(10 * RayUI.Scale) - 7 * RayUI.Scale, math.Round(6 * RayUI.Scale), math.Round(10 * RayUI.Scale), Color(255, 0, 0))
						draw.RoundedBox(10, math.Round(9 * RayUI.Scale), h - math.Round(16 * RayUI.Scale) - 7 * RayUI.Scale, math.Round(6 * RayUI.Scale), math.Round(16 * RayUI.Scale), Color(120, 120, 120))
						draw.RoundedBox(10, math.Round(18 * RayUI.Scale), h - math.Round(22 * RayUI.Scale) - 7 * RayUI.Scale , math.Round(6 * RayUI.Scale), math.Round(22 * RayUI.Scale), Color(120, 120, 120))	
					end

					draw.SimpleText(v:Ping(), "RayUI:Large", 46 * RayUI.Scale, 16 * RayUI.Scale, RayUI.Colors.White2, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
				end
 			end

			local ExtBut = {}
			for k, tag in ipairs(self.Cfg.AdminMenu) do

				if tag.admin and !table.HasValue(self.Cfg.AdminPanel, LocalPlayer():GetUserGroup()) then continue end

				ExtBut[k] = RayUI:MakeIconButton(MainLine, tag.title, RayUI.Colors.White2, tag.color, tag.icon)
				ExtBut[k]:Dock(RIGHT)
				ExtBut[k]:DockMargin(5, 0, 5, 0)
				ExtBut[k]:SetWide(34 * RayUI.Scale)

				ExtBut[k].DoClick = function()
					target = v
					tag.command()
				end
			end

			local ButtonName = RayUI:MakeLabel("", "RayUI:Large", RayUI.Colors.White2, MainLine)
			ButtonName:Dock(RIGHT)
			ButtonName:DockMargin(10, 0, 0, 4)
			ButtonName:SetWide(0)

			local IsHovered = nil

			ButtonName.Think = function()
				surface.SetFont("RayUI:Large")

				for k,v in pairs(RayBoard.Cfg.AdminMenu) do
					if v.admin and !table.HasValue(RayBoard.Cfg.AdminPanel, LocalPlayer():GetUserGroup()) then continue end

					if ExtBut[k].Hovered and ButtonName:GetWide() == 0 and IsHovered == nil then
						ButtonName:SetText(v.title)
						ButtonName:SetTextColor(v.color)
						ButtonName:SizeTo(select(1, surface.GetTextSize( v.title )), ButtonName:GetTall(), 0.1)
						IsHovered = k
					elseif IsHovered != nil and !ExtBut[IsHovered].Hovered then
						ButtonName:SizeTo(0, ButtonName:GetTall(), 0.1)
						IsHovered = nil
					end
				end
			end	

			local ExtTall = math.Round( tall * 0.8 )

 			if engine.ActiveGamemode() == "terrortown" then
 				if ScoreGroup(v) == GROUP_TERROR then
 					RayBoard:TagsPanel(MainLine, v, GroupPanel, ExtTall)
 				else
 					if ScoreGroup(v) == GROUP_FOUND and v.search_result then
 						ExtTall = math.Round( 90 * RayUI.Scale )
 					end
 					RayBoard:SearchPanel(MainLine, v)
 				end
 
 				line.DoClick = function()
 					if v == LocalPlayer() then return end
 
 					if  MainLine:GetTall() == tall then
 						MainLine:SizeTo(-1, MainLine:GetTall() + ExtTall, RayBoard.AnimSpeed)
 						GroupPanel:SizeTo(-1, GroupPanel:GetTall() + ExtTall, RayBoard.AnimSpeed)
 					else
 						MainLine:SizeTo(-1, MainLine:GetTall() - ExtTall, RayBoard.AnimSpeed)
 						GroupPanel:SizeTo(-1, GroupPanel:GetTall() - ExtTall, RayBoard.AnimSpeed)
 					end
 				end
 			end

			if engine.ActiveGamemode() == "darkrp" then
				local MoneyPanel =  vgui.Create("DPanel", MainLine)
				MoneyPanel:Dock(LEFT)
				MoneyPanel:DockMargin(10, 0, 0, 4)
				MoneyPanel:SetWide(160)
				MoneyPanel.Paint = function(self, w, h)
					surface.SetDrawColor( Color(0, 239, 107) )
					surface.SetMaterial(RayUI.Icons.Money)
					surface.DrawTexturedRect(0, 6 * RayUI.Scale, 28 * RayUI.Scale, 28 * RayUI.Scale)

					if v:IsValid() then
						draw.SimpleText(DarkRP.formatMoney(v:getDarkRPVar("money")), "RayUI:Large", 32 * RayUI.Scale, 2 * RayUI.Scale, Color(160, 160, 160))
					end
				end

				local PropsPanel = RayUI:MakeIconButton(MainLine, "", Color(255, 120, 0), Color(255, 120, 0), RayUI.Icons.Cube, function() RunConsoleCommand("FPP_Cleanup", v:UserID()) end)
				PropsPanel:Dock(LEFT)
				PropsPanel:DockMargin(10, 0, 0, 4)

				surface.SetFont("RayUI:Large")
				PropsPanel:SetWide(34 * RayUI.Scale + select(1, surface.GetTextSize( "Props: " .. v:GetCount( "props" ) )))

				local PropsPanelOldPaint = PropsPanel.Paint


				local PropsPanelHovered = false

				PropsPanel.Paint = function(self, w, h)
					PropsPanelOldPaint(self, w, h)

					draw.SimpleText( "Props: " .. v:GetCount( "props" ), "RayUI:Large", 34 * RayUI.Scale, 2 * RayUI.Scale, Color(120, 120, 120))

					draw.SimpleText( "Clear?", "RayUI:Large", 42 * RayUI.Scale + select(1, surface.GetTextSize( "Props: " .. v:GetCount( "props" ) )), 2 * RayUI.Scale, Color(255, 120, 0))

					if self:IsHovered() and !PropsPanelHovered then
						self:SizeTo(200 * RayUI.Scale, h, 0.1)
						PropsPanelHovered = true
					elseif !self:IsHovered() and PropsPanelHovered then
						self:SizeTo(34 * RayUI.Scale + select(1, surface.GetTextSize( "Props: " .. v:GetCount( "props" ) )), 100, 0.1)
						PropsPanelHovered = false
					end
				end
			end

 			line.DoClick = function()
 				if v == LocalPlayer() then return end
 
 				if  MainLine:GetTall() == tall then
 					MainLine:SizeTo(-1, MainLine:GetTall() + ExtTall, RayBoard.AnimSpeed)
 					GroupPanel:SizeTo(-1, GroupPanel:GetTall() + ExtTall, RayBoard.AnimSpeed)
 				else
 					MainLine:SizeTo(-1, MainLine:GetTall() - ExtTall, RayBoard.AnimSpeed)
 					GroupPanel:SizeTo(-1, GroupPanel:GetTall() - ExtTall, RayBoard.AnimSpeed)
 				end
 			end

			local AvatarType = v.FakeAvatar and "RoundedFakeAvatar" or "RoundedAvatar"
			local Avatar = vgui.Create(AvatarType, line)
			Avatar:SetWide(36 * RayUI.Scale)
			Avatar:SetMaskSize( 36 * RayUI.Scale / 2 )
			Avatar:Dock(LEFT)
			Avatar:DockMargin(0, 0, 5, 0)
			if v.FakeAvatar then
				Avatar:SetMaterial(v.FakeAvatar)
			else
				Avatar:SetPlayer(v)
			end
			
			local _, nickCol = color_white
			if RayBoard.Cfg.ColorForNickname then
				if ATAG and RayBoard.Cfg.TagsHandler == "atags" then
					_, nickCol = v:getScoreboardTag()
				elseif scb and RayBoard.Cfg.TagsHandler == "scb" then
					if scb.tags[v:SteamID64()] and string.match( scb.tags[v:SteamID64()], "#(%w+)" ) ~= nil then
						nickCol = scb.hex_rgb(string.match( scb.tags[v:SteamID64()], "#(%w+)" ))
					elseif scb.tags[RayBoard:GetUserGroup(v)] and string.match( scb.tags[RayBoard:GetUserGroup(v)], "#(%w+)" ) ~= nil then
						nickCol = scb.hex_rgb(string.match( scb.tags[RayBoard:GetUserGroup(v)], "#(%w+)" ))
					end
				else
					if RayBoard.Cfg.TagsHandler and RayBoard.Cfg.UsergroupsStyle[RayBoard:GetUserGroup(v)] then
						nickCol = RayBoard.Cfg.UsergroupsStyle[RayBoard:GetUserGroup(v)][2]
					end
				end
			end
			local nick = RayUI:MakeLabel((v:GetNWBool( "RayBoard:HideID" ) and v:IsSuperAdmin()) and RayBoard:GetNick(v) .. " (Hidden)" or RayBoard:GetNick(v), "RayUI:Large", nickCol or RayUI.Colors.White2, line)
			nick:Dock(LEFT)
			nick:DockMargin(6, 0, 0, 0)
			
			local width = 70

			local function addColumn(text, func, width, dock)
				local col = vgui.Create("DPanel", line)
				col:SetMouseInputEnabled(false)
				col:SetPaintBackground(false)
				col:SetWide(width)
				col:Dock(dock)

				local lbl = RayUI:MakeLabel(text or "", "RayUI:Small", Color(200, 200, 200), col)
				lbl:SetContentAlignment(5)
				lbl:Dock(BOTTOM)

				if (lbl:GetText() == "") then
					lbl:Remove()
				end

				if func == "scb_custom" then
					local scb_line = col:Add("Panel")
					scb_line:Dock(FILL)

					local scb_tag = scb_line:Add("SCB.ChatLine")
					scb_tag:Dock(NODOCK)
					scb_tag:SetFont("RayUI:Large")

					local last_tag
					local next_update = 0
					local emoji_size = tostring(draw.GetFontHeight("RayUI:Large"))
					function scb_line:Think()
					if CurTime() < next_update then return end
						if !v:IsValid() then return end

						local tag = v:SCB_GetTag()
						if last_tag == tag then return end
						last_tag = tag

						scb_tag.added = {}
						scb_tag:ScaleChanged()

						scb_tag.emoji_size = emoji_size
						scb_tag:SetWide(width)

						if tag then
							scb_tag:Parse(tag)
						else
							scb_tag:NewLabel(v:GetUserGroup(), Color(255, 255, 255))
						end

						scb_tag:InvalidateLayout(true)
						scb_tag:SetSize(scb_tag:ChildrenSize())
						scb_tag:Center()

						next_update = CurTime() + 1
					end
					return
				end

				local val = RayUI:MakeLabel("", "RayUI:Large",  Color(255, 255, 255), col)
				val:SetContentAlignment(5)
				val:Dock(FILL)

				col.m_fNextUpdate = CurTime() + .1
				col.Think = function(self)
					if (CurTime() >= self.m_fNextUpdate) then
						self:Update()
						self.m_fNextUpdate = CurTime() + .1
					end
				end
				col.Update = function(self)
					if (!IsValid(v)) then return end

					local va, co = func(v)
					co = co or RayUI.Colors.White2
					val:SetTextColor(co)
					val:SetText(string.Comma(va))
				end
				col:Update()
			end

			for _, col in pairs(RayBoard.DefaultColumns, true) do
				if (col.candisplay and !col.candisplay()) then continue end
				addColumn(col.text or "", col.func, col.width and col.width * RayUI.Scale or width * RayUI.Scale, col.dock or RIGHT)
			end
		end

		local LabelText = text .. ": " .. #players

		label:SetText("")
		label:Dock(TOP)
		label:DockMargin(10, 8, 10, 5)
		label:SetTall(30 * RayUI.Scale)
		label.Paint = function(self, w, h)
			surface.SetFont( "RayUI:Large2" )
			t_w, t_h = surface.GetTextSize( LabelText )

			draw.RoundedBox(RayUI.Rounding * 0.35, 0, 0, t_w + 20, h, color or color_black)
			if ClosedGroup then
				draw.RoundedBox(RayUI.Rounding * 0.35, 0, 0, t_w + 20, h, Color(0, 0, 0, 150))
			elseif self.Hovered then
				draw.RoundedBox(RayUI.Rounding * 0.35, 0, 0, t_w + 20, h, Color(255, 255, 255, 10))
			end
		end
		label.DoClick = function()
			if GroupPanel:GetTall() != 0 then
				GroupPanel:SizeTo(-1, 0, RayBoard.AnimSpeed)
				cookie.Set( "RayBoard:Group_" .. text, 1 )
				ClosedGroup = cookie.GetNumber("RayBoard:Group_" .. text, 0) == 1
			else
				GroupPanel:GetCanvas():InvalidateLayout(true)
				GroupPanel:SizeTo(-1, GroupPanel:GetCanvas():GetTall(), RayBoard.AnimSpeed)
				cookie.Set( "RayBoard:Group_" .. text, 0 )
				ClosedGroup = cookie.GetNumber("RayBoard:Group_" .. text, 0) == 1
			end
		end

		local label_text = RayUI:MakeLabel(LabelText, "RayUI:Large2", Color(255,255,255), label)
		label_text:Dock(FILL)
		label_text:DockMargin(10, 0, 10, 0)
		-- 76561198111476720
		GroupPanel:Dock(TOP)

		if ClosedGroup then
			GroupPanel:SetTall(0)
		else
			GroupPanel:GetCanvas():InvalidateLayout(true)
			GroupPanel:SetTall(GroupPanel:GetCanvas():GetTall())
		end

		local bar = GroupPanel:GetVBar()
		bar:SetWide(0)

		if (#players == 0) then
			label:Remove()
		end
	end

	local teams = {}
	local CatColor = {}

	function RayBoard:CreateGroups()
		Content:GetCanvas():Clear()

		if engine.ActiveGamemode() == "terrortown" then
			AddGroup(LANG.GetTranslation("terrorists"), function(ply)
				return ScoreGroup(ply) == GROUP_TERROR
			end, Color(104, 159, 56), true)

			if (DetectiveMode and DetectiveMode()) then
				AddGroup(LANG.GetTranslation("sb_mia"), function(ply)
					return ScoreGroup(ply) == GROUP_NOTFOUND
				end, Color(239, 108, 0))

				AddGroup(LANG.GetTranslation("sb_confirmed"), function(ply)
					return ScoreGroup(ply) == GROUP_FOUND
				end, Color(198, 40, 40))
			end

			AddGroup(LANG.GetTranslation("spectators"), function(ply)
				return ScoreGroup(ply) == GROUP_SPEC
			end, Color(249, 168, 37))

			if SpecDM and ScoreGroup(LocalPlayer()) != GROUP_TERROR then
				AddGroup("SpecDM", function(ply)
					return ply:IsSpec() and ply:IsGhost()
				end, Color(48, 48, 48))
			end
		else
			if RayUI.Configuration.GetConfig( "RayBoardMode" ) == "All players in the same list" then
				AddGroup("Players", nil, Color(104, 159, 56))
			elseif RayUI.Configuration.GetConfig( "RayBoardMode" ) == "Separate players by team" then
				for _, v in pairs (player.GetAll()) do
					if (!teams[v:Team()]) then
						teams[v:Team()] = true
					end
				end
				for t in SortedPairs (teams) do
					AddGroup(team.GetName(t), function(ply)
						return ply:Team() == t
					end, team.GetColor(t))
				end
			elseif RayUI.Configuration.GetConfig( "RayBoardMode" ) == "Separate players by alive/dead status" then
				AddGroup("Alive", function(ply)
					return ply:Alive()
				end, Color(104, 159, 56))

				AddGroup("Dead", function(ply)
					return !ply:Alive()
				end, Color(240, 0, 0))
			elseif RayUI.Configuration.GetConfig( "RayBoardMode" ) == "[DarkRP ONLY!] Separate players by job categories" then
				for _, v in pairs (player.GetAll()) do
					if !v:getJobTable() then continue end

					if (!teams[v:getJobTable().category]) then
						teams[v:getJobTable().category] = true
					end
				end
				for k, v in pairs(DarkRP.getCategories().jobs) do
						CatColor[v.name] = v.color
				end
				for t in SortedPairs (teams) do
					AddGroup(t, function(ply)
						if !ply:getJobTable() then return end

						return ply:getJobTable().category == t
					end, CatColor[t])
				end
			end
		end
	end

	local SortCat = vgui.Create("DPanel", MainFrame)
	SortCat:SetPos(MainFrame:GetWide() - (50 * RayUI.Scale + PlyCountText:GetTextSize() + Margin2) - SortButton:GetWide(), th)
	SortCat:SetSize(SortButton:GetWide(), 0)
	SortCat.Paint = function(self, w, h)
		draw.RoundedBox(1, 0, 0, w, h, RayUI.Colors.DarkGray6)
	end

	local ColNum = 0

	for _, col in pairs(RayBoard.DefaultColumns) do
		if col.text != "Nick" and (col.text == "" or col.candisplay and !col.candisplay() or col.func == "scb_custom") then continue end

		ColNum = ColNum + 1

		local CatLine = vgui.Create("DButton", SortCat)
		CatLine:Dock(TOP)
		CatLine:SetTall(30 * RayUI.Scale + Margin2)
		CatLine:SetFont("RayUI:Large2")
		CatLine:SetText(col.text)
		CatLine:SetTextColor(color_white)
		CatLine.Paint = function(self, w, h)
			draw.RoundedBox(0, 0, 0, w, h, RayUI.Colors.DarkGray6)

			if sorting == col.text then
				draw.RoundedBox(0, 0, 0, w, h, Color(70, 70, 70))
			elseif sorting == col.text .. "_asc" then
				draw.RoundedBox(0, 0, 0, w, h, Color(40, 40, 40))
			end

			if self:IsHovered() then
				draw.RoundedBox( 0, 0, 0, w, h, Color(255, 255, 255, 10))
			end
		end
		CatLine.DoClick = function()
			Content:GetCanvas():Clear()

			if sorting == col.text then
				cookie.Set("RayBoard:Sorting", col.text .. "_asc" )
			else
				cookie.Set("RayBoard:Sorting", col.text )
			end

			RayBoard:CreateGroups()	
			sorting = cookie.GetString("RayBoard:Sorting")
		end
	end

	SortButton.DoClick = function()
		if SortCat:GetTall() == 0 then
			SortCat:SizeTo(-1, (30 * RayUI.Scale + Margin2) * ColNum, RayBoard.AnimSpeed)
		else
			SortCat:SizeTo(-1, 0, RayBoard.AnimSpeed)
		end
	end
	-- 76561198111476713
	local IncognitoModes = vgui.Create("DPanel", MainFrame)
	IncognitoModes:SetPos(MainFrame:GetWide() - (50 * RayUI.Scale + PlyCountText:GetTextSize() + Margin2) - Incognito:GetWide() - SortButton:GetWide(), th)
	IncognitoModes:SetSize(Incognito:GetWide(), 0)
	IncognitoModes.Paint = function(self, w, h)
		draw.RoundedBox(1, 0, 0, w, h, RayUI.Colors.DarkGray6)
	end

	local Modes = {

		{text = !LocalPlayer():GetNWBool( "RayBoard:HideID" ) and RayUI.GetPhrase("rayboard", "hide_yourself") or RayUI.GetPhrase("rayboard", "unhide_yourself"), ranks = CanSeeIncognitoAccess, func = function()

			net.Start( "RayBoard.HideID:Server" )
				if !LocalPlayer():GetNWBool("RayBoard:HideID") then
					net.WriteBool(true)
				end
			net.SendToServer()

		end},

		{text = RayUI.GetPhrase("rayboard", "change_id"), ranks = CanUseIncognitoAccess, func = function()

			local UserGroupsList

			if RayUI:GetAdminMod() == "ulx" then
				UserGroupsList = xgui.data.groups
			elseif RayUI:GetAdminMod() == "sam" then
				UserGroupsList = sam.ranks.get_ranks()
			elseif RayUI:GetAdminMod() == "xadmin" then
				UserGroupsList = xAdmin.Groups
			end

			local IdentityPanel = vgui.Create("RayUI:MainPanel")
			IdentityPanel:SetSize(850 * RayUI.Scale, 450 * RayUI.Scale)
			IdentityPanel:SetTitle("Identity Changer")
			IdentityPanel:Center()
			IdentityPanel:MakePopup()

			local Main = vgui.Create("DScrollPanel", IdentityPanel)
			Main:Dock(FILL)
			Main:DockMargin(10 * RayUI.Scale, 10 * RayUI.Scale, 10 * RayUI.Scale, 10 * RayUI.Scale)
			Main.Paint = function(self, w, h)
				draw.RoundedBox(RayUI.Rounding, 0, 0, w, h, Color(RayUI.Colors.DarkGray3.r, RayUI.Colors.DarkGray3.g, RayUI.Colors.DarkGray3.b, RayUI.Opacity + 20))
			end

			local ChangeNick = RayUI:MakeTextEntry(Main, RayUI.GetPhrase("rayboard", "fake_nickname") )
			local UserGroups

			if UserGroupsList != nil then
				UserGroups = RayUI:MakeComboBox(Main, RayUI.GetPhrase("rayboard", "fake_usergroup"))

				for k,v in pairs(UserGroupsList) do
					if RayUI:GetAdminMod() == "ulx" then
						UserGroups:AddChoice( v )
					elseif RayUI:GetAdminMod() == "sam" then
						UserGroups:AddChoice( k )
					elseif RayUI:GetAdminMod() == "xadmin" then
						UserGroups:AddChoice( k )
					end
				end
			end

			local AvatarURL = RayUI:MakeTextEntry(Main, RayUI.GetPhrase("rayboard", "fake_avatar") )

			-- 76561198111476713
			local ResetIdentity = vgui.Create("DButton", IdentityPanel)
			ResetIdentity:Dock(BOTTOM)
			ResetIdentity:DockMargin(10 * RayUI.Scale, 0 * RayUI.Scale, 10 * RayUI.Scale, 10 * RayUI.Scale)
			ResetIdentity:SetTall(40 * RayUI.Scale)
			ResetIdentity.DoClick = function()
				if FakeID[LocalPlayer()] then
					net.Start( "RayBoard:RemoveFakeIdentityToServer" )
					net.SendToServer()
				end

				chat.AddText(Color(106, 30, 231), "[RayBoard] ", Color(255,255,255), "Your identity has been reset.")
			end
			ResetIdentity:FormatRayButton( RayUI.GetPhrase("rayboard", "reset_fakeid"), RayUI.Colors.DarkGray3, RayUI.Colors.Red )
			ResetIdentity:SetFont("RayUI:Large2")

			local SaveIdentity = vgui.Create("DButton", IdentityPanel)
			SaveIdentity:Dock(BOTTOM)
			SaveIdentity:DockMargin(10 * RayUI.Scale, 0 * RayUI.Scale, 10 * RayUI.Scale, 10 * RayUI.Scale)
			SaveIdentity:SetTall(40 * RayUI.Scale)
			SaveIdentity.DoClick = function()
				net.Start( "RayBoard:FakeIdentityToServer" )
					net.WriteString( ChangeNick:GetValue() or "" )
					net.WriteString( ((UserGroups:GetSelected() == "Options" or !UserGroups:GetSelected()) and "") or UserGroups:GetSelected() )
					net.WriteString( AvatarURL:GetValue() or "" )
				net.SendToServer()

				chat.AddText(Color(106, 30, 231), "[RayBoard] ", Color(255,255,255), "Identity saved!")
			end
			SaveIdentity:FormatRayButton( RayUI.GetPhrase("rayboard", "save_fakeid"), RayUI.Colors.DarkGray3, RayUI.Colors.Green )
			SaveIdentity:SetFont("RayUI:Large2")
		end},
	}

	local ModeNum = 0

	for _, mode in pairs(Modes) do

		if table.HasValue(mode.ranks, LocalPlayer():GetUserGroup()) then

			ModeNum = ModeNum + 1

			local CatLine = vgui.Create("DButton", IncognitoModes)
			CatLine:Dock(TOP)
			CatLine:SetTall(30 * RayUI.Scale + Margin2)
			CatLine:SetFont("RayUI:Large2")
			CatLine:SetText(mode.text)
			CatLine:SetTextColor(color_white)
			CatLine.Paint = function(self, w, h)
				draw.RoundedBox(0, 0, 0, w, h, RayUI.Colors.DarkGray6)

				if self:IsHovered() then
					draw.RoundedBox( 0, 0, 0, w, h, Color(255, 255, 255, 10))
				end
			end
			CatLine.DoClick = function()
				mode.func()
			end

		end
	end

	Incognito.DoClick = function()
		if IncognitoModes:GetTall() == 0 then
			IncognitoModes:SizeTo(-1, (30 * RayUI.Scale + Margin2) * ModeNum, RayBoard.AnimSpeed)
		else
			IncognitoModes:SizeTo(-1, 0, RayBoard.AnimSpeed)
		end
	end

	RayBoard:CreateGroups()
	gui.EnableScreenClicker(false)
end

hook.Add("ScoreboardShow", "RayBoard:ScoreboardShow", function()
	if !GetConVar( "rayboard_enable" ):GetBool() then return end

	if IsValid(_RayBoard) and _RayBoard:IsVisible() then

		RayBoard:CreateGroups()
		_RayBoard:SetVisible(true)
		_RayBoard:SetAlpha(0)
		_RayBoard:AlphaTo(255, 0.3)
		_RayBoard:SetKeyboardInputEnabled(false)
		if !GetConVar( "rayboard_mouse" ):GetBool() then
			_RayBoard:SetMouseInputEnabled(false)
		end
	else
		RayBoard:Show()
		_RayBoard:SetKeyboardInputEnabled(false)
		if !GetConVar( "rayboard_mouse" ):GetBool() then
			_RayBoard:SetMouseInputEnabled(false)
		end
	end
	-- 76561198111476713
	if GTawards and tobool(GTawards.TimePanel.Settings["onlyShowOnScoreboard"]) then
		GTawards.TimePanel.Panel:AlphaTo(255, 0.1, 0)
	end

	if RayUI.Configuration.GetConfig( "HideHUD" ) then
		RayHUD.DrawOnSB = true
		RayHUD.RunVisibilityCheck()
	end

	return true
end)

if engine.ActiveGamemode() == "hideandseek" then
	function GAMEMODE:ScoreboardHide() return end
end

hook.Add("ScoreboardHide", "RayBoard:ScoreboardHide", function()
	if !GetConVar( "rayboard_enable" ):GetBool() then return end

	if IsValid(_RayBoard) then			
		_RayBoard:AlphaTo( 0, 0.15, 0,
		function()
			_RayBoard:SetVisible( false )
		end)
	end

	if GTawards and tobool(GTawards.TimePanel.Settings["onlyShowOnScoreboard"]) then
		GTawards.TimePanel.Panel:AlphaTo(0, 0.1, 0)
	end

	if RayUI.Configuration.GetConfig( "HideHUD" ) then
		RayHUD.DrawOnSB = false
		RayHUD.RunVisibilityCheck()
	end
end)

hook.Add("KeyRelease", "RayBoard:DoCursorOnRMB", function(ply, key)
	if (key == IN_ATTACK2 and IsValid(_RayBoard)) and _RayBoard:IsVisible() then
		gui.EnableScreenClicker(true)
		_RayBoard:SetMouseInputEnabled(true)
	end
end)