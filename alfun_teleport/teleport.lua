Config = {}
	--------------------------------------------------------
	--=====Location Blip For Teleport========--
	--------------------------------------------------------
Config.MarkerZona = { 
	-- Garasi Kota --
	{x = 223.84, y = -789.6, z = 29.80},	
}

ESX = nil
Citizen.CreateThread(function()
	while true do
		Wait(5)
		if ESX ~= nil then
		
		else
			ESX = nil
			TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		end
	end
end)

local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}
	
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        for k in pairs(Config.MarkerZona) do
		
            DrawMarker(1, Config.MarkerZona[k].x, Config.MarkerZona[k].y, Config.MarkerZona[k].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 3.0, 3.0, 1.0, 0, 150, 150, 100, 0, 0, 0, 0)	
		end
    end
end)
	
			
function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
	
        for k in pairs(Config.MarkerZona) do
        	local ped = PlayerPedId()
            local pedcoords = GetEntityCoords(ped, false)
            local distance = Vdist(pedcoords.x, pedcoords.y, pedcoords.z, Config.MarkerZona[k].x, Config.MarkerZona[k].y, Config.MarkerZona[k].z)
            if distance <= 1.40 then
				DisplayHelpText('Tekan E Untuk Membuka Menu Teleport ')
					if IsControlJustPressed(0, Keys['E']) and IsPedOnFoot(ped) then
						OpenTpMenu()
					end 
			elseif distance < 1.45 then
				ESX.UI.Menu.CloseAll()
            end
        end
    end
end)

function OpenTpMenu()
	local ped = PlayerPedId()
	PlayerData = ESX.GetPlayerData()
	local elements = {}
		table.insert(elements, {label = '<span style="color:blue;">Taman Kota</span>', value = 'tamkot'}) 
		ESX.UI.Menu.CloseAll()
	ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'client',
    {
		title    = 'Menu Teleport',
		align    = 'bottom-right',
		elements = elements,
    },

	function(data, menu)
	if data.current.value == 'tamkot' then
		ESX.UI.Menu.CloseAll()
		SetPedCoordsKeepVehicle(ped, 225.49, -785.39 ,30.74)
	end
	ESX.UI.Menu.CloseAll()
    end
)end
