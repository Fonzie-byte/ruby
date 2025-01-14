print "A: "
origin_a = gets.to_i

print "B: "
origin_b = gets.to_i

divs_a = []
(1..(origin_a/2)).reverse_each do |n|
	if origin_a % n === 0
		divs_a.push n
	end
end

divs_b = []
(1..(origin_b/2)).reverse_each do |n|
	if origin_b % n === 0
		divs_b.push n
	end
end

divs_b.each do |n|
	if divs_a.include? n
		print "#{n} is the greatest common divisor, the ratio is "
		puts (origin_a/n).to_s << "x" << (origin_b/n).to_s
		exit
	end
end
