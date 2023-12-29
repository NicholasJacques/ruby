class Phrase
    def initialize(phrase)
        @phrase = phrase.downcase.scan(/[\w']+/).reject {|w| w == "'" || w.empty? }
    end

    def word_count
        word_counts = Hash.new(0)
        @phrase.each do |word|
            word.delete_prefix!("'")
            word.delete_suffix!("'")
            word_counts[word] += 1
        end
        word_counts
    end
end