module ArmstrongNumbers
  def self.include?(number)
    digits = number.digits
    digits_length = digits.length
    digits.reduce(0) {|sum, num| sum + num**digits_length } == number
  end
end
