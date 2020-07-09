# frozen_string_literal: true

# @param {Integer} n
# @return {String[][]}
def solve_n_queens(n)
  return [] if n < 1

  @res  = []
  @cols = Set.new
  @pie  = Set.new
  @na   = Set.new
  @n    = n 

  dfs(0, [])
  @res
end

def dfs(row, solution)
  @res.push(to_string solution) and return if row == @n

  (0...@n).each do |col|
    next if @cols.include?(col) ||
            @pie.include?(row + col) ||
            @na.include?(row - col)

    @cols.add(col)
    @pie.add(row + col)
    @na.add(row - col)

    dfs(row + 1, solution + [col])

    @cols.delete(col)
    @pie.delete(row + col)
    @na.delete(row - col)
  end
end

def to_string(solution)
  res = []
  solution.each do |col|
    str = '.' * @n
    str[col] = 'Q'
    res.push str
  end
  res
end
