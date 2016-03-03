require 'spec_helper'

describe RobotController do
  describe "process_command" do
    before (:each) do
      @controller = RobotController.new
      @robot = double("robot")
      @controller.instance_variable_set(:@robot, @robot)
    end

    it "handles PLACE command" do
      expect(@robot).to receive(:place).with(Position.new(1,2),Direction.for("NORTH"))
      @controller.process_command("PLACE 1,2,NORTH")
    end
    for command in %w(MOVE REPORT LEFT RIGHT) do
      it "handles #{command} command" do
        expect(@robot).to receive(command.downcase.to_sym)
        @controller.process_command(command)
      end
    end
    it "handles unknown command" do
      @controller.process_command("PLACE 1,2,NO2TH")
    end
  end
  describe "read_input" do
    it "reads lines and process them" do
      controller = RobotController.new
      expect(File).to receive(:open).with("data/test.txt") { StringIO.new "LEFT\nRIGHT" }
      expect(controller).to receive(:process_command).with("LEFT")
      expect(controller).to receive(:process_command).with("RIGHT")

      controller.read_input
    end
  end
end
