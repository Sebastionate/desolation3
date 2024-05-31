ITEM.name = "Metropolice Tumbler"
ITEM.model = Model("models/bioshockinfinite/xoffee_mug_closed.mdl")
ITEM.width = 1
ITEM.height = 2
ITEM.description = "A tall grey container used for large amounts of hot coffee, typically distributed within the CCA."
ITEM.category = "Consumables"
ITEM.permit = "consumables"
ITEM.hungerAmt = 0
ITEM.thirstAmt = 50
ITEM.useSound = "npc/barnacle/barnacle_gulp2.wav"
ITEM.functions.Drink = {
    OnRun = function(itemTable)
        local client = itemTable.player

        client:EmitSound(itemTable.useSound, 75, 115, 0.45)

        return true
    end
}