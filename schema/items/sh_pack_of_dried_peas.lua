ITEM.name = "Pack of Dried Peas"
ITEM.model = Model("models/foodnhouseholditems/toffifee.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "An imported pack of freeze dried peas"
ITEM.category = "Consumables"
ITEM.permit = "consumables"
ITEM.hungerAmt = 5
ITEM.thirstAmt = -5

ITEM.useSound = "npc/headcrab/headbite.wav"
ITEM.functions.Eat = {
    OnRun = function(itemTable)
        local client = itemTable.player

        client:SetHealth(math.min(client:Health() + 1, client:GetMaxHealth()))
        client:EmitSound(itemTable.useSound, 75, 115, 0.45)

        return true
    end
}