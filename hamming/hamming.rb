class Hamming
  def self.compute(str1, str2)
    if str1.length != str2.length
      raise ArgumentError
    end
    
    differences = 0
    str2_chars = str2.chars
    str1.chars.each.with_index do |char, i|
      debug "#{char} - #{i}"
      if char != str2_chars[i]
        differences += 1
      end
    end
    differences
  end
end