if CLIENT then
    killicon.Add( "arccw_apex_flatline", "VGUI/apex_killicon_flatline", Color(251, 85, 25, 255))
    SWEP.WepSelectIcon = surface.GetTextureID("VGUI/apex_flatline")
end

SWEP.Base = "arccw_apex_base"
SWEP.Spawnable = true -- this obviously has to be set to true
SWEP.Category = "ArcCW - Apex Legends" -- edit this if you like
SWEP.AdminOnly = false

SWEP.PrintName = "VK-47 Flatline"
SWEP.Trivia_Class = "Assault Rifle"
SWEP.Trivia_Desc = "Automatic rifle that packs a punch. True to its name, early models were able to completely remove vertical recoil. This was removed for cost saving purposes, turning the Flatline into a mass production weapon."
SWEP.Trivia_Manufacturer = "Wonyeon Interstellar"

SWEP.Slot = 2

SWEP.CrouchPos = Vector(-6, 0, 1)
SWEP.CrouchAng = Angle(0.837, 0, -56.513)

SWEP.SprintPos = Vector(0, 0, 0)
SWEP.SprintAng = Angle(0, 0, 0)

SWEP.ActivePos = Vector(0, -2, 0.7)
SWEP.ActiveAng = Angle(0, 0, 0)

SWEP.CustomizePos = Vector(0, 0, 0)
SWEP.CustomizeAng = Angle(0 , 0, 0)

SWEP.NPCWeaponType = "weapon_ar2"
SWEP.NPCWeight = 250

SWEP.UseHands = true

SWEP.ViewModel = "models/weapons/c_apex_flatline.mdl"
SWEP.WorldModel = "models/weapons/w_apex_flatline.mdl"
SWEP.MirrorVMWM = false
SWEP.WorldModelOffset = {
    pos        =  Vector(12.8, 1.0, 2.5),
    ang        =  Angle(-10, 0, 180),
    bone       =  "ValveBiped.Bip01_R_Hand",
    scale      =  1,
}

SWEP.ViewModelFOV = 70

SWEP.Damage = 18
SWEP.DamageMin = 18
SWEP.Range = 200
SWEP.Penetration = 10
SWEP.PhysBulletMuzzleVelocity = 19500 * ArcCW.HUToM


SWEP.Apex_Balance = {
    [1] = {
        -- Arcwc Settings
        Damage = 25,
        DamageMin = 18,
    },
        -- TTT Settings
    [2] = {
        Damage = 15,
        DamageMin = 15,
    },
}

SWEP.BodyDamageMults = {
    [HITGROUP_HEAD] = 1.75,
    [HITGROUP_CHEST] = 1,
    [HITGROUP_STOMACH] = 1,
    [HITGROUP_LEFTARM] = 1,
    [HITGROUP_RIGHTARM] = 1,
    [HITGROUP_LEFTLEG] = 0.75,
    [HITGROUP_RIGHTLEG] = 0.75,
}

SWEP.Tracer = "arccw_apex_tracer_ar" -- override tracer (hitscan) effect
SWEP.TracerNum = 1 -- tracer every X
SWEP.TracerWidth = 2

SWEP.ChamberSize = 0
SWEP.Primary.ClipSize = 20
SWEP.MaxRecoilBlowback = 1

-- SWEP.PhysBulletMuzzleVelocity = 500

SWEP.Recoil = 0.45
SWEP.RecoilSide = 0.3
SWEP.RecoilRise = 0.65
SWEP.RecoilPunch = 2.5
SWEP.RecoilVMShake = 1
SWEP.VisualRecoilMult = 0.2

SWEP.Delay = 60 / 600 -- 60 / RPM.
SWEP.Num = 1 -- number of shots per trigger pull.
SWEP.Firemodes = {
    {
        Mode = 2,
    },
    {
        Mode = 1,
    }
}

SWEP.AccuracyMOA = 3
SWEP.HipDispersion = 450 -- inaccuracy added by hip firing.
SWEP.MoveDispersion = 125
SWEP.JumpDispersion = 300

SWEP.SightedSpeedMult = 0.45

SWEP.Primary.Ammo = "apex_heavy"

SWEP.ShootVol = 120 -- volume of shoot sound
SWEP.ShootPitch = 100 -- pitch of shoot sound

SWEP.FirstShootSound = "ArcCW_APEX.Flatline.Fire_Start"
SWEP.ShootSound = "ArcCW_APEX.Flatline.Fire"
SWEP.ShootDrySound = "ArcCW_APEX.Rifle_Dry_A_3"
SWEP.ShootSoundSilenced = ""
SWEP.DistantShootSound = ""
SWEP.FiremodeSound = {"weapons/fx/firemode_1.wav","weapons/fx/firemode_2.wav"}

SWEP.Hook_GetShootSound = function(wep, fsound)
    if wep:GetCurrentFiremode().Mode == 1 and fsound == wep.FirstShootSound then return "ArcCW_APEX.Flatline.Fire_Alt" elseif fsound == wep.FirstShootSound then return "ArcCW_APEX.Flatline.Fire_Start" end
end

SWEP.MuzzleEffect = "tfa_apex_muzzle_ar"
SWEP.ShellModel = "models/shells/shelleject_assault_rifle.mdl"
SWEP.ShellScale = 1
SWEP.ShellTime = 0.7
-- SWEP.ShellRotateAngle = Angle(0, 0, 0)

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
    Magnification = 1.1,
        Midpoint = { -- Where the gun should be at the middle of it's irons
        Pos = Vector(0, 0, 0),
        Ang = Angle(0, 0, 0),
    },
}

SWEP.HoldtypeHolstered = "passive"
SWEP.HoldtypeActive = "ar2"
SWEP.HoldtypeSights = "rpg"

SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_RPG

SWEP.ExtraSightDist = 2.5

SWEP.AttachmentElements = {
    ["weapon_sights"] = {
        VMBodygroups = {
            {ind = 1, bg = 1},
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
        Slot = {"apex_sights","apex_optic"}, -- what kind of attachments can fit here, can be string or table
        Bone = "ja_ads_attachment", -- relevant bone any attachments will be mostly referring to
        Offset = {
            vpos = Vector(0, 0, 0), -- offset that the attachment will be relative to the bone
            vang = Angle(90, 0, -90),
            wpos = Vector(8.35, 1.0, -6.40),
            wang = Angle(-10, 0, 180)
        },
        InstalledEles = {"weapon_sights"},
        CorrectivePos = Vector(1.73, 0, -0.32),
        CorrectiveAng = Angle(0, 0, 3.9)
    },
    {
        PrintName = "Muzzle",
        Slot = "apex_muzzle",
        Bone = "def_c_suppressor",
        Offset = {
            vpos = Vector(0, 0, 0),
            vang = Angle(90, 0, -90),
            wpos = Vector(22.3, 1.0, -6.10),
            wang = Angle(-10, 0, 180)
        },
    },
    {
        PrintName = "Stock",
        Slot = {"apex_stock_standard", "apex_stock_precision"}
    },
    {
        PrintName = "Magazine",
        Slot = {"apex_mag_heavy3"}
    },
    {
        PrintName = "Hop-up",
        Slot = {"apex_hopup_anvil2"},
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
            vpos = Vector(0.5, 0.2, -0.8), -- offset that the attachment will be relative to the bone
            vang = Angle(90, 0, -90),
            wpos = Vector(5.2, 1.5, -5.5),
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
            vpos = Vector(0.75, -4, 13), -- offset that the attachment will be relative to the bone
            vang = Angle(90, 0, -90),
            wpos = Vector(14, 1.8, -6.5),
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
    ["enter_sprint"] = {
        Source = "sprint_in",
    },
    ["exit_sprint"] = {
        Source = "sprint_out",
    },
    ["ready"] = {
        Source = "draw_first",
        SoundTable = {
            {p = 100, s = "weapons/flatline/wpn_vinson_first_pullout_fr08_2ch_v1_01.ogg", t = 8 / 35}
        },
    },
    ["draw"] = {
        Source = "draw",
        Mult = 1,
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
            {p = 100, s = "weapons/foley/Weapon_Inspect_Foley_AR_End_V1_2ch_01.wav", t = 0 / 30},
    },
    },
    ["idle_inspect"] = {
        Source = "inspect",
        SoundTable = {
            {p = 100, s = "weapons/foley/Weapon_Inspect_Foley_AR_Start_V1_2ch_01.wav", t = 1 / 30},
            {p = 100, s = "weapons/foley/Weapon_Inspect_Foley_AR_Mid_V1_2ch_01.wav", t = 96 / 30},
            {p = 100, s = "weapons/foley/Weapon_Inspect_Foley_AR_Mid_V1_2ch_02.wav", t = 240 / 30},
            {p = 100, s = "weapons/foley/Weapon_Inspect_Foley_AR_End_V1_2ch_01.wav", t = 316 / 30}
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
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        SoundTable = {
            {p = 100, s = "weapons/flatline/wpn_vinson_reload_magout_fr11_2ch_v1_01.ogg", t = 11 / 30},
            {p = 100, s = "weapons/flatline/wpn_vinson_reload_magin_fr43_2ch_v1_01.ogg", t = 43 / 30}
        },
    },
    ["reload_empty"] = {
        Source = "reload_empty",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        SoundTable = {
            {s = "weapons/flatline/wpn_vinson_reload_magout_fr11_2ch_v1_01.ogg", t = 11 / 30},
            {s = "weapons/flatline/wpn_vinson_reload_magin_fr43_2ch_v1_01.ogg", t = 43 / 30},
            {s = "weapons/flatline/wpn_vinson_reload_empty_charge_fr60_2ch_v1_01.ogg", t = 60 / 30}
        },
    },
}

SWEP.TTTWeaponType = "weapon_zm_mac10"
SWEP.TTTWeight = 100