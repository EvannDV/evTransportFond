ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local PlayerData = {}

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
     PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)  
	PlayerData.job = job  
	Citizen.Wait(5000) 
end)

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(10)
    end
    while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
    end
    if ESX.IsPlayerLoaded() then

		ESX.PlayerData = ESX.GetPlayerData()

    end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
end)


RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)










function OpenMenuVehicule()

    local SacBank = RageUI.CreateMenu("Vehicules","Made by evann™")

    RageUI.Visible(SacBank, not RageUI.Visible(SacBank))

    while SacBank do
        
        Citizen.Wait(0)

        RageUI.IsVisible(SacBank,true,true,true,function()

            RageUI.Separator("↓     Mission     ~s~↓")
        
            
            RageUI.ButtonWithStyle("~g~Sortir Camions", nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                if Selected then
                    RageUI.CloseAll()
                    local ped = PlayerPedId()
                    local model = GetHashKey("stockade")
                    RequestModel(model)
                    while not HasModelLoaded(model) do Citizen.Wait(10) end
                    local pos = GetEntityCoords(PlayerPedId())
                    local vehicle = CreateVehicle(model, pos.x, pos.y, pos.z, 90.0, true, false)
                    TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)    
                end
            end)

        
        end, function()
        end)

        if not RageUI.Visible(SacBank) then
            SacBank=RMenu:DeleteType("Delete", true)
        end

    end

end















Citizen.CreateThread(function()
    while true do
        local wait = 750
        if ESX.PlayerData.job and ESX.PlayerData.job.name == 'police' then
            for k in pairs {vector3(-350.144, -33.528, 47.421)} do
                local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                local pos = {vector3(-350.144, -33.528, 47.421)}
                local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pos[k].x, pos[k].y, pos[k].z)

                if dist <= 6 then
                    wait = 0
                    DrawMarker(4, -350.144, -33.528, 47.421, 0.0, 0.0, 0.0, 0.0,0.0,0.0, 0.7, 0.7, 0.7, 114, 204, 114, 180, true, true, p19, true)  
                    if dist <= 1.0 then
                        wait = 0


                        AddTextEntry("HELP", "Appuyez sur ~INPUT_CONTEXT~ ~s~pour accéder au menu")
                        DisplayHelpTextThisFrame("HELP", false)
                        if IsControlJustPressed(1,51) then
                            OpenMenuVehicule()
                        end
                    end
                end
            end
        end
    Wait(wait)
    end
end)


Citizen.CreateThread(function()
    while true do
        local wait = 750
        if ESX.PlayerData.job and ESX.PlayerData.job.name == 'police' then
            for k in pairs {vector3(-1212.543, -320.636, 37.746)} do
                local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                local pos = {vector3(-1212.543, -320.636, 37.746)}
                local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pos[k].x, pos[k].y, pos[k].z)

                if dist <= 6 then
                    wait = 0
                    DrawMarker(4, -1212.543, -320.636, 37.746, 0.0, 0.0, 0.0, 0.0,0.0,0.0, 0.7, 0.7, 0.7, 114, 204, 114, 180, true, true, p19, true)  
                    if dist <= 1.0 then
                        wait = 0


                        AddTextEntry("HELP", "Appuyez sur ~INPUT_CONTEXT~ ~s~pour accéder au menu")
                        DisplayHelpTextThisFrame("HELP", false)
                        if IsControlJustPressed(1,51) then
                            OpenMenuVehicule()
                        end
                    end
                end
            end
        end
    Wait(wait)
    end
end)