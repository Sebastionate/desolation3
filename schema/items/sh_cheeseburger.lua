ITEM.name = "Double Cheeseburger"
ITEM.model = Model("models/foodnhouseholditems/mcdburger.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "Two 100 percent beef patties, a slice of cheese, lettuce, onion and pickles. And the sauce."
ITEM.category = "Consumables"
ITEM.permit = "consumables"
ITEM.hungerAmt = 25
ITEM.thirstAmt = -10
ITEM.iconCam = {
	pos = Vector(169.34564208984, 141.51741027832, 103.62480926514),
	ang = Angle(25, 220, 0),
	fov = 4.8332803043647,
}

ITEM.functions.Eat = {
    OnRun = function(itemTable)
        local client = itemTable.player
        client:SetHealth(math.min(client:Health() + 10, client:GetMaxHealth()))
        client:EmitSound("eating_and_drinking/eating_long.wav", 100, 100, 0.45)

        return true
    end
}