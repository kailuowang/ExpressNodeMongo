exports.registerEvents = (socket) ->
  global.broadcaster.on "posts-count-changed", (count) ->
    socket.emit "posts-count-changed", count
