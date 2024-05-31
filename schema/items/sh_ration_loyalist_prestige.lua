
ITEM.name = "Loyalist Prestige Grade Ration"
ITEM.model = Model("models/weapons/w_packatestmnew.mdl")
ITEM.skin = 3
ITEM.description = "A shrink-wrapped purple packet containing copius amounts of food and tokens."
ITEM.items = {"supplements_loyalist_priority", "chocolatebar", "apple", "orange", "uucrackers", "water_special", "cigarette"}

ix.config.Add("loyalistPrestigeRationTokens", 30, "The amount of tokens that a person will get from a loyalist prestige ration", nil, {
	data = {min = 0, max = 1000},
	category = "economy"
})

ix.config.Add("loyalistPrestigeRationMinimumLoyalistPoints", 150, "The amount of loyalty points to receive a loyalist prestige ration.", nil, {
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

		character:GiveMoney(ix.config.Get("loyalistPrestigeRationTokens", 30))
		client:EmitSound("ambient/fire/mtov_flame2.wav", 75, math.random(160, 180), 0.35)
	end
}
