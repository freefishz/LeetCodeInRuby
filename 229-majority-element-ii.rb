# solution 1
# @param {Integer[]} nums
# @return {Integer[]}
def majority_element(nums)
  return nums.uniq if nums.size < 3

  res = []
  nums = nums.sort

  mod = nums.size % 3
  div = nums.size / 3

  fi = mod < 2 ? div - 1 : div
  sc = 2 * fi  + 1

  res.push(nums[fi]) if nums.count(nums[fi]) > nums.size / 3
  res.push(nums[sc]) if nums.count(nums[sc]) > nums.size / 3

  res.uniq
end

# solution 2
def majority_element(nums)
  return [] if nums.empty?

  can1 = [nums.first]
  cnt1 = 0
  can2 = [nums.first]
  cnt2 = 0

  nums.each do |n|
    if can1 == n
      cnt1 += 1
      next
    end

    if can2 == n
      cnt2 += 1
      next
    end

    if cnt1 == 0
      can1 = n
      cnt1 += 1
      next
    end

    if cnt2 == 0
      can2 = n
      cnt2 += 1
      next
    end

    cnt1 -= 1
    cnt2 -= 1
  end

  res.push(can1) if nums.count(can1) > nums.size / 3
  res.push(can2) if nums.count(can2) > nums.size / 3

  res
end
