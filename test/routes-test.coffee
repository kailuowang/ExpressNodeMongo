posts = require "../routes/posts"
require "should"

describe "posts", ->
  req = {}
  res = {}
  describe "index", ->
    it "should display index with posts", ->

      res.render = (view, vars) ->
        view.should.equal "index"
        vars.title.should.equal "My Test Blog"
        vars.posts.should.eql []
      posts.index(req, res)

  describe "new post", ->
    it "should display the add post page", (done) ->
      res.render = (view, vars) ->
        view.should.equal "add_post"
        vars.title.should.equal "Write New Post"
        done()
      posts.new(req, res)