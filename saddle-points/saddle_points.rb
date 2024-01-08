module Grid
  def self.saddle_points(grid)
    columns = grid.transpose
    result = []
    grid.each_with_index do |row, y|
      tallest_tree_in_row = row.max
      row.each_with_index do |tree, x|
        shortest_in_column = columns[x].min
        result << {"row" => y+1, "column" => x+1} if (tree == tallest_tree_in_row && tree == shortest_in_column)
      end
    end
    result
  end
end