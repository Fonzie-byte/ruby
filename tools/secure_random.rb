require "securerandom"
require "base64"

length = ARGV[0] ? ARGV[0].to_i : 16

# x random bytes
source = SecureRandom.bytes(length)

# Show them, encoded in hex, base64, urlsafe base64 and decimal.
hex = source.unpack("H*")[0]
puts "HexStr " + hex
puts "Base64 " + Base64.encode64(source)
puts "Safe64 " + Base64.urlsafe_encode64(source, padding: false)
puts "Number " + hex.to_i(16).to_s

# 15.25 random bytes formatted as UUID.
puts "UUIDv4 " + SecureRandom.uuid
