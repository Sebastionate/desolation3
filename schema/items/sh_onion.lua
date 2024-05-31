ITEM.name = "Onion"
ITEM.model = Model("models/foodnhouseholditems/tomato.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "A bitter white onion with a strange red skin"
ITEM.category = "Consumables"
ITEM.permit = "consumables"
ITEM.hungerAmt = 6
ITEM.thirstAmt = 3

ITEM.useSound = "npc/headcrab/headbite.wav"
ITEM.functions.Eat = {
    OnRun = function(itemTable)
        local client = itemTable.player

        client:EmitSound(itemTable.useSound, 75, 115, 0.45)

        return true
    end
}