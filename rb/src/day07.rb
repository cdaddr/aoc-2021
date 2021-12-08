require_relative 'util'

def part1(input)
  crabs = input.chomp.split(/,/).map(&:to_i)
  min, max = crabs.min, crabs.max
  fuel = (min..max).to_a.map do |n|
    crabs.map{(_1 - n).abs}.sum
  end
  p fuel.min
end

def part2(input)
  crabs = input.chomp.split(/,/).map(&:to_i)
  min, max = crabs.min, crabs.max
  fuel = (min..max).to_a.map do |n|
    crabs.map{
      m = (_1 - n).abs
      (m * (m + 1)) / 2
    }.sum
  end
  p fuel.min
end

with_input do |input|
  part1(input)
  part2(input)
end
