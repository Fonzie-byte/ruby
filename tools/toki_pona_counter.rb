nanpa = ARGV[0].to_i
toki = []

if ARGV.length == 0 or nanpa < 0 then
  puts "o pana e nanpa ala anu nanpa suli pona"
  puts "(Please pass zero or a positive integer)"
  exit
end

if nanpa == 0 then
  puts "nanpa ala"
  exit
end

while nanpa >= 100 do
  nanpa -= 100
  toki.push("ale")
end

while nanpa >= 20 do
  nanpa -= 20
  toki.push("mute")
end

while nanpa >= 5 do
  nanpa -= 5
  toki.push("luka")
end

while nanpa >= 2 do
  nanpa -= 2
  toki.push("tu")
end

nanpa.times do
  toki.push("wan")
end

puts toki.join(' ')
