require_relative 'lib/robot'
require_relative 'lib/table'

class RobotController
  def initialize
    @robot = Robot.new(Table.new(5,5))
  end
  def read_input(filename="data/test.txt")
    File.open(filename).each_line do |command|
      process_command(command.chomp.strip)
    end
  end

  def process_command(command)
    case command
    when /^PLACE (\d+),(\d+),([A-Z]+)$/
      @robot.place Position.new($1.to_i, $2.to_i), Direction.for($3)
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
