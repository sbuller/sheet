#= require input
#= require log

$ ->
	inputWidget = new Input '#input'
	logWidget = new Log '#log'

	inputWidget.on 'command', (command) ->
		logWidget.log command

	$('html').live 'keypress', (e) ->
		el = inputWidget.input_el
		if e.target != el[0]
			el.focus()
			e.preventDefault()
			el.val el.val() + String.fromCharCode e.which
			el.trigger type: 'keypress', which: e.which
