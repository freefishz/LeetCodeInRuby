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
# @return {Boolean}
def is_symmetric(root)
  validate(root, root)
end

def validate(left, right)
  return true  if left.nil? && right.nil?
  return false if left.nil? || right.nil?

  left.val == right.val &&
    validate(left.left, right.right) &&
    validate(left.right, right.left)
end
