express = require 'express'
routes = require './routes'
http = require 'http'
path = require 'path'
bootstrap = require 'bootstrap-stylus'
negotiate = require 'express-negotiate'

app = express()

app.set 'port', process.env.PORT || 3000
app.set 'views', __dirname + '/views'
app.set 'view engine', 'jade'
app.use express.favicon()
app.use express.logger 'dev'
app.use express.bodyParser()
app.use express.methodOverride()
app.use app.router
app.use require('connect-assets')()
app.use express.static path.join __dirname, 'public'

app.configure 'development', ->
  app.use express.errorHandler()

app.get '/', routes.index
app.get '/:log', routes.log
app.put '/:log', routes.put_log

http.createServer(app).listen app.get('port'), ->
  console.log "Express server listening on port " + app.get('port')
