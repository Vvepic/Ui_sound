/*----------------------------------------------------------------------
Leak by Famouse

Play good games:↓
http://store.steampowered.com/curator/32364216

Subscribe to the channel:↓
https://www.youtube.com/c/Famouse

More leaks in the discord:↓ 
discord.gg/rFdQwzm
------------------------------------------------------------------------*/

local PANEL = {}
function PANEL:Init()

	SmoothCommandDPanel = vgui.Create( "DPanel", SmoothF4MenuFrame )
	SmoothCommandDPanel:SetPos( 50, 40 )
	SmoothCommandDPanel:SetSize( 950, 605 )
	SmoothCommandDPanel.Paint = function() end

		SmoothCommandDPanelScroll = vgui.Create( "DPanel", SmoothCommandDPanel )
		SmoothCommandDPanelScroll:SetPos( 0, 0 )
		SmoothCommandDPanelScroll:SetSize( 1000, 605  )
		SmoothCommandDPanelScroll.Paint = function()
			draw.RoundedBox( 0, 0, 0, 685, 660 , Color(255,255,255,0) )
		end

		local scroll = vgui.Create("DScrollPanel", SmoothCommandDPanelScroll)
		scroll:SetSize(1000, 605)
		scroll:SetPos(0, 0)
		function scroll:Paint(w, h)
			draw.RoundedBox(0, 0, 0, 0, 0, Color(42, 46, 48, 0))
		end
		local scrollbar = scroll:GetVBar()
		function scrollbar:Paint(w, h)
			draw.RoundedBox(3, 5, 0, 0, 0, Color(46, 49, 54, 0))
		end
		function scrollbar.btnUp:Paint(w, h)
			draw.RoundedBox(3, 5, 0, 0, 0, Color(36, 39, 44, 0))
		end
		function scrollbar.btnDown:Paint(w, h)
			draw.RoundedBox(3, 5, 0, 0, 0, Color(36, 39, 44, 0))
		end
		function scrollbar.btnGrip:Paint(w, h)
			draw.RoundedBox(3, 5, 0, 0, 0, Color(36, 39, 44, 0))
		end

		SmoothCommandPanelPoxY = 0
		for k,v in pairs(Categories) do

			local CategoriesTitle = vgui.Create("DLabel", scroll)
			CategoriesTitle:SizeToContents()
			CategoriesTitle:SetPos(5, SmoothCommandPanelPoxY)
			CategoriesTitle:SetColor(Color(255,255,255,255))
			CategoriesTitle:SetText( "  "..v.name )
			CategoriesTitle:SetWide( SmoothCommandDPanel:GetWide()-10 )
			CategoriesTitle:SetFont( "SmoothF4menuFontButton" )
			CategoriesTitle:SetTall(35)
			CategoriesTitle.Paint = function()
				draw.RoundedBox( 0, 0, 0, CategoriesTitle:GetWide(), CategoriesTitle:GetTall() , Color(41, 41, 41,100) )
				surface.SetDrawColor( 47, 47, 47,150 )
				surface.DrawOutlinedRect(0,0,CategoriesTitle:GetWide(), CategoriesTitle:GetTall() )
			end
			CategoriesTitle.Think = function() CategoriesTitle:SetWide( SmoothCommandDPanel:GetWide()-10 ) end

			SmoothCommandPanelPoxY = SmoothCommandPanelPoxY + 40

			for d,c in pairs(v.Table) do

				local ButtonComamndClick = vgui.Create("DButton", scroll)
				ButtonComamndClick:SetSize( SmoothCommandDPanel:GetWide()-35, 35 )
				ButtonComamndClick:SetPos( 30 , SmoothCommandPanelPoxY )
				ButtonComamndClick:SetColor( Color( 255, 255, 255 ))
				ButtonComamndClick:SetFont("SmoothF4menuFontButton")
				ButtonComamndClick:SetText(c.NAME)
				ButtonComamndClick.Paint = function( )
					draw.RoundedBox( 0, 0, 0, ButtonComamndClick:GetWide(), ButtonComamndClick:GetTall() , Color(41, 41, 41,100) )
					surface.SetDrawColor( 47, 47, 47,150 )
					surface.DrawOutlinedRect(0,0,ButtonComamndClick:GetWide(), ButtonComamndClick:GetTall() )
					if ButtonComamndClick.isHover then
						draw.RoundedBox( 0, 0, 0, ButtonComamndClick:GetWide(), ButtonComamndClick:GetTall() , Color(41, 41, 41,70) )
					end
				end
				ButtonComamndClick.OnCursorEntered = function()
					ButtonComamndClick.isHover = true
				end
				ButtonComamndClick.OnCursorExited = function()
					ButtonComamndClick.isHover = false
				end
				ButtonComamndClick.DoClick = function()
					c.FUNC()
				end
				ButtonComamndClick.Think = function()
					ButtonComamndClick:SetSize( SmoothCommandDPanel:GetWide()-35, 35 )
				end

				SmoothCommandPanelPoxY = SmoothCommandPanelPoxY + 40

			end
		end

end
vgui.Register( "SmoothCommandPanel", PANEL, "Panel" )

function OpenTextBox(text1,text2,cmd)
	Derma_StringRequest(
		text1,
		text2,
		"",
		function( text ) RunConsoleCommand( "say", cmd.." "..text ) end,
		function( text ) end
	 )
end

function OpenPlyReasonBox(text1,text2,text3,cmd)
	local menu = DermaMenu()
	for k,v in pairs(player.GetAll()) do
		menu:AddOption(v:Name(),function() 
			Derma_StringRequest(
				text1,
				text3,
				"",
				function( text ) RunConsoleCommand( "say", cmd.." "..v:Name().." "..text ) end,
				function( text ) end
			 )
		end)
	end
	menu:Open()
end

function OpenPlyBox(text1,text2,cmd)
	local menu = DermaMenu()
	for k,v in pairs(player.GetAll()) do
		menu:AddOption(v:Name(),function() 
			RunConsoleCommand( "say", cmd.." "..v:Name() )
		end)
	end
	menu:Open()
end

/*------------------------------------------------------------------------
Donation for leaks

Qiwi Wallet         4890494419811120 
YandexMoney         410013095053302
WebMoney(WMR)       R235985364414
WebMoney(WMZ)       Z309855690994
------------------------------------------------------------------------*/