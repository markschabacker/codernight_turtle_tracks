require_relative '../../lib/command_forward'
describe "The Forward Command" do
  let (:distance) { :distance }

  subject { CommandForward.new(distance) }

  it { should respond_to :distance }

  it "can be instantated with a distance" do
    CommandForward.new(distance).distance.should == distance
  end

  it "defaults to distance 0" do
    CommandForward.new(nil).distance.should == 0
  end
end
