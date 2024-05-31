ITEM.name = "Water Bottle"
ITEM.model = Model("models/hlvr/props/bottles/plastic_bottle_1.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "An old plastic bottle from before the occupation. The cap is loose, and it's filled with water."
ITEM.category = "Consumables"
ITEM.permit = "consumables"
ITEM.hungerAmt = 0
ITEM.thirstAmt = 25
ITEM.useSound = "npc/barnacle/barnacle_gulp2.wav"

ITEM.functions.Drink = {
    icon = "icon16/tick.png",
    OnRun = function(itemTable)
        local client = itemTable.player
        client:RestoreStamina(15)
        client:EmitSound(itemTable.useSound, 75, 115, 0.45)

        client:GetCharacter():GetInventory():Add("bottlewaterempty", 1)

        return true
    end
}

