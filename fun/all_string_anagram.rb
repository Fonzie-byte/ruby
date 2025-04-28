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
  from = (ARGV[1] || "1").to_i
  to = (ARGV[2] || ARGV[0].length.to_s).to_i
  puts ARGV[0].chars.all_possibilities(from, to)
else
  puts ["A", "B", "X", "Y", "L", "R"].all_possibilities(2, 3)
end
