class Matrix
    def initialize(data)
        @matrix = build_matrix(data)
    end

    def build_matrix(data)
        data.each_line(chomp: true).map {|line| line.split.map(&:to_i)}
    end

    def row(position)
        @matrix[position - 1]

    end

    def column(position)
        @matrix.map {|row| row[position-1]}
    end
end
