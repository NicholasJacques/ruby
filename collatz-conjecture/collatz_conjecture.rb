module CollatzConjecture
    def self.steps(start)
        raise ArgumentError unless start > 0
        steps = 0
        n = start
        until n == 1
            steps += 1
            if n % 2 == 0
                n = n / 2
            else
                n = (n * 3) + 1
            end
        end
        return steps
    end
end