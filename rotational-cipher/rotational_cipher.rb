class RotationalCipher
  LOWER_ALPHABET = [*('a'..'z')]
  UPPER_ALPHABET = [*('A'..'Z')]
  
  def self.rotate(message, shift)
    result = message.gsub(/[a-zA-Z]/) do |match|
      LOWER_ALPHABET.include?(match) ? shift_char(match, shift, LOWER_ALPHABET) : shift_char(match, shift, UPPER_ALPHABET)
    end
    result
  end

  private
  def self.shift_char(char, shift, alphabet)
    alphabet[(alphabet.index(char) + shift) % 26]
  end
end