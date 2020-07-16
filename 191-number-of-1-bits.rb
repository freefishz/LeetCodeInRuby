# frozen_string_literal: true

# solution 1
# @param {Integer} n, a positive integer
# @return {Integer}
def hamming_weight(n)
  res = 0
  while n != 0
    res += 1
    n &= (n - 1)
  end
  res
end

# solution 2
def hamming_weight(n)
  res = 0
  while n != 0
    res += 1 if n & 1 == 1
    n = n >> 1
  end
  res
end
