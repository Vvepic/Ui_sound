if CLIENT then
    killicon.Add( "arccw_apex_lstar", "VGUI/apex_killicon_lstar", Color(251, 85, 25, 255))
    SWEP.WepSelectIcon = surface.GetTextureID("VGUI/apex_lstar")
end

SWEP.Base = "arccw_apex_base"
SWEP.Spawnable = true -- this obviously has to be set to true
SWEP.Category = "ArcCW - Apex Legends" -- edit this if you like
SWEP.AdminOnly = false

SWEP.PrintName = "L-STAR EMG"
SWEP.Trivia_Class = "Light Machine Gun"
SWEP.Trivia_Desc = "Cyclic particle accelerating weapon that fires hot plasma bursts. Sustained fire will melt the generator core, requiring a reload."
SWEP.Trivia_Manufacturer = "Wonyeon Interstellar"

SWEP.Slot = 3

SWEP.CrouchPos = Vector(-6, -1, 1)
SWEP.CrouchAng = Angle(0.582, 0.623, -53.181)

SWEP.SprintPos = Vector(0, 0, 0)
SWEP.SprintAng = Angle(0, 0, 0)

SWEP.ActivePos = Vector(0, -2, 1)
SWEP.ActiveAng = Angle(0, 0, 0)

SWEP.BarrelOffsetSighted = Vector(0, 0, -1)
SWEP.BarrelOffsetHip = Vector(2, 0, -1)
SWEP.BarrelOffsetCrouch = Vector(0, 0, -2)

SWEP.CustomizePos = Vector(0, 0, 0)
SWEP.CustomizeAng = Angle(0, 0, 0)

SWEP.NPCWeaponType = "weapon_ar2"
SWEP.NPCWeight = 250

SWEP.CamAttachment = 3

SWEP.UseHands = true

SWEP.ViewModel = "models/weapons/c_apex_lstar.mdl"
SWEP.WorldModel = "models/weapons/w_apex_lstar.mdl"
SWEP.MirrorVMWM = false
SWEP.WorldModelOffset = {
    pos = Vector(12.5, 1, 2),
    ang = Angle(-10, 0, 180),
    bone = "ValveBiped.Bip01_R_Hand",
    scale = 1
}

SWEP.ViewModelFOV = 70

SWEP.Damage = 17
SWEP.DamageMin = 17
SWEP.Range = 150
SWEP.Penetration = 10
SWEP.PhysBulletMuzzleVelocity = 22000 * ArcCW.HUToM
SWEP.PhysBulletGravity = 0.5

--SWEP.ShootEntity = "arccw_apex_proj_lstarplasma" -- entity to fire, if any
--SWEP.MuzzleVelocity = 300 -- projectile or phys bullet muzzle velocity

SWEP.BodyDamageMults = {
    [HITGROUP_HEAD] = 1.5,
    [HITGROUP_CHEST] = 1,
    [HITGROUP_STOMACH] = 1,
    [HITGROUP_LEFTARM] = 1,
    [HITGROUP_RIGHTARM] = 1,
    [HITGROUP_LEFTLEG] = 0.85,
    [HITGROUP_RIGHTLEG] = 0.85,
}

SWEP.Apex_Balance = {
    [1] = {
        Damage = 31,
        DamageMin = 17,
    },
    [2] = {
        Damage = 14,
        DamageMin = 14,
    },
}

SWEP.PhysTracerProfile = "apex_lstar"
SWEP.TracerNum = 1

SWEP.ChamberSize = 0
SWEP.Primary.ClipSize = 30
SWEP.MaxRecoilBlowback = 1
SWEP.BottomlessClip = true

SWEP.AlwaysPhysBullet = true

SWEP.Recoil = 0.7
SWEP.RecoilSide = 0.2
SWEP.RecoilRise = 0.6
SWEP.RecoilPunch = 2.5
SWEP.RecoilVMShake = 1

SWEP.Delay = 60 / 600 -- 60 / RPM.
SWEP.Num = 1 -- number of shots per trigger pull.

SWEP.Firemodes = {
    {
        Mode = 2,
    }
}

SWEP.AccuracyMOA = 15
SWEP.HipDispersion = 400
SWEP.MoveDispersion = 100
SWEP.JumpDispersion = 300

SWEP.SightedSpeedMult = 0.4

SWEP.Primary.Ammo = "apex_energy"

SWEP.ShootVol = 160 -- volume of shoot sound

SWEP.FirstShootSound = "ArcCW_APEX.LSTAR.Fire_Start"
SWEP.ShootSound = "ArcCW_APEX.LSTAR.Fire"
SWEP.ShootDrySound = "ArcCW_APEX.Rifle_Dry_A_3"
SWEP.ShootSoundSilenced = ""
SWEP.DistantShootSound = ""
SWEP.FiremodeSound = ""

SWEP.MuzzleEffect = "tfa_apex_energy_muzzle_lstar"
SWEP.MuzzleFlashColor = Color(255, 111, 111)
SWEP.ShellModel = "models/shells/shelleject_large_rifle.mdl"
SWEP.ShellPitch = 95
SWEP.ShellScale = 1
SWEP.ShellTime = 1
-- SWEP.ShellRotateAngle = Angle(0, 0, 90)

SWEP.MuzzleEffectAttachment = 1 -- which attachment to put the muzzle on
SWEP.CaseEffectAttachment = 2 -- which attachment to put the case effect on

SWEP.ImpactEffect = "arccw_apex_impact_lstar"
--SWEP.ImpactDecal = "FadingScorch"

SWEP.BarrelLength = 12

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

SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_RPG

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
            wpos = Vector(5.8, 1.0, -9.76),
            wang = Angle(-10, 0, 180)
        },
        ExtraSightDist = 1,
        InstalledEles = {"weapon_sights", "weapon_dot"},
        CorrectivePos = Vector(1.98,0,-0.23),
        CorrectiveAng = Angle(-0.011, 0.004, 4.242)
    },
    {
        PrintName = "Muzzle",
        Slot = "apex_muzzle",
        Bone = "def_c_suppressor",
        Offset = {
            vpos = Vector(0, 0, 0),
            vang = Angle(90, 0, -90),
            wpos = Vector(14.18, 1.0, -6.6),
            wang = Angle(-10, 0, 180)
        },
    },
    {
        PrintName = "Stock",
        Slot = {"apex_stock_standard2", "apex_stock_precision"}
    },
    {
        PrintName = "Magazine",
        Slot = {"apex_mag_lstar"}
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
            vpos = Vector(0.9, 1, -3.35), -- offset that the attachment will be relative to the bone
            vang = Angle(90, 0, -80),
            wpos = Vector(4.5, 1.8, -3.5),
            wang = Angle(-10, 0, 180)
        },
		VMScale = Vector(0.3, 0.3, 0.3),
		WMScale = Vector(0.3, 0.3, 0.3),
    },
    {
        PrintName = "Stats",
        Slot = {"killcounter2","killcounter"},
        FreeSlot = true,
        Bone = "def_front_top", -- relevant bone any attachments will be mostly referring to
        Offset = {
            vpos = Vector(0.93, 1.1, 0), -- offset that the attachment will be relative to the bone
            vang = Angle(90, 0, -90),
            wpos = Vector(5, 2.1, -6.4),
            wang = Angle(-10, 0, 180)
        },
		VMScale = Vector(1, 1, 1),
		WMScale = Vector(1, 1, 1),
    },
}

SWEP.Jamming = true
SWEP.HeatCapacity = 20 -- rounds that can be fired non-stop before the gun jams, playing the "fix" animation
SWEP.HeatDissipation = 10 -- rounds' worth of heat lost per second
SWEP.HeatLockout = true -- overheating means you cannot fire until heat has been fully depleted
SWEP.HeatDelayTime = 0.125
SWEP.HeatFix = true -- when the "fix" animation is played, all heat is restored.
SWEP.HeatOverflow = false -- if true, heat is allowed to exceed capacity (this only applies when the default overheat handling is overridden)

SWEP.Animations = {
    ["idle"] = {
        Source = "idle",
    },
    ["idle_sprint"] = {Source = "sprint", Mult = 0.9},
    ["enter_sprint"] = {Source = "sprint_in", Mult = 1},
    ["exit_sprint"] = {Source = "sprint_out", Mult = 1},
    ["ready"] = {
        Source = "draw_first",
        LHIK = true,
        LHIKOut = 0.6,
        SoundTable = {
            {p = 100, s = "weapons/lstar/Wpn_LSTAR_ReloadOverheatR5_Pt4_2ch_v1_01.ogg", t = 0 / 30},
    },
    },
    ["draw"] = {
        Source = "draw",
    },
    ["holster"] = {
        Source = "holster",
    },
    ["idle_iron"] = {
        Source = "iron_idle",
    },
    ["fire"] = {
        Source = {"fire", "fire2"},
    },
    ["enter_sight"] = {
        Source = "iron_in",
    },
    ["fire_sight"] = {
        Source = "iron_fire",
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
    },
    ["exit_inspect"] = {
        Source = "inspect_out",
        LHIK = true,
        LHIKOut = 0.6,
        SoundTable = {
            {p = 100, s = "weapons/lstar/Wpn_LSTAR_Inspect_Pt6_2ch_v1_01.ogg", t = 0 / 30},
    },
    },
    ["idle_inspect"] = {
        Source = "inspect",
        LHIK = true,
        LHIKOut = 0.6,
        SoundTable = {
            {p = 100, s = "weapons/lstar/Wpn_LSTAR_Inspect_Pt1_2ch_v1_01.ogg", t = 1 / 30},
            {p = 100, s = "weapons/lstar/Wpn_LSTAR_Inspect_Pt2_2ch_v1_01.ogg", t = 25 / 30},
            {p = 100, s = "weapons/lstar/Wpn_LSTAR_Inspect_Pt3_2ch_v1_01.ogg", t = 55 / 30},
            {p = 100, s = "weapons/lstar/Wpn_LSTAR_Inspect_Pt4_2ch_v1_01.ogg", t = 80 / 30},
            {p = 100, s = "weapons/lstar/Wpn_LSTAR_Inspect_Pt5_2ch_v1_01.ogg", t = 115 / 30},
            {p = 100, s = "weapons/lstar/Wpn_LSTAR_Inspect_Pt6_2ch_v1_01.ogg", t = 135 / 30},
            {p = 100, s = "weapons/lstar/Wpn_LSTAR_Inspect_Pt7_2ch_v1_01.ogg", t = 155 / 30}
    },
    },
    ["fix"] = {
        Source = "overheat",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        LHIK = true,
        LHIKOut = 0.9,
        SoundTable = {
            {p = 150, s = "weapons/lstar/wpn_lstar_lensburnoutpop_lr_2ch_v1_01.ogg", t = 0 / 30},
            {p = 150, s = "weapons/lstar/wpn_lstar_lensburnoutpop_c_1ch_v1_01.ogg", t = 5 / 30},
            {p = 150, s = "weapons/lstar/wpn_lstar_lensburnoutreload_pt1_2ch_v1_01.ogg", t = 10 / 30},
            {p = 150, s = "weapons/lstar/wpn_lstar_lensburnoutreload_pt2_2ch_v1_01.ogg", t = 25 / 30},
            {p = 150, s = "weapons/lstar/wpn_lstar_lensburnoutreload_pt3_2ch_v1_01.ogg", t = 55 / 30},
            {p = 150, s = "weapons/lstar/wpn_lstar_lensburnoutreload_pt4_2ch_v1_01.ogg", t = 65 / 30},
            {p = 150, s = "weapons/lstar/wpn_lstar_lensburnoutreload_pt5_2ch_v1_01.ogg", t = 75 / 30},
            {p = 150, s = "weapons/lstar/wpn_lstar_lensburnoutreload_pt6_2ch_v1_01.ogg", t = 85 / 30},
        },
    },
    ["reload"] = {
        Source = "reload",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        LHIK = true,
        LHIKOut = 0.9,
        SoundTable = {
            -- {p = 150, s = "weapons/r301/wpn_r101_reload_magpull_fr0_2ch_v1_02.wav", t = 0 / 30},
        },
    },
    ["reload_empty"] = {
        Source = "reload_empty",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        LHIK = true,
        LHIKOut = 0.6,
        SoundTable = {
            -- {p = 100, s = "weapons/r301/wpn_r101_emptyreload_magpull_fr9_2ch_v1_02.wav", t = 9 / 30},
    },
},
}

SWEP.TTTWeaponType = "weapon_zm_sledge"
SWEP.TTTWeight = 100

if engine.ActiveGamemode() == "terrortown" then
    SWEP.StoredAmmo = 30
else
    SWEP.ForceDefaultAmmo = 30
end

SWEP.Hook_Think = function(wep)
    if (game.SinglePlayer() and CLIENT) or (not game.SinglePlayer() and SERVER) then return end
    local heat = wep:GetHeat()
    local alertheat = (80 * wep.HeatCapacity) / 100

    if IsValid(wep:GetOwner()) and wep:GetOwner():GetActiveWeapon() == wep
            and heat >= alertheat and heat < wep:GetMaxHeat() then
        if wep.CreatedHeatSound == false then
            wep.HeatAlarm = CreateSound(wep,"weapons/lstar/Wpn_LSTAR_1p_OverheatAlarm_2ch_v1_01.wav")
            wep.HeatAlarm:Play()
            wep.CreatedHeatSound = true
        end
    else
        wep.CreatedHeatSound = false
        if wep.HeatAlarm then wep.HeatAlarm:Stop() end
    end
end
