file = File.open("input")

lines = file.readlines.map(&:chomp)


acc = 0
lines.each do |line|
  segments = line.split(' ')
  counts = segments[0]   # 2-5
  letter = segments[1][0]  # l
  password = segments[2] # aaa

  split_result = counts.split("-")
  req_pos_x = split_result[0].to_i - 1
  req_pos_y = split_result[1].to_i - 1

  x_matches = password[req_pos_x] == letter
  y_matches = password[req_pos_y] == letter


  if x_matches ^ y_matches
    acc += 1
  end

end

puts "answer: #{acc}"
