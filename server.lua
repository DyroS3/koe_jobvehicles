----Gets ESX-----
ESX = nil
local ox_inventory = exports.ox_inventory
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
----------------------------------------------------------------

RegisterNetEvent('koe_jobvehicles:server:buyVehicle')
AddEventHandler('koe_jobvehicles:server:buyVehicle', function(selectedVehicle, price, type, spawn, heading, jobLabel)
	local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    print(type)
	if Config.BuyWithCash == true then
		if xPlayer.getMoney() >= price then
		   	xPlayer.removeMoney(price)
			TriggerClientEvent('koe_jobvehicles:client:spawnVehicle', src, selectedVehicle, type, spawn, heading, jobLabel)
			TriggerClientEvent('ox_lib:notify', source, {type = 'success', description = 'Vehicle Purchased!', duration = 8000, position = 'top'})
		else
			TriggerClientEvent('ox_lib:notify', source, {type = 'error', description = 'Not enough money', duration = 8000, position = 'top'})
		end
	else
		if xPlayer.getAccount('bank').money >= price then
			xPlayer.removeAccountMoney('bank', price)
			TriggerClientEvent('koe_jobvehicles:client:spawnVehicle', src, selectedVehicle, type, spawn, heading, jobLabel)
			TriggerClientEvent('ox_lib:notify', source, {type = 'success', description = 'Vehicle Purchased!', duration = 8000, position = 'top'})
		else
			TriggerClientEvent('ox_lib:notify', source, {type = 'error', description = 'Not enough money', duration = 8000, position = 'top'})
		end
	end
		
end)

RegisterNetEvent('koe_jobvehicles:server:setVehicleOwned')
AddEventHandler('koe_jobvehicles:server:setVehicleOwned', function(vehicle, plate, type, vehicleProps, jobLabel)
	local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    print(jobLabel)
	if type == 'car' then
		MySQL.Async.execute('INSERT INTO owned_vehicles (owner, vehicle, plate, type, job, stored, garage_id, in_garage) VALUES (@owner, @vehicle, @plate, @type, @job, @stored, @garage_id, @in_garage)', {
			['@owner'] = xPlayer.identifier,
			['@vehicle'] = json.encode(vehicleProps),
			['@plate'] = plate,
			['@type'] = type,
			['@job'] = xPlayer.job.name,
			['@stored'] = false,
			['@garage_type'] = 'car',
			['@garage_id'] = jobLabel,
			['@in_garage'] = '0',
			
		}, function()
		end)
	elseif type == 'helicopter' then
		MySQL.Async.execute('INSERT INTO owned_vehicles (owner, vehicle, plate, type, job, stored, garage_type, garage_id, in_garage) VALUES (@owner, @vehicle, @plate, @type, @job, @stored, @garage_type, @garage_id, @in_garage)', {
			['@owner'] = xPlayer.identifier,
			['@vehicle'] = json.encode(vehicleProps),
			['@plate'] = vehicleProps.plate,
			['@type'] = type,
			['@job'] = xPlayer.job.name,
			['@stored'] = false,
			['@garage_type'] = 'air',
			['@garage_id'] = jobLabel,
			['@in_garage'] = '0',
			
		}, function()
		end)
	elseif type == 'boat' then
		MySQL.Async.execute('INSERT INTO owned_vehicles (owner, vehicle, plate, type, job, stored, garage_type, garage_id, in_garage) VALUES (@owner, @vehicle, @plate, @type, @job, @stored, @garage_type, @garage_id, @in_garage)', {
			['@owner'] = xPlayer.identifier,
			['@vehicle'] = json.encode(vehicleProps),
			['@plate'] = vehicleProps.plate,
			['@type'] = type,
			['@job'] = xPlayer.job.name,
			['@stored'] = false,
			['@garage_type'] = 'boat',
			['@garage_id'] = jobLabel,
			['@in_garage'] = '0',
			
		}, function()
		end)
	end
		
end)