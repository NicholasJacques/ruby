require 'csv'

class Tournament
  def self.tally(input)
    tallied_results = Hash.new { |hash, key| hash[key] = {wins: 0, losses: 0, draws: 0, points: 0}}
    
    formatted_result = "Team                           | MP |  W |  D |  L |  P\n"
    if input.strip.empty?
      return formatted_result
    end
    
    data = CSV.parse(
      input,
      col_sep: ";",
      row_sep: "\n",
      headers: ["team_1", "team_2", "outcome"]
    )

    data.each do |row|
      case row["outcome"]
        when "win"
          tallied_results[row["team_1"]][:wins] += 1
          tallied_results[row["team_1"]][:points] += 3
          tallied_results[row["team_2"]][:losses] += 1
        when "loss"
          tallied_results[row["team_1"]][:losses] += 1
          tallied_results[row["team_2"]][:wins] += 1
        tallied_results[row["team_2"]][:points] += 3
        when "draw"
          tallied_results[row["team_1"]][:draws] += 1
          tallied_results[row["team_2"]][:draws] += 1
          tallied_results[row["team_1"]][:points] += 1
          tallied_results[row["team_2"]][:points] += 1
      end
    end

    debug tallied_results.sort_by {|k, v| [-v[:points], k]}
    
    tallied_results.sort_by {|k, v| [-v[:points], k]}.each do |team, results|
      results = tallied_results[team]
      matches_played = results[:wins] + results[:losses] + results[:draws]
      points = results[:points].to_s.rjust(3)
      
      formatted_result.concat("#{team.ljust(31)}|  #{matches_played} |  #{results[:wins]} |  #{results[:draws]} |  #{results[:losses]} |#{points}\n")  
    end

    formatted_result
  end
end