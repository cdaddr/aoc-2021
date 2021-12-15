require_relative 'util'
require 'set'

def print_grid(grid)
  max_x = grid.max_by { _1[0] }[0]
  max_y = grid.max_by { _1[1] }[1]
  0.upto(max_y) do |y|
    0.upto(max_x) do |x|
      if grid.include?([x, y])
        print '#'
      else
        print ' '
      end
    end
    print "\n"
  end
  print "\n"
end

def fold(grid, i)
  grid.to_a.each do |coord|
    if i[0] == 'y'
      grid.add([coord[0], (i[1] * 2) - coord[1]])
    else
      grid.add([(i[1] * 2) - coord[0], coord[1]])
    end
  end
  grid.to_a.each do |coord|
    if coord[(i[0] == 'y' ? 1 : 0)] > i[1]
      grid.delete(coord)
    end
  end
end

def parse(input)
  grid, instructions = input.split(/\n\n/)
  grid = grid.lines.map { _1.chomp.split(/,/).map(&:to_i) }.then { Set.new _1 }
  instructions = instructions.lines.map { _1.chomp.match(/([xy])=(\d+)/)[1..] }.map { [_1, _2.to_i] }
  [grid, instructions]
end

def part1(input)
  grid, instructions = parse input
  fold(grid, instructions.first)
  puts grid.flatten.length
end

def part2(input)
  grid, instructions = parse input
  instructions.each do |i|
    fold(grid, i)
  end
  print_grid grid
end

with_input do |input|
  part1(input)
  part2(input)
end