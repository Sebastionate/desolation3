ITEM.name = "UU-Branded Cereal"
ITEM.model = Model("models/bioshockinfinite/hext_cereal_box_cornflakes.mdl")
ITEM.width = 1
ITEM.height = 2
ITEM.description = "A dull box of cornflakes, branded with a UU-Approved sticker."
ITEM.category = "Consumables"
ITEM.permit = "consumables"
ITEM.hungerAmt = 30
ITEM.thirstAmt = 5

ITEM.useSound = "eating_and_drinking/crunchy.wav"
ITEM.functions.Eat = {
    OnRun = function(itemTable)
        local client = itemTable.player

        client:SetHealth(math.min(client:Health() + 2, client:GetMaxHealth()))
        client:EmitSound(itemTable.useSound, 75, 115, 0.45)

        return true
    end
}