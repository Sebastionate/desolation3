ITEM.name = "Loaf of bread"
ITEM.model = Model("models/foodnhouseholditems/bread_loaf.mdl")
ITEM.width = 2
ITEM.height = 1
ITEM.description = "A fresh loaf of bread."
ITEM.category = "Consumables"
ITEM.permit = "consumables"
ITEM.hungerAmt = 25
ITEM.thirstAmt = -15
ITEM.iconCam = {
	pos = Vector(169.34564208984, 141.51741027832, 103.62480926514),
	ang = Angle(25, 220, 0),
	fov = 4.8332803043647,
}
ITEM.price = 15


ITEM.functions.Eat = {
	OnRun = function(itemTable)
		local client = itemTable.player

        client:SetHealth(math.min(client:Health() + 5, client:GetMaxHealth()))
        client:EmitSound("eating_and_drinking/eating_long.wav", 100, 100, 0.45)

		return true
	end,
}
