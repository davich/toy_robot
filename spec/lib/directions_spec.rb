require 'spec_helper'

describe Directions do
  describe "turning" do
    it "should turn left" do
      Directions::left(Directions::NORTH).should == Directions::WEST
      Directions::left(Directions::WEST).should == Directions::SOUTH
      Directions::left(Directions::SOUTH).should == Directions::EAST
      Directions::left(Directions::EAST).should == Directions::NORTH
    end
    it "should turn right" do
      Directions::right(Directions::NORTH).should == Directions::EAST
      Directions::right(Directions::EAST).should == Directions::SOUTH
      Directions::right(Directions::SOUTH).should == Directions::WEST
      Directions::right(Directions::WEST).should == Directions::NORTH
    end
  end
end