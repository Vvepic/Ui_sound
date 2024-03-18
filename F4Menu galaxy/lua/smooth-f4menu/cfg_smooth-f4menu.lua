/*----------------------------------------------------------------------
Leak by Famouse

Play good games:↓
store.steampowered.com/curator/32364216

Subscribe to the channel:↓
https://www.youtube.com/c/Famouse

More leaks in the discord:↓ 
discord.gg/rFdQwzm
------------------------------------------------------------------------*/

-- TITLE NAME SERVER
SmoothF4MenuFrame_NameServer = "Название сервера"

-- LANGUAGE MENU
SmoothF4MenuFrame_NameServer_Home = "Домой"
SmoothF4MenuFrame_NameServer_Jobs = "Работы"
SmoothF4MenuFrame_NameServer_Shop = "Магазин"
SmoothF4MenuFrame_NameServer_Command = "Команды"
SmoothF4MenuFrame_NameServer_Site = "Сайт"
SmoothF4MenuFrame_DescriptionJobs = "Описание"
SmoothF4MenuFrame_DescriptionSalary = "Зарплата"
SmoothF4MenuFrame_Entities = "Предметы"
SmoothF4MenuFrame_Weapon = "Оружия"
SmoothF4MenuFrame_Shipments = "Ящики"
SmoothF4MenuFrame_Ammo = "Патроны"
SmoothF4MenuFrame_TMoney = "Деньги"
SmoothF4MenuFrame_Group = "Группа"
SmoothF4MenuFrame_OnlinePlayer = "Онлайн игроков"
SmoothF4MenuFrame_TStaffOnline = "Админы онлайн"
SmoothF4MenuFrame_RulesTitle = "Правила"
SmoothF4MenuFrame_Loading = "Загрузка..."
SmoothF4MenuFrame_ErrorVip = "Ты не имеешь прав!"

-- MONEY
SmoothF4MenuFrame_Money = "$"

-- ENABLE WEAPON ?
SmoothF4MenuFrame_EnableWeapon = true

-- ENABLE SHIPMENTS ?
SmoothF4MenuFrame_EnableShipments = true

-- ENABLE AMMO ?
SmoothF4MenuFrame_EnableAmmo = true

-- SITE URL
SmoothF4MenuFrame_SiteURL = "wiki.garrysmod.com"
SmoothF4MenuFrame_DonateURL = "wiki.garrysmod.com"

-- STAFF ONLINE
SmoothF4MenuFrame_StaffOnline = {"superadmin","owner","vip","admin"}

-- RULES
SmoothF4MenuFrame_TRules = {
	"Text 1 ...",
	"Text 2 ...",
	"Text 3 ...",
	"Text 4 ...",
}

-- VIP JOBS,WEAPON,SHIPMENTS,ENTITY
SmoothF4MenuFrame_VipGroup = {"superadmin","owner","vip","admin"}
SmoothF4MenuFrame_VipWeapon = {"superadmin","owner","vip","admin"}
SmoothF4MenuFrame_VipShipments = {"superadmin","owner","vip","admin"}
SmoothF4MenuFrame_VipEntity = {"superadmin","owner","vip","admin"}


-- COMMAND
MONEYCMD_BUTTONS = {}
RPCMD_BUTTONS = {}
CPCMD_BUTTONS = {}
MAYORCMD_BUTTONS = {}
Categories = {}
table.insert( Categories, { name = "Деньги", Table = MONEYCMD_BUTTONS } )
table.insert( Categories, { name = "Игрок", Table = RPCMD_BUTTONS } )
table.insert( Categories, { name = "Полиция", Table = CPCMD_BUTTONS } )
table.insert( Categories, { name = "Мэр", Table = MAYORCMD_BUTTONS } )
local function MenuAddMButton( n, f )
    table.insert(MONEYCMD_BUTTONS, { NAME = n, FUNC = f } )
end
local function MenuAddRPButton( n, f )
    table.insert(RPCMD_BUTTONS, { NAME = n, FUNC = f } )
end
local function MenuAddCPButton( n, f )
    table.insert(CPCMD_BUTTONS, { NAME = n, FUNC = f } )
end
local function MenuAddMayorButton( n, f )
    table.insert(MAYORCMD_BUTTONS, { NAME = n, FUNC = f } )
end
MenuAddMButton( "Дать денег игроку", function() OpenTextBox( "Дать денег", "Сколько?", "/give" ) end )
MenuAddMButton( "Скинуть деньги", function() OpenTextBox( "Скинуть деньги", "Сколько?", "/moneydrop" ) end )
MenuAddRPButton( "Выбросить оружие", function() RunConsoleCommand( "say", "/dropweapon" ) end )
MenuAddRPButton( "Запросить лицензию", function() RunConsoleCommand( "say", "/requestlicense" ) end )
MenuAddRPButton( "Уволить игрока", function() OpenPlyReasonBox( "Уволить игрока", "Какого игрока вы хотите уволить?", "Причина увольнения?", "/demote" ) end )
MenuAddRPButton( "Продать все двери", function() RunConsoleCommand( "say", "/unownalldoors" ) end )

MenuAddCPButton( "Подать игрока в розыск", function() OpenPlyReasonBox( "Подать игрока в розыск", "Какого игрока вы хотите подать в розыск?", "Причина розыска?", "/wanted" ) end )
MenuAddCPButton( "Снять с игрока розыск", function() OpenPlyBox( "Снять с игрока розыск", "С какого игрока вы хотите снять розыск?", "/unwanted" ) end )
MenuAddCPButton( "Ордер на обыск игрока", function() OpenPlyReasonBox( "Ордер на обыск игрока", "На кого вы хотите подать ордер?", "Причина ордера?", "/warrant" ) end )

MenuAddMayorButton( "Розыскивать игрока", function() OpenPlyReasonBox( "Розыскивать игрока", "Какого игрока вы хотите подать в розыск?", "Причина розыска?", "/wanted" ) end )
MenuAddMayorButton( "Снять с игрока розыск", function() OpenPlyBox( "Снять с игрока розыск", "С какого игрока вы хотите снять розыск", "/unwanted" ) end )
MenuAddMayorButton( "Ордер на обыск игрока", function() OpenPlyReasonBox( "Ордер на обыск игрока", "На кого вы хотите подать ордер?", "Причина ордера?", "/warrant" ) end )
MenuAddMayorButton( "Дать лицензию", function() RunConsoleCommand( "say", "/givelicense" ) end )
MenuAddMayorButton( "Объявить ком.час", function() RunConsoleCommand( "say", "/lockdown" ) end )
MenuAddMayorButton( "Завершить ком.час", function() RunConsoleCommand( "say", "/unlockdown" ) end )
MenuAddMayorButton( "Добавить правило", function() OpenTextBox( "Добавить правило", "Какое новое правило вы хотите добавить?", "/addlaw" ) end )
MenuAddMayorButton( "Убрать правило", function() OpenTextBox( "Убрать правило", "Номер правила?", "/removelaw" ) end )


/*------------------------------------------------------------------------
Donation for leaks

Qiwi Wallet         4890494419811120 
YandexMoney         410013095053302
WebMoney(WMR)       R235985364414
WebMoney(WMZ)       Z309855690994
------------------------------------------------------------------------*/