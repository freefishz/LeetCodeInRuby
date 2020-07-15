# frozen_string_literal: true

# @param {Character[][]} board
# @param {String} word
# @return {Boolean}
def exist(board, word)
  @rows = board.size - 1
  @cols = board.first.size - 1
  @visited = Array.new(@rows + 1) { Array.new(@cols + 1) }
  board.each_with_index do |row, i|
    row.each_with_index do |col, j|
      return true if dfs(board, i, j, word, 0)
    end
  end
  false
end

def dfs(board, i, j, word, cur)
  return false if i < 0 || i > @rows || j < 0 || j > @cols
  return false if @visited[i][j]
  return false unless board[i][j] == word[cur]
  return true if cur == word.size - 1

  @visited[i][j] = true
  return true if dfs(board, i + 1, j, word, cur + 1) ||
                 dfs(board, i - 1, j, word, cur + 1) ||
                 dfs(board, i, j + 1, word, cur + 1) ||
                 dfs(board, i, j - 1, word, cur + 1)

  @visited[i][j] = false
end

input = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]]
p exist(input, 'ABCCED')