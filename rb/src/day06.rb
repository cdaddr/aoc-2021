require_relative 'util'

def part1(input)
  fish = input.chomp.split(',').map(&:to_i).tally
  80.times do
    new_fish = fish[0] || 0
    fish = Hash[fish.map{|k,v| [k-1, v] }]
    fish[8] = (fish[8] || 0) + new_fish
    fish[6] = (fish[6] || 0) + (fish[-1] || 0)
    fish[-1] = 0
  end
  puts fish.values.sum
end

def part2(input)
  fish = input.chomp.split(',').map(&:to_i).tally
  256.times do
    new_fish = fish[0] || 0
    fish = Hash[fish.map{|k,v| [k-1, v] }]
    fish[8] = (fish[8] || 0) + new_fish
    fish[6] = (fish[6] || 0) + (fish[-1] || 0)
    fish[-1] = 0
  end
  puts fish.values.sum
end

with_input do |input|
  part1(input)
  part2(input)
end
