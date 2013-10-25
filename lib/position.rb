class Position
  attr_accessor :x, :y
  def initialize(x, y)
    self.x = x
    self.y = y
  end
  def +(position)
    Position.new(x+position.x, y+position.y)
  end
  def to_s
    "(#{x}, #{y})"
  end
  def ==(other)
    self.x == other.x && self.y == other.y
  end
end