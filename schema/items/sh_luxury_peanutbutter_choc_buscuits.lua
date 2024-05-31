ITEM.name = "Luxury Peanutbutter Chocolate filled Cookies"
ITEM.description = "A batch of luxury styled cookies filled with Peanutbutter and Chocolate in a fun UU-Approved Package"
ITEM.model = "models/closedboxshin.mdl"
ITEM.width = 1
ITEM.height = 1

function ITEM:PaintOver(item, w, h)
	local cigCount = item:GetData("Luxury Biscuits", 12)

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
    name = "Take out a Cookie",
	OnRun = function(itemTable)
        local cigCount = itemTable:GetData("Luxury Biscuits", 12)
		cigCount = cigCount - 1
		itemTable:SetData("Luxury Biscuits", cigCount)

		itemTable.player:GetCharacter():GetInventory():Add("luxury_cookie", 1)

		if cigCount <= 0 then
			return true
		end

		return false
	end,
    OnCanRun = function(item)
        return item:GetData("Chocolate Cookies", 12) > 0
    end
}