# https://codegolf.stackexchange.com/questions/254821/rarity-of-a-string

def rarity(input)
  score = 0
  input.chars.each { |c|
    case c
    when /[eato]/
      score -= 3
    when /[insh]/
      score -= 2
    when /[rdlc]/
      score -=1
    when /[mu]/
      score += 0
    when /[wfgy]/
      score += 1
    when /[kvbp]/
      score += 2
    when /[jqxz]/
      score += 3
    end
  }

  return "#{input}: #{score}"
end

puts rarity "rarity"
puts rarity "aardvark"
puts rarity "quine"
puts rarity "wow"
puts rarity "why"
puts rarity "puppy"
