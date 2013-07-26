class Direction
  @@LEFT = -1
  @@RIGHT = 1

  def initialize(name)
    @name = name
  end

  def self.north
    @@NORTH ||= Direction.new('NORTH')
  end
  def self.south
    @@SOUTH ||= Direction.new('SOUTH')
  end
  def self.east
    @@EAST ||= Direction.new('EAST')
  end
  def self.west
    @@WEST ||= Direction.new('WEST')
  end
  def self.directions
    [north, east, south, west]
  end
  def self.for(name)
    directions.find { |d| d.name == name }
  end

  def left
    turn(@@LEFT)
  end
  def right
    turn(@@RIGHT)
  end
  def name
    @name
  end
  def to_s
    @name
  end

  private

  def turn(modifier)
    Direction.directions[new_index(modifier)]
  end
  def new_index(modifier)
    (Direction.directions.index(self) + modifier) % Direction.directions.size
  end
end