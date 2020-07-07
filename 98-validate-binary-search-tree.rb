# frozen_string_literal: true

# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# solution 1
# @param {TreeNode} root
# @return {Boolean}
def is_valid_bst(root)
  inorder = _inorder(root)
  inorder == inorder.uniq.sort
end

def _inorder(root)
  return [] unless root

  _inorder(root.left) + [root.val] + _inorder(root.right)
end

# solution 2
def is_valid_bst(root)
  return true unless root

  stack = []
  cur = root
  prev = -1.0 / 0.0
  while cur || !stack.empty?
    while cur
      stack.push cur
      cur = cur.left
    end

    cur = stack.pop
    return false if cur.val <= prev

    prev = cur.val
    cur = cur.right
  end
  true
end

# solution 3
def is_valid_bst(root)
  _is_valid root, nil, nil
end

def _is_valid(root, min, max)
  return true unless root
  return false if min && root.val <= min
  return false if max && root.val >= max

  _is_valid(root.left, min, root.val) &&
    _is_valid(root.right, root.val, max)
end
