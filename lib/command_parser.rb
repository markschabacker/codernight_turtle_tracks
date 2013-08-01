require 'command_forward'
require 'command_backward'

class CommandParser
  def parse(input)
    input.split("\n").inject([]) do |results, line|
      line_command = line.split(" ")
      results << self.send(line_command.shift, line_command)
    end
  end

private
  def FD(args)
    CommandForward.new(args[0].to_i)
  end
  def BK(args)
    CommandBackward.new(args[0].to_i)
  end
end
