module Bob
    def self.hey(remark)
        remark = remark.strip
        if remark.empty?
            "Fine. Be that way!"
        elsif is_question?(remark) && is_shout?(remark)
            "Calm down, I know what I'm doing!"
        elsif is_question?(remark)
            "Sure."
        elsif is_shout?(remark)
            "Whoa, chill out!"
        else
            "Whatever."
        end
    end

    def self.is_question?(remark)
        remark.end_with?('?')
    end

    def self.is_shout?(remark)
        remark.upcase == remark && remark.count("a-zA-Z") > 0
    end

end