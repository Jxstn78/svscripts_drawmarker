local playerPed = GetPlayerPed(-1)
local isatmarker = false
local playerPed = PlayerPedId()
local pos = GetEntityCoords(playerPed)

Citizen.CreateThread(function()
    while true do
        DrawMarker(25, 1458.56, 6552.43, 13.60, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 5.0, 5.0, 5.0, 255, 0, 0, 255, false, false, 2, true, nil, nil, false)
        Citizen.Wait(1)
    end
end)

Citizen.CreateThread(function()
    while true do
        local playerCoords = GetEntityCoords(playerPed)
        local distance = GetDistanceBetweenCoords(1458.56, 6552.43, 14.53, playerCoords)
        isatmarker = false

        if distance < 2.0 then
            isatmarker = true
        elseif distance > 2.0 then
            isatmarker = false
        end
        Citizen.Wait(1)
    end
end)
--spawn car
Citizen.CreateThread(function()
    while true do
        if isatmarker then
            showInfobar("Drücke ~INPUT_DETONATE~ um einen ~r~Admincar~s~ zu spawnen")
            if IsControlJustReleased(0, 47) then
                local vehicleName = 'admincharger'
                RequestModel(vehicleName)
                while not HasModelLoaded(vehicleName) do
                    Wait(500)
                end
                local vehicle = CreateVehicle(vehicleName, pos.x, pos.y, pos.z, GetEntityHeading(playerPed), true, false)
                SetPedIntoVehicle(playerPed, vehicle, -1)
                SetEntityAsNoLongerNeeded(vehicle)
                SetModelAsNoLongerNeeded(vehicleName)
    end
end
    Citizen.Wait(1)
end
end)

function showInfobar(msg)
    CurrentActionMsg = msg
    SetTextComponentFormat('STRING')
    AddTextComponentString(CurrentActionMsg)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

RegisterCommand("downheal", function(source, args)
    SetPedMaxHealth(playerPed, 100)
end)

function notify(msg)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(msg)
	DrawNotification(false, false)
end

Citizen.CreateThread(function()
    while true do
        DrawMarker(25, 1443.69, 6470.67, 19.97, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 5.0, 5.0, 5.0, 255, 0, 0, 255, false, false, 2, true, nil, nil, false)
        Citizen.Wait(1)
    end
end)
Citizen.CreateThread(function()
    while true do
        local playerCoords = GetEntityCoords(playerPed)
        local distance = GetDistanceBetweenCoords(1447.56, 6549.69, 15.17, playerCoords)
        isatmarker = false

        if distance < 2.0 then
            isatmarker = true
        elseif distance > 2.0 then
            isatmarker = false
        end
    end
end)

--dv car in
Citizen.CreateThread(function()
    while true do
        if isatmarker then
            showInfobar("Drücke irgendwas du hurensohn")
            if IsControlJustReleased(0, 38) then
                local playerPed = PlayerPedId()
                local vehicle = GetvehiclePlayerIsIn(playerPed, false)
                DeleteEntity(vehicle)
            end
        end
        Citizen.Wait(1)
    end
end)


function showInfobar(msg)
    CurrentActionMsg = msg
    SetTextComponentFormat('STRING')
    AddTextComponentString(CurrentActionMsg)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end