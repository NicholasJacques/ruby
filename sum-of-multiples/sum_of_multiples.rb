require 'set'

class SumOfMultiples
  def initialize(*items)
    @items = items
  end

  def to(level)
    multiples = Set.new

    @items.each do |item|
      next if item == 0
      multiples += (0...level).select {|level| level % item == 0}
    end
    multiples.sum
  end
end


