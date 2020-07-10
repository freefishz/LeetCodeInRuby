# frozen_string_literal: true

# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {Integer[][]}
def zigzag_level_order(root)
  return [] unless root

  res = []
  queue = [root]
  until queue.empty?
    tmp = []
    queue.size.times do
      node = queue.shift
      tmp.push node.val
      queue.push(node.left) if node.left
      queue.push(node.right) if node.right
    end
    res.push tmp
  end

  (0..res.size - 1).each do |i|
    res[i].reverse! if i.odd?
  end
  res
end

# DFS
def zigzag_level_order(root)
  return [] unless root
  
  res = []
  dfs(root, 0, res)
  res
end

def dfs(node, level, res)
  return unless node

  res[level] ||= []
  if level.odd?
    res[level].unshift node.val 
  else
    res[level].push node.val 
  end
  dfs(node.left, level + 1, res)
  dfs(node.right, level + 1, res)
end

