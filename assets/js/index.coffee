#= require input

$ ->
	inputWidget = new Input('#input')
	inputWidget.on 'command', (command) ->
		console.log command
