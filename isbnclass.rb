def valid_isbn?(isbn)
	isbn = remove_spaces(isbn)
	isbn = remove_dashes(isbn)
	if valid_length_10?(isbn) && valid_10_checkdigit_math?(isbn)
		true
	elsif valid_length_13?(isbn) && valid_13_checkdigit_math?(isbn)
		true
	else
		false
	end
end

def valid_length_10?(isbn)
	isbn.length == 10
end

def valid_length_13?(isbn)
	isbn.length == 13
end

def remove_spaces(isbn)
	isbn.gsub(" ", "")
end

def remove_dashes(isbn)
	isbn.gsub("-", "")
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

def valid_13_checkdigit_math?(isbn)
	array13 = isbn.chars.map!(&:to_i)
	sum13 = 0
	array13.each_with_index do |value, index|
		break if index == 12
			if index % 2 == 0
				sum13 += value * 1
			else
				sum13 += value * 3
			end
		end
	#end
	check_sum = sum13 % 10
	check_sum1 = 10 - check_sum
	check_sum2 = check_sum1 % 10
	check_sum_string = check_sum2.to_s
	if check_sum_string == isbn[-1]
		true
	else
		false
	end
end





