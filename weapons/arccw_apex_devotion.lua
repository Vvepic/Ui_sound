if CLIENT then
    killicon.Add( "arccw_apex_devotion", "VGUI/apex_killicon_devotion", Color(251, 85, 25, 255))
    SWEP.WepSelectIcon = surface.GetTextureID("VGUI/apex_devotion")
end

SWEP.Base = "arccw_apex_base"
SWEP.Spawnable = true -- this obviously has to be set to true
SWEP.Category = "ArcCW - Apex Legends" -- edit this if you like
SWEP.AdminOnly = false

SWEP.PrintName = "Devotion LMG"
SWEP.Trivia_Class = "Machine Gun"
SWEP.Trivia_Desc = "Energy actuated machine gun with an internal motor, ramping up its fire rate as the trigger is held."
SWEP.Trivia_Manufacturer = "Wonyeon Interstellar"

SWEP.Slot = 2

SWEP.CrouchPos = Vector(-5.5, -1.5, 1.5)
SWEP.CrouchAng = Angle(0.623, 0.015, -53.174)

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

SWEP.ViewModel = "models/weapons/c_apex_devotion.mdl"
SWEP.WorldModel = "models/weapons/w_apex_devotion.mdl"
SWEP.MirrorVMWM = false
SWEP.WorldModelOffset = {
    pos = Vector(12.5, 1, 2),
    ang = Angle(-10, 0, 180),
    bone = "ValveBiped.Bip01_R_Hand",
    scale = 1
}
SWEP.ViewModelFOV = 70

SWEP.Damage = 16
SWEP.DamageMin = 16
SWEP.Range = 150
SWEP.Penetration = 10
SWEP.DamageType = DMG_BULLET
SWEP.ShootEntity = nil -- entity to fire, if any
SWEP.MuzzleVelocity = 550 -- projectile or phys bullet muzzle velocity IN M/S
SWEP.PhysBulletMuzzleVelocity = 33500 * ArcCW.HUToM

SWEP.Apex_Balance = {
    [1] = {
        Damage = 26,
        DamageMin = 16,
    },
    [2] = {
        Damage = 12,
        DamageMin = 12,
    },
}

SWEP.BodyDamageMults = {
    [HITGROUP_HEAD] = 1.5,
    [HITGROUP_CHEST] = 1,
    [HITGROUP_STOMACH] = 1,
    [HITGROUP_LEFTARM] = 1,
    [HITGROUP_RIGHTARM] = 1,
    [HITGROUP_LEFTLEG] = 0.85,
    [HITGROUP_RIGHTLEG] = 0.85,
}

SWEP.ChamberSize = 0
SWEP.Primary.ClipSize = 36 -- DefaultClip is automatically set.
SWEP.Primary.Ammo = "apex_energy"

SWEP.Recoil = 0.2
SWEP.RecoilSide = 0.15
SWEP.RecoilRise = 0.4
SWEP.RecoilPunch = 2.5
SWEP.RecoilVMShake = 1
SWEP.VisualRecoilMult = 0.1
SWEP.MaxRecoilBlowback = 1

SWEP.Delay = 60 / 300 -- 60 / RPM.
SWEP.Num = 1 -- number of shots per trigger pull.
SWEP.Firemodes = {
    {
        Mode = 2,
    }
}
SWEP.Hook_ModifyRPM = function(wep, delay)
    return delay / Lerp(wep:GetBurstCount() / 15, 1, 3)
end

SWEP.AccuracyMOA = 10
SWEP.HipDispersion = 525 -- inaccuracy added by hip firing.
SWEP.MoveDispersion = 125
SWEP.JumpDispersion = 300

SWEP.SightedSpeedMult = 0.4

SWEP.ShootVol = 140 -- volume of shoot sound
SWEP.ShootPitch = 100 -- pitch of shoot sound

SWEP.FirstShootSound = "ArcCW_APEX.Devotion.Fire_Start"
SWEP.ShootSound = "ArcCW_APEX.Devotion.Fire"
SWEP.ShootDrySound = "ArcCW_APEX.Rifle_Dry_A"
SWEP.ShootSoundSilenced = ""
SWEP.DistantShootSound = ""

SWEP.Tracer = "arccw_apex_tracer_energy_hmg" -- override tracer (hitscan) effect
SWEP.TracerCol = Color(39, 90, 255)
SWEP.TracerNum = 1 -- tracer every X
SWEP.TracerWidth = 2
SWEP.PhysTracerProfile = "apex_bullet_energy"

SWEP.MuzzleEffect = "tfa_apex_energy_muzzle_big"
SWEP.MuzzleFlashColor = Color(91, 110, 255)

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
    Pos = Vector(0, -2, 0),
    Ang = Angle(0, 0, 0),
    Magnification = 1.15,
        Midpoint = { -- Where the gun should be at the middle of it's irons
        Pos = Vector(0, 0, 0),
        Ang = Angle(0, 0, 0),
    },
}

SWEP.HoldtypeHolstered = "passive"
SWEP.HoldtypeActive = "ar2"
SWEP.HoldtypeSights = "rpg"

SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2

SWEP.AttachmentElements = {
    ["weapon_sight"] = {
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
            wpos = Vector(7.5, 1.0, -6.77),
            wang = Angle(-10, 0, 180)
        },
        ExtraSightDist = -3,
        InstalledEles = {"weapon_sight", "weapon_dot"},
        CorrectivePos = Vector(1.6,0,-0.55),
        CorrectiveAng = Angle(-0.94, -0.287, 5.581)
    },
    {
        PrintName = "Muzzle",
        Slot = "apex_muzzle",
        Bone = "def_c_suppressor",
        Offset = {
            vpos = Vector(0, 0, 0),
            vang = Angle(90, 0, -90),
            wpos = Vector(29.3, 1.0, -9.4),
            wang = Angle(-10, 0, 180)
        },
    },
    {
        PrintName = "Stock",
        Slot = {"apex_stock_standard", "apex_stock_precision"}
    },
    {
        PrintName = "Magazine",
        Slot = {"apex_mag_energy2"}
    },
    {
        PrintName = "Hop-up",
        Slot = {"apex_hopup_turbo2"}
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
            vpos = Vector(0.5, 0.5, 4.7), -- offset that the attachment will be relative to the bone
            vang = Angle(90, 0, -80),
            wpos = Vector(7.5, 1.5, -6),
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
            vpos = Vector(1.05, -2.7, 18), -- offset that the attachment will be relative to the bone
            vang = Angle(90, 0, -90),
            wpos = Vector(22, 2, -6.8),
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
            {p = 100, s = "weapons/devotion/Wpn_Devotion_FirstDraw_PilotFoley_fr00_2ch_v1_01.ogg", t = 0 / 30},
            {p = 100, s = "weapons/devotion/Wpn_Devotion_FirstDraw_AccuateBolt_pt01_fr06_2ch_v1_01.ogg", t = 6 / 30},
            {p = 100, s = "weapons/devotion/Wpn_Devotion_FirstDraw_Energy_fr11_2ch_v1_01.ogg", t = 11 / 30},
            {p = 100, s = "weapons/devotion/Wpn_Devotion_FirstDraw_PilotEquip_fr13_2ch_v1_01.ogg", t = 13 / 30},
            {p = 100, s = "weapons/devotion/Wpn_Devotion_FirstDraw_AccuateBolt_pt02_fr15_2ch_v1_01.ogg", t = 15 / 30},
            {p = 100, s = "weapons/devotion/Wpn_Devotion_FirstDraw_WpnMvmnt_fr20_2ch_v1_01.ogg", t = 20 / 30},
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
            {p = 100, s = "weapons/foley/Weapon_Inspect_Foley_LMG_Start_V1_2ch_01.wav", t = 1 / 30},
            {p = 100, s = "weapons/foley/Weapon_Inspect_Foley_LMG_Mid_V1_2ch_01.wav", t = 96 / 30},
            {p = 100, s = "weapons/foley/Weapon_Inspect_Foley_LMG_Mid_V1_2ch_02.wav", t = 240 / 30},
            {p = 100, s = "weapons/foley/Weapon_Inspect_Foley_AR_End_V1_2ch_01.wav", t = 316 / 30}
    },
    },
    ["reload"] = {
        Source = "reload",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        SoundTable = {
            {p = 100, s = "weapons/devotion/Wpn_Devotion_Reload_WpnMvmnt_fr05_2ch_v1_01.ogg", t = 5 / 30},
            {p = 100, s = "weapons/devotion/Wpn_Devotion_Reload_WpnMvmnt_fr65_2ch_v1_01.ogg", t = 65 / 30},
            {p = 100, s = "weapons/devotion/Wpn_Devotion_Reload_WpnMvmnt_fr74_2ch_v1_01.ogg", t = 74 / 30},

            {p = 100, s = "weapons/devotion/Wpn_Devotion_Reload_EmptyMagOut_fr08_2ch_v2_01A.ogg", t = 8 / 30},
            {p = 100, s = "weapons/devotion/Wpn_Devotion_Reload_EmptyMagOut_fr08_2ch_v2_01B.ogg", t = 8 / 30},
            {p = 100, s = "weapons/devotion/Wpn_Devotion_Reload_MagIn_fr43_2ch_v1_01.ogg", t = 43 / 30},
            {p = 100, s = "weapons/devotion/Wpn_Devotion_Reload_MagHit_fr63_2ch_v1_01.ogg", t = 63 / 30}
        },
    },
    ["reload_empty"] = {
        Source = "reload_empty",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        SoundTable = {
            {p = 100, s = "weapons/devotion/Wpn_Devotion_ReloadEmpty_WpnMvmnt_fr03_2ch_v1_01.ogg", t = 5 / 30},
            {p = 100, s = "weapons/devotion/Wpn_Devotion_ReloadEmpty_WpnMvmnt_fr66_2ch_v1_01.ogg", t = 65 / 30},
            {p = 100, s = "weapons/devotion/Wpn_Devotion_ReloadEmpty_WpnMvmnt_fr96_2ch_v1_01.ogg", t = 74 / 30},

            {p = 100, s = "weapons/devotion/Wpn_Devotion_ReloadEmpty_EmptyMagOut_fr05_2ch_v1_01.ogg", t = 5 / 30},
            {p = 100, s = "weapons/devotion/Wpn_Devotion_ReloadEmpty_MagIn_fr41_2ch_v1_01.ogg", t = 41 / 30},
            {p = 100, s = "weapons/devotion/Wpn_Devotion_ReloadEmpty_MagHit_fr61_2ch_v1_01.ogg", t = 61 / 30},
            {p = 100, s = "weapons/devotion/Wpn_Devotion_ReloadEmpty_AccuateBoltResonate_fr80_2ch_v1_01.ogg", t = 80 / 30},
            {p = 100, s = "weapons/devotion/Wpn_Devotion_ReloadEmpty_Energy_fr86_2ch_v1_01.ogg", t = 86 / 30}
        },
    },
}

SWEP.Hook_AddShootSound = function(wep, data)
    if wep:GetBurstCount() == 1 then
        if wep.DevotionWindupSound then wep.DevotionWindupSound:Stop() end
        if wep.Attachments[5].Installed == "apex_hopup_turbo2" then
            wep.DevotionWindupSound = CreateSound(wep, "weapons/devotion/Wpn_Devotion_1P_FullAuto_Turbo_Startup_2ch_v1_01.ogg")
        else
            wep.DevotionWindupSound = CreateSound(wep, "weapons/devotion/Wpn_Devotion_1P_FullAuto_Startup_2ch_v1_0" .. math.random(1, 3) .. ".ogg")
        end

        wep.DevotionWindupSound:Play()
    end
    wep.DevotionLastBurst = wep:GetBurstCount()
end

SWEP.Hook_Think = function(wep)
    if wep:GetBurstCount() == 0 and wep.DevotionWindupSound then
        wep.DevotionWindupSound:Stop()
        wep.DevotionWindupSound = nil
        if wep.DevotionLastBurst > 10 then
            wep:MyEmitSound("weapons/devotion/Wpn_Devotion_1P_FullAuto_WindDown_2ch_v1_01.ogg")
        end
    end
end

SWEP.TTTWeaponType = "weapon_zm_sledge"
SWEP.TTTWeight = 100