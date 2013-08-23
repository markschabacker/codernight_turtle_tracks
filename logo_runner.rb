#!/usr/bin/env ruby

require 'optparse'
require 'stringio'

require_relative 'lib/canvas_renderer'
require_relative 'lib/command_parser'
require_relative 'lib/turtle'

class LOGORunner
  def evaluate(input)
    parse_input(input)
    turtle = initialize_turtle(canvas_size)
    turtle.perform_commands(logo_commands)
    CanvasRenderer.new.render(canvas_size, turtle.visited_points)
  end

private
  attr_reader :canvas_size, :logo_commands

  def parse_input(input)
    input_io = StringIO.new(input)
    @canvas_size = input_io.gets.chomp.to_i
    @logo_commands = CommandParser.new.parse(input_io.read)
  end

  def initialize_turtle(canvas_size)
    canvas_center = canvas_size / 2
    Turtle.new(OpenStruct.new(:x => canvas_center, :y => canvas_center))
  end
end

if __FILE__==$0
  optparse = OptionParser.new do |opts|
    opts.banner = "Usage #{$0} source.logo"
  end

  if ARGV.empty?
    puts optparse
  else
    input_string = File.open(ARGV[0]).read
    puts LOGORunner.new.evaluate(input_string)
  end
end
