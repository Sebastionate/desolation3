ITEM.name = "Roll of Cookies"
ITEM.model = Model("models/foodnhouseholditems/cookies.mdl")
ITEM.width = 2
ITEM.height = 1
ITEM.description = "A roll of a dozen generic chocolate-flavored cookies. They would be stale by now."
ITEM.category = "Consumables"
ITEM.permit = "consumables"
ITEM.hungerAmt = 30
ITEM.thirstAmt = -20

ITEM.useSound = "eating_and_drinking/crunchy.wav"
ITEM.functions.Eat = {
    OnRun = function(itemTable)
        local client = itemTable.player

        client:SetHealth(math.min(client:Health() + 5, client:GetMaxHealth()))
        client:EmitSound(itemTable.useSound, 75, 115, 0.45)

        return true
    end
}