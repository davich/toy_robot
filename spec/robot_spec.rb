require 'spec_helper'

describe Robot do
  describe "place" do
    before(:each) do
      @robot = Robot.new(Table.new(5,5))
    end
    it "should not place with invalid position" do
      @robot.place(Position.new(-1,0),"NORTH")
      @robot.report.should include "invalid"
    end
    it "should not place with invalid direction" do
      @robot.place(Position.new(0,0),"DOWN")
      @robot.report.should include "invalid"
    end
    it "should place with valid position and direction" do
      @robot.place(Position.new(0,0), "SOUTH")
      @robot.report.should == "Robot is at position 0, 0; facing direction SOUTH"
    end
  end
  describe "move" do
    before(:each) do
      @robot = Robot.new(Table.new(5,5))
    end
    it "should not move if in an invalid state" do
      @robot.place(Position.new(-1, 1), "NORTH")
      @robot.move
      @robot.report.should include "invalid"
    end
    it "should not move into an invalid position" do
      @robot.place(Position.new(3,4),"NORTH")
      @robot.move
      @robot.report.should include "3, 4"
    end
    it "should move SOUTH" do
      @robot.place(Position.new(2,2),"SOUTH")
      @robot.move
      @robot.report.should include "2, 1"
    end
    it "should move NORTH" do
      @robot.place(Position.new(2,2),"NORTH")
      @robot.move
      @robot.report.should include "2, 3"
    end
    it "should move EAST" do
      @robot.place(Position.new(2,2),"EAST")
      @robot.move
      @robot.report.should include "3, 2"
    end
    it "should move WEST" do
      @robot.place(Position.new(2,2),"WEST")
      @robot.move
      @robot.report.should include "1, 2"
    end
  end
  describe "turning" do
    before(:each) do
      @robot = Robot.new(Table.new(5,5))
    end
    it "should not turn if in an invalid state" do
      @robot.place(Position.new(-1, 1), "NORTH")
      @robot.left
      @robot.report.should include "invalid"
      @robot.right
      @robot.report.should include "invalid"
    end
    it "should turn left" do
      @robot.place(Position.new(1,1),"NORTH")
      @robot.left
      @robot.report.should include "WEST"
      @robot.left
      @robot.report.should include "SOUTH"
      @robot.left
      @robot.report.should include "EAST"
      @robot.left
      @robot.report.should include "NORTH"
    end
    it "should turn right" do
      @robot.place(Position.new(1,1),"NORTH")
      @robot.right
      @robot.report.should include "EAST"
      @robot.right
      @robot.report.should include "SOUTH"
      @robot.right
      @robot.report.should include "WEST"
      @robot.right
      @robot.report.should include "NORTH"
    end
  end
end