require './lib/direction.rb'
require './lib/position.rb'

class Robot
  @@POSITION_MODIFIERS = {
    Direction::NORTH => Position.new(0, 1),
    Direction::SOUTH => Position.new(0, -1),
    Direction::EAST => Position.new(1, 0),
    Direction::WEST => Position.new(-1, 0)
  }

  def initialize(table)
    @table = table
  end

  def place(position, dir)
    direction = Direction.for(dir)
    if valid?(position, direction)
      @position = position
      @direction = direction
    end
  end

  def move
    if valid?
      new_position = @position + @@POSITION_MODIFIERS[@direction]
      @position = new_position if @table.valid_position?(new_position)
    end
  end

  def left
    @direction = @direction.left if valid?
  end

  def right
    @direction = @direction.right if valid?
  end

  def report
    if valid?
      "Robot is at position #{@position}; facing direction #{@direction}"
    else
      "Robot state is invalid. Position #{@position}, direction #{@direction}"
    end
  end

  private

  def valid?(position=@position, dir=@direction)
    Direction::DIRECTIONS.include?(dir) && @table.valid_position?(position)
  end
end

