ITEM.name = "Mead"
ITEM.model = Model("models/foodnhouseholditems/winebottle1.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "A rounded brown bottle full of mead."
ITEM.category = "Consumables"
ITEM.permit = "consumables"
ITEM.hungerAmt = 0
ITEM.thirstAmt = 30

ITEM.useSound = "npc/barnacle/barnacle_gulp2.wav"
ITEM.functions.Eat = {
    OnRun = function(itemTable)
        local client = itemTable.player

        client:EmitSound(itemTable.useSound, 75, 115, 0.45)

        return true
    end
}