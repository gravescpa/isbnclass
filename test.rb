array10 = "877195869X".chars.map!(&:to_i)


	sum = 0
	array10.each.with_index do |value, index|
		break if index == 9
		sum += value * (index + 1)
	end
puts sum
	checksum = sum % 11
	puts checksum
	if checksum == 10
		checksum = "X"
	end
puts checksum
puts checksum.class
puts isbn[-1]
	#checksum_string = checksum.to_s

	if checksum == isbn[-1]
		true
	else
		false
	end

	puts checksum
	#puts checksum_string
	puts array10[-1]
	puts isbn