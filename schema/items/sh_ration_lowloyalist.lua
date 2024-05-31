
ITEM.name = "Loyalist Low Grade Ration"
ITEM.model = Model("models/weapons/w_packatestmnew.mdl")
ITEM.skin = 1
ITEM.description = "A shrink-wrapped red and yellow packet containing small amounts of food, but more tokens."
ITEM.items = {"supplements_normal", "water_sparkling"}

ix.config.Add("lowloyalistRationTokens", 12, "The amount of tokens that a person will get from a low-tier loyalist ration", nil, {
	data = {min = 0, max = 1000},
	category = "economy"
})

ix.config.Add("lowloyalistRationMinimumLoyalistPoints", 20, "The amount of loyalty points to receive a low-tier loyalist ration.", nil, {
	data = {min = 0, max = 300},
	category = "economy"
})

ITEM.functions.Open = {
	OnRun = function(itemTable)
		local client = itemTable.player
		local character = client:GetCharacter()

		for k, v in ipairs(itemTable.items) do
			if (!character:GetInventory():Add(v)) then
				ix.item.Spawn(v, client)
			end
		end

		character:GiveMoney(ix.config.Get("lowloyalistRationTokens", 12))
		client:EmitSound("ambient/fire/mtov_flame2.wav", 75, math.random(160, 180), 0.35)
	end
}
