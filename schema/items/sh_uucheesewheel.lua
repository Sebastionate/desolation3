ITEM.name = "UU-Approved Cheese Wheel"
ITEM.model = Model("models/bioshockinfinite/pound_cheese.mdl")
ITEM.width = 2
ITEM.height = 2
ITEM.description = "A sizable wheel of cheese, covered with several UU-Approved stickers."
ITEM.category = "Consumables"
ITEM.permit = "consumables"
ITEM.hungerAmt = 50
ITEM.thirstAmt = -10

ITEM.useSound = "eating_and_drinking/eating_long.wav"
ITEM.functions.Eat = {
    OnRun = function(itemTable)
        local client = itemTable.player

        client:SetHealth(math.min(client:Health() + 10, client:GetMaxHealth()))
        client:EmitSound(itemTable.useSound, 75, 115, 0.45)

        return true
    end
}