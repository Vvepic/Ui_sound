if CLIENT then
    killicon.Add( "arccw_apex_re45", "VGUI/apex_killicon_re45", Color(251, 85, 25, 255))
    SWEP.WepSelectIcon = surface.GetTextureID("VGUI/apex_re45")
end

SWEP.Base = "arccw_apex_base"
SWEP.Spawnable = true -- this obviously has to be set to true
SWEP.Category = "ArcCW - Apex Legends" -- edit this if you like
SWEP.AdminOnly = false

SWEP.PrintName = "RE-45 Auto"
SWEP.Trivia_Class = "Pistol"
SWEP.Trivia_Desc = "Full-auto pistol."
SWEP.Trivia_Manufacturer = "Paradinha Arsenal"

SWEP.Slot = 1

SWEP.CrouchPos = Vector(-4.5, -2, 1.5)
SWEP.CrouchAng = Angle(1.569, 0.88, -50.458)

SWEP.SprintPos = Vector(0, 0, 0)
SWEP.SprintAng = Angle(0, 0, 0)

SWEP.ActivePos = Vector(0, -2, 1)
SWEP.ActiveAng = Angle(0, 0, 0)

SWEP.CustomizePos = Vector(0, 0, 0)
SWEP.CustomizeAng = Angle(0 , 0, 0)

SWEP.BarrelOffsetSighted = Vector(0, 0, -1)
SWEP.BarrelOffsetHip = Vector(2, 0, -2)

SWEP.NPCWeaponType = "weapon_pistol"
SWEP.NPCWeight = 250

SWEP.UseHands = true

SWEP.ViewModel = "models/weapons/c_apex_re45.mdl"
SWEP.WorldModel = "models/weapons/w_apex_re45.mdl"
SWEP.MirrorVMWM = false
SWEP.WorldModelOffset = {
    pos = Vector(4.5, 1.5, 2.25),
    ang = Angle(-10, 0, 180),
    bone = "ValveBiped.Bip01_R_Hand",
    scale = 1
}

SWEP.ViewModelFOV = 70

SWEP.Damage = 12
SWEP.DamageMin = 12
SWEP.Range = 50
SWEP.Penetration = 5
SWEP.PhysBulletMuzzleVelocity = 19500 * ArcCW.HUToM

SWEP.BodyDamageMults = {
    [HITGROUP_HEAD] = 1.5,
    [HITGROUP_CHEST] = 1,
    [HITGROUP_STOMACH] = 1,
    [HITGROUP_LEFTARM] = 1,
    [HITGROUP_RIGHTARM] = 1,
    [HITGROUP_LEFTLEG] = 0.9,
    [HITGROUP_RIGHTLEG] = 0.9,
}

SWEP.Apex_Balance = {
    [1] = {
        Damage = 19,
        DamageMin = 12,
    },
    [2] = {
        Damage = 10, -- roughly equivalent to TTT glock
        DamageMin = 10,
    },
}

SWEP.ChamberSize = 0
SWEP.Primary.ClipSize = 16 -- DefaultClip is automatically set.
SWEP.MaxRecoilBlowback = 1

SWEP.Recoil = 0.35
SWEP.RecoilSide = 0.4
SWEP.RecoilRise = 0.1
SWEP.RecoilPunch = 2.5
SWEP.RecoilVMShake = 0.1

SWEP.Delay = 60 / 780 -- 60 / RPM.
SWEP.Num = 1 -- number of shots per trigger pull.

SWEP.Firemodes = {
    {
        Mode = 2,
    }
}

SWEP.AccuracyMOA = 15
SWEP.HipDispersion = 200
SWEP.MoveDispersion = 150
SWEP.JumpDispersion = 300

SWEP.SightedSpeedMult = 0.9

SWEP.Primary.Ammo = "apex_light"

SWEP.ShootVol = 120 -- volume of shoot sound
SWEP.ShootPitch = 101 -- pitch of shoot sound


SWEP.FirstShootSound = "ArcCW_APEX.RE45.Fire_Start"
SWEP.ShootSound = "ArcCW_APEX.RE45.Fire"
SWEP.ShootDrySound = "ArcCW_APEX.Pistol_Dry_A"
SWEP.FirstShootSoundSilenced = "ArcCW_APEX.RE45.Fire_Start"
SWEP.ShootSoundSilenced = "ArcCW_APEX.RE45.Fire"

SWEP.DistantShootSound = ""

SWEP.Tracer = "arccw_apex_tracer_pistol"
SWEP.TracerNum = 1 -- tracer every X
SWEP.TracerWidth = 3

SWEP.MuzzleEffect = "tfa_apex_muzzle_pistol"
SWEP.ShellModel = "models/shells/shelleject_pistol.mdl"
SWEP.ShellPitch = 100
SWEP.ShellScale = 1.25
SWEP.ShellTime = 1

SWEP.MuzzleEffectAttachment = 1 -- which attachment to put the muzzle on
SWEP.CaseEffectAttachment = 2 -- which attachment to put the case effect on
SWEP.CamAttachment = 3

SWEP.BarrelLength = 5

SWEP.ProceduralRegularFire = false
SWEP.ProceduralIronFire = false

SWEP.CaseBones = {}

SWEP.IronSightStruct = {
    Pos = Vector(0, 4, 0),
    Ang = Angle(0, 0, 0),
    Magnification = 1.1,
        Midpoint = { -- Where the gun should be at the middle of it's irons
        Pos = Vector(0, 0, 0),
        Ang = Angle(0, 0, 0),
    },
}

SWEP.HoldtypeHolstered = "normal"
SWEP.HoldtypeActive = "pistol"
SWEP.HoldtypeSights = "revolver"

SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_SMG1

SWEP.AttachmentElements = {
    ["ref_sights"] = {
        VMBodygroups = {
            {ind = 1, bg = 1},
        },
    },
    ["weapon_dot"] = {
        VMBodygroups = {
            {ind = 2, bg = 1},
        },
    },
    ["skin"] = {
        VMSkin = 1,
        WMSkin = 1,
    },
}

SWEP.GuaranteeLaser = true
SWEP.Attachments = {
    {
        PrintName = "Optic",
        DefaultAttName = "Iron Sights",
        Slot = "apex_sights", -- what kind of attachments can fit here, can be string or table
        Bone = "ja_ads_attachment", -- relevant bone any attachments will be mostly referring to
        Offset = {
            vpos = Vector(0, 0, 0), -- offset that the attachment will be relative to the bone
            vang = Angle(90, 0, -90),
            wpos = Vector(6.3, 1.5, -4.70),
            wang = Angle(-10, 0, 180)
        },
        InstalledEles = {"ref_sights", "weapon_dot"},
        ExtraSightDist = 1,
        CorrectivePos = Vector(1.33,0,-0.55),
        CorrectiveAng = Angle(1.045, -0.682, 1.999)
    },
    {
        PrintName = "Muzzle",
        Slot = {"apex_muzzle", "apex_muzzle_pistols"},
        Bone = "def_c_suppressor",
        Offset = {
            vpos = Vector(0, 0, 0),
            vang = Angle(90, 0, -90),
            wpos = Vector(12.2, 1.5, -5.2),
            wang = Angle(-10, 0, 180)
        },
    },
    {
        PrintName = "Magazine",
        Slot = {"apex_mag_light2"}
    },
    {
        PrintName = "Hop-up",
        Slot = {"apex_hopup_qdraw", "apex_hopup_hp2", "apex_hopup_shatter2","apex_hopup_disruptor2"}
    },
    {
        PrintName = "Skin",
        Slot = {"skin_apex"},
        DefaultAttName = "Default",
        FreeSlot = true
    },
    {
        PrintName = "Charm",
        Slot = "charm",
        FreeSlot = true,
        Bone = "def_c_bolt", -- relevant bone any attachments will be mostly referring to
        Offset = {
            vpos = Vector(0.5, 0, -4), -- offset that the attachment will be relative to the bone
            vang = Angle(90, 0, -90),
            wpos = Vector(3, 2.1, -3.8),
            wang = Angle(-10, 0, 180)
        },
		VMScale = Vector(0.2, 0.2, 0.2),
		WMScale = Vector(0.3, 0.3, 0.3),
    },
    {
        PrintName = "Stats",
        Slot = {"killcounter2","killcounter"},
        FreeSlot = true,
        Bone = "def_c_base", -- relevant bone any attachments will be mostly referring to
        Offset = {
            vpos = Vector(0.7, -3.4, 3), -- offset that the attachment will be relative to the bone
            vang = Angle(90, 0, -90),
            wpos = Vector(5, 2.15, -3.8),
            wang = Angle(-10, 0, 180)
        },
		VMScale = Vector(1, 1, 1),
		WMScale = Vector(1, 1, 1),
    },
}

SWEP.Animations = {
    ["idle"] = {
        Source = "idle",
    },
    ["idle_sprint"] = {Source = "sprint", Mult = 0.9},
    ["enter_sprint"] = {Source = "sprint_in", Mult = 1},
    ["exit_sprint"] = {Source = "sprint_out", Mult = 1},
    ["ready"] = {
        Source = "draw_first",
        SoundTable = {
            {p = 100, s = "weapons/p2020/smartpistol_reload_slideback_st_01.ogg", t = 10 / 30},
            {p = 100, s = "weapons/p2020/smartpistol_reload_slideforward_st_01.ogg", t = 18 / 30}
        },
    },
    ["draw"] = {
        Source = "draw",
        Mult = 0.8,
    },
    ["holster"] = {
        Source = "holster",
        Mult = 0.8,
    },
    ["idle_iron"] = {
        Source = "iron_idle",
    },
    ["fire"] = {
        Source = {"fire", "fire2"},
        ShellEjectAt = 0,
    },
    ["enter_sight"] = {
        Source = "iron_in",
    },
    ["fire_sight"] = {
        Source = "iron_fire",
        ShellEjectAt = 0,
    },
    ["exit_sight"] = {
        Source = "iron_out",
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
        LHIKIn = 0,
        LHIKOut = 0.6,
        LHIKEaseOut = 0.4,
    },
    ["exit_inspect"] = {
        Source = "inspect_out",
        SoundTable = {
            {p = 100, s = "weapons/foley/Weapon_Inspect_Foley_Pistol_End_V1_2ch_01.wav", t = 20 / 30},
    },
    },
    ["idle_inspect"] = {
        Source = "inspect",
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 0.6,
        LHIKEaseOut = 0.4,
        SoundTable = {
            {p = 100, s = "weapons/re45/WPN_RE45Auto_Inspect_GunFoley_2ch_V1__01.ogg", t = 0 / 30},
            {p = 100, s = "weapons/re45/WPN_RE45Auto_Inspect_GunSlide_Open_2ch_V1_01.ogg", t = 169 / 30},
            {p = 100, s = "weapons/re45/WPN_RE45Auto_Inspect_GunSlide_Close_2ch_V1_01.ogg", t = 212 / 30},
            {p = 100, s = "weapons/re45/Weapon_Inspect_Foley_Pistol_End_V1_2ch_01.ogg", t = 229 / 30},

            {p = 100, s = "weapons/foley/Weapon_Inspect_Foley_Pistol_Start_V1_2ch_01.wav", t = 1 / 30},
            {p = 100, s = "weapons/foley/Weapon_Inspect_Foley_Pistol_Mid_V1_2ch_01.wav", t = 96 / 30},
            {p = 100, s = "weapons/foley/Weapon_Inspect_Foley_Pistol_Mid_V1_2ch_02.wav", t = 240 / 30},
            {p = 100, s = "weapons/foley/Weapon_Inspect_Foley_Pistol_End_V1_2ch_01.wav", t = 316 / 30}
        },
    },
    ["reload"] = {
        Source = "reload",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_PISTOL,
        LHIK = true,
        LHIKIn = 0.2,
        LHIKOut = 0.4,
        LHIKEaseOut = 0.2,
        MinProgress = 60 / 40,
        SoundTable = {
            {p = 100, s = "weapons/re45/wpn_re45_reload_magpull_fr4_2ch_v1_01.ogg", t = 4 / 30},
            {p = 100, s = "weapons/re45/Wpn_RE45_Reload_MagInsert_fr28_2ch_v2_01.ogg", t = 28 / 30},
            {p = 100, s = "weapons/re45/Wpn_RE45_Reload_MagPat_fr35_2ch_v2_02.ogg", t = 37 / 30},
            {p = 100, s = "weapons/re45/wpn_re45_reload_handrest_fr40_2ch_v1_01.ogg", t = 40 / 30}
        },
    },
    ["reload_empty"] = {
        Source = "reload_empty",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_PISTOL,
        LHIK = true,
        LHIKIn = 0.2,
        LHIKOut = 0.5,
        LHIKEaseOut = 0.2,
        MinProgress = 97 / 40,
        SoundTable = {
            {p = 100, s = "weapons/re45/wpn_re45_emptyreload_magpull_fr4_2ch_v1_01.ogg", t = 4 / 30},
            {p = 100, s = "weapons/re45/Wpn_RE45_EmptyReload_MagInsert_fr27_2ch_v2_01.ogg", t = 27 / 30},
            {p = 100, s = "weapons/re45/Wpn_RE45_Reload_MagPat_fr35_2ch_v2_02.ogg", t = 37 / 30},
            {p = 100, s = "weapons/re45/wpn_re45_emptyreload_boltback_fr47_2ch_v1_01.ogg", t = 47 / 30},
            {p = 100, s = "weapons/re45/wpn_re45_emptyreload_boltfront_fr50_2ch_v1_02.ogg", t = 50 / 30},
            {p = 100, s = "weapons/re45/wpn_re45_emptyreload_handrest_fr55_2ch_v1_01.ogg", t = 55 / 30}
        },
    },
    ["trigger"] = {
        Source = "idle",
        MinProgress = 0.4,
        SoundTable = {
            {p = 100, s = "weapons/3030/3030_Charge_Spin_Whine_Start_1ch_v2_01.wav", t = 0 / 30}
        },
    },
}

SWEP.TTTWeaponType = "weapon_ttt_glock"
SWEP.TTTWeight = 100