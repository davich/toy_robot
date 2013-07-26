module Directions
  LEFT = -1
  RIGHT = 1
  NORTH = 'NORTH'
  SOUTH = 'SOUTH'
  EAST = 'EAST'
  WEST = 'WEST'
  DIRECTIONS = [NORTH, EAST, SOUTH, WEST]

  def self.left(current_direction)
    turn(LEFT, current_direction)
  end

  def self.right(current_direction)
    turn(RIGHT, current_direction)
  end

  private

  def self.turn(modifier, current_direction)
    new_index = (DIRECTIONS.index(current_direction) + modifier) % DIRECTIONS.size
    DIRECTIONS[new_index]
  end
end