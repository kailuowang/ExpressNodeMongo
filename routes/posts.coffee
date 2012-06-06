posts = []

exports.index = (req, res) ->
  res.render "index",
    title: "My Test Blog"
    posts: posts

exports.new = (req, res) ->
  res.render "add_post",
    title: "Write New Post"


exports.add = (req, res) ->
  post = req.body.post
  post.id = posts.length
  posts.push post
  res.redirect "/"

exports.view = (req, res) ->
    post = posts[req.params.id]
    res.render 'post', post: post, title: post.title