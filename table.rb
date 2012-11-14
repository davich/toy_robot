class Table
  def initialize(size_x, size_y)
    @size_x = size_x
    @size_y = size_y
  end
  def valid_position?(pos_x, pos_y)
    pos_x >= 0 && pos_x < @size_x && pos_y >= 0 && pos_y < @size_y
  end
end