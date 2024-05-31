ITEM.name = "UU-Approved Peanuts"
ITEM.model = Model("models/bioshockinfinite/rag_of_peanuts.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "A pouch of peanuts, branded with a UU-Approved seal."
ITEM.category = "Consumables"
ITEM.permit = "consumables"
ITEM.hungerAmt = 12
ITEM.thirstAmt = 0

ITEM.useSound = "eating_and_drinking/crunchy.wav"
ITEM.functions.Eat = {
    OnRun = function(itemTable)
        local client = itemTable.player

        client:SetHealth(math.min(client:Health() + 2, client:GetMaxHealth()))
        client:EmitSound(itemTable.useSound, 75, 115, 0.45)

        return true
    end
}