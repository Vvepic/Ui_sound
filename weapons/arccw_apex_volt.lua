if CLIENT then
    killicon.Add( "arccw_apex_volt", "VGUI/apex_killicon_volt", Color(251, 85, 25, 255))
    SWEP.WepSelectIcon = surface.GetTextureID("VGUI/apex_volt")
end

SWEP.Base = "arccw_apex_base"
SWEP.Spawnable = true -- this obviously has to be set to true
SWEP.Category = "ArcCW - Apex Legends" -- edit this if you like
SWEP.AdminOnly = false

SWEP.PrintName = "Volt SMG"
SWEP.Trivia_Class = "Submachine Gun"
SWEP.Trivia_Desc = "Energy-actuated SMG with incredible stopping power."
SWEP.Trivia_Manufacturer = "Wonyeon Interstellar"

SWEP.Slot = 2

SWEP.CrouchPos = Vector(-6, -1.5, 1)
SWEP.CrouchAng = Angle(0.837, 0, -56.513)

SWEP.SprintPos = Vector(0, 0, 0)
SWEP.SprintAng = Angle(0, 0, 0)

SWEP.ActivePos = Vector(0, -2, 1)
SWEP.ActiveAng = Angle(0, 0, 0)

SWEP.CustomizePos = Vector(0, 0, 0)
SWEP.CustomizeAng = Angle(0 , 0, 0)

SWEP.BarrelOffsetSighted = Vector(0, 0, -1)
SWEP.BarrelOffsetHip = Vector(2, 0, -1)
SWEP.BarrelOffsetCrouch = Vector(0, 0, -2)

SWEP.NPCWeaponType = "weapon_ar2"
SWEP.NPCWeight = 250

SWEP.UseHands = true

SWEP.ViewModel = "models/weapons/c_apex_volt.mdl"
SWEP.WorldModel = "models/weapons/w_apex_volt.mdl"
SWEP.MirrorVMWM = false
SWEP.WorldModelOffset = {
    pos = Vector(13, 1, 2),
    ang = Angle(-10, 0, 180),
    bone = "ValveBiped.Bip01_R_Hand",
    scale = 1
}

SWEP.ViewModelFOV = 70

SWEP.Damage = 16
SWEP.DamageMin = 16
SWEP.Range = 100
SWEP.Penetration = 6
SWEP.PhysBulletMuzzleVelocity = 23500 * ArcCW.HUToM

SWEP.Apex_Balance = {
    [1] = {
        Damage = 24,
        DamageMin = 16,
    },
    [2] = {
        Damage = 14,
        DamageMin = 14,
    },
}

SWEP.ChamberSize = 0
SWEP.Primary.ClipSize = 19 -- DefaultClip is automatically set.
SWEP.Primary.Ammo = "apex_energy"

SWEP.Recoil = 0.3
SWEP.RecoilSide = 0.3
SWEP.RecoilRise = 0.4
SWEP.RecoilPunch = 2.5
SWEP.RecoilVMShake = 1
SWEP.VisualRecoilMult = 1
SWEP.MaxRecoilBlowback = 1

SWEP.Delay = 60 / 650 -- 60 / RPM.
SWEP.Num = 1 -- number of shots per trigger pull.
SWEP.Firemodes = {
    {
        Mode = 2,
    }
}

SWEP.AccuracyMOA = 2
SWEP.HipDispersion = 500 -- inaccuracy added by hip firing.
SWEP.MoveDispersion = 150
SWEP.JumpDispersion = 300

SWEP.SightedSpeedMult = 0.75

SWEP.ShootVol = 120 -- volume of shoot sound
SWEP.ShootPitch = 100 -- pitch of shoot sound

SWEP.FirstShootSound = "ArcCW_APEX.Volt.Fire_Start"
SWEP.ShootSound = "ArcCW_APEX.Volt.Fire"
SWEP.ShootDrySound = "ArcCW_APEX.Rifle_Dry_A"
SWEP.ShootSoundSilenced = ""
SWEP.DistantShootSound = ""

SWEP.Tracer = "arccw_apex_tracer_energy_smg" -- override tracer (hitscan) effect
SWEP.TracerCol = Color(25, 125, 255)
SWEP.TracerNum = 1 -- tracer every X
SWEP.TracerWidth = 2
SWEP.PhysTracerProfile = "apex_bullet_energy"

SWEP.MuzzleEffect = "tfa_apex_energy_muzzle_medium"
SWEP.MuzzleFlashColor = Color(39, 90, 255)

SWEP.ShellModel = "models/shells/shelleject_assault_rifle.mdl"
SWEP.ShellScale = 1.2
SWEP.ShellTime = 1

SWEP.MuzzleEffectAttachment = 1 -- which attachment to put the muzzle on
SWEP.CaseEffectAttachment = 2 -- which attachment to put the case effect on
SWEP.CamAttachment = 3

SWEP.BarrelLength = 15

SWEP.ProceduralRegularFire = false
SWEP.ProceduralIronFire = false

SWEP.CaseBones = {}


SWEP.IronSightStruct = {
    Pos = Vector(0, -1, 0),
    Ang = Angle(0, 0, 0),
    Magnification = 1.2,
        Midpoint = { -- Where the gun should be at the middle of it's irons
        Pos = Vector(0, 0, 0),
        Ang = Angle(0, 0, 0),
    },
}

SWEP.HoldtypeHolstered = "passive"
SWEP.HoldtypeActive = "smg"
SWEP.HoldtypeSights = "rpg"

SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_SMG1

SWEP.AttachmentElements = {
    ["weapon_sights"] = {
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
        Slot = {"apex_sights"}, -- what kind of attachments can fit here, can be string or table
        Bone = "ja_ads_attachment", -- relevant bone any attachments will be mostly referring to
        Offset = {
            vpos = Vector(0, 0, 0), -- offset that the attachment will be relative to the bone
            vang = Angle(90, 0, -90),
            wpos = Vector(4.4, 1.0, -5.42),
            wang = Angle(-10, 0, 180)
        },
        InstalledEles = {"weapon_sights", "weapon_dot"},
        ExtraSightDist = 3,
        CorrectivePos = Vector(1.88,0,-0.4),
        CorrectiveAng = Angle(0, 0, 3.845)
    },
    {
        PrintName = "Muzzle",
        Slot = {"apex_muzzle", "apex_muzzle_smgs"},
        Bone = "def_c_suppressor",
        Offset = {
            vpos = Vector(0, 0, 0),
            vang = Angle(90, 0, -90),
            wpos = Vector(22.0, 1.0, -7.10),
            wang = Angle(-10, 0, 180)
        },
    },
    {
        PrintName = "Stock",
        Slot = {"apex_stock_standard", "apex_stock_precision"}
    },
    {
        PrintName = "Magazine",
        Slot = {"apex_mag_energy1"}
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
            vpos = Vector(0.7, 0.3, -1.5), -- offset that the attachment will be relative to the bone
            vang = Angle(90, 0, -90),
            wpos = Vector(2, 1.6, -4.6),
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
            vpos = Vector(1.2, -2.8, 16), -- offset that the attachment will be relative to the bone
            vang = Angle(90, 0, -90),
            wpos = Vector(17, 2.2, -4.5),
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
    ["enter_sprint"] = {
        Source = "sprint_in",
    },
    ["idle_sprint"] = {Source = "sprint", Mult = 0.9},
    ["exit_sprint"] = {
        Source = "sprint_out",
    },
    ["ready"] = {
        Source = "draw_first",
        SoundTable = {
            {v = 25, p = 100, s = "weapons/volt/Wpn_Volt_Reload_Mech_br_firstdraw_Foley_fr01_2ch_v1_01.ogg", t = 1 / 35},
            {v = 25, p = 100, s = "weapons/volt/Wpn_Volt_Reload_Mech_br_firstdraw_GunRattle_fr01_2ch_v1_01.ogg", t = 1 / 35},
            {v = 25, p = 100, s = "weapons/volt/Wpn_Volt_Reload_Mech_br_firstdraw_BoltRelease_fr18_2ch_v1_01.ogg", t = 18 / 35},
            {v = 25, p = 100, s = "ArcCW_APEX.Volt.Draw_Bolt_Release", t = 21 / 35},
            {v = 25, p = 100, s = "weapons/volt/Wpn_Volt_Reload_Mech_br_firstdraw_GunRattleGrab_fr30_2ch_v1_01.ogg", t = 30 / 35}
        },
    },
    ["draw"] = {
        Source = "draw",
        Mult = 1,
		MinProgress = 0.45,
    },
    ["holster"] = {
        Source = "holster",
        Mult = 1,
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
    },
    ["exit_inspect"] = {
        Source = "inspect_out",
        SoundTable = {
            {p = 100, s = "weapons/foley/Weapon_Inspect_Foley_SMG_End_V2_2ch_01.wav", t = 0 / 30},
    },
    },
    ["idle_inspect"] = {
        Source = "inspect",
        SoundTable = {
            {p = 100, s = "weapons/foley/Weapon_Inspect_Foley_SMG_Start_V2_2ch_01.wav", t = 1 / 30},
            {p = 100, s = "weapons/foley/Weapon_Inspect_Foley_SMG_Mid_V2_2ch_01.wav", t = 96 / 30},
            {p = 100, s = "weapons/foley/Weapon_Inspect_Foley_SMG_Mid_V2_2ch_02.wav", t = 240 / 30},
            {p = 100, s = "weapons/foley/Weapon_Inspect_Foley_SMG_End_V2_2ch_01.wav", t = 316 / 30}
    },
    },
    ["reload"] = {
        Source = "reload",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        SoundTable = {
            {s = "weapons/volt/Wpn_Volt_br_reload_02_Foley_LftArmMagIn_fr01_2ch_v1_01.ogg", t = 1 / 30},
            {s = "weapons/volt/Wpn_Volt_br_reload_02_Mech_GunRattle_fr01_2ch_v1_01.ogg", t = 1 / 30},
            {s = "ArcCW_APEX.Volt.Mag_Out", t = 15 / 30},
            {s = "weapons/volt/Wpn_Volt_br_reload_02_Mech_GunRattleMagIn_fr21_2ch_v1_01.ogg", t = 21 / 30},
            {s = "ArcCW_APEX.Volt.Mag_In", t = 29 / 30},
            {s = "weapons/volt/Wpn_Volt_br_reload_02_Foley_LftArmMagPul_fr45_2ch_v1_01.ogg", t = 45 / 30},
            {s = "weapons/volt/Wpn_Volt_br_reload_02_Mech_GunRattleMagIn_fr54_2ch_v1_01.ogg", t = 54 / 30}
        },
    },
    ["reload_empty"] = {
        Source = "reload_empty",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        SoundTable = {
            {s = "weapons/volt/Wpn_Volt_br_reloadempty_02_Foley_ArmLftMagSlide_fr01_2ch_v1_01.ogg", t = 1 / 30},
            {s = "weapons/volt/Wpn_Volt_br_reloadempty_02_Mech_GunRattleMagOut_fr04_2ch_v1_01.ogg", t = 4 / 30},
            {s = "weapons/volt/Wpn_Volt_br_reloadempty_02_Foley_BoltPullSettle_fr12_2ch_v1_01.ogg", t = 12 / 30},
            {s = "ArcCW_APEX.Volt.Mag_Out", t = 16 / 30},
            {s = "ArcCW_APEX.Volt.Mag_In", t = 29 / 30},
            {s = "weapons/volt/Wpn_Volt_br_reloadempty_02_Mech_GunRattleMagIn_fr34_2ch_v1_01.ogg", t = 34 / 30},
            {s = "weapons/volt/Wpn_Volt_br_reloadempty_02_Mech_GunRattleMagIn_fr49_2ch_v1_01.ogg", t = 49 / 30},
            {s = "ArcCW_APEX.Volt.Bolt_Release", t = 58 / 30},
            {s = "weapons/volt/Wpn_Volt_br_reloadempty_02_Foley_ArmLftPullMag_fr65_2ch_v1_03.ogg", t = 65 / 30},
            {s = "weapons/volt/Wpn_Volt_br_reloadempty_02_Mech_GunRattleSettle_fr69_2ch_v1_01.ogg", t = 69 / 30}
        },
    },
}

SWEP.TTTWeaponType = {"weapon_zm_mac10", "weapon_ttt_m16"}
SWEP.TTTWeight = 50