module Grains
  def self.square(num)
    raise ArgumentError if num < 1 || num > 64
    2**(num-1)
  end

  def self.total
    (1..64).sum {|s| square(s) }
  end
end