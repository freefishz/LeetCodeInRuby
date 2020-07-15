# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def search_insert(nums, target)
  left, right = 0, nums.size - 1

  res = nil
  while left <= right
    mid = (right + left) / 2
    return mid if nums[mid] == target
    if nums[mid] > target
      right = mid - 1
    else
      left = mid + 1
    end
  end
  return left
end