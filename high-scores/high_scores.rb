class HighScores
    attr_reader :scores

    def initialize(scores)
        @scores = scores
        @sorted = scores.sort.reverse
    end

    def latest
        @scores.last
    end

    def personal_best
        @sorted[0]
    end

    def personal_top_three
        @sorted[0..2]
    end

    def latest_is_personal_best?
        personal_best == latest
    end
end
