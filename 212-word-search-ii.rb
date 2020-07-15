# frozen_string_literal: true

# @param {Character[][]} board
# @param {String[]} words
# @return {String[]}
def find_words(board, words)
  init_trie(words)

  @rows = board.size - 1
  @cols = board.first.size - 1
  @visited = Array.new(@rows + 1) { Array.new(@cols + 1) }
  @res = Set.new
  board.each_with_index do |row, i|
    row.each_with_index do |_col, j|
      @visited = Array.new(@rows + 1) { Array.new(@cols + 1) }
      dfs(board, i, j, @trie, '')
    end
  end
  @res.to_a
end

def init_trie(words)
  @trie = Array.new(27)
  words.each do |word|
    node = @trie
    word.each_char do |c|
      i = c.ord - 'a'.ord
      node[i] ||= Array.new(27)
      node = node[i]
    end
    node[26] = '#'
  end
end

def dfs(board, i, j, trie_node, cur_string)
  @res.add cur_string if trie_node[26] == '#'
  return false if i < 0 || i > @rows || j < 0 || j > @cols
  return false if @visited[i][j]

  cur = board[i][j].ord - 'a'.ord

  return false if trie_node[cur].nil?

  @visited[i][j] = true
  dfs(board, i + 1, j, trie_node[cur], cur_string + board[i][j])
  dfs(board, i - 1, j, trie_node[cur], cur_string + board[i][j])
  dfs(board, i, j + 1, trie_node[cur], cur_string + board[i][j])
  dfs(board, i, j - 1, trie_node[cur], cur_string + board[i][j])

  @visited[i][j] = false
end

# x = [["o","a","a","n"],["e","t","a","e"],["i","h","k","r"],["i","f","l","v"]]
# y = ["oath","pea","eat","rain"]

# x= [['a']]
# y = ['a']

# x = [%w[a b], %w[c d]]
# y = %w[ab cb ad bd ac ca da bc db adcb dabc abb acb]

x = [["a","b"],["a","a"]]
y = ["aba","baa","bab","aaab","aaa","aaaa","aaba"]

p find_words(x, y)
