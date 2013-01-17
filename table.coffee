#!/usr/bin/env coffee

Table = require("cli-table")

table = new Table(head: ["", "Date/time", "Origin", "Event message"])
table.push

  10283844: ["Notice",  "Core: Models", "This is a string formatted by its emitter based upon some execution context/event"]

  98357535: ["Warning", "Plugin: Jade", "Another system message intended to communicate larger bodies of text such as error messages"]

console.log table.toString()
