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
# @param {Integer} val
# @return {TreeNode}
def search_bst(root, val)
  return nil unless root

  cur = root
  while cur
    return cur if cur.val == val

    cur = if val < cur.val
            cur.left
          else
            cur.right
    end
  end
  nil
end


# solution 2
def search_bst(root, val)
  return root if root.nil? || root.val == val
  val < root.val ? search_bst(root.left, val) : search_bst(root.right, val) 
end