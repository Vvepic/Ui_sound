/*----------------------------------------------------------------------
Leak by Famouse

Play good games:↓
http://store.steampowered.com/curator/32364216

Subscribe to the channel:↓
www.youtube.com/c/Famouse

More leaks in the discord:↓ 
https://discord.gg/rFdQwzm
------------------------------------------------------------------------*/

local PANEL = {}
function PANEL:Init()

	SmoothJobsDPanel = vgui.Create( "DPanel", SmoothF4MenuFrame )
	SmoothJobsDPanel:SetPos( 50, 35 )
	SmoothJobsDPanel:SetSize( 950, 615 )
	SmoothJobsDPanel.Paint = function() end

		SmoothJobsDPanelScroll = vgui.Create( "DPanel", SmoothJobsDPanel )
		SmoothJobsDPanelScroll:SetPos( 0, 0 )
		SmoothJobsDPanelScroll:SetSize( 1000, 615  )
		SmoothJobsDPanelScroll.Paint = function()
			draw.RoundedBox( 0, 0, 0, 685, 660 , Color(255,255,255,0) )
		end

		local scroll = vgui.Create("DScrollPanel", SmoothJobsDPanelScroll)
		scroll:SetSize(1000, 615)
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

		SmoothJobsDPanelPosX = 0
		for k, v in pairs( RPExtraTeams ) do

			local colorchange = string.Explode(" ",tostring(v.color))

				local playerplayjob = 0
				local playerjob = v.command
				local maxjobs = v.max
				for d,c in pairs(player.GetAll()) do
					local jobtableplay = c:getJobTable()
					if playerjob == jobtableplay.command then
						playerplayjob = playerplayjob + 1
					end
				end

			SmoothJobsMain = vgui.Create( "DPanel", scroll )
			SmoothJobsMain:SetPos( 0,SmoothJobsDPanelPosX )
			SmoothJobsMain:SetSize( 950, 60 )
			SmoothJobsMain.Paint = function()
				draw.RoundedBox( 0, 0, 0, SmoothJobsMain:GetWide(), SmoothJobsMain:GetTall() , Color(colorchange[1],colorchange[2],colorchange[3],60) )
				draw.SimpleText(v.name,"SmoothF4menuFontButton",75,20,Color(255,255,255))
				draw.RoundedBox( 0,0, 0, 60, 60 , Color(41, 41, 41,70) )

				draw.SimpleText(playerplayjob.."/"..maxjobs,"SmoothF4menuFontButton",SmoothJobsDPanel:GetWide()-80,20,Color(255,255,255),TEXT_ALIGN_CENTER)

				if v.vip then 
					draw.SimpleText("[VIP]","SmoothF4menuFontButton",SmoothJobsDPanel:GetWide()-150,20,Color(255,255,255))
				end
			end

				if type( v.model ) == "table" then
					model = table.Random( v.model )
				else
					model = v.model
				end

					local jobsModel = vgui.Create( "SpawnIcon", SmoothJobsMain )
					jobsModel:SetSize( 56, 56 )
					jobsModel:SetPos( 5, 2 )
					jobsModel:SetModel( model )

						local JobsSelect = vgui.Create("DButton", SmoothJobsMain)
						JobsSelect:SetSize( 890,60 )
						JobsSelect:SetPos( 60,0 )
						JobsSelect:SetColor( Color( 255, 255, 255 ))
						JobsSelect:SetFont("SmoothF4menuFontButton")
						JobsSelect:SetText("")
						JobsSelect.Paint = function(panel)
							if JobsSelect.isHover then
								draw.RoundedBox( 0,0, 0, JobsSelect:GetWide(), 60 , Color(41, 41, 41,50) )
							end
						end
						JobsSelect.OnCursorEntered = function()
							JobsSelect.isHover = true
						end
						JobsSelect.OnCursorExited = function()
							JobsSelect.isHover = false
						end
						JobsSelect.DoClick = function()
							if v.vip then 
								if table.HasValue(SmoothF4MenuFrame_VipGroup,LocalPlayer():GetUserGroup()) then
									if v.vote then
										RunCmd("/vote"..v.command)
										SmoothF4MenuFrame:Close()
									else
										RunCmd("/"..v.command)
										SmoothF4MenuFrame:Close()
									end
								else
									notification.AddLegacy(SmoothF4MenuFrame_ErrorVip,NOTIFY_ERROR,2)
								end
							else
								if v.vote then
									RunCmd("/vote"..v.command)
									SmoothF4MenuFrame:Close()
								else
									RunCmd("/"..v.command)
									SmoothF4MenuFrame:Close()
								end
							end
						end

						local JobsInfoScresiption = vgui.Create("DButton", SmoothJobsMain)
						JobsInfoScresiption:SetSize( 55,60 )
						JobsInfoScresiption:SetPos( SmoothJobsDPanel:GetWide()-55,0 )
						JobsInfoScresiption:SetColor( Color( 255, 255, 255 ))
						JobsInfoScresiption:SetFont("SmoothF4menuFontButton")
						JobsInfoScresiption:SetText("")
						JobsInfoScresiption.Paint = function(panel)
							local menuicon = Material( "materials/icons/info.png" )
							surface.SetMaterial( menuicon )	
							if JobsInfoScresiption.isHover then
								draw.RoundedBox( 0,0, 0, 55, 60 , Color(41, 41, 41,50) )
							end
							surface.SetDrawColor( 255, 255, 255, 255 )
							surface.DrawTexturedRect(13,15,30,30 )
						end
						JobsInfoScresiption.Think = function()
							JobsInfoScresiption:SetPos( SmoothJobsDPanel:GetWide()-55,0 )
						end
						JobsInfoScresiption.OnCursorEntered = function()
							JobsInfoScresiption.isHover = true
						end
						JobsInfoScresiption.OnCursorExited = function()
							JobsInfoScresiption.isHover = false
						end
						JobsInfoScresiption.DoClick = function()
							SmoothJobsDescription(v.description,v.name,v.salary)
						end

			SmoothJobsDPanelPosX = SmoothJobsDPanelPosX + 60
		end

end
vgui.Register( "SmoothJobsPanel", PANEL, "Panel" )

function SmoothJobsDescription(textdescription,name,salary)

	SmoothJobsMainDEscription = vgui.Create( "DPanel", SmoothJobsDPanel)
	SmoothJobsMainDEscription:SetPos( SmoothJobsDPanel:GetWide(),0 )
	SmoothJobsMainDEscription:SetSize( SmoothJobsDPanel:GetWide(), 615 )
	SmoothJobsMainDEscription.Paint = function()
		draw.RoundedBox( 0,0, 0, SmoothJobsDPanel:GetWide(), 615 , Color(41, 41, 41,150) )
	end
	SmoothJobsMainDEscription.Think = function()
		if IsValid(SmoothJobsMainDEscription) then
			SmoothJobsMainDEscription:SetSize( SmoothJobsDPanel:GetWide(), 615 )
		end
	end

			local JobsInfoScresiptionCloseDPanel = vgui.Create("DButton", SmoothJobsMainDEscription)
			JobsInfoScresiptionCloseDPanel:SetSize( 55,60 )
			JobsInfoScresiptionCloseDPanel:SetPos( 0,0 )
			JobsInfoScresiptionCloseDPanel:SetColor( Color( 255, 255, 255 ))
			JobsInfoScresiptionCloseDPanel:SetFont("SmoothF4menuFontButton")
			JobsInfoScresiptionCloseDPanel:SetText("")
			JobsInfoScresiptionCloseDPanel.Paint = function(panel)
				local menuicon = Material( "materials/icons/back.png" )
				surface.SetMaterial( menuicon )	
				if JobsInfoScresiptionCloseDPanel.isHover then
					surface.SetDrawColor( 200, 200, 200, 255 )
				else
					surface.SetDrawColor( 255, 255, 255, 255 )
				end
				surface.DrawTexturedRect(15,20,32,32 )
			end
			JobsInfoScresiptionCloseDPanel.OnCursorEntered = function()
				JobsInfoScresiptionCloseDPanel.isHover = true
			end
			JobsInfoScresiptionCloseDPanel.OnCursorExited = function()
				JobsInfoScresiptionCloseDPanel.isHover = false
			end
			JobsInfoScresiptionCloseDPanel.DoClick = function()
				SmoothJobsMainDEscription:MoveTo(SmoothJobsDPanel:GetWide(),0,0.3,0,-1)
				SmoothJobsDPanelScroll:MoveTo(0,0,0.3,0,-1)
				timer.Simple(0.3,function()
					SmoothJobsMainDEscription:Remove()
				end)
			end

			local DescriptionJobs = vgui.Create("DTextEntry", SmoothJobsMainDEscription)
			DescriptionJobs:SizeToContents()
			DescriptionJobs:SetPos(15, 65)
			DescriptionJobs:SetTextColor(Color(255,255,255,255))
			DescriptionJobs:SetMultiline( true )
			DescriptionJobs:SetEditable( false )
			DescriptionJobs:SetFont("SmoothF4menuFontButton")
			DescriptionJobs:SetWrap( true )
			DescriptionJobs:SetText( SmoothF4MenuFrame_DescriptionJobs..": \n\n"..name.."\n"..SmoothF4MenuFrame_DescriptionSalary..": "..salary..SmoothF4MenuFrame_Money.."\n\n"..textdescription )
			DescriptionJobs:SetDrawBorder(false)
			DescriptionJobs:SetDrawBackground(false)
			DescriptionJobs:SetSize(SmoothJobsMainDEscription:GetWide()-15,550) 
			DescriptionJobs.Think = function()
				DescriptionJobs:SetSize(SmoothJobsMainDEscription:GetWide()-15,550) 
			end

	SmoothJobsMainDEscription:MoveTo(0,0,0.3,0,-1)
	SmoothJobsDPanelScroll:MoveTo(-1000,0,0.3,0,-1)

end

/*------------------------------------------------------------------------
Donation for leaks

Qiwi Wallet         4890494419811120 
YandexMoney         410013095053302
WebMoney(WMR)       R235985364414
WebMoney(WMZ)       Z309855690994
------------------------------------------------------------------------*/