require 'rubygems'
require 'eventhook'

class ZenCallGraph < EventHook

  VERSION = '1.0.0'

  @calls = nil
  @stack = nil
  @started = false
  @klasses = Hash.new { |h,klass| h[klass] = {} }

  def self.run(fp = $stdout, opts = {})
    at_exit {
      ZenCallGraph.print_graph fp, opts
    }
    ZenCallGraph.start_hook
  end

  def self.restart
    @calls = Hash.new { |h, call| h[call] = 0 }
    @stack = [" toplevel "]
    @started = true
  end

  def self.start_hook
    restart unless @started
    super
  end

  def self.print_graph(f, opts)
    opts = {
      :cluster => false,
      :include_classes => //,
      :exclude_classes => /ZenCallGraph|EventHook/,
    }.merge opts

    stop_hook

    f.puts "digraph call_graph {"
    f.puts "\tlabeljust = l"
    @calls.each do |(caller, callee), count|
      next unless callee =~ opts[:include_classes]
      next unless caller =~ opts[:include_classes]
      next if callee =~ opts[:exclude_classes]
      next if caller =~ opts[:exclude_classes]
      f.puts "\t\"#{caller}\" -> \"#{callee}\" [label=\"#{count}\"]"
    end

    if opts[:cluster] then
      @klasses.each do |klass, methods|
        next unless klass.to_s =~ opts[:include_classes]
        next if klass.to_s =~ opts[:exclude_classes]
        f.puts "\tsubgraph \"cluster_#{klass}\" {"
        f.puts "\t\tlabel = \"#{klass}\""
        methods.each do |method,|
          next if method =~ /each|map/
          f.puts "\t\t#{method.inspect}"
        end
        f.puts "\t}"
      end
    end

    f.puts "}"
  end

  def self.process(*args)
    event_id, object, method, klass = args

    calltype = Module === object ? '::' : '#'
    name = "#{klass}#{calltype}#{method}"

    case EVENTS[event_id]
    when :call, :ccall then
      @klasses[klass][name] = true
      name += "\\n(#{@stack.last})" if name =~ /each|map/
      @calls[[@stack.last, name]] += 1
      @stack.push name
    when :return, :creturn then
      @stack.pop unless @stack.size == 1
    end
  end

end

