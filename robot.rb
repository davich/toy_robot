require './lib/directions.rb'
class Robot
  @@POSITION_MODIFIERS = {
    Directions::NORTH => [0, 1],
    Directions::SOUTH => [0, -1],
    Directions::EAST => [1, 0],
    Directions::WEST => [-1, 0]
  }

  def initialize(table)
    @table = table
  end

  def place(pos_x, pos_y, dir)
    if valid?(pos_x, pos_y, dir)
      @position_x = pos_x
      @position_y = pos_y
      @direction = dir
    end
  end

  def move
    return unless valid?

    x_modifier, y_modifier = @@POSITION_MODIFIERS[@direction]

    if @table.valid_position?(@position_x + x_modifier, @position_y + y_modifier)
      @position_x += x_modifier
      @position_y += y_modifier
    end

    [@position_x, @position_y]
  end

  def left
    @direction = Directions::left(@direction) if valid?
  end

  def right
    @direction = Directions::right(@direction) if valid?
  end

  def report
    if valid?
      "Robot is at position #{@position_x}, #{@position_y}; facing direction #{@direction}"
    else
      "Robot state is invalid. Position #{@position_x}, #{@position_y}, direction #{@direction}"
    end
  end

  private

  def valid?(pos_x=@position_x, pos_y=@position_y, dir=@direction)
    Directions::DIRECTIONS.include?(dir) && @table.valid_position?(pos_x, pos_y)
  end
end