if CLIENT then
    killicon.Add( "arccw_apex_rampage", "VGUI/apex_killicon_rampage", Color(251, 85, 25, 255))
    SWEP.WepSelectIcon = surface.GetTextureID("VGUI/apex_rampage")
end

SWEP.Base = "arccw_apex_base"
SWEP.Spawnable = true -- this obviously has to be set to true
SWEP.Category = "ArcCW - Apex Legends" -- edit this if you like
SWEP.AdminOnly = false

SWEP.PrintName = "Rampage LMG"
SWEP.Trivia_Class = "Light Machine Gun"
SWEP.Trivia_Desc = "Custom machine gun with high damage but low fire rate.\n\nPress the firemode key to charge up the weapon with a Thermite Grenade, increasing its rate of fire."
SWEP.Trivia_Manufacturer = "Rampart/SWCC"

SWEP.Slot = 3

SWEP.CrouchPos = Vector(-6, 0, 1)
SWEP.CrouchAng = Angle(0.837, 0, -56.513)

SWEP.SprintPos = Vector(0, 0, 0)
SWEP.SprintAng = Angle(0, 0, 0)

SWEP.ActivePos = Vector(0, -1.5, 1)
SWEP.ActiveAng = Angle(0, 0, 0)

SWEP.NPCWeaponType = "weapon_ar2"
SWEP.NPCWeight = 250

SWEP.UseHands = true

SWEP.ViewModel = "models/weapons/c_apex_rampage.mdl"
SWEP.WorldModel = "models/weapons/w_apex_rampage.mdl"
SWEP.MirrorVMWM = false
SWEP.WorldModelOffset = {
    pos = Vector(12.5, 1, 2),
    ang = Angle(-10, 0, 180),
    bone = "ValveBiped.Bip01_R_Hand",
    scale = 1
}

SWEP.ViewModelFOV = 65

SWEP.Damage = 26
SWEP.DamageMin = 26
SWEP.Range = 200
SWEP.Penetration = 10
SWEP.PhysBulletMuzzleVelocity = 26500 * ArcCW.HUToM

SWEP.Apex_Balance = {
    [1] = {
        -- Arcwc Settings
        Damage = 40,
        DamageMin = 40,
    },
    [2] = {
        Damage = 40,
        DamageMin = 40,
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

SWEP.Tracer = "arccw_apex_tracer_hmg" -- override tracer (hitscan) effect
SWEP.TracerNum = 1 -- tracer every X
SWEP.TracerWidth = 2

SWEP.ChamberSize = 0
SWEP.Primary.ClipSize = 28
SWEP.MaxRecoilBlowback = 1

-- SWEP.PhysBulletMuzzleVelocity = 500

SWEP.Recoil = 0.45
SWEP.RecoilSide = 0.25
SWEP.RecoilRise = 0.4
SWEP.RecoilPunch = 2.5
SWEP.RecoilVMShake = 1
SWEP.VisualRecoilMult = 0.2

SWEP.Delay = 60 / 300 -- 60 / RPM.
SWEP.Num = 1 -- number of shots per trigger pull.
SWEP.Firemodes = {
    {
        Mode = 2,
    },
}

SWEP.AccuracyMOA = 6
SWEP.HipDispersion = 600
SWEP.MoveDispersion = 125
SWEP.JumpDispersion = 300

SWEP.SightedSpeedMult = 0.4

SWEP.Primary.Ammo = "apex_heavy"

SWEP.ShootVol = 140 -- volume of shoot sound
SWEP.ShootPitch = 100 -- pitch of shoot sound

SWEP.FirstShootSound = "ArcCW_APEX.Rampage.Fire_Start"
SWEP.ShootSound = "ArcCW_APEX.Rampage.Fire"
SWEP.ShootDrySound = "ArcCW_APEX.Rifle_Dry_A_1"
SWEP.ShootSoundSilenced = ""
SWEP.DistantShootSound = ""
SWEP.FiremodeSound = {"weapons/fx/firemode_1.wav","weapons/fx/firemode_2.wav"}

SWEP.MuzzleEffect = "tfa_apex_muzzle_hmg"
SWEP.ShellModel = "models/shells/shelleject_large_rifle.mdl"
SWEP.ShellScale = 0.5
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

SWEP.CustomizePos = Vector(0, 0, 0)
SWEP.CustomizeAng = Angle(0 , 0, 0)

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
    ["Thermite_to_Frag"] = {
        VMBodygroups = {
            {ind = 3, bg = 2},
        },
    },
    ["Frag_to_Thermite"] = {
        VMBodygroups = {
            {ind = 3, bg = 1},
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
            wpos = Vector(3.5, 1.0, -5.6),
            wang = Angle(-10, 0, 180)
        },
        InstalledEles = {"weapon_sights","weapon_dot"},
        ExtraSightDist = 0,
        CorrectivePos = Vector(1.53, 0, -0.33),
        CorrectiveAng = Angle(-0.542, 0.714, -0.275)
    },
    {
        PrintName = "Muzzle",
        Slot = "apex_muzzle",
        Bone = "def_c_suppressor",
        Offset = {
            vpos = Vector(0, 0, 0),
            vang = Angle(90, 0, -90),
            wpos = Vector(23, 1.0, -7.55),
            wang = Angle(-10, 0, 180)
        },
    },
    {
        PrintName = "Stock",
        Slot = {"apex_stock_standard", "apex_stock_precision"}
    },
    {
        PrintName = "Magazine",
        Slot = {"apex_mag_heavy7"}
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
            vpos = Vector(1.4, 1.2, 0.8), -- offset that the attachment will be relative to the bone
            vang = Angle(90, 0, -90),
            wpos = Vector(2, 2.3, -4),
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
            vpos = Vector(1.5, -3.4, 15), -- offset that the attachment will be relative to the bone
            vang = Angle(90, 0, -90),
            wpos = Vector(13, 2.15, -6),
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
        RareSource = "draw_first_rampant",
        RareSourceChance = 25,
        SoundTable = {
            {p = 100, s = "weapons/rampage/wpn_rampage_reload_intro_2ch_v1_01.ogg", t = 0 / 30},
            {p = 100, s = "weapons/rampage/wpn_rampage_reload_boltback_2ch_v1_01.ogg", t = 15 / 30},
            {p = 100, s = "weapons/rampage/wpn_rampage_reload_boltfront_2ch_v1_01.ogg", t = 25 / 30},
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
            {p = 100, s = "weapons/foley/Weapon_Inspect_Foley_AR_End_V1_2ch_01.wav", t = 525 / 30},

            {p = 100, s = "weapons/rampage/wpn_rampage_lookat_button_press_2ch_v1.ogg", t = 290 / 30},
            {p = 100, s = "weapons/rampage/wpn_rampage_lookat_open_2ch_v1a.ogg", t = 295 / 30},
            {p = 100, s = "weapons/rampage/wpn_rampage_lookat_handle_close_2ch_v1a.ogg", t = 509 / 30},
            {p = 100, s = "weapons/rampage/wpn_rampage_lookat_body_close_2ch_v1a.ogg", t = 515 / 30},
    },
    },
    ["charge"] = {
        Source = "energize",
        SoundTable = {
            {p = 100, s = "weapons/rampage/wpn_rampage_thermite_charge_3p_v1.ogg", t = 0 / 30},
            {p = 100, s = "ArcCW_APEX.Rampage.Energize", t = 105 / 30},
        },
    },
    ["reload"] = {
        Source = "reload",
        RareSource = "reload_rampant",
        RareSourceChance = 35,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        SoundTable = {
            {p = 100, s = "weapons/rampage/wpn_rampage_reload_intro_2ch_v1_01.ogg", t = 0 / 30},
            {p = 100, s = "weapons/rampage/wpn_rampage_reload_magout_2ch_v1_01b.ogg", t = 15 / 30},
            {p = 100, s = "weapons/rampage/wpn_rampage_reload_maggrab_2ch_v1.ogg", t = 25 / 30},
            {p = 100, s = "weapons/rampage/wpn_rampage_reload_magin_2ch_v1_01.ogg", t = 45 / 30},
            {p = 100, s = "weapons/rampage/wpn_rampage_reload_magpush_2ch_v1_01.ogg", t = 55 / 30},
        },
    },
    ["reload_empty"] = {
        Source = "reload_empty",
        RareSource = "reload_empty_rampant",
        RareSourceChance = 35,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        SoundTable = {
            {p = 100, s = "weapons/rampage/wpn_rampage_reload_intro_2ch_v1_01.ogg", t = 0 / 30},
            {p = 100, s = "weapons/rampage/wpn_rampage_reload_magout_2ch_v1_01b.ogg", t = 15 / 30},
            {p = 100, s = "weapons/rampage/wpn_rampage_reload_maggrab_2ch_v1.ogg", t = 25 / 30},
            {p = 100, s = "weapons/rampage/wpn_rampage_reload_magin_2ch_v1_01.ogg", t = 45 / 30},
            {p = 100, s = "weapons/rampage/wpn_rampage_reload_magpush_2ch_v1_01.ogg", t = 55 / 30},
            {p = 100, s = "weapons/rampage/wpn_rampage_reload_boltback_2ch_v1_01.ogg", t = 65 / 30},
            {p = 100, s = "weapons/rampage/wpn_rampage_reload_boltfront_2ch_v1_01.ogg", t = 75 / 30},
        },
    },
}

SWEP.TTTWeaponType = "weapon_zm_mac10"
SWEP.TTTWeight = 100

SWEP.Jamming = true
SWEP.HeatGain = -2.5
SWEP.HeatCapacity = 90
SWEP.HeatDissipation = 1
SWEP.HeatLockout = false
SWEP.HeatDelayTime = 0

SWEP.Hook_GetShootSound = function(wep, fsound)
    if wep:GetHeat() > 0 then
        if fsound == wep.FirstShootSound then return "ArcCW_APEX.Rampage_Charged.Fire_Start"
        else return "ArcCW_APEX.Rampage_Charged.Fire" end
    end
end

SWEP.Hook_ModifyRPM = function(wep, delay)
    if wep:GetHeat() > 0 then
        return delay / 1.3
    end
end

SWEP.Hook_ChangeFiremode = function(wep)
    if wep:GetPriorityAnim() then return true end

    local ok = GetConVar("arccw_apex_freecharge"):GetBool() or ArcCW.Apex.TryConsumeGrenade(wep:GetOwner(), "arccw_apex_nade_thermite")

    if CLIENT and not ok then
            wep.ApexHintEnd = CurTime() + 1.5
            wep.ApexHintAlpha = 0
    end
    if not ok then return true end

    wep:PlayAnimationEZ("charge", 1, true)
    local n = CurTime() + wep:GetAnimKeyTime("charge", true)
    wep:SetNextPrimaryFire(n)
    wep:SetPriorityAnim(n)
    wep:SetHeat(wep:GetMaxHeat())
    return true
end

SWEP.Hook_PostDrawCrosshair = function(wep)
    if (wep.ApexHintEnd or 0) > CurTime() then
        wep.ApexHintAlpha = math.Approach(wep.ApexHintAlpha or 0, 1, FrameTime() * 5)
    else
        wep.ApexHintAlpha = math.Approach(wep.ApexHintAlpha or 0, 0, FrameTime() * 10)
    end
    ArcCW.Apex.DrawCrosshairHint("apex.hint.req_thermite", wep.ApexHintAlpha)
end

SWEP.O_Hook_Override_Tracer = function(wep, data)
    if wep:GetHeat() > 0 then
        return {current = "arccw_apex_tracer_hmg_rampage"}
    end
end