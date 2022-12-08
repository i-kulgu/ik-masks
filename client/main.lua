local QBCore = exports['qb-core']:GetCoreObject()
local PlayerData = {}
local wearing = false
local masks = Config.masks
local MaskBlip = nil
local ped = {}

AddEventHandler('onResourceStart', function(resource)
   if resource ~= GetCurrentResourceName() then return end
   PlayerData = QBCore.Functions.GetPlayerData()
end)

RegisterNetEvent('QBCore:Client:OnGangUpdate', function()
    PlayerData = QBCore.Functions.GetPlayerData()
end)

local function SetupItems()
    local products = Config.masks
    local curGang
    local items = {}
    local slot = 0

    for k,v in pairs(products) do
        curGang = v.gang
        slot = slot + 1
        if curGang then goto gangCheck end

        items[#items + 1] = { name = k, price = v.price, amount = 10, info = {}, type = "item", slot = slot,}

        goto nextIteration

        :: gangCheck ::
        if PlayerData.gang.name ~= 'none' then
            items[#items + 1] = { name = k, price = v.price, amount = 10, info = {}, type = "item", slot = slot,}
        end

        :: nextIteration ::
    end
    return items
end

local function openShop(shop)
    local ShopItems = {}
    ShopItems.items = {}
    ShopItems.label = "Masks Shop"

    ShopItems.items = SetupItems()

    for k in pairs(ShopItems.items) do
        ShopItems.items[k].slot = k
    end

    TriggerServerEvent("inventory:server:OpenInventory", "shop", "MaskShop_" .. shop, ShopItems)
end

Citizen.CreateThread(function()
    for k, v in pairs(Config.peds) do -- Create ped for each location given in Config
        MaskBlip = AddBlipForCoord(v.coords)
        SetBlipSprite(MaskBlip, v.sprite)
        SetBlipScale(MaskBlip, 0.7)
        SetBlipDisplay(MaskBlip, 6)
        SetBlipColour(MaskBlip, v.blipcolor)
        SetBlipAsShortRange(MaskBlip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName(v.label)
        EndTextCommandSetBlipName(MaskBlip)

        -- Create ped for each location in coords
        RequestModel(v.hash) while not HasModelLoaded(v.hash) do Wait(0) end
        if ped["MaskShop - ['"..k.."']"] == nil then ped["MaskShop - ['"..k.."']"] = CreatePed(0, v.hash, v.coords.x, v.coords.y, v.coords.z-1.0, v.coords.a, false, false) end
        local scenarios = { "WORLD_HUMAN_AA_COFFEE", "WORLD_HUMAN_CLIPBOARD", "WORLD_HUMAN_SMOKING", "WORLD_HUMAN_STAND_MOBILE", "WORLD_HUMAN_TOURIST_MOBILE" }
        local scenario = math.random(1, #scenarios)
        TaskStartScenarioInPlace(ped["MaskShop - ['"..k.."']"], scenarios[scenario], -1, true)
        SetBlockingOfNonTemporaryEvents(ped["MaskShop - ['"..k.."']"], true)
        FreezeEntityPosition(ped["MaskShop - ['"..k.."']"], true)
        SetEntityNoCollisionEntity(ped["MaskShop - ['"..k.."']"], PlayerPedId(), false)
        SetEntityInvincible(ped["MaskShop - ['"..k.."']"], true)
        if Config.Debug then print("Ped Created for MaskShop - ['"..k.."']") end

        if Config.Debug then print("MaskShop - ['"..k.."']") end
        exports['qb-target']:AddCircleZone("MaskShop - ['"..k.."']", vector3(v.coords.x, v.coords.y, v.coords.z), 2.0, { name="MaskShop - ['"..k.."']", debugPoly=Config.Debug, useZ=true, },{ options = {{event = "ik-masks:client:openShop", icon = "fas fa-certificate", label = "Open Mask Shop", shopnr = k}}, distance = 2.0 })
    end
end)

RegisterNetEvent("ik-masks:client:openShop", function(data)
    openShop(data.shopnr)
end)

RegisterNetEvent('masks:client:wear', function(itemName)
    local ped = PlayerPedId()
    if not wearing then
        QBCore.Functions.Progressbar("puton_mask", "Putting mask on..", 1000, false, true, {
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
        QBCore.Functions.Progressbar("putoff_mask", "Taking mask off..", 1000, false , true, {
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

AddEventHandler('onResourceStop', function(resource) if resource ~= GetCurrentResourceName() then return end
    for k, v in pairs(Config.peds) do
        DeletePed(ped["MaskShop - ['"..k.."']"])
        exports['qb-target']:RemoveZone("MaskShop - ['"..k.."']")
    end
end)
