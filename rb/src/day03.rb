require_relative 'util'

def part1(input)
  lines = input.lines.map(&:chomp).to_a
  gamma, epsilon = '', ''
  0.upto(lines.first.length-1) do |n|
    counts = lines.map{_1[n]}.tally
    gamma << counts.sort_by{_2}[0][0]
    epsilon << counts.sort_by{_2}[1][0]
  end
  puts gamma.to_i(2) * epsilon.to_i(2)
end

def bit_criteria(lines, f)
  pos = 0
  while lines.length > 1 do
    most_common = lines.map{_1[pos]}.tally.sort_by{_2}.send(f)[0]
    lines = lines.select{_1[pos] == most_common}
    pos += 1
  end
  lines[0]
end

def part2(input)
  lines = input.lines.map(&:chomp).to_a
  o2 = bit_criteria(lines, :first)
  co2 = bit_criteria(lines, :last)
  puts o2.to_i(2) * co2.to_i(2)
end

with_input do |input|
  part1(input)
  part2(input)
end
