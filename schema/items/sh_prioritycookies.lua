ITEM.name = "Special Packet, Cookies"
ITEM.model = Model("models/probs_misc/tobdcco_box-1.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "A priority-grade white and gold packet containing an assortment of crispy baked cookies, loaded with artificial sugar."
ITEM.category = "Consumables"
ITEM.permit = "consumables"
ITEM.hungerAmt = 10
ITEM.thirstAmt = 5

ITEM.useSound = "eating_and_drinking/crunchy.wav"
ITEM.functions.Eat = {
    OnRun = function(itemTable)
        local client = itemTable.player

        client:SetHealth(math.min(client:Health() + 5, client:GetMaxHealth()))
        client:EmitSound(itemTable.useSound, 75, 115, 0.45)

        return true
    end
}