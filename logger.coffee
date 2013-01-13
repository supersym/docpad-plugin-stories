
log_event = (options) ->
  @story = options.story
  @level = options.level or 0
  @color = options.color or "green"

#"use strict"
dateFormat = require("dateformat")
colors = require("colors")
events = {}
options =
  level: 0
  format: "%timestamp% - %story%:%padding%  %message%"
  timestamp: "HH:MM:ss"

log_event::config = (config) ->
  for key of config
    @[key] = config[key]
  @

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

log_event::output = (input) ->
  if options.level <= @level
    message = ""
    for i of input
      message += " " + ((if typeof input[i] is "object" then JSON.stringify(input[i], null) else input[i]))
    format = @format or options.format
    #timestamp
    #log story & color
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

