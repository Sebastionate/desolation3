
ITEM.name = "Resistance Uniform"
ITEM.description = "A resistance uniform with a symbol on the sleeve."
ITEM.model = Model("models/tnb/items/shirt_rebelbag.mdl")
ITEM.category = "Clothing"
ITEM.width = 1
ITEM.height = 1
ITEM.price = 80

ITEM.bodyGroups = {
	["torso"] = 5,
	["legs"] = 4
}

ITEM.iconCam = {
	pos = Vector(0, -4.5, 200),
	ang = Angle(90, -80, 0),
	fov = 8.9426889084746
}

local defaultArmor = 35

ITEM:PostHook("Equip", function(item)
    local armor = item:GetData("armor")
    if not armor then
        item.player:SetArmor(defaultArmor)
        item:SetData("armor", defaultArmor)
    else
        item.player:SetArmor(math.min(armor, defaultArmor))
    end
end)

ITEM:PostHook("EquipUn", function(item)
    item:SetData(item.player:Armor())
    item.player:SetArmor(0)
end)

ITEM:PostHook("drop", function(item)
    item:SetData(item.player:Armor())
    item.player:SetArmor(0)
end)

-- may be unnecessary but just in case
hook.Add("EntityTakeDamage", "ixRestistanceUniDamage", function(target, dmg)
    if not IsValid(target) then return end
    if not target:IsPlayer() then return end
	if not target:GetCharacter() then return end
    
    local inventory = target:GetCharacter():GetInventory()
    
    local uniform = inventory:HasItem("resistance_uniform")
    if uniform ~= false then
        uniform:SetData("armor", target:Armor())
    end
end)