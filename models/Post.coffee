mongoose = require 'mongoose'

PostSchema = new mongoose.Schema(
  title: String
  body: String
)
Post = mongoose.model 'Post', PostSchema

broadCastCount = (count) ->
  global.broadcaster.emit "posts-count-changed", count

PostSchema.pre 'save',  (next) ->
  Post.count {}, (err, count) ->
    broadCastCount(count + 1)
    next()

PostSchema.pre 'remove',  (next) ->
  Post.count {}, (err, count) ->
    broadCastCount(count - 1)
    next()

module.exports = Post