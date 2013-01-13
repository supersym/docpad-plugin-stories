#!/usr/bin/env coffee

###
sto·ry1   [stawr-ee, stohr-ee] , plural sto·ries, verb, sto·ried, sto·ry·ing. noun
5. a narration of an incident or a series of events or an example of these that is or may be narrated, as an anecdote, joke, etc.

The upstream original source code of this fork employed common technique where we
customize object properties through the use of prototypes, and decided to name:
- one of the properties to be named 'new' and;
- the name of the colorized field to be 'event'.

This was not such a briliant move, concidering the fact these are reserved keywords
in JavaScript. Also I had to do quite some work in the field of 'code quality'
but with help a few good hint/linters got rid of most the bad coding implements.



###

# Dependencies
log = require('./logger.coffee').config { level: 0 }

class Logger

  constructor : (@key, @value) ->


class Dictionary

  constructor : (@key, @value) ->


class Library extends Dictionary

  constructor : (@key, @value) ->

# Three native built-in types that I decided to expand
log.info 'hello world!'               # harmless notifies
log.warn 'carefule there, world!'     # danger possibly on the way
log.error 'WHOA WHOA WHOA world?!'    # too late now, you fecked up

# Notice these will be overidden lateron in this file, thus having two seperate
# styles for the same events and aftermath

# Custom events, no pain at all :)
log.create

  # Bio-hazard symbol for disinfection ~> debugging symbol :) couldnt find a insect hehe
  debug:
    level: 1
    story: "☣ debug"
    color: "cyan"

  # When using, say, fixjsstyle-like automated tools e.g. for fixing bad code
  repair:
    level: 2
    story: "⛑ repair"
    color: "crimson"

  # Symbolic links (?) but first of all, hyperlinks in the shell or HTML
  anchor:
    level: 2
    story: "⚓ link"
    color: "blue"

  # CoffeeScript compilation to JavaScript, if it takes long?
  compile:
    level: 1
    story: "☕ compile"
    color: "gray"

  # The (asynchronous) operation returned successfully or failed
  result:
    level: 0
    story: "✔ success" || "✖ failed"
    color: "green" || "red"

  # LiveReload heartbeat
  live:
    level: 2
    story: "❤ live"
    color: "hotpink"

  # Network connectivity statusses
  connect:
    level: 1
    story: "🌎 connect"
    color: "green"

  # Commit as in git commit or as in say code contracts?
  commit:
    level: 2
    story: "💍 commit"
    color: "gold"

  # Once you signed with this guy, you'll be in debt forever. Dependency hell candidates.
  depends:
    level: 1
    story: "👿 depends"
    color: "red"

  # Keywords as in packages, or perhaps tags as in meta-data tags, keywords?
  tagged:
    level: 1
    story: "📌 tagged"
    color: "brown"

  # Package related events and stories to tell that no one will believe anyway
  pack:
    level: 0
    story: "📦 package"

  # Code library related events and stories to tell about them
  lib:
    level: 0
    story: "📚 library"
    color: "white"

  # You need to authorize, or may have perhaps set some permissions or policy
  auth:
    level: 0
    story: "📛 authority"
    color: "salmon"

  # DocPad system centralized announcements over this status command line tool
  broadcast:
    level: 0
    story: "📡 broadcast"
    color: "cyan"

  # Synchronize between data devices and sources of any kind
  sync:
    level: 1
    story: "🔃 synchronize"

  # Used perhaps to note that a site/plugin/CSS is mobile friendly
  mobile:
    level: 2
    story: "📲 mobile"

  # Inspection of code, plugin integrity, statistics and such? JSLinters?
  inspect:
    level: 3
    story: "🔎 inspects"
    color: "white"

  lock:
    level: 0
    story: "🔓 unlock" || "🔒 lock"
    color: "gray"

  elite:
    level: 3
    story: "🔪 cuts code"
    color: "black"

  wait:
    level: 1
    story: "🕝 waits on"
    color: "white"

  launch:
    level: 0
    story: " 🚀 deploy "
    color: "pink"

  baby:
    level: 3
    story: "😭 cry"
    color: "pink"

  rb:
    level: 3
    story: "🚡 rail"
    color: "black"

  milestone:
    level: 0
    #signs: "🚩"
    story: "signs + milestone"
    #synon: "mark" || "landmark"
    color: "gold"

  copyright:
    level: 3
    story: "© copyright"
    color: "white"

  infinite:
    level: 0
    story: "∞ infite loop"
    color: "black"

  timer:
    level: 0
    story: "⌛ 123s"
    color: "grey"



# Use it here
log.debug "is this a bug?"

# Overwrite the default events
log.create

  info:
    level: 0
    story: " info ✎ "
    color: 'cyan'

  notify:
    story: '📢 notice'
    color: 'yellow'
    level: 1

  warn:
    story: '☢ warning'
    color: 'yellow'
    level: 2

  error:
    story: '☠ error'
    color: 'red'
    level: 3

# Try them out
log.info 'foo'
log.notify 'ba'
log.warn 'bar'
log.error 'a'




