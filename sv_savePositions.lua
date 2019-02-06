--[[
sv_savePositions.lua
Functionality to save positions to json file.
]]

--#[Local Variables]#--
local currentPositions = {}

--#[Local Functions]#--
local function savePosition(heading, pos)
    currentPositions[#currentPositions + 1] = {heading = heading, x = pos.x, y = pos.y, z = pos.z}

    SaveResourceFile(GetCurrentResourceName(), "positions.json", json.encode(currentPositions), -1)

    print("^5[Obtain Position]^7 ^2Successfully saved positions to json file!^7")
    print("^3#] Heading: " .. heading .. " | X, Y, Z: " .. pos .. "^7")
end

--#[Event Handlers]#--
RegisterServerEvent("sv_savePositions:savePosition")
AddEventHandler("sv_savePositions:savePosition", function(heading, x, y, z)
    local pos = vector3(x, y, z)

    savePosition(heading, pos)
end)