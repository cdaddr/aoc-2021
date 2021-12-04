def with_input
  input_filename = 'input/' + File.basename($0).sub(/rb$/, 'txt')
  input = File.read(input_filename)
  yield input
end