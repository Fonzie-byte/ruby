puts "How many 5-star reviews does it have?"
five_stars = gets.chomp.to_i

puts "How many 4-star reviews does it have?"
four_stars = gets.chomp.to_i

puts "How many 3-star reviews does it have? (optional)"
three_stars = gets.chomp.to_i

puts "How many 2-star reviews does it have?"
two_stars = gets.chomp.to_i

puts "How many 1-star reviews does it have?"
one_stars = gets.chomp.to_i

score = five_stars * 2 + four_stars - two_stars - one_stars * 2

puts "It has a score of #{score}"
