ITEM.name = "Uncooked Beans"
ITEM.model = Model("models/props_junk/garbage_metalcan001a.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "A tin can full of  uncooked beans."
ITEM.category = "Consumables"
ITEM.permit = "consumables"
ITEM.hungerAmt = 10
ITEM.thirstAmt = -30
ITEM.price = 15

ITEM.useSound = "eating_and_drinking/eating_long.wav"
ITEM.functions.Eat = {
    OnRun = function(itemTable)
        local client = itemTable.player
        client:SetHealth(math.min(client:Health() + 5, client:GetMaxHealth()))
        client:EmitSound(itemTable.useSound, 75, 115, 0.45)

        return true
    end
}

