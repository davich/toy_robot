require './lib/direction.rb'

Position = Struct.new(:x, :y) do
  def +(position)
    Position.new(x+position.x, y+position.y)
  end
  def to_s
    "#{x}, #{y}"
  end
end

class Robot
  @@POSITION_MODIFIERS = {
    Direction.north => Position.new(0, 1),
    Direction.south => Position.new(0, -1),
    Direction.east => Position.new(1, 0),
    Direction.west => Position.new(-1, 0)
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
    Direction.directions.include?(dir) && @table.valid_position?(position)
  end
end

