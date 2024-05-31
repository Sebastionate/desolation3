ITEM.name = "Lambda Resistance Uniform"
ITEM.description = "An all black resistance uniform with lambda resemblance."
ITEM.model = "models/tnb/items/pants_rebel.mdl"
ITEM.skin = 1
ITEM.width = 1
ITEM.height = 1
ITEM.price = 125
ITEM.outfitCategory = "model"
ITEM.replacements = "models/lambdamovement.mdl"


local defaultArmor = 45

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
    
    local uniform = inventory:HasItem("lambdasuit")
    if uniform ~= false then
        uniform:SetData("armor", target:Armor())
    end
end)