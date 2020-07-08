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

