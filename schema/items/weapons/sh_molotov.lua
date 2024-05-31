ITEM.name = "Molotov"
ITEM.description = "A not very UU-approved beer...\nNeeds a lighter to be equipped."
ITEM.model = "models/nmrih/weapons/exp_molotov/w_exp_molotov.mdl"
ITEM.class = "weapon_nmrih_molotov"
ITEM.weaponCategory = "melee"
ITEM.width = 1
ITEM.height = 2
--ITEM.flag = "V"
ITEM.price = 60
ITEM.isGrenade = true
ITEM.iconCam = {
	pos = Vector(138.65629577637, 124.1890335083, 95.615325927734),
	ang = Angle(25, 220, 0),
	fov = 4.8497593594521,
}

hook.Add("CanPlayerEquipItem", "MolotovNeedsLighter", function(client, item)
    if item.uniqueID == "molotov" and client:GetCharacter():GetInventory():HasItem("lighter") == false then
        return false
    end
end)