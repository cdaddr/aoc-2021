require_relative 'util'

def part1(input)
  polymer, rules = input.split(/\n\n/).map(&:chomp)
  rules = rules.lines.map { _1.chomp.split(/ -> /) }.to_h
  polymer = polymer.chars
  10.times do
    new_polymer = []
    polymer.each_cons(2) do |s|
      new_polymer << s[0]
      new_polymer << rules[s.join]
    end
    polymer = new_polymer + [polymer[-1]]
  end
  tallies = polymer.tally.sort_by { _2 }
  p tallies[-1][1] - tallies[0][1]
end

def part2(input)
  polymer, rules = input.split(/\n\n/).map(&:chomp)
  rules = rules.lines.map {
    l, r = _1.chomp.split(/ -> /)
    [l, [l[0] + r, r + l[1]]]
  }.to_h
  polymer = polymer.chars.each_cons(2).map(&:join).tally
  40.times do
    newp = Hash.new(0)
    polymer.each do |k, v|
      rules[k].each do |newr|
        newp[newr] += v
      end
    end
    polymer = newp
  end
  counts = Hash.new(0)
  polymer.each do |k, v|
    k.chars.each do |c|
      counts[c] += v
    end
  end
  counts = counts.map { |k, v| [k, v / 2 + (v.odd? ? 1 : 0)] }.sort_by { _2 }
  p counts[-1][1] - counts[0][1]
end

with_input do |input|
  part1(input)
  part2(input)
end
