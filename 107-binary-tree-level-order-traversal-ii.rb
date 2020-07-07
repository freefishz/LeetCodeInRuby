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
def level_order_bottom(root)
  return [] unless root
  res = []
  stack = [[root]]

  while !stack.last.empty?
    cur = stack.last
    stack.push []
    cur.each do |node|
      stack.last.push(node.left)  if node&.left
      stack.last.push(node.right) if node&.right
    end

    res.unshift stack.shift.compact.map(&:val) unless stack.first.empty?
  end

  res
end

