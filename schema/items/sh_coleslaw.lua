ITEM.name = "Coleslaw"
ITEM.model = Model("models/foodnhouseholditems/marabou1.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "Combine Cabbage, Carrots, And Mayo along with any other ingredients."
ITEM.category = "Consumables"
ITEM.permit = "consumables"
ITEM.hungerAmt = 50
ITEM.thirstAmt = 20
ITEM.price = 15


ITEM.functions.Eat = {
    OnRun = function(itemTable)
        local client = itemTable.player

        client:SetHealth(math.min(client:Health() + itemTable.healthAmt, client:GetMaxHealth()))
        client:EmitSound(itemTable.useSound, 75, 115, 0.45)

        return true
    end
}