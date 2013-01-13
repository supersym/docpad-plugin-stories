#!/usr/bin/env coffee

msg ="hello world"
console.log msg
console.log typeof msg

log = (args...) ->
  console
    .log "#{args.length}"
    .log "#{args}"
    .log typeof args


log 'a'
log "b"



