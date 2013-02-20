require 'spec_helper'

describe RobotController do
  describe "process_command" do
    before (:each) do
      @controller = RobotController.new
      @robot = mock("robot")
      @controller.instance_variable_set(:@robot, @robot)
    end
  
    it "should handle PLACE command" do
      @robot.should_receive(:place).with(1,2,"NORTH")
      @controller.process_command("PLACE 1,2,NORTH")
    end
    it "should handle MOVE command" do
      @robot.should_receive(:move)
      @controller.process_command("MOVE")
    end
    it "should handle REPORT command" do
      @robot.should_receive(:report)
      @controller.process_command("REPORT")
    end
    it "should handle LEFT command" do
      @robot.should_receive(:left)
      @controller.process_command("LEFT")
    end
    it "should handle RIGHT command" do
      @robot.should_receive(:right)
      @controller.process_command("RIGHT")
    end
    it "should handle unknown command" do
      @controller.process_command("PLACE 1,2,NO2TH")
    end
  end
end