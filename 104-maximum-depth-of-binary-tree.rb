# frozen_string_literal: true

# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# solution 1 - BFS
# @param {TreeNode} root
# @return {Integer}
def max_depth(root)
  return 0 unless root

  max = 0
  queue = [root]
  while !queue.empty?
    (0...queue.size).each do |i|
      node = queue.shift

      queue.push(node.left) if node.left
      queue.push(node.right) if node.right
    end
    max += 1
  end
  max
end

# solution 2 - DFS
def max_depth(root)
  return 0 unless root

  left  = max_depth(root.left) 
  right = max_depth(root.right) 
  [left, right].max + 1
end

