ITEM.name = "Cabbage"
ITEM.model = Model("models/foodnhouseholditems/cabbage1.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "A fresh head of cabbage."
ITEM.category = "Consumables"
ITEM.permit = "consumables"
ITEM.hungerAmt = 40
ITEM.thirstAmt = 10

ITEM.useSound = "physics/flesh/flesh_bloody_break.wav"
ITEM.functions.Eat = {
    OnRun = function(itemTable)
        local client = itemTable.player

        client:SetHealth(math.min(client:Health() + 5, client:GetMaxHealth()))
        client:EmitSound(itemTable.useSound, 75, 115, 0.45)

        return true
    end
}