def with_input
  start_time = Time.now
  input_filename = 'input/' + File.basename($0).sub(/rb$/, 'txt')
  input = File.read(input_filename)
  yield input
  end_time = Time.now
  puts "elapsed time #{end_time - start_time}s"
end