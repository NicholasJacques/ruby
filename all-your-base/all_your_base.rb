module BaseConverter
    def self.convert(input_base, digits, output_base)
        raise ArgumentError if input_base <= 1 || output_base <= 1
        return [0] if digits.empty?

        value = get_base_ten_value(input_base, digits)
        value == 0 ? [0] : convert_to_output_base(value, output_base)
    end

    private

    def self.get_base_ten_value(input_base, digits)
        digits.reverse.each_with_index.reduce(0) do |memo, (element, index)|
            raise ArgumentError if element < 0 || element >= input_base
            memo += element * input_base**index
        end
    end

    def self.convert_to_output_base(base_ten_value, output_base)
        quotient = base_ten_value
        result = []
        until quotient == 0
            result.prepend(quotient % output_base)
            quotient = quotient / output_base
        end
        return result
    end
end