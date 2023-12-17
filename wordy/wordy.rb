require 'pry'
def is_integer?(string)
    string.to_i.to_s == string
end

class WordProblem
    OPERATIONS = {"plus" => :+, 'minus' => :-, 'multiplied' => :*, 'divided' => :/}

    def initialize(query)
        @query = query
    end

    def validate_and_parse_query
        raise ArgumentError unless @query.start_with?("What is")

        cleaned_query = @query.delete('?').gsub(" by ", " ")
        query_parts = cleaned_query.split(' ')[2..]
        query_parts.each_with_index do |part, i|
            if i.even?
                raise ArgumentError unless is_integer?(part)
                query_parts[i] = part.to_i
            else
                raise ArgumentError unless OPERATIONS.keys.include?(part)
            end
        end
        query_parts
    end


    def answer
        parsed_query = validate_and_parse_query
        result = parsed_query[0]

        parsed_query.each_with_index do |query, i|
            if OPERATIONS.keys.include?(query)
                result = result.send(OPERATIONS[query], parsed_query[i+1])
            end
        end
        result
    end
end