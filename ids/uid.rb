require 'SecureRandom'

# Time in hex, which is 8 characters.
hex_time = Time.
  now.
  to_i.
  to_s(16)

# 4 random bytes in hex, which is 8 characters.
hex_random = SecureRandom.hex(4)

# Put them together and show!
puts hex_time << hex_random
