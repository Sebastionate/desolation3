
ITEM.name = "Loyalist Medium Grade Ration"
ITEM.model = Model("models/weapons/w_packatl.mdl")
ITEM.description = "A shrink-wrapped red packet containing more food and tokens."
ITEM.items = {"supplements_loyalist", "water_sparkling", "pear"}

ix.config.Add("loyalistRationTokens", 15, "The amount of tokens that a person will get from a loyalist ration", nil, {
	data = {min = 0, max = 1000},
	category = "economy"
})

ix.config.Add("loyalistRationMinimumLoyalistPoints", 40, "The amount of loyalty points to receive a loyalist ration.", nil, {
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

		character:GiveMoney(ix.config.Get("loyalistRationTokens", 15))
		client:EmitSound("ambient/fire/mtov_flame2.wav", 75, math.random(160, 180), 0.35)
	end
}
