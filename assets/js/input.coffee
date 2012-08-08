#= require events

class window.Input extends EventEmitter
	constructor: (el) ->
		if not el.jquery
			el = $(el)
		self = @

		@input_el = $('<input type="text">')
		@input_el.css
				width: "100%"
				height: "28px"
				"box-sizing": "border-box"
				"-moz-box-sizing": "border-box"
				border: "1px solid #999"
				font: "130% monospace"
		@input_el.keypress (ev) =>
			if ev.which == 13
				self.emit 'command', @input_el.val()
				@input_el.val('')
		@input_el.change (ev) =>
			@emit 'change', ev

		el.append @input_el
		@input_el.focus()
