
class @BlogView extends Backbone.View
  events:
    "click #new-post": "showNewPost"

  initialize: ->
    @blog = new Blog
    @blog.on('reset', @addAll);
    @blog.on('add', @add);
    @blog.fetch()
    @newPostView = new NewPostView(el: $('#new-post-form'), blog: @blog)

  showNewPost: ->
    $("#new-post-form").show()

  addAll: =>
    @blog.each @add

  add: (post) =>
    postView = new PostView(model: post)
    @$('#posts').append(postView.render().el)
