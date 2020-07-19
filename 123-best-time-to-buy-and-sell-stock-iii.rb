# @param {Integer[]} prices
# @return {Integer}
def max_profit(prices)
  return 0 if prices.empty?

  profit = Array.new(prices.size) {Array.new(3) {Array.new(2)}}
  profit[0][1][0], profit[0][1][1] = 0, -prices.first
  profit[0][2][0], profit[0][2][1] = 0, -prices.first

  (1...prices.size).each do |i|
    profit[i][2][0] = [profit[i-1][2][0], profit[i-1][2][1] + prices[i]].max 
    profit[i][2][1] = [profit[i-1][2][1], profit[i-1][1][0] - prices[i]].max 

    profit[i][1][0] = [profit[i-1][1][0], profit[i-1][1][1] + prices[i]].max 
    profit[i][1][1] = [profit[i-1][1][1], - prices[i]].max 
  end

  profit[prices.size-1][2][0]
end

# def max_profit(prices)
#   return 0 if prices.empty?

#   min = -1.0/0.0
#   dp_i_1_0, dp_i_1_1 = 0, min
#   dp_i_2_0, dp_i_2_1 = 0, min
#   prices.each do |p|
#     dp_i_2_0 = [dp_i_2_0, dp_i_2_1 + p].max
#     dp_i_2_1 = [dp_i_2_1, dp_i_1_0 - p].max
#     dp_i_1_0 = [dp_i_1_0, dp_i_1_1 + p].max
#     dp_i_1_1 = [dp_i_1_1, - p].max
#   end
#   [dp_i_1_0, dp_i_2_0].max
# end

p max_profit([3,3,5,0,0,3,1,4])
# p max_profit([1,2,3,4,5])
