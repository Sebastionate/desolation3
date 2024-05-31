ITEM.name = "Orange"
ITEM.model = Model("models/foodnhouseholditems/orange.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "A fresh orange, ripe for eating."
ITEM.category = "Consumables"
ITEM.permit = "consumables"
ITEM.hungerAmt = 15
ITEM.thirstAmt = 15

ITEM.useSound = "npc/headcrab/headbite.wav"
ITEM.functions.Eat = {
    OnRun = function(itemTable)
        local client = itemTable.player

        client:EmitSound(itemTable.useSound, 75, 115, 0.45)

        return true
    end
}