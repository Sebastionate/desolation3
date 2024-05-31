ITEM.name = "Headcrab Stew"
ITEM.model = Model("models/props_junk/garbage_metalcan001a.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "A large tin can full of cooked headcrab and other additions that make up a stew."
ITEM.category = "Consumables"
ITEM.permit = "consumables"
ITEM.hungerAmt = 75
ITEM.thirstAmt = 50
ITEM.useSound = "npc/headcrab/headbite.wav"
ITEM.functions.Eat = {
    OnRun = function(itemTable)
        local client = itemTable.player

        client:SetHealth(math.min(client:Health() + 10, client:GetMaxHealth()))
		client:RestoreStamina(50)
        client:EmitSound(itemTable.useSound, 75, 115, 0.45)

        return true
    end
}