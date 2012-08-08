window.importCommands = (processor) ->
	commands =
		version: (params) -> processor.emit "log", "Pathfinder Character Sheet ver0.1a"
		alert: (params) -> alert params.join " "
		save: ->
			$.ajax
				type: 'PUT'
				url: window.location
				data:
					data: ["some text here"]
				success: -> undefined

	for key, value of commands
# 		console.log key + ": " + value
		processor.define key, value
