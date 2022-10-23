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










function OpenMenuSacBank()

    local SacBank = RageUI.CreateMenu("Transfert de Fonds","Made by evann™")

    RageUI.Visible(SacBank, not RageUI.Visible(SacBank))

    while SacBank do
        
        Citizen.Wait(0)

        RageUI.IsVisible(SacBank,true,true,true,function()

            RageUI.Separator("↓     Mission     ~s~↓")
        
            
            RageUI.ButtonWithStyle("Prendre les sacs", nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                if Selected then
                    TriggerServerEvent('evJob:GiveItem', 'Sac Argent', 'sac_argent')
                    TriggerServerEvent('evJob:GiveItem', 'Sac Argent', 'sac_argent')
                    TriggerServerEvent('evJob:GiveItem', 'Sac Argent', 'sac_argent')
                    Citizen.Wait(20000)
                    local BLIPBANK = AddBlipForCoord(vector3(-103.501, 6475.584, 31.626))
                        SetBlipSprite(BLIPBANK, 652)
                        SetBlipColour(BLIPBANK, 1)
                        SetBlipScale(BLIPBANK, 2.0)
                        SetBlipAsShortRange(BLIPBANK, true)
                        BeginTextCommandSetBlipName('STRING')
                        AddTextComponentString("Arrivées Convoi Possibles")
                        EndTextCommandSetBlipName(BLIPBANK)
                        local BLIPBANK2 = AddBlipForCoord(vector3(310.792, -283.249, 34.174))
                        SetBlipSprite(BLIPBANK2, 652)
                        SetBlipColour(BLIPBANK2, 1)
                        SetBlipScale(BLIPBANK2, 2.0)
                        SetBlipAsShortRange(BLIPBANK2, true)
                        BeginTextCommandSetBlipName('STRING')
                        AddTextComponentString("Arrivées Convoi Possibles")
                        EndTextCommandSetBlipName(BLIPBANK2)
                    TriggerServerEvent('evJob:Depart')
                    Citizen.Wait(1500000)
                    RemoveBlip(BLIPBANK)
                    RemoveBlip(BLIPBANK2)
                    RageUI.CloseAll()    
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
            for k in pairs {vector3(-1216.126, -335.415, 37.780)} do
                local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                local pos = {vector3(-1216.126, -335.415, 37.780)}
                local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pos[k].x, pos[k].y, pos[k].z)

                if dist <= 6 then
                    wait = 0
                    DrawMarker(2, -1216.126, -335.415, 37.780, 0.0, 0.0, 0.0, 0.0,0.0,0.0, 0.7, 0.7, 0.7, 114, 204, 114, 180, true, true, p19, true)  
                    if dist <= 1.0 then
                        wait = 0


                        AddTextEntry("HELP", "Appuyez sur ~INPUT_CONTEXT~ ~s~pour accéder au menu")
                        DisplayHelpTextThisFrame("HELP", false)
                        if IsControlJustPressed(1,51) then
                            OpenMenuSacBank()
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
            for k in pairs {vector3(-1216.126, -335.415, 37.780)} do
                local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                local pos = {vector3(-1216.126, -335.415, 37.780)}
                local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pos[k].x, pos[k].y, pos[k].z)

                if dist <= 6 then
                    wait = 0
                    DrawMarker(2, -1216.126, -335.415, 37.780, 0.0, 0.0, 0.0, 0.0,0.0,0.0, 0.7, 0.7, 0.7, 114, 204, 114, 180, true, true, p19, true)  
                    if dist <= 1.0 then
                        wait = 0


                        AddTextEntry("HELP", "Appuyez sur ~INPUT_CONTEXT~ ~s~pour accéder au menu")
                        DisplayHelpTextThisFrame("HELP", false)
                        if IsControlJustPressed(1,51) then
                            OpenMenuSacBank()
                        end
                    end
                end
            end
        end
    Wait(wait)
    end
end)