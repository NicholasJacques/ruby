module Pangram
  def self.pangram?(sentence)
    result = ('a'..'z').to_a.join.delete(sentence.downcase)
    return result.length < 1
  end
end