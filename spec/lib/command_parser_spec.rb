require_relative '../../lib/command_parser'

describe "The Command Parser" do
  it "exists" do
    CommandParser.new.should_not be_nil
  end

  describe "Parsing commands" do
    let (:parser) { CommandParser.new }

    it "can parse a single forward command" do
      units = 10
      input = "FD #{units}"

      command_list = parser.parse(input)

      command_list.count.should == 1
      command_list[0].should be_a(CommandForward)
      command_list[0].distance.should == units
    end

    it "can parse a single backward command" do
      units = 10
      input = "BK #{units}"

      command_list = parser.parse(input)

      command_list.count.should == 1
      command_list[0].should be_a(CommandBackward)
      command_list[0].distance.should == units
    end

  end
end
