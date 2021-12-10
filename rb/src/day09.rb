require_relative 'util'
require 'set'

def neighbors(grid, x, y)
  ns = []
  if x > 0
    ns << grid[x - 1][y]
  end
  if y > 0
    ns << grid[x][y - 1]
  end
  if x < grid.length - 1
    ns << grid[x + 1][y]
  end
  if y < grid[0].length - 1
    ns << grid[x][y + 1]
  end
  ns
end

def neighbors_with_coords(grid, x, y)
  ns = []
  if x > 0
    ns << [grid[x - 1][y], [x - 1, y]]
  end
  if y > 0
    ns << [grid[x][y - 1], [x, y - 1]]
  end
  if x < grid.length - 1
    ns << [grid[x + 1][y], [x + 1, y]]
  end
  if y < grid[0].length - 1
    ns << [grid[x][y + 1], [x, y + 1]]
  end
  ns
end

def part1(input)
  grid = input.lines.map { _1.chomp.split(//).map(&:to_i) }
  ans = 0
  grid.each.with_index do |line, x|
    line.each.with_index do |num, y|
      if neighbors(grid, x, y).all? { |n| num < n }
        ans += num + 1
      end
    end
  end
  p ans
end

def flow(grid, x, y, low_points)
  if grid[x][y] == 9
    nil
  elsif low_points.include? [x, y]
    [x, y]
  else
    min = neighbors_with_coords(grid, x, y).min_by { _1[0] }
    flow(grid, min[1][0], min[1][1], low_points)
  end
end

def part2(input)
  grid = input.lines.map { _1.chomp.split(//).map(&:to_i) }
  low_points = Set.new
  grid.each.with_index do |line, x|
    line.each.with_index do |num, y|
      if neighbors(grid, x, y).all? { |n| num < n }
        low_points << [x, y]
      end
    end
  end
  basins = Hash.new(0)
  grid.each.with_index do |line, x|
    line.each.with_index do |_, y|
      lp = flow(grid, x, y, low_points)
      basins[lp] += 1 if lp
    end
  end
  p basins.values.sort.reverse.take(3).reduce(&:*)

end

with_input do |input|
  part1(input)
  part2(input)
end