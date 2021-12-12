require_relative 'util'

MATCH = {
  '(' => ')',
  '[' => ']',
  '{' => '}',
  '<' => '>',
}

INV = MATCH.invert

def parse(line)
  stack = []
  line.chars.each do |c|
    if MATCH[c]
      stack.push(c)
    elsif c == MATCH[stack[-1]]
      stack.pop
    else
      return c
    end
  end
  stack.reverse
end

SCORE = {
  ')' => 3,
  ']' => 57,
  '}' => 1197,
  '>' => 25137,
}

def part1(input)
  p input.lines
         .map(&:chomp)
         .map { parse _1 }
         .filter { _1.is_a? String }
         .map { SCORE[_1[0]] }
         .sum
end

SCORE2 = {
  ')' => 1,
  ']' => 2,
  '}' => 3,
  '>' => 4,
}

def part2(input)
  ans = input.lines
             .map(&:chomp)
             .map { parse _1 }
             .filter { _1.is_a? Array }
             .map { _1.map(&MATCH) }
             .map { _1.reduce(0) { |acc, x| (acc * 5) + SCORE2[x] } }
             .sort
  p ans[ans.length / 2]

end

with_input do |input|
  part1(input)
  part2(input)
end
