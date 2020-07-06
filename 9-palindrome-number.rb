# @param {Integer} x
# @return {Boolean}
# solution 1. using stack
def is_palindrome(x)
  _x = x.to_s.chars
  _n = _x.size / 2
  stack = []
  
  _x.each_with_index do |c, i|
    if i < _n
      stack.push(c) 
    elsif i > _n
      return false if c != stack.pop
    else
      next if _x.size.odd?
      return false if c != stack.pop
    end
  end

  true
end

# solution 2. reverse
def is_palindrome(x)
  return false if x < 0 || (x % 10 == 0 && x != 0)

  rev = 0
  while x > rev
    rev = rev * 10 + x % 10
    x /= 10
  end
  x == rev || x == rev / 10
end

