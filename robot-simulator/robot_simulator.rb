class Robot
    BEARINGS = {
        north: {right: :east, left: :west},
        east:  {right: :south, left: :north},
        south: {right: :west, left: :east},
        west: {right: :north, left: :south},
    }

    attr_reader :bearing
    def initialize()
        @bearing = nil
        @x_coordinate = nil
        @y_coordinate = nil
    end

    def orient(direction)
        raise ArgumentError unless BEARINGS.keys.include?(direction)
        @bearing = direction
    end

    def turn_right
        @bearing = BEARINGS[@bearing][:right]
    end

    def turn_left
        @bearing = BEARINGS[@bearing][:left]
    end

    def at(x, y)
        @x_coordinate = x
        @y_coordinate = y
    end

    def coordinates
        [@x_coordinate, @y_coordinate]
    end

    def advance
        case @bearing
        when :north
            @y_coordinate += 1
        when :south
            @y_coordinate -= 1
        when :east
            @x_coordinate += 1
        when :west
            @x_coordinate -= 1
        end
    end
    
end

class Simulator
    COMMANDS = {
        'R' => :turn_right,
        'L' => :turn_left,
        'A' => :advance,
    }

    def evaluate(robot, directions)
        instructions(directions).each do |direction|
            robot.send(direction)
        end
    end

    def place(robot, **kwargs)
        robot.orient(kwargs[:direction])
        robot.at(kwargs[:x], kwargs[:y])
    end

    def instructions(command_string)
        command_string.split('').map {|command| COMMANDS[command] }
    end

end
