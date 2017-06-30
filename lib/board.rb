class Board
attr_reader :grid

  def initialize(grid = Array.new(3) { Array.new(3) })
    # if grid
      @grid = grid
    # else
    #   @grid = [[nil, nil, nil],[nil, nil, nil],[nil,nil,nil]]
    # end
  end

  def grid
    @grid
  end

  def place_mark(pos, mark)
      i, j = pos
      @grid[i][j] = mark
  end

  def empty?(pos)
    i, j = pos
    @grid[i][j].nil?
  end

  def winner
    @grid.each do |row|
      if row.all? {|el| el == row.first}
        return row.first
      end
    end

    if left_diag
      return @grid[0][0]
    end

    if right_diag
      return @grid.reverse[0][0]
    end

    columns.each do |column|
      if column.all? {|el| el == column.first && el != nil}
        return column.first
      end
    end

    nil
  end

  def over?
    winner || @grid.flatten.all? {|el| el != nil}
  end

  def columns
    columns = []
    @grid.length.times do
      columns << []
    end
    @grid.each do |row|
      row.each_with_index do |el, idx|
        columns[idx] << el
      end
    end
    columns
  end

  def left_diag
    result = false
    x, y = 0, 0
    @grid.each_with_index do |row, idx|
      if row[idx] == @grid[0][0]
        if x + 1 == idx && y + 1 == idx
          x, y = idx, idx
          result = true
        end
      else
        result = false
        break
      end
    end
    result
  end

  def right_diag
    result = false
    x, y = 0, 0
    @grid.reverse.each_with_index do |row, idx|
      if row[idx] == @grid.reverse[0][0]
        if x + 1 == idx && y + 1 == idx
          x, y = idx, idx
          result = true
        end
      else
        result = false
        break
      end
    end
    result
  end

  def board
    @grid
  end

  def [](pos)
    grid[pos.first][pos.last]
  end

  # def []=(pos, mark)
  #   @grid[pos[0]][pos[1]] = mark
  # end

  def []=(pos, move)
    @grid[pos[0]][pos[1]] = move
  end

end
