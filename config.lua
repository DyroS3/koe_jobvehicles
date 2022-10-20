
-- ░█████╗░██████╗░███████╗░█████╗░████████╗███████╗██████╗░  ██████╗░██╗░░░██╗  ██╗░░██╗░█████╗░███████╗
-- ██╔══██╗██╔══██╗██╔════╝██╔══██╗╚══██╔══╝██╔════╝██╔══██╗  ██╔══██╗╚██╗░██╔╝  ██║░██╔╝██╔══██╗██╔════╝
-- ██║░░╚═╝██████╔╝█████╗░░███████║░░░██║░░░█████╗░░██║░░██║  ██████╦╝░╚████╔╝░  █████═╝░██║░░██║█████╗░░
-- ██║░░██╗██╔══██╗██╔══╝░░██╔══██║░░░██║░░░██╔══╝░░██║░░██║  ██╔══██╗░░╚██╔╝░░  ██╔═██╗░██║░░██║██╔══╝░░
-- ╚█████╔╝██║░░██║███████╗██║░░██║░░░██║░░░███████╗██████╔╝  ██████╦╝░░░██║░░░  ██║░╚██╗╚█████╔╝███████╗
-- ░╚════╝░╚═╝░░╚═╝╚══════╝╚═╝░░╚═╝░░░╚═╝░░░╚══════╝╚═════╝░  ╚═════╝░░░░╚═╝░░░  ╚═╝░░╚═╝░╚════╝░╚══════╝

-- ░██████╗░█████╗░██████╗░██╗██████╗░████████╗░██████╗
-- ██╔════╝██╔══██╗██╔══██╗██║██╔══██╗╚══██╔══╝██╔════╝
-- ╚█████╗░██║░░╚═╝██████╔╝██║██████╔╝░░░██║░░░╚█████╗░
-- ░╚═══██╗██║░░██╗██╔══██╗██║██╔═══╝░░░░██║░░░░╚═══██╗
-- ██████╔╝╚█████╔╝██║░░██║██║██║░░░░░░░░██║░░░██████╔╝
-- ╚═════╝░░╚════╝░╚═╝░░╚═╝╚═╝╚═╝░░░░░░░░╚═╝░░░╚═════╝░

Config = {}     

Config.BuyWithCash = false
Config.KeyScript = 'cd_garage'

Config.VehicleShopLocations = {
	PoliceCars = {                                       
		location = 'Police Vehicles',                           
        coords = vector3(457.6020, -1017.1049, 27.3132),   
        model = 'csb_cop',                                
        heading = 85.8662,                                 
        job = 'police',  
        jobLabel = 'Police',
        boughtVehicleSpawn = vector3(443.12, -1015.92, 28.64),
        spawnHeading = 89.2,                                                             
        vehicles = {
            {rank = 1, rankLabel = 'Secretary', model = 'polstanierr', label = 'CVPI',price = 500, type = 'car', image = 'https://media.discordapp.net/attachments/1004690515700224010/1011471128369320006/unknown.png?width=810&height=393'},
			{rank = 2, rankLabel = 'Officer', model = 'polspeedor', label = 'Transport Van',price = 500, type = 'car', image = 'https://media.discordapp.net/attachments/1004690515700224010/1011470824521338950/unknown.png'},
			{rank = 2, rankLabel = 'Officer', model = 'valor6rb', label = 'Ford Taurus(Import)',price = 5000, type = 'car', image = 'https://media.discordapp.net/attachments/843222058003202088/1019444680884224040/unknown.png'},
			{rank = 2, rankLabel = 'Officer', model = 'polstanierr', label = 'CVPI',price = 1000, type = 'car', image = 'https://media.discordapp.net/attachments/1004690515700224010/1011471128369320006/unknown.png?width=810&height=393'},
			{rank = 2, rankLabel = 'Officer', model = 'poltorencer', label = 'Sedan',price = 1000, type = 'car', image = 'https://media.discordapp.net/attachments/1004690515700224010/1011471347223900232/unknown.png?width=810&height=481'},
			{rank = 2, rankLabel = 'Officer', model = 'polscoutr', label = 'SUV',price = 5000, type = 'car', image = 'https://media.discordapp.net/attachments/1004690515700224010/1011471498986389514/unknown.png?width=810&height=554'},
			{rank = 2, rankLabel = 'Officer', model = 'polvigero', label = 'Sports',price = 20000, type = 'car', image = 'https://media.discordapp.net/attachments/1004690515700224010/1011471688711548999/unknown.png?width=810&height=425'},
			{rank = 2, rankLabel = 'Officer', model = 'mbu3rb', label = 'Kawasaki(Import)',price = 8000, type = 'car', image = 'https://media.discordapp.net/attachments/843222058003202088/1019444679869202462/unknown.png'},
			{rank = 4, rankLabel = 'Senior Officer', model = 'polcarar', label = 'Truck',price = 20000, type = 'car', image = 'https://media.discordapp.net/attachments/1004690515700224010/1011477262480179271/unknown.png?width=810&height=399'},
			{rank = 4, rankLabel = 'Senior Officer', model = 'valor3rb', label = 'Dodge Charger(Import)',price = 20000, type = 'car', image = 'https://media.discordapp.net/attachments/843222058003202088/1019444680120864798/unknown.png'},
			{rank = 6, rankLabel = 'Corporal', model = 'polgauntletr', label = 'Muscle Car',price = 30000, type = 'car', image = 'https://media.discordapp.net/attachments/1004690515700224010/1011477520375353364/unknown.png?width=810&height=433'},
			{rank = 7, rankLabel = 'Sergeant', model = 'valor10rb', label = 'Durango(Import)',price = 15000, type = 'car', image = 'https://media.discordapp.net/attachments/843222058003202088/1019444680628383775/unknown.png'},
			{rank = 7, rankLabel = 'Sergeant', model = 'polbuffalor2', label = 'Muscle Car 2',price = 30000, type = 'car', image = 'https://media.discordapp.net/attachments/1004690515700224010/1011478238251450479/unknown.png?width=810&height=357'},
			{rank = 7, rankLabel = 'Sergeant', model = 'riot', label = 'SWAT Truck',price = 1000, type = 'car', image = 'https://media.discordapp.net/attachments/1004690515700224010/1011478473069568040/unknown.png'},
			{rank = 9, rankLabel = 'Captain', model = 'polbisonr', label = 'Truck Upgrade',price = 40000, type = 'car', image = 'https://media.discordapp.net/attachments/1004690515700224010/1011479352107606036/unknown.png?width=810&height=490'},
			{rank = 9, rankLabel = 'Captain', model = 'riot2', label = 'SWAT Truck 2',price = 1000, type = 'car', image = 'https://media.discordapp.net/attachments/1004690515700224010/1011479254485192816/unknown.png?width=810&height=498'},
			{rank = 10, rankLabel = 'Deputy Chief', model = 'polstalkerr', label = 'SUV Upgrade',price = 40000, type = 'car', image = 'https://media.discordapp.net/attachments/1004690515700224010/1011479614553600020/unknown.png'},
			{rank = 12, rankLabel = 'Sheriff', model = 'poldmntr', label = 'BCSO: Interceptor',price = 80000, type = 'car', image = 'https://media.discordapp.net/attachments/1004690515700224010/1011479823610302484/unknown.png?width=810&height=402'},
			{rank = 13, rankLabel = 'Chief', model = 'polcoquetter', label = 'PD: Interceptor',price = 80000, type = 'car', image = 'https://media.discordapp.net/attachments/1004690515700224010/1011480134160765048/unknown.png?width=810&height=345'},
			{rank = 12, rankLabel = 'Sheriff', model = 'ABSHEL', label = 'Mustang',price = 50000, type = 'car', image = 'https://cdn.discordapp.com/attachments/902776653988646932/1025832585672282163/unknown.png'},
			{rank = 13, rankLabel = 'Chief', model = 'ABSHEL', label = 'Mustang',price = 50000, type = 'car', image = 'https://cdn.discordapp.com/attachments/902776653988646932/1025832585672282163/unknown.png'},
        },
    },
    PoliceHelicopters = {
        location = 'Helicopter Vendor', 
        coords = vector3(463.7660, -982.2541, 42.6917), 
        heading = 89.0980, 
        model = 'ig_trafficwarden',
        job = 'police',  
        jobLabel = 'Police',
        boughtVehicleSpawn = vector3(449.0844, -981.2335, 43.6913),
        spawnHeading = 90.5212, 
        vehicles = {
            {rank = 8, rankLabel = 'Lieutenant', model = 'polmav', label = 'Maverick',price = 80000, type = 'helicopter', image = 'https://cdn.discordapp.com/attachments/1004690515700224010/1004691471443701842/unknown.png'},
        },
    },
    PoliceBoats = {
        location = 'Boat Vendor', 
        coords = vector3(460.0441, -986.7239, 24.7000), 
        heading = 92.6936, 
        model = 's_m_m_dockwork_01',
        job = 'police',  
        jobLabel = 'Police',
        boughtVehicleSpawn = vector3(-799.4310, -1502.3116, -0.4747),
        spawnHeading = 123.8863,
        vehicles = {
            {rank = 2, rankLabel = 'Officer', model = 'dinghy4', label = 'Dinghy',price = 5000, type = 'boat', image = 'https://media.discordapp.net/attachments/1004690515700224010/1005780988187643935/unknown.png'},
            {rank = 6, rankLabel = 'Corporal', model = 'predator', label = 'Police Predator',price = 20000, type = 'boat', image = 'https://cdn.discordapp.com/attachments/1016480861165735936/1020700853331566742/unknown.png'},
        },
    },

    EMSCars = {                                       
		location = 'EMS Vehicles',                           
        coords = vector3(294.0, -597.8, 42.28),   
        model = 's_m_m_doctor_01',                                
        heading = 70.08,                                 
        job = 'ambulance',  
        jobLabel = 'Ambulance',
        boughtVehicleSpawn = vector3(290.6, -603.52, 43.16),
        spawnHeading = 333.1283,                                                                  
        vehicles = {
            {rank = 0, rankLabel = 'Recruit', model = 'emsnspeedo', label = 'Ambulance', price = 1000, type = 'car', image = 'https://cdn.discordapp.com/attachments/1004690515700224010/1004690537556742255/unknown.png'},
            {rank = 2, rankLabel = 'Paramedic', model = 'emsroamer', label = 'SUV', price = 30000, type = 'car', image = 'https://cdn.discordapp.com/attachments/1004690515700224010/1004690865773617213/unknown.png'},
            {rank = 2, rankLabel = 'Paramedic', model = 'firetruk', label = 'Firetruck', price = 100, type = 'car', image = 'https://media.discordapp.net/attachments/1004690515700224010/1022198727630409780/unknown.png'},
            {rank = 2, rankLabel = 'Paramedic', model = 'LSFDCMD', label = 'Truck', price = 30000, type = 'car', image = 'https://media.discordapp.net/attachments/1004690515700224010/1022198072060674181/unknown.png?width=810&height=415'},
            {rank = 6, rankLabel = 'Co-Director', model = 'polcarar', label = 'Truck', price = 40000, type = 'car', image = 'https://media.discordapp.net/attachments/1004690515700224010/1011477262480179271/unknown.png?width=810&height=399'},
            {rank = 6, rankLabel = 'Co-Director', model = 'bmwexp', label = 'BMW', price = 45000, type = 'car', image = 'https://media.discordapp.net/attachments/1004690515700224010/1022198550530109481/unknown.png'},
        },
    },
    EMSHelicopters = {
        location = 'Helicopter Vendor', 
        coords = vector3(338.3325, -587.1526, 73.1617), 
        heading = 251.7704, 
        model = 'ig_trafficwarden',
        job = 'ambulance', 
        jobLabel = 'Ambulance', 
        boughtVehicleSpawn = vector3(351.3082, -588.1818, 74.1617),
        spawnHeading = 255.0556, 
        vehicles = {
            {rank = 8, rankLabel = 'Supervisor', model = 'polmav', label = 'Maverick',price = 80000, type = 'helicopter', image = 'https://cdn.discordapp.com/attachments/1004690515700224010/1004691471443701842/unknown.png'},
        },
    },
    EMSBoats = {
        location = 'Boat Vendor', 
        coords = vector3(342.1604, -570.8318, 27.7968), 
        heading = 70.4943, 
        job = 'ambulance',  
        model = 's_m_m_dockwork_01',
        jobLabel = 'Ambulance',
        boughtVehicleSpawn = vector3(-799.4310, -1502.3116, -0.4747),
        spawnHeading = 123.8863, 
        vehicles = {
            {rank = 2, rankLabel = 'Paramedic', model = 'dinghy4', label = 'Dinghy',price = 5000, type = 'boat', image = 'https://media.discordapp.net/attachments/1004690515700224010/1005780988187643935/unknown.png'},
        },
    },
   
}