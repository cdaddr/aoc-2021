require_relative 'util'

def win?(board, nums)
  0.upto(4) do |n|
    return :c if (5 * n).upto(5 * n + 4).all?{nums.include?(board[_1])}
    return :d if 0.upto(4).all?{nums.include?(board[n + 5*_1])}
  end
  false
end

def print_board(board)
  board.each_slice(5) do |s|
    p s
  end
end

def parse(input)
  draws = input.lines[0].chomp.split(/,/).map(&:to_i)
  boards = input.split(/\n\n/)[1..].map{_1.split(/\s+/).map(&:to_i)}
  [draws, boards]
end

def score(winner, marked)
  winner.reject{marked.include? _1}.sum * marked.last
end

def part1(input)
  draws, boards = parse(input)
  marked = []
  winner = draws.each do |n|
    marked << n
    winner = boards.filter{win?(_1, marked)}.first
    break winner if winner
  end
  puts score(winner, marked)
end

def part2(input)
  draws, boards = parse(input)
  marked = []
  winner = draws.each do |n|
    marked << n
    if boards.length == 1 && win?(boards[0], marked)
      break boards[0]
    end
    boards.reject!{win? _1, marked}
  end
  puts score(winner, marked)
end

with_input do |input|
  part1(input)
  part2(input)
end
