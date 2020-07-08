# frozen_string_literal: true

# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# solution 1 BFS
# @param {TreeNode} root
# @return {Integer}
def min_depth(root)
  return 0 unless root

  min = 0
  queue = [root]
  until queue.empty?
    (0...queue.size).each do |_i|
      node = queue.shift

      return min + 1 if node.left.nil? && node.right.nil?

      queue.push(node.left) if node.left
      queue.push(node.right) if node.right
    end
    min += 1
  end
  min
end

# solution 2 DFS
def min_depth(root)
  return 0 unless root

  left  = min_depth(root.left)
  right = min_depth(root.right)

  left == 0 || right == 0 ? left + right + 1 : [left, right].min + 1
end
