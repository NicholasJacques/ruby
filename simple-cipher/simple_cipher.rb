class Cipher
  attr_reader :key
  def initialize(key=nil)
    @key = key || "aaaaaaaaaa"
    validate_key(@key)
    @letters = ("a".."z").to_a
  end

  def encode(message)
    message.chars.map.with_index do |x, i|
      char_key = @key[i]
      offset = @letters.index(char_key)
      replacement_letter_index = (offset + @letters.index(x)) % 26
      @letters[replacement_letter_index]
    end.join()
  end

  def decode(message)
    message.chars.map.with_index do |x, i|
      char_key = @key[i]
      offset = @letters.index(char_key)
      original_letter_index = (@letters.index(x) - offset)
      @letters[original_letter_index]
    end.join()
  end

  private
  def validate_key(key)
    if key =~ /[A-Z0-9]/ || key.length == 0
      raise ArgumentError
    end
  end
end

#abcdefghij