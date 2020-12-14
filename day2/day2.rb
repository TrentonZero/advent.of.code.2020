file = File.open("input")

lines = file.readlines.map(&:chomp)


acc = 0
lines.each do |line|
  segments = line.split(' ')
  counts = segments[0]   # 2-5
  letter = segments[1][0]  # l
  password = segments[2] # aaa

  split_result = counts.split("-")
  min_occ = split_result[0].to_i
  max_occ = split_result[1].to_i

  how_many_appear = password.scan(letter).count

  if how_many_appear >= min_occ && how_many_appear && how_many_appear <= max_occ
    acc += 1
  end

end

puts "answer: #{acc}"
