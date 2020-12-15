def test_slope(xdelta, ydelta)
  tree_count = 0
  file = File.open('input')
  begin

    lines = file.readlines.map(&:chomp)

    xpos = 0
    ypos = 0
    while ypos < lines.size
      line = lines[ypos]
      if xpos > (line.size - 1)
        xpos = xpos - (line.size)
      end


      is_tree = line[xpos] == '#'
      if is_tree
        tree_count += 1
      end

      #puts "xpos #{xpos} ypos #{ypos} line width #{line.size}. current tree count: #{tree_count}"

      xpos += xdelta
      ypos += ydelta

    end
  ensure
    file.close
  end
  tree_count

end


puts "The 1,1 Tree count: #{acc = test_slope(1,1)}"
puts "The 3,1 Tree count: #{acc *= test_slope(3,1)}"
puts "The 5,1 Tree count: #{acc *= test_slope(5,1)}"
puts "The 7,1 Tree count: #{acc *= test_slope(7,1)}"
puts "The 1,2 Tree count: #{acc *= test_slope(1,2)}"

