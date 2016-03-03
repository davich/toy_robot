class Table
  def initialize(size_x, size_y)
    @size_x = size_x
    @size_y = size_y
  end

  def valid_position?(position)
    position.between?(0...@size_x, 0...@size_y)
  end
end
