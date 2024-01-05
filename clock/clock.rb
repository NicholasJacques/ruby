class Clock
  attr_reader :hour, :minute
  def initialize(hour: 0, minute: 0)
    @hour = hour
    @minute = minute
  end

  def current_time
    hour = (@hour + (@minute / 60)) % 24
    minute = @minute % 60
    [hour, minute]
  end

  def to_s
    hour, minute = current_time
    "%02<hour>i:%02<minute>i" % {hour: hour, minute: minute}
  end

  def +(other)
    Clock.new(hour: @hour + other.hour, minute: @minute + other.minute)
  end

  def -(other)
    Clock.new(hour: @hour - other.hour, minute: @minute - other.minute)
  end

  def ==(other)
    current_time == other.current_time
  end
end