require_relative '../../lib/command_parser'

describe "The Command Parser" do
  it "exists" do
    CommandParser.new.should_not be_nil
  end

  describe "Parsing commands" do
    let (:parser) { CommandParser.new }

    [{ :command => "FD 10", :distance => 10, :class => CommandForward },
     { :command => "BK 11", :distance => 11, :class => CommandBackward }]
    .each do |expectation|
      it "can parse a single #{expectation[:class]}" do
        command_list = parser.parse(expectation[:command])

        command_list.count.should == 1
        command_list[0].should be_a(expectation[:class])
        command_list[0].distance.should == expectation[:distance]
      end
    end

    it "can parse multiple commands" do
      input = "FD 10\nBK 11\nFD 42"

      command_list = parser.parse(input)

      command_list.count.should == 3
      command_list[0].should be_a(CommandForward)
      command_list[0].distance.should == 10
      command_list[1].should be_a(CommandBackward)
      command_list[1].distance.should == 11
      command_list[2].should be_a(CommandForward)
      command_list[2].distance.should == 42
    end
  end
end
