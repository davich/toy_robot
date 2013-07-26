module Directions
  class Direction
    @@LEFT = -1
    @@RIGHT = 1
    def initialize(name)
      @name = name
    end
    def self.for(name)
      DIRECTIONS.find { |d| d.name == name }
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
      new_index = (DIRECTIONS.index(self) + modifier) % DIRECTIONS.size
      DIRECTIONS[new_index]
    end
  end
  NORTH = Direction.new('NORTH')
  SOUTH = Direction.new('SOUTH')
  EAST = Direction.new('EAST')
  WEST = Direction.new('WEST')
  DIRECTIONS = [NORTH, EAST, SOUTH, WEST]
end