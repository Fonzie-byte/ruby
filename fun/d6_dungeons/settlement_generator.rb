require 'securerandom'

type = case SecureRandom.rand(1..6)
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
  SecureRandom.rand(1..6) * 10 + 30
when "town"
  SecureRandom.rand(1..6) * 100 + 500
when "city"
  SecureRandom.rand(1..6) * 1000 + 7000
else
  0
end

service_points = case type
when "village"
  1
when "town"
  (SecureRandom.rand(1..6) / 3.0).ceil + 2
when "city"
  (SecureRandom.rand(1..6) / 2.0).ceil + 7
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

while services.length < service_points do
  services.push case SecureRandom.rand(1..6) + SecureRandom.rand(1..6)
  when 2
    if !services.include?("fast travel")
      "fast travel"
    elsif !services.include?("a teleportation circle")
      "a teleportation circle"
    else
      next
    end
  when 3
    if !services.include?("a militia")
      "a militia"
    elsif !services.include?("barracks")
      "barracks"
    elsif !services.include?("fortifying walls")
      "fortifying walls"
    else
      next
    end
  when 4
    if services.include?("a criminal underground")
      next
    end
    "a criminal underground"
  when 5
    if services.include?("a guild hall")
      next
    end
    "a guild hall"
  when 6
    if !services.include?("a general smith")
      "a general smith"
    elsif !services.include?("a blacksmith")
      "a blacksmith"
    elsif !services.include?("a gunsmith")
      "a gunsmith"
    else
      next
    end
  when 7
    if services.include?("an inn")
      next
    end
    "an inn"
  when 8
    if !services.include?("a travelling merchant")
      "a travelling merchant"
    elsif !services.include?("the travelling merchant has some magical items")
      "the travelling merchant has some magical items"
    else
      next
    end
  when 9
    if !services.include?("a church")
      "a church"
    elsif !services.include?("the church also provides divination")
      "the church also provides divination"
    elsif !services.include?("the church also provides resurrection")
      "the church also provides resurrection"
    else
      next
    end
  when 10
    if !services.include?("a library")
      "a library"
    elsif !services.include?("the library also gives classes")
      "the library also gives classes"
    elsif !services.include?('the library also has a "forbidden" section')
      'the library also has a "forbidden" section'
    else
      next
    end
  when 11
    if !services.include?("a wizard tower")
      "a wizard tower"
    elsif !services.include?("the wizard tower has a laboratory")
      "the wizard tower has a laboratory"
    else
      next
    end
  when 12
    if services.include?("a noble house")
      next
    end
    "a noble house"
  end
end

puts "It has #{services.join(", and ")}!"
