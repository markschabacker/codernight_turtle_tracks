require_relative '../../lib/command_backward'
describe "The Backward Command" do
  let (:distance) { :distance }

  subject { CommandBackward.new(distance) }

  it { should respond_to :distance }

  it "can be instantated with a distance" do
    CommandBackward.new(distance).distance.should == distance
  end

  it "defaults to distance 0" do
    CommandBackward.new(nil).distance.should == 0
  end
end
