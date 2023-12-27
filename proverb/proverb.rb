class Proverb
    STANZA = "For want of a %s the %s was lost.\n"
    LAST_LINE = "And all for the want of a %{qualifier}%{last_item}."

    def initialize(*args, qualifier: nil)
        @words = args
        @qualifier = qualifier ? qualifier + ' ' : nil
    end

    def to_s
        @words[0..-2].map.with_index do |word, i|
            STANZA % [word ,@words[i + 1]]
        end.join() + LAST_LINE % {last_item: @words[0], qualifier: @qualifier}
    end
end