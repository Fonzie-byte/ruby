puts 'Example dice input: d8+2d6 becomes "8 6 6"'
print 'What are your dice? '
dice = gets.chomp.split(' ').map { |die| die.to_i }

print "What's the target number? "
target = gets.chomp.to_i

fail_chances = []
dice.each do |die|
	if target >= die.to_i
		dice.delete_at(dice.index(die))
	else
		fail_chances.push(target.to_f / die.to_f)
	end
end

probability = ((1 - fail_chances.inject(:*)) * 100).round(2)

puts "You have #{probability}\% chance to succeed."
