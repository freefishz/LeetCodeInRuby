# frozen_string_literal: true

# @param {Character[][]} board
# @return {Void} Do not return anything, modify board in-place instead.
def solve_sudoku(board)
  init(board)
  solve(board)
end

def solve(board)
  board.each_with_index do |line, row|
    line.each_with_index do |cur, col|
      next unless cur == '.'

      get_cands(row, col).each do |cand|
        @rows[row].add(cand)
        @cols[col].add(cand)
        @blocks[row / 3][col / 3].add(cand)
        board[row][col] = cand

        return true if solve(board)

        @rows[row].delete(cand)
        @cols[col].delete(cand)
        @blocks[row / 3][col / 3].delete(cand)
        board[row][col] = '.'
      end

      return false
    end
  end
  true
end

def get_cands(row, col)
  res = []
  '123456789'.each_char do |cand|
    res.push(cand) if !@rows[row].include?(cand) &&
                      !@cols[col].include?(cand) &&
                      !@blocks[row / 3][col / 3].include?(cand)
  end
  res
end

def init(board)
  @rows = Array.new(9) { Set.new }
  @cols = Array.new(9) { Set.new }
  @blocks = Array.new(3) { Array.new(3) { Set.new } }

  board.each_with_index do |line, row|
    line.each_with_index do |cur, col|
      next if cur == '.'

      @rows[row].add(cur)
      @cols[col].add(cur)
      @blocks[row / 3][col / 3].add(cur)
    end
  end
end

