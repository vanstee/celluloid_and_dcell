class Counter
  attr_reader :count

  def initialize
    @count = 0
  end

  def increment
    @count += 1
  end
end

counter = Counter.new

threads = Array.new(10) do
  Thread.new do
    1000.times { counter.increment }
  end
end

threads.each(&:join)

puts counter.count
