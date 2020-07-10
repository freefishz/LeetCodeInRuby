# frozen_string_literal: true

# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer[]}
def top_k_frequent(nums, k)
  hash = Hash.new { |h, key| h[key] = 0 }
  nums.each { |n| hash[n] += 1 }

  buck = Array.new(nums.size + 1) { Array.new }
  hash.each {|key, value| buck[value].push(key)}

  res = []
  while buck.size > 0  && res.size < k 
    cur = buck.pop
    res += cur unless cur.empty?
  end
  res[0,k]
end

