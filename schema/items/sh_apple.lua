
ITEM.name = "Apple"
ITEM.model = Model("models/foodnhouseholditems/apple.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "A red delicious apple."
ITEM.category = "Consumables"
ITEM.permit = "consumables"
ITEM.hungerAmt = 15
ITEM.thirstAmt = 5
ITEM.iconCam = {
	pos = Vector(152.04965209961, 127.42926025391, 91.776237487793),
	ang = Angle(25, 220, 0),
	fov = 2.9574979230907,
}

ITEM.functions.Eat = {
	OnRun = function(itemTable)
		local client = itemTable.player
		client:EmitSound("npc/headcrab/headbite.wav", 75, 150, 0.30)

		return true
	end,
}
