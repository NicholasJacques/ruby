class Anagram
    def initialize(word)
        @word = word.downcase
        @word_chars = @word.chars.sort
    end

    def match(candidates)
        candidates.select {|candidate| candidate.downcase.chars.sort == @word_chars && candidate.downcase != @word }
    end
end