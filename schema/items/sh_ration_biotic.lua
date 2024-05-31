ITEM.name = "Biotic Grade Ration"
ITEM.model = Model("models/weapons/w_packatb.mdl")
ITEM.description = "A shrink-wrapped green packet containing food and a very small amount of tokens. Label reads: 'Contents not intended for human consumption'"
ITEM.items = {"bioticfood"}

ix.config.Add("normalRationTokens", 5, "The amount of tokens that a person will get from a biotic ration", nil, {
	data = {min = 0, max = 1000},
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
