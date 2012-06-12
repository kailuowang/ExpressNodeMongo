Post = require '../models/Post'

exports.index = (req, res) ->
  res.render "index",
    title: "My Test Blog"
    layout: false

exports.new = (req, res) ->
  res.render "add_post",
    title: "Write New Post"

exports.add = (req, res) ->
  new Post(req.body.post).save ->
    res.redirect "/"

exports.delete = (req, res) ->
  Post.findById req.params.id, (err, post) ->
    post.remove ->
      res.redirect "/"

exports.view = (req, res) ->
  Post.findById req.params.id, (err, post) ->
    res.render 'post', post: post, title: post.title