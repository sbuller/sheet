#= require input
#= require log

$ ->
	inputWidget = new Input '#input'
	logWidget = new Log '#log'

	inputWidget.on 'command', (command) ->
		logWidget.log command
