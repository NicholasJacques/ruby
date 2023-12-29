class Minesweeper

  def self.annotate(rows)
    rows.map.with_index do |row, i|
      new_row = ''
      row.each_char.with_index do |char, j|
        if char == '*'
          new_row << char
          next
        end
        neighbors = 0
        # west
        if j != 0 && row[j-1] == '*'
          neighbors += 1
        end
        # east
        if row[j+1] ==  '*'
          neighbors += 1
        end
        # north
        if i != 0
          # north-north
          if rows[i-1][j] == '*'
            neighbors +=1
          end
          #northwest
          if j != 0 && rows[i-1][j-1] == '*'
            neighbors +=1
          end
          #northeast
          if rows[i-1][j+1] == '*'
            neighbors += 1
          end 
        end
        # south
        if rows[i+1]
          # south-south
          if rows[i+1][j] == '*'
            neighbors += 1
          end
          # southwest
          if j != 0 && rows[i+1][j-1] == '*'
            neighbors += 1
          end
          #southeast
          if rows[i+1][j+1] == '*'
            neighbors += 1
          end
        end
        neighbors > 0 ? new_row << neighbors.to_s : new_row << ' '
      end
      new_row
    end
  end
end
