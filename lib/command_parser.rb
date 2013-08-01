require 'command_forward'
require 'command_backward'

class CommandParser
  def parse(input)
    tokens = input.split(" ")
    result = parse_rec(tokens, [])
    result.flatten
  end

private
  def parse_rec(tokens, current_result)
    if tokens.nil? || tokens.count <= 0
      return current_result
    end

    this_result, remaining_args = self.send(tokens[0], tokens[1..-1])
    parse_rec(remaining_args, current_result + [ this_result ])
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
