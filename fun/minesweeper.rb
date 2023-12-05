# Heavy WiP, not functional, at all!

arr = []

# Populate mine field
(0...10).each { |row|
  arr.push([])
  (0...10).each {
    if rand(1..10) === 10
      arr[row].push(1)
    else
      arr[row].push(0)
    end
  }
}

# Mark our spot
current = [1, 1]

# Todo: Count only the mines around the marked spot
count_mines = 0
arr.each { |row|
  row.each { |cell|
    if cell === 1
      count_mines += 1
    end
  }
}

# For debugging; what's our field like?
p arr

puts

# Let's see if we get it right!
puts "There are #{count_mines} mines around me."
