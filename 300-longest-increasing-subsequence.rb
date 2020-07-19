# frozen_string_literal: true

# @param {Integer[]} nums
# @return {Integer}
def length_of_lis(nums)
  return 0 if nums.empty?

  dp = Array.new(nums.size, 1)
  1.upto(nums.size - 1).each do |i|
    0.upto(i - 1).each { |j| dp[i] = [dp[i], dp[j] + 1].max if nums[i] > nums[j] }
  end
  dp.max
end

p length_of_lis([1,3,6,7,9,4,10,5,6])
# p length_of_lis([0])
