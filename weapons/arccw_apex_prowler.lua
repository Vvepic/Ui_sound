if CLIENT then
    killicon.Add( "arccw_apex_prowler", "VGUI/apex_killicon_prowler", Color(251, 85, 25, 255))
    SWEP.WepSelectIcon = surface.GetTextureID("VGUI/apex_prowler")
end

SWEP.Base = "arccw_apex_base"
SWEP.Spawnable = true -- this obviously has to be set to true
SWEP.Category = "ArcCW - Apex Legends" -- edit this if you like
SWEP.AdminOnly = false

SWEP.PrintName = "Prowler Burst PDW"
SWEP.Trivia_Class = "Submachine Gun"
SWEP.Trivia_Desc = "Bullpup submachine gun that fires five rounds at a high rate of fire. The fire control and design gives this weapon excellent handling and low recoi."
SWEP.Trivia_Manufacturer = "Lastimosa Armory"

SWEP.Slot = 2

SWEP.CrouchPos = Vector(-6.5, -2.5, 1.5)
SWEP.CrouchAng = Angle(1.037, 0.623, -50.921)

SWEP.SprintPos = Vector(0, 0, 0)
SWEP.SprintAng = Angle(0, 0, 0)

SWEP.ActivePos = Vector(0, -2, 1)
SWEP.ActiveAng = Angle(0, 0, 0)

SWEP.BarrelOffsetSighted = Vector(0, 0, -1)
SWEP.BarrelOffsetHip = Vector(2, 0, -2)

SWEP.NPCWeaponType = "weapon_smg1"
SWEP.NPCWeight = 250

SWEP.UseHands = true

SWEP.ViewModel = "models/weapons/c_apex_prowler.mdl"
SWEP.WorldModel = "models/weapons/w_apex_prowler.mdl"
SWEP.MirrorVMWM = false
SWEP.WorldModelOffset = {
    pos = Vector(13, 1, 2),
    ang = Angle(-10, 0, 180),
    bone = "ValveBiped.Bip01_R_Hand",
    scale = 1
}

SWEP.ViewModelFOV = 70

SWEP.Damage = 14
SWEP.DamageMin = 14
SWEP.Range = 90
SWEP.Penetration = 9
SWEP.PhysBulletMuzzleVelocity = 18000 * ArcCW.HUToM

SWEP.Apex_Balance = {
    [1] = {
        Damage = 21,
        DamageMin = 18,
    },
    [2] = {
        Damage = 10,
        DamageMin = 10,
    },
}

SWEP.BodyDamageMults = {
    [HITGROUP_HEAD] = 1.5,
    [HITGROUP_CHEST] = 1,
    [HITGROUP_STOMACH] = 1,
    [HITGROUP_LEFTARM] = 1,
    [HITGROUP_RIGHTARM] = 1,
    [HITGROUP_LEFTLEG] = 0.8,
    [HITGROUP_RIGHTLEG] = 0.8,
}

SWEP.DamageType = DMG_BULLET
SWEP.ShootEntity = nil -- entity to fire, if any
SWEP.MuzzleVelocity = 750 -- projectile or phys bullet muzzle velocity

SWEP.ChamberSize = 0 -- how many rounds can be chambered.
SWEP.Primary.ClipSize = 20 -- DefaultClip is automatically set.
SWEP.MaxRecoilBlowback = 1

SWEP.Recoil = 0.225
SWEP.RecoilSide = 0.225
SWEP.RecoilRise = 0.1
SWEP.RecoilPunch = 2.5
SWEP.RecoilVMShake = 0.1

SWEP.Delay = 60 / 1260 -- 60 / RPM.
SWEP.Num = 1 -- number of shots per trigger pull.

SWEP.Firemodes = {
    {
        Mode = -5,
        RunawayBurst = true,
        PostBurstDelay = 0.33
    }}

SWEP.AccuracyMOA = 3
SWEP.HipDispersion = 300
SWEP.MoveDispersion = 150
SWEP.JumpDispersion = 300

SWEP.SightedSpeedMult = 0.75

SWEP.Primary.Ammo = "apex_heavy"

SWEP.ShootVol = 160 -- volume of shoot sound
-- SWEP.ShootPitch = 101 -- pitch of shoot sound


SWEP.FirstShootSound = "ArcCW_APEX.Prowler.Fire_Start"
SWEP.ShootSound = "ArcCW_APEX.Prowler.Fire"
SWEP.ShootDrySound = "ArcCW_APEX.SMG_Dry_A"
SWEP.ShootSoundSilenced = ""
SWEP.DistantShootSound = ""

SWEP.Tracer = "arccw_apex_tracer_smg"
SWEP.TracerNum = 1 -- tracer every X
SWEP.TracerWidth = 3

SWEP.MuzzleEffect = "tfa_apex_muzzle_smg"
SWEP.ShellModel = "models/shells/shelleject_assault_rifle.mdl"
SWEP.ShellPitch = 100
SWEP.ShellScale = 1.1
SWEP.ShellTime = 1

SWEP.MuzzleEffectAttachment = 1 -- which attachment to put the muzzle on
SWEP.CaseEffectAttachment = 2 -- which attachment to put the case effect on
SWEP.CamAttachment = 3

SWEP.BarrelLength = 8

SWEP.ProceduralRegularFire = false
SWEP.ProceduralIronFire = false

SWEP.CaseBones = {}

SWEP.IronSightStruct = {
    Pos = Vector(0, 0, 0),
    Ang = Angle(0, 0, 0),
    Magnification = 1.1,
        Midpoint = { -- Where the gun should be at the middle of it's irons
        Pos = Vector(0, 0, 0),
        Ang = Angle(0, 0, 0),
    },
}

SWEP.HoldtypeHolstered = "passive"
SWEP.HoldtypeActive = "smg"
SWEP.HoldtypeSights = "rpg"

SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_SMG1

SWEP.CustomizePos = Vector(0, 0, 0)
SWEP.CustomizeAng = Angle(0 , 0, 0)

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
            wpos = Vector(1.2, 1.0, -7.38),
            wang = Angle(-7.5, 0, 180)
        },
        InstalledEles = {"ref_sights", "weapon_dot"},
        ExtraSightDist = 4,
         CorrectivePos = Vector(2.17, 0, 0),
         CorrectiveAng = Angle(-1.131, 1.373, 7.821)
    },
    {
        PrintName = "Muzzle",
        Slot = {"apex_muzzle", "apex_muzzle_smgs"},
        Bone = "def_c_suppressor",
        Offset = {
            vpos = Vector(0, 0, 0),
            vang = Angle(90, 0, -90),
            wpos = Vector(7.52, 1.0, -4.65),
            wang = Angle(-10, 0, 180)
        },
    },
    {
        PrintName = "Stock",
        Slot = {"apex_stock_standard", "apex_stock_precision"}
    },
    {
        PrintName = "Magazine",
        Slot = {"apex_mag_heavy5"}
    },
    {
        PrintName = "Hop-up",
        Slot = {"apex_hopup_selfire"}
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
        Bone = "ja_ads_attachment", -- relevant bone any attachments will be mostly referring to
        Offset = {
            vpos = Vector(0.95, 1.78, -2.2), -- offset that the attachment will be relative to the bone
            vang = Angle(90, 0, -80),
            wpos = Vector(2.7, 1.6, -5.1),
            wang = Angle(-10, 0, 180)
        },
		VMScale = Vector(0.3, 0.3, 0.3),
		WMScale = Vector(0.3, 0.3, 0.3),
    },
    {
        PrintName = "Stats",
        Slot = {"killcounter2","killcounter"},
        FreeSlot = true,
        Bone = "def_c_base", -- relevant bone any attachments will be mostly referring to
        Offset = {
            vpos = Vector(1.1, -3.9, 3), -- offset that the attachment will be relative to the bone
            vang = Angle(90, 0, -90),
            wpos = Vector(5, 2, -4),
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
            {p = 100, s = "weapons/prowler/Wpn_ProwlerPDW_1p_pullout_reload_empty_foley_ArmUp_1frames_1a.ogg", t = 1 / 30},
            {p = 100, s = "weapons/prowler/Wpn_ProwlerPDW_1p_pullout_reload_empty_foley_BoltPull_8frames_1.ogg", t = 8 / 30},
            {p = 100, s = "weapons/prowler/Wpn_ProwlerPDW_1p_pullout_reload_empty_foley_GrabSettle_24frames_1.ogg", t = 24 / 30},
            {p = 100, s = "weapons/prowler/Wpn_ProwlerPDW_1p_pullout_reload_empty_foley_ArmSettle_28frames_1b.ogg", t = 28 / 30},
            {p = 100, s = "weapons/prowler/Wpn_ProwlerPDW_1p_reload_mech_empty_bolt_pull_68frames_1.ogg", t = 8 / 30},
            {p = 100, s = "weapons/prowler/Wpn_ProwlerPDW_1p_reload_mech_empty_bolt_release_76frames_1.ogg", t = 16 / 30}
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
        Source = {"fire"},
        ShellEjectAt = 0,
    },
    ["enter_sight"] = {
        Source = "iron_in",
    },
    ["fire_sight"] = {
        Source = {"iron_fire"},
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
        Source = "inspect",
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 0.6,
        LHIKEaseOut = 0.4,
    },
    ["exit_inspect"] = {
        Source = "inspect_out",
        SoundTable = {
            {p = 100, s = "weapons/foley/Weapon_Inspect_Foley_SMG_End_V2_2ch_01.wav", t = 0 / 30},
    },
    },
    ["idle_inspect"] = {
        Source = "inspect",
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 0.6,
        LHIKEaseOut = 0.4,
        SoundTable = {
            {p = 100, s = "weapons/foley/Weapon_Inspect_Foley_SMG_Start_V2_2ch_01.wav", t = 1 / 30},
            {p = 100, s = "weapons/foley/Weapon_Inspect_Foley_SMG_Mid_V2_2ch_01.wav", t = 96 / 30},
            {p = 100, s = "weapons/foley/Weapon_Inspect_Foley_SMG_Mid_V2_2ch_02.wav", t = 240 / 30},
            {p = 100, s = "weapons/foley/Weapon_Inspect_Foley_SMG_End_V2_2ch_01.wav", t = 316 / 30}
    },
    },
    ["1_to_2"] = {
        Source = "firemode1",
        MinProgress = 0.15,
    },
    ["2_to_1"] = {
        Source = "firemode2",
        MinProgress = 0.15,
    },
    ["reload"] = {
        Source = "reload",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_SMG1,
        LHIK = true,
        LHIKIn = 0.2,
        LHIKOut = 0.4,
        LHIKEaseOut = 0.2,
        MinProgress = 60 / 40,
        SoundTable = {
            {p = 100, s = "weapons/prowler/Wpn_ProwlerPDW_1p_reload_foley_ArmToMag_2frames_1.ogg", t = 2 / 30},
            {p = 100, s = "weapons/prowler/Wpn_ProwlerPDW_1p_reload_foley_ArmMagSweet_3frames_1.ogg", t = 3 / 30},
            {p = 100, s = "weapons/prowler/Wpn_ProwlerPDW_1p_reload_foley_ArmMagToss_14frames_1.ogg", t = 14 / 30},
            {p = 100, s = "weapons/prowler/Wpn_ProwlerPDW_1p_reload_foley_ArmMagOut_30frames_1.ogg", t = 30 / 30},
            {p = 100, s = "weapons/prowler/Wpn_ProwlerPDW_1p_reload_foley_MagOut_32frames_1.ogg", t = 32 / 30},
            {p = 100, s = "weapons/prowler/Wpn_ProwlerPDW_1p_reload_foley_ArmGrabWeap_58frames_1.ogg", t = 58 / 30},
            {p = 100, s = "weapons/prowler/Wpn_ProwlerPDW_1p_reload_foley_ArmWeapSettle_57frames_1.ogg", t = 57 / 30},

            {p = 100, s = "weapons/prowler/Wpn_ProwlerPDW_1p_reload_mech_reload_MagOut_16frames_1.ogg", t = 16 / 30},
            {p = 100, s = "weapons/prowler/Wpn_ProwlerPDW_1p_reload_mech_reload_MagIn_43frames_1.ogg", t = 43 / 30},
            {p = 100, s = "weapons/prowler/Wpn_ProwlerPDW_1p_reload_mech_reload_grab_66frames_1.ogg", t = 66 / 30}
        },
    },
    ["reload_empty"] = {
        Source = "reload_empty",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_SMG1,
        LHIK = true,
        LHIKIn = 0.2,
        LHIKOut = 0.5,
        LHIKEaseOut = 0.2,
        MinProgress = 97 / 40,
        SoundTable = {
            {p = 100, s = "weapons/prowler/Wpn_ProwlerPDW_1p_reload_empty_foley_ArmBoltPull_63frames_1.ogg", t = 63 / 30},
            {p = 100, s = "weapons/prowler/Wpn_ProwlerPDW_1p_reload_empty_foley_ArmMagGrab_2frames_1.ogg", t = 2 / 30},
            {p = 100, s = "weapons/prowler/Wpn_ProwlerPDW_1p_reload_empty_foley_ArmMagOutToss_5frames_1.ogg", t = 5 / 30},
            {p = 100, s = "weapons/prowler/Wpn_ProwlerPDW_1p_reload_empty_foley_ArmMagUp_31frames_1.ogg", t = 31 / 30},
            {p = 100, s = "weapons/prowler/Wpn_ProwlerPDW_1p_reload_empty_foley_ArmSettle_74frames_1.ogg", t = 74 / 30},
            {p = 100, s = "weapons/prowler/Wpn_ProwlerPDW_1p_reload_empty_foley_ClothSettle_79frames_1.ogg", t = 79 / 30},
            {p = 100, s = "weapons/prowler/Wpn_ProwlerPDW_1p_reload_empty_foley_MagOut_33frames_1.ogg", t = 33 / 30},

            {p = 100, s = "weapons/prowler/Wpn_ProwlerPDW_1p_reload_mech_empty_1frames_WeapMvmnt_1.ogg", t = 1 / 30},
            {p = 100, s = "weapons/prowler/Wpn_ProwlerPDW_1p_reload_mech_empty_12frames_bolt_pull_1a.ogg", t = 12 / 30},
            {p = 100, s = "weapons/prowler/Wpn_ProwlerPDW_1p_reload_mech_empty_22frames_bolt_release_1a.ogg", t = 22 / 30},
            {p = 100, s = "weapons/prowler/Wpn_ProwlerPDW_1p_reload_mech_empty_32frames_handgrab_1a.ogg", t = 32 / 30},
            {p = 100, s = "weapons/prowler/Wpn_ProwlerPDW_1p_reload_mech_empty_bolt_pull_68frames_1.ogg", t = 68 / 30},
            {p = 100, s = "weapons/prowler/Wpn_ProwlerPDW_1p_reload_mech_empty_bolt_release_76frames_1.ogg", t = 76 / 30},
            {p = 100, s = "weapons/prowler/Wpn_ProwlerPDW_1p_reload_mech_empty_grab_85frames_2.ogg", t = 85 / 30},
            {p = 100, s = "weapons/prowler/Wpn_ProwlerPDW_1p_reload_mech_empty_GunMvmnt_1frames_1a.ogg", t = 1 / 30},
            {p = 100, s = "weapons/prowler/Wpn_ProwlerPDW_1p_reload_mech_empty_GunMvmnt_53frames_1b.ogg", t = 53 / 30},
            {p = 100, s = "weapons/prowler/Wpn_ProwlerPDW_1p_reload_mech_empty_MagIn_45frames_1a.ogg", t = 45 / 30},
            {p = 100, s = "weapons/prowler/Wpn_ProwlerPDW_1p_reload_mech_empty_MagOut_13frames_1.ogg", t = 13 / 30}
        },
    },
}

SWEP.TTTWeaponType = "weapon_zm_mac10"
SWEP.TTTWeight = 100