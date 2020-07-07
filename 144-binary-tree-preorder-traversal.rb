# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# solution 1.
# @param {TreeNode} root
# @return {Integer[]}
def preorder_traversal(root)
   res = []
   _preorder(root, res)
   res
end

def _preorder(root, res)
    return unless root
    res.push root.val
    _preorder(root.left, res)
    _preorder(root.right, res)
end

# solution 2
def preorder_traversal(root)
  res = []
  stack = [root]
  while stack.last
    cur = stack.pop
    res.push cur.val

    stack.push cur.right if cur.right
    stack.push cur.left  if cur.left
  end
  
  res
end