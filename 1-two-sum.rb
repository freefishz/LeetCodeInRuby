# frozen_string_literal: true

# solution 1.
# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
  nums.each_with_index do |first, i|
    return nil if i == nums.size - 1

    sub_start = i + 1
    sub_end = nums.length - 1

    nums[sub_start..sub_end].each_with_index do |second, j|
      return [i, sub_start + j] if first + second == target
    end
  end
  nil
end

# solution 2. using hash
def two_sum(nums, target)
  scaned = {}
  nums.each_with_index do |first, i|
    second = target - first
    return [scaned[second], i] if scaned.key?(second)
      
    scaned[first] = i
  end
end
