ITEM.name = "Toblerone"
ITEM.model = Model("models/foodnhouseholditems/toblerone.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "A long Swiss chocolate bar, segmented into several triangular prisms that can be broken off into pieces."
ITEM.category = "Consumables"
ITEM.permit = "consumables"
ITEM.hungerAmt = 15
ITEM.thirstAmt = 0

ITEM.useSound = "gmodtower/inventory/move_paper.wav"
ITEM.functions.Eat = {
    OnRun = function(itemTable)
        local client = itemTable.player

        client:SetHealth(math.min(client:Health() + 5, client:GetMaxHealth()))
        client:EmitSound(itemTable.useSound, 75, 115, 0.45)

        return true
    end
}