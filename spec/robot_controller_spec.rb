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
    for command in %w(MOVE REPORT LEFT RIGHT) do
      it "should handle #{command} command" do
        @robot.should_receive(command.downcase.to_sym)
        @controller.process_command(command)
      end
    end
    it "should handle unknown command" do
      @controller.process_command("PLACE 1,2,NO2TH")
    end
  end
  describe "read_input" do
    it "should read lines and process them" do
      controller = RobotController.new
      File.should_receive(:open).with("data/test.txt") { StringIO.new "LEFT\nRIGHT" }
      controller.should_receive(:process_command).with("LEFT")
      controller.should_receive(:process_command).with("RIGHT")

      controller.read_input
    end
  end
end