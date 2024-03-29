if CLIENT then
    killicon.Add( "arccw_apex_havoc", "VGUI/apex_killicon_havoc", Color(251, 85, 25, 255))
    SWEP.WepSelectIcon = surface.GetTextureID("VGUI/apex_havoc")
end

SWEP.Base = "arccw_apex_base"
SWEP.Spawnable = true -- this obviously has to be set to true
SWEP.Category = "ArcCW - Apex Legends" -- edit this if you like
SWEP.AdminOnly = false

SWEP.PrintName = "HAVOC"
SWEP.Trivia_Class = "Assault Rifle"
SWEP.Trivia_Desc = "Charged energy weapon using a coilgun mechanism, requiring winding up before it can fire. Recoil is intense, but so is its firepower."
SWEP.Trivia_Manufacturer = "Siwhan Industries & Wonyeon Interstellar"

SWEP.Slot = 2

SWEP.CrouchPos = Vector(-6, -1.5, 1)
SWEP.CrouchAng = Angle(4, 3, -47.436)

SWEP.SprintPos = Vector(0, 0, 0)
SWEP.SprintAng = Angle(0, 0, 0)

SWEP.ActivePos = Vector(0, -1, 1)
SWEP.ActiveAng = Angle(0, 0, 0)

SWEP.CustomizePos = Vector(0, 0, 0)
SWEP.CustomizeAng = Angle(0 , 0, 0)

SWEP.BarrelOffsetSighted = Vector(0, 0, -1)
SWEP.BarrelOffsetHip = Vector(2, 0, -1)
SWEP.BarrelOffsetCrouch = Vector(0, 0, -2)

SWEP.NPCWeaponType = "weapon_ar2"
SWEP.NPCWeight = 250

SWEP.UseHands = true

SWEP.ViewModel = "models/weapons/c_apex_havoc.mdl"
SWEP.WorldModel = "models/weapons/w_apex_havoc.mdl"
SWEP.MirrorVMWM = false
SWEP.WorldModelOffset = {
    pos        =  Vector(12.5, 1, 2),
    ang        =    Angle(-10, 0, 180),
    bone    =    "ValveBiped.Bip01_R_Hand",
    scale   =   1,
}

SWEP.ViewModelFOV = 75

SWEP.Damage = 18
SWEP.DamageMin = 18
SWEP.Range = 100
SWEP.Penetration = 10
SWEP.PhysBulletMuzzleVelocity = 30500 * ArcCW.HUToM

SWEP.Apex_Balance = {
    [1] = {
        Damage = 24,
        DamageMin = 18,
    },
    [2] = {
        Damage = 17,
        DamageMin = 17,
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

SWEP.ChamberSize = 0
SWEP.Primary.ClipSize = 24
SWEP.Primary.Ammo = "apex_energy"

SWEP.Recoil = 0.55
SWEP.RecoilSide = 0.55
SWEP.RecoilRise = 0.75
SWEP.RecoilPunch = 2.5
SWEP.RecoilVMShake = 1.5
SWEP.VisualRecoilMult = 5
SWEP.MaxRecoilBlowback = 2

SWEP.Delay = 60 / 572 -- 60 / RPM.
SWEP.Num = 1 -- number of shots per trigger pull.
SWEP.Firemodes = {
    {
        Mode = 2,
    }
}

SWEP.AccuracyMOA = 4
SWEP.HipDispersion = 350 -- inaccuracy added by hip firing.
SWEP.MoveDispersion = 150
SWEP.JumpDispersion = 300

SWEP.SightedSpeedMult = 0.45

SWEP.ShootVol = 120 -- volume of shoot sound
SWEP.ShootPitch = 100 -- pitch of shoot sound

SWEP.FirstShootSound = "ArcCW_APEX.Havoc.Fire_Start"
SWEP.ShootSound = "ArcCW_APEX.Havoc.Fire"
SWEP.ShootDrySound = "ArcCW_APEX.Rifle_Dry_A"
SWEP.ShootSoundSilenced = ""
SWEP.DistantShootSound = ""

SWEP.Tracer = "arccw_apex_tracer_energy_rifle" -- override tracer (hitscan) effect
SWEP.TracerCol = Color(25, 125, 255)
SWEP.TracerNum = 1 -- tracer every X
SWEP.TracerWidth = 2
SWEP.PhysTracerProfile = "apex_bullet_energy"

SWEP.MuzzleEffect = "tfa_apex_energy_muzzle_havoc"
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
    Pos = Vector(0, 3, 0.2),
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
}

SWEP.TriggerDelay = true

SWEP.GuaranteeLaser = true
SWEP.Attachments = {
    {
        PrintName = "Optic",
        DefaultAttName = "Iron Sights",
        Slot = {"apex_sights","havoc"}, -- what kind of attachments can fit here, can be string or table
        Bone = "ja_ads_attachment", -- relevant bone any attachments will be mostly referring to
        Offset = {
            vpos = Vector(0, 0, 0), -- offset that the attachment will be relative to the bone
            vang = Angle(90, 0, -90),
            wpos = Vector(8, 1.0, -7.38),
            wang = Angle(-8, 0, 180)
        },
        InstalledEles = {"weapon_sights", "weapon_dot"},
        ExtraSightDist = 4,
        CorrectivePos = Vector(2.15,0,-0.46),
        CorrectiveAng = Angle(-4.14, -3.623, 6.436)
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
        Slot = {"apex_hopup_turbo","apex_hopup_selfire2"}
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
            vpos = Vector(0.6, 0.6, -5), -- offset that the attachment will be relative to the bone
            vang = Angle(90, 0, -80),
            wpos = Vector(2.5, 1.8, -5.5),
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
            vpos = Vector(1.65, -4.10, 3.5), -- offset that the attachment will be relative to the bone
            vang = Angle(90, 0, -90),
            wpos = Vector(5.028, 2.5, -6.10),
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
            {p = 100, s = "weapons/havoc/Wpn_HavocAR_1P_FirstDraw_Foley_Raise_FR01_01.ogg", t = 1 / 35},
            {p = 100, s = "weapons/havoc/Wpn_HavocAR_1P_FirstDraw_Foley_Raise_FR12_01.ogg", t = 12 / 35},
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
        Source = {"fire"},
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
    },
    ["exit_inspect"] = {
        Source = "inspect_out",
    },
    ["idle_inspect"] = {
        Source = "inspect",
    },
    ["reload"] = {
        Source = "reload",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        SoundTable = {
            {p = 100, s = "weapons/havoc/Wpn_HavocAR_1P_Reload_Foley_Raise_FR01_01.ogg", t = 1 / 30},
            {p = 100, s = "weapons/havoc/Wpn_HavocAR_1P_Reload_Foley_ArmLower_FR23_01.ogg", t = 23 / 30},
            {p = 100, s = "weapons/havoc/Wpn_HavocAR_1P_Reload_Foley_GunUp_FR92_01.ogg", t = 92 / 30},
            {p = 100, s = "weapons/havoc/Wpn_HavocAR_1P_Reload_Foley_ShoulderPat_FR103_01.ogg", t = 103 / 30},

            {p = 100, s = "weapons/havoc/Wpn_HavocAR_1P_Reload_Mech_LockRelease_FR18_01.ogg", t = 18 / 30},
            {p = 100, s = "weapons/havoc/Wpn_HavocAR_1P_Reload_Mech_BarrelClose_FR25_01.ogg", t = 25 / 30},
            {p = 100, s = "weapons/havoc/Wpn_HavocAR_1P_Reload_Mech_CanisterEject_BurnOnly_FR30_01.ogg", t = 30 / 30},
            {p = 100, s = "weapons/havoc/Wpn_HavocAR_1P_Reload_Mech_CanisterEject_CanOnly_FR30_01.ogg", t = 30 / 30},
            {p = 100, s = "weapons/havoc/Wpn_HavocAR_1P_Reload_Mech_CanisterBounce_FR44_01.ogg", t = 44 / 30},
            {p = 100, s = "weapons/havoc/Wpn_HavocAR_1P_Reload_Mech_CanisterInsert_FR56_01.ogg", t = 56 / 30},
            {p = 100, s = "weapons/havoc/Wpn_HavocAR_1P_Reload_Mech_LockEnergy_FR80_01.ogg", t = 80 / 30},
            {p = 100, s = "weapons/havoc/Wpn_HavocAR_1P_Reload_Mech_LockEngage_FR80_01.ogg", t = 80 / 30},
            {p = 100, s = "weapons/havoc/Wpn_HavocAR_1P_Reload_Mech_LockPower_FR80_01.ogg", t = 80 / 30},
            {p = 100, s = "weapons/havoc/Wpn_HavocAR_1P_Reload_Mech_LockSpark_FR80_01.ogg", t = 80 / 30},
        },
    },
    ["reload_empty"] = {
        Source = "reload_empty",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        SoundTable = {
            {p = 100, s = "weapons/havoc/Wpn_HavocAR_1P_Reload_Foley_Raise_FR01_01.ogg", t = 1 / 30},
            {p = 100, s = "weapons/havoc/Wpn_HavocAR_1P_Reload_Foley_ArmLower_FR23_01.ogg", t = 23 / 30},
            {p = 100, s = "weapons/havoc/Wpn_HavocAR_1P_Reload_Foley_GunUp_FR92_01.ogg", t = 92 / 30},
            {p = 100, s = "weapons/havoc/Wpn_HavocAR_1P_Reload_Foley_ShoulderPat_FR103_01.ogg", t = 103 / 30},

            {p = 100, s = "weapons/havoc/Wpn_HavocAR_1P_Reload_Mech_LockRelease_FR18_01.ogg", t = 18 / 30},
            {p = 100, s = "weapons/havoc/Wpn_HavocAR_1P_Reload_Mech_BarrelClose_FR25_01.ogg", t = 25 / 30},
            {p = 100, s = "weapons/havoc/Wpn_HavocAR_1P_Reload_Mech_CanisterEject_BurnOnly_FR30_01.ogg", t = 30 / 30},
            {p = 100, s = "weapons/havoc/Wpn_HavocAR_1P_Reload_Mech_CanisterEject_CanOnly_FR30_01.ogg", t = 30 / 30},
            {p = 100, s = "weapons/havoc/Wpn_HavocAR_1P_Reload_Mech_CanisterBounce_FR44_01.ogg", t = 44 / 30},
            {p = 100, s = "weapons/havoc/Wpn_HavocAR_1P_Reload_Mech_CanisterInsert_FR56_01.ogg", t = 56 / 30},
            {p = 100, s = "weapons/havoc/Wpn_HavocAR_1P_Reload_Mech_LockEnergy_FR80_01.ogg", t = 80 / 30},
            {p = 100, s = "weapons/havoc/Wpn_HavocAR_1P_Reload_Mech_LockEngage_FR80_01.ogg", t = 80 / 30},
            {p = 100, s = "weapons/havoc/Wpn_HavocAR_1P_Reload_Mech_LockPower_FR80_01.ogg", t = 80 / 30},
            {p = 100, s = "weapons/havoc/Wpn_HavocAR_1P_Reload_Mech_LockSpark_FR80_01.ogg", t = 80 / 30},
        },
    },
    ["trigger"] = {
        Source = "fire_windup",
        MinProgress = 15 / 30,
        SoundTable = {
            {p = 100, s = "weapons/havoc/wpn_havoc_windup_1p.ogg", t = 0 / 30},
        },
    },
    ["trigger_sight"] = {
        Source = "iron_windup",
        MinProgress = 15 / 30,
        SoundTable = {
            {p = 100, s = "weapons/havoc/wpn_havoc_windup_1p.ogg", t = 0 / 30},
        },
    },
    ["untrigger"] = {
        Source = "fire_winddown",
        SoundTable = {
            {p = 100, s = "weapons/havoc/wpn_havoc_winddown_1p.ogg", t = 0 / 30},
        },
        MinProgress = 1.0,
    },
    ["untrigger_sight"] = {
        Source = "iron_winddown",
        SoundTable = {
            {p = 100, s = "weapons/havoc/wpn_havoc_winddown_1p.ogg", t = 0 / 30},
        },
        MinProgress = 1.0,
    },
}

SWEP.TriggerPullWhenEmpty = false

SWEP.TTTWeaponType = {"weapon_zm_mac10", "weapon_ttt_m16"}
SWEP.TTTWeight = 50

SWEP.O_Hook_Override_MuzzleEffect = function(wep,data)
    if wep:GetCurrentFiremode().Mode == 1 then
        return {current = "tfa_apex_energy_muzzle_medium"}
    end
end

SWEP.Hook_ModifyBodygroups = function(wep, data)
    local vm = data.vm
    if !IsValid(vm) then return end
    vm:SetSkin((wep.Attachments[5].Installed == "apex_skin_colored" and 2 or 0) + (wep.Attachments[4].Installed == "apex_hopup_turbo" and 1 or 0))
end