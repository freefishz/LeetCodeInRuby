# frozen_string_literal: true

# solution 1.
# @param {Float} x
# @param {Integer} n
# @return {Float}
def my_pow(x, n)
  return 1 if n == 0

  return 1 / my_pow(x, -n) if n < 0

  return x * my_pow(x * x, (n - 1) / 2) if n.odd?

  my_pow(x * x, n / 2)
end

# solution 2
def my_pow(x, n)
  if n < 0
    x = 1 / x
    n = -n
  end

  pow = 1
  while n > 0
    pow *= x if n.odd?
    x *= x
    n >>= 1
  end
  pow
end

puts my_pow(2, 10)