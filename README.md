# [QBOX] Vehicle Redeem  

## Main Features  

### 1. Redeeming a Code  
- You can redeem a code using the `/redeem` command.  

### 2. Creating a Redeem Code  
- You can create a redeem code using the `/redeem create` command.  

### 3. Viewing All Redeem Codes  
- You can view all redeem codes using the `/redeem list` command.  

### 4. Deleting a Redeem Code  
- You can delete a redeem code after executing the `/redeem list` command.  

### 5. Language  
- This script supports language configuration. You can change it in the **shared/config.lua** folder. By default, the script only supports two languages: Indonesian and English, but you can add more languages in the **shared/lang.lua** folder.  

### 6. Discord Webhook  
- This script is also integrated with Discord Webhook. The webhook will trigger when you create a redeem code, redeem a code, and delete a redeem code.  

## Configuration  

### General  
```lua
Config.Lang = 'en' -- en/id  

Config.Command = 'redeem' -- Command  
Config.Delay = 3 -- Seconds  

Config.identifierName = true -- If false, retrieves the player's first name and last name from charinfo.  
Config.deleteClaimed = true -- If true, data will be deleted after being claimed, reducing database entries and allowing the same redeem code to be reused.  

Config.webhookURL = "WEBHOOK URL" -- Discord webhook  

Config.AdminGroups = { -- Permissions  
	'god',  
	'superadmin',  
	'admin',  
	-- 'mod'  
}
```  

### Language  
```lua
Lang = {
    ["id"] = {
        title = "Vehicle Redeem",
        title_create = "Buat Kode Redeem",

        label_redeem = "Kode Redeem",
        placeholder_redeem = "Masukan kode redeem",

        label_vehicle = "Model Kendaraan",
        placeholder_vehicle = "Masukan model kendaraan",

        cooldown = "Sedang cooldown!",

        no_permission = "Kamu tidak dapat melakukan command tersebut!",

        create_success = "Kode redeem berhasil dibuat!",
        create_failed = "Kode redeem gagal dibuat!",

        claim_success = "Kode redeem berhasil diredeem!",
        claim_failed = "Gagal menggunakan kode redeem!",

        delete_warning = "Kamu yakin ingin menghapus kode redeem: %s",
        delete_success = "Berhasil menghapus kode redeem: %s",
    },
    ["en"] = {
        title = "Vehicle Redeem",
        title_create = "Create Redeem Code",
        
        label_redeem = "Redeem Code",
        placeholder_redeem = "Enter the redeem code",

        label_vehicle = "Vehicle Model",
        placeholder_vehicle = "Enter the vehicle model",

        cooldown = "Cooldown!",

        no_permission = "You do not have permission to execute this command!",

        create_success = "Redeem code successfully created!",
        create_failed = "Failed to create redeem code!",

        claim_success = "Redeem code successfully used!",
        claim_failed = "Failed to use redeem code!",

        delete_warning = "Are you sure you want to delete the redeem code: %s",
        delete_success = "Successfully deleted the redeem code: %s",
    }
}

function getText(key, ...)
    local text = Lang[Config.Lang] and Lang[Config.Lang][key] or "Text not found"
    return string.format(text, ...)
end
```  

## Dependencies  

- QBOX[https://github.com/Qbox-project/qbx_core]  
- ox_lib[https://github.com/overextended/ox_lib]  
- oxmysql[https://github.com/overextended/oxmysql]  
## Support  

For assistance or bug reports, please create an issue in the repository.  
Or join our Discord: https://discord.gg/buZtNJpAK2  

## License  

This project is licensed under the MIT License - see the `LICENSE` file for details.  