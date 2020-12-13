file = File.open("input")

lines = file.readlines.map(&:chomp)

my_two = []

lines.each_with_index do |x, xidx|
  next if lines.count == xidx + 1
  lines[xidx..-1].each_with_index do |y, yidx|
    puts "debug: #{x} #{y}"
    x = x.to_i
    y = y.to_i

    my_two = [x,y] if (x + y) == 2020
  end
end

product = my_two[0] * my_two[1]
puts "My numbers are #{my_two[0]} and #{my_two[1]}. Multiply them is: #{product}"
