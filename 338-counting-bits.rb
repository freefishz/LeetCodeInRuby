# frozen_string_literal: true

# @param {Integer} num
# @return {Integer[]}
def count_bits(num)
  res = Array.new(num + 1, 0)
  (1..num).each do |i|
    res[i] = res[i & (i - 1)] + 1
  end
  res
end
