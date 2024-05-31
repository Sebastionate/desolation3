ITEM.name = "Loyalist Tier Ration, Cereal"
ITEM.model = Model("models/pg_plops/pg_food/pg_tortellinap.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "A loyalist-grade pale blue box full of quality bran flakes."
ITEM.category = "Consumables"
ITEM.permit = "consumables"
ITEM.hungerAmt = 30
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