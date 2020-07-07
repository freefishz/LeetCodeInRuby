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
# @return {Integer[]}
def postorder_traversal(root)
  res = []
  _postorder(root, res)
  res
end

def _postorder(root, res)
  return unless root

  _postorder(root.left, res)
  _postorder(root.right, res)
  res.push root.val
end

# solution 2
def postorder_traversal(root)
  res   = []
  stack = [root]
  while !stack.empty?
    cur = stack.pop
    if cur
      stack.push cur
      stack.push nil
      stack.push cur.right if cur.right
      stack.push cur.left  if cur.left
    else
      res.push(stack.last.val) if stack.last
      stack.pop
    end
  end
  res
end
