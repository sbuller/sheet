#= require events

class window.Input extends EventEmitter
	constructor: (el) ->
		if not el.jquery
			el = $(el)

		self = @

		input_el = $('<input type="text">')
		input_el.css
				width: "100%"
				border: "1px solid #999"
				font: "130% Consolas,Inconsolata,Courier New,monospace"
		input_el.keypress (ev) ->
			if ev.which == 13
				el = $(@)
				self.emit 'command', el.val()
				el.val('')
		input_el.change (ev) =>
			@emit 'change', ev

		el.append input_el
