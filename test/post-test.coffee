mongoose = require 'mongoose'
should = require 'should'
Post   = require '../models/Post'

describe 'Post', ->

  before (done) ->
    mongoose.connect 'mongodb://localhost/coffeepress', ->
      Post.remove done

  it 'should create a new post', (done) ->
    post = new Post(title:'First!', body:'First post bastiches!')
    post.save ->
      Post.findById post._id, (err, retrievedPost) ->
        retrievedPost.title.should.eql "First!"
        retrievedPost.body.should.eql "First post bastiches!"
        done()

  it 'should remove a post', (done) ->
    post = new Post(title:'First!', body:'First post bastiches!')
    post.save ->
      Post.findById post._id, (err, post) ->
        post.remove ->
          Post.findById post._id, (err, notFound) ->
            should.not.exist(notFound)
            done()