AddCSLuaFile()

if (CLIENT) then
    SWEP.PrintName      = "Beanbag Shotgun"
    SWEP.DrawAmmo       = true
    SWEP.DrawCrosshair  = true
end

SWEP.Category       = "HL2 RP"
SWEP.Author         = "gm1003 ツ"
SWEP.Instructions   = "Primary Fire: Shoot Bag"
SWEP.Drop           = false

SWEP.HoldType   = "shotgun"

SWEP.Spawnable = true
SWEP.AdminOnly = true

SWEP.Primary.ClipSize       = 1
SWEP.Primary.DefaultClip    = 1
SWEP.Primary.Automatic      = false
SWEP.Primary.Ammo           = "buckshot"

SWEP.Weight         = 5
SWEP.AutoSwitchTo   = false
SWEP.AutoSwitchFrom = false
SWEP.Slot           = 1
SWEP.SlotPos        = 2

SWEP.ViewModel  = "models/weapons/c_shotgun.mdl"
SWEP.WorldModel = "models/weapons/w_shotgun.mdl"
SWEP.ShootSound = Sound("Weapon_Shotgun.Single")

SWEP.UseHands = true

function SWEP:PrimaryAttack()
    if not self:CanPrimaryAttack() then return end

    self:SetNextPrimaryFire(CurTime() + 2)

    self:ThrowBag("models/props_phx2/garbage_metalcan001a.mdl")
end

function SWEP:CanPrimaryAttack()
    if self:Clip1() > 0 then return true end

    self:EmitSound("Weapon_Pistol.Empty")

    return false
end

function SWEP:SecondaryAttack()

end

function SWEP:Reload()
    if self:Clip1() > 0 then return end

    self:DefaultReload(ACT_VM_RELOAD)

    timer.Simple(0.5, function()
        self:SendWeaponAnim(ACT_SHOTGUN_RELOAD_FINISH)
    end)

    self:SetNextPrimaryFire(CurTime() + 2)
end

function SWEP:ThrowBag(model_file)
    local owner = self:GetOwner()

    if (not owner:IsValid()) then return end

    self:EmitSound(self.ShootSound)
    self:ShootBullet(0, 9, 0.2, "buckshot")
    self:TakePrimaryAmmo(1)

    self:GetOwner():ViewPunch(
        Angle(-10, 0, 0)
    )

    if (CLIENT) then return end

    local ent = ents.Create("prop_physics")

    if (not ent:IsValid()) then return end

    ent:SetModel(model_file)

    local aimvec = owner:GetAimVector()
    local pos = aimvec * 16

    pos:Add(owner:EyePos())

    ent:SetPos(pos)
    ent:SetAngles(owner:EyeAngles())
    ent:Spawn()
    ent.bIsBeanbag = true

    local phys = ent:GetPhysicsObject()

    if (not phys:IsValid()) then
        ent:Remove()

        return
    end

    aimvec:Mul(10000)
    aimvec:Add(
        VectorRand(-10, 10)
    )

    phys:ApplyForceCenter(aimvec)
    cleanup.Add(
        owner, "props", ent
    )

    undo.Create("Thrown_Beanbag")
    undo.AddEntity(ent)
    undo.SetPlayer(owner)
    undo.Finish()
end