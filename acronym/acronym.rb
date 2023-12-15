module Acronym
  def self.abbreviate(input)
    input.scan(/\b\w/).join().upcase
  end
end