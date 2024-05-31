
local PANEL = {}

AccessorFunc(PANEL, "font", "Font", FORCE_STRING)
AccessorFunc(PANEL, "maxLines", "MaxLines", FORCE_NUMBER)

function PANEL:Init()
	if (IsValid(ix.gui.combine)) then
		ix.gui.combine:Remove()
	end

	self.lines = {}

	self:SetMaxLines(6)
	self:SetFont("BudgetLabel")

	self:SetPos(6, 6)
	self:SetSize(ScrW(), ScrH())
	self:ParentToHUD()

	ix.gui.combine = self
end

-- Adds a line to the combine display. Set expireTime to 0 if it should never be removed.
function PANEL:AddLine(text, color, expireTime, ...)
	if (#self.lines >= self.maxLines) then
		for k, info in ipairs(self.lines) do
			if (info.expireTime != 0) then
				table.remove(self.lines, k)
			end
		end
	end

	-- check for any phrases and replace the text
	if (text:sub(1, 1) == "@") then
		text = L(text:sub(2), ...)
	end

	local index = #self.lines + 1

	self.lines[index] = {
		text = "<:: " .. text .. " ::>",
		color = color or color_white,
		expireTime = (expireTime != 0 and (CurTime() + (expireTime or 8)) or 0),
		character = 1,
		lastCharacterTime = 0
	}

	return index
end

function PANEL:AddImage(material, expireTime, fadeInTime)
	if (#self.lines >= self.maxLines) then
		for k, info in ipairs(self.lines) do
			if (info.expireTime != 0) then
				table.remove(self.lines, k)
			end
		end
	end
	local index = #self.lines + 1
 
	self.lines[index] = {
		material = material,
		color = color_white,
		expireTime = (expireTime != 0 and (CurTime() + (expireTime or 8)) or 0),
		character = 1,
		createTime = CurTime(),
		fadeInTime = fadeInTime or .1, 
		alpha = alpha or 255
	}

	return index
end

function PANEL:RemoveLine(id)
	if (self.lines[id]) then
		table.remove(self.lines, id)
	end
end

function PANEL:Think()
	local x, _ = self:GetPos()
	local y = ix.bar.totalHeight

	self:SetPos(x, y)
end

function PANEL:Paint(width, height)
	local textHeight = draw.GetFontHeight(self.font)
	local y = 0

	surface.SetFont(self.font)

	for k, info in ipairs(self.lines) do
		if (info.expireTime != 0 and CurTime() >= info.expireTime) then
			table.remove(self.lines, k)
			continue
		end

		local characterInterval = .02

		if info.text then
			if (info.character < info.text:len()
			and (info.lastCharacterTime + characterInterval) <= CurTime()) then
				info.character = info.character + 1
				info.lastCharacterTime = CurTime()
			end

			surface.SetTextColor(info.color)
			surface.SetTextPos(0, y)
			surface.DrawText(info.text:sub(1, info.character))

			y = y + textHeight
		end

		if info.material then
			local size = ScrH() * .25

			local timeElapsed = math.min(info.fadeInTime, CurTime() - info.createTime)	
			local alpha = math.min(1, timeElapsed / info.fadeInTime) * 255

			surface.SetDrawColor(255, 255, 255, alpha)
			surface.SetMaterial(info.material)
			surface.DrawTexturedRect(0, y, size, size)

			y = y + size + 4
		end
	end

	surface.SetDrawColor(Color(0, 0, 0, 255))
end

vgui.Register("ixCombineDisplay", PANEL, "Panel")

if (IsValid(ix.gui.combine)) then
	vgui.Create("ixCombineDisplay")
end
