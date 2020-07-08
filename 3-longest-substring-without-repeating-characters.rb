# frozen_string_literal: true

# @param {String} s
# @return {Integer}

def length_of_longest_substring(s)
  return 0 if s.nil? || s.empty?

  max = 0
  subs = []
  s.each_char do |c|
    c_index = subs.index(c)
    subs.slice!(0..c_index) if c_index
    subs.push(c)
    max = subs.size if subs.size > max
  end
  max
end

p length_of_longest_substring('pwwkew')
