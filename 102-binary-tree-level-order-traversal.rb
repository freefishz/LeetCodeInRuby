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
# @return {Integer[][]}
def level_order(root)
  return [] unless root

  res = []
  queue = [[root]]
  while !queue.empty? 
    nodes = queue.shift

    res.push []
    cur = []
    nodes.each do |node|
      res.last.push node.val
      cur.push(node.left) if node.left
      cur.push(node.right) if node.right
    end
    queue.push(cur) if !cur.empty? 
  end
  res
end

# solution 2
def level_order(root)
  return [] unless root

  res = []
  queue = [root]
  while !queue.empty? 
    n = queue.size
    tmp = []
    (0...n).each do |i|
      node = queue.shift
      tmp.push node.val
      queue.push(node.left) if node.left
      queue.push(node.right) if node.right
    end
    res.push tmp
  end
  res
end

# solution 3 - DFS
def level_order(root)
  return [] unless root
  res = []
  stack = []

  dfs(root, 0, res)
  res
end

def dfs(node, level, res)
  return unless node

  res[level] ||= []
  res[level].push node.val

  dfs(node.left, level + 1, res)
  dfs(node.right, level + 1, res)
end
