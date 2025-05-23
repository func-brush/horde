if not ArcCWInstalled then return end
-- Referenced From GSO
ENT.Type = "anim"
ENT.Base = "base_entity"
ENT.PrintName = "MEDIC MISSILE"
ENT.Author = ""
ENT.Information = ""
ENT.Spawnable = false
ENT.AdminSpawnable = false

ENT.Model = "models/weapons/w_medic_missile.mdl"
ENT.FuseTime = 1
ENT.ArmTime = 1
ENT.Duration = 5
ENT.ImpactFuse = true
ENT.IsGravityEnabled = false
ENT.Armed = false

ENT.NextDamageTick = 0
ENT.TouchDamageTick = 0
--ENT.CollisionGroup = COLLISION_GROUP_PLAYER_MOVEMENT
ENT.Ticks = 0
ENT.TouchedEntities = {}

AddCSLuaFile()

local entmeta = FindMetaTable("Entity")

function entmeta:Horde_AddEffect_RPGMedicGrenade(ent)
	local owner = self:GetOwner()
	if self.horde_effect_medicmissile then return end
	self.horde_effect_medicmissile = true
	local id = self:GetCreationID()
	timer.Create("Horde_MedicRPGMedicGrenade" .. id, 0.5, 0, function ()
		if not self:IsValid() then timer.Remove("Horde_RPGMedicGrenade" .. id) return end
		if self:IsPlayer() then
			local healinfo = HealInfo:New({amount = 20, healer = ent.Owner})
			HORDE:OnPlayerHeal(self, healinfo)
		elseif ent:GetClass() == "npc_vj_horde_antlion" then
			local healinfo = HealInfo:New({amount = 15, healer = owner})
			HORDE:OnAntlionHeal(ent, healinfo)
		elseif ent:IsValid() and ent.Owner:IsValid() and ent.Inflictor:IsValid() and self:IsNPC() and (not self:GetNWEntity("HordeOwner"):IsValid()) then
			local d = DamageInfo()
			d:SetDamage(50)
			d:SetAttacker(ent.Owner)
			d:SetInflictor(ent.Inflictor)
			d:SetDamageType(DMG_NERVEGAS)
			d:SetDamagePosition(self:GetPos())
			self:TakeDamageInfo(d)
			self:Horde_AddDebuffBuildup(HORDE.Status_Break, d:GetDamage() * 0.5, ent:GetOwner(), self:GetPos())
		end
	end)
end

function entmeta:Horde_RemoveEffect_RPGMedicGrenade()
	if self.horde_effect_medicmissile then
		timer.Remove("Horde_MedicRPGMedicGrenade" .. self:GetCreationID())
		self.horde_effect_medicmissile = nil
	end
end

function ENT:SetupDataTables()
	self:NetworkVar( "Bool", 0, "Armed" )
	if SERVER then
		self:SetArmed(false)
	end
end

function ENT:Initialize()
	ParticleEffectAttach("antlion_spit_trail", PATTACH_ABSORIGIN_FOLLOW, self, 0)
	--ParticleEffect("antlion_gib_01_juice", self:GetPos(), Angle(0,0,0), nil)
	if SERVER then
			self:SetModel(self.Model)
			self:SetMoveType(MOVETYPE_VPHYSICS)
			self:SetSolid(SOLID_VPHYSICS)
			self:PhysicsInit(SOLID_VPHYSICS)
			self:SetMoveCollide(COLLISION_GROUP_PROJECTILE)
			self:SetCollisionGroup(COLLISION_GROUP_PROJECTILE)
			self:DrawShadow(false)
		--self:SetColor(Color(0,255,0))
		local phys = self:GetPhysicsObject()
		if phys:IsValid() then
			phys:Wake()
			phys:SetBuoyancyRatio(0)
			phys:EnableGravity(false)
			phys:EnableDrag(false)
		end

		self.SpawnTime = CurTime()

		timer.Simple(0, function()
			if not IsValid(self) then return end
			self:SetCollisionGroup(COLLISION_GROUP_PROJECTILE)
		end)
	end
end

function ENT:Think()
	if not self.SpawnTime then self.SpawnTime = CurTime() end

	if self:GetArmed() == true then
		if SERVER then
			if self.NextDamageTick > CurTime() then return end
			self.NextDamageTick = CurTime() + 0.5
			self.ArcCW_Killable = false
		else
			if not self.emitter then self.emitter = ParticleEmitter(self:GetPos()) end
			if self.Ticks % 5 == 0 then
				local smoke = self.emitter:Add("particles/smokey", self:GetPos() + VectorRand() * 50)
				smoke:SetGravity( Vector(0, 0, 1500) )
				smoke:SetDieTime( math.Rand(0.25, 0.5) )
				smoke:SetStartAlpha(10)
				smoke:SetEndAlpha(0)
				smoke:SetStartSize(10)
				smoke:SetEndSize(150)
				smoke:SetRoll( math.Rand(-180, 180) )
				smoke:SetRollDelta( math.Rand(-0.2,0.2) )
				smoke:SetColor(50, 200, 50)
				smoke:SetAirResistance(1000)
				smoke:SetLighting( false )
				smoke:SetCollide(false)
				smoke:SetBounce(0)
				smoke:SetNextThink(CurTime() + FrameTime())
				smoke:SetThinkFunction( function(pa)
				if not pa then return end
					local col1 = Color(105, 255, 50)
					local col2 = Color(50, 200, 50)
					local col3 = col1
					local d = pa:GetLifeTime() / pa:GetDieTime()
					col3.r = Lerp(d, col1.r, col2.r)
					col3.g = Lerp(d, col1.g, col2.g)
					col3.b = Lerp(d, col1.b, col2.b)
					pa:SetColor(col3.r, col3.g, col3.b)
					pa:SetNextThink(CurTime() + FrameTime())
				end)
			end
			if not self:IsValid() or self:WaterLevel() > 2 then return end
			if not IsValid(emitter) then return end
			self.Ticks = self.Ticks + 1
		end
	end
end

function ENT:OnRemove()
	if SERVER then
		for _, ent in pairs(self.TouchedEntities) do
			if ent:IsValid() then ent:Horde_RemoveEffect_RPGMedicGrenade() end
		end
	end
end

function ENT:Detonate()
	local owner = self:GetOwner()
	if not self:IsValid() then return end
	if self:GetArmed() == true then return end
	self:SetArmed(true)
	self.Armed = true
	self:EmitSound("arccw_go/smokegrenade/smoke_emit.wav", 160, 100, 1, CHAN_AUTO)

	timer.Simple(7.5, function()
		if not IsValid(self) then return end
		self:Remove()
	end)

	if SERVER then
		ParticleEffect("antlion_gib_01_juice", self:GetPos(), Angle(0, 0, 0), nil)
		local e1 = EffectData()
		e1:SetOrigin(self:GetPos())
		e1:SetScale(2)
		util.Effect("spore_explosion", e1, true, true)
		ParticleEffect("antlion_gib_02_floaters", self:GetPos(), Angle(0, 0, 0), nil)

		local dmg = DamageInfo()
		dmg:SetAttacker(owner)
		dmg:SetInflictor(owner)
		dmg:SetDamageType(DMG_NERVEGAS)
		dmg:SetDamage(300)
		dmg:SetDamageCustom(HORDE.DMG_PLAYER_FRIENDLY)
		util.BlastDamageInfo(dmg, self:GetPos(), 200)

		for _, ent in pairs(ents.FindInSphere(self:GetPos(), 200)) do
			if ent:IsPlayer() then
				self:ApplyHealingOverTime(ent, owner, 20)
			elseif ent:GetClass() == "npc_vj_horde_antlion" then
				self:ApplyHealingOverTime(ent, owner, 15)
			elseif ent:IsValid() and ent:IsNPC() then
				self:ApplyDamageOverTime(ent, owner, 50)
				ent:Horde_AddDebuffBuildup(HORDE.Status_Break, dmg:GetDamage(), owner, self:GetPos())
			end
		end
		self:Remove()
	end
end

function ENT:PhysicsCollide(data, physobj)
	if SERVER then
		if data.Speed > 75 then
			self:EmitSound(Sound("physics/metal/metal_grenade_impact_hard" .. math.random(1,3) .. ".wav"))
		elseif data.Speed > 25 then
			self:EmitSound(Sound("physics/metal/metal_grenade_impact_soft" .. math.random(1,3) .. ".wav"))
		end
		self:Detonate()
	end
end

function ENT:ApplyHealingOverTime(ent, healer, amount)
	local id = ent:GetCreationID()
	timer.Create("Horde_MedicMissile_Heal_" .. id, 0.5, 15, function()
		if not IsValid(ent) then timer.Remove("Horde_MedicMissile_Heal_" .. id) return end
		local healinfo = HealInfo:New({amount = amount, healer = healer})
		HORDE:OnPlayerHeal(ent, healinfo)
	end)
end

function ENT:ApplyDamageOverTime(ent, attacker, amount)
	local id = ent:GetCreationID()
	local inflictor = attacker
	timer.Create("Horde_MedicMissile_Damage_" .. id, 0.5, 15, function()
		if not IsValid(ent) or not IsValid(inflictor) then
		timer.Remove("Horde_MedicMissile_Damage_" .. id) return end
		local dmg = DamageInfo()
		dmg:SetAttacker(attacker)
		dmg:SetInflictor(inflictor)
		dmg:SetDamageType(DMG_NERVEGAS)
		dmg:SetDamage(amount)
		ent:TakeDamageInfo(dmg)
	end)
end

function ENT:DrawTranslucent()
	self:Draw()
end

function ENT:Draw()
	if CLIENT then
		self:DrawModel()
		if not self:GetArmed() then return end
	end
end
