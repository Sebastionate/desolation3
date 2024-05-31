
ITEM.name = "Loyalist Superior Grade Ration"
ITEM.model = Model("models/weapons/w_packatestmnew.mdl")
ITEM.skin = 2
ITEM.description = "A shrink-wrapped pale red packet containing an abundant amount of food and tokens."
ITEM.items = {"supplements_loyalist_priority", "chocolatebar", "apple", "pear", "water_special", "uu_cigarette"}

ix.config.Add("loyalistSuperiorRationTokens", 25, "The amount of tokens that a person will get from a loyalist superior ration", nil, {
	data = {min = 0, max = 1000},
	category = "economy"
})

ix.config.Add("loyalistSuperiorMinimumLoyalistPoints", 100, "The amount of loyalty points to receive a loyalist superior ration.", nil, {
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

		character:GiveMoney(ix.config.Get("loyalistSuperiorRationTokens", 25))
		client:EmitSound("ambient/fire/mtov_flame2.wav", 75, math.random(160, 180), 0.35)
	end
}
