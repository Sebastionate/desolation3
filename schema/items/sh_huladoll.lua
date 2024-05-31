ITEM.name = "Hula Doll"
ITEM.model = "models/props_lab/huladoll.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.description = "A tiny bobble head hula doll."
ITEM.price = 15

function ITEM:PaintOver(item, w, h)
    surface.SetDrawColor(255, 223, 0, 10)
    surface.DrawRect(0, 0, w, h)
end

-- function ITEM:SetHelixTooltip(tooltip)
--     local name = tooltip:AddRow(ITEM.name)
--     name:SetImportant()
--     name:SetText(ITEM.description)
--     name:SizeToContents()

--     local limited = tooltip:AddRow("Limited Edition")
--     limited:SetImportant()
--     limited:SetBackgroundColor(Color(255, 223, 0))
--     limited:SizeToContents()

--     tooltip:SizeToContents()
-- end