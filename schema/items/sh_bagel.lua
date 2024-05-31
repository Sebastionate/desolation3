ITEM.name = "Bagel"
ITEM.model = Model("models/foodnhouseholditems/bagel3.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "A fairly sized bagel, seemingly fresh."
ITEM.category = "Consumables"
ITEM.permit = "consumables"
ITEM.hungerAmt = 15
ITEM.thirstAmt = 0

ITEM.useSound = "eating_and_drinking/eating_long.wav"
ITEM.functions.Eat = {
    OnRun = function(itemTable)
        local client = itemTable.player

        client:EmitSound(itemTable.useSound, 75, 115, 0.45)

        return true
    end
}