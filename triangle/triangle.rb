class Triangle
    def initialize(dimensions)
        @dimensions = dimensions
    end

    def equilateral?
        return false if !valid_triangle?
        @dimensions.uniq.size == 1
    end

    def isosceles?
        return false if !valid_triangle?
        @dimensions.uniq.size <= 2
    end

    def scalene?
        return false if !valid_triangle?
        @dimensions.uniq.size == 3
    end

    def valid_triangle?
        ( @dimensions.sort[2] < @dimensions.sort[0..1].sum ) \
        && ( !@dimensions.include?(0) )
    end
end