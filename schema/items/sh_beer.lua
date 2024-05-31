ITEM.name = "Beer"
ITEM.model = Model("models/props_junk/garbage_glassbottle001a.mdl")
ITEM.width = 1
ITEM.height = 2
ITEM.description = "A brown bottle of generic illicit beer, with the sticker torn off."
ITEM.category = "Consumables"
ITEM.permit = "consumables"
ITEM.hungerAmt = 0
ITEM.thirstAmt = 25

ITEM.useSound = "npc/barnacle/barnacle_gulp2.wav"
ITEM.functions.Drink = {
    OnRun = function(itemTable)
        local client = itemTable.player

        client:EmitSound(itemTable.useSound, 75, 115, 0.45)

        return true
    end
}