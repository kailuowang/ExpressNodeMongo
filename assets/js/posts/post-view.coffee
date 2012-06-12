class @PostView extends Backbone.View

  events:
    "click .post-delete-btn": "clear"

  initialize: ->
    @model.bind 'change', @render, this
    @model.bind 'destroy', @remove, this
    @template = _.template $('#post-template').html()


  render: =>
    @el = $(@template(@model.toJSON()));
    @$el = $(@el)
    @delegateEvents()
    this

  clear: =>
    @model.destroy()



