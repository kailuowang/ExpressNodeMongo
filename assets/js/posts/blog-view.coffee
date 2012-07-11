
class @BlogView extends Backbone.View

  initialize: ->
    @blog = new Blog
    @blog.on('reset', @addAll);
    @blog.on('add', @add);
    @blog.fetch()
    @newPostView = new NewPostView(el: $('#new-post-form'), blog: @blog)
    @postDetailView = new PostDetailView(el: $('#post'));
  showNewPost: =>
    @newPostView.show()

  show: =>
    @newPostView.hide()
    $('#post-list').show()
    @postDetailView.hide()

  showPost: (id)=>
    post = @blog.get id
    @postDetailView.show(post)
    @newPostView.hide()
    $('#post-list').hide()

  addAll: =>
    @blog.each @add

  add: (post) =>
    postView = new PostView(model: post)
    @$('#posts').append(postView.render().el)
