module Transpose
  def self.transpose(input)
    rows = input.split("\n")
    result = []
    rows.each_with_index do |row, y|
      row.chars.each_with_index do |char, x|
        result << "" if !result[x]
        y.times {|i| result[x] << " " if result[x][i].nil?}
        result[x] << char
      end
    end
    return result.join("\n")
  end
end