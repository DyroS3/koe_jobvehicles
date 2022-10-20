----Gets ESX-------------------------------------------------------------------------------------------------------------------------------
ESX = exports["es_extended"]:getSharedObject()

AddEventHandler('esx:onPlayerSpawn', function()
    local ped = PlayerPedId()
    TriggerEvent('koe_jobvehicles:spawnZones')
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
	PlayerLoaded = true
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

AddEventHandler('onResourceStart', function(resourceName)
	if (resourceName == GetCurrentResourceName()) then
        while (ESX == nil) do Citizen.Wait(100) end        
        Citizen.Wait(5000)
        ESX.PlayerLoaded = true
        TriggerEvent('koe_jobvehicles:spawnZones')
	end
end)
---------------------------------------------------------------------------------------------------------------------------------------
local peds = {}
local PlayerData = {}

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

RegisterNetEvent('koe_jobvehicles:spawnZones')
AddEventHandler('koe_jobvehicles:spawnZones',function()
    local shopNPC = {}
    local locations = {}

    for k, v in pairs(Config.VehicleShopLocations) do
        table.insert(locations, v)
    end

    for i = 1, #locations do
        local npcZones = lib.points.new(locations[i].coords, 20, {zone = k, data = locations[i]})

        function npcZones:onEnter()
            lib.requestModel(self.data.model)
            shopNPC[i] = CreatePed(5, self.data.model, self.data.coords.x, self.data.coords.y, self.data.coords.z, self.data.heading, false, false)
            FreezeEntityPosition(shopNPC[i], true)
            SetEntityInvincible(shopNPC[i], true)
            SetBlockingOfNonTemporaryEvents(shopNPC[i], true)
            
            exports.qtarget:AddEntityZone(self.data.location, shopNPC[i], {
                name= self.data.location,
                debugPoly=false,
                useZ = true
                    }, {
                options = {
                    {
                        event = "koe_jobvehicles:client:MainMenu",
                        icon = "fa-solid fa-clipboard",
                        label = "Open Shop",
                        npc = locations[i],
                        location = self.data.location,
                        shopJob = self.data.job,
                        job = self.data.job,
                        jobLabel = self.data.jobLabel,
                        canInteract = function()
                            local player = PlayerPedId()
                            return IsPedOnFoot(player)
                        end,
                    },                                     
                },
                distance = 2
            })
        end

        function npcZones:onExit()
            DeletePed(shopNPC[i])
        end
    end
end)

RegisterNetEvent('koe_jobvehicles:client:MainMenu')
AddEventHandler('koe_jobvehicles:client:MainMenu', function(data)

    local currentJob = ESX.GetPlayerData().job.name
    local currentGradeLabel = ESX.GetPlayerData().job.grade_label

    local vehicles = data.npc.vehicles
    local vehicleSpawn = data.npc.boughtVehicleSpawn
    local spawnheading = data.npc.spawnHeading
    local vehiclesToBuy = {{title = 'Hover over to see price, Click to purchase.'}}

	for k, v in pairs(vehicles) do
        local rank = ESX.GetPlayerData().job.grade

        table.insert(vehiclesToBuy,
            {
                title = v.label,
                image = v.image,
                event = 'koe_jobvehicles:client:rankCheck',
                metadata = {'Price: $'..v.price, 'Required Rank: '..v.rankLabel},
                args = {
                    selectedVehicle = v.model,
                    currentRank = rank,
                    requiredRank = v.rank,
                    type = v.type,
                    price = v.price,
                    requiredRankLabel = v.rankLabel,
                    spawn = vehicleSpawn,
                    heading = spawnheading,
                    jobLabel = data.jobLabel
                }
            }
        )
    end

    lib.registerContext({
        id = 'jobvehiclesmenu',
        title = data.location,
        options = {
            {
                title = 'Available Vehicles',
                menu = 'mainvehmenu',
                options = {
                    {
                        title = "Vehicles",
                        menu = 'mainvehmenu',
                    },
                }
            },
            lib.registerContext({
                id = 'mainvehmenu',
                menu = 'jobvehiclesmenu',
                options = vehiclesToBuy
            })
        }
    })
        lib.showContext('jobvehiclesmenu')
end)


RegisterNetEvent('koe_jobvehicles:client:rankCheck')
AddEventHandler('koe_jobvehicles:client:rankCheck',function(data)
    local currency = nil
    selectedVehicle = data.selectedVehicle
    currentRank = data.currentRank
    requiredRank = data.requiredRank
    type = data.type
    price = data.price
    requiredRankLabel = data.requiredRankLabel
    spawn = data.spawn
    heading = data.heading
    jobLabel = data.jobLabel

    if Config.BuyWithCash == true then 
        currency = 'Cash'
    else
        currency = 'Bank'
    end

    if data.currentRank >= data.requiredRank then
		lib.registerContext({
			id = 'confirm',
			title = 'Are you sure you want to purchase?',
			description= 'Price: $'..price..' Account Type: '..currency,
			options = {
				{
					title = 'Yes',
					arrow = true,
					event = 'koe_jobvehicles:client:buyIt',
					args = {
						selectedVehicle = data.selectedVehicle,
						currentRank = data.currentRank,
						requiredRank = data.requiredRank,
						type = data.type,
						price = data.price,
						requiredRankLabel = data.requiredRankLabel,
                        spawn = data.spawn,
                        heading = data.heading,
                        jobLabel = jobLabel
					}
				},
				{
					title = 'No',
					arrow = true,
					menu = 'jobvehiclesmenu',
				},
			},
		})
		lib.showContext('confirm')
	else
		lib.notify({
			title = 'PD',
			description = 'You need to be ['..data.requiredRankLabel..'] or higher to purchase that vehicle.',
			type = 'error',
			duration = 8000,
			position = 'top'
		})
	end
end)

RegisterNetEvent('koe_jobvehicles:client:buyIt')
AddEventHandler('koe_jobvehicles:client:buyIt',function(data)
    selectedVehicle = data.selectedVehicle
    type = data.type
    price = data.price
    spawn = data.spawn
    heading = data.heading
    jobLabel = data.jobLabel
    print(type)
    TriggerServerEvent('koe_jobvehicles:server:buyVehicle', selectedVehicle, price, type, spawn, heading, jobLabel)
end)

RegisterNetEvent('koe_jobvehicles:client:spawnVehicle')
AddEventHandler('koe_jobvehicles:client:spawnVehicle',function(selectedVehicle, type, spawn, heading, jobLabel)
    print(jobLabel)
    if type == 'car' then
        ESX.Game.SpawnVehicle(selectedVehicle, spawn, heading, function(vehicle)
            local plate = GetVehicleNumberPlateText(vehicle)
            local vehicleProps = lib.getVehicleProperties(vehicle)
            ESX.Game.SetVehicleProperties(vehicle, vehicleProps)
            TriggerServerEvent('koe_jobvehicles:server:setVehicleOwned', vehicle, plate, type, vehicleProps, jobLabel)

            if Config.KeyScript == 'cd_garage' then
                TriggerEvent('cd_garage:AddKeys', plate)
            end

        end)
    elseif type == 'helicopter' then
        ESX.Game.SpawnVehicle(selectedVehicle, spawn, heading, function(vehicle)
            local plate = GetVehicleNumberPlateText(vehicle)
            local vehicleProps = lib.getVehicleProperties(vehicle)
            TriggerServerEvent('esx_policejob:setVehicleOwned', vehicle, plate, type, vehicleProps)

            if Config.KeyScript == 'cd_garage' then
                TriggerEvent('cd_garage:AddKeys', plate)
            end
        end)
    elseif type == 'boat' then
        ESX.Game.SpawnVehicle(selectedVehicle, spawn, heading, function(vehicle)
            local plate = GetVehicleNumberPlateText(vehicle)
            local vehicleProps = lib.getVehicleProperties(vehicle)
            ESX.Game.SetVehicleProperties(vehicle, vehicleProps)
            TriggerServerEvent('koe_jobvehicles:server:setVehicleOwned', vehicle, plate, type, vehicleProps, jobLabel)

            if Config.KeyScript == 'cd_garage' then
                TriggerEvent('cd_garage:AddKeys', plate)
            end

            vehBlip = AddBlipForCoord(spawn)
            SetBlipSprite(vehBlip, 1)
            SetBlipDisplay(vehBlip, 4)
            SetBlipScale(vehBlip, 0.8)
            SetBlipColour(vehBlip, 2)
            SetBlipAsShortRange(vehBlip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString("Vehicle Location")
            EndTextCommandSetBlipName(vehBlip)
            SetBlipRoute(vehBlip, true)

            lib.notify({
                title = 'Job Vehicles',
                description = 'Location marked on GPS where to pickup the vehicle.',
                type = 'inform',
                duration = 8000,
                position = 'top'
            })

        end)
    end



end)


