# @param {Integer} x
# @return {Integer}
def my_sqrt(x)
  return x if x == 0 || x == 1

  left, right, res = 1, x, nil
  while left <= right
    m = (left + right) / 2
    return m if (m == x / m) 

    if m > x / m
      right = m -1
    else
      left = m + 1
      res = m
    end
  end
  res
end