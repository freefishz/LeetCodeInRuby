# frozen_string_literal: true

# @param {Integer[]} prices
# @param {Integer} fee
# @return {Integer}
def max_profit(prices, fee)
  return 0 if prices.empty?

  dp_i_0, dp_i_1 = 0, -1.0 / 0.0
  prices.each { |p| dp_i_0, dp_i_1 = [dp_i_0, dp_i_1 + p].max, [dp_i_1, dp_i_0 - p - fee].max }
  dp_i_0
end
