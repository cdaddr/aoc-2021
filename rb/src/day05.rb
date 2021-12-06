require_relative 'util'

def part1(input)
  marks = Hash.new(0)
  input.lines do |line|
    x1,y1,x2,y2 = line.chomp.split(/,| -> /).map(&:to_i)
    next unless x1 == x2 || y1 == y2
    if y1 == y2
      start, finish = [x1,x2].min, [x1,x2].max
      start.upto(finish) do |x|
        marks[[x,y1]] += 1
      end
    end
    if x1 == x2
      start, finish = [y1,y2].min, [y1,y2].max
      start.upto(finish) do |y|
        marks[[x1,y]] += 1
      end
    end
  end
  puts marks.filter{|_,v| v > 1}.count
end

def part2(input)
  marks = Hash.new(0)
  input.lines do |line|
    x1,y1,x2,y2 = line.chomp.split(/,| -> /).map(&:to_i)
    xstep = x1 > x2 ? -1 : x1 == x2 ? 0 : 1
    ystep = y1 > y2 ? -1 : y1 == y2 ? 0 : 1
    loop do
      marks[[x1, y1]] += 1
      x1 += xstep
      y1 += ystep
      break unless x1 != x2 || y1 != y2
    end
    marks[[x2, y2]] += 1
  end
  puts marks.filter{|_,v| v > 1}.count
end

with_input do |input|
  part1(input)
  part2(input)
end
