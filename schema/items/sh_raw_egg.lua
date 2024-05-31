
ITEM.name = "Raw Egg"
ITEM.model = Model("models/foodnhouseholditems/egg.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "A Raw Egg."
ITEM.category = "Consumables"
ITEM.permit = "consumables"
ITEM.hungerAmt = 0
ITEM.thirstAmt = 5
ITEM.iconCam = {
	pos = Vector(152.04965209961, 127.42926025391, 91.776237487793),
	ang = Angle(25, 220, 0),
	fov = 2.9574979230907,
}

ITEM.functions.Eat = {
	OnRun = function(itemTable)
		local client = itemTable.player

        client:SetHealth(math.min(client:Health() - 5, client:GetMaxHealth()))
        client:EmitSound("eating_and_drinking/eating_long.wav", 100, 100, 0.45)

		return true
	end,
}
