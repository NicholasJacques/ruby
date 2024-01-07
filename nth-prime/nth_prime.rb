class Prime
  def initialize
    @primes = []
  end

  def self.nth(nth_prime)
    raise ArgumentError if nth_prime < 1
    new().nth(nth_prime)
  end

  def nth(nth_prime)
    (2..).each do |prime_candidate|
      if is_prime?(prime_candidate)
        @primes << prime_candidate
        return prime_candidate if @primes.size == nth_prime
      end
    end
  end

  def is_prime?(number)
    if @primes.empty?
      result = false
    end

    limit = Math.sqrt(number)
    @primes.each do |p|
      break if p > limit
      return false if number % p == 0
    end
    true
  end
end