-- RayBoard Owner: 76561198111476713
-- RayBoard Version: 3.1.2.5

if engine.ActiveGamemode() != "terrortown" then return end

local GetTranslation = LANG.GetTranslation

local th = 40 * RayUI.Scale
local m = th * 0.25
local m5 = m * 0.5

function RayBoard:TagsPanel(parent, p, list, tall)
	local tags = {
		{txt = "sb_tag_friend",		color = Color(0, 255, 0)},
		{txt = "sb_tag_susp",		color = Color(255, 255, 0)},
		{txt = "sb_tag_avoid",		color = Color(255, 140, 0)},
		{txt = "sb_tag_kill",		color = Color(255, 0, 0)},
		{txt = "sb_tag_miss",		color = Color(0, 255, 180)}
	}

	local TagButtons = {}
	for k, tag in ipairs(tags) do
		TagButtons[k] = vgui.Create("DButton", parent)
		TagButtons[k]:Dock(LEFT)
		TagButtons[k]:DockMargin(4, 0, 0, 0)
		TagButtons[k]:SetWide(70 * RayUI.Scale)
		TagButtons[k]:SetText(GetTranslation(tags[k].txt))
		TagButtons[k]:SetFont("RayUI:Small")
		TagButtons[k]:SetTextColor(tags[k].color)
		TagButtons[k]:SetPaintBackground( false )
		TagButtons[k].DoClick = function()
			parent:SizeTo(-1, parent:GetTall() - tall, RayBoard.AnimSpeed)
			list:SizeTo(-1, list:GetTall() - tall, RayBoard.AnimSpeed)
			if p.sb_tag and p.sb_tag.txt == tag.txt then
				p.sb_tag = nil				
			else
				p.sb_tag = tag
			end
		end
	end
end

function RayBoard:SearchPanel(parent, p)
	local List = vgui.Create("DPanelSelect", parent)
	List:EnableHorizontal(true)
	List:Dock(FILL)
	List:DockMargin(10, 10, 10, 10)
	List:SetPaintBackground(false)
	if List.VBar then
		List.VBar:Remove()
		List.VBar = nil
	end

	local Scroll = vgui.Create("DHorizontalScroller", List)
	Scroll:StretchToParent(3,3,3,3)
	Scroll:Dock(FILL)

	local Help = vgui.Create("DLabel", List)
	Help:SetText(GetTranslation("sb_info_help"))
	Help:SetFont("RayUI:Small")
	Help:Dock(FILL)
	Help:SetVisible(false)

	if ScoreGroup(p) == GROUP_NOTFOUND or ScoreGroup(p) != GROUP_TERROR and !p.search_result then
		Help:SetVisible(true)
	end

	if Search != p.search_result then
		List:Clear(true)
		Scroll.Panels = {}

		local search_raw = p.search_result
		local search = PreprocSearch(search_raw)
		-- 76561198111476713
		search.nick = nil

		for t, info in SortedPairsByMemberValue(search, "p") do
			local ic = nil

			if t == "lastid" then
				ic = vgui.Create("SimpleIconAvatar", List)
				ic:SetPlayer(info.ply)
				ic:SetAvatarSize(24)
			elseif t == "dtime" then
				ic = vgui.Create("SimpleIconLabelled", List)
				ic:SetIconText(info.text_icon)
			else
				ic = vgui.Create("SimpleIcon", List)
			end

			ic:SetIconSize(64)
			ic:SetIcon(info.img)
			ic:SetTooltip(info.text)
			ic.info_type = t

			List:AddPanel(ic)
			Scroll:AddPanel(ic)
			Help:SetVisible(false)
		end
	end
end