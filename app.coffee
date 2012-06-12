express = require("express")
posts = require("./routes/posts")
blogRoutes = require("./routes/blog-routes")
mongoose = require 'mongoose'
app = module.exports = express.createServer()
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

app.get "/", posts.index
app.get "/posts", blogRoutes.posts
app.get "/post/new", posts.new
app.post "/post/new", posts.add
app.get "/post/:id/del", posts.delete
app.get "/post/:id", posts.view

app.listen 3000, ->
  console.log "Express server listening on port %d in %s mode", app.address().port, app.settings.env