ITEM.name = "Apple Juice"
ITEM.model = Model("models/foodnhouseholditems/juicesmall.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "A small carton full of apple juice, fitted with a tiny plastic straw."
ITEM.category = "Consumables"
ITEM.permit = "consumables"
ITEM.hungerAmt = 0
ITEM.thirstAmt = 15

ITEM.useSound = "npc/barnacle/barnacle_gulp2.wav"
ITEM.functions.Drink = {
    OnRun = function(itemTable)
        local client = itemTable.player

        client:EmitSound(itemTable.useSound, 75, 115, 0.45)

        return true
    end
}