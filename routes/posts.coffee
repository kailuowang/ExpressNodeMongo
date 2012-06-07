Post = require '../models/Post'

exports.index = (req, res) ->
  Post.find {}, (err, posts) ->
    res.render "index",
      title: "My Test Blog"
      posts: posts

exports.new = (req, res) ->
  res.render "add_post",
    title: "Write New Post"

exports.add = (req, res) ->
  new Post(req.body.post).save ->
    res.redirect "/"

exports.view = (req, res) ->
  Post.findById req.params.id, (err, post) ->
    res.render 'post', post: post, title: post.title