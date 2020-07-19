# frozen_string_literal: true

# @param {Integer[]} prices
# @return {Integer}
def max_profit(prices)
  return 0 if prices.empty?

  dp_i_0, dp_i_1, dp_pre_0 = 0, -1.0 / 0.0, 0
  prices.each {|p| dp_pre_0, dp_i_0, dp_i_1 = dp_i_0, [dp_i_0, dp_i_1 + p].max, [dp_i_1, dp_pre_0 - p].max}
  dp_i_0
end
