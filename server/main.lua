local QBCore = exports['qb-core']:GetCoreObject()

for k,v in pairs(Config.masks) do
    QBCore.Functions.CreateUseableItem(k, function(source, item)
        local src = source
        TriggerClientEvent("masks:client:wear", src, item.name)
    end)
end
