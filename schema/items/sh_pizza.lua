ITEM.name = "Pizza"
ITEM.model = Model("models/foodnhouseholditems/pizza1.mdl")
ITEM.width = 2
ITEM.height = 2
ITEM.description = "A Pizza, Made in the classic Neapolitan.. Or as close as we can get it"
ITEM.category = "Consumables"
ITEM.permit = "consumables"


function ITEM:PaintOver(item, w, h)
	local cigCount = item:GetData("Pizzaslice", 8)

	surface.SetDrawColor(Color(255, 255, 255))
	draw.SimpleText(
		cigCount, 
		"DermaDefault",
		w - 5,
		h - 5, 
		Color(255, 255, 255), 
		TEXT_ALIGN_RIGHT, TEXT_ALIGN_BOTTOM, 
		1, 
		Color(0, 0, 0)
	)
end

ITEM.functions.TakeOutCigarette = {
    name = "Take a slice of Pizza",
	OnRun = function(itemTable)
        local cigCount = itemTable:GetData("Pizzaslice", 8)
		cigCount = cigCount - 1
		itemTable:SetData("Pizzaslice", cigCount)

		itemTable.player:GetCharacter():GetInventory():Add("pizzaslice", 1)

		if cigCount <= 0 then
			return true
		end

		return false
	end,
    OnCanRun = function(item)
        return item:GetData("cigCount", 8) > 0
    end
}