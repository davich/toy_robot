require 'spec_helper'

describe Direction do
  describe "turning" do
    it "should turn left" do
      Direction.north.left.should == Direction.west
      Direction.west.left.should == Direction.south
      Direction.south.left.should == Direction.east
      Direction.east.left.should == Direction.north
    end
    it "should turn right" do
      Direction.north.right.should == Direction.east
      Direction.west.right.should == Direction.north
      Direction.south.right.should == Direction.west
      Direction.east.right.should == Direction.south
    end
  end
  describe "for" do
    it "should retrieve the right direction for the given name" do
      Direction.for("NORTH").should == Direction.north
      Direction.for("SOUTH").should == Direction.south
      Direction.for("EAST").should == Direction.east
      Direction.for("WEST").should == Direction.west
    end
  end
end