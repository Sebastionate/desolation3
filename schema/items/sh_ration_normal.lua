
ITEM.name = "Normal Grade Ration"
ITEM.model = Model("models/weapons/w_packatc.mdl")
ITEM.description = "A shrink-wrapped blue packet containing a small amount of food and tokens."
ITEM.items = {"supplements_normal", "bottlewater"}

ix.config.Add("normalRationTokens", 10, "The amount of tokens that a person will get from a normal ration", nil, {
	data = {min = 0, max = 1000},
	category = "economy"
})

ix.config.Add("normalRationMinimumLoyalistPoints", 10, "The amount of loyalty points to receive a normal ration.", nil, {
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

		character:GiveMoney(ix.config.Get("normalRationTokens", 10))
		client:EmitSound("ambient/fire/mtov_flame2.wav", 75, math.random(160, 180), 0.35)
	end
}
