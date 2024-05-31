ITEM.name = "Cookie"
ITEM.model = Model("models/freeman/cookie.mdl")
ITEM.width = 2
ITEM.height = 1
ITEM.description = "A Chocolate Cookie"
ITEM.category = "Consumables"
ITEM.permit = "consumables"
ITEM.hungerAmt = 2
ITEM.thirstAmt = -2

ITEM.useSound = "eating_and_drinking/crunchy.wav"
ITEM.functions.Eat = {
    OnRun = function(itemTable)
        local client = itemTable.player

        client:SetHealth(math.min(client:Health() + 3, client:GetMaxHealth()))
        client:EmitSound(itemTable.useSound, 75, 115, 0.45)

        return true
    end
}