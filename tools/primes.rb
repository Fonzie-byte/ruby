min = ARGV[0] ? ARGV[0].to_i : 90
max = ARGV[1] ? ARGV[1].to_i : 110
dif = max - min

primes = []
dif.times do |i|
  c = i + min

  div = false
  Math.sqrt(c).to_i.times do |ii|
    cc = ii + 2

    if c%cc === 0
      div = true
    end
  end

  if !div
    primes.push(c)
  end
end

puts "The primes of #{min} untill #{max} are:"
puts primes
