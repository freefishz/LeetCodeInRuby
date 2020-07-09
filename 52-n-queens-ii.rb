# @param {Integer} n
# @return {Integer}
def total_n_queens(n)
  return [] if n < 1

  @cols = Set.new
  @pie  = Set.new
  @na   = Set.new
  @n    = n 

  @count  = 0

  dfs(0)
  @count
end

def dfs(row)
  @count += 1 and return if row == @n

  (0...@n).each do |col|
    next if @cols.include?(col) ||
            @pie.include?(row + col) ||
            @na.include?(row - col)

    @cols.add(col)
    @pie.add(row + col)
    @na.add(row - col)

    dfs(row + 1)

    @cols.delete(col)
    @pie.delete(row + col)
    @na.delete(row - col)
  end
end
  
  