"use strict";
var dateFormat = require('dateformat'),
  colors = require('colors');

var events = { };

var options = {
  level: 0,
  format: '%timestamp% - %story%:%padding%  %message%',
  timestamp: 'HH:MM:ss'
};

function log_event(options) {
  this.story = options.story;
  this.level = options.level || 0;
  this.color = options.color || 'green';
}

log_event.prototype.config = function(config) {
  for (var key in config) {
    this[key] = config[key];
  }
  return this;
};

log_event.prototype.__defineGetter__('padding', function() {
  var length = 0,
    padding = '';
  for (var key in events) {
    if (events.hasOwnProperty(key)) {
      length = length < events[key].event.length ? events[key].event.length : length;
    }
  }
  for (var i = 0; i < length - this.event.length; i++) { padding += ' '; }
  return padding;
});

log_event.prototype.output = function(input) {
  if (options.level <= this.level) {
    var message = '';
    for (var i in input) {
      message += ' ' + (typeof input[i] === 'object' ? JSON.stringify(input[i], null) : input[i]);
    }
    var format = this.format || options.format;
      output = format
          .replace('%timestamp%', dateFormat(new Date(), this.timestamp || options.timestamp)) //timestamp
          .replace('%story%', this.event[this.color]) //log story & color
          .replace('%padding%', this.padding)
          .replace('%message%', message);
    console.log(output);
  }
};

exports.config = function(config) {
  for (var key in config) {
    if (options.hasOwnProperty(key)) {
      options[key] = config[key];
    }
  }
  return this;
};

var nFn = function(e) {
  return function() { if (arguments.length === 0) { return events[e]; } else { events[e].output(arguments); } };
};

exports.create = function(newEvents) {
  for (story in newEvents) {
    events[story] = new log_event(newEvents[story]);
    this[story] = nFn(story);
  }
  return this;
};

exports.create({
  info: { color: 'green', level: 0, story: 'info' },
  warn: { color: 'yellow', level: 1, story: 'warning' },
  error: { color: 'red', level: 2, story: 'error' }
});
