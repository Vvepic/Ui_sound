if CLIENT then
    killicon.Add( "arccw_apex_nade_frag", "VGUI/apex_nade_killicon_frag", Color(251, 85, 25, 255))
    SWEP.WepSelectIcon = surface.GetTextureID("VGUI/apex_nade_frag")
end

SWEP.Base = "arccw_apex_nade_base"
SWEP.Spawnable = true -- this obviously has to be set to true
SWEP.Category = "ArcCW - Apex Legends" -- edit this if you like
SWEP.AdminOnly = false

SWEP.PrintName = "Frag Grenade"
SWEP.Trivia_Class = "Hand Grenade"
SWEP.Trivia_Desc = "Standard explosive ordnance with a timed fuse and a large blast radius.\nDespite being the same model, these grenades cannot be cooked like the ones used by Pilots. Perhaps it is simply a difference in skill."

SWEP.Slot = 4

SWEP.CamAttachment = 3

SWEP.NotForNPCs = true

SWEP.UseHands = true

SWEP.ViewModel = "models/weapons/c_apex_nade_frag.mdl"
SWEP.WorldModel = "models/weapons/w_apex_nade_frag.mdl"
-- SWEP.MirrorVMWM = true
-- SWEP.WorldModelOffset = {
    -- pos = Vector(3, 2, -1),
    -- ang = Angle(-10, 0, 180)
-- }

SWEP.Firemodes = {
    {
        Mode = 1,
        PrintName = "fcg.nade",
    },
}

SWEP.FuseTime = 3.5
SWEP.Apex_Balance = {
    [2] = {
        FuseTime = 3
    },
}



SWEP.Primary.Ammo = "grenade"

SWEP.Primary.ClipSize = 1

SWEP.MuzzleVelocity = 1300
SWEP.MuzzleVelocityAlt = 500
SWEP.ShootEntity = "arccw_apex_thr_frag"

SWEP.PullPinTime = 0.5

SWEP.ViewModelFOV = 70

SWEP.AttachmentElements = {
    ["skin_1"] = {
        VMSkin = 3,
        WMSkin = 3,
        NameChange = "Frag Grenade Mod.",
    },
    ["skin_2"] = {
        VMSkin = 1,
        WMSkin = 1,
        NameChange = "Firecracker",
    },
    ["skin_3"] = {
        VMSkin = 2,
        WMSkin = 2,
        NameChange = "Arc Grenade",
    },
}

SWEP.Attachments = {
    {
        PrintName = "Payload",
        DefaultAttName = "Frag",
        DefaultAttIcon = Material("entities/arccw_apex_nade_frag.png", "mips smooth"),
        Slot = {"apex_nade"},
    }
}

SWEP.Animations = {
    ["idle"] = {
        Source = "idle",
    },
    ["idle_sprint"] = {Source = "sprint", Mult = 0.9},
    ["enter_sprint"] = {Source = "sprint_in", Mult = 0.1},
    ["exit_sprint"] = {Source = "sprint_out", Mult = 0.1},
    ["ready"] = {
        Source = "draw",
        SoundTable = {
           {s = "ArcCW_APEX.Frag.Draw", t = 0 / 30},
        },
    },
    ["draw"] = {
        Source = "draw",
        SoundTable = {
            {s = "ArcCW_APEX.Frag.Draw", t = 0 / 30},
        },
    },
    ["holster"] = {
        Source = "holster",
        SoundTable = {
            {s = "ArcCW_APEX.Frag.Holster", t = 0 / 30}
        },
    },
    ["pre_throw"] = {
        Source = "pullpin",
        SoundTable = {
            {s = "ArcCW_APEX.Frag.PreThrow", t = 0 / 30},
        },
        MinProgress = 0.5,
    },
    ["fire"] = {
        Source = "pullpin",
        SoundTable = {
            {s = "ArcCW_APEX.Frag.PreThrow", t = 0 / 30},
        },
    },
    ["throw"] = {
        Source = {"toss_overhead"},
        TPAnim = ACT_HL2MP_GESTURE_RANGE_ATTACK_GRENADE,
        SoundTable = {
            {s = "ArcCW_APEX.Frag.Throw", t = 0 / 30}
        },
    },
    ["throw_alt"] = {
        Source = {"underhand"},
        TPAnim = ACT_HL2MP_GESTURE_RANGE_ATTACK_GRENADE,
        SoundTable = {
            {s = "ArcCW_APEX.Frag.Throw", t = 0 / 30}
        },
    },
    ["bash"] = {
        Source = {"melee"},
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 0.6,
        LHIKEaseOut = 0.4,
        SoundTable = {
            {s = "ArcCW_APEX.Melee.Swing.Punch", t = 0 / 30},
    },
    },
    ["enter_inspect"] = {
        Source = "inspect_in",
        LHIK = true,
    },
    ["exit_inspect"] = {
        Source = "inspect_out",
        LHIK = true,
    },
    ["idle_inspect"] = {
        Source = "inspect",
        LHIK = true,
    },
}

SWEP.TTTWeaponType = {"weapon_zm_molotov", "weapon_ttt_confgrenade", "weapon_ttt_smokegrenade"}
SWEP.TTTWeight = 100