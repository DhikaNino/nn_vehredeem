fx_version "cerulean"

author "Dhika Nino"
description "Nino Vehicle Redeem"

version '1.0.0'

lua54 'yes'

games {
  "gta5",
}


client_scripts {
	"client/**/*"
}


server_scripts {
	'@oxmysql/lib/MySQL.lua',
	"server/**/*"
}

shared_scripts {
	'@ox_lib/init.lua',
	'shared/*'
}
