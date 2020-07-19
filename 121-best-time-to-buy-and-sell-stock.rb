# frozen_string_literal: true

@param {Integer[]} prices
@return {Integer}
def max_profit(prices)
  min = prices.first
  res = 0
  (1...prices.size).each do |i|
    min = prices[i] and next if prices[i] <= min

    profit = prices[i] - min
    res = profit if profit > res
  end
  res
end


def max_profit(prices)
  return 0 if prices.empty?

  profit = Array.new(prices.size) {Array.new(2)}
  profit[0][0] = 0
  profit[0][1] = -prices.first
  (1...prices.size).each do |i|
    profit[i][0] = [profit[i-1][0], profit[i-1][1] + prices[i]].max
    profit[i][1] = [profit[i-1][1], -prices[i]].max
  end
  profit[prices.size-1][0]
end


def max_profit(prices)
  return 0 if prices.empty?

  dp_i_0 = 0
  dp_i_1 = -1.0/0.0
  prices.each do |p|
    dp_i_0 = [dp_i_0, dp_i_1 + p].max
    dp_i_1 = [dp_i_1, -p].max
  end
  dp_i_0
end

p max_profit([7,1,5,3,6,4])