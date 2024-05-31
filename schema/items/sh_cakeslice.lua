ITEM.name = "Slice of cake"
ITEM.model = Model("models/foodnhouseholditems/cakepiece2.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "A slice of chocolate cake. Mmm."
ITEM.category = "Consumables"
ITEM.permit = "consumables"
ITEM.hungerAmt = 35
ITEM.thirstAmt = -5
ITEM.useSound = "eating_and_drinking/eating_long.wav"
ITEM.functions.Eat = {
    OnRun = function(itemTable)
        local client = itemTable.player

        client:EmitSound(itemTable.useSound, 75, 115, 0.45)

        return true
    end
}