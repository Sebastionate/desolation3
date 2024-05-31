ITEM.name = "Ration Coupon Stack"
ITEM.description = "A Stack of Ration Coupons with 3 coupons inside."
ITEM.model = "models/closedboxshin.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.price = 20

function ITEM:PaintOver(item, w, h)
	local cigCount = item:GetData("Stack", 5)

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
    name = "Take out a cigarette",
	OnRun = function(itemTable)
        local cigCount = itemTable:GetData("Stack", 5)
		cigCount = cigCount - 1
		itemTable:SetData("Stack", cigCount)

		itemTable.player:GetCharacter():GetInventory():Add("ration_coupon", 1)

		if cigCount <= 0 then
			return true
		end

		return false
	end,
    OnCanRun = function(item)
        return item:GetData("Stack", 5) > 0
    end
}