require 'numerals'

describe 'numerals' do 

	it 'gets correct length' do
		expect(length(1)).to eq 1
	end
	it 'gets correct length 2' do
		expect(length(10)).to eq 2
	end
	it 'gets correct length 3' do
		expect(length(100)).to eq 3
	end
	it 'gets character array' do
		expect(number_to_array(12)).to eq [1, 2]
	end
	it 'gets character array' do
		expect(number_to_array(13)).to eq [1, 3]
	end

	it 'gets the correct unit types' do
		expect(unitCharacters(:ones)).to eq ["I", "V", "X"]
	end
	it 'gets the correct unit types' do
		expect(unitCharacters(:tens)).to eq ["X", "L", "C"]
	end
	it 'gets the correct unit types' do
		expect(unitCharacters(:hundreds)).to eq ["C", "D", "M"]
	end

	it 'returns the correct units for all entries in the number_array' do
		expect(units_array(3)).to eq [:hundreds, :tens, :ones]
	end

	it 'returns the correct units for all entries in the number_array' do
		expect(units_array(2)).to eq [:tens, :ones]
	end

	it 'produces I for the number 1' do
		expect(translate_number(1)).to eq "I"
	end

	it 'produces II for the number 2' do
		expect(translate_number(2)).to eq "II"
	end
	it 'produces IV for the number 4' do
		expect(translate_number(4)).to eq "IV"
	end
	it 'produces V for the number 5' do
		expect(translate_number(5)).to eq "V"
	end
	it 'produces VI for the number 6' do
		expect(translate_number(6)).to eq "VI"
	end
	it 'produces IX for the number 9' do
		expect(translate_number(9)).to eq "IX"
	end
	it 'produces X for the number 10' do
		expect(translate_number(10)).to eq "X"
	end
	it 'produces XI for the number 11' do
		expect(translate_number(11)).to eq "XI"
	end
	it 'produces L for the number 50' do
		expect(translate_number(50)).to eq "L"
	end

	it 'produces L for the number 100' do
		expect(translate_number(100)).to eq "C"
	end
	it 'produces L for the number 100' do
		expect(translate_number(1000)).to eq "M"
	end
	it 'produces CMXCIX for the number 999' do
		expect(translate_number(999)).to eq "CMXCIX"
	end
	it 'produces CMXCIX for the number 1001' do
		expect(translate_number(1001)).to eq "MI"
	end

	it 'produces MCMXCIX for the number 1001' do
		expect(translate_number(1999)).to eq "MCMXCIX"
	end


	it 'produces "I", "V", "X" character set for length 1' do
		expect(character_sets(1)).to eq [["I", "V", "X"]]
	end
	it 'produces "X", "L", "C" character set for length 2' do
		expect(character_sets(2)).to eq [["X","L","C"],["I", "V", "X"]]
	end
	it 'produces "C", "D", "M" character set for length 3' do
		expect(character_sets(3)).to eq [["C", "D","M"],["X","L","C"],["I", "V", "X"]]
	end

	it 'gets a number from the user' do

	end




end