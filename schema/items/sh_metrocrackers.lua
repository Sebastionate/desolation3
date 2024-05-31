ITEM.name = "Metropolice Packet, Crackers"
ITEM.model = Model("models/probs_misc/tobccco_box-1.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "A metropolice-grade packet containing an assortment of crackers and cheese."
ITEM.category = "Consumables"
ITEM.permit = "consumables"
ITEM.hungerAmt = 15
ITEM.thirstAmt = 5

ITEM.useSound = "eating_and_drinking/crunchy.wav"
ITEM.functions.Eat = {
    OnRun = function(itemTable)
        local client = itemTable.player

        client:SetHealth(math.min(client:Health() + 5, client:GetMaxHealth()))
        client:EmitSound(itemTable.useSound, 75, 115, 0.45)

        return true
    end
}