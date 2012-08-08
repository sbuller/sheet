window.importCommands = (processor) ->
	commands = 
		version: (params) -> processor.emit "log", "Pathfinder Character Sheet ver0.1a"
		alert: (params) -> alert params.join " "

	for key, value of commands
# 		console.log key + ": " + value
		processor.define key, value
