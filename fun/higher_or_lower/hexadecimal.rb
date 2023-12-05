level = 1

def to_hex(decimal)
  hex = decimal.to_s(16)
  hex = hex.upcase

  return hex
end

def to_decimal(hex)
  hex = hex.downcase
  decimal = hex.to_i(16)

  return decimal
end

while true
  chances = 12 - level

  min = 1
  max = 256
  secret_number = rand(min..max)
  guess = -1

  puts "Round #{level}"
  puts "I have a number of minimal #{to_hex(min)} and maximum #{to_hex(max)} in mind, you have #{to_hex(chances)} chances to guess it..!"

  while guess != secret_number && chances > 0
    puts "You have #{to_hex(chances)} chances left, which number do you guess?"

    guess = to_decimal(gets)

    if guess == secret_number
      puts "You got it right! The number was indeed #{to_hex(secret_number)}!"
      level += 1

      puts
    elsif secret_number > guess
      chances -= 1
      puts "Unfortunately, the number is HIGHER than #{to_hex(guess)}."

      puts
    else  #secret_number < guess
      chances -= 1
      puts "Unfortunately, the number is LOWER than #{to_hex(guess)}."

      puts
    end
  end

  if guess != secret_number && chances <= 0
    puts "The number was #{to_hex(secret_number)}. You made it to Lv. #{level}!"
    exit
  end
end
