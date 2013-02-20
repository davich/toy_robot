require './robot.rb'
require './table.rb'

class RobotController
  def initialize
    @robot = Robot.new(Table.new(5,5))
  end
  def read_input(filename="data/test.txt")
    File.open(filename).each_line do |command|
      process_command(command)
    end
  end

  def process_command(command)
    case command.strip
    when /^PLACE (\d+),(\d+),([A-Z]+)$/
      @robot.place $1.to_i, $2.to_i, $3
    when 'MOVE' then @robot.move
    when 'REPORT' then puts @robot.report
    when 'LEFT' then @robot.left
    when 'RIGHT' then @robot.right
    else
      puts "Unknown command #{command}"
    end
  end
end

RobotController.new.read_input