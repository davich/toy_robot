require 'spec_helper'

describe Direction do
  describe "turning" do
    it "should turn left" do
      expect(Direction::NORTH.left).to eq Direction::WEST
      expect(Direction::WEST.left).to eq Direction::SOUTH
      expect(Direction::SOUTH.left).to eq Direction::EAST
      expect(Direction::EAST.left).to eq Direction::NORTH
    end
    it "should turn right" do
      expect(Direction::NORTH.right).to eq Direction::EAST
      expect(Direction::WEST.right).to eq Direction::NORTH
      expect(Direction::SOUTH.right).to eq Direction::WEST
      expect(Direction::EAST.right).to eq Direction::SOUTH
    end
  end
  describe "for" do
    it "should retrieve the right direction for the given name" do
      expect(Direction.for("NORTH")).to eq Direction::NORTH
      expect(Direction.for("SOUTH")).to eq Direction::SOUTH
      expect(Direction.for("EAST")).to eq Direction::EAST
      expect(Direction.for("WEST")).to eq Direction::WEST
    end
  end
  it "should not allow creation of new direction" do
    expect do
      Direction.new("blah")
    end.to raise_error(NoMethodError, "private method `new' called for Direction:Class")
  end
end
