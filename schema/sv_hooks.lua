-- util.AddNetworkString("ixOffDutyModel")
-- util.AddNetworkString("ixOffDutyModelCallback")

function Schema:LoadData()
	self:LoadTerminals()
	self:LoadRationDispensers()
	self:LoadMPFRationDispensers()
	self:LoadVendingMachines()
	self:LoadCoffeeMachines()
	self:LoadCombineLocks()
	self:LoadForceFields()

	Schema.CombineObjectives = ix.data.Get("combineObjectives", {}, false, true)
end

function Schema:SaveData()
	self:SaveTerminals()
	self:SaveRationDispensers()
	self:SaveVendingMachines()
	self:SaveCoffeeMachines()
	
	self:SaveCombineLocks()
	self:SaveForceFields()
end

function Schema:PlayerSwitchFlashlight(client, enabled)
	if (client:IsCombine() or client:Team() == FACTION_STAFF or client:Team() == FACTION_VORT or client:Team() == FACTION_FREEVORT) then
		return true
	end
end

function Schema:CanPlayerTradeWithVendor(client, entity, uniqueID, isSellingToVendor)
	local items = client:GetCharacter():GetInventory():GetItems()
	local backpackCount = 0

	for _, item in pairs(items) do
		if item.uniqueID == "backpack" then backpackCount = backpackCount + 1 end
	end

	if not isSellingToVendor and (uniqueID == "backpack") and backpackCount >= 2 then
		client:Notify("You have too many backpacks!")
		return false
	end
end

function Schema:PlayerUse(client, entity)
	if (IsValid(client.ixScanner)) then
		return false
	end
	local armbands = {
		"armband_01",
		"armband_02",
		"armband_03",
		"armband_04",
		"armband_05",
		"armband_06",
		"armband_07",
		"armband_08",
		"armband_09",
		"armband_10",
	}
	local hasArmband = false
	local inventory = client:GetCharacter():GetInventory()
	for k, v in pairs(armbands) do
		if inventory:HasItem(v) then
			 hasArmband = true
			break
		end
	end
	if entity:IsDoor() then
		if client:KeyDown(IN_SPEED) or client:KeyDown(IN_WALK) then
			if (IsValid(entity.ixLock)) then
			local cwuAuthorized = client:IsCWU() and entity.ixLock:GetCWUAccess()
			local loyalistAuthorized = hasArmband and entity.ixLock:GetLoyalistAccess()

			if (cwuAuthorized or loyalistAuthorized
			or client:IsCombine()
			or client:Team() == FACTION_SYNTH
			or client:Team() == FACTION_STAFF
			or client:Team() == FACTION_DISTRICTADMINISTRATOR) then
				entity.ixLock:Toggle(client)
				return false
			end
		end
	end
end

	if (!client:IsRestricted() and entity:IsPlayer() and entity:GetCharacter() and entity:GetNetVar("isBlindfolded", true)) then
		-- itemTable.bBeingUsed = true
		client:SetAction("Removing blindfold.", 5)
		client:DoStaredAction(entity, function()
			entity:SetNetVar("isBlindfolded", false)
			entity:Notify("You are no longer blindfolded.")
			-- itemTable:Remove()
		end, 5, function()
			client:SetAction()
			entity:SetAction()
			-- itemTable.bBeingUsed = false
		end)

		entity:SetAction("Someone is removing your blindfold.", 5)
		-- else
		-- 	itemTable.player:NotifyLocalized("plyNotValid")
	end

	if (!client:IsRestricted() and entity:IsPlayer() and entity:IsRestricted() and !entity:GetNetVar("untying") and !entity:GetNetVar("isBlindfolded", true)) then
		entity:SetAction("@beingUntied", 5)
		entity:SetNetVar("untying", true)

		client:SetAction("@unTying", 5)

		client:DoStaredAction(entity, function()
			entity:SetRestricted(false)
			entity:SetNetVar("untying")
			entity:RemovePart(entity.ziptieID)
			entity:EmitSound("cw/sightlower"..math.random(1, 2)..".wav", 60, 100, 1)
		end, 5, function()
			if (IsValid(entity)) then
				entity:SetNetVar("untying")
				entity:SetAction()
			end

			if (IsValid(client)) then
				client:SetAction()
			end
		end)
	end

	if entity:IsRagdoll() then
			local ply = entity:GetNetVar("ixPlayer")
			if IsValid(ply) and (ply:IsRestricted()) and !client:KeyDown(IN_WALK) and !client:IsRestricted() and !entity:GetNetVar("untying") then
		ply:SetAction("@beingUntied", 5)
		ply:SetNetVar("untying", true)

		client:SetAction("@unTying", 5)

		client:DoStaredAction(entity, function()
			ply:SetRestricted(false)
			ply:SetNetVar("untying")
			ply:RemovePart("zip_tie")
			ply:EmitSound("cw/sightlower"..math.random(1, 2)..".wav", 60, 100, 1)
			end, 5, function()
			if (IsValid(ply)) then
				ply:SetNetVar("untying")
				ply:SetAction()
			end

			if (IsValid(client)) then
				client:SetAction()
			end
		end)
		end
	end
end

function Schema:PlayerUseDoor(client, door)
	if (client:IsCombine() 
	or client:Team() == FACTION_DISTRICTADMINISTRATOR
	or client:Team() == FACTION_SYNTH) then
		if (!door:HasSpawnFlags(256) and !door:HasSpawnFlags(1024)) then
			door:Fire("open")
		end
	end
end

function Schema:PlayerLoadout(client)
	client:SetNetVar("restricted")
end

function Schema:PostPlayerLoadout(client)
	if (client:IsCombine()) then
		if (client:Team() == FACTION_OTA) then
			client:SetMaxHealth(150)
			client:SetHealth(150)
			client:SetArmor(150)
		elseif (!self:IsCombineRank(client:Name(), "RCT")) then
			client:SetArmor(100)
		else
			client:SetArmor(50)
		end

		local factionTable = ix.faction.Get(client:Team())
		local character = client:GetCharacter()

		if (factionTable.OnNameChanged) then
			factionTable:OnNameChanged(client, "", character:GetName())
		end
		
		client:SetNetVar("onDuty", false)
	end
end

function Schema:PlayerLoadedCharacter(client, character, oldCharacter)
	if client.HasRappel then client.HasRappel = false end

	if (IsValid(client.ixScanner)) then
		client.ixScanner:Remove()
	end

	local faction = character:GetFaction()

	if (faction == FACTION_CITIZEN) then
		self:AddCombineDisplayMessage("@cCitizenLoaded", Color(255, 100, 255, 255))
	elseif (client:IsCombine()) then
		client:AddCombineDisplayMessage("@cCombineLoaded")
	end
end

function Schema:CharacterVarChanged(character, key, oldValue, value)
	local client = character:GetPlayer()
	if (key == "name") then
		local factionTable = ix.faction.Get(client:Team())

		if (factionTable.OnNameChanged) then
			factionTable:OnNameChanged(client, oldValue, value)
		end
	end
end

function Schema:PlayerFootstep(client, position, foot, soundName, volume)
	local factionTable = ix.faction.Get(client:Team())

	if (factionTable.runSounds and client:IsRunning()) then
		client:EmitSound(factionTable.runSounds[foot])
		return true
	end

	local soundLevel = 75

	if soundName:find("metal") then
		volume = volume * 2
		soundLevel = 90
	else
		volume = volume * .7
	end

	client:EmitSound(soundName, soundLevel, 100, volume)
	return true
end

function Schema:PlayerSpawn(client)
	client:SetCanZoom(client:IsCombine())
end

function Schema:PlayerDeath(client, inflicter, attacker)
	local character = client:GetCharacter()
	if (client:IsCombine() and character) then
		local location = client:GetArea() or "unknown location"
		local Digits = string.match(client:Name(), "%d%d%d%d?%d?")

		self:AddCombineDisplayMessage("Downloading lost biosignal...", Color(255, 255, 255, 255), nil, client)
		self:AddCombineDisplayMessage("WARNING! Biosignal lost for protection team unit "..Digits.." at "..location.."...", Color(255, 0, 0, 255), nil, client)

		if (IsValid(client.ixScanner)) then
			client.ixScanner:TakeDamage(999)
		end
			for k, v in ipairs( player.GetAll() ) do
				if (v:IsCombine()) then
					v:EmitSound("npc/metropolice/vo/on"..math.random(1,2)..".wav")
					v:EmitSound("npc/overwatch/radiovoice/lostbiosignalforunit.wav")

					timer.Simple(2.3, function()
						for i = 1,#Digits do
							timer.Simple((i - 1) / 2, function()
								local DigitToString = {
									[1] = "one",
									[2] = "two",
									[3] = "three",
									[4] = "four",
									[5] = "five",
									[6] = "six",
									[7] = "seven",
									[8] = "eight",
									[9] = "nine",
									[0] = "zero"
								}

								local Digit = tonumber(string.sub(Digits, i, i))
		
								v:EmitSound("npc/overwatch/radiovoice/"..DigitToString[Digit]..".wav")
		
								if i == #Digits then
								timer.Simple(1, function()
										timer.Simple(1, function()
										local postDigitMessages = {
											"npc/overwatch/radiovoice/remainingunitscontain.wav",
											"npc/overwatch/radiovoice/reinforcementteamscode3.wav",
											"npc/overwatch/radiovoice/allteamsrespondcode3.wav",
											"npc/overwatch/radiovoice/investigateandreport.wav"
										}
										local postDigitSound = postDigitMessages[math.random(1,#postDigitMessages)]
										v:EmitSound(postDigitSound)
										timer.Simple(SoundDuration(postDigitSound)+0.1, function()
											v:EmitSound("npc/metropolice/vo/off"..math.random(1,4)..".wav")
										end)
											end)
									end)
								end
							end)
						end
					end)
				end
			end
	end

	if client:IsRestricted()then
		client:SetRestricted(false)
		client:RemovePart('zip_tie')
	end
end

function Schema:PlayerNoClip(client)
	if (IsValid(client.ixScanner)) then
		return false
	end
end

function Schema:EntityTakeDamage(entity, dmgInfo)
	if (IsValid(entity.ixPlayer) and entity.ixPlayer:IsScanner()) then
		entity.ixPlayer:SetHealth( math.max(entity:Health(), 0) )

		hook.Run("PlayerHurt", entity.ixPlayer, dmgInfo:GetAttacker(), entity.ixPlayer:Health(), dmgInfo:GetDamage())
	end
end

function Schema:PlayerHurt(client, attacker, health, damage)
	if (health <= 0) then
		return
	end

	if (client:IsCombine() and (client.ixTraumaCooldown or 0) < CurTime()) then
		local text = "External"

		if (damage > 50) then
			text = "Severe"
		end

		client:AddCombineDisplayMessage("@cTrauma", Color(255, 0, 0, 255), text)

		if (health < 25) then
			client:AddCombineDisplayMessage("@cDroppingVitals", Color(255, 0, 0, 255))
		end

		client.ixTraumaCooldown = CurTime() + 15
	end
end

function Schema:PlayerStaminaLost(client)
	client:AddCombineDisplayMessage("@cStaminaLost", Color(255, 255, 0, 255))
end

function Schema:PlayerStaminaGained(client)
	client:AddCombineDisplayMessage("@cStaminaGained", Color(0, 255, 0, 255))
end

function Schema:GetPlayerPainSound(client)
	if (client:IsCombine()) then
		local sound = "NPC_MetroPolice.Pain"

		if (Schema:IsCombineRank(client:Name(), "SCN")) then
			sound = "NPC_CScanner.Pain"
		elseif (Schema:IsCombineRank(client:Name(), "SHIELD")) then
			sound = "NPC_SScanner.Pain"
		end

		return sound
	end
end

function Schema:GetPlayerDeathSound(client)
	if (client:IsCombine()) then
		local sound = "NPC_MetroPolice.Die"

		if (Schema:IsCombineRank(client:Name(), "SCN")) then
			sound = "NPC_CScanner.Die"
		elseif (Schema:IsCombineRank(client:Name(), "SHIELD")) then
			sound = "NPC_SScanner.Die"
		end

		for k, v in ipairs(player.GetAll()) do
			if (v:IsCombine()) then
				v:EmitSound(sound)
			end
		end

		return sound
	end
end

function Schema:OnNPCKilled(npc, attacker, inflictor)
	if (IsValid(npc.ixPlayer)) then
		hook.Run("PlayerDeath", npc.ixPlayer, inflictor, attacker)
	end
end

function Schema:GetLoadedInPlayers()
    local results = {}

    for _, v in ipairs(player.GetAll()) do
        if !isfunction(v.GetCharacter) then continue end

        local char = v:GetCharacter()
        if not char then continue end

        results[v] = char
    end

    return results
end

function Schema:CanFlagOn(client, character)
	if !ix.config.Get("ratioEnforcerEnabled", false) then
		return true, "Ratio enforcer is not enabled."
	end
	
	if CAMI.PlayerHasAccess(client, "Helix - Bypass Ratio Enforcer", nil) then return true, "You are able to bypass ratio check." end
	if client.skipRatioCheckOnce then
		client.skipRatioCheckOnce = nil
		return true, "You were allowed to flag up by a superadmin."
	end
end
--speaker:GetPos():DistToSqr(position) < 500000
function Schema:PlayerMessageSend(speaker, chatType, text, anonymous, receivers, rawText)
	if chatType == "ic" 
	or chatType == "w"
	or chatType == "y" 
	or chatType == "radio" 
	or chatType == "radio_eavesdrop"
	or chatType == "dispatch"
	or chatType == "dispatchradio" then
		local class = self.voices.GetClass(speaker)
		local Digits = string.match(speaker:Name(), "%d%d%d%d?%d?")
		local position = (Vector(5863.554199, -7057.017090, -335.968750))
		if speaker:Team() == FACTION_MPF then
			if rawText == "10-8" or rawText == "10-8s" and speaker:GetNetVar("onDuty") == false then
				speaker:SetNetVar("onDuty", true)
				speaker:Notify("You are now on-duty")
				Schema:AddCombineDisplayMessage("Functionary "..Digits.." is 10-8 and standing by.", Color(14, 237, 70, 255), nil)
			elseif rawText == "10-7" and speaker:GetNetVar("onDuty") == true and speaker:GetPos():DistToSqr(position) < 5000000 then
			speaker:SetNetVar("onDuty", false)
			Schema:AddCombineDisplayMessage("Functionary "..Digits.." is now off-duty.", Color(245, 78, 78, 255), nil)
			speaker:SetPos(position)

				-- net.Start("ixOffDutyModel")
				-- net.Send(speaker)
			end
		end

		local wholeText = ""

		for k, v in ipairs(class) do
			local multiple = string.Split(rawText:Replace("; ", ";"), ";")

			local lastSoundDuration = 0

			local idx = 0
			for _, voiceLine in pairs(multiple) do
				local info = self.voices.Get(v, voiceLine)
				
				if (info) then
					wholeText = wholeText .. info.text .. (_ ~= #multiple and " " or "")
				end
			end

			for _, voiceLine in pairs(multiple) do
				if v:find("citizen") then
					speaker.lastCitizenVC = speaker.lastCitizenVC or 0
					if CurTime() - speaker.lastCitizenVC < 5 then
						break
					end
					speaker.lastCitizenVC = CurTime()
				end

				local info = self.voices.Get(v, voiceLine)
				
				if (info) then
					timer.Simple(lastSoundDuration, function()
						local volume = ix.config.Get("CCABeepVolumeVC", 80)

						if (chatType == "w") then
							volume = 60
						elseif (chatType == "y") then
							volume = 150
						end
	
						if (info.sound) then
							if (info.global and chatType ~= "dispatchradio") then
								netstream.Start(nil, "PlaySound", info.sound)
							elseif chatType == "radio" or chatType == "dispatchradio" then
								for _, v in pairs(receivers) do
									if (v ~= speaker) then
										netstream.Start(v, "PlaySound", info.sound)
									end
								end
								ix.util.EmitQueuedSounds(speaker, {info.sound, speaker:IsCombine() and speaker:Team() != FACTION_OTA and "npc/metropolice/vo/off"..math.random(1, 2)..".wav" or nil}, nil, nil, volume)
								ix.util.EmitQueuedSounds(speaker, {info.sound, speaker:Team() == FACTION_OTA and "npc/combine_soldier/vo/off"..math.random(1, 3)..".wav" or nil}, nil, nil, volume)
							else
								speaker.bTypingBeep = nil
								ix.util.EmitQueuedSounds(speaker, {info.sound, speaker:IsCombine() and speaker:Team() != FACTION_OTA and "npc/metropolice/vo/off"..math.random(1, 2)..".wav" or nil}, nil, nil, volume)
								ix.util.EmitQueuedSounds(speaker, {info.sound, speaker:Team() == FACTION_OTA and "npc/combine_soldier/vo/off"..math.random(1, 3)..".wav" or nil}, nil, nil, volume)
							end
						end
					end)
					lastSoundDuration = lastSoundDuration + SoundDuration(info.sound) + 0.25
				end

				
				if v:find("citizen") then
					break
				end
			end
		end

		local format = "%s"

		if !(chatType == "radio") and !(chatType == "radio_eavesdrop") 
		and (speaker:IsCombine() or speaker:IsDispatch()) then
			format = "<:: %s ::>"
		end
		
		return string.format(format, (wholeText == "" and text or wholeText))
	end
end

function Schema:CanPlayerJoinClass(client, class, info)
	if (client:IsRestricted()) then
		client:Notify("You cannot change classes when you are restrained!")

		return false
	end
end

local SCANNER_SOUNDS = {
	"npc/scanner/scanner_blip1.wav",
	"npc/scanner/scanner_scan1.wav",
	"npc/scanner/scanner_scan2.wav",
	"npc/scanner/scanner_scan4.wav",
	"npc/scanner/scanner_scan5.wav",
	"npc/scanner/combat_scan1.wav",
	"npc/scanner/combat_scan2.wav",
	"npc/scanner/combat_scan3.wav",
	"npc/scanner/combat_scan4.wav",
	"npc/scanner/combat_scan5.wav",
	"npc/scanner/cbot_servoscared.wav",
	"npc/scanner/cbot_servochatter.wav"
}

function Schema:KeyPress(client, key)
	if (IsValid(client.ixScanner) and (client.ixScannerDelay or 0) < CurTime()) then
		local source

		if (key == IN_USE) then
			source = SCANNER_SOUNDS[math.random(1, #SCANNER_SOUNDS)]
			client.ixScannerDelay = CurTime() + 1.75
		elseif (key == IN_RELOAD) then
			source = "npc/scanner/scanner_talk"..math.random(1, 2)..".wav"
			client.ixScannerDelay = CurTime() + 10
		elseif (key == IN_WALK) then
			if (client:GetViewEntity() == client.ixScanner) then
				client:SetViewEntity(NULL)
			else
				client:SetViewEntity(client.ixScanner)
			end
		end

		if (source) then
			client.ixScanner:EmitSound(source)
		end
	end
end

function Schema:PlayerSpawnObject(client)
	if (client:IsRestricted() or IsValid(client.ixScanner)) then
		return false
	end
end

function Schema:PlayerSpray(client)
	return true
end

-- net.Receive("ixOffDutyModelCallback", function(_, client)
-- 	client:SetModel(net.ReadString())
-- end)

netstream.Hook("PlayerChatTextChanged", function(client, key)
	if (client:IsCombine() and !client.bTypingBeep and client:Team() != FACTION_OTA
	and (key == "y" or key == "w" or key == "r" or key == "t")) then
		client:EmitSound("npc/metropolice/vo/on"..math.random(1, 2)..".wav", ix.config.Get("CCABeepVolumeOn", nil))
		client.bTypingBeep = true
	
	elseif (client:Team() == FACTION_OTA and !client.bTypingBeep and (key == "y" or key == "w" or key == "r" or key == "t")) then
		client:EmitSound("npc/combine_soldier/vo/on1.wav", ix.config.Get("CCABeepVolumeOn", nil))
		client.bTypingBeep = true
	end
end)


netstream.Hook("PlayerFinishChat", function(client)
	if (client:IsCombine() and client.bTypingBeep) then
		client:EmitSound("npc/metropolice/vo/off"..math.random(1, 2)..".wav", ix.config.Get("CCABeepVolumeFinish", nil))
		client.bTypingBeep = nil
	end
end)

-- netstream.Hook("ViewDataUpdate", function(client, target, text)
netstream.Hook("ViewDataUpdate", function(client, target, data)
	if (IsValid(target) and hook.Run("CanPlayerEditData", client, target) and client:GetCharacter() and target:GetCharacter()) then
		local tempData = {
			text = string.Trim(data.text:sub(1, 1000)),
			editor = client:GetCharacter():GetName(),
			bol = data.bol or "NOT WANTED"
		}

		target:GetCharacter():SetData("combineData", tempData)
		Schema:AddCombineDisplayMessage("@cViewDataFiller", nil, client)
	end
end)

netstream.Hook("ViewObjectivesUpdate", function(client, text)
	if (client:GetCharacter() and hook.Run("CanPlayerEditObjectives", client)) then
		local date = ix.date.Get()
		local data = {
			text = text:sub(1, 1000),
			lastEditPlayer = client:GetCharacter():GetName(),
			lastEditDate = ix.date.GetSerialized(date)
		}

		ix.data.Set("combineObjectives", data, false, true)
		Schema.CombineObjectives = data
		Schema:AddCombineDisplayMessage("@cViewObjectivesFiller", nil, client, date.spanseconds and date:spanseconds() or 0)
	end
end)

function Schema:ShowSpare2(client)
	netstream.Start(client, "ToggleThirdPerson")
end
