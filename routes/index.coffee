#
# GET home page.
#

exports.index = (req, res) ->
	res.redirect '/'+randomString()

exports.log = (req, res) ->
	res.render 'log', { title: 'Express' }

randomString = ->
	chars = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
	string = ''
	for i in [1..4]
		rnum = Math.floor Math.random() * chars.length
		string += chars.charAt rnum
	string
