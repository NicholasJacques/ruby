module RunLengthEncoding
    def self.encode(input)
        result = []
        char_count = 0
        input.each_char.with_index do |char, i|
            if input[i+1] != char
                char_count += 1
                if char_count == 1
                    result << char
                else
                    result << char_count.to_s + char
                end
                char_count = 0
            else
                char_count += 1
            end
        end
        result.join
    end

    def self.decode(input)
        result = []
        current_count = ''
        input.each_char.with_index do |char, i|
            if char.match?(/[[:digit:]]/)
                current_count += char
            else
                if current_count.empty?
                    result << char
                else
                    result << char * current_count.to_i
                    current_count = ''
                end
            end
        end
        result.join
    end
end