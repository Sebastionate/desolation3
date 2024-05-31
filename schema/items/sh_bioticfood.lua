ITEM.name = "Biotic Tier Supplement"
ITEM.model = Model("models/probs_misc/tobbcco_box-1.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "A disgusting green packet containing a putrid-smelling bar. It was labeled: ''Not Made For Human Consumption. Contains ingredients hazardous for non-subhuman individuals.''"
ITEM.category = "Consumables"
ITEM.permit = "consumables"
ITEM.hungerAmt = 15
ITEM.thirstAmt = 15

ITEM.useSound = "eating_and_drinking/crunchy.wav"
ITEM.functions.Eat = {
    OnRun = function(itemTable)
        local client = itemTable.player
        client:SetHealth(math.min(client:Health() + 5, client:GetMaxHealth()))
        client:EmitSound(itemTable.useSound, 75, 115, 0.45)

        return true
    end
}