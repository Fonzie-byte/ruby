require "securerandom"

def generate_code(length = 4)
  if length < 3
    throw Exception.new("Cannot generate hashed digit-codes shorter than 3 digits.");
  end

  digits = Array.new(length - 1) { |i|
    i = SecureRandom.rand(0..9)
  }.join

  check_digit = generate_check_digit(digits)

  return digits + check_digit
end

def generate_check_digit(code = "123")
  check_digit = 0

  code.chars.each_with_index do |d, i|
    if d != "0"
      check_digit += d.to_i * (i + 1)
    end
  end

  return (check_digit%10).to_s
end

def validate_code(to_check = "1234")
  return generate_check_digit(to_check[0...-1]) === to_check[-1]
end

code = generate_code
puts code
puts validate_code(code) ? 'valid!' : 'invalid...'
