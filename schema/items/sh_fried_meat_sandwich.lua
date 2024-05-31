ITEM.name = "Fried Meat Sandwich"
ITEM.model = Model("models/foodnhouseholditems/sandwich.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "A triangle-cut sandwich, filled with fried meat, tomatoes, pickles and with a spread of mayo"
ITEM.category = "Consumables"
ITEM.permit = "consumables"
ITEM.hungerAmt = 25
ITEM.thirstAmt = 10

ITEM.useSound = "eating_and_drinking/eating_long.wav"
ITEM.functions.Eat = {
    OnRun = function(itemTable)
        local client = itemTable.player

        client:SetHealth(math.min(client:Health() + 10, client:GetMaxHealth()))
        client:EmitSound(itemTable.useSound, 75, 115, 0.45)

        return true
    end
}