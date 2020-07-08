# frozen_string_literal: true

# @param {Integer} n
# @return {String[]}
def generate_parenthesis(n)
  res = []
  gen(0, 0, n, '' , res)
  res
end

def gen(left, right, n, str, res)
  res.push(str) and return if left == n && right == n

  gen(left + 1, right, n, str + '(', res) if left < n
  gen(left, right + 1, n, str + ')', res) if right < n && right < left
end
