require 'celluloid'

class Counter
  include Celluloid

  attr_reader :count

  def initialize
    @count = 0
  end

  def increment
    @count += 1
  end
end

counter = Counter.new

# returns immediately
counter.increment!

puts counter.count

# returns immediately
future = counter.future :increment

puts future.value
