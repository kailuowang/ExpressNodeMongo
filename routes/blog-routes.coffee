Post = require '../models/Post'

exports.setup = (app) ->
  app.get "/", (req, res) ->
    res.render "index",
      title: "My Test Blog"
      layout: false

  app.get "/posts", (req, res) ->
    Post.find {}, (err, posts) ->
      res.send posts

  app.post "/posts", (req, res) ->
    post = new Post(req.body)
    post.save ->
      res.send post

  app.delete "/posts/:id",  (req, res) ->
    Post.findById req.params.id, (err, post) ->
      post.remove ->
        res.send "ok"
