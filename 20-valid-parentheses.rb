# frozen_string_literal: true

# @param {String} s
# @return {Boolean}
def is_valid(s)
  stack = []
  rules = { ')' => '(', ']' => '[', '}' => '{' }

  s.each_char do |c|
    if rules.key?(c)
      return false if stack.pop != rules[c]
    else
      stack.push c
    end
  end
  stack.empty?
end
