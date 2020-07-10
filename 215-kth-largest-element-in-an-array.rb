# frozen_string_literal: true

# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def find_kth_largest(nums, k)
  nums.sort[-k]
end

# -------------- solution 2
def find_kth_largest(nums, k)
  len = nums.size
  left = 0
  right = nums.size - 1

  target = len - k
  while cur = partition(nums, left, right)
    return nums[cur] if cur == target

    if cur < target
      left = cur + 1
    else
      right = cur - 1
    end
  end
end

def partition(nums, left, right)
  pivot = nums[left]
  cur = left
  (left + 1).upto(right).each do |i|
    if nums[i] < pivot
      cur += 1
      nums[cur], nums[i] = nums[i], nums[cur]
    end
  end
  nums[left], nums[cur] = nums[cur], nums[left]
  cur
end

p find_kth_largest([3, 2, 1, 5, 6, 4], 2)
