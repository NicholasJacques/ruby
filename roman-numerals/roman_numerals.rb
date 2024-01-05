class Integer
  ROMAN_NUMERAL_SYMBOLS = %w(I V X L C D M)

  def to_roman
    # return ROMAN_NUMERALS[self] if ROMAN_NUMERALS[self]

    result = []
    current_magnitude = 0
    self.digits.each do |digit|
      if (1..3).include?(digit)
        result << ROMAN_NUMERAL_SYMBOLS[current_magnitude] * digit
      elsif digit == 4
        result << ROMAN_NUMERAL_SYMBOLS[current_magnitude] + ROMAN_NUMERAL_SYMBOLS[current_magnitude + 1]
      elsif digit == 5
        result << ROMAN_NUMERAL_SYMBOLS[current_magnitude + 1]
      elsif (6..8).include?(digit)
        result << ROMAN_NUMERAL_SYMBOLS[current_magnitude + 1] + ROMAN_NUMERAL_SYMBOLS[current_magnitude] * (digit - 5)
      elsif digit == 9
        result << ROMAN_NUMERAL_SYMBOLS[current_magnitude] + ROMAN_NUMERAL_SYMBOLS[current_magnitude + 2]
      end
      current_magnitude += 2
    end
    result.reverse.join
  end
end