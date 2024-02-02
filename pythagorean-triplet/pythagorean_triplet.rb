module PythagoreanTriplet
  def self.triplets_with_sum(sum)
    result = []
    (1..sum/3).each do |n|
      (n+1..sum/2).each do |m|
        k = sum-n-m
        if k*k == (n*n + m*m)
          result << [n, m, k]
        end
      end
    end
    result
  end
end