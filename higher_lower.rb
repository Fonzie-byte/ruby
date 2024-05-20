require 'securerandom'

@round = @chances = @secret_number = 0

def newRound()
	@round = @round + 1
	@chances = 9 - @round
	@secret_number = SecureRandom.rand(1..100)

	puts "Round ##{@round}"
	puts "Try to guess the secret number between 1 and 100 within #{@chances} tries!\n\n"
end

newRound

while @chances > 0 do
	print "#{@chances} chances left, what is your guess? "
	guess = gets.chomp.to_i

	if @secret_number > guess
		puts 'The secret number is higher...'
		@chances = @chances - 1
	elsif @secret_number < guess
		puts 'The secret number is lower...'
		@chances = @chances - 1
	else
		puts "\nYou got it!\n"
		newRound
	end
end

puts "Too bad, it was #{@secret_number}..."
puts "You got to round #{@round}!"
