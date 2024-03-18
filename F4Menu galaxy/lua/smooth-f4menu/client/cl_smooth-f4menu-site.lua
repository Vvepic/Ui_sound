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

	SmoothSiteDPanel = vgui.Create( "DPanel", SmoothF4MenuFrame )
	SmoothSiteDPanel:SetPos( 50, 35 )
	SmoothSiteDPanel:SetSize( 950, 615 )
	SmoothSiteDPanel.Paint = function() 
		draw.SimpleText(SmoothF4MenuFrame_Loading,"SmoothF4menuFontButton",SmoothSiteDPanel:GetWide()/2,SmoothSiteDPanel:GetTall()/2,Color(255,255,255),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
	end

	local SmoothOpenHtml = vgui.Create( "HTML", SmoothSiteDPanel )
	SmoothOpenHtml:SetSize(SmoothSiteDPanel:GetWide()-10,605)
	SmoothOpenHtml:SetPos(5,0)
	SmoothOpenHtml:OpenURL( SmoothF4MenuFrame_SiteURL )
	SmoothOpenHtml.Think = function()
		SmoothOpenHtml:SetSize(SmoothSiteDPanel:GetWide()-10,605)
	end

end
vgui.Register( "SmoothSitePanel", PANEL, "Panel" )




local PANEL = {}
function PANEL:Init()

	SmoothDonateDPanel = vgui.Create( "DPanel", SmoothF4MenuFrame )
	SmoothDonateDPanel:SetPos( 50, 35 )
	SmoothDonateDPanel:SetSize( 950, 615 )
	SmoothDonateDPanel.Paint = function() 
		draw.SimpleText(SmoothF4MenuFrame_Loading,"SmoothF4menuFontButton",SmoothDonateDPanel:GetWide()/2,SmoothDonateDPanel:GetTall()/2,Color(255,255,255),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
	end

	local SmoothOpenHtml = vgui.Create( "HTML", SmoothDonateDPanel )
	SmoothOpenHtml:SetSize(SmoothDonateDPanel:GetWide()-10,605)
	SmoothOpenHtml:SetPos(5,0)
	SmoothOpenHtml:OpenURL( SmoothF4MenuFrame_DonateURL )
	SmoothOpenHtml.Think = function()
		SmoothOpenHtml:SetSize(SmoothDonateDPanel:GetWide()-10,605)
	end

end
vgui.Register( "SmoothDonatePanel", PANEL, "Panel" )

/*------------------------------------------------------------------------
Donation for leaks

Qiwi Wallet         4890494419811120 
YandexMoney         410013095053302
WebMoney(WMR)       R235985364414
WebMoney(WMZ)       Z309855690994
------------------------------------------------------------------------*/