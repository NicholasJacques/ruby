class ResistorColorTrio
    COLOR_VALUES = {
        'black' => 0,
        'brown' => 1,
        'red' =>   2,
        'orange' => 3,
        'yellow' => 4,
        'green' => 5,
        'blue' => 6,
        'violet' => 7,
        'grey' => 8,
        'white' => 9,
    }

    def initialize(colors)
        @value = calculate_value(colors)
    end

    def label
        "Resistor value: #{unit_adjusted_value} #{unit}"
    end

    private

    def calculate_value(colors)
        first_part = colors[0..1].sum('') {|color| COLOR_VALUES[color].to_s }
        second_part = zeros = '0' * COLOR_VALUES[colors[2]]
        (first_part + second_part).to_i
    end

    def unit
        @value >= 1000 ? 'kiloohms' : 'ohms'
    end

    def unit_adjusted_value
        unit == 'kiloohms' ? @value / 1000 : @value
    end

end