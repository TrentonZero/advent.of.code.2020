file = File.open("input")

lines = file.readlines.map(&:chomp)

my_two = []

lines[0..-3].each_with_index do |x, xidx|
  x = x.to_i
  lines[(xidx+1)..-2].each_with_index do |y, yidx|
    y = y.to_i
    lines[(xidx + yidx + 2)..-1].each_with_index do |z, zidx|
      z = z.to_i

      my_two = [x,y,z] if (x + y + z) == 2020
    end
  end
end

product = my_two[0] * my_two[1] * my_two[2]
puts "My numbers are #{my_two[0]} and #{my_two[1]} and #{my_two[2]}. Multiply them is: #{product}"
