# frozen_string_literal: true

# @param {Integer[]} prices
# @return {Integer}
def max_profit(prices)
  res = 0
  (1...prices.size).each do |i|
    res += prices[i] - prices[i - 1] if prices[i] > prices[i - 1]
  end
  res
end

def max_profit(prices)
  return 0 if prices.empty?

  dp_i_0 = 0
  dp_i_1 = -1.0/0.0
  prices.each do |p|
    dp_i_0, dp_i_1 = [dp_i_0, dp_i_1 + p].max, [dp_i_1, dp_i_0 - p].max
  end
  dp_i_0
end