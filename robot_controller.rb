require './robot.rb'
require './table.rb'


robot = Robot.new(Table.new(5,5))
$stdin.each do |command|
  command_parts = command.strip.split(" ")
  case command_parts[0]
  when 'PLACE'
    args = command_parts[1].split(",")
    robot.place args[0].to_i, args[1].to_i, args[2]
  when 'MOVE' then robot.move
  when 'REPORT' then puts robot.report
  when 'LEFT' then robot.left
  when 'RIGHT' then robot.right
  else
    puts "Unknown command #{command_parts[0]}"
  end
end