require_relative '../../lib/command_left'
describe "The Left Command" do
  let (:angle_change) { :angle_change }

  subject { CommandLeft.new(angle_change) }

  it { should respond_to :angle_change }

  it "can be instantated with an angle_change" do
    CommandLeft.new(angle_change).angle_change.should == angle_change
  end

  it "defaults to angle_change 0" do
    CommandLeft.new(nil).angle_change.should == 0
  end
end
