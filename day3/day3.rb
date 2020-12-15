file = File.open('input')

lines = file.readlines.map(&:chomp)

tree_count = 0
xpos = 0
lines.each_with_index do |line, ypos|
  if xpos > (line.size - 1)
    xpos = xpos - (line.size)
  end


  is_tree = line[xpos] == '#'
  if is_tree
    tree_count += 1
  end

  puts "xpos #{xpos} ypos #{ypos} line width #{line.size}. current tree count: #{tree_count}"

  xpos += 3

end

puts "The Tree count: #{tree_count}"

