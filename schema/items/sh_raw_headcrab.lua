
ITEM.name = "Raw Meat"
ITEM.model = Model("models/headcrabclassic.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "A piece of raw red meat"
ITEM.category = "Consumables"
ITEM.permit = "consumables"
ITEM.hungerAmt = 25
ITEM.thirstAmt = 0
ITEM.iconCam = {
	pos = Vector(152.04965209961, 127.42926025391, 91.776237487793),
	ang = Angle(25, 220, 0),
	fov = 2.9574979230907,
}

ITEM.functions.Eat = {
	OnRun = function(itemTable)
		local client = itemTable.player

        client:SetHealth(math.min(client:Health() - 10, client:GetMaxHealth()))
        client:EmitSound("eating_and_drinking/eating_long.wav", 100, 100, 0.45)

		return true
	end,
}
