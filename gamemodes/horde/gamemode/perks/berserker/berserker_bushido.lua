PERK.PrintName = "Bushido"
PERK.Description = "{1} increased Slashing damage.\n{2} increased movement speed."
PERK.Icon = "materials/perks/bushido.png"
PERK.Params = {
    [1] = { value = 0.3, percent = true },
    [2] = { value = 0.2, percent = true },
}

PERK.Hooks = {}

PERK.Hooks.Horde_OnPlayerDamage = function (ply, npc, bonus, hitgroup, dmginfo)
    if not ply:Horde_GetPerk("berserker_bushido")  then return end
    if HORDE:IsSlashDamage(dmginfo) then
        bonus.increase = bonus.increase + 0.3
    end
end

PERK.Hooks.Horde_PlayerMoveBonus = function(ply, bonus_walk, bonus_run, bonus_jump)
    if not ply:Horde_GetPerk("berserker_bushido") then return end
    bonus_walk.increase = bonus_walk.increase + 0.2
    bonus_run.increase = bonus_run.increase + 0.2
    bonus_jump.increase = bonus_jump.increase + 0.2
end