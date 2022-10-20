fx_version 'cerulean'

game 'gta5'
lua54 'yes'

author 'Dalkoe of Koe Scripts'
description ''
version '1.0.0'


client_scripts {
	'client.lua',
	'config.lua'
 }
 
 server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'server.lua',
	'config.lua'
 }

shared_script '@ox_lib/init.lua'
shared_script '@es_extended/imports.lua'