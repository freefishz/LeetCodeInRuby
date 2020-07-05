# frozen_string_literal: true

# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer[]}
def max_sliding_window(nums, k)
  return [] if nums.empty?

  window = []
  res = []
  nums.each_with_index do |n, i|
    # When window sliding, 
    # if there are k elements in the window, drop the first one.
    window.shift if (i >= k) && (window[0] <= i - k)

    # The 1st one in the window is always the maximum.
    # When window sliding, elements between maxium and n should be dropped.
    window.pop while !window.empty? && nums[window[-1]] <= n

    # Add the new element to the window.
    window.push(i)

    # Add the maximum to the results after every sliding.
    res.push(nums[window[0]]) if i >= k - 1
  end

  res
end
