/*----------------------------------------------------------------------
Leak by Famouse

Play good games:↓
http://store.steampowered.com/curator/32364216

Subscribe to the channel:↓
www.youtube.com/c/Famouse

More leaks in the discord:↓ 
https://discord.gg/rFdQwzm
------------------------------------------------------------------------*/

util.AddNetworkString( "OpenSmoothF4menu" )

function OpenSmoothF4menu( ply )
	net.Start("OpenSmoothF4menu")
	net.Send(ply)
end
hook.Add("ShowSpare2", "OpenSmoothF4menu", OpenSmoothF4menu)

/*------------------------------------------------------------------------
Donation for leaks

Qiwi Wallet         4890494419811120 
YandexMoney         410013095053302
WebMoney(WMR)       R235985364414
WebMoney(WMZ)       Z309855690994
------------------------------------------------------------------------*/