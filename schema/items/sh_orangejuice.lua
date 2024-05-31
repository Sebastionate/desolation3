ITEM.name = "Orange Juice"
ITEM.model = Model("models/foodnhouseholditems/juice.mdl")
ITEM.width = 1
ITEM.height = 2
ITEM.description = "A carton full of citrusy orange juice."
ITEM.category = "Consumables"
ITEM.permit = "consumables"
ITEM.hungerAmt = 0
ITEM.thirstAmt = 30

ITEM.useSound = "npc/barnacle/barnacle_gulp2.wav"
ITEM.functions.Drink = {
    OnRun = function(itemTable)
        local client = itemTable.player

        client:EmitSound(itemTable.useSound, 75, 115, 0.45)

        return true
    end
}