
Schema.name = "HL2 RP"
Schema.author = "nebulous.cloud"
Schema.description = "A schema based on Half-Life 2."
Schema.logo = "pubanner.png"

-- Include netstream
ix.util.Include("libs/thirdparty/sh_netstream2.lua")

ix.util.Include("libs/thirdparty/imgui.lua", "client")

ix.util.Include("sh_configs.lua")
ix.util.Include("sh_commands.lua")

ix.util.Include("cl_schema.lua")
ix.util.Include("cl_hooks.lua")
ix.util.Include("sh_hooks.lua")
ix.util.Include("sh_voices.lua")
ix.util.Include("sv_schema.lua")
ix.util.Include("sv_hooks.lua")

ix.util.Include("meta/sh_player.lua")
ix.util.Include("meta/sv_player.lua")
ix.util.Include("meta/sh_character.lua")

ix.flag.Add("v", "Access to light blackmarket goods.")
ix.flag.Add("V", "Access to heavy blackmarket goods.")
ix.flag.Add("q", "Access to tech goods.")
ix.flag.Add("W", "Access to clothing and accessories.")
ix.flag.Add("m", "Access to medical goods.")

ix.anim.SetModelClass("models/eliteghostcp.mdl", "metrocop")
ix.anim.SetModelClass("models/eliteshockcp.mdl", "metrocop")
ix.anim.SetModelClass("models/leet_police2.mdl", "metrocop")
ix.anim.SetModelClass("models/sect_police2.mdl", "metrocop")
ix.anim.SetModelClass("models/policetrench.mdl", "metrocop")

ix.anim.SetModelClass("models/npc/male_01.mdl", "metrocop")
ix.anim.SetModelClass("models/npc/male_02.mdl", "metrocop")
ix.anim.SetModelClass("models/npc/male_03.mdl", "metrocop")
ix.anim.SetModelClass("models/npc/male_04.mdl", "metrocop")
ix.anim.SetModelClass("models/npc/male_05.mdl", "metrocop")
ix.anim.SetModelClass("models/npc/male_06.mdl", "metrocop")
ix.anim.SetModelClass("models/npc/male_07.mdl", "metrocop")
ix.anim.SetModelClass("models/npc/male_08.mdl", "metrocop")
ix.anim.SetModelClass("models/npc/male_09.mdl", "metrocop")
ix.anim.SetModelClass("models/npc/male_10.mdl", "metrocop")
ix.anim.SetModelClass("models/npc/male_11.mdl", "metrocop")
ix.anim.SetModelClass("models/npc/male_12.mdl", "metrocop")
ix.anim.SetModelClass("models/npc/male_13.mdl", "metrocop")
ix.anim.SetModelClass("models/npc/male_14.mdl", "metrocop")
ix.anim.SetModelClass("models/npc/male_15.mdl", "metrocop")
ix.anim.SetModelClass("models/npc/male_16.mdl", "metrocop")
ix.anim.SetModelClass("models/npc/male_17.mdl", "metrocop")
ix.anim.SetModelClass("models/npc/male_18.mdl", "metrocop")
ix.anim.SetModelClass("models/npc/male_77.mdl", "metrocop")

ix.anim.mpfpack = {
	normal = {
		[ACT_MP_STAND_IDLE] = {ACT_IDLE, ACT_IDLE_ANGRY_SMG1},
		[ACT_MP_CROUCH_IDLE] = {ACT_COVER_PISTOL_LOW, ACT_COVER_SMG1_LOW},
		[ACT_MP_WALK] = {ACT_WALK, ACT_WALK_AIM_RIFLE},
		[ACT_MP_CROUCHWALK] = {ACT_WALK_CROUCH, ACT_WALK_CROUCH},
		[ACT_MP_RUN] = {ACT_RUN, ACT_RUN},
		[ACT_LAND] = {ACT_RESET, ACT_RESET}
	},
	pistol = {
		[ACT_MP_STAND_IDLE] = {ACT_IDLE_PISTOL, ACT_IDLE_ANGRY_PISTOL},
		[ACT_MP_CROUCH_IDLE] = {ACT_COVER_PISTOL_LOW, ACT_COVER_PISTOL_LOW},
		[ACT_MP_WALK] = {ACT_WALK_PISTOL, ACT_WALK_AIM_PISTOL},
		[ACT_MP_CROUCHWALK] = {ACT_WALK_CROUCH, ACT_WALK_CROUCH},
		[ACT_MP_RUN] = {ACT_RUN_PISTOL, ACT_RUN_AIM_PISTOL},
		[ACT_LAND] = {ACT_RESET, ACT_RESET},
		attack = ACT_GESTURE_RANGE_ATTACK_PISTOL,
		reload = ACT_GESTURE_RELOAD_PISTOL
	},
	smg = {
		[ACT_MP_STAND_IDLE] = {ACT_IDLE_SMG1, ACT_IDLE_ANGRY_SMG1},
		[ACT_MP_CROUCH_IDLE] = {ACT_COVER_SMG1_LOW, ACT_COVER_SMG1_LOW},
		[ACT_MP_WALK] = {ACT_WALK_RIFLE, ACT_WALK_AIM_RIFLE},
		[ACT_MP_CROUCHWALK] = {ACT_WALK_CROUCH, ACT_WALK_CROUCH},
		[ACT_MP_RUN] = {ACT_RUN_RIFLE, ACT_RUN_AIM_RIFLE},
		[ACT_LAND] = {ACT_RESET, ACT_RESET}
	},
	shotgun = {
		[ACT_MP_STAND_IDLE] = {ACT_IDLE_SMG1, ACT_IDLE_ANGRY_SMG1},
		[ACT_MP_CROUCH_IDLE] = {ACT_COVER_SMG1_LOW, ACT_COVER_SMG1_LOW},
		[ACT_MP_WALK] = {ACT_WALK_RIFLE, ACT_WALK_AIM_RIFLE},
		[ACT_MP_CROUCHWALK] = {ACT_WALK_CROUCH, ACT_WALK_CROUCH},
		[ACT_MP_RUN] = {ACT_RUN_RIFLE, ACT_RUN_AIM_RIFLE},
		[ACT_LAND] = {ACT_RESET, ACT_RESET}
	},
	grenade = {
		[ACT_MP_STAND_IDLE] = {ACT_IDLE, ACT_IDLE_ANGRY_MELEE},
		[ACT_MP_CROUCH_IDLE] = {ACT_COVER_PISTOL_LOW, ACT_COVER_PISTOL_LOW},
		[ACT_MP_WALK] = {ACT_WALK, ACT_WALK_ANGRY},
		[ACT_MP_CROUCHWALK] = {ACT_WALK_CROUCH, ACT_WALK_CROUCH},
		[ACT_MP_RUN] = {ACT_RUN, ACT_RUN},
		[ACT_LAND] = {ACT_RESET, ACT_RESET},
		attack = ACT_COMBINE_THROW_GRENADE
	},
	melee = {
		[ACT_MP_STAND_IDLE] = {ACT_IDLE, ACT_IDLE_ANGRY_MELEE},
		[ACT_MP_CROUCH_IDLE] = {ACT_COVER_PISTOL_LOW, ACT_COVER_PISTOL_LOW},
		[ACT_MP_WALK] = {ACT_WALK, ACT_WALK_ANGRY},
		[ACT_MP_CROUCHWALK] = {ACT_WALK_CROUCH, ACT_WALK_CROUCH},
		[ACT_MP_RUN] = {ACT_RUN, ACT_RUN},
		[ACT_LAND] = {ACT_RESET, ACT_RESET},
		attack = ACT_MELEE_ATTACK_SWING_GESTURE
	},
	glide = ACT_GLIDE,
	vehicle = {
		chair = {ACT_COVER_PISTOL_LOW, Vector(5, 0, -5)},
		["prop_vehicle_airboat"] = {ACT_COVER_PISTOL_LOW, Vector(10, 0, 0)},
		["prop_vehicle_jeep"] = {ACT_COVER_PISTOL_LOW, Vector(18, -2, 4)},
		["prop_vehicle_prisoner_pod"] = {ACT_IDLE, Vector(-4, -0.5, 0)}
	}
}

ix.anim.SetModelClass("models/dpfilms/metropolice/arctic_police.mdl", "mpfpack")
ix.anim.SetModelClass("models/dpfilms/metropolice/badass_police.mdl", "mpfpack")
ix.anim.SetModelClass("models/dpfilms/metropolice/biopolice.mdl", "mpfpack")
ix.anim.SetModelClass("models/dpfilms/metropolice/black_police.mdl", "mpfpack")
ix.anim.SetModelClass("models/dpfilms/metropolice/c08cop.mdl", "mpfpack")
ix.anim.SetModelClass("models/dpfilms/metropolice/civil_medic.mdl", "mpfpack")
ix.anim.SetModelClass("models/dpfilms/metropolice/elite_police.mdl", "mpfpack")
ix.anim.SetModelClass("models/dpfilms/metropolice/female_police.mdl", "mpfpack")
ix.anim.SetModelClass("models/dpfilms/metropolice/hdpolice.mdl", "mpfpack")
ix.anim.SetModelClass("models/dpfilms/metropolice/hd_barney.mdl", "mpfpack")
ix.anim.SetModelClass("models/dpfilms/metropolice/hd_barney_ep1.mdl", "mpfpack")
ix.anim.SetModelClass("models/dpfilms/metropolice/hl2beta_police.mdl", "mpfpack")
ix.anim.SetModelClass("models/dpfilms/metropolice/hl2concept.mdl", "mpfpack")
ix.anim.SetModelClass("models/dpfilms/metropolice/hunter_police.mdl", "mpfpack")
ix.anim.SetModelClass("models/dpfilms/metropolice/phoenix_police.mdl", "mpfpack")
ix.anim.SetModelClass("models/dpfilms/metropolice/policetrench.mdl", "mpfpack")
ix.anim.SetModelClass("models/dpfilms/metropolice/police_bt.mdl", "mpfpack")
ix.anim.SetModelClass("models/dpfilms/metropolice/police_fragger.mdl", "mpfpack")
ix.anim.SetModelClass("models/dpfilms/metropolice/resistance_police.mdl", "mpfpack")
ix.anim.SetModelClass("models/dpfilms/metropolice/retrocop.mdl", "mpfpack")
ix.anim.SetModelClass("models/dpfilms/metropolice/rogue_police.mdl", "mpfpack")
ix.anim.SetModelClass("models/dpfilms/metropolice/rtb_police.mdl", "mpfpack")
ix.anim.SetModelClass("models/dpfilms/metropolice/skull_police.mdl", "mpfpack")
ix.anim.SetModelClass("models/dpfilms/metropolice/steampunk_police.mdl", "mpfpack")
ix.anim.SetModelClass("models/dpfilms/metropolice/tf2_metrocop_blu.mdl", "mpfpack")
ix.anim.SetModelClass("models/dpfilms/metropolice/tf2_metrocop_red.mdl", "mpfpack")
ix.anim.SetModelClass("models/dpfilms/metropolice/tribal_police.mdl", "mpfpack")
ix.anim.SetModelClass("models/dpfilms/metropolice/tron_police_cn.mdl", "mpfpack")
ix.anim.SetModelClass("models/dpfilms/metropolice/tron_police_or.mdl", "mpfpack")
ix.anim.SetModelClass("models/dpfilms/metropolice/urban_police.mdl", "mpfpack")
ix.anim.SetModelClass("models/dpfilms/metropolice/blacop.mdl", "mpfpack")
ix.anim.SetModelClass("models/dpfilms/metropolice/zombie_police.mdl", "mpfpack")

ix.anim.SetModelClass("models/Humans/Group01/Female_01.mdl", "citizen_female")

function Schema:ZeroNumber(number, length)
	local amount = math.max(0, length - string.len(number))
	return string.rep("0", amount)..tostring(number)
end

function Schema:IsCombineRank(text, rank)
	return string.find(text, "[%D+]"..rank.."[%D+]")
end

local cwuFactions = {
	[FACTION_CWU] = true,
	[FACTION_CIU] = true,
	[FACTION_CAU] = true,
	[FACTION_COUNC] = true,
	[FACTION_CWUDIRECT] = true
}

function Schema:IsCWU(faction)
	return cwuFactions[faction]
end

do
	local CLASS = {}
	CLASS.color = Color(150, 100, 100)
	CLASS.format = "Dispatch broadcasts \"%s\""

	function CLASS:CanSay(speaker, text)
		local speakerPos = speaker:GetPos()

		local broadcastPos = Vector(2728.620850, 4013.482422, 3472.007813)
		local canDispatch = false

		if speakerPos:Distance(broadcastPos) <= 500 then
			canDispatch = true
		end

		if speaker:IsDispatch() then
			canDispatch = true
		end

		if (not canDispatch) then
			speaker:NotifyLocalized("notAllowed")

			return false
		end
	end

	function CLASS:OnChatAdd(speaker, text)
		chat.AddText(self.color, string.format(self.format, text))
	end

	ix.chat.Register("dispatch", CLASS)
end

do
	local CLASS = {}
	CLASS.color = Color(150, 100, 100)
	CLASS.format = "Dispatch broadcasts to units \"%s\""

	function CLASS:CanSay(speaker, text)
		if (!speaker:IsDispatch()) then
			speaker:NotifyLocalized("notAllowed")

			return false
		end
	end

	function CLASS:CanHear(speaker, listener)
		if listener:IsCombine() or listener:IsDispatch() then
			return true
		end

		return false
	end

	function CLASS:OnChatAdd(speaker, text)
		chat.AddText(self.color, string.format(self.format, text))
	end

	ix.chat.Register("dispatchRadio", CLASS)
end

do
	/*local CLASS = {}
	CLASS.color = Color(75, 150, 50)
	CLASS.format = "%s radios in \"%s\""

	function CLASS:CanHear(speaker, listener)
		local character = listener:GetCharacter()
		local inventory = character:GetInventory()
		local bHasRadio = false

		for k, v in pairs(inventory:GetItemsByUniqueID("handheld_radio", true)) do
			if (v:GetData("enabled", false) and speaker:GetCharacter():GetData("frequency") == character:GetData("frequency")) then
				bHasRadio = true
				break
			end
		end

		return bHasRadio
	end

	function CLASS:OnChatAdd(speaker, text)
		text = speaker:IsCombine() and string.format("<:: %s ::>", text) or text
		chat.AddText(self.color, string.format(self.format, speaker:Name(), text))
	end

	ix.chat.Register("radio", CLASS)*/
end

do
	local CLASS = {}
	CLASS.color = Color(255, 255, 175)
	CLASS.format = "%s radios in \"%s\""

	function CLASS:GetColor(speaker, text)
		if (LocalPlayer():GetEyeTrace().Entity == speaker) then
			return Color(175, 255, 175)
		end

		return self.color
	end

	function CLASS:CanHear(speaker, listener)
		if (ix.chat.classes.radio:CanHear(speaker, listener)) then
			return false
		end

		local chatRange = ix.config.Get("chatRange", 280)

		return (speaker:GetPos() - listener:GetPos()):LengthSqr() <= (chatRange * chatRange)
	end

	function CLASS:OnChatAdd(speaker, text)
		text = speaker:IsCombine() and string.format("<:: %s ::>", text) or text
		chat.AddText(self.color, string.format(self.format, speaker:Name(), text))
	end

	ix.chat.Register("radio_eavesdrop", CLASS)
end

do
	local CLASS = {}
	CLASS.color = Color(175, 125, 100)
	CLASS.format = "%s requests \"%s\""

	function CLASS:CanHear(speaker, listener)
		ix.lastRequestChar = speaker:GetCharacter()
		return listener:IsCombine() or listener:IsDispatch() or speaker:Team() == FACTION_STAFF
	end

	function CLASS:OnChatAdd(speaker, text)
		chat.AddText(self.color, string.format(self.format, speaker:Name(), text))
	end

	ix.chat.Register("request", CLASS)
end

do
	local CLASS = {}
	CLASS.color = Color(175, 255, 175)
	CLASS.format = "%s replies back to the request \"<:: %s ::>\""

	function CLASS:CanHear(speaker, listener)
		return listener:IsCombine() or listener:IsDispatch() or speaker:Team() == FACTION_STAFF or listener:GetCharacter() == ix.lastRequestChar
	end

	function CLASS:OnChatAdd(speaker, text)
		chat.AddText(self.color, string.format(self.format, speaker:Name(), text))
	end

	ix.chat.Register("requestreply", CLASS)
end

do
	local CLASS = {}
	CLASS.color = Color(175, 125, 100)
	CLASS.format = "%s requests \"%s\""

	function CLASS:CanHear(speaker, listener)
		if (ix.chat.classes.request:CanHear(speaker, listener)) then
			return false
		end

		local chatRange = ix.config.Get("chatRange", 280)

		return (speaker:Team() != FACTION_STAFF and listener:Team() != FACTION_STAFF)
		and (speaker:GetPos() - listener:GetPos()):LengthSqr() <= (chatRange * chatRange)
	end

	function CLASS:OnChatAdd(speaker, text)
		chat.AddText(self.color, string.format(self.format, speaker:Name(), text))
	end

	ix.chat.Register("request_eavesdrop", CLASS)
end

do
	local CLASS = {}
	CLASS.color = Color(150, 125, 175)
	CLASS.format = "%s broadcasts \"%s\""

	function CLASS:CanSay(speaker, text)
		local broadcastPos = Vector(2981.937744, -15065.852539 -2487.968750)
		if broadcastPos:Distance(speaker:GetPos()) < 700 then return end

		if speaker:Team() == FACTION_DISTRICTADMINISTRATOR then return end
		if speakear:IsCombineRank("SeC") then return end

		speaker:NotifyLocalized("notAllowed")
		return false
	end

	function CLASS:OnChatAdd(speaker, text)
		chat.AddText(self.color, string.format(self.format, speaker:Name(), text))
	end

	ix.chat.Register("broadcast", CLASS)
end
