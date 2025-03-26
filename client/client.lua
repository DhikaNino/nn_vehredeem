local isCooldown = false 

CreateThread(function()
    while true do
        Wait(Config.Delay * 1000)
        isCooldown = false
    end
end)


local function redeemCode()
  local input = lib.inputDialog(getText('title'), { {type = 'input', label = getText('label_redeem'), description = getText('placeholder_redeem'), required = true, min = 4, max = 16}})
  if not input then return end
  TriggerServerEvent('nn_vehredeem:server:claimredeem', input[1])
end

local function createRedeemCode() 
  local haveAccess = lib.callback.await('nn_vehredeem:server:checkPermission', source)
  if not haveAccess then
    lib.notify({
      title = getText('title'),
      description = getText('no_permission'),
      type = 'error'
    })
      return
  end
    local input = lib.inputDialog(getText('title_create'), { 
      {type = 'input', label = getText('label_redeem'), description = getText('placeholder_redeem'), required = true, min = 4, max = 16},
      {type = 'input', label = getText('label_vehicle'), description = getText('placeholder_vehicle'), required = true, min = 1}
    })
    if not input then return end
    TriggerServerEvent('nn_vehredeem:server:createredeem', input[1], input[2])
end

local function listRedeemCode()
  local haveAccess = lib.callback.await('nn_vehredeem:server:checkPermission', source)

  if not haveAccess then
    lib.notify({
      title = getText('title'),
      description = getText('no_permission'),
      type = 'error'
    })
      return
  end
  local getData = lib.callback.await('nn_vehredeem:server:listcode')


  local formated = {}

  for _, data in ipairs(getData) do
      table.insert(formated, {
          title = data.redeem_code,
          description = string.format("Vehicle Model  : %s \nAdmin Created : %s \nPlayer Claimed : %s",
              data.vehicle_model:upper() or "Unknown",
              data.admin or "Unknown",
              data.claimed_by or "Not Claimed"
          ),
          event = 'nn_vehredeem:client:confirmdelete',
          arrow = true,
          args = data.redeem_code
      })
  end
  
  lib.registerContext({
    id = 'list_redeem_code_vehicle',
    title = 'List '..getText('title'),
    options = formated
  })
  lib.showContext('list_redeem_code_vehicle')
end


RegisterCommand(Config.Command, function(source, args, rawCommand)
  if isCooldown then
    lib.notify({
      title = getText('title'),
      description = getText('cooldown'),
      type = 'warning'
    })
    return
  end
  isCooldown = true
  if args[1] and args[1]:lower() == 'create' then
    createRedeemCode()
  elseif args[1] and args[1]:lower() == 'list' then
    listRedeemCode()
  else
    redeemCode()
  end
end, false)



RegisterNetEvent('nn_vehredeem:client:confirmdelete', function(data)
  local alert = lib.alertDialog({
    header = 'Warning!',
    content = getText('delete_warning', data),
    centered = true,
    cancel = true
  })
  if alert == 'cancel' then return end
  TriggerServerEvent('nn_vehredeem:server:deleteredeem', data)
end)