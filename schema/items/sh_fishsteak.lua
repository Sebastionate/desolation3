ITEM.name = "Fish Steak"
ITEM.model = Model("models/foodnhouseholditems/fishsteak.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "A nicely cooked fish delicacy."
ITEM.category = "Consumables"
ITEM.permit = "consumables"
ITEM.hungerAmt = 25
ITEM.thirstAmt = 15

ITEM.useSound = "eating_and_drinking/eating_long.wav"
ITEM.functions.Eat = {
    OnRun = function(itemTable)
        local client = itemTable.player

        client:SetHealth(math.min(client:Health() + 5, client:GetMaxHealth()))
        client:EmitSound(itemTable.useSound, 75, 115, 0.45)

        return true
    end
}