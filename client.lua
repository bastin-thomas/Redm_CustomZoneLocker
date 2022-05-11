-- Scripts Cote client / Par Gaya

-- 
local zones = {}

function KillPlayer()
	local _player = PlayerPedId()
	local coords = GetEntityCoords(_player)
	Citizen.InvokeNative(0x697157CED63F18D4, _player, 500,500,550,500)
end

function Start(i)
	
	local blip = nil
	zones = Zones
	local Distance = Vdist(zones[i].CoordCenter, Zones[i].CoordBorder)
	local DistanceBlip = Distance

	Citizen.CreateThread(function()
		local x,y,z = table.unpack(zones[i].CoordCenter)
		local DeathCt = TimeBeforeKill

		 while true do
			local playerCoords = GetEntityCoords(PlayerPedId())

			if Vdist(playerCoords, zones[i].CoordCenter) > Distance then
				if blip ~= nil then
					RemoveBlip(blip)
					blip = nil

					TriggerEvent("vorp:TipBottom", MessageReturnSafe, 3000)
				end

				if DeathCt < TimeBeforeKill then
					DeathCt = DeathCt + 5
				end
			else
				if blip == nil then
					blip = Citizen.InvokeNative(0x45f13b7e0a15c880, -1282792512,x, y, z, DistanceBlip)
					TriggerEvent("vorp:TipBottom", MessageBeforeKill, 20000)
				end

				DeathCt = DeathCt - 5
				TriggerEvent("vorp:TipRight", DeathCt,2000)
				
				if DeathCt <= 0 then
					KillPlayer()
					DeathCt = TimeBeforeKill
				end
			end
			Citizen.Wait(5000)
		end 
	end)
end


RegisterNetEvent("Arkios:StartZoneLocker")
AddEventHandler("Arkios:StartZoneLocker", function()
	
	for i,v in ipairs(Zones)  do
		Start(i)
	end
	print("Chargement des zones Réussies.")
end)