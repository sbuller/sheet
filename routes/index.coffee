#
# GET home page.
#

log = require '../model/log'

exports.index = (req, res) ->
	res.redirect '/'+randomString()

exports.log = (req, res) ->
	log.get req.params.log, (err, data) ->
		if err then data = {}
		req.negotiate
			'text/html,default': ->
				res.render 'log', {title: 'Log Sheet', data: JSON.stringify data}
			'application/json': ->
				res.send data

exports.put_log = (req, res) ->
	log.set req.params.log, {data: req.body.data}, (err) ->
		if err
			console.log err
		else
			res.send 200

randomString = ->
	chars = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
	string = ''
	for i in [1..4]
		rnum = Math.floor Math.random() * chars.length
		string += chars.charAt rnum
	string
