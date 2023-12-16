class Game
    def initialize
        @frames = []
    end

    def roll(pins)
        raise BowlingError if game_already_finished?

        if @frames.empty? || current_frame.complete?
            @frames << Frame.new()
            current_frame.roll(pins)
        else
            current_frame.roll(pins)
        end
    end

    def score
        raise BowlingError if game_not_finished?

        score = 0
        @frames[0..9].each_with_index do |frame, i|
            score += frame.score
            if frame.spare?
                score += @frames[i+1].first_roll if @frames[i+1]
            end

            if frame.strike?
                if @frames[i+1].rolls.length == 2
                    score += @frames[i+1].score
                else
                    score += (@frames[i+1].score + @frames[i+2].first_roll)
                end
            end
        end

        return score
    end

    def current_frame
        @frames[-1]
    end

    def game_already_finished?
        (@frames.length >= 10 && @frames[9].complete? && !@frames[9].strike? && !@frames[9].spare?)\
        || (@frames.length >= 10 && @frames[9].spare? && @frames[10]&.first_roll) \
        || (@frames.length >= 10 && @frames[9].strike? && @frames[10..].reduce(0){ |m, f| m += f.rolls.length } == 2)
    end

    def game_not_finished?
        (@frames.length < 10) \
        || (@frames[9].strike? && @frames[10..].reduce(0){ |m, f| m += f.rolls.length } != 2) \
        || (@frames[9].spare? && @frames[10..].reduce(0){ |m, f| m += f.rolls.length } != 1)
    end


    class BowlingError < StandardError; end
end

class Frame
    attr_reader :rolls

    def initialize
        @rolls = []
    end

    def roll(pins)
        raise Game::BowlingError if pins < 0 || pins > 10
        raise Game::BowlingError if score + pins > 10
        @rolls << pins
    end

    def first_roll
        @rolls.dig(0)
    end

    def second_roll
        @rolls.dig(1)
    end

    def complete?
        strike? || @rolls.length == 2
    end

    def score
        @rolls.sum
    end

    def spare?
        @rolls.length == 2 && @rolls.sum == 10
    end

    def strike?
        first_roll == 10
    end
end