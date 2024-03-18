-- RayBoard Owner: 76561198111476713
-- RayBoard Version: 3.1.2.5

util.AddNetworkString( "RayBoard:FakeIdentityToServer" )
util.AddNetworkString( "RayBoard:FakeIdentityToClient" )
util.AddNetworkString( "RayBoard:RemoveFakeIdentityToServer" )
util.AddNetworkString( "RayBoard:RemoveFakeIdentityToClient" )
util.AddNetworkString( "RayBoard.HideID:Server" )
util.AddNetworkString( "RayBoard.HideID:Client" )

local FakeID = {}

net.Receive( "RayBoard:FakeIdentityToServer", function( len, ply )
    local FakeNick = net.ReadString()
    local FakeRank = net.ReadString()
    local AvatarURL = net.ReadString()

    FakeID[ply] = {FakeNick, FakeRank, AvatarURL}

    net.Start( "RayBoard:FakeIdentityToClient" )
        net.WriteTable(FakeID)
         net.WriteEntity(ply)
    net.Broadcast()
end )

net.Receive( "RayBoard:RemoveFakeIdentityToServer", function( len, ply )
    net.Start( "RayBoard:RemoveFakeIdentityToClient" )
        net.WriteEntity(ply)

        FakeID[ply] = nil
    net.Broadcast()
end )

hook.Add( "PlayerInitialSpawn", "FullLoadSetup", function( ply )
	hook.Add( "SetupMove", ply, function( self, ply, _, cmd )
		if self == ply and not cmd:IsForced() then
            net.Start( "RayBoard:FakeIdentityToClient" )
                net.WriteTable(FakeID)
            net.Broadcast() 


			hook.Run( "PlayerFullLoad", self )
			hook.Remove( "SetupMove", self )
		end
	end )
end )

net.Receive( "RayBoard.HideID:Server", function( len, ply )
    local Hide = net.ReadBool()

    net.Start( "RayBoard.HideID:Client" )
        net.WriteEntity(ply)
        net.WriteBool(Hide)
    net.Broadcast()
end )