level = 1

def to_dozenal(dec)
  doz = dec.to_s(12)
  doz.sub!("a", "X")
  doz.sub!("b", "N")

  return doz
end

def to_decimal(doz)
  doz.upcase!
  doz.sub!("X", "a")
  doz.sub!("N", "b")
  decimal = doz.to_i(12)

  return decimal
end

while true
  chances = 11 - level

  min = 1
  max = 144
  secret_number = rand(min..max)
  guess = -1

  puts "Round #{level}"
  puts "I have a number of minimal #{to_dozenal(min)} and maximum #{to_dozenal(max)} in mind, you have #{to_dozenal(chances)} chances to guess it..!"

  while guess != secret_number && chances > 0
    puts "You have #{to_dozenal(chances)} chances left, which number do you guess?"

    guess = to_decimal(gets)

    if guess == secret_number
      puts "You got it right! The number was indeed #{to_dozenal(secret_number)}!"
      level += 1

      puts
    elsif secret_number > guess
      chances -= 1
      puts "Unfortunately, the number is HIGHER than #{to_dozenal(guess)}."

      puts
    else  #secret_number < guess
      chances -= 1
      puts "Unfortunately, the number is LOWER than #{to_dozenal(guess)}."

      puts
    end
  end

  if guess != secret_number && chances <= 0
    puts "The number was #{to_dozenal(secret_number)}. You made it to Lv. #{level}!"
    exit
  end
end
