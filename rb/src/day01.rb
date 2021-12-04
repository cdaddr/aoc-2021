require_relative 'util'

def part1(input)
  ans = input
          .lines
          .map(&:to_i)
          .each_cons(2)
          .filter{_2 > _1}
          .count
  puts ans
end

def part2(input)
  nums = input.lines.map(&:to_i)
  ans = nums
          .each_cons(3)
          .each_cons(2)
          .filter{_2.sum > _1.sum}
          .count
  puts ans
end

with_input do |input|
  part1(input)
  part2(input)
end
