class AnyBaseConverter
  def self.divisionWithRemainder(dividend, divisor)
    division = dividend / divisor
    remainder = dividend % divisor

    return [division, remainder]
  end

  def self.numberToAlphabet(original_number, alphabet)
    new_base = alphabet.length
    if original_number >= new_base
      throw "Passed #{original_number} and an alphabet of #{new_base} characters. Must pass a number smaller than the new base!"
    end

    return alphabet[original_number%new_base]
  end

  def self.convert(original_number, alphabet = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz')
    if original_number === 0
      return alphabet[0]
    elsif original_number < 0
        return ''
    end

    result = ""
    base = alphabet.length

    current_number = original_number
    while current_number > 0
      calc = divisionWithRemainder(current_number, base)
      result = numberToAlphabet(calc[1], alphabet) + result
      current_number = calc[0]
    end

    return result
  end
end
