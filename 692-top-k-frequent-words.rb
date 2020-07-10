# @param {String[]} words
# @param {Integer} k
# @return {String[]}
def top_k_frequent(words, k)
  hash = Hash.new {|h, key| h[key] = 0}
  words.each {|w| hash[w] += 1}

  buck = Array.new(words.size + 1) {Array.new}
  hash.each {|key, value| buck[value].push(key)}

  res = []
  while buck.size > 0 && res.size < k
    cur = buck.pop
    res += cur.sort unless cur.empty?
  end

  res[0, k]
end

p top_k_frequent(["i", "love", "leetcode", "i", "love", "coding"], 2)