module PerfectNumber
  def self.classify(number)
    raise if number <= 0

    sum_of_factors = (1...number).reduce do |sum, n|
      if number % n == 0
        sum += n
      end
      sum
    end
    case
      when sum_of_factors == number
        'perfect'
      when sum_of_factors < number
        'deficient'
      else
        'abundant'
    end
  end
end