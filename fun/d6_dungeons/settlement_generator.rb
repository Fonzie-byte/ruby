type = case rand(1..6)
when 1..3
  "village"
when 4..5
  "town"
when 6
  "city"
else
  "unknown"
end

population = case type
when "village"
  rand(1..6) * 10 + 30
when "town"
  rand(1..6) * 100 + 500
when "city"
  rand(1..6) * 1000 + 7000
else
  0
end

service_points = case type
when "village"
  1
when "town"
  (rand(1..6) / 3.0).ceil + 2
when "city"
  (rand(1..6) / 2.0).ceil + 7
else
  0
end

print "It's a #{type} with about #{population} people and #{service_points} service"
if service_points != 1 then print "s" end
puts "."

services = case type
when "town"
  ["an inn"]
when "city"
  ["an inn", "a militia", "fast travel", "a noble house"]
else   # inc. village
  Array.new
end
service_points -= services.length

service_points.times do
  services.push case rand(1..6) + rand(1..6)
  when 2
    if !services.include?("fast travel")
      "fast travel"
    else
      "a teleportation circle"
    end
  when 3
    if !services.include?("a militia")
      "a militia"
    elsif !services.include?("barracks")
      "barracks"
    else
      "fortifying walls"
    end
  when 4
    "a criminal underground"
  when 5
  	"a guild hall"
  when 6
    if !services.include?("a general smith")
      "a general smith"
    elsif !services.include?("a blacksmith")
      "a blacksmith"
    else
      "a gunsmith"
    end
  when 7
    "an inn"
  when 8
    if !services.include?("a travelling merchant")
      "a travelling merchant"
    else
      "the travelling merchant has some magical items"
    end
  when 9
    if !services.include?("a church")
      "a church"
    elsif !services.include?("the church also provides divination")
      "the church also provides divination"
    else
      "the church also provides resurrection"
    end
  when 10
    if !services.include?("a library")
      "a library"
    elsif !services.include?("the library also gives classes")
      "the library also gives classes"
    else
      'the library also has a "forbidden" section'
    end
  when 11
    if !services.include?("a wizard tower")
      "a wizard tower"
    else
      "the wizard tower has a laboratory"
    end
  when 12
    "a noble house"
  end
end

puts "It has #{services.join(", and ")}!"
