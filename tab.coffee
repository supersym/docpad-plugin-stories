#!/usr/bin/env coffee

mod_tab = require "./node_modules/tab/lib/tab.js"

mod_tab.emitTable
  columns: [
    label: "PID"
    align: "right"
    width: 16
  ,
    label: "TTY"
    width: 7
  ,
    label: "TIME"
    align: "right"
    width: 40
  ,
    label: "CMD"
  ]
  rows: [["60881", "ttys000", "0:00.19", "-bash"], ["61674", "ttys000", "0:00.17", "vim README.md"]]

