--[[
cl_player.lua
Functionality to get current player position and send to server.
]]

--#[Citizen Threads]#--
Citizen.CreateThread(function()
    while true do 
        if IsControlJustReleased(1, 177) then --BACKSPACE
            local plyPed = GetPlayerPed(-1)
            local plyPos = GetEntityCoords(plyPed)
            local plyHeading = GetEntityHeading(plyPed)

            TriggerServerEvent("sv_savePositions:savePosition", plyHeading, plyPos.x, plyPos.y, plyPos.z)

            print("[Obtain Position] Heading: " .. plyHeading .. " | x: " .. plyPos.x .. " | y: " .. plyPos.y .. " | z: " .. plyPos.z)
        end

        Citizen.Wait(1)
    end
end)