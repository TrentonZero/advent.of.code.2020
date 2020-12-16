
def has_valid_byr? p
  year = p['byr'].to_i
  year >= 1920 && year <= 2002
end

def has_valid_iyr? p
  year = p['iyr'].to_i
  year >= 2010 && year <= 2020
end

def has_valid_eyr? p
  year = p['eyr'].to_i
  year >= 2020 && year <= 2030
end

def has_valid_hgt? p
  if p['hgt'].match? /^\d*in$/
    result = p['hgt'].split("in")[0].to_i
    result <= 76 && result >= 59
  elsif p['hgt'].match? /^\d*cm$/
    result = p['hgt'].split("cm")[0].to_i
    result <= 193 && result >= 150
  else
    false
  end
end

def has_valid_hcl? p
  p['hcl'].match? /^#[0-9a-f]{6}$/
end

def has_valid_ecl? p
  %w(amb blu brn gry grn hzl oth).include? p['ecl']
end

def has_valid_pid? p
  p['pid'].match? /^\d{9}$/
end




file  = File.open('input')

lines = file.readlines.map(&:chomp)

passports = []

passport = {}

lines.each do |line|
  if line.empty?
    passports << passport
    passport = {}
    next
  end
  kvpairs = line.split(' ')

  passport = kvpairs.reduce(passport) do |acc, kvp|
    arr =  kvp.split(':') # arr =   [ 'ivr', '2010' ]
    acc[arr[0]] = arr[1]
    acc
  end

end

passports << passport


required_fields = %w(byr iyr eyr hgt hcl ecl pid)

valid_passport_count = passports
  .select { |p|  (p.keys & required_fields).count == required_fields.count  }
  .select { |p| has_valid_byr? p }
  .select { |p| has_valid_iyr? p }
  .select { |p| has_valid_eyr? p }
  .select { |p| has_valid_hgt? p }
  .select { |p| has_valid_hcl? p }
  .select { |p| has_valid_ecl? p }
  .select { |p| has_valid_pid? p }
  .count


puts "valid count: #{valid_passport_count}"
