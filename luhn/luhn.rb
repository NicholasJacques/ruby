class Luhn
  def self.valid?(subject)
    subject.gsub!(/\s+/, "")
    
    if subject.length < 2 or subject.match?(/[\D]/)
      return false
    end

    sum = subject.chars.reverse.each_with_index.reduce(0) do |sum, (number, index)|
      digit = number.to_i

      if index.odd?
        digit = digit * 2
        if digit > 9
          digit = digit - 9
        end
      end

      digit + sum
    end

    sum % 10 == 0
  end
end