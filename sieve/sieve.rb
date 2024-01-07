require 'set'

class Sieve
  def initialize(number)
    @number = number
  end

  def primes
    numbers = Set.new(2..@number)

    numbers.each do |n|
      (n..@number).each do |m|
        product = n * m
        break if product > @number
        numbers.delete(product)
      end
    end
    numbers.to_a
  end
end