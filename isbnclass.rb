

def valid_isbn?(isbn)
#if statement can be replaced by isbn.length == 10 ? true : false
	isbn = remove_invalid_characters_10(isbn)

	if valid_length_10?(isbn) && valid_10_checkdigit_math?(isbn)
		true
	else
		false
	end
end


def valid_length_10?(isbn)
	if isbn.length == 10
		true
	else
		false
	end
end


def remove_invalid_characters_10(isbn)

	isbn.gsub(/[^0-9^X]/i, "") #This strips out the invalid char

end

def valid_10_checkdigit_math?(isbn)
	
	array = isbn.chars.map!(&:to_i)


	sum = 0
	array.each_with_index do |value, index|
		break if index == 9
		sum += value * (index + 1)
	end

	checksum = sum % 11

	if checksum == 10
		checksum = "X"
	end

	checksum_string = checksum.to_s

	if checksum_string == isbn[-1].upcase
		true
	else
		false
	end

end




