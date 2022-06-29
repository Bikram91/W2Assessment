class Board
  def initialize(size)
    @size = size
    @grid = Array.new(@size) { Array.new(@size) }
  end

  def size
    @size
  end

  def [](pos)
    row = pos[0]
    col = pos[1]
    @grid[row][col]
  end

  def []=(pos, mark)
    row = pos[0]
    col = pos[1]
    @grid[row][col] = mark
  end

  def complete_row?(mark)
    @grid.each do |sub|
      if sub.all? { |ele| ele == mark }
        return true
      end
    end
    return false
  end

  def complete_col?(mark)
    new_grid = @grid.transpose
    new_grid.each do |sub|
      if sub.all? { |ele| ele == mark }
        return true
      end
    end
    return false
  end

  # def complete_col?(mark)
  #   i = 0
  #   while i < @size
  #     j = 0
  #     while j < @size
  #       if @grid[j][i] == mark
  #         j += 1
  #         next
  #       else
  #         break
  #       end
  #       j += 1
  #     end
  #     if j == @size
  #       return true
  #     end
  #     i += 1
  #   end
  #   return false
  # end

  def complete_diag?(mark)
    first = (0...@size).all? do |i|
      @grid[i][i] == mark
    end

    second = (0...@size).all? do |i|
      row = i
      col = (@size - 1) - i
      @grid[row][col] == mark
    end

    first || second
  end

  def winner?(mark)
    if complete_row?(mark)
      return true
    end
    if complete_col?(mark)
      return true
    end
    if complete_diag?(mark)
      return true
    end
    return false
  end

  # This Board#print method is given for free and does not need to be modified
  # It is used to make your game playable.
  def print
    @grid.each { |row| p row }
  end
end
