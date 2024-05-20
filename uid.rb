require "securerandom"

time = Time.now.to_i.to_s(16)
rand = SecureRandom.hex(4)

puts time << rand
