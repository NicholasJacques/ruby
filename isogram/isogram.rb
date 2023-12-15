class Isogram
  def self.isogram?(input)
    seen_letters = Set.new
    input.gsub(/\W/, '').chars.each do |char|
      char = char.downcase
      if seen_letters.include?(char)
        return false
      else
        seen_letters << char
      end
    end
    return true
  end
end