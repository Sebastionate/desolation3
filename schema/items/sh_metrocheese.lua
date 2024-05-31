ITEM.name = "Metropolice Packet, Cheddar Bar"
ITEM.model = Model("models/probs_misc/tobccco_box-1.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "A metropolice-grade packet containing a white cheddar bar."
ITEM.category = "Consumables"
ITEM.permit = "consumables"
ITEM.hungerAmt = 20
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