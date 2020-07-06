# frozen_string_literal: true

# solution 1. O(N^2)
# @param {Integer[]} nums
# @return {Integer[][]}
def three_sum(nums)
  res = []
  nums = nums.sort
  nums.each_with_index do |_, first|
    break if first == nums.size - 2
    next if first > 0 && nums[first] == nums[first - 1]

    second = first + 1
    third = nums.size - 1
    while second < third
      if second > first + 1 && nums[second] == nums[second - 1]
        second += 1
        next
      elsif third < nums.size - 1 && nums[third] == nums[third + 1]
        third -= 1
        next
      end

      total = nums[first] + nums[second] + nums[third]
      if total > 0
        third -= 1
      elsif total < 0
        second += 1
      else
        res.push([nums[first], nums[second], nums[third]])
        second += 1
        third -= 1
      end
    end
  end
  res
end
