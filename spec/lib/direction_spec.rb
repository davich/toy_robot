require 'spec_helper'

describe Direction do
  describe "turning" do
    it "should turn left" do
      Direction::NORTH.left.should == Direction::WEST
      Direction::WEST.left.should == Direction::SOUTH
      Direction::SOUTH.left.should == Direction::EAST
      Direction::EAST.left.should == Direction::NORTH
    end
    it "should turn right" do
      Direction::NORTH.right.should == Direction::EAST
      Direction::WEST.right.should == Direction::NORTH
      Direction::SOUTH.right.should == Direction::WEST
      Direction::EAST.right.should == Direction::SOUTH
    end
  end
  describe "for" do
    it "should retrieve the right direction for the given name" do
      Direction.for("NORTH").should == Direction::NORTH
      Direction.for("SOUTH").should == Direction::SOUTH
      Direction.for("EAST").should == Direction::EAST
      Direction.for("WEST").should == Direction::WEST
    end
  end
  it "should not allow creation of new direction" do
    lambda do
      Direction.new("blah")
    end.should raise_error
  end
end