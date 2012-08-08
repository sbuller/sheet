ds = require 'docstore'

class Log
	constructor: ->
		ds.open './db/log', (err, store) =>
			@store = store

	get: (id, cb) ->
		@store.get id, (err, data) ->
			if data
				cb err, data.data
			else
				cb err, data

	set: (id, obj, cb) ->
		cb ?= -> undefined
		obj._id = id
		@store.save obj, cb

module.exports = new Log
