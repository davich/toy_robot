class Table
  def initialize(size_x, size_y)
    @size_x = size_x
    @size_y = size_y
  end

  def valid_position?(position)
    position.x >= 0 && position.x < @size_x &&
          position.y >= 0 && position.y < @size_y
  end
end