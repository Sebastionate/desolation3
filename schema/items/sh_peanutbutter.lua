ITEM.name = "Jar of Peanut Butter"
ITEM.model = Model("models/foodnhouseholditems/peanut_butter.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "An old blue jar of illicit pre-war peanut butter. It would have a weird tang to it, sheerly from it's age."
ITEM.category = "Consumables"
ITEM.permit = "consumables"
ITEM.hungerAmt = 30
ITEM.thirstAmt = -10

ITEM.useSound = "npc/barnacle/barnacle_gulp2.wav"
ITEM.functions.Eat = {
	OnRun = function(itemTable)
		local client = itemTable.player

        client:SetHealth(math.min(client:Health() + 5, client:GetMaxHealth()))
        client:EmitSound("eating_and_drinking/eating_long.wav", 100, 100, 0.45)

		return true
	end,
}
