require 'digest'
require 'securerandom'

time_now = Time.now
nanosecond_time = time_now.strftime('%s') << time_now.nsec.to_s
random_bytes = SecureRandom.hex(16)

# Show a hash based off nanosecond time and 128 bits of random.
puts Digest::SHA512.hexdigest(nanosecond_time << random_bytes)
