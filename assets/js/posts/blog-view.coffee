
class @BlogView extends Backbone.View
  events:
    "click #new-post": "showNewPost"

  initialize: ->
    @blog = new Blog
    @blog.bind('reset', @addAll);
    @blog.fetch()

  showNewPost: ->
    $("#new-post-form").show()

  addAll: =>
    @blog.each @add

  add: (post) =>
    postView = new PostView(model: post)
    @$('#posts').append(postView.render().el)
