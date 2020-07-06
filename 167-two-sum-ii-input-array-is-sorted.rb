# frozen_string_literal: true

# @param {Integer[]} numbers
# @param {Integer} target
# @return {Integer[]}
def two_sum(numbers, target)
  head = 0
  tail = numbers.size - 1

  while head != tail
    total = numbers[head] + numbers[tail]
    if total > target
      tail -= 1
    elsif total < target
      head += 1
    else
      return [head + 1, tail + 1]
    end
  end
  nil
end
