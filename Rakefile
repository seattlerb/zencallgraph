# -*- ruby -*-

require 'rubygems'
require 'hoe'
require './lib/zen_call_graph.rb'

Hoe.new('ZenCallGraph', ZenCallGraph::VERSION) do |p|
  p.rubyforge_name = 'seattlerb'
  p.summary = 'Makes dot call graphs'
  p.description = p.paragraphs_of('README.txt', 2..5).join("\n\n")
  p.url = p.paragraphs_of('README.txt', 0).first.split(/\n/)[1..-1]
  p.changes = p.paragraphs_of('History.txt', 0..1).join("\n\n")
  p.author = 'Eric Hodel'

  p.extra_deps << 'ZenHacks'
end

# vim: syntax=Ruby
