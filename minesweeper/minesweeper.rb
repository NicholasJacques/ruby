class Minesweeper
  def initialize(rows)
    @map = rows
  end

  def self.annotate(rows)
    new(rows).annotate
  end

  POSITIONS = [
    :north_of,
    :south_of,
    :east_of,
    :west_of,
    :northeast_of,
    :northwest_of,
    :southeast_of, 
    :southwest_of
  ]

  def annotate
    @map.map.with_index do |row, y|
      new_row = ''
      row.each_char.with_index do |char, x|
        if is_bomb?(char)
          new_row << char
          next
        end
        neighbors = POSITIONS.count {|position| is_bomb?(send(position, x, y))}
        neighbors > 0 ? new_row << neighbors.to_s : new_row << ' '
      end
      new_row
    end
  end

  def west_of(x, y)
    if x != 0
      @map[y][x-1]
    end
  end

  def east_of(x, y)
    @map[y][x+1]
  end

  def north_of(x, y)
    if @map[y-1] && y != 0
      @map[y-1][x]
    end
  end

  def south_of(x, y)
    if @map[y+1]
      @map[y+1][x]
    end
  end

  def northeast_of(x, y)
    if @map[y-1] && y != 0
      @map[y-1][x+1]
    end
  end

  def northwest_of(x, y)
    if @map[y-1] && x != 0 && y != 0
      @map[y-1][x-1]
    end
  end

  def southeast_of(x, y)
    if @map[y+1]
      @map[y+1][x+1]
    end
  end

  def southwest_of(x, y)
    if @map[y+1] && x != 0
      @map[y+1][x-1]
    end
  end

  def is_bomb?(char)
    char == '*'
  end

end
