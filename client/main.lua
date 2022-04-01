local mask = false
ESX = nil
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent("esx:getSharedObject", function(library)
			ESX = library
		end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('ik-masks:client:wearMask')
AddEventHandler('ik-masks:client:wearMask', function(maskId)
    mask = not mask
    if mask then
        loadAnimDict('mp_masks@standard_car@ds@')
        TaskPlayAnim(PlayerPedId(), 'mp_masks@standard_car@ds@', 'put_on_mask', 8.0, 8.0, 800, 16, 0, false, false, false)
        SetPedComponentVariation(PlayerPedId(), 1, maskId, 0, 1)
    else
        mask = false
        loadAnimDict('mp_masks@standard_car@ds@')
        TaskPlayAnim(PlayerPedId(), 'mp_masks@standard_car@ds@', 'put_on_mask', 8.0, 8.0, 800, 16, 0, false, false, false)
        SetPedComponentVariation(PlayerPedId(), 1, 0, 0, 1)
    end
end)