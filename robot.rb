require './lib/directions.rb'

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
    Directions::NORTH => Position.new(0, 1),
    Directions::SOUTH => Position.new(0, -1),
    Directions::EAST => Position.new(1, 0),
    Directions::WEST => Position.new(-1, 0)
  }

  def initialize(table)
    @table = table
  end

  def place(position, dir)
    if valid?(position, dir)
      @position = position
      @direction = dir
    end
  end

  def move
    if valid?
      new_position = @position + @@POSITION_MODIFIERS[@direction]
      @position = new_position if @table.valid_position?(new_position)
    end
  end

  def left
    @direction = Directions::left(@direction) if valid?
  end

  def right
    @direction = Directions::right(@direction) if valid?
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
    Directions::DIRECTIONS.include?(dir) && @table.valid_position?(position)
  end
end

