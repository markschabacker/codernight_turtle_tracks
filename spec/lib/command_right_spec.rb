require_relative '../../lib/command_right'
describe "The Right Command" do
  let (:angle_change) { :angle_change }

  subject { CommandRight.new(angle_change) }

  it { should respond_to :angle_change }

  it "can be instantated with an angle_change" do
    CommandRight.new(angle_change).angle_change.should == angle_change
  end

  it "defaults to angle_change 0" do
    CommandRight.new(nil).angle_change.should == 0
  end
end
