@loadScript = (url, callback) ->
  script = document.createElement("script")
  script.type = "text/javascript"
  if script.readyState
    script.onreadystatechange = ->
      if script.readyState is "loaded" or script.readyState is "complete"
        script.onreadystatechange = null
        callback?()
  else
    script.onload = ->
      callback?()
  script.src = url
  document.getElementsByTagName("head")[0].appendChild script