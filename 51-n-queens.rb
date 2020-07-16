# frozen_string_literal: true

# @param {Integer} n
# @return {String[][]}
# def solve_n_queens(n)
#   return [] if n < 1

#   @res  = []
#   @cols = Set.new
#   @pie  = Set.new
#   @na   = Set.new
#   @n    = n

#   dfs(0, [])
#   @res
# end

# def dfs(row, solution)
#   @res.push(to_string solution) and return if row == @n

#   (0...@n).each do |col|
#     next if @cols.include?(col) ||
#             @pie.include?(row + col) ||
#             @na.include?(row - col)

#     @cols.add(col)
#     @pie.add(row + col)
#     @na.add(row - col)

#     dfs(row + 1, solution + [col])

#     @cols.delete(col)
#     @pie.delete(row + col)
#     @na.delete(row - col)
#   end
# end

# def to_string(solution)
#   res = []
#   solution.each do |col|
#     str = '.' * @n
#     str[col] = 'Q'
#     res.push str
#   end
#   res
# end

def solve_n_queens(n)
  return [] if n < 1

  @res = []
  dfs(0, 0, 0, 0, n, [])
  @res
end

def dfs(row, col, pie, na, n, solution)
  @res.push(to_string(solution, n)) and return if row == n

  bits = (~(col | pie | na)) & ((1 << n) - 1)
  while bits > 0
    p = bits & -bits
    dfs(row + 1, col | p, (pie | p) << 1, (na | p) >> 1, n, solution + [p])
    bits &= bits - 1
  end
end

def to_string(solution, n)
  res = []
  solution.each do |s|
    i = 0
    str = '.' * n
    while (s & 1) != 1
      i += 1
      s = s >> 1
    end
    str[i] = 'Q'
    res.push str
  end
  res
end

p solve_n_queens(4)
