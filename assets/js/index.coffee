#= require input
#= require log
#= require processor

$ ->
	processor = new Processor
	inputWidget = new Input '#input'
	logWidget = new Log '#log', processor

	inputWidget.on 'command', (command) ->
		processor.process command

	$('html').live 'keypress', (e) ->
		el = inputWidget.input_el
		if e.target != el[0]
			el.focus()
			e.preventDefault()
			el.val el.val() + String.fromCharCode e.which
			el.trigger type: 'keypress', which: e.which
