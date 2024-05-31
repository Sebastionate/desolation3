
ITEM.name = "Loyalist Maximimum Grade Ration"
ITEM.model = Model("models/weapons/w_packatestmnew.mdl")
ITEM.skin = 4
ITEM.description = "A shrink-wrapped cyan packet containing an overabundant amount of food and tokens."
ITEM.items = {"supplements_loyalist_priority", "chocolatebar", "apple", "banana", "water_special", "loyalistcereal", "cigarette"}

ix.config.Add("loyalistMaximumRationTokens", 35, "The amount of tokens that a person will get from a maximum-grade ration.", nil, {
	data = {min = 0, max = 1000},
	category = "economy"
})

ix.config.Add("loyalistMaximumRationMinimumLoyalistPoints", 300, "The amount of loyalty points to receive a maximum-grade ration.", nil, {
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

		character:GiveMoney(ix.config.Get("loyalistMaximumRationTokens", 35))
		client:EmitSound("ambient/fire/mtov_flame2.wav", 75, math.random(160, 180), 0.35)
	end
}
