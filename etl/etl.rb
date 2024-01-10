module ETL
  def self.transform(old)
    old.reduce({}) do |result, (k, v)|
      v.each {|char| result[char.downcase] = k}
      result
    end
  end
end