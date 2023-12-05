class Array
  def all_possibilities(from = 1, to = length)
    (from..to).flat_map do |i|
      if i < length
        permutation(i).to_a
      else
        permutation(to - i).flat_map do |e|
          (self + e).permutation.to_a
        end
      end
    end.uniq.map(&:join)
  end
end

if !ARGV[0].nil?
  puts ARGV[0].chars.all_possibilities
else
  puts ["A", "B", "X", "Y", "L", "R"].all_possibilities(2, 3)
end
