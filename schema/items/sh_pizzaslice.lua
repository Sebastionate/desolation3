ITEM.name = "Slice of pizza"
ITEM.model = Model("models/foodnhouseholditems/pizzaslice.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "A slice of pizza, coated with several toppings."
ITEM.category = "Consumables"
ITEM.permit = "consumables"
ITEM.hungerAmt = 15
ITEM.thirstAmt = 5

ITEM.useSound = "eating_and_drinking/eating_long.wav"
ITEM.functions.Eat = {
    OnRun = function(itemTable)
        local client = itemTable.player

        client:SetHealth(math.min(client:Health() + 5, client:GetMaxHealth()))
        client:EmitSound(itemTable.useSound, 75, 115, 0.45)

        return true
    end
}