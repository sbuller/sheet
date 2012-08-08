class window.Processor extends EventEmitter
# 	constructor: () ->

		process: (message) =>
			words = message.split " "
			if message[0] == "/"
				@emit "_#{words[0][1..]}", words[1..]
				debugString = if words.length <= 1 then "no parameters" else "parameter #{words[1..]}"
				console.log "Emitted _#{words[0][1..]} with #{debugString}"
			else if notEmpty message
				@emit 'log', message

		define: (message, callback) ->
			@on "_#{message}", callback
# 			console.log "Upon _#{message}, call function #{callback}"

notEmpty = (message) ->
	!!message.match /\S/
