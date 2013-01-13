#!/usr/bin/env coffee

# Dependencies
log = require('./logger.coffee').config { level: 0 }

# Three built-in stories to tell
log.info 'hello world!'               # harmless notifies
log.warn 'carefule there, world!'     # danger possibly on the way
log.error 'WHOA WHOA WHOA world?!'    # too late now, you fecked up

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
    story: "🔎 inspect"
    color: "white"

  lock:
    level: 0
    story: "🔓 unlock" || "🔒 lock"
    color: "gray"

  cut:
    level: 3
    story: "🔪 codecut"
    color: "black"

  wait:
    level: 1
    story: "🕝 waits"
    color: "white"

  launch:
    level: 0
    story: "🚀 deploy"
    color: "gray"




# Use it here
log.debug "is this a bug?"

# Overwrite the default events
log.create

  info:
    level: 0
    story: '✎ info'
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
log.wait 'online connection established'



