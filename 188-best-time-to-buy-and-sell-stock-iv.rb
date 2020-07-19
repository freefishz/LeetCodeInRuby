# frozen_string_literal: true

# @param {Integer} k
# @param {Integer[]} prices
# @return {Integer}
def max_profit(_k, prices)
  return 0 if prices.empty?
  return _max_profit_infinite(prices) if _k >= prices.size / 2

  min = -1.0 / 0.0
  mp = Array.new(prices.size) { Array.new(_k + 1) { Array.new(2) } }

  (0...prices.size).each do |i|
    if i == 0
      (0.._k).each do |kk|
        mp[0][kk][0] = 0
        mp[0][kk][1] = -prices.first
      end and next
    end

    (0.._k).each do |k|
      if k == 0
        mp[i][0][0] = 0
        mp[i][0][1] = -prices.first
        next
      end

      mp[i][k][0] = [mp[i - 1][k][0], mp[i - 1][k][1] + prices[i]].max
      mp[i][k][1] = [mp[i - 1][k][1], mp[i - 1][k - 1][0] - prices[i]].max
    end
  end

  mp[prices.size - 1][_k][0]
end

def _max_profit_infinite(prices)
  res = 0
  (1...prices.size).each do |i|
    res += prices[i] - prices[i - 1] if prices[i] > prices[i - 1]
  end
  res
end

# p max_profit(2, [2, 4, 1])
# p max_profit(1, [1])
# p max_profit(1, [1,2])
# p max_profit(2, [3,2,6,5,0,3])
p max_profit(4, [1, 2, 4, 2, 5, 7, 2, 4, 9, 0])
