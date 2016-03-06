require_relative 'direction'
require_relative 'position'

class Robot
  def initialize(table)
    @table = table
  end

  def place(position, direction)
    return unless valid?(position, direction)

    @position = position
    @direction = direction
  end

  def move
    return unless valid?

    @position = next_position if valid?(next_position)
  end

  def left
    @direction = @direction.left if valid?
  end

  def right
    @direction = @direction.right if valid?
  end

  def report
    "Robot is at position #{@position}; facing direction #{@direction}" if valid?
  end

  private

  def next_position
    @position.move(@direction)
  end

  def valid?(position=@position, dir=@direction)
    Direction.valid?(dir) && @table.valid_position?(position)
  end
end
