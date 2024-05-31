
function Schema:PopulateCharacterInfo(client, character, tooltip)
	if (client:IsRestricted()) then
		local panel = tooltip:AddRowAfter("name", "ziptie")
		panel:SetBackgroundColor(derma.GetColor("Warning", tooltip))
		panel:SetText(L("tiedUp"))
		panel:SizeToContents()
	elseif (client:GetNetVar("tying")) then
		local panel = tooltip:AddRowAfter("name", "ziptie")
		panel:SetBackgroundColor(derma.GetColor("Warning", tooltip))
		panel:SetText(L("beingTied"))
		panel:SizeToContents()
	elseif (client:GetNetVar("untying")) then
		local panel = tooltip:AddRowAfter("name", "ziptie")
		panel:SetBackgroundColor(derma.GetColor("Warning", tooltip))
		panel:SetText(L("beingUntied"))
		panel:SizeToContents()
	end
end

local COMMAND_PREFIX = "/"

function Schema:ChatTextChanged(text)
	if (LocalPlayer():IsCombine()) then
		local key = nil

		if (text == COMMAND_PREFIX .. "radio ") then
			key = "r"
		elseif (text == COMMAND_PREFIX .. "w ") then
			key = "w"
		elseif (text == COMMAND_PREFIX .. "y ") then
			key = "y"
		elseif (text:sub(1, 1):match("%w")) then
			key = "t"
		end

		if (key) then
			netstream.Start("PlayerChatTextChanged", key)
		end
	end
end

function Schema:FinishChat()
	netstream.Start("PlayerFinishChat")
end

function Schema:CanPlayerJoinClass(client, class, info)
	return false
end

function Schema:CharacterLoaded(character)
	if (character:IsCombine() or character:GetFaction() == FACTION_DISPATCH) then
		vgui.Create("ixCombineDisplay")
	elseif (IsValid(ix.gui.combine)) then
		ix.gui.combine:Remove()
	end
end

function Schema:PlayerFootstep(client, position, foot, soundName, volume)
	return true
end

local COLOR_BLACK_WHITE = {
	["$pp_colour_addr"] = 0,
	["$pp_colour_addg"] = 0,
	["$pp_colour_addb"] = 0,
	["$pp_colour_brightness"] = 0,
	["$pp_colour_contrast"] = 1.5,
	["$pp_colour_colour"] = 0,
	["$pp_colour_mulr"] = 0,
	["$pp_colour_mulg"] = 0,
	["$pp_colour_mulb"] = 0
}

local combineOverlay = ix.util.GetMaterial("effects/combine_binocoverlay")
local scannerFirstPerson = false

function Schema:RenderScreenspaceEffects()
	local colorModify = {}
	colorModify["$pp_colour_colour"] = 0.77

	if (system.IsWindows()) then
		colorModify["$pp_colour_brightness"] = -0.02
		colorModify["$pp_colour_contrast"] = 1.2
	else
		colorModify["$pp_colour_brightness"] = 0
		colorModify["$pp_colour_contrast"] = 1
	end

	if (scannerFirstPerson) then
		COLOR_BLACK_WHITE["$pp_colour_brightness"] = 0.05 + math.sin(RealTime() * 10) * 0.01
		colorModify = COLOR_BLACK_WHITE
	end

	DrawColorModify(colorModify)

	if (LocalPlayer():IsCombine()) then
		render.UpdateScreenEffectTexture()

		combineOverlay:SetFloat("$alpha", ix.option.Get("CombineVisorAlpha", 0.5))
		combineOverlay:SetInt("$ignorez", 1)

		render.SetMaterial(combineOverlay)
		render.DrawScreenQuad()
	end
end

function Schema:PreDrawOpaqueRenderables()
	local ply = LocalPlayer()

	if IsValid(ply.pk_pill_ent) and ply.pk_pill_ent.formTable.name == "cityscanner" then
		if ix.option.Get("thirdpersonEnabled", false) then
			scannerFirstPerson = true
			GetConVar("pk_pill_cl_thirdperson"):SetBool(false)
			ply.scannerOverride = true
		else
			GetConVar("pk_pill_cl_thirdperson"):SetBool(true)
			scannerFirstPerson = false
		end
		
		GetConVar("pk_pill_cl_hidehud"):SetBool(true)
	else
		scannerFirstPerson = false
		ply.scannerOverride = nil
	end
	
	--local viewEntity = LocalPlayer():GetViewEntity()

	--if (IsValid(viewEntity) and viewEntity:GetClass():find("scanner")) then
	--	self.LastViewEntity = viewEntity
	--	self.LastViewEntity:SetNoDraw(true)
--
	--	scannerFirstPerson = true
	--	return
	--end
--
	--if (self.LastViewEntity != viewEntity) then
	--	if (IsValid(self.LastViewEntity)) then
	--		self.LastViewEntity:SetNoDraw(false)
	--	end
--
	--	self.LastViewEntity = nil
	--	scannerFirstPerson = false
	--end
end

function Schema:IsScannerFirstPerson()
	return scannerFirstPerson
end

function Schema:ShouldDrawCrosshair()
	if (scannerFirstPerson) then
		return false
	end
end

function Schema:AdjustMouseSensitivity()
	--if (scannerFirstPerson) then
	--	return 0.3
	--end
end

function Schema:CreateMove(cmd)
	--if scannerFirstPerson then
	--	cmd:SetButtons(bit.band(cmd:GetButtons(), bit.bnot(IN_DUCK)))
	--end
end

-- creates labels in the status screen
function Schema:CreateCharacterInfo(panel)
	if (LocalPlayer():Team() == FACTION_CITIZEN) then
		panel.cid = panel:Add("ixListRow")
		panel.cid:SetList(panel.list)
		panel.cid:Dock(TOP)
		panel.cid:DockMargin(0, 0, 0, 8)
	end
end

-- populates labels in the status screen
function Schema:UpdateCharacterInfo(panel)
	if (LocalPlayer():Team() == FACTION_CITIZEN) then
		panel.cid:SetLabelText(L("citizenid"))
		panel.cid:SetText(string.format("##%s", LocalPlayer():GetCharacter():GetData("cid") or "UNKNOWN"))
		panel.cid:SizeToContents()
	end
end

function Schema:BuildBusinessMenu(panel)
	local bHasItems = false

	for k, _ in pairs(ix.item.list) do
		if (hook.Run("CanPlayerUseBusiness", LocalPlayer(), k) != false) then
			bHasItems = true

			break
		end
	end

	return bHasItems
end

function Schema:PopulateHelpMenu(tabs)
	tabs["voices"] = function(container)
		local classes = {}

		for k, v in pairs(Schema.voices.classes) do
			if (v.condition(LocalPlayer())) then
				classes[#classes + 1] = k
			end
		end

		if (#classes < 1) then
			local info = container:Add("DLabel")
			info:SetFont("ixSmallFont")
			info:SetText("You do not have access to any voice lines!")
			info:SetContentAlignment(5)
			info:SetTextColor(color_white)
			info:SetExpensiveShadow(1, color_black)
			info:Dock(TOP)
			info:DockMargin(0, 0, 0, 8)
			info:SizeToContents()
			info:SetTall(info:GetTall() + 16)

			info.Paint = function(_, width, height)
				surface.SetDrawColor(ColorAlpha(derma.GetColor("Error", info), 160))
				surface.DrawRect(0, 0, width, height)
			end

			return
		end

		table.sort(classes, function(a, b)
			return a < b
		end)

		local searchEntry = container:Add("ixIconTextEntry")
		searchEntry:Dock(TOP)
		searchEntry:SetEnterAllowed(false)

		local function ListVoices(filter)
			for _, class in ipairs(classes) do
				local category = container:Add("Panel")
				category:Dock(TOP)
				category:DockMargin(0, 0, 0, 8)
				category:DockPadding(8, 8, 8, 8)
				category.Paint = function(_, width, height)
					surface.SetDrawColor(Color(0, 0, 0, 66))
					surface.DrawRect(0, 0, width, height)
				end
				category.removeOnFilter = true
	
				local categoryLabel = category:Add("DLabel")
				categoryLabel:SetFont("ixMediumLightFont")
				categoryLabel:SetText(class:upper())
				categoryLabel:Dock(FILL)
				categoryLabel:SetTextColor(color_white)
				categoryLabel:SetExpensiveShadow(1, color_black)
				categoryLabel:SizeToContents()
				categoryLabel.removeOnFilter = true
				category:SizeToChildren(true, true)
				
				if self.voices and self.voices.stored and self.voices.stored[class] then
					for command, info in SortedPairs(self.voices.stored[class]) do
						if filter == nil or (command:lower():find(filter:lower()) or info.text:lower():find(filter:lower())) then
							local title = container:Add("DLabel")
							title:SetFont("ixMediumLightFont")
							title:SetText(command:upper())
							title:Dock(TOP)
							title:SetTextColor(ix.config.Get("color"))
							title:SetExpensiveShadow(1, color_black)
							title:SizeToContents()
							title.removeOnFilter = true
						
							local description = container:Add("DLabel")
							description:SetFont("ixSmallFont")
							description:SetText(info.text)
							description:Dock(TOP)
							description:SetTextColor(color_white)
							description:SetExpensiveShadow(1, color_black)
							description:SetWrap(true)
							description:SetAutoStretchVertical(true)
							description:SizeToContents()
							description:DockMargin(0, 0, 0, 8)
							description.removeOnFilter = true
						end
					end
				end
			end
		end

		searchEntry.OnChange = function(entry)
			local function deepRemove(panel)
				for k, v in pairs(panel:GetChildren()) do
					if v.removeOnFilter == true then
						v:Remove()
					else
						if v:HasChildren() then deepRemove(v) end
					end
				end
			end

			deepRemove(container)
			ListVoices(searchEntry:GetValue())
		end

		ListVoices()
	end
end

-- net.Receive("ixOffDutyModel", function()
-- 	local models = {
-- 		"models/purvis/male_01_metrocop.mdl",
-- 		"models/purvis/male_02_metrocop.mdl",
-- 		"models/purvis/male_03_metrocop.mdl",
-- 		"models/purvis/male_04_metrocop.mdl",
-- 		"models/purvis/male_05_metrocop.mdl",
-- 		"models/purvis/male_06_metrocop.mdl",
-- 		"models/purvis/male_07_metrocop.mdl",
-- 		"models/purvis/male_08_metrocop.mdl",
-- 		"models/purvis/male_09_metrocop.mdl",
-- 		"models/mo/offduty/female_01.mdl",
-- 		"models/mo/offduty/female_02.mdl",
-- 		"models/mo/offduty/female_03.mdl",
-- 		"models/mo/offduty/female_04.mdl",
-- 		"models/mo/offduty/female_06.mdl",
-- 		"models/mo/offduty/female_07.mdl"
-- 	}

-- 	local Frame = vgui.Create("DFrame")
-- 	Frame:SetTitle("Choose your off duty model")
-- 	Frame:SetSize(ScrW() * 0.75, ScrH() / 2)
-- 	Frame:Center()
-- 	Frame:MakePopup()

-- 	local Scroll = vgui.Create("DScrollPanel", Frame)
-- 	Scroll:Dock(FILL)

-- 	local List = vgui.Create("DIconLayout", Scroll)
-- 	List:Dock(FILL)

-- 	for _, model in ipairs(models) do
-- 		local icon = List:Add("DModelPanel")
-- 		icon:SetSize(200,200)
-- 		icon:SetModel(model)
-- 		icon.DoClick = function()
-- 			net.Start("ixOffDutyModelCallback")
-- 				net.WriteString(model)
-- 			net.SendToServer()
-- 		end
-- 	end
-- end)

netstream.Hook("CombineDisplayMessage", function(text, color, arguments)
	if (IsValid(ix.gui.combine)) then
		ix.gui.combine:AddLine(text, color, nil, unpack(arguments))
	end
end)

netstream.Hook("PlaySound", function(sound)
	surface.PlaySound(sound)
end)

netstream.Hook("Frequency", function(oldFrequency)
	Derma_StringRequest("Frequency", "What would you like to set the frequency to?", oldFrequency, function(text)
		ix.command.Send("SetFreq", text)
	end)
end)

netstream.Hook("ViewData", function(target, cid, data)
	Schema:AddCombineDisplayMessage("@cViewData")
	vgui.Create("ixViewData"):Populate(target, cid, data)
end)

netstream.Hook("ViewObjectives", function(data)
	Schema:AddCombineDisplayMessage("@cViewObjectives")
	vgui.Create("ixViewObjectives"):Populate(data)
end)

netstream.Hook("ToggleThirdPerson", function(data)
	RunConsoleCommand("ix_togglethirdperson")
end)