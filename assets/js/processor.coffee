class window.Processor extends EventEmitter
# 	constructor: () ->

		process: (message) =>
			if notEmpty message
				@emit 'log', message

notEmpty = (message) ->
	!!message.match /\S/
