ITEM.name = "Lockpick"
ITEM.model = "models/freeman/lockpick.mdl"
ITEM.width = 1
ITEM.height = 2
ITEM.description = "A common lockpick."
ITEM.category = "Resources"
ITEM.iconCam = {
	pos = Vector(93.540382385254, 78.589065551758, 59.065139770508),
	ang = Angle(25, 220, 0),
	fov = 2.744315454161,
}
ITEM.price = 20

ITEM.functions.Use = {
	OnRun = function(itemTable)
		local playerCount = player.GetCount()
		local client = itemTable.player
		local data = {}
			data.start = client:GetShootPos()
			data.endpos = data.start + client:GetAimVector() * 96
			data.filter = client
		local target = util.TraceLine(data).Entity

		local player_roll_before = math.random(0, 100) / 2
		local player_roll = math.Truncate(player_roll_before)

		local valid_doors = {
			"models/props_c17/door01_left.mdl",
			"models/props_c17/door02_left.mdl",
			"models/props_c17/door03_left.mdl",
			"models/props_c17/door04_left.mdl",
			"models/props_c17/door05_left.mdl",
			"models/props_c17/door06_left.mdl",
			"models/props_c17/door07_left.mdl",
			"models/props_c17/door08_left.mdl",
			"models/props_c17/door09_left.mdl",
			"models/props_c17/door10_left.mdl",
			"models/props_c17/door11_left.mdl",
			"models/props_c17/door12_left.mdl",
			"models/props_c17/door13_left.mdl",
		}
		if playerCount <= ix.config.Get("minimumPlayers") then 
			ix.util.Notify("You cannot lockpick during downtime.", client)
			return false 
		end
		local function notif_Lockpicking()
			for i, v in ipairs( player.GetAll() ) do
				if (client:GetPos():Distance(v:GetPos()) <= 200 - player_roll) then
					v:ChatNotify(client:GetCharacter():GetName() .. " rolls a " .. player_roll .. " to use a lockpick.")
				end
			end
		end

		local blacklist = {
			"ix_vendingmachine",
			"ix_combinelock",
			"prop_physics",
			"fire_barrel",
			"ix_coffeemachine",
			"civil_terminal",
			"ix_rationdispenser",
			"ix_forcefield",
			"ix_vendor",
			"craftspawn1",
			"craftspawn2",
			"craftspawn3",


		}
		
		if IsValid( target ) then
		for _, v in ipairs(blacklist) do
			if target:GetClass() == v then return false end
		end
			if client:GetPos():Distance(target:GetPos()) <= 100 then
			
			// Container lockpicking
			local is_container = (target:GetClass() == "ix_container")
			if (is_container) then	
					if ( (target.password == nil) or (string.len(target.password) == 0) ) then ix.util.Notify("This container is not locked!", client) return false end
					notif_Lockpicking()
					local picks = 0
					timer.Create("LockPickContainer", 1.5, 15, function()
							if (client:GetPos():Distance(target:GetPos()) > 100) or (player_roll < 45) then
								ix.util.Notify("Lock picking failed!", client) timer.Stop("LockPickContainer")
								client:EmitSound("physics/metal/weapon_impact_soft2.wav", 65, 200, 1)
								return false
							end
							if (picks < 14) then
								local snd = {1,3,4}
								client:EmitSound("weapons/357/357_reload".. tostring(snd[math.random(1, #snd)]) ..".wav", 70, (150-player_roll), (150-player_roll), 1)
								picks = picks + 1
							else
								target:SetLocked(false)
								target.password = nil
								return true
							end
					end )
			end

			// Door lockpicking
			local is_door = (target:GetClass()=="func_door" or target:GetClass()=="prop_door_rotating" or target:GetClass()=="func_door_rotating")
			if is_door then
				if (!table.HasValue( valid_doors, target:GetModel())) then ix.util.Notify("You cannot lockpick this door!", client) return false end
				if (target:GetNWBool("CombineLocked", false)) then ix.util.Notify("The combine lock protects it from lockpicks!", client) return false end
					notif_Lockpicking()
					local picks = 0
					timer.Create("LockPickDoor", 1.5, 15, function()
						if (client:GetPos():Distance(target:GetPos()) > 100) or (player_roll < 35) then 
							ix.util.Notify("Lock picking failed!", client) timer.Stop("LockPickDoor")
							client:EmitSound("physics/metal/weapon_impact_soft2.wav", 65, 200, 1) 
							return false
						end
						if (picks < 14) then
							local snd = {1,3,4}
							
							client:EmitSound("weapons/357/357_reload".. tostring(snd[math.random(1, #snd)]) ..".wav", 65, 150-player_roll, 150-player_roll, 1)
							picks = picks + 1
						else
							target:Fire("unlock","",0)
							target:Fire("open", "", .5)
							target:Fire("setanimation","open",.5)
							return true
						end
					end )
				end
			else
				ix.util.Notify("You are too far away to use a lockpick!", client) return false
			end
		else
			ix.util.Notify("You must be near something you can lockpick!", client) return false
		end
	end,
	OnCanRun = function(itemTable)
		return !IsValid(itemTable.entity)
	end
}