Background
----------

This software is derived from the hard work done by [Felix MC](https://github.com/felixmc)
on [custom_logger](https://github.com/felixmc/custom-logger). Also credits to one of it's
dependency libraries [colors.js](https://github.com/Marak/colors.js). After those elements
where to my satisfaction elegantly in place, I decided to take it from there and mold them
into a asynchronous event tracer with standardized, structured user feedback over the console.

The name was chosen/born out of necessity due to the original work being written in JavaScript,
and after a few runs found the use of a variable name 'event' to be conflicting with the reserved
keyword event (as in the native events that get emitted). So I decided to change
it and my fetish required it to be the same about of characters as 'color' and 'level', hence
'story' which kinda suits it well...

Often Node.js has been described as a King in a land full of (messenger) servants, all which
collectively start executing many tasks (asynchronously) in favour of their king who but only,
asks of them upon return, to form a nice queue and one by one deliver their messages to him.

The dictionary defines a story as

    "a narration of an incident or a series of events or an example of these
    that is or may be narrated, as an anecdote, joke, etc."

This makes our storyteller perhaps a bit lame though, because at the very first instance he already
returned back home in the hopes of getting all the juicy details later (promises). Our storyteller
was never there to begin with, as asynchronous callbacks actually just return immediately
under the promise of receiving feedback later. Often this might be all we need, but just as often
what we would have liked, was for it to just stay put and recieve everything first hand experience.
Essentially what is known as a deferred method. Since the DoJo framework has it's API developed around
this sole concept (in order to better facilitate AJAX designs) and as such provides some nice write-ups
on the subject:

- http://dojotoolkit.org/documentation/tutorials/1.6/deferreds/
- http://dojotoolkit.org/documentation/tutorials/1.6/promises/

One method which is deployed succesfully in this working environment, is that of what is called
deferred lists. This enables one to listen out on multiple, parallel running instances of asynchronous
code and receive feedback from those when finished, allowing to better keep track of them all and combine
the data generated. To get a working example of this concept, look up the result of such a object at:
http://dojotoolkit.org/documentation/tutorials/1.6/deferreds/demo/deferredlist.html

Now why is this relevant for DocPad? It is my firm belief that, while already in the processing of ironing out
plugin abstractions, and some of the (communicated by balupton) goals which were stated, to feel a shift moving
towards a (online) API of RESTless nature. Also I have a good estimate that the next major work on the DocPad code
base will only even furthermore employ strickly only asynchronous operations (if not already) while a lot will be
shapen more and more towards true OOP design principles.

This storytelling analogy, while in it's current form not posing us with too many problems, holds some future 'promises'
of trouble. Bad weather ahead. The OOP like nature of the DocPad architecture, evolves around the idea that we abstract
physical realities to code







Rationale
---------
