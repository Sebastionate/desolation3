ITEM.name = "Uncooked Meat"
ITEM.model = Model("models/foodnhouseholditems/meat5.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "A slab of uncooked meat."
ITEM.category = "Consumables"
ITEM.permit = "consumables"
ITEM.hungerAmt = -5
ITEM.thirstAmt = -5
ITEM.useSound = "eating_and_drinking/eating_long.wav"
ITEM.functions.Eat = {
    OnRun = function(itemTable)
        local client = itemTable.player

        client:SetHealth(math.min(client:Health() + -10, client:GetMaxHealth()))
        client:EmitSound(itemTable.useSound, 75, 115, 0.45)

        return true
    end
}