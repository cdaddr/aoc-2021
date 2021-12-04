require_relative 'util'

def part1(input)
  horiz, depth = 0,0
  input.lines do |line|
    dir, num = line.split(/ /)
    num = num.to_i
    case dir
    when 'up'
      depth -= num
    when 'down'
      depth += num
    when 'forward'
      horiz += num
    else
      raise '?'
    end
  end
  ans = horiz * depth
  puts ans
end

def part2(input)
  horiz, depth, aim = 0,0,0
  input.lines do |line|
    dir, num = line.split(/ /)
    num = num.to_i
    case dir
    when 'up'
      aim -= num
    when 'down'
      aim += num
    when 'forward'
      horiz += num
      depth += aim * num
    else
      raise '?'
    end
  end
  ans = horiz * depth
  puts ans
end

with_input do |input|
  part1(input)
  part2(input)
end
