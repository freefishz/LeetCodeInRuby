# frozen_string_literal: true

# @param {Integer[][]} triangle
# @return {Integer}
def minimum_total(triangle)
  return triangle.first.min if triangle.size == 1
  mini = triangle.last

  (triangle.size - 2).downto(0).each do |row|
    (0...triangle[row].size).each do |col|
      mini[col] = triangle[row][col] + [mini[col], mini[col + 1]].min
    end
  end
  mini.first
end

# p minimum_total([[2], [3, 4], [6, 5, 7], [4, 1, 8, 3]])
# p minimum_total([[-10]])
p minimum_total([[1],[2,3]])
