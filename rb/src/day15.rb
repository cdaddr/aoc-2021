require_relative 'util'
require 'set'
require 'pqueue' # gem install pqueue btw

def neighbors(grid, x, y)
  ns = []

  ns << [x - 1, y] if x > 0
  ns << [x, y - 1] if y > 0
  ns << [x + 1, y] if x < grid.length - 1
  ns << [x, y + 1] if y < grid.length - 1

  ns
end

def part1 (input
)
  grid = input.lines.map { _1.chomp.split(//).map(&:to_i) }
  solve(grid)
end

MAX = 2 ** 10

def solve(grid)
  visited = Set.new
  cur = [0, 0]
  dest = [grid[0].length - 1, grid.length - 1]
  nn = PQueue.new([[0, cur]]) { |l, r| l[0] < r[0] }
  ans = until nn.empty?
          val, cur = nn.pop
          break [val, cur] if cur == dest
          next if visited.include?(cur)
          visited.add(cur)
          neighbors(grid, cur[0], cur[1]).each do |n|
            nn.push([val + grid[n[1]][n[0]], n])
          end
        end
  p ans[0]
end

def part2(input)
  grid = input.lines.map { _1.chomp.split(//).map(&:to_i) }
  len = grid.length
  0.upto(len - 1) do |x|
    0.upto(len - 1) do |y|
      5.times do |ym|
        5.times do |xm|
          next if xm == 0 && ym == 0
          val = grid[y][x] + xm + ym
          if val > 9
            val = val - 9
          end
          grid[y + len * ym] ||= []
          grid[y + len * ym][x + len * xm] = val
        end
      end
    end
  end
  # grid.map { p _1 }
  solve(grid)
end

with_input do |input|
  part1(input)
  part2(input)
end