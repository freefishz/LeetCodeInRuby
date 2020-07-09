# frozen_string_literal: true

# solution 1
# @param {Integer[]} heights
# @return {Integer}
def height_checker(heights)
  return 0 if heights.empty? || heights.size == 1

  res = 0
  sorted = heights.sort

  (0...heights.size).each do |i|
    res += 1 if heights[i] != sorted[i]
  end
  res
end

# solution 2
# @param {Integer[]} heights
# @return {Integer}
def height_checker(heights)
  return 0 if heights.empty? || heights.size == 1

  bucks = Array.new(101, 0)
  heights.each { |h| bucks[h] += 1 }

  res = 0
  hi = 0
  (1...101).each do |bi|
    next if bucks[bi] == 0
    break if hi == heights.size

    while bucks[bi] > 0
      res += 1 unless heights[hi] == bi
      hi += 1
      bucks[bi] -= 1
    end
  end

  res
end

