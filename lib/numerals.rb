UNITS = [:ones, :tens, :hundreds, :thousands, :tenthousands, :onehundredthousands, :onemillions]
NUMERALS = ["I", "V", "X", "L", "C", "D", "M", "V2", "X2", "L2", "C2", "D2", "M2"]

def unitCharacters(unit_to_find)
	num_index = UNITS.index(unit_to_find)
	startIndex = 2*(num_index)
	endIndex = 2*(num_index+1)
	NUMERALS[startIndex..endIndex]
end

def units_array(length)
	UNITS[0..(length-1)].reverse
end

def character_sets(length)
	array_to_return = units_array(length).map do |units|
		unitCharacters(units)	
	end	
end

def format_numerals(number, num_1, num_5, num_10)
	case number 
		when 0..3 then 	num_1*number 
		when 4 then 	num_1+num_5		
		when 5..8 then 	num_5+num_1*(number-5)
		else			num_1+num_10		
	end
end

def number_to_array(number)
	number.to_s.chars.map{|char| char.to_i}
end

def translate_number(number)
	number_array = number_to_array(number)
	char_set = character_sets(number_array.length)

	results = number_array.map.with_index do |number, index|
		num_1, num_5, num_10=char_set[index]
		format_numerals(number, num_1, num_5, num_10)
	end
	results.join("")
end

def main()
	puts "Please enter a number between 0-3999999"
	number = gets.chomp.to_i

	while (!number.to_s.empty? && (number>3999999||number <0))
		puts "Please enter a number between 0-3999999"
		number = gets.chomp.to_i
	end

	puts translate_number(number)
end

puts translate_number(3999999)
# main
