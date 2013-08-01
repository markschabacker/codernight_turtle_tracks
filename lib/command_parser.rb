require 'command_forward'
require 'command_backward'

class CommandParser
  def parse(input)
    split_input = input.split(" ")
    [self.send(split_input.shift, split_input)]
  end

private
  def FD(args)
    CommandForward.new(args[0].to_i)
  end
  def BK(args)
    CommandBackward.new(args[0].to_i)
  end
end
