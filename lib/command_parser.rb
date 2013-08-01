require 'command_forward'
require 'command_backward'

class CommandParser
  def parse(input)
    tokens = input.split(" ")
    result = []
    parse_rec(tokens, result)
    result.flatten
  end

private
  def parse_rec(tokens, result)
    unless tokens.nil? || tokens.count <= 0
      this_result, remaining_args = self.send(tokens[0], tokens[1..-1])
      result << this_result

      parse_rec(remaining_args, result)
    end
  end

  def FD(args)
    [CommandForward.new(args[0].to_i), args[1..-1]]
  end
  def BK(args)
    [CommandBackward.new(args[0].to_i), args[1..-1]]
  end

  def REPEAT(args)
    # TODO: this won't work w/ recursive REPEATs
    bracket_start = 2
    bracket_end = args.index("]")

    repeated_command = args[bracket_start...bracket_end].join(" ")
    commands = args[0].to_i.times.map do
      parse(repeated_command)
    end

    remaining_args = args[(bracket_end + 1)..-1]
    [commands, remaining_args]
  end
end
