if not ArcCWInstalled then return end
if CLIENT then
    SWEP.WepSelectIcon = surface.GetTextureID( "arccw/weaponicons/arccw_waw_mp40" )
    killicon.Add( "arccw_horde_mp40", "arccw/weaponicons/arccw_waw_mp40", Color( 0, 0, 0, 255 ) )
end

SWEP.Base = "arccw_base"

SWEP.Spawnable = true
SWEP.Category = "ArcCW - Horde"
SWEP.Slot = 2

SWEP.PrintName = "MP40"
SWEP.Trivia_Class = "Submachine Gun"
SWEP.Trivia_Desc = "German submachine gun in 9mm. The weight and slow fire-rate makes for a low recoil weapon."
SWEP.Trivia_Manufacturer = "Erma Werke"
SWEP.Trivia_Calibre = "9x19mm Parabellum"
SWEP.Trivia_Mechanism = "Straight Blowback"
SWEP.Trivia_Country = "Nazi Germany"
SWEP.Trivia_Year = "1940"

SWEP.ViewModel = "models/weapons/arccw/c_waw_mp40.mdl"
SWEP.WorldModel = "models/weapons/w_smg1.mdl"

SWEP.Damage = 32
SWEP.DamageMin = 14
SWEP.Range = 90

SWEP.ChamberSize = 0
SWEP.Primary.ClipSize = 32

SWEP.Recoil = 0.15
SWEP.RecoilSide = 0.02
SWEP.RecoilRise = 0.1
SWEP.MaxRecoilBlowback = 0
SWEP.VisualRecoilMult = 0
SWEP.RecoilPunch = 0
SWEP.RecoilPunchBackMax = 0
SWEP.RecoilPunchBackMaxSights = 0
SWEP.RecoilVMShake = 0

SWEP.Delay = 60 / 550
SWEP.Firemodes = {
    {
        Mode = 2,
    }
}

SWEP.NotForNPCS = true

SWEP.AccuracyMOA = 10
SWEP.HipDispersion = 250
SWEP.MoveDispersion = 100

SWEP.ShootVol = 80

SWEP.ShootSound = {
    ")horde/weapons/waw_mp40/fire_01.wav",
    ")horde/weapons/waw_mp40/fire_02.wav",
    ")horde/weapons/waw_mp40/fire_03.wav",
    ")horde/weapons/waw_mp40/fire_04.wav",
    ")horde/weapons/waw_mp40/fire_05.wav"
}
SWEP.LowShootSound = "horde/weapons/waw_mp40/fire_lfe.wav"
SWEP.ShootSoundSilenced = {
    ")horde/weapons/bo_shared/silenced/m16_silenced_00.wav",
    ")horde/weapons/bo_shared/silenced/m16_silenced_01.wav",
    ")horde/weapons/bo_shared/silenced/m16_silenced_02.wav",
    ")horde/weapons/bo_shared/silenced/m16_silenced_03.wav",
    ")horde/weapons/bo_shared/silenced/m16_silenced_04.wav"
}
SWEP.LowShootSoundSilenced = "horde/weapons/waw_mp40/fire_lfe.wav"
SWEP.DistantShootSound = ")horde/weapons/waw_mp40/fire_distant.wav"

SWEP.MuzzleEffect = "muzzleflash_smg"

SWEP.IronSightStruct = {
    Pos = Vector( -1.72, -6, 0 ),
    Ang = Angle( 1.75, -1.1, 0 ),
    Magnification = 1.1,
}

SWEP.HoldtypeHolstered = "passive"
SWEP.HoldtypeActive = "smg"
SWEP.HoldtypeSights = "rpg"

SWEP.ActivePos = Vector( 2, -4, -2 )
SWEP.ActiveAng = Angle( 2, -1, 0 )

SWEP.SprintPos = Vector( 8, -4, -2 )
SWEP.SprintAng = Angle( -7.036, 45.016, 0 )

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
    ["go_optic_hunter"] = true,
    ["go_optic_kobra"] = true,
    ["go_optic_lp_rmr"] = true,
    ["go_optic_lp_t1"] = true,
    ["go_optic_pvs4"] = true,
    ["go_optic_schmidt"] = true,
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
            { ind = 2, bg = 1 },
        },
        VMElements = {
            {
                Model = "models/weapons/arccw/fesiugmw2/atts/pistolrail_1.mdl",
                Bone = "tag_weapon",
                Scale = Vector( 1, 1, 1 ),
                Offset = {
                    pos = Vector( 2.8, -0.5, -0.3 ),
                    ang = Angle( 0, 0, 0 ),
                }
            },
        },
    },
    ["silencer"] = {
        VMElements = {
            {
                Model = "models/weapons/arccw/fesiugmw2/atts/supp_mw2.mdl",
                Bone = "tag_weapon",
                Offset = {
                    pos = Vector( 14.5, -0.5, 0.9 ),
                    ang = Angle( 0, 0, 0 ),
                },
                Scale = Vector( 0.6, 0.45, 0.45 ),
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
            vpos = Vector( 2.3, -0.5, 2.2 ),
            vang = Angle( 0, 0, 0 ),
        },
        InstalledEles = { "mount" },
        CorrectiveAng = Angle( -3, 0, 0 )
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
    ["idle"] = {
        Source = "idle",
        Time = 0,
    },
    ["idle_empty"] = {
        Source = "idle_empty",
        Time = 0,
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
    ["ready"] = {
        Source = "draw"
    },
    ["fire"] = {
        Source = "fire",
        ShellEjectAt = 0,
    },
    ["fire_iron"] = {
        Source = "fire",
        ShellEjectAt = 0,
    },
    ["fire_empty"] = {
        Source = "fire_empty",
        ShellEjectAt = 0,
    },
    ["fire_iron_empty"] = {
        Source = "fire_empty",
        ShellEjectAt = 0,
    },
    ["reload"] = {
        Source = "reload",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_SMG1,
    },
    ["reload_empty"] = {
        Source = "reload_empty",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_SMG1,
    },
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
    local lsound = self.LowShootSound
    local dsound = self.DistantShootSound

    local suppressed = self:GetBuff_Override( "Silencer" )

    if suppressed then
        fsound = self.ShootSoundSilenced
        lsound = self.LowShootSoundSilenced
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
    if lsound then self:MyEmitSound( lsound, 75, 100, 0.5, CHAN_BODY ) end
    if dsound then self:MyEmitSound( dsound, volume, pitch, 1, CHAN_WEAPON ) end

    local data = {
        sound = fsound,
        volume = volume,
        pitch = pitch,
    }

    self:GetBuff_Hook( "Hook_AddShootSound", data )
end