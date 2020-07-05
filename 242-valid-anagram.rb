# frozen_string_literal: true

# solution 1
# @param {String} s
# @param {String} t
# @return {Boolean}
def is_anagram(s, t)
  s.chars.sort == t.chars.sort
end

# solution 2
def is_anagram(s, t)
  return false if s.size != t.size

  s_hash = Hash.new { |hash, key| hash[key] = 0 }
  t_hash = Hash.new { |hash, key| hash[key] = 0 }

  s.each_char { |c| s_hash[c] += 1 }
  t.each_char { |c| t_hash[c] += 1 }

  s_hash == t_hash
end

# solution 3
# using ASCII as count
def is_anagram(s, t)
  return false if s.size != t.size

  s_dic = Array.new(26, 0)
  t_dic = Array.new(26, 0)

  a_ord = 'a'.ord
  s.each_char { |c| s_dic[c.ord - a_ord] += 1 }
  t.each_char { |c| t_dic[c.ord - a_ord] += 1 }

  s_dic == t_dic
end
