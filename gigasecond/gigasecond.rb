module Gigasecond
  GIGASECOND = 1000000000

  def self.from(time)
    time + GIGASECOND
  end
end