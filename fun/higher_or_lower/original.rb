level = 1

while true
  chances = 9 - level

  min = 1
  max = 100
  secret_number = rand(min..max)
  guess = -1

  puts "Round #{level}"
  puts "I have a number of minimal #{min} and maximum #{max} in mind, you have #{chances} chances to guess it..!"

  while guess != secret_number && chances > 0
    puts "You have #{chances} chances left, which number do you guess?"

    guess = gets.to_i

    if guess == secret_number
      puts "You got it right! The number was indeed #{secret_number}!"
      level += 1

      puts
    elsif secret_number > guess
      chances -= 1
      puts "Unfortunately, the number is HIGHER than #{guess}."

      puts
    else  #secret_number < guess
      chances -= 1
      puts "Unfortunately, the number is LOWER than #{guess}."

      puts
    end
  end

  if guess != secret_number && chances <= 0
    puts "The number was #{secret_number}. You made it to Lv. #{level}!"
    exit
  end
end
