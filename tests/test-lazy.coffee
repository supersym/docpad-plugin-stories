Lazy = require("lazy")
lazy = new Lazy
lazy.filter((item) ->
  item % 2 is 0
).take(5).map((item) ->
  item * 2
).join (xs) ->
  console.log xs

start = Date.now()
setTimeout (cb = ->
  console.log Date.now() - start
), 1500
[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10].forEach (x) ->
  lazy.emit "data", x

lazy.emit "end"
