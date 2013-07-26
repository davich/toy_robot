require 'spec_helper'

describe Directions do
  describe "turning" do
    it "should turn left" do
      Directions::NORTH.left.should == Directions::WEST
      Directions::WEST.left.should == Directions::SOUTH
      Directions::SOUTH.left.should == Directions::EAST
      Directions::EAST.left.should == Directions::NORTH
    end
    it "should turn right" do
      Directions::NORTH.right.should == Directions::EAST
      Directions::WEST.right.should == Directions::NORTH
      Directions::SOUTH.right.should == Directions::WEST
      Directions::EAST.right.should == Directions::SOUTH
    end
  end
  describe "for" do
    it "should retrieve the right direction for the given name" do
      Directions::Direction.for("NORTH").should == Directions::NORTH
      Directions::Direction.for("SOUTH").should == Directions::SOUTH
      Directions::Direction.for("EAST").should == Directions::EAST
      Directions::Direction.for("WEST").should == Directions::WEST
    end
  end
end