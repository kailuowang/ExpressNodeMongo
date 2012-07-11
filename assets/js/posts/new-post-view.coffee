class @NewPostView extends Backbone.View

  events:
    "click #publish": "create"
    "click #cancel": "quit"

  reset: =>
    @$("form")[0].reset()

  create: =>
    @blog.create(
      {
        title: @$('input#title').val()
        body: @$('textarea#body').val()
      },
      { wait: true }
    )
    @quit()

  initialize: =>
    @blog = @options.blog

  hide: =>
    @$el.hide()

  quit: =>
    @reset()
    router.navigate "/", trigger: true

  show: =>
    @$el.show()
