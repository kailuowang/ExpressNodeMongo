class WorkSpace extends Backbone.Router
  routes:
    "post/:id": "viewPost"

  initialize: =>
    @route(/^([^\/]*)$/, "routeChange");

  viewPost: (id) ->
    @routeChange('post')
    blogView.showPost(id)

  routeChange: (path)->
    path = 'post-list' if path is ''
    blogView.show(path)

@router = new WorkSpace
