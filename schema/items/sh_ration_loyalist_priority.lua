
ITEM.name = "Loyalist Priority Grade Ration"
ITEM.model = Model("models/weapons/w_packatp.mdl")
ITEM.description = "A shrink-wrapped golden-colored packet containing a lot of food and tokens."
ITEM.items = {"supplements_loyalist_priority", "chocolatebar", "orange", "water_special", "uu_cigarette"}

ix.config.Add("loyalistPriorityRationTokens", 20, "The amount of tokens that a person will get from a loyalist priority ration", nil, {
	data = {min = 0, max = 1000},
	category = "economy"
})

ix.config.Add("loyalistPriorityRationMinimumLoyalistPoints", 65, "The amount of loyalty points to receive a loyalist priority ration.", nil, {
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

		character:GiveMoney(ix.config.Get("loyalistPriorityRationTokens", 20))
		client:EmitSound("ambient/fire/mtov_flame2.wav", 75, math.random(160, 180), 0.35)
	end
}
