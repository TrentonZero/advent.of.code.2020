file = File.open('input')

lines = file.readlines.map(&:chomp)

seat_ids = lines.map do |line|

  row_code = line[0..6]
  seat_code = line[7..9]


  #puts "line: #{line}, rowcode: #{row_code}, seatcode: #{seat_code}"

  binary_row_code = row_code.gsub('F', '0').gsub('B', '1')
  row_number = "0b#{binary_row_code}".to_i(2)

  #puts "line: #{line}, rowcode: #{row_code}, binary row code: #{binary_row_code}, row_number: #{row_number}"

  binary_seat_code = seat_code.gsub('L', '0').gsub('R', '1')
  seat_number = "0b#{binary_seat_code}".to_i(2)

  #puts "seat number: #{seat_number}"

  seat_id = (row_number * 8) + seat_number

  seat_id

end

puts "#{seat_ids.max}"
