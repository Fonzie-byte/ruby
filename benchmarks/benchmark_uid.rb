require 'Benchmark'
require 'SecureRandom'

def uid()
  decTime = Time.now.to_i
  hexTime = decTime.to_s(16)

  random = SecureRandom.hex(4)

  return hexTime << random
end

Benchmark.bm(7) do |x|
  x.report("100 000 uids:") { 100_000.times { uid } }
end
