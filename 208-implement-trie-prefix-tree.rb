# frozen_string_literal: true

class Trie
  END_OF_WORD = '#'
  #     Initialize your data structure here.
  def initialize
    @root = {}
  end

  #     Inserts a word into the trie.
  #     :type word: String
  #     :rtype: Void
  def insert(word)
    node = @root
    word.each_char do |c|
      node[c] ||= {}
      node = node[c]
    end
    node[END_OF_WORD] = END_OF_WORD
  end

  #     Returns if the word is in the trie.
  #     :type word: String
  #     :rtype: Boolean
  def search(word)
    node = @root
    word.each_char do |c|
      node = node[c]
      return false if node.nil?
    end
    !node[END_OF_WORD].nil?
  end

  #     Returns if there is any word in the trie that starts with the given prefix.
  #     :type prefix: String
  #     :rtype: Boolean
  def starts_with(prefix)
    node = @root
    prefix.each_char do |c|
      node = node[c]
      return false if node.nil?
    end
    true
  end
end

# Your Trie object will be instantiated and called as such:
# obj = Trie.new()
# obj.insert(word)
# param_2 = obj.search(word)
# param_3 = obj.starts_with(prefix)
