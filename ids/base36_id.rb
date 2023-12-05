require "securerandom"

print Time.now.to_i.to_s(36) + "-"

puts SecureRandom.rand(0..36**6).to_s(36)
