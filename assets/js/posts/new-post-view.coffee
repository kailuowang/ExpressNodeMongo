class @NewPostView extends Backbone.View

  events:
    "click #publish": "create"
    "click #cancel": "hide"

  create: =>
    @blog.create
      title: @$('input#title').val()
      body: @$('textarea#body').val()
    @hide()

  initialize: =>
    @blog = @options.blog

  hide: =>
    @$el.hide()