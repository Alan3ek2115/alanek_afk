secondsUntilKick = 1000

kickWarning = true

Citizen.CreateThread(function()
	while true do
		Wait(1000)

		playerPed = GetPlayerPed(-1)
		if playerPed then
			currentPos = GetEntityCoords(playerPed, true)

			if currentPos == prevPos then
				if time > 0 then
					if kickWarning and time == math.ceil(secondsUntilKick / 4) then
						TriggerEvent("chatMessage", "AFK", {255, 0, 0}, "Jeżeli twoja postać się nie ruszy w ciągu" .. time .. "sekund to zostanie zmuszona wyleciec z wyspy!")
					end

					time = time - 1
				else
					TriggerServerEvent("alanekAfkKick")
				end
			else
				time = secondsUntilKick
			end

			prevPos = currentPos
		end
	end
end)