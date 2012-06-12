class window.PostView extends Backbone.View

  tagName: 'li'
  template: _.template $('#template').html()

  constructor: ->
    this.model.bind 'change', this.render, this
    this.model.bind 'destroy', this.remove, this
