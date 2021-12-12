require_relative 'util'

def flash(grid, x, y)
  xmin = x > 0
  ymin = y > 0
  xmax = x < grid.length - 1
  ymax = y < grid.length - 1

  grid[x][y] = -1
  inc(grid, x - 1, y) if xmin
  inc(grid, x, y - 1) if ymin
  inc(grid, x + 1, y) if xmax
  inc(grid, x, y + 1) if ymax
  inc(grid, x - 1, y - 1) if xmin && ymin
  inc(grid, x - 1, y + 1) if xmin && ymax
  inc(grid, x + 1, y - 1) if xmax && ymin
  inc(grid, x + 1, y + 1) if xmax && ymax
end

def inc(grid, x, y)
  if grid[x][y] == -1
    return
  end
  grid[x][y] += 1
  if grid[x][y] > 9
    flash(grid, x, y)
  end
end

def tick(grid)
  grid.each.with_index do |line, y|
    line.each.with_index do |_, x|
      inc(grid, x, y)
    end
  end
  grid.map! { _1.map! { |x| x == -1 ? 0 : x } }
  grid.flatten.filter(&:zero?).length
end

def part1(input)
  grid = input.lines.map { _1.chomp.split(//).map(&:to_i) }
  flashes = 0
  100.times do
    flashes += tick(grid)
    # grid.map { puts _1.join }
    # puts
  end
  p flashes
end

def part2(input)
  grid = input.lines.map { _1.chomp.split(//).map(&:to_i) }
  flashes = 0
  (1..).each do |n|
    flashes += tick(grid)
    if grid.all? { |line| line.all?(&:zero?) }
      grid.map { puts _1.join }
      puts n
      return
    end
  end
end

with_input do |input|
  part1(input)
  part2(input)
end
