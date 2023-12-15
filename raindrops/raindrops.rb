class Raindrops
  def self.convert(count)
    sounds = ["Pling", "Plang", "Plong"]
    result = ""
    [count % 3, count % 5, count % 7].each.with_index do |factor, idx|
      if factor == 0
        result += sounds[idx]
      end
    end
    if result.length == 0
      result = count.to_s
    end
    result
  end
end