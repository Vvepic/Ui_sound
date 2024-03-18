/*----------------------------------------------------------------------
Leak by Famouse

Play good games:↓
store.steampowered.com/curator/32364216

Subscribe to the channel:↓
https://www.youtube.com/c/Famouse

More leaks in the discord:↓ 
discord.gg/rFdQwzm
------------------------------------------------------------------------*/

local PANEL = {}
function PANEL:Init()

	SmoothTitleDPanel = vgui.Create( "DPanel", SmoothF4MenuFrame )
	SmoothTitleDPanel:SetPos( 50, 35 )
	SmoothTitleDPanel:SetSize( 950, 615 )
	SmoothTitleDPanel.Paint = function() 

	end

		SmoothPanelInfoServer = vgui.Create( "DPanel", SmoothTitleDPanel )
		SmoothPanelInfoServer:SetPos( 5, 5 )
		SmoothPanelInfoServer:SetSize( SmoothTitleDPanel:GetWide()-10, 70 )
		SmoothPanelInfoServer.Paint = function() 
			draw.RoundedBox( 0, 0, 0, SmoothPanelInfoServer:GetWide(), SmoothPanelInfoServer:GetTall() , Color(47, 47, 47,150) )
			surface.SetDrawColor( 47, 47, 47,150 )
			surface.DrawOutlinedRect(0,0,SmoothPanelInfoServer:GetWide(), SmoothPanelInfoServer:GetTall())

			draw.SimpleText(SmoothF4MenuFrame_NameServer,"SmoothF4menuFont1",29,2,Color(255,255,255))
			draw.RoundedBox( 2, 5, 35, SmoothPanelInfoServer:GetWide()-14, 2 , Color(255,255,255) )

			local menuicon = Material( "materials/icons/database.png" )
			surface.SetMaterial( menuicon )
			surface.SetDrawColor( 255, 255, 255, 255 )
			surface.DrawTexturedRect(5,7,22,22 )

			local onlineplayer = 0
			for k,v in pairs(player.GetAll()) do onlineplayer = onlineplayer + 1 end

			draw.SimpleText(SmoothF4MenuFrame_OnlinePlayer..": "..onlineplayer,"SmoothF4menuFontButton",30,43,Color(255,255,255))

			local menuicon = Material( "materials/icons/user.png" )
			surface.SetMaterial( menuicon )
			surface.SetDrawColor( 255, 255, 255, 255 )
			surface.DrawTexturedRect(9,46,15,15 )
		end
		SmoothPanelInfoServer.Think = function() SmoothPanelInfoServer:SetSize( SmoothTitleDPanel:GetWide()-10, 70 ) end

			SmoothPanelInfoPlayer = vgui.Create( "DPanel", SmoothTitleDPanel )
			SmoothPanelInfoPlayer:SetPos( 5, 80 )
			SmoothPanelInfoPlayer:SetSize( SmoothTitleDPanel:GetWide()-10, 85 )
			SmoothPanelInfoPlayer.Paint = function() 
				draw.RoundedBox( 0, 0, 0, SmoothPanelInfoPlayer:GetWide(), SmoothPanelInfoPlayer:GetTall() , Color(47, 47, 47,150) )
				surface.SetDrawColor( 47, 47, 47,150 )
				surface.DrawOutlinedRect(0,0,SmoothPanelInfoPlayer:GetWide(), SmoothPanelInfoPlayer:GetTall())

				draw.SimpleText(LocalPlayer():Name(),"SmoothF4menuFont1",90,3,Color(255,255,255))
				draw.RoundedBox( 2, 91, 35, SmoothPanelInfoPlayer:GetWide()-100, 2 , Color(255,255,255) )

				draw.SimpleText(SmoothF4MenuFrame_TMoney..": "..LocalPlayer():getDarkRPVar("money")..SmoothF4MenuFrame_Money,"SmoothF4menuFontButton",90,40,Color(255,255,255))
				draw.SimpleText(SmoothF4MenuFrame_Group..": "..LocalPlayer():GetUserGroup(),"SmoothF4menuFontButton",90,59,Color(255,255,255))
			end
			SmoothPanelInfoPlayer.Think = function() SmoothPanelInfoPlayer:SetSize( SmoothTitleDPanel:GetWide()-10, 85 ) end

			local Avatar = vgui.Create( "AvatarImage", SmoothPanelInfoPlayer )
			Avatar:SetSize( 75, 75 )
			Avatar:SetPos( 5, 5 )
			Avatar:SetPlayer( LocalPlayer(), 128 )

				SmoothPanelStaffOnline = vgui.Create( "DPanel", SmoothTitleDPanel )
				SmoothPanelStaffOnline:SetPos( 5, 170 )
				SmoothPanelStaffOnline:SetSize( 300, 440 )
				SmoothPanelStaffOnline.Paint = function() 
					draw.RoundedBox( 0, 0, 0, SmoothPanelStaffOnline:GetWide(), SmoothPanelStaffOnline:GetTall() , Color(47, 47, 47,150) )
					surface.SetDrawColor( 47, 47, 47,150 )
					surface.DrawOutlinedRect(0,0,SmoothPanelStaffOnline:GetWide(), SmoothPanelStaffOnline:GetTall())

					draw.SimpleText(SmoothF4MenuFrame_TStaffOnline,"SmoothF4menuFont1",5,3,Color(255,255,255))
					draw.RoundedBox( 2, 5, 35, 290, 2 , Color(255,255,255) )

				end
				SmoothPanelStaffOnline.Think = function() SmoothPanelStaffOnline:SetSize( 300, 440 ) end

				SmoothStaffPosY = 34
				SmoothStaffPosYNumber = 0
				for k,v in pairs(player.GetAll()) do
					if SmoothStaffPosYNumber < 17 then
						if table.HasValue(SmoothF4MenuFrame_StaffOnline,v:GetUserGroup()) then
							local SmoothStaffLabel = vgui.Create("DLabel", SmoothPanelStaffOnline)
							SmoothStaffLabel:SetPos(5, SmoothStaffPosY)
							SmoothStaffLabel:SetColor(Color(255,255,255,255))
							SmoothStaffLabel:SetText( "" )
							SmoothStaffLabel:SetWide( 290 )
							SmoothStaffLabel:SetFont( "SmoothF4menuFontButton" )
							SmoothStaffLabel:SetTall(100)
							SmoothStaffLabel.Paint = function()
								draw.SimpleText(v:Name().." - "..v:GetUserGroup(),"SmoothF4menuFontButton",0,6,Color(255,255,255))
							end
							SmoothStaffPosYNumber = SmoothStaffPosYNumber + 1
							SmoothStaffPosY = SmoothStaffPosY + 23.5
						end
					end
				end

					SmoothPanelRules = vgui.Create( "DPanel", SmoothTitleDPanel )
					SmoothPanelRules:SetPos( 310, 170 )
					SmoothPanelRules:SetSize( SmoothTitleDPanel:GetWide()-310, 440 )
					SmoothPanelRules.Paint = function() 
						draw.RoundedBox( 0, 0, 0, SmoothPanelRules:GetWide(), SmoothPanelRules:GetTall() , Color(47, 47, 47,150) )
						surface.SetDrawColor( 47, 47, 47,150 )
						surface.DrawOutlinedRect(0,0,SmoothPanelRules:GetWide(), SmoothPanelRules:GetTall())

						draw.SimpleText(SmoothF4MenuFrame_RulesTitle,"SmoothF4menuFont1",5,3,Color(255,255,255))
						draw.RoundedBox( 2, 5, 35, SmoothTitleDPanel:GetWide()-330, 2 , Color(255,255,255) )

					end
					SmoothPanelRules.Think = function() SmoothPanelRules:SetSize( SmoothTitleDPanel:GetWide()-315, 440 ) end

						local SmoothStaffLabel = vgui.Create("DLabel", SmoothPanelRules)
						SmoothStaffLabel:SetPos(10, 45)
						SmoothStaffLabel:SetColor(Color(255,255,255,255))
						SmoothStaffLabel:SetText( "" )
						SmoothStaffLabel:SetWide( SmoothPanelRules:GetWide()-20 )
						SmoothStaffLabel:SetFont( "SmoothF4menuFontButton" )
						SmoothStaffLabel:SetTall(1)
						SmoothStaffLabel.Paint = function()	end
						SmoothStaffLabel.Think = function()
							rulestext = ""
							for k,v in pairs(DarkRP.getLaws()) do
								rulestext = rulestext..v.."\n"
							end
							rulestext = DarkRP.textWrap(rulestext, "DarkRPHUD1", SmoothPanelRules:GetWide()-20)
							rulestextexp = string.Explode("\n",rulestext)

							SmoothStaffLabel:SetText( rulestext )
							SmoothStaffLabel:SetTall(#rulestextexp*20)
						end


end
vgui.Register( "SmoothTitlePanel", PANEL, "Panel" )

/*------------------------------------------------------------------------
Donation for leaks

Qiwi Wallet         4890494419811120 
YandexMoney         410013095053302
WebMoney(WMR)       R235985364414
WebMoney(WMZ)       Z309855690994
------------------------------------------------------------------------*/