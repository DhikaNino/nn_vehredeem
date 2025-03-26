Config = {}

Config.Lang = 'en' -- en/id

Config.Command = 'redeem' -- Command
Config.Delay = 3 -- Second

Config.identifierName = true -- If false, then retrieve the player's first name and last name from charinfo.
Config.deleteClaimed = true -- If true, the data will be deleted after being claimed, reducing the amount of data in the database and allowing the same redeem code to be reused.

Config.webhookURL = "WEBHOOK URL" -- Discord webhook

Config.AdminGroups = { -- Permission
	'god',
	'superadmin',
	'admin',
	-- 'mod'
}


