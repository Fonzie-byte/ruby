# HP, Str, Int, Agi, Spd and Luk start at 4
# Roll 1..stat_total
# Assign 1 to that stat
# Remove stat from pool if already 12
# Do this 24 times

$base_score = 4
$max_score = 12
$rolls = 24
$debug = false

$stat_names = [
	"Health",
	"Strength",
	"Intelligence",
	"Agility",
	"Speed ",
	"Luck  ",
]
stat_count = $stat_names.length
$stats = Array.new(stat_count, $base_score)
$stat_total = stat_count * $base_score

def debugLog(line)
	if $debug
		puts line
	end
end

def assignStat(roll)
	debugLog "\nAssigning based off roll #{roll}"
	current_count = 0

	$stats.each_with_index do |score, index|

		if score < $max_score
			debugLog "Checking #{$stat_names[index]}"

			current_count += score
			debugLog "Current count: #{current_count}"

			if roll <= current_count
				$stats[index] += 1
				debugLog "Raised #{$stat_names[index]} to #{$stats[index]}"
				return
			else
				debugLog "Rolled too high, trying next stat."
			end
		else
			debugLog "#{$stat_names[index]} already maxed, skipping"
		end
	end
end

def countPool()
	debugLog "\nCounting pool"
	new_total = 0

	$stats.each do |score|
		debugLog "Score: #{score}"
		if score < $max_score
			new_total += score
			debugLog "Current total: #{new_total}"
		else
			debugLog "Skipping, score is already MAX."
		end
	end

	debugLog "New total: #{new_total}"

	return new_total
end

$rolls.times do
	new_point = rand(1..$stat_total)

	assignStat(new_point)

	$stat_total = countPool()
end

debugLog "\n"

debugLog $low = $base_score + ($max_score - $base_score) / 3.0
debugLog $mid = $base_score + ($max_score - $base_score) * 2 / 3.0

stat_count.times do |index|
	rating = $stats[index] < $low ? '(LOW)'
		: $stats[index] < $mid ? '{MID}'
			: '<HIGH>'
	puts "#{$stat_names[index]} :\t#{$stats[index]}\t#{rating}"
end

# Choose 1-3:
# 1 :	Raise MAX by 2, assign 8 extra points.
# 2 :	Raise MAX by 1, assign 4 extra points, choose a skill prioritising
#    	skills that scale off a high stat.
# 3 :	Choose two skills prioritising skills that scale off a high stat.
