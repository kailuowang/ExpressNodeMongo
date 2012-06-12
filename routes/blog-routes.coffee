Post = require '../models/Post'

exports.posts = (req, res) ->
  Post.find {}, (err, posts) ->
    res.send posts
