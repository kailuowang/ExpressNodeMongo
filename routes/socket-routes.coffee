exports.events = (socket) ->
  socket.emit "news",
    hello: "world"

  socket.on "my other event", (data) ->
    console.log data
