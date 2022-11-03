local QBCore = exports['qb-core']:GetCoreObject()
local wearing = false
local masks = Config.masks

RegisterNetEvent('masks:client:wear', function(itemName)
    local ped = PlayerPedId()
    if not wearing then
        QBCore.Functions.Progressbar("puton_mask", "Putting mask on..", 2500, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {
            animDict = 'mp_masks@standard_car@ds@',
            anim = 'put_on_mask',
            flags = 16,
        }, {}, {}, function() -- Done
            SetPedComponentVariation(ped, 1, masks[itemName].variation, masks[itemName].palette)
            wearing = true
        end)
    elseif wearing then
        QBCore.Functions.Progressbar("putoff_mask", "Putting mask off..", 2500, false , true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {
            animDict = 'mp_masks@standard_car@ds@',
            anim = 'put_on_mask',
            flags = 16,
        }, {}, {}, function() -- Done
            SetPedComponentVariation(ped, 1, 0, 0)
            wearing = false
        end)
    end
end)