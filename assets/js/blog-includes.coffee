#= require posts/post-model
#= require routes
#= require_tree posts
$ ->
  window.blogView = new BlogView(el: $(".container"))
  Backbone.history.start()