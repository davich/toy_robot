class Robot
  @@DIRECTIONS = %w(NORTH EAST SOUTH WEST)
  @@LEFT = -1
  @@RIGHT = 1
  @@POSITION_MODIFIERS = {
    'NORTH' => [0, 1],
    'SOUTH' => [0, -1],
    'EAST' => [1, 0],
    'WEST' => [-1, 0]
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
    turn(@@LEFT) if valid?
  end

  def right
    turn(@@RIGHT) if valid?
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
    @@DIRECTIONS.include?(dir) && @table.valid_position?(pos_x, pos_y)
  end

  def turn(modifier)
    new_index = (@@DIRECTIONS.index(@direction) + modifier) % @@DIRECTIONS.size
    @direction = @@DIRECTIONS[new_index]
  end
end