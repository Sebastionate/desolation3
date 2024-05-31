ITEM.name = "Boiled Meat"
ITEM.model = Model("models/foodnhouseholditems/meat8.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "Meat cooked by boiling. Stringy and bland."
ITEM.category = "Consumables"
ITEM.permit = "consumables"
ITEM.hungerAmt = 25
ITEM.thirstAmt =  10
ITEM.healthAmt = 2
ITEM.useSound = "eating_and_drinking/eating_long.wav"

ITEM.functions.Eat = {
    OnRun = function(itemTable)
        local client = itemTable.player

        client:SetHealth(math.min(client:Health() + itemTable.healthAmt, client:GetMaxHealth()))
        client:EmitSound(itemTable.useSound, 75, 115, 0.45)

        return true
    end
}