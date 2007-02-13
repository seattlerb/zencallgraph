ZenCallGraph
    by Eric Hodel <drbrain@segment7.net>
    http://seattlerb.rubyforge.org/ZenCallGraph

== DESCRIPTION:

Creates a dot graph for the call structure of a Ruby program.

== FEATURES/PROBLEMS:

* Include or exclude classes by name
* Group calls by class

== SYNOPSIS:

To dump a call graph to $stdout:

  require 'zen_call_graph'
  ZenCallGraph.run

To supply options to ZenCallGraph:

  require 'zen_call_graph'
  ZenCallGraph.run $stdout, :cluster => true, :include_classes => /Array/

== REQUIREMENTS:

* ruby 1.8.2 or newer
* ZenHacks
* Graphviz

== INSTALL:

  sudo gem install ZenCallGraph

== LICENSE:

(The MIT License)

Copyright (c) 2007 Eric Hodel

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
