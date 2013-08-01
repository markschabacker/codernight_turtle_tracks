class CommandRight
  attr_accessor :angle_change

  def initialize(angle_change)
    self.angle_change = angle_change || 0
  end
end
