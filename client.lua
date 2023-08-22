-- Define the car model names (replace with your desired car models)
local carModels = {"redeye", "ss16", "tltypes", "rs7c821", "stingray"}

-- Define the spawn positions using vector4
-- Current locations are setup for the showroom utilizing the GABZ PDM MLO
local spawnPositions = {
    vector4(-36.67, -1092.93, 27.3, 134.38),  -- Position 1
    vector4(-42.69, -1101.9, 27.3, 328.44),  -- Position 2
    vector4(-47.97, -1091.52, 27.3, 224.96),  -- Position 3
    vector4(-54.5, -1097.04, 27.3, 157.07),  -- Position 4
    vector4(-49.98, -1082.64, 27.3, 187.03)   -- Position 5
}

-- Spawn the cars
Citizen.CreateThread(function()
    for i, carModel in ipairs(carModels) do
        RequestModel(carModel)
        while not HasModelLoaded(carModel) do
            Citizen.Wait(0)
        end

        local vehicle = CreateVehicle(GetHashKey(carModel), spawnPositions[i], 0.0, true, false)

        local primaryColor = 0 -- Replace with your desired primary color
        local secondaryColor = 0 -- Replace with your desired secondary color
        SetVehicleColours(vehicle, primaryColor, secondaryColor)

        local plateText = "CODERP" -- Replace with your desired number plate
        SetVehicleNumberPlateText(vehicle, plateText)

        SetEntityAsNoLongerNeeded(vehicle)

        -- Lock the vehicle
        SetVehicleDoorsLocked(vehicle, 2) -- 2 means locked

        -- Set the vehicle dirt level to 0 (clean)
        SetVehicleDirtLevel(vehicle, 0.0)
    end
end)
