local animationTime = 1
DEFINE_BASECLASS("DFrame")

local PANEL = {}
local lpLogs = nil

hook.Add("LoadFonts", "ixCombineViewData", function()
	surface.CreateFont("ixCombineViewData", {
		font = "Courier New",
		size = 16,
		antialias = true,
		weight = 400
	})
end)

net.Receive("ixDataRequestCallback", function()
	local length = net.ReadInt(32)
	local tempLogs = {}
	for i = 1, length do
		tempLogs[i] = {}
		tempLogs[i].user 	= net.ReadString()
		tempLogs[i].count 	= net.ReadInt(32)
		tempLogs[i].reason 	= net.ReadString()
		tempLogs[i].date 	= net.ReadInt(32)
	end
	lpLogs = tempLogs
end)

AccessorFunc(PANEL, "bCommitOnClose", "CommitOnClose", FORCE_BOOL)

function PANEL:Init()
	self:SetCommitOnClose(true)
	self:SetBackgroundBlur(true)
	self:SetSizable(true)
	self:SetSize(ScrW() / 4 > 600 and ScrW() / 4 or ScrW() / 2, ScrH() / 2 > 300 and ScrH() / 2 or ScrH())
	self:Center()

	self.nameLabel = vgui.Create("DLabel", self)
	self.nameLabel:SetFont("BudgetLabel")
	self.nameLabel:SizeToContents()
	self.nameLabel:Dock(TOP)

	self.cidLabel = vgui.Create("DLabel", self)
	self.cidLabel:SetFont("BudgetLabel")
	self.cidLabel:SizeToContents()
	self.cidLabel:Dock(TOP)

	self.totalLabel = vgui.Create("DLabel", self)
	self.totalLabel:SetFont("BudgetLabel")
	self.totalLabel:SizeToContents()
	self.totalLabel:Dock(TOP)

	self.bolLabel = vgui.Create("DLabel", self)
	self.bolLabel:SetFont("BudgetLabel")
	self.bolLabel:SizeToContents()
	self.bolLabel:Dock(TOP)

	self.lastEditLabel = vgui.Create("DLabel", self)
	self.lastEditLabel:SetFont("BudgetLabel")
	self.lastEditLabel:SizeToContents()
	self.lastEditLabel:Dock(TOP)

	self.cwuStatus = vgui.Create("DLabel", self)
	self.cwuStatus:SetFont("BudgetLabel")
	self.cwuStatus:SizeToContents()
	self.cwuStatus:Dock(TOP)

	self.bolBox = vgui.Create("DComboBox", self)
	self.bolBox:SetFont("BudgetLabel")
	self.bolBox:SizeToContents()
	self.bolBox:Dock(TOP)

	self.listView = vgui.Create("DListView", self)
	self.listView:SetMultiSelect(false)
	self.listView:AddColumn("Unit")
	self.listView:AddColumn("Amount")
	self.listView:AddColumn("Reason")
	self.listView:AddColumn("Date")
	self.listView:SetMinimumSize(nil, 75)
	self.listView:SizeToContents()
	self.listView:Dock(TOP)
	self.listView.Paint = function(_, w, h)
		surface.SetDrawColor(0, 0, 0)
		surface.DrawRect(0, 0, w, self.listView:GetHeaderHeight())
		surface.SetDrawColor(255, 255, 255)
		surface.DrawRect(0, self.listView:GetHeaderHeight(), w, h - self.listView:GetHeaderHeight())
	end

	self.textEntry = vgui.Create("DTextEntry", self)
	self.textEntry:SetMultiline(true)
	self.textEntry:Dock(FILL)
	self.textEntry:SetFont("ixCombineViewData")
end

function PANEL:Populate(target, cid, data, bDontShow)
	data = data or {}
	cid = cid or string.format("00000 (%s)", L("unknown")):upper()

	self.alpha = 255
	self.target = target
	self.oldText = data.text or ""
	self.oldBol = data.bol or "NOT WANTED"
	self.data = data

	local character = target:GetCharacter()
	local name = character:GetName()

	self:SetTitle(name)
	self.nameLabel:SetText(string.format("%s: %s", L("name"), name):upper())
	self.cidLabel:SetText(string.format("%s: #%s", L("citizenid"), cid):upper())

	net.Start("ixDataRequest")
		net.WriteString("lpLogs")
		net.WriteEntity(target)
	net.SendToServer()

	local totalLP = 0

	if lpLogs ~= nil then
		for _, entry in ipairs(lpLogs) do

			totalLP = totalLP + entry.count

			self.listView:AddLine(
				entry.user,
				entry.count > 0 and ("+" .. tostring(entry.count)) or entry.count,
				entry.reason,
				os.date("%m/%d/%Y", entry.date)
			)
		end
	end

	self.totalLabel:SetText(string.format("TOTAL LP: %d", totalLP))
	self.lastEditLabel:SetText(string.format("%s: %s", L("lastEdit"), data.editor or L("unknown")):upper())
	self.bolLabel:SetText(string.format("BOL STATUS: %s", data.bol or "NOT WANTED"))
	self.bolBox:SetValue(data.bol or "NOT WANTED")
	self.bolBox:AddChoice("WANTED")
	self.bolBox:AddChoice("NOT WANTED")
	self.cwuStatus:SetText(string.format("TEAM: %s", string.upper(ix.faction.Get(target:Team()).name)))
	self.textEntry:SetText(data.text or "")

	if (!hook.Run("CanPlayerEditData", LocalPlayer(), target)) then
		self.textEntry:SetEnabled(false)
	end

	if (!bDontShow) then
		self.alpha = 0
		self:SetAlpha(0)
		self:MakePopup()

		self:CreateAnimation(animationTime, {
			index = 1,
			target = {alpha = 255},
			easing = "outQuint",

			Think = function(animation, panel)
				panel:SetAlpha(panel.alpha)
			end
		})
	end
end

function PANEL:CommitChanges()
	if (IsValid(self.target)) then
		local text = string.Trim(self.textEntry:GetValue():sub(1, 1000))
		local bol = self.bolBox:GetSelected() or self.data.bol
		local data = {
			["text"] = text,
			["bol"]	= bol
		}

		-- only update if there's something different so we can preserve the last editor if nothing changed
		if (self.oldText != text or self.oldBol != bol) then
			netstream.Start("ViewDataUpdate", self.target, data)
			Schema:AddCombineDisplayMessage("@cViewDataUpdate")
		end
	else
		Schema:AddCombineDisplayMessage("@cViewDataExpired", Color(255, 0, 0, 255))
	end
end

function PANEL:Close()
	if (self.bClosing) then
		return
	end

	self.bClosing = true

	if (self:GetCommitOnClose()) then
		self:CommitChanges()
	end

	self:SetMouseInputEnabled(false)
	self:SetKeyboardInputEnabled(false)

	self:CreateAnimation(animationTime, {
		target = {alpha = 0},
		easing = "outQuint",

		Think = function(animation, panel)
			panel:SetAlpha(panel.alpha)
		end,

		OnComplete = function(animation, panel)
			BaseClass.Close(panel)
		end
	})
end

vgui.Register("ixViewData", PANEL, "DFrame")
