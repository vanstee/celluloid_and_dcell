require 'celluloid'

class Counter
  include Celluloid

  def increment(count, actor)
    return count if count >= 10000
    actor.increment(count + 1, Actor.current)
  end
end

counters = [Counter.new, Counter.new]

puts counters.first.increment(0, counters.last)
