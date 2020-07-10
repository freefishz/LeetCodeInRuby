# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {TreeNode}
def bst_to_gst(root)
  @cur = 0 
  post_order(root)
  root
end

def post_order(root)
  return unless root

  post_order(root.right)
  root.val += @cur
  @cur = root.val
  post_order(root.left)
end