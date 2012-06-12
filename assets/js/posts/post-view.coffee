$ ->
  _.templateSettings = interpolate: /\{\{(.+?)\}\}/g

  $('#template').html _.template($('#template').html(), name: "lala")