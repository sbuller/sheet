ds = require 'docstore'

class Log
	constructor: ->
		ds.open './db/log', (err, store) =>
			@store = store

	get: (id, cb) ->
		@store.get id, cb

	set: (id, obj, cb) ->
		cb ?= -> undefined
		obj._id = id
		@store.save obj, cb

module.exports = new Log
