# frozen_string_literal: true

# @param {Integer} n
# @return {Integer}
# def total_n_queens(n)
#   return [] if n < 1

#   @cols = Set.new
#   @pie  = Set.new
#   @na   = Set.new
#   @n    = n

#   @count  = 0

#   dfs(0)
#   @count
# end

# def dfs(row)
#   @count += 1 and return if row == @n

#   (0...@n).each do |col|
#     next if @cols.include?(col) ||
#             @pie.include?(row + col) ||
#             @na.include?(row - col)

#     @cols.add(col)
#     @pie.add(row + col)
#     @na.add(row - col)

#     dfs(row + 1)

#     @cols.delete(col)
#     @pie.delete(row + col)
#     @na.delete(row - col)
#   end
# end

def total_n_queens(n)
  return [] if n < 1

  @count = 0
  dfs(0, 0, 0, 0, n)
  @count
end

def dfs(row, col, pie, na, n)
  @count += 1 and return if row == n

  bits = (~(col | pie | na)) & ((1 << n) - 1)
  while bits > 0 
    p = bits & -bits
    dfs(row + 1, col | p,  (pie | p) << 1, (na | p) >> 1, n)
    bits &= bits - 1
  end
end


