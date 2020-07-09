# frozen_string_literal: true

# # frozen_string_literal: true

# # solution 1
# # @param {Integer[]} nums1
# # @param {Integer[]} nums2
# # @return {Float}
def find_median_sorted_arrays(nums1, nums2)
  n1 = nums1.size
  n2 = nums2.size
  n = n1 + n2

  left = right = nil
  first = second = 0
  (0..n / 2).each do |_i|
    left = right
    if first < n1 && nums1[first] < nums2[second]
      right = nums1[first]
      first += 1
    else
      right = nums2[second]
      second += 1
    end
  end

  n.odd? ? right : (left + right) / 2.0
end

# # solution 2
def find_median_sorted_arrays(nums1, nums2)
  nums = (nums1 + nums2).sort
  mid = nums.size / 2.0
  return nums[mid] if nums.size.odd?

  (nums[mid] + nums[mid - 1]) / 2.0
end

# solution 3
def find_median_sorted_arrays(nums1, nums2)
  n1 = nums1.size
  n2 = nums2.size
  left = (n1 + n2 + 1) / 2
  right = (n1 + n2 + 2) / 2

  (get_kth(nums1, nums2, left) + get_kth(nums1, nums2, right)) * 0.5
end

def get_kth(nums1, nums2, k)
  n1 = nums1.size
  n2 = nums2.size
  return get_kth(nums2, nums1, k) if n1 > n2

  return nums2[k - 1] if n1 == 0
  return [nums1.first, nums2.first].min if k == 1

  first = [n1, k / 2].min - 1
  second = [n2, k / 2].min - 1

  return get_kth(nums1, nums2[second + 1...n2], k - (second + 1)) if nums1[first] > nums2[second]

  get_kth(nums1[first + 1...n1], nums2, k - (first + 1))
end
