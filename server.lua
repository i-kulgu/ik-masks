ESX = nil
TriggerEvent("esx:getSharedObject", function(library)
	ESX = library
end)

-- Create usable masks from config file
for k, v in pairs(Config["Masks"]) do
    ESX.RegisterUsableItem(k, function(source)
        local src = source
        maskId = v.maskId
        TriggerClientEvent('ik-masks:client:wearMask', src, maskId)
    end)
end