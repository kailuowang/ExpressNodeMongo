class @PostView extends Backbone.View

  tagName: 'li'

  events:
    "click .post-delete-btn": "clear"

  initialize: ->
    @model.on 'change', @render, this
    @model.on 'destroy', @remove, this
    @template = _.template $('#post-template').html()

  render: =>
    @$el.html @template(@model.toJSON())
    @delegateEvents()
    this

  clear: =>
    @model.destroy()




