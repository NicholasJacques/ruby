module IsbnVerifier
    def self.valid?(isbn)
        isbn.delete!('-')
        if isbn.slice(/[a-zA-Z&&[^X]+]/)
            return false
        end
        elements = isbn.split('')

        if elements[-1] == 'X'
            elements[-1] = '10'
        end

        if elements.length != 10
            return false
        end

        sum = 0
        multiplier = 10
        elements.each_with_index do |e, i|
            sum += e.to_i * (multiplier - i)
        end
        sum % 11 == 0
    end
end