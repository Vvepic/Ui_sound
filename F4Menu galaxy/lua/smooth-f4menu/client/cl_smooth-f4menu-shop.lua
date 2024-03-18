/*----------------------------------------------------------------------
Leak by Famouse

Play good games:↓
store.steampowered.com/curator/32364216

Subscribe to the channel:↓
https://www.youtube.com/c/Famouse

More leaks in the discord:↓ 
https://discord.gg/rFdQwzm
------------------------------------------------------------------------*/

local PANEL = {}
function PANEL:Init()

	SmoothShopDPanel = vgui.Create( "DPanel", SmoothF4MenuFrame )
	SmoothShopDPanel:SetPos( 50, 40 )
	SmoothShopDPanel:SetSize( 950, 605 )
	SmoothShopDPanel.Paint = function() end

		SmoothShopDPanelScroll = vgui.Create( "DPanel", SmoothShopDPanel )
		SmoothShopDPanelScroll:SetPos( 0, 0 )
		SmoothShopDPanelScroll:SetSize( 1000, 605  )
		SmoothShopDPanelScroll.Paint = function()
			draw.RoundedBox( 0, 0, 0, 685, 660 , Color(255,255,255,0) )
		end

		local scroll = vgui.Create("DScrollPanel", SmoothShopDPanelScroll)
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

		SmoothShopDPanelPosX = 0

			local EntityTitle = vgui.Create("DLabel", scroll)
			EntityTitle:SizeToContents()
			EntityTitle:SetPos(5, 0)
			EntityTitle:SetColor(Color(255,255,255,255))
			EntityTitle:SetText( "  "..SmoothF4MenuFrame_Entities )
			EntityTitle:SetWide( SmoothShopDPanel:GetWide()-10 )
			EntityTitle:SetFont( "SmoothF4menuFontButton" )
			EntityTitle:SetTall(35)
			EntityTitle.Paint = function()
				draw.RoundedBox( 0, 0, 0, EntityTitle:GetWide(), EntityTitle:GetTall() , Color(41, 41, 41,100) )
				surface.SetDrawColor( 47, 47, 47,150 )
				surface.DrawOutlinedRect(0,0,EntityTitle:GetWide(), EntityTitle:GetTall() )
			end
			EntityTitle.Think = function() EntityTitle:SetWide( SmoothShopDPanel:GetWide()-10 ) end

			SmoothShopDPanelPosX = SmoothShopDPanelPosX + 40
			DarkRPEntitiesCount = 0
			for k,v in pairs(DarkRPEntities) do
				local canbuy = false
				if v.allowed then
					if istable(v.allowed) then
						if table.HasValue(v.allowed,LocalPlayer():Team()) then
							canbuy = true
						end
					elseif v.allowed == LocalPlayer():Team() then
						canbuy = true
					end
				else
					canbuy = true
				end
				if canbuy then
					DarkRPEntitiesCount = DarkRPEntitiesCount + 1
					
					EnitytMain = vgui.Create( "DPanel", scroll )
					EnitytMain:SetPos( 30,SmoothShopDPanelPosX)
					EnitytMain:SetSize( SmoothShopDPanel:GetWide()-35, 50 )
					EnitytMain.Paint = function()
						draw.RoundedBox( 0, 0, 0, EnitytMain:GetWide(), EnitytMain:GetTall() , Color(41, 41, 41,100) )
						surface.SetDrawColor( 47, 47, 47,150 )
						surface.DrawOutlinedRect(0,0,EnitytMain:GetWide(), EnitytMain:GetTall() )

						if v.vip then
							draw.SimpleText("[VIP]","SmoothF4menuFontButton",EnitytMain:GetWide()-55,15,Color(255,255,255))
						end
					end
					EnitytMain.Think = function()
						if IsValid(EnitytMain) then
							EnitytMain:SetSize( SmoothShopDPanel:GetWide()-35, 50 )
						end
					end

						local entModel = vgui.Create( "SpawnIcon", EnitytMain )
						entModel:SetSize( 50, 48 )
						entModel:SetPos( 5, 1 )
						entModel:SetModel( v.model )

							local EnitytItem = vgui.Create("DLabel", EnitytMain)
							EnitytItem:SizeToContents()
							EnitytItem:SetPos(75, 5)
							EnitytItem:SetColor(Color(255,255,255,255))
							EnitytItem:SetText( v.name )
							EnitytItem:SetWide( 500 )
							EnitytItem:SetFont( "SmoothF4menuFontButton" )
							EnitytItem:SetTall(20)

							local EnitytCost = vgui.Create("DLabel", EnitytMain)
							EnitytCost:SizeToContents()
							EnitytCost:SetPos(75, 26)
							EnitytCost:SetColor(Color(255,255,255,255))
							EnitytCost:SetText( SmoothF4MenuFrame_Money..v.price )
							EnitytCost:SetWide( 500 )
							EnitytCost:SetFont( "SmoothF4menuFontButton" )
							EnitytCost:SetTall(20)

								local EnitytBuy = vgui.Create("DButton", EnitytMain)
								EnitytBuy:SetSize( EnitytMain:GetWide(), 50 )
								EnitytBuy:SetPos( 0 , 0 )
								EnitytBuy:SetColor( Color( 255, 255, 255 ))
								EnitytBuy:SetFont("SmoothF4menuFontButton")
								EnitytBuy:SetText("")
								EnitytBuy.Paint = function( )
									if EnitytBuy.isHover then
										draw.RoundedBox( 0, 0, 0, EnitytMain:GetWide(), EnitytMain:GetTall() , Color(41, 41, 41,70) )
									end
								end
								EnitytBuy.OnCursorEntered = function()
									EnitytBuy.isHover = true
								end
								EnitytBuy.OnCursorExited = function()
									EnitytBuy.isHover = false
								end
								EnitytBuy.DoClick = function()
									if v.vip then
										if table.HasValue(SmoothF4MenuFrame_VipEntity,LocalPlayer():GetUserGroup()) then
											RunEntCmd(v.cmd)
										else
											notification.AddLegacy(SmoothF4MenuFrame_ErrorVip,NOTIFY_ERROR,2)
										end
									else
										RunEntCmd(v.cmd)
									end
								end

					SmoothShopDPanelPosX = SmoothShopDPanelPosX + 55
				end
			end
			if DarkRPEntitiesCount == 0 then if IsValid(EntityTitle) then EntityTitle:Remove() SmoothShopDPanelPosX = SmoothShopDPanelPosX - 40 end end

			if SmoothF4MenuFrame_EnableWeapon then
				local WeaponTitle = vgui.Create("DLabel", scroll)
				WeaponTitle:SizeToContents()
				WeaponTitle:SetPos(5, SmoothShopDPanelPosX)
				WeaponTitle:SetColor(Color(255,255,255,255))
				WeaponTitle:SetText( "  "..SmoothF4MenuFrame_Weapon )
				WeaponTitle:SetWide( SmoothShopDPanel:GetWide()-10 )
				WeaponTitle:SetFont( "SmoothF4menuFontButton" )
				WeaponTitle:SetTall(35)
				WeaponTitle.Paint = function()
					draw.RoundedBox( 0, 0, 0, WeaponTitle:GetWide(), WeaponTitle:GetTall() , Color(41, 41, 41,100) )
					surface.SetDrawColor( 47, 47, 47,150 )
					surface.DrawOutlinedRect(0,0,WeaponTitle:GetWide(), WeaponTitle:GetTall() )
				end
				WeaponTitle.Think = function() WeaponTitle:SetWide( SmoothShopDPanel:GetWide()-10 ) end

				SmoothShopDPanelPosX = SmoothShopDPanelPosX + 40
				CustomShipmentsCount = 0
				for k,v in pairs(CustomShipments) do
					if (v.seperate and (not GAMEMODE.Config.restrictbuypistol or
						(GAMEMODE.Config.restrictbuypistol and (not v.allowed[1] or table.HasValue(v.allowed, LocalPlayer():Team())))))
						and (not v.customCheck or v.customCheck and v.customCheck(LocalPlayer())) then
							CustomShipmentsCount = CustomShipmentsCount + 1

							WeaponMain = vgui.Create( "DPanel", scroll )
							WeaponMain:SetPos( 30,SmoothShopDPanelPosX)
							WeaponMain:SetSize( SmoothShopDPanel:GetWide()-35, 50 )
							WeaponMain.Paint = function()
								draw.RoundedBox( 0, 0, 0, EnitytMain:GetWide(), EnitytMain:GetTall() , Color(41, 41, 41,100) )
								surface.SetDrawColor( 47, 47, 47,150 )
								surface.DrawOutlinedRect(0,0,EnitytMain:GetWide(), EnitytMain:GetTall() )

								draw.SimpleText("х1","SmoothF4menuFontButton",WeaponMain:GetWide()-44,15,Color(255,255,255))

								if v.vip then
									draw.SimpleText("[VIP]","SmoothF4menuFontButton",EnitytMain:GetWide()-110,15,Color(255,255,255))
								end
							end
							WeaponMain.Think = function()
								if IsValid(WeaponMain) then
									WeaponMain:SetSize( SmoothShopDPanel:GetWide()-35, 50 )
								end
							end

							local entModel = vgui.Create( "SpawnIcon", WeaponMain )
							entModel:SetSize( 50, 48 )
							entModel:SetPos( 5, 1 )
							entModel:SetModel( v.model )

							local WeaponItem = vgui.Create("DLabel", WeaponMain)
							WeaponItem:SizeToContents()
							WeaponItem:SetPos(75, 5)
							WeaponItem:SetColor(Color(255,255,255,255))
							WeaponItem:SetText( v.name )
							WeaponItem:SetWide( 250 )
							WeaponItem:SetFont( "SmoothF4menuFontButton" )
							WeaponItem:SetTall(20)

							local WeaponCost = vgui.Create("DLabel", WeaponMain)
							WeaponCost:SizeToContents()
							WeaponCost:SetPos(75, 26)
							WeaponCost:SetColor(Color(255,255,255,255))
							WeaponCost:SetText( SmoothF4MenuFrame_Money..v.pricesep )
							WeaponCost:SetWide( 150 )
							WeaponCost:SetFont( "SmoothF4menuFontButton" )
							WeaponCost:SetTall(20)

							local WeaponBuy = vgui.Create("DButton", WeaponMain)
							WeaponBuy:SetSize( WeaponMain:GetWide(), 50 )
							WeaponBuy:SetPos( 0 , 0 )
							WeaponBuy:SetColor( Color( 255, 255, 255 ))
							WeaponBuy:SetFont("SmoothF4menuFontButton")
							WeaponBuy:SetText("")
							WeaponBuy.Paint = function( )
								if WeaponBuy.isHover then
									draw.RoundedBox( 0, 0, 0, EnitytMain:GetWide(), EnitytMain:GetTall() , Color(41, 41, 41,70) )
								end
							end
							WeaponBuy.OnCursorEntered = function()
								WeaponBuy.isHover = true
							end
							WeaponBuy.OnCursorExited = function()
								WeaponBuy.isHover = false
							end
							WeaponBuy.DoClick = function()
								if v.vip then
									if table.HasValue(SmoothF4MenuFrame_VipWeapon,LocalPlayer():GetUserGroup()) then
										RunEntCmd("buy "..v.name)
									else
										notification.AddLegacy(SmoothF4MenuFrame_ErrorVip,NOTIFY_ERROR,2)
									end
								else
									RunEntCmd("buy "..v.name)
								end
							end

							SmoothShopDPanelPosX = SmoothShopDPanelPosX + 55
					end
				end
				if CustomShipmentsCount == 0 then if IsValid(WeaponTitle) then WeaponTitle:Remove() SmoothShopDPanelPosX = SmoothShopDPanelPosX - 40 end end
			end

			if SmoothF4MenuFrame_EnableShipments then
				local ShipMentsTitle = vgui.Create("DLabel", scroll)
				ShipMentsTitle:SizeToContents()
				ShipMentsTitle:SetPos(5, SmoothShopDPanelPosX)
				ShipMentsTitle:SetColor(Color(255,255,255,255))
				ShipMentsTitle:SetText( "  "..SmoothF4MenuFrame_Shipments )
				ShipMentsTitle:SetWide( SmoothShopDPanel:GetWide()-10 )
				ShipMentsTitle:SetFont( "SmoothF4menuFontButton" )
				ShipMentsTitle:SetTall(35)
				ShipMentsTitle.Paint = function()
					draw.RoundedBox( 0, 0, 0, ShipMentsTitle:GetWide(), ShipMentsTitle:GetTall() , Color(41, 41, 41,100) )
					surface.SetDrawColor( 47, 47, 47,150 )
					surface.DrawOutlinedRect(0,0,ShipMentsTitle:GetWide(), ShipMentsTitle:GetTall() )
				end
				ShipMentsTitle.Think = function() ShipMentsTitle:SetWide( SmoothShopDPanel:GetWide()-10 ) end

				SmoothShopDPanelPosX = SmoothShopDPanelPosX + 40
				CustomShipmentsShipments = 0
				for k,v in pairs(CustomShipments) do
					if !v.noship and table.HasValue(v.allowed, LocalPlayer():Team())
			            and (not v.customCheck or (v.customCheck and v.customCheck(LocalPlayer()))) then
			            	CustomShipmentsShipments = CustomShipmentsShipments + 1

							ShipmentsMain = vgui.Create( "DPanel", scroll )
							ShipmentsMain:SetPos( 30,SmoothShopDPanelPosX)
							ShipmentsMain:SetSize( SmoothShopDPanel:GetWide()-35, 50 )
							ShipmentsMain.Paint = function()
								draw.RoundedBox( 0, 0, 0, EnitytMain:GetWide(), EnitytMain:GetTall() , Color(41, 41, 41,100) )
								surface.SetDrawColor( 47, 47, 47,150 )
								surface.DrawOutlinedRect(0,0,EnitytMain:GetWide(), EnitytMain:GetTall() )

								draw.SimpleText("х"..v.amount,"SmoothF4menuFontButton",ShipmentsMain:GetWide()-50,15,Color(255,255,255))

								if v.vip then
									draw.SimpleText("[VIP]","SmoothF4menuFontButton",EnitytMain:GetWide()-110,15,Color(255,255,255))
								end
							end
							ShipmentsMain.Think = function()
								if IsValid(ShipmentsMain) then
									ShipmentsMain:SetSize( SmoothShopDPanel:GetWide()-35, 50 )
								end
							end

							local entModel = vgui.Create( "SpawnIcon", ShipmentsMain )
							entModel:SetSize( 50, 48 )
							entModel:SetPos( 5, 1 )
							entModel:SetModel( v.model )

							local ShipmentsItem = vgui.Create("DLabel", ShipmentsMain)
							ShipmentsItem:SizeToContents()
							ShipmentsItem:SetPos(75, 5)
							ShipmentsItem:SetColor(Color(255,255,255,255))
							ShipmentsItem:SetText( v.name )
							ShipmentsItem:SetWide( 250 )
							ShipmentsItem:SetFont( "SmoothF4menuFontButton" )
							ShipmentsItem:SetTall(20)

							local ShipmentsCost = vgui.Create("DLabel", ShipmentsMain)
							ShipmentsCost:SizeToContents()
							ShipmentsCost:SetPos(75, 26)
							ShipmentsCost:SetColor(Color(255,255,255,255))
							ShipmentsCost:SetText( SmoothF4MenuFrame_Money..v.price )
							ShipmentsCost:SetWide( 150 )
							ShipmentsCost:SetFont( "SmoothF4menuFontButton" )
							ShipmentsCost:SetTall(20)

							local ShipmentsBuy = vgui.Create("DButton", ShipmentsMain)
							ShipmentsBuy:SetSize( ShipmentsMain:GetWide(), 50 )
							ShipmentsBuy:SetPos( 0 , 0 )
							ShipmentsBuy:SetColor( Color( 255, 255, 255 ))
							ShipmentsBuy:SetFont("SmoothF4menuFontButton")
							ShipmentsBuy:SetText("")
							ShipmentsBuy.Paint = function( )
								if ShipmentsBuy.isHover then
									draw.RoundedBox( 0, 0, 0, EnitytMain:GetWide(), EnitytMain:GetTall() , Color(41, 41, 41,70) )
								end
							end
							ShipmentsBuy.OnCursorEntered = function()
								ShipmentsBuy.isHover = true
							end
							ShipmentsBuy.OnCursorExited = function()
								ShipmentsBuy.isHover = false
							end
							ShipmentsBuy.DoClick = function()
								if v.vip then
									if table.HasValue(SmoothF4MenuFrame_VipShipments,LocalPlayer():GetUserGroup()) then
										RunEntCmd("buyshipment "..v.name)
									else
										notification.AddLegacy(SmoothF4MenuFrame_ErrorVip,NOTIFY_ERROR,2)
									end
								else
									RunEntCmd("buyshipment "..v.name)
								end
							end

							SmoothShopDPanelPosX = SmoothShopDPanelPosX + 55
					end
				end
				if CustomShipmentsShipments == 0 then if IsValid(ShipMentsTitle) then ShipMentsTitle:Remove() SmoothShopDPanelPosX = SmoothShopDPanelPosX - 40 end end
			end

			if SmoothF4MenuFrame_EnableAmmo then
				local AmmoTitle = vgui.Create("DLabel", scroll)
				AmmoTitle:SizeToContents()
				AmmoTitle:SetPos(5, SmoothShopDPanelPosX)
				AmmoTitle:SetColor(Color(255,255,255,255))
				AmmoTitle:SetText( "  "..SmoothF4MenuFrame_Ammo )
				AmmoTitle:SetWide( SmoothShopDPanel:GetWide()-10 )
				AmmoTitle:SetFont( "SmoothF4menuFontButton" )
				AmmoTitle:SetTall(35)
				AmmoTitle.Paint = function()
					draw.RoundedBox( 0, 0, 0, AmmoTitle:GetWide(), AmmoTitle:GetTall() , Color(41, 41, 41,100) )
					surface.SetDrawColor( 47, 47, 47,150 )
					surface.DrawOutlinedRect(0,0,AmmoTitle:GetWide(), AmmoTitle:GetTall() )
				end
				AmmoTitle.Think = function() AmmoTitle:SetWide( SmoothShopDPanel:GetWide()-10 ) end

				SmoothShopDPanelPosX = SmoothShopDPanelPosX + 40
				CustomAmmoAmmo = 0
				for k,v in pairs(GAMEMODE.AmmoTypes) do
			            	CustomAmmoAmmo = CustomAmmoAmmo + 1

							AmmoMain = vgui.Create( "DPanel", scroll )
							AmmoMain:SetPos( 30,SmoothShopDPanelPosX)
							AmmoMain:SetSize( SmoothShopDPanel:GetWide()-35, 50 )
							AmmoMain.Paint = function()
								draw.RoundedBox( 0, 0, 0, AmmoMain:GetWide(), AmmoMain:GetTall() , Color(41, 41, 41,100) )
								surface.SetDrawColor( 47, 47, 47,150 )
								surface.DrawOutlinedRect(0,0,AmmoMain:GetWide(), AmmoMain:GetTall() )

								draw.SimpleText("х"..v.amountGiven,"SmoothF4menuFontButton",AmmoMain:GetWide()-47,15,Color(255,255,255))
							end
							AmmoMain.Think = function()
								if IsValid(AmmoMain) then
									AmmoMain:SetSize( SmoothShopDPanel:GetWide()-35, 50 )
								end
							end

							local entModel = vgui.Create( "SpawnIcon", AmmoMain )
							entModel:SetSize( 50, 48 )
							entModel:SetPos( 5, 1 )
							entModel:SetModel( v.model )

							local AmmoItem = vgui.Create("DLabel", AmmoMain)
							AmmoItem:SizeToContents()
							AmmoItem:SetPos(75, 5)
							AmmoItem:SetColor(Color(255,255,255,255))
							AmmoItem:SetText( v.name )
							AmmoItem:SetWide( 250 )
							AmmoItem:SetFont( "SmoothF4menuFontButton" )
							AmmoItem:SetTall(20)

							local AmmoCost = vgui.Create("DLabel", AmmoMain)
							AmmoCost:SizeToContents()
							AmmoCost:SetPos(75, 26)
							AmmoCost:SetColor(Color(255,255,255,255))
							AmmoCost:SetText( SmoothF4MenuFrame_Money..v.price )
							AmmoCost:SetWide( 150 )
							AmmoCost:SetFont( "SmoothF4menuFontButton" )
							AmmoCost:SetTall(20)

							local AmmoBuy = vgui.Create("DButton", AmmoMain)
							AmmoBuy:SetSize( AmmoMain:GetWide(), 50 )
							AmmoBuy:SetPos( 0 , 0 )
							AmmoBuy:SetColor( Color( 255, 255, 255 ))
							AmmoBuy:SetFont("SmoothF4menuFontButton")
							AmmoBuy:SetText("")
							AmmoBuy.Paint = function( )
								if AmmoBuy.isHover then
									draw.RoundedBox( 0, 0, 0, AmmoMain:GetWide(), AmmoMain:GetTall() , Color(41, 41, 41,70) )
								end
							end
							AmmoBuy.OnCursorEntered = function()
								AmmoBuy.isHover = true
							end
							AmmoBuy.OnCursorExited = function()
								AmmoBuy.isHover = false
							end
							AmmoBuy.DoClick = function()
								RunEntCmd( "buyammo "..v.ammoType )
							end

							SmoothShopDPanelPosX = SmoothShopDPanelPosX + 55
					end
				if CustomAmmoAmmo == 0 then if IsValid(AmmoTitle) then AmmoTitle:Remove() end end
			end

end
vgui.Register( "SmoothShopPanel", PANEL, "Panel" )

/*------------------------------------------------------------------------
Donation for leaks

Qiwi Wallet         4890494419811120 
YandexMoney         410013095053302
WebMoney(WMR)       R235985364414
WebMoney(WMZ)       Z309855690994
------------------------------------------------------------------------*/