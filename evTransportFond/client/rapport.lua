ESX = nil

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

RegisterNetEvent('esx:setJob2')
AddEventHandler('esx:setJob2', function(job2)
    ESX.PlayerData.job2 = job2
end)




-- Menu --
local open = false
local MenuCoffreEv = RageUI.CreateMenu("Fin de Mission", "Made by evann™")

MenuCoffreEv.Closed = function()
    open = false
end

function OpenMenuFinMission()
    local menuTest = RageUI.CreateMenu("Fin de Mission",nil)

    RageUI.Visible(menuTest, not RageUI.Visible(menuTest))

    while menuTest do
        
        Citizen.Wait(0)

        RageUI.IsVisible(menuTest,true,true,true,function()

            RageUI.Separator("↓ Mission ↓")
        
            RageUI.ButtonWithStyle("Poser les Sacs",nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                if Selected then
                    TriggerServerEvent('salaire')    
                end
            end)  

            

            RageUI.ButtonWithStyle("~r~Fermer le Menu",nil, {RightLabel = "~r~→→→"}, true, function(Hovered, Active, Selected)
                if Selected then
                    RageUI.CloseAll()   
                end
            end)  

        
        end, function()
        end)

        if not RageUI.Visible(menuTest) then
            menuTest=RMenu:DeleteType("Delete", true)
        end

    end

end






Citizen.CreateThread(function()
    while true do
		local wait = 750
			if ESX.PlayerData.job and ESX.PlayerData.job.name == 'police' then
				for k in pairs {vector3(-103.501, 6475.584, 31.626)} do
				local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
				local pos = {vector3(-103.501, 6475.584, 31.626)}
				local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pos[k].x, pos[k].y, pos[k].z)

				if dist <= 6 then
					wait = 0
					DrawMarker(2, -103.501, 6475.584, 31.626, 0.0, 0.0, 0.0, 0.0,0.0,0.0, 0.7, 0.7, 0.7, 114, 204, 114, 180, true, true, p19, true)  
				end

				if dist <= 1.0 then
					wait = 0
					
					AddTextEntry("HELP", "Appuyez sur ~INPUT_CONTEXT~ ~s~pour ouvrir le menu")
                    DisplayHelpTextThisFrame("HELP", false)
					if IsControlJustPressed(1,51) then
						OpenMenuFinMission()
					end
				end
			end
		end
    Citizen.Wait(wait)
    end
end)



Citizen.CreateThread(function()
    while true do
		local wait = 750
			if ESX.PlayerData.job and ESX.PlayerData.job.name == 'police' then
				for k in pairs {vector3(310.557, -282.864, 54.174)} do
				local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
				local pos = {vector3(310.557, -282.864, 54.174)}
				local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pos[k].x, pos[k].y, pos[k].z)

				if dist <= 6 then
					wait = 0
					DrawMarker(2, 310.557, -282.864, 54.174, 0.0, 0.0, 0.0, 0.0,0.0,0.0, 0.7, 0.7, 0.7, 114, 204, 114, 180, true, true, p19, true)  
				end

				if dist <= 1.0 then
					wait = 0
					
					AddTextEntry("HELP", "Appuyez sur ~INPUT_CONTEXT~ ~s~pour ouvrir le menu")
                    DisplayHelpTextThisFrame("HELP", false)
					if IsControlJustPressed(1,51) then
						OpenMenuFinMission()
					end
				end
			end
		end
    Citizen.Wait(wait)
    end
end)











