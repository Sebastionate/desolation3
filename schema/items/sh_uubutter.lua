ITEM.name = "UU-Approved Butter"
ITEM.model = Model("models/mres/consumables/tag_mre.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "A delicate creamy substance used in most loyalist cooking"
ITEM.category = "Consumables"
ITEM.permit = "consumables"
ITEM.hungerAmt = 10
ITEM.thirstAmt = -10

ITEM.useSound = "eating_and_drinking/crunchy.wav"
ITEM.functions.Eat = {
    OnRun = function(itemTable)
        local client = itemTable.player

        client:SetHealth(math.min(client:Health() + 5, client:GetMaxHealth()))
        client:EmitSound(itemTable.useSound, 75, 115, 0.45)

        return true
    end
}