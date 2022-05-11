-- Scripts Cote client / Par Gaya

-- 
local config = {}

function KillPlayer()
	local _player = PlayerPedId()
	local coords = GetEntityCoords(_player)
	Citizen.InvokeNative(0x697157CED63F18D4, _player, 500,500,550,500)
end

function Start(i)
	
	local blip = nil
	config = Config
	local Distance = Vdist(config[i].CoordCenter, Config[i].CoordBorder)
	local DistanceBlip = Distance

	Citizen.CreateThread(function()
		local x,y,z = table.unpack(config[i].CoordCenter)
		local DeathCt = TimeBeforeKill
		 while true do
			local playerCoords = GetEntityCoords(PlayerPedId())

			if Vdist(playerCoords, config[i].CoordCenter) > Distance then
				if blip ~= nil then
					RemoveBlip(blip)
					blip = nil

					TriggerEvent("vorp:TipBottom", MessageReturnSafe, 5000)
					DeathCt = TimeBeforeKill
				end
				if DeathCt < TimeBeforeKill then
					DeathCt = DeathCt + 1
				end
			else
				if blip == nil then
					blip = Citizen.InvokeNative(0x45f13b7e0a15c880, -1282792512,x, y, z, DistanceBlip)
					TriggerEvent("vorp:TipBottom", MessageBeforeKill, 5000)

				end
				DeathCt = DeathCt - 1
				TriggerEvent("vorp:TipRight", DeathCt,1000)
				if DeathCt <= 0 then
					KillPlayer()
					DeathCt = TimeBeforeKill
				end
			end
			Citizen.Wait(1000)
		end 
	end)
end


RegisterNetEvent("Arkios:StartZoneLocker")
AddEventHandler("Arkios:StartZoneLocker", function()
	
	for i,v in ipairs(Config)  do
		Start(i)
	end
	print("Chargement des zones Réussies.")
end)