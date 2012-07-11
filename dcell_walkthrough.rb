require 'dcell'

DCell.start(id: 'atlrug', addr: 'tcp://0.0.0.0:7777')

# Other nodes can connect with:
#
# DCell.start(
#   id: "atlrug_#{name}",
#   directory: {
#     id: 'atlrug',
#     addr: "#{IPSocket.getaddress(Socket.gethostname)}"
#   }
# )

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

Counter.supervise_as :counter

# Other nodes can access the counter actor:
#
# node = DCell::Node['atlrug']
# puts node[:counter].increment

require 'dcell/explorer'

DCell::Explorer.supervise('0.0.0.0', 8000)

# View at http://#{IPSocket.getaddress(Socket.gethostname)}:8000/
