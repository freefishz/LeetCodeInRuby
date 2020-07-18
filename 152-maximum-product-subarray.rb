# frozen_string_literal: true

# @param {Integer[]} nums
# @return {Integer}
def max_product(nums)
  pre_max = nums.first
  pre_min = nums.first
  res = nums.first
  (1...nums.size).each do |i|
    tmp = [pre_max * nums[i], pre_min * nums[i], nums[i]]
    pre_max = tmp.max
    pre_min = tmp.min

    res = pre_max if pre_max > res
  end
  res
end


p max_product([2,3,-2,4])