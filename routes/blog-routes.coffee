Post = require '../models/Post'

exports.posts = (req, res) ->
  Post.find {}, (err, posts) ->
    res.send posts

exports.add = (req, res) ->
  post = new Post(req.body)
  post.save ->
    res.send post

exports.remove = (req, res) ->
  Post.findById req.params.id, (err, post) ->
    post.remove ->
      res.send "ok"


exports.page = (req, res) ->
  res.render "index",
    title: "My Test Blog"
    layout: false