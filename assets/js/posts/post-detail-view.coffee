class @PostDetailView extends Backbone.View
  initialize: ->
    @template = _.template @$('#template').html()

  render: =>
    @$("#post-display").html @template(@model.toJSON())
    this

  show: (post)=>
    if @model?
      @model.off 'change', @render, this
    @model = post
    @model.on 'change', @render, this
    @render()






