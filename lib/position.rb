class Position
  def initialize(x, y)
    self.x = x
    self.y = y
  end

  def move(direction)
    self + POSITION_MODIFIERS[direction]
  end

  def between?(x_range, y_range)
    x_range.cover?(x) && y_range.cover?(y)
  end

  def to_s
    "(#{x}, #{y})"
  end

  def ==(other)
    x == other.x && y == other.y
  end

  def eql?(other)
   self == other
  end

  def hash
    [x, y].hash
  end

  protected
  attr_accessor :x, :y

  def +(position)
    Position.new(x + position.x, y + position.y)
  end

  POSITION_MODIFIERS = {
    Direction::NORTH => Position.new(0, 1),
    Direction::SOUTH => Position.new(0, -1),
    Direction::EAST => Position.new(1, 0),
    Direction::WEST => Position.new(-1, 0)
  }
end
