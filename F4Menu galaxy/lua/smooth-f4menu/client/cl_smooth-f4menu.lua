/*----------------------------------------------------------------------
Leak by Famouse

Play good games:↓
store.steampowered.com/curator/32364216

Subscribe to the channel:↓
https://www.youtube.com/c/Famouse

More leaks in the discord:↓ 
discord.gg/rFdQwzm
------------------------------------------------------------------------*/

surface.CreateFont( "SmoothF4menuFont1", {
	font = "Open Sans",
	size = 30,
	weight = 700,
	antialias = true,
})

surface.CreateFont( "SmoothF4menuFontButton", {
	font = "Open Sans",
	size = 20,
	weight = 700,
	antialias = true,
})

Texts = {}
Texts.DarkRPCommand = "say"
function RunEntCmd(...)
	local arg = {...}
	if Texts.DarkRPCommand:lower():find('say') then
		arg = table.concat(arg,' ')
	else
		arg = table.concat(arg,'" "')
	end
	RunConsoleCommand(Texts.DarkRPCommand, "/"..arg)
end

function RunCmd(...)
	local arg = {...}
	if Texts.DarkRPCommand:lower():find('say') then
		arg = table.concat(arg,' ')
	else
		arg = table.concat(arg,'" "')
	end
	RunConsoleCommand(Texts.DarkRPCommand,arg)
end

function ClearAllDPanel()
	if IsValid(SmoothJobsDPanel) then SmoothJobsDPanel:Remove() end
	if IsValid(SmoothShopDPanel) then SmoothShopDPanel:Remove() end
	if IsValid(SmoothSiteDPanel) then SmoothSiteDPanel:Remove() end
	if IsValid(SmoothTitleDPanel) then SmoothTitleDPanel:Remove() end
	if IsValid(SmoothCommandDPanel) then SmoothCommandDPanel:Remove() end
	if IsValid(SmoothDonateDPanel) then SmoothDonateDPanel:Remove() end
end

timersimpleasd = 0
hook.Add("Think","CloseF4Menu",function()
	if CurTime() > timersimpleasd then
		if input.IsKeyDown(KEY_F4) then
			if IsValid(SmoothF4MenuFrame) then
				SmoothF4MenuFrame:MoveTo( -1000,ScrH()/2-(SmoothF4MenuFrame:GetTall()/2), 0.5, 0, -1)
				timer.Simple(0.5,function() SmoothF4MenuFrame:Close() end)
			end
			timersimpleasd = CurTime() + 1
		end
	end
end)

net.Receive("OpenSmoothF4menu",function()

	if IsValid(SmoothF4MenuFrame) then SmoothF4MenuFrame:Close() end

	timer.Simple(0,function() local SmoothTitlePanel = SmoothF4MenuFrame:Add("SmoothTitlePanel") end)

	SmoothF4MenuFrame = vgui.Create("DFrame")
	SmoothF4MenuFrame:SetSize(1000, 650)
	SmoothF4MenuFrame:SetPos(-1000,ScrH()/2-(SmoothF4MenuFrame:GetTall()/2))
	SmoothF4MenuFrame:SetDraggable( true )
	SmoothF4MenuFrame:MakePopup()
	SmoothF4MenuFrame:ShowCloseButton( false )
	SmoothF4MenuFrame:SetTitle("")
	SmoothF4MenuFrame.Paint = function( panel )
		SmoothDrawBlur(panel, 3)

		draw.RoundedBox( 0, 0, 0, SmoothF4MenuFrame:GetWide(), SmoothF4MenuFrame:GetTall() , Color(47, 47, 47,150) )
		surface.SetDrawColor( 47, 47, 47,150 )
		surface.DrawOutlinedRect(0,0,SmoothF4MenuFrame:GetWide(), SmoothF4MenuFrame:GetTall())

		draw.RoundedBox( 0, 0, 0, SmoothF4MenuFrame:GetWide(), 35 , Color(41, 41, 41,75) )
		surface.SetDrawColor( 47, 47, 47,150 )
		surface.DrawOutlinedRect(0,0,SmoothF4MenuFrame:GetWide(), 35)

		local menuicon = Material( "materials/icons/menu.png" )
		surface.SetMaterial( menuicon )
		surface.SetDrawColor( 255, 255, 255, 255 )
		surface.DrawTexturedRect(5,5,25,25 )
	end
	SmoothF4MenuFrame:MoveTo( (ScrW()/2-(SmoothF4MenuFrame:GetWide()/2)),ScrH()/2-(SmoothF4MenuFrame:GetTall()/2), 0.5, 0, -1)

	local SmoothF4Menuclose = vgui.Create("DButton", SmoothF4MenuFrame)
	SmoothF4Menuclose:SetSize( 45, 35 )
	SmoothF4Menuclose:SetPos( SmoothF4MenuFrame:GetWide() - 45 , 0 )
	SmoothF4Menuclose:SetColor( Color( 255, 255, 255 ))
	SmoothF4Menuclose:SetFont("SmoothF4menuFont1")
	SmoothF4Menuclose:SetText("")
	SmoothF4Menuclose.Paint = function( )
		local menuicon = Material( "materials/icons/close.png" )
		surface.SetMaterial( menuicon )
		surface.SetDrawColor( 255, 255, 255, 255 )
		surface.DrawTexturedRect(13,8,19,19 )
		if SmoothF4Menuclose.isHover then
			draw.RoundedBox( 0, 0, 0, SmoothF4Menuclose:GetWide(), 35 , Color(41, 41, 41,75) )
		end
	end
	SmoothF4Menuclose.OnCursorEntered = function()
		SmoothF4Menuclose.isHover = true
	end
	SmoothF4Menuclose.OnCursorExited = function()
		SmoothF4Menuclose.isHover = false
	end
	SmoothF4Menuclose.DoClick = function()
		SmoothF4MenuFrame:MoveTo( -1000,ScrH()/2-(SmoothF4MenuFrame:GetTall()/2), 0.5, 0, -1)
		timer.Simple(0.5,function() SmoothF4MenuFrame:Close() end)
	end

	local NameServerTitle = vgui.Create("DLabel", SmoothF4MenuFrame)
	NameServerTitle:SizeToContents()
	NameServerTitle:SetPos(35,0)
	NameServerTitle:SetColor(Color(255,255,255,255))
	NameServerTitle:SetText( SmoothF4MenuFrame_NameServer )
	NameServerTitle:SetWide( 800 )
	NameServerTitle:SetFont( "SmoothF4menuFont1" )
	NameServerTitle:SetTall(34)

			SmoothF4MenuDPanel = vgui.Create( "DPanel",SmoothF4MenuFrame )
			SmoothF4MenuDPanel:SetPos( 0, 34 ) 
			SmoothF4MenuDPanel:SetSize( 50, 616 )
			SmoothF4MenuDPanel.isActive1 = false
			SmoothF4MenuDPanel.isActive2 = false
			SmoothF4MenuDPanel.Paint = function()
				draw.RoundedBox( 0, 0, 0, SmoothF4MenuDPanel:GetWide(), SmoothF4MenuDPanel:GetTall() , Color(41, 41, 41,75) )
				surface.SetDrawColor( 47, 47, 47,150 )
				surface.DrawOutlinedRect(0,0,SmoothF4MenuDPanel:GetWide(), SmoothF4MenuDPanel:GetTall())

				if (SmoothF4MenuDPanel.isHover or SmoothF4MenuButtonTitle.isHover or SmoothF4MenuButtonJobs.isHover or SmoothF4MenuButtonShop.isHover or SmoothF4MenuButtonSite.isHover or SmoothF4MenuButtonCommands.isHover or SmoothF4MenuButtonDonate.isHover ) and !SmoothF4MenuDPanel.isActive1 then
					SmoothF4MenuDPanel:SizeTo( 250,616, 0.3, 0, -1)
					SmoothF4MenuDPanel.isActive1 = true
					SmoothF4MenuDPanel.isActive2 = false

					-- JOBS
					if IsValid(SmoothJobsDPanel) then
						SmoothJobsDPanel:SizeTo( 750,615, 0.3, 0, -1)
						SmoothJobsDPanel:MoveTo( 250,35, 0.3, 0, -1)
					end
					-- ENT
					if IsValid(SmoothShopDPanel) then
						SmoothShopDPanel:SizeTo( 750,605, 0.3, 0, -1)
						SmoothShopDPanel:MoveTo( 250,40, 0.3, 0, -1)
					end
					-- SITE
					if IsValid(SmoothSiteDPanel) then
						SmoothSiteDPanel:SizeTo( 750,615, 0.3, 0, -1)
						SmoothSiteDPanel:MoveTo( 250,40, 0.3, 0, -1)
					end
					-- SITE
					if IsValid(SmoothDonateDPanel) then
						SmoothDonateDPanel:SizeTo( 750,615, 0.3, 0, -1)
						SmoothDonateDPanel:MoveTo( 250,40, 0.3, 0, -1)
					end
					-- TITLE
					if IsValid(SmoothTitleDPanel) then
						SmoothTitleDPanel:SizeTo( 750,615, 0.3, 0, -1)
						SmoothTitleDPanel:MoveTo( 250,35, 0.3, 0, -1)
					end
					-- COMMAND
					if IsValid(SmoothCommandDPanel) then
						SmoothCommandDPanel:SizeTo( 750,605, 0.3, 0, -1)
						SmoothCommandDPanel:MoveTo( 250,40, 0.3, 0, -1)
					end
				elseif (!SmoothF4MenuDPanel.isHover and !SmoothF4MenuButtonTitle.isHover and !SmoothF4MenuButtonJobs.isHover and !SmoothF4MenuButtonShop.isHover and !SmoothF4MenuButtonSite.isHover and !SmoothF4MenuButtonCommands.isHover and !SmoothF4MenuButtonDonate.isHover) and !SmoothF4MenuDPanel.isActive2 then
					SmoothF4MenuDPanel:SizeTo( 50,616, 0.3, 0, -1)
					SmoothF4MenuDPanel.isActive2 = true
					SmoothF4MenuDPanel.isActive1 = false

					-- JOBS
					if IsValid(SmoothJobsDPanel) then
						SmoothJobsDPanel:SizeTo( 950,615, 0.3, 0, -1)
						SmoothJobsDPanel:MoveTo( 50,35, 0.3, 0, -1)
					end
					-- ENT
					if IsValid(SmoothShopDPanel) then
						SmoothShopDPanel:SizeTo( 950,605, 0.3, 0, -1)
						SmoothShopDPanel:MoveTo( 50,40, 0.3, 0, -1)
					end
					-- SITE
					if IsValid(SmoothSiteDPanel) then
						SmoothSiteDPanel:SizeTo( 950,615, 0.3, 0, -1)
						SmoothSiteDPanel:MoveTo( 50,40, 0.3, 0, -1)
					end
					-- SITE
					if IsValid(SmoothDonateDPanel) then
						SmoothDonateDPanel:SizeTo( 950,615, 0.3, 0, -1)
						SmoothDonateDPanel:MoveTo( 50,40, 0.3, 0, -1)
					end
					-- TITLE
					if IsValid(SmoothTitleDPanel) then
						SmoothTitleDPanel:SizeTo( 950,615, 0.3, 0, -1)
						SmoothTitleDPanel:MoveTo( 50,35, 0.3, 0, -1)
					end
					-- COMMAND
					if IsValid(SmoothCommandDPanel) then
						SmoothCommandDPanel:SizeTo( 950,605, 0.3, 0, -1)
						SmoothCommandDPanel:MoveTo( 50,40, 0.3, 0, -1)
					end
				end
			end
			SmoothF4MenuDPanel.OnCursorEntered = function()
				SmoothF4MenuDPanel.isHover = true
			end
			SmoothF4MenuDPanel.OnCursorExited = function()
				SmoothF4MenuDPanel.isHover = false
			end

				SmoothF4MenuButtonTitle = vgui.Create("DButton", SmoothF4MenuFrame)
				SmoothF4MenuButtonTitle:SetSize( SmoothF4MenuDPanel:GetWide(),50 )
				SmoothF4MenuButtonTitle:SetPos( 0,35 )
				SmoothF4MenuButtonTitle:SetColor( Color( 255, 255, 255 ))
				SmoothF4MenuButtonTitle:SetFont("SmoothF4menuFontButton")
				SmoothF4MenuButtonTitle:SetText("")
				SmoothF4MenuButtonTitle.Paint = function(panel)
					local menuicon = Material( "materials/icons/home.png" )
					surface.SetMaterial( menuicon )
					surface.SetDrawColor( 255, 255, 255, 255 )
					surface.DrawTexturedRect(10,10,30,30 )
					if SmoothF4MenuButtonTitle.isHover then
						draw.RoundedBox( 0, 0, 0, SmoothF4MenuButtonTitle:GetWide(), SmoothF4MenuButtonTitle:GetTall() , Color(41, 41, 41,70) )
					end
					draw.SimpleText(SmoothF4MenuFrame_NameServer_Home,"SmoothF4menuFontButton",55,15,Color(255,255,255))
					SmoothF4MenuButtonTitle:SetSize( SmoothF4MenuDPanel:GetWide(),50 )
				end
				SmoothF4MenuButtonTitle.OnCursorEntered = function()
					SmoothF4MenuButtonTitle.isHover = true
				end
				SmoothF4MenuButtonTitle.OnCursorExited = function()
					SmoothF4MenuButtonTitle.isHover = false
				end
				SmoothF4MenuButtonTitle.DoClick = function()
					ClearAllDPanel()
					local SmoothTitlePanel = SmoothF4MenuFrame:Add("SmoothTitlePanel")
					SmoothF4MenuDPanel:SetSize(50,616)
				end

				SmoothF4MenuButtonJobs = vgui.Create("DButton", SmoothF4MenuFrame)
				SmoothF4MenuButtonJobs:SetSize( SmoothF4MenuDPanel:GetWide(),50 )
				SmoothF4MenuButtonJobs:SetPos( 0,85 )
				SmoothF4MenuButtonJobs:SetColor( Color( 255, 255, 255 ))
				SmoothF4MenuButtonJobs:SetFont("SmoothF4menuFontButton")
				SmoothF4MenuButtonJobs:SetText("")
				SmoothF4MenuButtonJobs.Paint = function(panel)
					local menuicon = Material( "materials/icons/jobs.png" )
					surface.SetMaterial( menuicon )
					surface.SetDrawColor( 255, 255, 255, 255 )
					surface.DrawTexturedRect(10,10,30,30 )
					if SmoothF4MenuButtonJobs.isHover then
						draw.RoundedBox( 0, 0, 0, SmoothF4MenuButtonJobs:GetWide(), SmoothF4MenuButtonJobs:GetTall() , Color(41, 41, 41,70) )
					end
					draw.SimpleText(SmoothF4MenuFrame_NameServer_Jobs,"SmoothF4menuFontButton",55,15,Color(255,255,255))
					SmoothF4MenuButtonJobs:SetSize( SmoothF4MenuDPanel:GetWide(),50 )
				end
				SmoothF4MenuButtonJobs.OnCursorEntered = function()
					SmoothF4MenuButtonJobs.isHover = true
				end
				SmoothF4MenuButtonJobs.OnCursorExited = function()
					SmoothF4MenuButtonJobs.isHover = false
				end
				SmoothF4MenuButtonJobs.DoClick = function()
					ClearAllDPanel()
					local SmoothJobsPanel = SmoothF4MenuFrame:Add("SmoothJobsPanel")
					SmoothF4MenuDPanel:SetSize(50,616)
				end

				SmoothF4MenuButtonShop = vgui.Create("DButton", SmoothF4MenuFrame)
				SmoothF4MenuButtonShop:SetSize( SmoothF4MenuDPanel:GetWide(),50 )
				SmoothF4MenuButtonShop:SetPos( 0,135 )
				SmoothF4MenuButtonShop:SetColor( Color( 255, 255, 255 ))
				SmoothF4MenuButtonShop:SetFont("SmoothF4menuFontButton")
				SmoothF4MenuButtonShop:SetText("")
				SmoothF4MenuButtonShop.Paint = function(panel)
					local menuicon = Material( "materials/icons/shop.png" )
					surface.SetMaterial( menuicon )
					surface.SetDrawColor( 255, 255, 255, 255 )
					surface.DrawTexturedRect(10,10,30,30 )
					if SmoothF4MenuButtonShop.isHover then
						draw.RoundedBox( 0, 0, 0, SmoothF4MenuButtonShop:GetWide(), SmoothF4MenuButtonShop:GetTall() , Color(41, 41, 41,70) )
					end
					draw.SimpleText(SmoothF4MenuFrame_NameServer_Shop,"SmoothF4menuFontButton",55,15,Color(255,255,255))
					SmoothF4MenuButtonShop:SetSize( SmoothF4MenuDPanel:GetWide(),50 )
				end
				SmoothF4MenuButtonShop.OnCursorEntered = function()
					SmoothF4MenuButtonShop.isHover = true
				end
				SmoothF4MenuButtonShop.OnCursorExited = function()
					SmoothF4MenuButtonShop.isHover = false
				end
				SmoothF4MenuButtonShop.DoClick = function()
					ClearAllDPanel()
					local SmoothShopPanel = SmoothF4MenuFrame:Add("SmoothShopPanel")
					SmoothF4MenuDPanel:SetSize(50,616)
				end

				SmoothF4MenuButtonCommands = vgui.Create("DButton", SmoothF4MenuFrame)
				SmoothF4MenuButtonCommands:SetSize( SmoothF4MenuDPanel:GetWide(),50 )
				SmoothF4MenuButtonCommands:SetPos( 0,185 )
				SmoothF4MenuButtonCommands:SetColor( Color( 255, 255, 255 ))
				SmoothF4MenuButtonCommands:SetFont("SmoothF4menuFontButton")
				SmoothF4MenuButtonCommands:SetText("")
				SmoothF4MenuButtonCommands.Paint = function(panel)
					local menuicon = Material( "materials/icons/commands.png" )
					surface.SetMaterial( menuicon )
					surface.SetDrawColor( 255, 255, 255, 255 )
					surface.DrawTexturedRect(10,10,30,30 )
					if SmoothF4MenuButtonCommands.isHover then
						draw.RoundedBox( 0, 0, 0, SmoothF4MenuButtonCommands:GetWide(), SmoothF4MenuButtonCommands:GetTall() , Color(41, 41, 41,70) )
					end
					draw.SimpleText(SmoothF4MenuFrame_NameServer_Command,"SmoothF4menuFontButton",55,15,Color(255,255,255))
					SmoothF4MenuButtonCommands:SetSize( SmoothF4MenuDPanel:GetWide(),50 )
				end
				SmoothF4MenuButtonCommands.OnCursorEntered = function()
					SmoothF4MenuButtonCommands.isHover = true
				end
				SmoothF4MenuButtonCommands.OnCursorExited = function()
					SmoothF4MenuButtonCommands.isHover = false
				end
				SmoothF4MenuButtonCommands.DoClick = function()
					ClearAllDPanel()
					local SmoothCommandPanel = SmoothF4MenuFrame:Add("SmoothCommandPanel")
					SmoothF4MenuDPanel:SetSize(50,616)
				end

				SmoothF4MenuButtonSite = vgui.Create("DButton", SmoothF4MenuFrame)
				SmoothF4MenuButtonSite:SetSize( SmoothF4MenuDPanel:GetWide(),50 )
				SmoothF4MenuButtonSite:SetPos( 0,235 )
				SmoothF4MenuButtonSite:SetColor( Color( 255, 255, 255 ))
				SmoothF4MenuButtonSite:SetFont("SmoothF4menuFontButton")
				SmoothF4MenuButtonSite:SetText("")
				SmoothF4MenuButtonSite.Paint = function(panel)
					local menuicon = Material( "materials/icons/site.png" )
					surface.SetMaterial( menuicon )
					surface.SetDrawColor( 255, 255, 255, 255 )
					surface.DrawTexturedRect(10,10,30,30 )
					if SmoothF4MenuButtonSite.isHover then
						draw.RoundedBox( 0, 0, 0, SmoothF4MenuButtonSite:GetWide(), SmoothF4MenuButtonSite:GetTall() , Color(41, 41, 41,70) )
					end
					draw.SimpleText(SmoothF4MenuFrame_NameServer_Site,"SmoothF4menuFontButton",55,15,Color(255,255,255))
					SmoothF4MenuButtonSite:SetSize( SmoothF4MenuDPanel:GetWide(),50 )
				end
				SmoothF4MenuButtonSite.OnCursorEntered = function()
					SmoothF4MenuButtonSite.isHover = true
				end
				SmoothF4MenuButtonSite.OnCursorExited = function()
					SmoothF4MenuButtonSite.isHover = false
				end
				SmoothF4MenuButtonSite.DoClick = function()
					ClearAllDPanel()
					local SmoothSitePanel = SmoothF4MenuFrame:Add("SmoothSitePanel")
					SmoothF4MenuDPanel:SetSize(50,616)
				end

				SmoothF4MenuButtonDonate = vgui.Create("DButton", SmoothF4MenuFrame)
				SmoothF4MenuButtonDonate:SetSize( SmoothF4MenuDPanel:GetWide(),50 )
				SmoothF4MenuButtonDonate:SetPos( 0,285 )
				SmoothF4MenuButtonDonate:SetColor( Color( 255, 255, 255 ))
				SmoothF4MenuButtonDonate:SetFont("SmoothF4menuFontButton")
				SmoothF4MenuButtonDonate:SetText("")
				SmoothF4MenuButtonDonate.Paint = function(panel)
					local menuicon = Material( "materials/icons/donate.png" )
					surface.SetMaterial( menuicon )
					surface.SetDrawColor( 255, 255, 255, 255 )
					surface.DrawTexturedRect(10,10,30,30 )
					if SmoothF4MenuButtonDonate.isHover then
						draw.RoundedBox( 0, 0, 0, SmoothF4MenuButtonDonate:GetWide(), SmoothF4MenuButtonDonate:GetTall() , Color(41, 41, 41,70) )
					end
					draw.SimpleText("Донат","SmoothF4menuFontButton",55,15,Color(255,255,255))
					SmoothF4MenuButtonDonate:SetSize( SmoothF4MenuDPanel:GetWide(),50 )
				end
				SmoothF4MenuButtonDonate.OnCursorEntered = function()
					SmoothF4MenuButtonDonate.isHover = true
				end
				SmoothF4MenuButtonDonate.OnCursorExited = function()
					SmoothF4MenuButtonDonate.isHover = false
				end
				SmoothF4MenuButtonDonate.DoClick = function()
					ClearAllDPanel()
					local SmoothDonatePanel = SmoothF4MenuFrame:Add("SmoothDonatePanel")
					SmoothF4MenuDPanel:SetSize(50,616)
				end

end)

-- BLUR PANEL
function SmoothDrawBlur(panel, amount)
	local blurmaterial = Material("pp/blurscreen")
	local x, y = panel:LocalToScreen(0, 0)
	local scrW, scrH = ScrW(), ScrH()
	surface.SetDrawColor(255, 255, 255)
	surface.SetMaterial(blurmaterial)
	for i = 1, 3 do
		blurmaterial:SetFloat("$blur", (i / 3) * (amount or 6))
		blurmaterial:Recompute()
		render.UpdateScreenEffectTexture()
		surface.DrawTexturedRect(x * -1, y * -1, scrW, scrH)
	end
end

/*------------------------------------------------------------------------
Donation for leaks

Qiwi Wallet         4890494419811120 
YandexMoney         410013095053302
WebMoney(WMR)       R235985364414
WebMoney(WMZ)       Z309855690994
------------------------------------------------------------------------*/