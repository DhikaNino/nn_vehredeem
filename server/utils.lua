local QBCore = exports['qb-core']:GetCoreObject()

function getPlayerName(player_source)
    local Player = QBCore.Functions.GetPlayer(player_source)
    if Config.identifierName then
        return Player.PlayerData.name
    else
        return Player.PlayerData.charinfo.firstname ..' '.. Player.PlayerData.charinfo.lastname
    end
end

function GeneratePlate()
    local plate = 'NN ' .. QBCore.Shared.RandomInt(3) .. QBCore.Shared.RandomStr(2)
    local result = MySQL.Sync.fetchScalar('SELECT plate FROM player_vehicles WHERE plate = ?', {plate})
    if result then
        return GeneratePlate()
    else
        return plate:upper()
    end
end


function sendToDiscord(message, color)
    local embedData = {
        {
            ["title"] = 'Vehicle Redeem',
            ["description"] = message,
            ["color"] = color,
            ["footer"] = {
                ["text"] = "Vehicle Redeem By Dhika Nino",
            },
            ["timestamp"] = os.date("!%Y-%m-%dT%H:%M:%SZ")
        }
    }

    PerformHttpRequest(Config.webhookURL, function(err, text, headers) end, "POST", json.encode({
        username = "Vehicle Redeem",
        embeds = embedData
    }), { ["Content-Type"] = "application/json" })
end

