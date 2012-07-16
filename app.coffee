express = require("express")
blogRoutes = require("./routes/blog-routes")
mongoose = require 'mongoose'
sockets = require "./routes/socket-routes"

app = module.exports = express()
app.configure ->
  app.set "views", __dirname + "/views"
  app.set "view engine", "jade"
  app.use express.bodyParser()
  app.use express.methodOverride()
  app.use app.router
  app.use express.static(__dirname + "/public")
  app.use require('connect-assets')()

app.configure "development", ->
  mongoose.connect 'mongodb://localhost/coffeepress-dev'
  app.use express.errorHandler(
    dumpExceptions: true
    showStack: true
  )


app.configure "production", ->
  mongoose.connect 'mongodb://localhost/coffeepress-prod'
  app.use express.errorHandler()

app.get "/", blogRoutes.page
app.get "/posts", blogRoutes.posts
app.post "/posts", blogRoutes.add
app.delete "/posts/:id", blogRoutes.remove


server = app.listen 3000, ->
  console.log "Express server listening on port %d in %s mode", 3000, app.settings.env

io = require('socket.io').listen(server)

io.sockets.on 'connection', sockets.events
