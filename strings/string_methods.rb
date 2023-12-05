require 'securerandom'

class String
  def self.random(length = 16)
    (0...length).map { SecureRandom.rand(32...127).chr }.join
  end

  def sort
    self.chars.sort.join
  end

  def sorted?
    self === self.sort
  end

  def shuffle
    self.chars.shuffle.join
  end

  def randomise(length = 16)
    (0...length).map { self.chars.sample }.join
  end
end
