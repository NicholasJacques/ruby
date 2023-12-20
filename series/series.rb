class Series
    def initialize(numbers)
        @numbers = numbers
    end

    def slices(length)
        raise ArgumentError if length > @numbers.size || length <= 0

        result = []
        @numbers.each_char.with_index do |e, i|
            if i+length <= @numbers.size
                result << @numbers[i...i+length]
            else
                break
            end
        end
        result
    end
end

class SeriesTwo
    def initialize(series)
        @series = series
    end

    def slices(size)
        raise ArgumentError if size > @series.length
        @series.chars.each_cons(size).map(&:join)
    end
end