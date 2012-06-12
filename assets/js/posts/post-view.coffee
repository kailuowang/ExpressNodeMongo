
class @PostView extends Backbone.View

  tagName: 'li'

  initialize: ->
    @model.bind 'change', @render, this
    @model.bind 'destroy', @remove, this
    @template = _.template $('#post-template').html()


  render: ->
    @$el.html(@template(@model.toJSON()));
    this

