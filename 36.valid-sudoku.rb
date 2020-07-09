# frozen_string_literal: true

# @param {Character[][]} board
# @return {Boolean}
def is_valid_sudoku(board)
  rows = Array.new(9) { Set.new }
  cols = Array.new(9) { Set.new }
  blocks = Array.new(3) { Array.new(3) { Set.new } }

  board.each_with_index do |line, row|
    line.each_with_index do |cur, col|
      next if cur == '.'

      return false unless rows[row].add?(cur) &&
                          cols[col].add?(cur) &&
                          blocks[row / 3][col / 3].add?(cur)
    end
  end

  true
end
