class WorkSpace extends Backbone.Router
  routes:
    "post/:id": "viewPost"
    "new-post": "newPost"
    "":  "showBlog"

  viewPost: (id) ->
    blogView.showPost(id)

  newPost: ->
    blogView.showNewPost()

  showBlog: ->
    blogView.show()

@router = new WorkSpace
