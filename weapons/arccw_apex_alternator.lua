if CLIENT then
    killicon.Add( "arccw_apex_alternator", "VGUI/apex_killicon_alternator", Color(251, 85, 25, 255))
    SWEP.WepSelectIcon = surface.GetTextureID("VGUI/apex_alternator")
end

SWEP.Base = "arccw_apex_base"
SWEP.Spawnable = true -- this obviously has to be set to true
SWEP.Category = "ArcCW - Apex Legends" -- edit this if you like
SWEP.AdminOnly = false

SWEP.PrintName = "Alternator SMG"
SWEP.Trivia_Class = "Submachine Gun"
SWEP.Trivia_Desc = "A high-damage submachine gun that fires from its two alternating barrels."
SWEP.Trivia_Manufacturer = "Burrell Defense"

SWEP.Slot = 2

SWEP.CrouchPos = Vector(-4.5, -1.5, 1)
SWEP.CrouchAng = Angle(1.589, 0.793, -50.437)

SWEP.SprintPos = Vector(0, 0, 0)
SWEP.SprintAng = Angle(0, 0, 0)

SWEP.ActivePos = Vector(0, -1.5, 1)
SWEP.ActiveAng = Angle(0, 0, 0)

SWEP.CustomizePos = Vector(0, 0, 0)
SWEP.CustomizeAng = Angle(0 , 0, 0)

SWEP.BarrelOffsetSighted = Vector(0, 0, -1)
SWEP.BarrelOffsetHip = Vector(2, 0, -2)

SWEP.NPCWeaponType = "weapon_smg1"
SWEP.NPCWeight = 250


SWEP.UseHands = true

SWEP.ViewModel = "models/weapons/c_apex_alternator.mdl"
SWEP.WorldModel = "models/weapons/w_apex_alternator.mdl"
-- SWEP.MirrorVMWM = true
-- SWEP.WorldModelOffset = {
    -- pos = Vector(-10, 4.5, -3.5),
    -- ang = Angle(-10, 0, 180-5)
-- }

SWEP.ViewModelFOV = 65

SWEP.Damage = 16
SWEP.DamageMin = 16
SWEP.Range = 55
SWEP.Penetration = 4
SWEP.PhysBulletMuzzleVelocity = 19500 * ArcCW.HUToM

SWEP.Apex_Balance = {
    [1] = {
        Damage = 21,
        DamageMin = 16,
    },
    [2] = {
        Damage = 13,
        DamageMin = 13,
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

SWEP.TracerNum = 1 -- tracer every X
SWEP.Tracer = "arccw_apex_tracer_smg" -- override tracer (hitscan) effect
SWEP.TracerWidth = 5

SWEP.ChamberSize = 0
SWEP.Primary.ClipSize = 19
SWEP.MaxRecoilBlowback = 1

SWEP.Recoil = 0.4
SWEP.RecoilSide = 0.25
SWEP.RecoilRise = 0.55
SWEP.RecoilPunch = 2.5
SWEP.RecoilVMShake = 0.2

SWEP.Delay = 60 / 600 -- 60 / RPM.
SWEP.Num = 1 -- number of shots per trigger pull.

SWEP.Firemodes = {
    {
        Mode = 2,
    }
}

SWEP.AccuracyMOA = 6 -- accuracy in Minutes of Angle. There are 60 MOA in a degree.
SWEP.HipDispersion = 250 -- inaccuracy added by hip firing.
SWEP.MoveDispersion = 125
SWEP.JumpDispersion = 300

SWEP.SightedSpeedMult = 0.75

SWEP.Primary.Ammo = "apex_light"

SWEP.ShootVol = 120 -- volume of shoot sound
SWEP.ShootPitch = 100 -- pitch of shoot sound

SWEP.ShootSound = "ArcCW_APEX.Alternator.Fire"
SWEP.ShootDrySound = "ArcCW_APEX.SMG_Dry_E"
SWEP.ShootSoundSilenced = ""
SWEP.DistantShootSound = ""

SWEP.MuzzleEffect = "tfa_apex_muzzle_smg"
SWEP.ShellModel = "models/shells/shelleject_pistol.mdl"
SWEP.ShellPitch = 100
SWEP.ShellScale = 1.2
SWEP.ShellTime = 1

SWEP.MuzzleEffectAttachment = 1 -- which attachment to put the muzzle on
SWEP.CaseEffectAttachment = 2 -- which attachment to put the case effect on
SWEP.CamAttachment = 3

SWEP.BarrelLength = 12

SWEP.ProceduralRegularFire = false
SWEP.ProceduralIronFire = false

SWEP.CaseBones = {}

SWEP.IronSightStruct = {
    Pos = Vector(0, -0.5, 0),
    Ang = Angle(0, 0, 0),
    Magnification = 1.2,
        Midpoint = { -- Where the gun should be at the middle of it's irons
        Pos = Vector(0, 0, 0),
        Ang = Angle(0, 0, 0),
    },
}

SWEP.HoldtypeHolstered = "passive"
SWEP.HoldtypeActive = "revolver"
SWEP.HoldtypeSights = "revolver"

SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_SMG1

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
        Slot = "apex_sights", -- what kind of attachments can fit here, can be string or table
        Bone = "ja_ads_attachment", -- relevant bone any attachments will be mostly referring to
        Offset = {
            vpos = Vector(0, 0, 0), -- offset that the attachment will be relative to the bone
            vang = Angle(90, 0, -90),
            wpos = Vector(2.6, 1.2, -4.90),
            wang = Angle(-10.216, 0, 180)
        },
        InstalledEles = {"weapon_sights"},
         CorrectivePos = Vector(1.665,0,-0.77),
         CorrectiveAng = Angle(0.045, -0.683, 3.746)
    },
    {
        PrintName = "Muzzle",
        Slot = {"apex_muzzle", "apex_muzzle_smgs"},
        Bone = "def_c_suppressor",
        Offset = {
            vpos = Vector(0, 0, 0),
            vang = Angle(90, 0, -90),
            wpos = Vector(9.5, 1.2, -5),
            wang = Angle(-10, 0, 180)
        },
    },
    {
        PrintName = "Stock",
        Slot = {"apex_stock_standard", "apex_stock_precision"}
    },
    {
        PrintName = "Magazine",
        Slot = {"apex_mag_light4"}
    },
    {
        PrintName = "Hop-up",
        Slot = {"apex_hopup_dtap4","apex_hopup_disruptor"}
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
            vpos = Vector(0.6, -0.15, -2.35), -- offset that the attachment will be relative to the bone
            vang = Angle(90, 0, -80),
            wpos = Vector(1.7, 1.8, -4.9),
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
            vpos = Vector(0.85, -4, 2), -- offset that the attachment will be relative to the bone
            vang = Angle(90, 0, -90),
            wpos = Vector(3.5, 2, -4),
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
            {p = 100, s = "ArcCW_APEX.Alternator.first_pullout.CLOTH_f00.", t = 0 / 30},
            {p = 100, s = "ArcCW_APEX.Alternator.first_pullout.FOLEY_f00", t = 0 / 30},
            {p = 100, s = "ArcCW_APEX.Alternator.first_pullout.FOLEY_f26", t = 26 / 30},
            {p = 100, s = "ArcCW_APEX.Alternator.first_pullout.MECH_f08", t = 8 / 30}
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
        Source = "fire",
        ShellEjectAt = 0,
    },
    ["fire2"] = {
        Source = "fire2",
        ShellEjectAt = 0,
    },
    ["enter_sight"] = {
        Source = "iron_in",
    },
    ["fire_sight"] = {
        Source = "iron_fire",
        ShellEjectAt = 0,
    },
    ["fire_sight2"] = {
        Source = "iron_fire2",
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
        LHIK = true,
        LHIKIn = 0.2,
        LHIKOut = 0.4,
        LHIKEaseOut = 0.2,
        MinProgress = 60 / 40,
		Mult = 0.9,
        SoundTable = {
            {p = 100, s = "ArcCW_APEX.Alternator.Empty_Reload.Cloth_0", t = 0 / 30},
            {p = 100, s = "ArcCW_APEX.Alternator.Empty_Reload.Foley_28", t = 32 / 30},
            {p = 100, s = "ArcCW_APEX.Alternator.Empty_Reload.Foley_77", t = 64 / 30},
            {p = 100, s = "ArcCW_APEX.Alternator.Empty_Reload.ClipIn", t = 49 / 30},
            {p = 100, s = "ArcCW_APEX.Alternator.Empty_Reload.ClipOut", t = 12 / 30}
    },
    },
    ["reload_empty"] = {
        Source = "reload_empty",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        LHIK = true,
        LHIKIn = 0.2,
        LHIKOut = 0.5,
        LHIKEaseOut = 0.2,
        MinProgress = 97 / 40,
		Mult = 0.9,
        SoundTable = {
            {p = 100, s = "ArcCW_APEX.Alternator.Empty_Reload.Cloth_0", t = 0 / 30},
            {p = 100, s = "ArcCW_APEX.Alternator.Empty_Reload.Cloth_45", t = 45 / 30},
            {p = 100, s = "ArcCW_APEX.Alternator.Empty_Reload.Foley_28", t = 28 / 30},
            {p = 100, s = "ArcCW_APEX.Alternator.Empty_Reload.Foley_77", t = 77 / 30},
            {p = 100, s = "ArcCW_APEX.Alternator.Empty_Reload.ClipOut", t = 12 / 30},
            {p = 100, s = "ArcCW_APEX.Alternator.Empty_Reload.ClipIn", t = 49 / 30},
            {p = 100, s = "ArcCW_APEX.Alternator.Empty_Reload.PullBolt", t = 70 / 30}
        },
    },
}

-- Alternate between the left/right fire animation
SWEP.Hook_SelectFireAnimation = function(wep, data)
    if wep:GetNthShot() % 2 == 0 then
        return wep:GetNWState() == ArcCW.STATE_SIGHTS and "fire_sight2" or "fire2"
    else
        return wep:GetNWState() == ArcCW.STATE_SIGHTS and "fire_sight" or "fire"
    end
end

SWEP.O_Hook_Override_CaseEffectAttachment = function(wep,data)
	if wep:GetNthShot() % 2 == 0 then
		return {current = 4}
	else
		return {current = 2}
	end
end

SWEP.TTTWeaponType = "weapon_ttt_m16"
SWEP.TTTWeight = 100