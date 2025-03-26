local QBCore = exports['qb-core']:GetCoreObject()



RegisterNetEvent('nn_vehredeem:server:createredeem', function(redeem_code, vehicle_model)
    local src = source

    MySQL.query('SELECT redeem_code FROM nn_vehicleredeem WHERE redeem_code = ?', {
        redeem_code
    }, function(response)
        if #response > 0 then
            TriggerClientEvent('ox_lib:notify', src, {
                title = getText('title'),
                description = getText('create_failed'),
                type = 'error'
            })
        else
            local response = MySQL.query.await('INSERT INTO nn_vehicleredeem(redeem_code, vehicle_model, admin) VALUES(?, ?, ?)', {
                redeem_code, vehicle_model, getPlayerName(src)
            })
            
            if response then
                sendToDiscord("Redeem Code: ".. redeem_code:upper() .."\nCreated by: "..getPlayerName(src), 65280)

                TriggerClientEvent('ox_lib:notify', src, {
                    title = getText('title'),
                    description = getText('create_success'),
                    type = 'success'
                })
            end
        end
  
    end)
    
end)


RegisterNetEvent('nn_vehredeem:server:claimredeem', function(redeem_code)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    MySQL.query('SELECT redeem_code, vehicle_model FROM nn_vehicleredeem WHERE redeem_code = ? AND claimed_by IS NULL', {
        redeem_code
    }, function(response)

        if #response > 0 then
            if Config.deleteClaimed then 
                MySQL.query.await('DELETE FROM nn_vehicleredeem WHERE redeem_code = ?', {
                    redeem_code
                })
            else 
                MySQL.query.await('UPDATE nn_vehicleredeem SET claimed_by = ? WHERE redeem_code = ?', {
                    getPlayerName(src), redeem_code
                })
            end
            
            exports.oxmysql:insert('INSERT INTO player_vehicles (license, citizenid, vehicle, hash, mods, plate, state) VALUES (?, ?, ?, ?, ?, ?, ?)', {
                Player.PlayerData.license,
                Player.PlayerData.citizenid,
                response[1].vehicle_model,
                GetHashKey(response[1].vehicle_model),
                '{}',
                GeneratePlate(),
                0
            })
            sendToDiscord("Redeem Code: ".. redeem_code:upper() .."\nClaimed by: "..getPlayerName(src), 16776960)

            TriggerClientEvent('ox_lib:notify', src, {
                title = getText('title'),
                description = getText('claim_success'),
                type = 'success'
            })
        else
            TriggerClientEvent('ox_lib:notify', src, {
                title = getText('title'),
                description = getText('claim_failed'),
                type = 'error'
            })
        end
  
    end)
    
end)

RegisterNetEvent('nn_vehredeem:server:deleteredeem', function(redeem_code)
    local src = source

    MySQL.query.await('DELETE FROM nn_vehicleredeem WHERE redeem_code = ?', {
        redeem_code
    })
    
    sendToDiscord("Redeem Code: ".. redeem_code:upper() .."\nDelete by: "..getPlayerName(src), 16711680)

    TriggerClientEvent('ox_lib:notify', src, {
        title = getText('title'),
        description = getText('delete_success', redeem_code),
        type = 'error'
    })
    
end)

lib.callback.register('nn_vehredeem:server:listcode', function()
    local response = MySQL.query.await('SELECT * FROM nn_vehicleredeem ORDER BY claimed_by IS NULL DESC', {})

    return response
end)


lib.callback.register('nn_vehredeem:server:checkPermission', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if not Player then return end

    local roleData = QBCore.Functions.GetPermission(src) 
    local hasAccess = false

    for _, adminRole in ipairs(Config.AdminGroups) do
        if roleData[adminRole] then 
            hasAccess = true
            break
        end
    end

    return hasAccess
end)





