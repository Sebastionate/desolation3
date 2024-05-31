
ITEM.name = "Elite Metropolice Grade Ration"
ITEM.model = Model("models/weapons/w_packatm.mdl")
ITEM.description = "A shrink-wrapped black and white Metropolice-grade packet containing ample sustenance for an elite officer."
ITEM.items = {"metropolice_supplements", "water_special", "apple", "metrocoffee"}

ix.config.Add("metropoliceEliteRationTokens", 30, "The amount of tokens that a person will get from an Elite metropolice ration", nil, {
	data = {min = 0, max = 100},
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

		character:GiveMoney(ix.config.Get("metropoliceEliteRationTokens", 20))
		client:GetCharacter():GetInventory():Add("empty_supplements", 1)
		client:EmitSound("ambient/fire/mtov_flame2.wav", 75, math.random(160, 180), 0.35)
	end
}
