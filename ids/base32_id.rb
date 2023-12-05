# Enough precision, while keeping it at a manageable low number.
hour32 = (Time.now.to_i/3600)
  .to_s(32)
# No generating the same ID in the same hour.
rand32 = rand(32**4)
  .to_s(32)
  .rjust(4, "0")

# No conflicting characters (I1, O0, L1 and U to avoid obscenity)
hour32 = hour32.tr("abcdefghijklmnopqrstuv", "ABCDEFGHJKMNPQRSTVWXYZ")
rand32 = rand32.tr("abcdefghijklmnopqrstuv", "ABCDEFGHJKMNPQRSTVWXYZ")

# Show what we made, with a hyphen in between fo extra legibility!
splitter = ARGV[0] || "-"
puts "#{hour32}#{splitter}#{rand32}"
