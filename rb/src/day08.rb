require_relative 'util'
require 'set'

def part1(input)
  uniqs = Set[2, 4, 3, 7]
  ans = input.lines.flat_map do |line|
    _, outputs = line.chomp.split(/\s*\|\s*/).map { _1.split(/\s+/) }
    outputs.filter { uniqs.include? _1.length }
  end
  p ans.length
end

DIGITS = {
  'abcefg' => '0',
  'cf' => '1',
  'acdeg' => '2',
  'acdfg' => '3',
  'bcdf' => '4',
  'abdfg' => '5',
  'abdefg' => '6',
  'acf' => '7',
  'abcdefg' => '8',
  'abcdfg' => '9',
}

ALL = 'abcdefg'

def apply_key(s, key)
  s.tr(key, ALL).chars.sort.join
end

def part2(input)
  total = 0
  input.lines.map do |line|
    inputs, outputs = line.chomp.split(/\s*\|\s*/).map { _1.split(/\s+/) }
    words = (inputs + outputs)
    key = ALL.chars.permutation.each do |perm|
      key = perm.join
      if words.map { apply_key _1, key }.all?(&DIGITS)
        break key
      end
    end
    total += outputs.map { apply_key _1, key }.map(&DIGITS).join.to_i
  end
  p total
end

with_input do |input|
  part1(input)
  part2(input)
end
