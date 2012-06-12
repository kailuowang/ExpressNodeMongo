#= require posts/post-model
#= require_tree posts
$ ->
  window.blogView = new BlogView(el: $(".container"))
