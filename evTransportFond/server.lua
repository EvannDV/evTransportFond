ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
TriggerEvent('esx_society:registerSociety', 'police', 'police', 'society_police', 'society_police', 'society_police', {type = 'private'})

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)


-------------Stock Items

RegisterNetEvent('evJob:GiveItem')
AddEventHandler('evJob:GiveItem', function(Nom, Item)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    xPlayer.addInventoryItem(Item, 1)
end)


-----Annonces

RegisterServerEvent('evJob:Depart')
AddEventHandler('evJob:Depart', function()
	local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    local xPlayers = ESX.GetPlayers()
    for i=1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Fleeca', '~y~Annonce', 'Un convoi de ~p~transfert de fond ~s~est en cours', 'CHAR_BANK_FLEECA', 1)
    end
end)


---------Argent

RegisterNetEvent('salaire')
AddEventHandler('salaire', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local sacargent = xPlayer.getInventoryItem('sac_argent').count
    
    if sacargent < 12 then
        TriggerClientEvent('esx:showNotification', source, 'Vous devez commencez un transfert...') 
    else
        xPlayer.removeInventoryItem('sac_argent', 12)
        xPlayer.addMoney(Config.Salaire)
        TriggerClientEvent('esx:showNotification', source, 'Vous avez deposer les sacs et gagné ' ..Config.Salaire..'$')
    end
end)


------------Sac Argent Item Utilisable


ESX.RegisterUsableItem('sac_argent', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('sac_argent', 4)

	xPlayer.addAccountMoney('black_money', 25000)

end)
