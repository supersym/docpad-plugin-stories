burrito = require("burrito")
src = burrito("f() && g(h())\nfoo()", (node) ->
  node.wrap "qqq(%s)"  if node.name is "call"
)
console.log src
