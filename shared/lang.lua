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

        claim_success = "Redeem code successfully!",
        claim_failed = "ailed to use redeem code!",

        delete_warning = "Are you sure you want to delete the redeem code: %s",
        delete_success = "Successfully deleted the redeem code: %s",


    }
}

function getText(key, ...)
    local text = Lang[Config.Lang] and Lang[Config.Lang][key] or "Text not found"
    return string.format(text, ...)
end


