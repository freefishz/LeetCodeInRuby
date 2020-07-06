# frozen_string_literal: true

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[][]}
def four_sum(nums, target)
  return [] if nums.nil? || nums.length < 4

  res = []
  n = nums.size
  nums = nums.sort

  (0...n-3).each do |first|
    next if first > 0 && nums[first] == nums[first - 1]

    (first + 1...n-2).each do |second|
      next if second > first + 1 && nums[second] == nums[second - 1]

      third = second + 1
      fourth = n - 1
      while third < fourth
        if third > second + 1 && nums[third] == nums[third - 1]
          third += 1
          next
        elsif fourth < n - 1 && nums[fourth] == nums[fourth + 1]
          fourth -= 1
          next
        end

        total = nums[first] + nums[second] + nums[third] + nums[fourth]
        if total > target
          fourth -= 1
        elsif total < target
          third += 1
        else
          res.push([nums[first], nums[second], nums[third], nums[fourth]])
          third += 1
          fourth -= 1
        end
      end
    end
  end

  res
end



