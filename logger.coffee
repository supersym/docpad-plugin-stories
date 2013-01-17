
###
No top level type defined yet
###


###
Prototype
###
log_event = (options) ->

  # it has 3 local members, all being set by the options parameter value
  @story = options.story or ""
  @level = options.level or 0
  @color = options.color or "white"
  @signs = options.signs or ""

# Dependencies
dateFormat    = require("dateformat")
colors        = require("colors")
events        = {}

options =
  level: 0
  format: "%timestamp% - %story%:%padding%  %message%"
  timestamp: "HH:MM:ss"

# Double-colon :: is shorthand for saying `.prototype`
log_event::config = (config) ->
  for key of config
    # The “at” sign @ is shorthand for saying `this`
    @[key] = config[key]
  @


# Same prototype but now defines the getter properties
log_event::__defineGetter__ "padding", ->
  length = 0
  padding = ""
  for key of events
    length = (if length < events[key].story.length then events[key].story.length else length)  if events.hasOwnProperty(key)
  i = 0

  while i < length - @story.length
    padding += " "
    i++
  padding


# Render a story for this event
log_event::output = (input) ->

  # Not generate a message if silenced
  if options.level <= @level
    message = ""
    for i of input
      message += " " + ((if typeof input[i] is "object" then JSON.stringify(input[i], null) else input[i]))
    format = @format or options.format
    output = format.replace("%timestamp%", dateFormat(new Date(), @timestamp or options.timestamp)).replace("%story%", @story[@color]).replace("%padding%", @padding).replace("%message%", message)
    console.log output

exports.config = (config) ->
  for key of config
    options[key] = config[key]  if options.hasOwnProperty(key)
  @

nFn = (e) ->
  ->
    if arguments.length is 0
      events[e]
    else
      events[e].output arguments

exports.create = (newEvents) ->
  for story of newEvents
    events[story] = new log_event(newEvents[story])
    this[story] = nFn(story)
  this

exports.create
  info:
    color: "green"
    level: 0
    story: "info"

  warn:
    color: "yellow"
    level: 1
    story: "warning"

  error:
    color: "red"
    level: 2
    story: "error"

