# frozen_string_literal: true

# solution 1
# @param {Integer[]} nums
# @return {Integer}
def majority_element(nums)
  hash = Hash.new { |hash, key| hash[key] = 0 }
  nums.each do |n|
    hash[n] += 1
    return n if hash[n] > nums.size / 2
  end
  nil
end

# solution 2
def majority_element(nums)
  nums = nums.sort

  count = 0 
  count_target = nums.first
  nums.each do |n|
    if count_target == n
      count += 1
      return n if count > nums.size / 2
    else
      count = 1 
      count_target = n
    end 
  end
  nil
end

# solution 3
def majority_element(nums)
  majority nums, 0, nums.size-1
end

def majority(nums, lo, hi)
  return nums[lo] if lo == hi

  mid = (hi - lo) / 2 + lo
  left = majority(nums, lo, mid)
  right = majority(nums, mid+1, hi)

  return left if left == right

  
  left_count = nums[lo..mid].count(left)
  right_count = nums[mid+1..hi].count(right)

  left_count > right_count ? left : right
end

# solution 4
def majority_element(nums)
  h = nums.group_by(&:itself)
  h.keys.find{|k| h[k].length > ((nums.length)/2)}
end

# solution 5
def majority_element(nums)
  nums.sort[nums.length / 2]
end