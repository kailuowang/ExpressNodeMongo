
class @BlogView extends Backbone.View

  initialize: ->
    @blog = new Blog
    @blog.on('reset', @addAll);
    @blog.on('add', @add);
    @blog.fetch()

    @newPostView = new NewPostView(el: $('#new-post.section'), blog: @blog)
    @postDetailView = new PostDetailView(el: $('#post.section'));
    @registerSocket()

  show: (path)=>
    $('.section').hide()
    $('.section#' + path).show()


  registerSocket: =>
    socket = io.connect("http://localhost:3000")
    socket.on "posts-count-changed", @setCount

  setCount: (count) =>
    $('#count').text(count)


  showPost: (id)=>
    @postDetailView.show(@blog.get(id))

  addAll: =>
    @blog.each @add
    @setCount(@blog.length)

  add: (post) =>
    postView = new PostView(model: post)
    @$('#posts').append(postView.render().el)
