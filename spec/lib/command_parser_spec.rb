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
  end
end
