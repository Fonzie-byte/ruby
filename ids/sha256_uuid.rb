require "digest"
require "securerandom"

date_time_notation = Time.now.to_s
twelve_random_bytes = SecureRandom.hex(12)

sha256_hash = Digest::SHA256.hexdigest(date_time_notation + twelve_random_bytes)

uuid_v8 = sha256_hash[-30..-1]

uuid_v8.insert(8, "-")
uuid_v8.insert(13, "-8")
rfc = SecureRandom.random_number(8..11).to_s(16)
uuid_v8.insert(18, "-" + rfc)
uuid_v8.insert(23, "-")

puts uuid_v8
