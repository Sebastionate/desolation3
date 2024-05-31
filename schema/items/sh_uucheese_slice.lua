ITEM.name = "UU-Approved Cheese Slice"
ITEM.model = Model("models/foodnhouseholditems/cheesewheel1c.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "A sizable slice of cheese"
ITEM.category = "Consumables"
ITEM.permit = "consumables"
ITEM.hungerAmt = 3
ITEM.thirstAmt = -2

ITEM.useSound = "eating_and_drinking/eating_long.wav"
ITEM.functions.Eat = {
    OnRun = function(itemTable)
        local client = itemTable.player

        client:SetHealth(math.min(client:Health() + 1, client:GetMaxHealth()))
        client:EmitSound(itemTable.useSound, 75, 115, 0.45)

        return true
    end
}