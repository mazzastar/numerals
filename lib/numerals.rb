


def length(number)
	number.to_s.length
end

def number_to_array(number)
	number.to_s.chars.map{|char| char.to_i}
end

def unitCharacters(unit_to_find)
	units=[:ones, :tens, :hundreds, :thousands, :tenthousands]
	numerals = ["I", "V", "X", "L", "C", "D", "M"]
	num_index = units.index(unit_to_find)
	startIndex = 2*(num_index)
	endIndex = 2*(num_index+1)
	numerals[startIndex..endIndex]
end

def units_array(length)
	units=[:ones, :tens, :hundreds, :thousands, :tenthousands]
	units[0..(length-1)].reverse
end

def format_numeral(number, numeral, numeral_5, numeral_10)
		if number >= 0 && number < 4
			numeral*number 
		elsif number ==4
			numeral+numeral_5		
		elsif (number >4 && number <9)
		 	 numeral_5+numeral*(number-5) 
		else
			 numeral+numeral_10
		end
end


def translate_number(number)
	number_array = number_to_array(number)
	char_set = character_sets(number_array.length)

	results = number_array.map.with_index do |number, index|
		numeral, numeral_5, numeral_10=char_set[index]
		format_numeral(number, numeral, numeral_5, numeral_10)
	end
	results.join("")
end

def character_sets(length)
	array_to_return = units_array(length).map do |units|
		unitCharacters(units)	
	end

	array_to_return[0]=["M", "_", "_"] if length ==4
	array_to_return
	
end
