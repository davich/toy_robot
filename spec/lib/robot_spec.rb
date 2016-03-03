require 'spec_helper'

describe Robot do
  describe "place" do
    before(:each) do
      @robot = Robot.new(Table.new(5,5))
    end
    it "should not place with invalid position" do
      @robot.place(Position.new(-1,0), Direction.for("NORTH"))
      expect(@robot.report).to be_nil
    end
    it "should not place with invalid direction" do
      @robot.place(Position.new(0,0), Direction.for("DOWN"))
      expect(@robot.report).to be_nil
    end
    it "should place with valid position and direction" do
      @robot.place(Position.new(0,0), Direction.for("SOUTH"))
      expect(@robot.report).to eq "Robot is at position (0, 0); facing direction SOUTH"
    end
  end
  describe "move" do
    before(:each) do
      @robot = Robot.new(Table.new(5,5))
    end
    it "should not move if in an invalid state" do
      @robot.place(Position.new(-1, 1),  Direction.for("NORTH"))
      @robot.move
      expect(@robot.report).to be_nil
    end
    it "should not move into an invalid position" do
      @robot.place(Position.new(3,4), Direction.for("NORTH"))
      @robot.move
      expect(@robot.report).to include "3, 4"
    end
    it "should move SOUTH" do
      @robot.place(Position.new(2,2), Direction.for("SOUTH"))
      @robot.move
      expect(@robot.report).to include "2, 1"
    end
    it "should move NORTH" do
      @robot.place(Position.new(2,2), Direction.for("NORTH"))
      @robot.move
      expect(@robot.report).to include "2, 3"
    end
    it "should move EAST" do
      @robot.place(Position.new(2,2), Direction.for("EAST"))
      @robot.move
      expect(@robot.report).to include "3, 2"
    end
    it "should move WEST" do
      @robot.place(Position.new(2,2), Direction.for("WEST"))
      @robot.move
      expect(@robot.report).to include "1, 2"
    end
  end
  describe "turning" do
    before(:each) do
      @robot = Robot.new(Table.new(5,5))
    end
    it "should not turn if in an invalid state" do
      @robot.place(Position.new(-1, 1),  Direction.for("NORTH"))
      @robot.left
      expect(@robot.report).to be_nil
      @robot.right
      expect(@robot.report).to be_nil
    end
    it "should turn left" do
      @robot.place(Position.new(1,1), Direction.for("NORTH"))
      @robot.left
      expect(@robot.report).to include "WEST"
      @robot.left
      expect(@robot.report).to include "SOUTH"
      @robot.left
      expect(@robot.report).to include "EAST"
      @robot.left
      expect(@robot.report).to include "NORTH"
    end
    it "should turn right" do
      @robot.place(Position.new(1,1), Direction.for("NORTH"))
      @robot.right
      expect(@robot.report).to include "EAST"
      @robot.right
      expect(@robot.report).to include "SOUTH"
      @robot.right
      expect(@robot.report).to include "WEST"
      @robot.right
      expect(@robot.report).to include "NORTH"
    end
  end
end
