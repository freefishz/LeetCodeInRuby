# @param {Integer[][]} points
# @param {Integer} k
# @return {Integer[][]}
def k_closest(points, k)
  hash = Hash.new {|h, k| h[k] = Array.new }
  points.each do |point|
    distance = point[0]*point[0] + point[1]*point[1]
    hash[distance].push(point)
  end

  res = []
  hash.keys.sort.each do |key|
    res += hash[key]
    break if res.size >= k
  end
  res[0, k]
end