
ITEM.name = "Minimal Grade Ration"
ITEM.model = Model("models/weapons/w_packati.mdl")
ITEM.description = "A shrink-wrapped brown packet containing scarce amounts food and tokens."
ITEM.items = {"supplements", "bottlewater"}

ix.config.Add("rationTokens", 5, "The amount of tokens that a person will get from a minimal ration", nil, {
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

		character:GiveMoney(ix.config.Get("rationTokens", 5))
		client:EmitSound("ambient/fire/mtov_flame2.wav", 75, math.random(160, 180), 0.35)
	end
}
