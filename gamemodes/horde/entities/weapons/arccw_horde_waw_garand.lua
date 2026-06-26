if not ArcCWInstalled then return end
if CLIENT then
    SWEP.WepSelectIcon = surface.GetTextureID( "arccw/weaponicons/arccw_horde_bo_hk21" )
    killicon.Add( "arccw_horde_bo_hk21", "arccw/weaponicons/arccw_horde_bo_hk21", Color( 0, 0, 0, 255 ) )
end

SWEP.Base = "arccw_base"

SWEP.Spawnable = true
SWEP.Category = "ArcCW - Horde"
SWEP.Slot = 2

SWEP.PrintName = "M1 Garand"
SWEP.Trivia_Class = "Battle Rifle"
SWEP.Trivia_Desc = "Iconic rifle from WW2."
SWEP.Trivia_Manufacturer = "Springfield"
SWEP.Trivia_Calibre = ".30-06 Springfield"
SWEP.Trivia_Mechanism = "Gas-Operated"
SWEP.Trivia_Country = "United States"
SWEP.Trivia_Year = "1937"

SWEP.ViewModel = "models/horde/weapons/waw/garand/c_waw_garand.mdl"
SWEP.WorldModel = "models/weapons/w_snip_g3sg1.mdl"

SWEP.Damage = 120
SWEP.DamageMin = 40
SWEP.Range = 125

SWEP.ChamberSize = 0
SWEP.Primary.ClipSize = 8

SWEP.Recoil = 3
SWEP.RecoilSide = 1.5
SWEP.RecoilRise = 0.1
SWEP.MaxRecoilBlowback = 0
SWEP.VisualRecoilMult = 0
SWEP.RecoilPunch = 0
SWEP.RecoilPunchBackMax = 0
SWEP.RecoilPunchBackMaxSights = 0
SWEP.RecoilVMShake = 0

SWEP.Delay = 60 / 400
SWEP.Firemodes = {
    {
        Mode = 1,
    }
}

SWEP.NotForNPCS = true

SWEP.AccuracyMOA = 5
SWEP.HipDispersion = 500
SWEP.MoveDispersion = 250

SWEP.ShootVol = 80

SWEP.ShootSound = ")horde/weapons/waw_garand/fire.wav"
SWEP.ActShootSound = ")horde/weapons/waw_garand/fire_act.wav"
SWEP.ShootSoundSilenced = {
    ")horde/weapons/bo_shared/silenced/m16_silenced_00.wav",
    ")horde/weapons/bo_shared/silenced/m16_silenced_01.wav",
    ")horde/weapons/bo_shared/silenced/m16_silenced_02.wav",
    ")horde/weapons/bo_shared/silenced/m16_silenced_03.wav",
    ")horde/weapons/bo_shared/silenced/m16_silenced_04.wav"
}
SWEP.ActShootSoundSilenced = ")horde/weapons/waw_garand/fire_act.wav"
SWEP.DistantShootSound = ")horde/weapons/waw_garand/fire_distant.wav"

SWEP.MuzzleEffect = "muzzleflash_1"

SWEP.IronSightStruct = {
    Pos = Vector( -1.535, 0, 0.8855 ),
    Ang = Angle( -0.95, 0, 0 ),
    Magnification = 1.1,
}

SWEP.HoldtypeHolstered = "passive"
SWEP.HoldtypeActive = "ar2"
SWEP.HoldtypeSights = "rpg"

SWEP.ActivePos = Vector( 0.8, 3, 0 )
SWEP.ActiveAng = Angle( 0, 0, 0 )

SWEP.RejectAttachments = {

    -- GSO
    ["go_optic_acog"] = true,
    ["go_optic_acog2"] = true,
    ["go_optic_awp"] = true,
    ["go_optic_barska"] = true,
    ["go_optic_cmore"] = true,
    ["go_optic_compm4"] = true,
    ["go_optic_elcan"] = true,
    ["go_optic_eotech"] = true,
    ["go_optic_hamr"] = true,
    -- ["go_optic_hunter"] = false,
    ["go_optic_kobra"] = true,
    ["go_optic_lp_rmr"] = true,
    ["go_optic_lp_t1"] = true,
    ["go_optic_pvs4"] = true,
    -- ["go_optic_schmidt"] = false,
    ["go_optic_sg1"] = true,
    ["go_optic_ssr"] = true,
    ["go_optic_t1"] = true,

    -- MW2
    ["optic_cheytacscope"] = true,
    ["optic_m82scope"] = true,
    ["optic_mw2_augscope"] = true,
    ["optic_mw2_mars"] = true,
    ["optic_mw2_susat"] = true,
    ["optic_mw2_tuna"] = true

}

SWEP.AttachmentElements = {
    ["mount"] = {
        VMBodygroups = {
            { ind = 1, bg = 1 },
        },
    },
    ["silencer"] = {
        VMElements = {
            {
                Model = "models/weapons/arccw/fesiugmw2/atts/supp_mw2.mdl",
                Bone = "tag_weapon",
                Offset = {
                    pos = Vector( 25, 0, 1.6 ),
                    ang = Angle( 0, 0, 0 ),
                },
                Scale = Vector( 0.8, 0.6, 0.6 ),
            }
        },
    },
}

SWEP.Attachments = {
    {
        PrintName = "Sights",
        DefaultAttName = "Iron Sights",
        Slot = "optic",
        Bone = "tag_weapon",
        Offset = {
            vpos = Vector( -2, -0.17, 1.95 ),
            vang = Angle( 0, 0, 0 ),
        },
        InstalledEles = { "mount" }
    },
    {
        PrintName = "Muzzle",
        DefaultAttName = "Standard Muzzle",
        Slot = "horde_bo_muzzle",
        Bone = "tag_weapon",
        Offset = {
            vpos = Vector( 0.5, 0, 4.4 ),
            vang = Angle( 0, 0, 0 ),
        },
    },
    {
        PrintName = "Ammo Type",
        DefaultAttName = "Standard Ammo",
        Slot = "go_ammo"
    },
    {
        PrintName = "Perk",
        Slot = "go_perk"
    },
    {
        PrintName = "Charm",
        Slot = "charm",
        FreeSlot = true,
        Bone = "tag_weapon",
        Offset = {
            vpos = Vector( 18.5, -0.725, 2.3 ),
            vang = Angle( 0, 0, 0 ),
        },
        NoWM = true,
    },
}

SWEP.ExtraSightDist = 5

SWEP.Animations = {
    ["ready"] = {
        Source = "first_draw"
    },
    ["draw"] = {
        Source = "draw"
    },
    ["draw_empty"] = {
        Source = "draw_empty"
    },
    ["holster"] = {
        Source = "holster"
    },
    ["holster_empty"] = {
        Source = "holster_empty"
    },
    ["reload"] = {
        Source = "reload",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        LHIK = true,
        LHIKIn = 0.2,
        LHIKOut = 0.5
    },
    ["reload_empty"] = {
        Source = "reload_empty",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2
    },
    ["fire"] = {
        Source = "fire"
    },
    ["fire_empty"] = {
        Source = "fire_last",
        SoundTable = {
            { s = ")horde/weapons/waw_garand/ping.wav", t = 0 },
        }
    },
    ["fire_iron"] = {
        Source = "fire_ads"
    },
    ["fire_iron_empty"] = {
        Source = "fire_last_ads",
        SoundTable = {
            { s = ")horde/weapons/waw_garand/ping.wav", t = 0 },
        }
    },
    ["idle"] = {
        Source = "idle"
    },
    ["idle_empty"] = {
        Source = "idle_empty"
    }
}

sound.Add( {
    name = "ArcCW_Horde_BO_HK21.Reload",
    volume = 1.0,
    sound = {
        "horde/weapons/bo_shared/foley/fly_gear_reload_plr_00.wav",
        "horde/weapons/bo_shared/foley/fly_gear_reload_plr_01.wav",
        "horde/weapons/bo_shared/foley/fly_gear_reload_plr_02.wav",
        "horde/weapons/bo_shared/foley/fly_gear_reload_plr_03.wav"
    }
} )

sound.Add( {
    name = "ArcCW_Horde_BO_HK21.Pickup",
    volume = 1.0,
    sound = {
        ")horde/weapons/bo_shared/foley/pickup_00.wav",
        ")horde/weapons/bo_shared/foley/pickup_01.wav",
        ")horde/weapons/bo_shared/foley/pickup_02.wav"
    }
} )

sound.Add( {
    name = "ArcCW_Horde_BO_HK21.Rattle",
    volume = 1.0,
    sound = {
        ")horde/weapons/bo_shared/foley/rattle_00.wav",
        ")horde/weapons/bo_shared/foley/rattle_01.wav",
        ")horde/weapons/bo_shared/foley/rattle_02.wav",
        ")horde/weapons/bo_shared/foley/rattle_03.wav",
        ")horde/weapons/bo_shared/foley/rattle_04.wav"
    }
} )

function SWEP:DoShootSound( sndoverride, _, voloverride, pitchoverride )
    local fsound = self.ShootSound
    local asound = self.ActShootSound
    local dsound = self.DistantShootSound

    local suppressed = self:GetBuff_Override( "Silencer" )

    if suppressed then
        fsound = self.ShootSoundSilenced
        asound = self.ActShootSoundSilenced
        dsound = self.DistantShootSoundSilenced
    end

    fsound = self:GetBuff_Hook( "Hook_GetShootSound", fsound )

    local volume = self.ShootVol
    local spv = self.ShootPitchVariation
    local pitch  = self.ShootPitch * math.Rand( 1 - spv, 1 + spv ) * self:GetBuff_Mult( "Mult_ShootPitch" )

    local v = GetConVar( "arccw_weakensounds" ):GetFloat()

    volume = volume - v
    volume = volume * self:GetBuff_Mult( "Mult_ShootVol" )

    volume = math.Clamp( volume, 60, 140 )
    pitch = math.Clamp( pitch, 0, 255 )

    if sndoverride then fsound = sndoverride end
    if voloverride then volume = voloverride end
    if pitchoverride then pitch = pitchoverride end

    if fsound then self:MyEmitSound( fsound, volume, pitch, 1, CHAN_STATIC ) end
    if asound then self:MyEmitSound( asound, volume, pitch, 1, CHAN_AUTO ) end
    if dsound then self:MyEmitSound( dsound, volume, pitch, 0.5, CHAN_WEAPON ) end

    local data = {
        sound = fsound,
        volume = volume,
        pitch = pitch,
    }

    self:GetBuff_Hook( "Hook_AddShootSound", data )
end