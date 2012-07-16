
class @BlogView extends Backbone.View

  initialize: ->
    @blog = new Blog
    @blog.on('reset', @addAll);
    @blog.on('add', @add);
    @blog.fetch()
    @newPostView = new NewPostView(el: $('#new-post.section'), blog: @blog)
    @postDetailView = new PostDetailView(el: $('#post.section'));

  show: (path)=>
    $('.section').hide()
    $('.section#' + path).show()

    socket = io.connect("http://localhost:3000")
    socket.on "news", (data) ->
      console.log data
      socket.emit "my other event",
        my: "data"


  showPost: (id)=>
    @postDetailView.show(@blog.get(id))

  addAll: =>
    @blog.each @add

  add: (post) =>
    postView = new PostView(model: post)
    @$('#posts').append(postView.render().el)
