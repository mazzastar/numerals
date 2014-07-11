NUMERALS = ["I", "V", "X", "L", "C", "D", "M", "V2", "X2", "L2", "C2", "D2", "M2" "P", "Q"]

def character_sets(length_of_number)
	array_to_return = (0..length_of_number-1).to_a.map do |i|
		character_set(length_of_number, i)
	end
end

def character_set(length_of_number, index)
	NUMERALS[2*(length_of_number-index-1)..2*(length_of_number-index)]
end

def format_numerals(digit, num_1, num_5, num_10)
	case digit 
		when 0..3 then 	num_1*digit 
		when 4 then 	num_1+num_5		
		when 5..8 then 	num_5+num_1*(digit-5)
		else 
			num_1+num_10
	end
end

def number_to_array(number)
	number.to_s.chars.map{|char| char.to_i}
end

def length_of(number)
	number_array = number_to_array(number)
	number_array.length
end

def translate_number(number)
	number_array = number_to_array(number)
	char_set = character_sets(length_of(number))

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
