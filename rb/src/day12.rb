require_relative 'util'
require 'set'

def traverse(graph, node, path, big)
  if path.include?(node) && !big.include?(node)
    return []
  end

  path.push(node)
  if node == 'end'
    return [path]
  end

  paths = graph[node].flat_map do |neighbor|
    traverse(graph, neighbor, path.clone, big)
  end
  paths.compact
end

def traverse2(graph, node, path, big)
  if path.include?(node) && (node == 'start' || node == 'end')
    return []
  end
  path.push(node)
  dupes = path.filter { !big.include?(_1) && _1 != 'start' && _1 != 'end' }
              .tally
  if dupes.any? { _2 > 2 } || dupes.filter { _2 > 1 }.length > 1
    return []
  end
  if node == 'end'
    return [path]
  end

  paths = graph[node].flat_map do |neighbor|
    traverse2(graph, neighbor, path.clone, big)
  end
  paths.compact
end

def parse(input)
  graph = Hash.new { |h, k| h[k] = [] }
  input.lines do |line|
    node1, node2 = line.chomp.split(/-/)
    graph[node1] << node2
    graph[node2] << node1
  end
  graph
end

def part1(input)
  graph = parse(input)
  big = Set.new(graph.keys.filter { _1.match /[A-Z]+/ })
  ans = traverse(graph, 'start', [], big)
  p ans.length
end

def part2(input)
  graph = parse(input)
  big = Set.new(graph.keys.filter { _1.match /[A-Z]+/ })
  ans = traverse2(graph, 'start', [], big)
  p ans.length
end

with_input do |input|
  part1(input)
  part2(input)
end