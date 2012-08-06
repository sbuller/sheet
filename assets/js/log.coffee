class window.Log
	constructor: (el) ->
		if not el.jquery
			el = $(el)
		@el = el

		@el.css
			font: "130% monospace"
			padding: "10px 20px"
			color: "#808080"
			background: "#CCF"

	log: (message) ->
		entry_el = $('<div class="entry">')
		entry_el.text message
		@el.append entry_el
